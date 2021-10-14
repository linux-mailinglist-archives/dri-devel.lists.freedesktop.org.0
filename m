Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 858B742E080
	for <lists+dri-devel@lfdr.de>; Thu, 14 Oct 2021 19:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C7F6E87F;
	Thu, 14 Oct 2021 17:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.smtp.larsendata.com (mx1.smtp.larsendata.com
 [91.221.196.215])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 950726E87F
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 17:49:50 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx1.smtp.larsendata.com (Halon) with ESMTPS
 id 20384c3c-2d17-11ec-9c3f-0050568c148b;
 Thu, 14 Oct 2021 17:49:48 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 698C9194B76;
 Thu, 14 Oct 2021 19:49:56 +0200 (CEST)
Date: Thu, 14 Oct 2021 19:49:46 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: daniel@ffwll.ch, Laurent.pinchart@ideasonboard.com,
 martin.blumenstingl@googlemail.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/7] drm/meson: remove useless recursive components
 matching
Message-ID: <YWhtuscoVWCdQAkY@ravnborg.org>
References: <20211014152606.2289528-1-narmstrong@baylibre.com>
 <20211014152606.2289528-3-narmstrong@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211014152606.2289528-3-narmstrong@baylibre.com>
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

Hi Neil,

one comment below. Other than that
Acked-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

On Thu, Oct 14, 2021 at 05:26:01PM +0200, Neil Armstrong wrote:
> The initial design was recursive to cover all port/endpoints, but only the first layer
> of endpoints should be covered by the components list.
> This also breaks the MIPI-DSI init/bridge attach sequence, thus only parse the
> first endpoints instead of recursing.
> 
> Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  drivers/gpu/drm/meson/meson_drv.c | 62 +++++++++++--------------------
>  1 file changed, 21 insertions(+), 41 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
> index bc0d60df04ae..b53606d8825f 100644
> --- a/drivers/gpu/drm/meson/meson_drv.c
> +++ b/drivers/gpu/drm/meson/meson_drv.c
> @@ -427,46 +427,6 @@ static int compare_of(struct device *dev, void *data)
>  	return dev->of_node == data;
>  }
>  
> -/* Possible connectors nodes to ignore */
> -static const struct of_device_id connectors_match[] = {
> -	{ .compatible = "composite-video-connector" },
> -	{ .compatible = "svideo-connector" },
> -	{ .compatible = "hdmi-connector" },
> -	{ .compatible = "dvi-connector" },
> -	{}
> -};
> -
> -static int meson_probe_remote(struct platform_device *pdev,
> -			      struct component_match **match,
> -			      struct device_node *parent,
> -			      struct device_node *remote)
> -{
> -	struct device_node *ep, *remote_node;
> -	int count = 1;
> -
> -	/* If node is a connector, return and do not add to match table */
> -	if (of_match_node(connectors_match, remote))
> -		return 1;
> -
> -	component_match_add(&pdev->dev, match, compare_of, remote);
> -
> -	for_each_endpoint_of_node(remote, ep) {
> -		remote_node = of_graph_get_remote_port_parent(ep);
> -		if (!remote_node ||
> -		    remote_node == parent || /* Ignore parent endpoint */
> -		    !of_device_is_available(remote_node)) {
> -			of_node_put(remote_node);
> -			continue;
> -		}
> -
> -		count += meson_probe_remote(pdev, match, remote, remote_node);
> -
> -		of_node_put(remote_node);
> -	}
> -
> -	return count;
> -}
> -
>  static void meson_drv_shutdown(struct platform_device *pdev)
>  {
>  	struct meson_drm *priv = dev_get_drvdata(&pdev->dev);
> @@ -478,6 +438,13 @@ static void meson_drv_shutdown(struct platform_device *pdev)
>  	drm_atomic_helper_shutdown(priv->drm);
>  }
>  
> +/* Possible connectors nodes to ignore */
> +static const struct of_device_id connectors_match[] = {
> +	{ .compatible = "composite-video-connector" },
> +	{ .compatible = "svideo-connector" },
> +	{}
> +};
> +
>  static int meson_drv_probe(struct platform_device *pdev)
>  {
>  	struct component_match *match = NULL;
> @@ -492,8 +459,21 @@ static int meson_drv_probe(struct platform_device *pdev)
>  			continue;
>  		}
>  
> -		count += meson_probe_remote(pdev, &match, np, remote);
> +		/* If an analog connector is detected, count it as an output */
> +		if (of_match_node(connectors_match, remote)) {
> +			++count;
> +			of_node_put(remote);
> +			continue;
> +		}
> +
> +		DRM_DEBUG_DRIVER("parent %pOF remote match add %pOF parent %s\n",
> +				  np, remote, dev_name(&pdev->dev));
Avoid the deprecated logging functions.
Use drm_dbg() or if there is no drm_device just dev_dbg().

I assume the driver uses DRM_xxx all over, so I understand if you keep
it as-is.

> +
> +		component_match_add(&pdev->dev, &match, compare_of, remote);
> +
>  		of_node_put(remote);
> +
> +		++count;
>  	}
>  
>  	if (count && !match)
> -- 
> 2.25.1
