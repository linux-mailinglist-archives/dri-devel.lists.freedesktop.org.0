Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DEB964A5C
	for <lists+dri-devel@lfdr.de>; Thu, 29 Aug 2024 17:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D75710E702;
	Thu, 29 Aug 2024 15:43:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WfMY30LC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18D710E702
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Aug 2024 15:43:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 03BECA441D9;
 Thu, 29 Aug 2024 15:43:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66BADC4CEC3;
 Thu, 29 Aug 2024 15:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724946198;
 bh=F7RTQPtDOnRRFJUgG6erlEaYNrW5gyiWnn8+Dsb7Ze4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WfMY30LC/MTR7UoIwYXTcquRzuZHFJKHbCE8dQm/pgWNLwbXbhdScutPCbrQGXNMM
 p1aS2YIjyBgIEGx1Y3y6u6Rp/8OugXX3duxygDxmn55nCTzUMSSCjebvCivN6+jTum
 pVHXy6F6i2nwZbdky/30D0BV9PTH8Tj2x6ppFH90oYD9fQmHMWG8JmXAh4qG8gB9+w
 GuDOEAQbCOVMyS7gbv+j12rayTdjt7VJdyg8LsNyjav1f3tkO0jQdnWnVIr2d769Ve
 jLKLR+zB3xGUbgCYUjeum+nAUs2MrwwelPppMrfJo81h72SmdprSVNYUMBRxi+606h
 0uEGmag9ZB4rg==
Date: Thu, 29 Aug 2024 10:43:16 -0500
From: Rob Herring <robh@kernel.org>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Helge Deller <deller@gmx.de>, Jaroslav Kysela <perex@perex.cz>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Saravana Kannan <saravanak@google.com>, Takashi Iwai <tiwai@suse.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-media@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-sound@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>
Subject: Re: [PATCH v4 8/9] fbdev: omapfb: use new of_graph functions
Message-ID: <20240829154316.GC465065-robh@kernel.org>
References: <87bk1d2pvt.wl-kuninori.morimoto.gx@renesas.com>
 <87zfox1b9m.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zfox1b9m.wl-kuninori.morimoto.gx@renesas.com>
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

On Wed, Aug 28, 2024 at 05:12:22AM +0000, Kuninori Morimoto wrote:
> Now we can use new port related functions for port parsing. Use it.
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/video/fbdev/omap2/omapfb/dss/dpi.c    |  3 +-
>  drivers/video/fbdev/omap2/omapfb/dss/dss-of.c | 66 -------------------
>  drivers/video/fbdev/omap2/omapfb/dss/dss.c    |  9 +--
>  drivers/video/fbdev/omap2/omapfb/dss/sdi.c    |  3 +-
>  include/video/omapfb_dss.h                    |  8 ---
>  5 files changed, 9 insertions(+), 80 deletions(-)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
> index 7c1b7d89389aa..395b1139a5ae7 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dpi.c
> @@ -20,6 +20,7 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/string.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/clk.h>
>  #include <linux/component.h>
>  
> @@ -845,7 +846,7 @@ int dpi_init_port(struct platform_device *pdev, struct device_node *port)
>  	if (!dpi)
>  		return -ENOMEM;
>  
> -	ep = omapdss_of_get_next_endpoint(port, NULL);
> +	ep = of_graph_get_next_port_endpoint(port, NULL);
>  	if (!ep)
>  		return 0;
>  
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> index 4040e247e026e..efb7d2e4ce85d 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dss-of.c
> @@ -15,72 +15,6 @@
>  
>  #include "dss.h"
>  
> -struct device_node *
> -omapdss_of_get_next_port(const struct device_node *parent,
> -			 struct device_node *prev)
> -{
> -	struct device_node *port = NULL;
> -
> -	if (!parent)
> -		return NULL;
> -
> -	if (!prev) {
> -		struct device_node *ports;
> -		/*
> -		 * It's the first call, we have to find a port subnode
> -		 * within this node or within an optional 'ports' node.
> -		 */
> -		ports = of_get_child_by_name(parent, "ports");
> -		if (ports)
> -			parent = ports;
> -
> -		port = of_get_child_by_name(parent, "port");
> -
> -		/* release the 'ports' node */
> -		of_node_put(ports);
> -	} else {
> -		struct device_node *ports;
> -
> -		ports = of_get_parent(prev);
> -		if (!ports)
> -			return NULL;
> -
> -		do {
> -			port = of_get_next_child(ports, prev);
> -			if (!port) {
> -				of_node_put(ports);
> -				return NULL;
> -			}
> -			prev = port;
> -		} while (!of_node_name_eq(port, "port"));
> -
> -		of_node_put(ports);
> -	}
> -
> -	return port;
> -}
> -EXPORT_SYMBOL_GPL(omapdss_of_get_next_port);
> -
> -struct device_node *
> -omapdss_of_get_next_endpoint(const struct device_node *parent,
> -			     struct device_node *prev)
> -{
> -	struct device_node *ep = NULL;
> -
> -	if (!parent)
> -		return NULL;
> -
> -	do {
> -		ep = of_get_next_child(parent, prev);
> -		if (!ep)
> -			return NULL;
> -		prev = ep;
> -	} while (!of_node_name_eq(ep, "endpoint"));
> -
> -	return ep;
> -}
> -EXPORT_SYMBOL_GPL(omapdss_of_get_next_endpoint);
> -
>  struct device_node *dss_of_port_get_parent_device(struct device_node *port)
>  {
>  	struct device_node *np;
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.c b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> index d814e4baa4b33..5cab317011eeb 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.c
> @@ -26,6 +26,7 @@
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
>  #include <linux/regulator/consumer.h>
>  #include <linux/suspend.h>
>  #include <linux/component.h>
> @@ -922,7 +923,7 @@ static int dss_init_ports(struct platform_device *pdev)
>  	if (parent == NULL)
>  		return 0;

of_graph_get_next_port() handles parent==NULL, so you can drop this 
check. And the other cases.

Rob
