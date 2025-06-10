Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC352AD2E8F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 09:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4698A10E24C;
	Tue, 10 Jun 2025 07:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="QIyfCctO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33F7910E46F
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 07:24:01 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-3a54690d369so1687958f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 00:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1749540240; x=1750145040; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=CNfpzrOFenW/QLhsdS6ZGajYFLyQXEOSuS4E3749yys=;
 b=QIyfCctO+dGud6NJ39BklpgfXAY+gPfVF6LhVeK+gzydwLNxFHqzZNpxIirCwvVzyQ
 7Q4QoOpzUWR21OlHGC/CRtEwhKldS1d6jFiQYYcbX7185nL9Q31WZ2Psikxak5B4BpFm
 wBaoZQEwEOlLxCwKEECilctWOZhoDiYMDInN7r2v0Ce0//Prh4vOAD0T1Yjv/x3Yf5uh
 6zP6QIBoAN/DMMGbOAnktWkIH9XEI+RunBMUJalOIhpezPoWeiA+U/o8Z031JlH/OuF3
 tBlfXGF04VDMP9wRiF8MespzPexjUNVZCQ9e00knuu/EAMPbVer9lPfZR2BkaXyrSLy6
 jxDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749540240; x=1750145040;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=CNfpzrOFenW/QLhsdS6ZGajYFLyQXEOSuS4E3749yys=;
 b=H8LwTVq4zfJ6yp3r28c+2c12Cgw03NVr1N4l+kuAaBZup6qxqIE+KbV2QZuE2lY+GP
 9mvWCXGXPDyfYwGF7zckqBCFNWiAmSYasiQQnQXo42b/2vi5iPZviTAabyHJepGQdVif
 SER//HSV/BiAj4iOyl5joHLoFGFjOVSCdiHLWWbP4qJH2RteichZc7fP3EPWSxEioTM1
 pRQsVIjke9gq6yPt2M+QWOKiUtOhrx8l/TUepowjbPvGilMJ97Mvq5aFvuaNnMMtxnl9
 QmdaeSGokpCy2JlB5n81NmYuMj8Yf65zL+7hJnkBTrmRy0gNa0fyKg6fUF5+HnU9uhvA
 tfAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUujDw7yjczYzryHLByLfV10hhrLWaDrDCvElAXglQVzbsM9i+PXya0R/ldzp/Oeh3qvSrmVRx7BY8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YywiJ4elbjOg3dakp/Y3EeiifAQvVBBztL/L9Qo7ioCKTPORr97
 KadIeRUzVdnl3arUJi4L0w8fPpyl1ZytYnjGw14flUs/qyFdUrp/MlQji6Yi4WkLmOQ=
X-Gm-Gg: ASbGncvOGIZqGD4G+1ayMLFIXwnhfcDeYzFf+P3IzxY4K2u3Lnl15suBmplMunBhYs7
 fVH2GFrUpJoz68xPDgYPD+YmpOwB3Ol1oapihYCKkt5VhS0CYxNrKxzy2qu4MfPAKIBsj4q40Dg
 9GBnE5ADyYtrWd/cT+Fjs4RqMYlwgGn9zhLKV0gOiW9yr460NOLe1/Dk4QCufCU1kohddgxutdI
 PEQ5gPqxLJZ+hdc1m9Zs7TgupO6le519l8E923Fi1jLlGh4nvVHFRnyRyDs/Od1KDgjh48pe6YA
 QEStyx+spDoru6q//FKdMOKe/9uUzZF8tUVMCSk4HWZpcHNR/g7eDfz3184TZez9r+buLYbjrv0
 ZWaLnSuJeK2lz3yX848HcNjfwcjaBKQoTaG/9
X-Google-Smtp-Source: AGHT+IH6L020nl91HxJzqBefF4jPmNluzqAmrXBJ2litambE6J99Sh/JVOVprQvJU+1I830E+pK6Qg==
X-Received: by 2002:a05:6000:1acb:b0:3a4:ebc4:45a9 with SMTP id
 ffacd0b85a97d-3a531ca80ecmr11833618f8f.19.1749540239660; 
 Tue, 10 Jun 2025 00:23:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14?
 ([2a01:e0a:3d9:2080:f0b:a9b6:d508:9d14])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a53229de17sm11773770f8f.18.2025.06.10.00.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jun 2025 00:23:59 -0700 (PDT)
Message-ID: <da96ae22-c566-4c4c-ad44-261ea124ab8e@linaro.org>
Date: Tue, 10 Jun 2025 09:23:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 2/3] drm/panel: ilitek-ili9881c: Allow configuration of
 the number of lanes
To: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 dri-devel@lists.freedesktop.org
Cc: Conor Dooley <conor+dt@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Rob Herring <robh@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20250608142908.54121-1-marek.vasut+renesas@mailbox.org>
 <20250608142908.54121-2-marek.vasut+renesas@mailbox.org>
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
In-Reply-To: <20250608142908.54121-2-marek.vasut+renesas@mailbox.org>
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

On 08/06/2025 16:28, Marek Vasut wrote:
> Not all panels use all 4 data lanes, so allow configuration based
> on the compatible string.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Based on https://github.com/raspberrypi/linux 0d7ac78a3dd9 ("Extending ili9881c driver support for nwe080 panel")
> by Dave Stevenson <dave.stevenson@raspberrypi.com> and others
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Jessica Zhang <quic_jesszhan@quicinc.com>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>   drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> index 28cd7560e5db..2f5ae69148cc 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -43,6 +43,7 @@ struct ili9881c_desc {
>   	const struct drm_display_mode *mode;
>   	const unsigned long mode_flags;
>   	u8 default_address_mode;
> +	unsigned int lanes;
>   };
>   
>   struct ili9881c {
> @@ -1549,7 +1550,7 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
>   
>   	dsi->mode_flags = ctx->desc->mode_flags;
>   	dsi->format = MIPI_DSI_FMT_RGB888;
> -	dsi->lanes = 4;
> +	dsi->lanes = ctx->desc->lanes;
>   
>   	return mipi_dsi_attach(dsi);
>   }
> @@ -1567,6 +1568,7 @@ static const struct ili9881c_desc lhr050h41_desc = {
>   	.init_length = ARRAY_SIZE(lhr050h41_init),
>   	.mode = &lhr050h41_default_mode,
>   	.mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
> +	.lanes = 4,
>   };
>   
>   static const struct ili9881c_desc k101_im2byl02_desc = {
> @@ -1574,6 +1576,7 @@ static const struct ili9881c_desc k101_im2byl02_desc = {
>   	.init_length = ARRAY_SIZE(k101_im2byl02_init),
>   	.mode = &k101_im2byl02_default_mode,
>   	.mode_flags = MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
> +	.lanes = 4,
>   };
>   
>   static const struct ili9881c_desc kd050hdfia020_desc = {
> @@ -1599,6 +1602,7 @@ static const struct ili9881c_desc w552946aba_desc = {
>   	.mode = &w552946aba_default_mode,
>   	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST |
>   		      MIPI_DSI_MODE_LPM | MIPI_DSI_MODE_NO_EOT_PACKET,
> +	.lanes = 4,
>   };
>   
>   static const struct ili9881c_desc am8001280g_desc = {

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
