Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D5EABD109
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 09:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FAC10E2E3;
	Tue, 20 May 2025 07:54:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZzlXNCwy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56E110E2E3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 07:54:52 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-3a36efcadb8so1537784f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 00:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747727691; x=1748332491; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=AmHJzTXgvlxjsSJS/8vEUaRv6lsn7GndOG9mwRJnBVU=;
 b=ZzlXNCwynKIGKZSiCp2uSFDRvmBNXclgyj6DX/YbmyRwyQfplbiII054kM65s/cF1I
 M7yTpqLTnjQ9kqpto1jbxxrSjDbIep+fDm519jR1ytbe4KbePvT9bGkXj+efccfdUe4E
 f+arl3bkwqiluv/G6HlAN3eo9BHzGOtL2T9cvW/bmc3Ou9fLDaE8wW07VveKNWgX2oDp
 /hrvfGahZ6tYD3GbsrzLn5bz6UnjJ8vtHmqP0YAFc/uNAZNUREfnuBgwbxTKU4hdZczI
 hzncMj1ZXW+vklsvaOdTYH3I6JYPtPnH6lYC0ylAwvF6VjMOuOHre8dQpyHqv4MWEtFG
 BNnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747727691; x=1748332491;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=AmHJzTXgvlxjsSJS/8vEUaRv6lsn7GndOG9mwRJnBVU=;
 b=bftEg/38RvsWzRRjUI64cRiLZmbykQyM83stU2wVsJhKjQLODOeRYCP/v+27u2gLnv
 gCIgaju6Q+6BQSVIvdDMq6g05ACzd9HxK+A8Dzjr8+N3xelFjCM+clGHuaFV2hX+xLJS
 iL4/L8EqHXvq2aFJnoxr5tGHqC9nIVKwAtFDhyNsvPotKH+VHcSqN1wgktpwPAMxxae+
 WT0TnxEftamZVwGVCoa1loWb/k/E2INcfozHxCYhsKz5t5iJYSqzI3z/uPsP+ZVaE+Fr
 DbpBaLLimUQJt0DWBRoI0fhrvGkqliwck82DPcNYb4PLBUZrfuspilqKaIdYAbrv6jZd
 yd3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCW6tjwMhAR+b7W3UJsa9YDfzd/bXN+A8A7xMUB/aN7fq82kyWn0aYNNbcYGybylmVwJWl+3iKPhMes=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwIMP1M8voNoAiWfaAhzTbFtZbSoSYmNVkVwbEggpBPJ2oBEoFZ
 UErFz1VLfq9tYTyvGRs+OmXv6FT82OaajQjXcoCQqrZOSe9oaMkZ/oTgNFpdDONBs+E=
X-Gm-Gg: ASbGnctWK9wXyjTxEU7h5TXpSDKlXmY4f13uma1rRTk7tLsujzU7bPeshNoWjuMkPjp
 nttWHIHCzSLmDMOaDaujCBuOf02kv6yTgJChpaxD7BuxhegXTBJyz02nn2nYscfKNQfoYaIH5B0
 2ci53CIYLqaxKqBLEb6BJUXHPN2JL92jhL2H9uoREfnb4k54m6THNEJ7u2rgLAzr5nFgCW94/nK
 JS0mbavIeXxgl4IYaVI7Ow2q01p8hToL0I1S6AF62mgWASK/OUHVM6wka3ZPa6i26ye+q0WBGEA
 pf45+KClm2P/JKRz6QC043iHmH5dP/bWAsCevax0Ui0iI51fKTUbTvSnKzKtFxcsQdCfh8ZERGO
 GtFGculFwSuRPSSIsWMZcj4018Sl3
X-Google-Smtp-Source: AGHT+IFgTtMJFEz9OVOG4DvQgJmegTfdifKdm9bKW/FgSdez0ImuKoYiC70z5JjZSi6YNrZfLH+vtg==
X-Received: by 2002:a5d:5f8d:0:b0:3a0:88d5:7fca with SMTP id
 ffacd0b85a97d-3a35c808b9emr12016993f8f.12.1747727691355; 
 Tue, 20 May 2025 00:54:51 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca889d9sm15499428f8f.77.2025.05.20.00.54.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 00:54:51 -0700 (PDT)
Message-ID: <7995edf4-decc-42c9-ad88-ce234ef00c3b@linaro.org>
Date: Tue, 20 May 2025 09:54:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 16/30] drm/msm/dpu: get rid of DPU_PINGPONG_DSC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-16-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-16-6c5e88e31383@oss.qualcomm.com>
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
> DPU_PINGPONG_DSC feature bit with the core_major_ver < 7 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h | 4 ----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 7 ++-----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c         | 2 +-
>   4 files changed, 3 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
> index 8fe07a5683f734a058e7e7250f0811e3b7b7cf07..0e8e71775f2c1c38af018353c85ffeb6ccddb42f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
> @@ -181,28 +181,24 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
>   	{
>   		.name = "pingpong_0", .id = PINGPONG_0,
>   		.base = 0x70000, .len = 0xd4,
> -		.features = PINGPONG_MSM8996_MASK,
>   		.sblk = &msm8996_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
>   	}, {
>   		.name = "pingpong_1", .id = PINGPONG_1,
>   		.base = 0x70800, .len = 0xd4,
> -		.features = PINGPONG_MSM8996_MASK,
>   		.sblk = &msm8996_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
>   	}, {
>   		.name = "pingpong_2", .id = PINGPONG_2,
>   		.base = 0x71000, .len = 0xd4,
> -		.features = PINGPONG_MSM8996_MASK,
>   		.sblk = &msm8996_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),
>   	}, {
>   		.name = "pingpong_3", .id = PINGPONG_3,
>   		.base = 0x71800, .len = 0xd4,
> -		.features = PINGPONG_MSM8996_MASK,
>   		.sblk = &msm8996_pp_sblk,
>   		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 11),
>   		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 15),
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index df1eeb9082f74ab734c235f0cd0baf8c0eda14b5..75b679cd2bd27dd25971489a2d3a6f516b248235 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -95,14 +95,11 @@
>   #define MIXER_QCM2290_MASK \
>   	(BIT(DPU_DIM_LAYER) | BIT(DPU_MIXER_COMBINED_ALPHA))
>   
> -#define PINGPONG_MSM8996_MASK \
> -	(BIT(DPU_PINGPONG_DSC))
> -
>   #define PINGPONG_SDM845_MASK \
> -	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
> +	(BIT(DPU_PINGPONG_DITHER))
>   
>   #define PINGPONG_SM8150_MASK \
> -	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
> +	(BIT(DPU_PINGPONG_DITHER))
>   
>   #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
>   			 BIT(DPU_WB_UBWC) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index bc71ec9a5bc8b6e15d7af13c42ba5d4197729822..ac63f753b43615f7c34d2da51fce919fd77142bf 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -118,14 +118,12 @@ enum {
>    * @DPU_PINGPONG_SPLIT      PP block supports split fifo
>    * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
>    * @DPU_PINGPONG_DITHER     Dither blocks
> - * @DPU_PINGPONG_DSC        PP block supports DSC
>    * @DPU_PINGPONG_MAX
>    */
>   enum {
>   	DPU_PINGPONG_SPLIT = 0x1,
>   	DPU_PINGPONG_SLAVE,
>   	DPU_PINGPONG_DITHER,
> -	DPU_PINGPONG_DSC,
>   	DPU_PINGPONG_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> index 36c0ec775b92036eaab26e1fa5331579651ac27c..49e03ecee9e8b567a3f809b977deb83731006ac0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
> @@ -319,7 +319,7 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(struct drm_device *dev,
>   		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
>   	}
>   
> -	if (test_bit(DPU_PINGPONG_DSC, &cfg->features)) {
> +	if (mdss_rev->core_major_ver < 7) {
>   		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
>   		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
>   		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
