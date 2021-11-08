Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2A3449789
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 16:07:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADDD96E488;
	Mon,  8 Nov 2021 15:07:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C318F6E422
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 15:07:35 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d3so27422618wrh.8
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 07:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=8lg8KwNtzJRIF513uzF4weMxv30dO7sh2j/SS7A4utc=;
 b=gH2WxC4TXVmMTZ8FaWBdkoMx6sMitJt1xb5q+GFlb35RZjVQHh94yNNPpBAwznd6YP
 DNmyz0hJ648/jX0WgR51EfL49kZqfQ8G4NJ6S6TX02fP4g7HNIpI8HCJ4GuXmNTuNhGY
 +Mf9m/PZn5sMvtBS1Q6MFahCVV7eSOVDef1qg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=8lg8KwNtzJRIF513uzF4weMxv30dO7sh2j/SS7A4utc=;
 b=03m+Y5m+flhXJP17PDwxnQBbFjSRyz07r688EBbgRt+zaI739BrusSUjfICpHo8JH3
 PLxdOA1jIOGj4LyyGfNG3R5YtetpTeSE6Fwbnsu11mljESQS/66tV88j+OND6qpmJ3OY
 K8hMpUaaIFcjON37P94eaFTb1MCiF28IXkBulDKa5Q0zeJK75w88Wue32iLdios8kLCp
 AAJOzftnwzSwxaIF4Ro1J3/Tf/AdAiZ2qgWUvOiHR8z/9fqgrk5FvCgQPeGU2oGt6ZkG
 tVWL4VVKS3qH/wzCR/lvYdBEzYGnBbtVOHUGZH0gdZEClaAhfXcoxPIvr4pR6aNo3OEG
 ayBg==
X-Gm-Message-State: AOAM530tg178OOgfxR5FJSnNPSYGmrlYs1OqhBS/peA0jSjZ1wpLHvN5
 P8/xWXi4Ucr/oLZrLHtDM4a3Cg==
X-Google-Smtp-Source: ABdhPJyfAOtPWlCa0zfg5UoxGeB6o5SqKjdUlo0CGOWzyiEOJGi6owfcMXnmG4aCLM8Z7CpCIzUqCw==
X-Received: by 2002:a5d:6a4d:: with SMTP id t13mr534564wrw.104.1636384054123; 
 Mon, 08 Nov 2021 07:07:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id z6sm17543990wrm.93.2021.11.08.07.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 07:07:33 -0800 (PST)
Date: Mon, 8 Nov 2021 16:07:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Subject: Re: [PATCH 1/2] drm/atomic: document and enforce rules around
 "spurious" EBUSY
Message-ID: <YYk9My2TFufdsgym@phenom.ffwll.local>
References: <20200925084651.3250104-1-daniel.vetter@ffwll.ch>
 <f94cd203-b0a6-bb41-8768-c64d68aac483@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f94cd203-b0a6-bb41-8768-c64d68aac483@amd.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Nov 05, 2021 at 04:47:29PM -0400, Kazlauskas, Nicholas wrote:
> Hi Daniel,
> 
> Just got bitten by this warning when trying to do some refactoring in amdgpu
> for trying to get rid of the DRM private object we use for our DC state.
> 
> From a userspace perspective I understand that we want to avoid judder,
> -EBUSY and other issues affecting the compositor from kernel having to drag
> these CRTCs (or their planes) into the atomic state.
> 
> For bandwidth validation we need to understand the state of all CRTCs and
> planes in use. Existing driver code maintains this as part of a global state
> object in a DRM private atomic state. We have stalls in atomic check (bad)
> to avoid freeing this state or modifying it at the wrong times which avoid
> hitting this warning but essentially cause the same judder issue.
> 
> While most hardware has independent pipes, I think almost all hardware ends
> up having the memory interface/bandwidth as a global shared resource that
> software state can't really abstract around.
> 
> There are cases where we know that there will be no (or minimal) impact to
> the overall memory requirements for particular DRM updates. Our validation
> already "over-allocates" for common display changes - page flips, some
> format changes, cursor enable/disable. But for most cases outside of that we
> do want to pull in _all_ the CRTCs and planes.
> 
> On our HW you won't get a blankout unless you're actually modifying a stream
> timing itself so I think the ALLOW_MODESET flag is overkill here.
> 
> Rejecting the commit when the flag isn't set also ends up breaking userspace
> in the process since it expects commits like pageflips between different
> tiling modes to succeed with the legacy IOCTLs.
> 
> Any ideas about this? I missed the IRC discussion regarding this before so
> I'm not sure if we have any alternatives that were dropped in favor of this.

We have, I while ago I had a lengthy discussion with I think Maxime about
how this is done properly. I think Maxime volunteered to type up some docs
even. tldr;

- Have some global state for this stuff (using the private state helper
  stuff ideally, handrolling very much not adviced, might even make sense
  to put some of your dc state/structs in there)

- Both the crtc/plane and the global state hold copies of your limits. The
  global state in addition also holds the current settings for your
  derived values (like clocks or allocations or whatever you have).

- Rules are that only grabbing the global state is enough to read all your
  crtc/plane requirements (since you have a read-only copy of that in your
  global state). Only for changing them do you also have to have the
  corresponding crtc/plane state. Furthermore you _only_ grab the global
  objects if the commit reasonably changes your local requirements (i.e.
  more planes or whatever).

- You might need to have a cascade here (plane -> crtc and crct -> global
  state), and/or maybe multiple different global states. Don't try to put
  everything into one, it's better to have a separate private state
  handling for each separate thing, at least generally.

- No more "we have to take all objects all the time, always", so no more
  over-locking and over-sync.

- Integrating this into DC is probably going to be "fun". Could be that
  you first need to convert a pile of the dc_ structs into driver private
  state stuff, similar in spirit to the refactor we've done for plane/crtc
  state before DC was landed.

Pls check with Maxime that this is documented somewhere as implementation
pattern (it's really common, and your aproach of "grab all crtc/plane" is
the really common wrong approach). And ofc happy to discuss how to best
solve this for DC, but maybe irc is better for that.

Cheers, Daniel

> 
> Regards,
> Nicholas Kazlauskas
> 
> On 2020-09-25 4:46 a.m., Daniel Vetter wrote:
> > When doing an atomic modeset with ALLOW_MODESET drivers are allowed to
> > pull in arbitrary other resources, including CRTCs (e.g. when
> > reconfiguring global resources).
> > 
> > But in nonblocking mode userspace has then no idea this happened,
> > which can lead to spurious EBUSY calls, both:
> > - when that other CRTC is currently busy doing a page_flip the
> >    ALLOW_MODESET commit can fail with an EBUSY
> > - on the other CRTC a normal atomic flip can fail with EBUSY because
> >    of the additional commit inserted by the kernel without userspace's
> >    knowledge
> > 
> > For blocking commits this isn't a problem, because everyone else will
> > just block until all the CRTC are reconfigured. Only thing userspace
> > can notice is the dropped frames without any reason for why frames got
> > dropped.
> > 
> > Consensus is that we need new uapi to handle this properly, but no one
> > has any idea what exactly the new uapi should look like. Since this
> > has been shipping for years already compositors need to deal no matter
> > what, so as a first step just try to enforce this across drivers
> > better with some checks.
> > 
> > v2: Add comments and a WARN_ON to enforce this only when allowed - we
> > don't want to silently convert page flips into blocking plane updates
> > just because the driver is buggy.
> > 
> > v3: Fix inverted WARN_ON (Pekka).
> > 
> > v4: Drop the uapi changes, only add a WARN_ON for now to enforce some
> > rules for drivers.
> > 
> > v5: Make the WARNING more informative (Daniel)
> > 
> > v6: Add unconditional debug output for compositor hackers to figure
> > out what's going on when they get an EBUSY (Daniel)
> > 
> > v7: Fix up old/new_crtc_state confusion for real (Pekka/Ville)
> > 
> > References: https://lists.freedesktop.org/archives/dri-devel/2018-July/182281.html
> > Bugzilla: https://gitlab.freedesktop.org/wayland/weston/-/issues/24#note_9568
> > Cc: Daniel Stone <daniel@fooishbar.org>
> > Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> > Cc: Simon Ser <contact@emersion.fr>
> > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > ---
> >   drivers/gpu/drm/drm_atomic.c | 29 +++++++++++++++++++++++++++++
> >   1 file changed, 29 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > index 58527f151984..aac9122f1da2 100644
> > --- a/drivers/gpu/drm/drm_atomic.c
> > +++ b/drivers/gpu/drm/drm_atomic.c
> > @@ -281,6 +281,10 @@ EXPORT_SYMBOL(__drm_atomic_state_free);
> >    * needed. It will also grab the relevant CRTC lock to make sure that the state
> >    * is consistent.
> >    *
> > + * WARNING: Drivers may only add new CRTC states to a @state if
> > + * drm_atomic_state.allow_modeset is set, or if it's a driver-internal commit
> > + * not created by userspace through an IOCTL call.
> > + *
> >    * Returns:
> >    *
> >    * Either the allocated state or the error code encoded into the pointer. When
> > @@ -1262,10 +1266,15 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
> >   	struct drm_crtc_state *new_crtc_state;
> >   	struct drm_connector *conn;
> >   	struct drm_connector_state *conn_state;
> > +	unsigned requested_crtc = 0;
> > +	unsigned affected_crtc = 0;
> >   	int i, ret = 0;
> >   	DRM_DEBUG_ATOMIC("checking %p\n", state);
> > +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
> > +		requested_crtc |= drm_crtc_mask(crtc);
> > +
> >   	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
> >   		ret = drm_atomic_plane_check(old_plane_state, new_plane_state);
> >   		if (ret) {
> > @@ -1313,6 +1322,26 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
> >   		}
> >   	}
> > +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
> > +		affected_crtc |= drm_crtc_mask(crtc);
> > +
> > +	/*
> > +	 * For commits that allow modesets drivers can add other CRTCs to the
> > +	 * atomic commit, e.g. when they need to reallocate global resources.
> > +	 * This can cause spurious EBUSY, which robs compositors of a very
> > +	 * effective sanity check for their drawing loop. Therefor only allow
> > +	 * drivers to add unrelated CRTC states for modeset commits.
> > +	 *
> > +	 * FIXME: Should add affected_crtc mask to the ATOMIC IOCTL as an output
> > +	 * so compositors know what's going on.
> > +	 */
> > +	if (affected_crtc != requested_crtc) {
> > +		DRM_DEBUG_ATOMIC("driver added CRTC to commit: requested 0x%x, affected 0x%0x\n",
> > +				 requested_crtc, affected_crtc);
> > +		WARN(!state->allow_modeset, "adding CRTC not allowed without modesets: requested 0x%x, affected 0x%0x\n",
> > +		     requested_crtc, affected_crtc);
> > +	}
> > +
> >   	return 0;
> >   }
> >   EXPORT_SYMBOL(drm_atomic_check_only);
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
