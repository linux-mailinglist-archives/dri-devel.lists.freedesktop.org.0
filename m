Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC3DABD100
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 09:54:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C539410E389;
	Tue, 20 May 2025 07:54:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r/VYw210";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851A610E2F8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 07:54:14 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-43cfba466b2so57325935e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 00:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747727653; x=1748332453; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=tRX/TviA7rDJz3hAZllExG6+bSXrcNbbY0xUHMxwW/A=;
 b=r/VYw210CjCQP1PxhoQ0m6UW4XecYjZZ5/SZdXqp8a4q9Dm5eDAa6qQ70X9UoxT1uT
 0e0t22D6fbfxnrZFtPXTwQWEVmW6jF13PmnHVipMG8DjtziEh10sRdqB2x/T2ykUOuML
 jbS/yYpfQJ3atEPDDSPH97wC4e+NKI7lQvodBriAqE9HYPrwd9H37bUtOaGWE9aBXQAJ
 KptqLeUJln25fRrzqsybuSGBmm5c3UyXL0cQT2X7r3Ft4jshVvITa0V7PBFfHIrxI93+
 A7iZ/bVvtiXcUppP9f7tY7GoyM+IjTTeNyVkoioXfsaWLLlyO/wse1A9zKPUEVO+opxU
 jxTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747727653; x=1748332453;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tRX/TviA7rDJz3hAZllExG6+bSXrcNbbY0xUHMxwW/A=;
 b=UhUwqXega/8+T9vKXisYt+8XeDWOsHm3Ci98chnMoTgDbq7tHosMbtYKu408RUNG5B
 8EIdQxxAZhvD0+V1ufm1dqyZAijwpDs9z0IRJE6XXr6GSW3n1xQ7qWjZ5X/4fHY0/gil
 sKOUsgi8iObKZiLinr/beaL2RxYCrJqrgs0MaXiYzziOIcf/voBRMzyJE3Obun+ZeZwh
 bYfHY+Q5f9fH0xTveFc5IniJbpChYfS2+RuUYupaturhrKeaxCI5Widuq3jZVxcFWTvZ
 RZCuZfxckexgK6lzyL8tSi/YJeiRRy1TVrL42JYEaOVwKg2lUAbPcE1TQgpIFGFiw8QR
 yusQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/uA7NtLI9TZngLdgd9QLrByIFjlSL6P/4p4yQAryd9JMZVUzblDoTxgTFTaSbFLD3pDbHlfLmq2M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaJ8XcenSefih21HdkUHog/nxjkJeDRbiz2D0L+bMFsgZtvTME
 tAzrHdXqPSvF505UU7Q4nMMl/EAsi8xTAUzaK0uQH/NVwYTzcnxpqj3K5exeRFEan8s=
X-Gm-Gg: ASbGncu13OaHcLrqZtv4FZUZ2Ci7JHJ8QuBrhGwEikMxcDzdEJoVASZ8Fy4BnOypQNc
 m89uauSelrlF6VHPTNLeLdM5zmIwZO9tFsqtAL7Sj43zxxsDQk2wdsiFppkvFTJHaIvxzGsgo/M
 upJo81Wuzef8l66bw+jUo5etb5OzP9qKsfs6wu4CloQjpydASAq//9PAZgU4MZYFBsHY+4la72d
 kk9matzseMuAIBzZj7mMUTpTJCY1q6vXZfkmXdkrmDYmPQ6aTZbX5MJ4UfuUb3EzGzyygcAnTqx
 zrIzR45aaD2SBFSXV1R1hFdz3Elp+j2DK8CfbTO26drQNqRu+j5lYqDLi9fiaOvige4dG4nh7IL
 +TlfLDDupoviv/gcOSsgqHxLihPte
X-Google-Smtp-Source: AGHT+IFTJekR6X1PN3LwqWeWE3hi9ANzy7PCYezWBkmtzqlxsMo0yYh+AqP8nCMsccEd5+CiqmX4cw==
X-Received: by 2002:a05:600c:4e09:b0:43c:ec28:d31b with SMTP id
 5b1f17b1804b1-442fefef01bmr189342725e9.10.1747727652613; 
 Tue, 20 May 2025 00:54:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca4d0fasm15559385f8f.8.2025.05.20.00.54.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 00:54:12 -0700 (PDT)
Message-ID: <b4484160-dadb-48dc-b71c-cfc62228e287@linaro.org>
Date: Tue, 20 May 2025 09:54:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 18/30] drm/msm/dpu: get rid of DPU_MDP_VSYNC_SEL
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-18-6c5e88e31383@oss.qualcomm.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250519-dpu-drop-features-v4-18-6c5e88e31383@oss.qualcomm.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Continue migration to the MDSS-revision based checks and replace
> DPU_MDP_VSYNC_SEL feature bit with the core_major_ver < 5 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 3 ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c               | 2 +-
>   10 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
> index c0b4db94777c42efd941fdd52993b854ab54c694..29e0eba91930f96fb94c97c33b4490771c3a7c17 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
> @@ -19,7 +19,6 @@ static const struct dpu_mdp_cfg msm8937_mdp[] = {
>   	{
>   		.name = "top_0",
>   		.base = 0x0, .len = 0x454,
> -		.features = BIT(DPU_MDP_VSYNC_SEL),
>   		.clk_ctrls = {
>   			[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   			[DPU_CLK_CTRL_RGB0] = { .reg_off = 0x2ac, .bit_off = 4 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
> index d3e4c48be306a04b457cc002910eb018a3f13154..cb1ee4b63f9fe8f0b069ad4a75b121d40e988d2b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
> @@ -19,7 +19,6 @@ static const struct dpu_mdp_cfg msm8917_mdp[] = {
>   	{
>   		.name = "top_0",
>   		.base = 0x0, .len = 0x454,
> -		.features = BIT(DPU_MDP_VSYNC_SEL),
>   		.clk_ctrls = {
>   			[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   			[DPU_CLK_CTRL_RGB0] = { .reg_off = 0x2ac, .bit_off = 4 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
> index c488b88332d0e69cfb23bcf4e41a2e4f4be6844d..b44d02b48418f7bca50b04119540122fb861b971 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
> @@ -19,7 +19,6 @@ static const struct dpu_mdp_cfg msm8953_mdp[] = {
>   	{
>   		.name = "top_0",
>   		.base = 0x0, .len = 0x454,
> -		.features = BIT(DPU_MDP_VSYNC_SEL),
>   		.clk_ctrls = {
>   			[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   			[DPU_CLK_CTRL_RGB0] = { .reg_off = 0x2ac, .bit_off = 4 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
> index 0e8e71775f2c1c38af018353c85ffeb6ccddb42f..8af63db315b45a5a44836303c8ce92eeccc5b1f8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
> @@ -22,7 +22,6 @@ static const struct dpu_mdp_cfg msm8996_mdp[] = {
>   	{
>   		.name = "top_0",
>   		.base = 0x0, .len = 0x454,
> -		.features = BIT(DPU_MDP_VSYNC_SEL),
>   		.clk_ctrls = {
>   			[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   			[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> index f2ec30837f9ccbff1041f0465d0123382a00355a..f91220496082bd101099c1817c41699215980d53 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
> @@ -23,7 +23,6 @@ static const struct dpu_caps msm8998_dpu_caps = {
>   static const struct dpu_mdp_cfg msm8998_mdp = {
>   	.name = "top_0",
>   	.base = 0x0, .len = 0x458,
> -	.features = BIT(DPU_MDP_VSYNC_SEL),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
> index 26f39acd82e07c71cbeaaa72c14d9b7e14d2dcc3..8f9a097147c02b538e720dd52f77e705f7ff1ca2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
> @@ -22,7 +22,6 @@ static const struct dpu_caps sdm660_dpu_caps = {
>   static const struct dpu_mdp_cfg sdm660_mdp = {
>   	.name = "top_0",
>   	.base = 0x0, .len = 0x458,
> -	.features = BIT(DPU_MDP_VSYNC_SEL),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
> index 657f733c9ffff73f9eb5051ba55ed2e4e7bb496d..0ad18bd273ff8c080f001f0bee654393cf0c24cd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
> @@ -22,7 +22,6 @@ static const struct dpu_caps sdm630_dpu_caps = {
>   static const struct dpu_mdp_cfg sdm630_mdp = {
>   	.name = "top_0",
>   	.base = 0x0, .len = 0x458,
> -	.features = BIT(DPU_MDP_VSYNC_SEL),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   		[DPU_CLK_CTRL_DMA0] = { .reg_off = 0x2ac, .bit_off = 8 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> index 15da5ded19267711e6df8605d576539475fe634c..3e66feb3e18dcc1d9ed5403a42989d97f84a8edc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
> @@ -23,7 +23,7 @@ static const struct dpu_caps sdm845_dpu_caps = {
>   static const struct dpu_mdp_cfg sdm845_mdp = {
>   	.name = "top_0",
>   	.base = 0x0, .len = 0x45c,
> -	.features = BIT(DPU_MDP_AUDIO_SELECT) | BIT(DPU_MDP_VSYNC_SEL),
> +	.features = BIT(DPU_MDP_AUDIO_SELECT),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index d48c26a7cb6b69961cebc19576e3f7fc3b8dd2c5..92dfbb5e7f916bf32afeffdb6b843f1da3f3fd44 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -34,8 +34,6 @@
>    * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
>    * @DPU_MDP_PERIPH_0_REMOVED Indicates that access to periph top0 block results
>    *			   in a failure
> - * @DPU_MDP_VSYNC_SEL      Enables vsync source selection via MDP_VSYNC_SEL register
> - *                         (moved into INTF block since DPU 5.0.0)
>    * @DPU_MDP_MAX            Maximum value
>   
>    */
> @@ -44,7 +42,6 @@ enum {
>   	DPU_MDP_10BIT_SUPPORT,
>   	DPU_MDP_AUDIO_SELECT,
>   	DPU_MDP_PERIPH_0_REMOVED,
> -	DPU_MDP_VSYNC_SEL,
>   	DPU_MDP_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> index 562a3f4c5238a3ad6c8c1fa4d285b9165ada3cfd..cebe7ce7b258fc178a687770906f7c4c20aa0d4c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> @@ -270,7 +270,7 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
>   	ops->setup_clk_force_ctrl = dpu_hw_setup_clk_force_ctrl;
>   	ops->get_danger_status = dpu_hw_get_danger_status;
>   
> -	if (cap & BIT(DPU_MDP_VSYNC_SEL))
> +	if (mdss_rev->core_major_ver < 5)
>   		ops->setup_vsync_source = dpu_hw_setup_vsync_sel;
>   	else if (!(cap & BIT(DPU_MDP_PERIPH_0_REMOVED)))
>   		ops->setup_vsync_source = dpu_hw_setup_wd_timer;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
