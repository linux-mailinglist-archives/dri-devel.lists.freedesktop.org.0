Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F6A69C646D
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 23:43:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0260210E311;
	Tue, 12 Nov 2024 22:43:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ADjiEYLk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468CB10E074
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 22:43:45 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C2B8A710;
 Tue, 12 Nov 2024 23:43:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1731451411;
 bh=EMVAYLUy4QlCRPX/qBMPyGOPvg4ko/8HnJaHBV8tsdw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ADjiEYLk/sUfhCJwOEVrhHzxaWlqS/f/vxwzxd5Bv8UpKa//7wt2oHPBuTqdkuTpO
 qBCQ0DJAJTbrOwZOLr0SPw/tWwjqclZvwuLwmgE6sibRmywU1l+BgmX41hG03teQvR
 849IGAEYOpDag0dXyH3IB9gde538k2r7wykOSODg=
Date: Wed, 13 Nov 2024 00:43:35 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] drm/bridge: Constify struct i2c_device_id
Message-ID: <20241112224335.GA29944@pendragon.ideasonboard.com>
References: <bdba1f49b4b48e22628482b49ce81f8e1f0d97b1.1731445901.git.christophe.jaillet@wanadoo.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bdba1f49b4b48e22628482b49ce81f8e1f0d97b1.1731445901.git.christophe.jaillet@wanadoo.fr>
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

Hi Christophe,

Thank you for the patch.

On Tue, Nov 12, 2024 at 10:12:25PM +0100, Christophe JAILLET wrote:
> 'struct i2c_device_id' is not modified in these drivers.
> 
> Constifying this structure moves some data to a read-only section, so
> increase overall security.
> 
> On a x86_64, with allmodconfig, as an example:
> Before:
> ======
>    text	   data	    bss	    dec	    hex	filename
>   15566	    987	     32	  16585	   40c9	drivers/gpu/drm/bridge/chipone-icn6211.o
> 
> After:
> =====
>    text	   data	    bss	    dec	    hex	filename
>   15630	    923	     32	  16585	   40c9	drivers/gpu/drm/bridge/chipone-icn6211.o
> 
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
> Compile tested-only.
> ---
>  drivers/gpu/drm/bridge/chipone-icn6211.c   | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9211.c    | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611.c    | 2 +-
>  drivers/gpu/drm/bridge/lontium-lt9611uxc.c | 2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi83.c      | 2 +-
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c      | 2 +-

While at it, could you address drivers/gpu/drm/i2c/tda9950.c too ? If I
were to push a tad more, there are only two other drivers in the kernel
with the same issues outside of drivers/gpu/ according to

$ git grep '^static struct i2c_device_id'
drivers/gpu/drm/bridge/chipone-icn6211.c:static struct i2c_device_id chipone_i2c_id[] = {
drivers/gpu/drm/bridge/lontium-lt9211.c:static struct i2c_device_id lt9211_id[] = {
drivers/gpu/drm/bridge/lontium-lt9611.c:static struct i2c_device_id lt9611_id[] = {
drivers/gpu/drm/bridge/lontium-lt9611uxc.c:static struct i2c_device_id lt9611uxc_id[] = {
drivers/gpu/drm/bridge/ti-sn65dsi83.c:static struct i2c_device_id sn65dsi83_id[] = {
drivers/gpu/drm/bridge/ti-sn65dsi86.c:static struct i2c_device_id ti_sn65dsi86_id[] = {
drivers/gpu/drm/i2c/tda9950.c:static struct i2c_device_id tda9950_ids[] = {
drivers/input/keyboard/cypress-sf.c:static struct i2c_device_id cypress_sf_id_table[] = {
sound/soc/codecs/cs42l51-i2c.c:static struct i2c_device_id cs42l51_i2c_id[] = {

:-)

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

>  6 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
> index 9eecac457dcf..d47703559b0d 100644
> --- a/drivers/gpu/drm/bridge/chipone-icn6211.c
> +++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
> @@ -785,7 +785,7 @@ static struct mipi_dsi_driver chipone_dsi_driver = {
>  	},
>  };
>  
> -static struct i2c_device_id chipone_i2c_id[] = {
> +static const struct i2c_device_id chipone_i2c_id[] = {
>  	{ "chipone,icn6211" },
>  	{},
>  };
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9211.c b/drivers/gpu/drm/bridge/lontium-lt9211.c
> index c8881796fba4..999ddebb832d 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9211.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9211.c
> @@ -773,7 +773,7 @@ static void lt9211_remove(struct i2c_client *client)
>  	drm_bridge_remove(&ctx->bridge);
>  }
>  
> -static struct i2c_device_id lt9211_id[] = {
> +static const struct i2c_device_id lt9211_id[] = {
>  	{ "lontium,lt9211" },
>  	{},
>  };
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
> index 1b31fdebe164..8f25b338a8d8 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
> @@ -1235,7 +1235,7 @@ static void lt9611_remove(struct i2c_client *client)
>  	of_node_put(lt9611->dsi0_node);
>  }
>  
> -static struct i2c_device_id lt9611_id[] = {
> +static const struct i2c_device_id lt9611_id[] = {
>  	{ "lontium,lt9611", 0 },
>  	{}
>  };
> diff --git a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> index 4d1d40e1f1b4..f89af8203c9d 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt9611uxc.c
> @@ -913,7 +913,7 @@ static void lt9611uxc_remove(struct i2c_client *client)
>  	of_node_put(lt9611uxc->dsi0_node);
>  }
>  
> -static struct i2c_device_id lt9611uxc_id[] = {
> +static const struct i2c_device_id lt9611uxc_id[] = {
>  	{ "lontium,lt9611uxc", 0 },
>  	{ /* sentinel */ }
>  };
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> index 57a7ed13f996..00d3bfa645f5 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> @@ -732,7 +732,7 @@ static void sn65dsi83_remove(struct i2c_client *client)
>  	drm_bridge_remove(&ctx->bridge);
>  }
>  
> -static struct i2c_device_id sn65dsi83_id[] = {
> +static const struct i2c_device_id sn65dsi83_id[] = {
>  	{ "ti,sn65dsi83", MODEL_SN65DSI83 },
>  	{ "ti,sn65dsi84", MODEL_SN65DSI84 },
>  	{},
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 9e31f750fd88..ce4c026b064f 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -1970,7 +1970,7 @@ static int ti_sn65dsi86_probe(struct i2c_client *client)
>  	return ti_sn65dsi86_add_aux_device(pdata, &pdata->aux_aux, "aux");
>  }
>  
> -static struct i2c_device_id ti_sn65dsi86_id[] = {
> +static const struct i2c_device_id ti_sn65dsi86_id[] = {
>  	{ "ti,sn65dsi86", 0},
>  	{},
>  };

-- 
Regards,

Laurent Pinchart
