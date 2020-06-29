Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B34B720E89C
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jun 2020 01:12:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD536E041;
	Mon, 29 Jun 2020 23:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
 [209.85.166.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB46F6E041
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 23:12:14 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id y2so19053798ioy.3
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jun 2020 16:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=op3i3z1L0LUQ12QfWOlDxJhiavChzqvWXr19iexaQZg=;
 b=SP9Vr11U45pVMEoqd8uBm1JT+M6VlBgQAq9D6BlJk3RsoHhddBwUp7pM+7RQoaHDm1
 4jDfr4rU/6f2JgoVj5pG8Tii9q3iqLSjg1BBOgN2Pb9d2lzMK2GN1z0t9e/5YTIf4JYO
 uGGbnZqRNTxIaNH3l71d1aXJoTygxRK7+co7XAG1UDNPKHjBgeqKnOxyTtIAQ4RguHP/
 iyrpCdLpdBwCnVkiH0eo8fhFfyFDfpb2Xddr7VOeTa6Ak5WFss1P2/3VzpHqoKFtP0Q2
 DHo89DLER841SgyQXuDvNNlW2oWJgp1LDSPphhh+LWxHI7O5lJESwph9Xi6Cc93H58ih
 bZbw==
X-Gm-Message-State: AOAM533ovWIkO8+s2iVQnHxfNBwpUREEpmabEw0uDjhiaX/fDmhEnh1y
 YnfSIDtuBev8xsI5aEavL/Q7SlA++w==
X-Google-Smtp-Source: ABdhPJwqWxmbojLKjuDjx9fPibAgiAZ1p7u7BMvYsmcT/Qp0Zxzr9XR5iIvt0bzy9xxkhE4ie/Qu6w==
X-Received: by 2002:a02:8796:: with SMTP id t22mr13133151jai.90.1593472334118; 
 Mon, 29 Jun 2020 16:12:14 -0700 (PDT)
Received: from xps15 ([64.188.179.255])
 by smtp.gmail.com with ESMTPSA id e4sm697936ilq.68.2020.06.29.16.12.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 16:12:13 -0700 (PDT)
Received: (nullmailer pid 3148645 invoked by uid 1000);
 Mon, 29 Jun 2020 23:12:11 -0000
Date: Mon, 29 Jun 2020 17:12:11 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 1/7] of_graph: add of_graph_presents()
Message-ID: <20200629231211.GA3142766@bogus>
References: <20200617222703.17080-1-digetx@gmail.com>
 <20200617222703.17080-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200617222703.17080-2-digetx@gmail.com>
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
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-tegra@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 18, 2020 at 01:26:57AM +0300, Dmitry Osipenko wrote:
> In some case, like a DRM display code for example, it's useful to silently
> check whether port node exists at all in a device-tree before proceeding
> with parsing of the graph.
> 
> This patch adds of_graph_presents() that returns true if given device-tree
> node contains OF graph port.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/of/property.c    | 52 +++++++++++++++++++++++++++++++++-------
>  include/linux/of_graph.h |  6 +++++
>  2 files changed, 49 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 1f2086f4e7ce..b84ed6a7cf50 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -29,6 +29,48 @@
>  
>  #include "of_private.h"
>  
> +/**
> + * of_graph_get_first_local_port() - get first local port node
> + * @node: pointer to a local endpoint device_node
> + *
> + * Return: First local port node associated with local endpoint node linked
> + *	   to @node. Use of_node_put() on it when done.
> + */
> +static struct device_node *
> +of_graph_get_first_local_port(const struct device_node *node)
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
> +
> +/**
> + * of_graph_presents() - check graph's presence
> + * @node: pointer to a device_node checked for the graph's presence
> + *
> + * Return: True if @node has a port or ports sub-node, false otherwise.
> + */
> +bool of_graph_presents(const struct device_node *node)

of_graph_is_present

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
