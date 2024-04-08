Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B3F89BB9B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 11:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9355111234A;
	Mon,  8 Apr 2024 09:24:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XLKW93/f";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21D1D11234C;
 Mon,  8 Apr 2024 09:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712568279; x=1744104279;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cBnA5smUs76uW8sJN/jJurhyahRBx0/KNDP2KeEiUWw=;
 b=XLKW93/ffLaIqd5qUXQ52EaTRaJxfEEsBkk0NBgZ/sDrXvPIn6gdx4oW
 mj95dgukQ6yII0zGefOKcNmuGKPB49q4sQ27JA7YFMLMOEUZRdH+biQQg
 iY5JXPTEd33HZm2rl7Jf7ZdIOKMDP+ry4KziqmRvFqoqw/HQV0AkuZ7PQ
 DerRq4zlkyb2+M4ht/izmPJG2tiuaH0vUaPTlcOIufKItmKRO+LcX6U0o
 aadYlXJO/xcYSNNHf8jNoxBCq3VMy4+kLUUVubVmhy/LAofm5igY/Eut5
 bzATqTFXcr3EPubFPBAi/KP1dHwcyYzKTx1e7fzicqkxn/9pNSdyMlkZt A==;
X-CSE-ConnectionGUID: 4E2FTxAzTle1ZFbaqEj8MQ==
X-CSE-MsgGUID: Dm1M3an+T++J0MfqdBTYsw==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="10807393"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="10807393"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:24:38 -0700
X-CSE-ConnectionGUID: XrHhx8KFRQW80JE0iYVCFg==
X-CSE-MsgGUID: 0piFNvK/TpepDBTI0YSnUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="20261285"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:24:36 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 5/7] drm/crtc: switch to drm device based logging
Date: Mon,  8 Apr 2024 12:24:00 +0300
Message-Id: <187a7e8e350569a78ebe02ff83ac3b933c8a5355.1712568037.git.jani.nikula@intel.com>
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

Prefer drm device based drm_dbg_kms() over DRM_DEBUG_KMS().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_crtc.c | 36 +++++++++++++++++-------------------
 1 file changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 82c665d3e74b..b0a0e27e83eb 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -716,10 +716,10 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 
 	crtc = drm_crtc_find(dev, file_priv, crtc_req->crtc_id);
 	if (!crtc) {
-		DRM_DEBUG_KMS("Unknown CRTC ID %d\n", crtc_req->crtc_id);
+		drm_dbg_kms(dev, "Unknown CRTC ID %d\n", crtc_req->crtc_id);
 		return -ENOENT;
 	}
-	DRM_DEBUG_KMS("[CRTC:%d:%s]\n", crtc->base.id, crtc->name);
+	drm_dbg_kms(dev, "[CRTC:%d:%s]\n", crtc->base.id, crtc->name);
 
 	plane = crtc->primary;
 
@@ -742,7 +742,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 				old_fb = plane->fb;
 
 			if (!old_fb) {
-				DRM_DEBUG_KMS("CRTC doesn't have current FB\n");
+				drm_dbg_kms(dev, "CRTC doesn't have current FB\n");
 				ret = -EINVAL;
 				goto out;
 			}
@@ -753,8 +753,8 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 		} else {
 			fb = drm_framebuffer_lookup(dev, file_priv, crtc_req->fb_id);
 			if (!fb) {
-				DRM_DEBUG_KMS("Unknown FB ID%d\n",
-						crtc_req->fb_id);
+				drm_dbg_kms(dev, "Unknown FB ID%d\n",
+					    crtc_req->fb_id);
 				ret = -ENOENT;
 				goto out;
 			}
@@ -767,7 +767,7 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 		}
 		if (!file_priv->aspect_ratio_allowed &&
 		    (crtc_req->mode.flags & DRM_MODE_FLAG_PIC_AR_MASK) != DRM_MODE_FLAG_PIC_AR_NONE) {
-			DRM_DEBUG_KMS("Unexpected aspect-ratio flag bits\n");
+			drm_dbg_kms(dev, "Unexpected aspect-ratio flag bits\n");
 			ret = -EINVAL;
 			goto out;
 		}
@@ -775,8 +775,8 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 
 		ret = drm_mode_convert_umode(dev, mode, &crtc_req->mode);
 		if (ret) {
-			DRM_DEBUG_KMS("Invalid mode (ret=%d, status=%s)\n",
-				      ret, drm_get_mode_status_name(mode->status));
+			drm_dbg_kms(dev, "Invalid mode (ret=%d, status=%s)\n",
+				    ret, drm_get_mode_status_name(mode->status));
 			drm_mode_debug_printmodeline(mode);
 			goto out;
 		}
@@ -793,9 +793,8 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 							   fb->format->format,
 							   fb->modifier);
 			if (ret) {
-				DRM_DEBUG_KMS("Invalid pixel format %p4cc, modifier 0x%llx\n",
-					      &fb->format->format,
-					      fb->modifier);
+				drm_dbg_kms(dev, "Invalid pixel format %p4cc, modifier 0x%llx\n",
+					    &fb->format->format, fb->modifier);
 				goto out;
 			}
 		}
@@ -808,14 +807,14 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 	}
 
 	if (crtc_req->count_connectors == 0 && mode) {
-		DRM_DEBUG_KMS("Count connectors is 0 but mode set\n");
+		drm_dbg_kms(dev, "Count connectors is 0 but mode set\n");
 		ret = -EINVAL;
 		goto out;
 	}
 
 	if (crtc_req->count_connectors > 0 && (!mode || !fb)) {
-		DRM_DEBUG_KMS("Count connectors is %d but no mode or fb set\n",
-			  crtc_req->count_connectors);
+		drm_dbg_kms(dev, "Count connectors is %d but no mode or fb set\n",
+			    crtc_req->count_connectors);
 		ret = -EINVAL;
 		goto out;
 	}
@@ -847,14 +846,13 @@ int drm_mode_setcrtc(struct drm_device *dev, void *data,
 
 			connector = drm_connector_lookup(dev, file_priv, out_id);
 			if (!connector) {
-				DRM_DEBUG_KMS("Connector id %d unknown\n",
-						out_id);
+				drm_dbg_kms(dev, "Connector id %d unknown\n",
+					    out_id);
 				ret = -ENOENT;
 				goto out;
 			}
-			DRM_DEBUG_KMS("[CONNECTOR:%d:%s]\n",
-					connector->base.id,
-					connector->name);
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s]\n",
+				    connector->base.id, connector->name);
 
 			connector_set[i] = connector;
 			num_connectors++;
-- 
2.39.2

