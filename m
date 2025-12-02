Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 687D4C9A427
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 07:26:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B84D810E536;
	Tue,  2 Dec 2025 06:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EI8vyn7L";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8711610E536;
 Tue,  2 Dec 2025 06:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764656811; x=1796192811;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=dGi7ewIocq9tOZ6lOoWtWKcQo2u0p9cOvO6H946hCeI=;
 b=EI8vyn7Lwr0O+Fd+H2HzZoM20IRzz6v7MndeovYHgQ9YEB0hQPnh6fhX
 ql+5DfM5yooqBkPKNfmpDeK1uC1lUV6YP9ioykxO/dzkRzPHvrTour8pJ
 GNNYGeta7y01/Sej3Zrm9Id8ONvc3+xwEbb8bHt6aS8O6m/V714MdOhuw
 Vkg6u57DaYGEl4KQKIj9IHmOLPgDt3xv4rbuSZXT1Gay394NEVI9bVoVz
 /R79ltoVPOOnxhaqQMwFrVp98z+dsHTFTFYg6cFLL9hzV0L41BSGS/HyN
 lfJpTD5J8VxnJBnHgNItr40gsB1qSxZn/Q/UMdTM/eQ4MNXJI6aVTsxXs g==;
X-CSE-ConnectionGUID: HCRgklPhRyWYYH2eFApfFg==
X-CSE-MsgGUID: pRJcHZLbQgyox9SY4Iuysw==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66499808"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66499808"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 22:26:50 -0800
X-CSE-ConnectionGUID: KTTH8I6gRia6bqWf5uOeWQ==
X-CSE-MsgGUID: NGur8MZARKGJG7rSvGymdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="193961065"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa007.fm.intel.com with ESMTP; 01 Dec 2025 22:26:44 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 02 Dec 2025 11:56:56 +0530
Subject: [PATCH [RESEND] v9 02/20] drm: Define histogram structures exposed
 to user
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-dpst-v9-2-f2abb2ca2465@intel.com>
References: <20251202-dpst-v9-0-f2abb2ca2465@intel.com>
In-Reply-To: <20251202-dpst-v9-0-f2abb2ca2465@intel.com>
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
index cbbbfc1dfe2b806c641c720b0215e825e350bd03..aa24fef15da708f3e6804d07ffae5b0312dfdce0 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1545,6 +1545,71 @@ struct drm_mode_closefb {
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

