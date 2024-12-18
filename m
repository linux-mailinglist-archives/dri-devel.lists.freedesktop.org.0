Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 861169F6948
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 16:02:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05BC010EBE2;
	Wed, 18 Dec 2024 15:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IdHlGDjo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 067D610EBDE;
 Wed, 18 Dec 2024 15:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734534139; x=1766070139;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=19WMoyPDKAK2GPM23QvKPROYX3ABxskxqKN2tyspnnA=;
 b=IdHlGDjo7BLag9YmQqL01n5GMJxp6quhqyMubVxN+ZQ03t5Xr4Jrl490
 ziZvgeHVKglpwuj58OB9IW+5d7+JR6//JbRJp3SlagmKUSjmdrEYsKJH9
 tl8fXj26xirC34YSNtgyDNJFOtwcy+tT3J1+yVku8Fa7uuKG9yNfy+XwG
 /FxDzIzaHyc1L4+SC40PV8LJawBOsW3p6X01gLuTCgOQJvM2mQ4QhBQUp
 JQggxz6Rk5H+zfd1XgIMMGLfbVcFUi9riowctO0fNPGQL/xXNZTaLGiMt
 2sUrLuwN1h/rJu/7r0N6zQ+MDNRuKXtxW/EtZBh5T64J6fduff9yCK0WG w==;
X-CSE-ConnectionGUID: 4o3nda7KTU6deEj8xVvZjA==
X-CSE-MsgGUID: Wnc/TDCbQWmLGfYBL2jdqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="45502489"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="45502489"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 07:02:19 -0800
X-CSE-ConnectionGUID: lQ6v6g73Q6GoifuCcau7aA==
X-CSE-MsgGUID: TPHfgt0ERfu1S0ysZLuZsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102025442"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa003.fm.intel.com with ESMTP; 18 Dec 2024 07:02:16 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 18 Dec 2024 20:22:05 +0530
Subject: [PATCH v7 2/4] drm: Define ImageEnhancemenT LUT structures exposed
 to user
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-dpst-v7-2-81bfe7d08c2d@intel.com>
References: <20241218-dpst-v7-0-81bfe7d08c2d@intel.com>
In-Reply-To: <20241218-dpst-v7-0-81bfe7d08c2d@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: 20240705091333.328322-1-mohammed.thasleem@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

ImageEnhancemenT(IET) hardware interpolates the LUT value to generate
the enhanced output image. LUT takes an input value, outputs a new
value based on the data within the LUT. 1D LUT can remap individual
input values to new output values based on the LUT sample. LUT can be
interpolated by the hardware by multiple modes Ex: Direct Lookup LUT,
Multiplicative LUT etc
The list of supported mode by hardware along with the format(exponent
mantissa) is exposed to user by the iet_lut_caps property. Maximum
format being 8.24 i.e 8 exponent and 24 mantissa.
For illustration a hardware supporting 1.9 format denotes this as
0x10001FF. In order to know the exponent do a bitwise AND with
0xF000000. The LUT value to be provided by user would be a 10bit value
with 1 bit integer and 9 bit fractional value.

Multiple formats can be supported, hence pointer is used over here.
User can then provide the LUT with any one of the supported modes in
any of the supported formats.
The entries in the LUT can vary depending on the hardware capability
with max being 255. This will also be exposed as iet_lut_caps so user
can generate a LUT with the specified entries.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 include/uapi/drm/drm_mode.h | 46 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 7a7039381142bb5dba269bdaec42c18be34e2d05..34a6f48078fe7ff067002a459835c9af57d18848 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1367,6 +1367,17 @@ struct drm_mode_closefb {
  */
 #define DRM_MODE_HISTOGRAM_HSV_MAX_RGB			(1 << 0)
 
+/* LUT values are points on exponential graph with x axis and y-axis y=f(x) */
+#define DRM_MODE_IET_LOOKUP_LUT				(1 << 0)
+/*
+ * LUT values, points on negative exponential graph with x-axis and y-axis
+ * y = y/x so upon multiplying x, y is obtained, hence multiplicative. The
+ * format of LUT can at max be 8.24(8integer 24 fractional) represented by
+ * u32. Depending on the hardware capability and exponent mantissa can be
+ * chosen.
+ */
+#define DRM_MODE_IET_MULTIPLICATIVE			(1 << 1)
+
 /**
  * struct drm_histogram_caps
  *
@@ -1414,6 +1425,41 @@ struct drm_histogram {
 	__u32 nr_elements;
 };
 
+/**
+ * struct drm_iet_caps
+ *
+ * @iet_mode: pixel factor enhancement modes defined in the above macros
+ * @iet_sample_format: holds the address of an array of u32 LUT sample formats
+ *		       depending on the hardware capability. Max being 8.24
+ *		       Doing a bitwise AND will get the present sample.
+ *		       Ex: for 1 integer 9 fraction AND with 0x10001FF
+ */
+struct drm_iet_caps {
+	u8 iet_mode;
+	u64 iet_sample_format;
+	__u32 nr_iet_sample_formats;
+};
+
+/**
+ * struct drm_iet_1dlut_sample
+ * @iet_mode: image enhancement mode, this will also convey the channel.
+ * @iet_format: LUT exponent and mantissa format, max being 8.24
+ * @data_ptr: pointer to the array of values which is of type u32.
+ *	      1 channel: 10 bit corrected value and remaining bits are reserved.
+ *	      multi channel: pointer to struct drm_color_lut
+ * @nr_elements: number of entries pointed by the data @data_ptr
+ * @reserved: reserved for future use
+ * @reserved1: reserved for future use
+ */
+struct drm_iet_1dlut_sample {
+	__u8 iet_mode;
+	__u32 iet_format;
+	__u64 data_ptr;
+	__u32 nr_elements;
+	__u32 reserved;
+	__u32 reserved1;
+};
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.25.1

