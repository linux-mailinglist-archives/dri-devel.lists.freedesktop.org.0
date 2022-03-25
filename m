Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 707274E7359
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 13:25:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CA8E10E2BE;
	Fri, 25 Mar 2022 12:25:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B1610E238;
 Fri, 25 Mar 2022 12:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648211143; x=1679747143;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fzqvpg4OZUaJ64mtYvTGQ6kfUZTilDoXavWz4StEOEI=;
 b=O52kWEPDCRnkP4aslKVaTuNzgvgBJrwOITBMUhwPzWH9DMMSQX+KhoZO
 EOSwNTtx7kTwkwmc7jZhW5yD3Mg+zj3crdV2ofZ+BJeV/v7jcs2ML7KOg
 IDwwH8dVDtw012mIzkTV+4GRuPFA/vlv4haliF/nyXVkex/it3B1Kfb9I
 xDqFTwY70WFF386GgV1/wY/7iELa1vIu0DLPEoi/5yGIv5KT1QBx+lXZU
 D7Hce5rzDInareKVWPkyJjWahRuBB4mlWhQieVzAab/m4t4H7+c6hSruz
 /ncOh6NhtQcL5CNG4VM4sIT+VuURe4DqQ7k0Qxxk9awuhTxsGZgA5JIqy Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10296"; a="321816079"
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="321816079"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 05:25:42 -0700
X-IronPort-AV: E=Sophos;i="5.90,209,1643702400"; d="scan'208";a="520186098"
Received: from avgorshk-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.35.183])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Mar 2022 05:25:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/9] drm/edid: don't modify EDID while parsing
Date: Fri, 25 Mar 2022 14:25:23 +0200
Message-Id: <aafe62385024e5975b811a90a0906d4b52058785.1648210803.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648210803.git.jani.nikula@intel.com>
References: <cover.1648210803.git.jani.nikula@intel.com>
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

