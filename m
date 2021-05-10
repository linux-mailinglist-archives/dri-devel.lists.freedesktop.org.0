Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F255537938F
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 18:17:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C2D6E899;
	Mon, 10 May 2021 16:17:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B32976E8AD
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 16:16:58 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 4-20020a05600c26c4b0290146e1feccd8so9221901wmv.1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 May 2021 09:16:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=xOfrXGoSD8Bag3fhZu7oz6HeMjdmjP+Rd0BECbma6V4=;
 b=fmcQ7GaTuh49guaIZN0zwagQJwIbnNrx/bz5gats8zvgjN5JtN+h2dEB8+W7RTRhnt
 6WF36FCU4ia5vwv58EoiQoBh/Q1WkZ/GGtNBT4/fJIL/eeFff7HEtpc6DphXn7hQeWxh
 AmfYf8XnlgragFhco009iYY2r+FFkWKO5iCMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to;
 bh=xOfrXGoSD8Bag3fhZu7oz6HeMjdmjP+Rd0BECbma6V4=;
 b=IeAb/xQfyMkg8pwO7wDveTgIem26Qnt92XgBfpNo11rJX2o9+e0AwYN8MPJajjgziy
 QAWE2nLyI0zCKP9T0q3ma/JnPuAtozkp1S+tBJyS8h6Q5Noa1wLpSkTJeB3RnnQ+D3Eu
 H1P36hdTdTRH6GVqezXpg3JZZLRFI7yfbtIAcMxvrzTHGXLHYMXi+0hSyhybVsPVKVWQ
 M6V+/nB6R84oRgBQTHov222cLBrwuAG0TtsfaKZ4Jtg0anqY+7wmswtCoowOP+8YO3Am
 2EAgt3507bogYZ80NMColnKqALIXaEUZJdkMtJEuaxpUypc9mDlBznnX+w8Kb/JtiDdT
 EcEw==
X-Gm-Message-State: AOAM531uW8ZZHWCpkVinTkbexZnrPOnYC1BM6SpUQQ9N2rlWyiZo/8pz
 9mU5d0ihyJgwSYTMS9s6cxPauQ==
X-Google-Smtp-Source: ABdhPJzeBv9PNKiSCBMwLqOgwQ5dIZjhiIp5r+KpYaCnz3drhAMtYUw3tv5H1eIQHsS0Bg1l4gGNTA==
X-Received: by 2002:a7b:cb4a:: with SMTP id v10mr27090314wmj.53.1620663417407; 
 Mon, 10 May 2021 09:16:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k10sm653220wmf.0.2021.05.10.09.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 09:16:56 -0700 (PDT)
Date: Mon, 10 May 2021 18:16:54 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] drm: Fix dirtyfb stalls
Message-ID: <YJlcdrrmxlkCKOEx@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>
References: <20210508195641.397198-1-robdclark@gmail.com>
 <20210508195641.397198-2-robdclark@gmail.com>
 <YJlb3GO41hiu4pWw@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJlb3GO41hiu4pWw@phenom.ffwll.local>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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

On Mon, May 10, 2021 at 06:14:20PM +0200, Daniel Vetter wrote:
> On Sat, May 08, 2021 at 12:56:38PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> > 
> > drm_atomic_helper_dirtyfb() will end up stalling for vblank on "video
> > mode" type displays, which is pointless and unnecessary.  Add an
> > optional helper vfunc to determine if a plane is attached to a CRTC
> > that actually needs dirtyfb, and skip over them.
> > 
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> 
> So this is a bit annoying because the idea of all these "remap legacy uapi
> to atomic constructs" helpers is that they shouldn't need/use anything
> beyond what userspace also has available. So adding hacks for them feels
> really bad.
> 
> Also I feel like it's not entirely the right thing to do here either.
> We've had this problem already on the fbcon emulation side (which also
> shouldn't be able to peek behind the atomic kms uapi curtain), and the fix
> there was to have a worker which batches up all the updates and avoids any
> stalls in bad places.
> 
> Since this is for frontbuffer rendering userspace only we can probably get
> away with assuming there's only a single fb, so the implementation becomes
> pretty simple:
> 
> - 1 worker, and we keep track of a single pending fb
> - if there's already a dirty fb pending on a different fb, we stall for
>   the worker to start processing that one already (i.e. the fb we track is
>   reset to NULL)
> - if it's pending on the same fb we just toss away all the updates and go
>   with a full update, since merging the clip rects is too much work :-) I
>   think there's helpers so you could be slightly more clever and just have
>   an overall bounding box
> 
> Could probably steal most of the implementation.

Maybe we should even do all this in the common dirtyfb code, before we
call into the driver hook. Gives more symmetry in how it works between
fbcon and direct rendering userspace.
-Daniel

> 
> This approach here feels a tad too much in the hacky area ...
> 
> Thoughts?
> -Daniel
> 
> > ---
> >  drivers/gpu/drm/drm_damage_helper.c      |  8 ++++++++
> >  include/drm/drm_modeset_helper_vtables.h | 14 ++++++++++++++
> >  2 files changed, 22 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_damage_helper.c b/drivers/gpu/drm/drm_damage_helper.c
> > index 3a4126dc2520..a0bed1a2c2dc 100644
> > --- a/drivers/gpu/drm/drm_damage_helper.c
> > +++ b/drivers/gpu/drm/drm_damage_helper.c
> > @@ -211,6 +211,7 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
> >  retry:
> >  	drm_for_each_plane(plane, fb->dev) {
> >  		struct drm_plane_state *plane_state;
> > +		struct drm_crtc *crtc;
> >  
> >  		ret = drm_modeset_lock(&plane->mutex, state->acquire_ctx);
> >  		if (ret)
> > @@ -221,6 +222,13 @@ int drm_atomic_helper_dirtyfb(struct drm_framebuffer *fb,
> >  			continue;
> >  		}
> >  
> > +		crtc = plane->state->crtc;
> > +		if (crtc->helper_private->needs_dirtyfb &&
> > +				!crtc->helper_private->needs_dirtyfb(crtc)) {
> > +			drm_modeset_unlock(&plane->mutex);
> > +			continue;
> > +		}
> > +
> >  		plane_state = drm_atomic_get_plane_state(state, plane);
> >  		if (IS_ERR(plane_state)) {
> >  			ret = PTR_ERR(plane_state);
> > diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm_modeset_helper_vtables.h
> > index eb706342861d..afa8ec5754e7 100644
> > --- a/include/drm/drm_modeset_helper_vtables.h
> > +++ b/include/drm/drm_modeset_helper_vtables.h
> > @@ -487,6 +487,20 @@ struct drm_crtc_helper_funcs {
> >  				     bool in_vblank_irq, int *vpos, int *hpos,
> >  				     ktime_t *stime, ktime_t *etime,
> >  				     const struct drm_display_mode *mode);
> > +
> > +	/**
> > +	 * @needs_dirtyfb
> > +	 *
> > +	 * Optional callback used by damage helpers to determine if fb_damage_clips
> > +	 * update is needed.
> > +	 *
> > +	 * Returns:
> > +	 *
> > +	 * True if fb_damage_clips update is needed to handle DIRTYFB, False
> > +	 * otherwise.  If this callback is not implemented, then True is
> > +	 * assumed.
> > +	 */
> > +	bool (*needs_dirtyfb)(struct drm_crtc *crtc);
> >  };
> >  
> >  /**
> > -- 
> > 2.30.2
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
