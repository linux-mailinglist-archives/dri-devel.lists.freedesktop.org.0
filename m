Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC98E65B6B0
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 19:46:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D546510E371;
	Mon,  2 Jan 2023 18:46:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [46.30.211.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B7210E370
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 18:46:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=OBlDSr4lhC00U7ExCtteVxPrZaOIkpheeh0gYpLqn8Y=;
 b=Ensj31qvpWuD49d801qSNg09yXZaA21areApGGDGgtmaFvPx5cue/GrXr2ZjLjC9du8+zN9WBUD8H
 q5HDyLRIGYn4lE0folgJCVbLPPXMgfzZaQiD1Eyen7Rvm1m/pEUqIuxxflQyzMczGdJ1Cwuyc5pFZe
 bSGA0cGfe1nslnmitU5ma9sIwqeib4fIQsxD+jtGK9+gDCIlaboSOekHTE9EVUT6jWprtDUaB5rDk3
 HVb8G50SKErSYYbmd8NTZXJFmTgGH+e2BFviX3E+VS4tuxRDbtzgtkGktyNDk8wC4hq1y7nohva+0l
 q0JwbqYMsQ/86k1hm5oDXrQ0iHOJKGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=OBlDSr4lhC00U7ExCtteVxPrZaOIkpheeh0gYpLqn8Y=;
 b=4mKIzeSySg+8w2CeFhXrVD05UCvarJew4q0XO2o1Yt8LBDQJRfxphd13FxwKlED4o76+CFhvl1hXY
 n2bDkpVBg==
X-HalOne-ID: 9f12f8d2-8acd-11ed-9196-cde5ad41a1dd
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id 9f12f8d2-8acd-11ed-9196-cde5ad41a1dd;
 Mon, 02 Jan 2023 18:45:27 +0000 (UTC)
Date: Mon, 2 Jan 2023 19:45:26 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 06/14] drm/panel-boe-bf060y8m-aj0: Drop custom DSI write
 macro
Message-ID: <Y7MmRp7rBBFOLa1D@ravnborg.org>
References: <20221228014757.3170486-1-javierm@redhat.com>
 <20221228014757.3170486-7-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228014757.3170486-7-javierm@redhat.com>
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

Hi Javier,

On Wed, Dec 28, 2022 at 02:47:49AM +0100, Javier Martinez Canillas wrote:
> There is a macro for this already in the <drm/drm_mipi_dsi.h> header, use
> that instead and delete the custom DSI write macro defined in the driver.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
>  .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    | 28 +++++++------------
>  1 file changed, 10 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
> index ad58840eda41..7fff89cb1cd3 100644
> --- a/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
> +++ b/drivers/gpu/drm/panel/panel-boe-bf060y8m-aj0.c
> @@ -43,14 +43,6 @@ struct boe_bf060y8m_aj0 *to_boe_bf060y8m_aj0(struct drm_panel *panel)
>  	return container_of(panel, struct boe_bf060y8m_aj0, panel);
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
>  static void boe_bf060y8m_aj0_reset(struct boe_bf060y8m_aj0 *boe)
>  {
>  	gpiod_set_value_cansleep(boe->reset_gpio, 0);
> @@ -67,11 +59,11 @@ static int boe_bf060y8m_aj0_on(struct boe_bf060y8m_aj0 *boe)
>  	struct device *dev = &dsi->dev;
>  	int ret;
>  
> -	dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
> -	dsi_dcs_write_seq(dsi, 0xb2, 0x00, 0x4c);
> -	dsi_dcs_write_seq(dsi, MIPI_DCS_SET_3D_CONTROL, 0x10);
> -	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, DCS_ALLOW_HBM_RANGE);
> -	dsi_dcs_write_seq(dsi, 0xf8,
> +	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, 0xb2, 0x00, 0x4c);
> +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_3D_CONTROL, 0x10);
> +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, DCS_ALLOW_HBM_RANGE);
> +	mipi_dsi_dcs_write_seq(dsi, 0xf8,
>  			  0x00, 0x08, 0x10, 0x00, 0x22, 0x00, 0x00, 0x2d);
Fix indent.
With this fixed in all places:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>  
>  	ret = mipi_dsi_dcs_exit_sleep_mode(dsi);
> @@ -81,17 +73,17 @@ static int boe_bf060y8m_aj0_on(struct boe_bf060y8m_aj0 *boe)
>  	}
>  	msleep(30);
>  
> -	dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
> -	dsi_dcs_write_seq(dsi, 0xc0,
> +	mipi_dsi_dcs_write_seq(dsi, 0xb0, 0xa5, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, 0xc0,
>  			  0x08, 0x48, 0x65, 0x33, 0x33, 0x33,
>  			  0x2a, 0x31, 0x39, 0x20, 0x09);
> -	dsi_dcs_write_seq(dsi, 0xc1, 0x00, 0x00, 0x00, 0x1f, 0x1f,
> +	mipi_dsi_dcs_write_seq(dsi, 0xc1, 0x00, 0x00, 0x00, 0x1f, 0x1f,
>  			  0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f,
>  			  0x1f, 0x1f, 0x1f, 0x1f, 0x1f, 0x1f);
> -	dsi_dcs_write_seq(dsi, 0xe2, 0x20, 0x04, 0x10, 0x12, 0x92,
> +	mipi_dsi_dcs_write_seq(dsi, 0xe2, 0x20, 0x04, 0x10, 0x12, 0x92,
>  			  0x4f, 0x8f, 0x44, 0x84, 0x83, 0x83, 0x83,
>  			  0x5c, 0x5c, 0x5c);
> -	dsi_dcs_write_seq(dsi, 0xde, 0x01, 0x2c, 0x00, 0x77, 0x3e);
> +	mipi_dsi_dcs_write_seq(dsi, 0xde, 0x01, 0x2c, 0x00, 0x77, 0x3e);
>  
>  	msleep(30);
>  
> -- 
> 2.38.1
