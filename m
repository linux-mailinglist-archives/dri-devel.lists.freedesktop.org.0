Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCFC22E2D4
	for <lists+dri-devel@lfdr.de>; Sun, 26 Jul 2020 23:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037466E11F;
	Sun, 26 Jul 2020 21:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1F3D6E11F
 for <dri-devel@lists.freedesktop.org>; Sun, 26 Jul 2020 21:57:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CAFB851D;
 Sun, 26 Jul 2020 23:57:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595800633;
 bh=/7fHcbCgKWcm21MIZ7qcB1kDRZ3TUp1mpvVpqj7zhNQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Q2iE7gysWhOEzIzUasfOoAZRUhRO1Ri+FmO084SZGXmCf2O+U+wwglghJl2cA9+vV
 8OGJ6TKNnqWVhL5iSgpmZcKnX8KYH4aJ4GE5QH9ombAK+lH2m8yciASCxMCR0Luq6Y
 KYfW6sKU58Mz+oNZCgOdf64oJJDA9Eh1fXcUCgPw=
Date: Mon, 27 Jul 2020 00:57:05 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v4 12/15] drm/bridge: megachips: add get_edid bridge
 operation
Message-ID: <20200726215705.GE28704@pendragon.ideasonboard.com>
References: <20200726203324.3722593-1-sam@ravnborg.org>
 <20200726203324.3722593-13-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200726203324.3722593-13-sam@ravnborg.org>
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
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Andrzej Hajda <a.hajda@samsung.com>, Thierry Reding <thierry.reding@gmail.com>,
 Martin Donnelly <martin.donnelly@ge.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Sun, Jul 26, 2020 at 10:33:21PM +0200, Sam Ravnborg wrote:
> To prepare for a chained bridge setup add support for the
> get_edid bridge operation.
> There is no need for a copy of the edid - so drop
> the pointer to the copy.
> 
> v2:
>   - Fix so we do not leak memory (Laurent)
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Peter Senna Tschudin <peter.senna@gmail.com>
> Cc: Martin Donnelly <martin.donnelly@ge.com>
> Cc: Martyn Welch <martyn.welch@collabora.co.uk>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@siol.net>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  | 31 ++++++++++---------
>  1 file changed, 17 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index 450dca33ea48..f7b55dc374ac 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -61,7 +61,6 @@ struct ge_b850v3_lvds {
>  	struct drm_bridge bridge;
>  	struct i2c_client *stdp4028_i2c;
>  	struct i2c_client *stdp2690_i2c;
> -	struct edid *edid;
>  };
>  
>  static struct ge_b850v3_lvds *ge_b850v3_lvds_ptr;
> @@ -131,22 +130,26 @@ static u8 *stdp2690_get_edid(struct i2c_client *client)
>  	return NULL;
>  }
>  
> -static int ge_b850v3_lvds_get_modes(struct drm_connector *connector)
> +static struct edid *ge_b850v3_lvds_get_edid(struct drm_bridge *bridge,
> +					    struct drm_connector *connector)
>  {
>  	struct i2c_client *client;
> -	int num_modes = 0;
>  
>  	client = ge_b850v3_lvds_ptr->stdp2690_i2c;
>  
> -	kfree(ge_b850v3_lvds_ptr->edid);
> -	ge_b850v3_lvds_ptr->edid = (struct edid *)stdp2690_get_edid(client);
> +	return (struct edid *)stdp2690_get_edid(client);
> +}
>  
> -	if (ge_b850v3_lvds_ptr->edid) {
> -		drm_connector_update_edid_property(connector,
> -						      ge_b850v3_lvds_ptr->edid);
> -		num_modes = drm_add_edid_modes(connector,
> -					       ge_b850v3_lvds_ptr->edid);
> -	}
> +static int ge_b850v3_lvds_get_modes(struct drm_connector *connector)
> +{
> +	struct edid *edid;
> +	int num_modes;
> +
> +	edid = ge_b850v3_lvds_get_edid(&ge_b850v3_lvds_ptr->bridge, connector);
> +
> +	drm_connector_update_edid_property(connector, edid);
> +	num_modes = drm_add_edid_modes(connector, edid);
> +	kfree(edid);
>  
>  	return num_modes;
>  }
> @@ -269,6 +272,7 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
>  static const struct drm_bridge_funcs ge_b850v3_lvds_funcs = {
>  	.attach = ge_b850v3_lvds_attach,
>  	.detect = ge_b850v3_lvds_bridge_detect,
> +	.get_edid = ge_b850v3_lvds_get_edid,
>  };
>  
>  static int ge_b850v3_lvds_init(struct device *dev)
> @@ -304,8 +308,6 @@ static void ge_b850v3_lvds_remove(void)
>  
>  	drm_bridge_remove(&ge_b850v3_lvds_ptr->bridge);
>  
> -	kfree(ge_b850v3_lvds_ptr->edid);
> -
>  	ge_b850v3_lvds_ptr = NULL;
>  out:
>  	mutex_unlock(&ge_b850v3_lvds_dev_mutex);
> @@ -323,7 +325,8 @@ static int stdp4028_ge_b850v3_fw_probe(struct i2c_client *stdp4028_i2c,
>  
>  	/* drm bridge initialization */
>  	ge_b850v3_lvds_ptr->bridge.funcs = &ge_b850v3_lvds_funcs;
> -	ge_b850v3_lvds_ptr->bridge.ops = DRM_BRIDGE_OP_DETECT;
> +	ge_b850v3_lvds_ptr->bridge.ops = DRM_BRIDGE_OP_DETECT |
> +					 DRM_BRIDGE_OP_EDID;
>  	ge_b850v3_lvds_ptr->bridge.of_node = dev->of_node;
>  	drm_bridge_add(&ge_b850v3_lvds_ptr->bridge);
>  

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
