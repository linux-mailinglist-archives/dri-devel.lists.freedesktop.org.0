Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDA3A20DE8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 17:06:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9DD10E6A7;
	Tue, 28 Jan 2025 16:06:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V9EoaXnT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9399910E6AA;
 Tue, 28 Jan 2025 16:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738080359; x=1769616359;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=bDgT4VIxg/jIp6PmRyFC4l9u0NF6je1nknLzt8juq/g=;
 b=V9EoaXnT91huA6E584nb9B/8GaIHjIVwGTv90MsMctIRA2fVb9WTFLHF
 W9vQYlsPoMJViUEdNC7sBj6+BZo1nXUVK3R7nqdR1Hkx5nYnQvjIQ83EN
 DfdZFCSKGeToizu50SuXV0fhM9XJThg2CHiejQiPnexk7TO+Y44za2vPh
 quLJRR/sN3C+eDrjyDq3SlKOw8n1i8S0d/480KWfL8k4ol515J5yqx2OP
 dixz9TunU5GRFfOW5gAuxLYEEFQjK7VDlJXXY33e0O5/2jHhcvZBF8Rhf
 0GS2vcrXB0EDj1UeI85vQVp4gd4N1gU5DGFephFj4pnBClk33fLijWqlw g==;
X-CSE-ConnectionGUID: TWFBjtEoQGSLcg3IsjIsBw==
X-CSE-MsgGUID: c/6mjQwcSNWRO89Ej+k6IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38744996"
X-IronPort-AV: E=Sophos;i="6.13,241,1732608000"; d="scan'208";a="38744996"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 08:05:58 -0800
X-CSE-ConnectionGUID: NBcLSwP0S5OaxNJp9KQRTA==
X-CSE-MsgGUID: ZwmX8mAHSKWysi0r6ngizg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="145976880"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 28 Jan 2025 08:05:56 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 28 Jan 2025 21:21:07 +0530
Subject: [PATCH v8 01/14] drm: Define histogram structures exposed to user
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250128-dpst-v8-1-871b94d777f8@intel.com>
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

Display Histogram is an array of bins and can be generated in many ways
referred to as modes.
Ex: HSV max(RGB), Wighted RGB etc.

Understanding the histogram data format(Ex: HSV max(RGB))
Histogram is just the pixel count.
For a maximum resolution of 10k (10240 x 4320 = 44236800)
25 bits should be sufficient to represent this along with a buffer of 7
bits(future use) u32 is being considered.
max(RGB) can be 255 i.e 0xFF 8 bit, considering the most significant 5
bits, hence 32 bins.
Below mentioned algorithm illustrates the histogram generation in
hardware.

hist[32] = {0};
for (i = 0; i < resolution; i++) {
	bin = max(RGB[i]);
	bin = bin >> 3;	/* consider the most significant bits */
	hist[bin]++;
}
If the entire image is Red color then max(255,0,0) is 255 so the pixel
count of each pixels will be placed in the last bin. Hence except
hist[31] all other bins will have a value zero.
Generated histogram in this case would be hist[32] = {0,0,....44236800}

Description of the structures, properties defined are documented in the
header file include/uapi/drm/drm_mode.h

v8: Added doc for HDR planes, removed reserved variables (Dmitry)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 include/uapi/drm/drm_mode.h | 65 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index c082810c08a8b234ef2672ecf54fc8c05ddc2bd3..b8b7b18843ae7224263a9c61b20ac6cbf5df69e9 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1355,6 +1355,71 @@ struct drm_mode_closefb {
 	__u32 pad;
 };
 
+/**
+ * enum drm_mode_histogram
+ *
+ * @DRM_MODE_HISTOGRAM_HSV_MAX_RGB:
+ * Maximum resolution at present 10k, 10240x4320 = 44236800
+ * can be denoted in 25bits. With an additional 7 bits in buffer each bin
+ * can be a u32 value.
+ * For SDL, Maximum value of max(RGB) is 255, so max 255 bins.
+ * If the most significant 5 bits are considered, then bins = 2^5
+ * will be 32 bins.
+ * For HDR, maximum value of max(RGB) is 65535, so max 65535 bins.
+ * For illustration consider a full RED image of 10k resolution considering all
+ * 8 bits histogram would look like hist[255] = {0,0,....44236800} with SDR
+ * plane similarly with HDR the same would look like hist[65535] =
+ * {0,0,0,....44236800}
+ */
+enum drm_mode_histogram {
+	DRM_MODE_HISTOGRAM_HSV_MAX_RGB = 0x01,
+};
+
+/**
+ * struct drm_histogram_caps
+ *
+ * @histogram_mode: histogram generation modes, defined in the
+ *		    enum drm_mode_histogram
+ * @bins_count: number of bins for a chosen histogram mode. For illustration
+ *		refer the above defined histogram mode.
+ */
+struct drm_histogram_caps {
+	__u32 histogram_mode;
+	__u32 bins_count;
+};
+
+/**
+ * struct drm_histogram_config
+ *
+ * @hist_mode_data: address to the histogram mode specific data if any
+ * @nr_hist_mode_data: number of elements pointed by the address in
+ *		       hist_mode_data
+ * @hist_mode: histogram mode(HSV max(RGB), RGB, LUMA etc)
+ * @enable: flag to enable/disable histogram
+ */
+struct drm_histogram_config {
+	__u64 hist_mode_data;
+	__u32 nr_hist_mode_data;
+	enum drm_mode_histogram hist_mode;
+	bool enable;
+};
+
+/**
+ * struct drm_histogram
+ *
+ * @config: histogram configuration data pointed by struct drm_histogram_config
+ * @data_ptr: pointer to the array of histogram.
+ *	      Histogram is an array of bins. Data format for each bin depends
+ *	      on the histogram mode. Refer to the above histogram modes for
+ *	      more information.
+ * @nr_elements: number of bins in the histogram.
+ */
+struct drm_histogram {
+	struct drm_histogram_config config;
+	__u64 data_ptr;
+	__u32 nr_elements;
+};
+
 #if defined(__cplusplus)
 }
 #endif

-- 
2.25.1

