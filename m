Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F9CA36F18
	for <lists+dri-devel@lfdr.de>; Sat, 15 Feb 2025 16:26:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9597210E191;
	Sat, 15 Feb 2025 15:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HztlpRaL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C4C10E191
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 15:26:21 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-307c13298eeso30300361fa.0
 for <dri-devel@lists.freedesktop.org>; Sat, 15 Feb 2025 07:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739633180; x=1740237980; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=lyhHNrVNorAeI2lBG6ZlhdNRJfwPg8zvhZHfhDTm/Fo=;
 b=HztlpRaLEAYt39uaBGb5J5wpoo16vCyK26i8Keon2KmUtgFXNxC9NzOsqQ1figEZ9r
 Y5JPRZ0mwzAmtFxhO3lktGPL3aQExHeV2FZp3xmOuTHHWy1jdr7Yt5wyB6WIWWJF61/f
 MnK6Z2UJa5+ZIehR4sB5Rb6DAlXf+OlUM1RMrMg9Ub7VKkzjIYzTi5Dj34jXOP5tTsfd
 ncLjcQuJEg9/WDtwbZimYxIlAIuLMMuaJZ7QRo4NVZYRfDzBoCPdxvSQfTSmlrAqUT00
 81sUj2aOQ43p6gr5Tff7ZQidaWLjq2mkycTC8DgidoCCwY/LNsGBdbE8nu3I1+rSY+mh
 cVuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739633180; x=1740237980;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lyhHNrVNorAeI2lBG6ZlhdNRJfwPg8zvhZHfhDTm/Fo=;
 b=F1jY04rYI6yo8NxakkCvFIxVjwzx0Ogr9TW35ljJqhNeD3vKefFmg271ZVgHUQ26Um
 VP9/3Zr9DPT4zvYOZYCXbwT7kIgRq4EB1JWigWVaZUHXASyAd83G5ZlOJ33pY9aAawJr
 4XcuZvYKuk8hNsDkOOPFdeDnAjqtwssVwXnV3mN+08eB6ef04qRDxTU7HJCtkMC3NwKK
 u6HHuoEursClIUq+deHCnbcrwKti9Qm7ZacnaTgbCySbw6bnLTMdwBfGir7alipbdaxs
 i6xnrx4RDineWQ3mFaJgOO7thaPfbOWiptAzNN76Z8kUyk3J57Sree1sY8DpyWrfUYYe
 9oVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVVjUjFbErRh+vAnoMl3eRELlhPMbGHJpBee/TJ8Dq1dOx6trpMHRBp0L0RN7Zx8zIyGSXum1J7ZA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGXdmXrfxhIkR+BnMwJZ8uVq4SPSvqo1YcL/NI+5erY7TdRePb
 Dk5S+evZnWngJ41ryHx8NQisx6XQyH0Wy3HMvpjl2k133lSk8VuMEXDaIXUaB5A=
X-Gm-Gg: ASbGncuh8M22pil7zntQrjrFIPD9NS72Coxi2XOqbGvsw6rGOHw8jVvUx1qpJxMSh6A
 wMDXNrymAH9envuFgk/Pn6I3lRjiR7AD7PCIDvKcziNNd1ZD8NXhdzbMuRioAR/SlD3zksx4cgL
 0pKW/9N2Y0aOUVYHgmg1mlU86/yhu7xjM6Lm4sSQX3sSPV0NIFtpFDYYENDlY3xpKRRus5ohCKz
 WQ+vvCW6xOYDtwZLvgS1pMbp1hl2KvrTUbcJZLthBbbjLHzi8IUNm8b22mtPtp1jBIzGgIvx3UZ
 NZux3Sd9u5wQyLrr4c5GufPVQEut6/QxvQWkxBr+NcF4iPh1dBxu1ItdotRTjUD6KkP7TpY=
X-Google-Smtp-Source: AGHT+IHt5pLz1i1krdr/WS2YKInJnYFY0Hb8ZilJLpstOl1Z5M61lz+xkuBcGZbV8SgcJDj6fbYbgw==
X-Received: by 2002:a2e:910e:0:b0:309:2187:2cd9 with SMTP id
 38308e7fff4ca-309288c9a73mr10705571fa.7.1739633179478; 
 Sat, 15 Feb 2025 07:26:19 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-309cec7e45asm914511fa.105.2025.02.15.07.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Feb 2025 07:26:18 -0800 (PST)
Date: Sat, 15 Feb 2025 17:26:15 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v6 06/14] drm/msm/dpu: Fail atomic_check if multiple
 outputs request CDM block
Message-ID: <wfhusui6qv6c4knns7ux6z7qnehzokoa6bj2ufanlnlkqpnvkj@qykctcbwizdn>
References: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
 <20250214-concurrent-wb-v6-6-a44c293cf422@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214-concurrent-wb-v6-6-a44c293cf422@quicinc.com>
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

On Fri, Feb 14, 2025 at 04:14:29PM -0800, Jessica Zhang wrote:
> Currently, our hardware only supports a single output using CDM block at
> most. Because of this, we cannot support cases where both writeback and DP
> output request CDM simultaneously
> 
> To avoid this happening when CWB is enabled, change
> msm_display_topoloy.needs_cdm into a num_cdm counter to track how many
> outputs are requesting CDM block. Return EINVAL if multiple outputs are
> trying to reserve CDM.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
> Changes in v6:
> - cdm_requested -> num_cdm
> 
> Changes in v5:
> - Changed check to fail only if multiple outputs are requesting CDM
>   simultaneously
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 ++--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 12 +++++++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  5 +++--
>  3 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index ad969a5b9434..0e4f27da9534 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -692,10 +692,10 @@ void dpu_encoder_update_topology(struct drm_encoder *drm_enc,
>  		fb = conn_state->writeback_job->fb;
>  
>  		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
> -			topology->needs_cdm = true;
> +			topology->num_cdm++;
>  	} else if (disp_info->intf_type == INTF_DP) {
>  		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
> -			topology->needs_cdm = true;
> +			topology->num_cdm++;
>  	}
>  }
>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 0fbb92021b18..4da2e47265d4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -585,7 +585,8 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
>  
>  static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
>  			       struct dpu_global_state *global_state,
> -			       uint32_t crtc_id)
> +			       uint32_t crtc_id,
> +			       int num_cdm)
>  {
>  	/* try allocating only one CDM block */
>  	if (!rm->cdm_blk) {
> @@ -593,6 +594,11 @@ static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
>  		return -EIO;
>  	}
>  
> +	if (num_cdm > 1) {
> +		DPU_ERROR("More than 1 INTF requesting CDM\n");

I think we should downgrade those to DPU_DEBUG or something like that,
but that can go separately, or when picking the patch up.

Nevertheless:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> +		return -EINVAL;
> +	}
> +
>  	if (global_state->cdm_to_crtc_id) {
>  		DPU_ERROR("CDM_0 is already allocated\n");
>  		return -EIO;
-- 
With best wishes
Dmitry
