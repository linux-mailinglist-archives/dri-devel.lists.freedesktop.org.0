Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1562FA3FB99
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2025 17:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA0D10EAFA;
	Fri, 21 Feb 2025 16:40:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="f2wQ/suV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5049010EAFA
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 16:40:23 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-5452ed5b5b2so2353321e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2025 08:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740156021; x=1740760821; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=XeJTx/vmHBx5GNuwonywXW9ioDFWEnQJoc6Kq60Yt8U=;
 b=f2wQ/suVcdvJR9d/8DlLYEbmlvuyrXRua3A288PoDY6dhQK6FJKNhnOhNkLG8PIH9z
 eiykE/zPcHLoapuQfNnjsJvw/7DbP+dy4tQIWWRBOSaaaJMASRoyPOU/2bGSnEWSlTe1
 l2e0W9LNhoj4GBdXRm1cmUM48pt2iYHnpixdLWN31nK1MyTAtPl/ao3E9y4WzEMwujpD
 6TyY1WyJdjmpxFvsCSnHjR6hC1YlY1+W3IhAL/Sai8NfiaMNNXSH0YwZijzvuqJW8Cv/
 Xj6mMqQx01FAlDjhK7vawMJ/3YYOYtXIdF2mOyWSVi76W2VTGMp4On8bdhjmojwB/T8j
 tyog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740156021; x=1740760821;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XeJTx/vmHBx5GNuwonywXW9ioDFWEnQJoc6Kq60Yt8U=;
 b=mybx5YQ0waP4rkXasRtkyT2gp0jLlw93pKVbvOmFATCuwEG5Lk0KZ9jeMpk18r17S6
 E1oz7tXCEP76Jk29xYPkpOaWierhcrvcE0Ho+1dpXDRRHR8NByqTUKgRXHLflNkgwk+i
 sSV/oFZ9bMWtRSLHYut0QrS8CfIItAwlAzkmWg3za1HBLwDMWMvKYn3krmWygbEXK/Iw
 1qELWq2u4EA7JRh3EGOdnDAM+16yD9ckez7qctIOFuCwfoEFWPCc4x/kPiRKBPQmAPBD
 K3qm0yGHb6am9w5MTFNxTd0tCmx0EZ/oRYBbroS57QcfGIo9dHjaDtXL5nVL94tzGzZ1
 SBiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIVRdu44fH4eeNWPi9lNYOLwUznzPRt8EzdkmBKfgQxGZoyIqs7tUf6AbFAQA39+xYe71Po/MT4dw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBlvRybUJC/H3TUu7sJfJ+CSYc0CQ4sfgpQJTGWQYC0r6+2XUv
 ynR/O5OwVxc2rgay9RhanxLoZPmyNatXjbnM/v5Kyt4lPe+3ADu+cRSRrPbMXYQ=
X-Gm-Gg: ASbGncust9IivdPRq351h8jcnO5C5yXBR8Z0YjQjXXqtwNehcLggqNvNvTUOAnJqt1l
 IIJ8CHVCSQYTRcKGouEDgnA5lJUgJx14VoavVbwRdRycxh8HPpFHAtnn6hAW+FJ2IR72HJE2/me
 SB5x+rIGD3vCXbakZjzI4BaybOZCBvDBZNxfZqwqgvq6xS5HPFNH03FZH8KvdDf7dnYqC+Stk6R
 CNRqJQH7OLL8SXJGMEYsOlkmdRKoX7Zg7bXGPQkNQYXoqrNXgzlHTZYx7vD8BbHZTMxUlTEBYKn
 zkN7JmLGKGVA415cWGrU3DEj/7ROHj6D0KwLioeyXxsoAmYhRA0xXUkdijzYrsBcl4Ntvowx4K5
 UeTXTbw==
X-Google-Smtp-Source: AGHT+IG3sGSgu3fmfjjVa5dP0zopYhRJHZeGFgM+rQzAw/dbKCd7icrIJbdMAouX19sYLz/WmVSHOA==
X-Received: by 2002:a05:6512:e97:b0:544:11cf:10c1 with SMTP id
 2adb3069b0e04-54838ef8ae9mr1535911e87.30.1740156021503; 
 Fri, 21 Feb 2025 08:40:21 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54531815e02sm1992234e87.228.2025.02.21.08.40.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 08:40:20 -0800 (PST)
Date: Fri, 21 Feb 2025 18:40:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 15/15] drm/msm/dpu: Enable quad-pipe for DSC and
 dual-DSI case
Message-ID: <kouoar4xfsyuxmxjg3pc5jkbddpc7kbyvdpqkwnzecuroilnra@4aa4cpdkr7gc>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
 <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-15-c11402574367@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-15-c11402574367@linaro.org>
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

On Mon, Feb 17, 2025 at 10:16:04PM +0800, Jun Nie wrote:
> To support high-resolution cases that exceed the width limitation of
> a pair of SSPPs, or scenarios that surpass the maximum MDP clock rate,
> additional pipes are necessary to enable parallel data processing
> within the SSPP width constraints and MDP clock rate.
> 
> Request 4 mixers and 4 DSCs for high-resolution cases where both DSC
> and dual interfaces are enabled. More use cases can be incorporated
> later if quad-pipe capabilities are required.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |  6 ++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 28 ++++++++++++++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |  2 +-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |  2 +-
>  6 files changed, 28 insertions(+), 14 deletions(-)
> 

>  
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> index 64e220987be5682f26d02074505c5474a547a814..804858e69e7da1c8c67c725aa462c1a558d1b402 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> @@ -35,8 +35,8 @@
>  #endif
>  
>  #define STAGES_PER_PLANE		2
> -#define PIPES_PER_PLANE			2
>  #define PIPES_PER_STAGE			2
> +#define PIPES_PER_PLANE			(PIPES_PER_STAGE * STAGES_PER_PLANE)

This should be changes when STAGES_PER_PLANE is introduced. With that
fixed:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

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
