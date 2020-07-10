Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 502D121BFFE
	for <lists+dri-devel@lfdr.de>; Sat, 11 Jul 2020 00:37:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522366ED33;
	Fri, 10 Jul 2020 22:37:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AE346ED33
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jul 2020 22:37:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id D484E2C0;
 Sat, 11 Jul 2020 00:37:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1594420660;
 bh=+jXeyMYRY1+GHDByMsTxMjYKLQuf+EEU0IKAhKkUG/I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rpLhnmTOtvA4NBRYwuunGQU/Qt7EKhjW1rtpyXqBZI6zwi7MCuZuytpVDpoTv93lD
 EEg4skB/zuRr7VWurGTDgFuWt8dfJRCX0zrHUqSfRakwVm+Jfda6j4g52eTst6vpBN
 6UKtGd9cYwxHde/wo7RipVw+RvjIOUesCbi/Wfiw=
Date: Sat, 11 Jul 2020 01:37:33 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v3 16/21] drm/bridge: megachips: add get_edid bridge
 operation
Message-ID: <20200710223733.GT5964@pendragon.ideasonboard.com>
References: <20200703192417.372164-1-sam@ravnborg.org>
 <20200703192417.372164-17-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200703192417.372164-17-sam@ravnborg.org>
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
 Martin Donnelly <martin.donnelly@ge.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sam,

Thank you for the patch.

On Fri, Jul 03, 2020 at 09:24:12PM +0200, Sam Ravnborg wrote:
> To prepare for a chained bridge setup add support for the
> get_edid bridge operation.
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
> ---
>  .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c  | 26 +++++++++++++------
>  1 file changed, 18 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> index 78a9afe8f063..5f06e18f0a61 100644
> --- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> +++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
> @@ -131,21 +131,29 @@ static u8 *stdp2690_get_edid(struct i2c_client *client)
>  	return NULL;
>  }
>  
> -static int ge_b850v3_lvds_get_modes(struct drm_connector *connector)
> +static struct edid *ge_b850v3_lvds_get_edid(
> +		struct drm_bridge *bridge, struct drm_connector *connector)
>  {
>  	struct i2c_client *client;
> -	int num_modes = 0;
>  
>  	client = ge_b850v3_lvds_ptr->stdp2690_i2c;
>  
>  	kfree(ge_b850v3_lvds_ptr->edid);
>  	ge_b850v3_lvds_ptr->edid = (struct edid *)stdp2690_get_edid(client);
>  
> -	if (ge_b850v3_lvds_ptr->edid) {
> -		drm_connector_update_edid_property(connector,
> -						      ge_b850v3_lvds_ptr->edid);
> -		num_modes = drm_add_edid_modes(connector,
> -					       ge_b850v3_lvds_ptr->edid);
> +	return ge_b850v3_lvds_ptr->edid;

As pointed out earlier in this series, you can't store a pointer to the
edid, if will get freed by the caller. Fortunately it doesn't seem to be
needed here either.

> +}
> +
> +static int ge_b850v3_lvds_get_modes(struct drm_connector *connector)
> +{
> +	struct edid *edid;
> +	int num_modes = 0;
> +
> +	edid = ge_b850v3_lvds_get_edid(&ge_b850v3_lvds_ptr->bridge, connector);
> +
> +	if (edid) {
> +		drm_connector_update_edid_property(connector, edid);
> +		num_modes = drm_add_edid_modes(connector, edid);
>  	}
>  
>  	return num_modes;
> @@ -270,6 +278,7 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
>  static const struct drm_bridge_funcs ge_b850v3_lvds_funcs = {
>  	.attach = ge_b850v3_lvds_attach,
>  	.detect = ge_b850v3_lvds_bridge_detect,
> +	.get_edid = ge_b850v3_lvds_get_edid,
>  };
>  
>  static int ge_b850v3_lvds_init(struct device *dev)
> @@ -324,7 +333,8 @@ static int stdp4028_ge_b850v3_fw_probe(struct i2c_client *stdp4028_i2c,
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
