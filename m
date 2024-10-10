Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E2C9987B2
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 15:29:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9300410E2C1;
	Thu, 10 Oct 2024 13:29:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="fCgMzsEn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD49510E8F6
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 13:29:29 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5398e58ceebso866004e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 06:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728566968; x=1729171768; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=aIRrb2wEe1hj9N3JMi3Dpdq5hzianelOOR87NEysFh8=;
 b=fCgMzsEnEaY04k++SmRD1PJ77EKqi0C8KTbRnatfLUYVWnIJCRuyqFBLD+aans+dgh
 Gvi0saClbr33nSdQhGdMRRWv08smxX8Xy1jH/UzOg2RdVcrVhsLIsMVIKYj5dbj6ObYQ
 8xOxFLNf2guu1SMHN14xNdZqM0B1VZFxNrx2Xxmw1qFCLp8O21SSPHOGyX5RrWNRX0N7
 wQ/xtesGkpFFC80rIifuqs2YzoLZz2lxfocP1aopJ9mCcCwFNl7lUiZU8JPL8LF7V2rj
 kKCpMvfWjLYUtaW11v6VBSeVieAPEFkqByOKU9xnjLeITFNAHKF2lOfO+giP9s/CO+nv
 /BQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728566968; x=1729171768;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aIRrb2wEe1hj9N3JMi3Dpdq5hzianelOOR87NEysFh8=;
 b=X7i0PM8Jd969xTtqBj8RgrH3QEVIPyyPLTpfGgecVoIUqN70zKBY8DvAJjkKGifjld
 1mccRjpuTUTUYUy4DbHgCbSJnj6ZAZLyB8mXnT75XUsiM9CA7P7MeG5YYcNjs3twEhpc
 F1rwCyadkk3HCLTlCaOCLsxrB/nwSeckOMWwO4A0GDGD1Ih2Ta1QInTDiWkXYff+CL6j
 tt4zF3Pdtc7/tjPR5azeDvRZW9Hzzv27FPaThvOgSpewvH2Fj6I3RbF2lNIOVFQMI3b6
 uPek+EobnISDU9YGESb6UCs7iOLypA7h2LiPjSfgaRafbDaYAj2ZrSAPML76Fkjo7oJh
 3dDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfq1l21PALQ657uEYJ2GFVZCHxWkAzb4rq/9dA9X6y7xAgowFWlmLvZE39jtzzavCAwdKioE3Hu68=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxRQa9lD7Q2PAS5hGBh0EngMiA/49p6FMBREcJB3knaDTfnLTk4
 uNgGEBW2RgCCXmLMYCFoK5EFRCMv17f4eSJJNh5LwepbnDz8M/ys0PBib03PhX4=
X-Google-Smtp-Source: AGHT+IGMe8PYLFKDdJ+rZpvGWnekbe6xbW3i8IXiFfzFUZoZ5UqBHRrrc/oUIH85ZxmH4Lx2PbhaBQ==
X-Received: by 2002:a05:6512:10c9:b0:539:a2e0:4e94 with SMTP id
 2adb3069b0e04-539c98964afmr997624e87.30.1728566967869; 
 Thu, 10 Oct 2024 06:29:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539cb905177sm253339e87.250.2024.10.10.06.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 06:29:26 -0700 (PDT)
Date: Thu, 10 Oct 2024 16:29:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/14] drm/msm/dpu: support plane splitting in
 quad-pipe case
Message-ID: <fbqhq7zvusll377oxi4tcr4bpgwhab2xbnfw2izotua5me4ufe@syy4jundvccf>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-12-76d4f5d413bf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-12-76d4f5d413bf@linaro.org>
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

On Wed, Oct 09, 2024 at 04:50:25PM GMT, Jun Nie wrote:
> Clip plane into pipes per left and right half screen ROI if topology
> is quad pipe.

Why? Please provide an explanation for the reviewers not knowing the
details.

> Then split the clipped rectangle by half if the rectangle
> width still exceeds width limit.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |  6 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 99 ++++++++++++++++++++++---------
>  3 files changed, 84 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 66f745399a602..d2aca0a9493d5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1310,6 +1310,13 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
>  	return 0;
>  }
>  
> +unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state)

I think the DPU driver uses num_foo rather than foo_num

> +{
> +	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> +
> +	return cstate->num_mixers;
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>  {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 5260e2440f059..ee7cf71f89fc7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -304,4 +304,10 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
>  
>  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
>  
> +/**
> + * dpu_crtc_get_lm_num - Get mixer number in this CRTC pipeline
> + * state: Pointer to drm crtc state object
> + */
> +unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state);
> +
>  #endif /* _DPU_CRTC_H_ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 898fc2937954e..480a1b46aba72 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -837,10 +837,12 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
>  	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>  	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> -	struct dpu_sw_pipe_cfg *pipe_cfg;
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg;
> +	struct dpu_sw_pipe_cfg pipe_cfg;
>  	struct drm_rect fb_rect = { 0 };
> +	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>  	uint32_t max_linewidth;
> +	u32 lm_num;
> +	int lmcfg_id, lmcfg_num;
>  
>  	min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
>  	max_scale = MAX_DOWNSCALE_RATIO << 16;
> @@ -863,13 +865,10 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
>  		return -EINVAL;
>  	}
>  
> -	/* move the assignment here, to ease handling to another pairs later */
> -	pipe_cfg = &pstate->pipe_cfg[0];
> -	r_pipe_cfg = &pstate->pipe_cfg[1];
> -	/* state->src is 16.16, src_rect is not */
> -	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> +	lm_num = dpu_crtc_get_lm_num(crtc_state);
>  
> -	pipe_cfg->dst_rect = new_plane_state->dst;
> +	/* state->src is 16.16, src_rect is not */
> +	drm_rect_fp_to_int(&pipe_cfg.src_rect, &new_plane_state->src);
>  
>  	fb_rect.x2 = new_plane_state->fb->width;
>  	fb_rect.y2 = new_plane_state->fb->height;
> @@ -884,34 +883,78 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
>  
>  	max_linewidth = pdpu->catalog->caps->max_linewidth;
>  
> -	drm_rect_rotate(&pipe_cfg->src_rect,
> +	drm_rect_rotate(&pipe_cfg.src_rect,
>  			new_plane_state->fb->width, new_plane_state->fb->height,
>  			new_plane_state->rotation);
>  
> -	if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> -	     _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
> -		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> -			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> -					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> -			return -E2BIG;
> +	/*
> +	 * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer pair
> +	 * configs for left and right half screen in case of 4:4:2 topology.
> +	 * But we may have 2 rect to split plane with 1 config for 2:2:1.
> +	 * So need to handle super wide plane splitting, and plane on right half
> +	 * for quad-pipe case. Check dest rectangle left/right clipping
> +	 * first, then check super wide rectangle splitting in every half next.
> +	 */
> +	lmcfg_num = (lm_num + 1) / 2;

num_stages?

> +	/* iterate mixer configs for this plane, to separate left/right with the id */
> +	for (lmcfg_id = 0; lmcfg_id < lmcfg_num; lmcfg_id++) {
> +		struct drm_rect mixer_rect = {lmcfg_id * mode->hdisplay / lmcfg_num, 0,
> +					(lmcfg_id + 1) * mode->hdisplay / lmcfg_num, mode->vdisplay};
> +		int cfg_idx = lmcfg_id * PIPES_PER_LM_PAIR;
> +		struct dpu_sw_pipe_cfg *cur_pipecfg = &pstate->pipe_cfg[cfg_idx];
> +
> +		drm_rect_fp_to_int(&cur_pipecfg->src_rect, &new_plane_state->src);
> +		cur_pipecfg->dst_rect = new_plane_state->dst;
> +
> +		DPU_DEBUG_PLANE(pdpu, "checking src " DRM_RECT_FMT
> +				" vs clip window " DRM_RECT_FMT "\n",
> +				DRM_RECT_ARG(&cur_pipecfg->src_rect),
> +				DRM_RECT_ARG(&mixer_rect));
> +
> +		/* If this plane does not fall into mixer rect, check next mixer rect */
> +		if (!drm_rect_clip_scaled(&cur_pipecfg->src_rect, &cur_pipecfg->dst_rect, &mixer_rect)) {
> +			memset(&pstate->pipe_cfg[cfg_idx], 0, 2 * sizeof(struct dpu_sw_pipe_cfg));
> +			memset(&pstate->pipe[cfg_idx], 0, 2 * sizeof(struct dpu_sw_pipe));
> +			continue;
>  		}
>  
> -		*r_pipe_cfg = *pipe_cfg;
> -		pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> -		pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> -		r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> -		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> -	} else {
> -		memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
> -	}
> +		cur_pipecfg->valid = true;

... and checks have been broken up to now. This isn't good.

> +		cur_pipecfg->dst_rect.x1 -= mixer_rect.x1;
> +		cur_pipecfg->dst_rect.x2 -= mixer_rect.x1;
> +
> +		DPU_DEBUG_PLANE(pdpu, "Got clip src:" DRM_RECT_FMT " dst: " DRM_RECT_FMT "\n",
> +				DRM_RECT_ARG(&cur_pipecfg->src_rect), DRM_RECT_ARG(&cur_pipecfg->dst_rect));
> +
> +		/* Split super wide rect into 2 rect */
> +		if ((drm_rect_width(&cur_pipecfg->src_rect) > max_linewidth) ||
> +		     _dpu_plane_calc_clk(mode, cur_pipecfg) > max_mdp_clk_rate) {
> +			struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[cfg_idx + 1];
> +
> +			if (drm_rect_width(&cur_pipecfg->src_rect) > 2 * max_linewidth) {
> +				DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> +						DRM_RECT_ARG(&cur_pipecfg->src_rect), max_linewidth);
> +				return -E2BIG;
> +			}
> +
> +			memcpy(r_pipe_cfg, cur_pipecfg, sizeof(struct dpu_sw_pipe_cfg));
> +			cur_pipecfg->src_rect.x2 = (cur_pipecfg->src_rect.x1 + cur_pipecfg->src_rect.x2) >> 1;
> +			cur_pipecfg->dst_rect.x2 = (cur_pipecfg->dst_rect.x1 + cur_pipecfg->dst_rect.x2) >> 1;

pipe_cfg. If you need, rename the topmost var name.

> +			r_pipe_cfg->src_rect.x1 = cur_pipecfg->src_rect.x2;
> +			r_pipe_cfg->dst_rect.x1 = cur_pipecfg->dst_rect.x2;
> +			r_pipe_cfg->valid = true;
> +			DPU_DEBUG_PLANE(pdpu, "Split super wide plane into:"
> +					DRM_RECT_FMT " and " DRM_RECT_FMT "\n",
> +					DRM_RECT_ARG(&cur_pipecfg->src_rect),
> +					DRM_RECT_ARG(&r_pipe_cfg->src_rect));
> +		} else {
> +			memset(&pstate->pipe_cfg[cfg_idx + 1], 0, sizeof(struct dpu_sw_pipe_cfg));
> +			memset(&pstate->pipe[cfg_idx + 1], 0, sizeof(struct dpu_sw_pipe));

Please keep using r_pipe_cfg here.

> +		}
>  
> -	drm_rect_rotate_inv(&pipe_cfg->src_rect,
> -			    new_plane_state->fb->width, new_plane_state->fb->height,
> -			    new_plane_state->rotation);
> -	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
> -		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> +		drm_rect_rotate_inv(&cur_pipecfg->src_rect,
>  				    new_plane_state->fb->width, new_plane_state->fb->height,
>  				    new_plane_state->rotation);
> +	}
>  
>  	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
