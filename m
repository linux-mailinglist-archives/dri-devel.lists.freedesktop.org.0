Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAE516B2D5
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2020 22:41:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A376E85F;
	Mon, 24 Feb 2020 21:41:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67F2A6E85F
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2020 21:41:03 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0A658E89;
 Mon, 24 Feb 2020 22:41:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1582580461;
 bh=6UaiBtvarQObo5GVB4HcCJiDttMhyMzcSXEvJoXq8XM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eBr+n6mTr9e7xtb+hpHkJCa6be4Q+cES9DbDZuI3Qcswwh317v5Em1cKrc7NAthom
 shY1X2A1yl586f/Kn2MWmxyM92wnuE5BK1wADoDeJgQmQDhPZWSoKyFDxR3aPzpI1N
 o3OkzkHDkThtkCJqn3fIk2QCPl3qF8sXzJPlPc20=
Date: Mon, 24 Feb 2020 23:40:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 1/3] drm/omap: Prepare DSS for probing without legacy
 platform data
Message-ID: <20200224214008.GD16163@pendragon.ideasonboard.com>
References: <20200224191230.30972-1-tony@atomide.com>
 <20200224191230.30972-2-tony@atomide.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224191230.30972-2-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <t-kristo@ti.com>,
 Suman Anna <s-anna@ti.com>, Dave Gerlach <d-gerlach@ti.com>,
 Keerthy <j-keerthy@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Andrew F . Davis" <afd@ti.com>, Peter Ujfalusi <peter.ujfalusi@ti.com>,
 Faiz Abbas <faiz_abbas@ti.com>, Jyri Sarha <jsarha@ti.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-omap@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Roger Quadros <rogerq@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tony,

Thank you for the patch.

On Mon, Feb 24, 2020 at 11:12:28AM -0800, Tony Lindgren wrote:
> In order to probe display subsystem (DSS) components with ti-sysc
> interconnect target module without legacy platform data and using
> devicetree, we need to update dss probing a bit.
> 
> In the device tree, we will be defining the data also for the interconnect
> target modules as DSS really is a private interconnect. There is some
> information about that in 4460 TRM in "Figure 10-3. DSS Integration" for
> example where it mentions "32-bit interconnect (SLX)".
> 
> The changes we need to make are:
> 
> 1. Parse also device tree subnodes for the compatible property fixup
> 
> 2. Update the component code to consider device tree subnodes
> 
> Cc: dri-devel@lists.freedesktop.org
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Tony Lindgren <tony@atomide.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> 
> This is needed for dropping DSS platform data that I'll be posting
> seprately. If this looks OK, can you guys please test and ack?
> 
> ---
>  drivers/gpu/drm/omapdrm/dss/dss.c             | 25 ++++++++++++++++---
>  .../gpu/drm/omapdrm/dss/omapdss-boot-init.c   | 25 +++++++++++++------
>  2 files changed, 39 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/dss.c b/drivers/gpu/drm/omapdrm/dss/dss.c
> --- a/drivers/gpu/drm/omapdrm/dss/dss.c
> +++ b/drivers/gpu/drm/omapdrm/dss/dss.c
> @@ -1339,9 +1339,15 @@ static int dss_component_compare(struct device *dev, void *data)
>  	return dev == child;
>  }
>  
> +struct dss_component_match_data {
> +	struct device *dev;
> +	struct component_match **match;
> +};
> +
>  static int dss_add_child_component(struct device *dev, void *data)
>  {
> -	struct component_match **match = data;
> +	struct dss_component_match_data *cmatch = data;
> +	struct component_match **match = cmatch->match;
>  
>  	/*
>  	 * HACK
> @@ -1352,7 +1358,17 @@ static int dss_add_child_component(struct device *dev, void *data)
>  	if (strstr(dev_name(dev), "rfbi"))
>  		return 0;
>  
> -	component_match_add(dev->parent, match, dss_component_compare, dev);
> +	/*
> +	 * Handle possible interconnect target modules defined within the DSS.
> +	 * The DSS components can be children of an interconnect target module
> +	 * after the device tree has been updated for the module data.
> +	 * See also omapdss_boot_init() for compatible fixup.
> +	 */
> +	if (strstr(dev_name(dev), "target-module"))
> +		return device_for_each_child(dev, cmatch,
> +					     dss_add_child_component);
> +
> +	component_match_add(cmatch->dev, match, dss_component_compare, dev);
>  
>  	return 0;
>  }
> @@ -1395,6 +1411,7 @@ static int dss_probe_hardware(struct dss_device *dss)
>  static int dss_probe(struct platform_device *pdev)
>  {
>  	const struct soc_device_attribute *soc;
> +	struct dss_component_match_data cmatch;
>  	struct component_match *match = NULL;
>  	struct resource *dss_mem;
>  	struct dss_device *dss;
> @@ -1472,7 +1489,9 @@ static int dss_probe(struct platform_device *pdev)
>  
>  	omapdss_gather_components(&pdev->dev);
>  
> -	device_for_each_child(&pdev->dev, &match, dss_add_child_component);
> +	cmatch.dev = &pdev->dev;
> +	cmatch.match = &match;
> +	device_for_each_child(&pdev->dev, &cmatch, dss_add_child_component);
>  
>  	r = component_master_add_with_match(&pdev->dev, &dss_component_ops, match);
>  	if (r)
> diff --git a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
> --- a/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
> +++ b/drivers/gpu/drm/omapdrm/dss/omapdss-boot-init.c
> @@ -183,9 +183,24 @@ static const struct of_device_id omapdss_of_fixups_whitelist[] __initconst = {
>  	{},
>  };
>  
> +static void __init omapdss_find_children(struct device_node *np)
> +{
> +	struct device_node *child;
> +
> +	for_each_available_child_of_node(np, child) {
> +		if (!of_find_property(child, "compatible", NULL))
> +			continue;
> +
> +		omapdss_walk_device(child, true);
> +
> +		if (of_device_is_compatible(child, "ti,sysc"))
> +			omapdss_find_children(child);
> +	}
> +}
> +
>  static int __init omapdss_boot_init(void)
>  {
> -	struct device_node *dss, *child;
> +	struct device_node *dss;
>  
>  	INIT_LIST_HEAD(&dss_conv_list);
>  
> @@ -195,13 +210,7 @@ static int __init omapdss_boot_init(void)
>  		return 0;
>  
>  	omapdss_walk_device(dss, true);
> -
> -	for_each_available_child_of_node(dss, child) {
> -		if (!of_find_property(child, "compatible", NULL))
> -			continue;
> -
> -		omapdss_walk_device(child, true);
> -	}
> +	omapdss_find_children(dss);
>  
>  	while (!list_empty(&dss_conv_list)) {
>  		struct dss_conv_node *n;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
