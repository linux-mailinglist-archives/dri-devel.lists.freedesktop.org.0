Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B1719E9BC5
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 17:34:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A445B10E4CF;
	Mon,  9 Dec 2024 16:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mDSC05SU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7050F10E4CC;
 Mon,  9 Dec 2024 16:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733762090; x=1765298090;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ydH2nx1UQyxtfsHablSEbpvQYiYa/tU4mf0mkoavexE=;
 b=mDSC05SUO8spixuNmyw1SlWQLZj3u5VPDJC/rB/k0hisr7j7QoVXxVsA
 4c7N3fwuuGDevuGktV+dM0+F/NhKHUwRZgL9kSDp61xnE++zkL0TtGV3U
 OBSLAPSfOSyYzf8CBk2vsJDdg0Ce/mlUQBUHUbA4cUhkOchiJhn03phqB
 FVKEYvQ0KWkTLR3LMSqxBAe7V7uz4QXQSQmdPmn/y0S1dUijcOAgtV8Y+
 RE2YONPpR8wqOMrvpfdvf+Uyk0M1CDqPkqJma5jvaudW1pKsK+5PJPkF2
 GoM34ZDSnwE2iy8v06S7VPMVNp4ggp6gzKR8v1TPBK9Y7OS9CK8uuADMt g==;
X-CSE-ConnectionGUID: ndvWv0IVS52baPNUzZN/Yw==
X-CSE-MsgGUID: qxk/RMuRQaK3WZ2v9U6Vqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="56551591"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="56551591"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 08:34:50 -0800
X-CSE-ConnectionGUID: EGkTRqAESKOALXg/HYQ4HA==
X-CSE-MsgGUID: hlVWPJTCQdauZvZwgdh/9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="118371651"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 09 Dec 2024 08:34:48 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv3 01/10] drm/crtc: Add histogram properties
Date: Mon,  9 Dec 2024 21:54:55 +0530
Message-Id: <20241209162504.2146697-2-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241209162504.2146697-1-arun.r.murthy@intel.com>
References: <20241209162504.2146697-1-arun.r.murthy@intel.com>
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

Add variables for histogram drm_property, its corrsponding crtc_state
variables and define the structure pointed by the blob property.

struct drm_histogram and drm_iet defined in include/uapi/drm/drm_mode.h

The property HISTOGRAM_ENABLE allows user to enable/disable the
histogram feature in the hardware. Upon KMD enabling by writing to the
hardware registers, a histogram is generated. Histogram is composed of
'n' bins with each bin being an integer(pixel count).
An event HISTOGRAM will be sent to the user. User upon recieving this
event user can read the hardware generated histogram using crtc property
HISTOGRAM_DATA. User can use this histogram data, apply various
equilization techniques to come up with a pixel factor. This pixel
factor is an array of integer with 'n+1' elements. This is fed back to
the KMD by crtc property HISTOGRAM_IET. KMD will write this IET data
back to the hardware to see the enhancement/equilization done to the
images on that pipe.
The crtc property HISTOGRAM_DATA and HISTOGRAM_IET is of type blob.

For crtc property HISTOGRAM_DATA,
the blob data pointer will be the address of the struct drm_histogram.
struct drm_histogram {
	u64 data_ptr;
	u32 nr_elements;
}
Histogram is composed of @nr_elements of bins with each bin being an
integer value, referred to as pixel_count.
The element @data_ptr holds the address of histogam.
Sample:
Historgram[0] = 2050717
Historgram[1] = 244619
Historgram[2] = 173368
....
Historgram[31] = 21631

For crtc_property HISTOGRAM_IET,
the blob data pointer will be the address of the struct drm_iet.
struct drm_iet {
	u64 data_ptr;
	u32 nr_elements;
}
ImageEnhancemenT(IET) is composed of @nr_elements of bins with each bin
being an integer value, referred to as pixel factor.
The element @data_ptr holds the addess of pixel factor.
Sample:
Pixel Factor[0] = 1023
Pixel Factor[1] = 695
Pixel Factor[2] = 1023
....
Pixel Factor[32] = 512

Histogram is the statistics generated with 'n' number of frames on a
pipe.
Usually the size of pixel factor is one more than the size of histogram
data.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 include/drm/drm_crtc.h      | 51 +++++++++++++++++++++++++++++++++++++
 include/uapi/drm/drm_mode.h | 24 +++++++++++++++++
 2 files changed, 75 insertions(+)

diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 8b48a1974da3..f0f4a73e2e31 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -274,6 +274,41 @@ struct drm_crtc_state {
 	 */
 	struct drm_property_blob *gamma_lut;
 
+	/**
+	 * @histogram_enable:
+	 *
+	 * This will be set if histogram needs to be enabled for the CRTC.
+	 */
+	bool histogram_enable;
+
+	/**
+	 * @histogram_data:
+	 *
+	 * The blob points to the structure drm_histogram.
+	 * The element data in drm_histogram will hold the pointer to the
+	 * histogram data generated by the hardware. This histogram data is
+	 * an array of integer. This integer value is the pixel count of the
+	 * incoming frames.
+	 */
+	struct drm_property_blob *histogram_data;
+
+	/**
+	 * @histogram_iet:
+	 *
+	 * The blob points to the struct drm_iet.
+	 * The element data_ptr in drm_iet will hold the pointer to the
+	 * image enhancement generated by the algorithm that is to
+	 * be fed back to the hardware. This IET data is an array of type
+	 * integer and is referred to as a pixel factor.
+	 */
+	struct drm_property_blob *histogram_iet;
+	/**
+	 * @histogram_iet_updates:
+	 *
+	 * Convey that the image enhanced data has been updated by the user
+	 */
+	bool histogram_iet_updated;
+
 	/**
 	 * @target_vblank:
 	 *
@@ -1088,6 +1123,22 @@ struct drm_crtc {
 	 */
 	struct drm_property *scaling_filter_property;
 
+	/**
+	 * @histogram_enable_property: Optional CRTC property for enabling or
+	 * disabling global histogram.
+	 */
+	struct drm_property *histogram_enable_property;
+	/**
+	 * @histogram_data_proeprty: Optional CRTC property for getting the
+	 * histogram blob data.
+	 */
+	struct drm_property *histogram_data_property;
+	/**
+	 * @histogram_iet_proeprty: Optional CRTC property for writing the
+	 * image enhanced blob data
+	 */
+	struct drm_property *histogram_iet_property;
+
 	/**
 	 * @state:
 	 *
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index c082810c08a8..c384ed8452c7 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1355,6 +1355,30 @@ struct drm_mode_closefb {
 	__u32 pad;
 };
 
+/**
+ * struct drm_histogram
+ * @data_ptr: pointer to the array of bins which is of type integer. This
+ *	      is the histogram data termed as pixel count.
+ * @nr_elements: number of elements pointed by the data @data_ptr
+ */
+struct drm_histogram {
+	__u64 data_ptr;
+	__u32 nr_elements;
+};
+
+/**
+ * struct drm_iet
+ * @data_ptr: pointer to the array of bins which is of type integer. This
+ *	      is the image enhanced data, termed as pixel factor.
+ * @nr_elements: number of elements pointed by the data @data_ptr
+ * @reserved: reserved for future use
+ */
+struct drm_iet {
+	__u64 data_ptr;
+	__u32 nr_elements;
+	__u32 reserved;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.25.1

