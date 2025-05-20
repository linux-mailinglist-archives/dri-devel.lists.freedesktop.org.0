Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92970ABD16A
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 10:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7595410E531;
	Tue, 20 May 2025 08:05:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Zdk33h3b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0837910E530
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 08:05:36 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-442f5b3c710so41940145e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 01:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747728334; x=1748333134; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=tob6RuC8dgPV7JIzMkiLHumK10RCkOp4wHKrmtVQAT8=;
 b=Zdk33h3b//P26C1J1oZC+66HNNE2Xx8NP0XIXLw/NM9Fxtd9BdpzwMXfv1XboiJmeg
 4Kfbo8OL6UIk66v9ncV4jkxObLyOGvkMRxGJvpedWdM7Wneg2yPRyVf1uEn/ccHlUwI3
 o6GXHziWAqBkycYHtpsrXndhXmjITWXtl4t0ySq3QEzXwnWHcu/4+TEKBXmpqim2qSfT
 CRVQzwmrkmGi7h6szG3a4zfy2s/eygVtfOSZzlpNVUtRnGbT2IoE0gdYqyVUYWE/yVWE
 7x3q27ulWOwXX4QjdnsvxyL1o+zN6OGl1xr2PAvd9VLwTxtit1WjDU1j2kabY8X9q4Pv
 ZMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747728334; x=1748333134;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tob6RuC8dgPV7JIzMkiLHumK10RCkOp4wHKrmtVQAT8=;
 b=ZyD+vQABpqAtIK6ooNet0MvByri5nBEFpx3t+a1K/XCuOnZa1vjw76hflJ2Le55MAI
 xQv2+HqVgWdDhY/x5ck1+FmTP212VXMTdqejk9+jgN9axiTNzH2xAe2SfYVH1tjli4ot
 9qx9F7SZoiOP2ts0hmtMHB5Gg4AwhVpXvyJ5vnj4lo8HxMazj4gcJEDXYgzHUvJPcscP
 d7FeSJ9l4dXqrozf9ZB2CCA6UHhEk1qxOF073ZU0dS2sO1LPyCceg2QhnCLV1lAo+RAx
 3tr+iaPYnr9Ud+1QiwI/oaS6yM/LgexDPBrmSQTSLRVT3psSUUQfMaQM9puNK2P0bdgo
 U0IA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWdY1s/iX1AMDAfWgiunhhe30y9YwAgO9aCipolqm8G/wE5s9TGT1fy1Uc8JAOO717/oJYHPm8hDPY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyBDxs0duS369wFZ5FTh7Iv8OdKo8kPc7lCXjRpguIdPboofXM
 fiv3E1NJru8KVjzYu+9C8Hd4/G9+3mHRj4KIOVBd3UmgAL3vKUbEPgGao3n21yjNdnw=
X-Gm-Gg: ASbGncsb65tVo3/u9Mcff9W3QrvAZSMQFlWTsdNMMBjitjYRqDtUhJWrMsafMuUDm/x
 wdwehKixlbCkBO8F6/e6PG6dIB7imA9r32KkJhxWsW8Ze7eHsUJzcm2iQzHMCuA2vOL8DNn01Da
 gatMTtrhdt4qsLw3PgQGqy6+DSPliEbciHPJ9yz4zlCkFm5sbdrELu6fj73U7APp48C6BTIfZNW
 O8iSDJXhJWOpL07Y5TjmGZU1Jib9r/v9cdanrergLB9rMNHnI9v1+nn+jnHJCQ4yPikw5Ss+9RL
 rkwpoDt9nHLs9GXI/ppKJJbrzsXSB0WqvgN7QNhl0H+9c9nUCDfqiTWfGhq6hrdcEf3jrT/35Ct
 QWkg9pEx8jCCtEfCSQYDYK5gWHYZWTNDVXgCBOtQ=
X-Google-Smtp-Source: AGHT+IHdSxS2nTGrvLuropA0rHENFxyZSFHMxOh0OmlD62ZrexTI0z/dDGvjnhVs7yeJPczsIO1oqA==
X-Received: by 2002:a05:6000:c0b:b0:3a3:5c64:c60 with SMTP id
 ffacd0b85a97d-3a35c84beacmr9942754f8f.59.1747728334579; 
 Tue, 20 May 2025 01:05:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a36c6eeaf8sm7997434f8f.48.2025.05.20.01.05.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 01:05:34 -0700 (PDT)
Message-ID: <476a5609-ba9a-489c-bdd3-c6ca949a9b06@linaro.org>
Date: Tue, 20 May 2025 10:05:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 29/30] drm/msm/dpu: drop ununused MIXER features
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-29-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-29-6c5e88e31383@oss.qualcomm.com>
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
> Drop unused LM features from the current codebase.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 ++------
>   1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index c1488a2c160b0e2ab08243a6e2bd099329ae759b..d51f6c5cdf62f3c00829167172ef6fd61f069986 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -66,16 +66,12 @@ enum {
>   
>   /*
>    * MIXER sub-blocks/features
> - * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
>    * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
> - * @DPU_MIXER_GC              Gamma correction block
>    * @DPU_MIXER_MAX             maximum value
>    */
>   enum {
> -	DPU_MIXER_LAYER = 0x1,
> -	DPU_MIXER_SOURCESPLIT,
> -	DPU_MIXER_GC,
> -	DPU_MIXER_MAX
> +	DPU_MIXER_SOURCESPLIT = 0x1,
> +	DPU_MIXER_MAX,
>   };
>   
>   /**
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
