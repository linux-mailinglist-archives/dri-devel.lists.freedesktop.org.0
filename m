Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC115B10DE9
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jul 2025 16:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 107F010E034;
	Thu, 24 Jul 2025 14:44:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C2mS9dZF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D2C510E95D
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 14:44:12 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-3a5257748e1so803864f8f.2
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jul 2025 07:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753368251; x=1753973051; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=h61dAcV4h+YntxpGoUH8VGIIIUvkHb2+OkdP23t55x8=;
 b=C2mS9dZFk5cvIJKwbaIVnxjAgiSZfBZYFJjt8zoDByL7vdYigJI6Dw9du2R+9aMsxS
 WpGng/bfwnw246ejfpX5PaN1dZSDDz8FebUnJV+Ma/AaZWxPPfB627W4/U+GySRHfWTr
 Iw5XVeYaeWsGPzDBEM+zyoDbh7/szzQyFycwDlk7fsxYcE0pV0bFF26OIeDdJBvmAzoj
 dRWB49c5DhP159xQgCITHBnYC0d6zEEZx3Ms2QeYTYZ2jBPSP4WDatNEfaLJsS1pVl4O
 pDjYBbi/sve6Ygz3yjGFrA+DWjR6nA7YPHDdl7pvPaU9ESewBDca3T7Tpc6sMGgSdhQV
 xY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753368251; x=1753973051;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=h61dAcV4h+YntxpGoUH8VGIIIUvkHb2+OkdP23t55x8=;
 b=QerxgvJmOGsfILSHGIBN7jRFIWpXmBSk1jx/nB9W/mn+3yrh3IT6WbpyhPWaHeIm4z
 5gaQzn+pwmFohIIOdAolpSUXuR/knzYPr8epnt7bgDARMecBUQMt679Ruknu482gvgIq
 XFM2krzqAFJmrmwCM+2T51jL87zeTA52lioZ3J48hBZsxQcK7qRsWdVsctNV7U78P61X
 SU3pgDB89kSfNhF/lP4RsgdyUnraOu9ibJbueKYoO0PMhlzIEa3bf3smO1I2DFb3yw56
 khJPfBn2hdkxfeDiEUxkdw9vTOXAojJXEGPSvezY8jjIRXW3rg/l9mrplAM8Wl5vM3FL
 6tQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7g4zPBeZBpI8ST5+6jXMlpqUzb1cSRVNVqRTdi+0WD+FtWr91ZtIQrIg4wFZsgfQiJcQWgiFlDQ4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXsLN7ZZ68ZJwwyRRXYSMnmwqZMjPz2DXUfXiI8eDH9KCWWGJ2
 o0zvFQHGCcJfy1bEIebZM+FHTgdbVPdXjRZp5266reKrjlQK3x0HBZa/2RyIf9kVSWU=
X-Gm-Gg: ASbGncuYS9zFCe2xhRjTUPVX/BCEECtV6g4zLPAZbFK0hgCxQN7vOdhA+DTsTY3R6uy
 WbzJbexkoUChSHUD+D9IcbzYEAw/nx4pQ6S4qRH73CbRtb8ThwbOIJQsHGcUBQGXyykbjp2VIjF
 FZ8oMJXcHHCDf2/dzhRMMdcbYZ6KltpV+4tQ6teO0v4hPrUrxuPMJuLAlQxTO0JNE0tMIKuyoiL
 qBLx70N7/BiL2mlE1bO7B7A8K6Qniy91td1QgCJyyaamGYSC7Lt8C8xSHFjefZ/JR63Ghxe1Gb0
 Er4lw14cjnLpv8Nu+EEyWPtsHGqaRplIBLTpLROoM63vEgat3UA/q4hN2CelzmuKzikNQLIQQb7
 w+24dbB8bLQMfdBvVVow1EKC+fjl03plmnBtmczoKY+TEJHgQf1MeAke9j3Uw5qFG1mKbiMrrZp
 DJvpK+lboSYA==
X-Google-Smtp-Source: AGHT+IFGgQDhmKjsxwQeeanUSBp4sAHQ1P3xwlEiMitDwLsVw1OyZFVplMZ/sj3w25qrYF6TJH+r9w==
X-Received: by 2002:a05:6000:25c2:b0:3a4:dd16:a26d with SMTP id
 ffacd0b85a97d-3b768ef3c59mr6524335f8f.38.1753368250912; 
 Thu, 24 Jul 2025 07:44:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:cad:2140:e2d3:d328:dc00:f187?
 ([2a01:e0a:cad:2140:e2d3:d328:dc00:f187])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b76fcb89a5sm2326994f8f.65.2025.07.24.07.44.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Jul 2025 07:44:10 -0700 (PDT)
Message-ID: <53e0ae24-c32a-4b6b-a0ea-b056540c2f3d@linaro.org>
Date: Thu, 24 Jul 2025 16:44:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/msm: adreno: a6xx: enable GMU bandwidth voting for
 x1e80100 GPU
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250721-topic-x1e80100-gpu-bwvote-v1-1-946619b0f73a@linaro.org>
 <ac476949-d0e7-4058-ad76-c3cc45691092@oss.qualcomm.com>
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
In-Reply-To: <ac476949-d0e7-4058-ad76-c3cc45691092@oss.qualcomm.com>
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

On 24/07/2025 16:35, Akhil P Oommen wrote:
> On 7/21/2025 6:05 PM, Neil Armstrong wrote:
>> The Adreno GPU Management Unit (GMU) can also scale DDR Bandwidth along
>> the Frequency and Power Domain level, but by default we leave the
>> OPP core scale the interconnect ddr path.
>>
>> Declare the Bus Control Modules (BCMs) and the corresponding parameters
>> in the GPU info struct to allow the GMU to vote for the bandwidth.
>>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> index 00e1afd46b81546eec03e22cda9e9a604f6f3b60..b313505e665ba50e46f2c2b7c34925b929a94c31 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
>> @@ -1440,6 +1440,17 @@ static const struct adreno_info a7xx_gpus[] = {
>>   			.pwrup_reglist = &a7xx_pwrup_reglist,
>>   			.gmu_chipid = 0x7050001,
>>   			.gmu_cgc_mode = 0x00020202,
>> +			.bcms = (const struct a6xx_bcm[]) {
>> +				{ .name = "SH0", .buswidth = 16 },
>> +				{ .name = "MC0", .buswidth = 4 },
>> +				{
>> +					.name = "ACV",
>> +					.fixed = true,
>> +					.perfmode = BIT(2),
>> +					.perfmode_bw = 10687500,
> 
> This configurations should be similar to X1-45.

Including the perfmode bit ?

+					.perfmode = BIT(3),
+					.perfmode_bw = 16500000,


Neil

> 
> -Akhil
> 
>> +				},
>> +				{ /* sentinel */ },
>> +			},
>>   		},
>>   		.preempt_record_size = 4192 * SZ_1K,
>>   		.speedbins = ADRENO_SPEEDBINS(
>>
>> ---
>> base-commit: 97987520025658f30bb787a99ffbd9bbff9ffc9d
>> change-id: 20250721-topic-x1e80100-gpu-bwvote-9fc4690fe5e3
>>
>> Best regards,
> 

