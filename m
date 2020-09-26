Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09395279BF4
	for <lists+dri-devel@lfdr.de>; Sat, 26 Sep 2020 20:49:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9964D6E069;
	Sat, 26 Sep 2020 18:49:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 815AF6E069
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Sep 2020 18:49:23 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 0AC068067F;
 Sat, 26 Sep 2020 20:49:20 +0200 (CEST)
Date: Sat, 26 Sep 2020 20:49:19 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: sii902x: Enable I/O and core VCC
 supplies if present
Message-ID: <20200926184919.GB98875@ravnborg.org>
References: <20200924200507.1175888-1-mr.nuke.me@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924200507.1175888-1-mr.nuke.me@gmail.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=A5ZCwZeG c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=e5mUnYsNAAAA:8
 a=YsLWCyS0S5thGiuXXI8A:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
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
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Rob Herring <robh+dt@kernel.org>, Neil Armstrong <narmstrong@baylibre.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 David Airlie <airlied@linux.ie>, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Alexandru

On Thu, Sep 24, 2020 at 03:05:05PM -0500, Alexandru Gagniuc wrote:
> On the SII9022, the IOVCC and CVCC12 supplies must reach the correct
> voltage before the reset sequence is initiated. On most boards, this
> assumption is true at boot-up, so initialization succeeds.
> 
> However, when we try to initialize the chip with incorrect supply
> voltages, it will not respond to I2C requests. sii902x_probe() fails
> with -ENXIO.
> 
> To resolve this, look for the "iovcc" and "cvcc12" regulators, and
> make sure they are enabled before starting the reset sequence. If
> these supplies are not available in devicetree, then they will default
> to dummy-regulator. In that case everything will work like before.
> 
> This was observed on a STM32MP157C-DK2 booting in u-boot falcon mode.
> On this board, the supplies would be set by the second stage
> bootloader, which does not run in falcon mode.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>

One nitpick here. The binding should be present in the tree before
you start using it. So this patch should be applied after the binding.

One detail below - I think others have already commented on the rest.

	Sam
> ---
>  drivers/gpu/drm/bridge/sii902x.c | 54 ++++++++++++++++++++++++++++----
>  1 file changed, 48 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/sii902x.c b/drivers/gpu/drm/bridge/sii902x.c
> index 33fd33f953ec..a5558d83e4c5 100644
> --- a/drivers/gpu/drm/bridge/sii902x.c
> +++ b/drivers/gpu/drm/bridge/sii902x.c
> @@ -17,6 +17,7 @@
>  #include <linux/i2c.h>
>  #include <linux/module.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/clk.h>
>  
>  #include <drm/drm_atomic_helper.h>
> @@ -168,6 +169,8 @@ struct sii902x {
>  	struct drm_connector connector;
>  	struct gpio_desc *reset_gpio;
>  	struct i2c_mux_core *i2cmux;
> +	struct regulator *iovcc;
> +	struct regulator *cvcc12;
>  	/*
>  	 * Mutex protects audio and video functions from interfering
>  	 * each other, by keeping their i2c command sequences atomic.
> @@ -954,13 +957,13 @@ static const struct drm_bridge_timings default_sii902x_timings = {
>  		 | DRM_BUS_FLAG_DE_HIGH,
>  };
>  
> +static int sii902x_init(struct sii902x *sii902x);
> +
>  static int sii902x_probe(struct i2c_client *client,
>  			 const struct i2c_device_id *id)
>  {
>  	struct device *dev = &client->dev;
> -	unsigned int status = 0;
>  	struct sii902x *sii902x;
> -	u8 chipid[4];
>  	int ret;
>  
>  	ret = i2c_check_functionality(client->adapter,
> @@ -989,6 +992,43 @@ static int sii902x_probe(struct i2c_client *client,
>  
>  	mutex_init(&sii902x->mutex);
>  
> +	sii902x->iovcc = devm_regulator_get(dev, "iovcc");
> +	if (IS_ERR(sii902x->iovcc))
> +		return PTR_ERR(sii902x->iovcc);
Consider using dev_err_probe() here.

> +
> +	sii902x->cvcc12 = devm_regulator_get(dev, "cvcc12");
> +	if (IS_ERR(sii902x->cvcc12))
> +		return PTR_ERR(sii902x->cvcc12);
Consider using dev_err_probe() here.
> +
> +	ret = regulator_enable(sii902x->iovcc);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable iovcc supply: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = regulator_enable(sii902x->cvcc12);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to enable cvcc12 supply: %d\n", ret);
> +		regulator_disable(sii902x->iovcc);
> +		return PTR_ERR(sii902x->cvcc12);
> +	}
> +
> +	ret = sii902x_init(sii902x);
> +	if (ret < 0) {
> +		regulator_disable(sii902x->cvcc12);
> +		regulator_disable(sii902x->iovcc);
> +	}
> +
> +	return ret;
> +}
> +
> +static int sii902x_init(struct sii902x *sii902x)
> +{
> +	struct device *dev = &sii902x->i2c->dev;
> +	unsigned int status = 0;
> +	u8 chipid[4];
> +	int ret;
> +
>  	sii902x_reset(sii902x);
>  
>  	ret = regmap_write(sii902x->regmap, SII902X_REG_TPI_RQB, 0x0);
> @@ -1012,11 +1052,11 @@ static int sii902x_probe(struct i2c_client *client,
>  	regmap_read(sii902x->regmap, SII902X_INT_STATUS, &status);
>  	regmap_write(sii902x->regmap, SII902X_INT_STATUS, status);
>  
> -	if (client->irq > 0) {
> +	if (sii902x->i2c->irq > 0) {
>  		regmap_write(sii902x->regmap, SII902X_INT_ENABLE,
>  			     SII902X_HOTPLUG_EVENT);
>  
> -		ret = devm_request_threaded_irq(dev, client->irq, NULL,
> +		ret = devm_request_threaded_irq(dev, sii902x->i2c->irq, NULL,
>  						sii902x_interrupt,
>  						IRQF_ONESHOT, dev_name(dev),
>  						sii902x);
> @@ -1031,9 +1071,9 @@ static int sii902x_probe(struct i2c_client *client,
>  
>  	sii902x_audio_codec_init(sii902x, dev);
>  
> -	i2c_set_clientdata(client, sii902x);
> +	i2c_set_clientdata(sii902x->i2c, sii902x);
>  
> -	sii902x->i2cmux = i2c_mux_alloc(client->adapter, dev,
> +	sii902x->i2cmux = i2c_mux_alloc(sii902x->i2c->adapter, dev,
>  					1, 0, I2C_MUX_GATE,
>  					sii902x_i2c_bypass_select,
>  					sii902x_i2c_bypass_deselect);
> @@ -1051,6 +1091,8 @@ static int sii902x_remove(struct i2c_client *client)
>  
>  	i2c_mux_del_adapters(sii902x->i2cmux);
>  	drm_bridge_remove(&sii902x->bridge);
> +	regulator_disable(sii902x->cvcc12);
> +	regulator_disable(sii902x->iovcc);
>  
>  	return 0;
>  }
> -- 
> 2.25.4
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
