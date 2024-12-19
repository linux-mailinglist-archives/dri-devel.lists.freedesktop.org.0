Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 045CC9F8882
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 00:30:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 040BE10E10C;
	Thu, 19 Dec 2024 23:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ar/idhav";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 534A710E2C2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 23:30:43 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-53e28cf55cdso1028908e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 15:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734651042; x=1735255842; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=t6eBWKvRM2MPJILKOAmrHC0njuvo1MCMYU0j99S0slw=;
 b=Ar/idhavOCcKmtCT14bTKQBqyyYuS9We/X/LmqwmcMc9BwR47BbSBOqyaH6mUBZ5TY
 vM279k3fH1bFr59XT3nCoH1wZq4GhrSpgBQ7u9RT4b7BbqvhRFi22HOkYcMjbw+h/THy
 q2ic3OFlS+/qEvSuC//g+QexYYSUeV7ehbmnyIYIl7T50u5JtK5mvIYajlYRJdo/7CbS
 GXN75l5hEfZMupNKSfYO93jT7m14BBy4mRhjkA8i6IGUpqcIVcfDj1SCftanq5DsL5RZ
 cPMSP1pO18V0Oc/RfwouHo910jizs4pRh0lTHgB/92tYEMw061o5R73g6QNH4JbSPocA
 cAKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734651042; x=1735255842;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t6eBWKvRM2MPJILKOAmrHC0njuvo1MCMYU0j99S0slw=;
 b=k0FbJxmj6z9s1VlSOve9suW/+m3gp+iGbB9qbiATJBMWiQwGxIC4SDpA9WAAtSvQ5q
 +aua8MoVwAYIDbcnnrAJE2pAtCmwjfjpWPQtHi3dXI/hYBdIca3axQRQzVAtTeEAJBi2
 iXwsrDdbK4JtkCGfnjeWeYsG6Rh+s3I4mk+zdRSIN5L4079z22nMaKIP+DT2uTYCUIwp
 NX5KWtrTPzvFVbkwvxEZg5e2xyH4qDjVwYRiDA7Qrcvt/wehGfThfclCia+UgsDV6b20
 h2RL68bOvtWuqfXMNYDeu6S5sPZYFWHTm+LnOHY3iEjZAEEmOKPQqXeqOyCFmF+cj5Dy
 zmrg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZ8740YZ5AMJugYdAFa6PY6W5Wa06s73xbkFMlpTlOeOhsiiypY1vxGChc5Xpzq9NLXqRfl6wSrWI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxrkTZlE1UL/ZseoYE9RMurkMPLdVD1m3Rj0s9y+bpmUbIE5kSt
 3LjqsE4G8VPYfx8yEFY3w34YZsMleRvIIYje6WWuUmyz/EFAagyP5+RaYqPFFAk=
X-Gm-Gg: ASbGncsCHiNDB0B6Ta2TPFp7vlBKUKYFRn4pwSNVNyYiDIqnZtyoiL7+XS8wAOKTXvq
 HgloIXDfsyb/CAGZIt7Zs6+loI2uQkUBeLeZAKgNoYwFfkSkCJyaw+cNmX2RjpPwi1kxcmOaWGv
 eA1ip0ds8PEhRQlDvLtzZnI7eNY6y+ZNMVe6ZMJlOJxNRi2gYzZUYaKTStEZWPlNnaIE/dwo/Uv
 dgcr44q3OB6t488ThvFn70Z+UCgD/7padeNN+1ZjRU5dwXkrtTsSMuzxe05Lco/t7YdSoEwmAJP
 LSJ2/dqWl7zVUrAWWjKgmMtfSRNGtYhtq/zi
X-Google-Smtp-Source: AGHT+IFVHf/rBMz3VrQOkPvPS2BjI7hYgByylqDkoLhYqr+25u8TOAePX5JNhA1si7R/9FpPW6Crfw==
X-Received: by 2002:a05:6512:3b9c:b0:540:2208:cce with SMTP id
 2adb3069b0e04-54229538a96mr150346e87.24.1734651041461; 
 Thu, 19 Dec 2024 15:30:41 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542236006b0sm311092e87.106.2024.12.19.15.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 15:30:40 -0800 (PST)
Date: Fri, 20 Dec 2024 01:30:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 14/15] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <3scdlpwphzguuwffpzwaqt6puedqrozpscrmyavq6a4fx73n6s@5dmcb23ky3ph>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-14-92c7c0a228e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-14-92c7c0a228e3@linaro.org>
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

On Thu, Dec 19, 2024 at 03:49:32PM +0800, Jun Nie wrote:
> Support SSPP assignment for quad-pipe case with unified method.
> The first 2 pipes can share a set of mixer config and enable
> multi-rect mode if condition is met. It is also the case for
> the later 2 pipes.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 67 ++++++++++++++++++-------------
>  1 file changed, 38 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 1cd98892898a4..57ccb73c45683 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1163,12 +1163,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
>  	struct dpu_rm_sspp_requirements reqs;
>  	struct dpu_plane_state *pstate;
> -	struct dpu_sw_pipe *pipe;
> -	struct dpu_sw_pipe *r_pipe;
> -	struct dpu_sw_pipe_cfg *pipe_cfg;
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg;
> +	struct dpu_plane *pdpu = to_dpu_plane(plane);
>  	const struct msm_format *fmt;
> -	int i;
> +	int i, num_lm, stage_id, num_stages;
>  
>  	if (plane_state->crtc)
>  		crtc_state = drm_atomic_get_new_crtc_state(state,
> @@ -1176,12 +1173,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  
>  	pstate = to_dpu_plane_state(plane_state);
>  
> -	/* TODO: loop below code for another pair later */
> -	pipe = &pstate->pipe[0];
> -	r_pipe = &pstate->pipe[1];
> -	pipe_cfg = &pstate->pipe_cfg[0];
> -	r_pipe_cfg = &pstate->pipe_cfg[1];
> -
>  	for (i = 0; i < PIPES_PER_PLANE; i++)
>  		pstate->pipe[i].sspp = NULL;
>  
> @@ -1195,24 +1186,42 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
>  
>  	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
>  
> -	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -	if (!pipe->sspp)
> -		return -ENODEV;
> -
> -	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> -					      pipe->sspp,
> -					      msm_framebuffer_format(plane_state->fb),
> -					      dpu_kms->catalog->caps->max_linewidth)) {
> -		/* multirect is not possible, use two SSPP blocks */
> -		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> -		if (!r_pipe->sspp)
> -			return -ENODEV;
> -
> -		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> -
> -		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +	num_lm = dpu_crtc_get_num_lm(crtc_state);
> +	num_stages = (num_lm + 1) / 2;
> +	for (stage_id = 0; stage_id < num_stages; stage_id++) {
> +		for (i = stage_id * PIPES_PER_STAGE; i < (stage_id + 1) * PIPES_PER_STAGE; i++) {
> +			struct dpu_sw_pipe *pipe = &pstate->pipe[i];
> +			struct dpu_sw_pipe *r_pipe = &pstate->pipe[i + 1];
> +			struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[i];
> +			struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[i + 1];

I'd rather not have r_pipe / r_pipe_cfg for the second pipe in the pair.
Please move them under the if.

Also take a look at [1]. I'm not asking to rebase on top of that change,
it need to be reviewed by other parties, but please keep it in mind.

[1] https://lore.kernel.org/r/20241215-dpu-share-sspp-v5-1-665d266183f9@linaro.org

> +
> +			if (!pipe_cfg->valid)
> +				break;
> +
> +			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> +			if (!pipe->sspp)
> +				return -ENODEV;
> +
> +			/*
> +			 * If current pipe is the first pipe in pipe pair, check
> +			 * multi-rect opportunity for the 2nd pipe in the pair.
> +			 * SSPP multi-rect mode cross mixer pairs is not supported.
> +			 */
> +			if ((i % PIPES_PER_STAGE == 0) &&
> +			    r_pipe_cfg->valid &&
> +			    !dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
> +							      pipe->sspp,
> +							      msm_framebuffer_format(plane_state->fb),
> +							      dpu_kms->catalog->caps->max_linewidth)) {
> +				i++;
> +			} else {
> +				/* multirect is not possible, use two SSPP blocks */
> +				pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +				pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +				DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d.\n",
> +						pipe->sspp->idx - SSPP_NONE, i);
> +			}
> +		}
>  	}
>  
>  	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
