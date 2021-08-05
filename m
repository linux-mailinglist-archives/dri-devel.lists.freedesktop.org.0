Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0721D3E17CD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 17:22:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E1B38919E;
	Thu,  5 Aug 2021 15:22:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B5C78919E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 15:22:43 +0000 (UTC)
Date: Thu, 05 Aug 2021 17:22:24 +0200
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 3/8] drm/ingenic: Add support for JZ4780 and HDMI output
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong
 <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Ezequiel Garcia <ezequiel@collabora.com>,
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, letux-kernel@openphoenux.org, Paul Boddie
 <paul@boddie.org.uk>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org
Message-Id: <CDHDXQ.QTKW3N6WINVB2@crapouillou.net>
In-Reply-To: <263a207d2aeb8bc95aa8464212dcc9b225548f4f.1628172477.git.hns@goldelico.com>
References: <cover.1628172477.git.hns@goldelico.com>
 <263a207d2aeb8bc95aa8464212dcc9b225548f4f.1628172477.git.hns@goldelico.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus & Paul,

Le jeu., ao=FBt 5 2021 at 16:07:52 +0200, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> From: Paul Boddie <paul@boddie.org.uk>
>=20
> Add support for the LCD controller present on JZ4780 SoCs.
> This SoC uses 8-byte descriptors which extend the current
> 4-byte descriptors used for other Ingenic SoCs.
>=20
> Also, add special handling for HDMI-A connectors.
>=20
> For some reason, only the primary planes are working
> properly. As soon as the overlay plane is enabled
> things go south :P
>=20
> Tested on MIPS Creator CI20 board.
>=20
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 163=20
> ++++++++++++++++++++--
>  drivers/gpu/drm/ingenic/ingenic-drm.h     |  52 +++++++
>  2 files changed, 200 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 5244f47634777..a2d103ae46833 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -56,13 +56,27 @@ struct ingenic_dma_hwdescs {
>  	u16 palette[256] __aligned(16);
>  };
>=20
> +struct ingenic_dma_hwdesc_ext {
> +	struct ingenic_dma_hwdesc base;
> +	u32 offsize;
> +	u32 pagewidth;
> +	u32 cpos;
> +	u32 dessize;
> +} __packed;
> +
>  struct jz_soc_info {
>  	bool needs_dev_clk;
>  	bool has_osd;
>  	bool map_noncoherent;
> +	bool has_alpha;
> +	bool has_pcfg;
> +	bool has_recover;
> +	bool has_rgbc;
> +	unsigned int hwdesc_size;
>  	unsigned int max_width, max_height;
>  	const u32 *formats_f0, *formats_f1;
>  	unsigned int num_formats_f0, num_formats_f1;
> +	unsigned int max_reg;
>  };
>=20
>  struct ingenic_drm {
> @@ -118,12 +132,11 @@ static bool ingenic_drm_writeable_reg(struct=20
> device *dev, unsigned int reg)
>  	}
>  }
>=20
> -static const struct regmap_config ingenic_drm_regmap_config =3D {
> +static struct regmap_config ingenic_drm_regmap_config =3D {
>  	.reg_bits =3D 32,
>  	.val_bits =3D 32,
>  	.reg_stride =3D 4,
>=20
> -	.max_register =3D JZ_REG_LCD_SIZE1,
>  	.writeable_reg =3D ingenic_drm_writeable_reg,
>  };
>=20
> @@ -582,7 +595,39 @@ static void=20
> ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>  			hwdesc =3D &priv->dma_hwdescs->hwdesc_f1;
>=20
>  		hwdesc->addr =3D addr;
> -		hwdesc->cmd =3D JZ_LCD_CMD_EOF_IRQ | (width * height * cpp / 4);
> +		hwdesc->cmd =3D JZ_LCD_CMD_FRM_ENABLE | JZ_LCD_CMD_EOF_IRQ |
> +			      (width * height * cpp / 4);
> +
> +		if (priv->soc_info->hwdesc_size =3D=3D sizeof(struct=20
> ingenic_dma_hwdesc_ext)) {

I'd prefer a boolean flag, e.g. "soc_info->use_extended_hwdesc"

> +			struct ingenic_dma_hwdesc_ext *hwdesc_ext;
> +
> +			/* Extended 8-byte descriptor */
> +			hwdesc_ext =3D (struct ingenic_dma_hwdesc_ext *) hwdesc;
> +			hwdesc_ext->cpos =3D 0;
> +			hwdesc_ext->offsize =3D 0;
> +			hwdesc_ext->pagewidth =3D 0;
> +
> +			switch (newstate->fb->format->format) {
> +			case DRM_FORMAT_XRGB1555:
> +				hwdesc_ext->cpos |=3D JZ_LCD_CPOS_RGB555;
> +				fallthrough;
> +			case DRM_FORMAT_RGB565:
> +				hwdesc_ext->cpos |=3D JZ_LCD_CPOS_BPP_15_16;
> +				break;
> +			case DRM_FORMAT_XRGB8888:
> +				hwdesc_ext->cpos |=3D JZ_LCD_CPOS_BPP_18_24;
> +				break;
> +			}
> +			hwdesc_ext->cpos |=3D JZ_LCD_CPOS_PREMULTIPLY_LCD |
> +					    (3 << JZ_LCD_CPOS_COEFFICIENT_OFFSET);

Where's that magic value '3' coming from?

> +
> +			hwdesc_ext->dessize =3D
> +				(0xff << JZ_LCD_DESSIZE_ALPHA_OFFSET) |
> +				(((height - 1) & JZ_LCD_DESSIZE_HEIGHT_MASK) <<
> +						 JZ_LCD_DESSIZE_HEIGHT_OFFSET) |
> +				(((width - 1) & JZ_LCD_DESSIZE_WIDTH_MASK) <<
> +						JZ_LCD_DESSIZE_WIDTH_OFFSET);

Use FIELD_PREP() from <linux/bitfield.h>.

> +		}
>=20
>  		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>  			fourcc =3D newstate->fb->format->format;
> @@ -612,8 +657,12 @@ static void=20
> ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>  	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
>  	struct drm_connector *conn =3D conn_state->connector;
>  	struct drm_display_info *info =3D &conn->display_info;
> +	u32 bus_format =3D MEDIA_BUS_FMT_RGB888_1X24;
>  	unsigned int cfg, rgbcfg =3D 0;
>=20
> +	if (info->num_bus_formats)
> +		bus_format =3D info->bus_formats[0];
> +

That code is going to change really soon, as I have my own PR ready to=20
convert the ingenic-drm driver to use a top-level bridge for bus format=20
/ flags negociation.

The HDMI driver should therefore implement it as well; see for instance=20
drivers/gpu/drm/bridge/ite-it66121.c for an example of how the bus=20
format is negociated.

I'll be sure to Cc you as soon as I send it upstream - should be just=20
in a couple of days.

>  	priv->panel_is_sharp =3D info->bus_flags & DRM_BUS_FLAG_SHARP_SIGNALS;
>=20
>  	if (priv->panel_is_sharp) {
> @@ -623,6 +672,13 @@ static void=20
> ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>  		    | JZ_LCD_CFG_SPL_DISABLE | JZ_LCD_CFG_REV_DISABLE;
>  	}
>=20
> +	if (priv->soc_info->has_recover)
> +		cfg |=3D JZ_LCD_CFG_RECOVER_FIFO_UNDERRUN;

Seems out of place. Does it not work without?

> +
> +	/* CI20: set use of the 8-word descriptor and OSD foreground usage.=20
> */

Not really CI20-specific though.

> +	if (priv->soc_info->hwdesc_size =3D=3D sizeof(struct=20
> ingenic_dma_hwdesc_ext))
> +		cfg |=3D JZ_LCD_CFG_DESCRIPTOR_8;
> +
>  	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>  		cfg |=3D JZ_LCD_CFG_HSYNC_ACTIVE_LOW;
>  	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> @@ -639,7 +695,7 @@ static void=20
> ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>  			else
>  				cfg |=3D JZ_LCD_CFG_MODE_TV_OUT_P;
>  		} else {
> -			switch (*info->bus_formats) {
> +			switch (bus_format) {
>  			case MEDIA_BUS_FMT_RGB565_1X16:
>  				cfg |=3D JZ_LCD_CFG_MODE_GENERIC_16BIT;
>  				break;
> @@ -665,19 +721,23 @@ static void=20
> ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>  	regmap_write(priv->map, JZ_REG_LCD_RGBC, rgbcfg);
>  }
>=20
> -static int ingenic_drm_encoder_atomic_check(struct drm_encoder=20
> *encoder,
> -					    struct drm_crtc_state *crtc_state,
> -					    struct drm_connector_state *conn_state)
> +static int
> +ingenic_drm_encoder_atomic_check(struct drm_encoder *encoder,
> +				 struct drm_crtc_state *crtc_state,
> +				 struct drm_connector_state *conn_state)
>  {
>  	struct drm_display_info *info =3D=20
> &conn_state->connector->display_info;
>  	struct drm_display_mode *mode =3D &crtc_state->adjusted_mode;
>=20
> +	switch (conn_state->connector->connector_type) {
> +	case DRM_MODE_CONNECTOR_TV:
> +	case DRM_MODE_CONNECTOR_HDMIA:
> +		return 0;
> +	}

This switch should move after the check on "num_bus_formats".
(I understand why you did it, but with proper bus format negociation=20
this won't be needed).

> +
>  	if (info->num_bus_formats !=3D 1)
>  		return -EINVAL;
>=20
> -	if (conn_state->connector->connector_type =3D=3D DRM_MODE_CONNECTOR_TV)
> -		return 0;
> -
>  	switch (*info->bus_formats) {
>  	case MEDIA_BUS_FMT_RGB888_3X8:
>  	case MEDIA_BUS_FMT_RGB888_3X8_DELTA:
> @@ -924,7 +984,7 @@ static int ingenic_drm_bind(struct device *dev,=20
> bool has_components)
>  	drm->mode_config.min_width =3D 0;
>  	drm->mode_config.min_height =3D 0;
>  	drm->mode_config.max_width =3D soc_info->max_width;
> -	drm->mode_config.max_height =3D 4095;
> +	drm->mode_config.max_height =3D soc_info->max_height;

The drm->mode_config.max_height is different from soc_info->max_height;=20
the former is the maximum framebuffer size, the latter is the maximum=20
size that the SoC can display. The framebuffer can be bigger than what=20
the SoC can display.

>  	drm->mode_config.funcs =3D &ingenic_drm_mode_config_funcs;
>  	drm->mode_config.helper_private =3D &ingenic_drm_mode_config_helpers;
>=20
> @@ -934,6 +994,7 @@ static int ingenic_drm_bind(struct device *dev,=20
> bool has_components)
>  		return PTR_ERR(base);
>  	}
>=20
> +	ingenic_drm_regmap_config.max_register =3D soc_info->max_reg;

Avoid modifying a global variable; instead copy it to a local copy of=20
ingenic_drm_regmap_config, and use this one in the regmap_init_mmio=20
below.

>  	priv->map =3D devm_regmap_init_mmio(dev, base,
>  					  &ingenic_drm_regmap_config);
>  	if (IS_ERR(priv->map)) {
> @@ -966,7 +1027,6 @@ static int ingenic_drm_bind(struct device *dev,=20
> bool has_components)
>  	if (!priv->dma_hwdescs)
>  		return -ENOMEM;
>=20
> -

Cosmetic change - not needed.

>  	/* Configure DMA hwdesc for foreground0 plane */
>  	dma_hwdesc_phys_f0 =3D priv->dma_hwdescs_phys
>  		+ offsetof(struct ingenic_dma_hwdescs, hwdesc_f0);
> @@ -1147,7 +1207,26 @@ static int ingenic_drm_bind(struct device=20
> *dev, bool has_components)
>=20
>  	/* Enable OSD if available */
>  	if (soc_info->has_osd)
> -		regmap_write(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
> +		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
> +
> +	if (soc_info->has_alpha)
> +		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_ALPHAEN);

Do you need alpha blending support between planes, in this patch=20
related to HDMI?

> +
> +	/* Magic values from the vendor kernel for the priority thresholds.=20
> */
> +	if (soc_info->has_pcfg)
> +		regmap_write(priv->map, JZ_REG_LCD_PCFG,
> +			     JZ_LCD_PCFG_PRI_MODE |
> +			     JZ_LCD_PCFG_HP_BST_16 |
> +			     (511 << JZ_LCD_PCFG_THRESHOLD2_OFFSET) |
> +			     (400 << JZ_LCD_PCFG_THRESHOLD1_OFFSET) |
> +			     (256 << JZ_LCD_PCFG_THRESHOLD0_OFFSET));

And why is that needed in this patch? Doesn't HDMI work without it?

> +
> +	/* RGB output control may be superfluous. */
> +	if (soc_info->has_rgbc)
> +		regmap_write(priv->map, JZ_REG_LCD_RGBC,
> +			     JZ_LCD_RGBC_RGB_FORMAT_ENABLE |
> +			     JZ_LCD_RGBC_ODD_LINE_RGB |
> +			     JZ_LCD_RGBC_EVEN_LINE_RGB);

The last two macros set the subpixel ordering on the bus for serial=20
(3x8) 24-bit panels - completely unrelated to HDMI.

>=20
>  	mutex_init(&priv->clk_mutex);
>  	priv->clock_nb.notifier_call =3D ingenic_drm_update_pixclk;
> @@ -1296,41 +1375,75 @@ static const struct jz_soc_info=20
> jz4740_soc_info =3D {
>  	.needs_dev_clk =3D true,
>  	.has_osd =3D false,
>  	.map_noncoherent =3D false,
> +	.has_pcfg =3D false,
> +	.has_recover =3D false,
> +	.has_rgbc =3D false,
> +	.hwdesc_size =3D sizeof(struct ingenic_dma_hwdesc),
>  	.max_width =3D 800,
>  	.max_height =3D 600,
>  	.formats_f1 =3D jz4740_formats,
>  	.num_formats_f1 =3D ARRAY_SIZE(jz4740_formats),
>  	/* JZ4740 has only one plane */
> +	.max_reg =3D JZ_REG_LCD_SIZE1,
>  };
>=20
>  static const struct jz_soc_info jz4725b_soc_info =3D {
>  	.needs_dev_clk =3D false,
>  	.has_osd =3D true,
>  	.map_noncoherent =3D false,
> +	.has_pcfg =3D false,
> +	.has_recover =3D false,
> +	.has_rgbc =3D false,
> +	.hwdesc_size =3D sizeof(struct ingenic_dma_hwdesc),
>  	.max_width =3D 800,
>  	.max_height =3D 600,
>  	.formats_f1 =3D jz4725b_formats_f1,
>  	.num_formats_f1 =3D ARRAY_SIZE(jz4725b_formats_f1),
>  	.formats_f0 =3D jz4725b_formats_f0,
>  	.num_formats_f0 =3D ARRAY_SIZE(jz4725b_formats_f0),
> +	.max_reg =3D JZ_REG_LCD_SIZE1,
>  };
>=20
>  static const struct jz_soc_info jz4770_soc_info =3D {
>  	.needs_dev_clk =3D false,
>  	.has_osd =3D true,
>  	.map_noncoherent =3D true,
> +	.has_pcfg =3D false,
> +	.has_recover =3D false,
> +	.has_rgbc =3D false,
> +	.hwdesc_size =3D sizeof(struct ingenic_dma_hwdesc),
>  	.max_width =3D 1280,
>  	.max_height =3D 720,
>  	.formats_f1 =3D jz4770_formats_f1,
>  	.num_formats_f1 =3D ARRAY_SIZE(jz4770_formats_f1),
>  	.formats_f0 =3D jz4770_formats_f0,
>  	.num_formats_f0 =3D ARRAY_SIZE(jz4770_formats_f0),
> +	.max_reg =3D JZ_REG_LCD_SIZE1,
> +};
> +
> +static const struct jz_soc_info jz4780_soc_info =3D {
> +	.needs_dev_clk =3D true,
> +	.has_osd =3D true,
> +	.has_alpha =3D true,
> +	.has_pcfg =3D true,
> +	.has_recover =3D true,
> +	.has_rgbc =3D true,
> +	.hwdesc_size =3D sizeof(struct ingenic_dma_hwdesc_ext),
> +	.max_width =3D 4096,
> +	.max_height =3D 4096,

The PM says that the display is up to 4096x2048-30Hz; so this is wrong.

> +	/* REVISIT: do we support formats different from jz4770? */
> +	.formats_f1 =3D jz4770_formats_f1,
> +	.num_formats_f1 =3D ARRAY_SIZE(jz4770_formats_f1),
> +	.formats_f0 =3D jz4770_formats_f0,
> +	.num_formats_f0 =3D ARRAY_SIZE(jz4770_formats_f0),
> +	.max_reg =3D JZ_REG_LCD_PCFG,
>  };
>=20
>  static const struct of_device_id ingenic_drm_of_match[] =3D {
>  	{ .compatible =3D "ingenic,jz4740-lcd", .data =3D &jz4740_soc_info },
>  	{ .compatible =3D "ingenic,jz4725b-lcd", .data =3D &jz4725b_soc_info },
>  	{ .compatible =3D "ingenic,jz4770-lcd", .data =3D &jz4770_soc_info },
> +	{ .compatible =3D "ingenic,jz4780-lcd", .data =3D &jz4780_soc_info },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, ingenic_drm_of_match);
> @@ -1349,13 +1462,31 @@ static int ingenic_drm_init(void)
>  {
>  	int err;
>=20
> +	if (IS_ENABLED(CONFIG_DRM_INGENIC_DW_HDMI)) {
> +		err =3D platform_driver_register(ingenic_dw_hdmi_driver_ptr);
> +		if (err)
> +			return err;
> +	}
> +
>  	if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU)) {
>  		err =3D platform_driver_register(ingenic_ipu_driver_ptr);
>  		if (err)
> -			return err;
> +			goto err_hdmi_unreg;
>  	}
>=20
> -	return platform_driver_register(&ingenic_drm_driver);
> +	err =3D platform_driver_register(&ingenic_drm_driver);
> +	if (err)
> +		goto err_ipu_unreg;

That's actually a change of behaviour - before it would return on error=20
without calling platform_driver_unregister on the IPU.

It is not necesarily bad, but it belongs in a separate commit.

> +
> +	return 0;
> +
> +err_ipu_unreg:
> +	if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
> +		platform_driver_unregister(ingenic_ipu_driver_ptr);
> +err_hdmi_unreg:
> +	if (IS_ENABLED(CONFIG_DRM_INGENIC_DW_HDMI))
> +		platform_driver_unregister(ingenic_dw_hdmi_driver_ptr);
> +	return err;
>  }
>  module_init(ingenic_drm_init);
>=20
> @@ -1363,6 +1494,8 @@ static void ingenic_drm_exit(void)
>  {
>  	platform_driver_unregister(&ingenic_drm_driver);
>=20
> +	if (IS_ENABLED(CONFIG_DRM_INGENIC_DW_HDMI))
> +		platform_driver_unregister(ingenic_dw_hdmi_driver_ptr);
>  	if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
>  		platform_driver_unregister(ingenic_ipu_driver_ptr);
>  }
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.h=20
> b/drivers/gpu/drm/ingenic/ingenic-drm.h
> index 22654ac1dde1c..7e55a88243e28 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm.h
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm.h
> @@ -44,8 +44,11 @@
>  #define JZ_REG_LCD_XYP1				0x124
>  #define JZ_REG_LCD_SIZE0			0x128
>  #define JZ_REG_LCD_SIZE1			0x12c
> +#define JZ_REG_LCD_PCFG				0x2c0
>=20
>  #define JZ_LCD_CFG_SLCD				BIT(31)
> +#define JZ_LCD_CFG_DESCRIPTOR_8			BIT(28)
> +#define JZ_LCD_CFG_RECOVER_FIFO_UNDERRUN	BIT(25)
>  #define JZ_LCD_CFG_PS_DISABLE			BIT(23)
>  #define JZ_LCD_CFG_CLS_DISABLE			BIT(22)
>  #define JZ_LCD_CFG_SPL_DISABLE			BIT(21)
> @@ -63,6 +66,7 @@
>  #define JZ_LCD_CFG_DE_ACTIVE_LOW		BIT(9)
>  #define JZ_LCD_CFG_VSYNC_ACTIVE_LOW		BIT(8)
>  #define JZ_LCD_CFG_18_BIT			BIT(7)
> +#define JZ_LCD_CFG_24_BIT			BIT(6)
>  #define JZ_LCD_CFG_PDW				(BIT(5) | BIT(4))
>=20
>  #define JZ_LCD_CFG_MODE_GENERIC_16BIT		0
> @@ -132,6 +136,7 @@
>  #define JZ_LCD_CMD_SOF_IRQ			BIT(31)
>  #define JZ_LCD_CMD_EOF_IRQ			BIT(30)
>  #define JZ_LCD_CMD_ENABLE_PAL			BIT(28)
> +#define JZ_LCD_CMD_FRM_ENABLE			BIT(26)
>=20
>  #define JZ_LCD_SYNC_MASK			0x3ff
>=20
> @@ -153,6 +158,7 @@
>  #define JZ_LCD_RGBC_EVEN_BGR			(0x5 << 0)
>=20
>  #define JZ_LCD_OSDC_OSDEN			BIT(0)
> +#define JZ_LCD_OSDC_ALPHAEN			BIT(2)
>  #define JZ_LCD_OSDC_F0EN			BIT(3)
>  #define JZ_LCD_OSDC_F1EN			BIT(4)
>=20
> @@ -176,6 +182,51 @@
>  #define JZ_LCD_SIZE01_WIDTH_LSB			0
>  #define JZ_LCD_SIZE01_HEIGHT_LSB		16
>=20
> +#define JZ_LCD_DESSIZE_ALPHA_OFFSET		24
> +#define JZ_LCD_DESSIZE_HEIGHT_OFFSET		12
> +#define JZ_LCD_DESSIZE_WIDTH_OFFSET		0
> +#define JZ_LCD_DESSIZE_HEIGHT_MASK		0xfff
> +#define JZ_LCD_DESSIZE_WIDTH_MASK		0xfff
> +
> +/* TODO: 4,5 and 7 match the above BPP */
> +#define JZ_LCD_CPOS_BPP_15_16			(4 << 27)
> +#define JZ_LCD_CPOS_BPP_18_24			(5 << 27)
> +#define JZ_LCD_CPOS_BPP_30			(7 << 27)
> +#define JZ_LCD_CPOS_RGB555			BIT(30)
> +#define JZ_LCD_CPOS_PREMULTIPLY_LCD		BIT(26)
> +#define JZ_LCD_CPOS_COEFFICIENT_OFFSET		24
> +
> +#define JZ_LCD_RGBC_RGB_PADDING			BIT(15)
> +#define JZ_LCD_RGBC_RGB_PADDING_FIRST		BIT(14)
> +#define JZ_LCD_RGBC_422				BIT(8)
> +#define JZ_LCD_RGBC_RGB_FORMAT_ENABLE		BIT(7)
> +#define JZ_LCD_RGBC_ODD_LINE_MASK		(0x7 << 4)
> +#define JZ_LCD_RGBC_ODD_LINE_RGB		(0 << 4)
> +#define JZ_LCD_RGBC_ODD_LINE_RBG		(1 << 4)
> +#define JZ_LCD_RGBC_ODD_LINE_GRB		(2 << 4)
> +#define JZ_LCD_RGBC_ODD_LINE_GBR		(3 << 4)
> +#define JZ_LCD_RGBC_ODD_LINE_BRG		(4 << 4)
> +#define JZ_LCD_RGBC_ODD_LINE_BGR		(5 << 4)
> +#define JZ_LCD_RGBC_EVEN_LINE_MASK		(0x7 << 0)
> +#define JZ_LCD_RGBC_EVEN_LINE_RGB		0
> +#define JZ_LCD_RGBC_EVEN_LINE_RBG		1
> +#define JZ_LCD_RGBC_EVEN_LINE_GRB		2
> +#define JZ_LCD_RGBC_EVEN_LINE_GBR		3
> +#define JZ_LCD_RGBC_EVEN_LINE_BRG		4
> +#define JZ_LCD_RGBC_EVEN_LINE_BGR		5

We already have these in ingenic-drm.h...

Please only add the macros that you need and are missing.

Cheers,
-Paul

> +
> +#define JZ_LCD_PCFG_PRI_MODE			BIT(31)
> +#define JZ_LCD_PCFG_HP_BST_4			(0 << 28)
> +#define JZ_LCD_PCFG_HP_BST_8			(1 << 28)
> +#define JZ_LCD_PCFG_HP_BST_16			(2 << 28)
> +#define JZ_LCD_PCFG_HP_BST_32			(3 << 28)
> +#define JZ_LCD_PCFG_HP_BST_64			(4 << 28)
> +#define JZ_LCD_PCFG_HP_BST_16_CONT		(5 << 28)
> +#define JZ_LCD_PCFG_HP_BST_DISABLE		(7 << 28)
> +#define JZ_LCD_PCFG_THRESHOLD2_OFFSET		18
> +#define JZ_LCD_PCFG_THRESHOLD1_OFFSET		9
> +#define JZ_LCD_PCFG_THRESHOLD0_OFFSET		0
> +
>  struct device;
>  struct drm_plane;
>  struct drm_plane_state;
> @@ -187,5 +238,6 @@ void ingenic_drm_plane_disable(struct device=20
> *dev, struct drm_plane *plane);
>  bool ingenic_drm_map_noncoherent(const struct device *dev);
>=20
>  extern struct platform_driver *ingenic_ipu_driver_ptr;
> +extern struct platform_driver *ingenic_dw_hdmi_driver_ptr;
>=20
>  #endif /* DRIVERS_GPU_DRM_INGENIC_INGENIC_DRM_H */
> --
> 2.31.1
>=20


