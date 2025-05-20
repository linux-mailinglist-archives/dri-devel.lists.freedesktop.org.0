Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C04A0ABD12D
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 09:58:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2046D10E484;
	Tue, 20 May 2025 07:58:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iCCMsBtD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32BC910E484
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 07:58:12 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-3a3771c0f8cso717874f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 00:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747727891; x=1748332691; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=SPQAvbKt0cmqgFT0ywB/V5x7Ds5yqG4E/7/ggfWvqQI=;
 b=iCCMsBtDuroCLRALDG4eAjqqNX+03tlUycydLxVSlprn2AP4LVPC+PnDM0jRFoh5+u
 rMPLU1qTO43JQqUQFNWYFtDT4lGibTiB0OMH0QzDULe+pfxnvNpObGlTWnZ4yEt0BXo3
 fkMBDoQ6hOesrl2qRM3RGiq0g5w27sXwT0CPgeLnHLeiFGdB69yBfg4ZHEfRjHfn+R5N
 RwGCnCgio69ntJAkVGZ4+3EVQS7RCQLY9J21gmmcTIjR74erufdFtkvEo2IsU4Ka9acp
 /BFNig4/nLTnybL2vtAsPeoVrye5W9Sq31eE+K54jRjTLsvPOedy0k5a0cZM+qkH78CR
 J2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747727891; x=1748332691;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=SPQAvbKt0cmqgFT0ywB/V5x7Ds5yqG4E/7/ggfWvqQI=;
 b=D4LoKcpASSSbYGbq04uaBA5Yu/VICBVVXi+ftmkMD4FzHSo+dVKr/hNjtTTIgVQT/C
 5cwKhYy7oFmpEakIFmXmbLGRGv7k2fnFPqrXk7uYucOxxhvSxo0gLbc1kjKeBM6GzF/s
 u35+fHswE8HZKqqsr3lADLmw4vCWprs+pIYyhN2fM6pcWBj+QdixN3H+whFuL5GkYOUJ
 oCFmPlpN2ZNk3EV/wNQvCjer0aZKWFHrDCul6tR963ayCgo1OCornPDtbzsbIiU2K7hU
 gQ80jgal17MzUa7XUefboxJb60+dZVfzLX/zIem0eSqHhIR+nrOBOWVfn6RagHxXX2mw
 pA/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXsU/c0NgWzqoQ4khUIeAyRn2ZrGfimiT3FTCtsxJdtkv47kVjQ0t85onmfoTGv2ZKALX3VlRhO59A=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHyU2Fj26BXXdexwzdey+5BqRcfn3O7AJN+VuHp7SHSu4gW4Uc
 bYCZPpp4fGFj3Kkan3LF+GDyG0F4dIPDcfwoSSKlfFsq3cAHuwfoug+U05WGeIeO4zg=
X-Gm-Gg: ASbGnctjqwhSyfYGMgrUlxdUk6LyNv3YxpI2dGdQrHw7hqrzASq05yeK0d34TT5ibC/
 2LnmdplVolpkNSfLeWP09ZROd6jYb290NVM9TrwVfPieU5wpk/M+nJU0j8UDcb0q9RtqY1W3IOc
 qmBXkNuJGnmsXTnxOTrtZ2reswZ6RFs5LiPWxEy4S25psWCP6n6Q6Qn0fA4r7mg2VyyPTjbQ5V1
 fk3XhongM0QPu7Z2NwuBpPu13w+dQ/Rl3/oj1yeAt2y+OAIugqV0zT5pEM6PRBetJirAzCQKQzI
 kp4bsbRqXmjNP8gMKqlXZ6f3s/99bxGtIMWTofsNalIcuEQn58XU5zGe4JTadcoDzKRFMYRAWdv
 VLC3jPBkYVbnzNmyCXZcHESI2Y8KD
X-Google-Smtp-Source: AGHT+IFmQx0D2O5Gys69Hq+Q9cj5xtbZsenxHyEG5knnp0rzgJXYtv6KCcXxzHA5G60YvDQvopH8Yw==
X-Received: by 2002:a05:6000:2407:b0:3a0:a0e5:d28b with SMTP id
 ffacd0b85a97d-3a35fe5bb31mr12058929f8f.3.1747727890693; 
 Tue, 20 May 2025 00:58:10 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca4d224sm15902063f8f.12.2025.05.20.00.58.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 00:58:10 -0700 (PDT)
Message-ID: <2d616c8e-d2d2-4516-9063-f5aaed36e17e@linaro.org>
Date: Tue, 20 May 2025 09:58:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 08/30] drm/msm/dpu: get rid of DPU_CTL_HAS_LAYER_EXT4
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-8-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-8-6c5e88e31383@oss.qualcomm.com>
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
> DPU_CTL_HAS_LAYER_EXT4 feature bit with the core_major_ver >= 9 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 12 ++++++------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           |  3 ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           |  2 --
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c               |  5 ++++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h               |  4 ++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                   |  2 +-
>   9 files changed, 33 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> index b14d0d6886f019c8fa06047baf734e38696f14ce..52ad7e2af0148c9ea81a2c95b270be7058fbaec1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> @@ -31,32 +31,32 @@ static const struct dpu_ctl_cfg sm8650_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x15000, .len = 0x1000,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x16000, .len = 0x1000,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
>   		.base = 0x17000, .len = 0x1000,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	}, {
>   		.name = "ctl_3", .id = CTL_3,
>   		.base = 0x18000, .len = 0x1000,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>   	}, {
>   		.name = "ctl_4", .id = CTL_4,
>   		.base = 0x19000, .len = 0x1000,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>   	}, {
>   		.name = "ctl_5", .id = CTL_5,
>   		.base = 0x1a000, .len = 0x1000,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 4c5785332b5240109af36a1256d4ea29c348bced..83f73c7cdcc3a280285fa32230796fac57167ed6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -31,32 +31,32 @@ static const struct dpu_ctl_cfg sm8550_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x15000, .len = 0x290,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x16000, .len = 0x290,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
>   		.base = 0x17000, .len = 0x290,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	}, {
>   		.name = "ctl_3", .id = CTL_3,
>   		.base = 0x18000, .len = 0x290,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>   	}, {
>   		.name = "ctl_4", .id = CTL_4,
>   		.base = 0x19000, .len = 0x290,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>   	}, {
>   		.name = "ctl_5", .id = CTL_5,
>   		.base = 0x1a000, .len = 0x290,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> index 960c68f33074e0cec0f33aa7d4f8f3b4cc69bac5..b21aab274703ac1f38698bee82d5d28b0fb6a0d0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> @@ -31,32 +31,32 @@ static const struct dpu_ctl_cfg sar2130p_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x15000, .len = 0x290,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x16000, .len = 0x290,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
>   		.base = 0x17000, .len = 0x290,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	}, {
>   		.name = "ctl_3", .id = CTL_3,
>   		.base = 0x18000, .len = 0x290,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>   	}, {
>   		.name = "ctl_4", .id = CTL_4,
>   		.base = 0x19000, .len = 0x290,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>   	}, {
>   		.name = "ctl_5", .id = CTL_5,
>   		.base = 0x1a000, .len = 0x290,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> index 85dcf577b844995fe11322ec506885bc4a85e33c..d7e5f4dd3bccab125b0a42f67eddf194359dc761 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> @@ -30,32 +30,32 @@ static const struct dpu_ctl_cfg x1e80100_ctl[] = {
>   	{
>   		.name = "ctl_0", .id = CTL_0,
>   		.base = 0x15000, .len = 0x290,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>   	}, {
>   		.name = "ctl_1", .id = CTL_1,
>   		.base = 0x16000, .len = 0x290,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 10),
>   	}, {
>   		.name = "ctl_2", .id = CTL_2,
>   		.base = 0x17000, .len = 0x290,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 11),
>   	}, {
>   		.name = "ctl_3", .id = CTL_3,
>   		.base = 0x18000, .len = 0x290,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 12),
>   	}, {
>   		.name = "ctl_4", .id = CTL_4,
>   		.base = 0x19000, .len = 0x290,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 13),
>   	}, {
>   		.name = "ctl_5", .id = CTL_5,
>   		.base = 0x1a000, .len = 0x290,
> -		.features = CTL_SM8550_MASK,
> +		.features = CTL_SC7280_MASK,
>   		.intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 23),
>   	},
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 00e6f3e56ed1f9af581bad9845971fad315ef83c..a162c4f9ebd79d3ba16b50117ee7462afdbbf3d4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -110,9 +110,6 @@
>   	 BIT(DPU_CTL_VM_CFG) | \
>   	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
>   
> -#define CTL_SM8550_MASK \
> -	(CTL_SC7280_MASK | BIT(DPU_CTL_HAS_LAYER_EXT4))
> -
>   #define INTF_SC7180_MASK \
>   	(BIT(DPU_INTF_INPUT_CTRL) | \
>   	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 01dd6e65f777f3b92f41e2ccb08f279650d50425..3d6c2db395b65b89845cb7281195ca5ca16c22e6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -134,7 +134,6 @@ enum {
>    * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
>    * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
>    * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
> - * @DPU_CTL_HAS_LAYER_EXT4:	CTL has the CTL_LAYER_EXT4 register
>    * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
>    * @DPU_CTL_MAX
>    */
> @@ -143,7 +142,6 @@ enum {
>   	DPU_CTL_ACTIVE_CFG,
>   	DPU_CTL_FETCH_ACTIVE,
>   	DPU_CTL_VM_CFG,
> -	DPU_CTL_HAS_LAYER_EXT4,
>   	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
>   	DPU_CTL_MAX
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> index d58a0f1e8edb524ff3f21ff8c96688dd2ae49541..58bdd4d33b37d83f30931f09fdf80bef41e1f0fe 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> @@ -555,7 +555,7 @@ static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
>   	DPU_REG_WRITE(c, CTL_LAYER_EXT(lm), mixercfg[1]);
>   	DPU_REG_WRITE(c, CTL_LAYER_EXT2(lm), mixercfg[2]);
>   	DPU_REG_WRITE(c, CTL_LAYER_EXT3(lm), mixercfg[3]);
> -	if ((test_bit(DPU_CTL_HAS_LAYER_EXT4, &ctx->caps->features)))
> +	if (ctx->mdss_ver->core_major_ver >= 9)
>   		DPU_REG_WRITE(c, CTL_LAYER_EXT4(lm), mixercfg[4]);
>   }
>   
> @@ -743,12 +743,14 @@ static void dpu_hw_ctl_set_active_fetch_pipes(struct dpu_hw_ctl *ctx,
>    * @dev:  Corresponding device for devres management
>    * @cfg:  ctl_path catalog entry for which driver object is required
>    * @addr: mapped register io address of MDP
> + * @mdss_ver: dpu core's major and minor versions
>    * @mixer_count: Number of mixers in @mixer
>    * @mixer: Pointer to an array of Layer Mixers defined in the catalog
>    */
>   struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
>   				   const struct dpu_ctl_cfg *cfg,
>   				   void __iomem *addr,
> +				   const struct dpu_mdss_version *mdss_ver,
>   				   u32 mixer_count,
>   				   const struct dpu_lm_cfg *mixer)
>   {
> @@ -762,6 +764,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
>   	c->hw.log_mask = DPU_DBG_MASK_CTL;
>   
>   	c->caps = cfg;
> +	c->mdss_ver = mdss_ver;
>   
>   	if (c->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) {
>   		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush_v1;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> index feb09590bc8fc5c77c2c673fd888c28281a98b5a..9cd9959682c21cc1c6d8d14b8fb377deb33cc10d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> @@ -274,6 +274,7 @@ struct dpu_hw_ctl_ops {
>    * @pending_cwb_flush_mask: pending CWB flush
>    * @pending_dsc_flush_mask: pending DSC flush
>    * @pending_cdm_flush_mask: pending CDM flush
> + * @mdss_ver: MDSS revision information
>    * @ops: operation list
>    */
>   struct dpu_hw_ctl {
> @@ -295,6 +296,8 @@ struct dpu_hw_ctl {
>   	u32 pending_dsc_flush_mask;
>   	u32 pending_cdm_flush_mask;
>   
> +	const struct dpu_mdss_version *mdss_ver;
> +
>   	/* ops */
>   	struct dpu_hw_ctl_ops ops;
>   };
> @@ -312,6 +315,7 @@ static inline struct dpu_hw_ctl *to_dpu_hw_ctl(struct dpu_hw_blk *hw)
>   struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
>   				   const struct dpu_ctl_cfg *cfg,
>   				   void __iomem *addr,
> +				   const struct dpu_mdss_version *mdss_ver,
>   				   u32 mixer_count,
>   				   const struct dpu_lm_cfg *mixer);
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 2e296f79cba1437470eeb30900a650f6f4e334b6..d728e275ac427f7849dad4f4a055c56840ca2d23 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -142,7 +142,7 @@ int dpu_rm_init(struct drm_device *dev,
>   		struct dpu_hw_ctl *hw;
>   		const struct dpu_ctl_cfg *ctl = &cat->ctl[i];
>   
> -		hw = dpu_hw_ctl_init(dev, ctl, mmio, cat->mixer_count, cat->mixer);
> +		hw = dpu_hw_ctl_init(dev, ctl, mmio, cat->mdss_ver, cat->mixer_count, cat->mixer);
>   		if (IS_ERR(hw)) {
>   			rc = PTR_ERR(hw);
>   			DPU_ERROR("failed ctl object creation: err %d\n", rc);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
