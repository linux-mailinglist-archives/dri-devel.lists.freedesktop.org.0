Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2254EE295
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 22:25:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0A210E2F4;
	Thu, 31 Mar 2022 20:25:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6F4410E18F
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 20:25:27 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id
 c190-20020a1c35c7000000b0038e37907b5bso2371715wma.0
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 13:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=lF8YailBWzKHz0tfFIR762O4DWEDlBbDJ6dZQzflsxE=;
 b=W6lA7JyIHb7hmmQuy4HUg+P01eP1tFuabLPhXIIe/0m39IPzSVN2Wpc+4m37lQbSaI
 cReXA1vSwQ0aSp+jRYb76pK15E/QJNzt6Ukf0vvD9LBSworIkBBhLodNBSOawqnWphcX
 kiTaLZ2KhMovsP4v2IecAXM/qdTg8IRJfeAJw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=lF8YailBWzKHz0tfFIR762O4DWEDlBbDJ6dZQzflsxE=;
 b=VSzHRHyt9nSTnnJbJuZ+HblGbDunHuyV+TKvVdp6pDK2V2b5Vpeq8J/kFklDiFtQUa
 Mp+BX3/JWpEB6dtK0rg6fNa3hIaj4+1QZq6FYyGq5YntPEvDRCHIqXShoyK0hGjJUQA4
 G1CAjlfNlv7zU+5t1VS+yuZUJxsdiz5kjNNDL5SRRKdhOdbh5TpmzUAlTVIqRqCXKkK7
 9Vrd1WLPvYF2grtwAnm3HYecsZXjYRIzB9CU+cof06vMjS2f7h3fX8AmY7I2bfAUJqqO
 tDq7nsz0wxZzFak1j+OyTQT0u5LltE4jUt7E61A1VBKhvnilrl5n1S/ZF6syL73xMWeq
 n3KQ==
X-Gm-Message-State: AOAM530JudUAepctCBijuC4k1uJWmL/wmqLRL0DM/T6pmoKCNp0j6M2s
 NssFlWA1arUATU35XdEbiTs6KQ==
X-Google-Smtp-Source: ABdhPJzETjZue1olK/yumc/Y7OFdRrkjF8lkRmUtyLOu1lN6dyfgDfOgaMWg8Eu5jC0KkRf7RVDIRg==
X-Received: by 2002:a05:600c:15d4:b0:38e:3eff:4a0c with SMTP id
 v20-20020a05600c15d400b0038e3eff4a0cmr6101682wmf.90.1648758326392; 
 Thu, 31 Mar 2022 13:25:26 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 m20-20020a05600c4f5400b0038b5162260csm318883wmq.23.2022.03.31.13.25.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Mar 2022 13:25:25 -0700 (PDT)
Date: Thu, 31 Mar 2022 22:25:23 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v4] drm/atomic-helpers: remove legacy_cursor_update hacks
Message-ID: <YkYOM7aTGy5f4RVp@phenom.ffwll.local>
References: <20220331130545.625721-1-maxime@cerno.tech>
 <YkWruSRsrKv+cQIB@intel.com> <YkXFVdjlPQKZumLp@phenom.ffwll.local>
 <YkXNWxjbAd5ymfcn@intel.com> <YkX84QXOXwF0BbI8@phenom.ffwll.local>
 <YkYGlugdcYOZhDwE@intel.com> <YkYI7QBobW0EQC16@phenom.ffwll.local>
 <YkYK1O7ETTxGCslm@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YkYK1O7ETTxGCslm@intel.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
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
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
 dri-devel@lists.freedesktop.org, "Kazlauskas,
 Nicholas" <nicholas.kazlauskas@amd.com>, Maxime Ripard <maxime@cerno.tech>,
 Daniel Vetter <daniel.vetter@intel.com>, mikita.lipski@amd.com,
 Phil Elwell <phil@raspberrypi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Mar 31, 2022 at 11:11:00PM +0300, Ville Syrjälä wrote:
> On Thu, Mar 31, 2022 at 10:02:53PM +0200, Daniel Vetter wrote:
> > On Thu, Mar 31, 2022 at 10:52:54PM +0300, Ville Syrjälä wrote:
> > > On Thu, Mar 31, 2022 at 09:11:29PM +0200, Daniel Vetter wrote:
> > > > On Thu, Mar 31, 2022 at 06:48:43PM +0300, Ville Syrjälä wrote:
> > > > > On Thu, Mar 31, 2022 at 05:14:29PM +0200, Daniel Vetter wrote:
> > > > > > On Thu, Mar 31, 2022 at 04:25:13PM +0300, Ville Syrjälä wrote:
> > > > > > > On Thu, Mar 31, 2022 at 03:05:45PM +0200, Maxime Ripard wrote:
> > > > > > > > From: Daniel Vetter <daniel.vetter@ffwll.ch>
> > > > > > > > 
> > > > > > > > The stuff never really worked, and leads to lots of fun because it
> > > > > > > > out-of-order frees atomic states. Which upsets KASAN, among other
> > > > > > > > things.
> > > > > > > > 
> > > > > > > > For async updates we now have a more solid solution with the
> > > > > > > > ->atomic_async_check and ->atomic_async_commit hooks. Support for that
> > > > > > > > for msm and vc4 landed. nouveau and i915 have their own commit
> > > > > > > > routines, doing something similar.
> > > > > > > > 
> > > > > > > > For everyone else it's probably better to remove the use-after-free
> > > > > > > > bug, and encourage folks to use the async support instead. The
> > > > > > > > affected drivers which register a legacy cursor plane and don't either
> > > > > > > > use the new async stuff or their own commit routine are: amdgpu,
> > > > > > > > atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and vmwgfx.
> > > > > > > > 
> > > > > > > > Inspired by an amdgpu bug report.
> > > > > > > > 
> > > > > > > > v2: Drop RFC, I think with amdgpu converted over to use
> > > > > > > > atomic_async_check/commit done in
> > > > > > > > 
> > > > > > > > commit 674e78acae0dfb4beb56132e41cbae5b60f7d662
> > > > > > > > Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > > > > > > > Date:   Wed Dec 5 14:59:07 2018 -0500
> > > > > > > > 
> > > > > > > >     drm/amd/display: Add fast path for cursor plane updates
> > > > > > > > 
> > > > > > > > we don't have any driver anymore where we have userspace expecting
> > > > > > > > solid legacy cursor support _and_ they are using the atomic helpers in
> > > > > > > > their fully glory. So we can retire this.
> > > > > > > > 
> > > > > > > > v3: Paper over msm and i915 regression. The complete_all is the only
> > > > > > > > thing missing afaict.
> > > > > > > > 
> > > > > > > > v4: Rebased on recent kernel, added extra link for vc4 bug.
> > > > > > > > 
> > > > > > > > Link: https://bugzilla.kernel.org/show_bug.cgi?id=199425
> > > > > > > > Link: https://lore.kernel.org/all/20220221134155.125447-9-maxime@cerno.tech/
> > > > > > > > Cc: mikita.lipski@amd.com
> > > > > > > > Cc: Michel Dänzer <michel@daenzer.net>
> > > > > > > > Cc: harry.wentland@amd.com
> > > > > > > > Cc: Rob Clark <robdclark@gmail.com>
> > > > > > > > Cc: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
> > > > > > > > Tested-by: Maxime Ripard <maxime@cerno.tech>
> > > > > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > > > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > > > > > ---
> > > > > > > >  drivers/gpu/drm/drm_atomic_helper.c          | 13 -------------
> > > > > > > >  drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
> > > > > > > >  drivers/gpu/drm/msm/msm_atomic.c             |  2 ++
> > > > > > > >  3 files changed, 15 insertions(+), 13 deletions(-)
> > > > > > > > 
> > > > > > > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > > > > > > > index 9603193d2fa1..a2899af82b4a 100644
> > > > > > > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > > > > > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > > > > > > @@ -1498,13 +1498,6 @@ drm_atomic_helper_wait_for_vblanks(struct drm_device *dev,
> > > > > > > >  	int i, ret;
> > > > > > > >  	unsigned int crtc_mask = 0;
> > > > > > > >  
> > > > > > > > -	 /*
> > > > > > > > -	  * Legacy cursor ioctls are completely unsynced, and userspace
> > > > > > > > -	  * relies on that (by doing tons of cursor updates).
> > > > > > > > -	  */
> > > > > > > > -	if (old_state->legacy_cursor_update)
> > > > > > > > -		return;
> > > > > > > > -
> > > > > > > >  	for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, new_crtc_state, i) {
> > > > > > > >  		if (!new_crtc_state->active)
> > > > > > > >  			continue;
> > > > > > > > @@ -2135,12 +2128,6 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
> > > > > > > >  			continue;
> > > > > > > >  		}
> > > > > > > >  
> > > > > > > > -		/* Legacy cursor updates are fully unsynced. */
> > > > > > > > -		if (state->legacy_cursor_update) {
> > > > > > > > -			complete_all(&commit->flip_done);
> > > > > > > > -			continue;
> > > > > > > > -		}
> > > > > > > > -
> > > > > > > >  		if (!new_crtc_state->event) {
> > > > > > > >  			commit->event = kzalloc(sizeof(*commit->event),
> > > > > > > >  						GFP_KERNEL);
> > > > > > > > diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> > > > > > > > index bf7ce684dd8e..bde32f5a33cb 100644
> > > > > > > > --- a/drivers/gpu/drm/i915/display/intel_display.c
> > > > > > > > +++ b/drivers/gpu/drm/i915/display/intel_display.c
> > > > > > > > @@ -8855,6 +8855,19 @@ static int intel_atomic_commit(struct drm_device *dev,
> > > > > > > >  				state->base.legacy_cursor_update = false;
> > > > > > > >  	}
> > > > > > > >  
> > > > > > > > +	/*
> > > > > > > > +	 * FIXME: Cut over to (async) commit helpers instead of hand-rolling
> > > > > > > > +	 * everything.
> > > > > > > > +	 */
> > > > > > > 
> > > > > > > Intel cursors can't even do async updates so this is rather
> > > > > > > nonsensical. What we need is some kind of reasonable mailbox
> > > > > > > support.
> > > > > > 
> > > > > > This is not the async plane update you're thinking of. i915 really should
> > > > > > switch over more to atomic helpers.
> > > > > 
> > > > > The comment should be clarified then. As is I have no real idea
> > > > > what it's trying to say.
> > > > 
> > > > Use drm_atomic_commit and only overwrite atomic_commit_tail.
> > > 
> > > You mean drm_atomic_helper_commit() I suppose?
> > > 
> > > > But I'm not
> > > > really clear why the comment isn't clear - i915 is the only driver not
> > > > using them, maybe should start to take a look when they're so unfamiliar
> > > > :-P
> > > 
> > > There are a lot of problems with that:
> > > - no uapi/hw state split so if there's anything that looks
> > >   at the state it's very likely going to get things wrong
> > > - it doesn't know anything about i915's own state objects
> > > - uses wrong workqueues
> > > 
> > > Those are the ones that immediately came to mind when I looked
> > > at it. Probably I missed some others as well.
> > 
> > Yeah and we could have fixed them in the shared code, and 5+ years ago I
> > even had patches, but i915 gem team had the idea they know better. That
> > part really needs to be fixed, and if that means redoing a bunch of
> > display work because display team didn't push back on gem team reinventing
> > all the wheels ... tough luck.
> > 
> > I suggest you get started.
> 
> I offered to do the hw/uapi split in the core. You refused it.

That should work with with atomic_commit_tail too, or at least I'm not
seeing why not.

> I raised my objection to the introduction of the single lock
> scheme for private state objects. No one was interested.

Yeah add it to the list of things i915 reinvents I guess. And as long as
you're out, you kinda don't get much of a vote. Which is why being out of
this isn't a bright idea.

> I don't think this situation is on me.

These were your examples why you can't adopt the atomic commit helpers,
and aside from the workqueue one (where i915 really should not be the only
driver doing it differently, that makes no sense at all) they're not real
reasons to not do this.

The real reasons are
- cursor code not yet adopted async plane commit
- i915_sw_fence
- ... including the boosting and everything else that i915 gem team hand
  rolled in there

And those need to be fixed eventually. And this time around not by doing
more i915 hand rolling of stuff.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
