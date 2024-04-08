Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 233A989BB9F
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 11:25:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02F3C11234D;
	Mon,  8 Apr 2024 09:24:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mXHfJaSy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9F1112355;
 Mon,  8 Apr 2024 09:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712568289; x=1744104289;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=A7ajr+K3huQqh1tb5zViK+43qFVdqXpFOhNH1kF6EsE=;
 b=mXHfJaSyD/gP1EX735MqOBdidEjfE8xbD9a3U/Ft/NPyan9DGqpeDWK8
 JdRnTDEiZ2C17fSVe0vUt2HCH4rIyi03sh/wrwaKuSfS+cRU9IB8d4QJq
 bvSCf4vyUqqmJlUMj/nwqzAr1dwyU7+qEFPO7coDTnEPsG5jJOE1uHY1U
 5R0RBan+x/TBL3I/b9kZSkTNox9qI8g0IOYmxxWqZQ1oNGSHxIT4w8ayG
 TTjxQ95tw1pnIzlYfP98mf9k8s4uF4qoxpOibxup/P+3e6iPfUnS+P8lv
 Pj+u5ZWPUxWkGnA+7NhiTO3gbcAyreyRdGN36vYsOciDRiWxEl/SV9ST+ A==;
X-CSE-ConnectionGUID: LZTNCeN6TqytXkgVN4j7Ew==
X-CSE-MsgGUID: 2fDG9OdJSvO4h1sVQ7aNhQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="18557857"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="18557857"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:24:49 -0700
X-CSE-ConnectionGUID: YFkdhQxaRcC3ys8Rx38uTw==
X-CSE-MsgGUID: 9PxJWQXBSFOVSLRzQaRykw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="24299159"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.71])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:24:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 7/7] drm: prefer DRM_MODE_FMT/ARG over
 drm_mode_debug_printmodeline()
Date: Mon,  8 Apr 2024 12:24:02 +0300
Message-Id: <6df18588dfa17c5d0a1501f5af9ff21f25a1981b.1712568037.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712568037.git.jani.nikula@intel.com>
References: <cover.1712568037.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

We have DRM_MODE_FMT and DRM_MODE_ARG() macros to allow unified debug
printing of modes in any printk-formatted logging. Prefer them over
drm_mode_debug_printmodeline().

This allows drm device specific logging of modes, in the right drm debug
category, and inline with the rest of the logging instead of split to
multiple lines.

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c  |  6 +++---
 drivers/gpu/drm/drm_crtc.c         |  6 +++---
 drivers/gpu/drm/drm_crtc_helper.c  |  9 ++++-----
 drivers/gpu/drm/drm_modes.c        | 13 +++++--------
 drivers/gpu/drm/drm_probe_helper.c |  3 ++-
 5 files changed, 17 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 29d4940188d4..fc16fddee5c5 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -145,10 +145,10 @@ int drm_atomic_set_mode_prop_for_crtc(struct drm_crtc_state *state,
 					     &state->mode, blob->data);
 		if (ret) {
 			drm_dbg_atomic(crtc->dev,
-				       "[CRTC:%d:%s] invalid mode (ret=%d, status=%s):\n",
+				       "[CRTC:%d:%s] invalid mode (%s, %pe): " DRM_MODE_FMT "\n",
 				       crtc->base.id, crtc->name,
-				       ret, drm_get_mode_status_name(state->mode.status));
-			drm_mode_debug_printmodeline(&state->mode);
+				       drm_get_mode_status_name(state->mode.status),
+				       ERR_PTR(ret), DRM_MODE_ARG(&state->mode));
 			return -EINVAL;
 		}
 
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index b0a0e27e83eb..483969b84a30 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -775,9 +775,9 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 
 		ret = drm_mode_convert_umode(dev, mode, &crtc_req->mode);
 		if (ret) {
-			drm_dbg_kms(dev, "Invalid mode (ret=%d, status=%s)\n",
-				    ret, drm_get_mode_status_name(mode->status));
-			drm_mode_debug_printmodeline(mode);
+			drm_dbg_kms(dev, "Invalid mode (%s, %pe): " DRM_MODE_FMT "\n",
+				    drm_get_mode_status_name(mode->status),
+				    ERR_PTR(ret), DRM_MODE_ARG(mode));
 			goto out;
 		}
 
diff --git a/drivers/gpu/drm/drm_crtc_helper.c b/drivers/gpu/drm/drm_crtc_helper.c
index af7ac9d9192a..0955f1c385dd 100644
--- a/drivers/gpu/drm/drm_crtc_helper.c
+++ b/drivers/gpu/drm/drm_crtc_helper.c
@@ -657,8 +657,8 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 	if (!drm_mode_equal(set->mode, &set->crtc->mode)) {
 		drm_dbg_kms(dev, "[CRTC:%d:%s] modes are different, full mode set:\n",
 			    set->crtc->base.id, set->crtc->name);
-		drm_mode_debug_printmodeline(&set->crtc->mode);
-		drm_mode_debug_printmodeline(set->mode);
+		drm_dbg_kms(dev, DRM_MODE_FMT "\n", DRM_MODE_ARG(&set->crtc->mode));
+		drm_dbg_kms(dev, DRM_MODE_FMT "\n", DRM_MODE_ARG(set->mode));
 		mode_changed = true;
 	}
 
@@ -766,9 +766,8 @@ int drm_crtc_helper_set_config(struct drm_mode_set *set,
 
 	if (mode_changed) {
 		if (drm_helper_crtc_in_use(set->crtc)) {
-			drm_dbg_kms(dev, "[CRTC:%d:%s] attempting to set mode from userspace\n",
-				    set->crtc->base.id, set->crtc->name);
-			drm_mode_debug_printmodeline(set->mode);
+			drm_dbg_kms(dev, "[CRTC:%d:%s] attempting to set mode from userspace: " DRM_MODE_FMT "\n",
+				    set->crtc->base.id, set->crtc->name, DRM_MODE_ARG(set->mode));
 			set->crtc->primary->fb = set->fb;
 			if (!drm_crtc_helper_set_mode(set->crtc, set->mode,
 						      set->x, set->y,
diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 408ee1b5e44d..2d8b0371619d 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -1201,9 +1201,8 @@ int of_get_drm_display_mode(struct device_node *np,
 	if (bus_flags)
 		drm_bus_flags_from_videomode(&vm, bus_flags);
 
-	pr_debug("%pOF: got %dx%d display mode\n",
-		np, vm.hactive, vm.vactive);
-	drm_mode_debug_printmodeline(dmode);
+	pr_debug("%pOF: got %dx%d display mode: " DRM_MODE_FMT "\n",
+		 np, vm.hactive, vm.vactive, DRM_MODE_ARG(dmode));
 
 	return 0;
 }
@@ -1251,7 +1250,7 @@ int of_get_drm_panel_display_mode(struct device_node *np,
 	dmode->width_mm = width_mm;
 	dmode->height_mm = height_mm;
 
-	drm_mode_debug_printmodeline(dmode);
+	pr_debug(DRM_MODE_FMT "\n", DRM_MODE_ARG(dmode));
 
 	return 0;
 }
@@ -1813,10 +1812,8 @@ void drm_mode_prune_invalid(struct drm_device *dev,
 					 DRM_MODE_FMT "\n", DRM_MODE_ARG(mode));
 			}
 			if (verbose) {
-				drm_mode_debug_printmodeline(mode);
-				drm_dbg_kms(dev, "Not using %s mode: %s\n",
-					    mode->name,
-					    drm_get_mode_status_name(mode->status));
+				drm_dbg_kms(dev, "Rejected mode: " DRM_MODE_FMT " (%s)\n",
+					    DRM_MODE_ARG(mode), drm_get_mode_status_name(mode->status));
 			}
 			drm_mode_destroy(dev, mode);
 		}
diff --git a/drivers/gpu/drm/drm_probe_helper.c b/drivers/gpu/drm/drm_probe_helper.c
index 19bf5d298257..4f75a1cfd820 100644
--- a/drivers/gpu/drm/drm_probe_helper.c
+++ b/drivers/gpu/drm/drm_probe_helper.c
@@ -701,7 +701,8 @@ int drm_helper_probe_single_connector_modes(struct drm_connector *connector,
 
 	list_for_each_entry(mode, &connector->modes, head) {
 		drm_mode_set_crtcinfo(mode, CRTC_INTERLACE_HALVE_V);
-		drm_mode_debug_printmodeline(mode);
+		drm_dbg_kms(dev, "Probed mode: " DRM_MODE_FMT "\n",
+			    DRM_MODE_ARG(mode));
 	}
 
 	return count;
-- 
2.39.2

