Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F31219DB96F
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 15:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2C3F10E447;
	Thu, 28 Nov 2024 14:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jewZR+nw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9FD310E447
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 14:16:45 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-434a8b94fb5so5577395e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2024 06:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732803404; x=1733408204; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=xzG0XNOQZF4a2W5O+NcAalaLtDSp8F8libK88vzeBpI=;
 b=jewZR+nw5Lo1bTC97r2QwUJEsYtvviE5u4PjeBmZmeCS8EQfQ/a5Ty3SiNC4cToeL3
 xue27H0Ks8/ekw5Ur0+G2v1jx2WoP8bBsx7TdYpmKfE/p3KyrRVLm5zqAYJSYgc507yl
 bQsCIHD6DMTka9imjJxCIEh3nHpfzpq8eqqgADVPujGTrWHnjCbBMWGA0WiRDbSqVRmt
 TUZita9srX/WX0KVVqUXAG5jF0HsTOVf+cDHZpFTTJBhBoQeo91zZ+0eFzVZfSSg1iyE
 rJFuJOaAP/0R9xxNp/OfQ+DPcPyJtd0LaWSraz9dPCjfzqsAtRd3fGosF7tOR36L7uz9
 k69w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732803404; x=1733408204;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xzG0XNOQZF4a2W5O+NcAalaLtDSp8F8libK88vzeBpI=;
 b=tdGiNVb6JS6Bn4dqpJsZRhKZxZRcEPzMW1hUIGcKkdOWfXdrn8CORWCKy5oSx/VJmB
 5Q1ZNBXESlNBR7WQABEeAgtQNg3BPoKGsmC0vn9akD0CFsPIbBWBye8kKW7cNqStuWEo
 jeolXcaYcAMTZ0y+z6rpU6FkABL7hJH23jRjT3zii7iUFCQT+foWMjYVjACEMSN2VR4F
 5pWo+VjGg/EPTOncM01ERf2wey0IPydjEPVQ0kJvvbJJzXyIZllZXduu8ip40H5mG856
 7OgtIV3nnowQr3X5yYX4K/7p64X3qLItNkxsz9TXvMxsnLXdOHzvOHFKWCQGWAi40Vul
 ljFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbjVWFs0ikYklwtzretgXCiz2Yn6Vtw67y8WDiHiwUB2flwhiZztNfQnuHtpVBLA+IGDIwQtUKmBw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeWXxoSw4MZy8L3gze91DYiufyUAwDL3weIkMyHMCso9+SUoeh
 g1QCclP0jsHG2xRvM/fT92T8C5KIQAeXYsxhlHuMy/ViUlWJMBBGnOqCMblwvEY=
X-Gm-Gg: ASbGncvnNoAw5X1m2Byn6K+jYZEBUXDu02CGO0R9qAdKlz8AzQvLYe5jqH0+8Lir/Pr
 n5ObQbE0SAPzud6QXD1drExd5Cpq93hsWAiBXWF+qGbe/1NFlgcKSobrXpeUPmr2ucR9y+3vozM
 q6xzN6CP/dcUC2PdgGDJLzcfR4mIGZHC1VDZQjVvQw5E47r3aRs/kTT+PjAMKGXMyoN7nX7p4m8
 Fa98v9gxsOGdrggIv95N2hhQhIARDjiJu9y6Ph75KJGmZmeFwHm1t37g1b26lpXE2rRJIXLjt0i
 g/AR0Vtg/aCLKjoU5kXdNn9P
X-Google-Smtp-Source: AGHT+IH9gpTDzzH0YVMfrX0ygKVTmF2nSE1+q9nvp2q6noStYv2AG3BDf1Oub/zJThviNJP8vK6UUw==
X-Received: by 2002:a05:600c:6c8a:b0:434:8e8a:d4ec with SMTP id
 5b1f17b1804b1-434afc3b6e1mr30503355e9.13.1732803404015; 
 Thu, 28 Nov 2024 06:16:44 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:42d0:cacb:48b:722a?
 ([2a01:e0a:982:cbb0:42d0:cacb:48b:722a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa7e4d42sm54447225e9.37.2024.11.28.06.16.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Nov 2024 06:16:43 -0800 (PST)
Message-ID: <c2d74a3e-5aaa-4568-aa28-189b7d1b48b0@linaro.org>
Date: Thu, 28 Nov 2024 15:16:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 6/7] arm64: qcom: dts: sm8550: add interconnect and
 opp-peak-kBps for GPU
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org>
 <20241128-topic-sm8x50-gpu-bw-vote-v3-6-81d60c10fb73@linaro.org>
 <7ylrgy44dlitavefgwaobve7runpy6eqyhufmtkxmwnqkj2g25@pfdjlf5aj4j6>
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
In-Reply-To: <7ylrgy44dlitavefgwaobve7runpy6eqyhufmtkxmwnqkj2g25@pfdjlf5aj4j6>
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

On 28/11/2024 14:26, Dmitry Baryshkov wrote:
> On Thu, Nov 28, 2024 at 11:25:46AM +0100, Neil Armstrong wrote:
>> Each GPU OPP requires a specific peak DDR bandwidth, let's add
>> those to each OPP and also the related interconnect path.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index e7774d32fb6d2288748ecec00bf525b2b3c40fbb..545eb52174c704bbefa69189fad9fbff053d8569 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -2114,6 +2114,9 @@ gpu: gpu@3d00000 {
>>   			qcom,gmu = <&gmu>;
>>   			#cooling-cells = <2>;
>>   
>> +			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;
> 
> QCOM_ICC_TAG_ALWAYS

Damn, thanks forgot those one.

Thanks,
Neil

> 
> LGTM otherwise.
> 
>> +			interconnect-names = "gfx-mem";
>> +
>>   			status = "disabled";
>>   
>>   			zap-shader {
>> @@ -2127,41 +2130,49 @@ gpu_opp_table: opp-table {
>>   				opp-680000000 {
>>   					opp-hz = /bits/ 64 <680000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
>> +					opp-peak-kBps = <16500000>;
>>   				};
>>   
>>   				opp-615000000 {
>>   					opp-hz = /bits/ 64 <615000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
>> +					opp-peak-kBps = <16500000>;
>>   				};
>>   
>>   				opp-550000000 {
>>   					opp-hz = /bits/ 64 <550000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
>> +					opp-peak-kBps = <12449218>;
>>   				};
>>   
>>   				opp-475000000 {
>>   					opp-hz = /bits/ 64 <475000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
>> +					opp-peak-kBps = <8171875>;
>>   				};
>>   
>>   				opp-401000000 {
>>   					opp-hz = /bits/ 64 <401000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
>> +					opp-peak-kBps = <6671875>;
>>   				};
>>   
>>   				opp-348000000 {
>>   					opp-hz = /bits/ 64 <348000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
>> +					opp-peak-kBps = <6074218>;
>>   				};
>>   
>>   				opp-295000000 {
>>   					opp-hz = /bits/ 64 <295000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
>> +					opp-peak-kBps = <6074218>;
>>   				};
>>   
>>   				opp-220000000 {
>>   					opp-hz = /bits/ 64 <220000000>;
>>   					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
>> +					opp-peak-kBps = <6074218>;
>>   				};
>>   			};
>>   		};
>>
>> -- 
>> 2.34.1
>>
> 

