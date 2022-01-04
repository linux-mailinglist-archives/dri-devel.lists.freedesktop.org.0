Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89B52484B3B
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jan 2022 00:36:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A367510E32B;
	Tue,  4 Jan 2022 23:36:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9091510E30E;
 Tue,  4 Jan 2022 23:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641339403; x=1672875403;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SdXGnSeGw2htKTYCh4qjNfup3cJxHVU8hCrJnJLd0WY=;
 b=RGFx137OyC5lEktuuQ72jz856yHu6q0WVCsNUs2/raZQFLah1sITjLSa
 753a2F4KfFQdCOyNU9gmFa++IifUmgkjSRuH1CdVGXDk4na5OW1uswTLy
 TrubEXxVYdi2CtyrOSH1+Ete46KRimRYDiGcsvF6BjUaKy/2qMyg9OnVW
 z4zjMCeAS1o4wnCp38MnJMLtjvt4KKd0S8Op9fo27nwf4AdaoDUg3em5K
 dPM6wQ79TmY5FYw9gNHEWac4G0RrGgRciG/cagn5C2WkOK7jojpmJh9+p
 QerhwUyYFxuGeU32DAEfG8N8Pu6ocAbDnFFm2PrHoTsbn5ItVrq26/NBK g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="242123835"
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="242123835"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 15:36:43 -0800
X-IronPort-AV: E=Sophos;i="5.88,262,1635231600"; d="scan'208";a="762974690"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 15:36:42 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915: Lock timeline mutex directly in error path of
 eb_pin_timeline
Date: Tue,  4 Jan 2022 15:30:56 -0800
Message-Id: <20220104233056.11245-1-matthew.brost@intel.com>
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Don't use the interruptable version of the timeline mutex lock in the
error path of eb_pin_timeline as the cleanup must always happen.

v2:
 (John Harrison)
  - Don't check for interrupt during mutex lock

Fixes: 544460c33821 ("drm/i915: Multi-BB execbuf")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index e9541244027a..e96e133cbb1f 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2516,9 +2516,9 @@ static int eb_pin_timeline(struct i915_execbuffer *eb, struct intel_context *ce,
 				      timeout) < 0) {
 			i915_request_put(rq);
 
-			tl = intel_context_timeline_lock(ce);
+			mutex_lock(&ce->timeline->mutex);
 			intel_context_exit(ce);
-			intel_context_timeline_unlock(tl);
+			mutex_unlock(&ce->timeline->mutex);
 
 			if (nonblock)
 				return -EWOULDBLOCK;
-- 
2.34.1

