Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABED433550
	for <lists+dri-devel@lfdr.de>; Tue, 19 Oct 2021 14:02:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA58C6E110;
	Tue, 19 Oct 2021 12:02:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964BD6E110
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Oct 2021 12:02:33 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 608CA12A;
 Tue, 19 Oct 2021 14:02:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1634644951;
 bh=w4LOhk1i7FCnRuEWtYCeKuTGYh411zXBvRaabX/9DSs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cQB7vUJLFs0Jf/WJ9KyDdGDLwyXYgIECjNihdCoOinpVVPxVS/a/9rOZTqzTvDPq0
 0E5ed8MQL3RvGo8Nv0wJCTm/hymvjZDyB15w9Aow5TKrx1E9uiX6e2lFSPhylucneT
 nZj2w5Hh9sbvlyxw/mergAsqHfwp0XVdb+AtXcPw=
Date: Tue, 19 Oct 2021 15:02:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Chen-Yu Tsai <wens@csie.org>,
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/7] of: Make of_graph_get_port_by_id take a const
 device_node
Message-ID: <YW6zxW3KdlpLQe/m@pendragon.ideasonboard.com>
References: <20210929084234.1271915-1-maxime@cerno.tech>
 <20210929084234.1271915-2-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210929084234.1271915-2-maxime@cerno.tech>
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

Hi Maxime,

Thank you for the patch.

On Wed, Sep 29, 2021 at 10:42:28AM +0200, Maxime Ripard wrote:
> of_graph_get_port_by_id doesn't modify the device_node pointer it takes
> as argument, so we can make it const.

From a C point of view that's right, but conceptually speaking, is it
right to return a non-const child port node of a const device_node ?

> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/of/property.c    | 2 +-
>  include/linux/of_graph.h | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index 3fd74bb34819..739d5d1c8c3a 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -603,7 +603,7 @@ EXPORT_SYMBOL(of_graph_parse_endpoint);
>   * Return: A 'port' node pointer with refcount incremented. The caller
>   * has to use of_node_put() on it when done.
>   */
> -struct device_node *of_graph_get_port_by_id(struct device_node *parent, u32 id)
> +struct device_node *of_graph_get_port_by_id(const struct device_node *parent, u32 id)
>  {
>  	struct device_node *node, *port;
>  
> diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
> index 4d7756087b6b..87f3f4d0d0df 100644
> --- a/include/linux/of_graph.h
> +++ b/include/linux/of_graph.h
> @@ -42,7 +42,7 @@ bool of_graph_is_present(const struct device_node *node);
>  int of_graph_parse_endpoint(const struct device_node *node,
>  				struct of_endpoint *endpoint);
>  int of_graph_get_endpoint_count(const struct device_node *np);
> -struct device_node *of_graph_get_port_by_id(struct device_node *node, u32 id);
> +struct device_node *of_graph_get_port_by_id(const struct device_node *node, u32 id);
>  struct device_node *of_graph_get_next_endpoint(const struct device_node *parent,
>  					struct device_node *previous);
>  struct device_node *of_graph_get_endpoint_by_regs(
> @@ -74,7 +74,7 @@ static inline int of_graph_get_endpoint_count(const struct device_node *np)
>  }
>  
>  static inline struct device_node *of_graph_get_port_by_id(
> -					struct device_node *node, u32 id)
> +					const struct device_node *node, u32 id)
>  {
>  	return NULL;
>  }

-- 
Regards,

Laurent Pinchart
