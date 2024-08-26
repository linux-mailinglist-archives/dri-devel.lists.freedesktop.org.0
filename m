Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C8DE95F54B
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 17:40:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C1E810E1E2;
	Mon, 26 Aug 2024 15:40:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tXEis2oZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3648510E183
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 15:40:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2C29AA4141A;
 Mon, 26 Aug 2024 15:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F7E6C52FC1;
 Mon, 26 Aug 2024 15:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724686812;
 bh=3nPEGv1ScbaB4qHxVjJQ7z0P5oNlCzTkuKeiIaD8G4U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tXEis2oZr+7TJtq6SLWNyCtyZ3RaEWuaa3hHuJShWSnlk4zDlfSTBrLQLLmFddZew
 yz0j/PDCq4oPjmR4v7fRrPpN1MW0KMRcFRqxLJi7DX+frL/fWFhQJSqygHgo6TAmdY
 TA3oqAoRjxnlgbPwyWiuG3Ysd1bYMo0OPUfmuyzL7w8xlFurcr8pz/XzrOZ12at/yE
 9WpTKkU8bcNvifnyAodtkkSNOFALcUeaqHbsCmu3tdw8wVjKV8seaPVmig2fYNSn6C
 2M6yQcWpC3uCJrxYhdNJVVLD2Q9IubAzGQafk4T0uBAJvu8mYUxQzfKrMVzKU50db9
 DbkRhZXNAkNjQ==
Date: Mon, 26 Aug 2024 10:40:09 -0500
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
Subject: Re: [PATCH v3 2/9] of: property: add of_graph_get_next_port_endpoint()
Message-ID: <20240826154009.GA300981-robh@kernel.org>
References: <87cylwqa12.wl-kuninori.morimoto.gx@renesas.com>
 <87a5h0qa0g.wl-kuninori.morimoto.gx@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a5h0qa0g.wl-kuninori.morimoto.gx@renesas.com>
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

On Mon, Aug 26, 2024 at 02:43:28AM +0000, Kuninori Morimoto wrote:
> We already have of_graph_get_next_endpoint(), but it is not
> intuitive to use in some case.

Can of_graph_get_next_endpoint() users be replaced with your new 
helpers? I'd really like to get rid of the 3 remaining users.

> 
> (X)	node {
> (Y)		ports {
> (P0)			port@0 { endpoint { remote-endpoint = ...; };};
> (P10)			port@1 { endpoint { remote-endpoint = ...; };
> (P11)				 endpoint { remote-endpoint = ...; };};
> (P2)			port@2 { endpoint { remote-endpoint = ...; };};
> 		};
> 	};
> 
> For example, if I want to handle port@1's 2 endpoints (= P10, P11),
> I want to use like below
> 
> 	P10 = of_graph_get_next_endpoint(port1, NULL);
> 	P11 = of_graph_get_next_endpoint(port1, P10);
> 
> But 1st one will be error, because of_graph_get_next_endpoint()
> requested "parent" means "node" (X) or "ports" (Y), not "port".
> Below works, but it will get P0
> 
> 	/* These will be node/ports/port@0/endpoint */
> 	P0 = of_graph_get_next_endpoint(node,  NULL);
> 	P0 = of_graph_get_next_endpoint(ports, NULL);
> 
> In other words, we can't handle P10/P11 directly via
> of_graph_get_next_endpoint() so far.
> 
> There is another non intuitive behavior on of_graph_get_next_endpoint().
> In case of if I could get P10 pointer for some way, and if I want to
> handle port@1 things, I would like use it like below
> 
> 	/*
> 	 * "ep" is now P10, and handle port1 things here,
> 	 * but we don't know how many endpoints port1 has.
> 	 *
> 	 * Because "ep" is non NULL now, we can use port1
> 	 * as of_graph_get_next_endpoint(port1, xxx)
> 	 */
> 	do {
> 		/* do something for port1 specific things here */
> 	} while (ep = of_graph_get_next_endpoint(port1, ep))
> 
> But it also not worked as I expected.
> I expect it will be P10 -> P11 -> NULL,
> but      it will be P10 -> P11 -> P2,    because
> of_graph_get_next_endpoint() will fetch "endpoint" beyond the "port".
> 
> It is not useful on generic driver.
> It uses of_get_next_child() instead for now, but it is not intuitive.
> And it doesn't check node name (= "endpoint").
> 
> To handle endpoint more intuitive, create of_graph_get_next_port_endpoint()
> 
> 	of_graph_get_next_port_endpoint(port1, NULL); // P10
> 	of_graph_get_next_port_endpoint(port1, P10);  // P11
> 	of_graph_get_next_port_endpoint(port1, P11);  // NULL
> 
> Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> ---
>  drivers/of/property.c    | 22 ++++++++++++++++++++++
>  include/linux/of_graph.h | 20 ++++++++++++++++++++
>  2 files changed, 42 insertions(+)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index aec6ac9f70064..90820e43bc973 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -719,6 +719,28 @@ struct device_node *of_graph_get_next_port(struct device_node *parent,
>  }
>  EXPORT_SYMBOL(of_graph_get_next_port);
>  
> +/**
> + * of_graph_get_next_port_endpoint() - get next endpoint node in port.
> + * If it reached to end of the port, it will return NULL.
> + * @port: pointer to the target port node
> + * @prev: previous endpoint node, or NULL to get first
> + *
> + * Return: An 'endpoint' node pointer with refcount incremented. Refcount
> + * of the passed @prev node is decremented.
> + */
> +struct device_node *of_graph_get_next_port_endpoint(const struct device_node *port,
> +						    struct device_node *prev)
> +{
> +	do {
> +		prev = of_get_next_child(port, prev);
> +		if (!prev)
> +			break;
> +	} while (!of_node_name_eq(prev, "endpoint"));

Really, this check is validation as no other name is valid in a 
port node. The kernel is not responsible for validation, but okay. 
However, if we are going to keep this, might as well make it WARN().

> +
> +	return prev;
> +}
> +EXPORT_SYMBOL(of_graph_get_next_port_endpoint);
> +
>  /**
>   * of_graph_get_next_endpoint() - get next endpoint node
>   * @parent: pointer to the parent device node
> diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> index a6b91577700a8..967ee14a1ff37 100644
> --- a/include/linux/of_graph.h
> +++ b/include/linux/of_graph.h
> @@ -59,6 +59,17 @@ struct of_endpoint {
>  	for (child = of_graph_get_next_port(parent, NULL); child != NULL; \
>  	     child = of_graph_get_next_port(parent, child))
>  
> +/**
> + * for_each_of_graph_port_endpoint - iterate over every endpoint in a port node
> + * @parent: parent port node
> + * @child: loop variable pointing to the current endpoint node
> + *
> + * When breaking out of the loop, of_node_put(child) has to be called manually.

No need for this requirement anymore. Use cleanup.h so this is 
automatic.

> + */
> +#define for_each_of_graph_port_endpoint(parent, child)			\
> +		for (child = of_graph_get_next_port_endpoint(parent, NULL); child != NULL; \
> +		     child = of_graph_get_next_port_endpoint(parent, child))
> +
>  #ifdef CONFIG_OF
>  bool of_graph_is_present(const struct device_node *node);
>  int of_graph_parse_endpoint(const struct device_node *node,
> @@ -72,6 +83,8 @@ struct device_node *of_graph_get_next_ports(struct device_node *parent,
>  					    struct device_node *ports);
>  struct device_node *of_graph_get_next_port(struct device_node *parent,
>  					   struct device_node *port);
> +struct device_node *of_graph_get_next_port_endpoint(const struct device_node *port,
> +						    struct device_node *prev);
>  struct device_node *of_graph_get_endpoint_by_regs(
>  		const struct device_node *parent, int port_reg, int reg);
>  struct device_node *of_graph_get_remote_endpoint(
> @@ -132,6 +145,13 @@ static inline struct device_node *of_graph_get_next_port(
>  	return NULL;
>  }
>  
> +static inline struct device_node *of_graph_get_next_port_endpoint(
> +					const struct device_node *parent,
> +					struct device_node *previous)
> +{
> +	return NULL;
> +}
> +
>  static inline struct device_node *of_graph_get_endpoint_by_regs(
>  		const struct device_node *parent, int port_reg, int reg)
>  {
> -- 
> 2.43.0
> 
