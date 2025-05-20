Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B34DABD10D
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 09:55:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C798410E3B9;
	Tue, 20 May 2025 07:55:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="RcwCtDa6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E747D10E3B9
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 07:55:16 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-442e9c00bf4so38076385e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 00:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747727715; x=1748332515; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=c/OtNCd2dz17P4nPLPRhnt17V4goi8hkMyd0k71Yinc=;
 b=RcwCtDa6a3VMoiCa/XclaT5GSr/+Nd1N+yv87I06rs9Xt3SX15NyPVEKM8qUFE+2o1
 /rXnq3YICeajhGxUV3OztlSn+Z682ycpH58G+7gr/Ic4vQzxC1ZyLqbJnVI0O05ln0BH
 tN3xp2Lh4oSXL4zhifLKCmXKTglznhvbS620WoDs+3rDJGwc0GRm3e4HYzB4Bbp4ulQX
 Yrqyjzsoa5edbcUJYfudML92DQ++wMUk1560HHCQ+OWCCeMiamUhr/5oeizBXR3LCFqw
 rN3QZfR9/FPzNkfUVbtyw6TY+EQnCUAIyiq1bokQzmxMi4MEhRUh2GfjaiQzYdXs4j/3
 AjEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747727715; x=1748332515;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=c/OtNCd2dz17P4nPLPRhnt17V4goi8hkMyd0k71Yinc=;
 b=tbCoi9Yocr+YktI2cE4RUtf+7PoHyQ5LvpbfE+PtJ7REAh/KBXMNK1j1gL2urPj7Eg
 xR7gqwZPNv6+qrHck7EiMrgi0QaMkZUg89I1Bxb9GABb+dFGJiMQdtTVb645egrR0xGf
 XW8gKsD+K0fopYI+UGDmb9NhCeQsUeSyNqdoWfbdvh+/6KNyPngnocuSySKQtw23Es4X
 I43rAlJIdlXk06O9FPOa7kljs3JZvGszL++YuyDiWXVu0LLPMToIsqH2oDhfarxdTM/T
 LhpDiTHHvbCdV/8q54903SMqbAXLysgKS2paWoabVz2+R38JX1/NBm7i2C/i9pwKLgwv
 BOHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSlK2SCakT6JFUz/AjPT7yah6XzuMhU7iJ3eBrx/goQdvWEFTQdnfnmxkSvs+XQlJbX1w0Mi2aZps=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXhZAtcWhixK0I5lp9Cb1pqXVW58pewy25LSa9dQ1unTfvGQ01
 DsfTIGrPyl+KcYtri+ll5zWkzI7FfT+9PKfrjFrMsNihSXRkgFiFTc7MIOzeKc0D7Is=
X-Gm-Gg: ASbGncuinD5/xmvlhaqDaO609e3sPsYByHAeL5hfFtNM5NSYYHqB/O+IwrbZ9lM+jCd
 vhppT0BYqZHzLtXPUonzNEWj+6GEvzHCgTLXKzDRRCO7HoI5p//nTQuihr6/dki23AnRFMJKzl5
 9bO7/wxKt4bXdfr34cK1ZUlR1d3brLjGnA2q1+Fg3NEC50HEMW7uBJvP0jszLbIqtD0oa/D7suh
 Qd6VzQ4MlirH4aOQxfs8vbSNts0rGsYnOzKhKjXbHHgJaM6yc+fmSBnuU5ztqcSm169dbSRrM/i
 pdgOXoueTk4/wxfsevYXrwl+ZClKxs0eUT3C0YKIOZXn0yGCTd9WyHgQJmPXszIqtlahW0Y3qZu
 uHJ9tB8wvbOVmXYmiQthLmVJdKjBZ
X-Google-Smtp-Source: AGHT+IFG4bxNO+QTd4WjfDu682YpvHGgnkyojbVGi8io/yYAW4/kbuGvngeSzLRnmGyPvvYpd/HjWQ==
X-Received: by 2002:a05:600c:c059:20b0:445:49e:796b with SMTP id
 5b1f17b1804b1-445049e81c3mr62465295e9.17.1747727715232; 
 Tue, 20 May 2025 00:55:15 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f1ef0aadsm20549625e9.12.2025.05.20.00.55.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 00:55:14 -0700 (PDT)
Message-ID: <27028c01-159f-4372-823d-6e739dd555d9@linaro.org>
Date: Tue, 20 May 2025 09:55:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 15/30] drm/msm/dpu: get rid of DPU_INTF_INPUT_CTRL
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-15-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-15-6c5e88e31383@oss.qualcomm.com>
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
> DPU_INTF_INPUT_CTRL feature bit with the core_major_ver >= 5 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  |  4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   |  4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  |  6 ------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   |  4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   |  3 ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   |  2 --
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   |  4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   |  2 --
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   |  1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   |  2 --
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  |  1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   |  1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   |  4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   |  3 ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  9 ---------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   |  4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  |  8 --------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   |  4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h |  4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  9 ---------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           |  3 ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 11 -----------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c              |  2 +-
>   23 files changed, 1 insertion(+), 94 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> index bbdb7e1668fee33cb7d99a7cb8ab001e58f079be..88582fc257dea342f05b93dae6afe986eb7f32d0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> @@ -364,7 +364,6 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
>   	{
>   		.name = "intf_0", .id = INTF_0,
>   		.base = 0x34000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -373,7 +372,6 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
>   	}, {
>   		.name = "intf_1", .id = INTF_1,
>   		.base = 0x35000, .len = 0x300,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -383,7 +381,6 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
>   	}, {
>   		.name = "intf_2", .id = INTF_2,
>   		.base = 0x36000, .len = 0x300,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -393,7 +390,6 @@ static const struct dpu_intf_cfg sm8650_intf[] = {
>   	}, {
>   		.name = "intf_3", .id = INTF_3,
>   		.base = 0x37000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 6c8ef23099a8212f33780d27a76991e9955a9bc3..bcab869aafbe1e23e0267bbad377fc10d8c6256d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -301,7 +301,6 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
>   	{
>   		.name = "intf_0", .id = INTF_0,
>   		.base = 0x6a000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -310,7 +309,6 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
>   	}, {
>   		.name = "intf_1", .id = INTF_1,
>   		.base = 0x6a800, .len = 0x2bc,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -320,7 +318,6 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
>   	}, {
>   		.name = "intf_2", .id = INTF_2,
>   		.base = 0x6b000, .len = 0x2bc,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -330,7 +327,6 @@ static const struct dpu_intf_cfg sm8150_intf[] = {
>   	}, {
>   		.name = "intf_3", .id = INTF_3,
>   		.base = 0x6b800, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index 37d18803af4b850c40ab855b1f13db96f3ee96ea..4b61bc7eb79f00a184c95b2319b737fcee6c4cbb 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -309,7 +309,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
>   	{
>   		.name = "intf_0", .id = INTF_0,
>   		.base = 0x6a000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -318,7 +317,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
>   	}, {
>   		.name = "intf_1", .id = INTF_1,
>   		.base = 0x6a800, .len = 0x2bc,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -328,7 +326,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
>   	}, {
>   		.name = "intf_2", .id = INTF_2,
>   		.base = 0x6b000, .len = 0x2bc,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -340,7 +337,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
>   	{
>   		.name = "intf_3", .id = INTF_3,
>   		.base = 0x6b800, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = 999,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -349,7 +345,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
>   	}, {
>   		.name = "intf_4", .id = INTF_4,
>   		.base = 0x6c000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -358,7 +353,6 @@ static const struct dpu_intf_cfg sc8180x_intf[] = {
>   	}, {
>   		.name = "intf_5", .id = INTF_5,
>   		.base = 0x6c800, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_2,
>   		.prog_fetch_lines_worst_case = 24,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> index 41b43fb258508f1a5f285c88a3c1dc2f5f271cd0..2e7ae68f7e922e9b71d79627806042f645cb4ad2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> @@ -210,7 +210,6 @@ static const struct dpu_intf_cfg sm7150_intf[] = {
>   	{
>   		.name = "intf_0", .id = INTF_0,
>   		.base = 0x6a000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -219,7 +218,6 @@ static const struct dpu_intf_cfg sm7150_intf[] = {
>   	}, {
>   		.name = "intf_1", .id = INTF_1,
>   		.base = 0x6a800, .len = 0x2bc,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -229,7 +227,6 @@ static const struct dpu_intf_cfg sm7150_intf[] = {
>   	}, {
>   		.name = "intf_2", .id = INTF_2,
>   		.base = 0x6b000, .len = 0x2bc,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -239,7 +236,6 @@ static const struct dpu_intf_cfg sm7150_intf[] = {
>   	}, {
>   		.name = "intf_3", .id = INTF_3,
>   		.base = 0x6b800, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> index d44db988a6e2f443803a422846f817779d382b2a..a99c99ca37703cc3a7d4403d3f026f234b693319 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> @@ -175,7 +175,6 @@ static const struct dpu_intf_cfg sm6150_intf[] = {
>   	{
>   		.name = "intf_0", .id = INTF_0,
>   		.base = 0x6a000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -184,7 +183,6 @@ static const struct dpu_intf_cfg sm6150_intf[] = {
>   	}, {
>   		.name = "intf_1", .id = INTF_1,
>   		.base = 0x6a800, .len = 0x2c0,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -194,7 +192,6 @@ static const struct dpu_intf_cfg sm6150_intf[] = {
>   	}, {
>   		.name = "intf_3", .id = INTF_3,
>   		.base = 0x6b800, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> index 6e571480c4a44b4f4663574c31270657b9a06a7a..72f1328deda87ccc0b97f3f03d5840a77426b2b7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> @@ -152,7 +152,6 @@ static const struct dpu_intf_cfg sm6125_intf[] = {
>   	{
>   		.name = "intf_0", .id = INTF_0,
>   		.base = 0x6a000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -161,7 +160,6 @@ static const struct dpu_intf_cfg sm6125_intf[] = {
>   	}, {
>   		.name = "intf_1", .id = INTF_1,
>   		.base = 0x6a800, .len = 0x2c0,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = 0,
>   		.prog_fetch_lines_worst_case = 24,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index 6f9dc261e667fca3e94ec24e00d45f9af46e401e..aee4adb3b73d2efb074abc58dff7d213a73207d9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -284,7 +284,6 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
>   	{
>   		.name = "intf_0", .id = INTF_0,
>   		.base = 0x6a000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -293,7 +292,6 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
>   	}, {
>   		.name = "intf_1", .id = INTF_1,
>   		.base = 0x6a800, .len = 0x2c0,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -303,7 +301,6 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
>   	}, {
>   		.name = "intf_2", .id = INTF_2,
>   		.base = 0x6b000, .len = 0x2c0,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -313,7 +310,6 @@ static const struct dpu_intf_cfg sm8250_intf[] = {
>   	}, {
>   		.name = "intf_3", .id = INTF_3,
>   		.base = 0x6b800, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index 373c7d605a04a1fc72f45e993ec176e8f5e015fe..05c0f81b263c4a9aab8adbfa487f6cd20ce94079 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -129,7 +129,6 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
>   	{
>   		.name = "intf_0", .id = INTF_0,
>   		.base = 0x6a000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -138,7 +137,6 @@ static const struct dpu_intf_cfg sc7180_intf[] = {
>   	}, {
>   		.name = "intf_1", .id = INTF_1,
>   		.base = 0x6a800, .len = 0x2c0,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> index 1cf9f99d0542cf7037d2a9672d51ca7c437c364e..b729a01e8ff8443721bf993726ae9ebe21e89440 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
> @@ -87,7 +87,6 @@ static const struct dpu_intf_cfg sm6115_intf[] = {
>   	{
>   		.name = "intf_1", .id = INTF_1,
>   		.base = 0x6a800, .len = 0x2c0,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> index a3db71676f468526ea129c4b8465fb2c47885162..25f56c55f373ef5e57082448bc1a1d1d17968b06 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> @@ -160,7 +160,6 @@ static const struct dpu_intf_cfg sm6350_intf[] = {
>   	{
>   		.name = "intf_0", .id = INTF_0,
>   		.base = 0x6a000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 35,
> @@ -169,7 +168,6 @@ static const struct dpu_intf_cfg sm6350_intf[] = {
>   	}, {
>   		.name = "intf_1", .id = INTF_1,
>   		.base = 0x6a800, .len = 0x2c0,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 35,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> index 719cfaa98ab9e735d9255d9a5f1a4275739b4b1d..20b12a68fb9dfe0291486ca827c6ca25a1711014 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
> @@ -87,7 +87,6 @@ static const struct dpu_intf_cfg qcm2290_intf[] = {
>   	{
>   		.name = "intf_1", .id = INTF_1,
>   		.base = 0x6a800, .len = 0x2c0,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> index 04cdda85e6828a83e99d146ee9d9f809f1acc007..6935ff7da3162dd7b86f3786b0f604d113e51649 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> @@ -97,7 +97,6 @@ static const struct dpu_intf_cfg sm6375_intf[] = {
>   	{
>   		.name = "intf_1", .id = INTF_1,
>   		.base = 0x6a800, .len = 0x2c0,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index 3c6da0acdc3b81db65e2544f16d90322fe7e92a6..b6b1a4383efa72fc0bc8a6feac1c3adb7773ba42 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -308,7 +308,6 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
>   	{
>   		.name = "intf_0", .id = INTF_0,
>   		.base = 0x34000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -317,7 +316,6 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
>   	}, {
>   		.name = "intf_1", .id = INTF_1,
>   		.base = 0x35000, .len = 0x2c4,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -327,7 +325,6 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
>   	}, {
>   		.name = "intf_2", .id = INTF_2,
>   		.base = 0x36000, .len = 0x2c4,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -337,7 +334,6 @@ static const struct dpu_intf_cfg sm8350_intf[] = {
>   	}, {
>   		.name = "intf_3", .id = INTF_3,
>   		.base = 0x37000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 2ee29c56224596b3786104090290b88cecf7b223..d1dd895acbf666ceab39f9c38ae11bda100b5953 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -178,7 +178,6 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
>   	{
>   		.name = "intf_0", .id = INTF_0,
>   		.base = 0x34000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -187,7 +186,6 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
>   	}, {
>   		.name = "intf_1", .id = INTF_1,
>   		.base = 0x35000, .len = 0x2c4,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -197,7 +195,6 @@ static const struct dpu_intf_cfg sc7280_intf[] = {
>   	}, {
>   		.name = "intf_5", .id = INTF_5,
>   		.base = 0x39000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 2f20d0014a94e707a5f0548fc1c6bf0983b0cad0..481d36b80c4eddda53d2f9963392d9499f966792 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -304,7 +304,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
>   	{
>   		.name = "intf_0", .id = INTF_0,
>   		.base = 0x34000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -313,7 +312,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
>   	}, {
>   		.name = "intf_1", .id = INTF_1,
>   		.base = 0x35000, .len = 0x300,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -323,7 +321,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
>   	}, {
>   		.name = "intf_2", .id = INTF_2,
>   		.base = 0x36000, .len = 0x300,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -333,7 +330,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
>   	}, {
>   		.name = "intf_3", .id = INTF_3,
>   		.base = 0x37000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_NONE,
>   		.controller_id = MSM_DP_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -342,7 +338,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
>   	}, {
>   		.name = "intf_4", .id = INTF_4,
>   		.base = 0x38000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -351,7 +346,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
>   	}, {
>   		.name = "intf_5", .id = INTF_5,
>   		.base = 0x39000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_3,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -360,7 +354,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
>   	}, {
>   		.name = "intf_6", .id = INTF_6,
>   		.base = 0x3a000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_2,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -369,7 +362,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
>   	}, {
>   		.name = "intf_7", .id = INTF_7,
>   		.base = 0x3b000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_NONE,
>   		.controller_id = MSM_DP_CONTROLLER_2,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -378,7 +370,6 @@ static const struct dpu_intf_cfg sc8280xp_intf[] = {
>   	}, {
>   		.name = "intf_8", .id = INTF_8,
>   		.base = 0x3c000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_NONE,
>   		.controller_id = MSM_DP_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 314875e2dca96b3b5c40aae0d15fb80da8ebd42c..32649f25fdcbc1fe45d7028352dfd4c0daa11d84 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -324,7 +324,6 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
>   	{
>   		.name = "intf_0", .id = INTF_0,
>   		.base = 0x34000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -333,7 +332,6 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
>   	}, {
>   		.name = "intf_1", .id = INTF_1,
>   		.base = 0x35000, .len = 0x300,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -343,7 +341,6 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
>   	}, {
>   		.name = "intf_2", .id = INTF_2,
>   		.base = 0x36000, .len = 0x300,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -353,7 +350,6 @@ static const struct dpu_intf_cfg sm8450_intf[] = {
>   	}, {
>   		.name = "intf_3", .id = INTF_3,
>   		.base = 0x37000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> index 36775f444af4b2654231cd9456ac4eea1f0f18e6..4679b7e47d50e21d5b6df69fd0479b804ac69979 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> @@ -334,7 +334,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>   	{
>   		.name = "intf_0", .id = INTF_0,
>   		.base = 0x34000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -343,7 +342,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>   	}, {
>   		.name = "intf_1", .id = INTF_1,
>   		.base = 0x35000, .len = 0x300,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -353,7 +351,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>   	}, {
>   		.name = "intf_2", .id = INTF_2,
>   		.base = 0x36000, .len = 0x300,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -363,7 +360,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>   	}, {
>   		.name = "intf_3", .id = INTF_3,
>   		.base = 0x37000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_NONE,
>   		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>   		.prog_fetch_lines_worst_case = 24,
> @@ -372,7 +368,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>   	}, {
>   		.name = "intf_4", .id = INTF_4,
>   		.base = 0x38000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -381,7 +376,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>   	}, {
>   		.name = "intf_6", .id = INTF_6,
>   		.base = 0x3A000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_NONE,
>   		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>   		.prog_fetch_lines_worst_case = 24,
> @@ -390,7 +384,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>   	}, {
>   		.name = "intf_7", .id = INTF_7,
>   		.base = 0x3b000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_NONE,
>   		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>   		.prog_fetch_lines_worst_case = 24,
> @@ -399,7 +392,6 @@ static const struct dpu_intf_cfg sa8775p_intf[] = {
>   	}, {
>   		.name = "intf_8", .id = INTF_8,
>   		.base = 0x3c000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_NONE,
>   		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
>   		.prog_fetch_lines_worst_case = 24,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index 624f24c8a33a182634d49058014fc3175f5ac9d3..def7c161d787d9cecd219b4db0482158d3e5bc12 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -319,7 +319,6 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
>   	{
>   		.name = "intf_0", .id = INTF_0,
>   		.base = 0x34000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -328,7 +327,6 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
>   	}, {
>   		.name = "intf_1", .id = INTF_1,
>   		.base = 0x35000, .len = 0x300,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -338,7 +336,6 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
>   	}, {
>   		.name = "intf_2", .id = INTF_2,
>   		.base = 0x36000, .len = 0x300,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -348,7 +345,6 @@ static const struct dpu_intf_cfg sm8550_intf[] = {
>   	}, {
>   		.name = "intf_3", .id = INTF_3,
>   		.base = 0x37000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> index 857dc8465bf5571cd08cf3115fb96002873c004b..979a674517d8b270309a4ce92534face0f2ba855 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> @@ -319,7 +319,6 @@ static const struct dpu_intf_cfg sar2130p_intf[] = {
>   	{
>   		.name = "intf_0", .id = INTF_0,
>   		.base = 0x34000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -328,7 +327,6 @@ static const struct dpu_intf_cfg sar2130p_intf[] = {
>   	}, {
>   		.name = "intf_1", .id = INTF_1,
>   		.base = 0x35000, .len = 0x300,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -338,7 +336,6 @@ static const struct dpu_intf_cfg sar2130p_intf[] = {
>   	}, {
>   		.name = "intf_2", .id = INTF_2,
>   		.base = 0x36000, .len = 0x300,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -348,7 +345,6 @@ static const struct dpu_intf_cfg sar2130p_intf[] = {
>   	}, {
>   		.name = "intf_3", .id = INTF_3,
>   		.base = 0x37000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> index 05b0962c2d937f077d0b42fa8af6e2da40c7dcae..ffee0740ddb5c13dbbd2ca0d70855cba27f73ca6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> @@ -320,7 +320,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
>   	{
>   		.name = "intf_0", .id = INTF_0,
>   		.base = 0x34000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -329,7 +328,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
>   	}, {
>   		.name = "intf_1", .id = INTF_1,
>   		.base = 0x35000, .len = 0x300,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_0,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -339,7 +337,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
>   	}, {
>   		.name = "intf_2", .id = INTF_2,
>   		.base = 0x36000, .len = 0x300,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DSI,
>   		.controller_id = MSM_DSI_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -349,7 +346,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
>   	}, {
>   		.name = "intf_3", .id = INTF_3,
>   		.base = 0x37000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_NONE,
>   		.controller_id = MSM_DP_CONTROLLER_0,	/* pair with intf_0 for DP MST */
>   		.prog_fetch_lines_worst_case = 24,
> @@ -358,7 +354,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
>   	}, {
>   		.name = "intf_4", .id = INTF_4,
>   		.base = 0x38000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_1,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -367,7 +362,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
>   	}, {
>   		.name = "intf_5", .id = INTF_5,
>   		.base = 0x39000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_3,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -376,7 +370,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
>   	}, {
>   		.name = "intf_6", .id = INTF_6,
>   		.base = 0x3A000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_DP,
>   		.controller_id = MSM_DP_CONTROLLER_2,
>   		.prog_fetch_lines_worst_case = 24,
> @@ -385,7 +378,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
>   	}, {
>   		.name = "intf_7", .id = INTF_7,
>   		.base = 0x3b000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_NONE,
>   		.controller_id = MSM_DP_CONTROLLER_2,	/* pair with intf_6 for DP MST */
>   		.prog_fetch_lines_worst_case = 24,
> @@ -394,7 +386,6 @@ static const struct dpu_intf_cfg x1e80100_intf[] = {
>   	}, {
>   		.name = "intf_8", .id = INTF_8,
>   		.base = 0x3c000, .len = 0x280,
> -		.features = INTF_SC7180_MASK,
>   		.type = INTF_NONE,
>   		.controller_id = MSM_DP_CONTROLLER_1,	/* pair with intf_4 for DP MST */
>   		.prog_fetch_lines_worst_case = 24,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 4482f2fe6f04e58408b55994d885ea1c717c6a07..df1eeb9082f74ab734c235f0cd0baf8c0eda14b5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -104,9 +104,6 @@
>   #define PINGPONG_SM8150_MASK \
>   	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
>   
> -#define INTF_SC7180_MASK \
> -	(BIT(DPU_INTF_INPUT_CTRL))
> -
>   #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
>   			 BIT(DPU_WB_UBWC) | \
>   			 BIT(DPU_WB_YUV_CONFIG) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index e1c6df3a3b72ffb5a816bd18266a35abe723fbd9..bc71ec9a5bc8b6e15d7af13c42ba5d4197729822 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -139,17 +139,6 @@ enum {
>   	DPU_CTL_MAX
>   };
>   
> -/**
> - * INTF sub-blocks
> - * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
> - *                                  pixel data arrives to this INTF
> - * @DPU_INTF_MAX
> - */
> -enum {
> -	DPU_INTF_INPUT_CTRL = 0x1,
> -	DPU_INTF_MAX
> -};
> -
>   /**
>     * WB sub-blocks and features
>     * @DPU_WB_LINE_MODE        Writeback module supports line/linear mode
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 54c2e984ef0ce604e3eda49595d2816ea41bd7fd..a80ac82a96255da1d52e1f2fa7fc39388fc3782b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -588,7 +588,7 @@ struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
>   	c->ops.setup_misr = dpu_hw_intf_setup_misr;
>   	c->ops.collect_misr = dpu_hw_intf_collect_misr;
>   
> -	if (cfg->features & BIT(DPU_INTF_INPUT_CTRL))
> +	if (mdss_rev->core_major_ver >= 5)
>   		c->ops.bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
>   
>   	/* INTF TE is only for DSI interfaces */
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
