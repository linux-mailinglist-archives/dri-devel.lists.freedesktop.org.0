Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF7221100F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jul 2020 18:03:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521096E952;
	Wed,  1 Jul 2020 16:03:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CE896E952
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jul 2020 16:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 4E229FB03;
 Wed,  1 Jul 2020 18:03:32 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jh_UlnejPwD8; Wed,  1 Jul 2020 18:03:30 +0200 (CEST)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 0697540972; Wed,  1 Jul 2020 18:03:30 +0200 (CEST)
Date: Wed, 1 Jul 2020 18:03:29 +0200
From: Guido =?iso-8859-1?Q?G=FCnther?= <guido.gunther@puri.sm>
To: Ondrej Jirman <megous@megous.com>
Subject: Re: [PATCH v6 09/13] drm/panel: st7703: Add support for Xingbangda
 XBD599
Message-ID: <20200701160329.GH174356@bogon.m.sigxcpu.org>
References: <20200701103126.1512615-1-megous@megous.com>
 <20200701103126.1512615-10-megous@megous.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200701103126.1512615-10-megous@megous.com>
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
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Purism Kernel Team <kernel@puri.sm>, Samuel Holland <samuel@sholland.org>,
 David Airlie <airlied@linux.ie>, Bhushan Shah <bshah@kde.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-kernel@vger.kernel.org, Martijn Braam <martijn@brixit.nl>,
 linux-sunxi@googlegroups.com, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Luca Weiss <luca@z3ntu.xyz>,
 linux-arm-kernel@lists.infradead.org, Icenowy Zheng <icenowy@aosc.io>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Wed, Jul 01, 2020 at 12:31:22PM +0200, Ondrej Jirman wrote:
> Xingbangda XBD599 is a 5.99" 720x1440 MIPI-DSI LCD panel used in
> PinePhone. Add support for it.

Reviewed-by: Guido G=FCnther <agx@sigxcpu.org> =


> =

> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> Signed-off-by: Ondrej Jirman <megous@megous.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/panel/panel-sitronix-st7703.c | 200 +++++++++++++++++-
>  1 file changed, 198 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7703.c b/drivers/gpu/=
drm/panel/panel-sitronix-st7703.c
> index cdbf7dfb4dd4..5cd5503f894f 100644
> --- a/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> +++ b/drivers/gpu/drm/panel/panel-sitronix-st7703.c
> @@ -39,10 +39,11 @@
>  #define ST7703_CMD_SETEXTC	 0xB9
>  #define ST7703_CMD_SETMIPI	 0xBA
>  #define ST7703_CMD_SETVDC	 0xBC
> -#define ST7703_CMD_UNKNOWN0	 0xBF
> +#define ST7703_CMD_UNKNOWN_BF	 0xBF
>  #define ST7703_CMD_SETSCR	 0xC0
>  #define ST7703_CMD_SETPOWER	 0xC1
>  #define ST7703_CMD_SETPANEL	 0xCC
> +#define ST7703_CMD_UNKNOWN_C6	 0xC6
>  #define ST7703_CMD_SETGAMMA	 0xE0
>  #define ST7703_CMD_SETEQ	 0xE3
>  #define ST7703_CMD_SETGIP1	 0xE9
> @@ -109,7 +110,7 @@ static int jh057n_init_sequence(struct st7703 *ctx)
>  	msleep(20);
>  =

>  	dsi_generic_write_seq(dsi, ST7703_CMD_SETVCOM, 0x3F, 0x3F);
> -	dsi_generic_write_seq(dsi, ST7703_CMD_UNKNOWN0, 0x02, 0x11, 0x00);
> +	dsi_generic_write_seq(dsi, ST7703_CMD_UNKNOWN_BF, 0x02, 0x11, 0x00);
>  	dsi_generic_write_seq(dsi, ST7703_CMD_SETGIP1,
>  			      0x82, 0x10, 0x06, 0x05, 0x9E, 0x0A, 0xA5, 0x12,
>  			      0x31, 0x23, 0x37, 0x83, 0x04, 0xBC, 0x27, 0x38,
> @@ -163,6 +164,200 @@ struct st7703_panel_desc jh057n00900_panel_desc =3D=
 {
>  	.init_sequence =3D jh057n_init_sequence,
>  };
>  =

> +#define dsi_dcs_write_seq(dsi, cmd, seq...) do {			\
> +		static const u8 d[] =3D { seq };				\
> +		int ret;						\
> +		ret =3D mipi_dsi_dcs_write(dsi, cmd, d, ARRAY_SIZE(d));	\
> +		if (ret < 0)						\
> +			return ret;					\
> +	} while (0)
> +
> +
> +static int xbd599_init_sequence(struct st7703 *ctx)
> +{
> +	struct mipi_dsi_device *dsi =3D to_mipi_dsi_device(ctx->dev);
> +
> +	/*
> +	 * Init sequence was supplied by the panel vendor.
> +	 */
> +
> +	/* Magic sequence to unlock user commands below. */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETEXTC, 0xF1, 0x12, 0x83);
> +
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETMIPI,
> +			  0x33, /* VC_main =3D 0, Lane_Number =3D 3 (4 lanes) */
> +			  0x81, /* DSI_LDO_SEL =3D 1.7V, RTERM =3D 90 Ohm */
> +			  0x05, /* IHSRX =3D x6 (Low High Speed driving ability) */
> +			  0xF9, /* TX_CLK_SEL =3D fDSICLK/16 */
> +			  0x0E, /* HFP_OSC (min. HFP number in DSI mode) */
> +			  0x0E, /* HBP_OSC (min. HBP number in DSI mode) */
> +			  /* The rest is undocumented in ST7703 datasheet */
> +			  0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			  0x44, 0x25, 0x00, 0x91, 0x0a, 0x00, 0x00, 0x02,
> +			  0x4F, 0x11, 0x00, 0x00, 0x37);
> +
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER_EXT,
> +			  0x25, /* PCCS =3D 2, ECP_DC_DIV =3D 1/4 HSYNC */
> +			  0x22, /* DT =3D 15ms XDK_ECP =3D x2 */
> +			  0x20, /* PFM_DC_DIV =3D /1 */
> +			  0x03  /* ECP_SYNC_EN =3D 1, VGX_SYNC_EN =3D 1 */);
> +
> +	/* RGB I/F porch timing */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETRGBIF,
> +			  0x10, /* VBP_RGB_GEN */
> +			  0x10, /* VFP_RGB_GEN */
> +			  0x05, /* DE_BP_RGB_GEN */
> +			  0x05, /* DE_FP_RGB_GEN */
> +			  /* The rest is undocumented in ST7703 datasheet */
> +			  0x03, 0xFF,
> +			  0x00, 0x00,
> +			  0x00, 0x00);
> +
> +	/* Source driving settings. */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETSCR,
> +			  0x73, /* N_POPON */
> +			  0x73, /* N_NOPON */
> +			  0x50, /* I_POPON */
> +			  0x50, /* I_NOPON */
> +			  0x00, /* SCR[31,24] */
> +			  0xC0, /* SCR[23,16] */
> +			  0x08, /* SCR[15,8] */
> +			  0x70, /* SCR[7,0] */
> +			  0x00  /* Undocumented */);
> +
> +	/* NVDDD_SEL =3D -1.8V, VDDD_SEL =3D out of range (possibly 1.9V?) */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETVDC, 0x4E);
> +
> +	/*
> +	 * SS_PANEL =3D 1 (reverse scan), GS_PANEL =3D 0 (normal scan)
> +	 * REV_PANEL =3D 1 (normally black panel), BGR_PANEL =3D 1 (BGR)
> +	 */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETPANEL, 0x0B);
> +
> +	/* Zig-Zag Type C column inversion. */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETCYC, 0x80);
> +
> +	/* Set display resolution. */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETDISP,
> +			  0xF0, /* NL =3D 240 */
> +			  0x12, /* RES_V_LSB =3D 0, BLK_CON =3D VSSD,
> +				 * RESO_SEL =3D 720RGB
> +				 */
> +			  0xF0  /* WHITE_GND_EN =3D 1 (GND),
> +				 * WHITE_FRAME_SEL =3D 7 frames,
> +				 * ISC =3D 0 frames
> +				 */);
> +
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETEQ,
> +			  0x00, /* PNOEQ */
> +			  0x00, /* NNOEQ */
> +			  0x0B, /* PEQGND */
> +			  0x0B, /* NEQGND */
> +			  0x10, /* PEQVCI */
> +			  0x10, /* NEQVCI */
> +			  0x00, /* PEQVCI1 */
> +			  0x00, /* NEQVCI1 */
> +			  0x00, /* reserved */
> +			  0x00, /* reserved */
> +			  0xFF, /* reserved */
> +			  0x00, /* reserved */
> +			  0xC0, /* ESD_DET_DATA_WHITE =3D 1, ESD_WHITE_EN =3D 1 */
> +			  0x10  /* SLPIN_OPTION =3D 1 (no need vsync after sleep-in)
> +				 * VEDIO_NO_CHECK_EN =3D 0
> +				 * ESD_WHITE_GND_EN =3D 0
> +				 * ESD_DET_TIME_SEL =3D 0 frames
> +				 */);
> +
> +	/* Undocumented command. */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_C6, 0x01, 0x00, 0xFF, 0xFF, 0=
x00);
> +
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETPOWER,
> +			  0x74, /* VBTHS, VBTLS: VGH =3D 17V, VBL =3D -11V */
> +			  0x00, /* FBOFF_VGH =3D 0, FBOFF_VGL =3D 0 */
> +			  0x32, /* VRP  */
> +			  0x32, /* VRN */
> +			  0x77, /* reserved */
> +			  0xF1, /* APS =3D 1 (small),
> +				 * VGL_DET_EN =3D 1, VGH_DET_EN =3D 1,
> +				 * VGL_TURBO =3D 1, VGH_TURBO =3D 1
> +				 */
> +			  0xFF, /* VGH1_L_DIV, VGL1_L_DIV (1.5MHz) */
> +			  0xFF, /* VGH1_R_DIV, VGL1_R_DIV (1.5MHz) */
> +			  0xCC, /* VGH2_L_DIV, VGL2_L_DIV (2.6MHz) */
> +			  0xCC, /* VGH2_R_DIV, VGL2_R_DIV (2.6MHz) */
> +			  0x77, /* VGH3_L_DIV, VGL3_L_DIV (4.5MHz) */
> +			  0x77  /* VGH3_R_DIV, VGL3_R_DIV (4.5MHz) */);
> +
> +	/* Reference voltage. */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETBGP,
> +			  0x07, /* VREF_SEL =3D 4.2V */
> +			  0x07  /* NVREF_SEL =3D 4.2V */);
> +	msleep(20);
> +
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETVCOM,
> +			  0x2C, /* VCOMDC_F =3D -0.67V */
> +			  0x2C  /* VCOMDC_B =3D -0.67V */);
> +
> +	/* Undocumented command. */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_UNKNOWN_BF, 0x02, 0x11, 0x00);
> +
> +	/* This command is to set forward GIP timing. */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP1,
> +			  0x82, 0x10, 0x06, 0x05, 0xA2, 0x0A, 0xA5, 0x12,
> +			  0x31, 0x23, 0x37, 0x83, 0x04, 0xBC, 0x27, 0x38,
> +			  0x0C, 0x00, 0x03, 0x00, 0x00, 0x00, 0x0C, 0x00,
> +			  0x03, 0x00, 0x00, 0x00, 0x75, 0x75, 0x31, 0x88,
> +			  0x88, 0x88, 0x88, 0x88, 0x88, 0x13, 0x88, 0x64,
> +			  0x64, 0x20, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,
> +			  0x02, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00);
> +
> +	/* This command is to set backward GIP timing. */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETGIP2,
> +			  0x02, 0x21, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			  0x00, 0x00, 0x00, 0x00, 0x02, 0x46, 0x02, 0x88,
> +			  0x88, 0x88, 0x88, 0x88, 0x88, 0x64, 0x88, 0x13,
> +			  0x57, 0x13, 0x88, 0x88, 0x88, 0x88, 0x88, 0x88,
> +			  0x75, 0x88, 0x23, 0x14, 0x00, 0x00, 0x02, 0x00,
> +			  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +			  0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x03, 0x0A,
> +			  0xA5, 0x00, 0x00, 0x00, 0x00);
> +
> +	/* Adjust the gamma characteristics of the panel. */
> +	dsi_dcs_write_seq(dsi, ST7703_CMD_SETGAMMA,
> +			  0x00, 0x09, 0x0D, 0x23, 0x27, 0x3C, 0x41, 0x35,
> +			  0x07, 0x0D, 0x0E, 0x12, 0x13, 0x10, 0x12, 0x12,
> +			  0x18, 0x00, 0x09, 0x0D, 0x23, 0x27, 0x3C, 0x41,
> +			  0x35, 0x07, 0x0D, 0x0E, 0x12, 0x13, 0x10, 0x12,
> +			  0x12, 0x18);
> +
> +	return 0;
> +}
> +
> +static const struct drm_display_mode xbd599_mode =3D {
> +	.hdisplay    =3D 720,
> +	.hsync_start =3D 720 + 40,
> +	.hsync_end   =3D 720 + 40 + 40,
> +	.htotal	     =3D 720 + 40 + 40 + 40,
> +	.vdisplay    =3D 1440,
> +	.vsync_start =3D 1440 + 18,
> +	.vsync_end   =3D 1440 + 18 + 10,
> +	.vtotal	     =3D 1440 + 18 + 10 + 17,
> +	.vrefresh    =3D 60,
> +	.clock	     =3D 69000,
> +	.flags	     =3D DRM_MODE_FLAG_NHSYNC | DRM_MODE_FLAG_NVSYNC,
> +	.width_mm    =3D 68,
> +	.height_mm   =3D 136,
> +};
> +
> +static const struct st7703_panel_desc xbd599_desc =3D {
> +	.mode =3D &xbd599_mode,
> +	.lanes =3D 4,
> +	.mode_flags =3D MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE,
> +	.format =3D MIPI_DSI_FMT_RGB888,
> +	.init_sequence =3D xbd599_init_sequence,
> +};
> +
>  static int st7703_enable(struct drm_panel *panel)
>  {
>  	struct st7703 *ctx =3D panel_to_st7703(panel);
> @@ -428,6 +623,7 @@ static int st7703_remove(struct mipi_dsi_device *dsi)
>  =

>  static const struct of_device_id st7703_of_match[] =3D {
>  	{ .compatible =3D "rocktech,jh057n00900", .data =3D &jh057n00900_panel_=
desc },
> +	{ .compatible =3D "xingbangda,xbd599", .data =3D &xbd599_desc },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, st7703_of_match);
> -- =

> 2.27.0
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
