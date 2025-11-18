Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36F8AC686E0
	for <lists+dri-devel@lfdr.de>; Tue, 18 Nov 2025 10:08:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9542D10E46A;
	Tue, 18 Nov 2025 09:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="vGXkirU/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E95710E45C
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 09:08:13 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-4779cb0a33fso31623425e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Nov 2025 01:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763456892; x=1764061692; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=c8ojmwZvyIUVTGQLirWUPhk95m2/9IA4Sz9hLtWscRI=;
 b=vGXkirU/3mhEDm32njHlHtewlmTlPM7oqR0JndTAMdK9W74a/6swP5SABAi/+ZpRth
 Muf3qRa+GZ2+RXwK1Ts/1YYbcIvjz4YlAgll+rJy9SH6+oRluvj1iMNPw2SoFtMSkoX6
 WaJWGKi7fQqo8maedWidSzXUZhzXYl+OjU/9+zN+1Io51ARr96tZA+zN1WKZUwT+x5ZZ
 O8KCB018e3A66GHMd7vFmsHX+1YYUvopwFMiVELFxQJxaVwVUOz5KTOgtJoTtaZzK1vO
 eGFrvI9dpFLz8HnZwveXHYJvWlIg/qeqW2GKEsNp5zapHbqjhwav+kqM4x7mp2opuIuv
 TqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763456892; x=1764061692;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c8ojmwZvyIUVTGQLirWUPhk95m2/9IA4Sz9hLtWscRI=;
 b=NWCDn0VQ254s5jGCBxrXvyQwtgMqHsWiJsRmoqAswUMxiiGxN8ANkg6auTP93FOjL5
 p5To7Xc02b5ZVXhjs5fXUGk9b5vFBVf70Ob3JpyfTct8ng0qPEmwX87ovmTPwjpbg43J
 irU2Cbqtfnzik1DEaxQO5d6x34tnFxZFbRKUTv3aOx11aAb+6QNs3/5OSTPTqg76xQDc
 BF1wSi2G8aHwK2Hz9QeAJCXhk67Aj7CvElV2XOXlXhVRIR0JnVEGSwSle+0Dy495YRju
 B4/jSTOZGcPBE2A1ussHUz77WxRhmhcVU9RddHI76CrbyOqpgudUMtE/ByJer/3ngp4v
 U8oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGq7BOI0h8xU7IWsy18xxYVS1nkPAg+tewdkMpimnyuNUgN78Ru7dzqhVwAUW49KpfI558ONj8nII=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdJRPjTCSn7Qg635Y2DtfKAclyOj6LWg9QS2v8fHYxCdVIpRk7
 sUIQmEzQG4cKfc/x3E6V9p1LQvmB/bIk8OpLuF+k8Z4+hdom3wfH4RRzlEMQwcbteBk=
X-Gm-Gg: ASbGnctJIaFnjk0ul7H1qfd29D6E2DQy/ga/VggEdIs7ZVUCe8gKUeTAucecDngu5RJ
 MC5tGPZ8Yi1+lB7YgvNKERpMWS0J6uI1uV4XFWwcyrEmnjidDw4iTYOx08kU0WTNiePN08tcoOG
 R29wACGN9iL9g3dft0xSBxfRmZ1ZDyTT5fN8z4pBADi5IzRBlGx94ea41Xn+tk7UAFQ5wsgUPoO
 uMhAf7Kox0hphoFH9xCOQTyrxDr+YyeMbhvvETlWx9aOKaMfxwRKSQlgpsD388pXT6Kx8JheAbS
 tPRiv7bXbxNyx8o5BcW3LIUoXJ9/J3k1hAOpCGu0WufZKmzfODjux4Rd8vJnkrC1QMFUsP/nBG4
 oWpl5XDZsAvXMAzDSZ1nIv+3lGuehUtQ/VadOXNswMkNUCGP75QnEkwCslTFif6fvvWIf3gSKvm
 jg7U4GtcYUVFaxwzhLRDaFcBNGkX+u0S6yNw9kpAeqPdAvixYfQA3XVekpVmlNFa0=
X-Google-Smtp-Source: AGHT+IG6gLgCwxhtQm3Z8HznXw2PJ389guvo2P4OhOD1SCc8LUBuHyTff2qepHeal9ABmF52l4Ec4Q==
X-Received: by 2002:a05:600c:3e8e:b0:477:abea:901c with SMTP id
 5b1f17b1804b1-477abea924dmr8401245e9.11.1763456891500; 
 Tue, 18 Nov 2025 01:08:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:3d9:2080:366e:5264:fffe:1c49?
 ([2a01:e0a:3d9:2080:366e:5264:fffe:1c49])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b53f2084dsm31563471f8f.42.2025.11.18.01.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Nov 2025 01:08:11 -0800 (PST)
Message-ID: <7ca46d0d-d235-421e-95cb-901efb856b0c@linaro.org>
Date: Tue, 18 Nov 2025 10:08:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v9 06/10] phy: rockchip: phy-rockchip-typec: Add DRM AUX
 bridge
To: Chaoyi Chen <kernel@airkyi.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Peter Chen <hzpeterchen@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner
 <heiko@sntech.de>, Sandy Huang <hjc@rock-chips.com>,
 Andy Yan <andy.yan@rock-chips.com>,
 Yubing Zhang <yubing.zhang@rock-chips.com>,
 Frank Wang <frank.wang@rock-chips.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Amit Sunil Dhamne <amitsd@google.com>,
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, Dragan Simic <dsimic@manjaro.org>,
 Johan Jonker <jbx6244@gmail.com>, Diederik de Haas <didi.debian@cknow.org>,
 Peter Robinson <pbrobinson@gmail.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 dri-devel@lists.freedesktop.org
References: <20251111105040.94-1-kernel@airkyi.com>
 <20251111105040.94-7-kernel@airkyi.com>
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
In-Reply-To: <20251111105040.94-7-kernel@airkyi.com>
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

On 11/11/25 11:50, Chaoyi Chen wrote:
> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Using the DRM_AUX_BRIDGE helper to create the transparent DRM bridge
> device.
> 
> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> ---
> 
> (no changes since v7)
> 
> Changes in v6:
> - Fix depend in Kconfig.
> 
>   drivers/phy/rockchip/Kconfig              |  2 +
>   drivers/phy/rockchip/phy-rockchip-typec.c | 52 +++++++++++++++++++++++
>   2 files changed, 54 insertions(+)
> 
> diff --git a/drivers/phy/rockchip/Kconfig b/drivers/phy/rockchip/Kconfig
> index db4adc7c53da..bcb5476222fc 100644
> --- a/drivers/phy/rockchip/Kconfig
> +++ b/drivers/phy/rockchip/Kconfig
> @@ -120,6 +120,8 @@ config PHY_ROCKCHIP_TYPEC
>   	tristate "Rockchip TYPEC PHY Driver"
>   	depends on OF && (ARCH_ROCKCHIP || COMPILE_TEST)
>   	depends on TYPEC || TYPEC=n
> +	depends on DRM || DRM=n
> +	select DRM_AUX_BRIDGE if DRM_BRIDGE
>   	select EXTCON
>   	select GENERIC_PHY
>   	select RESET_CONTROLLER
> diff --git a/drivers/phy/rockchip/phy-rockchip-typec.c b/drivers/phy/rockchip/phy-rockchip-typec.c
> index 1f5b4142cbe4..748a6eb8ad95 100644
> --- a/drivers/phy/rockchip/phy-rockchip-typec.c
> +++ b/drivers/phy/rockchip/phy-rockchip-typec.c
> @@ -36,6 +36,7 @@
>    * orientation, false is normal orientation.
>    */
>   
> +#include <linux/auxiliary_bus.h>
>   #include <linux/clk.h>
>   #include <linux/clk-provider.h>
>   #include <linux/delay.h>
> @@ -56,6 +57,7 @@
>   #include <linux/phy/phy.h>
>   #include <linux/usb/typec_dp.h>
>   #include <linux/usb/typec_mux.h>
> +#include <drm/bridge/aux-bridge.h>
>   
>   #define CMN_SSM_BANDGAP			(0x21 << 2)
>   #define CMN_SSM_BIAS			(0x22 << 2)
> @@ -415,6 +417,7 @@ struct rockchip_usb3phy_port_cfg {
>   
>   struct rockchip_typec_phy {
>   	struct device *dev;
> +	struct auxiliary_device dp_port_dev;
>   	void __iomem *base;
>   	struct extcon_dev *extcon;
>   	struct typec_mux_dev *mux;
> @@ -1299,6 +1302,51 @@ static void tcphy_typec_mux_unregister(void *data)
>   	typec_mux_unregister(tcphy->mux);
>   }
>   
> +static void tcphy_dp_port_dev_release(struct device *dev)
> +{
> +	struct auxiliary_device *adev = to_auxiliary_dev(dev);
> +
> +	of_node_put(adev->dev.of_node);
> +}
> +
> +static void tcphy_dp_port_unregister_adev(void *_adev)
> +{
> +	struct auxiliary_device *adev = _adev;
> +
> +	auxiliary_device_delete(adev);
> +	auxiliary_device_uninit(adev);
> +}
> +
> +static int tcphy_aux_bridge_register(struct rockchip_typec_phy *tcphy, struct device_node *np)
> +{
> +	struct auxiliary_device *adev = &tcphy->dp_port_dev;
> +	int ret;
> +
> +	adev->name = "dp_port";
> +	adev->dev.parent = tcphy->dev;
> +	adev->dev.of_node = of_node_get(np);
> +	adev->dev.release = tcphy_dp_port_dev_release;
> +
> +	ret = auxiliary_device_init(adev);
> +

Drop this empty line.

> +	if (ret) {
> +		of_node_put(adev->dev.of_node);
> +		return ret;
> +	}
> +
> +	ret = auxiliary_device_add(adev);
> +	if (ret) {
> +		auxiliary_device_uninit(adev);
> +		return ret;
> +	}
> +
> +	devm_add_action_or_reset(tcphy->dev, tcphy_dp_port_unregister_adev, adev);
> +
> +	ret = drm_aux_bridge_register(&adev->dev);

Adding an aux device to an aux device looks quite overengineered to me !

If it's a matter of using the proper of_node, you may instead create a separate
drm_aux_bridge_register() like drm_aux_bridge_register_from_node() instead.

Neil

> +
> +	return 0;
> +}
> +
>   static int tcphy_setup_typec_mux(struct rockchip_typec_phy *tcphy)
>   {
>   	struct typec_mux_desc mux_desc = {};
> @@ -1312,6 +1360,10 @@ static int tcphy_setup_typec_mux(struct rockchip_typec_phy *tcphy)
>   	if (!of_property_read_bool(np, "mode-switch"))
>   		goto put_np;
>   
> +	ret = tcphy_aux_bridge_register(tcphy, np);
> +	if (ret)
> +		goto put_np;
> +
>   	mux_desc.drvdata = tcphy;
>   	mux_desc.fwnode = device_get_named_child_node(tcphy->dev, "dp-port");
>   	mux_desc.set = tcphy_typec_mux_set;

