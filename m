Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A8E85647C
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 14:33:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83B1410E8AE;
	Thu, 15 Feb 2024 13:33:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="d50RpLaG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15E0410E825
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 13:33:11 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a3da985edfbso44198866b.3
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 05:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708003989; x=1708608789; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=z8FccHgP1nlIIDxh3beS9dJmKPci7aq2sL05JU739TA=;
 b=d50RpLaGwq0F662xpOm3Vy00kPGI7VTDnbAh5ZpI+iHjVX/KABBLHbRgZ2uh3yK8RT
 qwwlORBgWrohenBHOu5C+V+TYN7fJqJ5gUfAdJQQSlQMyJUmUpXU6NUmCv77khuv/o/m
 NKveSCNZ0D2UVTC9jox4HmUzB7W6LGNtNNZCrKlahhVko9IaqqGTUq9Cw++hBZIuOToa
 WLy6aIvgiG7IRQPuX8bo01rLWZjQre8bQGEARj66FzOfkJMZkytqX4v5cEhvpE/96RkG
 r1fXm5CTGdoc+nQL/b57+OmL7JgoMDX4tZ8koewR+vA7bgAvXhPSYrVArx+fGUaxJ3gl
 97MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708003989; x=1708608789;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=z8FccHgP1nlIIDxh3beS9dJmKPci7aq2sL05JU739TA=;
 b=j/mQ64IG2A7Pm6DEu3UikDTXG4R52Oi1yoCQjW4EAa2UP2O+007L9QOw4VxrS8AS3c
 wdXuRb5LZjiQ1qdl9aJ5p9I7TLg0gfrp6hxpbEoK0+hVDSrvmFqKMISQdXmZioj1Oz5R
 ksO5igFj6ZL2kZuPnLUBYPCyE/1VB5piPSyJ754FOQ7nFqu05BAbmFKKC15ZTVqpPObx
 +DJTq9MAsf1/NvZzukmZzuGz7p9sktk2uYBGwmqwZzfwVQMRQ1Uw6P96rIccxJt58DKr
 Sv+iyWA3ScvlbOJzskxR29AeQfuZzeRrDPkDMPJZkKknKT/yrgq6nviwAzNk4QTtOd+z
 B0NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnk/ow5Y76CIoYhNl72DGfQQRwDoKqYb3F78AGyQcD5n2oQeQj64n2jSzw/+xHoSGQUsc22ZcGAgIUrgjTALkOvyvrwz9ZUPLzE2O/TwT+
X-Gm-Message-State: AOJu0YyZElEC+nTSi1lc7YzgUDL4L9YzUZPJREijTrOQssWDXSpGvVmz
 03j9NVRY2yGwmLZadSezM4izOByhSs2HIVgqQ99RyaZoGR9N1v3vuU/k0gUabyk=
X-Google-Smtp-Source: AGHT+IGXQY2xgSKFPhczZZiTjQ6N1O0RfsfU58vW/70tHk+S+ZXTkDOKRyUr+Bk5Kzb8qmDDxFFdTA==
X-Received: by 2002:a17:906:1c8d:b0:a3d:16dd:307c with SMTP id
 g13-20020a1709061c8d00b00a3d16dd307cmr1498463ejh.5.1708003989366; 
 Thu, 15 Feb 2024 05:33:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:7555:8187:c6f1:9c02?
 ([2a01:e0a:982:cbb0:7555:8187:c6f1:9c02])
 by smtp.gmail.com with ESMTPSA id
 oq25-20020a170906cc9900b00a3cd41b3c19sm541532ejb.199.2024.02.15.05.33.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Feb 2024 05:33:08 -0800 (PST)
Message-ID: <2df69499-4ffa-46a9-8e7f-041e87ad3034@linaro.org>
Date: Thu, 15 Feb 2024 14:33:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v2 2/6] dt-bindings: arm-smmu: Document SM8650 GPU SMMU
Content-Language: en-US, fr
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar
 <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
References: <20240215-topic-sm8650-gpu-v2-0-6be0b4bf2e09@linaro.org>
 <20240215-topic-sm8650-gpu-v2-2-6be0b4bf2e09@linaro.org>
 <CAA8EJprpYEhGi5b+uWGWtOa+qbSwUR8C0j9NLC+ah_-nvy-=Ng@mail.gmail.com>
 <ffb16ef6-fc9a-42b1-b9c3-4e8f6b52d849@linaro.org>
 <CAA8EJpobWYu8LoHZarOw82z78=kLJrKH0P4ncK6sX7zE1nHuqQ@mail.gmail.com>
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
Organization: Linaro Developer Services
In-Reply-To: <CAA8EJpobWYu8LoHZarOw82z78=kLJrKH0P4ncK6sX7zE1nHuqQ@mail.gmail.com>
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

On 15/02/2024 10:32, Dmitry Baryshkov wrote:
> On Thu, 15 Feb 2024 at 11:29, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>
>> On 15/02/2024 10:25, Dmitry Baryshkov wrote:
>>> On Thu, 15 Feb 2024 at 11:20, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>>>
>>>> Document the GPU SMMU found on the SM8650 platform.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>    Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 7 +++++--
>>>>    1 file changed, 5 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>>> index a4042ae24770..3ad5c850f3bf 100644
>>>> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>>> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>>>> @@ -93,6 +93,7 @@ properties:
>>>>                  - qcom,sm8350-smmu-500
>>>>                  - qcom,sm8450-smmu-500
>>>>                  - qcom,sm8550-smmu-500
>>>> +              - qcom,sm8650-smmu-500
>>>>              - const: qcom,adreno-smmu
>>>>              - const: qcom,smmu-500
>>>>              - const: arm,mmu-500
>>>> @@ -508,7 +509,10 @@ allOf:
>>>>      - if:
>>>>          properties:
>>>>            compatible:
>>>> -          const: qcom,sm8550-smmu-500
>>>> +          contains:
>>>> +            enum:
>>>> +              - qcom,sm8550-smmu-500
>>>> +              - qcom,sm8650-smmu-500
>>>
>>> Doesn't this cause warnings for non-GPU SMMU on this platform?
>>
>> No because it doesn't add those to required, it simply allows clock the properties.
> 
> Can we further constrain this branch so that it is applicable only to
> the Adreno SMMUs (and enforce requirement)? And maybe constrain the
> second if-branch so that it doesn't apply to the Adreno SMMUs?

Indeed, it's done like that for the a6 gpu, I'll send a fix for that

Neil

> 
>>
>>>
>>>>        then:
>>>>          properties:
>>>>            clock-names:
>>>> @@ -544,7 +548,6 @@ allOf:
>>>>                  - qcom,sdx65-smmu-500
>>>>                  - qcom,sm6350-smmu-500
>>>>                  - qcom,sm6375-smmu-500
>>>> -              - qcom,sm8650-smmu-500
>>>>                  - qcom,x1e80100-smmu-500
>>>>        then:
>>>>          properties:
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>
>>>
>>
> 
> 

