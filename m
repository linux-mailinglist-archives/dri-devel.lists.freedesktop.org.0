Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38BD4C47E0A
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:19:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D4CC10E465;
	Mon, 10 Nov 2025 16:19:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YdHGDLSc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F60D10E465;
 Mon, 10 Nov 2025 16:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791556; x=1794327556;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=7IGybDEUzJMovn1n1dylTEbTXcT581hg6UtuQ5mMnr8=;
 b=YdHGDLScqqu44U/uzjv6WvAsxS2Kh73GIgyvhnhZGGPYGupmXHGTX+Zo
 JZnmEOSPdj1wReWa64Ntt1WQc4pyQAMIUbs8Q/X9XOyODTbCeVIjIvPnE
 miNtzKaQ5+msnU4so8qvrm1CvbKQDB1xhriRE9pou8AHyUaS4ZSY6SOHr
 d+hXenYllMrNYORuwsDFlwWieVz2kQTJMiljRQ/pK154dALkS/hn/R9gk
 FlN2RepzS5Yw7woW6xg8L0TKr8vVuxYHoNw2HuqYuOD9tavlB6MhgIsQ/
 1TZMrfI5bj+nt2JIPOmpqfRs2JheAe6quJ0OGGPpLYD4a3+DquVzL/V56 w==;
X-CSE-ConnectionGUID: rfSY5L68TlGSsDo/5RhYqQ==
X-CSE-MsgGUID: e/Y64qHgSaic5TQqfOLC8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="90314634"
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="90314634"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:19:16 -0800
X-CSE-ConnectionGUID: 5UPSJg07QEqjO+IyqnMoAg==
X-CSE-MsgGUID: Drc5JaVgSFyyp5ScPynFxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="188879722"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:19:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 17/24] drm/vblank: merge drm_vblank_restore() into
 drm_crtc_vblank_restore()
Date: Mon, 10 Nov 2025 18:17:35 +0200
Message-ID: <926fae6a95d64e8ad1caf3c3f1ef2a0d25594b72.1762791343.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762791343.git.jani.nikula@intel.com>
References: <cover.1762791343.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 57 +++++++++++++++---------------------
 1 file changed, 23 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index 0ff69b06b2bd..64cd96207ad5 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1524,23 +1524,41 @@ void drm_crtc_vblank_on(struct drm_crtc *crtc)
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
@@ -1561,35 +1579,6 @@ static void drm_vblank_restore(struct drm_device *dev, unsigned int pipe)
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
 
 static int drm_queue_vblank_event(struct drm_vblank_crtc *vblank,
-- 
2.47.3

