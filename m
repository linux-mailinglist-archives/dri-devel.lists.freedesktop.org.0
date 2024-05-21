Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BBE8CA996
	for <lists+dri-devel@lfdr.de>; Tue, 21 May 2024 10:04:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D657910E351;
	Tue, 21 May 2024 08:04:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="It/HuOq/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC93C10E351
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 08:04:43 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-a59b178b75bso578172466b.0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 May 2024 01:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716278682; x=1716883482; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=eAMY8jM6kvm7yEmPZgtlsWom0wlMBK3w6eQ04WgZH54=;
 b=It/HuOq/u49rYmqmkY3tX1vR8THXngPon+5qSjODrvs8e9KaB7lYEfHxhLFEc+WNDE
 eJHt7OcJIETjXhHOkn+eAiy5h16BNJHCzqvoY38/+RCcaukAjuPh/ii4yJRHZCPPxzh8
 pZNAGtJg5BbU0WuRtlRIuAPa+pi4D3ZLgDKe+xySncaa1rZEM5ua4iUqRO4ZuAkg6DXJ
 x0Q518OeA/NnQNKf4ETx5Gd7AyPQxjjLxFObxu5F1KUFs0+D6xkk60G/Oo8lGsnXosTi
 mMleATIobUVHNLmnQGVWrXJP78LOXEmaGOtz6NygeGyZxtHHVJhnPcqF725LqGWJboCH
 HHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716278682; x=1716883482;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=eAMY8jM6kvm7yEmPZgtlsWom0wlMBK3w6eQ04WgZH54=;
 b=ZaIPAfLKy53qvc/Ve7Nj38KLkMKpZMKAcZlrcQypczh12ubO6AKKUQ1bHPjY2Gun56
 /140PFchzlZEf0JLDr3BJA2Qj0I9U3uF8E0ZUDJvOvjVXa3gGo4kpk0c3bcg+eJU3wua
 AQqt5bpvxQPkDR6qswMn8Yxqe4clV6Vt5Dr/IaLfYbjPu/63QECVhrhOCnzrsXQd0BXB
 08Myx85AA1Hc5UN9ynij1IqRYGrlq1O70HUWl9eVuzgLEktq0NKMoplTmfdG1YYCQutH
 wTGpYaaU9eG0k/Kac2P0LTxbtlPUjM4OlAwGuHleX7p4Fi4OBX18UUlcWTlJj6f/csVT
 Hvdg==
X-Gm-Message-State: AOJu0YwaMde4n2FZYWlUkXr2q2yI/QZ4RwtBxl9IKMLf0hGxVoZzy/Tn
 CBOo2XzYrMgZG65D/VXxYtWuAVRyx9ocyAnz5XbaaOcr+pbNVod+7Bc+Dv7i0lc=
X-Google-Smtp-Source: AGHT+IFJJOxptM8D1lGXi3EqZn8hbRk8sEydjEhMKA60wMAgoaWW76h6s6TsK4TKL6CRd80lurBGvA==
X-Received: by 2002:a17:907:77cd:b0:a58:e71d:d74 with SMTP id
 a640c23a62f3a-a5a2d55a8c7mr2285026566b.13.1716278681749; 
 Tue, 21 May 2024 01:04:41 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:adf9:e5d:4c15:f725?
 ([2a01:e0a:982:cbb0:adf9:e5d:4c15:f725])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b015ecsm1595150366b.177.2024.05.21.01.04.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 May 2024 01:04:41 -0700 (PDT)
Message-ID: <c08f679c-7063-4e61-a1f3-8a16459d9c04@linaro.org>
Date: Tue, 21 May 2024 10:04:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 5/5] drm/tiny: panel-mipi-dbi: Support the pixel format
 property
To: noralf@tronnes.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Kamlesh Gurudasani <kamlesh.gurudasani@gmail.com>,
 Tommaso Merciai <tommaso.merciai@amarulasolutions.com>
References: <20240512-panel-mipi-dbi-rgb666-v2-0-49dd266328a0@tronnes.org>
 <20240512-panel-mipi-dbi-rgb666-v2-5-49dd266328a0@tronnes.org>
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
In-Reply-To: <20240512-panel-mipi-dbi-rgb666-v2-5-49dd266328a0@tronnes.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 12/05/2024 17:25, Noralf Trønnes via B4 Relay wrote:
> From: Noralf Trønnes <noralf@tronnes.org>
> 
> Add support for these pixel format property values:
> - r5g6b5, RGB565
> - b6x2g6x2r6x2, BGR666
> 
> BGR666 is presented to userspace as RGB888. The 2 LSB in each color
> are discarded by the controller. The pixel is sent on the wire using
> 8 bits per word (little endian) so the controller sees it as BGR.
> 
> RGB565 is the default if the property is not present.
> 
> Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
> ---
>   drivers/gpu/drm/tiny/panel-mipi-dbi.c | 55 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> index f80a141fcf36..f3aa2abce314 100644
> --- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> +++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> @@ -26,6 +26,49 @@
>   
>   #include <video/mipi_display.h>
>   
> +struct panel_mipi_dbi_format {
> +	const char *name;
> +	u32 fourcc;
> +	unsigned int bpp;
> +};
> +
> +static const struct panel_mipi_dbi_format panel_mipi_dbi_formats[] = {
> +	{ "r5g6b5", DRM_FORMAT_RGB565, 16 },
> +	{ "b6x2g6x2r6x2", DRM_FORMAT_RGB888, 24 },
> +};
> +
> +static int panel_mipi_dbi_get_format(struct device *dev, u32 *formats, unsigned int *bpp)
> +{
> +	const char *format_name;
> +	unsigned int i;
> +	int ret;
> +
> +	formats[1] = DRM_FORMAT_XRGB8888;
> +
> +	ret = device_property_read_string(dev, "format", &format_name);
> +	if (ret) {
> +		/* Old Device Trees don't have this property */
> +		formats[0] = DRM_FORMAT_RGB565;
> +		*bpp = 16;
> +		return 0;
> +	}
> +
> +	for (i = 0; i < ARRAY_SIZE(panel_mipi_dbi_formats); i++) {
> +		const struct panel_mipi_dbi_format *format = &panel_mipi_dbi_formats[i];
> +
> +		if (strcmp(format_name, format->name))
> +			continue;
> +
> +		formats[0] = format->fourcc;
> +		*bpp = format->bpp;
> +		return 0;
> +	}
> +
> +	dev_err(dev, "Pixel format is not supported: '%s'\n", format_name);
> +
> +	return -EINVAL;
> +}
> +
>   static const u8 panel_mipi_dbi_magic[15] = { 'M', 'I', 'P', 'I', ' ', 'D', 'B', 'I',
>   					     0, 0, 0, 0, 0, 0, 0 };
>   
> @@ -276,6 +319,9 @@ static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
>   	struct drm_device *drm;
>   	struct mipi_dbi *dbi;
>   	struct gpio_desc *dc;
> +	unsigned int bpp;
> +	size_t buf_size;
> +	u32 formats[2];
>   	int ret;
>   
>   	dbidev = devm_drm_dev_alloc(dev, &panel_mipi_dbi_driver, struct mipi_dbi_dev, drm);
> @@ -323,7 +369,14 @@ static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
>   	if (IS_ERR(dbidev->driver_private))
>   		return PTR_ERR(dbidev->driver_private);
>   
> -	ret = mipi_dbi_dev_init(dbidev, &panel_mipi_dbi_pipe_funcs, &mode, 0);
> +	ret = panel_mipi_dbi_get_format(dev, formats, &bpp);
> +	if (ret)
> +		return ret;
> +
> +	buf_size = DIV_ROUND_UP(mode.hdisplay * mode.vdisplay * bpp, 8);
> +	ret = mipi_dbi_dev_init_with_formats(dbidev, &panel_mipi_dbi_pipe_funcs,
> +					     formats, ARRAY_SIZE(formats),
> +					     &mode, 0, buf_size);
>   	if (ret)
>   		return ret;
>   
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
