Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEF1CABD150
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 10:04:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2AD410E3DB;
	Tue, 20 May 2025 08:04:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ptPy7yyt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CD4510E3DB
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 08:04:02 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso39528555e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 01:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747728241; x=1748333041; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=CI7NijShzHJHWG9S0+OmKjFueVIEn44Lt/2HlDleorE=;
 b=ptPy7yytSGr/zs/bWTsoWyvUCDCLbz5UIBghOzW9ExbJuMRWueehEPE/qKy8R639we
 mY7u3M/NFufrOM3xiw1WfQ05GMm/kThnWoCzgI+7xl+6sRQjBt3+KWD0I9r+9Ea8F8BB
 ApR/RgboPdp6EFIQ2u5aAUJN7WNGHad08IY4uuSq1gI46AMUj3wPO/l9tz6KQ1X0uILI
 PAYJkcECl1jOrbJuEqeiN81HdRrPmmbFCPZTCIVH8fGZG7AgIGxTAoqTTdV8xZyrZnkz
 QRUbMphokF+01xsl+8m6JS1Gm3E5ITHJKa9XAekzcUAsKbiTBeXbpHbwu3Qzb79kmAOh
 Fw4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747728241; x=1748333041;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CI7NijShzHJHWG9S0+OmKjFueVIEn44Lt/2HlDleorE=;
 b=kHk1eSb+jaulb82Q575V/Dhbg+bPjSiR69Tohv/9Ef0kDS4vmqtqGRLBZ4ln1AAxjq
 bcbSsY4BHnEzwad5hPjWr96kSiZSdk6RR6D41sFhV/npVylyKlQeUpzy1QpwbSudphxD
 r6NgYXUU4H18vob8e/lNF7dBIan9AkoJ7MY/psqTfAIISaPsJ4wXENqy5dMRfYlv9RY3
 LZAGLgswrbTzVwz2iMAkZOLk4rfEJOLc7oJnVMocpdy5CyquRP0TNplnWICjO4FyXU4V
 0HZUn9tNbhD5r74o2+fxrlRz2aWW+RG7UTghio5XEhHZ6IETkHEEpU4T1G3mpfY2bWCq
 3HWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWukITsATcHTwIClxcBYSFgL9DWxuZQLqW4ECUGHZaQheGK9vXTJH3vgTo8+jQ9Wu0EVbryT3pscSw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtK+x16di2R7vZbP8m07GlwgQGi2r5RUkS7Jvr5kplucPb3GAC
 i7KGx49VI/Ke1cfPqOKi06VuBtOCs2EgPntVv6vhcr70vRw3bpZ37ExzGWXHX+0pGxg=
X-Gm-Gg: ASbGncvhmy4i/H8UdCnpA0047bKhM6ZSW34XK+XEFylYXud1g84Un7VNPag+rdEE1Iv
 sjKg4UiCC2DL9cPaau9xXVjZv8nrjJOKtZEXUmwBBQU5ApZO/9Xl0nS5bLoZVaBOVtKjdZXukQw
 i1mqrgikU7pi40xKex1DIwZpmqxFGEdgRLNtSr90oX8dJrZNyyWPy3zg/fUnC2Az6fZ6qdwA669
 oW/IX3e6ch+YVvKzESgQd/jL3w67+TCmhDBJPsu6o2dT6GEvc9aTNzSMPHMTHB1vhgWbIS8ozwM
 OY7UyhkLVAM6YmhTgfn4XY8rvDNquM+2TWKD/GlQf9Poz6fjQVjV1+jeBp5gvUied/bnyY/Rbxb
 Lm5c4fQCwYFVI4siFBvJt2ulqhwKm
X-Google-Smtp-Source: AGHT+IFcyqkN67f5UsI8SZ5Z8BuriQTEF0/l92/+wbrTwcCzMQkVY2ooAkp5VKQpm4LeuH8PnmGL6g==
X-Received: by 2002:a05:600c:1e09:b0:43c:f616:f08 with SMTP id
 5b1f17b1804b1-442fd624854mr147068675e9.8.1747728240969; 
 Tue, 20 May 2025 01:04:00 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f6b29619sm21407615e9.7.2025.05.20.01.03.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 01:04:00 -0700 (PDT)
Message-ID: <78563998-8257-4f7a-8fe1-cf9372c348d5@linaro.org>
Date: Tue, 20 May 2025 10:03:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 23/30] drm/msm/dpu: get rid of DPU_DSC_HW_REV_1_2
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-23-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-23-6c5e88e31383@oss.qualcomm.com>
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

On 19/05/2025 18:04, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Continue migration to the MDSS-revision based checks and replace
> DPU_DSC_HW_REV_1_2 feature bit with the core_major_ver >= 7 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 10 ++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  6 ++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  8 ++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  6 ++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  8 ++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  6 ++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h |  6 ++----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 ++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                  |  2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                   |  2 +-
>   12 files changed, 21 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> index 9a8f6043370997cb12414c4132eb68cc73f7030a..013314b2e716a6d939393b77b0edc87170dba27b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> @@ -286,32 +286,30 @@ static const struct dpu_dsc_cfg sm8650_dsc[] = {
>   	{
>   		.name = "dce_0_0", .id = DSC_0,
>   		.base = 0x80000, .len = 0x6,
> -		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.features = BIT(DPU_DSC_NATIVE_42x_EN),
>   		.sblk = &dsc_sblk_0,
>   	}, {
>   		.name = "dce_0_1", .id = DSC_1,
>   		.base = 0x80000, .len = 0x6,
> -		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.features = BIT(DPU_DSC_NATIVE_42x_EN),
>   		.sblk = &dsc_sblk_1,
>   	}, {
>   		.name = "dce_1_0", .id = DSC_2,
>   		.base = 0x81000, .len = 0x6,
> -		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.features = BIT(DPU_DSC_NATIVE_42x_EN),
>   		.sblk = &dsc_sblk_0,
>   	}, {
>   		.name = "dce_1_1", .id = DSC_3,
>   		.base = 0x81000, .len = 0x6,
> -		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.features = BIT(DPU_DSC_NATIVE_42x_EN),
>   		.sblk = &dsc_sblk_1,
>   	}, {
>   		.name = "dce_2_0", .id = DSC_4,
>   		.base = 0x82000, .len = 0x6,
> -		.features = BIT(DPU_DSC_HW_REV_1_2),
>   		.sblk = &dsc_sblk_0,
>   	}, {
>   		.name = "dce_2_1", .id = DSC_5,
>   		.base = 0x82000, .len = 0x6,
> -		.features = BIT(DPU_DSC_HW_REV_1_2),
>   		.sblk = &dsc_sblk_1,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index e81a2a02e0a6379382058fd89500cf2064a2193f..b4d41e2644349bdbdbdacbe1e9b3748f90df4f3b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -263,22 +263,20 @@ static const struct dpu_dsc_cfg sm8350_dsc[] = {
>   	{
>   		.name = "dce_0_0", .id = DSC_0,
>   		.base = 0x80000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2),
>   		.sblk = &dsc_sblk_0,
>   	}, {
>   		.name = "dce_0_1", .id = DSC_1,
>   		.base = 0x80000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2),
>   		.sblk = &dsc_sblk_1,
>   	}, {
>   		.name = "dce_1_0", .id = DSC_2,
>   		.base = 0x81000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.features = BIT(DPU_DSC_NATIVE_42x_EN),
>   		.sblk = &dsc_sblk_0,
>   	}, {
>   		.name = "dce_1_1", .id = DSC_3,
>   		.base = 0x81000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.features = BIT(DPU_DSC_NATIVE_42x_EN),
>   		.sblk = &dsc_sblk_1,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index b0e94ccf7f83e9c3c41f1df363cb6a8c24f1503d..5d88f0261d8320a78f8d64c9bb68b938f83160a0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -150,7 +150,7 @@ static const struct dpu_dsc_cfg sc7280_dsc[] = {
>   	{
>   		.name = "dce_0_0", .id = DSC_0,
>   		.base = 0x80000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.features = BIT(DPU_DSC_NATIVE_42x_EN),
>   		.sblk = &dsc_sblk_0,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 2cf30234e45da8a7776d61c49c26abd75d070941..303d33dc7783ac91a496fa0a19860564ad0b6d5d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -262,32 +262,28 @@ static const struct dpu_dsc_cfg sc8280xp_dsc[] = {
>   	{
>   		.name = "dce_0_0", .id = DSC_0,
>   		.base = 0x80000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2),
>   		.sblk = &dsc_sblk_0,
>   	}, {
>   		.name = "dce_0_1", .id = DSC_1,
>   		.base = 0x80000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2),
>   		.sblk = &dsc_sblk_1,
>   	}, {
>   		.name = "dce_1_0", .id = DSC_2,
>   		.base = 0x81000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.features = BIT(DPU_DSC_NATIVE_42x_EN),
>   		.sblk = &dsc_sblk_0,
>   	}, {
>   		.name = "dce_1_1", .id = DSC_3,
>   		.base = 0x81000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.features = BIT(DPU_DSC_NATIVE_42x_EN),
>   		.sblk = &dsc_sblk_1,
>   	}, {
>   		.name = "dce_2_0", .id = DSC_4,
>   		.base = 0x82000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2),
>   		.sblk = &dsc_sblk_0,
>   	}, {
>   		.name = "dce_2_1", .id = DSC_5,
>   		.base = 0x82000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2),
>   		.sblk = &dsc_sblk_1,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index dcef56683224b5715c2608b5472d2d5a0da62010..3c0728a4b37ea6af25ab64315cfe63ba6f8d2774 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -276,22 +276,20 @@ static const struct dpu_dsc_cfg sm8450_dsc[] = {
>   	{
>   		.name = "dce_0_0", .id = DSC_0,
>   		.base = 0x80000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2),
>   		.sblk = &dsc_sblk_0,
>   	}, {
>   		.name = "dce_0_1", .id = DSC_1,
>   		.base = 0x80000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2),
>   		.sblk = &dsc_sblk_1,
>   	}, {
>   		.name = "dce_1_0", .id = DSC_2,
>   		.base = 0x81000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.features = BIT(DPU_DSC_NATIVE_42x_EN),
>   		.sblk = &dsc_sblk_0,
>   	}, {
>   		.name = "dce_1_1", .id = DSC_3,
>   		.base = 0x81000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.features = BIT(DPU_DSC_NATIVE_42x_EN),
>   		.sblk = &dsc_sblk_1,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> index 5f5987d5fc602df29c5eb289823de5dd359df014..b8a1646395916fde04b9750cf548edca5729d9c2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> @@ -275,32 +275,28 @@ static const struct dpu_dsc_cfg sa8775p_dsc[] = {
>   	{
>   		.name = "dce_0_0", .id = DSC_0,
>   		.base = 0x80000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2),
>   		.sblk = &dsc_sblk_0,
>   	}, {
>   		.name = "dce_0_1", .id = DSC_1,
>   		.base = 0x80000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2),
>   		.sblk = &dsc_sblk_1,
>   	}, {
>   		.name = "dce_1_0", .id = DSC_2,
>   		.base = 0x81000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.features = BIT(DPU_DSC_NATIVE_42x_EN),
>   		.sblk = &dsc_sblk_0,
>   	}, {
>   		.name = "dce_1_1", .id = DSC_3,
>   		.base = 0x81000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.features = BIT(DPU_DSC_NATIVE_42x_EN),
>   		.sblk = &dsc_sblk_1,
>   	}, {
>   		.name = "dce_2_0", .id = DSC_4,
>   		.base = 0x82000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2),
>   		.sblk = &dsc_sblk_0,
>   	}, {
>   		.name = "dce_2_1", .id = DSC_5,
>   		.base = 0x82000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2),
>   		.sblk = &dsc_sblk_1,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 6f310216fbccb985308f617db20c1878e622340a..ef22a9adf43ddc9d15be5f1359ea5f6690e9f27c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -272,22 +272,20 @@ static const struct dpu_dsc_cfg sm8550_dsc[] = {
>   	{
>   		.name = "dce_0_0", .id = DSC_0,
>   		.base = 0x80000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2),
>   		.sblk = &dsc_sblk_0,
>   	}, {
>   		.name = "dce_0_1", .id = DSC_1,
>   		.base = 0x80000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2),
>   		.sblk = &dsc_sblk_1,
>   	}, {
>   		.name = "dce_1_0", .id = DSC_2,
>   		.base = 0x81000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.features = BIT(DPU_DSC_NATIVE_42x_EN),
>   		.sblk = &dsc_sblk_0,
>   	}, {
>   		.name = "dce_1_1", .id = DSC_3,
>   		.base = 0x81000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.features = BIT(DPU_DSC_NATIVE_42x_EN),
>   		.sblk = &dsc_sblk_1,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> index ba8a2c5dc5e2b3474b295c86afbbbe8f8d416ccd..2e7d4403835353927bc85a5acd3e6c5967cac455 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> @@ -272,22 +272,20 @@ static const struct dpu_dsc_cfg sar2130p_dsc[] = {
>   	{
>   		.name = "dce_0_0", .id = DSC_0,
>   		.base = 0x80000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2),
>   		.sblk = &dsc_sblk_0,
>   	}, {
>   		.name = "dce_0_1", .id = DSC_1,
>   		.base = 0x80000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2),
>   		.sblk = &dsc_sblk_1,
>   	}, {
>   		.name = "dce_1_0", .id = DSC_2,
>   		.base = 0x81000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.features = BIT(DPU_DSC_NATIVE_42x_EN),
>   		.sblk = &dsc_sblk_0,
>   	}, {
>   		.name = "dce_1_1", .id = DSC_3,
>   		.base = 0x81000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.features = BIT(DPU_DSC_NATIVE_42x_EN),
>   		.sblk = &dsc_sblk_1,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> index 77986a7bd62c1b6323482426e596e5974ba40865..ac95d46b3ecf2d95ec0d516a79567fe9c204b5f6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> @@ -272,22 +272,20 @@ static const struct dpu_dsc_cfg x1e80100_dsc[] = {
>   	{
>   		.name = "dce_0_0", .id = DSC_0,
>   		.base = 0x80000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2),
>   		.sblk = &dsc_sblk_0,
>   	}, {
>   		.name = "dce_0_1", .id = DSC_1,
>   		.base = 0x80000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2),
>   		.sblk = &dsc_sblk_1,
>   	}, {
>   		.name = "dce_1_0", .id = DSC_2,
>   		.base = 0x81000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.features = BIT(DPU_DSC_NATIVE_42x_EN),
>   		.sblk = &dsc_sblk_0,
>   	}, {
>   		.name = "dce_1_1", .id = DSC_3,
>   		.base = 0x81000, .len = 0x4,
> -		.features = BIT(DPU_DSC_HW_REV_1_2) | BIT(DPU_DSC_NATIVE_42x_EN),
> +		.features = BIT(DPU_DSC_NATIVE_42x_EN),
>   		.sblk = &dsc_sblk_1,
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index cc17b20a7d4c15b0cd9c5dc8b9a4b78d4cb78315..01430ff90ab0988bdaa91b85458dd649aab543b3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -176,13 +176,11 @@ enum {
>    * DSC sub-blocks/features
>    * @DPU_DSC_OUTPUT_CTRL       Configure which PINGPONG block gets
>    *                            the pixel output from this DSC.
> - * @DPU_DSC_HW_REV_1_2        DSC block supports DSC 1.1 and 1.2
>    * @DPU_DSC_NATIVE_42x_EN     Supports NATIVE_422_EN and NATIVE_420_EN encoding
>    * @DPU_DSC_MAX
>    */
>   enum {
>   	DPU_DSC_OUTPUT_CTRL = 0x1,
> -	DPU_DSC_HW_REV_1_2,
>   	DPU_DSC_NATIVE_42x_EN,
>   	DPU_DSC_MAX
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 80ffd46cbfe69fc90afcdc1a144fc5de7bb6af42..d478a7bce7568ab000d73467bcad91e29f049abc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1043,7 +1043,7 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   		msm_disp_snapshot_add_block(disp_state, cat->dsc[i].len, base,
>   					    "%s", cat->dsc[i].name);
>   
> -		if (cat->dsc[i].features & BIT(DPU_DSC_HW_REV_1_2)) {
> +		if (cat->mdss_ver->core_major_ver >= 7) {
>   			struct dpu_dsc_blk enc = cat->dsc[i].sblk->enc;
>   			struct dpu_dsc_blk ctl = cat->dsc[i].sblk->ctl;
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 7bcb1e057b143a5512aafbd640199c8f3b436527..c2a659512cb747e1dd5ed9e28534286ff8d67f4f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -168,7 +168,7 @@ int dpu_rm_init(struct drm_device *dev,
>   		struct dpu_hw_dsc *hw;
>   		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
>   
> -		if (test_bit(DPU_DSC_HW_REV_1_2, &dsc->features))
> +		if (cat->mdss_ver->core_major_ver >= 7)
>   			hw = dpu_hw_dsc_init_1_2(dev, dsc, mmio);
>   		else
>   			hw = dpu_hw_dsc_init(dev, dsc, mmio);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
