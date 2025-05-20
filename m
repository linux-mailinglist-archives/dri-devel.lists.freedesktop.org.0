Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6E5ABD157
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 10:04:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85ECE10E413;
	Tue, 20 May 2025 08:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oYAQ0Z3/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E64F710E413
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 08:04:37 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43cfebc343dso39534065e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 01:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747728276; x=1748333076; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=nsCw49AzZ93CgoYb0m1yC/n/Gw3MHEgFticB37uAwIU=;
 b=oYAQ0Z3/OHkfYnQUsAwVkiP5ylh2u6HwVgeKjbkF3S3YwJc07fH2c1n7r5jbe7q0mB
 gYTyvdYc6kRvvZYYYvycFqY1/8UFLTX+5/FAnZam2rQq1sG+rNUEwvrlpFLAr7uzrlVq
 E/MNL+UohOHbG/D08AR01bWYHMFrop24xbLIGmU8LYLLJyUrVZpsJgHHW8dMOyHjJwdG
 KR8qns8460b6N3aENGoVedk89wMLD6FOiX3Vs1tsPQb9v0/s+UkD0hz4v5BZdGOrjOGc
 JPRDAX8/+8lRG09+MhEpPuv9wyD8+PtYGTJDKZ/ma9jmBHqGqDbXlo0N1AfJh2Q6jSJq
 Wmeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747728276; x=1748333076;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nsCw49AzZ93CgoYb0m1yC/n/Gw3MHEgFticB37uAwIU=;
 b=BTFfpaNpiUYxE5rSqAOnLfzSYHj2lI10Un7Roy0FT4UGQgZIuiYiJB6qGY5/9fd0dE
 SPXoDydkpwlqzh/sU9bxkU7ynDtAyJ+JLLTCzeDqW5/AwmCa+J8xXaeX7CFQ5fvS/1JP
 z5Q55HcqzimtNx/OesneaHYEJ1bgVys3qWDL963VUssulvYasDvxT4jTJa0bMEF83uuf
 wmWfNGqK6sJqGJCH9Qqd5OXkK0kKygu+it19F0g+Dk3PSLKDvebtCBE+zlcOPQl8p1/j
 6Vk6otJ9sW4EHRBh1ltJ0+WUvle8wkmdVw6KLuzwm6xIFYRjnaeU2aEtVzi4X0gHoJK5
 eY1A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUkgezzfocrMTSIrW16yMgtJ7eQnqLs3tWMB4QBPfYgBVso0nft3cQNBw3gpkbBPPHBWXFHgPBlG60=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuxTefg9gLc+Yyv11HN7ki+dFjXWAu+Ig36ezTj73tGiWELMCl
 22fzpaLoaZfnM1U31x49CPawB/LCuly/JjCutsFcka6wWY0iz0Qpm8jMdrBhu78SHUE=
X-Gm-Gg: ASbGnct1I0k2vvqFhEv332NwlqBwo8uDcaYuf8pcaLjmzuH16kVXrUtTjaigiVziOtx
 QRNLJSXVRSjm4gMoulek1VML9iXcEw2WmfJ6R+MLEayxdw+8tBkzpHhPdIHDJyYCd7Dv+sdAW9B
 iqbCB+gR2m7J1HJm5+Dw7vjxbWCl2OHilfC31Vs6aH9qDz15f8pQdY6aZug/P7ImCf+e9ZE9HI2
 OAUqZN33KrQxUHtPUjaY8T0bdKXavcRDiaGcwkascKG+ewb5fk15vso0dS6m4GJtoFHXYpwsm7A
 o2r97O3pZDujcuqtbT8U95f3ded+k+MbpumQ8eQk2do40I7Z2CRNqDcqJ8d0H4K0ZeDufyZ/A8q
 tZcqTOE75qOpqSpgZ4H+RYFYCDGTE
X-Google-Smtp-Source: AGHT+IGzkE7LtvZ8XO8M5qS6SZ4XvqkgcIuyzXtLU3CMAvcOVKO72aJc5vRUmte7/yKJtWkfH4+cjg==
X-Received: by 2002:a05:600c:35c8:b0:441:d43d:4f68 with SMTP id
 5b1f17b1804b1-442fd63c6b7mr169374425e9.15.1747728276322; 
 Tue, 20 May 2025 01:04:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a3643e24e2sm13174633f8f.79.2025.05.20.01.04.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 01:04:36 -0700 (PDT)
Message-ID: <7809bd16-f415-4843-aadc-59114d142073@linaro.org>
Date: Tue, 20 May 2025 10:04:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 25/30] drm/msm/dpu: get rid of DPU_WB_INPUT_CTRL
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-25-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-25-6c5e88e31383@oss.qualcomm.com>
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
> Continue migration to the MDSS-revision based checks and replace
> DPU_WB_INPUT_CTRL feature bit with the core_major_ver >= 5 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 2 +-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c           | 3 ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 3 ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c                | 2 +-
>   19 files changed, 17 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> index 013314b2e716a6d939393b77b0edc87170dba27b..56d3c38c87781edb438b277c77382848b679198f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
> @@ -318,7 +318,7 @@ static const struct dpu_wb_cfg sm8650_wb[] = {
>   	{
>   		.name = "wb_2", .id = WB_2,
>   		.base = 0x65000, .len = 0x2c8,
> -		.features = WB_SM8250_MASK,
> +		.features = WB_SDM845_MASK,
>   		.format_list = wb2_formats_rgb_yuv,
>   		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
>   		.xin_id = 6,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 5d3b864d28a86fb86fc4576210c9418604afd844..ae1b2ed96e9f10a6e7a710fc8bb4e40dec665cf9 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -275,7 +275,7 @@ static const struct dpu_wb_cfg sm8150_wb[] = {
>   	{
>   		.name = "wb_2", .id = WB_2,
>   		.base = 0x65000, .len = 0x2c8,
> -		.features = WB_SM8250_MASK,
> +		.features = WB_SDM845_MASK,
>   		.format_list = wb2_formats_rgb_yuv,
>   		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
>   		.clk_ctrl = DPU_CLK_CTRL_WB2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index a6e9dfc583f283d752545b3f700c3d509e2a2965..fc80406759cd52f0d633927c8ba876feaff48e07 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -281,7 +281,7 @@ static const struct dpu_wb_cfg sc8180x_wb[] = {
>   	{
>   		.name = "wb_2", .id = WB_2,
>   		.base = 0x65000, .len = 0x2c8,
> -		.features = WB_SM8250_MASK,
> +		.features = WB_SDM845_MASK,
>   		.format_list = wb2_formats_rgb_yuv,
>   		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
>   		.clk_ctrl = DPU_CLK_CTRL_WB2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> index fe9c9301e3d9d2d3a0a34ab9aed0f307d08c34ca..a56c288ac10cd3dfe8d49a6e476b9fff062f8003 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> @@ -241,7 +241,7 @@ static const struct dpu_wb_cfg sm7150_wb[] = {
>   	{
>   		.name = "wb_2", .id = WB_2,
>   		.base = 0x65000, .len = 0x2c8,
> -		.features = WB_SM8250_MASK,
> +		.features = WB_SDM845_MASK,
>   		.format_list = wb2_formats_rgb_yuv,
>   		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
>   		.clk_ctrl = DPU_CLK_CTRL_WB2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> index 8fb926bff36d32fb4ce1036cb69513599dc7b6b7..a065f102ce592311376f1186add7a47dca7fd84f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
> @@ -154,7 +154,7 @@ static const struct dpu_wb_cfg sm6150_wb[] = {
>   	{
>   		.name = "wb_2", .id = WB_2,
>   		.base = 0x65000, .len = 0x2c8,
> -		.features = WB_SM8250_MASK,
> +		.features = WB_SDM845_MASK,
>   		.format_list = wb2_formats_rgb_yuv,
>   		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
>   		.clk_ctrl = DPU_CLK_CTRL_WB2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> index 5c2c8c5f812347970c534769d72f9699e6e7049a..2950245e7b3f5e38f3f501a7314bb97c66d05982 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
> @@ -133,7 +133,7 @@ static const struct dpu_wb_cfg sm6125_wb[] = {
>   	{
>   		.name = "wb_2", .id = WB_2,
>   		.base = 0x65000, .len = 0x2c8,
> -		.features = WB_SM8250_MASK,
> +		.features = WB_SDM845_MASK,
>   		.format_list = wb2_formats_rgb_yuv,
>   		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
>   		.clk_ctrl = DPU_CLK_CTRL_WB2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index 9ceff398fd6f554085440f509b6f8398b4fbf304..7b8b7a1c2d767eafca7e7440098bb28e2e108902 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -312,7 +312,7 @@ static const struct dpu_wb_cfg sm8250_wb[] = {
>   	{
>   		.name = "wb_2", .id = WB_2,
>   		.base = 0x65000, .len = 0x2c8,
> -		.features = WB_SM8250_MASK,
> +		.features = WB_SDM845_MASK,
>   		.format_list = wb2_formats_rgb_yuv,
>   		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
>   		.clk_ctrl = DPU_CLK_CTRL_WB2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> index f6a0f1a39dcc3c9e82c07889d71905434274cdf9..c990ba3b5db02d65934179d5ad42bd740f6944b2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
> @@ -148,7 +148,7 @@ static const struct dpu_wb_cfg sc7180_wb[] = {
>   	{
>   		.name = "wb_2", .id = WB_2,
>   		.base = 0x65000, .len = 0x2c8,
> -		.features = WB_SM8250_MASK,
> +		.features = WB_SDM845_MASK,
>   		.format_list = wb2_formats_rgb_yuv,
>   		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
>   		.clk_ctrl = DPU_CLK_CTRL_WB2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> index a46e9e3ff565ba5ef233af76f1c6cebb1d0c318a..093d16bdc450af348da1775ff017d982236b11b0 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> @@ -142,7 +142,7 @@ static const struct dpu_wb_cfg sm6350_wb[] = {
>   	{
>   		.name = "wb_2", .id = WB_2,
>   		.base = 0x65000, .len = 0x2c8,
> -		.features = WB_SM8250_MASK,
> +		.features = WB_SDM845_MASK,
>   		.format_list = wb2_formats_rgb_yuv,
>   		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
>   		.clk_ctrl = DPU_CLK_CTRL_WB2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> index b4d41e2644349bdbdbdacbe1e9b3748f90df4f3b..85aae40c210f3aa1b29bf0b5ea81ee1f551a6ef6 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
> @@ -285,7 +285,7 @@ static const struct dpu_wb_cfg sm8350_wb[] = {
>   	{
>   		.name = "wb_2", .id = WB_2,
>   		.base = 0x65000, .len = 0x2c8,
> -		.features = WB_SM8250_MASK,
> +		.features = WB_SDM845_MASK,
>   		.format_list = wb2_formats_rgb_yuv,
>   		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
>   		.clk_ctrl = DPU_CLK_CTRL_WB2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> index 5d88f0261d8320a78f8d64c9bb68b938f83160a0..8f978b9c345202d3ea1a7781e4ef2763b46c6f6e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
> @@ -159,7 +159,7 @@ static const struct dpu_wb_cfg sc7280_wb[] = {
>   	{
>   		.name = "wb_2", .id = WB_2,
>   		.base = 0x65000, .len = 0x2c8,
> -		.features = WB_SM8250_MASK,
> +		.features = WB_SDM845_MASK,
>   		.format_list = wb2_formats_rgb_yuv,
>   		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
>   		.clk_ctrl = DPU_CLK_CTRL_WB2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 3c0728a4b37ea6af25ab64315cfe63ba6f8d2774..b09a6af4c474aa9301c0ef6bc0ce71ba42cce3a2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -298,7 +298,7 @@ static const struct dpu_wb_cfg sm8450_wb[] = {
>   	{
>   		.name = "wb_2", .id = WB_2,
>   		.base = 0x65000, .len = 0x2c8,
> -		.features = WB_SM8250_MASK,
> +		.features = WB_SDM845_MASK,
>   		.format_list = wb2_formats_rgb_yuv,
>   		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
>   		.clk_ctrl = DPU_CLK_CTRL_WB2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> index b8a1646395916fde04b9750cf548edca5729d9c2..0f7b4a224e4c971f482c3778c92e8c170b44223f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
> @@ -305,7 +305,7 @@ static const struct dpu_wb_cfg sa8775p_wb[] = {
>   	{
>   		.name = "wb_2", .id = WB_2,
>   		.base = 0x65000, .len = 0x2c8,
> -		.features = WB_SM8250_MASK,
> +		.features = WB_SDM845_MASK,
>   		.format_list = wb2_formats_rgb_yuv,
>   		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
>   		.clk_ctrl = DPU_CLK_CTRL_WB2,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> index ef22a9adf43ddc9d15be5f1359ea5f6690e9f27c..465b6460f8754df18bbcf4baac2f8a3ebdea3324 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
> @@ -294,7 +294,7 @@ static const struct dpu_wb_cfg sm8550_wb[] = {
>   	{
>   		.name = "wb_2", .id = WB_2,
>   		.base = 0x65000, .len = 0x2c8,
> -		.features = WB_SM8250_MASK,
> +		.features = WB_SDM845_MASK,
>   		.format_list = wb2_formats_rgb_yuv,
>   		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
>   		.xin_id = 6,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> index 2e7d4403835353927bc85a5acd3e6c5967cac455..6caa7d40f368802793c8690544c1c82b49a617cd 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
> @@ -294,7 +294,7 @@ static const struct dpu_wb_cfg sar2130p_wb[] = {
>   	{
>   		.name = "wb_2", .id = WB_2,
>   		.base = 0x65000, .len = 0x2c8,
> -		.features = WB_SM8250_MASK,
> +		.features = WB_SDM845_MASK,
>   		.format_list = wb2_formats_rgb_yuv,
>   		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
>   		.xin_id = 6,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> index ac95d46b3ecf2d95ec0d516a79567fe9c204b5f6..7243eebb85f36f2a8ae848f2c95d21b0bc3bebef 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
> @@ -294,7 +294,7 @@ static const struct dpu_wb_cfg x1e80100_wb[] = {
>   	{
>   		.name = "wb_2", .id = WB_2,
>   		.base = 0x65000, .len = 0x2c8,
> -		.features = WB_SM8250_MASK,
> +		.features = WB_SDM845_MASK,
>   		.format_list = wb2_formats_rgb_yuv,
>   		.num_formats = ARRAY_SIZE(wb2_formats_rgb_yuv),
>   		.xin_id = 6,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index ad0460aa5b5ce5a373dab18c89e4159855da4d2b..6d7be74bafe326a1998a69ed9b3495c5acf6350f 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -98,9 +98,6 @@
>   			 BIT(DPU_WB_QOS_8LVL) | \
>   			 BIT(DPU_WB_CDP))
>   
> -#define WB_SM8250_MASK (WB_SDM845_MASK | \
> -			 BIT(DPU_WB_INPUT_CTRL))
> -
>   #define DEFAULT_PIXEL_RAM_SIZE		(50 * 1024)
>   #define DEFAULT_DPU_LINE_WIDTH		2048
>   #define DEFAULT_DPU_OUTPUT_LINE_WIDTH	2560
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 41906dadff5a8ef39b2e90f3e80bb699a5cf59b7..8c394e7d6496ca2d120c81c7776b4b979368be23 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -140,8 +140,6 @@ enum {
>     * @DPU_WB_QOS,             Writeback supports QoS control, danger/safe/creq
>     * @DPU_WB_QOS_8LVL,        Writeback supports 8-level QoS control
>     * @DPU_WB_CDP              Writeback supports client driven prefetch
> -  * @DPU_WB_INPUT_CTRL       Writeback supports from which pp block input pixel
> -  *                          data arrives.
>     * @DPU_WB_CROP             CWB supports cropping
>     * @DPU_WB_MAX              maximum value
>     */
> @@ -155,7 +153,6 @@ enum {
>   	DPU_WB_QOS,
>   	DPU_WB_QOS_8LVL,
>   	DPU_WB_CDP,
> -	DPU_WB_INPUT_CTRL,
>   	DPU_WB_CROP,
>   	DPU_WB_MAX
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> index 4853e516c48733231de240b9c32ad51d4cf18f0d..478a091aeccfc7cf298798e1c119df56737e3dc4 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> @@ -208,7 +208,7 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
>   	if (test_bit(DPU_WB_CDP, &features))
>   		ops->setup_cdp = dpu_hw_wb_setup_cdp;
>   
> -	if (test_bit(DPU_WB_INPUT_CTRL, &features))
> +	if (mdss_rev->core_major_ver >= 5)
>   		ops->bind_pingpong_blk = dpu_hw_wb_bind_pingpong_blk;
>   
>   	if (mdss_rev->core_major_ver >= 9)
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
