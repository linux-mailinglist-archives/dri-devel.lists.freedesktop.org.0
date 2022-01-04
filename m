Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8FAF48470B
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jan 2022 18:36:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3465C899B3;
	Tue,  4 Jan 2022 17:36:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2342893EB;
 Tue,  4 Jan 2022 17:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641317808; x=1672853808;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WsakHE0nTQOafH8dnbT4yWnV25q0ZmHKN4d2z5SD3Xg=;
 b=nbVWXVbHdxsnI7fTmqjjdQuXockDWYYgLnZyyly+SDHDEvLUD1HJ+3Ai
 JB/B8nYGKrFm499l4IMo7QvkDJPaqYR2WW3SFmtUgKCpEJZ/DDWYsPTiJ
 n3g4COdfP3XnuMVY+5jn2hW+CRzce176hd6RIaj3w/EGZctJx48E202qG
 RtiII9UCULTB3ondCUyPLz2o2/3qPF9bsL/nwSqDiYlYNHbGyrEnsTupL
 lAZljnkMwutzqT1T4WCSLaiENtV9RMssThHJw7TtK7xodZh+EGe1RzKoH
 rAbxRClnjAc4wtQipfQV6R8U6ySprd1o/lRMP9P+FLo03G9T0cTjRfKQs Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10216"; a="229582068"
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="229582068"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 09:36:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,261,1635231600"; d="scan'208";a="762887310"
Received: from jons-linux-dev-box.fm.intel.com ([10.1.27.20])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2022 09:36:47 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915: Check return intel_context_timeline_lock of in
 eb_pin_timeline
Date: Tue,  4 Jan 2022 09:31:00 -0800
Message-Id: <20220104173100.32342-1-matthew.brost@intel.com>
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

intel_context_timeline_lock can return can error if interrupted by a
user when trying to lock the timeline mutex. Check the return value of
intel_context_timeline_lock in eb_pin_timeline (execbuf IOCTL).

Fixes: 544460c33821 ("drm/i915: Multi-BB execbuf")
Signed-off-by: Matthew Brost <matthew.brost@intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
index e9541244027a..65a078945b00 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
@@ -2517,6 +2517,9 @@ static int eb_pin_timeline(struct i915_execbuffer *eb, struct intel_context *ce,
 			i915_request_put(rq);
 
 			tl = intel_context_timeline_lock(ce);
+			if (IS_ERR(tl))
+				return PTR_ERR(tl);
+
 			intel_context_exit(ce);
 			intel_context_timeline_unlock(tl);
 
-- 
2.34.1

