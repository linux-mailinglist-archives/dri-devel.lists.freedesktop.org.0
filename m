Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02BA989BB93
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 11:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C31D112348;
	Mon,  8 Apr 2024 09:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R1MIZ9Ql";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA458112347;
 Mon,  8 Apr 2024 09:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712568261; x=1744104261;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QdxDocIqYe6yTS7I4EMAth4ZeQTyh47Z5U1/W939hUM=;
 b=R1MIZ9Qlq2IR8BdrcvvTNJp7aHF4Vl7dqOuwSq8lS15uxa9304//tUSc
 aQDiwOiKt78kvxGvnZ2TDUHh4sMEdhPgJeZ/+KH5QZGI5u6Y7tQ2BjUf5
 Ta6xZvQQSn9xrUJ1m/ksHUHkkVyBUyyWFw79UXafiBpkD8LoH3PG8Mf29
 dxJZUWJRL1dj+gymhkKkNxOwINt7hoKq4cKS3jHFjdKdHmKpq/58PpQX1
 8LfjCPrmtX2C9g5DhMSBolxqgpVWUVPuOpNgnnghS7IttUAkqcXPGu8J7
 EGrjhh+i16MqjiIppXZp8uVTECpnv/fxG5C2T27ij+gLx3picXeSooaq1 w==;
X-CSE-ConnectionGUID: RTsltIhXQ0WjzR0UiXKjCQ==
X-CSE-MsgGUID: FOX7s46SSueiHK8nRFMRZw==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="18557819"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="18557819"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:24:20 -0700
X-CSE-ConnectionGUID: Ti9qI3zTTom9e3HLi3ajeg==
X-CSE-MsgGUID: /Gs0fStMQLSKmgts+iQQqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="20261209"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.71])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 02:24:18 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 2/7] drm/modes: switch to drm device based error logging
Date: Mon,  8 Apr 2024 12:23:57 +0300
Message-Id: <3342dd2e98fedd618e5aeef26c44044cd32ead20.1712568037.git.jani.nikula@intel.com>
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

Prefer drm_err() and drm_dbg_kms() over DRM_ERROR() and DRM_DEBUG_KMS().

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_modes.c | 33 +++++++++++++++++----------------
 1 file changed, 17 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index c4f88c3a93b7..408ee1b5e44d 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -373,8 +373,8 @@ static int fill_analog_mode(struct drm_device *dev,
 	if (!bt601 &&
 	    (hact_duration_ns < params->hact_ns.min ||
 	     hact_duration_ns > params->hact_ns.max)) {
-		DRM_ERROR("Invalid horizontal active area duration: %uns (min: %u, max %u)\n",
-			  hact_duration_ns, params->hact_ns.min, params->hact_ns.max);
+		drm_err(dev, "Invalid horizontal active area duration: %uns (min: %u, max %u)\n",
+			hact_duration_ns, params->hact_ns.min, params->hact_ns.max);
 		return -EINVAL;
 	}
 
@@ -385,8 +385,8 @@ static int fill_analog_mode(struct drm_device *dev,
 	if (!bt601 &&
 	    (hblk_duration_ns < params->hblk_ns.min ||
 	     hblk_duration_ns > params->hblk_ns.max)) {
-		DRM_ERROR("Invalid horizontal blanking duration: %uns (min: %u, max %u)\n",
-			  hblk_duration_ns, params->hblk_ns.min, params->hblk_ns.max);
+		drm_err(dev, "Invalid horizontal blanking duration: %uns (min: %u, max %u)\n",
+			hblk_duration_ns, params->hblk_ns.min, params->hblk_ns.max);
 		return -EINVAL;
 	}
 
@@ -397,8 +397,8 @@ static int fill_analog_mode(struct drm_device *dev,
 	if (!bt601 &&
 	    (hslen_duration_ns < params->hslen_ns.min ||
 	     hslen_duration_ns > params->hslen_ns.max)) {
-		DRM_ERROR("Invalid horizontal sync duration: %uns (min: %u, max %u)\n",
-			  hslen_duration_ns, params->hslen_ns.min, params->hslen_ns.max);
+		drm_err(dev, "Invalid horizontal sync duration: %uns (min: %u, max %u)\n",
+			hslen_duration_ns, params->hslen_ns.min, params->hslen_ns.max);
 		return -EINVAL;
 	}
 
@@ -409,7 +409,8 @@ static int fill_analog_mode(struct drm_device *dev,
 	if (!bt601 &&
 	    (porches_duration_ns > (params->hfp_ns.max + params->hbp_ns.max) ||
 	     porches_duration_ns < (params->hfp_ns.min + params->hbp_ns.min))) {
-		DRM_ERROR("Invalid horizontal porches duration: %uns\n", porches_duration_ns);
+		drm_err(dev, "Invalid horizontal porches duration: %uns\n",
+			porches_duration_ns);
 		return -EINVAL;
 	}
 
@@ -431,8 +432,8 @@ static int fill_analog_mode(struct drm_device *dev,
 	if (!bt601 &&
 	    (hfp_duration_ns < params->hfp_ns.min ||
 	     hfp_duration_ns > params->hfp_ns.max)) {
-		DRM_ERROR("Invalid horizontal front porch duration: %uns (min: %u, max %u)\n",
-			  hfp_duration_ns, params->hfp_ns.min, params->hfp_ns.max);
+		drm_err(dev, "Invalid horizontal front porch duration: %uns (min: %u, max %u)\n",
+			hfp_duration_ns, params->hfp_ns.min, params->hfp_ns.max);
 		return -EINVAL;
 	}
 
@@ -443,8 +444,8 @@ static int fill_analog_mode(struct drm_device *dev,
 	if (!bt601 &&
 	    (hbp_duration_ns < params->hbp_ns.min ||
 	     hbp_duration_ns > params->hbp_ns.max)) {
-		DRM_ERROR("Invalid horizontal back porch duration: %uns (min: %u, max %u)\n",
-			  hbp_duration_ns, params->hbp_ns.min, params->hbp_ns.max);
+		drm_err(dev, "Invalid horizontal back porch duration: %uns (min: %u, max %u)\n",
+			hbp_duration_ns, params->hbp_ns.min, params->hbp_ns.max);
 		return -EINVAL;
 	}
 
@@ -495,8 +496,8 @@ static int fill_analog_mode(struct drm_device *dev,
 
 	vtotal = vactive + vfp + vslen + vbp;
 	if (params->num_lines != vtotal) {
-		DRM_ERROR("Invalid vertical total: %upx (expected %upx)\n",
-			  vtotal, params->num_lines);
+		drm_err(dev, "Invalid vertical total: %upx (expected %upx)\n",
+			vtotal, params->num_lines);
 		return -EINVAL;
 	}
 
@@ -1813,9 +1814,9 @@ void drm_mode_prune_invalid(struct drm_device *dev,
 			}
 			if (verbose) {
 				drm_mode_debug_printmodeline(mode);
-				DRM_DEBUG_KMS("Not using %s mode: %s\n",
-					      mode->name,
-					      drm_get_mode_status_name(mode->status));
+				drm_dbg_kms(dev, "Not using %s mode: %s\n",
+					    mode->name,
+					    drm_get_mode_status_name(mode->status));
 			}
 			drm_mode_destroy(dev, mode);
 		}
-- 
2.39.2

