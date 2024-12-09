Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 667469E9846
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 15:06:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 502C410E790;
	Mon,  9 Dec 2024 14:06:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YEf08H5K";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B068410E790
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 14:06:26 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-38632b8ae71so1755887f8f.0
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Dec 2024 06:06:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733753185; x=1734357985; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=//R8xUNwl611axD8q7sOD2Oi6OV6JAsc3ZQmBEFC26I=;
 b=YEf08H5KAuma6FqvqD9A8EvebJrh4FA/QF7nhZuoM/fepgj/8sKDmfoC6ogalMM6xi
 s33hE6wfMXZ5jpL8p2Uun0brfrvasRSqCKAkAzB4U/xWI02ZKDWapDMfrFBpHWs/jaZ7
 mBH470K6lWnHQkSUI7cnTphSETC78zkUEbzW2nOJM2WBztB8BV+cAUAD1GM7MTjgPmvA
 U/rJQNyJaE9wtIDQL/oIEiEVZlBpYW4aYfbTq84oC/fgK+K3MgfJeuFoaigsL+1+nJMh
 fpXp7/lTcvcktE7oJw0tBGqohn7UGWXm1Icg41ahY8hxo3O+aln128VRwvokgQQfs+Qx
 b7bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733753185; x=1734357985;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=//R8xUNwl611axD8q7sOD2Oi6OV6JAsc3ZQmBEFC26I=;
 b=QayPa5+pP11YTVE6lgYem2F5cfTtVNsw2/QMzYbwdBEWodr33w5SYvT7a7tw/cNI47
 1janB1/eEwWn6bOZTvkNVDUDeoTxp3Qo7xE7NathuYpP0e0LImKk9nNvuZJAfvESCGKt
 V46ury3qOoO63s8WmVkyYdJu8gQSfLUkO721cy9sdCJnf+4rjrLySL55oTkULr9l7Qjf
 QmebtC1EPIKZeiAi5JR6c2welGCs1hsYEHS6Lw3A0wKcWdHXHleSSXQkQYrmxvhyiO6c
 ibxDvV2dhxY61RAsCDHNHFX+sly50B6s/t8+0kMdBC1cZYTKyWz/hr4L7xm/exfRO4qN
 lBFQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVPh56Ppn0S7pBn9IGje8/9+8OlkiFpl+ETCZHLLgEUA2IN7oO/5ctFymuEn5EXIeeH1x0tu0gYK80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6pEn7lpUXGh5Z3E2C63yb2fEKSIe6gO7kGISK7IGjDlH0vNP2
 LW78qddi33Dea1MgpFtaSyoqT0+KMQ2fKVNZb+EBEdh+kMTjAKygSGLxsSiGEF8=
X-Gm-Gg: ASbGncvS4Nyk1k24lmMLKh4jQcp0h7R8k3X3yyroL4YpUPoxme+pZHJhQzbtVjsAsGo
 jc/BBiJKiTfYXj0xaOzbygGiEdzvqcHYgX5eBJ/m/wAGX1iVd5C3s4YQZhC4Ac7mM6QmAGwrSuE
 h3fct785IwU7B7ut3H+VKaYd6dX17xiKswH2Wed7GkCEXeHsfnJkL/GBFgMTdzUZp/TUqQkY8V7
 D1q7Mg/xxjKfi0rlKkbbJp3ZXoAqZi77KnfF6mAaWcon4OxI5B7CH9om7FzKskcO2ti7PfNpvsL
 rX9EwKqA9MWKKlTHKJNRc3MeQPQ=
X-Google-Smtp-Source: AGHT+IGuc3kl0BPq1T0cBMQtdVQ6O1SOWF+l7YeZdVn0jR38h6Ps6U9v6wBjWn9jE3WgTd6CBA9q0Q==
X-Received: by 2002:a05:6000:2d81:b0:385:df73:2f18 with SMTP id
 ffacd0b85a97d-386453fff14mr278848f8f.51.1733753184744; 
 Mon, 09 Dec 2024 06:06:24 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:7546:6147:f006:709b?
 ([2a01:e0a:982:cbb0:7546:6147:f006:709b])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434faba810csm28873865e9.18.2024.12.09.06.06.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Dec 2024 06:06:24 -0800 (PST)
Message-ID: <d2ce1009-15ba-44bc-9dbb-4d606fb25739@linaro.org>
Date: Mon, 9 Dec 2024 15:06:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 6/7] arm64: qcom: dts: sm8550: add interconnect and
 opp-peak-kBps for GPU
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
References: <20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org>
 <20241205-topic-sm8x50-gpu-bw-vote-v4-6-9650d15dd435@linaro.org>
 <e56cd9bf-8fa7-44b0-b00f-45cedb73e194@quicinc.com>
 <1af37251-3cdf-47da-8228-2cd5622e1770@quicinc.com>
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
In-Reply-To: <1af37251-3cdf-47da-8228-2cd5622e1770@quicinc.com>
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

On 09/12/2024 14:10, Akhil P Oommen wrote:
> On 12/9/2024 6:32 PM, Akhil P Oommen wrote:
>> On 12/5/2024 8:31 PM, Neil Armstrong wrote:
>>> Each GPU OPP requires a specific peak DDR bandwidth, let's add
>>> those to each OPP and also the related interconnect path.
>>>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>
>> I haven't checked each bw value, still
>>
>> Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
>>
>> -Akhil
>>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 13 +++++++++++++
>>>   1 file changed, 13 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>>> index e7774d32fb6d2288748ecec00bf525b2b3c40fbb..955f58b2cb4e4ca3fd33f1555e36a15cfc82d642 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>>> @@ -14,6 +14,7 @@
>>>   #include <dt-bindings/firmware/qcom,scm.h>
>>>   #include <dt-bindings/gpio/gpio.h>
>>>   #include <dt-bindings/interrupt-controller/arm-gic.h>
>>> +#include <dt-bindings/interconnect/qcom,icc.h>
>>>   #include <dt-bindings/interconnect/qcom,sm8550-rpmh.h>
>>>   #include <dt-bindings/mailbox/qcom-ipcc.h>
>>>   #include <dt-bindings/power/qcom-rpmpd.h>
>>> @@ -2114,6 +2115,10 @@ gpu: gpu@3d00000 {
>>>   			qcom,gmu = <&gmu>;
>>>   			#cooling-cells = <2>;
>>>   
>>> +			interconnects = <&gem_noc MASTER_GFX3D QCOM_ICC_TAG_ALWAYS
>>> +					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
>>> +			interconnect-names = "gfx-mem";
>>> +
>>>   			status = "disabled";
>>>   
>>>   			zap-shader {
>>> @@ -2127,41 +2132,49 @@ gpu_opp_table: opp-table {
>>>   				opp-680000000 {
>>>   					opp-hz = /bits/ 64 <680000000>;
>>>   					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>>> +					opp-peak-kBps = <16500000>;
>>>   				};
>>>   
>>>   				opp-615000000 {
>>>   					opp-hz = /bits/ 64 <615000000>;
>>>   					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
>>> +					opp-peak-kBps = <16500000>;
> 
> Seems like you are using value from "qcom,bus-max" node for each opp in
> downstream devicetree. Except for the highest OPP, we should use the
> value from "qcom,bus-freq" node. That is supposed to give the best perf
> per watt.

Ack, I'll switch to the qcom,bus-freq value,

Thanks,
Neil
> 
> -Akhil.
> 
>>>   				};
>>>   
>>>   				opp-550000000 {
>>>   					opp-hz = /bits/ 64 <550000000>;
>>>   					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
>>> +					opp-peak-kBps = <12449218>;
>>>   				};
>>>   
>>>   				opp-475000000 {
>>>   					opp-hz = /bits/ 64 <475000000>;
>>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
>>> +					opp-peak-kBps = <8171875>;
>>>   				};
>>>   
>>>   				opp-401000000 {
>>>   					opp-hz = /bits/ 64 <401000000>;
>>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
>>> +					opp-peak-kBps = <6671875>;
>>>   				};
>>>   
>>>   				opp-348000000 {
>>>   					opp-hz = /bits/ 64 <348000000>;
>>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
>>> +					opp-peak-kBps = <6074218>;
>>>   				};
>>>   
>>>   				opp-295000000 {
>>>   					opp-hz = /bits/ 64 <295000000>;
>>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
>>> +					opp-peak-kBps = <6074218>;
>>>   				};
>>>   
>>>   				opp-220000000 {
>>>   					opp-hz = /bits/ 64 <220000000>;
>>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
>>> +					opp-peak-kBps = <6074218>;
>>>   				};
>>>   			};
>>>   		};
>>>
>>
> 

