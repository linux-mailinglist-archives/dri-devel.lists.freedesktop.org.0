Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48321C15979
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 16:49:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EE8B10E5F9;
	Tue, 28 Oct 2025 15:49:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Sfds78sK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24DD610E5F8
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 15:49:43 +0000 (UTC)
Received: from pendragon.ideasonboard.com (unknown [193.209.96.36])
 by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 6AA35176B;
 Tue, 28 Oct 2025 16:47:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1761666473;
 bh=XCKTlC1GxsaJgr6vkGg2GACzmsJhoqQmJ67EuG/Y8Gk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sfds78sK+IHQz4stuFpGc3nE7KU9QEN/VYpp9wJ93nOvkhwmCHtMFF8V1lylsohMA
 +brd1O3pA0DVbOn0rWD2kmnsDyWfv2SzwLDyf2JpxOGcijpsFArTbrbje+9ZXRzzJt
 3tPy9K2h4MxBpgqt377vuVxR9mvTZw4RixSIN9jA=
Date: Tue, 28 Oct 2025 17:49:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] drm: bridge: add enable gpio for display-connector
Message-ID: <20251028154929.GA797@pendragon.ideasonboard.com>
References: <20251028-enable-gpio-dp-connector-v1-0-2babdf1d2289@oss.qualcomm.com>
 <20251028-enable-gpio-dp-connector-v1-2-2babdf1d2289@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251028-enable-gpio-dp-connector-v1-2-2babdf1d2289@oss.qualcomm.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 28, 2025 at 08:56:50PM +0530, Prahlad Valluru wrote:
> In some cases, need gpio to be set for the connector
> enable. Add optional enable gpio to display-connector.
> 
> Signed-off-by: Prahlad Valluru <venkata.valluru@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/display-connector.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
> index e9f16dbc9535..52f5e4175e64 100644
> --- a/drivers/gpu/drm/bridge/display-connector.c
> +++ b/drivers/gpu/drm/bridge/display-connector.c
> @@ -21,6 +21,7 @@ struct display_connector {
>  	struct drm_bridge	bridge;
>  
>  	struct gpio_desc	*hpd_gpio;
> +	struct gpio_desc	*enable_gpio;
>  	int			hpd_irq;
>  
>  	struct regulator	*supply;
> @@ -298,6 +299,12 @@ static int display_connector_probe(struct platform_device *pdev)
>  					     "Unable to retrieve HPD GPIO\n");
>  
>  		conn->hpd_irq = gpiod_to_irq(conn->hpd_gpio);
> +
> +		conn->enable_gpio = devm_gpiod_get_optional(&pdev->dev, "enable",
> +							 GPIOD_OUT_HIGH);

What does it mean to "enable the connector" ? Given that you don't set
the GPIO value at runtime, this seems to be a hack that is probably
better handled with GPIO hogs in the device tree.

> +		if (IS_ERR(conn->enable_gpio))
> +			return dev_err_probe(&pdev->dev, PTR_ERR(conn->enable_gpio),
> +					     "Unable to retrieve enable GPIO\n");
>  	} else {
>  		conn->hpd_irq = -EINVAL;
>  	}

-- 
Regards,

Laurent Pinchart
