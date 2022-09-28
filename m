Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA1B5ED9A0
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 11:59:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B4BD10E3AB;
	Wed, 28 Sep 2022 09:59:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F8B410E3AB
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 09:59:41 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0071D47C;
 Wed, 28 Sep 2022 11:59:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664359180;
 bh=jb0I9wElgu5gCBSVSdGjcdEdw+UOwLV7d7bmngfJ3ls=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=gdnmnpGGXloswSzVYlinsaX1IfvHy7OwaaIvFEZLgy2n2nBxNEJlz00kgOZdVRVbk
 4PuUN7KLoRxgm7pRpgtKMp2GBq0t1aHl+YhIBJDf0tuxrrS0mVaCvN6/FmKdWnxxk0
 U3cQLC2v6ZmfWp7UJ6O/NDG/DyGn4gpp17t1i53E=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220928005812.21060-5-laurent.pinchart@ideasonboard.com>
References: <20220928005812.21060-1-laurent.pinchart@ideasonboard.com>
 <20220928005812.21060-5-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 4/4] drm: lcdif: Add support for YUV planes
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Date: Wed, 28 Sep 2022 10:59:36 +0100
Message-ID: <166435917679.2677993.15195746500550564337@Monstersaurus>
User-Agent: alot/0.10
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Laurent Pinchart (2022-09-28 01:58:12)
> From: Kieran Bingham <kieran.bingham@ideasonboard.com>
>=20

It looks like this has progressed a bit since it left my computer ;-)


> The LCDIF includes a color space converter that supports YUV input. Use
> it to support YUV planes, either through the converter if the output
> format is RGB, or in conversion bypass mode otherwise.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
>=20
> - Support all YCbCr encodings and quantization ranges
> - Drop incorrect comment
> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c  | 183 +++++++++++++++++++++++++----
>  drivers/gpu/drm/mxsfb/lcdif_regs.h |   5 +-
>  2 files changed, 164 insertions(+), 24 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lc=
dif_kms.c
> index c3622be0c587..b469a90fd50f 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -15,6 +15,7 @@
>  #include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_color_mgmt.h>
>  #include <drm/drm_crtc.h>
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_framebuffer.h>
> @@ -32,13 +33,77 @@
>  /* ---------------------------------------------------------------------=
--------
>   * CRTC
>   */
> +
> +/*
> + * Despite the reference manual stating the opposite, the D1, D2 and D3 =
offset
> + * values are added to Y, U and V, not subtracted. They must thus be pro=
grammed
> + * with negative values.
> + */
> +static const u32 lcdif_yuv2rgb_coeffs[3][2][6] =3D {

Ick ... I sort of dislike this. It's fine here at the moment, and I like
the table ... but here we're definining the size of the table based on
external enum values. (Are those ABI stable, perhaps they are already?)

If someone were to put=20

 enum drm_color_encoding {
+        DRM_COLOR_LEGACY,=20
         DRM_COLOR_YCBCR_BT601,
         DRM_COLOR_YCBCR_BT709,
         DRM_COLOR_YCBCR_BT2020,
         DRM_COLOR_ENCODING_MAX,
 };

 enum drm_color_range {
         DRM_COLOR_YCBCR_LIMITED_RANGE,
+	 DRM_COLOR_YCBCR_MID_RANGE,
         DRM_COLOR_YCBCR_FULL_RANGE,
         DRM_COLOR_RANGE_MAX,
 };

Then this table allocation would be wrong.

Perhaps swapping for

> +static const u32 lcdif_yuv2rgb_coeffs[DRM_COLOR_ENCODING_MAX][DRM_COLOR_=
RANGE_MAX][6] =3D {

Would be safer ... but longer :-( ?=20


Anyway, I think the rest of it looks fine, and perhaps these enums are
in the UAPI which would make them stable anyway:


Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> +       [DRM_COLOR_YCBCR_BT601] =3D {
> +               [DRM_COLOR_YCBCR_LIMITED_RANGE] =3D {
> +                       CSC0_COEF0_A1(0x012a) | CSC0_COEF0_A2(0x0000),
> +                       CSC0_COEF1_A3(0x01a2) | CSC0_COEF1_B1(0x0123),
> +                       CSC0_COEF2_B2(0x079c) | CSC0_COEF2_B3(0x0730),
> +                       CSC0_COEF3_C1(0x0124) | CSC0_COEF3_C2(0x0204),
> +                       CSC0_COEF4_C3(0x0000) | CSC0_COEF4_D1(0x01f0),
> +                       CSC0_COEF5_D2(0x0180) | CSC0_COEF5_D3(0x0180),
> +               },
> +               [DRM_COLOR_YCBCR_FULL_RANGE] =3D {
> +                       CSC0_COEF0_A1(0x0100) | CSC0_COEF0_A2(0x0000),
> +                       CSC0_COEF1_A3(0x0167) | CSC0_COEF1_B1(0x0100),
> +                       CSC0_COEF2_B2(0x07a8) | CSC0_COEF2_B3(0x0749),
> +                       CSC0_COEF3_C1(0x0100) | CSC0_COEF3_C2(0x01c6),
> +                       CSC0_COEF4_C3(0x0000) | CSC0_COEF4_D1(0x0000),
> +                       CSC0_COEF5_D2(0x0180) | CSC0_COEF5_D3(0x0180),
> +               },
> +       },
> +       [DRM_COLOR_YCBCR_BT709] =3D {
> +               [DRM_COLOR_YCBCR_LIMITED_RANGE] =3D {
> +                       CSC0_COEF0_A1(0x012a) | CSC0_COEF0_A2(0x0000),
> +                       CSC0_COEF1_A3(0x01d6) | CSC0_COEF1_B1(0x0123),
> +                       CSC0_COEF2_B2(0x07c9) | CSC0_COEF2_B3(0x0778),
> +                       CSC0_COEF3_C1(0x0123) | CSC0_COEF3_C2(0x021d),
> +                       CSC0_COEF4_C3(0x0000) | CSC0_COEF4_D1(0x01f0),
> +                       CSC0_COEF5_D2(0x0180) | CSC0_COEF5_D3(0x0180),
> +               },
> +               [DRM_COLOR_YCBCR_FULL_RANGE] =3D {
> +                       CSC0_COEF0_A1(0x0100) | CSC0_COEF0_A2(0x0000),
> +                       CSC0_COEF1_A3(0x0193) | CSC0_COEF1_B1(0x0100),
> +                       CSC0_COEF2_B2(0x07d0) | CSC0_COEF2_B3(0x0788),
> +                       CSC0_COEF3_C1(0x0100) | CSC0_COEF3_C2(0x01db),
> +                       CSC0_COEF4_C3(0x0000) | CSC0_COEF4_D1(0x0000),
> +                       CSC0_COEF5_D2(0x0180) | CSC0_COEF5_D3(0x0180),
> +               },
> +       },
> +       [DRM_COLOR_YCBCR_BT2020] =3D {
> +               [DRM_COLOR_YCBCR_LIMITED_RANGE] =3D {
> +                       CSC0_COEF0_A1(0x012a) | CSC0_COEF0_A2(0x0000),
> +                       CSC0_COEF1_A3(0x01b8) | CSC0_COEF1_B1(0x0123),
> +                       CSC0_COEF2_B2(0x07d0) | CSC0_COEF2_B3(0x075a),
> +                       CSC0_COEF3_C1(0x0124) | CSC0_COEF3_C2(0x0224),
> +                       CSC0_COEF4_C3(0x0000) | CSC0_COEF4_D1(0x01f0),
> +                       CSC0_COEF5_D2(0x0180) | CSC0_COEF5_D3(0x0180),
> +               },
> +               [DRM_COLOR_YCBCR_FULL_RANGE] =3D {
> +                       CSC0_COEF0_A1(0x0100) | CSC0_COEF0_A2(0x0000),
> +                       CSC0_COEF1_A3(0x0179) | CSC0_COEF1_B1(0x0100),
> +                       CSC0_COEF2_B2(0x07d6) | CSC0_COEF2_B3(0x076e),
> +                       CSC0_COEF3_C1(0x0100) | CSC0_COEF3_C2(0x01e2),
> +                       CSC0_COEF4_C3(0x0000) | CSC0_COEF4_D1(0x0000),
> +                       CSC0_COEF5_D2(0x0180) | CSC0_COEF5_D3(0x0180),
> +               },
> +       },
> +};
> +
>  static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
> +                             struct drm_plane_state *plane_state,
>                               const u32 bus_format)
>  {
>         struct drm_device *drm =3D lcdif->drm;
> -       const u32 format =3D lcdif->crtc.primary->state->fb->format->form=
at;
> -
> -       writel(CSC0_CTRL_BYPASS, lcdif->base + LCDC_V8_CSC0_CTRL);
> +       const u32 format =3D plane_state->fb->format->format;
> +       bool in_yuv =3D false;
> +       bool out_yuv =3D false;
> =20
>         switch (bus_format) {
>         case MEDIA_BUS_FMT_RGB565_1X16:
> @@ -52,24 +117,7 @@ static void lcdif_set_formats(struct lcdif_drm_privat=
e *lcdif,
>         case MEDIA_BUS_FMT_UYVY8_1X16:
>                 writel(DISP_PARA_LINE_PATTERN_UYVY_H,
>                        lcdif->base + LCDC_V8_DISP_PARA);
> -
> -               /* CSC: BT.601 Limited Range RGB to YCbCr coefficients. */
> -               writel(CSC0_COEF0_A2(0x081) | CSC0_COEF0_A1(0x041),
> -                      lcdif->base + LCDC_V8_CSC0_COEF0);
> -               writel(CSC0_COEF1_B1(0x7db) | CSC0_COEF1_A3(0x019),
> -                      lcdif->base + LCDC_V8_CSC0_COEF1);
> -               writel(CSC0_COEF2_B3(0x070) | CSC0_COEF2_B2(0x7b6),
> -                      lcdif->base + LCDC_V8_CSC0_COEF2);
> -               writel(CSC0_COEF3_C2(0x7a2) | CSC0_COEF3_C1(0x070),
> -                      lcdif->base + LCDC_V8_CSC0_COEF3);
> -               writel(CSC0_COEF4_D1(0x010) | CSC0_COEF4_C3(0x7ee),
> -                      lcdif->base + LCDC_V8_CSC0_COEF4);
> -               writel(CSC0_COEF5_D3(0x080) | CSC0_COEF5_D2(0x080),
> -                      lcdif->base + LCDC_V8_CSC0_COEF5);
> -
> -               writel(CSC0_CTRL_CSC_MODE_RGB2YCbCr,
> -                      lcdif->base + LCDC_V8_CSC0_CTRL);
> -
> +               out_yuv =3D true;
>                 break;
>         default:
>                 dev_err(drm->dev, "Unknown media bus format 0x%x\n", bus_=
format);
> @@ -77,6 +125,7 @@ static void lcdif_set_formats(struct lcdif_drm_private=
 *lcdif,
>         }
> =20
>         switch (format) {
> +       /* RGB Formats */
>         case DRM_FORMAT_RGB565:
>                 writel(CTRLDESCL0_5_BPP_16_RGB565,
>                        lcdif->base + LCDC_V8_CTRLDESCL0_5);
> @@ -101,10 +150,78 @@ static void lcdif_set_formats(struct lcdif_drm_priv=
ate *lcdif,
>                 writel(CTRLDESCL0_5_BPP_32_ARGB8888,
>                        lcdif->base + LCDC_V8_CTRLDESCL0_5);
>                 break;
> +
> +       /* YUYV Formats */
> +       case DRM_FORMAT_YUYV:
> +               writel(CTRLDESCL0_5_BPP_YCbCr422 | CTRLDESCL0_5_YUV_FORMA=
T_VY2UY1,
> +                      lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +               in_yuv =3D true;
> +               break;
> +       case DRM_FORMAT_YVYU:
> +               writel(CTRLDESCL0_5_BPP_YCbCr422 | CTRLDESCL0_5_YUV_FORMA=
T_UY2VY1,
> +                      lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +               in_yuv =3D true;
> +               break;
> +       case DRM_FORMAT_UYVY:
> +               writel(CTRLDESCL0_5_BPP_YCbCr422 | CTRLDESCL0_5_YUV_FORMA=
T_Y2VY1U,
> +                      lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +               in_yuv =3D true;
> +               break;
> +       case DRM_FORMAT_VYUY:
> +               writel(CTRLDESCL0_5_BPP_YCbCr422 | CTRLDESCL0_5_YUV_FORMA=
T_Y2UY1V,
> +                      lcdif->base + LCDC_V8_CTRLDESCL0_5);
> +               in_yuv =3D true;
> +               break;
> +
>         default:
>                 dev_err(drm->dev, "Unknown pixel format 0x%x\n", format);
>                 break;
>         }
> +
> +       /*
> +        * The CSC differentiates between "YCbCr" and "YUV", but the refe=
rence
> +        * manual doesn't detail how they differ. Experiments showed that=
 the
> +        * luminance value is unaffected, only the calculations involving=
 chroma
> +        * values differ. The YCbCr mode behaves as expected, with chroma=
 values
> +        * being offset by 128. The YUV mode isn't fully understood.
> +        */
> +       if (!in_yuv && out_yuv) {
> +               /* RGB -> YCbCr */
> +               writel(CSC0_CTRL_CSC_MODE_RGB2YCbCr,
> +                      lcdif->base + LCDC_V8_CSC0_CTRL);
> +
> +               /* CSC: BT.601 Limited Range RGB to YCbCr coefficients. */
> +               writel(CSC0_COEF0_A2(0x081) | CSC0_COEF0_A1(0x041),
> +                      lcdif->base + LCDC_V8_CSC0_COEF0);
> +               writel(CSC0_COEF1_B1(0x7db) | CSC0_COEF1_A3(0x019),
> +                      lcdif->base + LCDC_V8_CSC0_COEF1);
> +               writel(CSC0_COEF2_B3(0x070) | CSC0_COEF2_B2(0x7b6),
> +                      lcdif->base + LCDC_V8_CSC0_COEF2);
> +               writel(CSC0_COEF3_C2(0x7a2) | CSC0_COEF3_C1(0x070),
> +                      lcdif->base + LCDC_V8_CSC0_COEF3);
> +               writel(CSC0_COEF4_D1(0x010) | CSC0_COEF4_C3(0x7ee),
> +                      lcdif->base + LCDC_V8_CSC0_COEF4);
> +               writel(CSC0_COEF5_D3(0x080) | CSC0_COEF5_D2(0x080),
> +                      lcdif->base + LCDC_V8_CSC0_COEF5);
> +       } else if (in_yuv && !out_yuv) {
> +               /* YCbCr -> RGB */
> +               const u32 *coeffs =3D
> +                       lcdif_yuv2rgb_coeffs[plane_state->color_encoding]
> +                                           [plane_state->color_range];
> +
> +               writel(CSC0_CTRL_CSC_MODE_YCbCr2RGB,
> +                      lcdif->base + LCDC_V8_CSC0_CTRL);
> +
> +               writel(coeffs[0], lcdif->base + LCDC_V8_CSC0_COEF0);
> +               writel(coeffs[1], lcdif->base + LCDC_V8_CSC0_COEF1);
> +               writel(coeffs[2], lcdif->base + LCDC_V8_CSC0_COEF2);
> +               writel(coeffs[3], lcdif->base + LCDC_V8_CSC0_COEF3);
> +               writel(coeffs[4], lcdif->base + LCDC_V8_CSC0_COEF4);
> +               writel(coeffs[5], lcdif->base + LCDC_V8_CSC0_COEF5);
> +       } else {
> +               /* RGB -> RGB, YCbCr -> YCbCr: bypass colorspace converte=
r. */
> +               writel(CSC0_CTRL_BYPASS, lcdif->base + LCDC_V8_CSC0_CTRL);
> +       }
>  }
> =20
>  static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flag=
s)
> @@ -201,6 +318,7 @@ static void lcdif_reset_block(struct lcdif_drm_privat=
e *lcdif)
>  }
> =20
>  static void lcdif_crtc_mode_set_nofb(struct lcdif_drm_private *lcdif,
> +                                    struct drm_plane_state *plane_state,
>                                      struct drm_bridge_state *bridge_stat=
e,
>                                      const u32 bus_format)
>  {
> @@ -223,7 +341,7 @@ static void lcdif_crtc_mode_set_nofb(struct lcdif_drm=
_private *lcdif,
>         /* Mandatory eLCDIF reset as per the Reference Manual */
>         lcdif_reset_block(lcdif);
> =20
> -       lcdif_set_formats(lcdif, bus_format);
> +       lcdif_set_formats(lcdif, plane_state, bus_format);
> =20
>         lcdif_set_mode(lcdif, bus_flags);
>  }
> @@ -306,7 +424,7 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc =
*crtc,
> =20
>         pm_runtime_get_sync(drm->dev);
> =20
> -       lcdif_crtc_mode_set_nofb(lcdif, bridge_state, bus_format);
> +       lcdif_crtc_mode_set_nofb(lcdif, new_pstate, bridge_state, bus_for=
mat);
> =20
>         /* Write cur_buf as well to avoid an initial corrupt frame */
>         paddr =3D drm_fb_cma_get_gem_addr(new_pstate->fb, new_pstate, 0);
> @@ -456,6 +574,12 @@ static const u32 lcdif_primary_plane_formats[] =3D {
>         DRM_FORMAT_XRGB1555,
>         DRM_FORMAT_XRGB4444,
>         DRM_FORMAT_XRGB8888,
> +
> +       /* packed YCbCr */
> +       DRM_FORMAT_YUYV,
> +       DRM_FORMAT_YVYU,
> +       DRM_FORMAT_UYVY,
> +       DRM_FORMAT_VYUY,
>  };
> =20
>  static const u64 lcdif_modifiers[] =3D {
> @@ -469,6 +593,11 @@ static const u64 lcdif_modifiers[] =3D {
> =20
>  int lcdif_kms_init(struct lcdif_drm_private *lcdif)
>  {
> +       const u32 supported_encodings =3D BIT(DRM_COLOR_YCBCR_BT601)
> +                                     | BIT(DRM_COLOR_YCBCR_BT709)
> +                                     | BIT(DRM_COLOR_YCBCR_BT2020);
> +       const u32 supported_ranges =3D BIT(DRM_COLOR_YCBCR_LIMITED_RANGE)
> +                                  | BIT(DRM_COLOR_YCBCR_FULL_RANGE);
>         struct drm_encoder *encoder =3D &lcdif->encoder;
>         struct drm_crtc *crtc =3D &lcdif->crtc;
>         int ret;
> @@ -484,6 +613,14 @@ int lcdif_kms_init(struct lcdif_drm_private *lcdif)
>         if (ret)
>                 return ret;
> =20
> +       ret =3D drm_plane_create_color_properties(&lcdif->planes.primary,
> +                                               supported_encodings,
> +                                               supported_ranges,
> +                                               DRM_COLOR_YCBCR_BT601,
> +                                               DRM_COLOR_YCBCR_LIMITED_R=
ANGE);
> +       if (ret)
> +               return ret;
> +
>         drm_crtc_helper_add(crtc, &lcdif_crtc_helper_funcs);
>         ret =3D drm_crtc_init_with_planes(lcdif->drm, crtc,
>                                         &lcdif->planes.primary, NULL,
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h b/drivers/gpu/drm/mxsfb/l=
cdif_regs.h
> index 0d5d9bedd94a..fb74eb5ccbf1 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_regs.h
> +++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
> @@ -216,7 +216,10 @@
>  #define CTRLDESCL0_5_YUV_FORMAT_UY2VY1 (0x3 << 14)
>  #define CTRLDESCL0_5_YUV_FORMAT_MASK   GENMASK(15, 14)
> =20
> -#define CSC0_CTRL_CSC_MODE_RGB2YCbCr   GENMASK(2, 1)
> +#define CSC0_CTRL_CSC_MODE_YUV2RGB     (0x0 << 1)
> +#define CSC0_CTRL_CSC_MODE_YCbCr2RGB   (0x1 << 1)
> +#define CSC0_CTRL_CSC_MODE_RGB2YUV     (0x2 << 1)
> +#define CSC0_CTRL_CSC_MODE_RGB2YCbCr   (0x3 << 1)
>  #define CSC0_CTRL_CSC_MODE_MASK                GENMASK(2, 1)
>  #define CSC0_CTRL_BYPASS               BIT(0)
> =20
> --=20
> Regards,
>=20
> Laurent Pinchart
>
