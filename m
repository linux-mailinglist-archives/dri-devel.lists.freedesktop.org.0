Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DB19EFE72
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 22:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9574E10E160;
	Thu, 12 Dec 2024 21:37:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zqOsrbg8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAB8810E462
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 21:37:54 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4361ecebc4dso8052815e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 13:37:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734039473; x=1734644273; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=sCkTwnsf1PiA+hFHolRkzDIblj6R2OKbctOKbJTNTe4=;
 b=zqOsrbg8GFoxQkIqqXf8q/r3I8JsrHAbj+vU4LkeeLRTRxRnrgwGR2HbnLIcCGvEcx
 7SfnkswX5tJNgr9ZPxSO7wn98rjUw9ngTP7ea37V63WY1lKTg12GKCJhOJznGJHBPZBP
 9c+ji7u/GSCrmwC5Q+rtShy1tIF826A5DGP0vBqiCF8SWNmNwNiV6lt4eO2TExAKzDwQ
 XiaHkjayOTk5zgQQl3+YQKVpI90DlA+qkiSE5uioBR0nMVXHlxVhQkXC8zJ1j5WW3JhM
 lDbkQDT3AJXETXWRlGuyoBTJTiMlOsQ/M6rhkcQP1AuU0rQnHqjv5HrXvUoavKPtcdqY
 HQag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734039473; x=1734644273;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=sCkTwnsf1PiA+hFHolRkzDIblj6R2OKbctOKbJTNTe4=;
 b=XfBs7f25W02LKOxIujeldK+afZhnY4l3aVLiX3kxTpTSa12df07x2aBfVB/eO9bGZS
 ZaupA678aeDeO/9Jbt4C5M1IHMoHGuQ6B5MRBSZPpQz8rpV+m8WdlzcJGSv6vrPQjwH7
 eyaVCzKperS3uuv7m6dKVS3TbRaZd7rpbp1JudYAyiFRl1oCiHDrWnRcsdRSNvtoDoid
 skm4UHqEzUE9f+2Hv6R5qdEl8EbMV0HYgfUBOjBSh78zLk1qg9SuAy8kXAMq7w1YuRLS
 KLrJV1aNR33Cwm7hc+mi8mo2RoKFROYxG6O84qeU4vVd+cTioSIco2jARXtezLplt5b1
 slsA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgcqaXh6xNW/FqGeAfcdsjGmrMv/EkwcwDkeWIWkJCOGK7Y/b+BElEIeeEE4DTdYtDGbq1Z3isKyA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxb0bSETk7eV3pPB+SZN4o9FKONtAtgi3eOogFb2WsVh/VXiLNt
 9OLagoto14HGtPFH7lrhGMUcTQtlHlE22mAlKK5YiazB7Zv8T6DEFfOERZTvmvk=
X-Gm-Gg: ASbGncuRp4XTkXuSFdx10xaYUw4TtDhQSaF3+yIqePYv54IzkyyOP+zLYnNrGRbldcZ
 bdRU5eFR38eLBeqK7dU7t/pGcX1LfMBx6j4gLENDMow0sMWc32EhU6O7+1ZGbbHajXYX7W7Yg5x
 AV52PjNJ48ebGxuBfFHHsoBGQX82euNB3RzQl+e2p4hhfLqZkzMX67JJwjs7J7P9w3mWWRCzr8f
 33sJhifm/Mb911uQDipizlBfJBBfgAyUQYDAMsDJsGmw++6nSFCzciPEJCu+a5VlEIrrivsSgz8
 wa+9wxKyZLEicSqt4IGHn9PveioyCKvYTw==
X-Google-Smtp-Source: AGHT+IH0fWO5XUP1USWRMXKG8TC1Mecy6u/d6ipjAauD0fNu54oNY/Jfg5nVZN0lC0VBwzh5I3O1qQ==
X-Received: by 2002:a05:600c:3491:b0:435:b064:7dce with SMTP id
 5b1f17b1804b1-4362aa66f9fmr1322065e9.18.1734039473355; 
 Thu, 12 Dec 2024 13:37:53 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b98a:c6fe:3a5d:f20a?
 ([2a01:e0a:982:cbb0:b98a:c6fe:3a5d:f20a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4362559ea75sm28203835e9.19.2024.12.12.13.37.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 13:37:52 -0800 (PST)
Message-ID: <2f1c6deb-29f8-4144-b086-743fb0f8495c@linaro.org>
Date: Thu, 12 Dec 2024 22:37:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 4/7] drm/msm: adreno: find bandwidth index of OPP and
 set it along freq index
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
 <20241211-topic-sm8x50-gpu-bw-vote-v5-4-6112f9f785ec@linaro.org>
 <ddf91ba2-cab2-4653-b842-65a8e82b5160@oss.qualcomm.com>
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
In-Reply-To: <ddf91ba2-cab2-4653-b842-65a8e82b5160@oss.qualcomm.com>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/12/2024 21:21, Konrad Dybcio wrote:
> On 11.12.2024 9:29 AM, Neil Armstrong wrote:
>> The Adreno GPU Management Unit (GMU) can also scale the DDR Bandwidth
>> along the Frequency and Power Domain level, until now we left the OPP
>> core scale the OPP bandwidth via the interconnect path.
>>
>> In order to enable bandwidth voting via the GPU Management
>> Unit (GMU), when an opp is set by devfreq we also look for
>> the corresponding bandwidth index in the previously generated
>> bw_table and pass this value along the frequency index to the GMU.
>>
>> The GMU also takes another vote called AB which is a 16bit quantized
>> value of the floor bandwidth against the maximum supported bandwidth.
>>
>> The AB is calculated with a default 25% of the bandwidth like the
>> downstream implementation too inform the GMU firmware the minimal
>> quantity of bandwidth we require for this OPP.
>>
>> Since we now vote for all resources via the GMU, setting the OPP
>> is no more needed, so we can completely skip calling
>> dev_pm_opp_set_opp() in this situation.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 39 +++++++++++++++++++++++++++++++++--
>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  2 +-
>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.c |  6 +++---
>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.h |  5 +++++
>>   4 files changed, 46 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> index 36696d372a42a27b26a018b19e73bc6d8a4a5235..46ae0ec7a16a41d55755ce04fb32404cdba087be 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>> @@ -110,9 +110,11 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>>   		       bool suspended)
>>   {
>>   	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>> +	const struct a6xx_info *info = adreno_gpu->info->a6xx;
>>   	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>>   	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>>   	u32 perf_index;
>> +	u32 bw_index = 0;
>>   	unsigned long gpu_freq;
>>   	int ret = 0;
>>   
>> @@ -125,6 +127,37 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp,
>>   		if (gpu_freq == gmu->gpu_freqs[perf_index])
>>   			break;
>>   
>> +	/* If enabled, find the corresponding DDR bandwidth index */
>> +	if (info->bcms && gmu->nr_gpu_bws > 1) {
> 
> if (gmu->nr_gpu_bws)

gmu->nr_gpu_bws == 1 means there's not BW in the OPPs (index 0 is the "off" state)

> 
>> +		unsigned int bw = dev_pm_opp_get_bw(opp, true, 0);
>> +
>> +		for (bw_index = 0; bw_index < gmu->nr_gpu_bws - 1; bw_index++) {
>> +			if (bw == gmu->gpu_bw_table[bw_index])
>> +				break;
>> +		}
>> +
>> +		/* Vote AB as a fraction of the max bandwidth */
>> +		if (bw) {
> 
> This seems to only be introduced with certain a7xx too.. you should
> ping the GMU with HFI_VALUE_GMU_AB_VOTE to check if it's supported

Good point

> 
>> +			u64 tmp;
>> +
>> +			/* For now, vote for 25% of the bandwidth */
>> +			tmp = bw * 25;
>> +			do_div(tmp, 100);
>> +
>> +			/*
>> +			 * The AB vote consists of a 16 bit wide quantized level
>> +			 * against the maximum supported bandwidth.
>> +			 * Quantization can be calculated as below:
>> +			 * vote = (bandwidth * 2^16) / max bandwidth
>> +			 */
>> +			tmp *= MAX_AB_VOTE;
>> +			do_div(tmp, gmu->gpu_bw_table[gmu->nr_gpu_bws - 1]);
>> +
>> +			bw_index |= AB_VOTE(clamp(tmp, 1, MAX_AB_VOTE));
>> +			bw_index |= AB_VOTE_ENABLE;
>> +		}
>> +	}
> 
> BTW, did you dump the values we send to the GMU here and in the RPMh
> builder part & validate against downstream?

It matches how downstream builds the Ab vote yes

> 
> Konrad

