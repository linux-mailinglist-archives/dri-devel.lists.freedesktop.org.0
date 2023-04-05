Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 671576D7566
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 09:30:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3B1710E02B;
	Wed,  5 Apr 2023 07:30:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 121C310E83C
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 07:30:26 +0000 (UTC)
Received: from booty (unknown [77.244.183.192])
 (Authenticated sender: luca.ceresoli@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 69A334000C;
 Wed,  5 Apr 2023 07:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1680679822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O56h5+y8ZPuPqlxWi1Eidn7BvjrJnSkJPZzzfeYz5iI=;
 b=XrW3kbJnPL7AjnLfuykuDK8Mp1Xjfky5soya2RLs1B6O+AOJYMIuoy9DnPW5dz+r3EoZTW
 AV6nLsajbCR38p1VhgSDw7evHVKzt8kR9iG6+HbzQa43xINjh7QEFqqxTT7J14dI++GoUL
 ANW6w+anaW1G0q+V7QP4LUt9DvQijouvoMwEF41AIOfu7LB4dUXwHmMJuKiiTh+AMnzNHC
 4oNTubm8OvrwgI8NOjS0R22XB+pg/bbicYZf1K6h513qdxuFav0l8RCrBZCcooUdA9xyRi
 /h/AWJZQGKC7GNWF7ETUZQ3q5qQ7VnBI9BbyySiTXOfaQBlioJngSm9/mnV96A==
Date: Wed, 5 Apr 2023 09:30:17 +0200
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm: bridge: ldb: add support for using channel 1 only
Message-ID: <20230405093017.62ccb4f6@booty>
In-Reply-To: <5b514970-cfc8-41de-7ae6-f608f5187860@denx.de>
References: <20230404073720.1465552-1-luca.ceresoli@bootlin.com>
 <5b514970-cfc8-41de-7ae6-f608f5187860@denx.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

thanks for the quick and detailed review!

On Wed, 5 Apr 2023 05:28:16 +0200
Marek Vasut <marex@denx.de> wrote:

> On 4/4/23 09:37, Luca Ceresoli wrote:
> 
> [...]
> 
> > @@ -177,28 +183,25 @@ static void fsl_ldb_atomic_enable(struct drm_bridge *bridge,
> >   	clk_prepare_enable(fsl_ldb->clk);
> >   
> >   	/* Program LDB_CTRL */
> > -	reg = LDB_CTRL_CH0_ENABLE;
> > -
> > -	if (fsl_ldb->lvds_dual_link)
> > -		reg |= LDB_CTRL_CH1_ENABLE | LDB_CTRL_SPLIT_MODE;
> > -
> > -	if (lvds_format_24bpp) {
> > -		reg |= LDB_CTRL_CH0_DATA_WIDTH;
> > -		if (fsl_ldb->lvds_dual_link)
> > -			reg |= LDB_CTRL_CH1_DATA_WIDTH;
> > -	}
> > -
> > -	if (lvds_format_jeida) {
> > -		reg |= LDB_CTRL_CH0_BIT_MAPPING;
> > -		if (fsl_ldb->lvds_dual_link)
> > -			reg |= LDB_CTRL_CH1_BIT_MAPPING;
> > -	}
> > -
> > -	if (mode->flags & DRM_MODE_FLAG_PVSYNC) {
> > -		reg |= LDB_CTRL_DI0_VSYNC_POLARITY;
> > -		if (fsl_ldb->lvds_dual_link)
> > -			reg |= LDB_CTRL_DI1_VSYNC_POLARITY;
> > -	}
> > +	reg =  
> 
> Cosmetic nit, do we need the newline here , can't we just move the first 
> '(fsl_ldb->ch0_enabled ? LDB_CTRL_CH0_ENABLE : 0) |' on the same line as 
> 'reg =' ? It might need a bit of indent with spaces, but that should be OK.

Sure. Maybe 'reg =<tab>(fsl...' would be even better, it checkpatch
allows.

> > @@ -311,10 +314,23 @@ static int fsl_ldb_probe(struct platform_device *pdev)
> >   	if (IS_ERR(fsl_ldb->regmap))
> >   		return PTR_ERR(fsl_ldb->regmap);
> >   
> > -	/* Locate the panel DT node. */
> > -	panel_node = of_graph_get_remote_node(dev->of_node, 1, 0);
> > -	if (!panel_node)
> > -		return -ENXIO;
> > +	/* Locate the remote ports and the panel node */
> > +	remote1 = of_graph_get_remote_node(dev->of_node, 1, 0);
> > +	remote2 = of_graph_get_remote_node(dev->of_node, 2, 0);
> > +	fsl_ldb->ch0_enabled = (remote1 != NULL);
> > +	fsl_ldb->ch1_enabled = (remote2 != NULL);
> > +	panel_node = of_node_get(remote1 ? remote1 : remote2);  
> 
> You can even do this without the middle 'remote1' I think:
> 
> panel_node = of_node_get(remote1 ? : remote2);

Apparently, but honestly with such short expressions clearly having no
side effects I think it's not helping readability.

> > +	of_node_put(remote1);
> > +	of_node_put(remote2);
> > +
> > +	if (!fsl_ldb->ch0_enabled && !fsl_ldb->ch1_enabled) {
> > +		of_node_put(panel_node);
> > +		return dev_err_probe(dev, -ENXIO, "No panel node found");
> > +	}
> > +
> > +	dev_dbg(dev, "Using %s\n",
> > +		fsl_ldb_is_dual(fsl_ldb) ? "dual mode" :  
> 
> I think this is called "dual-link mode" , maybe update the string .

I was using the terms from the NXP docs, but indeed in the kernel it
seems that "dual-link" is the common name. Updating that.

> > @@ -325,20 +341,26 @@ static int fsl_ldb_probe(struct platform_device *pdev)
> >   	if (IS_ERR(fsl_ldb->panel_bridge))
> >   		return PTR_ERR(fsl_ldb->panel_bridge);
> >   
> > -	/* Determine whether this is dual-link configuration */
> > -	port1 = of_graph_get_port_by_id(dev->of_node, 1);
> > -	port2 = of_graph_get_port_by_id(dev->of_node, 2);
> > -	dual_link = drm_of_lvds_get_dual_link_pixel_order(port1, port2);
> > -	of_node_put(port1);
> > -	of_node_put(port2);
> >   
> > -	if (dual_link == DRM_LVDS_DUAL_LINK_EVEN_ODD_PIXELS) {
> > -		dev_err(dev, "LVDS channel pixel swap not supported.\n");
> > -		return -EINVAL;
> > -	}
> > +	if (fsl_ldb_is_dual(fsl_ldb)) {
> > +		struct device_node *port1, *port2;
> > +
> > +		port1 = of_graph_get_port_by_id(dev->of_node, 1);
> > +		port2 = of_graph_get_port_by_id(dev->of_node, 2);
> > +		dual_link = drm_of_lvds_get_dual_link_pixel_order(port1, port2);
> > +		of_node_put(port1);
> > +		of_node_put(port2);
> >   
> > -	if (dual_link == DRM_LVDS_DUAL_LINK_ODD_EVEN_PIXELS)
> > -		fsl_ldb->lvds_dual_link = true;
> > +		if (dual_link < 0)
> > +			return dev_err_probe(dev, dual_link,
> > +					     "Error getting dual link configuration");  
> 
> Does this need a trailing '\n' in the formatting string or not ? I think 
> yes.

Oops, good catch.

> The rest looks good, with the few details fixed:
> 
> Reviewed-by: Marek Vasut <marex@denx.de>

Thanks!

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
