Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D4C4BFBE1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 16:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1757A10E9F0;
	Tue, 22 Feb 2022 15:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EE8B10E9F0
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 15:05:17 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4873D47F;
 Tue, 22 Feb 2022 16:05:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1645542315;
 bh=2wWertHysZI7liLYJADSfvb8zR+rNyxfkPpCdW+W01k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YjFBqzTA2VEd1I1XafnMeSMjzkvC+qvmnuyFCJodmAVPlmjSa2YO302Q9oM1AMcZM
 jcOlF5PXafEt8IgatJrzj6xm77TkYoZKQfdlSssx9jp1fbquFKc2G0bmOwzqMR7t0S
 ybc/GMLl2dY1/v+OFYSbz6DPdm1FWMGZkDcXBNsU=
Date: Tue, 22 Feb 2022 17:05:05 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: Re: [PATCH] drm: rcar-du: Fix CRTC timings when CMM is used
Message-ID: <YhT7oeMHBiTFY1lS@pendragon.ideasonboard.com>
References: <20211129222813.28079-1-laurent.pinchart+renesas@ideasonboard.com>
 <164553470517.3548538.7871098986791576958@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <164553470517.3548538.7871098986791576958@Monstersaurus>
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
Cc: linux-renesas-soc@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Kieran,

On Tue, Feb 22, 2022 at 12:58:25PM +0000, Kieran Bingham wrote:
> Quoting Laurent Pinchart (2021-11-29 22:28:13)
> > When the CMM is enabled, an offset of 25 pixels must be subtracted from
> > the HDS (horizontal display start) and HDE (horizontal display end)
> > registers. Fix the timings calculation, and take this into account in
> > the mode validation.
> > 
> > This fixes a visible horizontal offset in the image with VGA monitors.
> > HDMI monitors seem to be generally more tolerant to incorrect timings,
> > but may be affected too.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > ---
> >  drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 20 ++++++++++++++++----
> >  1 file changed, 16 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > index 5672830ca184..ee6ba74627a2 100644
> > --- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > +++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
> > @@ -215,6 +215,7 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
> >         const struct drm_display_mode *mode = &rcrtc->crtc.state->adjusted_mode;
> >         struct rcar_du_device *rcdu = rcrtc->dev;
> >         unsigned long mode_clock = mode->clock * 1000;
> > +       unsigned int hdse_offset;
> >         u32 dsmr;
> >         u32 escr;
> >  
> > @@ -298,10 +299,15 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
> >              | DSMR_DIPM_DISP | DSMR_CSPM;
> >         rcar_du_crtc_write(rcrtc, DSMR, dsmr);
> >  
> 
> This looks like the kind of place that could do with a comment
> explaining what is going on.

How does this sound ?

	/*
	 * When the CMM is enabled, an additional offset of 25 pixels must be
	 * subtracted from the HDS (horizontal display start) and HDE
	 * (horizontal display end) registers.
	 */

> > +       hdse_offset = 19;
> > +       if (rcrtc->group->cmms_mask & BIT(rcrtc->index % 2))
> > +               hdse_offset += 25;
> > +
> >         /* Display timings */
> > -       rcar_du_crtc_write(rcrtc, HDSR, mode->htotal - mode->hsync_start - 19);
> > +       rcar_du_crtc_write(rcrtc, HDSR, mode->htotal - mode->hsync_start -
> > +                                       hdse_offset);
> >         rcar_du_crtc_write(rcrtc, HDER, mode->htotal - mode->hsync_start +
> > -                                       mode->hdisplay - 19);
> > +                                       mode->hdisplay - hdse_offset);
> >         rcar_du_crtc_write(rcrtc, HSWR, mode->hsync_end -
> >                                         mode->hsync_start - 1);
> >         rcar_du_crtc_write(rcrtc, HCR,  mode->htotal - 1);
> > @@ -836,6 +842,7 @@ rcar_du_crtc_mode_valid(struct drm_crtc *crtc,
> >         struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
> >         struct rcar_du_device *rcdu = rcrtc->dev;
> >         bool interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
> > +       unsigned int min_sync_porch;
> >         unsigned int vbp;
> >  
> >         if (interlaced && !rcar_du_has(rcdu, RCAR_DU_FEATURE_INTERLACED))
> > @@ -843,9 +850,14 @@ rcar_du_crtc_mode_valid(struct drm_crtc *crtc,
> >  
> >         /*
> >          * The hardware requires a minimum combined horizontal sync and back
> > -        * porch of 20 pixels and a minimum vertical back porch of 3 lines.
> > +        * porch of 20 pixels (when CMM isn't used) or 45 pixels (when CMM is
> > +        * used), and a minimum vertical back porch of 3 lines.
> >          */
> > -       if (mode->htotal - mode->hsync_start < 20)
> > +       min_sync_porch = 20;
> > +       if (rcrtc->group->cmms_mask & BIT(rcrtc->index % 2))
> > +               min_sync_porch += 25;
> > +
> > +       if (mode->htotal - mode->hsync_start < min_sync_porch)
> >                 return MODE_HBLANK_NARROW;
> 
> Is the '19' in the hdse offset, this min_sync_port - 1 for position
> correction? It looks something like that. And the rest seems ok.

See Table 35.31 ("Correspondence Table of Settings of Display Timing
Generation Registers"):

Horizontal display start register n (HDSRn) - hsw + xs - 19

with the following footnote:

HDS should be set to 1 or greater

HDS = hsw + xs - 19 >= 1
hsw + xs >= 20

> With or without the additional optional comment suggestion above:
> 
> Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> >         vbp = (mode->vtotal - mode->vsync_end) / (interlaced ? 2 : 1);
> > 
> > base-commit: c18c8891111bb5e014e144716044991112f16833
> > prerequisite-patch-id: dc9121a1b85ea05bf3eae2b0ac2168d47101ee87

-- 
Regards,

Laurent Pinchart
