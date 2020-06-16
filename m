Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBCD1FA5A4
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 03:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9501089243;
	Tue, 16 Jun 2020 01:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5786589243
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 01:27:16 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 49F82F9;
 Tue, 16 Jun 2020 03:27:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1592270834;
 bh=yVhdm4SmO3wkXqvKwAY69etuikCBZKRYuD4KmrUh1q0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FQSvnTVBX3f5SqO3sC1FJmr87CZEgDB2GeYpJ6t1MWr7iPx3WCHsMIeMWAHX5JZcI
 pOrrNnySCtO4QjgIPkebFxXT7BA54jdQ6PDbGpZsuuJ9yLFv1kNM3GFqVsnb47mXX7
 O3+D9HQC4H79Ays/zPN9+DcJXivDaescPY1p2scA=
Date: Tue, 16 Jun 2020 04:26:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 2/6] drm/of: Make drm_of_find_panel_or_bridge() to
 check graph's presence
Message-ID: <20200616012652.GG1629@pendragon.ideasonboard.com>
References: <20200614172234.8856-1-digetx@gmail.com>
 <20200614172234.8856-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200614172234.8856-3-digetx@gmail.com>
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

On Sun, Jun 14, 2020 at 08:22:30PM +0300, Dmitry Osipenko wrote:
> When graph isn't defined in a device-tree, the of_graph_get_remote_node()
> prints a noisy error message, telling that port node is not found. This is
> undesirable behaviour in our case because absence of a panel/bridge graph
> is a valid case. Let's check presence of the local port in a device-tree
> before proceeding with parsing the graph.
> 
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/gpu/drm/drm_of.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
> index b50b44e76279..e0652c38f357 100644
> --- a/drivers/gpu/drm/drm_of.c
> +++ b/drivers/gpu/drm/drm_of.c
> @@ -239,13 +239,24 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
>  				struct drm_bridge **bridge)
>  {
>  	int ret = -EPROBE_DEFER;
> -	struct device_node *remote;
> +	struct device_node *local, *remote;
>  
>  	if (!panel && !bridge)
>  		return -EINVAL;
>  	if (panel)
>  		*panel = NULL;
>  
> +	/*
> +	 * of_graph_get_remote_node() produces a noisy error message if port
> +	 * node isn't found and the absence of the port is a legit case here,
> +	 * so at first we silently check presence of the local port.
> +	 */
> +	local = of_graph_get_local_port(np);
> +	if (!local)
> +		return -ENODEV;
> +
> +	of_node_put(local);
> +

The code looks fine, but you may want to take into account my proposal
in 1/7 to instead create a of_graph_has_port() function. The could would
be simpler here.

>  	remote = of_graph_get_remote_node(np, port, endpoint);
>  	if (!remote)
>  		return -ENODEV;

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
