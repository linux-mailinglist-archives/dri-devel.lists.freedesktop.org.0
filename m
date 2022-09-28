Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 129E55ED2D1
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 03:55:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171AF10E0B0;
	Wed, 28 Sep 2022 01:55:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C83FD10E0B0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 01:54:56 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9430147C;
 Wed, 28 Sep 2022 03:54:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664330094;
 bh=SXI7ySKYfPJSI/Ru0CCLJ6ymmPDgfi+3FFK4haSvBhk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L8MOW8P6G20/Ps29tyqis4mbdzfkRC3n0d72JvZSXKNJPdJt6numwqkueL+12+5YB
 rGynKsi4kXeQRzZD/2YiQBiTvaf/ICEBhliafzAH2VkcH578L+UR+pe7MjAEl/rcFd
 EcXVtdQnv2l9cG6/o+oSrK+BpO921gSe0D/OkgZ0=
Date: Wed, 28 Sep 2022 04:54:52 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH v2 4/4] drm: lcdif: Add support for YUV planes
Message-ID: <YzOpbC2+cTFcfB0b@pendragon.ideasonboard.com>
References: <20220928005812.21060-1-laurent.pinchart@ideasonboard.com>
 <20220928005812.21060-5-laurent.pinchart@ideasonboard.com>
 <10cec491-f27d-5084-cfca-bbf9c0ec0cb6@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <10cec491-f27d-5084-cfca-bbf9c0ec0cb6@denx.de>
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
Cc: Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Daniel Scally <dan.scally@ideasonboard.com>, dri-devel@lists.freedesktop.org,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

On Wed, Sep 28, 2022 at 03:09:11AM +0200, Marek Vasut wrote:
> On 9/28/22 02:58, Laurent Pinchart wrote:
> 
> [...]
> 
> > +	/*
> > +	 * The CSC differentiates between "YCbCr" and "YUV", but the reference
> > +	 * manual doesn't detail how they differ. Experiments showed that the
> > +	 * luminance value is unaffected, only the calculations involving chroma
> > +	 * values differ. The YCbCr mode behaves as expected, with chroma values
> > +	 * being offset by 128. The YUV mode isn't fully understood.
> > +	 */
> > +	if (!in_yuv && out_yuv) {
> > +		/* RGB -> YCbCr */
> > +		writel(CSC0_CTRL_CSC_MODE_RGB2YCbCr,
> > +		       lcdif->base + LCDC_V8_CSC0_CTRL);
> > +
> > +		/* CSC: BT.601 Limited Range RGB to YCbCr coefficients. */
> > +		writel(CSC0_COEF0_A2(0x081) | CSC0_COEF0_A1(0x041),
> > +		       lcdif->base + LCDC_V8_CSC0_COEF0);
> > +		writel(CSC0_COEF1_B1(0x7db) | CSC0_COEF1_A3(0x019),
> > +		       lcdif->base + LCDC_V8_CSC0_COEF1);
> > +		writel(CSC0_COEF2_B3(0x070) | CSC0_COEF2_B2(0x7b6),
> > +		       lcdif->base + LCDC_V8_CSC0_COEF2);
> > +		writel(CSC0_COEF3_C2(0x7a2) | CSC0_COEF3_C1(0x070),
> > +		       lcdif->base + LCDC_V8_CSC0_COEF3);
> > +		writel(CSC0_COEF4_D1(0x010) | CSC0_COEF4_C3(0x7ee),
> > +		       lcdif->base + LCDC_V8_CSC0_COEF4);
> > +		writel(CSC0_COEF5_D3(0x080) | CSC0_COEF5_D2(0x080),
> > +		       lcdif->base + LCDC_V8_CSC0_COEF5);
> 
> Would it make sense to turn the above ^ into a nice coeffs table like 
> the lcdif_yuv2rgb_coeffs table used in the else if branch below ?

I thought about that, and decided to leave it as-is given that only one
encoding and quantization range is supported. It could be nice to fix
this, but it would then involve work in the dw-hdmi driver to select the
quantization through the AVI infoframe, as well as more work here to
pick a default based on the device capabilites reported through EDID.
I've decided not to explore that rabbit hole :-)

This being said, the coefficients could be moved to a table already even
without support for multiple encodings or ranges. Feel free to add a
patch on top, I'll review it :-)

> > +	} else if (in_yuv && !out_yuv) {
> > +		/* YCbCr -> RGB */
> > +		const u32 *coeffs =
> > +			lcdif_yuv2rgb_coeffs[plane_state->color_encoding]
> > +					    [plane_state->color_range];
> > +
> > +		writel(CSC0_CTRL_CSC_MODE_YCbCr2RGB,
> > +		       lcdif->base + LCDC_V8_CSC0_CTRL);
> > +
> > +		writel(coeffs[0], lcdif->base + LCDC_V8_CSC0_COEF0);
> > +		writel(coeffs[1], lcdif->base + LCDC_V8_CSC0_COEF1);
> > +		writel(coeffs[2], lcdif->base + LCDC_V8_CSC0_COEF2);
> > +		writel(coeffs[3], lcdif->base + LCDC_V8_CSC0_COEF3);
> > +		writel(coeffs[4], lcdif->base + LCDC_V8_CSC0_COEF4);
> > +		writel(coeffs[5], lcdif->base + LCDC_V8_CSC0_COEF5);
> > +	} else {
> > +		/* RGB -> RGB, YCbCr -> YCbCr: bypass colorspace converter. */
> > +		writel(CSC0_CTRL_BYPASS, lcdif->base + LCDC_V8_CSC0_CTRL);
> > +	}
> >   }
> >   
> >   static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_flags)
> 
> [...]
> 
> > @@ -469,6 +593,11 @@ static const u64 lcdif_modifiers[] = {
> >   
> >   int lcdif_kms_init(struct lcdif_drm_private *lcdif)
> >   {
> > +	const u32 supported_encodings = BIT(DRM_COLOR_YCBCR_BT601)
> > +				      | BIT(DRM_COLOR_YCBCR_BT709)
> > +				      | BIT(DRM_COLOR_YCBCR_BT2020);
> > +	const u32 supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE)
> > +				   | BIT(DRM_COLOR_YCBCR_FULL_RANGE);
> 
> Nitpick, is the | operator in front OK, or should it be at the end of 
> the line ?

I'll move it to the end of the line.

> Besides those nitpicks:
> 
> Reviewed-by: Marek Vasut <marex@denx.de>

-- 
Regards,

Laurent Pinchart
