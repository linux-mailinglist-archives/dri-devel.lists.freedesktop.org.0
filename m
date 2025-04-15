Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22230A897A4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Apr 2025 11:13:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A07F10E69F;
	Tue, 15 Apr 2025 09:13:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K9VcQAA6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0288D10E69F;
 Tue, 15 Apr 2025 09:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744708434; x=1776244434;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8boI1O0/ygvLcveICd5XdQD7uaqv+cIr50SWRQOrPb0=;
 b=K9VcQAA6/6ZCne4t200b0Pwk4c+NG05g/C6ft4Z7emKLxnRuVe/BdXTk
 /a6BkTl8SEHUXStZIZjkhAxGZ6el8tsQzRNS0IZpwLnupy8nLNlYNk6rB
 oywEgFS+mNWIlb7srfBoIooZ98oC6ctaFgFimBThTNYsaHexJFOS5TKvg
 vgAoxt7j/wkjnOCTEEuVwB4kZ3GM2CAbhYCtF3GE4nXLUuimmvxq2v2El
 XEhSJgNfDsmtRaahZQsJISK2Ib822vyKDS49Hdfl0JQXzlxy8SjxU84jp
 6GilnLn1wJFQviU/QooeIObop7cWJUpc3bVm6VpBi8gRPSWSRWDKNSJz2 g==;
X-CSE-ConnectionGUID: vo+DhYQbTAW/E8MlP+bK1w==
X-CSE-MsgGUID: Wott6zHhS3uCjgLk+p84PA==
X-IronPort-AV: E=McAfee;i="6700,10204,11403"; a="46371175"
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="46371175"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 02:13:53 -0700
X-CSE-ConnectionGUID: Q8sMVxBLRbqvam7VJxB+fg==
X-CSE-MsgGUID: thQoAlnWQWardVWEEw9Pxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,213,1739865600"; d="scan'208";a="130596259"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.35])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2025 02:13:50 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, Egor Vorontsov <sdoregor@sdore.me>,
 Jani Nikula <jani.nikula@linux.intel.com>
Subject: [RESEND 2/2] drm/edid: Refactor DisplayID timing block structs
Date: Tue, 15 Apr 2025 12:13:31 +0300
Message-Id: <a7967d7884d48b15ca08ae78d687e73124f0ba04.1744708239.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1744708239.git.jani.nikula@intel.com>
References: <cover.1744708239.git.jani.nikula@intel.com>
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

From: Egor Vorontsov <sdoregor@sdore.me>

Using le16 instead of u8[2].

Suggested-by: Jani Nikula <jani.nikula@linux.intel.com>
Signed-off-by: Egor Vorontsov <sdoregor@sdore.me>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_displayid_internal.h | 18 +++++++--------
 drivers/gpu/drm/drm_edid.c               | 28 ++++++++++++------------
 2 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_displayid_internal.h b/drivers/gpu/drm/drm_displayid_internal.h
index 84831ecfdb6e..957dd0619f5c 100644
--- a/drivers/gpu/drm/drm_displayid_internal.h
+++ b/drivers/gpu/drm/drm_displayid_internal.h
@@ -115,20 +115,20 @@ struct displayid_tiled_block {
 struct displayid_detailed_timings_1 {
 	u8 pixel_clock[3];
 	u8 flags;
-	u8 hactive[2];
-	u8 hblank[2];
-	u8 hsync[2];
-	u8 hsw[2];
-	u8 vactive[2];
-	u8 vblank[2];
-	u8 vsync[2];
-	u8 vsw[2];
+	__le16 hactive;
+	__le16 hblank;
+	__le16 hsync;
+	__le16 hsw;
+	__le16 vactive;
+	__le16 vblank;
+	__le16 vsync;
+	__le16 vsw;
 } __packed;
 
 struct displayid_detailed_timing_block {
 	struct displayid_block base;
 	struct displayid_detailed_timings_1 timings[];
-};
+} __packed;
 
 struct displayid_formula_timings_9 {
 	u8 flags;
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 002aa0832763..eab5196140d7 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6760,23 +6760,23 @@ static void update_display_info(struct drm_connector *connector,
 }
 
 static struct drm_display_mode *drm_mode_displayid_detailed(struct drm_device *dev,
-							    struct displayid_detailed_timings_1 *timings,
+							    const struct displayid_detailed_timings_1 *timings,
 							    bool type_7)
 {
 	struct drm_display_mode *mode;
-	unsigned pixel_clock = (timings->pixel_clock[0] |
-				(timings->pixel_clock[1] << 8) |
-				(timings->pixel_clock[2] << 16)) + 1;
-	unsigned hactive = (timings->hactive[0] | timings->hactive[1] << 8) + 1;
-	unsigned hblank = (timings->hblank[0] | timings->hblank[1] << 8) + 1;
-	unsigned hsync = (timings->hsync[0] | (timings->hsync[1] & 0x7f) << 8) + 1;
-	unsigned hsync_width = (timings->hsw[0] | timings->hsw[1] << 8) + 1;
-	unsigned vactive = (timings->vactive[0] | timings->vactive[1] << 8) + 1;
-	unsigned vblank = (timings->vblank[0] | timings->vblank[1] << 8) + 1;
-	unsigned vsync = (timings->vsync[0] | (timings->vsync[1] & 0x7f) << 8) + 1;
-	unsigned vsync_width = (timings->vsw[0] | timings->vsw[1] << 8) + 1;
-	bool hsync_positive = (timings->hsync[1] >> 7) & 0x1;
-	bool vsync_positive = (timings->vsync[1] >> 7) & 0x1;
+	unsigned int pixel_clock = (timings->pixel_clock[0] |
+				    (timings->pixel_clock[1] << 8) |
+				    (timings->pixel_clock[2] << 16)) + 1;
+	unsigned int hactive = le16_to_cpu(timings->hactive) + 1;
+	unsigned int hblank = le16_to_cpu(timings->hblank) + 1;
+	unsigned int hsync = (le16_to_cpu(timings->hsync) & 0x7fff) + 1;
+	unsigned int hsync_width = le16_to_cpu(timings->hsw) + 1;
+	unsigned int vactive = le16_to_cpu(timings->vactive) + 1;
+	unsigned int vblank = le16_to_cpu(timings->vblank) + 1;
+	unsigned int vsync = (le16_to_cpu(timings->vsync) & 0x7fff) + 1;
+	unsigned int vsync_width = le16_to_cpu(timings->vsw) + 1;
+	bool hsync_positive = le16_to_cpu(timings->hsync) & (1 << 15);
+	bool vsync_positive = le16_to_cpu(timings->vsync) & (1 << 15);
 
 	mode = drm_mode_create(dev);
 	if (!mode)
-- 
2.39.5

