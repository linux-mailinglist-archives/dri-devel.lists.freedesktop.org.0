Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E748BBC5F82
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 18:12:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C6D10E190;
	Wed,  8 Oct 2025 16:12:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UEnDJEx0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5C6C10E190
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Oct 2025 16:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759939960; x=1791475960;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=mrbASxvENWAO+clv33wB/uGBnnto9P4VQRQy/cTV96U=;
 b=UEnDJEx0A69j7bBzAX8j5O3n7gZZ7DqwS5JwQ8HLt/G04tKYksMT3ptl
 jCrxRcw45k2NmP1EctIsj1op+jzCF7MnmBWmfANP5B2r6X8GVLnp9z2vL
 2rpKwa0ybjUYCWA5/rx/WjJwNv0o6WH/QIYHa2eWZzxKV0fyYUlDR05Tu
 HYesDvUHXam7BXbm95lieWZVF8t157A9/+QB2E+yfF7pF0+SgHWefQySb
 YJX2K9bR8sFe67HLU51xVAPNn/MSYekrhkiokhjWUAZEFkcFItpSixhUe
 54B7pSv6Q7fp5vaarX972zt+5weC8QHGWT1xCB5cFEcvBRHKOabyiV1Fw Q==;
X-CSE-ConnectionGUID: UWsy1GjxR5iqM8grYJdp6Q==
X-CSE-MsgGUID: gVcPwiKuToWlarRxJLFAMw==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="73242872"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="73242872"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 09:12:33 -0700
X-CSE-ConnectionGUID: yIXVc1aDR7KipG4lmgvQJw==
X-CSE-MsgGUID: c6oE+s7qTNyNx1uVSh1rhg==
X-ExtLoop1: 1
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.175])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 09:12:30 -0700
Date: Wed, 8 Oct 2025 19:12:28 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, Imre Deak <imre.deak@intel.com>
Subject: Re: [PATCH 05/16] drm/dp_mst: Switch private_obj initialization to
 reset
Message-ID: <aOaNbCo8a-DDlDAc@intel.com>
References: <20251008-drm-private-obj-reset-v1-0-805ab43ae65a@kernel.org>
 <20251008-drm-private-obj-reset-v1-5-805ab43ae65a@kernel.org>
 <aOZv88NgbjmT49N1@intel.com>
 <20251008-phenomenal-industrious-elk-eaa232@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251008-phenomenal-industrious-elk-eaa232@houat>
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

On Wed, Oct 08, 2025 at 04:53:20PM +0200, Maxime Ripard wrote:
> On Wed, Oct 08, 2025 at 05:06:43PM +0300, Ville Syrjälä wrote:
> > On Wed, Oct 08, 2025 at 02:04:03PM +0200, Maxime Ripard wrote:
> > > The DP MST implementation relies on a drm_private_obj, that is
> > > initialized by allocating and initializing a state, and then passing it
> > > to drm_private_obj_init.
> > > 
> > > Since we're gradually moving away from that pattern to the more
> > > established one relying on a reset implementation, let's migrate this
> > > instance to the new pattern.
> > > 
> > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > ---
> > >  drivers/gpu/drm/display/drm_dp_mst_topology.c | 39 ++++++++++++++++++---------
> > >  1 file changed, 26 insertions(+), 13 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > index 64e5c176d5cce9df9314f77a0b4c97662c30c070..255fbdcea9f0b6376d15439e3da1dc02be472a20 100644
> > > --- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > +++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
> > > @@ -5181,10 +5181,34 @@ static void drm_dp_mst_destroy_state(struct drm_private_obj *obj,
> > >  
> > >  	kfree(mst_state->commit_deps);
> > >  	kfree(mst_state);
> > >  }
> > >  
> > > +static void drm_dp_mst_reset(struct drm_private_obj *obj)
> > > +{
> > > +	struct drm_dp_mst_topology_mgr *mgr =
> > > +		to_dp_mst_topology_mgr(obj);
> > > +	struct drm_dp_mst_topology_state *mst_state;
> > > +
> > > +	if (obj->state) {
> > > +		drm_dp_mst_destroy_state(obj, obj->state);
> > > +		obj->state = NULL;
> > 
> > I'm not a big fan of this "free+reallocate without any way to handle
> > failures" pattern.
> > 
> > Currently i915 does not do any of this, and so there are no unhandled
> > points of failure. But the mst and tunneling changes here force it on
> > i915 as well.
> 
> A very theoretical point of failure. If I'm counting right,
> drm_dp_mst_topology_state takes 72 bytes. Any GFP_KERNEL allocation
> of less than 8 pages cannot fail.

Until you start to inject failures, or you blow up the size of the
state. You wouldn't think to check for potential NULL pointer
dereferences before doing that, nor should you have to.

I'd rather not leave potential footguns lying around intentionally.

> So, sure, it's less satisfying to look at, but that's about it. It's
> just as safe and reliable.
> 
> > I think for the common things it would be nicer to just implement
> > the reset as just that "a reset of the current state", and leave
> > the "let's play fast and loose with kmalloc() failures" to the
> > drivers that want it.
> 
> I'm sorry, but I have no idea what you mean by that. It's using the
> exact same pattern we've been using since forever for every driver
> (except, apparently, i915).

The reset() stuff was added specifically to deal with drivers
that didn't have readout. i915 has always had full readout and
never needed it.

> What would you like to change to that pattern to accomodate i915
> requirements?

I think the reset should be ideally done without reallocation,
or perhaps just don't implement reset for the things that don't
need it (mst and tunneling in this case).

-- 
Ville Syrjälä
Intel
