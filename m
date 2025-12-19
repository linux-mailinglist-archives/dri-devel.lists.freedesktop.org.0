Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD1B1CD1B14
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 20:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDA4610F0A0;
	Fri, 19 Dec 2025 19:55:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay01.th.seeweb.it (relay01.th.seeweb.it [5.144.164.162])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C8510F09E
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 19:55:21 +0000 (UTC)
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl
 [94.211.6.86])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 23E09208B3;
 Fri, 19 Dec 2025 20:55:19 +0100 (CET)
Date: Fri, 19 Dec 2025 20:55:17 +0100
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jun Nie <jun.nie@linaro.org>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] Revert "drm/msm/dpu: support plane splitting in
 quad-pipe case"
Message-ID: <aUWqtbpldOG-dqIy@SoMainline.org>
References: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
 <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-1-654b46505f84@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-1-654b46505f84@oss.qualcomm.com>
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

On 2025-12-19 12:39:01, Abel Vesa wrote:
> This reverts commit 5978864e34b66bdae4d7613834c03dd5d0a0c891.
> 
> At least on Hamoa based devices, there are IOMMU faults:
> 
> arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402, iova=0x00000000, fsynr=0x3d0023, cbfrsynra=0x1c00, cb=13
> arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0x1c00
> arm-smmu 15000000.iommu: FSYNR0 = 003d0023 [S1CBNDX=61 PNU PLVL=3]

I thought that this was normal, and that I was always seeing these on startup
(something to do with framebuffer), but indeed by reverting this patch these
are gone on at least the Xperia XZ2 (regular CMD-mode panel) and XZ3 (CMD-mode
panel, 2:2:1 DSC-merge topology), both sdm845-based phones.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> While on some of these devices, there are also all sorts of artifacts on eDP.
> 
> Reverting this fixes these issues.
> 
> Closes: https://lore.kernel.org/r/z75wnahrp7lrl5yhfdysr3np3qrs6xti2i4otkng4ex3blfgrx@xyiucge3xykb/
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 -
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 137 +++++++++---------------------
>  3 files changed, 40 insertions(+), 110 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index c39f1908ea65..011946bbf5a2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1620,17 +1620,6 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
>  	return 0;
>  }
>  
> -/**
> - * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> - * @state: Pointer to drm crtc state object
> - */
> -unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
> -{
> -	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> -
> -	return cstate->num_mixers;
> -}
> -
>  #ifdef CONFIG_DEBUG_FS
>  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>  {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 455073c7025b..2c83f1578fc3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -267,6 +267,4 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
>  
>  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
>  
> -unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
> -
>  #endif /* _DPU_CRTC_H_ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index d07a6ab6e7ee..9b7a8b46bfa9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -826,12 +826,8 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
>  	struct dpu_sw_pipe_cfg *pipe_cfg;
>  	struct dpu_sw_pipe_cfg *r_pipe_cfg;
> -	struct dpu_sw_pipe_cfg init_pipe_cfg;
>  	struct drm_rect fb_rect = { 0 };
> -	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>  	uint32_t max_linewidth;
> -	u32 num_lm;
> -	int stage_id, num_stages;
>  
>  	min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
>  	max_scale = MAX_DOWNSCALE_RATIO << 16;
> @@ -854,10 +850,13 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>  		return -EINVAL;
>  	}
>  
> -	num_lm = dpu_crtc_get_num_lm(crtc_state);
> -
> +	/* move the assignment here, to ease handling to another pairs later */
> +	pipe_cfg = &pstate->pipe_cfg[0];
> +	r_pipe_cfg = &pstate->pipe_cfg[1];
>  	/* state->src is 16.16, src_rect is not */
> -	drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_state->src);
> +	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> +
> +	pipe_cfg->dst_rect = new_plane_state->dst;
>  
>  	fb_rect.x2 = new_plane_state->fb->width;
>  	fb_rect.y2 = new_plane_state->fb->height;
> @@ -882,94 +881,35 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
>  
>  	max_linewidth = pdpu->catalog->caps->max_linewidth;
>  
> -	drm_rect_rotate(&init_pipe_cfg.src_rect,
> +	drm_rect_rotate(&pipe_cfg->src_rect,
>  			new_plane_state->fb->width, new_plane_state->fb->height,
>  			new_plane_state->rotation);
>  
> -	/*
> -	 * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer pair
> -	 * configs for left and right half screen in case of 4:4:2 topology.
> -	 * But we may have 2 rect to split wide plane that exceeds limit with 1
> -	 * config for 2:2:1. So need to handle both wide plane splitting, and
> -	 * two halves of screen splitting for quad-pipe case. Check dest
> -	 * rectangle left/right clipping first, then check wide rectangle
> -	 * splitting in every half next.
> -	 */
> -	num_stages = (num_lm + 1) / 2;
> -	/* iterate mixer configs for this plane, to separate left/right with the id */
> -	for (stage_id = 0; stage_id < num_stages; stage_id++) {
> -		struct drm_rect mixer_rect = {
> -			.x1 = stage_id * mode->hdisplay / num_stages,
> -			.y1 = 0,
> -			.x2 = (stage_id + 1) * mode->hdisplay / num_stages,
> -			.y2 = mode->vdisplay
> -			};
> -		int cfg_idx = stage_id * PIPES_PER_STAGE;
> -
> -		pipe_cfg = &pstate->pipe_cfg[cfg_idx];
> -		r_pipe_cfg = &pstate->pipe_cfg[cfg_idx + 1];
> -
> -		drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> -		pipe_cfg->dst_rect = new_plane_state->dst;
> -
> -		DPU_DEBUG_PLANE(pdpu, "checking src " DRM_RECT_FMT
> -				" vs clip window " DRM_RECT_FMT "\n",
> -				DRM_RECT_ARG(&pipe_cfg->src_rect),
> -				DRM_RECT_ARG(&mixer_rect));
> -
> -		/*
> -		 * If this plane does not fall into mixer rect, check next
> -		 * mixer rect.
> -		 */
> -		if (!drm_rect_clip_scaled(&pipe_cfg->src_rect,
> -					  &pipe_cfg->dst_rect,
> -					  &mixer_rect)) {
> -			memset(pipe_cfg, 0, 2 * sizeof(struct dpu_sw_pipe_cfg));
> -
> -			continue;
> +	if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> +	     _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
> +		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> +			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> +					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> +			return -E2BIG;
>  		}
>  
> -		pipe_cfg->dst_rect.x1 -= mixer_rect.x1;
> -		pipe_cfg->dst_rect.x2 -= mixer_rect.x1;
> -
> -		DPU_DEBUG_PLANE(pdpu, "Got clip src:" DRM_RECT_FMT " dst: " DRM_RECT_FMT "\n",
> -				DRM_RECT_ARG(&pipe_cfg->src_rect), DRM_RECT_ARG(&pipe_cfg->dst_rect));
> -
> -		/* Split wide rect into 2 rect */
> -		if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> -		     _dpu_plane_calc_clk(mode, pipe_cfg) > max_mdp_clk_rate) {
> -
> -			if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> -				DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> -						DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> -				return -E2BIG;
> -			}
> -
> -			memcpy(r_pipe_cfg, pipe_cfg, sizeof(struct dpu_sw_pipe_cfg));
> -			pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> -			pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> -			r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> -			r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> -			DPU_DEBUG_PLANE(pdpu, "Split wide plane into:"
> -					DRM_RECT_FMT " and " DRM_RECT_FMT "\n",
> -					DRM_RECT_ARG(&pipe_cfg->src_rect),
> -					DRM_RECT_ARG(&r_pipe_cfg->src_rect));
> -		} else {
> -			memset(r_pipe_cfg, 0, sizeof(struct dpu_sw_pipe_cfg));
> -		}
> +		*r_pipe_cfg = *pipe_cfg;
> +		pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> +		pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> +		r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> +		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> +	} else {
> +		memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
> +	}
>  
> -		drm_rect_rotate_inv(&pipe_cfg->src_rect,
> -				    new_plane_state->fb->width,
> -				    new_plane_state->fb->height,
> +	drm_rect_rotate_inv(&pipe_cfg->src_rect,
> +			    new_plane_state->fb->width, new_plane_state->fb->height,
> +			    new_plane_state->rotation);
> +	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
> +		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> +				    new_plane_state->fb->width, new_plane_state->fb->height,
>  				    new_plane_state->rotation);
>  
> -		if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
> -			drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> -					    new_plane_state->fb->width,
> -					    new_plane_state->fb->height,
> -					    new_plane_state->rotation);
> -	}
> -
>  	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
>  
>  	return 0;
> @@ -1045,17 +985,20 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
>  		drm_atomic_get_new_plane_state(state, plane);
>  	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> -	struct dpu_sw_pipe *pipe;
> -	struct dpu_sw_pipe_cfg *pipe_cfg;
> -	int ret = 0, i;
> +	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> +	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> +	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> +	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
> +	int ret = 0;
>  
> -	for (i = 0; i < PIPES_PER_PLANE; i++) {
> -		pipe = &pstate->pipe[i];
> -		pipe_cfg = &pstate->pipe_cfg[i];
> -		if (!drm_rect_width(&pipe_cfg->src_rect))
> -			continue;
> -		DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n", i);
> -		ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> +	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> +					  &crtc_state->adjusted_mode,
> +					  new_plane_state);
> +	if (ret)
> +		return ret;
> +
> +	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> +		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg,
>  						  &crtc_state->adjusted_mode,
>  						  new_plane_state);
>  		if (ret)
> 
> -- 
> 2.48.1
> 
