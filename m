Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAD244989C
	for <lists+dri-devel@lfdr.de>; Mon,  8 Nov 2021 16:41:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E24D6E0BA;
	Mon,  8 Nov 2021 15:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0621E6E128
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Nov 2021 15:41:24 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id u18so27609916wrg.5
 for <dri-devel@lists.freedesktop.org>; Mon, 08 Nov 2021 07:41:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=BbcGdi1VJoxAh1hkO0YSjG1jgeMQG4YmzEdMYGF7C/I=;
 b=R8QmR8Pxf22pdf6W3HKwUB/KTnM7qpjYvbZ1urdqfc4hGS/xSa5h39RaS8j1HKTRCr
 4KTac0DimrZMGyrH83wbQYSPkIgL/vgTsCWQC5JI6l8rJADbvoGjvjXXXpzmMKDq5L9O
 dXaRsxHjZyrwgCaeLUO84kzUSa07Ha+39P3JU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=BbcGdi1VJoxAh1hkO0YSjG1jgeMQG4YmzEdMYGF7C/I=;
 b=nKXYPLg7IlUIG8dJ/4mxpMiexlR4QS7/HtUVppqnHMTZGEqF8jZUIGfdcXwHY0lcQt
 xnpCLQtYQfmEYrllAEEFtu9syh1YRAPiQg/YF4B9Gmm8yrNdozISqLcfJiWJHLZlwXJ8
 9Q8uA14Z08s1DOiOPoP4KPBePzG1gOKHpyZjWOsaxD3o+q6Nyy9WhWdBDu/NDsFHKVY4
 klxqNzQDXXeYYLwaEg1IBAlA3lpEN+1nqKTcKSg2kc1Oir8kAUUzAkqBfYd2GoNwq5By
 ZSFtOAB2FGYgc0lPVXdmXGOZagOYFjqhJmApc9ZAOm3VnrsdNrmXTGoRBgfaSV0ZKlil
 ppVA==
X-Gm-Message-State: AOAM5303TX4OD5CmePK1m6BIsOix4YoTaHYVCnZD+K5wF+B5F/9HTlhC
 U5QE1iDnw3v+NM77QF9Y+Bqo/A==
X-Google-Smtp-Source: ABdhPJzGLVH6gmUOpEu7aNFl3PqPoiUuRhuMXma6CDkqYi+Eql6O/HACfRYIaxb2/LzSJA4+82If5A==
X-Received: by 2002:a5d:64cc:: with SMTP id f12mr107196wri.322.1636386083513; 
 Mon, 08 Nov 2021 07:41:23 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id k21sm16280113wmj.45.2021.11.08.07.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 07:41:22 -0800 (PST)
Date: Mon, 8 Nov 2021 16:41:21 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: "Kazlauskas, Nicholas" <nicholas.kazlauskas@amd.com>
Subject: Re: [PATCH 1/2] drm/atomic: document and enforce rules around
 "spurious" EBUSY
Message-ID: <YYlFISw0QZ+RBGo8@phenom.ffwll.local>
References: <20200925084651.3250104-1-daniel.vetter@ffwll.ch>
 <f94cd203-b0a6-bb41-8768-c64d68aac483@amd.com>
 <YYk9My2TFufdsgym@phenom.ffwll.local>
 <825e0cab-f1e0-4911-09aa-f340b9aa6fc2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <825e0cab-f1e0-4911-09aa-f340b9aa6fc2@amd.com>
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

On Mon, Nov 08, 2021 at 10:32:04AM -0500, Kazlauskas, Nicholas wrote:
> On 2021-11-08 10:07 a.m., Daniel Vetter wrote:
> > On Fri, Nov 05, 2021 at 04:47:29PM -0400, Kazlauskas, Nicholas wrote:
> > > Hi Daniel,
> > > 
> > > Just got bitten by this warning when trying to do some refactoring in amdgpu
> > > for trying to get rid of the DRM private object we use for our DC state.
> > > 
> > >  From a userspace perspective I understand that we want to avoid judder,
> > > -EBUSY and other issues affecting the compositor from kernel having to drag
> > > these CRTCs (or their planes) into the atomic state.
> > > 
> > > For bandwidth validation we need to understand the state of all CRTCs and
> > > planes in use. Existing driver code maintains this as part of a global state
> > > object in a DRM private atomic state. We have stalls in atomic check (bad)
> > > to avoid freeing this state or modifying it at the wrong times which avoid
> > > hitting this warning but essentially cause the same judder issue.
> > > 
> > > While most hardware has independent pipes, I think almost all hardware ends
> > > up having the memory interface/bandwidth as a global shared resource that
> > > software state can't really abstract around.
> > > 
> > > There are cases where we know that there will be no (or minimal) impact to
> > > the overall memory requirements for particular DRM updates. Our validation
> > > already "over-allocates" for common display changes - page flips, some
> > > format changes, cursor enable/disable. But for most cases outside of that we
> > > do want to pull in _all_ the CRTCs and planes.
> > > 
> > > On our HW you won't get a blankout unless you're actually modifying a stream
> > > timing itself so I think the ALLOW_MODESET flag is overkill here.
> > > 
> > > Rejecting the commit when the flag isn't set also ends up breaking userspace
> > > in the process since it expects commits like pageflips between different
> > > tiling modes to succeed with the legacy IOCTLs.
> > > 
> > > Any ideas about this? I missed the IRC discussion regarding this before so
> > > I'm not sure if we have any alternatives that were dropped in favor of this.
> > 
> > We have, I while ago I had a lengthy discussion with I think Maxime about
> > how this is done properly. I think Maxime volunteered to type up some docs
> > even. tldr;
> > 
> > - Have some global state for this stuff (using the private state helper
> >    stuff ideally, handrolling very much not adviced, might even make sense
> >    to put some of your dc state/structs in there)
> 
> This is what we do today, but DRM private objects have no synchronization
> like CRTCs do. Any time a commit modifies our bandwidth calculations we need
> to propagate those changes back up to the global state.
> 
> Read only access to the global state can be concurrent, but as soon as
> anything needs to write and update it then we need to force ordering.
> 
> The bug we had before was that competing commits could complete in a
> different order than they would be programmed to HW if they were
> non-blocking.

Yeah it's probably high time we add a drm_crtc_commit to drm private state
objects and make this work.

Also maybe rename it to drm_hw_commit or so since it's not about crtc only
anymore.

> > - Both the crtc/plane and the global state hold copies of your limits. The
> >    global state in addition also holds the current settings for your
> >    derived values (like clocks or allocations or whatever you have).
> There are per pipe limits but there are also global limits on the whole
> system.
> 
> For example, you may pass validation for a configuration applied to a single
> CRTC and plane alone. But if you were to run 4 CRTCs using that same valid
> configuration it would fail.
> 
> The resource in question here isn't a pipe, an encoder, or something of that
> nature - it's just the memory bandwidth available on the system.
> 
> On an APU you wouldn't have enough memory bandwidth to drive multiple CRTCs
> at "extreme" resolutions or refresh rates.
> 
> It also doesn't seem right to block the user from running any display at
> these modes just because you can't enable 4 identical displays at the same
> time.

Yeah this is just standard stuff. And yes you do _not_ want to force the
limit to be global / #crtcs. It must be dynamic as you enable/disable
crtcs.

So I'm a bit confused what you mean here?

> > - Rules are that only grabbing the global state is enough to read all your
> >    crtc/plane requirements (since you have a read-only copy of that in your
> >    global state). Only for changing them do you also have to have the
> >    corresponding crtc/plane state. Furthermore you _only_ grab the global
> >    objects if the commit reasonably changes your local requirements (i.e.
> >    more planes or whatever).
> > 
> > - You might need to have a cascade here (plane -> crtc and crct -> global
> >    state), and/or maybe multiple different global states. Don't try to put
> >    everything into one, it's better to have a separate private state
> >    handling for each separate thing, at least generally.
> > 
> > - No more "we have to take all objects all the time, always", so no more
> >    over-locking and over-sync.
> > 
> > - Integrating this into DC is probably going to be "fun". Could be that
> >    you first need to convert a pile of the dc_ structs into driver private
> >    state stuff, similar in spirit to the refactor we've done for plane/crtc
> >    state before DC was landed.
> 
> ...so while we can do CRTC and plane validation it doesn't seem like there's
> a good place for that global system level validation that we need to happen.

Nah, you need to do that afterwards in your dc_atomic_check, iff the
global state has been added. crtc/plane will pull the global state in if
any requirements/limits they have have changed.

Doing the global checks in the objects atomic_check callbacks wont work,
those only a) check whether limits/requirements they have changed and b)
if so, grab the right corresponding global state and update the values in
there.

> > Pls check with Maxime that this is documented somewhere as implementation
> > pattern (it's really common, and your aproach of "grab all crtc/plane" is
> > the really common wrong approach). And ofc happy to discuss how to best
> > solve this for DC, but maybe irc is better for that.
> > 
> > Cheers, Daniel
> 
> I can try and hop on IRC sometime to chat about this with you and the
> others.
> 
> Thanks for the response!

Cheers, Daniel

> 
> Regards,
> Nicholas Kazlauskas
> 
> > 
> > > 
> > > Regards,
> > > Nicholas Kazlauskas
> > > 
> > > On 2020-09-25 4:46 a.m., Daniel Vetter wrote:
> > > > When doing an atomic modeset with ALLOW_MODESET drivers are allowed to
> > > > pull in arbitrary other resources, including CRTCs (e.g. when
> > > > reconfiguring global resources).
> > > > 
> > > > But in nonblocking mode userspace has then no idea this happened,
> > > > which can lead to spurious EBUSY calls, both:
> > > > - when that other CRTC is currently busy doing a page_flip the
> > > >     ALLOW_MODESET commit can fail with an EBUSY
> > > > - on the other CRTC a normal atomic flip can fail with EBUSY because
> > > >     of the additional commit inserted by the kernel without userspace's
> > > >     knowledge
> > > > 
> > > > For blocking commits this isn't a problem, because everyone else will
> > > > just block until all the CRTC are reconfigured. Only thing userspace
> > > > can notice is the dropped frames without any reason for why frames got
> > > > dropped.
> > > > 
> > > > Consensus is that we need new uapi to handle this properly, but no one
> > > > has any idea what exactly the new uapi should look like. Since this
> > > > has been shipping for years already compositors need to deal no matter
> > > > what, so as a first step just try to enforce this across drivers
> > > > better with some checks.
> > > > 
> > > > v2: Add comments and a WARN_ON to enforce this only when allowed - we
> > > > don't want to silently convert page flips into blocking plane updates
> > > > just because the driver is buggy.
> > > > 
> > > > v3: Fix inverted WARN_ON (Pekka).
> > > > 
> > > > v4: Drop the uapi changes, only add a WARN_ON for now to enforce some
> > > > rules for drivers.
> > > > 
> > > > v5: Make the WARNING more informative (Daniel)
> > > > 
> > > > v6: Add unconditional debug output for compositor hackers to figure
> > > > out what's going on when they get an EBUSY (Daniel)
> > > > 
> > > > v7: Fix up old/new_crtc_state confusion for real (Pekka/Ville)
> > > > 
> > > > References: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2018-July%2F182281.html&amp;data=04%7C01%7Cnicholas.kazlauskas%40amd.com%7C1b07173e73194ee6563a08d9a2c97eef%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637719808574816469%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=zmfJd7M5ZnI5if%2FHM%2FYnBQdoLsWtfjwQW%2BaX0R6Hrj0%3D&amp;reserved=0
> > > > Bugzilla: https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgitlab.freedesktop.org%2Fwayland%2Fweston%2F-%2Fissues%2F24%23note_9568&amp;data=04%7C01%7Cnicholas.kazlauskas%40amd.com%7C1b07173e73194ee6563a08d9a2c97eef%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637719808574816469%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=ynHonfkaMn%2BC%2BsykK1prK%2BAXi9eg3CbIO1vbG8eNjT0%3D&amp;reserved=0
> > > > Cc: Daniel Stone <daniel@fooishbar.org>
> > > > Cc: Pekka Paalanen <pekka.paalanen@collabora.co.uk>
> > > > Cc: Simon Ser <contact@emersion.fr>
> > > > Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > ---
> > > >    drivers/gpu/drm/drm_atomic.c | 29 +++++++++++++++++++++++++++++
> > > >    1 file changed, 29 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> > > > index 58527f151984..aac9122f1da2 100644
> > > > --- a/drivers/gpu/drm/drm_atomic.c
> > > > +++ b/drivers/gpu/drm/drm_atomic.c
> > > > @@ -281,6 +281,10 @@ EXPORT_SYMBOL(__drm_atomic_state_free);
> > > >     * needed. It will also grab the relevant CRTC lock to make sure that the state
> > > >     * is consistent.
> > > >     *
> > > > + * WARNING: Drivers may only add new CRTC states to a @state if
> > > > + * drm_atomic_state.allow_modeset is set, or if it's a driver-internal commit
> > > > + * not created by userspace through an IOCTL call.
> > > > + *
> > > >     * Returns:
> > > >     *
> > > >     * Either the allocated state or the error code encoded into the pointer. When
> > > > @@ -1262,10 +1266,15 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
> > > >    	struct drm_crtc_state *new_crtc_state;
> > > >    	struct drm_connector *conn;
> > > >    	struct drm_connector_state *conn_state;
> > > > +	unsigned requested_crtc = 0;
> > > > +	unsigned affected_crtc = 0;
> > > >    	int i, ret = 0;
> > > >    	DRM_DEBUG_ATOMIC("checking %p\n", state);
> > > > +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
> > > > +		requested_crtc |= drm_crtc_mask(crtc);
> > > > +
> > > >    	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
> > > >    		ret = drm_atomic_plane_check(old_plane_state, new_plane_state);
> > > >    		if (ret) {
> > > > @@ -1313,6 +1322,26 @@ int drm_atomic_check_only(struct drm_atomic_state *state)
> > > >    		}
> > > >    	}
> > > > +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i)
> > > > +		affected_crtc |= drm_crtc_mask(crtc);
> > > > +
> > > > +	/*
> > > > +	 * For commits that allow modesets drivers can add other CRTCs to the
> > > > +	 * atomic commit, e.g. when they need to reallocate global resources.
> > > > +	 * This can cause spurious EBUSY, which robs compositors of a very
> > > > +	 * effective sanity check for their drawing loop. Therefor only allow
> > > > +	 * drivers to add unrelated CRTC states for modeset commits.
> > > > +	 *
> > > > +	 * FIXME: Should add affected_crtc mask to the ATOMIC IOCTL as an output
> > > > +	 * so compositors know what's going on.
> > > > +	 */
> > > > +	if (affected_crtc != requested_crtc) {
> > > > +		DRM_DEBUG_ATOMIC("driver added CRTC to commit: requested 0x%x, affected 0x%0x\n",
> > > > +				 requested_crtc, affected_crtc);
> > > > +		WARN(!state->allow_modeset, "adding CRTC not allowed without modesets: requested 0x%x, affected 0x%0x\n",
> > > > +		     requested_crtc, affected_crtc);
> > > > +	}
> > > > +
> > > >    	return 0;
> > > >    }
> > > >    EXPORT_SYMBOL(drm_atomic_check_only);
> > > > 
> > > 
> > 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
