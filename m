Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 663188D33BC
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 11:55:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A4F10E4EE;
	Wed, 29 May 2024 09:55:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ty0013VC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D91F10E4EE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 09:55:21 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 496D24AB;
 Wed, 29 May 2024 11:55:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1716976516;
 bh=CZddNhTG4PTX5QH2SWfe7je4knivXIh/sL6zBPQ2VfI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ty0013VCEBILlUifURaaerifEgaWGl5TESGJtCqzkcBuMmxYVJPz7/DVHo7vksgx9
 Hc1lWmu79LfEPS1uyhespcZ3scRbsPKMopc0RLU8pF5BDbIdKEvbpg1JcPwTH0lU/l
 p6qHKcZloYcWjUBFY/6WhQpkqKF0qY+oTxFZHI2Q=
Date: Wed, 29 May 2024 12:55:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] drm: renesas: shmobile: Add drm_panic support
Message-ID: <20240529095506.GC19014@pendragon.ideasonboard.com>
References: <292638fde9aef8b00e984245f43dc02a818cf322.1716816827.git.geert+renesas@glider.be>
 <20240529010320.GI1436@pendragon.ideasonboard.com>
 <u5aijnvotestpgjynawcx7oxsp2lncnsda5w4jfzeovvdlfcyt@5fxnyfbk4ocb>
 <20240529091018.GK1436@pendragon.ideasonboard.com>
 <zyd7e55dfonmacewfscac5sdrypx5rsjwvkt7umhbnjltd3rz4@wabvqnsrlatl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <zyd7e55dfonmacewfscac5sdrypx5rsjwvkt7umhbnjltd3rz4@wabvqnsrlatl>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 29, 2024 at 12:25:56PM +0300, Dmitry Baryshkov wrote:
> On Wed, May 29, 2024 at 12:10:18PM +0300, Laurent Pinchart wrote:
> > Hi Dmitry,
> > 
> > On Wed, May 29, 2024 at 11:27:02AM +0300, Dmitry Baryshkov wrote:
> > > On Wed, May 29, 2024 at 04:03:20AM +0300, Laurent Pinchart wrote:
> > > > On Mon, May 27, 2024 at 03:34:48PM +0200, Geert Uytterhoeven wrote:
> > > > > Add support for the drm_panic module, which displays a message on
> > > > > the screen when a kernel panic occurs.
> > > > > 
> > > > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > > > > ---
> > > > > Tested on Armadillo-800-EVA.
> > > > > ---
> > > > >  drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 14 +++++++++++++-
> > > > >  1 file changed, 13 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > > > index 07ad17d24294d5e6..9d166ab2af8bd231 100644
> > > > > --- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > > > +++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
> > > > > @@ -273,6 +273,13 @@ static const struct drm_plane_helper_funcs shmob_drm_plane_helper_funcs = {
> > > > >  	.atomic_disable = shmob_drm_plane_atomic_disable,
> > > > >  };
> > > > >  
> > > > > +static const struct drm_plane_helper_funcs shmob_drm_primary_plane_helper_funcs = {
> > > > > +	.atomic_check = shmob_drm_plane_atomic_check,
> > > > > +	.atomic_update = shmob_drm_plane_atomic_update,
> > > > > +	.atomic_disable = shmob_drm_plane_atomic_disable,
> > > > > +	.get_scanout_buffer = drm_fb_dma_get_scanout_buffer,
> > > > > +};
> > > > > +
> > > > >  static const struct drm_plane_funcs shmob_drm_plane_funcs = {
> > > > >  	.update_plane = drm_atomic_helper_update_plane,
> > > > >  	.disable_plane = drm_atomic_helper_disable_plane,
> > > > > @@ -310,7 +317,12 @@ struct drm_plane *shmob_drm_plane_create(struct shmob_drm_device *sdev,
> > > > >  
> > > > >  	splane->index = index;
> > > > >  
> > > > > -	drm_plane_helper_add(&splane->base, &shmob_drm_plane_helper_funcs);
> > > > > +	if (type == DRM_PLANE_TYPE_PRIMARY)
> > > > > +		drm_plane_helper_add(&splane->base,
> > > > > +				     &shmob_drm_primary_plane_helper_funcs);
> > > > > +	else
> > > > > +		drm_plane_helper_add(&splane->base,
> > > > > +				     &shmob_drm_plane_helper_funcs);
> > > > 
> > > > It's not very nice to have to provide different operations for the
> > > > primary and overlay planes. The documentation of
> > > > drm_fb_dma_get_scanout_buffer() states
> > > > 
> > > >  * @plane: DRM primary plane
> > > > 
> > > > If the intent is that only primary planes will be used to display the
> > > > panic message, shouldn't drm_panic_register() skip overlay planes ? It
> > > > would simplify drivers.
> > > 
> > > What about the drivers where all the planes are actually universal?
> > > In such a case the planes registered as primary can easily get replaced
> > > by 'overlay' planes.
> > 
> > Good point.
> > 
> > Another option, if we wanted to avoid duplicating the drm_plane_funcs,
> > would be to add a field to drm_plane to indicate whether the plane is
> > suitable for drm_panic.
> 
> ... or maybe let the driver decide. For the fully-universal-plane
> devices we probably want to select the planes which cover the largest
> part of the CRTC.

Are there devices where certain planes can only cover a subset of the
CRTC (apart from planes meant for cursors) ?

I think that what would matter the most in the end is selecting the
plane that is on top of the stack, and that doesn't seem to be addressed
by the drm_panic infrastructure. This is getting out of scope for this
patch though :-)

> > I don't think this patch should be blocked just for this reason, but I'm
> > a bit bothered by duplicating the ops structure to indicate drm_panic
> > support.
> > 
> > > > >  
> > > > >  	return &splane->base;
> > > > >  }

-- 
Regards,

Laurent Pinchart
