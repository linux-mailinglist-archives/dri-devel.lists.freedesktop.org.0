Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF0EA080FF
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 21:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1266810EFB5;
	Thu,  9 Jan 2025 20:00:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZkHCUTL1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D5810EFAE;
 Thu,  9 Jan 2025 20:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736452855; x=1767988855;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=zovJiXw/+qjYeUeIzoA3uvt9efrd53AhsF/iE6fhaW4=;
 b=ZkHCUTL1ydzxNbCDiEAg15XxSeb0OMbI69ro+BlTvCzoTHL76EY5UY2Z
 QwTKyFKu6q8v41pct7uQkPQ3CNNjkJL4mV4MF6UpY+J77UVXs+X2GewOK
 ZrqNMmfUnLoNSPjvtOV+sNGWTUtVaY9iX+oCU+0rHPseh7A8sr8jObOrA
 zIBYbFthJKWbFKQgDxo8ygOYBuhIDXmuzEdPL0eLNWkna4KSw/VIH+6qs
 e2VqJvriMAicLDn8FU+ONMUvigYfwgf8jvOWAShWRHQedYHDn2ub5dkRR
 pOQLkowe68jHqqK5MUowe8xKGi8Qd/77IqRhYQRr0EiQJg13j6L1DTQVd w==;
X-CSE-ConnectionGUID: 5BfN1y1KT7izmeKuabZb+g==
X-CSE-MsgGUID: tR5FsY3YSYWAZlul1NlzVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36619178"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="36619178"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 12:00:55 -0800
X-CSE-ConnectionGUID: m1v2RPRjRcO6dxrReiybrQ==
X-CSE-MsgGUID: XOHv95RPSfSLBmTsVDLBrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126798577"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2025 12:00:51 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Fri, 10 Jan 2025 01:15:30 +0530
Subject: [PATCH v7 02/14] drm: Define ImageEnhancemenT LUT structures
 exposed to user
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-dpst-v7-2-605cb0271162@intel.com>
References: <20250110-dpst-v7-0-605cb0271162@intel.com>
In-Reply-To: <20250110-dpst-v7-0-605cb0271162@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: dmitry.baryshkov@linaro.org, suraj.kandpal@intel.com, 
 uma.shankar@intel.com, 
 "Imported from f20241218-dpst-v7-0-81bfe7d08c2d"@intel.com, 
 20240705091333.328322-1-mohammed.thasleem@intel.com, 
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
 include/uapi/drm/drm_mode.h | 50 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 7a7039381142bb5dba269bdaec42c18be34e2d05..056c2efef1589848034afc0089f1838c2547bcf8 100644
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
@@ -1414,6 +1425,45 @@ struct drm_histogram {
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
+ * @nr_iet_sample_formats: number of iet_sample_formsts supported by the
+ *			   hardware
+ * @nr_iet_lut_entries: number of LUT entries
+ */
+struct drm_iet_caps {
+	__u8 iet_mode;
+	u64 iet_sample_format;
+	__u32 nr_iet_sample_formats;
+	__u32 nr_iet_lut_entries;
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

