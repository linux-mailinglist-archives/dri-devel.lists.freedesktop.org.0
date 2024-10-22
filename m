Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E70E9A9DED
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 11:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E73A910E627;
	Tue, 22 Oct 2024 09:08:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="E5LP/10G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E086310E627
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 09:07:59 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a9a26a5d6bfso779505066b.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 02:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729588078; x=1730192878; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sqANacwu59WVDubToPeLNd0ZLGqiBFI013WHEtWvuoY=;
 b=E5LP/10GXuifgehpA1bgFMD8Jg4WsTMQiI88802OBLU/8RvgHJdxwTvtNgAL1WjwL0
 y/ND9hlTtP8WabC1wzYir0kM4wRc5u4jJojgU/nXYNL5cUElpVepikRB7a6cV/70J1hE
 qu6Vl8n9G24ZV64ZRDBgzjyFGcWtElJb3ZuCDi6cg/zX4jcgT/c2gG1VLwD+5vstVgyY
 jVR0/Yr55zGUF5XPm/CnkCbdWHJLXG+XvWqz0JDjyEAgSuMMDSEjWy38Fp0HHqTP2R1+
 +4nhp/il/1aUl0DzhdkPgAkPlhBIrt+q8coWtJAxUpG4etPPKXZGbcki36dXkm8PNyLl
 L5Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729588078; x=1730192878;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sqANacwu59WVDubToPeLNd0ZLGqiBFI013WHEtWvuoY=;
 b=sSSvmKHp1e3HjfoS/wqo86nm2L7BN+6s9XdmeqjFYwrLT3JQmiavzWWdVuglAqFrFw
 O49H4dpdHc7KnGElkfEav8xszvLXApGTjOZk1vjB99jfcmKQzI9QMD2C9Lm5+7iO+zN7
 q8PSKVBW4+EnbXx4sx21TOd0X7fsDsCdrJM+w45/ZC3QudjGUyzPMcZuqew3t66PdiZz
 S9l4ZNE+nCZxiKfsvaG8T2G1W6Wfqk5/KomXZCbX7OMZkXaItNJcM915cv6071bnIycb
 1yyaZoFoFCZxZ//fcoghujA915BmQRGjVs/iYO+PhPJKILQNq/PYb4iXWRYhYftWlt8n
 gaYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIHo/dhmpx/vmYUQaJF8tlPCNpupKYb31ZieOGFBsOs27jAa/21BQ8fZHboVLRQiu6fXxw8D0AjIk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyy5Ahs9MM9qkznkHhC3A5jchoj7pk4uwrnm1+I0HWErhb67IA0
 bqsdj/n9hsgHEaWH+r94sfCbA/0gklDEPJoT8On6a0HGmAj50uR9qlABYq3w/nE=
X-Google-Smtp-Source: AGHT+IGoE+jrhGDPxvzS+WZimT/uQDCBFmA0e0z1M8EFELzXgykeI+0Jev6cLL5gP+5Bp6fGDKWWLg==
X-Received: by 2002:a17:907:3e12:b0:a9a:4fd3:c35f with SMTP id
 a640c23a62f3a-a9a69a63db8mr1206244266b.9.1729588077786; 
 Tue, 22 Oct 2024 02:07:57 -0700 (PDT)
Received: from [192.168.0.40] ([176.61.106.227])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9a912d6267sm311979566b.32.2024.10.22.02.07.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Oct 2024 02:07:57 -0700 (PDT)
Message-ID: <3ee7a1c9-2d6d-4fd5-982e-d86151e45662@linaro.org>
Date: Tue, 22 Oct 2024 10:07:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/msm/adreno: Add support for ACD
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org
References: <20241021-gpu-acd-v2-0-9c25a62803bc@quicinc.com>
 <20241021-gpu-acd-v2-1-9c25a62803bc@quicinc.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20241021-gpu-acd-v2-1-9c25a62803bc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 21/10/2024 12:53, Akhil P Oommen wrote:
> ACD a.k.a Adaptive Clock Distribution is a feature which helps to reduce
> the power consumption. In some chipsets, it is also a requirement to
> support higher GPU frequencies. This patch adds support for GPU ACD by
> sending necessary data to GMU and AOSS. The feature support for the
> chipset is detected based on devicetree data.
> 
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 81 ++++++++++++++++++++++++++++-------
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  1 +
>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 36 ++++++++++++++++
>   drivers/gpu/drm/msm/adreno/a6xx_hfi.h | 21 +++++++++
>   4 files changed, 124 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 37927bdd6fbe..09fb3f397dbb 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1021,14 +1021,6 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>   
>   	gmu->hung = false;
>   
> -	/* Notify AOSS about the ACD state (unimplemented for now => disable it) */
> -	if (!IS_ERR(gmu->qmp)) {
> -		ret = qmp_send(gmu->qmp, "{class: gpu, res: acd, val: %d}",
> -			       0 /* Hardcode ACD to be disabled for now */);
> -		if (ret)
> -			dev_err(gmu->dev, "failed to send GPU ACD state\n");
> -	}
> -
>   	/* Turn on the resources */
>   	pm_runtime_get_sync(gmu->dev);
>   
> @@ -1476,6 +1468,64 @@ static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
>   	return a6xx_gmu_rpmh_votes_init(gmu);
>   }
>   
> +static int a6xx_gmu_acd_probe(struct a6xx_gmu *gmu)
> +{
> +	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> +	struct a6xx_hfi_acd_table *cmd = &gmu->acd_table;
> +	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +	struct msm_gpu *gpu = &adreno_gpu->base;
> +	int ret, i, cmd_idx = 0;
> +
> +	cmd->version = 1;
> +	cmd->stride = 1;
> +	cmd->enable_by_level = 0;
> +
> +	/* Skip freq = 0 and parse acd-level for rest of the OPPs */
> +	for (i = 1; i < gmu->nr_gpu_freqs; i++) {
> +		struct dev_pm_opp *opp;
> +		struct device_node *np;
> +		unsigned long freq;
> +		u32 val;
> +
> +		freq = gmu->gpu_freqs[i];
> +		opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, freq, true);
> +		np = dev_pm_opp_get_of_node(opp);
> +
> +		ret = of_property_read_u32(np, "qcom,opp-acd-level", &val);
> +		of_node_put(np);
> +		dev_pm_opp_put(opp);
> +		if (ret == -EINVAL)
> +			continue;
> +		else if (ret) {
> +			DRM_DEV_ERROR(gmu->dev, "Unable to read acd level for freq %lu\n", freq);
> +			return ret;
> +		}
> +
> +		cmd->enable_by_level |= BIT(i);
> +		cmd->data[cmd_idx++] = val;

How do you know that cmd_idx is always < sizeof(cmd->data); ?

> +	}
> +
> +	cmd->num_levels = cmd_idx;
> +
> +	/* We are done here if ACD is not required for any of the OPPs */
> +	if (!cmd->enable_by_level)
> +		return 0;
> +
> +	/* Initialize qmp node to talk to AOSS */
> +	gmu->qmp = qmp_get(gmu->dev);
> +	if (IS_ERR(gmu->qmp)) {
> +		cmd->enable_by_level = 0;
> +		return dev_err_probe(gmu->dev, PTR_ERR(gmu->qmp), "Failed to initialize qmp\n");
> +	}
> +
> +	/* Notify AOSS about the ACD state */
> +	ret = qmp_send(gmu->qmp, "{class: gpu, res: acd, val: %d}", 1);
> +	if (ret)
> +		DRM_DEV_ERROR(gmu->dev, "failed to send GPU ACD state\n");
> +
> +	return 0;

Shouldn't the ret from gmp_send() get propogated in the return of this 
function ?

i.e. how can your probe be successful if the notification failed ?

---
bod
