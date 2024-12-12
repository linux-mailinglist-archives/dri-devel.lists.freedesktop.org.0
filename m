Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC7F9EFE5F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 22:36:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA6F10E1D9;
	Thu, 12 Dec 2024 21:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UiCuwPDc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94DBD10E160
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 21:36:39 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-385eed29d17so618284f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 13:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734039398; x=1734644198; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=IrqCs7YMF6CRcL8FZmtgSzX0pK8+d3Z/bKsneCeFTBk=;
 b=UiCuwPDcwom/1sLCR0p8n3tGhpfkfhcDzw5qJzOrHwzHD1A4UjzEHLzX5RYH+yNcYA
 ognzjkRzTrKeJillLcZmH1uwjBXm3B31ABS3wvWyQZpR6Jevbl1kRl0Knkocmqj4ROZT
 9QHGL6g5Lj3IS1IKehO7sAFEuyHx2NS3HJp5SNVEV9wXRTMr8b76kBm6RmqalTfZ+QJJ
 uEh5ZyZKnUcz5jBxMJmyibj+nnYV1h1KTRtqE0WY/gKbjiDblrA6yBbaZOCoFmzg9hQx
 XIHHBcoQ3ZRAObT71vj+syLMOTJvJE2S/+/enPrWCGETXznfHto9cwAWDYV0f+vs0n7g
 44LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734039398; x=1734644198;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=IrqCs7YMF6CRcL8FZmtgSzX0pK8+d3Z/bKsneCeFTBk=;
 b=iVN9XqX0McqBHKL22XaVRz5h0Y6xMZEhK/EeNE7yv8uFs7eojbHhGwfaOoxW4LLnoP
 7nL/rbo4KNiwiAHOvKXxGNK0QArn7GrqIwA9wiDyKisNHlONEgluuFMSimgnd5xogBhZ
 S5gsRZJUFt9FGvR2hYyHf6eEUBYGIs86cs6OwzW+/mubjqTOTYIAjgveXUhBArOsHFy2
 oysmeQMSlMLSCDQltDAA1wS/bZsD+3y9A2wtBaseFwjpXoRHxH2pzsDbw+Knw0hEKjR/
 aWsPKo7Juow+GycngggCL0ZF25pF1v7nL0O5LG/aerIdbox5W8LckqzLzQSUXGJAVSQs
 +r4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWy6zl18Y11Cy+hbliRAPJuIt88qHaxKr777oL9cK5QS0FKveX0imhL7I9oyoofRhOYvsAFAz/IMek=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwOBKMsw4ylvgqJT96jgH8WUPEieR14tYeeXaGOf9NCbWofoFS7
 /5XREA3supy/7kfaVGRSfLioT2/H7TlzWnS9emqQSwgzlXFCUyGdH7aD3dmmu5U=
X-Gm-Gg: ASbGncv+vRozsDGy0BiXwECTPWy2gAIJ3pkDCuhu4Vf7IPyjdCPOGkhWRwMbD6EkXlB
 PR3T8CwklRckf55v1Ux1DKdc3WczdnMSyxftGPDcg/YfYlfHhrdzHBtuU+Li1+mvlipTgJTNshG
 1blX1So5TfedQFTkHM1a0Yy6fs3QAca0Pi2o4kqgtqir4DtJC7jn7QhQRfoFB6xLnCmhBHQLg/2
 8Nc5nqGMXWrciYBifB1jX2NeKqidlueH+yWI5kd9XJqfp3XNR3hzjekn0VpCEEyRjSzaMIdAW01
 +0i3dG+YS+pRDlQXczGAufzAwB1IQSyKgg==
X-Google-Smtp-Source: AGHT+IECUqq7Q7DBGVoL+Ae1+IU3B5T8MwH58zhnUQtU+qylUsnSU+xpVY+rpOswBvcmGDpakaht2g==
X-Received: by 2002:a05:6000:2ae:b0:386:1cd3:89fa with SMTP id
 ffacd0b85a97d-38880adb156mr144936f8f.33.1734039397929; 
 Thu, 12 Dec 2024 13:36:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b98a:c6fe:3a5d:f20a?
 ([2a01:e0a:982:cbb0:b98a:c6fe:3a5d:f20a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43625706c82sm27973335e9.35.2024.12.12.13.36.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 12 Dec 2024 13:36:36 -0800 (PST)
Message-ID: <76592f0b-85f4-4c84-b45b-859d55c4e87d@linaro.org>
Date: Thu, 12 Dec 2024 22:36:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 5/7] drm/msm: adreno: enable GMU bandwidth for A740 and
 A750
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
 <20241211-topic-sm8x50-gpu-bw-vote-v5-5-6112f9f785ec@linaro.org>
 <31264e68-2cdc-41b2-8d84-459dc257f0f5@oss.qualcomm.com>
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
In-Reply-To: <31264e68-2cdc-41b2-8d84-459dc257f0f5@oss.qualcomm.com>
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

On 12/12/2024 21:32, Konrad Dybcio wrote:
> On 11.12.2024 9:29 AM, Neil Armstrong wrote:
>> Now all the DDR bandwidth voting via the GPU Management Unit (GMU)
>> is in place, declare the Bus Control Modules (BCMs) and the
>> corresponding parameters in the GPU info struct.
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 0c560e84ad5a53bb4e8a49ba4e153ce9cf33f7ae..edffb7737a97b268bb2986d557969e651988a344 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1388,6 +1388,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>   			.pwrup_reglist = &a7xx_pwrup_reglist,
>>   			.gmu_chipid = 0x7020100,
>>   			.gmu_cgc_mode = 0x00020202,
>> +			.bcms = (const struct a6xx_bcm[]) {
>> +				{ .name = "SH0", .buswidth = 16 },
> 
> All a7xx targets use the same BCMs with the only difference being
> the ACV voting mask. You may want to make these non-anonymous structs.

it can be done in a second step

> 
>> +				{ .name = "MC0", .buswidth = 4 },
>> +				{
>> +					.name = "ACV",
>> +					.fixed = true,
>> +					.perfmode = BIT(3),
>> +					.perfmode_bw = 16500000,
> 
> I think perfmode is simply supposed to be set when bw == max_bw

Not for a750

> 
> Konrad

