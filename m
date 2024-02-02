Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C01838477B6
	for <lists+dri-devel@lfdr.de>; Fri,  2 Feb 2024 19:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B510010E121;
	Fri,  2 Feb 2024 18:38:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="g2CV4Vs8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBE810EFEB;
 Fri,  2 Feb 2024 17:56:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D841B62778;
 Fri,  2 Feb 2024 17:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E93CCC433F1;
 Fri,  2 Feb 2024 17:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1706896578;
 bh=xQdrcH5A8lS5nkpqdWRHj3iy+HYu6WHXpSprNhL18UA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g2CV4Vs8NwjSqfiNsg00uiOUdnJJuA7G6PBrsuSCuxbv159o1b4ZRSuF7OyTOhtXg
 woENTE2tEZiFG6VnssVe1AxW7cvrV8xCAzqix43Te7abvn9q8+RF6SOXtZyIcnOd3y
 EMYamJE3kVbXgwiLkfmAorueG9GOYjnbUGjmWYicmeuDQb7yE/HCvCrsZEp9qL20tc
 M3BgLxNOK490xXJIWbzOX+llq2joPitSar6Z8ot+4L7yd75BSNC4fGtERsbpSjDrtn
 NnsQy+ONyY/VxQ31aLDNyN4L0XbrqNwwIQMDBndcSSeplbKpdbTRz0G4RiT6I92gnA
 3v9r2pn+G8JZQ==
Date: Fri, 2 Feb 2024 11:56:16 -0600
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
Subject: Re: [PATCH v3 06/24] media: platform: switch to use
 of_graph_get_next_device_endpoint()
Message-ID: <20240202175616.GB310089-robh@kernel.org>
References: <87o7d26qla.wl-kuninori.morimoto.gx@renesas.com>
 <87frye6qjl.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87frye6qjl.wl-kuninori.morimoto.gx@renesas.com>
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

On Wed, Jan 31, 2024 at 05:05:34AM +0000, Kuninori Morimoto wrote:
> of_graph_get_next_endpoint() is now renamed to
> of_graph_get_next_device_endpoint(). Switch to it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/media/platform/atmel/atmel-isi.c                 | 4 ++--
>  drivers/media/platform/intel/pxa_camera.c                | 2 +-
>  drivers/media/platform/microchip/microchip-sama5d2-isc.c | 2 +-
>  drivers/media/platform/microchip/microchip-sama7g5-isc.c | 2 +-
>  drivers/media/platform/qcom/camss/camss.c                | 2 +-
>  drivers/media/platform/renesas/renesas-ceu.c             | 2 +-
>  drivers/media/platform/samsung/exynos4-is/fimc-is.c      | 2 +-
>  drivers/media/platform/samsung/exynos4-is/mipi-csis.c    | 2 +-
>  drivers/media/platform/st/stm32/stm32-dcmi.c             | 4 ++--
>  drivers/media/platform/ti/am437x/am437x-vpfe.c           | 2 +-
>  drivers/media/platform/ti/davinci/vpif.c                 | 3 +--
>  drivers/media/platform/ti/davinci/vpif_capture.c         | 3 +--
>  drivers/media/platform/video-mux.c                       | 2 +-
>  drivers/media/platform/xilinx/xilinx-vipp.c              | 2 +-
>  14 files changed, 16 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/media/platform/atmel/atmel-isi.c b/drivers/media/platform/atmel/atmel-isi.c
> index 4046212d48b4..4317750d05ad 100644
> --- a/drivers/media/platform/atmel/atmel-isi.c
> +++ b/drivers/media/platform/atmel/atmel-isi.c
> @@ -831,7 +831,7 @@ static int atmel_isi_parse_dt(struct atmel_isi *isi,
>  	isi->pdata.full_mode = 1;
>  	isi->pdata.frate = ISI_CFG1_FRATE_CAPTURE_ALL;
>  
> -	np = of_graph_get_next_endpoint(np, NULL);
> +	np = of_graph_get_next_device_endpoint(np, NULL);

Same comment on using of_graph_get_endpoint_by_regs().


>  	if (!np) {
>  		dev_err(&pdev->dev, "Could not find the endpoint\n");
>  		return -EINVAL;
> @@ -1155,7 +1155,7 @@ static int isi_graph_init(struct atmel_isi *isi)
>  	struct device_node *ep;
>  	int ret;
>  
> -	ep = of_graph_get_next_endpoint(isi->dev->of_node, NULL);
> +	ep = of_graph_get_next_device_endpoint(isi->dev->of_node, NULL);
>  	if (!ep)
>  		return -EINVAL;
>  
> diff --git a/drivers/media/platform/intel/pxa_camera.c b/drivers/media/platform/intel/pxa_camera.c
> index 59b89e421dc2..f2175c03502b 100644
> --- a/drivers/media/platform/intel/pxa_camera.c
> +++ b/drivers/media/platform/intel/pxa_camera.c
> @@ -2207,7 +2207,7 @@ static int pxa_camera_pdata_from_dt(struct device *dev,
>  		pcdev->mclk = mclk_rate;
>  	}
>  
> -	np = of_graph_get_next_endpoint(np, NULL);
> +	np = of_graph_get_next_device_endpoint(np, NULL);
>  	if (!np) {
>  		dev_err(dev, "could not find endpoint\n");
>  		return -EINVAL;
> diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
> index 5ac149cf3647..201049c047b0 100644
> --- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
> +++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
> @@ -363,7 +363,7 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
>  	while (1) {
>  		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
>  
> -		epn = of_graph_get_next_endpoint(np, epn);
> +		epn = of_graph_get_next_device_endpoint(np, epn);

Looks like this should use the iterator?


>  		if (!epn)
>  			return 0;
>  
> diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> index 73445f33d26b..b617a9bcd398 100644
> --- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> +++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
> @@ -349,7 +349,7 @@ static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
>  	while (1) {
>  		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
>  
> -		epn = of_graph_get_next_endpoint(np, epn);
> +		epn = of_graph_get_next_device_endpoint(np, epn);
>  		if (!epn)
>  			return 0;
>  
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
> index 8e78dd8d5961..cbb6f88cfe4a 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -1136,7 +1136,7 @@ static int camss_of_parse_ports(struct camss *camss)
>  	struct device_node *remote = NULL;
>  	int ret, num_subdevs = 0;
>  
> -	for_each_endpoint_of_node(dev->of_node, node) {
> +	for_each_device_endpoint_of_node(dev->of_node, node) {
>  		struct camss_async_subdev *csd;
>  
>  		if (!of_device_is_available(node))
> diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media/platform/renesas/renesas-ceu.c
> index 2562b30acfb9..929d17de4ac9 100644
> --- a/drivers/media/platform/renesas/renesas-ceu.c
> +++ b/drivers/media/platform/renesas/renesas-ceu.c
> @@ -1526,7 +1526,7 @@ static int ceu_parse_dt(struct ceu_device *ceudev)
>  	int num_ep;
>  	int ret;
>  
> -	num_ep = of_graph_get_endpoint_count(of);
> +	num_ep = of_graph_get_device_endpoint_count(of);
>  	if (!num_ep)
>  		return -ENODEV;
>  
> diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is.c b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
> index a08c87ef6e2d..5ab0399b7718 100644
> --- a/drivers/media/platform/samsung/exynos4-is/fimc-is.c
> +++ b/drivers/media/platform/samsung/exynos4-is/fimc-is.c
> @@ -175,7 +175,7 @@ static int fimc_is_parse_sensor_config(struct fimc_is *is, unsigned int index,
>  		return -EINVAL;
>  	}
>  
> -	ep = of_graph_get_next_endpoint(node, NULL);
> +	ep = of_graph_get_next_device_endpoint(node, NULL);
>  	if (!ep)
>  		return -ENXIO;
>  
> diff --git a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
> index 686ca8753ba2..a332b4bd76f2 100644
> --- a/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
> +++ b/drivers/media/platform/samsung/exynos4-is/mipi-csis.c
> @@ -728,7 +728,7 @@ static int s5pcsis_parse_dt(struct platform_device *pdev,
>  				 &state->max_num_lanes))
>  		return -EINVAL;
>  
> -	node = of_graph_get_next_endpoint(node, NULL);
> +	node = of_graph_get_next_device_endpoint(node, NULL);
>  	if (!node) {
>  		dev_err(&pdev->dev, "No port node at %pOF\n",
>  				pdev->dev.of_node);
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
> index 8cb4fdcae137..320101f4ad40 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmi.c
> +++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
> @@ -1856,7 +1856,7 @@ static int dcmi_graph_init(struct stm32_dcmi *dcmi)
>  	struct device_node *ep;
>  	int ret;
>  
> -	ep = of_graph_get_next_endpoint(dcmi->dev->of_node, NULL);
> +	ep = of_graph_get_next_device_endpoint(dcmi->dev->of_node, NULL);
>  	if (!ep) {
>  		dev_err(dcmi->dev, "Failed to get next endpoint\n");
>  		return -EINVAL;
> @@ -1915,7 +1915,7 @@ static int dcmi_probe(struct platform_device *pdev)
>  				     "Could not get reset control\n");
>  
>  	/* Get bus characteristics from devicetree */
> -	np = of_graph_get_next_endpoint(np, NULL);
> +	np = of_graph_get_next_device_endpoint(np, NULL);
>  	if (!np) {
>  		dev_err(&pdev->dev, "Could not find the endpoint\n");
>  		return -ENODEV;
> diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> index 5fa2ea9025d9..46876865ec6a 100644
> --- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> @@ -2309,7 +2309,7 @@ vpfe_get_pdata(struct vpfe_device *vpfe)
>  		struct v4l2_fwnode_endpoint bus_cfg = { .bus_type = 0 };
>  		struct device_node *rem;
>  
> -		endpoint = of_graph_get_next_endpoint(dev->of_node, endpoint);
> +		endpoint = of_graph_get_next_device_endpoint(dev->of_node, endpoint);
>  		if (!endpoint)
>  			break;
>  
> diff --git a/drivers/media/platform/ti/davinci/vpif.c b/drivers/media/platform/ti/davinci/vpif.c
> index 63cdfed37bc9..021ca79e832b 100644
> --- a/drivers/media/platform/ti/davinci/vpif.c
> +++ b/drivers/media/platform/ti/davinci/vpif.c
> @@ -465,8 +465,7 @@ static int vpif_probe(struct platform_device *pdev)
>  	 * so their devices need to be registered manually here
>  	 * for their legacy platform_drivers to work.
>  	 */
> -	endpoint = of_graph_get_next_endpoint(pdev->dev.of_node,
> -					      endpoint);
> +	endpoint = of_graph_get_next_device_endpoint(pdev->dev.of_node, endpoint);
>  	if (!endpoint)
>  		return 0;
>  	of_node_put(endpoint);
> diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/media/platform/ti/davinci/vpif_capture.c
> index 99fae8830c41..805c313b41dc 100644
> --- a/drivers/media/platform/ti/davinci/vpif_capture.c
> +++ b/drivers/media/platform/ti/davinci/vpif_capture.c
> @@ -1521,8 +1521,7 @@ vpif_capture_get_pdata(struct platform_device *pdev,
>  		unsigned int flags;
>  		int err;
>  
> -		endpoint = of_graph_get_next_endpoint(pdev->dev.of_node,
> -						      endpoint);
> +		endpoint = of_graph_get_next_device_endpoint(pdev->dev.of_node, endpoint);
>  		if (!endpoint)
>  			break;
>  
> diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
> index 5de6b6694f53..61d84ade7155 100644
> --- a/drivers/media/platform/video-mux.c
> +++ b/drivers/media/platform/video-mux.c
> @@ -408,7 +408,7 @@ static int video_mux_probe(struct platform_device *pdev)
>  	 * The largest numbered port is the output port. It determines
>  	 * total number of pads.
>  	 */
> -	for_each_endpoint_of_node(np, ep) {
> +	for_each_device_endpoint_of_node(np, ep) {
>  		struct of_endpoint endpoint;
>  
>  		of_graph_parse_endpoint(ep, &endpoint);
> diff --git a/drivers/media/platform/xilinx/xilinx-vipp.c b/drivers/media/platform/xilinx/xilinx-vipp.c
> index 996684a73038..9230931d6d7a 100644
> --- a/drivers/media/platform/xilinx/xilinx-vipp.c
> +++ b/drivers/media/platform/xilinx/xilinx-vipp.c
> @@ -207,7 +207,7 @@ static int xvip_graph_build_dma(struct xvip_composite_device *xdev)
>  
>  	while (1) {
>  		/* Get the next endpoint and parse its link. */
> -		ep = of_graph_get_next_endpoint(node, ep);
> +		ep = of_graph_get_next_device_endpoint(node, ep);

The rest of this file uses fwnode versions including the very next 
function. This should be fwnode_graph_get_next_endpoint(). But then it's 
a loop, so should be a loop iterator instead.

Rob
