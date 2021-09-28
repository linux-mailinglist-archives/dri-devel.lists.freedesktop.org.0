Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A98B741AC02
	for <lists+dri-devel@lfdr.de>; Tue, 28 Sep 2021 11:35:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA5886E512;
	Tue, 28 Sep 2021 09:35:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA166E512
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Sep 2021 09:35:28 +0000 (UTC)
Date: Tue, 28 Sep 2021 10:35:12 +0100
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v4 02/10] drm/ingenic: Add support for JZ4780 and HDMI
 output
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
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Paul Boddie <paul@boddie.org.uk>, devicetree@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 letux-kernel@openphoenux.org, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org
Message-Id: <OA150R.JLKJBJP8V7FJ2@crapouillou.net>
In-Reply-To: <68cca888be1894ce45f1a93cfabeb5aa1f88c20a.1632761067.git.hns@goldelico.com>
References: <cover.1632761067.git.hns@goldelico.com>
 <68cca888be1894ce45f1a93cfabeb5aa1f88c20a.1632761067.git.hns@goldelico.com>
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

Hi Nikolaus / Paul,

Le lun., sept. 27 2021 at 18:44:20 +0200, H. Nikolaus Schaller=20
<hns@goldelico.com> a =E9crit :
> From: Paul Boddie <paul@boddie.org.uk>
>=20
> Add support for the LCD controller present on JZ4780 SoCs.
> This SoC uses 8-byte descriptors which extend the current
> 4-byte descriptors used for other Ingenic SoCs.
>=20
> Tested on MIPS Creator CI20 board.
>=20
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 85=20
> +++++++++++++++++++++--
>  drivers/gpu/drm/ingenic/ingenic-drm.h     | 42 +++++++++++
>  2 files changed, 122 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index f73522bdacaa..e2df4b085905 100644
> --- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> +++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> @@ -6,6 +6,7 @@
>=20
>  #include "ingenic-drm.h"
>=20
> +#include <linux/bitfield.h>
>  #include <linux/component.h>
>  #include <linux/clk.h>
>  #include <linux/dma-mapping.h>
> @@ -49,6 +50,11 @@ struct ingenic_dma_hwdesc {
>  	u32 addr;
>  	u32 id;
>  	u32 cmd;
> +	/* extended hw descriptor for jz4780 */
> +	u32 offsize;
> +	u32 pagewidth;
> +	u32 cpos;
> +	u32 dessize;
>  } __aligned(16);
>=20
>  struct ingenic_dma_hwdescs {
> @@ -60,9 +66,11 @@ struct jz_soc_info {
>  	bool needs_dev_clk;
>  	bool has_osd;
>  	bool map_noncoherent;
> +	bool use_extended_hwdesc;
>  	unsigned int max_width, max_height;
>  	const u32 *formats_f0, *formats_f1;
>  	unsigned int num_formats_f0, num_formats_f1;
> +	unsigned int max_reg;
>  };
>=20
>  struct ingenic_drm_private_state {
> @@ -168,12 +176,11 @@ static bool ingenic_drm_writeable_reg(struct=20
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
> @@ -663,6 +670,37 @@ static void=20
> ingenic_drm_plane_atomic_update(struct drm_plane *plane,
>  		hwdesc->cmd =3D JZ_LCD_CMD_EOF_IRQ | (width * height * cpp / 4);
>  		hwdesc->next =3D dma_hwdesc_addr(priv, next_id);
>=20
> +		if (priv->soc_info->use_extended_hwdesc) {
> +			hwdesc->cmd |=3D JZ_LCD_CMD_FRM_ENABLE;
> +
> +			/* Extended 8-byte descriptor */
> +			hwdesc->cpos =3D 0;
> +			hwdesc->offsize =3D 0;
> +			hwdesc->pagewidth =3D 0;
> +
> +			switch (newstate->fb->format->format) {
> +			case DRM_FORMAT_XRGB1555:
> +				hwdesc->cpos |=3D JZ_LCD_CPOS_RGB555;
> +				fallthrough;
> +			case DRM_FORMAT_RGB565:
> +				hwdesc->cpos |=3D JZ_LCD_CPOS_BPP_15_16;
> +				break;
> +			case DRM_FORMAT_XRGB8888:
> +				hwdesc->cpos |=3D JZ_LCD_CPOS_BPP_18_24;
> +				break;
> +			}
> +			hwdesc->cpos |=3D JZ_LCD_CPOS_PREMULTIPLY_LCD |
> +					    (JZ_LCD_CPOS_COEFFICIENT_1_ALPHA1 <<
> +					     JZ_LCD_CPOS_COEFFICIENT_OFFSET);
> +
> +			hwdesc->dessize =3D
> +				(0xff << JZ_LCD_DESSIZE_ALPHA_OFFSET) |
> +				FIELD_PREP(JZ_LCD_DESSIZE_HEIGHT_MASK <<
> +					   JZ_LCD_DESSIZE_HEIGHT_OFFSET, height - 1) |
> +				FIELD_PREP(JZ_LCD_DESSIZE_WIDTH_MASK <<
> +					   JZ_LCD_DESSIZE_WIDTH_OFFSET, width - 1);
> +		}
> +
>  		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>  			fourcc =3D newstate->fb->format->format;
>=20
> @@ -694,6 +732,10 @@ static void=20
> ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>  		    | JZ_LCD_CFG_SPL_DISABLE | JZ_LCD_CFG_REV_DISABLE;
>  	}
>=20
> +	/* set use of the 8-word descriptor and OSD foreground usage. */
> +	if (priv->soc_info->use_extended_hwdesc)
> +		cfg |=3D JZ_LCD_CFG_DESCRIPTOR_8;
> +
>  	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>  		cfg |=3D JZ_LCD_CFG_HSYNC_ACTIVE_LOW;
>  	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> @@ -1010,6 +1052,7 @@ static int ingenic_drm_bind(struct device *dev,=20
> bool has_components)
>  	struct drm_encoder *encoder;
>  	struct ingenic_drm_bridge *ib;
>  	struct drm_device *drm;
> +	struct regmap_config regmap_config;
>  	void __iomem *base;
>  	long parent_rate;
>  	unsigned int i, clone_mask =3D 0;
> @@ -1063,8 +1106,10 @@ static int ingenic_drm_bind(struct device=20
> *dev, bool has_components)
>  		return PTR_ERR(base);
>  	}
>=20
> +	regmap_config =3D ingenic_drm_regmap_config;
> +	regmap_config.max_register =3D soc_info->max_reg;
>  	priv->map =3D devm_regmap_init_mmio(dev, base,
> -					  &ingenic_drm_regmap_config);
> +					  &regmap_config);

Could you split the code that makes .max_reg configurable per-SoC into=20
its own patch?

>  	if (IS_ERR(priv->map)) {
>  		dev_err(dev, "Failed to create regmap\n");
>  		return PTR_ERR(priv->map);
> @@ -1274,7 +1319,7 @@ static int ingenic_drm_bind(struct device *dev,=20
> bool has_components)
>=20
>  	/* Enable OSD if available */
>  	if (soc_info->has_osd)
> -		regmap_write(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);
> +		regmap_set_bits(priv->map, JZ_REG_LCD_OSDC, JZ_LCD_OSDC_OSDEN);

Why?

>=20
>  	mutex_init(&priv->clk_mutex);
>  	priv->clock_nb.notifier_call =3D ingenic_drm_update_pixclk;
> @@ -1444,6 +1489,7 @@ static const struct jz_soc_info jz4740_soc_info=20
> =3D {
>  	.formats_f1 =3D jz4740_formats,
>  	.num_formats_f1 =3D ARRAY_SIZE(jz4740_formats),
>  	/* JZ4740 has only one plane */
> +	.max_reg =3D JZ_REG_LCD_SIZE1,
>  };
>=20
>  static const struct jz_soc_info jz4725b_soc_info =3D {
> @@ -1456,6 +1502,7 @@ static const struct jz_soc_info=20
> jz4725b_soc_info =3D {
>  	.num_formats_f1 =3D ARRAY_SIZE(jz4725b_formats_f1),
>  	.formats_f0 =3D jz4725b_formats_f0,
>  	.num_formats_f0 =3D ARRAY_SIZE(jz4725b_formats_f0),
> +	.max_reg =3D JZ_REG_LCD_SIZE1,
>  };
>=20
>  static const struct jz_soc_info jz4770_soc_info =3D {
> @@ -1468,12 +1515,28 @@ static const struct jz_soc_info=20
> jz4770_soc_info =3D {
>  	.num_formats_f1 =3D ARRAY_SIZE(jz4770_formats_f1),
>  	.formats_f0 =3D jz4770_formats_f0,
>  	.num_formats_f0 =3D ARRAY_SIZE(jz4770_formats_f0),
> +	.max_reg =3D JZ_REG_LCD_SIZE1,
> +};
> +
> +static const struct jz_soc_info jz4780_soc_info =3D {
> +	.needs_dev_clk =3D true,
> +	.has_osd =3D true,
> +	.use_extended_hwdesc =3D true,
> +	.max_width =3D 4096,
> +	.max_height =3D 2048,
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
> @@ -1492,10 +1555,16 @@ static int ingenic_drm_init(void)
>  {
>  	int err;
>=20
> +	if (IS_ENABLED(CONFIG_DRM_INGENIC_DW_HDMI)) {
> +		err =3D platform_driver_register(ingenic_dw_hdmi_driver_ptr);
> +		if (err)
> +			return err;
> +	}

I don't see why you need to register the ingenic-dw-hdmi driver here.=20
Just register it in the ingenic-dw-hdmi driver.

Cheers,
-Paul

> +
>  	if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU)) {
>  		err =3D platform_driver_register(ingenic_ipu_driver_ptr);
>  		if (err)
> -			return err;
> +			goto err_hdmi_unreg;
>  	}
>=20
>  	err =3D platform_driver_register(&ingenic_drm_driver);
> @@ -1507,6 +1576,10 @@ static int ingenic_drm_init(void)
>  err_ipu_unreg:
>  	if (IS_ENABLED(CONFIG_DRM_INGENIC_IPU))
>  		platform_driver_unregister(ingenic_ipu_driver_ptr);
> +err_hdmi_unreg:
> +	if (IS_ENABLED(CONFIG_DRM_INGENIC_DW_HDMI))
> +		platform_driver_unregister(ingenic_dw_hdmi_driver_ptr);
> +
>  	return err;
>  }
>  module_init(ingenic_drm_init);
> @@ -1515,6 +1588,8 @@ static void ingenic_drm_exit(void)
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
> index 22654ac1dde1..13dbc5d25c3b 100644
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
> @@ -176,6 +182,41 @@
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
> +#define JZ_LCD_CPOS_COEFFICIENT_0		0
> +#define JZ_LCD_CPOS_COEFFICIENT_1		1
> +#define JZ_LCD_CPOS_COEFFICIENT_ALPHA1		2
> +#define JZ_LCD_CPOS_COEFFICIENT_1_ALPHA1	3
> +
> +#define JZ_LCD_RGBC_RGB_PADDING			BIT(15)
> +#define JZ_LCD_RGBC_RGB_PADDING_FIRST		BIT(14)
> +#define JZ_LCD_RGBC_422				BIT(8)
> +#define JZ_LCD_RGBC_RGB_FORMAT_ENABLE		BIT(7)
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
> @@ -187,5 +228,6 @@ void ingenic_drm_plane_disable(struct device=20
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


