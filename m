Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EBF6AA5173
	for <lists+dri-devel@lfdr.de>; Wed, 30 Apr 2025 18:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0709110E7F0;
	Wed, 30 Apr 2025 16:19:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="amr6gxvc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B801A10E10A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 16:19:29 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-39ee682e0ddso5140044f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Apr 2025 09:19:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746029968; x=1746634768; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=g7Se6Bcet/jD1trRSgYmZmnWG6hjkxwW1xZsDPD2EnI=;
 b=amr6gxvc+Y9lMp+Bsm6RcWOItx6dWCpC5e695P27A6S5KwdxouY13CSrehrF4gRScd
 QMfml12m+5GAIBj81wdvIk3XApgbISAqvj42WMPfdxR3/YvzhfooDet75BApmvbvm0Oc
 M4fxc8cpAebHH5C3MTJYkjDjoooCtbS+7G2q9BCLmpn3FgHGUbb+QRrOpnb0xOUIzkwD
 iG9dFD9Emwk+fSq04mmkmeA3GxoG5m8VsjYa1B5v0zsWm4YFlEd2KPcDSGefTaU0KFmm
 P9ZbiT+9YaLb+Aygy5qwqK/ZVmvTz4FkYIGpbnASqr/y8nxRJCtEQXVrnY+sM7y7ZGIT
 ic+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746029968; x=1746634768;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=g7Se6Bcet/jD1trRSgYmZmnWG6hjkxwW1xZsDPD2EnI=;
 b=d34VCumHIi1CUUJJVqZvhZNUj76Fv3D+HXaVyRGgbndB4EiNMDdg4R8j3UnbKsqcAt
 64yXCS6nkt0HkyFWOG7xMjuSGob/M8NhCvy1GXMs20shGmWpDEf9RHPyh9nCsRpR5rJA
 AUdNW6bdZXuglikSxRb3Vr/kODfSd0LSlUe+rZpB9cAA0JHUQMdsD5egWiv6EcfZLiIn
 Id6T1nenWpGjTAv7tT0QaLhxzrnFe2gmCgAMum2oHx5esovi9iusvD+gLXYXZFEMcHRn
 j7RMbUsUu42gF9Ym+egfsYkP2w7QXEcAq/yljCTd6eZJjh9VQb/Exbm2I+S3TwzmL5Pu
 psgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWHqQuzwu3dOmUHJT35BPloutVye2fLgahBNzZkEPfqkQxEn2U2G//Uzy7B9n33PkYK21WXi9JOo8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyc4lkM5GycWTn3SicCnA+nErDQVJ305pnFEPM/EKmdP7Pjmn5a
 Tp2Jv5dRJTpL1gxQo+GJs5wxV6KwR62SJ2I/U8k98AD4V7JX7CxUaM6BRNCKXeM=
X-Gm-Gg: ASbGnct5Gk7sEP4oi0s96FfM66ZDehFFREjhk5kkz/Vwu48oX7rHGEn4rI0gce4z5BL
 LJrzm/4dxUD2K0zdHM7x0JD6teY3DPE4a4rqOLFmUMqj84CdFJKdO0BIsvHjFc5p4BM4fT2k/MK
 48CwV/M+7gp2R4OFa7EM/pQly6nEV/Dy+NvLAmZCKervaeHBWkAK6wCNdkb8z5aIb6tw5DyuAth
 lAosxPSkIOCf7/vmzDbq9fscmjQVi2VKvXDI5mA00b1ELjNAmj0FB1cxiC7S2l7BjRWynLWXNOQ
 yw3NEo3rc5z+5RX+LYhCMAchRMX2wWMsKjAF4kSw83EUucoRPkwJKak4tQ2SYOsh71tipDwuxXL
 xaa4iK+FPBUKGmL62HQ==
X-Google-Smtp-Source: AGHT+IFPiRzjJ1dXuW8JSjggrKqr4T+OSJprmTDKCcWUMBgJRLMdsXrx1svViVBvRkDmlT4kDww2eg==
X-Received: by 2002:a05:6000:1785:b0:3a0:80dd:16d5 with SMTP id
 ffacd0b85a97d-3a08ff555bemr3020991f8f.55.1746029967967; 
 Wed, 30 Apr 2025 09:19:27 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:b3d6:213c:5c50:7785?
 ([2a01:e0a:3d9:2080:b3d6:213c:5c50:7785])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a07dbd6ea1sm13319523f8f.7.2025.04.30.09.19.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Apr 2025 09:19:27 -0700 (PDT)
Message-ID: <63105bce-6b8e-4b99-bca1-3741f27ea25a@linaro.org>
Date: Wed, 30 Apr 2025 18:19:26 +0200
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
 <a26213ec-808f-4edf-bb0d-ab469ee0a884@linaro.org>
 <281ab1b6-498e-4b29-9e15-19b5aae25342@oss.qualcomm.com>
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
In-Reply-To: <281ab1b6-498e-4b29-9e15-19b5aae25342@oss.qualcomm.com>
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

On 30/04/2025 17:36, Konrad Dybcio wrote:
> On 4/30/25 4:49 PM, neil.armstrong@linaro.org wrote:
>> On 30/04/2025 15:09, Konrad Dybcio wrote:
>>> On 4/30/25 2:49 PM, neil.armstrong@linaro.org wrote:
>>>> On 30/04/2025 14:35, Konrad Dybcio wrote:
>>>>> On 4/30/25 2:26 PM, neil.armstrong@linaro.org wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 30/04/2025 13:34, Konrad Dybcio wrote:
>>>>>>> From: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>>>>
>>>>>>> Add speebin data for A740, as found on SM8550 and derivative SoCs.
>>>>>>>
>>>>>>> For non-development SoCs it seems that "everything except FC_AC, FC_AF
>>>>>>> should be speedbin 1", but what the values are for said "everything" are
>>>>>>> not known, so that's an exercise left to the user..
>>>>>>>
>>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 8 ++++++++
>>>>>>>      1 file changed, 8 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>> index 53e2ff4406d8f0afe474aaafbf0e459ef8f4577d..61daa331567925e529deae5e25d6fb63a8ba8375 100644
>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>>>>> @@ -11,6 +11,9 @@
>>>>>>>      #include "a6xx.xml.h"
>>>>>>>      #include "a6xx_gmu.xml.h"
>>>>>>>      +#include <linux/soc/qcom/smem.h>
>>>>>>> +#include <linux/soc/qcom/socinfo.h>
>>>>>>> +
>>>>>>>      static const struct adreno_reglist a612_hwcg[] = {
>>>>>>>          {REG_A6XX_RBBM_CLOCK_CNTL_SP0, 0x22222222},
>>>>>>>          {REG_A6XX_RBBM_CLOCK_CNTL2_SP0, 0x02222220},
>>>>>>> @@ -1431,6 +1434,11 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>>>>              },
>>>>>>>              .address_space_size = SZ_16G,
>>>>>>>              .preempt_record_size = 4192 * SZ_1K,
>>>>>>> +        .speedbins = ADRENO_SPEEDBINS(
>>>>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
>>>>>>> +            { ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
>>>>>>> +            /* Other feature codes (on prod SoCs) should match to speedbin 1 */
>>>>>>
>>>>>> I'm trying to understand this sentence. because reading patch 4, when there's no match
>>>>>> devm_pm_opp_set_supported_hw() is simply never called so how can it match speedbin 1 ?
>>>>>
>>>>> What I'm saying is that all other entries that happen to be possibly
>>>>> added down the line are expected to be speedbin 1 (i.e. BIT(1))
>>>>>
>>>>>> Before this change the fallback was speedbin = BIT(0), but this disappeared.
>>>>>
>>>>> No, the default was to allow speedbin mask ~(0U)
>>>>
>>>> Hmm no:
>>>>
>>>>       supp_hw = fuse_to_supp_hw(info, speedbin);
>>>>
>>>>       if (supp_hw == UINT_MAX) {
>>>>           DRM_DEV_ERROR(dev,
>>>>               "missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
>>>>               speedbin);
>>>>           supp_hw = BIT(0); /* Default */
>>>>       }
>>>>
>>>>       ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
>>>>       if (ret)
>>>>           return ret;
>>>
>>> Right, that's my own code even..
>>>
>>> in any case, the kernel can't know about the speed bins that aren't
>>> defined and here we only define bin0, which doesn't break things
>>>
>>> the kernel isn't aware about hw with bin1 with or without this change
>>> so it effectively doesn't matter
>>
>> But it's regression for the other platforms, where before an unknown SKU
>> mapped to supp_hw=BIT(0)
>>
>> Not calling devm_pm_opp_set_supported_hw() is a major regression,
>> if the opp-supported-hw is present, the OPP will be rejected:
> 
> A comment in patch 4 explains that. We can either be forwards or backwards
> compatible (i.e. accept a limited amount of
> speedbin_in_driver x speedbin_in_dt combinations)

I have a hard time understanding the change, please be much more verbose
in the cover letter and commit messages.

The fact that you do such a large change in the speedbin policy in patch 4
makes it hard to understand why it's needed in the first place.

Finally I'm very concerned that "old" SM8550 DT won't work on new kernels,
this is frankly unacceptable, and this should be addressed in the first
place.

The nvmem situation was much simple, where we considered we added the nvmem
property at the same time as opp-supported-hw in OPPs, but it's no more the
case.

So I think the OPP API should probably be extended to address this situation
first, since if we do not have the opp-supported-hw in OPPs, all OPPs are safe.

So this code:
	count = of_property_count_u32_elems(np, "opp-supported-hw");
	if (count <= 0 || count % levels) {
		dev_err(dev, "%s: Invalid opp-supported-hw property (%d)\n",
			__func__, count);
		return false;
	}
should return true in this specific case, like a supported_hw_failsafe mode.

Neil

> 
> Konrad

