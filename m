Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GxZJypeqGmZtgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:30:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D0C204494
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 17:30:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B61D89238;
	Wed,  4 Mar 2026 16:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mN3dgDAu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D98F89238
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Mar 2026 16:30:30 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-439b97a8a8cso3389768f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Mar 2026 08:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772641829; x=1773246629; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=SHFIA6+GMriVuUBZ6WzV1q43gEqUSDSeozbgYS5nwEs=;
 b=mN3dgDAuGgwDKETRcMlgN3zsg3iemhaM3mcrkeWhEa0VIkO66xM/qSCS0f2pTi5Vxh
 DInNvlbCdNWcec7OA2gy1tXuzJ4w+9jEi/vET/14HWUESt5HjF3Bc+P6D8goNeilI1uk
 /Zgr7IsYlDWdNSR8SribXVj6kxyId/VWGbFSdWcnIoL6fQDlwQHUUQ7BUan/UDEyce66
 sRjEP5sqivfF8QG8f8Hy0ps2JuJtxQbh+pq7dzaRTZty2sPEBmSKkNqneNFv+xIylJPC
 URyxiS0V4KzX5tpRpobfzD+UC/9CRuAVltLddVGO+RjyqGBrcaK3SEaYz7cUzM69lCVL
 P0FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772641829; x=1773246629;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :content-language:references:cc:to:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SHFIA6+GMriVuUBZ6WzV1q43gEqUSDSeozbgYS5nwEs=;
 b=X+2oIThzhOFSSXUiKAivw/8bdrunKUSX5Aght7QiLWP/Jj9oVPrBP7Ioc24PB8IOG1
 klLGHdhlOPJGEIWT+HGUl2DnGQLLB2r4kgRaDiOOaERLxRxfZeHmUKRfrqRBg3TzqysI
 HJL99q+/2ZDE5btSHmQvBIM/7gCSrfUhDbiICGmfHkuJpYCDu790jOm+kyz141evvzvP
 43Q8Z1ERakI3X2ItvUR3zuULa/eaEmQUcKsUETMWSugESvtYknXiMGsh6l17EHWb/btZ
 DAA9jAgB8GFqznBG+/fO861ANuwh5Qo3+RJZLGbJyo37gjUr6Ao+JsP/d1tdJsVgcPZY
 D65Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkTW74RczBl6AxaZseeVGfE870omE+19P3WXHykmhDFYp3Wqr76+J0MLa7Oyow14r3nH0yHV73mWo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyPKobdi3da7GJktJ/4/wYFYvOBcy/a84ICi+m4m5b7QtA+Kefk
 XrEGEC0CTMqyVpgsSyUcDuj53eSup27f/jA3jhf0vFORjrE60oh+W/zueWUaFiSpl94=
X-Gm-Gg: ATEYQzz091GFaBRZE3R3Yca4Cev3ye1s0e3lWmpJM0prjata/SyMZFYthbNNFxFS6Uj
 kTCCIXDRpvP6lqzH0VdZGnXY2dtHNqClLgAt+d8i8DWmD+H9GLw0jqjUApqVYgjAbKLEn5NKE+f
 qMU4XkWkOqdWBoiM1Xb8+caTfnTEQPdC0oTNWEWuM5LSmF9fgB+qV0dxbhDUyTDElAyBYGyBHXO
 67vziLApQGPMCiVvt5fAIrSFDsTIH8B0sc6OZFDkZOn5ImxowzraT7W0yNCg+8f/Vw7SjOxT2Nu
 OkuuFTC8jqj1tF7dtgDGrFfD8q0AadwITzu07Tbd+5Wfc1JoUbECee+LY2czOPfIgIqU6N76zSL
 a3lH+/doK7Z1L4Mqzu//z0O8zcSv6jSX9vwQcZHyyYqoGuAjbvcyh/NlnECGnko7o4BQ3Gac/zX
 Gj9eB5DZcXPI3pEQy77wIvwWrd+YU9PkRgfvwFmMKn6MXB1gOjikxNLYwKYFda/ph4em9Dhesca
 Rxt
X-Received: by 2002:a05:6000:144a:b0:439:b60a:b403 with SMTP id
 ffacd0b85a97d-439c7fd3a7cmr5211198f8f.34.1772641828796; 
 Wed, 04 Mar 2026 08:30:28 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:da6:dde3:e477:94d2?
 ([2a01:e0a:106d:1080:da6:dde3:e477:94d2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439af926c53sm34892169f8f.8.2026.03.04.08.30.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Mar 2026 08:30:28 -0800 (PST)
Message-ID: <008a0173-2e4d-4bb8-a4a4-158aa947aed1@linaro.org>
Date: Wed, 4 Mar 2026 17:30:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v4 3/3] drm/panel: add LXD M9189A panel driver
To: Michael Tretter <m.tretter@pengutronix.de>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Rouven Czerwinski <r.czerwinski@pengutronix.de>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 kernel@pengutronix.de
References: <20260218-drm-panel-ek79007ad3-v4-0-8ec448bf3ede@pengutronix.de>
 <20260218-drm-panel-ek79007ad3-v4-3-8ec448bf3ede@pengutronix.de>
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
In-Reply-To: <20260218-drm-panel-ek79007ad3-v4-3-8ec448bf3ede@pengutronix.de>
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: 02D0C204494
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:m.tretter@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:r.czerwinski@pengutronix.de,m:jesszhan0024@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:devicetree@vger.kernel.org,m:kernel@pengutronix.de,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[pengutronix.de,kernel.org,gmail.com,linux.intel.com,suse.de,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,puri.sm:email,linaro.org:dkim,linaro.org:email,linaro.org:mid,linaro.org:replyto,pengutronix.de:email,fairphone.com:email];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Action: no action

On 2/18/26 10:12, Michael Tretter wrote:
> From: Rouven Czerwinski <r.czerwinski@pengutronix.de>
> 
> The LXD M9189A panel is based on the EK79007AD3 DSI display controller.
> It currently supports only 4 lane operation.
> 
> Signed-off-by: Rouven Czerwinski <r.czerwinski@pengutronix.de>
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
> Changes in v4:
> - Fix typo in driver name ("panel-lxa-m9189a")
> 
> Changes in v3:
> - Change maintainer to Michael Tretter <m.tretter@pengutronix.de>
> - Fix error code if regulator is missing
> - Request power-supply instead of vdd-supply
> 
> v2:
> - use _multi functions
> - remove unnecessary dcs_nop function
> - calculate pixelclock with timings
> suggested by Dmitry Baryshkov
> 
> - rename functions to m9189_ prefix
> - rename struct and c file to use m9189
> - fix commit title to mention m9189
> ---
>   MAINTAINERS                              |   6 +
>   drivers/gpu/drm/panel/Kconfig            |   9 ++
>   drivers/gpu/drm/panel/Makefile           |   1 +
>   drivers/gpu/drm/panel/panel-lxd-m9189a.c | 243 +++++++++++++++++++++++++++++++
>   4 files changed, 259 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e08767323763..ba4030a4d154 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7948,6 +7948,12 @@ F:	Documentation/devicetree/bindings/display/lvds.yaml
>   F:	Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
>   F:	drivers/gpu/drm/panel/panel-lvds.c
>   
> +DRM DRIVER FOR LXD M9189A PANELS
> +M:	Michael Tretter <m.tretter@pengutronix.de>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/display/panel/lxd,m9189a.yaml
> +F:	drivers/gpu/drm/panel/panel-lxd-m9189a.c
> +
>   DRM DRIVER FOR MANTIX MLAF057WE51 PANELS
>   M:	Guido Günther <agx@sigxcpu.org>
>   R:	Purism Kernel Team <kernel@puri.sm>
> diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
> index 7a83804fedca..b7d35a73080e 100644
> --- a/drivers/gpu/drm/panel/Kconfig
> +++ b/drivers/gpu/drm/panel/Kconfig
> @@ -442,6 +442,15 @@ config DRM_PANEL_LG_SW43408
>   	  pixel. It provides a MIPI DSI interface to the host and has a
>   	  built-in LED backlight.
>   
> +config DRM_PANEL_LXD_M9189A
> +	tristate "LXD M9189A MIPI-DSI LCD panel"
> +	depends on OF
> +	depends on DRM_MIPI_DSI
> +	depends on BACKLIGHT_CLASS_DEVICE
> +	help
> +	  Say Y if you want to enable support for the LXD M9189A 4-Lane
> +	  1024x600 MIPI DSI panel.
> +
>   config DRM_PANEL_MAGNACHIP_D53E6EA8966
>   	tristate "Magnachip D53E6EA8966 DSI panel"
>   	depends on OF && SPI
> diff --git a/drivers/gpu/drm/panel/Makefile b/drivers/gpu/drm/panel/Makefile
> index b9562a6fdcb3..d1303455a374 100644
> --- a/drivers/gpu/drm/panel/Makefile
> +++ b/drivers/gpu/drm/panel/Makefile
> @@ -44,6 +44,7 @@ obj-$(CONFIG_DRM_PANEL_LG_LB035Q02) += panel-lg-lb035q02.o
>   obj-$(CONFIG_DRM_PANEL_LG_LD070WX3) += panel-lg-ld070wx3.o
>   obj-$(CONFIG_DRM_PANEL_LG_LG4573) += panel-lg-lg4573.o
>   obj-$(CONFIG_DRM_PANEL_LG_SW43408) += panel-lg-sw43408.o
> +obj-$(CONFIG_DRM_PANEL_LXD_M9189A) += panel-lxd-m9189a.o
>   obj-$(CONFIG_DRM_PANEL_MAGNACHIP_D53E6EA8966) += panel-magnachip-d53e6ea8966.o
>   obj-$(CONFIG_DRM_PANEL_NEC_NL8048HL11) += panel-nec-nl8048hl11.o
>   obj-$(CONFIG_DRM_PANEL_NEWVISION_NV3051D) += panel-newvision-nv3051d.o
> diff --git a/drivers/gpu/drm/panel/panel-lxd-m9189a.c b/drivers/gpu/drm/panel/panel-lxd-m9189a.c
> new file mode 100644
> index 000000000000..68019e1e43a9
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-lxd-m9189a.c
> @@ -0,0 +1,243 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Generated with linux-mdss-dsi-panel-driver-generator from vendor device tree.
> + * Copyright (c) 2024 Luca Weiss <luca.weiss@fairphone.com>
> + */
> +
> +#include <linux/delay.h>
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/types.h>
> +
> +#include <drm/drm_mipi_dsi.h>
> +#include <drm/drm_modes.h>
> +#include <drm/drm_panel.h>
> +#include <drm/drm_probe_helper.h>
> +
> +/* Manufacturer specific DSI commands */
> +#define EK79007AD3_GAMMA1		0x80
> +#define EK79007AD3_GAMMA2		0x81
> +#define EK79007AD3_GAMMA3		0x82
> +#define EK79007AD3_GAMMA4		0x83
> +#define EK79007AD3_GAMMA5		0x84
> +#define EK79007AD3_GAMMA6		0x85
> +#define EK79007AD3_GAMMA7		0x86
> +#define EK79007AD3_PANEL_CTRL3		0xB2
> +
> +struct m9189_panel {
> +	struct drm_panel panel;
> +	struct mipi_dsi_device *dsi;
> +	struct regulator *supply;
> +	struct gpio_desc *reset_gpio;
> +	struct gpio_desc *standby_gpio;
> +};
> +
> +static inline struct m9189_panel *to_m9189_panel(struct drm_panel *panel)
> +{
> +	return container_of(panel, struct m9189_panel, panel);
> +}
> +
> +static void m9189_reset(struct m9189_panel *m9189)
> +{
> +	gpiod_set_value_cansleep(m9189->reset_gpio, 0);
> +	msleep(20);
> +	gpiod_set_value_cansleep(m9189->reset_gpio, 1);
> +	msleep(30);
> +	gpiod_set_value_cansleep(m9189->reset_gpio, 0);
> +	msleep(55);
> +}
> +
> +static int m9189_on(struct m9189_panel *m9189)
> +{
> +	struct mipi_dsi_multi_context ctx = { .dsi = m9189->dsi };
> +
> +	ctx.dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +
> +	/* Gamma 2.2 */
> +	mipi_dsi_dcs_write_seq_multi(&ctx, EK79007AD3_GAMMA1, 0x48);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, EK79007AD3_GAMMA2, 0xB8);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, EK79007AD3_GAMMA3, 0x88);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, EK79007AD3_GAMMA4, 0x88);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, EK79007AD3_GAMMA5, 0x58);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, EK79007AD3_GAMMA6, 0xD2);
> +	mipi_dsi_dcs_write_seq_multi(&ctx, EK79007AD3_GAMMA7, 0x88);
> +	mipi_dsi_msleep(&ctx, 50);
> +
> +	/* 4 Lanes */
> +	mipi_dsi_generic_write_multi(&ctx, (u8[]){ EK79007AD3_PANEL_CTRL3, 0x70 }, 2);
> +
> +	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
> +	mipi_dsi_msleep(&ctx, 120);
> +
> +	mipi_dsi_dcs_set_display_on_multi(&ctx);
> +	mipi_dsi_msleep(&ctx, 120);
> +
> +	return ctx.accum_err;
> +}
> +
> +static int m9189_disable(struct drm_panel *panel)
> +{
> +	struct m9189_panel *m9189 = to_m9189_panel(panel);
> +	struct mipi_dsi_multi_context ctx = { .dsi = m9189->dsi };
> +
> +	ctx.dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> +
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&ctx);
> +	mipi_dsi_msleep(&ctx, 120);
> +
> +	gpiod_set_value_cansleep(m9189->standby_gpio, 1);
> +
> +	return ctx.accum_err;
> +}
> +
> +static int m9189_prepare(struct drm_panel *panel)
> +{
> +	struct m9189_panel *m9189 = to_m9189_panel(panel);
> +	struct device *dev = &m9189->dsi->dev;
> +	int ret;
> +
> +	ret = regulator_enable(m9189->supply);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable regulators: %d\n", ret);
> +		return ret;
> +	}
> +
> +	gpiod_set_value_cansleep(m9189->standby_gpio, 0);
> +	msleep(20);
> +	m9189_reset(m9189);
> +
> +	ret = m9189_on(m9189);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to initialize panel: %d\n", ret);
> +		gpiod_set_value_cansleep(m9189->reset_gpio, 1);
> +		regulator_disable(m9189->supply);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int m9189_unprepare(struct drm_panel *panel)
> +{
> +	struct m9189_panel *m9189 = to_m9189_panel(panel);
> +
> +	gpiod_set_value_cansleep(m9189->standby_gpio, 1);
> +	msleep(50);
> +
> +	gpiod_set_value_cansleep(m9189->reset_gpio, 1);
> +	regulator_disable(m9189->supply);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode m9189_mode = {
> +	.clock = (1024 + 160 + 160 + 10) * (600 + 12 + 23 + 1) * 60 / 1000,
> +	.hdisplay = 1024,
> +	.hsync_start = 1024 + 160,
> +	.hsync_end = 1024 + 160 + 160,
> +	.htotal = 1024 + 160 + 160 + 10,
> +	.vdisplay = 600,
> +	.vsync_start = 600 + 12,
> +	.vsync_end = 600 + 12 + 23,
> +	.vtotal = 600 + 12 + 23 + 1,
> +	.width_mm = 154,
> +	.height_mm = 86,
> +};
> +
> +static int m9189_get_modes(struct drm_panel *panel,
> +				  struct drm_connector *connector)
> +{
> +	return drm_connector_helper_get_modes_fixed(connector, &m9189_mode);
> +}
> +
> +static const struct drm_panel_funcs m9189_panel_funcs = {
> +	.prepare = m9189_prepare,
> +	.unprepare = m9189_unprepare,
> +	.disable = m9189_disable,
> +	.get_modes = m9189_get_modes,
> +};
> +
> +static int lxd_m9189_probe(struct mipi_dsi_device *dsi)
> +{
> +	struct device *dev = &dsi->dev;
> +	struct m9189_panel *m9189;
> +	int ret;
> +
> +	m9189 = devm_kzalloc(dev, sizeof(*m9189), GFP_KERNEL);
> +	if (!m9189)
> +		return -ENOMEM;
> +
> +	m9189->supply = devm_regulator_get(dev, "power");
> +	if (IS_ERR(m9189->supply))
> +		return dev_err_probe(dev, PTR_ERR(m9189->supply),
> +				     "Failed to get power-supply\n");
> +
> +	m9189->reset_gpio = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
> +	if (IS_ERR(m9189->reset_gpio))
> +		return dev_err_probe(dev, PTR_ERR(m9189->reset_gpio),
> +				     "Failed to get reset-gpios\n");
> +
> +	m9189->standby_gpio = devm_gpiod_get(dev, "standby", GPIOD_OUT_LOW);
> +	if (IS_ERR(m9189->standby_gpio))
> +		return dev_err_probe(dev, PTR_ERR(m9189->standby_gpio),
> +				     "Failed to get standby-gpios\n");
> +
> +	m9189->dsi = dsi;
> +	mipi_dsi_set_drvdata(dsi, m9189);
> +
> +	dsi->lanes = 4;
> +	dsi->format = MIPI_DSI_FMT_RGB888;
> +	dsi->mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_BURST;
> +
> +	drm_panel_init(&m9189->panel, dev, &m9189_panel_funcs,
> +		       DRM_MODE_CONNECTOR_DSI);
> +	m9189->panel.prepare_prev_first = true;
> +
> +	ret = drm_panel_of_backlight(&m9189->panel);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to get backlight\n");
> +
> +	drm_panel_add(&m9189->panel);
> +
> +	ret = mipi_dsi_attach(dsi);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "Failed to attach to DSI host\n");
> +		drm_panel_remove(&m9189->panel);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void lxd_m9189_remove(struct mipi_dsi_device *dsi)
> +{
> +	struct m9189_panel *m9189 = mipi_dsi_get_drvdata(dsi);
> +	int ret;
> +
> +	ret = mipi_dsi_detach(dsi);
> +	if (ret < 0)
> +		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
> +
> +	drm_panel_remove(&m9189->panel);
> +}
> +
> +static const struct of_device_id lxd_m9189_of_match[] = {
> +	{ .compatible = "lxd,m9189a" },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, lxd_m9189_of_match);
> +
> +static struct mipi_dsi_driver lxd_m9189_driver = {
> +	.probe = lxd_m9189_probe,
> +	.remove = lxd_m9189_remove,
> +	.driver = {
> +		.name = "panel-lxd-m9189a",
> +		.of_match_table = lxd_m9189_of_match,
> +	},
> +};
> +module_mipi_dsi_driver(lxd_m9189_driver);
> +
> +MODULE_DESCRIPTION("DRM driver for LXD M9189A MIPI-DSI panels");
> +MODULE_LICENSE("GPL");
> 

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
