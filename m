Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDF049CD9EB
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 08:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F38910E3A5;
	Fri, 15 Nov 2024 07:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Fjwmhoi6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com
 [209.85.208.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C633010E139
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2024 07:28:28 +0000 (UTC)
Received: by mail-lj1-f179.google.com with SMTP id
 38308e7fff4ca-2fb50e84ec7so12043101fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 23:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731655707; x=1732260507; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=/GwN7axuFnJwGV4zNdR/K7IbEiX+PCDHxU+ABf832Zg=;
 b=Fjwmhoi6Unixlh0zuRUDV3wrEN9u2MLVaoch2JzAmnST8G45iRdM3KO+0nsIyg+VtW
 eEoYKJ0MrHz7DZ6WArCWNhh+FpctnOOguAzei609DbnasGJzOCR3kVz4RNNsB5EXT+d+
 ce/kQth1FyUu3NeIX1zAvrNphCIc4brzVMGwd4ODgaW/b8NiQSlgHnz7LdtRGFa6sFk9
 6ah6w3lcNJlK6iBZVU8c+YAHrBdLtnz4LEM313idVIgHP2WdQTdkIubxNYpAH9yIIwUS
 RO+Vvs/wLwstfUOU4JIjcI3eOgO8PD0JvnLTcY7jrBewHn3quNRy+FkTmOlyX7Xohh47
 Q3Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731655707; x=1732260507;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/GwN7axuFnJwGV4zNdR/K7IbEiX+PCDHxU+ABf832Zg=;
 b=aNIJVQFaQMFD1oJF2atL4amK1KrStddYD6gNyiY9UIhrlNlPpRtR6N0SrQxSGUoPzP
 4/IeasOjzZLiFZ/+LWCB6J3I/oYUczOaJPPdrhFMd491z4RvALtPDHMsFeWQfwxX1wqL
 B863jfckp4jpPKvRX6VprHKIwd8fpgCRGnB4vD+ir1nBRi9HRX1XKlY2FyrCZ/QqemPj
 jYzvyV9TdqTEfmqcwlNas6RQdOz4AcTrZ2tQgOus6WC6Zg6FlCHFXrdEvb0c2wyStHXv
 oSkU8llPkYv7V6XPA7zW8AvldeS9e7Ia0zlVL+xgWv0EJFaGFVSp942MAEmY9Jklg1rm
 WQqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWS0i9DtiqacqU5wIkMqLkfmuCvCPrwTlKKAb+tRWjB1J6HmdnPsS86M9hY5tsOzoTFsbTCKNywoII=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTbVplkfEmwtDMwZbbLOiTbzhH8X74s2sRVaCThO3g1F3mbHNY
 bYOb2+g6Bj+HfpTvHQs82LZelxor17kz/DO88ZO/tbAbWkKuXCMroZ3hdnd1xzU=
X-Google-Smtp-Source: AGHT+IHI9ax56yXePo1V9MbCWM4uPRipd+fXjT7Ug8imMQgOMNPQ6F5cq7l/TiXiyQtSP+9DaXDpmw==
X-Received: by 2002:a05:651c:1551:b0:2fa:c014:4b6b with SMTP id
 38308e7fff4ca-2ff609d868fmr7153221fa.41.1731655706847; 
 Thu, 14 Nov 2024 23:28:26 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff597a053bsm4547781fa.56.2024.11.14.23.28.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Nov 2024 23:28:25 -0800 (PST)
Date: Fri, 15 Nov 2024 09:28:23 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
Subject: Re: [PATCH RFC 5/8] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
Message-ID: <ith6te3m4cjwjyxrsxpjsvqsyjr3qrmlyyo7cucljuweuzn37b@lmd5b5mqwkbw>
References: <20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org>
 <20241113-topic-sm8x50-gpu-bw-vote-v1-5-3b8d39737a9b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241113-topic-sm8x50-gpu-bw-vote-v1-5-3b8d39737a9b@linaro.org>
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

On Wed, Nov 13, 2024 at 04:48:31PM +0100, Neil Armstrong wrote:
> The Adreno GMU Management Unit (GMU) can also scale the DDR Bandwidth
> along the Frequency and Power Domain level, until now we left the OPP
> core scale the OPP bandwidth via the interconnect path.
> 
> In order to enable bandwidth voting via the GPU Management
> Unit (GMU), when an opp is set by devfreq we also look for
> the corresponding bandwidth index in the previously generated
> bw_table and pass this value along the frequency index to the GMU.
> 
> Since we now vote for all resources via the GMU, setting the OPP
> is no more needed, so we can completely skip calling
> dev_pm_opp_set_opp() in this situation.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 17 +++++++++++++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
>  3 files changed, 19 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 504a7c5d5a9df4c787951f2ae3a69d566d205ad5..1131c3521ebbb0d053aceb162052ed01e197726a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -113,6 +113,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>  	u32 perf_index;
> +	u32 bw_index = 0;
>  	unsigned long gpu_freq;
>  	int ret = 0;
>  
> @@ -125,6 +126,16 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>  		if (gpu_freq == gmu->gpu_freqs[perf_index])
>  			break;
>  
> +	/* If enabled, find the corresponding DDR bandwidth index */
> +	if ((adreno_gpu->info->quirks & ADRENO_QUIRK_GMU_BW_VOTE) && gmu->nr_gpu_bws) {
> +		unsigned int bw = dev_pm_opp_get_bandwidth(opp, true, 0);
> +
> +		for (bw_index = 0; bw_index < gmu->nr_gpu_bws - 1; bw_index++) {
> +			if (bw == gmu->gpu_bw_table[bw_index])
> +				break;
> +		}
> +	}
> +
>  	gmu->current_perf_index = perf_index;
>  	gmu->freq = gmu->gpu_freqs[perf_index];
>  
> @@ -140,8 +151,10 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>  		return;
>  
>  	if (!gmu->legacy) {
> -		a6xx_hfi_set_freq(gmu, perf_index);
> -		dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
> +		a6xx_hfi_set_freq(gmu, perf_index, bw_index);
> +		/* With Bandwidth voting, we now vote for all resources, so skip OPP set */
> +		if (bw_index)

if (!bw_index) ???

Also should there be a 0 vote too in case we are shutting down /
suspending?

> +			dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
>  		return;
>  	}
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 95c632d8987a517f067c48c61c6c06b9a4f61fc0..9b4f2b1a0c48a133cd5c48713bc321c74eaffce9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -205,7 +205,7 @@ void a6xx_hfi_init(struct a6xx_gmu *gmu);
>  int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state);
>  void a6xx_hfi_stop(struct a6xx_gmu *gmu);
>  int a6xx_hfi_send_prep_slumber(struct a6xx_gmu *gmu);
> -int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
> +int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int perf_index, int bw_index);
>  
>  bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
>  bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index 9a89ba95843e7805d78f0e5ddbe328677b6431dd..e2325c15677f1a1194a811e6ecbb5931bdfb1ad9 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -752,13 +752,13 @@ static int a6xx_hfi_send_core_fw_start(struct a6xx_gmu *gmu)
>  		sizeof(msg), NULL, 0);
>  }
>  
> -int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index)
> +int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int freq_index, int bw_index)
>  {
>  	struct a6xx_hfi_gx_bw_perf_vote_cmd msg = { 0 };
>  
>  	msg.ack_type = 1; /* blocking */
> -	msg.freq = index;
> -	msg.bw = 0; /* TODO: bus scaling */
> +	msg.freq = freq_index;
> +	msg.bw = bw_index;
>  
>  	return a6xx_hfi_send_msg(gmu, HFI_H2F_MSG_GX_BW_PERF_VOTE, &msg,
>  		sizeof(msg), NULL, 0);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
