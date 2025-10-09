Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4BEBC9EB3
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 18:04:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C14010EAAD;
	Thu,  9 Oct 2025 16:04:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nwawPwfj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D36510EA9F
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Oct 2025 16:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760025843; x=1791561843;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=kUtizUfIe2efDM69TtiiHbA7DYqcbTxWTqdkPB8IZ4I=;
 b=nwawPwfjo5tINyLdJCytAMHb90fHVzkTuqIYf1tRCW/EOXevfRV1lhFA
 FdwX7WNUrHjoUOF90LU+pVvmvP6raAtDE2q3qQq6gUrXvCnD7H+e3PKe6
 n4YpfiP34QD6tD4+ezd4tkV90L6j0JzC5Q/FD4+0sunyDXc5PSxMJ4WGW
 gUNZQnWojqR/pUDULFQz+v9GjP0XzbN/wW4zPb2Q8WSVFBA9VwZchWiFX
 uF3ZMozPLNkwEyvwNJLEfLIhWzn6IK3d39rXBestD6Ufod/vE5gt7cAU7
 o1Ics/oYyqs8TPzByClSjMbX8I644ECM4Ua9T4GP6NDgqb7L2bq686ZQj g==;
X-CSE-ConnectionGUID: 0hvBc4QUTGqpqLADPI8FpQ==
X-CSE-MsgGUID: T6mhgLdlRfm2WGXjmgnY9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="62336420"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="62336420"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 09:04:03 -0700
X-CSE-ConnectionGUID: hOVRPuV6SCqorm9Tg+Zy+w==
X-CSE-MsgGUID: Tjni/0IIR2qfEfCUoeHzSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; d="scan'208";a="181518329"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.21])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2025 09:04:00 -0700
Date: Thu, 9 Oct 2025 19:03:57 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH 05/16] drm/dp_mst: Switch private_obj initialization to
 reset
Message-ID: <aOfc7ajsjOT5yNjN@intel.com>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
 <20251008-drm-private-obj-reset-v1-5-805ab43ae65a@kernel.org>
 <aOZv88NgbjmT49N1@intel.com>
 <20251008-phenomenal-industrious-elk-eaa232@houat>
 <aOaNbCo8a-DDlDAc@intel.com>
 <20251009-rigorous-nonchalant-cobra-f8bfa9@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251009-rigorous-nonchalant-cobra-f8bfa9@houat>
X-Patchwork-Hint: comment
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Thu, Oct 09, 2025 at 04:42:15PM +0200, Maxime Ripard wrote:
> On Wed, Oct 08, 2025 at 07:12:28PM +0300, Ville Syrjälä wrote:
> > On Wed, Oct 08, 2025 at 04:53:20PM +0200, Maxime Ripard wrote:
> > > On Wed, Oct 08, 2025 at 05:06:43PM +0300, Ville Syrjälä wrote:
> > > > On Wed, Oct 08, 2025 at 02:04:03PM +0200, Maxime Ripard wrote:
> > > > > The DP MST implementation relies on a drm_private_obj, that is
> > > > > initialized by allocating and initializing a state, and then passing it
> > > > > to drm_private_obj_init.
> > > > > 
> > > > > Since we're gradually moving away from that pattern to the more
> > > > > established one relying on a reset implementation, let's migrate this
> > > > > instance to the new pattern.
> > > > > 
> > > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > > ---
> > > > >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 39 ++++++++++++++++++---------
> > > > >  1 file changed, 26 insertions(+), 13 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > index 64e5c176d5cce9df9314f77a0b4c97662c30c070..255fbdcea9f0b6376d15439e3da1dc02be472a20 100644
> > > > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > > > @@ -5181,10 +5181,34 @@ static void drm_dp_mst_destroy_state(struct drm_private_obj *obj,
> > > > >  
> > > > >  	kfree(mst_state->commit_deps);
> > > > >  	kfree(mst_state);
> > > > >  }
> > > > >  
> > > > > +static void drm_dp_mst_reset(struct drm_private_obj *obj)
> > > > > +{
> > > > > +	struct drm_dp_mst_topology_mgr *mgr =
> > > > > +		to_dp_mst_topology_mgr(obj);
> > > > > +	struct drm_dp_mst_topology_state *mst_state;
> > > > > +
> > > > > +	if (obj->state) {
> > > > > +		drm_dp_mst_destroy_state(obj, obj->state);
> > > > > +		obj->state = NULL;
> > > > 
> > > > I'm not a big fan of this "free+reallocate without any way to handle
> > > > failures" pattern.
> > > > 
> > > > Currently i915 does not do any of this, and so there are no unhandled
> > > > points of failure. But the mst and tunneling changes here force it on
> > > > i915 as well.
> > > 
> > > A very theoretical point of failure. If I'm counting right,
> > > drm_dp_mst_topology_state takes 72 bytes. Any GFP_KERNEL allocation
> > > of less than 8 pages cannot fail.
> > 
> > Until you start to inject failures, or you blow up the size of the
> > state. You wouldn't think to check for potential NULL pointer
> > dereferences before doing that, nor should you have to.
> > 
> > I'd rather not leave potential footguns lying around intentionally.
> 
> I'm not sure it's reasonable to expect a structure to grow by three
> orders of magnitude, but we can add static build checks on the size of
> the structure if it makes you more comfortable.

I'm not really talking about any specific state structures here,
but in general. This thing should be robust even if someone needs
to add a private object with a ginormouse state.

> 
> > > So, sure, it's less satisfying to look at, but that's about it. It's
> > > just as safe and reliable.
> > > 
> > > > I think for the common things it would be nicer to just implement
> > > > the reset as just that "a reset of the current state", and leave
> > > > the "let's play fast and loose with kmalloc() failures" to the
> > > > drivers that want it.
> > > 
> > > I'm sorry, but I have no idea what you mean by that. It's using the
> > > exact same pattern we've been using since forever for every driver
> > > (except, apparently, i915).
> > 
> > The reset() stuff was added specifically to deal with drivers
> > that didn't have readout. i915 has always had full readout and
> > never needed it.
> > 
> > > What would you like to change to that pattern to accomodate i915
> > > requirements?
> > 
> > I think the reset should be ideally done without reallocation,
> > or perhaps just don't implement reset for the things that don't
> > need it (mst and tunneling in this case).
> 
> I'll be leaving aside i915 because it's quite far from actually using
> all that infrastructure. From what I understand, your main concern is
> that the drm_private_obj would be reset during a suspend, and the DP
> objs should actually persist.

With my i915 hat on, yes. That would be a functional change
you're introducing here that may or may not be good.

But in general I think simply getting rid of that unchecked 
kmalloc() would be a good idea. There's no real reason to keep it
other than being lazy and not implementing the state reset without
it.

> 
> Thomas has been floating the idea recently to create a new helper to
> supersede reset which would only reset the state itself, and not the
> hardware. If we're doing that split, I guess it would mean that we would
> need a new callback to allocate the initial state, since reset does both.
> 
> Would you feel better about creating an atomic_create_state hook or
> something?

I suppose you could add a hook for it. Sort of the initial version
of .duplicate_state() I guess.

Doesn't really need a hook though when you could just either just:
- pass the state to the init (which I guess was exactly what private
  objs did, but other object types didn't do)
- add a new function that just sets the obj->state pointer, if you
  want to hide that from the drivers a bit more
- just set the obj->state pointer by hand (which we do eg. in i915
  intel_crtc_alloc())

Or did you want to use this also after the object init somewhere?
.duplicate_state() is often implemented with a memdup() so wouldn't
really help there at least.

-- 
Ville Syrjälä
Intel
