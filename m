Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08525852924
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:41:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0294F10E8AB;
	Tue, 13 Feb 2024 06:41:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aYW/p67Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A9A10E891;
 Tue, 13 Feb 2024 06:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806473; x=1739342473;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XuktVCu169jLPhMivaiIJajr+NMwpwOfAyYRpodR8K0=;
 b=aYW/p67ZpeVQKn3wa/hZFkxEPLVtdjxbvQpZ0uEngMUBD+MH24D16kAJ
 kPzkvaqUG03lIk6vxQ9/CKISuVpVaioKwcMYdTmE63PcebJIbh+bBwjy3
 bSYRomf8M3Rd7Ya//fgkyw8de73QRESnmOnAJ/fWiOyFuZAywGmOkzT2J
 IuS16hW2mqoE7tvGB1fduT2lwTG7aMyH+r6H+0q8QzMaICoVql09UNG/h
 OGZx/1DxFioTlyZaYBc9AquOXAXthDdSw+3+S2OuiGMXTecuYle17bALO
 6WpA5N5w2Dbymt46Yr+Q7OZ5tCb7Rmc5sxxqyAngTL/UZyAqzprXcqO+O w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436947754"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436947754"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:41:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450248"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:41:06 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, arthurgrillo@riseup.net, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com, sean@poorly.run,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 06/28] drm: Add Enhanced LUT precision structure
Date: Tue, 13 Feb 2024 12:18:13 +0530
Message-ID: <20240213064835.139464-7-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240213064835.139464-1-uma.shankar@intel.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
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

Existing LUT precision structure is having only 16 bit
precision. This is not enough for upcoming enhanced hardwares
and advance usecases like HDR processing. Hence added a new
structure with 32 bit precision values.

Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 include/drm/drm_color_mgmt.h | 23 +++++++++++++++++++++++
 include/uapi/drm/drm_mode.h  | 17 +++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index ed81741036d7..72a08b5f7d14 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -50,6 +50,29 @@ static inline u32 drm_color_lut_extract(u32 user_input, int bit_precision)
 					 (1 << 16) - 1);
 }
 
+/* TODO: Add uapi documentation
+ * Added to accommodate enhanced LUT precision.
+ * Max LUT precision is 32 bits.
+ */
+static inline u64 drm_color_lut_extract_ext(u64 user_input, u32 bit_precision)
+{
+	u64 val = user_input & 0xffffffff;
+	u32 max;
+
+	if (bit_precision > 32)
+		return 0;
+
+	max = 0xffffffff >> (32 - bit_precision);
+	/* Round only if we're not using full precision. */
+	if (bit_precision < 32) {
+		val += 1UL << (32 - bit_precision - 1);
+		val >>= 32 - bit_precision;
+	}
+
+	return ((user_input & 0xffffffff00000000) |
+		clamp_val(val, 0, max));
+}
+
 u64 drm_color_ctm_s31_32_to_qm_n(u64 user_input, u32 m, u32 n);
 
 void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 68696253867e..bbc5be97c80f 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -866,6 +866,23 @@ struct drm_color_lut {
 	__u16 reserved;
 };
 
+/**
+ * struct drm_color_lut_ext - Represents high precision lut values
+ *
+ * Creating 64 bit palette entries for better data
+ * precision. This will be required for HDR and
+ * similar color processing usecases.
+ */
+struct drm_color_lut_ext {
+	/*
+	 * Data is U32.32 fixed point format.
+	 */
+	__u64 red;
+	__u64 green;
+	__u64 blue;
+	__u64 reserved;
+};
+
 enum drm_colorop_type {
 	DRM_COLOROP_1D_CURVE,
 	DRM_COLOROP_CTM_3X3,
-- 
2.42.0

