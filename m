Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1CF9D9843
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:20:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B24610E893;
	Tue, 26 Nov 2024 13:20:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vr5H8N5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A457C10E406;
 Tue, 26 Nov 2024 13:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732627206; x=1764163206;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zXJOnJ+ydwCLUm1ahNcP3eWqJbbSNOzgsZgSQ3HEw0s=;
 b=Vr5H8N5A5hHlxfOk2ixnnk3n9rlf1Dnq/8Gj5l6BHTpwXTAKAGoDKWGu
 jkV/GfifeoA7CmANMak/Ej2HfQ13TikZ/QOx89erXLztEsfycA1wRg4J8
 yZ6Lf6yTEVdAKmO1GpbdMHJSfgRJPxS0HzsKDo2mDbmdSwXDOOOqivinS
 yMCx2Y1BbZiE+QVNqzJrmkiU7T5G0P9xw3EIKBzb1VVOUgbNEiV8s+PmS
 mp8jvV6g7Mt2EBskqo8zKvIQASyEeo43n/45+nrlQmP/7XJPT0Fz7yx0L
 ViQbgQOz1D4Nys0zRgiHgQsHxnNTh/6wkw4vPjreynjXvl32bkpC22PZ+ w==;
X-CSE-ConnectionGUID: ySv0V3cZSW2bpyR6QP8rKQ==
X-CSE-MsgGUID: CMzOY7YhT6Cq/9hrPM3z2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44170181"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="44170181"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 05:20:05 -0800
X-CSE-ConnectionGUID: 55y5iyLHRcqLv00VicJ7tw==
X-CSE-MsgGUID: vd/juZMCT9yW+zEbhw/zRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="114874676"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 05:20:01 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 09/25] drm: Add helper to initialize segmented 1D LUT
Date: Tue, 26 Nov 2024 18:57:14 +0530
Message-ID: <20241126132730.1192571-10-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241126132730.1192571-1-uma.shankar@intel.com>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
MIME-Version: 1.0
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Add helper to initialize 1D segmented LUT

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_colorop.c | 27 ++++++++++++++++++++++++++-
 include/drm/drm_colorop.h     |  4 ++++
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 111517c08216..871d5660e3b2 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -104,7 +104,6 @@ static int drm_create_colorop_capability_prop(struct drm_device *dev,
 	return 0;
 }
 
-__maybe_unused
 static int drm_colorop_lutcaps_init(struct drm_colorop *colorop,
 				    struct drm_plane *plane,
 				    const struct drm_color_lut_range *ranges,
@@ -338,6 +337,32 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
 }
 EXPORT_SYMBOL(drm_colorop_curve_1d_lut_init);
 
+int drm_colorop_curve_1d_lut_multseg_init(struct drm_device *dev, struct drm_colorop *colorop,
+					  struct drm_plane *plane,
+					  const struct drm_color_lut_range *ranges,
+					  size_t length, bool allow_bypass)
+{
+	int ret;
+
+	ret = drm_colorop_init(dev, colorop, plane, DRM_COLOROP_1D_LUT_MULTSEG, allow_bypass);
+	if (ret)
+		return ret;
+
+	ret = drm_colorop_lutcaps_init(colorop, plane, ranges, length);
+	if (ret)
+		return ret;
+
+	/* data */
+	ret = drm_colorop_create_data_prop(dev, colorop);
+	if (ret)
+		return ret;
+
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_colorop_curve_1d_lut_multseg_init);
+
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane, bool allow_bypass)
 {
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index 58e5b87c6d56..9268fffd04f6 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -391,6 +391,10 @@ int drm_colorop_curve_1d_lut_init(struct drm_device *dev, struct drm_colorop *co
 				  bool allow_bypass);
 int drm_colorop_ctm_3x3_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane, bool allow_bypass);
+int drm_colorop_curve_1d_lut_multseg_init(struct drm_device *dev, struct drm_colorop *colorop,
+					  struct drm_plane *plane,
+					  const struct drm_color_lut_range *ranges,
+					  size_t length, bool allow_bypass);
 int drm_colorop_ctm_3x4_init(struct drm_device *dev, struct drm_colorop *colorop,
 			     struct drm_plane *plane, bool allow_bypass);
 int drm_colorop_mult_init(struct drm_device *dev, struct drm_colorop *colorop,
-- 
2.42.0

