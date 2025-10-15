Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BF0EBDCFE0
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 09:27:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B81810E26B;
	Wed, 15 Oct 2025 07:26:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="C3YeCjD9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2BDB10E26B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 07:26:56 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-421b93ee372so3282184f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Oct 2025 00:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760513215; x=1761118015; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=y9LKr8c4AZy90CShrcGX7pZTKvN/kuV9gDox9nEwyjk=;
 b=C3YeCjD9ESuU24L8MRZcsT+FPhSgIw4VgCDr7SIgR2vBz6B7zRc4FYZVJY8u9Amg98
 jjKnHFf17WRjbC+FqwKjDmjW7iOp4iQDvAvmQ6+Wi7pq3DM8iWWJTJha/nvtQbP4Jd3L
 +LKl3+MPFNxgNUUZQVwqq7eV7A/iVP9ChUGsBgTT7WSblQj6WyKGEba8wWMr3H6IO4AL
 j6PZRcdY9niu9uCX+EyNYTmP4r+FJIf7y+BEV29zjVppreJ4rrAAiZTtqQvgmZKJ2gxu
 jq1/ty0S0kprAjNI7FsejCAP3sCU2KBYwPdC/x/L0qdFRXV9b85G3ETtyHYCYqrrd1WP
 bmKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760513215; x=1761118015;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=y9LKr8c4AZy90CShrcGX7pZTKvN/kuV9gDox9nEwyjk=;
 b=v9t6Q7W0PUvo9ve9DFdSLG7r4TQLzcXT+gf3ueFRvmtuI0KUWvOnLMiDfvTWgAfbFI
 bQuTIttLyFvmrRvx2oQpIuxa9PkgG7ezaiErfi1ANQ4gCtykciAOb7jXQONFsMsvyTDt
 0daebsh//M704VoHZKX3oivpLPT74e1UOQ+5tsYm9I0mwULk6pFZ+PNYMZYXry2hNPU9
 YPrY8q4BmzdHZQCtU04qtMopiotxOZrvmvBqKlVOpkBQT1SYBZTj4v2jgO7tDGaBu5ff
 Kz2y/BmSNEYxZYNHT2hGqLo8Y9SJyZ1Znj3yQxfjHEya+VHBnIGYFl/F6imdRT12MPG6
 VS/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXseKhC+O4GbAJe5SxO7KkCjmBqMBRAS+IYlUNGSWNR/LwGO1aJg+jrlOwzVN/pMasr3cNc+71DHQI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvRkDV1PJU5LLNKjWy+HhmmjgdBRGlnpnkJC/f31lPuiMN6AvH
 YqQqle+pwHGVrOuiOSHCaURKU3ICzsTF2jqNRimimVKGkfSIAHJr206tmn88GzhfZk0=
X-Gm-Gg: ASbGnctytyYzFNFDRC7V+RjlyB/5yJPVF0li1ijlNSPm9mmFNcn3dSWc3GQcUwL25ug
 z2kggFKdSVDaAo+lkCD3pSIlt5/NbkjI6CrvrC/urJQLSJSCkqWKxAUkQKF7mDu1EwTSEm/7GxR
 B0uj/Sehvr77vApB46MBHlCWKHUIXOKMQYvWe6m9Mx7vrHw8Gvl9LR6b9g05Nnz3quLSmZw8eHc
 zR28JzHIn37U36j+qmC1V5kjCO83HpeujIgwJcbgLBwseDewwroG73pDBurySiYxEM/AFZCzgn6
 +HJ2wtpzuatfbAPNl7XT8gJno+BGzCnLObcNzeYO7QART6H39QOWxKOMck22fnnIfDvW2FKm/KM
 5f4otlY/wm1Wwu4jTnxLCJ3ZtwSfGT4EvM3g4oGwZvGkkNcwXWxzVutvvUZd6AhsIap78uL8Emz
 YH19bLR9Rqj4GpP+Ajo+gFYQC3CjYPTNSQGPbeT+fl
X-Google-Smtp-Source: AGHT+IHHwcCTmm/vrgRmtvSgxozxppcZledDwbcL4KZQXqwFqDlzftxRdw5MBdI9t2oHDJ1rb68IEg==
X-Received: by 2002:a05:6000:22c5:b0:3fd:bf1d:15d1 with SMTP id
 ffacd0b85a97d-4266e8dde71mr16693928f8f.49.1760513215308; 
 Wed, 15 Oct 2025 00:26:55 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:ef0f:4a43:2fd:39aa?
 ([2a01:e0a:3d9:2080:ef0f:4a43:2fd:39aa])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e13b6sm27556373f8f.44.2025.10.15.00.26.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Oct 2025 00:26:54 -0700 (PDT)
Message-ID: <6eedef19-5473-4c09-bae5-04490f711d9e@linaro.org>
Date: Wed, 15 Oct 2025 09:26:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: Update Jessica Zhang's email address
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
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
In-Reply-To: <20251002-quit-qcom-v1-1-0898a63ffddd@oss.qualcomm.com>
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

Hi,

On 10/3/25 01:57, Jessica Zhang wrote:
> My current email will stop working soon. Update my email address to
> jesszhan0024@gmail.com
> 
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>   MAINTAINERS | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7e7515a412e9..7a712ded8f9f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7652,7 +7652,7 @@ DRM DRIVER for Qualcomm display hardware
>   M:	Rob Clark <robin.clark@oss.qualcomm.com>
>   M:	Dmitry Baryshkov <lumag@kernel.org>
>   R:	Abhinav Kumar <abhinav.kumar@linux.dev>
> -R:	Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> +R:	Jessica Zhang <jesszhan0024@gmail.com>
>   R:	Sean Paul <sean@poorly.run>
>   R:	Marijn Suijten <marijn.suijten@somainline.org>
>   L:	linux-arm-msm@vger.kernel.org
> @@ -8325,7 +8325,7 @@ F:	drivers/gpu/drm/clients/drm_log.c
>   
>   DRM PANEL DRIVERS
>   M:	Neil Armstrong <neil.armstrong@linaro.org>
> -R:	Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> +R:	Jessica Zhang <jesszhan0024@gmail.com>
>   L:	dri-devel@lists.freedesktop.org
>   S:	Maintained
>   T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git

Could you also update .mailmap in a follow-up patch ?

Thanks,
Neil

> 
> ---
> base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
> change-id: 20251002-quit-qcom-5125b64a86aa
> 
> Best regards,
> --
> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 

