Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BD0AA4F09
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 16:49:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5DBD10E7BB;
	Wed, 30 Apr 2025 14:49:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="XZ2AiK2O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEAE510E7BB
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 14:49:20 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-39ee57c0b8cso8105652f8f.0
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 07:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746024559; x=1746629359; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=1RqdX/DnBKaAL2ccd0QiLQOKQZs79JYq/OxFCxJknp8=;
 b=XZ2AiK2OPL0bP5oN0K+i00IGKoYGiUkMsDqGB7niykUwuJCmhO66632mSI3HPF8J61
 9DReBzm1fuor/ORe5VKXtYMywcQixZTUKIA7L4f3HmopTtYPSrTgOmZUSZ0ayeUS0wQj
 IJRFDPGO4si8xBe4ChyZnX9NiB+YY1oAWokEgt8DN4lrgY84hL6XULF7aXkyzZWEllmH
 SRMPUSlikWXOo8fOffSEUwU54WVnvufQHCO9BN67yGvYEjL3w89Xw/q2bDk1qEhiJZfQ
 pMXLcWY34GLaXeiG7Iq2plq+bakfDofU9dWRQYyjonCQ0qasMa1SnVUpG4dbSyD41UV9
 Zsvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746024559; x=1746629359;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=1RqdX/DnBKaAL2ccd0QiLQOKQZs79JYq/OxFCxJknp8=;
 b=TzQC4177a17y2tOE2vh4+DsAvIXbJfBVxK0tMEn+hsgTV38xyhLJFi+895AEoS77zH
 E8HNtmt9cWBRyy73jtlc09DOr8dF2jH52Qnj8grgwWmvpiuXUznOd//Gn0Wrtye1V46O
 8wdbQ1hMbNnuEKcGQ34Y5Jb+AuF54iBvqy9mKBlN1VQdI5CBS0Rwayeh+VftlwrkaGrV
 pa1axNwgd7HJqM2YvBzFJ6lUlh2nKTX7AqHlrWqCkZA9Orxemf1Ke/KAlvoRL5FLYagY
 miJlgsB6kVHuiN8jiKCJkzeDzwqddiA+a2Xgp/ZDYrIRzuOVCTMDxZEnMU6pL8xG/iH1
 mbTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz8MPjVCFgcLK71e+XrAKjHHuLgJzrp1XUvx3x+8D4YSL0LWyUsehoNCZHnNh2ZdzLATk4XYn9Afg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzMjSn+UJeRAVHcHUeQ/TI6l53ximUS0Wzg4Uvyn6Yz6HcfZD1r
 EGDqC7MSeVLR0G0EA54PLb+FWwEt6Y40EFzGBcJPc0brpUuO4BmPQMKugQl/yrk=
X-Gm-Gg: ASbGncuYp6PWiv3dK4Xx1r/bxLr9wSCW+w95WfPnVKqRBDJ+BpRmxD60mbjfsaubYED
 +M/LDvulETI1zwOzMidtH8N7oNDwKeWwCYUBflLml0/yIwfiyDop8ST2jv2+whNGpkPjgdpoczO
 MaITGcp6trEKei0RwlpoDpPJSyiSkdUXk3Ge1l5P8RabN5vo9kUtOF6u05EovS9TncAuDTwuhsZ
 nYmJsRfEmyVWStbxKR/RZsWDPeeoWYOUvTUmlQqnZM7NiX4h0hPjhHk/vDvjyzh0t3sOc+ZvjhM
 02A2+IG00m8vRVDOfJSjQFfanxCd2zuDD4CehXx+yl2R58YNzz02OmMHtQStsUp31hZt408Q25b
 1HCU1ajoJlMqBbkaQTQ==
X-Google-Smtp-Source: AGHT+IH5RToavPzsqmcP3rrYHSVRaH7ZbG3bUAXbFz2vDPdI/yavfdXM8NVtxQIg8VPdzVXTGW0OoA==
X-Received: by 2002:a5d:5887:0:b0:390:f0ff:2c11 with SMTP id
 ffacd0b85a97d-3a08f7538dfmr3670511f8f.2.1746024558772; 
 Wed, 30 Apr 2025 07:49:18 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b3d6:213c:5c50:7785?
 ([2a01:e0a:3d9:2080:b3d6:213c:5c50:7785])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a073e4684csm17177628f8f.76.2025.04.30.07.49.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 07:49:18 -0700 (PDT)
Message-ID: <a26213ec-808f-4edf-bb0d-ab469ee0a884@linaro.org>
Date: Wed, 30 Apr 2025 16:49:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH RFT v6 2/5] drm/msm/adreno: Add speedbin data for SM8550 /
 A740
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
 <20250430-topic-smem_speedbin_respin-v6-2-954ff66061cf@oss.qualcomm.com>
 <13cd20c6-f758-45ff-82d1-4fd663d1698c@linaro.org>
 <886d979d-c513-4ab8-829e-4a885953079a@oss.qualcomm.com>
 <b838f9bd-0537-4f8d-b24b-d96700d566c8@linaro.org>
 <98a4ad20-c141-4280-801e-015dafd1fb39@oss.qualcomm.com>
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
In-Reply-To: <98a4ad20-c141-4280-801e-015dafd1fb39@oss.qualcomm.com>
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

On 30/04/2025 15:09, Konrad Dybcio wrote:
> On 4/30/25 2:49 PM, neil.armstrong@linaro.org wrote:
>> On 30/04/2025 14:35, Konrad Dybcio wrote:
>>> On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
>>>> Hi,
>>>>
>>>> On 30/04/2025 13:34, Konrad Dybcio wrote:
>>>>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>>
>>>>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>>>>
>>>>> For non-development SoCs it seems that "everything except FC_AC, FC_AF
>>>>> should be speedbin 1", but what the values are for said "everything" are
>>>>> not known, so that's an exercise left to the user..
>>>>>
>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>> ---
>>>>>     drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
>>>>>     1 file changed, 8 insertions(+)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>> index 53e2ff4406d8f0afe474aaafbf0e459ef8f4577d..61daa331567925e529deae5e25d6fb63a8ba8375 100644
>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>> @@ -11,6 +11,9 @@
>>>>>     #include "a6xx.xml.h"
>>>>>     #include "a6xx_gmu.xml.h"
>>>>>     +#include <linux/soc/qcom/smem.h>
>>>>> +#include <linux/soc/qcom/socinfo.h>
>>>>> +
>>>>>     static const struct adreno_reglist a612_hwcg[] = {
>>>>>         {REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
>>>>>         {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>>>>> @@ -1431,6 +1434,11 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>>             },
>>>>>             .address_space_size = SZ_16G,
>>>>>             .preempt_record_size = 4192 * SZ_1K,
>>>>> +        .speedbins = ADRENO_SPEEDBINS(
>>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
>>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
>>>>> +            /* Other feature codes (on prod SoCs) should match to speedbin 1 */
>>>>
>>>> I'm trying to understand this sentence. because reading patch 4, when there's no match
>>>> devm_pm_opp_set_supported_hw() is simply never called so how can it match speedbin 1 ?
>>>
>>> What I'm saying is that all other entries that happen to be possibly
>>> added down the line are expected to be speedbin 1 (i.e. BIT(1))
>>>
>>>> Before this change the fallback was speedbin = BIT(0), but this disappeared.
>>>
>>> No, the default was to allow speedbin mask ~(0U)
>>
>> Hmm no:
>>
>>      supp_hw = fuse_to_supp_hw(info, speedbin);
>>
>>      if (supp_hw == UINT_MAX) {
>>          DRM_DEV_ERROR(dev,
>>              "missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
>>              speedbin);
>>          supp_hw = BIT(0); /* Default */
>>      }
>>
>>      ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
>>      if (ret)
>>          return ret;
> 
> Right, that's my own code even..
> 
> in any case, the kernel can't know about the speed bins that aren't
> defined and here we only define bin0, which doesn't break things
> 
> the kernel isn't aware about hw with bin1 with or without this change
> so it effectively doesn't matter

But it's regression for the other platforms, where before an unknown SKU
mapped to supp_hw=BIT(0)

Not calling devm_pm_opp_set_supported_hw() is a major regression,
if the opp-supported-hw is present, the OPP will be rejected:

https://elixir.bootlin.com/linux/v6.14.4/source/drivers/opp/of.c#L538

	if (!opp_table->supported_hw) {
		/*
		 * In the case that no supported_hw has been set by the
		 * platform but there is an opp-supported-hw value set for
		 * an OPP then the OPP should not be enabled as there is
		 * no way to see if the hardware supports it.
		 */
		if (of_property_present(np, "opp-supported-hw"))
			return false;
		else
			return true;
	}

Neil

> 
> Konrad

