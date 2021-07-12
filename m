Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36EA93C640D
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jul 2021 21:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66DCA89D7C;
	Mon, 12 Jul 2021 19:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A74989D7C
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jul 2021 19:47:10 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id f668a10d-e349-11eb-8d1a-0050568cd888;
 Mon, 12 Jul 2021 19:47:17 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 75EE5194B00;
 Mon, 12 Jul 2021 21:47:17 +0200 (CEST)
Date: Mon, 12 Jul 2021 21:47:01 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 1/1] drm: bridge: Mark deprecated operations in
 drm_bridge_funcs
Message-ID: <YOycNV1GAPyhzSGN@ravnborg.org>
References: <20210710084240.281063-1-sam@ravnborg.org>
 <YOoHIPWzgFraoeeb@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YOoHIPWzgFraoeeb@pendragon.ideasonboard.com>
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
Cc: David Airlie <airlied@linux.ie>, Andrzej Hajda <a.hajda@samsung.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Sat, Jul 10, 2021 at 11:46:24PM +0300, Laurent Pinchart wrote:
> Hi Sam,
> 
> Thank you for the patch.
> 
> On Sat, Jul 10, 2021 at 10:42:40AM +0200, Sam Ravnborg wrote:
> > drm_bridge_funcs includes several duplicated operations as atomic
> > variants has been added over time.
> 
> s/has/have/
> 
> > New bridge drivers shall use the atomic variants - mark the deprecated
> > operations to try to avoid usage in new bridge drivers.
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: David Airlie <airlied@linux.ie>
> > Cc: Daniel Vetter <daniel@ffwll.ch>
> > ---
> >  include/drm/drm_bridge.h | 28 ++++++++++++++++++++++++++--
> >  1 file changed, 26 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > index 2195daa289d2..6805898d70f5 100644
> > --- a/include/drm/drm_bridge.h
> > +++ b/include/drm/drm_bridge.h
> > @@ -171,6 +171,11 @@ struct drm_bridge_funcs {
> >  	 * signals) feeding it is still running when this callback is called.
> >  	 *
> >  	 * The @disable callback is optional.
> > +	 *
> > +	 * NOTE:
> > +	 *
> > +	 * This is deprecated, do not use!
> > +	 * New drivers shall use &drm_bridge_funcs.atomic_disable.
> >  	 */
> >  	void (*disable)(struct drm_bridge *bridge);
> >  
> > @@ -190,6 +195,11 @@ struct drm_bridge_funcs {
> >  	 * called.
> >  	 *
> >  	 * The @post_disable callback is optional.
> > +	 *
> > +	 * NOTE:
> > +	 *
> > +	 * This is deprecated, do not use!
> > +	 * New drivers shall use &drm_bridge_funcs.atomic_post_disable.
> >  	 */
> >  	void (*post_disable)(struct drm_bridge *bridge);
> >  
> > @@ -213,11 +223,15 @@ struct drm_bridge_funcs {
> >  	 * For atomic drivers the adjusted_mode is the mode stored in
> >  	 * &drm_crtc_state.adjusted_mode.
> >  	 *
> > -	 * NOTE:
> > -	 *
> >  	 * If a need arises to store and access modes adjusted for other
> >  	 * locations than the connection between the CRTC and the first bridge,
> >  	 * the DRM framework will have to be extended with DRM bridge states.
> 
> The DRM framework *has* been extended with DRM bridge states :-) Should
> this be dropped ?
I dropped this while applying.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Tnanks!

	Sam
