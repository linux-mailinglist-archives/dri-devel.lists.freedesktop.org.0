Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 573BCA039B8
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jan 2025 09:24:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7046B10E3AA;
	Tue,  7 Jan 2025 08:24:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bUg3htBq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 122B610E39E
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jan 2025 08:24:48 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43624b2d453so156779265e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jan 2025 00:24:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736238227; x=1736843027; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=VPvkl9NLmMFO9chBKj0rhtLZ12jNHzyAWJ3EKiBo2Fc=;
 b=bUg3htBqk1RP+SXEvixa37FR2igj5e+MUjDmQ0MSK5qnSpilLysmu5yRw6smsjxjLW
 wJsbxy7jx0ibzlgvfJcAD69i+6gKfkGM1GFB/ONuhsa31ZAbej6g9abH+nfLAsFrRaHJ
 ovBuYwCQj3oFAGL59BDSZGtJ1yOgQhGUhMvC//adLFzrnu6J7yLeRtKhtr6j4cRbDPKE
 VU8nV5MoDjUF8iMilSxaKy5qLkUbaldpjkuxCIAB4aZnxDte/7vOx+9FFrmNVsu2NWYC
 Jfifo4hMX/AxYR3+q+CorQZxNcGTB5Vf5HABvpU/ye8My5tXwmtlqD7ZqxwVYFxxHAR3
 +qww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736238227; x=1736843027;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=VPvkl9NLmMFO9chBKj0rhtLZ12jNHzyAWJ3EKiBo2Fc=;
 b=WLlfeMH8MmA8b1IPLnRs1qR6t9Zja1KfhDyCcts9U0yV5+thjmPpQH6dV6J5J/KdgT
 FGhToibXmiwnSo64bMARdMazhS2lLf5h2+BiaO7LpYg8NoGKUpkmrBy3gPvh2VNO0e5z
 +8gWx1kbXobSvJDqRHPXhJHAanoVkGzj/iRVt1iF3ZkillIwdh24UUSC2cF65Rxhsf+E
 W8zdVFuSv0hK5clo6wi+Lduy2wonov0J5i5xdViefqaCjv7lh58KIDZc+5NmJx1Ssf2f
 0CaWjrLE3P/qFf7M5YvaSFMAPJKWmHCFi1TPGzWhTbeE6gHRRIVIL7dLNtS78TTbDd6n
 rFGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLsjTyrjAwY9/kkx2OeFjIZpGznEXSjujIy5eu9aA92qnNYVQ23kLiXjrPOQQwUs5o7XsZLaW3W5Q=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8+wnxTtfByPtOeATUpTlBmg18AOkJxicbcPwKh6bts47P/Bax
 DN+pGcYWi8RqxwSp5f2HHVItvPJwTvisHuxlloMriWHyplTtECXhkgZOQvwJKhmHMlFtJWGZBMR
 7
X-Gm-Gg: ASbGncvDV6Fc83kJR4GAEdaUXGdzlNgtUxTHHzdzBodZvLLLdWrBuUtxqKAOD7EDutG
 a+Zbj9IKVIe/aJc+xXh3yYWg2x1KA2N3PhiExVImoBKM0m/tb4PVBCFyRnDrNDwBPZ5dVkFJrrp
 m1RVekL2P+RJuvKoeZy9SJEmokBg4eEVVhbUC5xElQ4jxVvBOACC+5yoJLId6zSOvGemnsE2A0F
 omqOOyd0ucNPSfyMUM9lOL4V/L4wnfR+6biHiZDPFvosJIjkxxjr6S+gZ48DJPyFF9AdCVRPZb3
 xq8cSbGzRTpAAFE8cnTW9cAyQ2J9sR9TRw==
X-Google-Smtp-Source: AGHT+IEj3mnGDF4IJMWEXYu122nB2ocAcm6lUPn1P5i+p5AsmXkfV/YbZ2y/vsSj6aanKVz9FOlZRQ==
X-Received: by 2002:a5d:5987:0:b0:38a:6929:ffa1 with SMTP id
 ffacd0b85a97d-38a692a0090mr10700443f8f.23.1736237783202; 
 Tue, 07 Jan 2025 00:16:23 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:6d5b:2c82:bc7f:46f6?
 ([2a01:e0a:982:cbb0:6d5b:2c82:bc7f:46f6])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a1c828989sm49811861f8f.18.2025.01.07.00.16.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jan 2025 00:16:22 -0800 (PST)
Message-ID: <1cb0b1f4-b445-471d-a7e1-660e3b82dacc@linaro.org>
Date: Tue, 7 Jan 2025 09:16:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH 0/4] drm/msm/dpu: enable CDM for all supported platforms
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
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
In-Reply-To: <20241224-dpu-add-cdm-v1-0-7aabfcb58246@linaro.org>
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

On 24/12/2024 05:25, Dmitry Baryshkov wrote:
> Enable CDM block on all the platforms where it is supposed to be
> present. Notably, from the platforms being supported by the DPU driver
> it is not enabled for SM6115 (DPU 6.3), QCM2290 (DPU 6.5) and SM6375
> (DPU 6.9)


Can you specify how to validate this ?

Thanks,
Neil

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Dmitry Baryshkov (4):
>        drm/msm/dpu: rename CDM block definition
>        drm/msm/dpu: enable CDM_0 for all DPUs which are known to have it
>        drm/msm/dpu: enable CDM_0 for SC8280XP platform
>        drm/msm/dpu: enable CDM_0 for X Elite platform
> 
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 +
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 2 +-
>   26 files changed, 26 insertions(+), 4 deletions(-)
> ---
> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
> change-id: 20241215-dpu-add-cdm-0b5b9283ffa8
> 
> Best regards,

