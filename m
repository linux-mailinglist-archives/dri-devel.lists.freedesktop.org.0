Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648605F0637
	for <lists+dri-devel@lfdr.de>; Fri, 30 Sep 2022 10:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90F510E034;
	Fri, 30 Sep 2022 08:05:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68A7710E034
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Sep 2022 08:05:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id CD39B47C;
 Fri, 30 Sep 2022 10:05:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1664525112;
 bh=u6NhrwctNIUuuEOoN7VNYbRkrTwGTy+IgdPYljGIiMw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=wZxAeIrkMS9c6uBdysjH80riFT0K83UEa8ywWc9QwoR3Jq/HRGJOybOqVQCv2eWga
 FCvuJEaaABzXSIHZfpO3LMtWhQMU1YC8wWQ6TtMVRSwPNyDkVD+GDFa4DgbRDbRIqX
 ChUXHFyn/aefgRqaCKff97nDHzjTuEoAvwI5Yyf0=
Date: Fri, 30 Sep 2022 11:05:10 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v3 4/4] drm: lcdif: Add support for YUV planes
Message-ID: <YzajNkvbVChm+RLr@pendragon.ideasonboard.com>
References: <20220929204235.773-1-laurent.pinchart@ideasonboard.com>
 <20220929204235.773-5-laurent.pinchart@ideasonboard.com>
 <ac158d92e663015968791ecb4ff3e6e0ed76c228.camel@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ac158d92e663015968791ecb4ff3e6e0ed76c228.camel@nxp.com>
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

On Fri, Sep 30, 2022 at 12:01:39PM +0800, Liu Ying wrote:
> On Thu, 2022-09-29 at 23:42 +0300, Laurent Pinchart wrote:
> > From: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > 
> > The LCDIF includes a color space converter that supports YUV input. Use
> > it to support YUV planes, either through the converter if the output
> > format is RGB, or in conversion bypass mode otherwise.
> > 
> > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Reviewed-by: Marek Vasut <marex@denx.de>
> > Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > ---
> > Changes since v2:
> > 
> > - Fix YUV to RGB coefficients
> > - List floating point coefficient values in comment
> > - Express CSC coefficients with three hex digits
> > - Move | to the end of the line
> > - Add comment header before RGB formats
> > 
> > Changes since v1:
> > 
> > - Support all YCbCr encodings and quantization ranges
> > - Drop incorrect comment
> > ---
> >  drivers/gpu/drm/mxsfb/lcdif_kms.c  | 260 ++++++++++++++++++++++++-----
> >  drivers/gpu/drm/mxsfb/lcdif_regs.h |   5 +-
> >  2 files changed, 224 insertions(+), 41 deletions(-)
> 
> Hmmm, 'git am' fails to apply this one to drm-misc-next but it's ok
> with v6.0-rc1.  I should have tried drm-misc-next with v2.

Oops. I'll rebase on top of drm-misc-next.

> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > index 08e4880ec6cf..81454b53936f 100644
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
> > @@ -32,13 +33,119 @@
> >  /* -----------------------------------------------------------------------------
> >   * CRTC
> >   */
> > +
> > +/*
> > + * Despite the reference manual stating the opposite, the D1, D2 and D3 offset
> > + * values are added to Y, U and V, not subtracted. They must thus be programmed
> > + * with negative values.
> 
> Can you add the generic conversion equations with [A-D][1-3]
> coefficient symbols as comments in code, like imx-pxp.c does?  It will
> improve code readability better and tell which coefficient is which.
> Also for RGB to YCbCr conversion if you want to do that with this
> series.  Sorry for not pointing this out in v2 review cycle.

I'll fix that.

> > + */
> > +static const u32 lcdif_yuv2rgb_coeffs[3][2][6] = {
> 
> [...]
> 
> > +	/* YUYV Formats */
> 
> 'YUV Formats' would be better?  Again, failed to catch this in v2...

Will fix this too.

> > +	case DRM_FORMAT_YUYV:
> > +		writel(CTRLDESCL0_5_BPP_YCbCr422 | CTRLDESCL0_5_YUV_FORMAT_VY2UY1,
> > +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > +		in_yuv = true;
> > +		break;
> > +	case DRM_FORMAT_YVYU:
> > +		writel(CTRLDESCL0_5_BPP_YCbCr422 | CTRLDESCL0_5_YUV_FORMAT_UY2VY1,
> > +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > +		in_yuv = true;
> > +		break;
> > +	case DRM_FORMAT_UYVY:
> > +		writel(CTRLDESCL0_5_BPP_YCbCr422 | CTRLDESCL0_5_YUV_FORMAT_Y2VY1U,
> > +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > +		in_yuv = true;
> > +		break;
> > +	case DRM_FORMAT_VYUY:
> > +		writel(CTRLDESCL0_5_BPP_YCbCr422 | CTRLDESCL0_5_YUV_FORMAT_Y2UY1V,
> > +		       lcdif->base + LCDC_V8_CTRLDESCL0_5);
> > +		in_yuv = true;
> > +		break;
> > +
> > +	default:
> > +		dev_err(drm->dev, "Unknown pixel format 0x%x\n", format);
> > +		break;
> > +	}

-- 
Regards,

Laurent Pinchart
