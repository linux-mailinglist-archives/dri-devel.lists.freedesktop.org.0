Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A381A330ED
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2025 21:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A983F10E996;
	Wed, 12 Feb 2025 20:42:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SN2eDK+U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADBA910E995;
 Wed, 12 Feb 2025 20:42:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739392942; x=1770928942;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=G949k47BQ59Ddu4Ib69MqAGwtXUH4eybAA242BJpunI=;
 b=SN2eDK+U7cyCekK9Pre1MkY4nzjf7vcUAg0yywgoo+wBdIiTUM6SOvew
 a1BmagmjhKSmBpJdgPFLO/3tJTY9xHaYew2Q6vOFwGG1cYZppUe2TxtlI
 LRkVRS9vvMHbNyYUN71nevdiT7isuLnXu+cuZTNBLKrdHagNaf3PRHn7x
 Dy1p/DO3ivdcvxemJ+rOyhmsCUcJEJRA4gU5BCGYXh8VOvu3wRlO03i27
 eJEDx8I0BvrL0fu342ec2V0xYeowEWWR3kpHUXPlZ2ZlMaPEwNRbsfaD3
 ISEJLlAcP+GJOIKtctgmZ9HBiLWODTbRFWEmgCKrbNyqqoAptQduXrnmL A==;
X-CSE-ConnectionGUID: A0pohnafTxi2+qXjNTV5sQ==
X-CSE-MsgGUID: NarwiVa+RSawvAFdm5VCCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11343"; a="39934032"
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="39934032"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2025 12:42:21 -0800
X-CSE-ConnectionGUID: tQ3dtcUQQQm2Cf4YKDBnuQ==
X-CSE-MsgGUID: 8xQ3d6QpTPeznL5PN869dg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,281,1732608000"; d="scan'208";a="113129013"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 12 Feb 2025 12:42:18 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Feb 2025 22:42:17 +0200
Date: Wed, 12 Feb 2025 22:42:17 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: "Govindapillai, Vinod" <vinod.govindapillai@intel.com>
Cc: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "Reddy Guddati, Santhosh" <santhosh.reddy.guddati@intel.com>,
 "Saarinen, Jani" <jani.saarinen@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "Syrjala, Ville" <ville.syrjala@intel.com>
Subject: Re: [PATCH v7 2/7] drm/i915/xe3: update and store the plane damage
 clips
Message-ID: <Z60HqVD2Bq9bhcVq@intel.com>
References: <20250212131420.60026-1-vinod.govindapillai@intel.com>
 <20250212131420.60026-3-vinod.govindapillai@intel.com>
 <Z6zp2lzMGEevu5kr@intel.com>
 <6e7132ef52c8da1bc3ea1a781f9a56850570c762.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e7132ef52c8da1bc3ea1a781f9a56850570c762.camel@intel.com>
X-Patchwork-Hint: comment
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

On Wed, Feb 12, 2025 at 08:14:12PM +0000, Govindapillai, Vinod wrote:
> On Wed, 2025-02-12 at 20:35 +0200, Ville Syrjälä wrote:
> > On Wed, Feb 12, 2025 at 03:14:15PM +0200, Vinod Govindapillai wrote:
> > > Userspace can pass damage area clips per plane to track
> > > changes in a plane and some display components can utilze
> > > these damage clips for efficiently handling use cases like
> > > FBC, PSR etc. A merged damage area is generated and its
> > > coordinates are updated relative to viewport and HW and
> > > stored in the plane_state. This merged damage areas will be
> > > used for FBC dirty rect support in xe3 in the follow-up
> > > patch.
> > > 
> > > Big thanks to Ville Syrjala for his contribuitions in shaping
> > > up of this series.
> > > 
> > > v1: - Move damage_merged helper to cover bigjoiner case and use
> > >     the correct plane state for damage find helper (Ville)
> > >     - Damage handling code under HAS_FBC_DIRTY_RECT() so the
> > >     the related part will be executed only for xe3+
> > >     - Changed dev_priv to i915 in one of the functions
> > > 
> > > v2: - damage reported is stored in the plane state after coords
> > >       adjustmentments irrespective of fbc dirty rect support.
> > >     - Damage to be empty in case of plane not visible (Ville)
> > >     - Handle fb could be NULL and plane not visible cases (Ville)
> > > 
> > > Signed-off-by: Vinod Govindapillai <vinod.govindapillai@intel.com>
> > > ---
> > >  .../gpu/drm/i915/display/intel_atomic_plane.c | 31 +++++++++++++
> > >  .../drm/i915/display/intel_display_types.h    |  2 +
> > >  .../drm/i915/display/skl_universal_plane.c    | 46 ++++++++++++++++++-
> > >  3 files changed, 78 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > > b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > > index 8a49d87d9bd9..b4e94dd01173 100644
> > > --- a/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > > +++ b/drivers/gpu/drm/i915/display/intel_atomic_plane.c
> > > @@ -36,6 +36,7 @@
> > >  
> > >  #include <drm/drm_atomic_helper.h>
> > >  #include <drm/drm_blend.h>
> > > +#include <drm/drm_damage_helper.h>
> > >  #include <drm/drm_fourcc.h>
> > >  #include <drm/drm_gem.h>
> > >  #include <drm/drm_gem_atomic_helper.h>
> > > @@ -117,6 +118,7 @@ intel_plane_duplicate_state(struct drm_plane *plane)
> > >  	intel_state->ggtt_vma = NULL;
> > >  	intel_state->dpt_vma = NULL;
> > >  	intel_state->flags = 0;
> > > +	intel_state->damage = DRM_RECT_INIT(0, 0, 0, 0);
> > >  
> > >  	/* add reference to fb */
> > >  	if (intel_state->hw.fb)
> > > @@ -322,6 +324,27 @@ static void intel_plane_clear_hw_state(struct intel_plane_state
> > > *plane_state)
> > >  	memset(&plane_state->hw, 0, sizeof(plane_state->hw));
> > >  }
> > >  
> > > +static void
> > > +intel_plane_copy_uapi_plane_damage(struct intel_plane_state *new_plane_state,
> > > +				   const struct intel_plane_state *old_uapi_plane_state,
> > > +				   const struct intel_plane_state *new_uapi_plane_state)
> > > +{
> > > +	struct intel_display *display = to_intel_display(new_plane_state);
> > > +	struct drm_rect *damage = &new_plane_state->damage;
> > > +
> > > +	/* damage property tracking enabled from display version 12 onwards */
> > > +	if (DISPLAY_VER(display) < 12) {
> > > +		*damage = DRM_RECT_INIT(0, 0, 0, 0);
> > > +		return;
> > > +	}
> > 
> > I don't think that is needed. If we have no damage prop then the helper
> > will give us full damage.
> 
> We do this drm_plane_enable_fb_damage_clips from from display version 12 onwards.
> 
> 	if (DISPLAY_VER(display) >= 12)
> 		drm_plane_enable_fb_damage_clips(&plane->base);
> 
> There will be a dmesg warn if we call that damage helper without the enable_fb_damage_clips
> 
> "4> [44.199485] i915 0000:00:02.0: [drm] drm_plane_enable_fb_damage_clips() not called"

Sigh. This "helper" is even worse than I thought. I think we
should just roll our own. But I guess we can live with the platform
check for now. You should be able to drop the RECT_INIT though since
the rectagle will be empty already anyway.

-- 
Ville Syrjälä
Intel
