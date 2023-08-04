Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6183A76F660
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 02:06:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6129910E039;
	Fri,  4 Aug 2023 00:06:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7276710E039
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 00:06:10 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98D1F7F5;
 Fri,  4 Aug 2023 02:05:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691107504;
 bh=wRVeGCkhk2apQ67Z5ZgqDF4d5XRlQ0AT+Z4NU1Zv7yM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MnvWo9zhYe/0E1RLw9e2cgYrYL7Jwg3h+5Z5C+sxdhCAlQQEqprTeLxcw68G/nWca
 XZX2/V3cMpJl9tT+xYUVmCwrX8y65ACkvmqp0KUgQEnABxdj9qpFawOeXV3M7eNfwK
 gsS9XwiEmKc9UFMy7LpaAFBZym2MPjz5awxtQ0OQ=
Date: Fri, 4 Aug 2023 03:06:15 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Damian Hobson-Garcia <dhobsong@igel.co.jp>
Subject: Re: [PATCH 1/2] drm: rcar-du: Add more formats to
 DRM_MODE_BLEND_PIXEL_NONE support
Message-ID: <20230804000615.GN9722@pendragon.ideasonboard.com>
References: <20230728200714.2084223-1-dhobsong@igel.co.jp>
 <20230803234703.GJ9722@pendragon.ideasonboard.com>
 <20230803235315.GL9722@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230803235315.GL9722@pendragon.ideasonboard.com>
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
Cc: linux-renesas-soc@vger.kernel.org, kieran.bingham+renesas@ideasonboard.com,
 taki@igel.co.jp, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Aug 04, 2023 at 02:53:17AM +0300, Laurent Pinchart wrote:
> On Fri, Aug 04, 2023 at 02:47:04AM +0300, Laurent Pinchart wrote:
> > Hi Damian,
> > 
> > Thank you for the patch.
> > 
> > On Fri, Jul 28, 2023 at 04:07:13PM -0400, Damian Hobson-Garcia wrote:
> > > Add additional pixel formats for which blending is disabling when
> > 
> > Did you mean "disabled" instead of "disabling" ?
> > 
> > > DRM_MODE_BLEND_PIXEL_NONE is set.
> > > 
> > > Refactor the fourcc selection into a separate function to handle the
> > > increased number of formats.
> > > 
> > > Signed-off-by: Damian Hobson-Garcia <dhobsong@igel.co.jp>
> > > ---
> > >  drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 49 ++++++++++++-------
> > >  1 file changed, 32 insertions(+), 17 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> > > index 45c05d0ffc70..96241c03b60f 100644
> > > --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> > > +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> > > @@ -176,6 +176,37 @@ static const u32 rcar_du_vsp_formats_gen4[] = {
> > >  	DRM_FORMAT_Y212,
> > >  };
> > >  
> > > +static u32 rcar_du_vsp_state_get_format(struct rcar_du_vsp_plane_state *state)
> > > +{
> > > +	u32 fourcc = state->format->fourcc;
> > > +
> > > +	if (state->state.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
> > > +		switch (fourcc) {
> > > +		case DRM_FORMAT_ARGB1555:
> > > +			fourcc = DRM_FORMAT_XRGB1555;
> > > +			break;
> > > +
> > > +		case DRM_FORMAT_ARGB4444:
> > > +			fourcc = DRM_FORMAT_XRGB4444;
> > > +			break;
> > > +
> > > +		case DRM_FORMAT_ARGB8888:
> > > +			fourcc = DRM_FORMAT_XRGB8888;
> > > +			break;
> > > +
> > > +		case DRM_FORMAT_BGRA8888:
> > > +			fourcc = DRM_FORMAT_BGRX8888;
> > > +			break;
> > > +
> > > +		case DRM_FORMAT_RGBA1010102:
> > > +			fourcc = DRM_FORMAT_RGBX1010102;
> > > +			break;
> > 
> > Should DRM_FORMAT_ARGB2101010 be added as well, or did you leave it out
> > intentionally ?
> 
> It looks like DRM_FORMAT_ARGB2101010 will require a bit more work, as
> DRM_FORMAT_XRGB2101010 is not handled by the DU driver at the moment.
> Let's do so with a patch on top of this series.

Replying to myself again, the datasheet doesn't explicitly list
DRM_FORMAT_XRGB2101010 as supported, but the generic mechanism to
specify the location of the components should work fine for that format.
Is this something you would be able to test ?

> There's no need to send
> a v2, I can handle the simple change in the commit message if you let me
> know whether my comment is right or wrong.
> 
> > > +		}
> > > +	}
> > > +
> > > +	return fourcc;
> > > +}
> > > +
> > >  static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
> > >  {
> > >  	struct rcar_du_vsp_plane_state *state =
> > > @@ -189,7 +220,7 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
> > >  		.alpha = state->state.alpha >> 8,
> > >  		.zpos = state->state.zpos,
> > >  	};
> > > -	u32 fourcc = state->format->fourcc;
> > > +	u32 fourcc = rcar_du_vsp_state_get_format(state);
> > >  	unsigned int i;
> > >  
> > >  	cfg.src.left = state->state.src.x1 >> 16;
> > > @@ -206,22 +237,6 @@ static void rcar_du_vsp_plane_setup(struct rcar_du_vsp_plane *plane)
> > >  		cfg.mem[i] = sg_dma_address(state->sg_tables[i].sgl)
> > >  			   + fb->offsets[i];
> > >  
> > > -	if (state->state.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE) {
> > > -		switch (fourcc) {
> > > -		case DRM_FORMAT_ARGB1555:
> > > -			fourcc = DRM_FORMAT_XRGB1555;
> > > -			break;
> > > -
> > > -		case DRM_FORMAT_ARGB4444:
> > > -			fourcc = DRM_FORMAT_XRGB4444;
> > > -			break;
> > > -
> > > -		case DRM_FORMAT_ARGB8888:
> > > -			fourcc = DRM_FORMAT_XRGB8888;
> > > -			break;
> > > -		}
> > > -	}
> > > -
> > >  	format = rcar_du_format_info(fourcc);
> > >  	cfg.pixelformat = format->v4l2;
> > >  

-- 
Regards,

Laurent Pinchart
