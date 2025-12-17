Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3F9CC82D0
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 15:26:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F3910ECF8;
	Wed, 17 Dec 2025 14:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="ZenrByKB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04A5E10ECF3
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 14:26:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 328D8C1A59F;
 Wed, 17 Dec 2025 14:26:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id B7D8A6072F;
 Wed, 17 Dec 2025 14:26:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4B086102F0AD6; Wed, 17 Dec 2025 15:26:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1765981586; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=LdI+WLhwoG2148T22JxuSuz6UiWPQZG056K2Vo9svR0=;
 b=ZenrByKB4riY+GKo1T8xP6/Mo8UDElSx1ICK6SOLZN83miOdDSFHFaydE0zYZ5UXZAPV25
 0546wAgP6BSD5ACbA9F26FI0aUxz5E7idXNqna2S+pOZrWuR8Xw9cQ5uF8J3i7W2izuwCF
 P7A1BViQr626iP1CwpG7zObQkDpJ5fkfTGpdUubKzxnaZXJhh6Mc+IStE1IcMUlGcMyybS
 MmrQ9HdN7ixAwdVcmebqpdqC9xW5jvF/mDiiV4GRb7mZon6O+IohZPiI5MlPrCdk3UlIG3
 Ttv/E3925xpvvK0hoNXB3OYw1dK5qMgnOFRlcBdtDZqq0LxsuEs+/F4X4l8qVQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 17 Dec 2025 15:26:22 +0100
Message-Id: <DF0K83B46R5Y.387A8AWR3CDP5@bootlin.com>
Subject: Re: [PATCH v2 17/20] drm/bridge: tda998x: Move
 tda998x_create/destroy into probe and remove
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony
 Lindgren" <tony@atomide.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.20.1
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
 <20251211-feature_tilcdc-v2-17-f48bac3cd33e@bootlin.com>
In-Reply-To: <20251211-feature_tilcdc-v2-17-f48bac3cd33e@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
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

On Thu Dec 11, 2025 at 5:39 PM CET, Kory Maincent (TI.com) wrote:

Small nit:

> Now that tda998x_create and tda998x_destroy are called only in the probe
> function, there is no need for separate functions.
 ^ add "and remove" here

> Move the code into the tda998x_probe and tda998x_remove functions.
> Rewrite the cleanup path using goto calls in probe and reorder it in the
> remove function.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/tda998x_drv.c | 99 +++++++++++++++++++-----------=
------
>  1 file changed, 51 insertions(+), 48 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tda998x_drv.c b/drivers/gpu/drm/bridg=
e/tda998x_drv.c
> index 865285ba2bd8c..4be49dd5bfc01 100644
> --- a/drivers/gpu/drm/bridge/tda998x_drv.c
> +++ b/drivers/gpu/drm/bridge/tda998x_drv.c
> @@ -1748,38 +1748,20 @@ static int tda998x_get_audio_ports(struct tda998x=
_priv *priv,
>  	return 0;
>  }
>
> -static void tda998x_destroy(struct device *dev)
> -{
> -	struct tda998x_priv *priv =3D dev_get_drvdata(dev);
> -
> -	drm_bridge_remove(&priv->bridge);
> -
> -	/* disable all IRQs and free the IRQ handler */
> -	cec_write(priv, REG_CEC_RXSHPDINTENA, 0);
> -	reg_clear(priv, REG_INT_FLAGS_2, INT_FLAGS_2_EDID_BLK_RD);
> -
> -	if (priv->audio_pdev)
> -		platform_device_unregister(priv->audio_pdev);
> -
> -	if (priv->hdmi->irq)
> -		free_irq(priv->hdmi->irq, priv);

Compared to the original code being removed...

> @@ -1956,26 +1941,44 @@ static int tda998x_create(struct device *dev)
>
>  	return 0;
>
> -fail:
> -	tda998x_destroy(dev);
> -err_irq:
> +unregister_dev:
> +	i2c_unregister_device(priv->cec);
> +notifier_conn_unregister:
> +	cec_notifier_conn_unregister(priv->cec_notify);
> +free_irq:
> +	if (client->irq) {
> +		free_irq(client->irq, priv);
> +		cec_write(priv, REG_CEC_RXSHPDINTENA, 0);
> +		reg_clear(priv, REG_INT_FLAGS_2, INT_FLAGS_2_EDID_BLK_RD);
> +	}

...here you moved free_irq() before writing registers. It should stay last,
as per free_irq() documentation.

[...]

> -static void tda998x_remove(struct i2c_client *client)
> -{
> -	tda998x_destroy(&client->dev);
> +	if (priv->audio_pdev)
> +		platform_device_unregister(priv->audio_pdev);
> +
> +	i2c_unregister_device(priv->cec);
> +
> +	cec_notifier_conn_unregister(priv->cec_notify);
> +
> +	/* disable all IRQs and free the IRQ handler */
> +	if (client->irq) {
> +		cec_write(priv, REG_CEC_RXSHPDINTENA, 0);
> +		reg_clear(priv, REG_INT_FLAGS_2, INT_FLAGS_2_EDID_BLK_RD);
> +		free_irq(priv->hdmi->irq, priv);
> +	}

Here the order is correct.

Otherwise looks good! With the above fixed and no other changes you can
add my Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
