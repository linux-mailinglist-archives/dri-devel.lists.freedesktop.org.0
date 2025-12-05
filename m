Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BD2BCA7655
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 12:29:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FD6710EAF3;
	Fri,  5 Dec 2025 11:29:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mGReL76d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D66D10EAF5;
 Fri,  5 Dec 2025 11:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764934163; x=1796470163;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vR58gdsENqj2YjmZuSDW6UTtWw1d/Q/+9WkXDUO0Gm4=;
 b=mGReL76dkVrE3IWglFqonfH451jYg0DzI62DtE1e0B6BmCcVdhTEdAlF
 qzr5lya8JLvfNPZnNlX31+qZdonbDtTgj2k/d4sZ/RPOkQ2SQnGwuK9vE
 sPd8/CHMncldTsT9vnfezU/4FtmSAUHvs/4sVxkaPScyMtPIb6/p/xB2P
 ftfCHkSs8z4qLb1rUsYtdzNhCIAL0NblS32XPqeT1I/U51QyB0x6zw9Pd
 tH6jPyW0JWpK1RaDr9VHxYUnnr4TQN3+BZlIv45nzFHbc5jrAnUr24k5k
 AoIWRiOSb6KaIiTbHDYbHuBe+C1cFIlb7Ji7ooUE83vaTIZ+wLTyaPenW A==;
X-CSE-ConnectionGUID: 10SXPmg1QO2KJrmLnDyrCg==
X-CSE-MsgGUID: NA++hpARTGuIZHJcXxonFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78431625"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="78431625"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:29:23 -0800
X-CSE-ConnectionGUID: WpQpRfNxQD+AqVqq7H2BxQ==
X-CSE-MsgGUID: tvUNDH/cTnObHfPS/82fig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; d="scan'208";a="195097616"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.65])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2025 03:29:21 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: tzimmermann@suse.de, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, jani.nikula@intel.com
Subject: [PATCH v3 18/25] drm/vblank: merge drm_vblank_restore() into
 drm_crtc_vblank_restore()
Date: Fri,  5 Dec 2025 13:27:34 +0200
Message-ID: <719efba0288a91d7c9e815c87bd67b9960d9b192.1764933891.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1764933891.git.jani.nikula@intel.com>
References: <cover.1764933891.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The extra function serves no useful purpose.

This allows us to drop another superfluous pipe check warning.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 57 +++++++++++++++---------------------
 1 file changed, 23 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index e4c8af7fb5db..ad44fea4ff67 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1527,23 +1527,41 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
 }
 EXPORT_SYMBOL(drm_crtc_vblank_on);
 
-static void drm_vblank_restore(struct drm_device *dev, unsigned int pipe)
+/**
+ * drm_crtc_vblank_restore - estimate missed vblanks and update vblank count.
+ * @crtc: CRTC in question
+ *
+ * Power manamement features can cause frame counter resets between vblank
+ * disable and enable. Drivers can use this function in their
+ * &drm_crtc_funcs.enable_vblank implementation to estimate missed vblanks since
+ * the last &drm_crtc_funcs.disable_vblank using timestamps and update the
+ * vblank counter.
+ *
+ * Note that drivers must have race-free high-precision timestamping support,
+ * i.e.  &drm_crtc_funcs.get_vblank_timestamp must be hooked up and
+ * &drm_vblank_crtc_config.disable_immediate must be set to indicate the
+ * time-stamping functions are race-free against vblank hardware counter
+ * increments.
+ */
+void drm_crtc_vblank_restore(struct drm_crtc *crtc)
 {
+	struct drm_device *dev = crtc->dev;
+	unsigned int pipe = drm_crtc_index(crtc);
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 	ktime_t t_vblank;
-	struct drm_vblank_crtc *vblank;
 	int framedur_ns;
 	u64 diff_ns;
 	u32 cur_vblank, diff = 1;
 	int count = DRM_TIMESTAMP_MAXRETRIES;
 	u32 max_vblank_count = drm_max_vblank_count(dev, pipe);
 
-	if (drm_WARN_ON(dev, pipe >= dev->num_crtcs))
-		return;
+	drm_WARN_ON_ONCE(dev, !crtc->funcs->get_vblank_timestamp);
+	drm_WARN_ON_ONCE(dev, vblank->inmodeset);
+	drm_WARN_ON_ONCE(dev, !vblank->config.disable_immediate);
 
 	assert_spin_locked(&dev->vbl_lock);
 	assert_spin_locked(&dev->vblank_time_lock);
 
-	vblank = drm_vblank_crtc(dev, pipe);
 	drm_WARN_ONCE(dev,
 		      drm_debug_enabled(DRM_UT_VBL) && !vblank->framedur_ns,
 		      "Cannot compute missed vblanks without frame duration\n");
@@ -1564,35 +1582,6 @@ static void drm_vblank_restore(struct drm_device *dev, unsigned int pipe)
 		    diff, diff_ns, framedur_ns, cur_vblank - vblank->last);
 	vblank->last = (cur_vblank - diff) & max_vblank_count;
 }
-
-/**
- * drm_crtc_vblank_restore - estimate missed vblanks and update vblank count.
- * @crtc: CRTC in question
- *
- * Power manamement features can cause frame counter resets between vblank
- * disable and enable. Drivers can use this function in their
- * &drm_crtc_funcs.enable_vblank implementation to estimate missed vblanks since
- * the last &drm_crtc_funcs.disable_vblank using timestamps and update the
- * vblank counter.
- *
- * Note that drivers must have race-free high-precision timestamping support,
- * i.e.  &drm_crtc_funcs.get_vblank_timestamp must be hooked up and
- * &drm_vblank_crtc_config.disable_immediate must be set to indicate the
- * time-stamping functions are race-free against vblank hardware counter
- * increments.
- */
-void drm_crtc_vblank_restore(struct drm_crtc *crtc)
-{
-	struct drm_device *dev = crtc->dev;
-	unsigned int pipe = drm_crtc_index(crtc);
-	struct drm_vblank_crtc *vblank = drm_vblank_crtc(dev, pipe);
-
-	drm_WARN_ON_ONCE(dev, !crtc->funcs->get_vblank_timestamp);
-	drm_WARN_ON_ONCE(dev, vblank->inmodeset);
-	drm_WARN_ON_ONCE(dev, !vblank->config.disable_immediate);
-
-	drm_vblank_restore(dev, pipe);
-}
 EXPORT_SYMBOL(drm_crtc_vblank_restore);
 
 static int drm_vblank_crtc_queue_event(struct drm_vblank_crtc *vblank,
-- 
2.47.3

