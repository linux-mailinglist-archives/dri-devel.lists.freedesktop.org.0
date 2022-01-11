Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6264B48B283
	for <lists+dri-devel@lfdr.de>; Tue, 11 Jan 2022 17:45:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7818310E60C;
	Tue, 11 Jan 2022 16:45:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FE5D10E260;
 Tue, 11 Jan 2022 16:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641919528; x=1673455528;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=BjNI8kDNZBsu/RicuZJt0DwlQ5FdSW0NYqcSzX11JbI=;
 b=Xsd4CgwFofgpMZao1lpMjt/wXaKzPkc75HJ6G7VHd7R/rcVazEYAEPZ+
 B9e9Y22gvSOo+rxxqKRKvpJ/JFbX5QG9x7Yh6kNBefcO68XKx5Q0dLm3L
 zcN/PWaqyCcb5B6rYiSf39L8Z+OZDaPAvEuIHdP8IwqXVmvtCdayIG+73
 NfHsbjZeFzgVw9syVSL/xrkXCFZycKGQH5uk9z+OrnaPTz7CShLfezpET
 BShvZui4IB5xNkji6VIBiswcUdGovkUtORYRs7SmBqmBLeB216ziGPcpA
 wwAvjOC4Oyz4aI/im0zk0SIbBC6ipY7fRK8QSJUE2HYJOdte9Qh/cx8vf w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="243733462"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="243733462"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 08:45:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; d="scan'208";a="528807684"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2022 08:45:27 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915: Lock timeline mutex directly in error path of
 eb_pin_timeline
Date: Tue, 11 Jan 2022 08:39:29 -0800
Message-Id: <20220111163929.14017-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 tvrtko.ursulin@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't use the interruptable version of the timeline mutex lock in the
error path of eb_pin_timeline as the cleanup must always happen.

v2:
 (John Harrison)
  - Don't check for interrupt during mutex lock
v3:
 (Tvrtko)
  - A comment explaining why lock helper isn't used

Fixes: 544460c33821 ("drm/i915: Multi-BB execbuf")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index 9e221ce427075..4a611d62e991a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2518,9 +2518,14 @@ static int eb_pin_timeline(struct i915_execbuffer *eb, struct intel_context *ce,
 				      timeout) < 0) {
 			i915_request_put(rq);
 
-			tl = intel_context_timeline_lock(ce);
+			/*
+			 * Error path, cannot use intel_context_timeline_lock as
+			 * that is user interruptable and this clean up step
+			 * must be done.
+			 */
+			mutex_lock(&ce->timeline->mutex);
 			intel_context_exit(ce);
-			intel_context_timeline_unlock(tl);
+			mutex_unlock(&ce->timeline->mutex);
 
 			if (nonblock)
 				return -EWOULDBLOCK;
-- 
2.34.1

