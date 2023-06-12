Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BFE72BB2F
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 10:51:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77FDD10E1CA;
	Mon, 12 Jun 2023 08:51:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C83910E1DE
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 08:51:13 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1F32B611E9;
 Mon, 12 Jun 2023 08:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A289C433D2;
 Mon, 12 Jun 2023 08:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686559872;
 bh=qqZpQbw+uJ4TgveRfEHhizk7kcrsXFsffDdBs7ZZqiU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K2jxseoh5MVLk7tajv3VlH968eMfH9tMZzzrCnoa4LbPnIvnLhfpeZrK4KeEDqYk9
 rey6jSIfPV41SsRXz4bB/sJ4HVoG1bUyxOCKx/A4IJGjk5RbJ1NMhkS8ajC0g1Ct9v
 aU8K8wNA7/8y839htIkzH+ctswE2PVg0U0gwU6R3t3uCvQ7S6KZqu5vwVqVy/IzNA9
 Udhg52Zq+ibJKubV+GZEKJLZoTdgxV6LHpI3+vsFejax1oXL3v+gSnhu2Wrew3EiL7
 k2Lz8iCTDpyaBNIYNtf0mVMTqesps8IxVoUoIiLUlt+KHRRJZqRBm0s1qArtluDT9i
 gIfb/YQ7qH7Pg==
Date: Mon, 12 Jun 2023 10:51:09 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 6/7] drm/panel: sitronix-st7789v: Add EDT ET028013DMA
 panel support
Message-ID: <tr2rmz375jwkwjufhgvb7vbxwqik2w6i276yshh2tbo6dcfhh7@llvt6bigivfy>
References: <20230609145951.853533-1-miquel.raynal@bootlin.com>
 <20230609145951.853533-7-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230609145951.853533-7-miquel.raynal@bootlin.com>
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
Cc: devicetree@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 09, 2023 at 04:59:50PM +0200, Miquel Raynal wrote:
> This panel from Emerging Display Technologies Corporation features an
> ST7789V2 panel inside which is almost identical to what the Sitronix
> panel driver supports.
>=20
> In practice, the module physical size is specific, and experiments show
> that the display will malfunction if any of the following situation
> occurs:
> * Pixel clock is above 3MHz
> * Pixel clock is not inverted
> I could not properly identify the reasons behind these failures, scope
> captures show valid input signals.
>=20
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../gpu/drm/panel/panel-sitronix-st7789v.c    | 34 +++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu=
/drm/panel/panel-sitronix-st7789v.c
> index 212bccc31804..7de192a3a8aa 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
> @@ -30,7 +30,8 @@
>  #define ST7789V_RGBCTRL_RCM(n)			(((n) & 3) << 5)
>  #define ST7789V_RGBCTRL_VSYNC_HIGH		BIT(3)
>  #define ST7789V_RGBCTRL_HSYNC_HIGH		BIT(2)
> -#define ST7789V_RGBCTRL_PCLK_HIGH		BIT(1)
> +#define ST7789V_RGBCTRL_PCLK_FALLING		BIT(1)
> +#define ST7789V_RGBCTRL_PCLK_RISING		0
>  #define ST7789V_RGBCTRL_VBP(n)			((n) & 0x7f)
>  #define ST7789V_RGBCTRL_HBP(n)			((n) & 0x1f)
> =20
> @@ -117,6 +118,7 @@ struct st7789v_panel_info {
>  	u16 width_mm;
>  	u16 height_mm;
>  	u32 bus_format;
> +	u32 bus_flags;
>  };
> =20
>  struct st7789v {
> @@ -175,6 +177,18 @@ static const struct drm_display_mode default_mode =
=3D {
>  	.vtotal =3D 320 + 8 + 4 + 4,
>  };
> =20
> +static const struct drm_display_mode slow_mode =3D {
> +	.clock =3D 3000,
> +	.hdisplay =3D 240,
> +	.hsync_start =3D 240 + 38,
> +	.hsync_end =3D 240 + 38 + 10,
> +	.htotal =3D 240 + 38 + 10 + 10,
> +	.vdisplay =3D 320,
> +	.vsync_start =3D 320 + 8,
> +	.vsync_end =3D 320 + 8 + 4,
> +	.vtotal =3D 320 + 8 + 4 + 4,
> +};

Why is it supposed to be slow (and compared to what)? It looks like a
fairly normal mode to me? Or is it because it's refreshed at 30Hz?

Either way, the ST7789V is a panel controller and can be connected to a
wide range of panels depending on the model, so it would be better to
just use the model name there.

>  static int st7789v_get_modes(struct drm_panel *panel,
>  			     struct drm_connector *connector)
>  {
> @@ -197,6 +211,7 @@ static int st7789v_get_modes(struct drm_panel *panel,
> =20
>  	connector->display_info.width_mm =3D panel_info->width_mm;
>  	connector->display_info.height_mm =3D panel_info->height_mm;
> +	connector->display_info.bus_flags =3D panel_info->bus_flags;
>  	drm_display_info_set_bus_formats(&connector->display_info,
>  					 &panel_info->bus_format, 1);
> =20
> @@ -206,8 +221,13 @@ static int st7789v_get_modes(struct drm_panel *panel,
>  static int st7789v_prepare(struct drm_panel *panel)
>  {
>  	struct st7789v *ctx =3D panel_to_st7789v(panel);
> +	const struct st7789v_panel_info *panel_info =3D ctx->panel_info;
> +	u8 pck =3D ST7789V_RGBCTRL_PCLK_FALLING;
>  	int ret;
> =20
> +	if (panel_info->bus_flags & DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE)
> +		pck =3D ST7789V_RGBCTRL_PCLK_RISING;
> +

I guess it could be in a separate commit

Maxime

>  	ret =3D regulator_enable(ctx->power);
>  	if (ret)
>  		return ret;
> @@ -321,7 +341,7 @@ static int st7789v_prepare(struct drm_panel *panel)
>  					     ST7789V_RGBCTRL_RCM(2) |
>  					     ST7789V_RGBCTRL_VSYNC_HIGH |
>  					     ST7789V_RGBCTRL_HSYNC_HIGH |
> -					     ST7789V_RGBCTRL_PCLK_HIGH));
> +					     pck));
>  	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_VBP(8)));
>  	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RGBCTRL_HBP(20)));
> =20
> @@ -422,14 +442,24 @@ static const struct st7789v_panel_info st7789v_info=
 =3D {
>  	.bus_format =3D MEDIA_BUS_FMT_RGB666_1X18,
>  };
> =20
> +static const struct st7789v_panel_info et028013dma_info =3D {
> +	.display_mode =3D &slow_mode,
> +	.width_mm =3D 43,
> +	.height_mm =3D 58,
> +	.bus_format =3D MEDIA_BUS_FMT_RGB666_1X18,
> +	.bus_flags =3D DRM_BUS_FLAG_PIXDATA_SAMPLE_POSEDGE,
> +};
> +
>  static const struct of_device_id st7789v_of_match[] =3D {
>  	{ .compatible =3D "sitronix,st7789v", .data =3D &st7789v_info },
> +	{ .compatible =3D "edt,et028013dma", .data =3D &et028013dma_info },

We should sort them by alphabetical order

Maxime
