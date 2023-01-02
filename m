Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9275D65B6B1
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jan 2023 19:47:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DADED10E36F;
	Mon,  2 Jan 2023 18:47:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com
 (mailrelay5-1.pub.mailoutpod2-cph3.one.com [46.30.211.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1353C10E36F
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Jan 2023 18:47:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=/ZAzHomv0gTa6nnBgQv0Q7o28VeLdXtgMz7vUsXOKAY=;
 b=UP9H4NwXQK9tjTN36Ubd8EArt/qYoAupbgOJRG+uGpSjaJuksc1Fvm9r04omiDGzOZgrjMn11Q/Rq
 YhWqV9QBxxWKWoDym4jqRHmaAei3D5DjsJElCYpujFcK6UWM5tfbEBEpg+Y4YiSVcmOBTSNoor+Xy5
 SUgqVm8PS7DvEo6F7HsVzkxGoPIkPou3LjpY5eKL5UQBsaw38TU5cUN23rVnNMgHcfDp2V2tZC5+Zq
 W2lG7FAXm1xdQXzgAjIyt2151odcrz8qDly+HD9AR/y8mT7fVKefdA5xz2Mks2I3CRwLU0Rk0rf7z0
 fW8pSsDzniTChVjFTQP3x4Nk5lrEOaQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=/ZAzHomv0gTa6nnBgQv0Q7o28VeLdXtgMz7vUsXOKAY=;
 b=COgo4StEfCRo042l0Jf/Br+nC3gWIWpkdDHwSsArHLm23Y0lVCyIdgQYmCETu9IIM/r7q/iT6gzrF
 j4uZPPNDg==
X-HalOne-ID: c964db1b-8acd-11ed-81f1-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay5 (Halon) with ESMTPSA
 id c964db1b-8acd-11ed-81f1-7703b0afff57;
 Mon, 02 Jan 2023 18:46:40 +0000 (UTC)
Date: Mon, 2 Jan 2023 19:46:38 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH 08/14] drm/panel-jdi-fhd-r63452: Drop custom DSI write
 macros
Message-ID: <Y7Mmji4dyXOeP2LJ@ravnborg.org>
References: <20221228014757.3170486-1-javierm@redhat.com>
 <20221228014757.3170486-9-javierm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221228014757.3170486-9-javierm@redhat.com>
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

On Wed, Dec 28, 2022 at 02:47:51AM +0100, Javier Martinez Canillas wrote:
> There are macros for these already in the <drm/drm_mipi_dsi.h> header, use
> that instead and delete the custom DSI write macros defined in the driver.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> ---
> 
>  drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c | 50 +++++++-------------
>  1 file changed, 17 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
> index d8765b2294fb..e3f0e59b5e36 100644
> --- a/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
> +++ b/drivers/gpu/drm/panel/panel-jdi-fhd-r63452.c
> @@ -29,22 +29,6 @@ static inline struct jdi_fhd_r63452 *to_jdi_fhd_r63452(struct drm_panel *panel)
>  	return container_of(panel, struct jdi_fhd_r63452, panel);
>  }
>  
> -#define dsi_generic_write_seq(dsi, seq...) do {				\
> -		static const u8 d[] = { seq };				\
> -		int ret;						\
> -		ret = mipi_dsi_generic_write(dsi, d, ARRAY_SIZE(d));	\
> -		if (ret < 0)						\
> -			return ret;					\
> -	} while (0)
> -
> -#define dsi_dcs_write_seq(dsi, seq...) do {				\
> -		static const u8 d[] = { seq };				\
> -		int ret;						\
> -		ret = mipi_dsi_dcs_write_buffer(dsi, d, ARRAY_SIZE(d));	\
> -		if (ret < 0)						\
> -			return ret;					\
> -	} while (0)
> -
>  static void jdi_fhd_r63452_reset(struct jdi_fhd_r63452 *ctx)
>  {
>  	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
> @@ -63,12 +47,12 @@ static int jdi_fhd_r63452_on(struct jdi_fhd_r63452 *ctx)
>  
>  	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
>  
> -	dsi_generic_write_seq(dsi, 0xb0, 0x00);
> -	dsi_generic_write_seq(dsi, 0xd6, 0x01);
> -	dsi_generic_write_seq(dsi, 0xec,
> +	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x00);
> +	mipi_dsi_generic_write_seq(dsi, 0xd6, 0x01);
> +	mipi_dsi_generic_write_seq(dsi, 0xec,
>  			      0x64, 0xdc, 0xec, 0x3b, 0x52, 0x00, 0x0b, 0x0b,
>  			      0x13, 0x15, 0x68, 0x0b, 0xb5);
Fix indent - with this fixed everywhere:
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> -	dsi_generic_write_seq(dsi, 0xb0, 0x03);
> +	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x03);
>  
>  	ret = mipi_dsi_dcs_set_tear_on(dsi, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
>  	if (ret < 0) {
> @@ -76,7 +60,7 @@ static int jdi_fhd_r63452_on(struct jdi_fhd_r63452 *ctx)
>  		return ret;
>  	}
>  
> -	dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_ADDRESS_MODE, 0x00);
>  
>  	ret = mipi_dsi_dcs_set_pixel_format(dsi, 0x77);
>  	if (ret < 0) {
> @@ -108,10 +92,10 @@ static int jdi_fhd_r63452_on(struct jdi_fhd_r63452 *ctx)
>  		return ret;
>  	}
>  
> -	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
> -	dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
> -	dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x00);
> -	dsi_dcs_write_seq(dsi, 0x84, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x24);
> +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, MIPI_DCS_SET_CABC_MIN_BRIGHTNESS, 0x00);
> +	mipi_dsi_dcs_write_seq(dsi, 0x84, 0x00);
>  
>  	ret = mipi_dsi_dcs_set_display_on(dsi);
>  	if (ret < 0) {
> @@ -127,10 +111,10 @@ static int jdi_fhd_r63452_on(struct jdi_fhd_r63452 *ctx)
>  	}
>  	msleep(80);
>  
> -	dsi_generic_write_seq(dsi, 0xb0, 0x04);
> -	dsi_dcs_write_seq(dsi, 0x84, 0x00);
> -	dsi_generic_write_seq(dsi, 0xc8, 0x11);
> -	dsi_generic_write_seq(dsi, 0xb0, 0x03);
> +	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x04);
> +	mipi_dsi_dcs_write_seq(dsi, 0x84, 0x00);
> +	mipi_dsi_generic_write_seq(dsi, 0xc8, 0x11);
> +	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x03);
>  
>  	return 0;
>  }
> @@ -143,12 +127,12 @@ static int jdi_fhd_r63452_off(struct jdi_fhd_r63452 *ctx)
>  
>  	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
>  
> -	dsi_generic_write_seq(dsi, 0xb0, 0x00);
> -	dsi_generic_write_seq(dsi, 0xd6, 0x01);
> -	dsi_generic_write_seq(dsi, 0xec,
> +	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x00);
> +	mipi_dsi_generic_write_seq(dsi, 0xd6, 0x01);
> +	mipi_dsi_generic_write_seq(dsi, 0xec,
>  			      0x64, 0xdc, 0xec, 0x3b, 0x52, 0x00, 0x0b, 0x0b,
>  			      0x13, 0x15, 0x68, 0x0b, 0x95);
> -	dsi_generic_write_seq(dsi, 0xb0, 0x03);
> +	mipi_dsi_generic_write_seq(dsi, 0xb0, 0x03);
>  
>  	ret = mipi_dsi_dcs_set_display_off(dsi);
>  	if (ret < 0) {
> -- 
> 2.38.1
