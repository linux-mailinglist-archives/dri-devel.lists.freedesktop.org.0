Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 310DE3B35DD
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 20:36:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB9886EB39;
	Thu, 24 Jun 2021 18:36:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C28EA6EB39
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 18:36:45 +0000 (UTC)
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1lwUDS-0000zY-Nu; Thu, 24 Jun 2021 20:36:42 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ezequiel Garcia <ezequiel@collabora.com>
Subject: Re: [PATCH 01/12] drm/panel: kd35t133: Add panel orientation support
Date: Thu, 24 Jun 2021 20:36:41 +0200
Message-ID: <3142080.Ii9rTq9gLj@diego>
In-Reply-To: <20210624182612.177969-2-ezequiel@collabora.com>
References: <20210624182612.177969-1-ezequiel@collabora.com>
 <20210624182612.177969-2-ezequiel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Ezequiel Garcia <ezequiel@collabora.com>,
 Alex Bee <knaerzche@gmail.com>, Hans Verkuil <hverkuil@xs4all.nl>,
 Thierry Reding <thierry.reding@gmail.com>, kernel@collabora.com,
 Sam Ravnborg <sam@ravnborg.org>, Chris Healy <cphealy@gmail.com>,
 maccraft123mc@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, 24. Juni 2021, 20:26:01 CEST schrieb Ezequiel Garcia:
> Parse the device tree rotation specifier, and set a DRM
> connector orientation property. The property can then be read
> by compositors to apply hardware plane rotation or a GPU transform.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>

similar patch already applied for 5.14:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/gpu/drm/panel/panel-elida-kd35t133.c?id=610d9c311b1387f8c4ac602fee1f2a1cb0508707

> ---
>  drivers/gpu/drm/panel/panel-elida-kd35t133.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> index fe5ac3ef9018..5987d28c874c 100644
> --- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> +++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
> @@ -39,6 +39,7 @@
>  struct kd35t133 {
>  	struct device *dev;
>  	struct drm_panel panel;
> +	enum drm_panel_orientation orientation;
>  	struct gpio_desc *reset_gpio;
>  	struct regulator *vdd;
>  	struct regulator *iovcc;
> @@ -216,6 +217,7 @@ static int kd35t133_get_modes(struct drm_panel *panel,
>  	connector->display_info.width_mm = mode->width_mm;
>  	connector->display_info.height_mm = mode->height_mm;
>  	drm_mode_probed_add(connector, mode);
> +	drm_connector_set_panel_orientation(connector, ctx->orientation);
>  
>  	return 1;
>  }
> @@ -258,6 +260,12 @@ static int kd35t133_probe(struct mipi_dsi_device *dsi)
>  		return ret;
>  	}
>  
> +	ret = of_drm_get_panel_orientation(dev->of_node, &ctx->orientation);
> +	if (ret) {
> +		dev_err(dev, "%pOF: failed to get orientation %d\n", dev->of_node, ret);
> +		return ret;
> +	}
> +
>  	mipi_dsi_set_drvdata(dsi, ctx);
>  
>  	ctx->dev = dev;
> 




