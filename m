Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057B21AA2B6
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 15:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 046956E9DE;
	Wed, 15 Apr 2020 13:03:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CEF86E9DE
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 13:03:58 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 118BA2D1;
 Wed, 15 Apr 2020 15:03:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1586955836;
 bh=LPjiT1voMrDQdQXzURCSNeh+rheQ2Xf9K/wbwziFDVQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lrtzKsCs1oR2/dj00Qtqy4waPJFVwVUpky/0yfPHLPyBWV2eQwcHFbpyxSDHJzhlF
 v6rWeFSnMQawrbqWPsuFctoADmgBCpxyfx1GC5qmFGVntVfWUXgjpEImR/A/V6wC1x
 PNionP1KOY47rnqKSzuj/ivSV8k4b9THEg11kdoM=
Date: Wed, 15 Apr 2020 16:03:44 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/tidss: fix crash related to accessing freed memory
Message-ID: <20200415130344.GD4758@pendragon.ideasonboard.com>
References: <20200415092006.26675-1-tomi.valkeinen@ti.com>
 <20200415124550.GC4758@pendragon.ideasonboard.com>
 <20200415125243.GE3456981@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415125243.GE3456981@phenom.ffwll.local>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Wed, Apr 15, 2020 at 02:52:43PM +0200, Daniel Vetter wrote:
> On Wed, Apr 15, 2020 at 03:45:50PM +0300, Laurent Pinchart wrote:
> > On Wed, Apr 15, 2020 at 12:20:06PM +0300, Tomi Valkeinen wrote:
> >> tidss uses devm_kzalloc to allocate DRM plane, encoder and crtc objects.
> >> This is not correct as the lifetime of those objects should be longer
> >> than the underlying device's.
> >> 
> >> When unloading tidss module, the devm_kzalloc'ed objects have already
> >> been freed when tidss_release() is called, and the driver will accesses
> >> freed memory possibly causing a crash, a kernel WARN, or other undefined
> >> behavior, and also KASAN will give a bug.
> >> 
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> >> ---
> >>  drivers/gpu/drm/tidss/tidss_crtc.c    | 16 +++++++++++++---
> >>  drivers/gpu/drm/tidss/tidss_encoder.c | 14 +++++++++++---
> >>  drivers/gpu/drm/tidss/tidss_plane.c   | 24 ++++++++++++++++++------
> >>  3 files changed, 42 insertions(+), 12 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
> >> index d4ce9bab8c7e..3221a707e073 100644
> >> --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> >> +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> >> @@ -379,9 +379,17 @@ static struct drm_crtc_state *tidss_crtc_duplicate_state(struct drm_crtc *crtc)
> >>  	return &state->base;
> >>  }
> >>  
> >> +static void tidss_crtc_destroy(struct drm_crtc *crtc)
> >> +{
> >> +	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
> >> +
> >> +	drm_crtc_cleanup(crtc);
> >> +	kfree(tcrtc);
> > 
> > I would personally store the CRTC pointers, or embed the CRTC instances
> > in the tidss_device structure, and free everything in the top-level
> > tidss_release() handler, to avoid spreading the release code all around
> > the driver. Same for planes and encoders. It may be a matter of personal
> > taste though, but it would allow dropping the kfree() calls in
> > individual error paths and centralize them in a single place if you
> > store the allocated pointer in tidss_device right after allocation.
> 
> I'm working (well plan to at least) on some nice infrastructure so that
> all this can be garbage collected again. I think embeddeding into the
> top-level structure is only neat if you have a very simple device (and
> then maybe just embed the drm_simple_kms thing). tidss didn't look quite
> that simple, but maybe I'm missing the big picture ...

I think embedding is the best option when you have a fixed number of
CRTCs, encoders and planes. If they're variable but reasonably bounded,
embedding will waste a bit of memory, but massively simplify the code.
Even with the helpers you're working on, it will save memory as devres
allocates memory to track objects, and will certainly save CPU time too,
so it could be a net gain in the end. That's the method I recommend if
it can be used, but it may be a matter of taste.

> Oh and on the patch:
> 
> Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> 
> >> +}
> >> +
> >>  static const struct drm_crtc_funcs tidss_crtc_funcs = {
> >>  	.reset = tidss_crtc_reset,
> >> -	.destroy = drm_crtc_cleanup,
> >> +	.destroy = tidss_crtc_destroy,
> >>  	.set_config = drm_atomic_helper_set_config,
> >>  	.page_flip = drm_atomic_helper_page_flip,
> >>  	.atomic_duplicate_state = tidss_crtc_duplicate_state,
> >> @@ -400,7 +408,7 @@ struct tidss_crtc *tidss_crtc_create(struct tidss_device *tidss,
> >>  	bool has_ctm = tidss->feat->vp_feat.color.has_ctm;
> >>  	int ret;
> >>  
> >> -	tcrtc = devm_kzalloc(tidss->dev, sizeof(*tcrtc), GFP_KERNEL);
> >> +	tcrtc = kzalloc(sizeof(*tcrtc), GFP_KERNEL);
> >>  	if (!tcrtc)
> >>  		return ERR_PTR(-ENOMEM);
> >>  
> >> @@ -411,8 +419,10 @@ struct tidss_crtc *tidss_crtc_create(struct tidss_device *tidss,
> >>  
> >>  	ret = drm_crtc_init_with_planes(&tidss->ddev, crtc, primary,
> >>  					NULL, &tidss_crtc_funcs, NULL);
> >> -	if (ret < 0)
> >> +	if (ret < 0) {
> >> +		kfree(tcrtc);
> >>  		return ERR_PTR(ret);
> >> +	}
> >>  
> >>  	drm_crtc_helper_add(crtc, &tidss_crtc_helper_funcs);
> >>  
> >> diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
> >> index 83785b0a66a9..30bf2a65949c 100644
> >> --- a/drivers/gpu/drm/tidss/tidss_encoder.c
> >> +++ b/drivers/gpu/drm/tidss/tidss_encoder.c
> >> @@ -55,12 +55,18 @@ static int tidss_encoder_atomic_check(struct drm_encoder *encoder,
> >>  	return 0;
> >>  }
> >>  
> >> +static void tidss_encoder_destroy(struct drm_encoder *encoder)
> >> +{
> >> +	drm_encoder_cleanup(encoder);
> >> +	kfree(encoder);
> >> +}
> >> +
> >>  static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
> >>  	.atomic_check = tidss_encoder_atomic_check,
> >>  };
> >>  
> >>  static const struct drm_encoder_funcs encoder_funcs = {
> >> -	.destroy = drm_encoder_cleanup,
> >> +	.destroy = tidss_encoder_destroy,
> >>  };
> >>  
> >>  struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
> >> @@ -69,7 +75,7 @@ struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
> >>  	struct drm_encoder *enc;
> >>  	int ret;
> >>  
> >> -	enc = devm_kzalloc(tidss->dev, sizeof(*enc), GFP_KERNEL);
> >> +	enc = kzalloc(sizeof(*enc), GFP_KERNEL);
> >>  	if (!enc)
> >>  		return ERR_PTR(-ENOMEM);
> >>  
> >> @@ -77,8 +83,10 @@ struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
> >>  
> >>  	ret = drm_encoder_init(&tidss->ddev, enc, &encoder_funcs,
> >>  			       encoder_type, NULL);
> >> -	if (ret < 0)
> >> +	if (ret < 0) {
> >> +		kfree(enc);
> >>  		return ERR_PTR(ret);
> >> +	}
> >>  
> >>  	drm_encoder_helper_add(enc, &encoder_helper_funcs);
> >>  
> >> diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
> >> index ff99b2dd4a17..798488948fc5 100644
> >> --- a/drivers/gpu/drm/tidss/tidss_plane.c
> >> +++ b/drivers/gpu/drm/tidss/tidss_plane.c
> >> @@ -141,6 +141,14 @@ static void tidss_plane_atomic_disable(struct drm_plane *plane,
> >>  	dispc_plane_enable(tidss->dispc, tplane->hw_plane_id, false);
> >>  }
> >>  
> >> +static void drm_plane_destroy(struct drm_plane *plane)
> >> +{
> >> +	struct tidss_plane *tplane = to_tidss_plane(plane);
> >> +
> >> +	drm_plane_cleanup(plane);
> >> +	kfree(tplane);
> >> +}
> >> +
> >>  static const struct drm_plane_helper_funcs tidss_plane_helper_funcs = {
> >>  	.atomic_check = tidss_plane_atomic_check,
> >>  	.atomic_update = tidss_plane_atomic_update,
> >> @@ -151,7 +159,7 @@ static const struct drm_plane_funcs tidss_plane_funcs = {
> >>  	.update_plane = drm_atomic_helper_update_plane,
> >>  	.disable_plane = drm_atomic_helper_disable_plane,
> >>  	.reset = drm_atomic_helper_plane_reset,
> >> -	.destroy = drm_plane_cleanup,
> >> +	.destroy = drm_plane_destroy,
> >>  	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
> >>  	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> >>  };
> >> @@ -175,7 +183,7 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
> >>  			   BIT(DRM_MODE_BLEND_COVERAGE));
> >>  	int ret;
> >>  
> >> -	tplane = devm_kzalloc(tidss->dev, sizeof(*tplane), GFP_KERNEL);
> >> +	tplane = kzalloc(sizeof(*tplane), GFP_KERNEL);
> >>  	if (!tplane)
> >>  		return ERR_PTR(-ENOMEM);
> >>  
> >> @@ -190,7 +198,7 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
> >>  				       formats, num_formats,
> >>  				       NULL, type, NULL);
> >>  	if (ret < 0)
> >> -		return ERR_PTR(ret);
> >> +		goto err;
> >>  
> >>  	drm_plane_helper_add(&tplane->plane, &tidss_plane_helper_funcs);
> >>  
> >> @@ -203,15 +211,19 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
> >>  						default_encoding,
> >>  						default_range);
> >>  	if (ret)
> >> -		return ERR_PTR(ret);
> >> +		goto err;
> >>  
> >>  	ret = drm_plane_create_alpha_property(&tplane->plane);
> >>  	if (ret)
> >> -		return ERR_PTR(ret);
> >> +		goto err;
> >>  
> >>  	ret = drm_plane_create_blend_mode_property(&tplane->plane, blend_modes);
> >>  	if (ret)
> >> -		return ERR_PTR(ret);
> >> +		goto err;
> >>  
> >>  	return tplane;
> >> +
> >> +err:
> >> +	kfree(tplane);
> >> +	return ERR_PTR(ret);
> >>  }

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
