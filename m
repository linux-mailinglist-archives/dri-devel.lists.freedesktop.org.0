Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D89F584BB40
	for <lists+dri-devel@lfdr.de>; Tue,  6 Feb 2024 17:44:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32AA810E6AE;
	Tue,  6 Feb 2024 16:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cw1+savb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2405310E6AE
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Feb 2024 16:44:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (117.145-247-81.adsl-dyn.isp.belgacom.be [81.247.145.117])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id AC30C74A;
 Tue,  6 Feb 2024 17:43:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1707237785;
 bh=K6G7EqF6aigFxEzvt49ggiwTXwmHFHPviNYyVpcqf74=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cw1+savbvw/X4hlFF49bIw9MtlsD9RU5N4r4Oq3JDohk83TQVv/CsvPp/lJ8RCyrR
 TYKlOwlWfdqjs8IbmUDw2IwG0uliy504d51XqHGImWfnERiyRyvGA9Qy+ASaUlNk6R
 hV5XbBSmp5c2qqNeoHRAUihJllk0Cntj6i3/w1W8=
Date: Tue, 6 Feb 2024 18:44:29 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
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
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Helge Deller <deller@gmx.de>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
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
Subject: Re: [PATCH 4/4] video: fbdev: replace of_graph_get_next_endpoint()
Message-ID: <20240206164429.GD2827@pendragon.ideasonboard.com>
References: <87ttmmnvzh.wl-kuninori.morimoto.gx@renesas.com>
 <87o7cunvwv.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87o7cunvwv.wl-kuninori.morimoto.gx@renesas.com>
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

Thank you for the patch.

On Tue, Feb 06, 2024 at 02:55:45AM +0000, Kuninori Morimoto wrote:
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
>  drivers/video/fbdev/amba-clcd.c               |  2 +-
>  drivers/video/fbdev/omap2/omapfb/dss/dsi.c    |  3 ++-
>  drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 20 +------------------
>  drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c  |  3 ++-
>  drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c  |  3 ++-
>  drivers/video/fbdev/omap2/omapfb/dss/venc.c   |  3 ++-
>  drivers/video/fbdev/pxafb.c                   |  2 +-
>  include/video/omapfb_dss.h                    |  3 ---
>  8 files changed, 11 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/video/fbdev/amba-clcd.c b/drivers/video/fbdev/amba-clcd.c
> index 0399db369e70..2371b204cfd2 100644
> --- a/drivers/video/fbdev/amba-clcd.c
> +++ b/drivers/video/fbdev/amba-clcd.c

This driver has been deleted in v6.8-rc1.

> @@ -691,7 +691,7 @@ static int clcdfb_of_init_display(struct clcd_fb *fb)
>  	/*
>  	 * Fetch the panel endpoint.
>  	 */
> -	endpoint = of_graph_get_next_endpoint(fb->dev->dev.of_node, NULL);
> +	endpoint = of_graph_get_endpoint_by_regs(fb->dev->dev.of_node, 0, -1);
>  	if (!endpoint)
>  		return -ENODEV;
>  
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> index b7eb17a16ec4..1f13bcf73da5 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dsi.c
> @@ -28,6 +28,7 @@
>  #include <linux/debugfs.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/of_platform.h>
>  #include <linux/component.h>
>  
> @@ -5079,7 +5080,7 @@ static int dsi_probe_of(struct platform_device *pdev)
>  	struct device_node *ep;
>  	struct omap_dsi_pin_config pin_cfg;
>  
> -	ep = omapdss_of_get_first_endpoint(node);
> +	ep = of_graph_get_endpoint_by_regs(node, 0, -1);
>  	if (!ep)
>  		return 0;
>  
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> index 0282d4eef139..14965a3fd05b 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> @@ -130,24 +130,6 @@ static struct device_node *omapdss_of_get_remote_port(const struct device_node *
>  	return np;
>  }
>  
> -struct device_node *
> -omapdss_of_get_first_endpoint(const struct device_node *parent)
> -{
> -	struct device_node *port, *ep;
> -
> -	port = omapdss_of_get_next_port(parent, NULL);
> -
> -	if (!port)
> -		return NULL;
> -
> -	ep = omapdss_of_get_next_endpoint(port, NULL);
> -
> -	of_node_put(port);
> -
> -	return ep;
> -}
> -EXPORT_SYMBOL_GPL(omapdss_of_get_first_endpoint);
> -

I *think* replacing omapdss_of_get_first_endpoint() with
of_graph_get_endpoint_by_regs(0, -1) is functionally equivalent in all
cases, but a confirmation from Tomi would be nice. I wonder if it
wouldn't be time to drop the fbdev driver though...

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  struct omap_dss_device *
>  omapdss_of_find_source_for_first_ep(struct device_node *node)
>  {
> @@ -155,7 +137,7 @@ omapdss_of_find_source_for_first_ep(struct device_node *node)
>  	struct device_node *src_port;
>  	struct omap_dss_device *src;
>  
> -	ep = omapdss_of_get_first_endpoint(node);
> +	ep = of_graph_get_endpoint_by_regs(node, 0, -1);
>  	if (!ep)
>  		return ERR_PTR(-EINVAL);
>  
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
> index f05b4e35a842..8f407ec134dc 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi4.c
> @@ -20,6 +20,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/clk.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/component.h>
>  #include <video/omapfb_dss.h>
> @@ -529,7 +530,7 @@ static int hdmi_probe_of(struct platform_device *pdev)
>  	struct device_node *ep;
>  	int r;
>  
> -	ep = omapdss_of_get_first_endpoint(node);
> +	ep = of_graph_get_endpoint_by_regs(node, 0, -1);
>  	if (!ep)
>  		return 0;
>  
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
> index 03292945b1d4..4ad219f522b9 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/hdmi5.c
> @@ -25,6 +25,7 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/clk.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/component.h>
>  #include <video/omapfb_dss.h>
> @@ -561,7 +562,7 @@ static int hdmi_probe_of(struct platform_device *pdev)
>  	struct device_node *ep;
>  	int r;
>  
> -	ep = omapdss_of_get_first_endpoint(node);
> +	ep = of_graph_get_endpoint_by_regs(node, 0, -1);
>  	if (!ep)
>  		return 0;
>  
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/venc.c b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
> index c9d40e28a06f..0bd80d3b8f1b 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/venc.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/venc.c
> @@ -24,6 +24,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/component.h>
>  
>  #include <video/omapfb_dss.h>
> @@ -764,7 +765,7 @@ static int venc_probe_of(struct platform_device *pdev)
>  	u32 channels;
>  	int r;
>  
> -	ep = omapdss_of_get_first_endpoint(node);
> +	ep = of_graph_get_endpoint_by_regs(node, 0, -1);
>  	if (!ep)
>  		return 0;
>  
> diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
> index fa943612c4e2..2ef56fa28aff 100644
> --- a/drivers/video/fbdev/pxafb.c
> +++ b/drivers/video/fbdev/pxafb.c
> @@ -2171,7 +2171,7 @@ static int of_get_pxafb_mode_info(struct device *dev,
>  	u32 bus_width;
>  	int ret, i;
>  
> -	np = of_graph_get_next_endpoint(dev->of_node, NULL);
> +	np = of_graph_get_endpoint_by_regs(dev->of_node, 0, -1);
>  	if (!np) {
>  		dev_err(dev, "could not find endpoint\n");
>  		return -EINVAL;
> diff --git a/include/video/omapfb_dss.h b/include/video/omapfb_dss.h
> index e8eaac2cb7b8..a8c0c3eeeb5b 100644
> --- a/include/video/omapfb_dss.h
> +++ b/include/video/omapfb_dss.h
> @@ -819,9 +819,6 @@ struct device_node *
>  omapdss_of_get_next_endpoint(const struct device_node *parent,
>  			     struct device_node *prev);
>  
> -struct device_node *
> -omapdss_of_get_first_endpoint(const struct device_node *parent);
> -
>  struct omap_dss_device *
>  omapdss_of_find_source_for_first_ep(struct device_node *node);
>  #else

-- 
Regards,

Laurent Pinchart
