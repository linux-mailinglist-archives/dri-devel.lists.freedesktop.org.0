Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C25089996E
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 11:29:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FD6010E2A5;
	Fri,  5 Apr 2024 09:29:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WMzEMuBM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E149310E2A5;
 Fri,  5 Apr 2024 09:29:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712309358; x=1743845358;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=gy7Y8lDrWgz3NFY9sKkL4lLPtGzVnG4PwajBq3sumKw=;
 b=WMzEMuBMhHCoJzlAPr+86fWxjQI1hKtIip6wTXBLBCjYUY5C58MHWYBY
 5BSijFzLyLtp7aZMJQO9wKRI02FPXx8BRmoWpaB2zss8ToSqn4FhEc/Dz
 dQhs+L0qWc16I9Rp3c5FKGVhBe8WZV6XyFYotI9/bUyx6f7t8cOcelGAt
 yE8J5CLgf64RlZ6iXLPBFzFq/1xmh3qsi36pQGBIsCxe305J+NGhFRHz7
 NmD3TszrRtUyTavWrZp2sGNbZTXvuSsxABsc9itVa9OL80BgaMoYPa+gt
 71xHUi16g0fyAb9wkYGKRYNlJxVFF/aTkmV8zSHtEcdUDOsKPb9D9YIc4 g==;
X-CSE-ConnectionGUID: DPiz3G9pRzeTDZvEW7XVgg==
X-CSE-MsgGUID: 54PaQBrKTfy1dK+kE1qVGA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="25137775"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="25137775"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 02:29:17 -0700
X-CSE-ConnectionGUID: 5yOQY6m7SriyXRoEB0joVg==
X-CSE-MsgGUID: GfNAzSmkSJOU1IYQmqCSTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; d="scan'208";a="23575402"
Received: from dtorrice-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.41.202])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2024 02:29:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>
Cc: Jani Nikula <jani.nikula@intel.com>, Aishwarya TCV <aishwarya.tcv@arm.com>
Subject: [PATCH] drm/msm: convert all pixel format logging to use %p4cc
Date: Fri,  5 Apr 2024 12:29:07 +0300
Message-Id: <20240405092907.2334007-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Logging u32 pixel formats using %4.4s format string with a pointer to
the u32 is somewhat questionable, as well as dependent on byte
order. There's a kernel extension format specifier %p4cc to format 4cc
codes. Use it across the board in msm for pixel format logging.

This should also fix the reported build warning:

  include/drm/drm_print.h:536:35: warning: '%4.4s' directive argument is
  null [-Wformat-overflow=]

Reported-by: Aishwarya TCV <aishwarya.tcv@arm.com>
Closes: https://lore.kernel.org/r/2ac758ce-a196-4e89-a397-488ba31014c4@arm.com
Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Tip: 'git show --color-words -w' might be the easiest way to review.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  8 +++----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 24 +++++++++----------
 drivers/gpu/drm/msm/msm_fb.c                  | 10 ++++----
 5 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 9a14d2232e4a..aa1e68379d9f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2203,8 +2203,8 @@ void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
 		return;
 
 	if (!DPU_FORMAT_IS_YUV(dpu_fmt)) {
-		DPU_DEBUG("[enc:%d] cdm_disable fmt:%x\n", DRMID(phys_enc->parent),
-			  dpu_fmt->base.pixel_format);
+		DPU_DEBUG("[enc:%d] cdm_disable fmt:%p4cc\n", DRMID(phys_enc->parent),
+			  &dpu_fmt->base.pixel_format);
 		if (hw_cdm->ops.bind_pingpong_blk)
 			hw_cdm->ops.bind_pingpong_blk(hw_cdm, PINGPONG_NONE);
 
@@ -2244,9 +2244,9 @@ void dpu_encoder_helper_phys_setup_cdm(struct dpu_encoder_phys *phys_enc,
 		break;
 	}
 
-	DPU_DEBUG("[enc:%d] cdm_enable:%d,%d,%X,%d,%d,%d,%d]\n",
+	DPU_DEBUG("[enc:%d] cdm_enable:%d,%d,%p4cc,%d,%d,%d,%d]\n",
 		  DRMID(phys_enc->parent), cdm_cfg->output_width,
-		  cdm_cfg->output_height, cdm_cfg->output_fmt->base.pixel_format,
+		  cdm_cfg->output_height, &cdm_cfg->output_fmt->base.pixel_format,
 		  cdm_cfg->output_type, cdm_cfg->output_bit_depth,
 		  cdm_cfg->h_cdwn_type, cdm_cfg->v_cdwn_type);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 1924a2b28e53..9dbb8ddcddec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -580,7 +580,7 @@ static void dpu_encoder_phys_wb_prepare_wb_job(struct dpu_encoder_phys *phys_enc
 			format->pixel_format, job->fb->modifier);
 	if (!wb_cfg->dest.format) {
 		/* this error should be detected during atomic_check */
-		DPU_ERROR("failed to get format %x\n", format->pixel_format);
+		DPU_ERROR("failed to get format %p4cc\n", &format->pixel_format);
 		return;
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
index e366ab134249..95e6e58b1a21 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c
@@ -647,8 +647,8 @@ static int _dpu_format_get_plane_sizes_ubwc(
 
 	color = _dpu_format_get_media_color_ubwc(fmt);
 	if (color < 0) {
-		DRM_ERROR("UBWC format not supported for fmt: %4.4s\n",
-			(char *)&fmt->base.pixel_format);
+		DRM_ERROR("UBWC format not supported for fmt: %p4cc\n",
+			  &fmt->base.pixel_format);
 		return -EINVAL;
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index ff975ad51145..ff4ac4daaeca 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -234,9 +234,9 @@ static int _dpu_plane_calc_fill_level(struct drm_plane *plane,
 		}
 	}
 
-	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %4.4s w:%u fl:%u\n",
+	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %p4cc w:%u fl:%u\n",
 			pipe->sspp->idx - SSPP_VIG0,
-			(char *)&fmt->base.pixel_format,
+			&fmt->base.pixel_format,
 			src_width, total_fl);
 
 	return total_fl;
@@ -287,9 +287,9 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 			(fmt) ? fmt->base.pixel_format : 0,
 			pdpu->is_rt_pipe, total_fl, cfg.creq_lut, lut_usage);
 
-	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %4.4s rt:%d fl:%u lut:0x%llx\n",
+	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %p4cc rt:%d fl:%u lut:0x%llx\n",
 			pdpu->pipe - SSPP_VIG0,
-			fmt ? (char *)&fmt->base.pixel_format : NULL,
+			fmt ? &fmt->base.pixel_format : NULL,
 			pdpu->is_rt_pipe, total_fl, cfg.creq_lut);
 
 	trace_dpu_perf_set_danger_luts(pdpu->pipe - SSPP_VIG0,
@@ -298,12 +298,12 @@ static void _dpu_plane_set_qos_lut(struct drm_plane *plane,
 			cfg.danger_lut,
 			cfg.safe_lut);
 
-	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %4.4s mode:%d luts[0x%x, 0x%x]\n",
-		pdpu->pipe - SSPP_VIG0,
-		fmt ? (char *)&fmt->base.pixel_format : NULL,
-		fmt ? fmt->fetch_mode : -1,
-		cfg.danger_lut,
-		cfg.safe_lut);
+	DPU_DEBUG_PLANE(pdpu, "pnum:%d fmt: %p4cc mode:%d luts[0x%x, 0x%x]\n",
+			pdpu->pipe - SSPP_VIG0,
+			fmt ? &fmt->base.pixel_format : NULL,
+			fmt ? fmt->fetch_mode : -1,
+			cfg.danger_lut,
+			cfg.safe_lut);
 
 	pipe->sspp->ops.setup_qos_lut(pipe->sspp, &cfg);
 }
@@ -1118,9 +1118,9 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
 	pdpu->is_rt_pipe = is_rt_pipe;
 
 	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
-			", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
+			", %p4cc ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
 			crtc->base.id, DRM_RECT_ARG(&state->dst),
-			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
+			&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
 
 	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
 				   drm_mode_vrefresh(&crtc->mode),
diff --git a/drivers/gpu/drm/msm/msm_fb.c b/drivers/gpu/drm/msm/msm_fb.c
index e3f61c39df69..2cccf2ece7ac 100644
--- a/drivers/gpu/drm/msm/msm_fb.c
+++ b/drivers/gpu/drm/msm/msm_fb.c
@@ -176,16 +176,16 @@ static struct drm_framebuffer *msm_framebuffer_init(struct drm_device *dev,
 	const struct msm_format *format;
 	int ret, i, n;
 
-	drm_dbg_state(dev, "create framebuffer: mode_cmd=%p (%dx%d@%4.4s)",
-			mode_cmd, mode_cmd->width, mode_cmd->height,
-			(char *)&mode_cmd->pixel_format);
+	drm_dbg_state(dev, "create framebuffer: mode_cmd=%p (%dx%d@%p4cc)",
+		      mode_cmd, mode_cmd->width, mode_cmd->height,
+		      &mode_cmd->pixel_format);
 
 	n = info->num_planes;
 	format = kms->funcs->get_format(kms, mode_cmd->pixel_format,
 			mode_cmd->modifier[0]);
 	if (!format) {
-		DRM_DEV_ERROR(dev->dev, "unsupported pixel format: %4.4s\n",
-				(char *)&mode_cmd->pixel_format);
+		DRM_DEV_ERROR(dev->dev, "unsupported pixel format: %p4cc\n",
+			      &mode_cmd->pixel_format);
 		ret = -EINVAL;
 		goto fail;
 	}
-- 
2.39.2

