Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2F5A08343
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 00:04:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C9D010E4A0;
	Thu,  9 Jan 2025 23:04:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aPuWTi0C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43AA710E4A0
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 23:04:12 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-54252789365so1743432e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Jan 2025 15:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736463791; x=1737068591; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=AAcNvBDLCMVwN0Us4db6UaMc6t+XPG2++mfdFKlIJ/k=;
 b=aPuWTi0Cfwqgp4sh5TUGhhh7hJBHEoDe5qXEIxCBgmjPz6tQmI07JELg9IT4h6fS6U
 MCU2G14OwFltts4pzdKkZ84rbVjfsCN8BTav5aVsj3G+t8N8tT1GwBdz4AjqvifZrWQa
 v5CCmvHfr7kFvlDhHh5Q5w5wyKFz2oi1icGDVft8JcDqHACsOEtAeIJHMMhT4NksNnFX
 QK8HvwdhoFG9JPjViKa+B6zSlwLYzzDhFgLNbm+QD3ZoreSxEOFNebZG32c5CZIAj8Md
 DzExbqiWag3ir+A1TiOmxGlaDxZ9hLUh8Ll7rUmWAWrr9hspHkFIe3YSftZiLq5TJvJ6
 wMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736463791; x=1737068591;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AAcNvBDLCMVwN0Us4db6UaMc6t+XPG2++mfdFKlIJ/k=;
 b=YhnGyAUkM3iq6LXcwCCpqUO/tbSM8EGjwYF9EoaM8DnHj6jE+OeexzqoyLLeILzHx0
 fXHCojZjV/8A+Cg/2z4PLTLL9dN1+GMxt/u0aQgGwNRIvy4Z32nWQSf0CmwaO9XCB2a6
 Rmuybd3c6yo+qjZQkB+K7ZtM+NBAL6Jgt+k1ST29O/tpYGEAp+gMOmmRB7USAUq2JFsh
 gEf0s4bnmtnaw62rj2crRxeP8+G6IW0uYH1Is6bh4lwoDw3PvOniJLHOUqGkvoqULIdm
 NJS7017WJUeqk9qSRfX0+56PIBygPdkPKNWHZoX6A8HRpdW52fF9fZuyoxWHc6HR/zKk
 Npzg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWKhmUbM3X6ZTOHjM+v/t982yJzjQ+58Q0xPRTjYuR5GweE1SboRzGxwYxvUsmxs4+juHe5LzYgX0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjTzh99IbS+e/EI6dMwf2Sbl97yINuNVypItZtQMv/6aSsNVyT
 lqPqFVS/mmPKxHm96QVRKfZFJ0YwxgA/bOkkPQWMQ2ha2AZrKT6x6za/Qr/SZ9k=
X-Gm-Gg: ASbGncum8AghHeNcQyjgHz/38PK3RaoMlVMhHAiSg1CLKRJWEm+ZbL/dDF2cwBWCvoS
 XNRoH6eYfuR1MotElaxnxLdkUIxtSz/Cl9Jy6+mefXngpZoLobieQeXIWRkzwRDehorZ/ijMP7H
 jxGYtxhWtdZVpbI10F06wq1hJLIK5FEW+P9DyT/t6ZVEwk20lJqKZXqeE0kvhFShethhWIftfHX
 xaOlSqNH8hPjfxD6fMEQUtsYcpwoBJCQKDxJKo3tKg52XbeSh+hVCBB3w2NUWbyvfj1ADSkcTm+
 YRobSc3Jm7Jps/Bpl9yvkBf2F/BeuqcS2sT7
X-Google-Smtp-Source: AGHT+IHf6pkAtxzAARwiQGzNbECIXTffJ/LFIaL0vm4+LTZtTr/waEIktn0uMxncfhNuRu6tqNYP7A==
X-Received: by 2002:a05:6512:3e02:b0:53e:38fd:7518 with SMTP id
 2adb3069b0e04-542845b1a57mr3023380e87.3.1736463790653; 
 Thu, 09 Jan 2025 15:03:10 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428becac3esm327366e87.233.2025.01.09.15.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 15:03:10 -0800 (PST)
Date: Fri, 10 Jan 2025 01:03:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH RFC / WIP 11/11] drm/msm/dpu: WIP: CTL_LAYER_EXT is gone
Message-ID: <h5eabjdgzsvn2hutcc6osndieg3v6hkusfdxnrfhy77gmyx4eq@4wwltux4erz5>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
 <20250109-b4-sm8750-display-v1-11-b3f15faf4c97@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-b4-sm8750-display-v1-11-b3f15faf4c97@linaro.org>
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

On Thu, Jan 09, 2025 at 02:08:38PM +0100, Krzysztof Kozlowski wrote:
> Not finished. Looking around, maybe someone already did some works
> around new CTL_PIPE_ACTIVE and CTL_LAYER_ACTIVE registers?

This is not enough, the whole blend setup is to be moved to LM
block.

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h | 12 ++++++------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          |  3 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          |  3 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c              | 10 ++++++++--
>  4 files changed, 20 insertions(+), 8 deletions(-)
> 

[...]

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 06b01cd36ce2442ee6e1b85be227851a234cc96b..502449cbbddcb21b7008f139ac065d187a16b68e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -40,6 +40,8 @@
>  #define   CTL_INTF_FLUSH                0x110
>  #define   CTL_CDM_FLUSH                0x114
>  #define   CTL_PERIPH_FLUSH              0x128
> +#define   CTL_PIPE_ACTIVE               0x12C
> +#define   CTL_LAYER_ACTIVE              0x130
>  #define   CTL_INTF_MASTER               0x134
>  #define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
>  
> @@ -729,8 +731,12 @@ static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
>  	ops->trigger_pending = dpu_hw_ctl_trigger_pending;
>  	ops->reset = dpu_hw_ctl_reset_control;
>  	ops->wait_reset_status = dpu_hw_ctl_wait_reset_status;
> -	ops->clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
> -	ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
> +	if (cap & BIT(DPU_CTL_NO_LAYER_EXT)) {

I'd prefer if this is was an explicit MDSS / DPU version check rather
than an extra feature bit, enable new functions for version >= 11.0

> +		// TODO: NOT COMPLETE, This has to be implemented
> +	} else {
> +		ops->clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
> +		ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
> +	}
>  	ops->update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
>  	ops->update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
>  	if (cap & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
