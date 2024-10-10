Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D0D9986AA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 14:53:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F420B10E8E0;
	Thu, 10 Oct 2024 12:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="juPoRb/V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7064E10E8E0
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 12:53:23 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-5369f1c7cb8so1212864e87.1
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 05:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728564801; x=1729169601; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=SOG2cvcIa/f3eZvF9qCqDwajTrBJ79dSHibePI7xfTI=;
 b=juPoRb/V9GI0NgtgN4BXPtVPq8Vnf/x0gaVrYgzCseg3w5wTpc3drzkefuOwYDi3iM
 IzGpJ6bRzLaEinIVZgpvFNcH/d/dCVsxo32WAeE+eC0pESZAwnyrLtVYMNMMGfQxNN/W
 I9xV+q1RO3HbOLHQv62ozmeg5hWpEeu4NTdh6mf2wskedf+oDakIrLWSzouBpAD/X7gG
 AziAaSeiuHkvNfyM52Nxd63GImZl3mQTjpsTpULBg9Bqils7FLm5VMhQbYjxoOPa5IwI
 SU1qOcsdAqCtjD43fMOAn1csyJeL+JFNYhgY11/NKWsywvtNf3QUd60DNytSqoHHFDRg
 ClFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728564801; x=1729169601;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SOG2cvcIa/f3eZvF9qCqDwajTrBJ79dSHibePI7xfTI=;
 b=NSsqTz8l93c6PY8Cg3ME8Z/uTz7dWRhcY5qs0VPMeCQ+NNxWAhZ6b94XePrIlr6aZT
 1IvOIEA03pFR+ahUcL/GCTpdBcxf70G4WugbJDd1v6UI5rZMkexJGjVatnwmxwA9C5E/
 0uaybVlMRJ1L3C8b1Gzn7nADWotSOoTdaLfRIGOq1yAkmKY/zoELnEEC1sd4487NC2nb
 smirA0ywZInkQeIkXx14H8cBDnez4ptDuh+Hpr+TG8GAm8UugmWm75gnJgpqRzQolx82
 5+bXFTxnJgyqlbItJgPYSTxVk7TDn0ulucABdPIXFmHbUt5XmN98z1PcTyy5trR3jkuL
 io1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVIjUSj2MWNhilJr+Zwsd1U+fs5JA/vTboe3hm6NvJeTad3Y8S9lR8S/cSO0kB9UDphK8TLL1tg+Zg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyHJz0tRpuPLL9uT45EDz0noFja851dJczcioI6QUczTq+IfEcZ
 66oaZc47qs1dLt72F0W1d9DfCFvwoPeGTAb+WqXzAc1moQvE2Gus+TXaVNJYtgc=
X-Google-Smtp-Source: AGHT+IHwHdR/ayiiZrVWEQZ0jvj6QMy246EDnjvlSR6tXX1mW/aaU5oydDoW2K4KYVylDfBIuIqyDw==
X-Received: by 2002:a05:6512:3c97:b0:536:a583:2777 with SMTP id
 2adb3069b0e04-539c48926aemr3865575e87.9.1728564801442; 
 Thu, 10 Oct 2024 05:53:21 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-539cb8f0f86sm240116e87.190.2024.10.10.05.53.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 05:53:20 -0700 (PDT)
Date: Thu, 10 Oct 2024 15:53:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dpu: configure DSC per number in use
Message-ID: <3vrwrw7kia5h3vku2n3c7kwyyokrklqjjl22apzruvh535pnav@2ewlmdjobveh>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-0-139511076a9f@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-2-139511076a9f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-2-139511076a9f@linaro.org>
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

On Wed, Oct 09, 2024 at 02:38:43PM GMT, Jun Nie wrote:
> Only 2 DSC engines are allowed, or no DSC is involved currently.
> We need 4 DSC in quad-pipe topology in future. So let's only configure
> DSC engines in use, instread of maximum number of DSC engines.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 39700b13e92f3..e8400b494687c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1871,10 +1871,13 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu_hw_ctl *ctl,
>  		ctl->ops.update_pending_flush_dsc(ctl, hw_dsc->idx);
>  }
>  
> -static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
> -				 struct drm_dsc_config *dsc)
> +static void dpu_encoder_prep_dsc(struct drm_encoder *drm_enc)
>  {
>  	/* coding only for 2LM, 2enc, 1 dsc config */
> +	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
> +	struct dpu_crtc_state *cstate = to_dpu_crtc_state(drm_enc->crtc->state);
> +	struct drm_dsc_config *dsc = dpu_enc->dsc;
> +	int num_dsc = cstate->num_dscs;

I have been thinking about this part for a while. Please move num_dscs
to the dpu_encoder_virt structure. The DSC blocks are logically related
to the encoder, so having this field in dpu_crtc_state seems incorrect.

>  	struct dpu_encoder_phys *enc_master = dpu_enc->cur_master;
>  	struct dpu_hw_ctl *ctl = enc_master->hw_ctl;
>  	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];

-- 
With best wishes
Dmitry
