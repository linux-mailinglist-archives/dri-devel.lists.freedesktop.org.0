Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD01C9A4AA
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 07:28:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A578310E568;
	Tue,  2 Dec 2025 06:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TIuNxBWs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E78310E568;
 Tue,  2 Dec 2025 06:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764656892; x=1796192892;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=yIdNhEnolQY4SwwQ474YXZuZ51s/IHFsE4DzlXIuclY=;
 b=TIuNxBWsmLWOQHE6JD4xOsUcOrXTGqbn0H33ljHlR0ErI7GrFd6tyPeQ
 AejdJSiHHViYjvbjDYIKqgJtDwW/Pl5VZXvUUbSjNQ1sOxA3IhFj3XDs5
 MKOooB84y6m20lmoVN+FVzsfUlzpZVgud5EaNoJDZu0tY/Ick3+GZA/3N
 pHflwODx6WXnaBxcUvHInC9qwJpSmegLbvMiFu43b11ptG/JP3CARNsID
 nGBgqKZneJOyzOKHVzkLqdAD3OwY7202e1CY6DyowrhDXVp5sjye6QZKE
 YaXgW3PLLGcTGuhA/pfVluv0ajrc2LBSUDe1+52UeOB3A1XrvXRv3tGjE A==;
X-CSE-ConnectionGUID: Kdrpp9VXQASqAQymMe4xhw==
X-CSE-MsgGUID: pCgRrFQtSaezvYETKAWbGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66499991"
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="66499991"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 22:28:11 -0800
X-CSE-ConnectionGUID: niN3aZLNSs2bO65nBNikhw==
X-CSE-MsgGUID: L+GN6AhCTmSerUdqB6sLKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,242,1758610800"; d="scan'208";a="193961477"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa007.fm.intel.com with ESMTP; 01 Dec 2025 22:28:05 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Tue, 02 Dec 2025 11:57:09 +0530
Subject: [PATCH [RESEND] v9 15/20] drm/i915/iet: Add support to writing the
 IET LUT data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251202-dpst-v9-15-f2abb2ca2465@intel.com>
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

User created LUT can be fed back to the hardware so that the hardware
can apply this LUT data to see the enhancement in the image.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/intel_histogram.c | 67 ++++++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_histogram.h |  4 ++
 2 files changed, 71 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_histogram.c b/drivers/gpu/drm/i915/display/intel_histogram.c
index b42edf7dae7c0b8d083dff81c41a7ed4f7938e84..cf8aa7b04c4461629b071e49601a0e60d7609a08 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram.c
+++ b/drivers/gpu/drm/i915/display/intel_histogram.c
@@ -22,6 +22,7 @@
 /* Precision factor for threshold guardband */
 #define HISTOGRAM_GUARDBAND_PRECISION_FACTOR 10000
 #define HISTOGRAM_BIN_READ_RETRY_COUNT 5
+#define IET_SAMPLE_FORMAT_1_INT_9_FRACT 0x1000009
 
 static bool intel_histogram_get_data(struct intel_crtc *intel_crtc)
 {
@@ -227,6 +228,57 @@ int intel_histogram_update(struct intel_crtc *intel_crtc,
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
+	struct drm_colorop *colorop = intel_crtc->base.state->color_pipeline;
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
+	data = kcalloc(iet->nr_elements, sizeof(data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
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
+	ret = copy_from_user(data, (uint32_t __user *)(unsigned long)iet->iet_lut,
+			     sizeof(uint32_t) * iet->nr_elements);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < HISTOGRAM_IET_LENGTH; i++) {
+		intel_de_rmw(display, DPST_BIN(pipe),
+			     DPST_BIN_DATA_MASK, data[i]);
+		drm_dbg_atomic(display->drm, "iet_lut[%d]=%x\n", i, data[i]);
+	}
+	drm_property_blob_put(colorop->state->data);
+	kfree(data);
+
+	return 0;
+}
+
 void intel_histogram_finish(struct intel_crtc *intel_crtc)
 {
 	struct intel_histogram *histogram = intel_crtc->histogram;
@@ -239,6 +291,8 @@ int intel_histogram_init(struct intel_crtc *crtc)
 {
 	struct intel_histogram *histogram;
 	struct drm_histogram_caps *histogram_caps;
+	struct drm_iet_caps *iet_caps;
+	u32 *iet_format;
 
 	/* Allocate histogram internal struct */
 	histogram = kzalloc(sizeof(*histogram), GFP_KERNEL);
@@ -251,10 +305,23 @@ int intel_histogram_init(struct intel_crtc *crtc)
 	histogram_caps->histogram_mode = DRM_MODE_HISTOGRAM_HSV_MAX_RGB;
 	histogram_caps->bins_count = HISTOGRAM_BIN_COUNT;
 
+	iet_caps = kzalloc(sizeof(*iet_caps), GFP_KERNEL);
+	if (!iet_caps)
+		return -ENOMEM;
+
+	iet_caps->iet_mode = DRM_MODE_IET_MULTIPLICATIVE;
+	iet_caps->nr_iet_sample_formats = 1;
+	iet_caps->nr_iet_lut_entries = HISTOGRAM_IET_LENGTH;
+	iet_format = kcalloc(iet_caps->nr_iet_sample_formats, sizeof(u32),
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
index bd559d90e9b9fc8f5afdbc31c47702a99569b712..d4ddd99bf8c0347cdad23e3d34c14abe0c8ec7ca 100644
--- a/drivers/gpu/drm/i915/display/intel_histogram.h
+++ b/drivers/gpu/drm/i915/display/intel_histogram.h
@@ -16,9 +16,11 @@ struct intel_display;
 enum pipe;
 
 #define HISTOGRAM_BIN_COUNT                    32
+#define HISTOGRAM_IET_LENGTH                   33
 
 struct intel_histogram {
 	struct drm_histogram_caps *caps;
+	struct drm_iet_caps *iet_caps;
 	struct intel_crtc *crtc;
 	struct delayed_work work;
 	bool enable;
@@ -43,6 +45,8 @@ void intel_histogram_irq_handler(struct intel_display *display, enum pipe pipe);
 int intel_histogram_atomic_check(struct intel_crtc *intel_crtc);
 int intel_histogram_update(struct intel_crtc *intel_crtc,
 			   struct drm_histogram_config *config);
+int intel_histogram_set_iet_lut(struct intel_crtc *intel_crtc,
+				struct drm_property_blob *blob);
 int intel_histogram_init(struct intel_crtc *intel_crtc);
 void intel_histogram_finish(struct intel_crtc *intel_crtc);
 

-- 
2.25.1

