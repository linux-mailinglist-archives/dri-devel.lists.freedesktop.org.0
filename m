Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6226A7DA64
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 11:56:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45E1B10E40C;
	Mon,  7 Apr 2025 09:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xJ1cPT7c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C4C10E40C
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 09:56:17 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-39c1ef4ae3aso2294521f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 02:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744019772; x=1744624572; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=exKXl8iO7SzmJWroy0QI+krsFjcxaCbrBNWz/awsG7U=;
 b=xJ1cPT7cFt9aDN03Rj7oAlfdpCy3qjmlBrk9JccQu/b82S6tdpfL17NM80/s9gqDA5
 UveSHav7Th2uqBAcLhkTn5/kO2LxPAZBKWGcK7XlJfzbHf4sW1clz5F/Bw9vWJvqdv8A
 S9Cd/XRSFvkmuU/LPBYD9JsD1Padijj6KJK5ImPmUt/5Tw3vEaVOBfp7qiBLCbJ24FWq
 kRv+fX+VgPebpQYfi6CiSAfqZbjo9CEEGooXuEjVpi0AMz+9X4HNTewNz3jya/+pmZl2
 LZfOXdXNNfuNIl7MndAWOIs5I66o+p1D7zv+vH8ZPGbqHFJSnIVTcRDB/5QrHBWLZgjQ
 PCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744019772; x=1744624572;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=exKXl8iO7SzmJWroy0QI+krsFjcxaCbrBNWz/awsG7U=;
 b=ViN8MucjnS6VUEehoLGxkOaNoGQr9WT7LM6nhhIvefYjQyGmUXylIAFNO9tcyz/XXf
 rgjhiidePmdzXlTsnqVLKBubUkuBZno9lJQ3I0/rn1y4j5eiVzAmNxuLa2m/GBMVrp5L
 TLsFDXZer3j4dUVjP+2qwG4QhVxqL0mmHZJMCw2pA2EjKVRc4PnMpfpedywUzFx1OHGI
 yg5qtvQuRi7I/0IkIBISSetb3/j5XZALsV9zTAlMJgSx07bbf45dSQ4e02VW7yQqVdkh
 X+p1DvdW8lOXvxIVFrDziIMo8jH70eAj2G8wm84SabLHxoavF6uXQuZTGi4iHEaqqLSk
 e6Bg==
X-Gm-Message-State: AOJu0Yw9/k0AIaQ9XzyvZn+c3ZXTsxqLFi2bKYJ4FLpwjsz9zoAxFaOL
 cVwhxtUuOfpL4IIEchCXmE9sp4CEoPenlGo50mAY4cq6Z6wNMyF1xyf9acw4Yoo=
X-Gm-Gg: ASbGncu1P5HwXDxS93nHjviRv0AUuAVOGHw4GaL/EmP95/NWC6rPf/6SI2iJHMeo8tp
 Isyb9aiJ7IM2d7lkOl68gHsZQq9y8WCm1Ry5X7yA/GqzY3gn9ZgIhG/BMPepdki2FQfBwiighJ+
 /tGo8VW5grtXmO/sRMd0SviaFE5X24bl+6rXvSxTlwqoRZjHdSWLfmh92pHU5VDTBbSuO5q06tV
 1E4qpwh4pYOq2tRkdlSFmJWybAkOMF04sZ7fuobYxOcGxMFgURE2zOZjZo6/5TmczmwL2wHalGD
 cYeDJnp1L3MTF2juG14R2fDZ7Fihw3rrBsPXnC6N6WcsUpDTzxC8NqKKIWGJId2fQG0X3ueVOs0
 OIcPCnEzkAV/m0qvauOTpAQ==
X-Google-Smtp-Source: AGHT+IHvW9AY8dW8OeqiLq7BVhAE1rWiDpJrGLyBLxtZgZUhwxSkhw7t/IeGNuQI9SNzXAwkxQIpzg==
X-Received: by 2002:a05:6000:2287:b0:39c:266b:feec with SMTP id
 ffacd0b85a97d-39cb35aec8dmr11421588f8f.7.1744019772364; 
 Mon, 07 Apr 2025 02:56:12 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f2a4:b974:cba3:a605?
 ([2a01:e0a:3d9:2080:f2a4:b974:cba3:a605])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c301a7225sm11480515f8f.26.2025.04.07.02.56.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Apr 2025 02:56:12 -0700 (PDT)
Message-ID: <dc9ebbfc-7227-412b-b1d6-9ccfb393658f@linaro.org>
Date: Mon, 7 Apr 2025 11:56:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 22/30] panel/newvision-nv3052c: Use refcounted
 allocation in place of devm_kzalloc()
To: Anusha Srivatsa <asrivats@redhat.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Icenowy Zheng <icenowy@aosc.io>, Jagan Teki <jagan@amarulasolutions.com>,
 Ondrej Jirman <megi@xff.cz>, Javier Martinez Canillas <javierm@redhat.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Michael Walle <mwalle@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Linus Walleij
 <linus.walleij@linaro.org>, Jianhua Lu <lujianhua000@gmail.com>,
 Stefan Mavrodiev <stefan@olimex.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250403-b4-drm_panel_mass_convert_part2-v2-0-260c8a44c56b@redhat.com>
 <20250403-b4-drm_panel_mass_convert_part2-v2-22-260c8a44c56b@redhat.com>
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
In-Reply-To: <20250403-b4-drm_panel_mass_convert_part2-v2-22-260c8a44c56b@redhat.com>
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

On 03/04/2025 16:16, Anusha Srivatsa wrote:
> Move to using the new API devm_drm_panel_alloc() to allocate the
> panel.
> 
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
> ---
> v2: none.
> ---
>   drivers/gpu/drm/panel/panel-newvision-nv3052c.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> index 06e16a7c14a756b9a399347b29b410fd5f4ae273..08c99a48e06dc02677c6f0575d344f890871e0af 100644
> --- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> +++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
> @@ -777,9 +777,10 @@ static int nv3052c_probe(struct spi_device *spi)
>   	struct nv3052c *priv;
>   	int err;
>   
> -	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> -	if (!priv)
> -		return -ENOMEM;
> +	priv = devm_drm_panel_alloc(dev, struct nv3052c, panel, &nv3052c_funcs,
> +				DRM_MODE_CONNECTOR_DPI);

Wrong alignment here

Neil

> +	if (IS_ERR(priv))
> +		return PTR_ERR(priv);
>   
>   	priv->dev = dev;
>   
> @@ -803,9 +804,6 @@ static int nv3052c_probe(struct spi_device *spi)
>   
>   	spi_set_drvdata(spi, priv);
>   
> -	drm_panel_init(&priv->panel, dev, &nv3052c_funcs,
> -		       DRM_MODE_CONNECTOR_DPI);
> -
>   	err = drm_panel_of_backlight(&priv->panel);
>   	if (err)
>   		return dev_err_probe(dev, err, "Failed to attach backlight\n");
> 

