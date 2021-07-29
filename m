Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A068F3DAEBC
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 00:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 372296EE89;
	Thu, 29 Jul 2021 22:15:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A546F6EE89
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 22:15:12 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id d17so13872188lfv.0
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Jul 2021 15:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=cMLNPPri6qLYLmbcVjGDPuvyqtHljwKPt/Kw2945Q8E=;
 b=gPVrciZQ0H8OrEVgkRGpPXwmnlXGi7IWOCVNplY7URViIvt6MrB0kGudrK2Rk5TNc+
 ZcVQyfxpcAPc3nx1OlPimwZBQanmsrWD3TCAbWJ8wtmeenHGiR60rDWiJbOFqpe9RAGd
 XhUvkfca3FOIF/QVPFCHWWoboKq82Y6QK36tVzauhDzGBIHYR5G3StQ8DKjg3gOmkyn1
 0dYct0XQJQbYA2J0BgabP/EmLcqPIJ2An8UQX/AU/IIblCqcNCFfiBQwbELmzU1kMbey
 480no7OxS/qbxI1QyNSwu85Z6VZ99JWTdQJhnZ4Vg0ITHvnf0dVnWo+TlwyhapRvLmFN
 UhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=cMLNPPri6qLYLmbcVjGDPuvyqtHljwKPt/Kw2945Q8E=;
 b=nuCMBiiu28m1q00VfHwndOS38v7GbETPZrJDsPHu/LEzaHni7Uq5kX/GT2SxIuKLH8
 QM8dlva7a0doX7uUnukVOigfdkHYgmHVmx+3LJEpDIsuZFvZF/Xtqq0zHrvKNea4yf2O
 /PC/rPBek5SieZKXn67EBaU4vvDFW7jK+eM0vb/FWlwAQzLjWT4miaTC7fJMXRUNTYKd
 54tskYUMeu6X5oCiH8ZgACUrkoLd4WgkjXUVtgL9TE5YvZpqsMA1IzgrZZ8ohGzKdnu/
 bvZrUFo0wJKz6uNkitH9T7vc/BiT+1EHH/lS+49RRd/f+EDlHDBF+TDLadDzWLW01GFx
 pVkQ==
X-Gm-Message-State: AOAM532TIRNHWTOoNbqjy1MoONAs0M72KXQXzmmP0qVzkdjgR/N7qgTV
 bPSk04lBtccegpYYPkgpBwBo3w==
X-Google-Smtp-Source: ABdhPJxntgaYB/1tvYMlU6ktcdkPNVEahQjjruAi4HU1XiR/oTZsvA4LvveewHUduXk6h9s+8nKR3g==
X-Received: by 2002:a05:6512:118c:: with SMTP id
 g12mr4806358lfr.143.1627596910850; 
 Thu, 29 Jul 2021 15:15:10 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id j14sm455041lfc.20.2021.07.29.15.15.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jul 2021 15:15:10 -0700 (PDT)
Subject: Re: [PATCH 06/11] drm/msm/disp/dpu1: Add DSC support in hw_ctl
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
References: <20210715065203.709914-1-vkoul@kernel.org>
 <20210715065203.709914-7-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <79e693c8-ff9c-d4a8-d4a8-8a1f075f77c7@linaro.org>
Date: Fri, 30 Jul 2021 01:15:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210715065203.709914-7-vkoul@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Cc: Jonathan Marek <jonathan@marek.ca>, Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/07/2021 09:51, Vinod Koul wrote:
> Later gens of hardware have DSC bits moved to hw_ctl, so configure these
> bits so that DSC would work there as well
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 2d4645e01ebf..aeea6add61ee 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -25,6 +25,8 @@
>   #define   CTL_MERGE_3D_ACTIVE           0x0E4
>   #define   CTL_INTF_ACTIVE               0x0F4
>   #define   CTL_MERGE_3D_FLUSH            0x100
> +#define   CTL_DSC_ACTIVE                0x0E8
> +#define   CTL_DSC_FLUSH                0x104
>   #define   CTL_INTF_FLUSH                0x110
>   #define   CTL_INTF_MASTER               0x134
>   #define   CTL_FETCH_PIPE_ACTIVE         0x0FC
> @@ -34,6 +36,7 @@
>   
>   #define DPU_REG_RESET_TIMEOUT_US        2000
>   #define  MERGE_3D_IDX   23
> +#define  DSC_IDX        22
>   #define  INTF_IDX       31
>   #define CTL_INVALID_BIT                 0xffff
>   
> @@ -120,6 +123,7 @@ static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
>   
>   static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   {
> +	DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, BIT(0) | BIT(1) | BIT(2) | BIT(3));

Please pass DSC indices using intf cfg and use them to configure 
register writes.

>   
>   	if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
>   		DPU_REG_WRITE(&ctx->hw, CTL_MERGE_3D_FLUSH,
> @@ -128,7 +132,7 @@ static inline void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   		DPU_REG_WRITE(&ctx->hw, CTL_INTF_FLUSH,
>   				ctx->pending_intf_flush_mask);
>   
> -	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);
> +	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask |  BIT(DSC_IDX));

Only if DSCs are used

>   }
>   
>   static inline void dpu_hw_ctl_trigger_flush(struct dpu_hw_ctl *ctx)
> @@ -507,6 +511,7 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	if (cfg->merge_3d)
>   		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>   			      BIT(cfg->merge_3d - MERGE_3D_0));
> +	DPU_REG_WRITE(c, CTL_DSC_ACTIVE, BIT(0) | BIT(1) | BIT(2) | BIT(3));

And here

>   }
>   
>   static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
> 


-- 
With best wishes
Dmitry
