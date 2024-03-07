Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C43298758A1
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 21:40:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1570F10F54A;
	Thu,  7 Mar 2024 20:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ftbfpsNk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8910D10F549;
 Thu,  7 Mar 2024 20:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709844008; x=1741380008;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bUmubBkRjchd7krglo81MsYurFDz4vGM9MmoelRBm2w=;
 b=ftbfpsNkCpeWgl9Gx7/E50aqw+v12Bn14xVzzqv6WtLKuSfX0ICnV5/+
 h4L9hoAT/0xBJkxUHWdVkAeDcizkYnMwg7+qqD0kluXzNhCIf15ZtcJzD
 7jxBd3MthyE7Qg5GZ0TWSU0mC9mB8+NbmOxF2furmxquhWErLuLnw5nWx
 EObLdCyPWpMCVg8PhwP+aYCMUW0RlB/AWi7iGMzEODfZrrYpC7R8l1oq/
 h45G/7dgeDQ4xaiUdyD9BZIZ+nJg32JsUEutMAAK2MJ/XwXqnE0b9T6DT
 QWGwG3RuwSjsZiA3SyG2KI+rXnTumDMV3L+vW/f6jfjXRsSG/K1z6O7Ya Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4664247"
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; 
   d="scan'208";a="4664247"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:40:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,107,1708416000"; d="scan'208";a="10675538"
Received: from tofferse-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.33.212])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 12:40:05 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 4/6] drm/modes: switch to drm device based error logging
Date: Thu,  7 Mar 2024 22:39:36 +0200
Message-Id: <6cfc5b03385235a6a1bb113c6c506e089aa4dc97.1709843865.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709843865.git.jani.nikula@intel.com>
References: <cover.1709843865.git.jani.nikula@intel.com>
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

Prefer drm_err() over DRM_ERROR().

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_modes.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/drm_modes.c b/drivers/gpu/drm/drm_modes.c
index 0fff5a8d4d81..bf0f745dd9bd 100644
--- a/drivers/gpu/drm/drm_modes.c
+++ b/drivers/gpu/drm/drm_modes.c
@@ -386,8 +386,8 @@ static int fill_analog_mode(struct drm_device *dev,
 	if (!bt601 &&
 	    (hact_duration_ns < params->hact_ns.min ||
 	     hact_duration_ns > params->hact_ns.max)) {
-		DRM_ERROR("Invalid horizontal active area duration: %uns (min: %u, max %u)\n",
-			  hact_duration_ns, params->hact_ns.min, params->hact_ns.max);
+		drm_err(dev, "Invalid horizontal active area duration: %uns (min: %u, max %u)\n",
+			hact_duration_ns, params->hact_ns.min, params->hact_ns.max);
 		return -EINVAL;
 	}
 
@@ -398,8 +398,8 @@ static int fill_analog_mode(struct drm_device *dev,
 	if (!bt601 &&
 	    (hblk_duration_ns < params->hblk_ns.min ||
 	     hblk_duration_ns > params->hblk_ns.max)) {
-		DRM_ERROR("Invalid horizontal blanking duration: %uns (min: %u, max %u)\n",
-			  hblk_duration_ns, params->hblk_ns.min, params->hblk_ns.max);
+		drm_err(dev, "Invalid horizontal blanking duration: %uns (min: %u, max %u)\n",
+			hblk_duration_ns, params->hblk_ns.min, params->hblk_ns.max);
 		return -EINVAL;
 	}
 
@@ -410,8 +410,8 @@ static int fill_analog_mode(struct drm_device *dev,
 	if (!bt601 &&
 	    (hslen_duration_ns < params->hslen_ns.min ||
 	     hslen_duration_ns > params->hslen_ns.max)) {
-		DRM_ERROR("Invalid horizontal sync duration: %uns (min: %u, max %u)\n",
-			  hslen_duration_ns, params->hslen_ns.min, params->hslen_ns.max);
+		drm_err(dev, "Invalid horizontal sync duration: %uns (min: %u, max %u)\n",
+			hslen_duration_ns, params->hslen_ns.min, params->hslen_ns.max);
 		return -EINVAL;
 	}
 
@@ -422,7 +422,8 @@ static int fill_analog_mode(struct drm_device *dev,
 	if (!bt601 &&
 	    (porches_duration_ns > (params->hfp_ns.max + params->hbp_ns.max) ||
 	     porches_duration_ns < (params->hfp_ns.min + params->hbp_ns.min))) {
-		DRM_ERROR("Invalid horizontal porches duration: %uns\n", porches_duration_ns);
+		drm_err(dev, "Invalid horizontal porches duration: %uns\n",
+			porches_duration_ns);
 		return -EINVAL;
 	}
 
@@ -444,8 +445,8 @@ static int fill_analog_mode(struct drm_device *dev,
 	if (!bt601 &&
 	    (hfp_duration_ns < params->hfp_ns.min ||
 	     hfp_duration_ns > params->hfp_ns.max)) {
-		DRM_ERROR("Invalid horizontal front porch duration: %uns (min: %u, max %u)\n",
-			  hfp_duration_ns, params->hfp_ns.min, params->hfp_ns.max);
+		drm_err(dev, "Invalid horizontal front porch duration: %uns (min: %u, max %u)\n",
+			hfp_duration_ns, params->hfp_ns.min, params->hfp_ns.max);
 		return -EINVAL;
 	}
 
@@ -456,8 +457,8 @@ static int fill_analog_mode(struct drm_device *dev,
 	if (!bt601 &&
 	    (hbp_duration_ns < params->hbp_ns.min ||
 	     hbp_duration_ns > params->hbp_ns.max)) {
-		DRM_ERROR("Invalid horizontal back porch duration: %uns (min: %u, max %u)\n",
-			  hbp_duration_ns, params->hbp_ns.min, params->hbp_ns.max);
+		drm_err(dev, "Invalid horizontal back porch duration: %uns (min: %u, max %u)\n",
+			hbp_duration_ns, params->hbp_ns.min, params->hbp_ns.max);
 		return -EINVAL;
 	}
 
@@ -508,8 +509,8 @@ static int fill_analog_mode(struct drm_device *dev,
 
 	vtotal = vactive + vfp + vslen + vbp;
 	if (params->num_lines != vtotal) {
-		DRM_ERROR("Invalid vertical total: %upx (expected %upx)\n",
-			  vtotal, params->num_lines);
+		drm_err(dev, "Invalid vertical total: %upx (expected %upx)\n",
+			vtotal, params->num_lines);
 		return -EINVAL;
 	}
 
-- 
2.39.2

