Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A43C3ABD15A
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 10:05:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2B8110E446;
	Tue, 20 May 2025 08:05:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="m2bozVtM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEE1510E446
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 08:05:00 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43cfe63c592so58348545e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 01:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747728299; x=1748333099; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=PTvudJvnhDEPuyFu1j/pIjb7A7vd2K7xc6jlT71fWUc=;
 b=m2bozVtMMrzlyRyKkFonIuwDx6IS1Hxsm1/oRHSbIU6B0VAbqPl5nH9Qt8uIGYxXYL
 oto8N23/pSV7fqLD9GMCN/M2FDg2sSB0iGzdfmZfUnMFa00TcAQir/lU7UjQ2tugzRyA
 8133eSwjkjVAB3k/o7wQ6pjyeoFK3eBuw19OhNCKTpoBpPkoLs8NV472/qg9Bs9hlzxS
 y/0pd2r/BkSPK/GRbZn42keiqE9C8EZIx3PqJnFPBjXdOKUWqKOqnXsu+mXGPHavQ3B2
 47pyMzMiQrQX+PGEL2/Rg7VdIURpru7uWhs+BpI/f6XaypOU7dg4+pccs6r0OxApS+AI
 4wJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747728299; x=1748333099;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=PTvudJvnhDEPuyFu1j/pIjb7A7vd2K7xc6jlT71fWUc=;
 b=qXSPCIrBFv7j0MZ5XJ3/NI6f3tnC1vEnahvhiHG23EyChnzOsVC+zUKwe0FXmRAw0R
 1X9g/TYNU6Bs2tMpcQyc0rFt9CGoAwYYJsAvQ18/X4vX9rwtPwrGZGdp6+j/5NfkzWAW
 mRtvI4EqCyxeWKDqOTksjUwWU8HuGocvm5gzrFgH5Rn3GQ+6GQvOGfc/FHKaHYSnyvSH
 OA4z/Pqn+6DQEtvHH9KBduGZgnESb6D4hWs8pokfFxT0VnFCtM2SgB0weyePcJQgB7t3
 XpjQ2/E5hxMWqnhChudvJo9EGTXjfm6xl/8gkRaErmy1JLnx1z4Rij8Rre4csQfILN/d
 8Evw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzCaKHq8vwZvlyeI2qhqvVwZVe9kjHAEpYPL/9+Vy31eK9GthCQ7Sl6PBJIrYhMVP9jvzWqM/K/uk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXVqE8dTAKQccUQrlAYg7RmzmD/XX3ZEZ99DRzG9g5x1tCygFN
 QqKlw8t53Tf/uPMIKtTw0RiJ75M8QvOq9cukdKJzKKhrdZIac2u8F3Sk9tsCYZTA0Yw=
X-Gm-Gg: ASbGnctVUMkLyTBvCttJauErmnzPA2/TFBsaBIJgNOxTUiYglD0S+lbxpUu3AQmTJD8
 gqPDaBwQKc7Clw9JKl+SYVTUengm/V9o4neOyfklC+4N9uUTNHPQW+s4EYDiIxdMu7Idzg5/asg
 f9ecbI8+J7N2IqPRXN0Ez1zIRK3RueIiUI4OMs3m09LIkUJKwN1pfkXDNjIxIruMauRw76ifkGm
 qWbjXZcaRrO9kMhw5sMfSIDKNEfel4YWhl3H5bfWWe+zCO9HKPQxuoWwES2dhsN/w/wluoqNF9w
 jRrRVM4hJMN2EwqFB9uKET1PrKH1Ugv/GxZE0qUtwoTYGRSCKMPvdEeVR3racd1iDOIH30ZRrU8
 +MXKGt6t/R6926SzG9ASGWJa0hg+zV4ycfoedHEQ=
X-Google-Smtp-Source: AGHT+IGUPKh2A40EZEfnAPoVQ3zMAxuIk1SlR6DLZKDJjOuSfQInyC6VjSaaWvvIanac18fckF6Umw==
X-Received: by 2002:a05:600c:34d4:b0:442:e0e0:250 with SMTP id
 5b1f17b1804b1-442fd67200emr144060775e9.29.1747728299447; 
 Tue, 20 May 2025 01:04:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a362997dc8sm13872656f8f.46.2025.05.20.01.04.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 01:04:59 -0700 (PDT)
Message-ID: <b6ef6e15-cff4-40d2-a54d-55dd0218f966@linaro.org>
Date: Tue, 20 May 2025 10:04:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 26/30] drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-26-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-26-6c5e88e31383@oss.qualcomm.com>
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
> DPU_SSPP_QOS_8LVL feature bit with the core_major_ver >= 4 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 +++---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c    | 5 ++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h    | 2 ++
>   4 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 6d7be74bafe326a1998a69ed9b3495c5acf6350f..a276a1beaf95d183f6119452e5516fa8ee60cef6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -35,12 +35,12 @@
>   	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
>   
>   #define VIG_SDM845_MASK_NO_SDMA \
> -	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
> +	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
>   
>   #define VIG_SDM845_MASK_SDMA \
>   	(VIG_SDM845_MASK_NO_SDMA | BIT(DPU_SSPP_SMART_DMA_V2))
>   
> -#define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
> +#define VIG_QCM2290_MASK (VIG_BASE_MASK)
>   
>   #define DMA_MSM8953_MASK \
>   	(BIT(DPU_SSPP_QOS))
> @@ -60,7 +60,7 @@
>   	(VIG_SC7280_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
>   
>   #define DMA_SDM845_MASK_NO_SDMA \
> -	(BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
> +	(BIT(DPU_SSPP_QOS) | \
>   	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
>   	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 8c394e7d6496ca2d120c81c7776b4b979368be23..c582ef1ffe022f2e92b1b80cbab97ff41a2acfe9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -50,7 +50,6 @@ enum {
>    * @DPU_SSPP_CSC_10BIT,      Support of 10-bit Color space conversion
>    * @DPU_SSPP_CURSOR,         SSPP can be used as a cursor layer
>    * @DPU_SSPP_QOS,            SSPP support QoS control, danger/safe/creq
> - * @DPU_SSPP_QOS_8LVL,       SSPP support 8-level QoS control
>    * @DPU_SSPP_EXCL_RECT,      SSPP supports exclusion rect
>    * @DPU_SSPP_SMART_DMA_V1,   SmartDMA 1.0 support
>    * @DPU_SSPP_SMART_DMA_V2,   SmartDMA 2.0 support
> @@ -68,7 +67,6 @@ enum {
>   	DPU_SSPP_CSC_10BIT,
>   	DPU_SSPP_CURSOR,
>   	DPU_SSPP_QOS,
> -	DPU_SSPP_QOS_8LVL,
>   	DPU_SSPP_EXCL_RECT,
>   	DPU_SSPP_SMART_DMA_V1,
>   	DPU_SSPP_SMART_DMA_V2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index 32c7c80845533d720683dbcde3978d98f4972cce..7dfd0e0a779535e1f6b003f48188bc90d29d6853 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -543,7 +543,7 @@ static void dpu_hw_sspp_setup_qos_lut(struct dpu_hw_sspp *ctx,
>   		return;
>   
>   	_dpu_hw_setup_qos_lut(&ctx->hw, SSPP_DANGER_LUT,
> -			      test_bit(DPU_SSPP_QOS_8LVL, &ctx->cap->features),
> +			      ctx->mdss_ver->core_major_ver >= 4,
>   			      cfg);
>   }
>   
> @@ -703,6 +703,9 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(struct drm_device *dev,
>   	hw_pipe->ubwc = mdss_data;
>   	hw_pipe->idx = cfg->id;
>   	hw_pipe->cap = cfg;
> +
> +	hw_pipe->mdss_ver = mdss_rev;
> +
>   	_setup_layer_ops(hw_pipe, hw_pipe->cap->features, mdss_rev);
>   
>   	return hw_pipe;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> index 56a0edf2a57c6dcef7cddf4a1bcd6f6df5ad60f6..ed90e78d178a497ae7e2dc12b09a37c8a3f79621 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> @@ -314,6 +314,8 @@ struct dpu_hw_sspp {
>   	enum dpu_sspp idx;
>   	const struct dpu_sspp_cfg *cap;
>   
> +	const struct dpu_mdss_version *mdss_ver;
> +
>   	/* Ops */
>   	struct dpu_hw_sspp_ops ops;
>   };
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
