Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B155ED942
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 11:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 841DD10E3A9;
	Wed, 28 Sep 2022 09:38:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A610710E39A
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 09:38:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 123D26BE;
 Wed, 28 Sep 2022 11:38:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664357889;
 bh=M/b9Of8b/kFGcDFFrq4FcRpLVr6gZJedWCVJOC1mLIA=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=eMsgu0HBn0trXGZWYNS2PtQ+UwgL02j2U5LXfpoCbqB509ORHrlIfu26Am9loUEQq
 Xlxb4cHfyPnosiUCmyW6aduDGIE7GC9B49Cv+aY4dAuyBMSvfy4BwotHef2P3iAQn3
 oxKulHsyL4OvGTIC6tzTIy9VJSgax6r5+5eCKiH4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220928005812.21060-3-laurent.pinchart@ideasonboard.com>
References: <20220928005812.21060-1-laurent.pinchart@ideasonboard.com>
 <20220928005812.21060-3-laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v2 2/4] drm: lcdif: Don't use BIT() for multi-bit register
 fields
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 dri-devel@lists.freedesktop.org
Date: Wed, 28 Sep 2022 10:38:06 +0100
Message-ID: <166435788604.2677993.6206910121555005606@Monstersaurus>
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

Quoting Laurent Pinchart (2022-09-28 01:58:10)
> The BIT() macro is meant to represent a single bit. Don't use it for
> values of register fields that span multiple bits.
>=20
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> Changes since v1:
>=20
> - Use hex for field values
> ---
>  drivers/gpu/drm/mxsfb/lcdif_regs.h | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mxsfb/lcdif_regs.h b/drivers/gpu/drm/mxsfb/l=
cdif_regs.h
> index 013f2cace2a0..0d5d9bedd94a 100644
> --- a/drivers/gpu/drm/mxsfb/lcdif_regs.h
> +++ b/drivers/gpu/drm/mxsfb/lcdif_regs.h
> @@ -138,9 +138,9 @@
> =20
>  #define DISP_PARA_DISP_ON              BIT(31)
>  #define DISP_PARA_SWAP_EN              BIT(30)
> -#define DISP_PARA_LINE_PATTERN_UYVY_H  (GENMASK(29, 28) | BIT(26))

I mean, I like BIT (and sometimes GENMASK) but ... What was going on
there!

Defintely better this way.

Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

> -#define DISP_PARA_LINE_PATTERN_RGB565  GENMASK(28, 26)
> -#define DISP_PARA_LINE_PATTERN_RGB888  0
> +#define DISP_PARA_LINE_PATTERN_UYVY_H  (0xd << 26)
> +#define DISP_PARA_LINE_PATTERN_RGB565  (0x7 << 26)
> +#define DISP_PARA_LINE_PATTERN_RGB888  (0x0 << 26)
>  #define DISP_PARA_LINE_PATTERN_MASK    GENMASK(29, 26)
>  #define DISP_PARA_DISP_MODE_MASK       GENMASK(25, 24)
>  #define DISP_PARA_BGND_R_MASK          GENMASK(23, 16)
> @@ -202,18 +202,18 @@
> =20
>  #define CTRLDESCL0_5_EN                        BIT(31)
>  #define CTRLDESCL0_5_SHADOW_LOAD_EN    BIT(30)
> -#define CTRLDESCL0_5_BPP_16_RGB565     BIT(26)
> -#define CTRLDESCL0_5_BPP_16_ARGB1555   (BIT(26) | BIT(24))
> -#define CTRLDESCL0_5_BPP_16_ARGB4444   (BIT(26) | BIT(25))
> -#define CTRLDESCL0_5_BPP_YCbCr422      (BIT(26) | BIT(25) | BIT(24))
> -#define CTRLDESCL0_5_BPP_24_RGB888     BIT(27)
> -#define CTRLDESCL0_5_BPP_32_ARGB8888   (BIT(27) | BIT(24))
> -#define CTRLDESCL0_5_BPP_32_ABGR8888   (BIT(27) | BIT(25))
> +#define CTRLDESCL0_5_BPP_16_RGB565     (0x4 << 24)
> +#define CTRLDESCL0_5_BPP_16_ARGB1555   (0x5 << 24)
> +#define CTRLDESCL0_5_BPP_16_ARGB4444   (0x6 << 24)
> +#define CTRLDESCL0_5_BPP_YCbCr422      (0x7 << 24)
> +#define CTRLDESCL0_5_BPP_24_RGB888     (0x8 << 24)
> +#define CTRLDESCL0_5_BPP_32_ARGB8888   (0x9 << 24)
> +#define CTRLDESCL0_5_BPP_32_ABGR8888   (0xa << 24)
>  #define CTRLDESCL0_5_BPP_MASK          GENMASK(27, 24)
> -#define CTRLDESCL0_5_YUV_FORMAT_Y2VY1U 0
> -#define CTRLDESCL0_5_YUV_FORMAT_Y2UY1V BIT(14)
> -#define CTRLDESCL0_5_YUV_FORMAT_VY2UY1 BIT(15)
> -#define CTRLDESCL0_5_YUV_FORMAT_UY2VY1 (BIT(15) | BIT(14))
> +#define CTRLDESCL0_5_YUV_FORMAT_Y2VY1U (0x0 << 14)
> +#define CTRLDESCL0_5_YUV_FORMAT_Y2UY1V (0x1 << 14)
> +#define CTRLDESCL0_5_YUV_FORMAT_VY2UY1 (0x2 << 14)
> +#define CTRLDESCL0_5_YUV_FORMAT_UY2VY1 (0x3 << 14)
>  #define CTRLDESCL0_5_YUV_FORMAT_MASK   GENMASK(15, 14)
> =20
>  #define CSC0_CTRL_CSC_MODE_RGB2YCbCr   GENMASK(2, 1)
> --=20
> Regards,
>=20
> Laurent Pinchart
>
