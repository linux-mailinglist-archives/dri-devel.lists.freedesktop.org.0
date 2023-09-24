Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 083547AC78F
	for <lists+dri-devel@lfdr.de>; Sun, 24 Sep 2023 12:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C7710E11A;
	Sun, 24 Sep 2023 10:29:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84B5810E125
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 10:29:07 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-532c66a105bso5395877a12.3
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Sep 2023 03:29:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695551345; x=1696156145; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Nbc4SBJzI3SAAZeeJhZ6/5GW5H6amKESEP+VIUjBVso=;
 b=W8r0vyv0ti7EjXCk7UTsDEGD+Mc4EBnC7uLoNSmXrbKNezKvJqntNORg7TJyrtZMD2
 h1S27BMvPifP2XZDdg4FaoorKSU5Oy8i1CjG3TyEfrz7G1zs/zcthDhxcFuDwNggk9eJ
 eDPgTBwDHitxB1udIj3B5j4rPjWQyzXyBQO0nKnjGPSLmYFk78Kf6MaOZE50FZVGgvcN
 C4/eHQuZPY2g2IeqhpqdTwH4ADI3EeuVL3aMJxdzwXFtEvN1QaQ2CSItEJFP+shQDnbO
 gg5zXTeF69cfbddlUV2vz/fGEUAb+Jg/dsHs45yi4+8ANYB1f9/P89xJimrvAF9SOc8r
 RcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695551345; x=1696156145;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Nbc4SBJzI3SAAZeeJhZ6/5GW5H6amKESEP+VIUjBVso=;
 b=ofD84CL4GuxQ85cn9NgxF4ey8mGfGMCtSVdyovePBd1xEZekKwnfUcvtuJxYUlAD1p
 XR7RZftQ6uBdpZmqvC6YCVyozq+HrLCpl326ylSfriHLy5tvnwoL4yftj76gMzM0B/R+
 iU5tTeyaEEUoSSRPZSjUAf7GQ5v2o0u8fI11d2etulG1cvEpCnRKHaKuVJvf6TiNPXFt
 sEoP/FGtclB+mrMxGLL8t3ARfcOa3kmNmv57MoRnsFR7fg+VEg8i6HEKlRKyBnQ31m84
 LyXlAEt0HFyqpa283E024zkgvlAzz1DnJ8NX5OR7uMnYItlhIshHuBrNIgCvXG34PjH+
 Lq4w==
X-Gm-Message-State: AOJu0YwVkJqFTfrtzFV1SsF14vw72MqCGfU0KgP8S3Fn2UkFVo14G58z
 MZ3pkw6ieus8KXtMVEXrAF6BKg==
X-Google-Smtp-Source: AGHT+IF6bAns8yGi5kzdcAwLnOHgRn70eXm2R80TU2tam3x1oqVlcLZLihzPzFGSyzauBV4H3GJ8ew==
X-Received: by 2002:aa7:db99:0:b0:525:680a:6b89 with SMTP id
 u25-20020aa7db99000000b00525680a6b89mr3206467edt.12.1695551345403; 
 Sun, 24 Sep 2023 03:29:05 -0700 (PDT)
Received: from [10.73.151.44] ([188.111.42.10])
 by smtp.gmail.com with ESMTPSA id
 q3-20020aa7d443000000b0052576969ef8sm4182115edr.14.2023.09.24.03.29.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Sep 2023 03:29:04 -0700 (PDT)
Message-ID: <494ede51-46bf-437b-98b8-2460f4c40285@linaro.org>
Date: Sun, 24 Sep 2023 13:29:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v6 08/10] drm/msm/dpu: Allow NULL FBs in atomic commit
Content-Language: en-GB
To: Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230828-solid-fill-v6-0-a820efcce852@quicinc.com>
 <20230828-solid-fill-v6-8-a820efcce852@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230828-solid-fill-v6-8-a820efcce852@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: sebastian.wick@redhat.com, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 ppaalanen@gmail.com, laurent.pinchart@ideasonboard.com,
 linux-arm-msm@vger.kernel.org, wayland-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/08/2023 03:05, Jessica Zhang wrote:
> Since solid fill planes allow for a NULL framebuffer in a valid commit,
> add NULL framebuffer checks to atomic commit calls within DPU.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  9 ++++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 41 ++++++++++++++++++++-----------
>   2 files changed, 34 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 8ce7586e2ddf..5e845510e8c1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -451,6 +451,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   	struct drm_plane_state *state;
>   	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
>   	struct dpu_plane_state *pstate = NULL;
> +	const struct msm_format *fmt;
>   	struct dpu_format *format;
>   	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
>   
> @@ -470,7 +471,13 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   		pstate = to_dpu_plane_state(state);
>   		fb = state->fb;
>   
> -		format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
> +		if (drm_plane_solid_fill_enabled(state))
> +			fmt = dpu_get_msm_format(&_dpu_crtc_get_kms(crtc)->base,
> +					DRM_FORMAT_ABGR8888, 0);
> +		else
> +			fmt = msm_framebuffer_format(pstate->base.fb);
> +
> +		format = to_dpu_format(fmt);
>   
>   		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>   			bg_alpha_enable = true;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index c2aaaded07ed..114c803ff99b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -837,8 +837,13 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   
>   	pipe_cfg->dst_rect = new_plane_state->dst;
>   
> -	fb_rect.x2 = new_plane_state->fb->width;
> -	fb_rect.y2 = new_plane_state->fb->height;
> +	if (drm_plane_solid_fill_enabled(new_plane_state))
> +		return 0;

This would skip all the width checks, dpu_plane_atomic_check_pipe(), 
etc. Could you please confirm that all of those checks are irrelevant 
for solid fill?

> +
> +	if (new_plane_state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && new_plane_state->fb) {
> +		fb_rect.x2 = new_plane_state->fb->width;
> +		fb_rect.y2 = new_plane_state->fb->height;
> +	}
>   
>   	/* Ensure fb size is supported */
>   	if (drm_rect_width(&fb_rect) > MAX_IMG_WIDTH ||
> @@ -1082,21 +1087,32 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   	struct drm_crtc *crtc = state->crtc;
>   	struct drm_framebuffer *fb = state->fb;
>   	bool is_rt_pipe;
> -	const struct dpu_format *fmt =
> -		to_dpu_format(msm_framebuffer_format(fb));
> +	const struct dpu_format *fmt;
>   	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
>   	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
>   	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>   	struct msm_gem_address_space *aspace = kms->base.aspace;
>   	struct dpu_hw_fmt_layout layout;
>   	bool layout_valid = false;
> -	int ret;
>   
> -	ret = dpu_format_populate_layout(aspace, fb, &layout);
> -	if (ret)
> -		DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
> -	else
> -		layout_valid = true;
> +	if (state->pixel_source == DRM_PLANE_PIXEL_SOURCE_FB && fb) {
> +		int ret;
> +
> +		fmt = to_dpu_format(msm_framebuffer_format(fb));
> +
> +		ret = dpu_format_populate_layout(aspace, fb, &layout);
> +		if (ret)
> +			DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
> +		else
> +			layout_valid = true;
> +
> +		DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
> +				", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
> +				crtc->base.id, DRM_RECT_ARG(&state->dst),
> +				(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
> +	} else {
> +		fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);

#define DPU_SOLID_FILL_FORMAT ?

Also, I don't think that solid_fill planes consume bandwidth, so this 
likely needs to be fixed too.


> +	}
>   
>   	pstate->pending = true;
>   
> @@ -1104,11 +1120,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   	pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
>   	pdpu->is_rt_pipe = is_rt_pipe;
>   
> -	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
> -			", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
> -			crtc->base.id, DRM_RECT_ARG(&state->dst),
> -			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
> -
>   	dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
>   				   drm_mode_vrefresh(&crtc->mode),
>   				   layout_valid ? &layout : NULL);
> 

-- 
With best wishes
Dmitry

