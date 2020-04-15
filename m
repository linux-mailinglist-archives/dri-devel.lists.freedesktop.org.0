Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 773EE1AB010
	for <lists+dri-devel@lfdr.de>; Wed, 15 Apr 2020 19:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EE26EA4B;
	Wed, 15 Apr 2020 17:49:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AA436EA4B
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 17:49:56 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id b11so945869wrs.6
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Apr 2020 10:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=9+NMYcZriQcc65a3YN4/ye07bVYy5A4lU7J+Zal4eN4=;
 b=XE+91Tv7QVHqdrr86SOFavUD5fiQBvXcE6/QAtz4pCyqTzRp68wpRbGCxeYtO6ookk
 EwuEAd3NLvh2WZoxVm8s0zWT2oU78pWb++zh5LjiVMMU7ucUHKAaaQp3JEYj01zfosUh
 Yc9vz/Gwmh+SJQp2X/xN0iWbAiVmtVpxmY8ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=9+NMYcZriQcc65a3YN4/ye07bVYy5A4lU7J+Zal4eN4=;
 b=kARP96AfDRhmci0gD05Myw2Yjln7MKxbBPZ2YsewCdh4bTSGXAaGN3he961+Ca75Sh
 v6NuiIHzCQTFQPeZIWdTF62MdK9DBIuzF+Y5NAOrwnzgSzJgMTB1ylbIXYbhOTprVCiG
 TL85tjoZNDOvmMZu9Cafu7a5Vq9igIRvn46KFFmv46yUB/Y6cvjuEB3y+ZnRrKcBs7Sq
 hSbkNoRpkEoXu5ekFJnUyPAUON4EB+MHGMW0SBdC0HppvJ53xQE23uvIWx4Y/SbsHmxW
 1MFJKYBuJWmfyLZ8yME5UDKVpHNlm3i5pxXP7uVXgEGlV+Z2qNHkSdbdzxq+QWUDk5Yx
 Eksg==
X-Gm-Message-State: AGi0PuatfnpoqrJkt8WydgGTii+OClx4skog9uW/vb7GAkOr/mYTK48v
 dpS+x7Abc5AykKp129wTkDCBMw==
X-Google-Smtp-Source: APiQypJ7M6/oByO53abtXRrNDhIv6fX8g5ocr/m4GENaFHzM6a9DdclWNSoa6p4PnZefJPpDD2chZg==
X-Received: by 2002:a5d:4452:: with SMTP id x18mr29012108wrr.231.1586972995034; 
 Wed, 15 Apr 2020 10:49:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l5sm338108wmi.22.2020.04.15.10.49.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Apr 2020 10:49:54 -0700 (PDT)
Date: Wed, 15 Apr 2020 19:49:52 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH] drm/tidss: fix crash related to accessing freed memory
Message-ID: <20200415174952.GI3456981@phenom.ffwll.local>
References: <20200415092006.26675-1-tomi.valkeinen@ti.com>
 <20200415124550.GC4758@pendragon.ideasonboard.com>
 <20200415125243.GE3456981@phenom.ffwll.local>
 <20200415130344.GD4758@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200415130344.GD4758@pendragon.ideasonboard.com>
X-Operating-System: Linux phenom 5.3.0-3-amd64 
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

On Wed, Apr 15, 2020 at 04:03:44PM +0300, Laurent Pinchart wrote:
> Hi Daniel,
> 
> On Wed, Apr 15, 2020 at 02:52:43PM +0200, Daniel Vetter wrote:
> > On Wed, Apr 15, 2020 at 03:45:50PM +0300, Laurent Pinchart wrote:
> > > On Wed, Apr 15, 2020 at 12:20:06PM +0300, Tomi Valkeinen wrote:
> > >> tidss uses devm_kzalloc to allocate DRM plane, encoder and crtc objects.
> > >> This is not correct as the lifetime of those objects should be longer
> > >> than the underlying device's.
> > >> 
> > >> When unloading tidss module, the devm_kzalloc'ed objects have already
> > >> been freed when tidss_release() is called, and the driver will accesses
> > >> freed memory possibly causing a crash, a kernel WARN, or other undefined
> > >> behavior, and also KASAN will give a bug.
> > >> 
> > >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> > >> ---
> > >>  drivers/gpu/drm/tidss/tidss_crtc.c    | 16 +++++++++++++---
> > >>  drivers/gpu/drm/tidss/tidss_encoder.c | 14 +++++++++++---
> > >>  drivers/gpu/drm/tidss/tidss_plane.c   | 24 ++++++++++++++++++------
> > >>  3 files changed, 42 insertions(+), 12 deletions(-)
> > >> 
> > >> diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
> > >> index d4ce9bab8c7e..3221a707e073 100644
> > >> --- a/drivers/gpu/drm/tidss/tidss_crtc.c
> > >> +++ b/drivers/gpu/drm/tidss/tidss_crtc.c
> > >> @@ -379,9 +379,17 @@ static struct drm_crtc_state *tidss_crtc_duplicate_state(struct drm_crtc *crtc)
> > >>  	return &state->base;
> > >>  }
> > >>  
> > >> +static void tidss_crtc_destroy(struct drm_crtc *crtc)
> > >> +{
> > >> +	struct tidss_crtc *tcrtc = to_tidss_crtc(crtc);
> > >> +
> > >> +	drm_crtc_cleanup(crtc);
> > >> +	kfree(tcrtc);
> > > 
> > > I would personally store the CRTC pointers, or embed the CRTC instances
> > > in the tidss_device structure, and free everything in the top-level
> > > tidss_release() handler, to avoid spreading the release code all around
> > > the driver. Same for planes and encoders. It may be a matter of personal
> > > taste though, but it would allow dropping the kfree() calls in
> > > individual error paths and centralize them in a single place if you
> > > store the allocated pointer in tidss_device right after allocation.
> > 
> > I'm working (well plan to at least) on some nice infrastructure so that
> > all this can be garbage collected again. I think embeddeding into the
> > top-level structure is only neat if you have a very simple device (and
> > then maybe just embed the drm_simple_kms thing). tidss didn't look quite
> > that simple, but maybe I'm missing the big picture ...
> 
> I think embedding is the best option when you have a fixed number of
> CRTCs, encoders and planes. If they're variable but reasonably bounded,
> embedding will waste a bit of memory, but massively simplify the code.
> Even with the helpers you're working on, it will save memory as devres
> allocates memory to track objects, and will certainly save CPU time too,
> so it could be a net gain in the end. That's the method I recommend if
> it can be used, but it may be a matter of taste.

For small drivers it doesn't really matter, but my experience with big
drivers is that if you smash everything into one place, you end up with
spaghetti code. In i915 we're working really hard to pull stuff out of the
massive i915 driver structure, simply to force better organization of the
code.

Separate allocations force a bit more thought about encapsulating objects
and putting code to the right place at least. That's kinda why I prefer
it.

At the end it's a tradeoff, so *shrug*
-Daniel

> 
> > Oh and on the patch:
> > 
> > Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> > 
> > >> +}
> > >> +
> > >>  static const struct drm_crtc_funcs tidss_crtc_funcs = {
> > >>  	.reset = tidss_crtc_reset,
> > >> -	.destroy = drm_crtc_cleanup,
> > >> +	.destroy = tidss_crtc_destroy,
> > >>  	.set_config = drm_atomic_helper_set_config,
> > >>  	.page_flip = drm_atomic_helper_page_flip,
> > >>  	.atomic_duplicate_state = tidss_crtc_duplicate_state,
> > >> @@ -400,7 +408,7 @@ struct tidss_crtc *tidss_crtc_create(struct tidss_device *tidss,
> > >>  	bool has_ctm = tidss->feat->vp_feat.color.has_ctm;
> > >>  	int ret;
> > >>  
> > >> -	tcrtc = devm_kzalloc(tidss->dev, sizeof(*tcrtc), GFP_KERNEL);
> > >> +	tcrtc = kzalloc(sizeof(*tcrtc), GFP_KERNEL);
> > >>  	if (!tcrtc)
> > >>  		return ERR_PTR(-ENOMEM);
> > >>  
> > >> @@ -411,8 +419,10 @@ struct tidss_crtc *tidss_crtc_create(struct tidss_device *tidss,
> > >>  
> > >>  	ret = drm_crtc_init_with_planes(&tidss->ddev, crtc, primary,
> > >>  					NULL, &tidss_crtc_funcs, NULL);
> > >> -	if (ret < 0)
> > >> +	if (ret < 0) {
> > >> +		kfree(tcrtc);
> > >>  		return ERR_PTR(ret);
> > >> +	}
> > >>  
> > >>  	drm_crtc_helper_add(crtc, &tidss_crtc_helper_funcs);
> > >>  
> > >> diff --git a/drivers/gpu/drm/tidss/tidss_encoder.c b/drivers/gpu/drm/tidss/tidss_encoder.c
> > >> index 83785b0a66a9..30bf2a65949c 100644
> > >> --- a/drivers/gpu/drm/tidss/tidss_encoder.c
> > >> +++ b/drivers/gpu/drm/tidss/tidss_encoder.c
> > >> @@ -55,12 +55,18 @@ static int tidss_encoder_atomic_check(struct drm_encoder *encoder,
> > >>  	return 0;
> > >>  }
> > >>  
> > >> +static void tidss_encoder_destroy(struct drm_encoder *encoder)
> > >> +{
> > >> +	drm_encoder_cleanup(encoder);
> > >> +	kfree(encoder);
> > >> +}
> > >> +
> > >>  static const struct drm_encoder_helper_funcs encoder_helper_funcs = {
> > >>  	.atomic_check = tidss_encoder_atomic_check,
> > >>  };
> > >>  
> > >>  static const struct drm_encoder_funcs encoder_funcs = {
> > >> -	.destroy = drm_encoder_cleanup,
> > >> +	.destroy = tidss_encoder_destroy,
> > >>  };
> > >>  
> > >>  struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
> > >> @@ -69,7 +75,7 @@ struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
> > >>  	struct drm_encoder *enc;
> > >>  	int ret;
> > >>  
> > >> -	enc = devm_kzalloc(tidss->dev, sizeof(*enc), GFP_KERNEL);
> > >> +	enc = kzalloc(sizeof(*enc), GFP_KERNEL);
> > >>  	if (!enc)
> > >>  		return ERR_PTR(-ENOMEM);
> > >>  
> > >> @@ -77,8 +83,10 @@ struct drm_encoder *tidss_encoder_create(struct tidss_device *tidss,
> > >>  
> > >>  	ret = drm_encoder_init(&tidss->ddev, enc, &encoder_funcs,
> > >>  			       encoder_type, NULL);
> > >> -	if (ret < 0)
> > >> +	if (ret < 0) {
> > >> +		kfree(enc);
> > >>  		return ERR_PTR(ret);
> > >> +	}
> > >>  
> > >>  	drm_encoder_helper_add(enc, &encoder_helper_funcs);
> > >>  
> > >> diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
> > >> index ff99b2dd4a17..798488948fc5 100644
> > >> --- a/drivers/gpu/drm/tidss/tidss_plane.c
> > >> +++ b/drivers/gpu/drm/tidss/tidss_plane.c
> > >> @@ -141,6 +141,14 @@ static void tidss_plane_atomic_disable(struct drm_plane *plane,
> > >>  	dispc_plane_enable(tidss->dispc, tplane->hw_plane_id, false);
> > >>  }
> > >>  
> > >> +static void drm_plane_destroy(struct drm_plane *plane)
> > >> +{
> > >> +	struct tidss_plane *tplane = to_tidss_plane(plane);
> > >> +
> > >> +	drm_plane_cleanup(plane);
> > >> +	kfree(tplane);
> > >> +}
> > >> +
> > >>  static const struct drm_plane_helper_funcs tidss_plane_helper_funcs = {
> > >>  	.atomic_check = tidss_plane_atomic_check,
> > >>  	.atomic_update = tidss_plane_atomic_update,
> > >> @@ -151,7 +159,7 @@ static const struct drm_plane_funcs tidss_plane_funcs = {
> > >>  	.update_plane = drm_atomic_helper_update_plane,
> > >>  	.disable_plane = drm_atomic_helper_disable_plane,
> > >>  	.reset = drm_atomic_helper_plane_reset,
> > >> -	.destroy = drm_plane_cleanup,
> > >> +	.destroy = drm_plane_destroy,
> > >>  	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
> > >>  	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
> > >>  };
> > >> @@ -175,7 +183,7 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
> > >>  			   BIT(DRM_MODE_BLEND_COVERAGE));
> > >>  	int ret;
> > >>  
> > >> -	tplane = devm_kzalloc(tidss->dev, sizeof(*tplane), GFP_KERNEL);
> > >> +	tplane = kzalloc(sizeof(*tplane), GFP_KERNEL);
> > >>  	if (!tplane)
> > >>  		return ERR_PTR(-ENOMEM);
> > >>  
> > >> @@ -190,7 +198,7 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
> > >>  				       formats, num_formats,
> > >>  				       NULL, type, NULL);
> > >>  	if (ret < 0)
> > >> -		return ERR_PTR(ret);
> > >> +		goto err;
> > >>  
> > >>  	drm_plane_helper_add(&tplane->plane, &tidss_plane_helper_funcs);
> > >>  
> > >> @@ -203,15 +211,19 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
> > >>  						default_encoding,
> > >>  						default_range);
> > >>  	if (ret)
> > >> -		return ERR_PTR(ret);
> > >> +		goto err;
> > >>  
> > >>  	ret = drm_plane_create_alpha_property(&tplane->plane);
> > >>  	if (ret)
> > >> -		return ERR_PTR(ret);
> > >> +		goto err;
> > >>  
> > >>  	ret = drm_plane_create_blend_mode_property(&tplane->plane, blend_modes);
> > >>  	if (ret)
> > >> -		return ERR_PTR(ret);
> > >> +		goto err;
> > >>  
> > >>  	return tplane;
> > >> +
> > >> +err:
> > >> +	kfree(tplane);
> > >> +	return ERR_PTR(ret);
> > >>  }
> 
> -- 
> Regards,
> 
> Laurent Pinchart

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
