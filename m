Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34342A306A0
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 10:07:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F203310E455;
	Tue, 11 Feb 2025 09:07:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HRqD/aRM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04B5D10E45A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 09:07:11 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-438a39e659cso36250275e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 01:07:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739264829; x=1739869629; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=fEkw8mZ9lpxD+Y89tTOOotL+Ya0/so0WoVdJiViSyms=;
 b=HRqD/aRMWSzDASfkFztudf7QBjrRj7dO2Jag1+pJJKiVVMSWtVdSyZVyjpJrs+VnDZ
 Cl1Pf0lyH+cxxwt9mqlMPTbGufdMDHcWz2TH9nDwyFIOrYRB3E1KNZdyw0TJme1vHdWo
 80E/oRFhYLIwx25ej6NS3AyfSJ6WdhI6ZUxRuQ7jWq/bDhtPuwPpMo07/udqpplU9wwq
 aXllY4VVZoPTRBGmmKakcigv1SWoAlo4+SAraJGPoHo85F17IyderZRfd93HqzTYsWnD
 7McjTi8rgwT63UacGzHmvtz2InRxshr4yFYs4ZXfw0c10vxSKcDG6yVqteOQ0NUJzWxP
 H7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739264829; x=1739869629;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=fEkw8mZ9lpxD+Y89tTOOotL+Ya0/so0WoVdJiViSyms=;
 b=lVDOolNVOu6OUHr35O7cEKZsc5t67M8BFfcfd2BvipRdOrRMcZIurSHCLI2sLgFXVa
 gfU8u9RFazvstoqppFO2HubJtJ9io8rPjnj82HpHnBpbCoD9RQ2ws12qSzcPXlTejqJx
 /9gwdhVf/NMnWSJnePZtJZ/SzkBR+mugZDIQw6VWge43ghtZrnoG9f/6Be4ZfAgP8u5w
 UTYTgsXLQHcCTUM0OEOiKuYPShSNLv5CwjzDX1sp7E2WNfMP4IU0Tw30xIuClv8vhZRO
 tJV6WOfgk/1zuucl8RL+2OXJBbcVIcqUfZQom8fEm5Rh9UPs7qJ4Qs//pDKXF4ZfrbwO
 ZnZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXu/3BwW+bEEBqYTZE//Or0AjblnGd4ER2F8AODbXrnzLn+Ge6qHiHMt5i1lBnHPFmXT+/Xq2aJUyI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8R2/Rj8xHRU+PhkzMJJ6dTBbqpc7SCtQecKy0tzs0hnXAGZys
 jG2uWDbLgDP9g4p+anPu6G1ddhQNGavH6bZIjSftAVN6vZZPFqvYOHabD1IAudw=
X-Gm-Gg: ASbGncve4oJ4dm2Gx+4XcA2f1LPb0Ht1JrWIzp8oxa9L2R+sPfpcfq4J6g/JaYaLTX0
 A4mopCmT66zxxW6Q9Hg5d1VzfBJdCFpCk4SvTlc9olL/45RhvhUdVzX1JK5KtNz2zu2PtSKAZTm
 iFRWthwPL8erUa041x1HcgajG1ewNqVxpuKN/a70hySCV0eMFOhmd/5qy5Le2jlG00ARdDiJvZZ
 WA2HG/O3eKQSrInrkY/MMGFjLCGifk4Qpj3gOTfvxd0c3vN12MnIxY8dn77hJLggEvqxKYjkG0y
 0VgepmoL+LauiL5IXR4gS20mmTcJbBn2mtCt8ziI1GzkI79jkOp+cO2LKm6nlSHbsGOm
X-Google-Smtp-Source: AGHT+IGHVpSlPQyU0cjYdq4UHMFuNEQDdRE6G+6jYmgVYfWj+t1f7CCzyuHhzxKg1Gx+7it/eNAXag==
X-Received: by 2002:a05:600c:1e11:b0:436:5fc9:309d with SMTP id
 5b1f17b1804b1-439249b2bafmr161317725e9.30.1739264829255; 
 Tue, 11 Feb 2025 01:07:09 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:5b96:57e9:d7dc:bc01?
 ([2a01:e0a:982:cbb0:5b96:57e9:d7dc:bc01])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38dce18d6f9sm10698324f8f.29.2025.02.11.01.07.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Feb 2025 01:07:08 -0800 (PST)
Message-ID: <fcde9fab-b28a-4e09-b77b-f7c6c3840710@linaro.org>
Date: Tue, 11 Feb 2025 10:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 3/4] arm64: dts: qcom: sm8550: add missing cpu-cfg
 interconnect path in the mdss node
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-0-54c96a9d2b7f@linaro.org>
 <20250210-topic-sm8x50-mdss-interconnect-bindings-fix-v3-3-54c96a9d2b7f@linaro.org>
 <a3f7bef6-bfc8-4a2e-b979-4aac7908306f@oss.qualcomm.com>
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
In-Reply-To: <a3f7bef6-bfc8-4a2e-b979-4aac7908306f@oss.qualcomm.com>
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

On 10/02/2025 17:32, Konrad Dybcio wrote:
> On 10.02.2025 10:32 AM, Neil Armstrong wrote:
>> The bindings requires the mdp0-mem and the cpu-cfg interconnect path,
>> add the missing cpu-cfg path to fix the dtbs check error.
>>
>> Fixes: b8591df49cde ("arm64: dts: qcom: sm8550: correct MDSS interconnects")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8550.dtsi | 5 +++--
>>   1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> index eac8de4005d82f246bc50f64f09515631d895c99..702b55296b18ff2f8ea62a3391b7de2804aa9f65 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
>> @@ -3020,8 +3020,9 @@ mdss: display-subsystem@ae00000 {
>>   
>>   			power-domains = <&dispcc MDSS_GDSC>;
>>   
>> -			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>;
>> -			interconnect-names = "mdp0-mem";
>> +			interconnects = <&mmss_noc MASTER_MDP 0 &mc_virt SLAVE_EBI1 0>,
> 
> QCOM_ICC_TAG_ALWAYS
> 
>> +					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_DISPLAY_CFG 0>;
> 
> QCOM_ICC_TAG_ACTIVE_ONLY
> 
> w that

So it depends how it articulates with https://lore.kernel.org/all/20250115-topic-sm8x50-upstream-dt-icc-update-v1-0-eaa8b10e2af7@linaro.org/

I can rebase on top of it, it would be simpler, but then the Fixes tag won't work anymore.

> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

