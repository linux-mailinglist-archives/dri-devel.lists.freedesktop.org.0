Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E31ABD08763
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 11:13:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F08B210E3BF;
	Fri,  9 Jan 2026 10:13:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="aBR5V6Ac";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C45A10E3BB
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 10:13:29 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-42fb6ce71c7so3244752f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jan 2026 02:13:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1767953607; x=1768558407; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=azmATrh1ehd50qg4sLH5mbIDJwpy+FR7iJS1nCS0pn0=;
 b=aBR5V6Acx5gSPfxbtJBS8hs13mRjSFW+4rjzo7JrWUtrtLmkQcHTwmzaFqgtwEWp9J
 BH2Cnk5ZIegG7+PTEwAsMJQxbswG8YoXViTmBgcxZ15CyN8ayp7kaiPK9mKoRhAx35f/
 nZ1f4GP1naT7PYkWgqB4v04UnGiTZFErOC/h+l6gjKn1CGa8AFF2cHpjG1D1fSVJewfm
 EFqJqnKio/V4yijfuOhOjWx9NQrhjXyZ4M5qCWdcgXge/IxSKFmDbW4iYCGD5AKId2vp
 lZZ97T9EQtCaS/XU5XxXKiqrL34WM2MJwheUsHKRTLS+x6Wg1fzC5rhnk+v673zyHkMG
 exoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767953607; x=1768558407;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=azmATrh1ehd50qg4sLH5mbIDJwpy+FR7iJS1nCS0pn0=;
 b=rZV1r6fjnaxE3rtSwsqnuPCgNxThCh3XUcUWB9TzmMe5Tll3Z9HqdOsXeIJTE7G6ap
 +GKSLmljLf/Og0L8PoKU3b2M19xrW5yENqHuVKT3FtIEb/v4F32NiOCz0R3aw6+IZ0oX
 cYyGM9bh+Jd7Lcsjyb4k7fKforrBs3ytR3pRzoV7zKAPpONQeyVkg2/xpta3dbSKK+xO
 JLIUpX0cwjJR9uXsrjuDQ2ThwUd1AeRernTjmM/NogrQ4OKtQ1lXUcy4XkBSzZ7swjRY
 awUZTp7oAt/f6T4PO6nJw70xttuLzDTOhxpg1jr0nZWOnJ5hopVnalp17DnTv4+drPsz
 3NfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyBqdC9+C/GlkdyWQPCtpR2PkkQXcDdsZCCUTuFVC5LZ/YDPIDmjuiwrU7JPeSA3Ia4oBG4orvP14=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw8IuAzfdY5LU51Nrku0EjD61iLNIXbfB7pj1ujTMrCKZEyczD1
 MsdLlxQMFYhvOoWKlrtj5aKJETRcdR3Yo3hy92jlerlPOAVNgK4fCzl7GHVzdgkS5RU=
X-Gm-Gg: AY/fxX4K0AcbuKAyDPc4abjp1IsdjW7ML9xeIuBoXDYLYFWdT/2QshwG11SkVbuytr3
 1N5rdvz8cjCgu0oDbhR8q6RtEVrQtxNrUeE4ZIYiLHOI3x6ep6dB+Gcy5ssk9CiU+w41yECSnPJ
 X60v6sq8gb4VvJcA/1Sv69zh+pSHm5ZBoiU/3WYxrkhu6ZrtlzwD1IbVrmxdkjnjR89d4dwwBVE
 sqJCse6uSSU6jBk5Cz8b2UObGQIIoLjYFSwaDuRLi3rlEnpYX1tmpVhfiZU6QFu7en0wn2nuw8n
 kachbqxLqTxiszryxde9oKC2jUUDSbbXKa8cgbCjTfIFSWGa8olu7voj/pnsRBKHqVLpJUjC/ea
 1X0W+n3kbGhO06lc5pZNeG3aOM9A5LC5VM6AvZb7/8rySulOxOTpAfJcnSlEeKJt4pUDskwzfQ9
 cBbz5GiCwn0Xb6haBW/ezbmNCNZvabTAZIlXJcuOTOeA+eDo2brjsUMZ+7ZZJvh3A=
X-Google-Smtp-Source: AGHT+IFCikJ03J/WgyrsSQPwxIM5AkWewsU7YWY0NL1QPgGkyLNv66hXXYzshWOTAsB92VRUvv8j1A==
X-Received: by 2002:a5d:5f94:0:b0:432:5bac:3915 with SMTP id
 ffacd0b85a97d-432c37c87e4mr11007824f8f.39.1767953607247; 
 Fri, 09 Jan 2026 02:13:27 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:d283:7a7e:4c57:678d?
 ([2a01:e0a:3d9:2080:d283:7a7e:4c57:678d])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-432bd0e175csm21370007f8f.14.2026.01.09.02.13.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Jan 2026 02:13:26 -0800 (PST)
Message-ID: <ef2c22a0-3335-456c-9281-e54085c849d2@linaro.org>
Date: Fri, 9 Jan 2026 11:13:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 2/6] drm/meson/dw-hdmi: convert to
 of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>,
 Hui Pu <Hui.Pu@gehealthcare.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-0-8d7a3dbacdf4@bootlin.com>
 <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
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
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-3-v2-2-8d7a3dbacdf4@bootlin.com>
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

On 1/9/26 11:02, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
> 
> dw_hdmi->bridge is used only in dw_hdmi_top_thread_irq(), so in order to
> avoid potential use-after-free ensure the irq is freed before putting the
> dw_hdmi->bridge reference.
> 
> Acked-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 0d7c68b29dff..fef1702acb14 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -778,7 +778,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	if (IS_ERR(meson_dw_hdmi->hdmi))
>   		return PTR_ERR(meson_dw_hdmi->hdmi);
>   
> -	meson_dw_hdmi->bridge = of_drm_find_bridge(pdev->dev.of_node);
> +	meson_dw_hdmi->bridge = of_drm_find_and_get_bridge(pdev->dev.of_node);
>   
>   	DRM_DEBUG_DRIVER("HDMI controller initialized\n");
>   
> @@ -789,8 +789,12 @@ static void meson_dw_hdmi_unbind(struct device *dev, struct device *master,
>   				   void *data)
>   {
>   	struct meson_dw_hdmi *meson_dw_hdmi = dev_get_drvdata(dev);
> +	struct platform_device *pdev = to_platform_device(dev);
> +	int irq = platform_get_irq(pdev, 0);
>   
> +	devm_free_irq(dev, irq, meson_dw_hdmi);
>   	dw_hdmi_unbind(meson_dw_hdmi->hdmi);
> +	drm_bridge_put(meson_dw_hdmi->bridge);
>   }
>   
>   static const struct component_ops meson_dw_hdmi_ops = {
> 

Acked-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
