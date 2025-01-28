Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01673A20DE9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 17:06:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701EA10E6AB;
	Tue, 28 Jan 2025 16:06:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E+okObu3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFC4110E6B7;
 Tue, 28 Jan 2025 16:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738080361; x=1769616361;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=ia+sh2CQwce45X1pCiIjAZyP9C4WGk7gW7FRcb6u2S8=;
 b=E+okObu3wnT8ibOR++lyaXAlvN+bwOUyryu2qMktODgMioY4ehhV/ndx
 eli7G9na0BPUmDgk33SEiam00nOvtlQsKGitkuhnZg+eDxDe2rFG6+Tbi
 TDvH0vXwO2YiTKsvSQjDihcTGX23r5eJvpHAcwSxVjj4qICKpFKZJ9GDj
 kP6MGD7uhI0mT5NCx8ti0eIj882HnyqUdWBy9+UQT6h1mjy4gvDV6Ebsb
 70lAO/0LSLHKD8Q1pcq7+JMdgjL2vmHbyWdtmMjKXyQ/wwMFR/BB85HhM
 7YgTodcqvi3bFLdNIxUoPREa44YSSsclV6kOXSkDv/y8P0P7LsX/Apo/s Q==;
X-CSE-ConnectionGUID: /kJyrDAbQo2KBI9qBkeExw==
X-CSE-MsgGUID: FUQI8IH9R6CbkIEML/bIdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38745002"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="38745002"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 08:06:01 -0800
X-CSE-ConnectionGUID: CoIglWB1Srqz2MRmEsMa3w==
X-CSE-MsgGUID: 1wQlZBQ/Qli27WIwhL1xfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145976889"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 28 Jan 2025 08:05:58 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 28 Jan 2025 21:21:08 +0530
Subject: [PATCH v8 02/14] drm: Define ImageEnhancemenT LUT structures
 exposed to user
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-dpst-v8-2-871b94d777f8@intel.com>
References: <20250128-dpst-v8-0-871b94d777f8@intel.com>
In-Reply-To: <20250128-dpst-v8-0-871b94d777f8@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
Cc: suraj.kandpal@intel.com, dmitry.baryshkov@linaro.org, 
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

v8: define enum for iet_mode, add more doc for iet modes (Dmitry)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 include/uapi/drm/drm_mode.h | 68 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index b8b7b18843ae7224263a9c61b20ac6cbf5df69e9..006be62218bf1e985c2ca6352cb04110a38d1e84 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1420,6 +1420,74 @@ struct drm_histogram {
 	__u32 nr_elements;
 };
 
+/**
+ * enum drm_iet_mode
+ * @DRM_MODE_IET_LOOKUP_LUT:
+ * LUT values are points on exponential graph with x axis and y-axis y=f(x)
+ * This f(x) can be the algorithm, defined by the user space algorithm.
+ * When this LUT table is passed to the hardware it signifies how the hardware
+ * should use this table to get the LUT values. In this mode its direct lookup
+ * table. x-axis corresponds to input pixel value and y-axis corresponds to
+ * the output pixel value.
+ *
+ * @DRM_MODE_IET_MULTIPLICATIVE:
+ * LUT values, x and y are points on negative exponential graph with
+ * x-axis and y-axis (y = y/x). The value passed by the user will be
+ * in y/x i.e OutPixel/InPixel. X co-ordinate proportional to pixel value
+ * and Y-cordinate is the multiplier factor, i.e x-axis in pixels and
+ * y-axis is OutPixel/InPixel. so upon multiplying x, y is obtained,
+ * hence multiplicative.
+ * The format of LUT can at max be 8.24(8integer 24 fractional)
+ * represented by u32. 32bit is the container and if 16.16 is chosen
+ * then it doesn't make sense to boost the pixel by 2^16. Hence set aside
+ * 8bit for integer 2^8 thereby boosting the pixel by a value 255 which
+ * itself is a huge boost factor. Remaining 24bits out of the 32bit
+ * container is fractional part. This is also optimal for implementing
+ * in the hardware.
+ * Depending on the hardware capability and exponent mantissa can be
+ * chosen within this limits.
+ */
+enum drm_iet_mode {
+	DRM_MODE_IET_LOOKUP_LUT = 0x01,
+	DRM_MODE_IET_MULTIPLICATIVE = 0x02,
+};
+
+/**
+ * struct drm_iet_caps
+ *
+ * @iet_mode: pixel factor enhancement modes defined in enum drm_iet_mode.
+ *	      Multiple modes can be supported by hardware, the value can be
+ *	      ORed.
+ * @iet_sample_format: holds the address of an array of u32 LUT sample formats
+ *		       depending on the hardware capability. Max being 8.24
+ *		       Doing a bitwise AND will get the present sample.
+ *		       Ex: for 1 integer 9 fraction AND with 0x10001FF
+ * @nr_iet_sample_formats: number of iet_sample_formsts supported by the
+ *			   hardware
+ * @nr_iet_lut_entries: number of LUT entries
+ */
+struct drm_iet_caps {
+	__u32 iet_mode;
+	__u64 iet_sample_format;
+	__u32 nr_iet_sample_formats;
+	__u32 nr_iet_lut_entries;
+};
+
+/**
+ * struct drm_iet_1dlut_sample
+ * @iet_lut: the address in the field describes the format of the data
+ *		corresponding to the @iet_mode
+ *		In case of direct lookup this is NULL, in case of
+ *		multiplicative mode LUT exponent and mantissa format.
+ * @nr_elements: number of entries pointed by the data @iet_lut
+ * @iet_mode: image enhancement mode, this will also convey the channel.
+ */
+struct drm_iet_1dlut_sample {
+	__u64 iet_lut;
+	__u32 nr_elements;
+	enum drm_iet_mode iet_mode;
+};
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.25.1

