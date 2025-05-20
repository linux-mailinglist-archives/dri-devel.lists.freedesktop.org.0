Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A20F6ABD129
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 09:57:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0815210E4A7;
	Tue, 20 May 2025 07:57:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="FPgnxI4u";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B1810E484
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 07:57:41 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-3a363ccac20so3004219f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 00:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747727860; x=1748332660; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=lh2STyMXHfzFJkwlP1FfBdXpMTcp1B6J3vkncsj7Jb4=;
 b=FPgnxI4uh0FLUegdLG2jT7ztvC90o6OEvo3LZ980LDKnjupnH7mMrIam7Kns5hodkn
 qJFD4hfeDnfJ72yaZDNnFVTuRNsi2+yGH3M57kykAWGDC+3Z+4M66Fc0+0zulGQddgxe
 lOdOHgpF1d8zsl8y1PXRhhjRAAsb3aX7ZuX6E9dDL4JCRdHF4+qIhCcwz7x5TUE9Sdka
 bDHa2i8PFmfanaVYOrODXQ0K0sA7OdeydtHizVOrgl5H+JA+hfuh/GkqMGlPmre0j2sb
 LPsbAdjL5XY8Cgx0dAxFe6LMuUIB0cDZDuJdUDz1ucvUK66qR7RImyQPSGdOGwg/mIPK
 fB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747727860; x=1748332660;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=lh2STyMXHfzFJkwlP1FfBdXpMTcp1B6J3vkncsj7Jb4=;
 b=OsslCSWKjq1V+lJon7hOH0g3BwI0hzdw8WPeCcZPPTU+HSIdYz4IviXpAIZbZXWoHq
 SnSu9WVV+mTTtvm1QSUgK/97NwjYjlddl0DVa6k41SXxPPtkqcUWZZybNCHBUtmPPTWp
 WDleCxeIc9dofUPUwwh2hEAUUU8kifPIkl11MdAUexZboDGbNQHAhm1YhOlWTHVHigNG
 85XTsmTRieWmoVcjIYwphFXU3RNfpxhnwGNKkPyEM7ogwXw21NvU4sjh6UWGvwiLmtjO
 o6gk9sDh6SVkhQg8JyzbzmRRnZK3L5/EkdKs8U9CZsne+RBHFwuuCF3YAW+tO1rzEafe
 RnBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMc03+QafV0QnkUgzorRz6X22MSptrNw9O21x0HvihdAjy1tFhURGPPtBMkzvzLgFVzNqEW3R0kME=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTZ7Hvn4z+K7h2QOZXC0t0XFjh3n0QFBQHh85ori9D2Vjit42E
 CoxbfNvNOY+pDiHy3pHjrL3t1VzJqhw7HiCH23OS/kQF98dnw57wgC4OV2YoUFiE1d0=
X-Gm-Gg: ASbGnctkIOVZmuCJjjsWqdESY+s2+LhtWU1lOjfcE3UIsNfEal2o4qyP/VXI7prNRyk
 AnXpEGTGYcvPWQPkZoEKsMMVZDDjI4g/bmOd6RQaBSAnJGpPCVvq+9sgZ0wDuPThOe6SSz9LsA2
 m2foJGfNLqI6IcFdm90fscCVtM0weMSvIY3ffhzkj1YapteJg7PIbOxkV5ityFSLOSUoZBa3ruW
 S4aV9vi1hv8kXhA5nQhb+3aui9B/YE/OMBGeg/TpI7TTYX5/7+5EZefkWuXZoKbtJ3dkbW+Wjvy
 /ri/AvZI+e6QuvdS12u/aZboINTb2ZT4WBit43b2vrHYKKUBV483lkBzDjq8yeZuOYeEwA4p2Zs
 Yce2NV/kbCH8yIwb238C7+bdxZao+
X-Google-Smtp-Source: AGHT+IFif0KBgcaA+Hxk1INO+1b00+3xTl/0OnWd4uBvCWE5cVr5gwSyLZAUaV2vw+rTF+KVpZYsOQ==
X-Received: by 2002:a5d:64e5:0:b0:3a3:6f1a:b90a with SMTP id
 ffacd0b85a97d-3a36f1aba27mr5443114f8f.15.1747727860063; 
 Tue, 20 May 2025 00:57:40 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca88985sm15686045f8f.63.2025.05.20.00.57.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 00:57:39 -0700 (PDT)
Message-ID: <f6a10e14-de53-43e1-a887-4a4ba4aa0d63@linaro.org>
Date: Tue, 20 May 2025 09:57:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 09/30] drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-9-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-9-6c5e88e31383@oss.qualcomm.com>
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
> DPU_CTL_ACTIVE_CFG feature bit with the core_major_ver >= 5 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 6 ------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 6 ------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 6 ------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h  | 6 ------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  | 6 ------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 6 ------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  | 3 ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c    | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c    | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c     | 7 ++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 3 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c              | 2 +-
>   17 files changed, 6 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index b2ee5ee01870507d9f01020443c30dc573414c72..6c8ef23099a8212f33780d27a76991e9955a9bc3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -41,32 +41,26 @@ static const struct dpu_ctl_cfg sm8150_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x1000, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x1200, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
>   		.base = 0x1400, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	}, {
>   		.name = "ctl_3", .id = CTL_3,
>   		.base = 0x1600, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>   	}, {
>   		.name = "ctl_4", .id = CTL_4,
>   		.base = 0x1800, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>   	}, {
>   		.name = "ctl_5", .id = CTL_5,
>   		.base = 0x1a00, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 6db04c668a87a9f7baea01a9ea2a0f1bbb1212bf..37d18803af4b850c40ab855b1f13db96f3ee96ea 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -41,32 +41,26 @@ static const struct dpu_ctl_cfg sc8180x_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x1000, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x1200, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
>   		.base = 0x1400, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	}, {
>   		.name = "ctl_3", .id = CTL_3,
>   		.base = 0x1600, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>   	}, {
>   		.name = "ctl_4", .id = CTL_4,
>   		.base = 0x1800, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>   	}, {
>   		.name = "ctl_5", .id = CTL_5,
>   		.base = 0x1a00, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> index 6f61ce85c536e36b65b98ba4740711cb495a7c9a..41b43fb258508f1a5f285c88a3c1dc2f5f271cd0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> @@ -38,32 +38,26 @@ static const struct dpu_ctl_cfg sm7150_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x1000, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x1200, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
>   		.base = 0x1400, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	}, {
>   		.name = "ctl_3", .id = CTL_3,
>   		.base = 0x1600, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>   	}, {
>   		.name = "ctl_4", .id = CTL_4,
>   		.base = 0x1800, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>   	}, {
>   		.name = "ctl_5", .id = CTL_5,
>   		.base = 0x1a00, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> index dc6d8fd05c2e3afbe5182b1ae8dd9fea8b6543e5..d44db988a6e2f443803a422846f817779d382b2a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> @@ -35,32 +35,26 @@ static const struct dpu_ctl_cfg sm6150_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x1000, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x1200, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
>   		.base = 0x1400, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	}, {
>   		.name = "ctl_3", .id = CTL_3,
>   		.base = 0x1600, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>   	}, {
>   		.name = "ctl_4", .id = CTL_4,
>   		.base = 0x1800, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>   	}, {
>   		.name = "ctl_5", .id = CTL_5,
>   		.base = 0x1a00, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> index 192e90b570dbf8f5c3c24f572443e111f6cf3db2..6e571480c4a44b4f4663574c31270657b9a06a7a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> @@ -35,32 +35,26 @@ static const struct dpu_ctl_cfg sm6125_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x1000, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x1200, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
>   		.base = 0x1400, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	}, {
>   		.name = "ctl_3", .id = CTL_3,
>   		.base = 0x1600, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>   	}, {
>   		.name = "ctl_4", .id = CTL_4,
>   		.base = 0x1800, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>   	}, {
>   		.name = "ctl_5", .id = CTL_5,
>   		.base = 0x1a00, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index bdd92b5a61eabc6a1d5e0bfe740ed6d9f1e8e94f..6f9dc261e667fca3e94ec24e00d45f9af46e401e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -39,32 +39,26 @@ static const struct dpu_ctl_cfg sm8250_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x1000, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x1200, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
>   		.base = 0x1400, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	}, {
>   		.name = "ctl_3", .id = CTL_3,
>   		.base = 0x1600, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>   	}, {
>   		.name = "ctl_4", .id = CTL_4,
>   		.base = 0x1800, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>   	}, {
>   		.name = "ctl_5", .id = CTL_5,
>   		.base = 0x1a00, .len = 0x1e0,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index ce2ec6af5f53e2177009ca8826ca510fa08c03c7..373c7d605a04a1fc72f45e993ec176e8f5e015fe 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -32,17 +32,14 @@ static const struct dpu_ctl_cfg sc7180_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x1000, .len = 0x1dc,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x1200, .len = 0x1dc,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
>   		.base = 0x1400, .len = 0x1dc,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> index 986179b53f8b59200d10f5159cac630732dc7196..1cf9f99d0542cf7037d2a9672d51ca7c437c364e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> @@ -29,7 +29,6 @@ static const struct dpu_ctl_cfg sm6115_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x1000, .len = 0x1dc,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> index c2321a4a7d3894d85062d083b45402950122007b..a3db71676f468526ea129c4b8465fb2c47885162 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> @@ -35,22 +35,18 @@ static const struct dpu_ctl_cfg sm6350_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x1000, .len = 0x1dc,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x1200, .len = 0x1dc,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
>   		.base = 0x1400, .len = 0x1dc,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	}, {
>   		.name = "ctl_3", .id = CTL_3,
>   		.base = 0x1600, .len = 0x1dc,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index c3dd2383bd5f32926b50d98c937da25ed59d7cb3..719cfaa98ab9e735d9255d9a5f1a4275739b4b1d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -29,7 +29,6 @@ static const struct dpu_ctl_cfg qcm2290_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x1000, .len = 0x1dc,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> index abeaa2b8e06fdf6ce5cec2c1a4fd025a342f5a2f..04cdda85e6828a83e99d146ee9d9f809f1acc007 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> @@ -30,7 +30,6 @@ static const struct dpu_ctl_cfg sm6375_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x1000, .len = 0x1dc,
> -		.features = BIT(DPU_CTL_ACTIVE_CFG),
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> index a0ba55ab3c894c200225fe48ec6214ae4135d059..25ba5d9bfff2b3f7a5054ae26511d05917f72d8b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
> @@ -69,7 +69,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
>   	ctl->ops.setup_intf_cfg(ctl, &intf_cfg);
>   
>   	/* setup which pp blk will connect to this intf */
> -	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) && phys_enc->hw_intf->ops.bind_pingpong_blk)
> +	if (phys_enc->hw_intf->ops.bind_pingpong_blk)

Why did you drop the version test here ?

Neil

>   		phys_enc->hw_intf->ops.bind_pingpong_blk(
>   				phys_enc->hw_intf,
>   				phys_enc->hw_pp->idx);
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index d35d15b60260037c5c0c369cb061e7759243b6fd..e12bca8a26ec98565a96919b1c43f7fa2ea8a0df 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -373,7 +373,7 @@ static void dpu_encoder_phys_vid_underrun_irq(void *arg)
>   static bool dpu_encoder_phys_vid_needs_single_flush(
>   		struct dpu_encoder_phys *phys_enc)
>   {
> -	return !(phys_enc->hw_ctl->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) &&
> +	return !(phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5) &&
>   		phys_enc->split_role != ENC_ROLE_SOLO;
>   }
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> index 849fea580a4ca55fc4a742c6b6dee7dfcdd788e4..c8f3516ae4faa709e3eda4c0efb050ca18b675e4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
> @@ -218,7 +218,6 @@ static void dpu_encoder_phys_wb_setup_fb(struct dpu_encoder_phys *phys_enc,
>   static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
>   {
>   	struct dpu_hw_wb *hw_wb;
> -	struct dpu_hw_ctl *ctl;
>   	struct dpu_hw_cdm *hw_cdm;
>   
>   	if (!phys_enc) {
> @@ -227,10 +226,9 @@ static void dpu_encoder_phys_wb_setup_ctl(struct dpu_encoder_phys *phys_enc)
>   	}
>   
>   	hw_wb = phys_enc->hw_wb;
> -	ctl = phys_enc->hw_ctl;
>   	hw_cdm = phys_enc->hw_cdm;
>   
> -	if (test_bit(DPU_CTL_ACTIVE_CFG, &ctl->caps->features) &&
> +	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5 &&
>   		(phys_enc->hw_ctl &&
>   		 phys_enc->hw_ctl->ops.setup_intf_cfg)) {
>   		struct dpu_hw_intf_cfg intf_cfg = {0};
> @@ -534,7 +532,6 @@ static void dpu_encoder_phys_wb_enable(struct dpu_encoder_phys *phys_enc)
>   static void dpu_encoder_phys_wb_disable(struct dpu_encoder_phys *phys_enc)
>   {
>   	struct dpu_hw_wb *hw_wb = phys_enc->hw_wb;
> -	struct dpu_hw_ctl *hw_ctl = phys_enc->hw_ctl;
>   
>   	DPU_DEBUG("[wb:%d]\n", hw_wb->idx - WB_0);
>   
> @@ -556,7 +553,7 @@ static void dpu_encoder_phys_wb_disable(struct dpu_encoder_phys *phys_enc)
>   	 * WB support is added to those targets will need to add
>   	 * the legacy teardown sequence as well.
>   	 */
> -	if (hw_ctl->caps->features & BIT(DPU_CTL_ACTIVE_CFG))
> +	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
>   		dpu_encoder_helper_phys_cleanup(phys_enc);
>   
>   	phys_enc->enable_state = DPU_ENC_DISABLED;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index a162c4f9ebd79d3ba16b50117ee7462afdbbf3d4..0863e5cfb3283ed32f61ddd4483220742df8633d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -105,8 +105,7 @@
>   	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
>   
>   #define CTL_SC7280_MASK \
> -	(BIT(DPU_CTL_ACTIVE_CFG) | \
> -	 BIT(DPU_CTL_FETCH_ACTIVE) | \
> +	(BIT(DPU_CTL_FETCH_ACTIVE) | \
>   	 BIT(DPU_CTL_VM_CFG) | \
>   	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 3d6c2db395b65b89845cb7281195ca5ca16c22e6..9981d090b689b46bbc378d1965b0efd1df0efa8b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -139,7 +139,6 @@ enum {
>    */
>   enum {
>   	DPU_CTL_SPLIT_DISPLAY = 0x1,
> -	DPU_CTL_ACTIVE_CFG,
>   	DPU_CTL_FETCH_ACTIVE,
>   	DPU_CTL_VM_CFG,
>   	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index 58bdd4d33b37d83f30931f09fdf80bef41e1f0fe..2dfb7db371a3915f663cf134e4dd62f92224185b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -766,7 +766,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
>   	c->caps = cfg;
>   	c->mdss_ver = mdss_ver;
>   
> -	if (c->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) {
> +	if (mdss_ver->core_major_ver >= 5) {
>   		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush_v1;
>   		c->ops.setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
>   		c->ops.reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
> 

