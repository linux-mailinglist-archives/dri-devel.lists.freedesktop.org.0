Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 605A189BB9C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 11:24:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4FF112346;
	Mon,  8 Apr 2024 09:24:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lhsNwk4Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04AF1112349;
 Mon,  8 Apr 2024 09:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712568284; x=1744104284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sB1XeHSvrahPXlu/4hu405bb+T+P/fKGiHxz1TLfTis=;
 b=lhsNwk4YpCMModUGbP90zJQgsv3JYp0q5milrxrF/+ImVv0CgZdXK+s2
 fdJ1GrietScRZzKfnCwEuuPOw4mJn5zhvLQvsNjKAi9XzOQBUFJ+6Tn4t
 9oGVTVXXmJPlpsiZQwoNAHrMGg8ODASmwEYOxPMkhzm1+0foRgPqXlDJ1
 L6SE5A44KRnjRJ+a55S+UdGtSnhskmu1HIbj/4T+vgapp/MXOkm2gMs6G
 LerYOXHAYjeyeNoCQmZ0+rselwhQOM1/aXonQQmt455+7gxuI57e98xyA
 UDerAJilgqo8cC5MUaRmr82iBRfDv3SfPDvRWIibjP0dxUn/rSJw8DblM g==;
X-CSE-ConnectionGUID: vOeplXUGQkSY10gnULuTCA==
X-CSE-MsgGUID: qX5qmDbvTzS2inqzFMcG+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="18557850"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="18557850"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:24:44 -0700
X-CSE-ConnectionGUID: opdd6TG9QrOlAsVV2sl3Ow==
X-CSE-MsgGUID: Un/EFy6gTyWwS//zF45NQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="24299150"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:24:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 6/7] drm/crtc-helper: switch to drm device based logging
 and warns
Date: Mon,  8 Apr 2024 12:24:01 +0300
Message-Id: <b8557c4b2db0e5c931a6d82b5cc8ac5f3a3e1a77.1712568037.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712568037.git.jani.nikula@intel.com>
References: <cover.1712568037.git.jani.nikula@intel.com>
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

Prefer drm device based drm_dbg_kms(), drm_err(), drm_WARN_ON() over
DRM_DEBUG_KMS(), DRM_ERROR(), and WARN_ON(). Also update encoder,
connector, and crtc logging to include the object id and name, where
possible.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_crtc_helper.c | 95 +++++++++++++++++--------------
 1 file changed, 52 insertions(+), 43 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index 2dafc39a27cb..af7ac9d9192a 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -110,15 +110,15 @@ bool drm_helper_encoder_in_use(struct drm_encoder *encoder)
 	struct drm_connector_list_iter conn_iter;
 	struct drm_device *dev = encoder->dev;
 
-	WARN_ON(drm_drv_uses_atomic_modeset(dev));
+	drm_WARN_ON(dev, drm_drv_uses_atomic_modeset(dev));
 
 	/*
 	 * We can expect this mutex to be locked if we are not panicking.
 	 * Locking is currently fubar in the panic handler.
 	 */
 	if (!oops_in_progress) {
-		WARN_ON(!mutex_is_locked(&dev->mode_config.mutex));
-		WARN_ON(!drm_modeset_is_locked(&dev->mode_config.connection_mutex));
+		drm_WARN_ON(dev, !mutex_is_locked(&dev->mode_config.mutex));
+		drm_WARN_ON(dev, !drm_modeset_is_locked(&dev->mode_config.connection_mutex));
 	}
 
 
@@ -150,14 +150,14 @@ bool drm_helper_crtc_in_use(struct drm_crtc *crtc)
 	struct drm_encoder *encoder;
 	struct drm_device *dev = crtc->dev;
 
-	WARN_ON(drm_drv_uses_atomic_modeset(dev));
+	drm_WARN_ON(dev, drm_drv_uses_atomic_modeset(dev));
 
 	/*
 	 * We can expect this mutex to be locked if we are not panicking.
 	 * Locking is currently fubar in the panic handler.
 	 */
 	if (!oops_in_progress)
-		WARN_ON(!mutex_is_locked(&dev->mode_config.mutex));
+		drm_WARN_ON(dev, !mutex_is_locked(&dev->mode_config.mutex));
 
 	drm_for_each_encoder(encoder, dev)
 		if (encoder->crtc == crtc && drm_helper_encoder_in_use(encoder))
@@ -230,7 +230,7 @@ static void __drm_helper_disable_unused_functions(struct drm_device *dev)
  */
 void drm_helper_disable_unused_functions(struct drm_device *dev)
 {
-	WARN_ON(drm_drv_uses_atomic_modeset(dev));
+	drm_WARN_ON(dev, drm_drv_uses_atomic_modeset(dev));
 
 	drm_modeset_lock_all(dev);
 	__drm_helper_disable_unused_functions(dev);
@@ -294,7 +294,7 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 	struct drm_encoder *encoder;
 	bool ret = true;
 
-	WARN_ON(drm_drv_uses_atomic_modeset(dev));
+	drm_WARN_ON(dev, drm_drv_uses_atomic_modeset(dev));
 
 	drm_warn_on_modeset_not_all_locked(dev);
 
@@ -338,7 +338,8 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 		if (encoder_funcs->mode_fixup) {
 			if (!(ret = encoder_funcs->mode_fixup(encoder, mode,
 							      adjusted_mode))) {
-				DRM_DEBUG_KMS("Encoder fixup failed\n");
+				drm_dbg_kms(dev, "[ENCODER:%d:%s] mode fixup failed\n",
+					    encoder->base.id, encoder->name);
 				goto done;
 			}
 		}
@@ -347,11 +348,12 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 	if (crtc_funcs->mode_fixup) {
 		if (!(ret = crtc_funcs->mode_fixup(crtc, mode,
 						adjusted_mode))) {
-			DRM_DEBUG_KMS("CRTC fixup failed\n");
+			drm_dbg_kms(dev, "[CRTC:%d:%s] mode fixup failed\n",
+				    crtc->base.id, crtc->name);
 			goto done;
 		}
 	}
-	DRM_DEBUG_KMS("[CRTC:%d:%s]\n", crtc->base.id, crtc->name);
+	drm_dbg_kms(dev, "[CRTC:%d:%s]\n", crtc->base.id, crtc->name);
 
 	drm_mode_copy(&crtc->hwmode, adjusted_mode);
 
@@ -390,8 +392,8 @@ bool drm_crtc_helper_set_mode(struct drm_crtc *crtc,
 		if (!encoder_funcs)
 			continue;
 
-		DRM_DEBUG_KMS("[ENCODER:%d:%s] set [MODE:%s]\n",
-			encoder->base.id, encoder->name, mode->name);
+		drm_dbg_kms(dev, "[ENCODER:%d:%s] set [MODE:%s]\n",
+			    encoder->base.id, encoder->name, mode->name);
 		if (encoder_funcs->mode_set)
 			encoder_funcs->mode_set(encoder, mode, adjusted_mode);
 	}
@@ -503,7 +505,7 @@ drm_connector_get_single_encoder(struct drm_connector *connector)
 {
 	struct drm_encoder *encoder;
 
-	WARN_ON(hweight32(connector->possible_encoders) > 1);
+	drm_WARN_ON(connector->dev, hweight32(connector->possible_encoders) > 1);
 	drm_connector_for_each_possible_encoder(connector, encoder)
 		return encoder;
 
@@ -564,8 +566,6 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 	int ret;
 	int i;
 
-	DRM_DEBUG_KMS("\n");
-
 	BUG_ON(!set);
 	BUG_ON(!set->crtc);
 	BUG_ON(!set->crtc->helper_private);
@@ -577,19 +577,22 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 	crtc_funcs = set->crtc->helper_private;
 
 	dev = set->crtc->dev;
-	WARN_ON(drm_drv_uses_atomic_modeset(dev));
+
+	drm_dbg_kms(dev, "\n");
+
+	drm_WARN_ON(dev, drm_drv_uses_atomic_modeset(dev));
 
 	if (!set->mode)
 		set->fb = NULL;
 
 	if (set->fb) {
-		DRM_DEBUG_KMS("[CRTC:%d:%s] [FB:%d] #connectors=%d (x y) (%i %i)\n",
-			      set->crtc->base.id, set->crtc->name,
-			      set->fb->base.id,
-			      (int)set->num_connectors, set->x, set->y);
+		drm_dbg_kms(dev, "[CRTC:%d:%s] [FB:%d] #connectors=%d (x y) (%i %i)\n",
+			    set->crtc->base.id, set->crtc->name,
+			    set->fb->base.id,
+			    (int)set->num_connectors, set->x, set->y);
 	} else {
-		DRM_DEBUG_KMS("[CRTC:%d:%s] [NOFB]\n",
-			      set->crtc->base.id, set->crtc->name);
+		drm_dbg_kms(dev, "[CRTC:%d:%s] [NOFB]\n",
+			    set->crtc->base.id, set->crtc->name);
 		drm_crtc_helper_disable(set->crtc);
 		return 0;
 	}
@@ -639,7 +642,8 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 	if (set->crtc->primary->fb != set->fb) {
 		/* If we have no fb then treat it as a full mode set */
 		if (set->crtc->primary->fb == NULL) {
-			DRM_DEBUG_KMS("crtc has no fb, full mode set\n");
+			drm_dbg_kms(dev, "[CRTC:%d:%s] no fb, full mode set\n",
+				    set->crtc->base.id, set->crtc->name);
 			mode_changed = true;
 		} else if (set->fb->format != set->crtc->primary->fb->format) {
 			mode_changed = true;
@@ -651,7 +655,8 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 		fb_changed = true;
 
 	if (!drm_mode_equal(set->mode, &set->crtc->mode)) {
-		DRM_DEBUG_KMS("modes are different, full mode set\n");
+		drm_dbg_kms(dev, "[CRTC:%d:%s] modes are different, full mode set:\n",
+			    set->crtc->base.id, set->crtc->name);
 		drm_mode_debug_printmodeline(&set->crtc->mode);
 		drm_mode_debug_printmodeline(set->mode);
 		mode_changed = true;
@@ -687,7 +692,8 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 					fail = 1;
 
 				if (connector->dpms != DRM_MODE_DPMS_ON) {
-					DRM_DEBUG_KMS("connector dpms not on, full mode switch\n");
+					drm_dbg_kms(dev, "[CONNECTOR:%d:%s] DPMS not on, full mode switch\n",
+						    connector->base.id, connector->name);
 					mode_changed = true;
 				}
 
@@ -696,7 +702,8 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 		}
 
 		if (new_encoder != connector->encoder) {
-			DRM_DEBUG_KMS("encoder changed, full mode switch\n");
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] encoder changed, full mode switch\n",
+				    connector->base.id, connector->name);
 			mode_changed = true;
 			/* If the encoder is reused for another connector, then
 			 * the appropriate crtc will be set later.
@@ -737,17 +744,18 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 			goto fail;
 		}
 		if (new_crtc != connector->encoder->crtc) {
-			DRM_DEBUG_KMS("crtc changed, full mode switch\n");
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] CRTC changed, full mode switch\n",
+				    connector->base.id, connector->name);
 			mode_changed = true;
 			connector->encoder->crtc = new_crtc;
 		}
 		if (new_crtc) {
-			DRM_DEBUG_KMS("[CONNECTOR:%d:%s] to [CRTC:%d:%s]\n",
-				      connector->base.id, connector->name,
-				      new_crtc->base.id, new_crtc->name);
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] to [CRTC:%d:%s]\n",
+				    connector->base.id, connector->name,
+				    new_crtc->base.id, new_crtc->name);
 		} else {
-			DRM_DEBUG_KMS("[CONNECTOR:%d:%s] to [NOCRTC]\n",
-				      connector->base.id, connector->name);
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] to [NOCRTC]\n",
+				    connector->base.id, connector->name);
 		}
 	}
 	drm_connector_list_iter_end(&conn_iter);
@@ -758,23 +766,24 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 
 	if (mode_changed) {
 		if (drm_helper_crtc_in_use(set->crtc)) {
-			DRM_DEBUG_KMS("attempting to set mode from"
-					" userspace\n");
+			drm_dbg_kms(dev, "[CRTC:%d:%s] attempting to set mode from userspace\n",
+				    set->crtc->base.id, set->crtc->name);
 			drm_mode_debug_printmodeline(set->mode);
 			set->crtc->primary->fb = set->fb;
 			if (!drm_crtc_helper_set_mode(set->crtc, set->mode,
 						      set->x, set->y,
 						      save_set.fb)) {
-				DRM_ERROR("failed to set mode on [CRTC:%d:%s]\n",
-					  set->crtc->base.id, set->crtc->name);
+				drm_err(dev, "[CRTC:%d:%s] failed to set mode\n",
+					set->crtc->base.id, set->crtc->name);
 				set->crtc->primary->fb = save_set.fb;
 				ret = -EINVAL;
 				goto fail;
 			}
-			DRM_DEBUG_KMS("Setting connector DPMS state to on\n");
+			drm_dbg_kms(dev, "[CRTC:%d:%s] Setting connector DPMS state to on\n",
+				    set->crtc->base.id, set->crtc->name);
 			for (i = 0; i < set->num_connectors; i++) {
-				DRM_DEBUG_KMS("\t[CONNECTOR:%d:%s] set DPMS on\n", set->connectors[i]->base.id,
-					      set->connectors[i]->name);
+				drm_dbg_kms(dev, "\t[CONNECTOR:%d:%s] set DPMS on\n", set->connectors[i]->base.id,
+					    set->connectors[i]->name);
 				set->connectors[i]->funcs->dpms(set->connectors[i], DRM_MODE_DPMS_ON);
 			}
 		}
@@ -823,7 +832,7 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 	if (mode_changed &&
 	    !drm_crtc_helper_set_mode(save_set.crtc, save_set.mode, save_set.x,
 				      save_set.y, save_set.fb))
-		DRM_ERROR("failed to restore config after modeset failure\n");
+		drm_err(dev, "failed to restore config after modeset failure\n");
 
 	kfree(save_connector_encoders);
 	kfree(save_encoder_crtcs);
@@ -905,7 +914,7 @@ int drm_helper_connector_dpms(struct drm_connector *connector, int mode)
 	struct drm_crtc *crtc = encoder ? encoder->crtc : NULL;
 	int old_dpms, encoder_dpms = DRM_MODE_DPMS_OFF;
 
-	WARN_ON(drm_drv_uses_atomic_modeset(connector->dev));
+	drm_WARN_ON(connector->dev, drm_drv_uses_atomic_modeset(connector->dev));
 
 	if (mode == connector->dpms)
 		return 0;
@@ -980,7 +989,7 @@ void drm_helper_resume_force_mode(struct drm_device *dev)
 	int encoder_dpms;
 	bool ret;
 
-	WARN_ON(drm_drv_uses_atomic_modeset(dev));
+	drm_WARN_ON(dev, drm_drv_uses_atomic_modeset(dev));
 
 	drm_modeset_lock_all(dev);
 	drm_for_each_crtc(crtc, dev) {
@@ -993,7 +1002,7 @@ void drm_helper_resume_force_mode(struct drm_device *dev)
 
 		/* Restoring the old config should never fail! */
 		if (ret == false)
-			DRM_ERROR("failed to set mode on crtc %p\n", crtc);
+			drm_err(dev, "failed to set mode on crtc %p\n", crtc);
 
 		/* Turn off outputs that were already powered off */
 		if (drm_helper_choose_crtc_dpms(crtc)) {
-- 
2.39.2

