Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 111D1ABD152
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 10:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FC4010E3F8;
	Tue, 20 May 2025 08:04:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hCHllycU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1A410E3F8
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 08:04:21 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so37482585e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 01:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747728260; x=1748333060; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=ZT3Qbuyww3zD6SP/852xLoIPm4HK9ykzMmQpV3AYecw=;
 b=hCHllycUpJZJQtbgK3ozYS5leNWjOSZmDn9R5rM41vrnp+LSHwZFzy6V2ulyVd7aWE
 T6+ixKzhidAKBdC2tvb4iUEope2wgt937HAkiwG73NR9j0DckqQRJknOGxHET1VASf3l
 oKQir3gKOwtalnGyMdYeelNgWh4L2grd/Fu3Rs+DXhDedYjJ60rau4rQHOOC8DEUVTWm
 CqlSbNuwtUYz5Ulf4l0wFhLZQHzpr6acWbItwV+WZFaeCwAFHdf3XnN7b1iriH0XIjis
 0rR9xj8n09HWlrjfHc3jw/+ooMDHXL7bjJztQdSjAyzPJwmiBFXesiZcVL7fjJRXJgH7
 FzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747728260; x=1748333060;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=ZT3Qbuyww3zD6SP/852xLoIPm4HK9ykzMmQpV3AYecw=;
 b=hlJLW+BPAw+5KJQSaXBzQ03eYP/ishoZ9fkXLTR9IkUlqZk2eGXUCQZmRnHH7XIruN
 ZyspDpR+Um7a4Sw1JBa53nHubAzxWBYjDPiKH6u6AjVO8I8KmwGxe3Yi3h6CbDpwxqaE
 +2qs9J1aUMcQpEBlmT4nG/mJ8qX2ZZqDRLBiNKwVLSMnwUa97JhRyGocsQQUZS3WxjrX
 I/DmqWfI9NEMforn9l4mvV0LnYjqKWYzUtAeLpIKHmCRpVnfscH/PyUUh4K/8v1W8AgR
 ZzDQ2b/U47l2izQC/xG/1aQn9ZxxUNIhutSDZN851wH4EuM8Li8ek/X360H8uC61D5CN
 13ag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoy1YOjvpIsXX6sBgGMRWRkW67ogz+dpCgU5ef5bNXIKocgHz+pcQBcDl1pqqLKrIScNIrOMHKORs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqDDa3F2/8nDqiZEKjhBB8F+Xy5CgocMaTEV8pX3LR8Wi/W5k8
 /j/fCy2lUoD/vvG8eJon5uyzUFLkgF+xPl2ygTMRu4E/InMWNQ/Uf0xIeSD0ZyW8mYE=
X-Gm-Gg: ASbGncvkYN7ERy8Q9K7q3/5Pg08sPvNuMHdRUuaJeUPInZgd1rJWtkLv56ovnO+FOYv
 D/8+GiQ1XmC5ZmaTx2hwFZj5uAskSNwmebcC26890lZzFMmweKYil5+9qv8inLjr7/qI1AkS3mx
 3OQ+BlqbWw9hS8ttfmvCWNM1gNqUqHIlEBNm7Y/z3pA2S+wQzmUxZ/d011g6rfHw6AnYeOd9Mlt
 HCjCzZGjkqS1gmU/Pii2KmNPRizUCi5iv6S5DIpEPzzNZKlVfO63FYIJSNCh8lUq+YtQwFIxPTx
 BEA+CLUKX/Eg0FyOKAcKQHiJIgTKsMv/uk6JEqxTzaZwPYgAE7EYiv/cLH+Kux6QJkpBf/mj0yP
 PE3x7XTF5B4MTt9fWUdk5Z+Kjnhm0
X-Google-Smtp-Source: AGHT+IEeqEPxxZs+IALra2ZtAXS7x3Zlm8s+uIf3mG9D/idKtSxoDH+FZ2QB2fJdXVYTvXrOuP1IeA==
X-Received: by 2002:a05:600c:8709:b0:43b:ca8c:fca3 with SMTP id
 5b1f17b1804b1-442fd97a524mr156697605e9.11.1747728260223; 
 Tue, 20 May 2025 01:04:20 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-447f1825193sm21423565e9.5.2025.05.20.01.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 01:04:19 -0700 (PDT)
Message-ID: <f37f116b-2263-4d6f-8071-2af49374af6e@linaro.org>
Date: Tue, 20 May 2025 10:04:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 24/30] drm/msm/dpu: get rid of DPU_DSC_OUTPUT_CTRL
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-24-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-24-6c5e88e31383@oss.qualcomm.com>
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
> DPU_DSC_OUTPUT_CTRL feature bit with the core_major_ver >= 5 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 6 ------
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 2 --
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h  | 4 ----
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  | 1 -
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 5 +----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c              | 6 ++++--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h              | 3 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c                  | 2 +-
>   10 files changed, 8 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> index 8e37c40620b62aacdcb47c7a04bcfce944ab0b4c..5d3b864d28a86fb86fc4576210c9418604afd844 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
> @@ -259,19 +259,15 @@ static const struct dpu_dsc_cfg sm8150_dsc[] = {
>   	{
>   		.name = "dsc_0", .id = DSC_0,
>   		.base = 0x80000, .len = 0x140,
> -		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>   	}, {
>   		.name = "dsc_1", .id = DSC_1,
>   		.base = 0x80400, .len = 0x140,
> -		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>   	}, {
>   		.name = "dsc_2", .id = DSC_2,
>   		.base = 0x80800, .len = 0x140,
> -		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>   	}, {
>   		.name = "dsc_3", .id = DSC_3,
>   		.base = 0x80c00, .len = 0x140,
> -		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>   	},
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> index a05d2ef8fc9d217898b8c12d4639563b28b4477b..a6e9dfc583f283d752545b3f700c3d509e2a2965 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
> @@ -259,27 +259,21 @@ static const struct dpu_dsc_cfg sc8180x_dsc[] = {
>   	{
>   		.name = "dsc_0", .id = DSC_0,
>   		.base = 0x80000, .len = 0x140,
> -		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>   	}, {
>   		.name = "dsc_1", .id = DSC_1,
>   		.base = 0x80400, .len = 0x140,
> -		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>   	}, {
>   		.name = "dsc_2", .id = DSC_2,
>   		.base = 0x80800, .len = 0x140,
> -		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>   	}, {
>   		.name = "dsc_3", .id = DSC_3,
>   		.base = 0x80c00, .len = 0x140,
> -		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>   	}, {
>   		.name = "dsc_4", .id = DSC_4,
>   		.base = 0x81000, .len = 0x140,
> -		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>   	}, {
>   		.name = "dsc_5", .id = DSC_5,
>   		.base = 0x81400, .len = 0x140,
> -		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>   	},
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> index cb0b5687b5239418f50c539447f9cfa56e81fcc6..fe9c9301e3d9d2d3a0a34ab9aed0f307d08c34ca 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
> @@ -193,11 +193,9 @@ static const struct dpu_dsc_cfg sm7150_dsc[] = {
>   	{
>   		.name = "dsc_0", .id = DSC_0,
>   		.base = 0x80000, .len = 0x140,
> -		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>   	}, {
>   		.name = "dsc_1", .id = DSC_1,
>   		.base = 0x80400, .len = 0x140,
> -		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>   	},
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> index 17fa0ef9ac03e4649a218cd837b296211ef4506c..9ceff398fd6f554085440f509b6f8398b4fbf304 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
> @@ -258,19 +258,15 @@ static const struct dpu_dsc_cfg sm8250_dsc[] = {
>   	{
>   		.name = "dsc_0", .id = DSC_0,
>   		.base = 0x80000, .len = 0x140,
> -		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>   	}, {
>   		.name = "dsc_1", .id = DSC_1,
>   		.base = 0x80400, .len = 0x140,
> -		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>   	}, {
>   		.name = "dsc_2", .id = DSC_2,
>   		.base = 0x80800, .len = 0x140,
> -		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>   	}, {
>   		.name = "dsc_3", .id = DSC_3,
>   		.base = 0x80c00, .len = 0x140,
> -		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>   	},
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> index 06bcaf4d8b0db74c349112af6884f7f3139a7ff8..a46e9e3ff565ba5ef233af76f1c6cebb1d0c318a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
> @@ -135,7 +135,6 @@ static const struct dpu_dsc_cfg sm6350_dsc[] = {
>   	{
>   		.name = "dsc_0", .id = DSC_0,
>   		.base = 0x80000, .len = 0x140,
> -		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>   	},
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> index 9c4e8450b67760c880d9bd2528c6a954a0282e08..98190ee7ec7aca6835376b030379a5a3d8b0859b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
> @@ -87,7 +87,6 @@ static const struct dpu_dsc_cfg sm6375_dsc[] = {
>   	{
>   		.name = "dsc_0", .id = DSC_0,
>   		.base = 0x80000, .len = 0x140,
> -		.features = BIT(DPU_DSC_OUTPUT_CTRL),
>   	},
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 01430ff90ab0988bdaa91b85458dd649aab543b3..41906dadff5a8ef39b2e90f3e80bb699a5cf59b7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -174,14 +174,11 @@ enum {
>   
>   /**
>    * DSC sub-blocks/features
> - * @DPU_DSC_OUTPUT_CTRL       Configure which PINGPONG block gets
> - *                            the pixel output from this DSC.
>    * @DPU_DSC_NATIVE_42x_EN     Supports NATIVE_422_EN and NATIVE_420_EN encoding
>    * @DPU_DSC_MAX
>    */
>   enum {
> -	DPU_DSC_OUTPUT_CTRL = 0x1,
> -	DPU_DSC_NATIVE_42x_EN,
> +	DPU_DSC_NATIVE_42x_EN = 0x1,
>   	DPU_DSC_MAX
>   };
>   
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> index c7db917afd27e3daf1e8aad2ad671246bf6c8fbf..3a149caa7ff4f20dc7a902033cf29a168268839e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
> @@ -186,11 +186,13 @@ static void dpu_hw_dsc_bind_pingpong_blk(
>    * @dev:  Corresponding device for devres management
>    * @cfg:  DSC catalog entry for which driver object is required
>    * @addr: Mapped register io address of MDP
> + * @mdss_ver: dpu core's major and minor versions
>    * Return: Error code or allocated dpu_hw_dsc context
>    */
>   struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
>   				   const struct dpu_dsc_cfg *cfg,
> -				   void __iomem *addr)
> +				   void __iomem *addr,
> +				   const struct dpu_mdss_version *mdss_ver)
>   {
>   	struct dpu_hw_dsc *c;
>   
> @@ -207,7 +209,7 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
>   	c->ops.dsc_disable = dpu_hw_dsc_disable;
>   	c->ops.dsc_config = dpu_hw_dsc_config;
>   	c->ops.dsc_config_thresh = dpu_hw_dsc_config_thresh;
> -	if (c->caps->features & BIT(DPU_DSC_OUTPUT_CTRL))
> +	if (mdss_ver->core_major_ver >= 5)
>   		c->ops.dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
>   
>   	return c;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> index fc171bdeca488f6287cf2ba7362ed330ad55b28f..b7013c9822d23238eb5411a5e284bb072ecc3395 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
> @@ -64,7 +64,8 @@ struct dpu_hw_dsc {
>   
>   struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
>   				   const struct dpu_dsc_cfg *cfg,
> -				   void __iomem *addr);
> +				   void __iomem *addr,
> +				   const struct dpu_mdss_version *mdss_ver);
>   
>   struct dpu_hw_dsc *dpu_hw_dsc_init_1_2(struct drm_device *dev,
>   				       const struct dpu_dsc_cfg *cfg,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index c2a659512cb747e1dd5ed9e28534286ff8d67f4f..a2219c4f55a45db894ff18c1fd0a810c1a3cf811 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -171,7 +171,7 @@ int dpu_rm_init(struct drm_device *dev,
>   		if (cat->mdss_ver->core_major_ver >= 7)
>   			hw = dpu_hw_dsc_init_1_2(dev, dsc, mmio);
>   		else
> -			hw = dpu_hw_dsc_init(dev, dsc, mmio);
> +			hw = dpu_hw_dsc_init(dev, dsc, mmio, cat->mdss_ver);
>   
>   		if (IS_ERR(hw)) {
>   			rc = PTR_ERR(hw);
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
