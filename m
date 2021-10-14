Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A46B42DB1D
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 16:07:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B67E6EB11;
	Thu, 14 Oct 2021 14:06:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DC7C6EB11
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 14:06:57 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id y15so27614112lfk.7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 07:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NmsJjrVQJSlytBdvRLJ3ylqzzRy6zWoqsrRac2baw+c=;
 b=sb7T7XzNrVtwl4mRGWO4qD1nEdPKy7Kx1pkV2JH/REWHrjss75eGRBgsiRxcUq70Ao
 puQfNnsGz8tgygFBblTZcnT/TfI3yPsuZQFtJDZGRVqsNtXpAOSuI+pJMbJPu7l5ilV7
 A09cLsg/I4Q1NYjIqXx+ea4pyz9bWDfko1Pg04XELVMJ8rxjos5O97yIhYjaKfXB+xDL
 YQtmmszU1/L43CHRHa98ZKfGkIKXxNbzFtlLhy7IRGdbfy5XZqd+MIMHsIQN1xutcjVY
 Azh+cVR3qkIeHjmarxZ/RyeptC0WO27fpFKhsKCLHVyGFYXBSj0IcBgtoFWzF7OuFqxt
 Y4tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NmsJjrVQJSlytBdvRLJ3ylqzzRy6zWoqsrRac2baw+c=;
 b=TMhmW2I5nYjynujTYVYkkm6OQM5uPi61/sbL62/1j06KdmSwhg8OVZzZbF8hr8M9ML
 983otFIF4mszp/9wOxb0PtV0y4gx4xuXpVrJYv+sOJSmvSI6nDoGWlCvUme/AUaylDdv
 uq8eIaaCWC3okW3aWLRJznKUdDUaOdUh7ZDq64HFcIjGncYcoznCBxN+ajLB/ocm0OIc
 e0I7iIQuYiAkMtvdJ6xQ2OR5swUZyzC8fTJlP8NNYjaUdIHvK/5hVEmnmYb40WUQf+cw
 D7TrsfQE1npTQAPmTTAej3C367JdZ5Ampw8w3ci1sqLcBYZkdlgB9pGpV2cVIsEU11wz
 sU/A==
X-Gm-Message-State: AOAM530taPVFff/0H7k9K4BqvEO8WcaeRRG0QaDsYFFyGkBZ0eCc4ylm
 n7gx97U/rZvjYO2UzOcf8cfqrA==
X-Google-Smtp-Source: ABdhPJyxK3AwQzRzBtxFgS1FXOW7JElIYl5Bz3tyIwNYJjqtzC/ecfpq6sVRYwHf92Tb20np6K9jIQ==
X-Received: by 2002:a2e:9e15:: with SMTP id e21mr6291412ljk.351.1634220415573; 
 Thu, 14 Oct 2021 07:06:55 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d6sm234448lfi.137.2021.10.14.07.06.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 07:06:54 -0700 (PDT)
Subject: Re: [PATCH v2 07/11] drm/msm/disp/dpu1: Add DSC support in hw_ctl
To: Vinod Koul <vkoul@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>, Abhinav Kumar <abhinavk@codeaurora.org>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20211007070900.456044-1-vkoul@kernel.org>
 <20211007070900.456044-8-vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <f5f6162c-7ed0-2964-7cf9-0bb894c8b4f5@linaro.org>
Date: Thu, 14 Oct 2021 17:06:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211007070900.456044-8-vkoul@kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/10/2021 10:08, Vinod Koul wrote:
> Later gens of hardware have DSC bits moved to hw_ctl, so configure these
> bits so that DSC would work there as well
> 
> Signed-off-by: Vinod Koul <vkoul@kernel.org>
> ---
> Changes since
> v1:
>   - Move this patch from 6 to 7 due to dependency on 6th one
>   - Use DSC indices for programming DSC registers and program only on non
>     null indices
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 3c79bd9c2fe5..8ea9d8dce3f7 100644
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
> @@ -120,7 +123,6 @@ static u32 dpu_hw_ctl_get_pending_flush(struct dpu_hw_ctl *ctx)
>   
>   static void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   {
> -
>   	if (ctx->pending_flush_mask & BIT(MERGE_3D_IDX))
>   		DPU_REG_WRITE(&ctx->hw, CTL_MERGE_3D_FLUSH,
>   				ctx->pending_merge_3d_flush_mask);
> @@ -128,7 +130,6 @@ static void dpu_hw_ctl_trigger_flush_v1(struct dpu_hw_ctl *ctx)
>   		DPU_REG_WRITE(&ctx->hw, CTL_INTF_FLUSH,
>   				ctx->pending_intf_flush_mask);
>   
> -	DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask);

This would break non-DSC case.

>   }
>   
>   static inline void dpu_hw_ctl_trigger_flush(struct dpu_hw_ctl *ctx)
> @@ -498,6 +499,9 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	u32 intf_active = 0;
>   	u32 mode_sel = 0;
>   
> +	if (cfg->dsc)
> +		DPU_REG_WRITE(&ctx->hw, CTL_DSC_FLUSH, cfg->dsc);
> +
>   	if (cfg->intf_mode_sel == DPU_CTL_MODE_SEL_CMD)
>   		mode_sel |= BIT(17);
>   
> @@ -509,6 +513,10 @@ static void dpu_hw_ctl_intf_cfg_v1(struct dpu_hw_ctl *ctx,
>   	if (cfg->merge_3d)
>   		DPU_REG_WRITE(c, CTL_MERGE_3D_ACTIVE,
>   			      BIT(cfg->merge_3d - MERGE_3D_0));
> +	if (cfg->dsc) {
> +		DPU_REG_WRITE(&ctx->hw, CTL_FLUSH, ctx->pending_flush_mask |  BIT(DSC_IDX));

Why?

> +		DPU_REG_WRITE(c, CTL_DSC_ACTIVE, cfg->dsc);
> +	}
>   }
>   
>   static void dpu_hw_ctl_intf_cfg(struct dpu_hw_ctl *ctx,
> 


-- 
With best wishes
Dmitry
