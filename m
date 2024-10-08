Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90BCE994399
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 11:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9F810E4AD;
	Tue,  8 Oct 2024 09:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.whiteo.stw.pengutronix.de
 (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB2810E4AD
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 09:07:44 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.whiteo.stw.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1sy6Bp-0007wE-M4; Tue, 08 Oct 2024 11:07:33 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1sy6Bn-000KZ9-F9; Tue, 08 Oct 2024 11:07:31 +0200
Received: from pza by lupine with local (Exim 4.96)
 (envelope-from <p.zabel@pengutronix.de>) id 1sy6Bn-0004Kr-1F;
 Tue, 08 Oct 2024 11:07:31 +0200
Message-ID: <650b56918dafbbf6cb07487b58fdfdf1ee9f48db.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] drm/panel: ilitek-ili9881c: Explicitly set address
 mode, allow =?ISO-8859-1?Q?180=B0?= rotation
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang
 <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 kernel@pengutronix.de
Date: Tue, 08 Oct 2024 11:07:31 +0200
In-Reply-To: <20240626-drm-panel-ili9881c-rotation-v1-1-e0ff54173e32@pengutronix.de>
References: <20240626-drm-panel-ili9881c-rotation-v1-0-e0ff54173e32@pengutronix.de>
 <20240626-drm-panel-ili9881c-rotation-v1-1-e0ff54173e32@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

On Mi, 2024-06-26 at 16:40 +0200, Philipp Zabel wrote:
> We can use horizontal and vertical flipping via the MIPI DCS address
> mode to rotate the display by 180=C2=B0 using the device tree "rotation"
> property. Since the tl050hdv35 panel has been defined as rotated,
> we have to invert the bits there.
>=20
> Signed-off-by: Philipp Zabel <p.zabel@pengutronix.de>

Gentle ping, this still cleanly applies on drm-misc-next.

> ---
>  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/=
drm/panel/panel-ilitek-ili9881c.c
> index 084c37fa7348..b4565ff1a0de 100644
> --- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> +++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
> @@ -42,6 +42,7 @@ struct ili9881c_desc {
>  	const size_t init_length;
>  	const struct drm_display_mode *mode;
>  	const unsigned long mode_flags;
> +	u8 default_address_mode;
>  };
> =20
>  struct ili9881c {
> @@ -53,6 +54,7 @@ struct ili9881c {
>  	struct gpio_desc	*reset;
> =20
>  	enum drm_panel_orientation	orientation;
> +	u8 address_mode;
>  };
> =20
>  #define ILI9881C_SWITCH_PAGE_INSTR(_page)	\
> @@ -815,8 +817,6 @@ static const struct ili9881c_instr tl050hdv35_init[] =
=3D {
>  	ILI9881C_COMMAND_INSTR(0xd1, 0x4b),
>  	ILI9881C_COMMAND_INSTR(0xd2, 0x60),
>  	ILI9881C_COMMAND_INSTR(0xd3, 0x39),
> -	ILI9881C_SWITCH_PAGE_INSTR(0),
> -	ILI9881C_COMMAND_INSTR(0x36, 0x03),
>  };
> =20
>  static const struct ili9881c_instr w552946ab_init[] =3D {
> @@ -1299,6 +1299,14 @@ static int ili9881c_prepare(struct drm_panel *pane=
l)
>  	if (ret)
>  		return ret;
> =20
> +	if (ctx->address_mode) {
> +		ret =3D mipi_dsi_dcs_write(ctx->dsi, MIPI_DCS_SET_ADDRESS_MODE,
> +					 &ctx->address_mode,
> +					 sizeof(ctx->address_mode));
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>  	ret =3D mipi_dsi_dcs_set_tear_on(ctx->dsi, MIPI_DSI_DCS_TEAR_MODE_VBLAN=
K);
>  	if (ret)
>  		return ret;
> @@ -1521,6 +1529,12 @@ static int ili9881c_dsi_probe(struct mipi_dsi_devi=
ce *dsi)
>  		return ret;
>  	}
> =20
> +	ctx->address_mode =3D ctx->desc->default_address_mode;
> +	if (ctx->orientation =3D=3D DRM_MODE_PANEL_ORIENTATION_BOTTOM_UP) {
> +		ctx->address_mode ^=3D 0x03;
> +		ctx->orientation =3D DRM_MODE_PANEL_ORIENTATION_NORMAL;
> +	}
> +

Is there anything wrong with the panel driver eating the bottom-up
panel orientation property by flipping scanout in the panel?

regards
Philipp

>  	ctx->panel.prepare_prev_first =3D true;
> =20
>  	ret =3D drm_panel_of_backlight(&ctx->panel);
> @@ -1572,6 +1586,7 @@ static const struct ili9881c_desc tl050hdv35_desc =
=3D {
>  	.mode =3D &tl050hdv35_default_mode,
>  	.mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
>  		      MIPI_DSI_MODE_LPM,
> +	.default_address_mode =3D 0x03,
>  };
> =20
>  static const struct ili9881c_desc w552946aba_desc =3D {
>=20
