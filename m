Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB260A34AEC
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 17:56:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1604C10EB40;
	Thu, 13 Feb 2025 16:56:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="laB2IVu9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E5B10EB40
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 16:56:21 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-5450681b606so1147737e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 08:56:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739465780; x=1740070580; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=/envL72wMRKdikgn0jlOsIdrQo3kgOjkSiUW09bvDSc=;
 b=laB2IVu9EBWfnxDoVCWdaSEikBzUXT3sKPA9HwPPsYQ/Kg3rqQqiY7VzlOim1W2vcz
 +0qKRz+wVDsl/F7M/afhpTkSeFMSsNC+OtIejVH+Xxpk4L8fsSd/LTWkWB+1CBCuwKrf
 TOCtwUKr1//Gyj38MrEc34tYf8o+Kd4BAmlkSSlm/rTMvo3Tq+oSUBS+JM9sDfl2MLE+
 xSLcGpiOJU0kdbk4U1ExoLik3SBCHB6TdpY8PYr/N7oEwS6PzN/ZiD4GxBVJ4k0mhlgW
 vfuOwac3m5KUlir2qYw7XdY/oe0DGMT9ZxmBCBTX+iWWLU0PELfZ7Bd0Hxh0OyePuHN7
 07JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739465780; x=1740070580;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=/envL72wMRKdikgn0jlOsIdrQo3kgOjkSiUW09bvDSc=;
 b=UTGAVeYRs5Maxbwf3Lw48B1kiOqQ+saYt2GZZBVf9epmt+1cJ2D/lNC85VQ29H0Zxl
 RMH2hQaEWGQf7BfaaaDgu7qTNjz3QsJpNY/OD4j1oxKzjFYslje86vaastf6JyVwimrb
 Qq175pgnOE7GNXYB3QEUGIvoUexfJzIKKPZkwVC/tRe3+fBDhDBfPmZIp4UaQ1o1NVhJ
 WjfmAOaJuluuWPr6YcNzkZ/JRV+HOxv8tVOVcppOW4lCMr8BnfFB03M3Gt6KaTxRViEv
 RTCAtwzQx+I3f37cAc1rr3/EcyPd/6AoBAkWIgiA3287h5pG9Pubu8vxhotItE/OxhF4
 KiaQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe1UO/L8gGggXsupl/erZsjbCNl6KYIH6AYHHrDPIu6K3kDnKTDdxkstBjDzTRH/g/FwOnKyjhX70=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2GKuTQWwNmJOg3aS+0XeiknzTyMM4qZs1NsOrfkeMl0HNnCmr
 /KrWefnzl5P7L6AtkxBvyXAyco8HmwtbXMA2gjmMBcFT5VC5vAG7KcHeOiEj+eutpw1/3W4slku
 T
X-Gm-Gg: ASbGncsqU/RBzqi6GlHHDj507yFRV2IbeOcmAF/W3vbumeZhGK50udgA8ULi85KboWw
 1Xm7py15c/zeOfvlTKyljJF8sIGCP+U4TV6yXR+tDG92SwPwUZXTBgafWoysEXhIr//MKhDtvr4
 p3vRvTX4yBZfmG5iakDXr8x8yll9dQPRl7fHryd2sagsQPjecCZLJkeAZaQk3Dbr9yQjKlxR88n
 R03hbWcKe7Az81i/92bjV0T1kq3MKjXCkrSTKgJvkGUkWDnHoBpfXb9zSbe+Sm14vMzAgrEx3Fs
 2ARHTAKzLr0iKdnKXEhoxoeeHU2dwqS3PcT4U/ayXCabqVs060verjqlDQszZqsTWizv
X-Google-Smtp-Source: AGHT+IHnDme1A09aFbNagSefdEV+h90f4ZlM9hLHk8vhRV/RdAImC8Xub2lJ0Glyh4NPgqmQceNBkQ==
X-Received: by 2002:a05:6512:b08:b0:545:8cb:218d with SMTP id
 2adb3069b0e04-545181551b6mr2616230e87.41.1739465780168; 
 Thu, 13 Feb 2025 08:56:20 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:b065:478c:3f8f:ac1b?
 ([2a01:e0a:982:cbb0:b065:478c:3f8f:ac1b])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5451f105f28sm219002e87.118.2025.02.13.08.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Feb 2025 08:56:19 -0800 (PST)
Message-ID: <489c405a-b2c1-4252-b170-ef77b5a90ca2@linaro.org>
Date: Thu, 13 Feb 2025 17:56:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/msm/a6xx: Only print the GMU firmware version once
To: Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Abel Vesa <abel.vesa@linaro.org>, Rob Clark <robdclark@chromium.org>
References: <20250213-topic-gmu_no_spam-v1-1-1e4afdd898b6@oss.qualcomm.com>
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
In-Reply-To: <20250213-topic-gmu_no_spam-v1-1-1e4afdd898b6@oss.qualcomm.com>
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
Reply-To: neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/02/2025 17:44, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> We only fetch it once from userland, so let's also only notify the
> user once and not on every runtime resume.
> 
> As you can notice by the tags chain, more than one user found this
> annoying.
> 
> Reported-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Suggested-by: Abel Vesa <abel.vesa@linaro.org>
> Suggested-by: Rob Clark <robdclark@chromium.org>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 65d38b25c0707a3c7fff08d110b4ac2b9d410473..699b0dd34b18f0ec811e975779ba95991d485098 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -813,10 +813,10 @@ static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
>   	}
>   
>   	ver = gmu_read(gmu, REG_A6XX_GMU_CORE_FW_VERSION);
> -	DRM_INFO("Loaded GMU firmware v%u.%u.%u\n",
> -		 FIELD_GET(A6XX_GMU_CORE_FW_VERSION_MAJOR__MASK, ver),
> -		 FIELD_GET(A6XX_GMU_CORE_FW_VERSION_MINOR__MASK, ver),
> -		 FIELD_GET(A6XX_GMU_CORE_FW_VERSION_STEP__MASK, ver));
> +	DRM_INFO_ONCE("Loaded GMU firmware v%u.%u.%u\n",
> +		      FIELD_GET(A6XX_GMU_CORE_FW_VERSION_MAJOR__MASK, ver),
> +		      FIELD_GET(A6XX_GMU_CORE_FW_VERSION_MINOR__MASK, ver),
> +		      FIELD_GET(A6XX_GMU_CORE_FW_VERSION_STEP__MASK, ver));
>   
>   	return 0;
>   }
> 
> ---
> base-commit: df5d6180169ae06a2eac57e33b077ad6f6252440
> change-id: 20250213-topic-gmu_no_spam-4fc4c459755d
> 
> Best regards,

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
