Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8074B48F7
	for <lists+dri-devel@lfdr.de>; Mon, 14 Feb 2022 11:13:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6C610E4CA;
	Mon, 14 Feb 2022 10:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18D4110E4CA
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Feb 2022 10:13:50 +0000 (UTC)
Date: Mon, 14 Feb 2022 10:13:37 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v15 1/7] drm/ingenic: Fix support for JZ4780 HDMI output
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <PQHA7R.CIX6XS4CFLMM3@crapouillou.net>
In-Reply-To: <9d3a2000d2bb014f1afb0613537bdc523202135d.1644681054.git.hns@goldelico.com>
References: <cover.1644681054.git.hns@goldelico.com>
 <9d3a2000d2bb014f1afb0613537bdc523202135d.1644681054.git.hns@goldelico.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
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
Cc: Paul Boddie <paul@boddie.org.uk>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Robert Foss <robert.foss@linaro.org>,
 dri-devel@lists.freedesktop.org, Jonas Karlman <jonas@kwiboo.se>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-mips@vger.kernel.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, letux-kernel@openphoenux.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Le sam., f=E9vr. 12 2022 at 16:50:49 +0100, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> From: Paul Boddie <paul@boddie.org.uk>
>=20
> We have to make sure that
> - JZ_LCD_OSDC_ALPHAEN is set
> - plane f0 is disabled and not seen from user-space

Actually it will still be seen from user-space, but it won't be=20
possible to use it. So before applying I'll change this to:
"plane f0 is disabled as it's not working yet"

If that's OK with you.

Cheers,
-Paul

>=20
> Tested on MIPS Creator CI20 board.
>=20
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 7f10d6eed549d..dcf44cb00821f 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -65,8 +65,10 @@ struct ingenic_dma_hwdescs {
>  struct jz_soc_info {
>  	bool needs_dev_clk;
>  	bool has_osd;
> +	bool has_alpha;
>  	bool map_noncoherent;
>  	bool use_extended_hwdesc;
> +	bool plane_f0_not_working;
>  	unsigned int max_width, max_height;
>  	const u32 *formats_f0, *formats_f1;
>  	unsigned int num_formats_f0, num_formats_f1;
> @@ -453,7 +455,7 @@ static int ingenic_drm_plane_atomic_check(struct=20
> drm_plane *plane,
>  	if (!crtc)
>  		return 0;
>=20
> -	if (plane =3D=3D &priv->f0)
> +	if (priv->soc_info->plane_f0_not_working && plane =3D=3D &priv->f0)
>  		return -EINVAL;
>=20
>  	crtc_state =3D drm_atomic_get_existing_crtc_state(state,
> @@ -1055,6 +1057,7 @@ static int ingenic_drm_bind(struct device *dev,=20
> bool has_components)
>  	long parent_rate;
>  	unsigned int i, clone_mask =3D 0;
>  	int ret, irq;
> +	u32 osdc =3D 0;
>=20
>  	soc_info =3D of_device_get_match_data(dev);
>  	if (!soc_info) {
> @@ -1312,7 +1315,10 @@ static int ingenic_drm_bind(struct device=20
> *dev, bool has_components)
>=20
>  	/* Enable OSD if available */
>  	if (soc_info->has_osd)
> -		regmap_write(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
> +		osdc |=3D JZ_LCD_OSDC_OSDEN;
> +	if (soc_info->has_alpha)
> +		osdc |=3D JZ_LCD_OSDC_ALPHAEN;
> +	regmap_write(priv->map, JZ_REG_LCD_OSDC, osdc);
>=20
>  	mutex_init(&priv->clk_mutex);
>  	priv->clock_nb.notifier_call =3D ingenic_drm_update_pixclk;
> @@ -1511,7 +1517,9 @@ static const struct jz_soc_info jz4770_soc_info=20
> =3D {
>  static const struct jz_soc_info jz4780_soc_info =3D {
>  	.needs_dev_clk =3D true,
>  	.has_osd =3D true,
> +	.has_alpha =3D true,
>  	.use_extended_hwdesc =3D true,
> +	.plane_f0_not_working =3D true,	/* REVISIT */
>  	.max_width =3D 4096,
>  	.max_height =3D 2048,
>  	.formats_f1 =3D jz4770_formats_f1,
> --
> 2.33.0
>=20


