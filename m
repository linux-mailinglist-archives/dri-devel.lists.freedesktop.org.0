Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4365ED96A
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 11:49:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45CA110E3A5;
	Wed, 28 Sep 2022 09:49:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC6410E3A5
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 09:49:02 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5FF8447C;
 Wed, 28 Sep 2022 11:49:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664358541;
 bh=uGO6nCPp6zFye7Q+UKDF0A2sn/kYDxbunI/0/t5voao=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=N2fL9QHTXE10jR7WUOY3h3M9+rZnd5HY/oR0J8THq0K07sN7DMYhcwS7ihdF7jrIR
 HfkfQvS17oTdhbEZrurFN3w6nmtD/rq0Tz0qJoPB8A9WscDReVh4GFXONzwYLTHrO2
 6KYLEAJuG6V0eLVJatOIViTn17cCaWO33O+ewc1A=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220928005812.21060-4-laurent.pinchart@ideasonboard.com>
References: <20220928005812.21060-1-laurent.pinchart@ideasonboard.com>
 <20220928005812.21060-4-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 3/4] drm: lcdif: Switch to limited range for RGB to YUV
 conversion
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Date: Wed, 28 Sep 2022 10:48:58 +0100
Message-ID: <166435853876.2677993.16180422105335057479@Monstersaurus>
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

Quoting Laurent Pinchart (2022-09-28 01:58:11)
> Up to and including v1.3, HDMI supported limited quantization range only
> for YCbCr. HDMI v1.4 introduced selectable quantization ranges, but this
> features isn't supported in the dw-hdmi driver that is used in
> conjunction with the LCDIF in the i.MX8MP. The HDMI YCbCr output is thus
> always advertised in the AVI infoframe as limited range.
>=20
> The LCDIF driver, on the other hand, configures the CSC to produce full
> range YCbCr. This mismatch results in loss of details and incorrect
> colours. Fix it by switching to limited range YCbCr.
>=20
> The coefficients are copied from drivers/media/platforms/nxp/imx-pxp.c
> for coherency, as the hardware is most likely identical.

Perhaps we need one or two of these somewhere:

https://colorconfidence.com/products/calibrite-colorchecker-display

Or does anyone have one that could test this patch?

Anyway:

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>


> Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
>=20
> - Use coefficients from imx-pxp.c
> ---
>  drivers/gpu/drm/mxsfb/lcdif_kms.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lc=
dif_kms.c
> index 1f22ea5896d5..c3622be0c587 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> @@ -53,16 +53,16 @@ static void lcdif_set_formats(struct lcdif_drm_privat=
e *lcdif,
>                 writel(DISP_PARA_LINE_PATTERN_UYVY_H,
>                        lcdif->base + LCDC_V8_DISP_PARA);
> =20
> -               /* CSC: BT.601 Full Range RGB to YCbCr coefficients. */
> -               writel(CSC0_COEF0_A2(0x096) | CSC0_COEF0_A1(0x04c),
> +               /* CSC: BT.601 Limited Range RGB to YCbCr coefficients. */
> +               writel(CSC0_COEF0_A2(0x081) | CSC0_COEF0_A1(0x041),
>                        lcdif->base + LCDC_V8_CSC0_COEF0);
> -               writel(CSC0_COEF1_B1(0x7d5) | CSC0_COEF1_A3(0x01d),
> +               writel(CSC0_COEF1_B1(0x7db) | CSC0_COEF1_A3(0x019),
>                        lcdif->base + LCDC_V8_CSC0_COEF1);
> -               writel(CSC0_COEF2_B3(0x080) | CSC0_COEF2_B2(0x7ac),
> +               writel(CSC0_COEF2_B3(0x070) | CSC0_COEF2_B2(0x7b6),
>                        lcdif->base + LCDC_V8_CSC0_COEF2);
> -               writel(CSC0_COEF3_C2(0x795) | CSC0_COEF3_C1(0x080),
> +               writel(CSC0_COEF3_C2(0x7a2) | CSC0_COEF3_C1(0x070),
>                        lcdif->base + LCDC_V8_CSC0_COEF3);
> -               writel(CSC0_COEF4_D1(0x000) | CSC0_COEF4_C3(0x7ec),
> +               writel(CSC0_COEF4_D1(0x010) | CSC0_COEF4_C3(0x7ee),
>                        lcdif->base + LCDC_V8_CSC0_COEF4);
>                 writel(CSC0_COEF5_D3(0x080) | CSC0_COEF5_D2(0x080),
>                        lcdif->base + LCDC_V8_CSC0_COEF5);
> --=20
> Regards,
>=20
> Laurent Pinchart
>
