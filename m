Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC5AA3FB75
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 17:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE7F10EAF9;
	Fri, 21 Feb 2025 16:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="g/OJEnmk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com
 [209.85.208.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24A0F10EAB7
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 16:36:20 +0000 (UTC)
Received: by mail-lj1-f178.google.com with SMTP id
 38308e7fff4ca-30a2dfcfd83so22444041fa.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 08:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740155778; x=1740760578; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=bPds9oAtueHibvIS0BHa1Q9Tu3GfdsskW31+FCbd/E0=;
 b=g/OJEnmkJKn7WNnfypHHRLoJ1gvMyo5WlKtdrPq7Lq5FsbOqfqdiz6avCdhy6CLKrd
 T4Zekil6PrPDYKiatNSI5oA4ldG0wLkqhRfwTC/4cIaCXP/0HL5rfBSMNGAXsVMTXe+I
 CKpVmgBoJ/oqHeFVCCXQZKMdpIcym+EP5A6GBbs48dZZ0cfpsncXANG2PY7aWx0ukvfe
 B4A9OeF3lBhlW9ky/cHMzePQtayKKys8Nb+uScH5OlueT0v9Lu61uNEzSX3FUKxAduM3
 qpxzSmFTc+oB4rfyJPF/zfaDRUVZmi742cZLBxgEHiCeCpMdMv+5ADY8nLNMZF88rh/R
 Idjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740155778; x=1740760578;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bPds9oAtueHibvIS0BHa1Q9Tu3GfdsskW31+FCbd/E0=;
 b=MRvtYO+Fx3Yz7SFnf/FYHJL3nXTM4fScuO4WT8MJVGBG3KTloLdFghyjluLW2M13JS
 KQRpX9OnlH4Y/zsIbccp+CCkNP0/vv/UCbbBCS8Q3tgFoViIE7Xjq9DkJq8MBmj12o76
 +iLRViYKtwhAy+Jk7+tfgEloy61Jz0akmSogU55eFd0K/00AoA5vpJGZ7ylN3kDq7OCa
 mtRNbYoK+jMRh3FhzxONfpoxnk25watjG97Nb1NQR3vdTYKoCiIpMkyHP/W5NvKBLrro
 2ggZYTb9O74/aSy1VGMw1rjmSXKMAdbpKQjcajrENNNKB838Lhc/ZTloCjtmH7wgc4SC
 JgTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXP1EZtwfDm6TRwmKjsJmKFMqHPhS5OsWnED1vsvQHP5w/yo+kngWNe0cFC3ZdyZEwu6sgfmfhpV+0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzbev4Tckfs4Uo7gQaNHlyZxcdx2upM5wBrQe7weqEdemfaQVrn
 t38/wrx/KOPrg3HYKM/pWChjhw5rWg0eWTJ6Qy2SMO+MAEDleRKEjj2Ta3fcMGQ=
X-Gm-Gg: ASbGncvVeYEJhuc4OIcA/zP1DYiEmKurfWJ9TGdYggYlIcFnagn2i+/0PYNj0MAWmex
 DW7+DEY8zBlGS64Rq/Z+LJsX3j33QBAkIilJLoWKvrmXwbV4FnOHuma/EWc/a0UqghOHfLU8jM/
 v65mk7G3CLo1k6AzLBDJvOjdoQt30k1OdCKorM9lvpJjD0IhHICYTgzLtn8qLcewF4mPFTyG3o8
 8BmxTCXnd4s+3KUC+p7Mq7c3go29F39AHv8oIu3Z3cR53ztzhSV4KDfd89HuNbZtVfN5AHBTI5i
 ZuQuWg4X6f6hmmDYQzVkRVYZPxsmBks7dB5jzO8y26B1C7y9cFevQkO4z8gFamXLOGeyQfiljNt
 hq0aJ8w==
X-Google-Smtp-Source: AGHT+IG5OE0xMdR23O2TUN2vTwu+eGSplv/MmFU+Pt5AentUHO2eMzUBhfbNGyJXT3btW78Y1ZdZVw==
X-Received: by 2002:a05:6512:104e:b0:545:2e5d:f3f3 with SMTP id
 2adb3069b0e04-54838f5b0bcmr1640970e87.46.1740155777708; 
 Fri, 21 Feb 2025 08:36:17 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-545637f0e14sm1961903e87.86.2025.02.21.08.36.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 08:36:16 -0800 (PST)
Date: Fri, 21 Feb 2025 18:36:13 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 13/15] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Message-ID: <khmeegjx5jmu4c32un3gqu7sumkbtdkg6cawwwmwtmkp5gkrag@sklf5tr7qbwv>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-13-c11402574367@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-13-c11402574367@linaro.org>
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

On Mon, Feb 17, 2025 at 10:16:02PM +0800, Jun Nie wrote:
> Currently, SSPPs are assigned to a maximum of two pipes. However,
> quad-pipe usage scenarios require four pipes and involve configuring
> two stages. In quad-pipe case, the first two pipes share a set of
> mixer configurations and enable multi-rect mode when certain
> conditions are met. The same applies to the subsequent two pipes.
> 
> Assign SSPPs to the pipes in each stage using a unified method and
> to loop the stages accordingly.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 63 +++++++++++++++++++------------
>  1 file changed, 39 insertions(+), 24 deletions(-)
> 
> +	for (stage_id = 0; stage_id < num_stages; stage_id++) {
> +		for (i = stage_id * PIPES_PER_STAGE; i < (stage_id + 1) * PIPES_PER_STAGE; i++) {
> +			pipe = &pstate->pipe[i];
> +			pipe_cfg = &pstate->pipe_cfg[i];
> +
> +			if (drm_rect_width(&pipe_cfg->src_rect) == 0)
> +				break;
> +
> +			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
> +			if (!pipe->sspp)
> +				return -ENODEV;
> +
> +			r_pipe = &pstate->pipe[i + 1];
> +			r_pipe_cfg = &pstate->pipe_cfg[i + 1];
> +
> +			/*
> +			 * If current pipe is the first pipe in pipe pair, check
> +			 * multi-rect opportunity for the 2nd pipe in the pair.
> +			 * SSPP multi-rect mode cross mixer pairs is not supported.
> +			 */
> +			if ((i % PIPES_PER_STAGE == 0) &&

Please move r_pipe / r_pipe_cfg definition and assignment here. With
that fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +			    drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
> +			    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
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
