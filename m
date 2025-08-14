Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCE7B2692B
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 16:26:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9781F10E05A;
	Thu, 14 Aug 2025 14:26:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NOHcGZ7w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE6310E2D4
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 14:26:03 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-45a1b0c8867so7545095e9.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 07:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755181562; x=1755786362; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=cUV3fUJR8K/LNtQMHHFa+NVRtvkhhAA1yMnYl/5MEqg=;
 b=NOHcGZ7wv8N41L+auR8Wdt7Dmp/vHkBCaIMKPDkUVqoERymanE7Tnql43L3hk1HgE9
 E9K+KnQ4p9/cKS0mvj1ntFHaXqZ4C6ZsnzpXtRb1gSvZKm8D6S7cBtWreWhWdGMWvP6I
 MBjwAtEPCtErYQSUoj9VtLus3O4bnqcKc9F9+9wchWR+HIbEfaLflyO7m+uYfG2o8s5O
 tCulr09xL4GuXZBTyyVEH1o4y+h/MDwYAbhg6Xde7foWZXMuH77603dtUG8EEV0DsFMY
 atnMl3msbHKre9WsME3EVQAh4QH2tzRpErYCUWd/buect+m5OrtigzUomcYF5B9iUqPl
 46eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755181562; x=1755786362;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=cUV3fUJR8K/LNtQMHHFa+NVRtvkhhAA1yMnYl/5MEqg=;
 b=NvrSpSCaTB4EFycTih+g7xG4FAnjTn0Z8Yhy+hHoL/EPXbYflA0/y940qbfAvq2FSb
 Wl416YYbbtYlstM2WTnzj137uKeCZI0AmiVwCx4DYVQNngroGlQkvYMbsJgUv0wkRrm4
 h1CH15A1m3Xgy+Gy83alH3sPCTOGWQIv/o/JRyJH272Fn20mGR19JoLPeVBLqtl01R/h
 /SLR1fjjV+caMty1SG/zyWdJ9EFWd61F6WU5Z8eKNr9X5XVgNHBprN75pBAgXFBWVUDe
 XWPblw7BihFUwf3SQZZmZAUpvjMpfhZDU2g6Z8gH2wU5eG8irxLCjohwaXxGYo4Q0Yon
 WuYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTPFUn2sMViBQhMcRB+NrovtN1J4lnNvcbiS1YChYB3sk/ut1efrtT9qMRV2t5UMy3uPKfKhFNejw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymwBi3uF5+QrJvYsrPak82Mr50r/L7cO8CLBfq5aq60dXvF+ez
 R+w5Pu9YNRvlHwJZ+rZSNMOgZH8y4SQSbeWmBarvKgkJtjJV853VheH5Eex4rQ6FX74=
X-Gm-Gg: ASbGncucxhLJmW7HVxjT6ryyqcGHfMJPyFqnaBKz9nPEu4Kq/zG11mfarfJK2wW/Lwh
 LSTIoMufFcJry3bfdZ4tPYsEMczIT+u0NBNp+VkmikxRtm8uv58Pa3DivxGKkxkiN6rgKxOcyfv
 5mCvLbAIAMSyjG+qofxH+ZfG20xVbo9dkZVRohMEHMrRjziOQufB3fwcj9hZ0Eg756De762BZTV
 yinbNMbxaLkn5CfIpufech1qFg8TNMg8hE7pFETmaQ6gv5jNDFe/GV8Je60+hZuaW7GmaLihyGQ
 uUX6Cb6tqH6OiTb8FTbvdvx9bphigXBmUSBuHs/Bv0H2mQPw8neFu0JdTE2UDEmaLzBNwOyT5CB
 QnfanTu+ULwGb2AhiSA0r5fLyHdnSZsIRA8yApwWTqwLRdP1CdrOegaTwPVCO9mtjaadye8gy
X-Google-Smtp-Source: AGHT+IH26+hLzQJtX2ss5voCJMw3O/X67D5ManbVwKM2eqgig1E2QKvsougttThvAf89+ZGPYwzR0Q==
X-Received: by 2002:a05:600c:4587:b0:456:302:6dc3 with SMTP id
 5b1f17b1804b1-45a1b65585bmr25542325e9.26.1755181562146; 
 Thu, 14 Aug 2025 07:26:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:7336:e60:7f9e:21e6?
 ([2a01:e0a:3d9:2080:7336:e60:7f9e:21e6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b91b05b28fsm4802655f8f.21.2025.08.14.07.26.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 07:26:01 -0700 (PDT)
Message-ID: <269506b6-f51b-45cc-b7cc-7ad0e5ceea47@linaro.org>
Date: Thu, 14 Aug 2025 16:26:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250725-topic-x1e80100-gpu-bwvote-v2-1-58d2fbb6a127@linaro.org>
 <e7ddfe18-d2c7-4201-a271-81be7c814011@oss.qualcomm.com>
 <33442cc4-a205-46a8-a2b8-5c85c236c8d4@oss.qualcomm.com>
 <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
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
In-Reply-To: <b4f283ce-5be1-4d2f-82e2-e9c3be22a37f@oss.qualcomm.com>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 14/08/2025 13:22, Konrad Dybcio wrote:
> On 8/14/25 1:21 PM, Konrad Dybcio wrote:
>> On 7/31/25 12:19 PM, Konrad Dybcio wrote:
>>> On 7/25/25 10:35 AM, Neil Armstrong wrote:
>>>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
>>>> the Frequency and Power Domain level, but by default we leave the
>>>> OPP core scale the interconnect ddr path.
>>>>
>>>> Declare the Bus Control Modules (BCMs) and the corresponding parameters
>>>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>>>
>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>> Changes in v2:
>>>> - Used proper ACV perfmode bit/freq
>>>> - Link to v1: https://lore.kernel.org/r/20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org
>>>> ---
>>>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>>>   1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..892f98b1f2ae582268adebd758437ff60456cdd5 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>>>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>>>   			.pwrup_reglist = &a7xx_pwrup_reglist,
>>>>   			.gmu_chipid = 0x7050001,
>>>>   			.gmu_cgc_mode = 0x00020202,
>>>> +			.bcms = (const struct a6xx_bcm[]) {
>>>> +				{ .name = "SH0", .buswidth = 16 },
>>>> +				{ .name = "MC0", .buswidth = 4 },
>>>> +				{
>>>> +					.name = "ACV",
>>>> +					.fixed = true,
>>>> +					.perfmode = BIT(3),
>>>> +					.perfmode_bw = 16500000,
>>>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Actually no, BIT(3) is for the CPU (OS), GPU should use BIT(2)
> 
> This is *very* platform-dependent, goes without saying..
> 
> I see BIT(2) is also valid for X1P4


I'm confused, Akhil can you confirm ?

Neil

> 
> Konrad

