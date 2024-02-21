Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A82FB85D6AA
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 12:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBDC410E574;
	Wed, 21 Feb 2024 11:19:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="fDc1/12l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28A9110E574;
 Wed, 21 Feb 2024 11:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708514379; x=1740050379;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=1MPSwiBgeJuseJVQcUWyd0NCoEJbjVJDNEBxFzzf9c4=;
 b=fDc1/12lUw/PzipDK6rlRDQJ052NE7kvxlmOGh6pnvWQfYMF4qKUyb7C
 /NPIOQLZS3GrkyvqPYPc3PDvrPy2ql31TvNC7sHOTshXus8HR4wqIMy+t
 mETZnDw4n+w2S/uscmoZhokk9NzdCoLqCbKcenV5HoU0sPagpqjDjXsGy
 qSOcADvb2HS2vQFhXnqfSzCz3KKHUp4mDyPYvmjR1O887xy0Cc9pqpw14
 1QlKuzNFCfp9R/no87KQdwyXMfzhz4lELg0wciPcqP0PfFjs2t6u9/drX
 gWzYC+6bYwHbIH3FCi/H3CVHxrtesnHFA3v5zcUGc6Beu+hot21z3WRm2 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="6482719"
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="6482719"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 03:19:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,175,1705392000"; 
   d="scan'208";a="5119015"
Received: from okeles-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.246.32.195])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2024 03:19:36 -0800
Date: Wed, 21 Feb 2024 12:19:33 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 John Harrison <John.C.Harrison@intel.com>, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>
Subject: Re: [PATCH v2 2/2] drm/i915/gt: Enable only one CCS for compute
 workload
Message-ID: <ZdXcRat8OcTeVozx@ashyti-mobl2.lan>
References: <20240220143526.259109-1-andi.shyti@linux.intel.com>
 <20240220143526.259109-3-andi.shyti@linux.intel.com>
 <af007641-9705-4259-b29c-3cb78f67fc64@linux.intel.com>
 <ZdVAd3NxUNBZofts@ashyti-mobl2.lan>
 <a0f66a4d-12f9-4852-a1bb-a6d27538b436@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a0f66a4d-12f9-4852-a1bb-a6d27538b436@linux.intel.com>
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

Hi Tvrtko,

On Wed, Feb 21, 2024 at 08:19:34AM +0000, Tvrtko Ursulin wrote:
> On 21/02/2024 00:14, Andi Shyti wrote:
> > On Tue, Feb 20, 2024 at 02:48:31PM +0000, Tvrtko Ursulin wrote:
> > > On 20/02/2024 14:35, Andi Shyti wrote:
> > > > Enable only one CCS engine by default with all the compute sices
> > > 
> > > slices
> > 
> > Thanks!
> > 
> > > > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > > > index 833987015b8b..7041acc77810 100644
> > > > --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > > > +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > > > @@ -243,6 +243,15 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
> > > >    		if (engine->uabi_class == I915_NO_UABI_CLASS)
> > > >    			continue;
> > > > +		/*
> > > > +		 * Do not list and do not count CCS engines other than the first
> > > > +		 */
> > > > +		if (engine->uabi_class == I915_ENGINE_CLASS_COMPUTE &&
> > > > +		    engine->uabi_instance > 0) {
> > > > +			i915->engine_uabi_class_count[engine->uabi_class]--;
> > > > +			continue;
> > > > +		}
> > > 
> > > It's a bit ugly to decrement after increment, instead of somehow
> > > restructuring the loop to satisfy both cases more elegantly.
> > 
> > yes, agree, indeed I had a hard time here to accept this change
> > myself.
> > 
> > But moving the check above where the counter was incremented it
> > would have been much uglier.
> > 
> > This check looks ugly everywhere you place it :-)
> 
> One idea would be to introduce a separate local counter array for
> name_instance, so not use i915->engine_uabi_class_count[]. First one
> increments for every engine, second only for the exposed ones. That way
> feels wouldn't be too ugly.

Ah... you mean that whenever we change the CCS mode, we update
the indexes of the exposed engines from list of the real engines.
Will try.

My approach was to regenerate the list everytime the CCS mode was
changed, but your suggestion looks a bit simplier.

> > In any case, I'm working on a patch that is splitting this
> > function in two parts and there is some refactoring happening
> > here (for the first initialization and the dynamic update).
> > 
> > Please let me know if it's OK with you or you want me to fix it
> > in this run.
> > 
> > > And I wonder if
> > > internally (in dmesg when engine name is logged) we don't end up with ccs0
> > > ccs0 ccs0 ccs0.. for all instances.
> > 
> > I don't see this. Even in sysfs we see only one ccs. Where is it?
> 
> When you run this patch on something with two or more ccs-es, the "renamed
> ccs... to ccs.." debug logs do not all log the new name as ccs0?

it shouldn't, because the name_instance is anyway incremented
normally... anyway, I will test it.

Thanks a lot!
Andi
