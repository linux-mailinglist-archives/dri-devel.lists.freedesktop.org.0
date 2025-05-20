Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A33BABD117
	for <lists+dri-devel@lfdr.de>; Tue, 20 May 2025 09:55:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB4ED10E409;
	Tue, 20 May 2025 07:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lAvynBgm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A24E10E3B3
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 07:55:36 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-3a36e090102so1131366f8f.2
 for <dri-devel@lists.freedesktop.org>; Tue, 20 May 2025 00:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747727735; x=1748332535; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=TTwYJuRi/Eg0WELxNnHnxBQFaapmJT03AsdQ27gfLkw=;
 b=lAvynBgmjQ8rYcMH8w3hLiUb/qyYeMarL4ryP0c23jrPrlB0r+JFsqwy8rxvGO3kij
 czjgZgL53C//bZgYADL3zct3/6N7OGptsns2OyK32alyf3xhqzMklLFkX/4R+2Bx6jAU
 a43BPGp/UXeojMjN8GgpgrlZaDiLdmF8+IN8Cnm+BJb9+RhRJgloNePjo5VXz7I9W10W
 inHxnYsFj/uoCoTQt21YH3KXQPRBdCneT4LZOqXMtnj88F5hUKttQt3aDyzxtexZj4iV
 pw5iOwLGoTkYEgyedHOuperF6QRTcVVygFJ8GSEf1kqQqBis3i0nZbqaUe/YrYCKJqEB
 G9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747727735; x=1748332535;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=TTwYJuRi/Eg0WELxNnHnxBQFaapmJT03AsdQ27gfLkw=;
 b=CD/pcMrJsMxC6Tl0UrzPWktRjjlUvZupY9YJMjyx810SpDIveumoC9FzDRRx6N+2KY
 6kTmiSPSn5G29Q/iIpK3+i2TOFpeChuOw2Hkd3Um1Yz3eaE5IF3/ufrOfVetXs+NeUn8
 4sKpBL4Fi6vV+HPHzimsDNHiHw0JFiG/01Cl1yfjCCD53HX+HG1nnNGrFF5XNeyncTrn
 GzY/VZiymjazeDE5GWwPOKDcKE6oT1ligwCoHFqKlbcAFT2s21M+pexCaeUFhbM5DFKR
 R9MBPPfgbRcfhCL68ywNWDbNCMM+oi5MyhmpcTZi/PqhbZs7phMOgA/rvDcDPpbVmo8y
 jJMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ+g/2gVH8UNam29gSHu+15pHMpEgiql0IsL0C6WPxtgLojgu+3GTMQbj58YU39gorfPqP+sVK+l8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaVQkRqGEREzjIpl742jnqzl5PNJLJu5Hyosth4Jk88X95LZwI
 cdvQzDV2un+iI+2nOU98Uz+14+baphvYTLLzyE/zOimf8xh2SstoumG7KWPkE7M+PZw=
X-Gm-Gg: ASbGncsf4kmmsvQ8cimcex/KVW7KIikLEhy44DsucW4L7tfntMUt0KYxALoet56w/oZ
 wMHgwe1XWonUhwxQ1XKM82uxLdQSkS4tXhkStUL423HkWUHVic3GZta1vBbIbDYjV6TxFvel57H
 ZpZ7Us/iNRs5C58kt7n5d6pFMXfpL0r7Sv407GR++F/pMJnl+yUuMnfQ/WrXHVl9zhrTmwQmx2i
 H3cAq4w0naOI4O4xfrLHm5JrOqlipoJf5etiw54E4rztMbukZdqSYz+ud8OSGF1S4Rv9pndUY+4
 7gnHZa3pDfttxrhyiYdh5kXL//HXl3x94Iwysaw90i5RHuf4/GN5aLOi3DxqwXHD4QUoiADh43R
 i1YEPJRjQ4mgqslwNsuwiYhqN0LXV
X-Google-Smtp-Source: AGHT+IEMuKGzrABlj661R3JZRoUiiB7Sh1ePQqZHRqYdqZBm8E8d5LXLqnzq3lo2mUKPxjsoFNp+5w==
X-Received: by 2002:a05:6000:2387:b0:3a0:7d27:f076 with SMTP id
 ffacd0b85a97d-3a35c808dafmr14870100f8f.2.1747727734967; 
 Tue, 20 May 2025 00:55:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68?
 ([2a01:e0a:3d9:2080:fb2e:6266:4e39:ce68])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a365bc0b5esm11764180f8f.9.2025.05.20.00.55.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 00:55:34 -0700 (PDT)
Message-ID: <3bc8e8dc-1e73-4a2e-b5d6-975768f64989@linaro.org>
Date: Tue, 20 May 2025 09:55:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 13/30] drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
 <20250519-dpu-drop-features-v4-13-6c5e88e31383@oss.qualcomm.com>
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
In-Reply-To: <20250519-dpu-drop-features-v4-13-6c5e88e31383@oss.qualcomm.com>
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
> DPU_DATA_HCTL_EN feature bit with the core_major_ver >= 5 check.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 3 ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c    | 2 +-
>   3 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 5cd87b13e839e7ad60356cde162405fdfb6f9498..1244dd59648d11123c507a1369f28f952d047fd5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -106,8 +106,7 @@
>   
>   #define INTF_SC7180_MASK \
>   	(BIT(DPU_INTF_INPUT_CTRL) | \
> -	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
> -	 BIT(DPU_DATA_HCTL_EN))
> +	 BIT(DPU_INTF_STATUS_SUPPORTED))
>   
>   #define WB_SDM845_MASK (BIT(DPU_WB_LINE_MODE) | \
>   			 BIT(DPU_WB_UBWC) | \
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index 3b6133e1bb581741fe87b049ad0c89bf30b76019..bf6b2392efb47fa8c3e3c5d17f1a72341872e18b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -143,14 +143,11 @@ enum {
>    * INTF sub-blocks
>    * @DPU_INTF_INPUT_CTRL             Supports the setting of pp block from which
>    *                                  pixel data arrives to this INTF
> - * @DPU_DATA_HCTL_EN                Allows data to be transferred at different rate
> - *                                  than video timing
>    * @DPU_INTF_STATUS_SUPPORTED       INTF block has INTF_STATUS register
>    * @DPU_INTF_MAX
>    */
>   enum {
>   	DPU_INTF_INPUT_CTRL = 0x1,
> -	DPU_DATA_HCTL_EN,
>   	DPU_INTF_STATUS_SUPPORTED,
>   	DPU_INTF_MAX
>   };
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 1d56c21ac79095ab515aeb485346e1eb5793c260..8f9733aad2dec3a9b5464d55b00f350348842911 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -237,7 +237,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *intf,
>   	DPU_REG_WRITE(c, INTF_FRAME_LINE_COUNT_EN, 0x3);
>   	DPU_REG_WRITE(c, INTF_CONFIG, intf_cfg);
>   	DPU_REG_WRITE(c, INTF_PANEL_FORMAT, panel_format);
> -	if (intf->cap->features & BIT(DPU_DATA_HCTL_EN)) {
> +	if (intf->mdss_ver->core_major_ver >= 5) {
>   		/*
>   		 * DATA_HCTL_EN controls data timing which can be different from
>   		 * video timing. It is recommended to enable it for all cases, except
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
