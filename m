Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E59D4E99B2
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 16:34:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4EB510E4C8;
	Mon, 28 Mar 2022 14:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECE0110E4C8;
 Mon, 28 Mar 2022 14:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648478089; x=1680014089;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=35R2Vq1xT3Kgqzlcgy1x5Zhl6wBdMkBU4RTO1exJPo8=;
 b=hIADfmB3lmGdzvz7CY3Akg7kUxWGtEeXB/57xPulMM29fkNIz6ew/qOL
 febWIR3g9iqaJpvUy/gJaf2SnU3w+kAF6aK0qZQgu6PEDTj+0+OD152ij
 YKAt8itlmkaH+vFWFH/xMW15v/e9s1wxdav/I1TtvADG8wOeTM+9vcRWX
 ZYtMxCIpmDScOYFkghvnucHW1WalKCzHzgNhCA6hZ1G9D40fIQIXSjEhy
 9m0g3y8vx/OHMomYAGLMqTIE6M3x7x4F+WFf9OITdJBgJjBSi8T/JPGWe
 3lmtbl6gX6UWKOlNHhb910Qx3RpOm1b+988KL77YC6syG3TdyMZW8g0ws Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="238943440"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="238943440"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 07:34:49 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="545979906"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 07:34:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 01/12] drm/edid: don't modify EDID while parsing
Date: Mon, 28 Mar 2022 17:34:22 +0300
Message-Id: <45d5cf067eaad49b321ac82836090d9de524374e.1648477901.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648477901.git.jani.nikula@intel.com>
References: <cover.1648477901.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We'll want to keep the EDID immutable while parsing. Stop modifying the
EDID because of the quirks.

In theory, this does have userspace implications, but the userspace is
supposed to use the modes exposed via KMS API, not by parsing the EDID
directly.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index cc7bd58369df..1b552fe54f38 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2740,9 +2740,9 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
 		return NULL;
 
 	if (quirks & EDID_QUIRK_135_CLOCK_TOO_HIGH)
-		timing->pixel_clock = cpu_to_le16(1088);
-
-	mode->clock = le16_to_cpu(timing->pixel_clock) * 10;
+		mode->clock = 1088 * 10;
+	else
+		mode->clock = le16_to_cpu(timing->pixel_clock) * 10;
 
 	mode->hdisplay = hactive;
 	mode->hsync_start = mode->hdisplay + hsync_offset;
@@ -2763,14 +2763,14 @@ static struct drm_display_mode *drm_mode_detailed(struct drm_device *dev,
 	drm_mode_do_interlace_quirk(mode, pt);
 
 	if (quirks & EDID_QUIRK_DETAILED_SYNC_PP) {
-		pt->misc |= DRM_EDID_PT_HSYNC_POSITIVE | DRM_EDID_PT_VSYNC_POSITIVE;
+		mode->flags |= DRM_MODE_FLAG_PHSYNC | DRM_MODE_FLAG_PVSYNC;
+	} else {
+		mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
+			DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
+		mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
+			DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
 	}
 
-	mode->flags |= (pt->misc & DRM_EDID_PT_HSYNC_POSITIVE) ?
-		DRM_MODE_FLAG_PHSYNC : DRM_MODE_FLAG_NHSYNC;
-	mode->flags |= (pt->misc & DRM_EDID_PT_VSYNC_POSITIVE) ?
-		DRM_MODE_FLAG_PVSYNC : DRM_MODE_FLAG_NVSYNC;
-
 set_size:
 	mode->width_mm = pt->width_mm_lo | (pt->width_height_mm_hi & 0xf0) << 4;
 	mode->height_mm = pt->height_mm_lo | (pt->width_height_mm_hi & 0xf) << 8;
-- 
2.30.2

