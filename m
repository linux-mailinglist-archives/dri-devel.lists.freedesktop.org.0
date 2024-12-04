Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF04B9E367A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 10:24:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412D910E33A;
	Wed,  4 Dec 2024 09:24:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IJWmUYFK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F42610EC83;
 Wed,  4 Dec 2024 09:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733304273; x=1764840273;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jC+CXvKSlFYRPJuUtO6ksaI+jnR2XIOW14T2NT93ulg=;
 b=IJWmUYFKh52ZeVLNUXJsunszv9qOTAX+aLnny1PnPKNNIoJ81/uNmuL6
 +i1Tj0XKKbwmhJvfK4xeJ6yPnkj/k+z9K/ZqeRMcIcBUHHBgu1u06RpG4
 +VeLxUCHAwnCRDQfTvDLxZb4248J+X+ZvsdSvfCju2t1yrLHaq9rK0WIx
 jaIBYvyhXcoPECxc2uagtsoKFRtKh9fhFCXNOIFDo9HoSJ5vxrjHX7CZ5
 f3sNxiaRzoo0O3mSuMOTZaW8078D+5tgZgn/hnCQy7P3CK52hfwBXSlx3
 ijXuxSwCVKfXAGX58yZcdHn+j1pqRhauILeeVGvqpJF5FMr77qtrD9LJ2 A==;
X-CSE-ConnectionGUID: ENg7nKEqQZmVloDT6i2dnA==
X-CSE-MsgGUID: 6WpHXmD2SLqTKvOYyG2n/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33621569"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="33621569"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2024 01:24:33 -0800
X-CSE-ConnectionGUID: BvQisZtIQ3qmThowrBAtXw==
X-CSE-MsgGUID: bJ82Sjp3QouRw5nGiTjmFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; d="scan'208";a="94541210"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa008.jf.intel.com with ESMTP; 04 Dec 2024 01:24:32 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, dmitry.baryshkov@linaro.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv2 01/10] drm/crtc: Add histogram properties
Date: Wed,  4 Dec 2024 14:44:56 +0530
Message-Id: <20241204091456.1785858-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
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
struct drm_histogram defined in include/uapi/drm/drm_mode.h
The blob data pointer will be the address of the struct drm_histogram.
The struct drm_histogram will be used for both reading the histogram and
writing the image enhanced data.
struct drm_histogram {
	u64 data_ptr;
	u32 nr_elements;
}
The element data_ptr holds the address of the histogram statistics data
and 'nr_elements' represents the number of elements pointed by the
pointer held in data_ptr.
The same element data_ptr in teh struct drm_histogram when writing the
image enahnced data from user to KMD holds the address to pixel factor.

v2: Added blob description in commit message (Dmitry)

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 include/drm/drm_crtc.h      | 48 +++++++++++++++++++++++++++++++++++++
 include/uapi/drm/drm_mode.h | 11 +++++++++
 2 files changed, 59 insertions(+)

diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 8b48a1974da3..3984cfa00cbf 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -274,6 +274,38 @@ struct drm_crtc_state {
 	 */
 	struct drm_property_blob *gamma_lut;
 
+	/**
+	 * @histogram_enable:
+	 *
+	 * This will be set if histogram is enabled for the CRTC.
+	 */
+	bool histogram_enable;
+
+	/**
+	 * @histogram_data:
+	 *
+	 * This will hold the pointer to the struct drm_histogram.
+	 * The element data in drm_histogram will hold the pointer to the
+	 * histogram data generated by the hardware.
+	 */
+	struct drm_property_blob *histogram_data;
+
+	/**
+	 * @histogram_-iet:
+	 *
+	 * This will hold the pointer to the struct drm_histogram.
+	 * The element data in drm_histogram will hold the pointer to the
+	 * histogram image enhancement generated by the algorithm that is to
+	 * be fed back to the hardware.
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
@@ -1088,6 +1120,22 @@ struct drm_crtc {
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
index c082810c08a8..da4396f57ed1 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -1355,6 +1355,17 @@ struct drm_mode_closefb {
 	__u32 pad;
 };
 
+/**
+ * struct drm_histogram
+ * data_ptr: pointer to the array fo u32 data. This data can be histogram
+ * raw data or image enhanced data
+ * nr_elements: number of elements pointed by the data @data_ptr
+ */
+struct drm_histogram {
+	__u64 data_ptr;
+	__u32 nr_elements;
+};
+
 #if defined(__cplusplus)
 }
 #endif
-- 
2.25.1

