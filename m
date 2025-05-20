Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D275EABD0FB
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 09:54:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40E6610E1A6;
	Tue, 20 May 2025 07:54:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="DxYHFBXe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1C7B10E1A6
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 07:54:03 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso41693915e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 00:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747727642; x=1748332442; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=iwxXhJDiipz/57dudIGfdbcWOZE/F3Ufyh9hAR1d1X4=;
 b=DxYHFBXeFp73HgMMcGS+VOMi4jEgoJv5KzJ24BcUyxV/e6VnPxjtSgEjYd38DkDLW3
 o1Al4foUHlgyDZRmZZxe/g5xqbXhbyfumanVLyXSyb3OHsG/YY7wKvar8KfTwBzKaKYL
 UMjzmcVa2KBX7tnpKQ1SSik8siWHK+mUaEYF3SljnHji+Af563NmcB7ep2Gh3t7b/FxM
 nfUo1ktlo4jIlMhRFVTHx3zWUXX3USLFtwksmNqk0o3y3zMlZ3sw6HNXX8NT88x3bwYx
 SgUbSDFXg0ScxU7sDe9oRVdQD0l49hmNAZ8aZ8yj89OLGfOESSV6WiEvS+u+nRHiG05k
 bQ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747727642; x=1748332442;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=iwxXhJDiipz/57dudIGfdbcWOZE/F3Ufyh9hAR1d1X4=;
 b=l41w8Pz8yHS2HiNnHGiECKxDJLHqp+aZHaDEzfZBPjiEtwBmRrXuwDTqS8nz9dQ//4
 S5Meb5skErYVQozh7N0ACMGVLcWPDtuTCaYcoTzm66UweyvEzB04zzX6WYNo5Ec/3g1d
 UKrfcizAqZuXO0n1MylBFtSjvNudCVxBlgH90RqEDtcUYTK+CHRDQmJfMMz33I7sWm9s
 UqzS+r2yNt48suaMwfy8J63jNV5QOn8oxaT9UJpOIOXyqgU3sb0sd1oRw/Yq3mcZ0WcA
 kg9PwYetM7PZk3UUQbLNOdQOh2qIvgQjbVvv3B8ADfi8PykwKwn4LlSv3OVBzdUX7CBf
 VWsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOAn1lO0yPHyAj0B1fCw1xJglTIid6C1sQTS5/1HRt2e970nqgKJSQlrO6WBuU51M7c2sArozGnb0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBmGwSzxs0lJtZl7YhU1mrtizABZJ4hzRCJjeKeh8z1DyKp5Cc
 +WcvR+H48iPLGhumE46ngbuke/+0k6LLY5gJ7Bjr+VDWHsKbfMlbPHGwP9M7i1Vxbms=
X-Gm-Gg: ASbGnctu+PkMY1cZ6xbPVjCtbPXY45JTNM/XfPfF6r4z4TVvLusGyuYUugQfyfkPHyY
 5fQLiMI1IieotOc7uVUaTML92kdTroIfVt+++o+3G4vlb6rSMTC08CSy5MdNjmIbCpZOFPWIzcI
 j8pE+O9olHYRIuvBMOlYjFn3BNWzvPjLAQASRGVPKfsEO/IHyqzrVnwrDxe8FWf6kG8MgOMZr9Y
 Kxs/W9DsEJ8lFGnNZnmw3CF/us7fzQmTjpQVVBNG7LdV34rTwnNjNZRwbFE6R2i9TMmh0J7nGzs
 /vWBBVQOxTez52kJUbvDSXlpp48Y3UGRpl8cXdzaFIMot07idPCt4gtYx4xzyhxOR5BdepJAX97
 Lj7l2WnVj5mCGBDLZQrbB7S4Yykj/
X-Google-Smtp-Source: AGHT+IHChTSQJWbolNv/DcCddwZO2Jlvl4QPMM9JW8HH7kkMA3qIuYI8odpu3mJa0ymgEqyC2nap8A==
X-Received: by 2002:a05:600c:3acb:b0:440:9b1a:cd78 with SMTP id
 5b1f17b1804b1-442fefee292mr145813695e9.10.1747727642169; 
 Tue, 20 May 2025 00:54:02 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f1ef0b20sm20801145e9.14.2025.05.20.00.54.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 00:54:01 -0700 (PDT)
Message-ID: <33f10e0b-bc7b-42d2-a3d8-67c18bab3c59@linaro.org>
Date: Tue, 20 May 2025 09:54:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 19/30] drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-19-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-19-6c5e88e31383@oss.qualcomm.com>
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
> DPU_MDP_PERIPH_0_REMOVED feature bit with the core_major_ver >= 8 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 3 ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c               | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                  | 2 +-
>   10 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> index 37c88b393c12d8a04395b6e5dffb67211d2db9cd..ae66c338250664f9306a7d431cfa18ca07a916a5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> @@ -21,7 +21,6 @@ static const struct dpu_caps sm8650_dpu_caps = {
>   static const struct dpu_mdp_cfg sm8650_mdp = {
>   	.name = "top_0",
>   	.base = 0, .len = 0x494,
> -	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
>   	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 785ca2b2e60f073b0a2db0c0c4ed3b2722de033c..85778071bc1347008dbe4522aeb9ca4fd21aa097 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -21,7 +21,6 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
>   static const struct dpu_mdp_cfg sc8280xp_mdp = {
>   	.name = "top_0",
>   	.base = 0x0, .len = 0x494,
> -	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 1401a84e0da5754fd2a3661d1421bb9b998271ca..f9676f804f9132296467bc751e11036696afa942 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -21,7 +21,6 @@ static const struct dpu_caps sm8450_dpu_caps = {
>   static const struct dpu_mdp_cfg sm8450_mdp = {
>   	.name = "top_0",
>   	.base = 0x0, .len = 0x494,
> -	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> index fbbdce36f0ad99d0b1d32d90627ff5b7f3fc2fc9..7462cfc4cf8de4a10326c83d3341dbee76e437e8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> @@ -20,7 +20,6 @@ static const struct dpu_caps sa8775p_dpu_caps = {
>   static const struct dpu_mdp_cfg sa8775p_mdp = {
>   	.name = "top_0",
>   	.base = 0x0, .len = 0x494,
> -	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
>   		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index cc4413432cfdc636e38a56011d39f18d7e94c23a..695ae7581a88b36fa1f28aa3cd0c9166090e940c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -21,7 +21,6 @@ static const struct dpu_caps sm8550_dpu_caps = {
>   static const struct dpu_mdp_cfg sm8550_mdp = {
>   	.name = "top_0",
>   	.base = 0, .len = 0x494,
> -	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
>   	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> index 32f88533154584dc98a515b1ddef27ab2005fecd..9a25113df5aec527baa514aaa61f2b47c2443d27 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> @@ -21,7 +21,6 @@ static const struct dpu_caps sar2130p_dpu_caps = {
>   static const struct dpu_mdp_cfg sar2130p_mdp = {
>   	.name = "top_0",
>   	.base = 0, .len = 0x494,
> -	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
>   	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> index e053324d76a2e5020e6a7477ddadc9f7d94fe57e..54815c613f087454aa7b4befc84462265d8dfc23 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> @@ -20,7 +20,6 @@ static const struct dpu_caps x1e80100_dpu_caps = {
>   static const struct dpu_mdp_cfg x1e80100_mdp = {
>   	.name = "top_0",
>   	.base = 0, .len = 0x494,
> -	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
>   	.clk_ctrls = {
>   		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
>   	},
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 92dfbb5e7f916bf32afeffdb6b843f1da3f3fd44..d3a7f46488a21e81a24a9af5071a9a7f5f48cdac 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -32,8 +32,6 @@
>    * MDP TOP BLOCK features
>    * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
>    * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
> - * @DPU_MDP_PERIPH_0_REMOVED Indicates that access to periph top0 block results
> - *			   in a failure
>    * @DPU_MDP_MAX            Maximum value
>   
>    */
> @@ -41,7 +39,6 @@ enum {
>   	DPU_MDP_PANIC_PER_PIPE = 0x1,
>   	DPU_MDP_10BIT_SUPPORT,
>   	DPU_MDP_AUDIO_SELECT,
> -	DPU_MDP_PERIPH_0_REMOVED,
>   	DPU_MDP_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> index cebe7ce7b258fc178a687770906f7c4c20aa0d4c..c49a67da86b0d46d12c32466981be7f00519974c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
> @@ -272,7 +272,7 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
>   
>   	if (mdss_rev->core_major_ver < 5)
>   		ops->setup_vsync_source = dpu_hw_setup_vsync_sel;
> -	else if (!(cap & BIT(DPU_MDP_PERIPH_0_REMOVED)))
> +	else if (mdss_rev->core_major_ver < 8)
>   		ops->setup_vsync_source = dpu_hw_setup_wd_timer;
>   
>   	ops->get_safe_status = dpu_hw_get_safe_status;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 1fd82b6747e9058ce11dc2620729921492d5ebdd..80ffd46cbfe69fc90afcdc1a144fc5de7bb6af42 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1022,7 +1022,7 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
>   				dpu_kms->mmio + cat->wb[i].base, "%s",
>   				cat->wb[i].name);
>   
> -	if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
> +	if (dpu_kms->catalog->mdss_ver->core_major_ver >= 8) {
>   		msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
>   				dpu_kms->mmio + cat->mdp[0].base, "top");
>   		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - MDP_PERIPH_TOP0_END,
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
