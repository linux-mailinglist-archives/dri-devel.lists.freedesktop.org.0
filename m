Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61175202999
	for <lists+dri-devel@lfdr.de>; Sun, 21 Jun 2020 10:25:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BEB66E03B;
	Sun, 21 Jun 2020 08:25:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 028916E03B
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Jun 2020 08:25:21 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 2CE7C20024;
 Sun, 21 Jun 2020 10:25:18 +0200 (CEST)
Date: Sun, 21 Jun 2020 10:25:16 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: Re: [PATCH 03/27] drm: bridge: adv7511: Implement bridge connector
 operations
Message-ID: <20200621082516.GJ74146@ravnborg.org>
References: <20200526011505.31884-1-laurent.pinchart+renesas@ideasonboard.com>
 <20200526011505.31884-4-laurent.pinchart+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200526011505.31884-4-laurent.pinchart+renesas@ideasonboard.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=edQTgYMH c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=P1BnusSwAAAA:8 a=7gkXJVJtAAAA:8 a=e5mUnYsNAAAA:8
 a=SKQEPIvcsN8yE0TeSHAA:9 a=hIzy9EQ5asbxjusu:21 a=YUHg5pYENprv0Tb-:21
 a=CjuIK1q_8ugA:10 a=D0XLA9XvdZm18NrgonBM:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 26, 2020 at 04:14:41AM +0300, Laurent Pinchart wrote:
> Implement the bridge connector-related .get_edid(), .detect() and
> .hpd_notify() operations, and report the related bridge capabilities.
> 
> Output status detection is implemented using the same backend as for the
> DRM connector, but requires making mode retrieval at detection time
> optional as no pointer to the connector is available to the bridge
> .detect() operation. The reason for the need to retrieve modes at
> detection time is unclear to me, and this may benefit from further
> refactoring of hot plug handling code.
As discussed before the get_modes is likely not needed.
But this patch should not remove it - so fine
> 
> Hot plug detection is notified through the bridge HPD notification
> framework when the bridge is used without creating a connector, and
> falls back to the existing implementation otherwise. CEC handling of
> disconnection is handled in the new .hpd_notify() operation in the new
> code path.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 43 ++++++++++++++++++--
>  1 file changed, 39 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index f0992b6d654f..2662f28f8007 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -443,9 +443,14 @@ static void adv7511_hpd_work(struct work_struct *work)
>  
>  	if (adv7511->connector.status != status) {
>  		adv7511->connector.status = status;
> -		if (status == connector_status_disconnected)
> -			cec_phys_addr_invalidate(adv7511->cec_adap);
> -		drm_kms_helper_hotplug_event(adv7511->connector.dev);
> +
> +		if (adv7511->connector.dev) {
> +			if (status == connector_status_disconnected)
> +				cec_phys_addr_invalidate(adv7511->cec_adap);
> +			drm_kms_helper_hotplug_event(adv7511->connector.dev);
> +		} else {
> +			drm_bridge_hpd_notify(&adv7511->bridge, status);
> +		}
>  	}
>  }
>  
> @@ -661,7 +666,8 @@ adv7511_detect(struct adv7511 *adv7511, struct drm_connector *connector)
>  	if (status == connector_status_connected && hpd && adv7511->powered) {
>  		regcache_mark_dirty(adv7511->regmap);
>  		adv7511_power_on(adv7511);
> -		adv7511_get_modes(adv7511, connector);
> +		if (connector)
> +			adv7511_get_modes(adv7511, connector);
>  		if (adv7511->status == connector_status_connected)
>  			status = connector_status_disconnected;
>  	} else {
> @@ -917,11 +923,38 @@ static int adv7511_bridge_attach(struct drm_bridge *bridge,
>  	return ret;
>  }
>  
> +static enum drm_connector_status adv7511_bridge_detect(struct drm_bridge *bridge)
> +{
> +	struct adv7511 *adv = bridge_to_adv7511(bridge);
> +
> +	return adv7511_detect(adv, NULL);
> +}
> +
> +static struct edid *adv7511_bridge_get_edid(struct drm_bridge *bridge,
> +					    struct drm_connector *connector)
> +{
> +	struct adv7511 *adv = bridge_to_adv7511(bridge);
> +
> +	return adv7511_get_edid(adv, connector);
> +}
> +
> +static void adv7511_bridge_hpd_notify(struct drm_bridge *bridge,
> +				      enum drm_connector_status status)
> +{
> +	struct adv7511 *adv = bridge_to_adv7511(bridge);
> +
> +	if (status == connector_status_disconnected)
> +		cec_phys_addr_invalidate(adv->cec_adap);
> +}
> +
>  static const struct drm_bridge_funcs adv7511_bridge_funcs = {
>  	.enable = adv7511_bridge_enable,
>  	.disable = adv7511_bridge_disable,
>  	.mode_set = adv7511_bridge_mode_set,
>  	.attach = adv7511_bridge_attach,
> +	.detect = adv7511_bridge_detect,
> +	.get_edid = adv7511_bridge_get_edid,
> +	.hpd_notify = adv7511_bridge_hpd_notify,
>  };
>  
>  /* -----------------------------------------------------------------------------
> @@ -1250,6 +1283,8 @@ static int adv7511_probe(struct i2c_client *i2c, const struct i2c_device_id *id)
>  		goto err_unregister_cec;
>  
>  	adv7511->bridge.funcs = &adv7511_bridge_funcs;
> +	adv7511->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
> +			    | DRM_BRIDGE_OP_HPD;
>  	adv7511->bridge.of_node = dev->of_node;
>  
>  	drm_bridge_add(&adv7511->bridge);
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
