Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3FD9D2AE3
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 17:28:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5755910E1C4;
	Tue, 19 Nov 2024 16:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uhkeF+z+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3FF510E1C4
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 16:28:00 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id EFD81B3;
 Tue, 19 Nov 2024 17:27:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1732033660;
 bh=fCnZd7xuHdxj/TyD9kKMoI71UVb4g3by4VMPnhxqEAE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uhkeF+z+IBJvfgRTNWKOEjjrN2SsXA3+E32IWjMv2cLo/L7CDLHEg+TXUWKG0tV6h
 cERcfqecLNBWTIAoGtvVHwN8mODVsXJNOMFH6ttcqDZLL+8Nf6f8aoStdWKb3jywYo
 bb2hg4NaaFj/qe2NKid5oOR4IrnwcvWhlBeC48ZQ=
Date: Tue, 19 Nov 2024 18:27:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Biju Das <biju.das.au@gmail.com>, linux-renesas-soc@vger.kernel.org,
 stable@vger.kernel.org
Subject: Re: [PATCH v5 1/3] drm: adv7511: Fix use-after-free in
 adv7533_attach_dsi()
Message-ID: <20241119162748.GQ31681@pendragon.ideasonboard.com>
References: <20241119131011.105359-1-biju.das.jz@bp.renesas.com>
 <20241119131011.105359-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241119131011.105359-2-biju.das.jz@bp.renesas.com>
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

Hi Biju,

Thank you for the patch.

On Tue, Nov 19, 2024 at 01:10:03PM +0000, Biju Das wrote:
> The host_node pointer was assigned and freed in adv7533_parse_dt(), and
> later, adv7533_attach_dsi() uses the same. Fix this use-after-free issue
> by dropping of_node_put() in adv7533_parse_dt() and calling of_node_put()
> in error path of probe() and also in the remove().
> 
> Fixes: 1e4d58cd7f88 ("drm/bridge: adv7533: Create a MIPI DSI device")
> Cc: stable@vger.kernel.org
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> Changes in v5:
>  - Updated commit description.
>  - restored host_node in struct adv7511.
>  - Dropped of_node_put() in adv7533_parse_dt() and calling of_node_put()
>    in error path of probe() and also in the remove().
> Changes in v4:
>  - Updated commit description.
>  - Dropped host_node from struct adv7511 and instead used a local pointer
>    in probe(). Also freeing of host_node pointer after use is done in
>    probe().
> Changes in v3:
>  - Replace __free construct with readable of_node_put().
> Changes in v2:
>  - Added the tag "Cc: stable@vger.kernel.org" in the sign-off area.
>  - Dropped Archit Taneja invalid Mail address
> ---
>  drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 5 +++++
>  drivers/gpu/drm/bridge/adv7511/adv7533.c     | 2 --
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> index eb5919b38263..6cfdda04f52f 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
> @@ -1363,6 +1363,8 @@ static int adv7511_probe(struct i2c_client *i2c)
>  	i2c_unregister_device(adv7511->i2c_edid);
>  uninit_regulators:
>  	adv7511_uninit_regulators(adv7511);
> +	if (adv7511->host_node)
> +		of_node_put(adv7511->host_node);

This won't be called when adv7511_init_regulators() fails as the driver
returns directly then, leaking the reference. You need a new error label
and a goto for that error path.

In the future, when touching error handling, please try to check
existing error paths and verify they're still right.

>  
>  	return ret;
>  }
> @@ -1371,6 +1373,9 @@ static void adv7511_remove(struct i2c_client *i2c)
>  {
>  	struct adv7511 *adv7511 = i2c_get_clientdata(i2c);
>  
> +	if (adv7511->host_node)
> +		of_node_put(adv7511->host_node);
> +
>  	adv7511_uninit_regulators(adv7511);
>  
>  	drm_bridge_remove(&adv7511->bridge);
> diff --git a/drivers/gpu/drm/bridge/adv7511/adv7533.c b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> index 4481489aaf5e..5f195e91b3e6 100644
> --- a/drivers/gpu/drm/bridge/adv7511/adv7533.c
> +++ b/drivers/gpu/drm/bridge/adv7511/adv7533.c
> @@ -181,8 +181,6 @@ int adv7533_parse_dt(struct device_node *np, struct adv7511 *adv)
>  	if (!adv->host_node)
>  		return -ENODEV;
>  
> -	of_node_put(adv->host_node);
> -
>  	adv->use_timing_gen = !of_property_read_bool(np,
>  						"adi,disable-timing-generator");
>  

-- 
Regards,

Laurent Pinchart
