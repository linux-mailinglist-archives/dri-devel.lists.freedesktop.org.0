Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBF221058A
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 09:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBBFD893AB;
	Wed,  1 Jul 2020 07:55:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422ED893AB
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 07:55:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 48544556;
 Wed,  1 Jul 2020 09:55:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1593590156;
 bh=SBS3cYIeUtLrgvHJfEpKTIWd7IrgonFBNo28g+dS7hg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l7jruMLb0PL0NIdRMEPeknmr8nmPonICdPvRXE1BVOJ8LkdpsZ10TInTtRLkUPcD4
 cHt0Z6PkyOb4+3MIT4odXNkITMHPXguWRi1aWX3YWodACAeFflwNIOyFNnxwVqRDL3
 +GSb8tQVMUG5XsCnVqFznh48pbno9RA2oYfeIutg=
Date: Wed, 1 Jul 2020 10:55:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v10 1/2] of_graph: add of_graph_is_present()
Message-ID: <20200701075552.GJ5963@pendragon.ideasonboard.com>
References: <20200701074232.13632-1-digetx@gmail.com>
 <20200701074232.13632-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701074232.13632-2-digetx@gmail.com>
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

On Wed, Jul 01, 2020 at 10:42:31AM +0300, Dmitry Osipenko wrote:
> In some cases it's very useful to silently check whether port node exists
> at all in a device-tree before proceeding with parsing the graph. The DRM
> bridges code is one example of such case where absence of a graph in a
> device-tree is a legit condition.
> 
> This patch adds of_graph_is_present() which returns true if given
> device-tree node contains OF graph port.
> 
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/of/property.c    | 23 +++++++++++++++++++++++
>  include/linux/of_graph.h |  6 ++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 6a5760f0d6cd..fed7229d9d9f 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -29,6 +29,29 @@
>  
>  #include "of_private.h"
>  
> +/**
> + * of_graph_is_present() - check graph's presence
> + * @node: pointer to device_node containing graph port
> + *
> + * Return: True if @node has a port or ports (with a port) sub-node,
> + * false otherwise.
> + */
> +bool of_graph_is_present(const struct device_node *node)
> +{
> +	struct device_node *ports, *port;
> +
> +	ports = of_get_child_by_name(node, "ports");
> +	if (ports)
> +		node = ports;
> +
> +	port = of_get_child_by_name(node, "port");
> +	of_node_put(ports);
> +	of_node_put(port);
> +
> +	return !!port;
> +}
> +EXPORT_SYMBOL(of_graph_is_present);
> +
>  /**
>   * of_property_count_elems_of_size - Count the number of elements in a property
>   *
> diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> index 01038a6aade0..4d7756087b6b 100644
> --- a/include/linux/of_graph.h
> +++ b/include/linux/of_graph.h
> @@ -38,6 +38,7 @@ struct of_endpoint {
>  	     child = of_graph_get_next_endpoint(parent, child))
>  
>  #ifdef CONFIG_OF
> +bool of_graph_is_present(const struct device_node *node);
>  int of_graph_parse_endpoint(const struct device_node *node,
>  				struct of_endpoint *endpoint);
>  int of_graph_get_endpoint_count(const struct device_node *np);
> @@ -56,6 +57,11 @@ struct device_node *of_graph_get_remote_node(const struct device_node *node,
>  					     u32 port, u32 endpoint);
>  #else
>  
> +static inline bool of_graph_is_present(const struct device_node *node)
> +{
> +	return false;
> +}
> +
>  static inline int of_graph_parse_endpoint(const struct device_node *node,
>  					struct of_endpoint *endpoint)
>  {

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
