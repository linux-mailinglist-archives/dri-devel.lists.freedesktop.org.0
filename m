Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 324FD5EEFDD
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 10:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF6110E9E4;
	Thu, 29 Sep 2022 08:01:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B1010E9E4
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Sep 2022 08:01:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4B17E47C;
 Thu, 29 Sep 2022 10:01:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664438481;
 bh=vp5fFP7ue4PQowHogTRDtn/KfbgSXO0QMiEoCIJv0zo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cWyt/IRVf0BCEGvGjr/KBJv9luLtg8jBwX/sFSHh/8ixXdTRJlMIMdCJ25nL+bu3S
 ardE4cx/G9eLyYhzRvl7xkwAx3UPTxj7oFlakLqdvdxLth+xXLj6Eg3MaCw2fRzQ52
 HcbNDGTcoH0CRYMiTssntrCHbT3zkIr66GTXVxyk=
Date: Thu, 29 Sep 2022 11:01:20 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Liu Ying <victor.liu@oss.nxp.com>
Subject: Re: [PATCH v2 4/4] drm: lcdif: Add support for YUV planes
Message-ID: <YzVQ0MV58tgg5s8w@pendragon.ideasonboard.com>
References: <20220928005812.21060-1-laurent.pinchart@ideasonboard.com>
 <20220928005812.21060-5-laurent.pinchart@ideasonboard.com>
 <f7b038dc27a70cdb5d5cfa12362b66625872710e.camel@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f7b038dc27a70cdb5d5cfa12362b66625872710e.camel@oss.nxp.com>
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
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, Daniel Scally <dan.scally@ideasonboard.com>,
 Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Liu,

On Thu, Sep 29, 2022 at 03:47:33PM +0800, Liu Ying wrote:
> On Wed, 2022-09-28 at 03:58 +0300, Laurent Pinchart wrote:
> > From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > 
> > The LCDIF includes a color space converter that supports YUV input. Use
> > it to support YUV planes, either through the converter if the output
> > format is RGB, or in conversion bypass mode otherwise.
> > 
> > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> > Changes since v1:
> > 
> > - Support all YCbCr encodings and quantization ranges
> > - Drop incorrect comment
> > ---
> >  drivers/gpu/drm/mxsfb/lcdif_kms.c  | 183 +++++++++++++++++++++++++----
> >  drivers/gpu/drm/mxsfb/lcdif_regs.h |   5 +-
> >  2 files changed, 164 insertions(+), 24 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > index c3622be0c587..b469a90fd50f 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > @@ -15,6 +15,7 @@
> >  #include <drm/drm_atomic.h>
> >  #include <drm/drm_atomic_helper.h>
> >  #include <drm/drm_bridge.h>
> > +#include <drm/drm_color_mgmt.h>
> >  #include <drm/drm_crtc.h>
> >  #include <drm/drm_encoder.h>
> >  #include <drm/drm_framebuffer.h>
> > @@ -32,13 +33,77 @@
> >  /* -----------------------------------------------------------------------------
> >   * CRTC
> >   */
> > +
> > +/*
> > + * Despite the reference manual stating the opposite, the D1, D2 and D3 offset
> > + * values are added to Y, U and V, not subtracted. They must thus be programmed
> > + * with negative values.
> > + */
> > +static const u32 lcdif_yuv2rgb_coeffs[3][2][6] = {
> > +	[DRM_COLOR_YCBCR_BT601] = {
> > +		[DRM_COLOR_YCBCR_LIMITED_RANGE] = {
> 
> Can you add conversion equations as comments in code for each encoding
> and range, like imx-pxp.c does?  Also for RGB to YCbCr conversion.

Sure.

> > +			CSC0_COEF0_A1(0x012a) | CSC0_COEF0_A2(0x0000),
> 
> Looks like hex with 3 numbers is enough for each coefficient. Use
> '0x12a' and '0x000'?

OK.

> > +			CSC0_COEF1_A3(0x01a2) | CSC0_COEF1_B1(0x0123),
> > +			CSC0_COEF2_B2(0x079c) | CSC0_COEF2_B3(0x0730),
> > +			CSC0_COEF3_C1(0x0124) | CSC0_COEF3_C2(0x0204),
> > +			CSC0_COEF4_C3(0x0000) | CSC0_COEF4_D1(0x01f0),
> 
> Shouldn't D1 be 0x110 since it's -16 and you set D2/D3 to 0x180 as they
> are -128?  The same for D1s with other encodings and limited ranges.

The D values are stored in two-complement format, so 0x1f0 is -16.

> I didn't check other coefficients closely though.
> 
> [...]
> 
> > @@ -456,6 +574,12 @@ static const u32 lcdif_primary_plane_formats[] = {
> >  	DRM_FORMAT_XRGB1555,
> >  	DRM_FORMAT_XRGB4444,
> >  	DRM_FORMAT_XRGB8888,
> > +
> > +	/* packed YCbCr */
> 
> Nitpick: Add a similar comment for above RGB pixel formats?

Sure.

> > +	DRM_FORMAT_YUYV,
> > +	DRM_FORMAT_YVYU,
> > +	DRM_FORMAT_UYVY,
> > +	DRM_FORMAT_VYUY,
> >  };

-- 
Regards,

Laurent Pinchart
