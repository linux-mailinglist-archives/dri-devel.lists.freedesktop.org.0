Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D43FC961E8
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 09:29:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67EC410E2FA;
	Mon,  1 Dec 2025 08:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b1rbF5X2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6111710E304;
 Mon,  1 Dec 2025 08:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764577745; x=1796113745;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=38jN2P1e/P764YOEaLc4k84nhaYkfF92q6wZwDMQosY=;
 b=b1rbF5X2uIeJRHlFPrWyNTCX1ssQ7cR9kiqQCTb/QmVDpt2tTgaRiBx4
 MHAf3QTuvEO/ObPMM4N/ep/7WwV8zs2FfF1ujg+1y0dPyPkqQx000LVax
 N3LLM2Sb2hjE6r4mu13x+EfexVz+nkof+UiHrylUqjlOtgZcsdoixEmtl
 H86+jvJVZIP1Id6dIDuj2QrMkfj9vFbVeAgd8UCC6IHprm4Ry4AKatcbN
 XiPAn5H0hhGRh+H8qOEv0lFumph83J0jQX3uuKvNTc9BtS2lfR8EtodVq
 vvO46LbfrBFqwwXe2Hgg1PirAgnStUiXeyf+c072NH1gAD0LmGuo8xgLS w==;
X-CSE-ConnectionGUID: HaDIqsbXTRq7j37yasGDVw==
X-CSE-MsgGUID: NQvKLaz2RAKMB22VkpdZGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66578346"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66578346"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 00:29:05 -0800
X-CSE-ConnectionGUID: sXbUFETwQBmM8uWVa6ZIaA==
X-CSE-MsgGUID: ed6sEY7KTEuYdy91Dwx3Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="198352683"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 01 Dec 2025 00:28:58 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Mon, 01 Dec 2025 13:58:47 +0530
Subject: [PATCH v9 05/20] drm: Define ImageEnhancemenT LUT structures
 exposed to user
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-dpst-v9-5-e462d55dba65@intel.com>
References: <20251201-dpst-v9-0-e462d55dba65@intel.com>
In-Reply-To: <20251201-dpst-v9-0-e462d55dba65@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 uma.shankar@intel.com, chaitanya.kumar.borah@intel.com, 
 suraj.kandpal@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 "Imported from f20250128-dpst-v8-0-871b94d777f8"@intel.com, 
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
index d92be66813cf667d8361d837110740a521dca6eb..35d19ccd799b2b0f72174de8987c4482209ff325 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1619,6 +1619,74 @@ struct drm_histogram {
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

