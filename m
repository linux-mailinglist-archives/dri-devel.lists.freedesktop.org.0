Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E70E9D7CB8
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 09:16:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88B4910E5D9;
	Mon, 25 Nov 2024 08:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Ih+Faeqm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE46C10E5DE
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 08:16:49 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4316f3d3c21so36261745e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 00:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732522608; x=1733127408; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=D9tDhyHhmMtVAvULrIAhFRVk5xrXZSSMlYMbhL2ls4g=;
 b=Ih+Faeqm+FS8JSwX6tir39bAoHCKQH3TT/tdmjRhM7lvClTeIOF+CBlrUomjx+yWSf
 TrX3Rqpc086/t7hzuGl0pmNaw22JoM1se/sRzjMaUXQv9Dx9ATWECVtX2ufgx0DNGOvu
 F4EghDwO4mY/G9S6t3JM2LI673U+2T9ifFYqj0KkZKz7z1fYPH+BYS/WB0UDzbh2+2VT
 xrBHZCczA0snnvurGqtOO3KoJOuslm98jj/z5gNB6J7Cm+bFhE6sHy3bxn+WsHafzI2a
 tbGSzeKFSfDqhX6BTsvm+Lf3MjqkPVfEAJsd3ckckyhaHbjjdZ1akgm/t3maEfpPvZC8
 vVYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732522608; x=1733127408;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=D9tDhyHhmMtVAvULrIAhFRVk5xrXZSSMlYMbhL2ls4g=;
 b=s0bxctOnkl90/IIJh/dg8s0BoZ7RB3RkNaAbH9WWk2IgooJdMvNX+Nlx7gyf7Q5/nn
 +8RALYMfl6jcRrC+xwWEdLs4Ref7UTdOvHquENd+NT1AF+bheB/F0A8fqiy3lLwRWpeN
 xB2xBY+wc60DhspZRXT25W6axjhlUauStbcOeGdOs/BtQSLhRDwUOdCWfMmVSUDPS/m+
 iQoODcx+tQf0mHMJo7SyV6DPuzD7/jxLa2gvGicC32UzZGCrJEncgTiwSguZ3SsL3Ze7
 HwcIEa4uoildH9AmUv3ff/Z941g7+D8guQVU4khYNdVIWAbL3Yab+F0MxGk4MVbzfTXO
 LiPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBLxP4BbQv+sGmspfC/CNQEloUgSQkaSlLzuKBYtORQhPCYePic3ngwKjInR/ZXvaOPnZqOJzvyGQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6S4sOGik1wrFPJciWBtPqD5TA4ZmZrw9SGTOVTZqcU67hOmSt
 vn5PiVPsLdxbtcm1yywD/SMaWy7tfclJm7EFShrDCRdVNY/Yt79NVCxVSXC/1Do=
X-Gm-Gg: ASbGnctWJPNeVNbXaYJQYJmdWDblkr1MPG62IdS26O0r1NhFZzQU6h9LDJ/QDomzuaJ
 Ev8Af27gjrgvlaC/9L0GZtHt+EmY/2NfNZ72Sl7slGpnLwnDMe7D7tP4/6gcB1lOfVbBbyo2VLX
 ZwPLfQMy/4N4BDcZH6DT9//Uh14hgDzIzZ+6q4sZ3HGc8GejC805sESa3iiJ0r/1pL1JPrkp2wC
 bCEws26hfxefNEDhDO0dKS4unQeNBrvWcJP6lW6A7FPycB0oFiwB3n8/iUxfbZVXqwFb7BoEKEI
 kMWM/yaS+fPj7yFaY9fWy6YIkIw=
X-Google-Smtp-Source: AGHT+IEHqbnxQqxNnabskvp/0vuLynuKH8d+VUfNVbcCpoeFlsv4NGAWYmcyUTS6ZjyH1Zls0XDyDQ==
X-Received: by 2002:a05:600c:4690:b0:431:2b66:44f7 with SMTP id
 5b1f17b1804b1-433ce4d4c6emr114888875e9.31.1732522607986; 
 Mon, 25 Nov 2024 00:16:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b?
 ([2a01:e0a:982:cbb0:9dc0:6c46:415c:5f8b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-433b463ab6csm187362095e9.35.2024.11.25.00.16.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Nov 2024 00:16:47 -0800 (PST)
Message-ID: <a936a9fc-6632-4f44-94d1-db304218b5a5@linaro.org>
Date: Mon, 25 Nov 2024 09:16:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 04/11] drm/msm: adreno: add GMU_BW_VOTE feature flag
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Connor Abbott <cwabbott0@gmail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
 <20241119-topic-sm8x50-gpu-bw-vote-v2-4-4deb87be2498@linaro.org>
 <20241123194316.yqvovktcptfep4dr@hu-akhilpo-hyd.qualcomm.com>
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
In-Reply-To: <20241123194316.yqvovktcptfep4dr@hu-akhilpo-hyd.qualcomm.com>
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

On 23/11/2024 20:43, Akhil P Oommen wrote:
> On Tue, Nov 19, 2024 at 06:56:39PM +0100, Neil Armstrong wrote:
>> The Adreno GMU Management Unit (GNU) can also scale the DDR Bandwidth
>> along the Frequency and Power Domain level, but by default we leave the
>> OPP core vote for the interconnect ddr path.
>>
>> While scaling via the interconnect path was sufficient, newer GPUs
>> like the A750 requires specific vote paremeters and bandwidth to
>> achieve full functionality.
>>
>> While the feature will require some data in a6xx_info, it's safer
>> to only enable tested platforms with this flag first.
>>
>> Add a new feature enabling DDR Bandwidth vote via GMU.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/adreno_gpu.h | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> index 4702d4cfca3b58fb3cbb25cb6805f1c19be2ebcb..394b96eb6c83354ae008b15b562bedb96cd391dd 100644
>> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
>> @@ -58,6 +58,7 @@ enum adreno_family {
>>   #define ADRENO_FEAT_HAS_HW_APRIV		BIT(0)
>>   #define ADRENO_FEAT_HAS_CACHED_COHERENT		BIT(1)
>>   #define ADRENO_FEAT_PREEMPTION			BIT(2)
>> +#define ADRENO_FEAT_GMU_BW_VOTE			BIT(3)
> 
> Do we really need a feature flag for this? We have to carry this for every
> GPU going forward. IB voting is supported on all GMUs from A6xx GEN2 and
> newer. So we can just check that along with whether the bw table is
> dynamically generated or not.

It depends on the bw table _and_ the a6xx_info.gmu table, I don't want to
check both in all parts on the driver.

Neil

> 
> -Akhil
> 
>>   
>>   /* Helper for formating the chip_id in the way that userspace tools like
>>    * crashdec expect.
>>
>> -- 
>> 2.34.1
>>

