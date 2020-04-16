Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB4921ACE94
	for <lists+dri-devel@lfdr.de>; Thu, 16 Apr 2020 19:22:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 969526E4F3;
	Thu, 16 Apr 2020 17:22:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 686416E4F3
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Apr 2020 17:22:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A42A797D;
 Thu, 16 Apr 2020 19:22:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1587057747;
 bh=h7Pg0Y2dXKQzjE9xqP+G1tsaeFjJ76gvJMp9vlOEtg8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h3iZ4KAoTnGQsGA/NFPqERbdrTRB2t1MFry/EEFw91i6Tu/Rdr2aaU/wzJ4+INHJC
 1jRxLyzEGbC+hJWu8brX3ud4NWdW3kVXlOKeyfGJGu05x4TuYYe8beDpNHmOQxuxwj
 wfWMi+/rq0KmFnCPt4/BYzCB4TztXSzeWLcOr/40=
Date: Thu, 16 Apr 2020 20:22:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: Re: [PATCH v2 1/7] drm/bridge: ps8640: Get the EDID from eDP control
Message-ID: <20200416172215.GK4796@pendragon.ideasonboard.com>
References: <20200416155720.2360443-1-enric.balletbo@collabora.com>
 <20200416155720.2360443-2-enric.balletbo@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416155720.2360443-2-enric.balletbo@collabora.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, drinkcat@chromium.org,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Enric,

Thank you for the patch.

On Thu, Apr 16, 2020 at 05:57:13PM +0200, Enric Balletbo i Serra wrote:
> The PS8640 DSI-to-eDP bridge can retrieve the EDID, so implement the
> .get_edid callback and set the flag to indicate the core to use it.
> 
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
> 
> Changes in v2: None
> 
>  drivers/gpu/drm/bridge/parade-ps8640.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> index d3a53442d449..956b76e0a44d 100644
> --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> @@ -242,8 +242,18 @@ static int ps8640_bridge_attach(struct drm_bridge *bridge,
>  	return ret;
>  }
>  
> +static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
> +					   struct drm_connector *connector)
> +{
> +	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
> +
> +	return drm_get_edid(connector,
> +			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);

This will only work if the DDC signals are connected to the PS8640
(quite obviously). Is that guaranteed, or could some systems connect
them directory to an SoC I2C controller ? In the latter case we would
have to report this in the DT bindings of the PS8640. That's not
blocking for this patch, I am just wondering, as I would have expected
the driver to already expose EDID one way or another if this was
available and used.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +}
> +
>  static const struct drm_bridge_funcs ps8640_bridge_funcs = {
>  	.attach = ps8640_bridge_attach,
> +	.get_edid = ps8640_bridge_get_edid,
>  	.post_disable = ps8640_post_disable,
>  	.pre_enable = ps8640_pre_enable,
>  };
> @@ -296,6 +306,8 @@ static int ps8640_probe(struct i2c_client *client)
>  
>  	ps_bridge->bridge.funcs = &ps8640_bridge_funcs;
>  	ps_bridge->bridge.of_node = dev->of_node;
> +	ps_bridge->bridge.ops = DRM_BRIDGE_OP_EDID;
> +	ps_bridge->bridge.type = DRM_MODE_CONNECTOR_eDP;
>  
>  	ps_bridge->page[PAGE0_DP_CNTL] = client;
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
