Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57135998752
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 15:15:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2B9710E8F0;
	Thu, 10 Oct 2024 13:15:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nY9x4eWy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
 [209.85.208.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 956D610E8F0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 13:15:23 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id
 38308e7fff4ca-2fad100dd9fso13883281fa.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 06:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728566122; x=1729170922; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HtB9kAVv9ewzwyyxT2HgaIAbvdU2B8U0xWvscjF8+ew=;
 b=nY9x4eWyhWBeeP7hsXFOwQ52R5PA/xNrnFlyX/pkF1gZab7gtlqDQPfvKal3sFcwJw
 4MoWSxLyguH1d2T/5iWTHznApZ0ZBtuYKFUfRg7Emcj/yMrthVIH80zjrmP8FCqU7w+B
 Q3gdR70L1QMhOb01zuS3370szu/YFZP0nm2Iy0y4W+Yyrdrfb2TcZMbc/2LlIFqsEfsw
 qT8GQXT/El78daN0bID3TJ9ZqNEEgC9fQGGg5V3SqwE+JzzUsJRZtkDxvjl0uS8jKFcZ
 0Xjj8S3G4bWjrh8ZT0IzNR7/iPrpUuvPufGt6kiNOwJHcbvVe82EejWW+HPHTMDVno1w
 qExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728566122; x=1729170922;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HtB9kAVv9ewzwyyxT2HgaIAbvdU2B8U0xWvscjF8+ew=;
 b=mdMm1VjnxNdNKZGE4aJwVWpA39+LGU8u1jhohNNm6OhaIzmvzg3+pawFqRJFiGvePe
 /VnBnuTs6Ye7I2kLnLKBBDxMEcJKqPQchdXMPI3CkQkO9X7u6LlEYamRBP/63fgDkXuN
 /RSyVh7JtcMUcp/hQDLIhf7BVz+cmkD0sZL+tduCNwhoO1fcGIMnnQjXrEmzfGMPCdvL
 l8cQ9lBt+WIJxVRuKZZyXheImtWNS32pwjXc3aX4zEIuMWhl9+yOwtrHgijbh3s1Xohl
 GOUK+pBQJDNnBJUOgYD+iCCLkV48E6UfMxg0VPs2jKxRHYL+rEnMXXeK9n8rc4ggmbne
 HogQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcbuhQQctmrP/H5xSUk3rPKztB8KKlelfcgK8Ph0mPEeHTdS+/67stjo4N1f0AEqmsoqyVCcOrw8M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZ65m0/qRAuBZUQ0x0t3vsoTfPfwaZoNzjCvHyAIKfu16psFIJ
 Twu46d5QEP1rAl/UmMo3Uy69ZVY1rcbQUae3McWtMvYmJWNRvt0BCXg2iesADiU=
X-Google-Smtp-Source: AGHT+IH87YK8uHv2ZWN1NNC54PbY4gQ2AIlsgM9SMaLpPP1t+mq+ARbZWeCTLYn1opz9zUFkkR2P9A==
X-Received: by 2002:a2e:be23:0:b0:2ef:1b1b:7f42 with SMTP id
 38308e7fff4ca-2fb187e7de2mr59795661fa.36.1728566121685; 
 Thu, 10 Oct 2024 06:15:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2fb2aeec78esm156381fa.96.2024.10.10.06.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 06:15:20 -0700 (PDT)
Date: Thu, 10 Oct 2024 16:15:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/14] drm/msm/dpu: blend pipes per mixer pairs config
Message-ID: <zig5zuf6hjcrkwmsdiahtzz3t3mxrmwxj65l43xij3zhfcyidn@fuisasnavvo3>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-9-76d4f5d413bf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-9-76d4f5d413bf@linaro.org>
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

On Wed, Oct 09, 2024 at 04:50:22PM GMT, Jun Nie wrote:
> Blend pipes by set of mixer pair config. The first 2 pipes are for left
> half screen with the first set of mixer pair config. And the later 2 pipes
> are for right in quad pipe case.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 38 ++++++++++++++++++-----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
>  2 files changed, 25 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 43d9817cd858f..66f745399a602 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>  	const struct msm_format *format;
>  	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
>  
> -	uint32_t lm_idx, i;
> +	uint32_t lm_idx, lm_pair, i, pipe_idx;
>  	bool bg_alpha_enable = false;
>  	DECLARE_BITMAP(fetch_active, SSPP_MAX);
>  
> @@ -463,15 +463,20 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>  		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>  			bg_alpha_enable = true;
>  
> -		for (i = 0; i < PIPES_PER_LM_PAIR; i++) {
> -			if (!pstate->pipe[i].sspp)
> -				continue;
> -			set_bit(pstate->pipe[i].sspp->idx, fetch_active);
> -			_dpu_crtc_blend_setup_pipe(crtc, plane,
> -						   mixer, cstate->num_mixers,
> -						   pstate->stage,
> -						   format, fb ? fb->modifier : 0,
> -						   &pstate->pipe[i], i, stage_cfg);
> +		/* loop pipe per mixer pair */
> +		for (lm_pair = 0; lm_pair < PIPES_PER_PLANE / 2; lm_pair++) {
> +			for (i = 0; i < PIPES_PER_LM_PAIR; i++) {
> +				pipe_idx = i + lm_pair * PIPES_PER_LM_PAIR;
> +				if (!pstate->pipe[pipe_idx].sspp)
> +					continue;
> +				set_bit(pstate->pipe[pipe_idx].sspp->idx, fetch_active);
> +				_dpu_crtc_blend_setup_pipe(crtc, plane,
> +							   mixer, cstate->num_mixers,
> +							   pstate->stage,
> +							   format, fb ? fb->modifier : 0,
> +							   &pstate->pipe[pipe_idx], i,
> +							   &stage_cfg[lm_pair]);
> +			}
>  		}
>  
>  		/* blend config update */
> @@ -503,7 +508,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
>  	struct dpu_crtc_mixer *mixer = cstate->mixers;
>  	struct dpu_hw_ctl *ctl;
>  	struct dpu_hw_mixer *lm;
> -	struct dpu_hw_stage_cfg stage_cfg;
> +	struct dpu_hw_stage_cfg stage_cfg[LM_PAIRS_PER_PLANE];

After seeing this code, can we define STAGES_PER_PLANE (and
also keep PLANES_PER_STAGE defined to 2)?

>  	int i;
>  
>  	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
> @@ -516,9 +521,9 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
>  	}
>  
>  	/* initialize stage cfg */
> -	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
> +	memset(&stage_cfg, 0, sizeof(stage_cfg));
>  
> -	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
> +	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg[0]);
>  
>  	for (i = 0; i < cstate->num_mixers; i++) {
>  		ctl = mixer[i].lm_ctl;
> @@ -535,8 +540,13 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
>  			mixer[i].mixer_op_mode,
>  			ctl->idx - CTL_0);
>  
> +		/*
> +		 * call dpu_hw_ctl_setup_blendstage() to blend layers per stage cfg.
> +		 * There is 4 mixers at most. The first 2 are for the left half, and
> +		 * the later 2 are for the right half.
> +		 */
>  		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
> -			&stage_cfg);
> +			&stage_cfg[i / 2]);
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 3277debe11689..d8f5cffa60ea6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -34,6 +34,7 @@
>  
>  #define PIPES_PER_PLANE			2
>  #define PIPES_PER_LM_PAIR		2
> +#define LM_PAIRS_PER_PLANE		2
>  #ifndef DPU_MAX_DE_CURVES
>  #define DPU_MAX_DE_CURVES		3
>  #endif
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
