Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 129D19F8780
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 23:08:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8391310EDF0;
	Thu, 19 Dec 2024 22:08:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MfC9Zctv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A8710EDF0
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 22:07:59 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-3022c6155edso14583411fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Dec 2024 14:07:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734646078; x=1735250878; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=viA/NGtLT1OG0e4oWmzRxKDtBs4ah55CzLenMyIPmPk=;
 b=MfC9Zctv5O5J9T4m++QWdqT1AZoM3q28RY/kfYafns3AX+8iUQXCENpoTjzQXfi2YY
 2h++NLHQlQMAKJcGhCl3u5PWK/0pLwJ0UH5QFBrKaQXTOc6lm4k32chXbFMJAaB87hjl
 3z6cNmGfvStTMv+um3j/qeOX/3JCvkuKZZn243MJX/oJNcVBV2xPKbo0ysxoduBAqofz
 9qZZAbkQp3+DENYe9yDnrEsgmU4/J2ROTuY4Y15SZa7th5mvcq8fLs76WbLVyHFMExou
 OjsxWy/guqXO+NuNRsj1EDzV5MWdsr3zuL+YQUiHlz/z6fn/Kx/IV90OjSzUhB2KuhHi
 Y1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734646078; x=1735250878;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=viA/NGtLT1OG0e4oWmzRxKDtBs4ah55CzLenMyIPmPk=;
 b=L5g6kGeUdcWmvgaXlhZKo8NRQepWZs2nW78BuWjFNoR+HfNvrkeiMRtYo8LBiAM/pl
 F5+FCx48/c87Vd5el89rqMPkBDSJo97wsyqG61oLYmk/OPNAjFgMiTcnSX8v6Trg/YHT
 jchIFf6EFk8TSSgVyxbx8PxYEOIdnjIU0wZnMCn0YUWW4H9YYgPNfq+4tsW8fR8n8Uga
 17DgQAN/H1hs5teizUlQ4+cVkZYtcbN6g74BZ1H9mdTTxknhJYH0mrCZ0gfyFz/TbalF
 u2ezPQV4y6seqwtvO2cNJxpfC8A8Z2d4wy3HyDzQcHljb6QmsdJLbu/P/Tl0B9INYoFy
 vCvg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZyrgVSDb9EKVqyo+qjRIBjgmiHNzOOpeWDrtVMD7ihPfjUYN9Ghl8kW72TLuW/Wf3rrSEgI5Yn84=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxV5x5tNIjVPDsVBCe4UfZjNO3PleBndzU12fOzAeBQ0e40nfeB
 eWlW+C4SbvgN+kpTBaZXbXNGBlivq2/WsCPL6145L/dbYukEy7Zyz+/0eMWTDpY=
X-Gm-Gg: ASbGncskNzX2SpeD0eoRYxl1FxjqlLcsnLPD9OKyTpt+uD09N/4X42WOR3I6jJtNohU
 cd8kx9mE5htCGz96jLXodLwEoBnfdHEMF7h52uDQHTWV9aiDlOsXYsguXV+77+2UnjLz9oQcJb6
 rDg4NdOA0XFA1IKvs9bcCD8NDF93RQUEAvPSWaX02vV9NPKGY8lKJ9t22zyVPZbC+aXXaEeMMUK
 NNm4+eTHF1ymZn/TvEBayEIrJAlXoJzaeRhE/q7JAu7h00DLTmJNfYrOMsU+RtnYQ9VOHwipsl+
 Wt0It4utEqvkmaACyybC34f+ZCP2/YuLA2CY
X-Google-Smtp-Source: AGHT+IGiQUfxAIZa99jPVEH/RCXenBQGPR3i4OaoiRPeSe75eqgtCqiGmVTEzjvTKNS/CwvdABExdg==
X-Received: by 2002:a05:651c:1545:b0:300:de99:fcc6 with SMTP id
 38308e7fff4ca-304685dd8e0mr1809201fa.34.1734646078188; 
 Thu, 19 Dec 2024 14:07:58 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3045ad99d83sm3607591fa.39.2024.12.19.14.07.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 14:07:56 -0800 (PST)
Date: Fri, 20 Dec 2024 00:07:54 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/15] drm/msm/dpu: polish log for resource allocation
Message-ID: <hnzaxvxqg2z6g3ct3vzvvyicts2i6cdelxvekvmaili652s4ut@bsev2xwpuv2l>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-3-92c7c0a228e3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-3-92c7c0a228e3@linaro.org>
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

On Thu, Dec 19, 2024 at 03:49:21PM +0800, Jun Nie wrote:
> Add resource type info on allocation failure.

Add where? Also describe why, not what.

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 6dc3fa79e6425..cde3c5616f9bc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -814,6 +814,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
>  		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
>  }
>  
> +static char *dpu_hw_blk_type_name[] = {
> +	[DPU_HW_BLK_TOP] = "TOP",
> +	[DPU_HW_BLK_SSPP] = "SSPP",
> +	[DPU_HW_BLK_LM] = "LM",
> +	[DPU_HW_BLK_CTL] = "CTL",
> +	[DPU_HW_BLK_PINGPONG] = "pingpong",
> +	[DPU_HW_BLK_INTF] = "INTF",
> +	[DPU_HW_BLK_WB] = "WB",
> +	[DPU_HW_BLK_DSPP] = "DSPP",
> +	[DPU_HW_BLK_MERGE_3D] = "merge_3d",
> +	[DPU_HW_BLK_DSC] = "DSC",
> +	[DPU_HW_BLK_CDM] = "CDM",
> +	[DPU_HW_BLK_MAX] = "none",

unknown or ???, not none

Other than that LGTM.

> +};
> +
>  /**
>   * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
>   *     assigned to this encoder

-- 
With best wishes
Dmitry
