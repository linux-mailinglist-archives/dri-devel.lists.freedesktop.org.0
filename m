Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 064564D4EEB
	for <lists+dri-devel@lfdr.de>; Thu, 10 Mar 2022 17:23:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2C7410E573;
	Thu, 10 Mar 2022 16:23:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA63C10E43E
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Mar 2022 16:23:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D02AC491;
 Thu, 10 Mar 2022 17:23:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1646929424;
 bh=8BMTDuJBP99Os/IKhek1rCKEHx67jgTzaUFDr49pmYQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I8Brbwg4IWTKv4g2p/5GgiX4QiP//QkoOhl7C1luoMXAUKNmdzmN0pS3SWAq2OYqd
 WUQXCjntm0iNJb3UwvFeS0vdccnzu9VNM6F/NUqULtqZ/I9vt3POF1ZwGH5SFV1qGH
 39DA+x6DWZy1kxJCdkq4YG5KVi5qNZXqMz6yMTwg=
Date: Thu, 10 Mar 2022 18:23:27 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 2/3] drm/bridge: ti-sn65dsi86: Implement bridge
 connector operations
Message-ID: <Yiol/+wnFlAaybGY@pendragon.ideasonboard.com>
References: <20220310152227.2122960-1-kieran.bingham+renesas@ideasonboard.com>
 <20220310152227.2122960-3-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220310152227.2122960-3-kieran.bingham+renesas@ideasonboard.com>
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
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, Douglas Anderson <dianders@chromium.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran,

Thank you for the patch.

On Thu, Mar 10, 2022 at 03:22:26PM +0000, Kieran Bingham wrote:
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Implement the bridge connector-related .get_edid() operation, and report
> the related bridge capabilities and type.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> Changes since v1:
> 
> - The connector .get_modes() operation doesn't rely on EDID anymore,
>   __ti_sn_bridge_get_edid() and ti_sn_bridge_get_edid() got merged
>   together
>  - Fix on top of Sam Ravnborg's DRM_BRIDGE_STATE_OPS
> 
> Changes since v2: [Kieran]
>  - Only support EDID on DRM_MODE_CONNECTOR_DisplayPort modes.
> 
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 93b54fcba8ba..d581c820e5d8 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1135,10 +1135,24 @@ static void ti_sn_bridge_atomic_post_disable(struct drm_bridge *bridge,
>  	pm_runtime_put_sync(pdata->dev);
>  }
>  
> +static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
> +					  struct drm_connector *connector)
> +{
> +	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
> +	struct edid *edid;
> +
> +	pm_runtime_get_sync(pdata->dev);
> +	edid = drm_get_edid(connector, &pdata->aux.ddc);
> +	pm_runtime_put_autosuspend(pdata->dev);
> +
> +	return edid;
> +}
> +
>  static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>  	.attach = ti_sn_bridge_attach,
>  	.detach = ti_sn_bridge_detach,
>  	.mode_valid = ti_sn_bridge_mode_valid,
> +	.get_edid = ti_sn_bridge_get_edid,
>  	.atomic_pre_enable = ti_sn_bridge_atomic_pre_enable,
>  	.atomic_enable = ti_sn_bridge_atomic_enable,
>  	.atomic_disable = ti_sn_bridge_atomic_disable,
> @@ -1233,6 +1247,9 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>  	pdata->bridge.type = pdata->next_bridge->type == DRM_MODE_CONNECTOR_DisplayPort
>  			   ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
>  
> +	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
> +		pdata->bridge.ops = DRM_BRIDGE_OP_EDID;

You could write this as

	if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
		pdata->bridge.ops |= DRM_BRIDGE_OP_EDID;

to be ready to support other ops, but that doesn't help
DRM_BRIDGE_OP_DETECT in 3/3, and I don't foresee the need for other ops.

In any case,

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> +
>  	drm_bridge_add(&pdata->bridge);
>  
>  	ret = ti_sn_attach_host(pdata);

-- 
Regards,

Laurent Pinchart
