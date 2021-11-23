Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F23D45AAD6
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 19:06:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F44B6E3EC;
	Tue, 23 Nov 2021 18:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4006E3EC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 18:06:48 +0000 (UTC)
Date: Tue, 23 Nov 2021 18:06:30 +0000
From: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v7 2/8] drm/ingenic: Add support for JZ4780 and HDMI output
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Message-Id: <UAE13R.KF1V28VAUAXS3@crapouillou.net>
In-Reply-To: <af92a37f6c652aedac1782efcf442ad56e38f3ab.1637689583.git.hns@goldelico.com>
References: <cover.1637689583.git.hns@goldelico.com>
 <af92a37f6c652aedac1782efcf442ad56e38f3ab.1637689583.git.hns@goldelico.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Boddie <paul@boddie.org.uk>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, devicetree@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Jonas Karlman <jonas@kwiboo.se>,
 Mark Brown <broonie@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
 letux-kernel@openphoenux.org, Ezequiel Garcia <ezequiel@collabora.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Liam Girdwood <lgirdwood@gmail.com>, Robert Foss <robert.foss@linaro.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nikolaus,

Le mar., nov. 23 2021 at 18:46:17 +0100, H. Nikolaus Schaller=20
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
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 55=20
> ++++++++++++++++++++++-
>  drivers/gpu/drm/ingenic/ingenic-drm.h     | 38 ++++++++++++++++
>  2 files changed, 92 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c=20
> b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
> index 0bb590c3910d9..5ff97a4bbcfe5 100644
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
> @@ -60,6 +66,7 @@ struct jz_soc_info {
>  	bool needs_dev_clk;
>  	bool has_osd;
>  	bool map_noncoherent;
> +	bool use_extended_hwdesc;
>  	unsigned int max_width, max_height;
>  	const u32 *formats_f0, *formats_f1;
>  	unsigned int num_formats_f0, num_formats_f1;
> @@ -446,6 +453,9 @@ static int ingenic_drm_plane_atomic_check(struct=20
> drm_plane *plane,
>  	if (!crtc)
>  		return 0;
>=20
> +	if (plane =3D=3D &priv->f0)
> +		return -EINVAL;
> +
>  	crtc_state =3D drm_atomic_get_existing_crtc_state(state,
>  							crtc);
>  	if (WARN_ON(!crtc_state))
> @@ -662,6 +672,33 @@ static void=20
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
> +			hwdesc->cpos |=3D (JZ_LCD_CPOS_COEFFICIENT_1 <<
> +					 JZ_LCD_CPOS_COEFFICIENT_OFFSET);
> +			hwdesc->dessize =3D
> +				(0xff << JZ_LCD_DESSIZE_ALPHA_OFFSET) |
> +				FIELD_PREP(JZ_LCD_DESSIZE_HEIGHT_MASK, height - 1) |
> +				FIELD_PREP(JZ_LCD_DESSIZE_WIDTH_MASK, width - 1);
> +		}
> +
>  		if (drm_atomic_crtc_needs_modeset(crtc_state)) {
>  			fourcc =3D newstate->fb->format->format;
>=20
> @@ -693,6 +730,9 @@ static void=20
> ingenic_drm_encoder_atomic_mode_set(struct drm_encoder *encoder,
>  		    | JZ_LCD_CFG_SPL_DISABLE | JZ_LCD_CFG_REV_DISABLE;
>  	}
>=20
> +	if (priv->soc_info->use_extended_hwdesc)
> +		cfg |=3D JZ_LCD_CFG_DESCRIPTOR_8;
> +
>  	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>  		cfg |=3D JZ_LCD_CFG_HSYNC_ACTIVE_LOW;
>  	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> @@ -1064,7 +1104,7 @@ static int ingenic_drm_bind(struct device *dev,=20
> bool has_components)
>  	}
>=20
>  	regmap_config =3D ingenic_drm_regmap_config;
> -	regmap_config.max_register =3D res->end - res->start;
> +	regmap_config.max_register =3D res->end - res->start - 4;

I think this is wrong :)

Cheers,
-Paul

>  	priv->map =3D devm_regmap_init_mmio(dev, base,
>  					  &regmap_config);
>  	if (IS_ERR(priv->map)) {
> @@ -1468,10 +1508,23 @@ static const struct jz_soc_info=20
> jz4770_soc_info =3D {
>  	.num_formats_f0 =3D ARRAY_SIZE(jz4770_formats_f0),
>  };
>=20
> +static const struct jz_soc_info jz4780_soc_info =3D {
> +	.needs_dev_clk =3D true,
> +	.has_osd =3D true,
> +	.use_extended_hwdesc =3D true,
> +	.max_width =3D 4096,
> +	.max_height =3D 2048,
> +	.formats_f1 =3D jz4770_formats_f1,
> +	.num_formats_f1 =3D ARRAY_SIZE(jz4770_formats_f1),
> +	.formats_f0 =3D jz4770_formats_f0,
> +	.num_formats_f0 =3D ARRAY_SIZE(jz4770_formats_f0),
> +};
> +
>  static const struct of_device_id ingenic_drm_of_match[] =3D {
>  	{ .compatible =3D "ingenic,jz4740-lcd", .data =3D &jz4740_soc_info },
>  	{ .compatible =3D "ingenic,jz4725b-lcd", .data =3D &jz4725b_soc_info },
>  	{ .compatible =3D "ingenic,jz4770-lcd", .data =3D &jz4770_soc_info },
> +	{ .compatible =3D "ingenic,jz4780-lcd", .data =3D &jz4780_soc_info },
>  	{ /* sentinel */ },
>  };
>  MODULE_DEVICE_TABLE(of, ingenic_drm_of_match);
> diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.h=20
> b/drivers/gpu/drm/ingenic/ingenic-drm.h
> index 22654ac1dde1c..cb1d09b625881 100644
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
> @@ -176,6 +182,38 @@
>  #define JZ_LCD_SIZE01_WIDTH_LSB			0
>  #define JZ_LCD_SIZE01_HEIGHT_LSB		16
>=20
> +#define JZ_LCD_DESSIZE_ALPHA_OFFSET		24
> +#define JZ_LCD_DESSIZE_HEIGHT_MASK		GENMASK(23, 12)
> +#define JZ_LCD_DESSIZE_WIDTH_MASK		GENMASK(11, 0)
> +
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
> --
> 2.33.0
>=20


