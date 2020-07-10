Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16E421BFB7
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 00:22:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D15F6ED22;
	Fri, 10 Jul 2020 22:21:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF5646ED22
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 22:21:34 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55ED62C0;
 Sat, 11 Jul 2020 00:21:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1594419693;
 bh=VtzgDiTmlkYx1Ir7B5uV/8qUHAQ4fk4xkZRHYjah/gE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UNCVbzlihPJgLPzPTpnEA1sPVnKTWU9J5xkSQmdqPyX0ZebVuwEKu9pSPCPuiFeVg
 zzPGdpE9A0X+gM5MLQh7kRifciDCS8B8y34bUI+KbhvFR/803IL158jyddCm2bKsat
 H7Rg3HcKQeSzwTtRxEiBtBk8uisfRTkXZwfk520s=
Date: Sat, 11 Jul 2020 01:21:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 07/21] drm/bridge: tc358767: add detect bridge operation
Message-ID: <20200710222126.GK5964@pendragon.ideasonboard.com>
References: <20200703192417.372164-1-sam@ravnborg.org>
 <20200703192417.372164-8-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703192417.372164-8-sam@ravnborg.org>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 kbuild test robot <lkp@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Fri, Jul 03, 2020 at 09:24:03PM +0200, Sam Ravnborg wrote:
> Prepare the bridge driver for chained operation by adding
> support for the detect operation.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 08d483664258..85973ae728db 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1353,10 +1353,9 @@ static const struct drm_connector_helper_funcs tc_connector_helper_funcs = {
>  	.get_modes = tc_connector_get_modes,
>  };
>  
> -static enum drm_connector_status tc_connector_detect(struct drm_connector *connector,
> -						     bool force)
> +static enum drm_connector_status tc_bridge_detect(struct drm_bridge *bridge)
>  {
> -	struct tc_data *tc = connector_to_tc(connector);
> +	struct tc_data *tc = bridge_to_tc(bridge);
>  	bool conn;
>  	u32 val;
>  	int ret;
> @@ -1380,6 +1379,14 @@ static enum drm_connector_status tc_connector_detect(struct drm_connector *conne
>  		return connector_status_disconnected;
>  }
>  
> +static enum drm_connector_status
> +tc_connector_detect(struct drm_connector *connector, bool force)
> +{
> +	struct tc_data *tc = connector_to_tc(connector);
> +
> +	return tc_bridge_detect(&tc->bridge);
> +}
> +
>  static const struct drm_connector_funcs tc_connector_funcs = {
>  	.detect = tc_connector_detect,
>  	.fill_modes = drm_helper_probe_single_connector_modes,
> @@ -1444,6 +1451,7 @@ static const struct drm_bridge_funcs tc_bridge_funcs = {
>  	.enable = tc_bridge_enable,
>  	.disable = tc_bridge_disable,
>  	.mode_fixup = tc_bridge_mode_fixup,
> +	.detect = tc_bridge_detect,
>  };
>  
>  static bool tc_readable_reg(struct device *dev, unsigned int reg)
> @@ -1677,6 +1685,8 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
>  		return ret;
>  
>  	tc->bridge.funcs = &tc_bridge_funcs;
> +	tc->bridge.ops = DRM_BRIDGE_OP_DETECT;

I think you should set DRM_BRIDGE_OP_DETECT only when tc->hpd_pin is
valid. I would also move the if (tc->hpd_pin < 0) case from
tc_bridge_detect to +tc_connector_detect.

> +
>  	tc->bridge.of_node = dev->of_node;
>  	drm_bridge_add(&tc->bridge);
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
