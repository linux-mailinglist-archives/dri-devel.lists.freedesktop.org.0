Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F5B5ED1C4
	for <lists+dri-devel@lfdr.de>; Wed, 28 Sep 2022 02:21:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A963210E1DF;
	Wed, 28 Sep 2022 00:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A5010E1DF
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Sep 2022 00:21:38 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7C66047C;
 Wed, 28 Sep 2022 02:21:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664324496;
 bh=WF9/JjsV0n86xfnM6e+OXf7FwHcGxZvx/fVidNchlZU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ngEQ2n3zEnPirYxOwGp+SMb4AlNFThFDN0vXhKOzW23FeerHxf32KMmOdzeC0a6+q
 WojW9qrlcYONSBXNO355bFdU9G3A+mZedwtWiwObMuWfKO66jjyi3kKz50beDpV7jE
 QzDJfJ0xPrwh6rLfxYTYB14GJ9s5SrWhfh8Zp3bM=
Date: Wed, 28 Sep 2022 03:21:35 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH 3/4] drm: lcdif: Switch to limited range for RGB to YUV
 conversion
Message-ID: <YzOTj+QgYnn8RU84@pendragon.ideasonboard.com>
References: <20220927233821.8007-1-laurent.pinchart@ideasonboard.com>
 <20220927233821.8007-4-laurent.pinchart@ideasonboard.com>
 <303e8be8-41a6-e63f-f2f5-6fc3271886ed@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <303e8be8-41a6-e63f-f2f5-6fc3271886ed@denx.de>
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

On Wed, Sep 28, 2022 at 02:12:19AM +0200, Marek Vasut wrote:
> On 9/28/22 01:38, Laurent Pinchart wrote:
> > Up to and including v1.3, HDMI supported limited quantization range only
> > for YCbCr. HDMI v1.4 introduced selectable quantization ranges, but this
> > features isn't supported in the dw-hdmi driver that is used in
> > conjunction with the LCDIF in the i.MX8MP. The HDMI YCbCr output is thus
> > always advertised in the AVI infoframe as limited range.
> > 
> > The LCDIF driver, on the other hand, configures the CSC to produce full
> > range YCbCr. This mismatch results in loss of details and incorrect
> > colours. Fix it by switching to limited range YCbCr.
> > 
> > Fixes: 9db35bb349a0 ("drm: lcdif: Add support for i.MX8MP LCDIF variant")
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >   drivers/gpu/drm/mxsfb/lcdif_kms.c | 12 ++++++------
> >   1 file changed, 6 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > index 1f22ea5896d5..ba84b51598b3 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > @@ -53,16 +53,16 @@ static void lcdif_set_formats(struct lcdif_drm_private *lcdif,
> >   		writel(DISP_PARA_LINE_PATTERN_UYVY_H,
> >   		       lcdif->base + LCDC_V8_DISP_PARA);
> >   
> > -		/* CSC: BT.601 Full Range RGB to YCbCr coefficients. */
> > -		writel(CSC0_COEF0_A2(0x096) | CSC0_COEF0_A1(0x04c),
> > +		/* CSC: BT.601 Limited Range RGB to YCbCr coefficients. */
> > +		writel(CSC0_COEF0_A2(0x081) | CSC0_COEF0_A1(0x042),
> >   		       lcdif->base + LCDC_V8_CSC0_COEF0);
> > -		writel(CSC0_COEF1_B1(0x7d5) | CSC0_COEF1_A3(0x01d),
> > +		writel(CSC0_COEF1_B1(0x7da) | CSC0_COEF1_A3(0x019),
> >   		       lcdif->base + LCDC_V8_CSC0_COEF1);
> > -		writel(CSC0_COEF2_B3(0x080) | CSC0_COEF2_B2(0x7ac),
> > +		writel(CSC0_COEF2_B3(0x070) | CSC0_COEF2_B2(0x7b6),
> >   		       lcdif->base + LCDC_V8_CSC0_COEF2);
> > -		writel(CSC0_COEF3_C2(0x795) | CSC0_COEF3_C1(0x080),
> > +		writel(CSC0_COEF3_C2(0x7a2) | CSC0_COEF3_C1(0x070),
> >   		       lcdif->base + LCDC_V8_CSC0_COEF3);
> > -		writel(CSC0_COEF4_D1(0x000) | CSC0_COEF4_C3(0x7ec),
> > +		writel(CSC0_COEF4_D1(0x010) | CSC0_COEF4_C3(0x7ee),
> >   		       lcdif->base + LCDC_V8_CSC0_COEF4);
> >   		writel(CSC0_COEF5_D3(0x080) | CSC0_COEF5_D2(0x080),
> >   		       lcdif->base + LCDC_V8_CSC0_COEF5);
> 
> Would it make sense to use the same coeffs as csc2_coef_bt601_lim in 
> drivers/media/platform/nxp/imx-pxp.c , since the block is most likely 
> identical ?

The coefficients in this patch have been computed to distribute the
error in such a way that the sum of all lines stays the same. This
avoids biases and overflow, but it likely makes very little difference
in practice. I'm thus fine with the coefficients from imx-pxp.c.

-- 
Regards,

Laurent Pinchart
