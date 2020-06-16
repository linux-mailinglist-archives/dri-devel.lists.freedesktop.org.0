Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 453101FA593
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 03:21:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BFD76E598;
	Tue, 16 Jun 2020 01:21:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 197646E598
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 01:21:36 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A07EF9;
 Tue, 16 Jun 2020 03:21:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1592270493;
 bh=aU7Ie58MknMsKT63S1TAPowl2F0d9L67fIBN7nnNeCU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oqBp/vmvjePb+UU+aL9IUh9VMoMIgzFHAKicc4Y8Rtms2g7h6hai8Qx1MkBekOApM
 qz9wVCBn79JofxFEQ7hK2q/0lGteR+LCQA4SZ+fXEBzGHsIfMi8OquHLfWGNBsu3TX
 DfgIr2MEOeyP3Dt+Qtqp4chPxPmKNobuFNKH1B9w=
Date: Tue, 16 Jun 2020 04:21:11 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 1/6] of_graph: add of_graph_get_local_port()
Message-ID: <20200616012111.GE1629@pendragon.ideasonboard.com>
References: <20200614172234.8856-1-digetx@gmail.com>
 <20200614172234.8856-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200614172234.8856-2-digetx@gmail.com>
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
Cc: devicetree@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

Thank you for the patch.

On Sun, Jun 14, 2020 at 08:22:29PM +0300, Dmitry Osipenko wrote:
> In some case, like a DRM display code for example, it's useful to silently
> check whether port node exists at all in a device-tree before proceeding
> with parsing the graph.
> 
> This patch adds of_graph_get_local_port() which returns pointer to a local
> port node, or NULL if graph isn't specified in a device-tree for a given
> device node.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/of/property.c    | 32 +++++++++++++++++++++++---------
>  include/linux/of_graph.h |  7 +++++++
>  2 files changed, 30 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 1f2086f4e7ce..05c5f619b8bb 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -608,15 +608,7 @@ struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
>  	 * parent port node.
>  	 */
>  	if (!prev) {
> -		struct device_node *node;
> -
> -		node = of_get_child_by_name(parent, "ports");
> -		if (node)
> -			parent = node;
> -
> -		port = of_get_child_by_name(parent, "port");
> -		of_node_put(node);
> -
> +		port = of_graph_get_local_port(parent);
>  		if (!port) {
>  			pr_err("graph: no port node found in %pOF\n", parent);
>  			return NULL;
> @@ -765,6 +757,28 @@ struct device_node *of_graph_get_remote_port(const struct device_node *node)
>  }
>  EXPORT_SYMBOL(of_graph_get_remote_port);
>  
> +/**
> + * of_graph_get_local_port() - get local port node
> + * @node: pointer to a local endpoint device_node
> + *
> + * Return: First local port node associated with local endpoint node linked
> + *	   to @node. Use of_node_put() on it when done.
> + */
> +struct device_node *of_graph_get_local_port(const struct device_node *node)
> +{
> +	struct device_node *ports, *port;
> +
> +	ports = of_get_child_by_name(node, "ports");
> +	if (ports)
> +		node = ports;
> +
> +	port = of_get_child_by_name(node, "port");
> +	of_node_put(ports);
> +
> +	return port;

The implementation doesn't seem to match the documentation. If node is a
pointer to an endpoint, it should not have any ports child.

> +}
> +EXPORT_SYMBOL(of_graph_get_local_port);
> +
>  int of_graph_get_endpoint_count(const struct device_node *np)
>  {
>  	struct device_node *endpoint;
> diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> index 01038a6aade0..1fdeb72c7765 100644
> --- a/include/linux/of_graph.h
> +++ b/include/linux/of_graph.h
> @@ -54,6 +54,7 @@ struct device_node *of_graph_get_remote_port_parent(
>  struct device_node *of_graph_get_remote_port(const struct device_node *node);
>  struct device_node *of_graph_get_remote_node(const struct device_node *node,
>  					     u32 port, u32 endpoint);
> +struct device_node *of_graph_get_local_port(const struct device_node *node);
>  #else
>  
>  static inline int of_graph_parse_endpoint(const struct device_node *node,
> @@ -116,6 +117,12 @@ static inline struct device_node *of_graph_get_remote_node(
>  	return NULL;
>  }
>  
> +static inline struct device_node *of_graph_get_local_port(
> +					const struct device_node *node)
> +{
> +	return NULL;
> +}
> +
>  #endif /* CONFIG_OF */
>  
>  #endif /* __LINUX_OF_GRAPH_H */
> -- 
> 2.26.0
> 

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
