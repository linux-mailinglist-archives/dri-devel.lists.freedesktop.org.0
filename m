Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E109F6946
	for <lists+dri-devel@lfdr.de>; Wed, 18 Dec 2024 16:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3310C10EBDE;
	Wed, 18 Dec 2024 15:02:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="W/CW2Po8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B74810EBDA;
 Wed, 18 Dec 2024 15:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734534136; x=1766070136;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=xlpWJPaaUMWaNR0lC667XgbjZCYBsdCy7l/KnObWHTg=;
 b=W/CW2Po8LAW4mvCv7jFWZsZTJ1Kc1fCm3Iq2W81z1IjBdYFviYXVCWWs
 HJYd7MfVohqlb77Gw3wEFdijtt0zVLZELd+MT2tUhapPf5/JOkQuWijgf
 qPKQtAE5cBswFv1bqv0CSVVPSr6I45TmtEu7mcSJWcO3p3DoAvlfZ9bMM
 QTdF1lrC90DmlBc1EC/0d9XjEXjxkG6oACZaafLs24eesJB9tR4220MIo
 P0qNLEcK6o9p7hPS2f3ZT3GxQLWBwVPBmnK8A+sfzP1r6QrDb3x6wTqvI
 8QJpSLNxirubAYNUTFZFYW0GV2UkPw4eBwgXXnzVzoAVN/htDQteP8CF+ A==;
X-CSE-ConnectionGUID: Vu2Y5nXdSSOO/YefBc7q3A==
X-CSE-MsgGUID: LSgbco6oRQCEN75/NXzDdQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11290"; a="45502467"
X-IronPort-AV: E=Sophos;i="6.12,244,1728975600"; d="scan'208";a="45502467"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2024 07:02:16 -0800
X-CSE-ConnectionGUID: R6BlSBjIQL2PEzeorlXocQ==
X-CSE-MsgGUID: LwKVeupUS/OU5fqJwV27FA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="102025385"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa003.fm.intel.com with ESMTP; 18 Dec 2024 07:02:14 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 18 Dec 2024 20:22:04 +0530
Subject: [PATCH v7 1/4] drm: Define histogram structures exposed to user
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-dpst-v7-1-81bfe7d08c2d@intel.com>
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

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 include/uapi/drm/drm_mode.h | 59 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index c082810c08a8b234ef2672ecf54fc8c05ddc2bd3..7a7039381142bb5dba269bdaec42c18be34e2d05 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1355,6 +1355,65 @@ struct drm_mode_closefb {
 	__u32 pad;
 };
 
+/*
+ * Maximum resolution at present 10k, 10240x4320 = 44236800
+ * can be denoted in 25bits. With an additional 7 bits in buffer each bin
+ * can be a u32 value.
+ * Maximum value of max(RGB) is 255, so max 255 bins.
+ * If the most significant 5 bits are considered, then bins = 0xff >> 3
+ * will be 32 bins.
+ * For illustration consider a full RED image of 10k resolution considering all
+ * 8 bits histogram would look like hist[255] = {0,0,....44236800}
+ */
+#define DRM_MODE_HISTOGRAM_HSV_MAX_RGB			(1 << 0)
+
+/**
+ * struct drm_histogram_caps
+ *
+ * @histogram_mode: histogram generation modes, defined in the above macros
+ * @bins_count: number of bins for a chosen histogram mode. For illustration
+ *		refer the above defined histogram mode.
+ */
+struct drm_histogram_caps {
+	u8 histogram_mode;
+	u32 bins_count;
+};
+
+/**
+ * struct drm_histogram_config
+ *
+ * @enable: flag to enable/disable histogram
+ * @hist_mode: histogram mode(HSV max(RGB), RGB, LUMA etc)
+ * @reserved1: Reserved for future use
+ * @reserved2: Reserved for future use
+ * @reserved3: Reserved for future use
+ * @reserved4: Reserved for future use
+ */
+struct drm_histogram_config {
+	bool enable;
+	u8 hist_mode;
+	u32 reserved1;
+	u32 reserved2;
+	u32 reserved3;
+	u32 reserved4;
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

