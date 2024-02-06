Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88C9A84B6AE
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 14:41:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88E28112BFD;
	Tue,  6 Feb 2024 13:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FGuKLCoR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7615112BFD
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 13:41:56 +0000 (UTC)
Received: from pendragon.ideasonboard.com (85-76-34-85-nat.elisa-mobile.fi
 [85.76.34.85])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C521240;
 Tue,  6 Feb 2024 14:40:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1707226832;
 bh=D+TBqmysgnL/HqC+ck7im51xVuE0eKf2Vx5tfRp1Hkc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FGuKLCoR+tVg+6jR2YorraeR/At256PUFSppI95wrfNlx7aNBd5r4yEwq9f25NR3a
 EIL4EjimIbaYLv31HcXfK52O2BzGqUtcyDxLuSEHyg9q+PVZ2BI8KXioxCy9gTSj/4
 jlffOsqbpaVGIRnG62lv5Xi896kxrLt84Lv+nzbA=
Date: Tue, 6 Feb 2024 15:41:55 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
 =?utf-8?Q?=22Uwe_Kleine-K=C3=B6nig=22?= <u.kleine-koenig@pengutronix.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Helge Deller <deller@gmx.de>, Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Jacopo Mondi <jacopo@jmondi.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Russell King <linux@armlinux.org.uk>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tim Harvey <tharvey@gateworks.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 2/4] media: i2c: replace of_graph_get_next_endpoint()
Message-ID: <20240206134155.GB2827@pendragon.ideasonboard.com>
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
 <87r0hqnvxc.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r0hqnvxc.wl-kuninori.morimoto.gx@renesas.com>
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

Hi Morimoto-san,

(Adding Krzysztof Hałasa)

Thank you for the patch.

On Tue, Feb 06, 2024 at 02:55:27AM +0000, Kuninori Morimoto wrote:
> From DT point of view, in general, drivers should be asking for a
> specific port number because their function is fixed in the binding.
> 
> of_graph_get_next_endpoint() doesn't match to this concept.
> 
> Simply replace
> 
> 	- of_graph_get_next_endpoint(xxx, NULL);
> 	+ of_graph_get_endpoint_by_regs(xxx, 0, -1);
> 
> Link: https://lore.kernel.org/r/20240202174941.GA310089-robh@kernel.org
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/media/i2c/adv7343.c              | 2 +-
>  drivers/media/i2c/adv7604.c              | 2 +-
>  drivers/media/i2c/mt9p031.c              | 2 +-
>  drivers/media/i2c/mt9v032.c              | 2 +-
>  drivers/media/i2c/ov2659.c               | 2 +-
>  drivers/media/i2c/ov5645.c               | 2 +-
>  drivers/media/i2c/ov5647.c               | 2 +-
>  drivers/media/i2c/s5c73m3/s5c73m3-core.c | 2 +-
>  drivers/media/i2c/s5k5baf.c              | 2 +-
>  drivers/media/i2c/tc358743.c             | 2 +-
>  drivers/media/i2c/tda1997x.c             | 2 +-
>  drivers/media/i2c/tvp514x.c              | 2 +-
>  drivers/media/i2c/tvp7002.c              | 2 +-
>  13 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7343.c b/drivers/media/i2c/adv7343.c
> index ff21cd4744d3..4fbe4e18570e 100644
> --- a/drivers/media/i2c/adv7343.c
> +++ b/drivers/media/i2c/adv7343.c
> @@ -403,7 +403,7 @@ adv7343_get_pdata(struct i2c_client *client)
>  	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
>  		return client->dev.platform_data;
>  
> -	np = of_graph_get_next_endpoint(client->dev.of_node, NULL);
> +	np = of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
>  	if (!np)
>  		return NULL;
>  
> diff --git a/drivers/media/i2c/adv7604.c b/drivers/media/i2c/adv7604.c
> index b202a85fbeaa..dcfdbb975473 100644
> --- a/drivers/media/i2c/adv7604.c
> +++ b/drivers/media/i2c/adv7604.c
> @@ -3205,7 +3205,7 @@ static int adv76xx_parse_dt(struct adv76xx_state *state)
>  	np = state->i2c_clients[ADV76XX_PAGE_IO]->dev.of_node;
>  
>  	/* Parse the endpoint. */
> -	endpoint = of_graph_get_next_endpoint(np, NULL);
> +	endpoint = of_graph_get_endpoint_by_regs(np, 0, -1);

I think this should be port 1 for the adv7611 and port2 for the adv7612.
The adv7610 may need to use port 1 too, but the bindings likely need to
be updated.

Hans, Krzysztof, any opinion ?

>  	if (!endpoint)
>  		return -EINVAL;
>  
> diff --git a/drivers/media/i2c/mt9p031.c b/drivers/media/i2c/mt9p031.c
> index 348f1e1098fb..c57a0d436421 100644
> --- a/drivers/media/i2c/mt9p031.c
> +++ b/drivers/media/i2c/mt9p031.c
> @@ -1080,7 +1080,7 @@ mt9p031_get_pdata(struct i2c_client *client)
>  	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
>  		return client->dev.platform_data;
>  
> -	np = of_graph_get_next_endpoint(client->dev.of_node, NULL);
> +	np = of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
>  	if (!np)
>  		return NULL;
>  
> diff --git a/drivers/media/i2c/mt9v032.c b/drivers/media/i2c/mt9v032.c
> index 1c6f6cea1204..14d277680fa2 100644
> --- a/drivers/media/i2c/mt9v032.c
> +++ b/drivers/media/i2c/mt9v032.c
> @@ -1008,7 +1008,7 @@ mt9v032_get_pdata(struct i2c_client *client)
>  	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
>  		return client->dev.platform_data;
>  
> -	np = of_graph_get_next_endpoint(client->dev.of_node, NULL);
> +	np = of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
>  	if (!np)
>  		return NULL;
>  
> diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> index 2c3dbe164eb6..edea62a02320 100644
> --- a/drivers/media/i2c/ov2659.c
> +++ b/drivers/media/i2c/ov2659.c
> @@ -1388,7 +1388,7 @@ ov2659_get_pdata(struct i2c_client *client)
>  	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
>  		return client->dev.platform_data;
>  
> -	endpoint = of_graph_get_next_endpoint(client->dev.of_node, NULL);
> +	endpoint = of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
>  	if (!endpoint)
>  		return NULL;
>  
> diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c
> index a70db7e601a4..31d214bd4a83 100644
> --- a/drivers/media/i2c/ov5645.c
> +++ b/drivers/media/i2c/ov5645.c
> @@ -1053,7 +1053,7 @@ static int ov5645_probe(struct i2c_client *client)
>  	ov5645->i2c_client = client;
>  	ov5645->dev = dev;
>  
> -	endpoint = of_graph_get_next_endpoint(dev->of_node, NULL);
> +	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
>  	if (!endpoint) {
>  		dev_err(dev, "endpoint node not found\n");
>  		return -EINVAL;
> diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
> index dcfe3129c63a..beab2813c672 100644
> --- a/drivers/media/i2c/ov5647.c
> +++ b/drivers/media/i2c/ov5647.c
> @@ -1363,7 +1363,7 @@ static int ov5647_parse_dt(struct ov5647 *sensor, struct device_node *np)
>  	struct device_node *ep;
>  	int ret;
>  
> -	ep = of_graph_get_next_endpoint(np, NULL);
> +	ep = of_graph_get_endpoint_by_regs(np, 0, -1);
>  	if (!ep)
>  		return -EINVAL;
>  
> diff --git a/drivers/media/i2c/s5c73m3/s5c73m3-core.c b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
> index ed5b10731a14..aaec5f64f31a 100644
> --- a/drivers/media/i2c/s5c73m3/s5c73m3-core.c
> +++ b/drivers/media/i2c/s5c73m3/s5c73m3-core.c
> @@ -1555,7 +1555,7 @@ static int s5c73m3_get_dt_data(struct s5c73m3 *state)
>  				     "failed to request gpio S5C73M3_RST\n");
>  	gpiod_set_consumer_name(state->reset, "S5C73M3_RST");
>  
> -	node_ep = of_graph_get_next_endpoint(node, NULL);
> +	node_ep = of_graph_get_endpoint_by_regs(node, 0, -1);
>  	if (!node_ep) {
>  		dev_warn(dev, "no endpoint defined for node: %pOF\n", node);
>  		return 0;
> diff --git a/drivers/media/i2c/s5k5baf.c b/drivers/media/i2c/s5k5baf.c
> index 67da2045f543..af7e49e6cc5b 100644
> --- a/drivers/media/i2c/s5k5baf.c
> +++ b/drivers/media/i2c/s5k5baf.c
> @@ -1836,7 +1836,7 @@ static int s5k5baf_parse_device_node(struct s5k5baf *state, struct device *dev)
>  			 state->mclk_frequency);
>  	}
>  
> -	node_ep = of_graph_get_next_endpoint(node, NULL);
> +	node_ep = of_graph_get_endpoint_by_regs(node, 0, -1);
>  	if (!node_ep) {
>  		dev_err(dev, "no endpoint defined at node %pOF\n", node);
>  		return -EINVAL;
> diff --git a/drivers/media/i2c/tc358743.c b/drivers/media/i2c/tc358743.c
> index 2785935da497..872e802cdfbe 100644
> --- a/drivers/media/i2c/tc358743.c
> +++ b/drivers/media/i2c/tc358743.c
> @@ -1895,7 +1895,7 @@ static int tc358743_probe_of(struct tc358743_state *state)
>  		return dev_err_probe(dev, PTR_ERR(refclk),
>  				     "failed to get refclk\n");
>  
> -	ep = of_graph_get_next_endpoint(dev->of_node, NULL);
> +	ep = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
>  	if (!ep) {
>  		dev_err(dev, "missing endpoint node\n");
>  		return -EINVAL;
> diff --git a/drivers/media/i2c/tda1997x.c b/drivers/media/i2c/tda1997x.c
> index 325e99125941..662efd5e69b9 100644
> --- a/drivers/media/i2c/tda1997x.c
> +++ b/drivers/media/i2c/tda1997x.c
> @@ -2307,7 +2307,7 @@ static int tda1997x_parse_dt(struct tda1997x_state *state)
>  	pdata->vidout_sel_de = DE_FREF_SEL_DE_VHREF;
>  
>  	np = state->client->dev.of_node;
> -	ep = of_graph_get_next_endpoint(np, NULL);
> +	ep = of_graph_get_endpoint_by_regs(np, 0, -1);
>  	if (!ep)
>  		return -EINVAL;
>  
> diff --git a/drivers/media/i2c/tvp514x.c b/drivers/media/i2c/tvp514x.c
> index c37f605cb75f..b1630a6c396b 100644
> --- a/drivers/media/i2c/tvp514x.c
> +++ b/drivers/media/i2c/tvp514x.c
> @@ -988,7 +988,7 @@ tvp514x_get_pdata(struct i2c_client *client)
>  	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
>  		return client->dev.platform_data;
>  
> -	endpoint = of_graph_get_next_endpoint(client->dev.of_node, NULL);
> +	endpoint = of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
>  	if (!endpoint)
>  		return NULL;
>  
> diff --git a/drivers/media/i2c/tvp7002.c b/drivers/media/i2c/tvp7002.c
> index a2d7bc799849..8e58ce400df2 100644
> --- a/drivers/media/i2c/tvp7002.c
> +++ b/drivers/media/i2c/tvp7002.c
> @@ -893,7 +893,7 @@ tvp7002_get_pdata(struct i2c_client *client)
>  	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
>  		return client->dev.platform_data;
>  
> -	endpoint = of_graph_get_next_endpoint(client->dev.of_node, NULL);
> +	endpoint = of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);
>  	if (!endpoint)
>  		return NULL;
>  

-- 
Regards,

Laurent Pinchart
