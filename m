Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3755622FA1B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 22:32:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7765889FA0;
	Mon, 27 Jul 2020 20:32:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87CF089FA0
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 20:32:03 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id E258B8048A;
 Mon, 27 Jul 2020 22:31:59 +0200 (CEST)
Date: Mon, 27 Jul 2020 22:31:58 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 3/6] drm/bridge: Add SPI DBI host driver
Message-ID: <20200727203158.GA1016751@ravnborg.org>
References: <20200727164613.19744-1-paul@crapouillou.net>
 <20200727164613.19744-4-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200727164613.19744-4-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=8nJEP1OIZ-IA:10 a=ER_8r6IbAAAA:8 a=7X9hF7tqX14c7ykuo-AA:9
 a=wPNLvfGTeEIA:10 a=9LHmKk7ezEChjTCyhBa9:22
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 od@zcrc.me, Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Paul.

On Mon, Jul 27, 2020 at 06:46:10PM +0200, Paul Cercueil wrote:
> This driver will register a DBI host driver for panels connected over
> SPI.
So this is actually a MIPI DBI host driver.

I personally would love to have added mipi_ in the names - to make it
all more explicit.
But maybe that just because I get confused on all the acronyms.


Some details in the following. Will try to find some more time so I can
grasp the full picture. The following was just my low-level notes for
now.

	Sam
> =

> DBI types c1 and c3 are supported. C1 is a SPI protocol with 9 bits per
> word, with the data/command information in the 9th (MSB) bit. C3 is a
> SPI protocol with 8 bits per word, with the data/command information
> carried by a separate GPIO.

We did not have any define to distingush between DBI_C1 and DBI_c3:
+/* MIPI bus types */
+#define MIPI_DEVICE_TYPE_DSI           BIT(0)
+#define MIPI_DEVICE_TYPE_DBI_SPI_MODE1 BIT(1)
+#define MIPI_DEVICE_TYPE_DBI_SPI_MODE2 BIT(2)
+#define MIPI_DEVICE_TYPE_DBI_SPI_MODE3 BIT(3)
+#define MIPI_DEVICE_TYPE_DBI_M6800     BIT(4)
+#define MIPI_DEVICE_TYPE_DBI_I8080     BIT(5)

Is this on purpose?
I had assumed the host should tell what it supports and the device should
tell what it wanted.
So if the host did not support DBI_C3 and device wants it - then we
could give up early.

> =

> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
> ---
>  drivers/gpu/drm/bridge/Kconfig   |   8 +
>  drivers/gpu/drm/bridge/Makefile  |   1 +
>  drivers/gpu/drm/bridge/dbi-spi.c | 261 +++++++++++++++++++++++++++++++
This is no bridge driver - so does not belong in the bridge
directory.
gpu/drm/drm_mipi_dbi_spi.c?

>  3 files changed, 270 insertions(+)
>  create mode 100644 drivers/gpu/drm/bridge/dbi-spi.c
> =

> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index c7f0dacfb57a..ed38366847c1 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -219,6 +219,14 @@ config DRM_TI_TPD12S015
>  	  Texas Instruments TPD12S015 HDMI level shifter and ESD protection
>  	  driver.
>  =

> +config DRM_MIPI_DBI_SPI
> +	tristate "SPI host support for MIPI DBI"
> +	depends on OF && SPI
> +	select DRM_MIPI_DSI
> +	select DRM_MIPI_DBI
> +	help
> +	  Driver to support DBI over SPI.
> +
>  source "drivers/gpu/drm/bridge/analogix/Kconfig"
>  =

>  source "drivers/gpu/drm/bridge/adv7511/Kconfig"
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Mak=
efile
> index 7d7c123a95e4..c2c522c2774f 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -20,6 +20,7 @@ obj-$(CONFIG_DRM_I2C_ADV7511) +=3D adv7511/
>  obj-$(CONFIG_DRM_TI_SN65DSI86) +=3D ti-sn65dsi86.o
>  obj-$(CONFIG_DRM_TI_TFP410) +=3D ti-tfp410.o
>  obj-$(CONFIG_DRM_TI_TPD12S015) +=3D ti-tpd12s015.o
> +obj-$(CONFIG_DRM_MIPI_DBI_SPI) +=3D dbi-spi.o
mipi_dbi_spi.o would be nice...

>  obj-$(CONFIG_DRM_NWL_MIPI_DSI) +=3D nwl-dsi.o
>  =

>  obj-y +=3D analogix/
> diff --git a/drivers/gpu/drm/bridge/dbi-spi.c b/drivers/gpu/drm/bridge/db=
i-spi.c
> new file mode 100644
> index 000000000000..1060b8f95fba
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/dbi-spi.c
> @@ -0,0 +1,261 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * MIPI Display Bus Interface (DBI) SPI support
> + *
> + * Copyright 2016 Noralf Tr=F8nnes
> + * Copyright 2020 Paul Cercueil <paul@crapouillou.net>
> + */
> +
> +#include <linux/gpio/consumer.h>
> +#include <linux/module.h>
> +#include <linux/spi/spi.h>
> +
> +#include <drm/drm_mipi_dbi.h>
> +#include <drm/drm_mipi_dsi.h>
> +
> +#include <video/mipi_display.h>
> +
> +struct dbi_spi {
> +	struct mipi_dsi_host host;
It is very confusing that the mipi_dbi_spi driver uses a dsi_host.
It clashes in my head - and then reviewing it not easy.

> +	struct mipi_dsi_host_ops host_ops;
const?
> +
> +	struct spi_device *spi;
> +	struct gpio_desc *dc;
> +	struct mutex cmdlock;
> +
> +	unsigned int current_bus_type;
> +
> +	/**
> +	 * @tx_buf9: Buffer used for Option 1 9-bit conversion
> +	 */
> +	void *tx_buf9;
> +
> +	/**
> +	 * @tx_buf9_len: Size of tx_buf9.
> +	 */
> +	size_t tx_buf9_len;
> +};
> +
> +static inline struct dbi_spi *host_to_dbi_spi(struct mipi_dsi_host *host)
> +{
> +	return container_of(host, struct dbi_spi, host);
> +}
> +
> +static ssize_t dbi_spi1_transfer(struct mipi_dsi_host *host,
> +				 const struct mipi_dsi_msg *msg)
> +{
> +	struct dbi_spi *dbi =3D host_to_dbi_spi(host);
> +	struct spi_device *spi =3D dbi->spi;
> +	struct spi_transfer tr =3D {
> +		.bits_per_word =3D 9,
> +	};
> +	const u8 *src8 =3D msg->tx_buf;
> +	struct spi_message m;
> +	size_t max_chunk, chunk;
> +	size_t len =3D msg->tx_len;
> +	bool cmd_byte =3D true;
> +	unsigned int i;
> +	u16 *dst16;
> +	int ret;
> +
> +	tr.speed_hz =3D mipi_dbi_spi_cmd_max_speed(spi, len);
> +	dst16 =3D dbi->tx_buf9;
> +
> +	max_chunk =3D min(dbi->tx_buf9_len / 2, len);
Hmm, this looks not right. We limit the max_chunk to 8K here.
We learned the other day that we count in bytes.
OR did I miss something?

> +
> +	spi_message_init_with_transfers(&m, &tr, 1);
> +	tr.tx_buf =3D dst16;
> +
> +	while (len) {
> +		chunk =3D min(len, max_chunk);
> +
> +		for (i =3D 0; i < chunk; i++) {
> +			dst16[i] =3D *src8++;
> +
> +			/* Bit 9: 0 means command, 1 means data */
> +			if (!cmd_byte)
> +				dst16[i] |=3D BIT(9);
> +
> +			cmd_byte =3D false;
> +		}
> +
> +		tr.len =3D chunk * 2;
> +		len -=3D chunk;
> +
> +		ret =3D spi_sync(spi, &m);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static ssize_t dbi_spi3_transfer(struct mipi_dsi_host *host,
> +				 const struct mipi_dsi_msg *msg)
> +{
> +	struct dbi_spi *dbi =3D host_to_dbi_spi(host);
> +	struct spi_device *spi =3D dbi->spi;
> +	const u8 *buf =3D msg->tx_buf;
> +	unsigned int bpw =3D 8;
> +	u32 speed_hz;
> +	ssize_t ret;
> +
> +	/* for now we only support sending messages, not receiving */
> +	if (msg->rx_len)
> +		return -EINVAL;
> +
> +	gpiod_set_value_cansleep(dbi->dc, 0);
> +
> +	speed_hz =3D mipi_dbi_spi_cmd_max_speed(spi, 1);
> +	ret =3D mipi_dbi_spi_transfer(spi, speed_hz, 8, buf, 1);
> +	if (ret || msg->tx_len =3D=3D 1)
> +		return ret;
> +
> +	if (buf[0] =3D=3D MIPI_DCS_WRITE_MEMORY_START)
> +		bpw =3D 16;
> +
> +	gpiod_set_value_cansleep(dbi->dc, 1);
> +	speed_hz =3D mipi_dbi_spi_cmd_max_speed(spi, msg->tx_len - 1);
> +
> +	ret =3D mipi_dbi_spi_transfer(spi, speed_hz, bpw,
> +				    &buf[1], msg->tx_len - 1);
> +	if (ret)
> +		return ret;
> +
> +	return msg->tx_len;
> +}
> +
> +static ssize_t dbi_spi_transfer(struct mipi_dsi_host *host,
> +				const struct mipi_dsi_msg *msg)
> +{
> +	struct dbi_spi *dbi =3D host_to_dbi_spi(host);
> +
> +	switch (dbi->current_bus_type) {
> +	case MIPI_DEVICE_TYPE_DBI_SPI_MODE1:
> +		return dbi_spi1_transfer(host, msg);
> +	case MIPI_DEVICE_TYPE_DBI_SPI_MODE3:
> +		return dbi_spi3_transfer(host, msg);
> +	default:
> +		dev_err(&dbi->spi->dev, "Unknown transfer type\n");
> +		return -EINVAL;
> +	}
> +}
> +
> +static int dbi_spi_attach(struct mipi_dsi_host *host,
> +			  struct mipi_dsi_device *dsi)
> +{
> +	struct dbi_spi *dbi =3D host_to_dbi_spi(host);
> +
> +	dbi->current_bus_type =3D dsi->bus_type;
> +
> +	if (dbi->current_bus_type =3D=3D MIPI_DEVICE_TYPE_DBI_SPI_MODE1) {
> +		dbi->tx_buf9_len =3D SZ_16K;
> +
> +		dbi->tx_buf9 =3D kmalloc(dbi->tx_buf9_len, GFP_KERNEL);
> +		if (!dbi->tx_buf9)
> +			return -ENOMEM;
> +	}
> +
> +	return 0;
> +}
> +
> +static int dbi_spi_detach(struct mipi_dsi_host *host,
> +			  struct mipi_dsi_device *dsi)
> +{
> +	struct dbi_spi *dbi =3D host_to_dbi_spi(host);
> +
> +	kfree(dbi->tx_buf9);
> +	dbi->tx_buf9_len =3D 0;
> +
> +	return 0; /* Nothing to do */
> +}
> +
> +static void dbi_spi_host_unregister(void *d)
> +{
> +	mipi_dsi_host_unregister(d);
> +}
> +
> +static int dbi_spi_probe(struct spi_device *spi)
> +{
> +	struct device *dev =3D &spi->dev;
> +	struct mipi_dsi_device_info info =3D { };
> +	struct mipi_dsi_device *dsi;
> +	struct dbi_spi *dbi;
> +	int ret;
> +
> +	dbi =3D devm_kzalloc(dev, sizeof(*dbi), GFP_KERNEL);
> +	if (!dbi)
> +		return -ENOMEM;
> +
> +	dbi->host.dev =3D dev;
> +	dbi->host.ops =3D &dbi->host_ops;
> +	dbi->spi =3D spi;
> +	spi_set_drvdata(spi, dbi);
> +
> +	dbi->dc =3D devm_gpiod_get_optional(dev, "dc", GPIOD_OUT_LOW);
> +	if (IS_ERR(dbi->dc)) {
> +		dev_err(dev, "Failed to get gpio 'dc'\n");
> +		return PTR_ERR(dbi->dc);
> +	}
> +
> +	if (spi_is_bpw_supported(spi, 9))
> +		dbi->host.bus_types |=3D MIPI_DEVICE_TYPE_DBI_SPI_MODE1;
> +	if (dbi->dc)
> +		dbi->host.bus_types |=3D MIPI_DEVICE_TYPE_DBI_SPI_MODE3;
> +
> +	if (!dbi->host.bus_types) {
> +		dev_err(dev, "Neither Type1 nor Type3 are supported\n");
> +		return -EINVAL;
> +	}
> +
> +	dbi->host_ops.transfer =3D dbi_spi_transfer;
> +	dbi->host_ops.attach =3D dbi_spi_attach;
> +	dbi->host_ops.detach =3D dbi_spi_detach;
> +
> +	mutex_init(&dbi->cmdlock);
> +
> +	ret =3D mipi_dsi_host_register(&dbi->host);
> +	if (ret) {
> +		dev_err(dev, "Unable to register DSI host\n");
> +		return ret;
> +	}
> +
> +	ret =3D devm_add_action_or_reset(dev, dbi_spi_host_unregister, &dbi->ho=
st);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * Register our own node as a MIPI DSI device.
> +	 * This ensures that the panel driver will be probed.
> +	 */
> +	info.channel =3D 0;
> +	info.node =3D of_node_get(dev->of_node);
> +
> +	dsi =3D mipi_dsi_device_register_full(&dbi->host, &info);
> +	if (IS_ERR(dsi)) {
> +		dev_err(dev, "Failed to add DSI device\n");
> +		return PTR_ERR(dsi);
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id dbi_spi_of_match[] =3D {
> +	{ .compatible =3D "adafruit,yx240qv29" },
> +	{ .compatible =3D "leadtek,ltk035c5444t-spi" },
> +	{ }
Would it be better with a fall-back compatible like:
mipi,dbi-spi.
So the nodes must includes this compatible to be registered with
this driver?

> +};
> +MODULE_DEVICE_TABLE(of, dbi_spi_of_match);
> +
> +static struct spi_driver dbi_spi_driver =3D {
> +	.driver =3D {
> +		.name =3D "dbi-spi",
> +		.of_match_table =3D dbi_spi_of_match,
> +	},
> +	.probe =3D dbi_spi_probe,
> +};
> +module_spi_driver(dbi_spi_driver);
> +
> +MODULE_DESCRIPTION("DBI SPI bus driver");
> +MODULE_AUTHOR("Paul Cercueil <paul@crapouillou.net>");
> +MODULE_LICENSE("GPL");
> -- =

> 2.27.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
