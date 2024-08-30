Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 434DB9667B8
	for <lists+dri-devel@lfdr.de>; Fri, 30 Aug 2024 19:13:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED0FC10EA75;
	Fri, 30 Aug 2024 17:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cy5ayIEH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD78A10EA75
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 17:13:21 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-533496017f8so2794746e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Aug 2024 10:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725038000; x=1725642800; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=WuoWF+ip5aM6TEiw7ZGe1txftEmX/FKCbSWMdfUV8/A=;
 b=cy5ayIEH7lOT0ew66tUv2pP8shCClsUv3nqVcWVEMw8BBHqavTriY26n8x6h0xWmPr
 15GEHIThCVIoGdXWCSt0ZkJXVdGMbj9C6G4b75Zduk8Ahbl3XNBmpXmr6qI+JtKibAyP
 NhT6kUSZuayEifmEAL/hhtmYmYQmfkWktshAvieVTmawqtO2KuhWSWJI0Vwfj4LYSaPU
 zgA4fpROG/IWDEepPq9Z+7mPp7Q1pTmYXEgG3IafHRVlX7ShYQvxSynvrSTWZdyJDsU1
 GIQd7K7HyIRCx7XcasbMeBT5niJjgupmq4a42E1/nIWspM0vVxpuxwnTaJr0OSqA/yuh
 RDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725038000; x=1725642800;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WuoWF+ip5aM6TEiw7ZGe1txftEmX/FKCbSWMdfUV8/A=;
 b=gPH+rn960n0oUPeBT+O3qQOiEExh9Svc/R/kSvEgW1mIHyeRU1ej1Wj1voKeLi2lwy
 nZgXZOiH1pA33feJ7BY6TtrTbFANfhaE+qjIKufuW8G6Dq8EZHyP/eo7lp7QQCDNQHG5
 kfz7BieToonCBikqcRaN75YzBQZEZlkvJcx2QgHpt6EQWYILVdRUccoWmjyxMDcSgYh4
 Xl8sjx2Tk73a+3UW1pGEZJt1S5XamoD0mBGbbOT4c4ruC1XuuJXKR3dWprk2iI6V0TTX
 3Yw1EVApsA1WHfybqri2JhdHn0tb6yelw+0BZLwfEXgHfcDknXgMKv/t87VFs+d31UC5
 nR6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCW9JGjKadWUnuZiKa1nn6IA4h5JcMzud8WDSelVPwQl0TmzKIu5A2bdAtpfoeEo3PZPx62GNCwiVis=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOW8PXaQiIItACDKrq6wxHPv8ADLuSRZOPCO270zqtcMmFjEDY
 zQ6727x0d8S3TFsjyZ9Zi0eLaV2W6snNJEToCospZR2SJryWY+YYtrAOecyIglw=
X-Google-Smtp-Source: AGHT+IGpRicXrqdm01FNs2Xf4peUE9dkraN2jSOKc/ODVytIJ0oIAMDjBRGLiHk0ZMkrGisuSp5+Cw==
X-Received: by 2002:a05:6512:2308:b0:52e:9fd3:f0ca with SMTP id
 2adb3069b0e04-53546b2c402mr2032494e87.33.1725037999329; 
 Fri, 30 Aug 2024 10:13:19 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5354079b76asm695592e87.43.2024.08.30.10.13.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Aug 2024 10:13:18 -0700 (PDT)
Date: Fri, 30 Aug 2024 20:13:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, quic_ebharadw@quicinc.com,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 08/21] drm/msm/dpu: add CWB entry to catalog for SM8650
Message-ID: <audsl366wkyqlizb254haxchirlgycr4wpgmp7sbkmynafivoq@pyanmqyfwj7b>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-8-502b16ae2ebb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240829-concurrent-wb-v1-8-502b16ae2ebb@quicinc.com>
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

On Thu, Aug 29, 2024 at 01:48:29PM GMT, Jessica Zhang wrote:
> From: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> 
> Add new block for concurrent writeback mux to HW catalog and change
> pingpong index names to distinguish between general use pingpong blocks
> and pingpong blocks dedicated for concurrent writeback

Please split into two commits.

> 
> Signed-off-by: Esha Bharadwaj <quic_ebharadw@quicinc.com>
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>  .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    | 29 +++++++++++++++++++---
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  4 +--
>  .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  4 +--
>  .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  4 +--
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     | 13 ++++++++++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  8 +++---
>  6 files changed, 48 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> index eb5dfff2ec4f..ce2773029763 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> @@ -252,25 +252,25 @@ static const struct dpu_pingpong_cfg sm8650_pp[] = {
>  		.merge_3d = MERGE_3D_2,
>  		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 31),
>  	}, {
> -		.name = "pingpong_6", .id = PINGPONG_6,
> +		.name = "pingpong_6", .id = PINGPONG_CWB_0,

Should we also rename such blocks?

>  		.base = 0x66000, .len = 0,
>  		.features = BIT(DPU_PINGPONG_DITHER),
>  		.sblk = &sc7280_pp_sblk,
>  		.merge_3d = MERGE_3D_3,


-- 
With best wishes
Dmitry
