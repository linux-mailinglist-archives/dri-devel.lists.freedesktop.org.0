Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 385419E3E6A
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 16:35:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FBF10E4DE;
	Wed,  4 Dec 2024 15:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FDfgzIUo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1E6310E4DE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 15:35:47 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-434a0fd9778so64091275e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 07:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733326546; x=1733931346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:from:subject:reply-to:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=EyRh8ZH9tEVXMeEOyCKNskIUoFN/r80r9Q9M0tEBlN0=;
 b=FDfgzIUohKpG9rhDyk88T0N+d5iOhNtEa8HbaavlpdcKMgXzVgTLoVyMd39AzTf7pK
 POHsm44p/VsLyHS/THPqFTnlSWLoQ5A/qhujPQ4nSLP4bMPebBSAq9P4LAesqMi7nMpN
 G0jPmgSgQ49d/29u3SHhOCnpZkR8fZOqlYVXx4fi+SP9UHJbJxwdDpQkOTl5s9Acr+Bn
 Ez6IeXfO4NaQ8XPi0OyNx1jxMdS+kkTMzmF+hQodP96WaQuJ+QnKSPNXxu8Jp00tvV9L
 CFax3wpzOhBQ/9bM3dLIsM8yMwSV/DbI5BWLZYGRa7alBus5toEk938XgunZzaq9kz+c
 HqRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733326546; x=1733931346;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:from:subject:reply-to:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=EyRh8ZH9tEVXMeEOyCKNskIUoFN/r80r9Q9M0tEBlN0=;
 b=IfMkWec6/iL1MEnLC6+Zusbdieql33jJ78EtIJvsNseMmssBp7V2+fqCAdqOfJ4uai
 3eiR5gK7BLjeHNX5SHVJlsvtUMiSjMWHkisRgtWorfiKS3UQlUngcF9IlLsv0b482DOH
 qLSOBj/ZZj+JDoaQcAfARYWl5E7bXyZe9U7r+s4zI6nFEMJ+JowTXmmQhjfDeChNP8n+
 RXbIXq3+WwrID2vPwCOwlkbQFO6Fn3ho30eP+PWh5QEJ2YiNrjy0bup9M2wSQPwgh4Kv
 HmPjYL0n1Ctd1ESF5AaIqNHbl3G+92HLOGg1AEPfYtLCULqc13ZdXAsxP6LxdwAbe6pN
 i34A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsEkF//TZvVk/0aKYkCFTtLffo/5e4otaxujCkvyy9jgK+toLZzOsIpxz/QPKn/qEGSwvGfhluu20=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxA2qtaDfrkI/X8GDjAjnzsBfz9tAxA+opdJOk0C309zWcJrOLe
 la/L7CZbnraNSyqLoHfwgKOYkL85YKsDauFKTRspoPjnlg1+kB5oIWufeqF8lUc=
X-Gm-Gg: ASbGncu8+v/2qpEbvLJEeI56rQimbxwK1hgg+tcXkJW/I+yImrnOOhUvMu/XRc9fK8q
 0vtVw5NBi1lC7Ti4fDqlYK6KOadY6+i1e3yxqWS5vjpU4kmTv79Nl8L1fWLPqii7/j0mE/FworG
 0Aiou2kTNd1Q2tZaPRfJpbVSccCAARfyHlmh7s00CNpFpQYfIQfsgGC/HFIZgHeY4VY0q1I3uZV
 8jZNuxGTmlJicoOs0TXUYdzHxK9qJprx1oaJWjCv3GAiH4MM9KTRZpsAYW/Con08UBf8Jx6AwnH
 VCVQpCV2cka2gHtrj7ReL1zL
X-Google-Smtp-Source: AGHT+IHiAiA+rbwpxrY615v78eCJDOazvV+l0N5ISgP3KyJkrhHxbRLeLj5G5SEhqpXJrVhicyOHgQ==
X-Received: by 2002:a05:600c:46ca:b0:434:a2a6:ed0d with SMTP id
 5b1f17b1804b1-434d0a23a81mr59023185e9.29.1733326546118; 
 Wed, 04 Dec 2024 07:35:46 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:740:b323:3531:5c75?
 ([2a01:e0a:982:cbb0:740:b323:3531:5c75])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434d526b14csm29014235e9.2.2024.12.04.07.35.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 07:35:45 -0800 (PST)
Message-ID: <4f359eef-5a5c-41ca-a318-8c4343709d54@linaro.org>
Date: Wed, 4 Dec 2024 16:35:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/7] drm/msm: adreno: add plumbing to generate
 bandwidth vote table for GMU
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
 <20241128-topic-sm8x50-gpu-bw-vote-v3-2-81d60c10fb73@linaro.org>
 <8cf9db06-0718-4c17-9712-d11943bcbe15@quicinc.com>
 <26a1fa02-0f47-40d8-9ba7-b76ba907297d@linaro.org>
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
In-Reply-To: <26a1fa02-0f47-40d8-9ba7-b76ba907297d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 02/12/2024 09:46, Neil Armstrong wrote:
> On 30/11/2024 22:49, Akhil P Oommen wrote:
>> On 11/28/2024 3:55 PM, Neil Armstrong wrote:
>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
>>> the Frequency and Power Domain level, but by default we leave the
>>> OPP core scale the interconnect ddr path.
>>>
>>> While scaling via the interconnect path was sufficient, newer GPUs
>>> like the A750 requires specific vote paremeters and bandwidth to
>>> achieve full functionality.
>>>
>>> In order to calculate vote values used by the GPU Management
>>> Unit (GMU), we need to parse all the possible OPP Bandwidths and
>>> create a vote value to be sent to the appropriate Bus Control
>>> Modules (BCMs) declared in the GPU info struct.
>>>
>>> This vote value is called IB, while on the othe side the GMU also
>>> takes another vote called AB which is a 16bit quantized value
>>> of the bandwidth against the maximum supported bandwidth.
>>>
>>> The vote array will then be used to dynamically generate the GMU
>>> bw_table sent during the GMU power-up.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> ---
>>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 174 ++++++++++++++++++++++++++++++++++
>>>   drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  14 +++
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   1 +
>>>   drivers/gpu/drm/msm/adreno/a6xx_hfi.h |   5 +
>>>   4 files changed, 194 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> index 14db7376c712d19446b38152e480bd5a1e0a5198..ee2010a01186721dd377f1655fcf05ddaff77131 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
>>> @@ -9,6 +9,7 @@
>>>   #include <linux/pm_domain.h>
>>>   #include <linux/pm_opp.h>
>>>   #include <soc/qcom/cmd-db.h>
>>> +#include <soc/qcom/tcs.h>
>>>   #include <drm/drm_gem.h>
>>>   #include "a6xx_gpu.h"
>>> @@ -1287,6 +1288,131 @@ static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
>>>       return 0;
>>>   }
>>> +/**
>>> + * struct bcm_db - Auxiliary data pertaining to each Bus Clock Manager (BCM)
>>> + * @unit: divisor used to convert bytes/sec bw value to an RPMh msg
>>> + * @width: multiplier used to convert bytes/sec bw value to an RPMh msg
>>> + * @vcd: virtual clock domain that this bcm belongs to
>>> + * @reserved: reserved field
>>> + */
>>> +struct bcm_db {
>>> +    __le32 unit;
>>> +    __le16 width;
>>> +    u8 vcd;
>>> +    u8 reserved;
>>> +};
>>> +
>>> +static u64 bcm_div(u64 num, u32 base)
>>> +{
>>> +    /* Ensure that small votes aren't lost. */
>>> +    if (num && num < base)
>>> +        return 1;
>>> +
>>> +    do_div(num, base);
>>> +
>>> +    return num;
>>> +}
>>> +
>>> +static int a6xx_gmu_rpmh_bw_votes_init(const struct a6xx_info *info,
>>> +                       struct a6xx_gmu *gmu)
>>> +{
>>> +    const struct bcm_db *bcm_data[GMU_MAX_BCMS] = { 0 };
>>> +    unsigned int bcm_index, bw_index, bcm_count = 0;
>>> +
>>> +    if (!info->bcms)
>>> +        return 0;
>>> +
>>> +    /* Retrieve BCM data from cmd-db */
>>> +    for (bcm_index = 0; bcm_index < GMU_MAX_BCMS; bcm_index++) {
>>> +        size_t count;
>>> +
>>> +        /* Stop at first unconfigured bcm */
>>> +        if (!info->bcms[bcm_index].name)
>>> +            break;
>>> +
>>> +        bcm_data[bcm_index] = cmd_db_read_aux_data(
>>> +                        info->bcms[bcm_index].name,
>>> +                        &count);
>>> +        if (IS_ERR(bcm_data[bcm_index]))
>>> +            return PTR_ERR(bcm_data[bcm_index]);
>>> +
>>> +        if (!count)
>>> +            return -EINVAL;
>>> +
>>> +        ++bcm_count;
>>> +    }
>>> +
>>> +    /* Generate BCM votes values for each bandwidth & BCM */
>>> +    for (bw_index = 0; bw_index < gmu->nr_gpu_bws; bw_index++) {
>>> +        u32 *data = gmu->gpu_ib_votes[bw_index];
>>> +        u32 bw = gmu->gpu_bw_table[bw_index];
>>> +
>>> +        /* Calculations loosely copied from bcm_aggregate() & tcs_cmd_gen() */
>>> +        for (bcm_index = 0; bcm_index < bcm_count; bcm_index++) {
>>> +            bool commit = false;
>>> +            u64 peak, vote;
>>> +            u16 width;
>>> +            u32 unit;
>>> +
>>> +            /* Skip unconfigured BCM */
>>> +            if (!bcm_data[bcm_index])
>>> +                continue;
>>> +
>>> +            if (bcm_index == bcm_count - 1 ||
>>> +                (bcm_data[bcm_index + 1] &&
>>> +                 bcm_data[bcm_index]->vcd != bcm_data[bcm_index + 1]->vcd))
>>> +                commit = true;
>>> +
>>> +            if (!bw) {
>>> +                data[bcm_index] = BCM_TCS_CMD(commit, false, 0, 0);
>>> +                continue;
>>> +            }
>>> +
>>> +            if (info->bcms[bcm_index].fixed) {
>>> +                u32 perfmode = 0;
>>> +
>>> +                if (bw >= info->bcms[bcm_index].perfmode_bw)
>>> +                    perfmode = info->bcms[bcm_index].perfmode;
>>> +
>>> +                data[bcm_index] = BCM_TCS_CMD(commit, true, 0, perfmode);
>>> +                continue;
>>> +            }
>>> +
>>> +            /* Multiply the bandwidth by the width of the connection */
>>> +            width = le16_to_cpu(bcm_data[bcm_index]->width);
>>> +            peak = bcm_div((u64)bw * width, info->bcms[bcm_index].buswidth);
>>> +
>>> +            /* Input bandwidth value is in KBps, scale the value to BCM unit */
>>> +            unit = le32_to_cpu(bcm_data[bcm_index]->unit);
>>> +            vote = bcm_div(peak * 1000ULL, unit);
>>> +
>>> +            if (vote > BCM_TCS_CMD_VOTE_MASK)
>>> +                vote = BCM_TCS_CMD_VOTE_MASK;
>>
>> use clamp()?
> 
> Yep, I think I could replace bcm_div with clamp
> 
>>
>>> +
>>> +            data[bcm_index] = BCM_TCS_CMD(commit, true, vote, vote);
>>> +        }
>>> +    }
>>> +
>>> +    /* Generate AB votes which are a quantitized bandwidth value */
>>> +    for (bw_index = 0; bw_index < gmu->nr_gpu_bws; bw_index++) {
>>> +        u64 tmp;
>>> +
>>> +        /*
>>> +         * The AB vote consists of a 16 bit wide quantized level
>>> +         * against the maximum supported bandwidth.
>>> +         * Quantization can be calculated as below:
>>> +         * vote = (bandwidth * 2^16) / max bandwidth
>>> +         */
>>> +        tmp = gmu->gpu_bw_table[bw_index] * MAX_AB_VOTE;
>>> +
>>> +        /* Divide by the maximum bandwidth to get a quantized value */
>>> +        gmu->gpu_ab_votes[bw_index] =
>>> +            bcm_div(tmp, gmu->gpu_bw_table[gmu->nr_gpu_bws - 1]);
>>> +    }
>>
>> So I suppose you are trying to vote AB equal to IB. Aggregation logic
>> for both are different. So this will make DDR scale very aggressively. A
>> more reasonable approach would be to vote a % of IB vote (25%?). Ideally
>> we should measure GPU's bandwidth usage and vote that if you are really
>> concerned about stability issues. IB is just a floor vote, GPU can
>> generate way higher traffic.
> 
> I think this should be optimized better in a different patchset, so I would
> like to make the simplest vote possible here to retain functionnality.
> 
> So if I understand I should divide this vote value by 4 ? Downstram uses 25% by default
> when no AB was calculated, but what does that mean exactly ?
> 
> Is there a counter somewhere to measure the GPU traffic ?


What if we also specified opp-avg-kBps for each OPP, define it to the downstream "qcom,bus-min"
and use this value for the AB vote ? and use 25% as fallback like downstream.

Neil

> 
>>
>>> +
>>> +    return 0;
>>> +}
>>> +
>>>   /* Return the 'arc-level' for the given frequency */
>>>   static unsigned int a6xx_gmu_get_arc_level(struct device *dev,
>>>                          unsigned long freq)
>>> @@ -1390,12 +1516,15 @@ static int a6xx_gmu_rpmh_arc_votes_init(struct device *dev, u32 *votes,
>>>    * The GMU votes with the RPMh for itself and on behalf of the GPU but we need
>>>    * to construct the list of votes on the CPU and send it over. Query the RPMh
>>>    * voltage levels and build the votes
>>> + * The GMU can also vote for DDR interconnects, use the OPP bandwidth entries
>>> + * and BCM parameters to build the votes.
>>>    */
>>>   static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
>>>   {
>>>       struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>>       struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>>> +    const struct a6xx_info *info = adreno_gpu->info->a6xx;
>>>       struct msm_gpu *gpu = &adreno_gpu->base;
>>>       int ret;
>>> @@ -1407,6 +1536,10 @@ static int a6xx_gmu_rpmh_votes_init(struct a6xx_gmu *gmu)
>>>       ret |= a6xx_gmu_rpmh_arc_votes_init(gmu->dev, gmu->cx_arc_votes,
>>>           gmu->gmu_freqs, gmu->nr_gmu_freqs, "cx.lvl");
>>> +    /* Build the interconnect votes */
>>> +    if (info->bcms && gmu->nr_gpu_bws > 1)
>>> +        ret |= a6xx_gmu_rpmh_bw_votes_init(info, gmu);
>>> +
>>>       return ret;
>>>   }
>>> @@ -1442,10 +1575,43 @@ static int a6xx_gmu_build_freq_table(struct device *dev, unsigned long *freqs,
>>>       return index;
>>>   }
>>> +static int a6xx_gmu_build_bw_table(struct device *dev, unsigned long *bandwidths,
>>> +        u32 size)
>>> +{
>>> +    int count = dev_pm_opp_get_opp_count(dev);
>>
>> I am less concerned about this now since you are not voting real AB BW.
> 
> Sorry I don't understand
> 
> Thanks,
> Neil
> 
>>
>> -Akhil.
>>
>>> +    struct dev_pm_opp *opp;
>>> +    int i, index = 0;
>>> +    unsigned int bandwidth = 1;
>>> +
>>> +    /*
>>> +     * The OPP table doesn't contain the "off" bandwidth level so we need to
>>> +     * add 1 to the table size to account for it
>>> +     */
>>> +
>>> +    if (WARN(count + 1 > size,
>>> +        "The GMU bandwidth table is being truncated\n"))
>>> +        count = size - 1;
>>> +
>>> +    /* Set the "off" bandwidth */
>>> +    bandwidths[index++] = 0;
>>> +
>>> +    for (i = 0; i < count; i++) {
>>> +        opp = dev_pm_opp_find_bw_ceil(dev, &bandwidth, 0);
>>> +        if (IS_ERR(opp))
>>> +            break;
>>> +
>>> +        dev_pm_opp_put(opp);
>>> +        bandwidths[index++] = bandwidth++;
>>> +    }
>>> +
>>> +    return index;
>>> +}
>>> +
>>>   static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
>>>   {
>>>       struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>>>       struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
>>> +    const struct a6xx_info *info = adreno_gpu->info->a6xx;
>>>       struct msm_gpu *gpu = &adreno_gpu->base;
>>>       int ret = 0;
>>> @@ -1472,6 +1638,14 @@ static int a6xx_gmu_pwrlevels_probe(struct a6xx_gmu *gmu)
>>>       gmu->current_perf_index = gmu->nr_gpu_freqs - 1;
>>> +    /*
>>> +     * The GMU also handles GPU Interconnect Votes so build a list
>>> +     * of DDR bandwidths from the GPU OPP table
>>> +     */
>>> +    if (info->bcms)
>>> +        gmu->nr_gpu_bws = a6xx_gmu_build_bw_table(&gpu->pdev->dev,
>>> +            gmu->gpu_bw_table, ARRAY_SIZE(gmu->gpu_bw_table));
>>> +
>>>       /* Build the list of RPMh votes that we'll send to the GMU */
>>>       return a6xx_gmu_rpmh_votes_init(gmu);
>>>   }
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>> index 88f18ea6a38a08b5b171709e5020010947a5d347..bdfc106cb3a578c90d7cd84f7d4fe228d761a994 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
>>> @@ -21,6 +21,15 @@ struct a6xx_gmu_bo {
>>>   #define GMU_MAX_GX_FREQS    16
>>>   #define GMU_MAX_CX_FREQS    4
>>> +#define GMU_MAX_BCMS        3
>>> +
>>> +struct a6xx_bcm {
>>> +    char *name;
>>> +    unsigned int buswidth;
>>> +    bool fixed;
>>> +    unsigned int perfmode;
>>> +    unsigned int perfmode_bw;
>>> +};
>>>   /*
>>>    * These define the different GMU wake up options - these define how both the
>>> @@ -85,6 +94,11 @@ struct a6xx_gmu {
>>>       unsigned long gpu_freqs[GMU_MAX_GX_FREQS];
>>>       u32 gx_arc_votes[GMU_MAX_GX_FREQS];
>>> +    int nr_gpu_bws;
>>> +    unsigned long gpu_bw_table[GMU_MAX_GX_FREQS];
>>> +    u32 gpu_ib_votes[GMU_MAX_GX_FREQS][GMU_MAX_BCMS];
>>> +    u16 gpu_ab_votes[GMU_MAX_GX_FREQS];
>>> +
>>>       int nr_gmu_freqs;
>>>       unsigned long gmu_freqs[GMU_MAX_CX_FREQS];
>>>       u32 cx_arc_votes[GMU_MAX_CX_FREQS];
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>> index 4aceffb6aae89c781facc2a6e4a82b20b341b6cb..9201a53dd341bf432923ffb44947e015208a3d02 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
>>> @@ -44,6 +44,7 @@ struct a6xx_info {
>>>       u32 gmu_chipid;
>>>       u32 gmu_cgc_mode;
>>>       u32 prim_fifo_threshold;
>>> +    const struct a6xx_bcm *bcms;
>>>   };
>>>   struct a6xx_gpu {
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
>>> index 528110169398f69f16443a29a1594d19c36fb595..52ba4a07d7b9a709289acd244a751ace9bdaab5d 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.h
>>> @@ -173,6 +173,11 @@ struct a6xx_hfi_gx_bw_perf_vote_cmd {
>>>       u32 bw;
>>>   };
>>> +#define AB_VOTE_MASK        GENMASK(31, 16)
>>> +#define MAX_AB_VOTE        (FIELD_MAX(AB_VOTE_MASK) - 1)
>>> +#define AB_VOTE(vote)        FIELD_PREP(AB_VOTE_MASK, (vote))
>>> +#define AB_VOTE_ENABLE        BIT(8)
>>> +
>>>   #define HFI_H2F_MSG_PREPARE_SLUMBER 33
>>>   struct a6xx_hfi_prep_slumber_cmd {
>>>
>>
> 

