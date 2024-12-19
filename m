Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E50129F8788
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 23:09:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AA8410EDF2;
	Thu, 19 Dec 2024 22:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pFZDCrzV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C541510EDF1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 22:09:45 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-540215984f0so1229228e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 14:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734646184; x=1735250984; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=kfFrfuHrDlsSX/EuDepOiwLHvFjx8uS+56G1Zl81UHE=;
 b=pFZDCrzV0wP6mUkoCnzAT+B5sOUxGPTBE6uMclcyHhrqTYG9lm8RXBKdOU8Bx8VICT
 19cuwXmC52jTkLdPvUYdxVMq8OdlbjZ/ANMJbw2WokIeyg30vPAjIxQJCgIOwNG3ecTZ
 5XEg1jGaJNoKdTcC263oahzwBCCrNnShrS10jsdq9wqmy6l4foqyaJTrKrJoEjsIjUiR
 fVra8+l+jcAekik7fOy+Q7q+7QHFs0G3j1a3g3mqCIibcgm4wZ0LewHdw66VVXy29RSy
 pDkUiU7CXeackHRnTOL+GzpFyZTYsYK5//JtMWlPE/VG11yKhZTYiRIHcFW1KGvlDgYb
 46Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734646184; x=1735250984;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kfFrfuHrDlsSX/EuDepOiwLHvFjx8uS+56G1Zl81UHE=;
 b=N5EoO1hilagAwE8kaibSXAEa9t7d+R8G/zGwP813W9Y51eSTzRqA+dNpRUSpJeMA+b
 e8jyhAHKswVsSVr3zP9wyUIDHV6IHXs/EbC90j4DDTbdhm1YFFrO1JEjxH97rwExvc9h
 3aEIdrnWcZL6zrVDclrwwmBpeHBfVrnvqp4ZfQ1pTOq+cycs17rA3aYdH4veN8RLuMv6
 JXi1qZtwusKLTR4HFaNIvf6W2awXWr4Ar60lj74+adIzEz0PVd+UlhoXcl5fKiFxco7w
 /U2HMrTJ2U2/QiJrmb1Ws7Q1HioB7HT/KCSGt1NWVfvtkdxYnUW2bF5aKKgmBSXMu2LY
 tEiQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX24TD4Otv0lTYvLAFdaQrhQ8As1ls04AFao3fNhwBJGxjil62Da9uUHqHbxSc2KqmyJRCr5UT4MFY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwikjB80jT39Vqv49cTm0RGplBDTBLuAmBI7IAtzYhSxg12/6IO
 oNrCEPmJXaQidlRSs9lE3eks0tgmFHR+8sFsytnD7s10cACR9Md89amgWsHNGL0=
X-Gm-Gg: ASbGncuapLId+2YqyA+LQklV14ec8UuA2/Xm1z0MsHjaIB0W9A4wfgRB1yqjOBpca3n
 dRCNTYonkJL/NAg12HCDjgke+8WC/msVxODV3lLtmHFafQeuB/Emq2pzWzdxfgnSM2bj9CeCHjd
 lUq+IPY4qQefgBVIr8c8nJkfkCN5hRFyQw5kBGA9SJ7SzKHlkHQQO6trzINwG9JbB/AwInUlpdo
 D+8vMwxioGew8dLCXRlGpf5uZuMfVzravuFk5YpAptsmu19S8BFrz5VGvkSFdruL8vno8CrTR6t
 jtBUkmYC0aQNkRb2TqoXG9TTCWuUZT/o9gM5
X-Google-Smtp-Source: AGHT+IGI1strB9pz1L+6dNnfXxg3RVHpxg+mATsyyFO5eKsyMNYu9cO2lopjm3nWXPaSP7RDnPsvcQ==
X-Received: by 2002:a05:6512:31d1:b0:540:2160:1f79 with SMTP id
 2adb3069b0e04-5422959d3bdmr97847e87.51.1734646184080; 
 Thu, 19 Dec 2024 14:09:44 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-542235f6047sm283724e87.26.2024.12.19.14.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 14:09:42 -0800 (PST)
Date: Fri, 20 Dec 2024 00:09:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/15] drm/msm/dpu: decide right side per last bit
Message-ID: <yqbze4h6obiwulmvh64r62slaiih75hzescf5tjwqgtmhqy3wi@y4uedbo5jrzu>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-4-92c7c0a228e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-4-92c7c0a228e3@linaro.org>
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

On Thu, Dec 19, 2024 at 03:49:22PM +0800, Jun Nie wrote:
> decide right side of a pair per last bit, in case of multiple
> mixer pairs.

Proper English sentences, please. Also describe why, not what.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 7191b1a6d41b3..41c9d3e3e3c7c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -369,11 +369,10 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
>  static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
>  {
>  	struct dpu_crtc_state *crtc_state;
> -	int lm_idx, lm_horiz_position;
> +	int lm_idx;
>  
>  	crtc_state = to_dpu_crtc_state(crtc->state);
>  
> -	lm_horiz_position = 0;
>  	for (lm_idx = 0; lm_idx < crtc_state->num_mixers; lm_idx++) {
>  		const struct drm_rect *lm_roi = &crtc_state->lm_bounds[lm_idx];
>  		struct dpu_hw_mixer *hw_lm = crtc_state->mixers[lm_idx].hw_lm;
> @@ -384,7 +383,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
>  
>  		cfg.out_width = drm_rect_width(lm_roi);
>  		cfg.out_height = drm_rect_height(lm_roi);
> -		cfg.right_mixer = lm_horiz_position++;
> +		cfg.right_mixer = lm_idx & 0x1;
>  		cfg.flags = 0;
>  		hw_lm->ops.setup_mixer_out(hw_lm, &cfg);
>  	}
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
