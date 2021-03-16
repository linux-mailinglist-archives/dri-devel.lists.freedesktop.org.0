Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B9BE33D58E
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 15:11:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA835898C8;
	Tue, 16 Mar 2021 14:11:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95440898C8
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 14:11:34 +0000 (UTC)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi
 [91.157.208.71])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id DB1C58C8;
 Tue, 16 Mar 2021 15:11:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1615903892;
 bh=Z09rP8IVXYXQg/2OfrcqcpPPXn+n4i/CrdmByHSPXco=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Vt/x3rj4Hr7aif4S4Q7qTE8NpHJKtOTVsIbT6GRalQenM0PF3UnYLsKe/wHIXurr/
 KVuTYZrV69mAgTjjGSG2zA9s7xcbZdrNa+hykqozhEfgR/WiDbz9+GR8N0BT/4FmAt
 eTOLhOqVDjyhdC/lTipwlZRtuwT/HNATvqvhobl0=
Subject: Re: [PATCH] drm/panel: panel-dsi-cm: disable TE for now
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sebastian Reichel <sre@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
References: <YDnyVV/O78sQjtWb@atomide.com>
 <20210227214542.99961-1-sebastian.reichel@collabora.com>
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <c8d624ce-5cc5-ba83-4446-4c7a7903b344@ideasonboard.com>
Date: Tue, 16 Mar 2021 16:11:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210227214542.99961-1-sebastian.reichel@collabora.com>
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
Cc: Tony Lindgren <tony@atomide.com>, Sekhar Nori <nsekhar@ti.com>,
 Nikhil Devshatwar <nikhil.nd@ti.com>, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Sebastian, Sam, Thierry,

On 27/02/2021 23:45, Sebastian Reichel wrote:
> From: Sebastian Reichel <sre@kernel.org>
> 
> Disable TE for Droid 4 panel, since implementation is currently
> broken. Also disable it for N950 panel, which is untested.
> 
> Reported-by: Tony Lindgren <tony@atomide.com>
> Reported-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> Fixes: 4c1b935fea54 ("drm/omap: dsi: move TE GPIO handling into core")
> Signed-off-by: Sebastian Reichel <sre@kernel.org>
> ---
> I suggest to start by fix the regression like this and look into
> proper Droid 4 TE support separatly. Assumption is, that Tomi
> tested taal panel, droid4 panel is 'broken' and N950 (himalaya)
> is untested [*], so choosing safe default. Patch is compile-tested
> only.
> 
> [*] N950 display is not yet functional on mainline, since it needs
> the omap3 FIFO workaround:
> https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-n900.git/commit/?h=n950-display-tony&id=d4cbc226a30b29bf2583ffff97b052c9ec68c8a3
> ---
>   drivers/gpu/drm/panel/panel-dsi-cm.c | 12 +++++++++---
>   1 file changed, 9 insertions(+), 3 deletions(-)

Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Sam, Thierry, will you pick this up or can I push to drm-misc-fixes?

  Tomi

> diff --git a/drivers/gpu/drm/panel/panel-dsi-cm.c b/drivers/gpu/drm/panel/panel-dsi-cm.c
> index af381d756ac1..5fbfb71ca3d9 100644
> --- a/drivers/gpu/drm/panel/panel-dsi-cm.c
> +++ b/drivers/gpu/drm/panel/panel-dsi-cm.c
> @@ -37,6 +37,7 @@ struct dsic_panel_data {
>   	u32 height_mm;
>   	u32 max_hs_rate;
>   	u32 max_lp_rate;
> +	bool te_support;
>   };
>   
>   struct panel_drv_data {
> @@ -334,9 +335,11 @@ static int dsicm_power_on(struct panel_drv_data *ddata)
>   	if (r)
>   		goto err;
>   
> -	r = mipi_dsi_dcs_set_tear_on(ddata->dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> -	if (r)
> -		goto err;
> +	if (ddata->panel_data->te_support) {
> +		r = mipi_dsi_dcs_set_tear_on(ddata->dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> +		if (r)
> +			goto err;
> +	}
>   
>   	/* possible panel bug */
>   	msleep(100);
> @@ -619,6 +622,7 @@ static const struct dsic_panel_data taal_data = {
>   	.height_mm = 0,
>   	.max_hs_rate = 300000000,
>   	.max_lp_rate = 10000000,
> +	.te_support = true,
>   };
>   
>   static const struct dsic_panel_data himalaya_data = {
> @@ -629,6 +633,7 @@ static const struct dsic_panel_data himalaya_data = {
>   	.height_mm = 88,
>   	.max_hs_rate = 300000000,
>   	.max_lp_rate = 10000000,
> +	.te_support = false,
>   };
>   
>   static const struct dsic_panel_data droid4_data = {
> @@ -639,6 +644,7 @@ static const struct dsic_panel_data droid4_data = {
>   	.height_mm = 89,
>   	.max_hs_rate = 300000000,
>   	.max_lp_rate = 10000000,
> +	.te_support = false,
>   };
>   
>   static const struct of_device_id dsicm_of_match[] = {
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
