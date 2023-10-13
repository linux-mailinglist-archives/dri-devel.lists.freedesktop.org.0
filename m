Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3E27C8683
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 15:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 036D210E614;
	Fri, 13 Oct 2023 13:14:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C44410E614;
 Fri, 13 Oct 2023 13:14:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697202865; x=1728738865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Qr59Yi24PHiUnxx/s+d240/+MYyFwfb7z75KJdz2jiQ=;
 b=LzGEsBBgV9Thfdrr8L215+FPhFSNK6gR+vSuOYWShn3KiLJLgyQmc/Sx
 6kXGYA60eX/8ZPqQwNJxYGwSEhRs6O68j0nkF5PuMQ4GozbIcxzU3l+co
 Tuqo5MjqOfmM0yzHCsioYDmWuphxF1mh4g8GqhwCNSMprLeUFbg/4S7oe
 qx4db4KSkOsaMwcDOhDthqooMxz50oszCWkzM/C1YWqk4Txb0J6K+hMOB
 mzi0hn5vHhKWlsS7Kzma6QgD4Lt42h1bxixNQus+fOcynYJVgNF30GLp3
 x887d4vgelYRUMx+kThSDw5DI8/5ctr3eRlOzQuwHD5skg1J/ngMdF/DW A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="416230687"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="416230687"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2023 06:14:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10862"; a="878541853"
X-IronPort-AV: E=Sophos;i="6.03,222,1694761200"; d="scan'208";a="878541853"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga004.jf.intel.com with SMTP; 13 Oct 2023 06:14:16 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Oct 2023 16:14:15 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915: Fix glk+ degamma LUT conversions
Date: Fri, 13 Oct 2023 16:14:02 +0300
Message-ID: <20231013131402.24072-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231013131402.24072-1-ville.syrjala@linux.intel.com>
References: <20231013131402.24072-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The current implementation of change_lut_val_precision() is just
a convoluted way of shifting by 8. Implement the proper rounding
by just using drm_color_lut_extract() and intel_color_lut_pack()
like everyone else does.

And as the uapi can't handle >=1.0 values but the hardware
can we need to clamp the results appropriately in the readout
path.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 54 +++++++++++-----------
 1 file changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index a4b30614bd63..1cfbb3650304 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -1526,14 +1526,27 @@ static int glk_degamma_lut_size(struct drm_i915_private *i915)
 		return 35;
 }
 
-/*
- * change_lut_val_precision: helper function to upscale or downscale lut values.
- * Parameters 'to' and 'from' needs to be less than 32. This should be sufficient
- * as currently there are no lut values exceeding 32 bit.
- */
-static u32 change_lut_val_precision(u32 lut_val, int to, int from)
+static u32 glk_degamma_lut(const struct drm_color_lut *color)
+{
+	return color->green;
+}
+
+static void glk_degamma_lut_pack(struct drm_color_lut *entry, u32 val)
+{
+	/* PRE_CSC_GAMC_DATA is 3.16, clamp to 0.16 */
+	entry->red = entry->green = entry->blue = min(val, 0xffffu);
+}
+
+static u32 mtl_degamma_lut(const struct drm_color_lut *color)
+{
+	return drm_color_lut_extract(color->green, 24);
+}
+
+static void mtl_degamma_lut_pack(struct drm_color_lut *entry, u32 val)
 {
-	return mul_u32_u32(lut_val, (1 << to)) / (1 << from);
+	/* PRE_CSC_GAMC_DATA is 3.24, clamp to 0.16 */
+	entry->red = entry->green = entry->blue =
+		intel_color_lut_pack(min(val, 0xffffffu), 24);
 }
 
 static void glk_load_degamma_lut(const struct intel_crtc_state *crtc_state,
@@ -1570,20 +1583,16 @@ static void glk_load_degamma_lut(const struct intel_crtc_state *crtc_state,
 		 * ToDo: Extend to max 7.0. Enable 32 bit input value
 		 * as compared to just 16 to achieve this.
 		 */
-		u32 lut_val;
-
-		if (DISPLAY_VER(i915) >= 14)
-			lut_val = change_lut_val_precision(lut[i].green, 24, 16);
-		else
-			lut_val = lut[i].green;
-
 		ilk_lut_write(crtc_state, PRE_CSC_GAMC_DATA(pipe),
-			      lut_val);
+			      DISPLAY_VER(i915) >= 14 ?
+			      mtl_degamma_lut(&lut[i]) : glk_degamma_lut(&lut[i]));
 	}
 
 	/* Clamp values > 1.0. */
 	while (i++ < glk_degamma_lut_size(i915))
-		ilk_lut_write(crtc_state, PRE_CSC_GAMC_DATA(pipe), 1 << 16);
+		ilk_lut_write(crtc_state, PRE_CSC_GAMC_DATA(pipe),
+			      DISPLAY_VER(i915) >= 14 ?
+			      1 << 24 : 1 << 16);
 
 	ilk_lut_write(crtc_state, PRE_CSC_GAMC_INDEX(pipe), 0);
 }
@@ -3573,17 +3582,10 @@ static struct drm_property_blob *glk_read_degamma_lut(struct intel_crtc *crtc)
 	for (i = 0; i < lut_size; i++) {
 		u32 val = intel_de_read_fw(dev_priv, PRE_CSC_GAMC_DATA(pipe));
 
-		/*
-		 * For MTL and beyond, convert back the 24 bit lut values
-		 * read from HW to 16 bit values to maintain parity with
-		 * userspace values
-		 */
 		if (DISPLAY_VER(dev_priv) >= 14)
-			val = change_lut_val_precision(val, 16, 24);
-
-		lut[i].red = val;
-		lut[i].green = val;
-		lut[i].blue = val;
+			mtl_degamma_lut_pack(&lut[i], val);
+		else
+			glk_degamma_lut_pack(&lut[i], val);
 	}
 
 	intel_de_write_fw(dev_priv, PRE_CSC_GAMC_INDEX(pipe),
-- 
2.41.0

