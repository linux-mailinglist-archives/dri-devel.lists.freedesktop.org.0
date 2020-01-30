Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4465C14E964
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2020 09:04:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B52CD6FAAC;
	Fri, 31 Jan 2020 08:04:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B80C6F91A;
 Thu, 30 Jan 2020 08:32:49 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id a6so2864869wrx.12;
 Thu, 30 Jan 2020 00:32:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8J5B9hnulSOKfzbKUaNLIc6gRidEchVACCqkF5n/5e0=;
 b=RlaiFCVd0WeeQ/YCINHZ/y7a9IzTV8BJfbLguMk4fGAlfbhsJ2lbCjUzKxPfY643ta
 qDkUGlLSLo9e7kO6vGDxwEkmKKT4dQc0KhqYatHJZyGaHDHS2NeLN19wl6CtSDO6eje2
 LY1eQ7+ee9O8AEYUgmHZnUhpQbdAWJomUPIvtEjLOdTUIwTlJcj274mYzunvPc/oS2LS
 r1hiXBFizo8W3VTc1Eaw0kGW/4F3E5YMGxilYDuARlGFrAKNoM/NC6wLP2bZXQWBtY3U
 1aoBIdeliZXWRonYHA4/I1vR2faZv4T3rl3O8iQ1BKevx0GT+zpwGvfonPS4NqofrDeM
 NFqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8J5B9hnulSOKfzbKUaNLIc6gRidEchVACCqkF5n/5e0=;
 b=mURCGp+NGGqFpcKvMm3R80KSGRS1fZOVG2N1np+DE301uZJqM4BMHlrU4lx6ojoCI4
 n3FRyIA7AfZVgLvFEaAeq1wxIKPnNH6FcJwGphF/ktomfGThMpoFWkXN+HwwTh83qgCd
 x26vtQQT0rLxZhA97yaUqHWgKodWvsdJw2ClwsFEMK9ZaJtdlZv4aV2MG+B1GaxnTiOH
 3WUW2jGQ+bSk3WKT2I+ygvfTXTa8N9VYjmGzoZOqbejg6vqHlkP+PCmUsZC3X7uhoAu+
 jQpunJukHCkIK404ko7fJKiL4mqiacBWGZvxMZ/Nd1RBarp6HydLWQ4kgbAyUJtyqVsw
 xPtQ==
X-Gm-Message-State: APjAAAUN9i7XbGq7B5FNHpqIb3VXvlGp2nsrH0eqw44wA3+pfJSuN9rO
 nwLUZTdXdE9AKBcleDDBEdA=
X-Google-Smtp-Source: APXvYqwgoZSUJbFU4Qk6CmAckH0bjm+7XVHh3hsIITyipSfHKoiGk+5MUIu8LtNPy/o+QEqIlkb2wA==
X-Received: by 2002:adf:f1d0:: with SMTP id z16mr3894320wro.209.1580373168122; 
 Thu, 30 Jan 2020 00:32:48 -0800 (PST)
Received: from wambui.zuku.co.ke ([197.237.61.225])
 by smtp.googlemail.com with ESMTPSA id i11sm6363678wrs.10.2020.01.30.00.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jan 2020 00:32:47 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch
Subject: [PATCH 04/12] drm/i915/vdsc: convert to struct drm_device based
 logging macros.
Date: Thu, 30 Jan 2020 11:32:21 +0300
Message-Id: <20200130083229.12889-5-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200130083229.12889-1-wambui.karugax@gmail.com>
References: <20200130083229.12889-1-wambui.karugax@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 31 Jan 2020 08:04:00 +0000
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
Cc: intel-gfx@lists.freedesktop.org, sean@poorly.run,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Converts uses of the printk based drm logging macros to the new struct
drm_device based logging macros in i915/display/intel_vdsc.c.
This was done using the following coccinelle script that transforms
based on the existence of a struct drm_i915_private device:
@@
identifier fn, T;
@@

fn(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

@@
identifier fn, T;
@@

fn(...,struct drm_i915_private *T,...) {
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

Checkpatch warnings were fixed manually.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_vdsc.c | 28 +++++++++++------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_vdsc.c b/drivers/gpu/drm/i915/display/intel_vdsc.c
index a81abadb067f..5571f0442dd0 100644
--- a/drivers/gpu/drm/i915/display/intel_vdsc.c
+++ b/drivers/gpu/drm/i915/display/intel_vdsc.c
@@ -518,7 +518,7 @@ static void intel_dsc_pps_configure(struct intel_encoder *encoder,
 		pps_val |= DSC_422_ENABLE;
 	if (vdsc_cfg->vbr_enable)
 		pps_val |= DSC_VBR_ENABLE;
-	DRM_INFO("PPS0 = 0x%08x\n", pps_val);
+	drm_info(&dev_priv->drm, "PPS0 = 0x%08x\n", pps_val);
 	if (!is_pipe_dsc(crtc_state)) {
 		intel_de_write(dev_priv, DSCA_PICTURE_PARAMETER_SET_0,
 			       pps_val);
@@ -542,7 +542,7 @@ static void intel_dsc_pps_configure(struct intel_encoder *encoder,
 	/* Populate PICTURE_PARAMETER_SET_1 registers */
 	pps_val = 0;
 	pps_val |= DSC_BPP(vdsc_cfg->bits_per_pixel);
-	DRM_INFO("PPS1 = 0x%08x\n", pps_val);
+	drm_info(&dev_priv->drm, "PPS1 = 0x%08x\n", pps_val);
 	if (!is_pipe_dsc(crtc_state)) {
 		intel_de_write(dev_priv, DSCA_PICTURE_PARAMETER_SET_1,
 			       pps_val);
@@ -567,7 +567,7 @@ static void intel_dsc_pps_configure(struct intel_encoder *encoder,
 	pps_val = 0;
 	pps_val |= DSC_PIC_HEIGHT(vdsc_cfg->pic_height) |
 		DSC_PIC_WIDTH(vdsc_cfg->pic_width / num_vdsc_instances);
-	DRM_INFO("PPS2 = 0x%08x\n", pps_val);
+	drm_info(&dev_priv->drm, "PPS2 = 0x%08x\n", pps_val);
 	if (!is_pipe_dsc(crtc_state)) {
 		intel_de_write(dev_priv, DSCA_PICTURE_PARAMETER_SET_2,
 			       pps_val);
@@ -592,7 +592,7 @@ static void intel_dsc_pps_configure(struct intel_encoder *encoder,
 	pps_val = 0;
 	pps_val |= DSC_SLICE_HEIGHT(vdsc_cfg->slice_height) |
 		DSC_SLICE_WIDTH(vdsc_cfg->slice_width);
-	DRM_INFO("PPS3 = 0x%08x\n", pps_val);
+	drm_info(&dev_priv->drm, "PPS3 = 0x%08x\n", pps_val);
 	if (!is_pipe_dsc(crtc_state)) {
 		intel_de_write(dev_priv, DSCA_PICTURE_PARAMETER_SET_3,
 			       pps_val);
@@ -617,7 +617,7 @@ static void intel_dsc_pps_configure(struct intel_encoder *encoder,
 	pps_val = 0;
 	pps_val |= DSC_INITIAL_XMIT_DELAY(vdsc_cfg->initial_xmit_delay) |
 		DSC_INITIAL_DEC_DELAY(vdsc_cfg->initial_dec_delay);
-	DRM_INFO("PPS4 = 0x%08x\n", pps_val);
+	drm_info(&dev_priv->drm, "PPS4 = 0x%08x\n", pps_val);
 	if (!is_pipe_dsc(crtc_state)) {
 		intel_de_write(dev_priv, DSCA_PICTURE_PARAMETER_SET_4,
 			       pps_val);
@@ -642,7 +642,7 @@ static void intel_dsc_pps_configure(struct intel_encoder *encoder,
 	pps_val = 0;
 	pps_val |= DSC_SCALE_INC_INT(vdsc_cfg->scale_increment_interval) |
 		DSC_SCALE_DEC_INT(vdsc_cfg->scale_decrement_interval);
-	DRM_INFO("PPS5 = 0x%08x\n", pps_val);
+	drm_info(&dev_priv->drm, "PPS5 = 0x%08x\n", pps_val);
 	if (!is_pipe_dsc(crtc_state)) {
 		intel_de_write(dev_priv, DSCA_PICTURE_PARAMETER_SET_5,
 			       pps_val);
@@ -669,7 +669,7 @@ static void intel_dsc_pps_configure(struct intel_encoder *encoder,
 		DSC_FIRST_LINE_BPG_OFFSET(vdsc_cfg->first_line_bpg_offset) |
 		DSC_FLATNESS_MIN_QP(vdsc_cfg->flatness_min_qp) |
 		DSC_FLATNESS_MAX_QP(vdsc_cfg->flatness_max_qp);
-	DRM_INFO("PPS6 = 0x%08x\n", pps_val);
+	drm_info(&dev_priv->drm, "PPS6 = 0x%08x\n", pps_val);
 	if (!is_pipe_dsc(crtc_state)) {
 		intel_de_write(dev_priv, DSCA_PICTURE_PARAMETER_SET_6,
 			       pps_val);
@@ -694,7 +694,7 @@ static void intel_dsc_pps_configure(struct intel_encoder *encoder,
 	pps_val = 0;
 	pps_val |= DSC_SLICE_BPG_OFFSET(vdsc_cfg->slice_bpg_offset) |
 		DSC_NFL_BPG_OFFSET(vdsc_cfg->nfl_bpg_offset);
-	DRM_INFO("PPS7 = 0x%08x\n", pps_val);
+	drm_info(&dev_priv->drm, "PPS7 = 0x%08x\n", pps_val);
 	if (!is_pipe_dsc(crtc_state)) {
 		intel_de_write(dev_priv, DSCA_PICTURE_PARAMETER_SET_7,
 			       pps_val);
@@ -719,7 +719,7 @@ static void intel_dsc_pps_configure(struct intel_encoder *encoder,
 	pps_val = 0;
 	pps_val |= DSC_FINAL_OFFSET(vdsc_cfg->final_offset) |
 		DSC_INITIAL_OFFSET(vdsc_cfg->initial_offset);
-	DRM_INFO("PPS8 = 0x%08x\n", pps_val);
+	drm_info(&dev_priv->drm, "PPS8 = 0x%08x\n", pps_val);
 	if (!is_pipe_dsc(crtc_state)) {
 		intel_de_write(dev_priv, DSCA_PICTURE_PARAMETER_SET_8,
 			       pps_val);
@@ -744,7 +744,7 @@ static void intel_dsc_pps_configure(struct intel_encoder *encoder,
 	pps_val = 0;
 	pps_val |= DSC_RC_MODEL_SIZE(DSC_RC_MODEL_SIZE_CONST) |
 		DSC_RC_EDGE_FACTOR(DSC_RC_EDGE_FACTOR_CONST);
-	DRM_INFO("PPS9 = 0x%08x\n", pps_val);
+	drm_info(&dev_priv->drm, "PPS9 = 0x%08x\n", pps_val);
 	if (!is_pipe_dsc(crtc_state)) {
 		intel_de_write(dev_priv, DSCA_PICTURE_PARAMETER_SET_9,
 			       pps_val);
@@ -771,7 +771,7 @@ static void intel_dsc_pps_configure(struct intel_encoder *encoder,
 		DSC_RC_QUANT_INC_LIMIT1(vdsc_cfg->rc_quant_incr_limit1) |
 		DSC_RC_TARGET_OFF_HIGH(DSC_RC_TGT_OFFSET_HI_CONST) |
 		DSC_RC_TARGET_OFF_LOW(DSC_RC_TGT_OFFSET_LO_CONST);
-	DRM_INFO("PPS10 = 0x%08x\n", pps_val);
+	drm_info(&dev_priv->drm, "PPS10 = 0x%08x\n", pps_val);
 	if (!is_pipe_dsc(crtc_state)) {
 		intel_de_write(dev_priv, DSCA_PICTURE_PARAMETER_SET_10,
 			       pps_val);
@@ -799,7 +799,7 @@ static void intel_dsc_pps_configure(struct intel_encoder *encoder,
 				   vdsc_cfg->slice_width) |
 		DSC_SLICE_ROW_PER_FRAME(vdsc_cfg->pic_height /
 					vdsc_cfg->slice_height);
-	DRM_INFO("PPS16 = 0x%08x\n", pps_val);
+	drm_info(&dev_priv->drm, "PPS16 = 0x%08x\n", pps_val);
 	if (!is_pipe_dsc(crtc_state)) {
 		intel_de_write(dev_priv, DSCA_PICTURE_PARAMETER_SET_16,
 			       pps_val);
@@ -826,7 +826,7 @@ static void intel_dsc_pps_configure(struct intel_encoder *encoder,
 		rc_buf_thresh_dword[i / 4] |=
 			(u32)(vdsc_cfg->rc_buf_thresh[i] <<
 			      BITS_PER_BYTE * (i % 4));
-		DRM_INFO(" RC_BUF_THRESH%d = 0x%08x\n", i,
+		drm_info(&dev_priv->drm, " RC_BUF_THRESH%d = 0x%08x\n", i,
 			 rc_buf_thresh_dword[i / 4]);
 	}
 	if (!is_pipe_dsc(crtc_state)) {
@@ -883,7 +883,7 @@ static void intel_dsc_pps_configure(struct intel_encoder *encoder,
 				RC_MAX_QP_SHIFT) |
 			       (vdsc_cfg->rc_range_params[i].range_min_qp <<
 				RC_MIN_QP_SHIFT)) << 16 * (i % 2));
-		DRM_INFO(" RC_RANGE_PARAM_%d = 0x%08x\n", i,
+		drm_info(&dev_priv->drm, " RC_RANGE_PARAM_%d = 0x%08x\n", i,
 			 rc_range_params_dword[i / 2]);
 	}
 	if (!is_pipe_dsc(crtc_state)) {
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
