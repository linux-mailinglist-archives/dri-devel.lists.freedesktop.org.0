Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B941C766B
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 18:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91B7A6E8AA;
	Wed,  6 May 2020 16:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21396E8A8
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 16:32:42 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id B68C980500;
 Wed,  6 May 2020 18:32:38 +0200 (CEST)
Date: Wed, 6 May 2020 18:32:37 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Dmitry Osipenko <digetx@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 1/6] of_graph: add of_graph_get_local_port()
Message-ID: <20200506163237.GA19296@ravnborg.org>
References: <20200418170703.1583-1-digetx@gmail.com>
 <20200418170703.1583-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200418170703.1583-2-digetx@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=MOBOZvRl c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=cgQggk8NgEdHG04IN60A:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=Vxmtnl_E_bksehYqCbjh:22
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
Cc: devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry

On Sat, Apr 18, 2020 at 08:06:58PM +0300, Dmitry Osipenko wrote:
> In some case, like a DRM display code for example, it's useful to silently
> check whether port node exists at all in a device-tree before proceeding
> with parsing the graph.
> 
> This patch adds of_graph_get_local_port() which returns pointer to a local
> port node, or NULL if graph isn't specified in a device-tree for a given
> device node.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Nice little helper function.
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Rob - OK to commit to drm-misc-next?

	Sam

> ---
>  drivers/of/property.c    | 32 +++++++++++++++++++++++---------
>  include/linux/of_graph.h |  7 +++++++
>  2 files changed, 30 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 252e4f600155..5dbeccaabb86 100644
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
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
