Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC480998546
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2024 13:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6FD410E8D9;
	Thu, 10 Oct 2024 11:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="c80k2YuD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5D1C10E8DA
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 11:45:27 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-4311ae6426aso1453695e9.2
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2024 04:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728560726; x=1729165526; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=D2xmxsqgdQVradbva4jgM/cA1GhFS38qtF/e0CndkSs=;
 b=c80k2YuD6dQI5JpOmmq1Ww4CuOH4Lifmnjhc4QNv2FveiMjUP/ZNd5xtCPRaKFGA0s
 8ZvMKegUaDrhvCiX/o4dG5bYLDCJRjQI1tICNzFytHE+TNpWO6rkyCnrSjRb34sObO+L
 v1++FPr00BSa9AnW1BUbAat1ZQkwr0qAEJaWLpxXjMsmpBuMQBeaYO2Aoqz5vyhd7Qyu
 WbWDYGEZlfIZ5nMljRgU0xOX9t/zwc2JhDxQvB5AnBJut5tFnfAPFqPAXPDOW6F1Argc
 nhXJP0Jx21oM1YAKbMrKIeC3Dnw/MgpdCK+2cfyAaSGQUREPgC9AiBGqvcoREBeZi8I2
 q1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728560726; x=1729165526;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=D2xmxsqgdQVradbva4jgM/cA1GhFS38qtF/e0CndkSs=;
 b=IDno0ObyN5wkR5XpxvP47KMRDlrZCSg3LVJ6HedcJ7elZvzwMLaGweyxOvaxBaY4zL
 pJlIqP7EVeTOszBYJLDT6/o7jALCg48Kg2+4S54duYJa3dCIWXr7Y/yLJdtlRpQGCa8W
 aEPZoSIGYbHR8pyLMLfaf0vXyQnZwU/OgMhxreqO3af7IxmJHsgdtuwc7fcpP8tpBZTB
 7We6IBG+KGAcgbYKOY0G5Fk/wkYm0+J58LLZ/wZFZSohO+kAC0Pm1FeVht0l4KsoDQ1L
 ugnTTJWKmKNMlrNgTcqGfg1VReI4UnwBpGdNLxI4FDaRy4irtVGMFjE4SoIfTjyDpxA2
 nWHQ==
X-Gm-Message-State: AOJu0YxdOmkbg/a0jcEIIkd3lIoN+BA/KB/ZKViUSEaLGJvDFgzyURLc
 +3ErvFRp3ufuD1Jpfi3CI2blv1QqHVJ0f4JPRllxlG//2FtIRtgW3ijQzDKKnkA=
X-Google-Smtp-Source: AGHT+IEEXQ0SEJ5dsi+RYFbTzB2LMay1r8aPCx38Vlq/fjfIc7PXi4TMfoTrzPoCxDWU3RYD3VzWJQ==
X-Received: by 2002:a05:600c:1f11:b0:426:593c:9361 with SMTP id
 5b1f17b1804b1-430d6faa2c2mr44641545e9.26.1728560726053; 
 Thu, 10 Oct 2024 04:45:26 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:64e2:34a0:1d01:60a2?
 ([2a01:e0a:982:cbb0:64e2:34a0:1d01:60a2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-431183061a4sm14120285e9.23.2024.10.10.04.45.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Oct 2024 04:45:25 -0700 (PDT)
Message-ID: <318b658f-a395-40f4-9bfc-0261489b547b@linaro.org>
Date: Thu, 10 Oct 2024 13:45:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH] drm/mipi-dsi: fix kernel doc on
 mipi_dsi_compression_mode_multi
To: Dzmitry Sankouski <dsankouski@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20241010-starqltechn_integration_upstream_drm_fix-v1-1-cf3cb1d1ce77@gmail.com>
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
In-Reply-To: <20241010-starqltechn_integration_upstream_drm_fix-v1-1-cf3cb1d1ce77@gmail.com>
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

Thanks !

On 10/10/2024 12:31, Dzmitry Sankouski wrote:
> Replace dsi parameter on ctx in kernel doc of
> mipi_dsi_compression_mode_multi function.
> 
> Fixes: 975bdea8c470 ("drm/mipi-dsi: add mipi_dsi_compression_mode_multi")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202410092245.tfsuUllL-lkp@intel.com/
> Signed-off-by: Dzmitry Sankouski <dsankouski@gmail.com>
> ---
>   drivers/gpu/drm/drm_mipi_dsi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dsi.c b/drivers/gpu/drm/drm_mipi_dsi.c
> index d8ee74701f1e..5e5c5f84daac 100644
> --- a/drivers/gpu/drm/drm_mipi_dsi.c
> +++ b/drivers/gpu/drm/drm_mipi_dsi.c
> @@ -1522,7 +1522,7 @@ EXPORT_SYMBOL(mipi_dsi_compression_mode_ext_multi);
>   
>   /**
>    * mipi_dsi_compression_mode_multi() - enable/disable DSC on the peripheral
> - * @dsi: DSI peripheral device
> + * @ctx: Context for multiple DSI transactions
>    * @enable: Whether to enable or disable the DSC
>    *
>    * Enable or disable Display Stream Compression on the peripheral using the
> 
> ---
> base-commit: 4c93ede2b0c73a7708f46a01669769d15d31e1d2
> change-id: 20241010-starqltechn_integration_upstream_drm_fix-72233382f98f
> 
> Best regards,


Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
