Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9D3A0810D
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 21:01:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 269AA10EFD5;
	Thu,  9 Jan 2025 20:01:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="G9+HiaAo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99F6210EFC2;
 Thu,  9 Jan 2025 20:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736452887; x=1767988887;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=kLbDShkX8otvnplqHBrRwWhsqjwKyK+iHgRMq2gAcUs=;
 b=G9+HiaAoGylUrSeWdbADikPz+cQvEvFPN2fmudJQmXzcF3rfbB8azwoO
 jdNubAFT2FXks0hEO70jbWjJrpZjkAIwwJgHIYVwL5Rh5XJDUcKG5zZtO
 VY6Es9GO8PUT7uU3YGrFJ1kKf6RPpfRPH0NuF4jHtt7lk+dREt2kAuHYE
 xXAQHYUD7oUuXZ66PlQulf8Q3tWSc6RLWLhFbkSxU6z938ey4GYqBTtky
 oRDgE1aGdDO6FzWTczVoWLe5wO4OO7nRzy4Cs17V6WsSRcB01/ezGuizs
 0bjoYl7A3UkaTibBmTyTQgoc3/wHi2/1FOxIwH0krI4BphU5KOkRNB/bb g==;
X-CSE-ConnectionGUID: GVcxQeVDTjCVBF8W7NibCA==
X-CSE-MsgGUID: vYVd3+TRQDqZpVnifw62qA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36619278"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; d="scan'208";a="36619278"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2025 12:01:22 -0800
X-CSE-ConnectionGUID: zYKkj+0RRlmxGoZ+2HHWAQ==
X-CSE-MsgGUID: EhVOpSroTuKzX1UP9UuYQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="126798685"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 09 Jan 2025 12:01:18 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Fri, 10 Jan 2025 01:15:38 +0530
Subject: [PATCH v7 10/14] drm/i915/iet: Add support to writing the IET LUT data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250110-dpst-v7-10-605cb0271162@intel.com>
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

User created LUT can be fed back to the hardware so that the hardware
can apply this LUT data to see the enhancement in the image.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_histogram.c | 70 ++++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_histogram.h |  4 ++
 2 files changed, 74 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
index ea61a98efb18fcccce88a8a3b82fd373c47920df..499ea9157a338f5081c74dfc182371b2075634ea 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram.c
+++ b/drivers/gpu/drm/i915/display/intel_histogram.c
@@ -20,6 +20,7 @@
 /* Precision factor for threshold guardband */
 #define HISTOGRAM_GUARDBAND_PRECISION_FACTOR 10000
 #define HISTOGRAM_BIN_READ_RETRY_COUNT 5
+#define IET_SAMPLE_FORMAT_1_INT_9_FRACT 0x1000009
 
 static bool intel_histogram_get_data(struct intel_crtc *intel_crtc)
 {
@@ -215,6 +216,60 @@ int intel_histogram_update(struct intel_crtc *intel_crtc,
 	return 0;
 }
 
+int intel_histogram_set_iet_lut(struct intel_crtc *intel_crtc,
+				struct drm_property_blob *blob)
+{
+	struct intel_histogram *histogram = intel_crtc->histogram;
+	struct intel_display *display = to_intel_display(intel_crtc);
+	int pipe = intel_crtc->pipe;
+	int i = 0;
+	struct drm_iet_1dlut_sample *iet;
+	u32 *data;
+	int ret;
+
+	if (!histogram)
+		return -EINVAL;
+
+	if (!histogram->enable) {
+		drm_err(display->drm, "histogram not enabled");
+		return -EINVAL;
+	}
+
+	if (!data) {
+	drm_err(display->drm, "enhancement LUT data is NULL");
+		return -EINVAL;
+	}
+
+	/* Set DPST_CTL Bin Reg function select to IE & wait for a vblabk */
+	intel_de_rmw(display, DPST_CTL(pipe),
+		     DPST_CTL_BIN_REG_FUNC_SEL, DPST_CTL_BIN_REG_FUNC_IE);
+
+	drm_crtc_wait_one_vblank(&intel_crtc->base);
+
+	 /* Set DPST_CTL Bin Register Index to 0 */
+	intel_de_rmw(display, DPST_CTL(pipe),
+		     DPST_CTL_BIN_REG_MASK, DPST_CTL_BIN_REG_CLEAR);
+
+	iet = (struct drm_iet_1dlut_sample *)blob->data;
+	data = kzalloc(sizeof(data) * iet->nr_elements, GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+	ret = copy_from_user(data, (uint32_t __user *)(unsigned long)iet->data_ptr,
+			     sizeof(uint32_t) * iet->nr_elements);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < HISTOGRAM_IET_LENGTH; i++) {
+		intel_de_rmw(display, DPST_BIN(pipe),
+			     DPST_BIN_DATA_MASK, data[i]);
+		drm_dbg_atomic(display->drm, "iet_lut[%d]=%x\n", i, data[i]);
+	}
+	kfree(data);
+	drm_property_blob_put(intel_crtc->base.state->iet_lut);
+
+	return 0;
+}
+
 void intel_histogram_finish(struct intel_crtc *intel_crtc)
 {
 	struct intel_histogram *histogram = intel_crtc->histogram;
@@ -227,6 +282,8 @@ int intel_histogram_init(struct intel_crtc *crtc)
 {
 	struct intel_histogram *histogram;
 	struct drm_histogram_caps *histogram_caps;
+	struct drm_iet_caps *iet_caps;
+	u32 *iet_format;
 
 	/* Allocate histogram internal struct */
 	histogram = kzalloc(sizeof(*histogram), GFP_KERNEL);
@@ -239,10 +296,23 @@ int intel_histogram_init(struct intel_crtc *crtc)
 	histogram_caps->histogram_mode = DRM_MODE_HISTOGRAM_HSV_MAX_RGB;
 	histogram_caps->bins_count = HISTOGRAM_BIN_COUNT;
 
+	iet_caps = kzalloc(sizeof(*iet_caps), GFP_KERNEL);
+	if (!iet_caps)
+		return -ENOMEM;
+
+	iet_caps->iet_mode = DRM_MODE_IET_MULTIPLICATIVE;
+	iet_caps->nr_iet_sample_formats = 1;
+	iet_caps->nr_iet_lut_entries = HISTOGRAM_IET_LENGTH;
+	iet_format = kzalloc(sizeof(u32)*iet_caps->nr_iet_sample_formats,
+			     GFP_KERNEL);
+	*iet_format = IET_SAMPLE_FORMAT_1_INT_9_FRACT;
+	iet_caps->iet_sample_format = *iet_format;
+
 	crtc->histogram = histogram;
 	histogram->crtc = crtc;
 	histogram->can_enable = false;
 	histogram->caps = histogram_caps;
+	histogram->iet_caps = iet_caps;
 
 	INIT_DEFERRABLE_WORK(&histogram->work,
 			     intel_histogram_handle_int_work);
diff --git a/drivers/gpu/drm/i915/display/intel_histogram.h b/drivers/gpu/drm/i915/display/intel_histogram.h
index b44ba3afc94f79f291f4e5ebdd04dcf9434b48a4..0999d1720c7abee8907c77896e4b1e6ff756160f 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram.h
+++ b/drivers/gpu/drm/i915/display/intel_histogram.h
@@ -18,9 +18,11 @@ struct intel_display;
 enum pipe;
 
 #define HISTOGRAM_BIN_COUNT                    32
+#define HISTOGRAM_IET_LENGTH                   33
 
 struct intel_histogram {
 	struct drm_histogram_caps *caps;
+	struct drm_iet_caps *iet_caps;
 	struct intel_crtc *crtc;
 	struct delayed_work work;
 	bool enable;
@@ -45,6 +47,8 @@ void intel_histogram_irq_handler(struct intel_display *display, enum pipe pipe);
 int intel_histogram_atomic_check(struct intel_crtc *intel_crtc);
 int intel_histogram_update(struct intel_crtc *intel_crtc,
 			   struct drm_histogram_config *config);
+int intel_histogram_set_iet_lut(struct intel_crtc *intel_crtc,
+				struct drm_property_blob *blob);
 int intel_histogram_init(struct intel_crtc *intel_crtc);
 void intel_histogram_finish(struct intel_crtc *intel_crtc);
 

-- 
2.25.1

