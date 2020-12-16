Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FD72DC21F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 15:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59A36893B9;
	Wed, 16 Dec 2020 14:27:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40EA4893B9
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Dec 2020 14:27:23 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5BA2C2CF;
 Wed, 16 Dec 2020 15:27:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1608128841;
 bh=39abH/vla71kOxVd+rKv8ZD/EXczM9IEXeFCG3j6gkc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E1tjZeOFtFxqAzobU4LX/6El6nlWR598SHBdO/oEp91obaKC9F9RUbOxO3gWMRsP6
 cEfD+BaEAZssZ4dmzTeA1Bv/Fvh9Ft1QS1BgSm5JlKQZG3I8kqh/fClhmzJF6sAFF0
 IF/cnjF/kzwJKEFygMC4YzVPeseI+MWY0pJyd800=
Date: Wed, 16 Dec 2020 16:27:13 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 4/4] drm: zte: Remove unnecessary drm_plane_cleanup()
 wrapper
Message-ID: <X9oZQUI2WShgEV4c@pendragon.ideasonboard.com>
References: <20201215193755.26160-1-laurent.pinchart+renesas@ideasonboard.com>
 <20201215193755.26160-4-laurent.pinchart+renesas@ideasonboard.com>
 <X9oYQ/hLVh2MCwJY@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <X9oYQ/hLVh2MCwJY@phenom.ffwll.local>
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
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Wed, Dec 16, 2020 at 03:22:59PM +0100, Daniel Vetter wrote:
> On Tue, Dec 15, 2020 at 09:37:55PM +0200, Laurent Pinchart wrote:
> > Use the drm_plane_cleanup() function directly as the drm_plane_funcs
> > .destroy() handler without creating an unnecessary wrapper around it.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> On the series:
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> I'm assuming you'll apply this somewhere.

Yes, with the rest of my pending patches for v5.12 (I'm currently going
through my stale branches, cleaning up the bitrot and resubmitting as
appropriate), but if you want to push to drm-misc early, I won't mind
:-)

> > ---
> >  drivers/gpu/drm/zte/zx_plane.c | 7 +------
> >  1 file changed, 1 insertion(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/zte/zx_plane.c b/drivers/gpu/drm/zte/zx_plane.c
> > index c8f7b21fa09e..78d787afe594 100644
> > --- a/drivers/gpu/drm/zte/zx_plane.c
> > +++ b/drivers/gpu/drm/zte/zx_plane.c
> > @@ -438,15 +438,10 @@ static const struct drm_plane_helper_funcs zx_gl_plane_helper_funcs = {
> >  	.atomic_disable = zx_plane_atomic_disable,
> >  };
> >  
> > -static void zx_plane_destroy(struct drm_plane *plane)
> > -{
> > -	drm_plane_cleanup(plane);
> > -}
> > -
> >  static const struct drm_plane_funcs zx_plane_funcs = {
> >  	.update_plane = drm_atomic_helper_update_plane,
> >  	.disable_plane = drm_atomic_helper_disable_plane,
> > -	.destroy = zx_plane_destroy,
> > +	.destroy = drm_plane_cleanup,
> >  	.reset = drm_atomic_helper_plane_reset,
> >  	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
> >  	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
