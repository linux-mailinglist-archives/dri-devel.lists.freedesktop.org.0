Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AFB203A5E72
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 10:35:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8D2689B83;
	Mon, 14 Jun 2021 08:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA67D89AC2;
 Mon, 14 Jun 2021 08:35:36 +0000 (UTC)
IronPort-SDR: Ui0fE129qrj+D+GsmrojFyTrw1mCEW+1/1lP31UUaBfxO+0yHjkHjuMZI1NdZ8A/Bq0wvcxtBj
 vmncu9eLG6yw==
X-IronPort-AV: E=McAfee;i="6200,9189,10014"; a="192889833"
X-IronPort-AV: E=Sophos;i="5.83,272,1616482800"; d="scan'208";a="192889833"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 01:35:35 -0700
IronPort-SDR: XpjV8lHWTe5nj7tdBXAt2kzxNrfq92cxGUMU+CtUWw3JfxNta/qqdBrHIHwChTR/z8L7h8SMN5
 nQglkj2yGQvA==
X-IronPort-AV: E=Sophos;i="5.83,272,1616482800"; d="scan'208";a="403825879"
Received: from jczarnec-mobl.ger.corp.intel.com (HELO zkempczy-mobl2)
 ([10.213.0.115])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 01:35:34 -0700
Date: Mon, 14 Jun 2021 10:35:30 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Add relocation exceptions for two
 other platforms
Message-ID: <20210614083530.GB3302@zkempczy-mobl2>
References: <20210610103955.67802-1-zbigniew.kempczynski@intel.com>
 <YMIjXG1x7dwAsJxj@intel.com> <20210611060900.GA3298@zkempczy-mobl2>
 <YMMkyKf/B/9P8nFe@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YMMkyKf/B/9P8nFe@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, intel-gfx@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 11, 2021 at 04:54:32AM -0400, Rodrigo Vivi wrote:
> On Fri, Jun 11, 2021 at 08:09:00AM +0200, Zbigniew Kempczyński wrote:
> > On Thu, Jun 10, 2021 at 10:36:12AM -0400, Rodrigo Vivi wrote:
> > > On Thu, Jun 10, 2021 at 12:39:55PM +0200, Zbigniew Kempczyński wrote:
> > > > We have established previously we stop using relocations starting
> > > > from gen12 platforms with Tigerlake as an exception. We keep this
> > > > statement but we want to enable relocations conditionally for
> > > > Rocketlake and Alderlake under require_force_probe flag set.
> > > > 
> > > > Keeping relocations under require_force_probe flag is interim solution
> > > > until IGTs will be rewritten to use softpin.
> > > 
> > > hmm... to be really honest I'm not so happy that we are introducing
> > > a new criteria to the force_probe.
> > > 
> > > The criteria was to have a functional driver and not to track uapi.
> > > 
> > > But on the other hand I do recognize that the current definition
> > > of the flag allows that, because we have established that with
> > > this behavior, the "driver for new Intel graphics devices that
> > > are recognized but not properly supported by this kernel version"
> > > (as stated in the Kconfig for the DRM_I915_FORCE_PROBE).
> > > 
> > > However...
> > > 
> > > > 
> > > > v2: - remove inline from function definition (Jani)
> > > >     - fix indentation
> > > > 
> > > > v3: change to GRAPHICS_VER() (Zbigniew)
> > > > 
> > > > Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> > > > Cc: Dave Airlie <airlied@redhat.com>
> > > > Cc: Daniel Vetter <daniel.vetter@intel.com>
> > > > Cc: Jason Ekstrand <jason@jlekstrand.net>
> > > > Acked-by: Dave Airlie <airlied@redhat.com>
> > > > ---
> > > >  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 24 +++++++++++++++----
> > > >  1 file changed, 19 insertions(+), 5 deletions(-)
> > > > 
> > > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > > > index a8abc9af5ff4..30c4f0549ea0 100644
> > > > --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> > > > @@ -491,16 +491,30 @@ eb_unreserve_vma(struct eb_vma *ev)
> > > >  	ev->flags &= ~__EXEC_OBJECT_RESERVED;
> > > >  }
> > > >  
> > > > +static bool platform_has_relocs_enabled(const struct i915_execbuffer *eb)
> > > > +{
> > > > +	/*
> > > > +	 * Relocations are disallowed starting from gen12 with Tigerlake
> > > > +	 * as an exception. We allow temporarily use relocations for Rocketlake
> > > > +	 * and Alderlake when require_force_probe flag is set.
> > > > +	 */
> > > > +	if (GRAPHICS_VER(eb->i915) < 12 || IS_TIGERLAKE(eb->i915))
> > > > +		return true;
> > > > +
> > > > +	if (INTEL_INFO(eb->i915)->require_force_probe &&
> > > > +	    (IS_ROCKETLAKE(eb->i915)
> > > 
> > > This ship has sailed... RKL is not protected by this flag any longer.
> > > Should this be on the TGL side now?
> > 
> > +Lucas
> > 
> > I think no, RKL has relocations disabled so we cannot put it to TGL side.
> > So if RKL is already released then putting it under require_force_probe 
> > flag is wrong and only I can do is to remove it from that condition. 
> > There's no option to unblock RKL on IGT CI until we rewrite all the tests.
> > We have to rely then on ADL* with require_force_probe flag to check how
> > ADL will work with relocations. 
> 
> So... I'm confused now. I'm missing the point of this patch then.
> I thought the reason was to protect from any user space to attempt to
> use the relocation, unless using the force_probe temporarily only for
> these platforms.
> But if I'm understanding correctly now it is only to silence CI?!
> Is that the case?
> Is the CI noise so bad?

The point of the patch is to verify driver on ADL. IGT still uses 
relocations (we're rewriting them now but it takes time) so execbuf
on ADL just exits with failure. We're blind right now about driver
behavior and we want to address this - temporary enable relocations
on ADL (under flag) to see if driver works properly on that platform.

> 
> > 
> > > 
> > > >  || IS_ALDERLAKE_S(eb->i915) ||
> > > > +	     IS_ALDERLAKE_P(eb->i915)))
> > > 
> > > How to ensure that we will easily catch this when removing the
> > > flag?
> > > 
> > > I mean, should we have a GEM_BUG or drm_err message when these
> > > platforms in this list has not the required_force_probe?
> > 
> > I don't think we need GEM_BUG()/drm_err() - when IGT tests will support
> > both - reloc + no-reloc - then condition will be limited to:
> > 
> >         if (GRAPHICS_VER(eb->i915) < 12 || IS_TIGERLAKE(eb->i915))
> >                 return true;
> >  
> >         return false;
> > 
> > so require_force_probe condition will be deleted and we won't need it
> > anymore (IGTs will be ready).
> 
> yes...
> but then, when we remove the flag we will forget to come here and remove
> this check.

I think we won't forget - this is cherry on top of rewriting IGT -
to switch to no-reloc on ADL, so that condition disappear.

> 
> Oh, and I just thought that we might need drm_error when the protection
> doesn't exist for the platform, but also a drm_info to the user to tell
> this is a temporary accepted behavior, but that will be removed later
> 
> The concern is if any other userspace was using the flag and suddently move to a
> version without the flag, it would be considered a regression...

That means I don't understand the meaning of that flag. I thought it is
to enforce probe of driver on platform which behavior is not already 
well defined and we want to "try" driver on it. 

--
Zbigniew

> 
> > 
> > --
> > Zbigniew
> > 
> > > 
> > > > +		return true;
> > > > +
> > > > +	return false;
> > > > +}
> > > > +
> > > >  static int
> > > >  eb_validate_vma(struct i915_execbuffer *eb,
> > > >  		struct drm_i915_gem_exec_object2 *entry,
> > > >  		struct i915_vma *vma)
> > > >  {
> > > > -	/* Relocations are disallowed for all platforms after TGL-LP.  This
> > > > -	 * also covers all platforms with local memory.
> > > > -	 */
> > > > -	if (entry->relocation_count &&
> > > > -	    GRAPHICS_VER(eb->i915) >= 12 && !IS_TIGERLAKE(eb->i915))
> > > > +	if (entry->relocation_count && !platform_has_relocs_enabled(eb))
> > > >  		return -EINVAL;
> > > >  
> > > >  	if (unlikely(entry->flags & eb->invalid_flags))
> > > > -- 
> > > > 2.26.0
> > > > 
> > > > _______________________________________________
> > > > Intel-gfx mailing list
> > > > Intel-gfx@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
