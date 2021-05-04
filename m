Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DD0372731
	for <lists+dri-devel@lfdr.de>; Tue,  4 May 2021 10:26:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058C66EAA7;
	Tue,  4 May 2021 08:26:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A9E6EAA7
 for <dri-devel@lists.freedesktop.org>; Tue,  4 May 2021 08:26:16 +0000 (UTC)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi
 [91.157.208.71])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 30DBD58E;
 Tue,  4 May 2021 10:26:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1620116774;
 bh=651Njm1PFavKJRD30KAL7DAxIfjbLZIDM84/G6BWZiU=;
 h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
 b=NWn9JHJBBZYbbQKnFryJ0C9kJzvLL+qUGdiGrjL0nm13RLcsR6WVU8WrSBiqvA2tF
 ts162Zp27WaOhGHYgxWaDhWpYfRrcblV1pwksf4Ci5g21BUywXwfOep1tQSUKApsCA
 MbyWFOARM2Ni21PgUM9G+RfTfg5/Rk3e0Uc5IFWs=
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20210428132545.1205162-1-hverkuil-cisco@xs4all.nl>
 <20210428132545.1205162-2-hverkuil-cisco@xs4all.nl>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCHv3 1/6] drm: drm_bridge: add connector_attach/detach bridge
 ops
Message-ID: <bcf1d476-216f-db51-840e-7cda58585b5b@ideasonboard.com>
Date: Tue, 4 May 2021 11:26:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210428132545.1205162-2-hverkuil-cisco@xs4all.nl>
Content-Language: en-US
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
Cc: Tony Lindgren <tony@atomide.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/04/2021 16:25, Hans Verkuil wrote:
> Add bridge connector_attach/detach ops. These ops are called when a
> bridge is attached or detached to a drm_connector. These ops can be
> used to register and unregister an HDMI CEC adapter for a bridge that
> supports CEC.
> 
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> ---
>   drivers/gpu/drm/drm_bridge_connector.c | 25 +++++++++++++++++++++++-
>   include/drm/drm_bridge.h               | 27 ++++++++++++++++++++++++++
>   2 files changed, 51 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> index 791379816837..0676677badfe 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -203,6 +203,11 @@ static void drm_bridge_connector_destroy(struct drm_connector *connector)
>   {
>   	struct drm_bridge_connector *bridge_connector =
>   		to_drm_bridge_connector(connector);
> +	struct drm_bridge *bridge;
> +
> +	drm_for_each_bridge_in_chain(bridge_connector->encoder, bridge)
> +		if (bridge->funcs->connector_detach)
> +			bridge->funcs->connector_detach(bridge, connector);
>   
>   	if (bridge_connector->bridge_hpd) {
>   		struct drm_bridge *hpd = bridge_connector->bridge_hpd;
> @@ -318,6 +323,7 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   	struct i2c_adapter *ddc = NULL;
>   	struct drm_bridge *bridge;
>   	int connector_type;
> +	int ret;
>   
>   	bridge_connector = kzalloc(sizeof(*bridge_connector), GFP_KERNEL);
>   	if (!bridge_connector)
> @@ -375,6 +381,23 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
>   		connector->polled = DRM_CONNECTOR_POLL_CONNECT
>   				  | DRM_CONNECTOR_POLL_DISCONNECT;
>   
> -	return connector;
> +	ret = 0;
> +	/* call connector_attach for all bridges */
> +	drm_for_each_bridge_in_chain(encoder, bridge) {
> +		if (!bridge->funcs->connector_attach)
> +			continue;
> +		ret = bridge->funcs->connector_attach(bridge, connector);
> +		if (ret)
> +			break;
> +	}
> +	if (!ret)
> +		return connector;
> +
> +	/* on error, detach any previously successfully attached connectors */
> +	list_for_each_entry_continue_reverse(bridge, &(encoder)->bridge_chain,

No need for parenthesis in (encoder) here.

> +					     chain_node)
> +		if (bridge->funcs->connector_detach)
> +			bridge->funcs->connector_detach(bridge, connector);
> +	return ERR_PTR(ret);
>   }
>   EXPORT_SYMBOL_GPL(drm_bridge_connector_init);
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 2195daa289d2..333fbc3a03e9 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -629,6 +629,33 @@ struct drm_bridge_funcs {
>   	 * the DRM_BRIDGE_OP_HPD flag in their &drm_bridge->ops.
>   	 */
>   	void (*hpd_disable)(struct drm_bridge *bridge);
> +
> +	/**
> +	 * @connector_attach:
> +	 *
> +	 * This callback is invoked whenever our bridge is being attached to a
> +	 * &drm_connector. This is where an HDMI CEC adapter can be registered.
> +	 *
> +	 * The @connector_attach callback is optional.
> +	 *
> +	 * RETURNS:
> +	 *
> +	 * Zero on success, error code on failure.
> +	 */
> +	int (*connector_attach)(struct drm_bridge *bridge,
> +				struct drm_connector *conn);
> +
> +	/**
> +	 * @connector_detach:
> +	 *
> +	 * This callback is invoked whenever our bridge is being detached from a
> +	 * &drm_connector. This is where an HDMI CEC adapter can be
> +	 * unregistered.
> +	 *
> +	 * The @connector_detach callback is optional.
> +	 */
> +	void (*connector_detach)(struct drm_bridge *bridge,
> +				 struct drm_connector *conn);
>   };
>   
>   /**
> 

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

I can take this series as it's mostly omapdrm, but we'll need a 
reviewed-by/acked-by from a maintainer for this patch.

  Tomi
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
