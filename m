Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 270029D9842
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:20:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AB210E883;
	Tue, 26 Nov 2024 13:20:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nIJ3iyaJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2A4F10E406;
 Tue, 26 Nov 2024 13:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732627204; x=1764163204;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=AuoVA4U+NRuRoB7mtQHoXrlg4jcfUs1t28r2Uui0j8M=;
 b=nIJ3iyaJnY2aGP8kOxebhiNvZTPH5kxse3Z7iTCr51yNhOP3dWldw1iy
 ZzYG4EUqn00Iu6by2S5JC+5XMgOf1osa+uskvw++Bxl+RArLjc1M0Pe5C
 vhjJMtfzsanXjQ5oVyuP3d5gkQDR/ghMqjVVrX4BEba5dDXY80w0IUMxt
 mX4SIRqKlJL9bTwOzaNTIhGZbvts9Kvece0hvdeWSDwbDxDdvEtvcSpTb
 eW79F4wyLTqwBQcDYn72XOaqfha7DvVgfIm5dTM2AqRubZwaHY5GIo5eJ
 YhvtPJSikjx3AjFpAUggN8OEX5xVWYUhTTs+oHTotVdlcXlv7u8ALhcOv w==;
X-CSE-ConnectionGUID: 9foOAuS8SSOLh3OqCNfslA==
X-CSE-MsgGUID: gNPfbH6rTTiUTG8Hb795/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44170155"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="44170155"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 05:20:02 -0800
X-CSE-ConnectionGUID: apHUnm+KTYGptUNvpmPlhQ==
X-CSE-MsgGUID: cou5xh2KS8mDLEIW/ZcJ1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="114874651"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 05:19:57 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 08/25] drm: Define helper for adding capability property for 1D
 LUT MULTSEG
Date: Tue, 26 Nov 2024 18:57:13 +0530
Message-ID: <20241126132730.1192571-9-uma.shankar@intel.com>
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

This adds helper functions to create 1D multi-segmented Lut color block
capabilities. It exposes the hardware block as segments
which are converted to blob and passed in the property.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/drm_colorop.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index 8563953ec9cf..111517c08216 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -83,7 +83,6 @@ static const struct drm_prop_enum_list drm_colorop_lut1d_interpolation_list[] =
 };
 
 /* Init Helpers */
-__maybe_unused
 static int drm_create_colorop_capability_prop(struct drm_device *dev,
 					      struct drm_colorop *colorop,
 					      struct drm_property_blob *blob)
@@ -105,6 +104,29 @@ static int drm_create_colorop_capability_prop(struct drm_device *dev,
 	return 0;
 }
 
+__maybe_unused
+static int drm_colorop_lutcaps_init(struct drm_colorop *colorop,
+				    struct drm_plane *plane,
+				    const struct drm_color_lut_range *ranges,
+				    size_t length)
+{
+	struct drm_device *dev = plane->dev;
+	struct drm_property_blob *blob;
+
+	/* Create Color Caps property for multi-segmented 1D LUT */
+	if (colorop->type != DRM_COLOROP_1D_LUT_MULTSEG)
+		return -EINVAL;
+
+	if (WARN_ON(length == 0 || length % sizeof(ranges[0]) != 0))
+		return -EINVAL;
+
+	blob = drm_property_create_blob(plane->dev, length, ranges);
+	if (IS_ERR(blob))
+		return PTR_ERR(blob);
+
+	return drm_create_colorop_capability_prop(dev, colorop, blob);
+}
+
 static int drm_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
 			    struct drm_plane *plane, enum drm_colorop_type type,
 			    bool allow_bypass)
-- 
2.42.0

