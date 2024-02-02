Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A418477B7
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 19:38:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D944410E176;
	Fri,  2 Feb 2024 18:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WPJJYvAz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDA510E84B;
 Fri,  2 Feb 2024 17:49:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 34773CE2C6F;
 Fri,  2 Feb 2024 17:49:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA7E5C433C7;
 Fri,  2 Feb 2024 17:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706896184;
 bh=dOC6l/UpwJt+sDh73ImH2SYn2JbGC0ZF3A9tIFxdqtk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WPJJYvAz83PqbWfJevH/VqATyZyF8CMELM/qsF5iGbGg+7c08RkvpLVnt1A5GE/cF
 tcu63FYZn4b7uhLLPzbN+EdUSZoRoygx/1agCdTpP9s/n883bAkiQP8gjBz/mp+kDW
 qAUTtz5OnUdUz5st4dAWc5OGoV8IM7DK0KDm2fKGNgkvkbFxVCqblojdOgeVCjK2WT
 8TgIKe63Wz1bq6Pwy73SdDw6XnGCRuLJmukJO4LPOLdK/c9MQGRTbs1oxi0ZYlm/v9
 h+6C4sTZAkHgIq2mWUe1PiL9Ix6Qz58Sj0f91Fwj4LzNhLlO4dG31aRGnZ1zxuS/WT
 KdHH/uaxwI7ag==
Date: Fri, 2 Feb 2024 11:49:41 -0600
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
 =?iso-8859-1?Q?=22Niklas_S=C3=B6derlund=22?=
 <niklas.soderlund+renesas@ragnatech.se>, 
 =?iso-8859-1?Q?=22Uwe_Kleine-K=C3=B6nig=22?= <u.kleine-koenig@pengutronix.de>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Andy Gross <agross@kernel.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Emma Anholt <emma@anholt.net>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Frank Rowand <frowand.list@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Helge Deller <deller@gmx.de>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Jacopo Mondi <jacopo+renesas@jmondi.org>,
 Jacopo Mondi <jacopo@jmondi.org>, James Clark <james.clark@arm.com>,
 Jaroslav Kysela <perex@perex.cz>, Jonathan Hunter <jonathanh@nvidia.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Liu Ying <victor.liu@nxp.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marek Vasut <marex@denx.de>, Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Tretter <m.tretter@pengutronix.de>,
 Michal Simek <michal.simek@amd.com>, Miguel Ojeda <ojeda@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Philippe Cornu <philippe.cornu@foss.st.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rob Clark <robdclark@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Saravana Kannan <saravanak@google.com>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Stefan Agner <stefan@agner.ch>, Suzuki K Poulose <suzuki.poulose@arm.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>, Takashi Iwai <tiwai@suse.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tim Harvey <tharvey@gateworks.com>, Todor Tomov <todor.too@gmail.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Yannick Fertre <yannick.fertre@foss.st.com>,
 Alim Akhtar <alim.akhtar@samsung.com>, Fabio Estevam <festevam@gmail.com>,
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jonas Karlman <jonas@kwiboo.se>, Leo Yan <leo.yan@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Mike Leach <mike.leach@linaro.org>, Sam Ravnborg <sam@ravnborg.org>,
 Sean Paul <sean@poorly.run>, Tom Rix <trix@redhat.com>,
 coresight@lists.linaro.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-media@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-sound@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-tegra@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3 05/24] media: i2c: switch to use
 of_graph_get_next_device_endpoint()
Message-ID: <20240202174941.GA310089-robh@kernel.org>
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
 <87h6iu6qjs.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h6iu6qjs.wl-kuninori.morimoto.gx@renesas.com>
X-Mailman-Approved-At: Fri, 02 Feb 2024 18:38:42 +0000
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

On Wed, Jan 31, 2024 at 05:05:27AM +0000, Kuninori Morimoto wrote:
> of_graph_get_next_endpoint() is now renamed to
> of_graph_get_next_device_endpoint(). Switch to it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/media/i2c/adv7343.c              | 2 +-
>  drivers/media/i2c/adv748x/adv748x-core.c | 2 +-
>  drivers/media/i2c/adv7604.c              | 2 +-
>  drivers/media/i2c/isl7998x.c             | 2 +-
>  drivers/media/i2c/max9286.c              | 2 +-
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
>  drivers/media/i2c/tvp5150.c              | 4 ++--
>  drivers/media/i2c/tvp7002.c              | 2 +-
>  17 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/i2c/adv7343.c b/drivers/media/i2c/adv7343.c
> index ff21cd4744d3..7e4eb2f8bf0d 100644
> --- a/drivers/media/i2c/adv7343.c
> +++ b/drivers/media/i2c/adv7343.c
> @@ -403,7 +403,7 @@ adv7343_get_pdata(struct i2c_client *client)
>  	if (!IS_ENABLED(CONFIG_OF) || !client->dev.of_node)
>  		return client->dev.platform_data;
>  
> -	np = of_graph_get_next_endpoint(client->dev.of_node, NULL);
> +	np = of_graph_get_next_device_endpoint(client->dev.of_node, NULL);

This is assuming there's just 1 port and 1 endpoint, but let's be 
specific as the bindings are (first endpoint on port 0):

of_graph_get_endpoint_by_regs(client->dev.of_node, 0, -1);

Note we could ask for endpoint 0 here, but the bindings generally allow 
for more than 1.

I imagine most of the other cases here are the same.

>  	if (!np)
>  		return NULL;
>  
> diff --git a/drivers/media/i2c/adv748x/adv748x-core.c b/drivers/media/i2c/adv748x/adv748x-core.c
> index 3eb6d5e8f082..4e9e4cef8954 100644
> --- a/drivers/media/i2c/adv748x/adv748x-core.c
> +++ b/drivers/media/i2c/adv748x/adv748x-core.c
> @@ -657,7 +657,7 @@ static int adv748x_parse_dt(struct adv748x_state *state)
>  	bool in_found = false;
>  	int ret;
>  
> -	for_each_endpoint_of_node(state->dev->of_node, ep_np) {
> +	for_each_device_endpoint_of_node(state->dev->of_node, ep_np) {

I would skip the rename.

Rob
