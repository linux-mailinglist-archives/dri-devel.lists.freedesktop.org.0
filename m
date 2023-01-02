Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC4765B6C6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 19:56:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC95510E37B;
	Mon,  2 Jan 2023 18:56:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:404::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBA110E37B
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 18:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=T70pOC09+NujKRVeR1akX6EBNTO9mHE+jSLlF9LW/Ck=;
 b=CGY7vkdVsWoDv28hYU39CZBRmGr0sQ5sc6Xee7Ui5MgOoBb/a4P6pfYwYrzM54WdbNfHrhCHK+O4o
 G6p7W4rfY3o8XMdMLrd29ClE5IuB3EtQv68A0JUnYgED18vWRMtffTxuZOgkgbJ9a3Z6cByHIK91dc
 JTvtV2RjUQTULGvtuWCmvF2xiMgY5sys0rJSX7dV3pEtD/3ZJ3q1fT8crMZm2OBGolhC1pIUAS6Abr
 eZ9gXI4zgQZ1gBmE5MqfF35NQonoabF00QxgyNkgLJkwjKsM0yo24clX3msfQHJ6HJhTYt929MNB5g
 NDriwf1vLZvxJHId/gd+ltPbp7QpBig==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=T70pOC09+NujKRVeR1akX6EBNTO9mHE+jSLlF9LW/Ck=;
 b=catoolPBNx2RQt2NPCemAzAN3qkb/Fn4dnN5nM5fKVI4AAPGeMFKhNVcRyfxZgCO0IH9F+9tbqIsI
 n+0mRS9Cw==
X-HalOne-ID: 231ad9c3-8acf-11ed-820b-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id 231ad9c3-8acf-11ed-820b-7703b0afff57;
 Mon, 02 Jan 2023 18:56:19 +0000 (UTC)
Date: Mon, 2 Jan 2023 19:56:17 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 10/14] drm/panel-samsung-sofef00: Drop custom DSI write
 macro
Message-ID: <Y7Mo0bTuzI3Nil0f@ravnborg.org>
References: <20221228014757.3170486-1-javierm@redhat.com>
 <20221228014757.3170486-11-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228014757.3170486-11-javierm@redhat.com>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 28, 2022 at 02:47:53AM +0100, Javier Martinez Canillas wrote:
> There is a macro for this already in the <drm/drm_mipi_dsi.h> header, use
> that instead and delete the custom DSI write macro defined in the driver.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
> 
>  drivers/gpu/drm/panel/panel-samsung-sofef00.c | 24 +++++++------------
>  1 file changed, 8 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> index 1a0d24595faa..9db49a028930 100644
> --- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> +++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
> @@ -34,14 +34,6 @@ struct sofef00_panel *to_sofef00_panel(struct drm_panel *panel)
>  	return container_of(panel, struct sofef00_panel, panel);
>  }
>  
> -#define dsi_dcs_write_seq(dsi, seq...) do {				\
> -		static const u8 d[] = { seq };				\
> -		int ret;						\
> -		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
> -		if (ret < 0)						\
> -			return ret;					\
> -	} while (0)
> -
>  static void sofef00_panel_reset(struct sofef00_panel *ctx)
>  {
>  	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> @@ -67,7 +59,7 @@ static int sofef00_panel_on(struct sofef00_panel *ctx)
>  	}
>  	usleep_range(10000, 11000);
>  
> -	dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
>  
>  	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
>  	if (ret < 0) {
> @@ -75,13 +67,13 @@ static int sofef00_panel_on(struct sofef00_panel *ctx)
>  		return ret;
>  	}
>  
> -	dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> -	dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> -	dsi_dcs_write_seq(dsi, 0xb0, 0x07);
> -	dsi_dcs_write_seq(dsi, 0xb6, 0x12);
> -	dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> -	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
> -	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> +	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0x5a, 0x5a);
> +	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0x07);
> +	mipi_dsi_dcs_write_seq(dsi, 0xb6, 0x12);
> +	mipi_dsi_dcs_write_seq(dsi, 0xf0, 0xa5, 0xa5);
> +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
> +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
>  
>  	ret = mipi_dsi_dcs_set_display_on(dsi);
>  	if (ret < 0) {
> -- 
> 2.38.1
