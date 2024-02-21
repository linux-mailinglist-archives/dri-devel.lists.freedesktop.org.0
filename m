Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B69685CC9B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Feb 2024 01:14:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9627E10E5B9;
	Wed, 21 Feb 2024 00:14:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l5bKVO2r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD7A610E5B8;
 Wed, 21 Feb 2024 00:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708474492; x=1740010492;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=p2+aMGpVWQdd72/xp9GUR35skeNEMEQfwDisn1NrPsU=;
 b=l5bKVO2rX04MfTeF8lmvK+CD4mGDEW32Jo+m7gmCA/17CYXRvfRSwm9a
 jySc6F5aeErrKxpOH04SLzn8JLLMJJgRRbRXeFc36KAqO823FePCdmY9w
 ioOTsOABc0hjGUmC+zGfN30l/myZmG6rk4qPX0HI5UzVsVKdWAUa1V7KS
 Ow6hJNBXFnlpwpvdcmg9ePpOaLbs0J4imHyBD7MsX3QOkbnNAkTjF3a4K
 GysmtLQdj+7Wq/CNoEHLG+GLH0ysD1ZC3fFwnMmaq8RYUMDhEqwb9R9ML
 8RYld4T2in2ByrAiBCMg9fuyw2NMUXBuREmytCHpPo9Ryl5Y3loxYNRbk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10990"; a="6386892"
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="6386892"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 16:14:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,174,1705392000"; 
   d="scan'208";a="4927738"
Received: from okeles-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.246.32.195])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2024 16:14:49 -0800
Date: Wed, 21 Feb 2024 01:14:47 +0100
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
Message-ID: <ZdVAd3NxUNBZofts@ashyti-mobl2.lan>
References: <20240220143526.259109-1-andi.shyti@linux.intel.com>
 <20240220143526.259109-3-andi.shyti@linux.intel.com>
 <af007641-9705-4259-b29c-3cb78f67fc64@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af007641-9705-4259-b29c-3cb78f67fc64@linux.intel.com>
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

On Tue, Feb 20, 2024 at 02:48:31PM +0000, Tvrtko Ursulin wrote:
> On 20/02/2024 14:35, Andi Shyti wrote:
> > Enable only one CCS engine by default with all the compute sices
> 
> slices

Thanks!

> > diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > index 833987015b8b..7041acc77810 100644
> > --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> > @@ -243,6 +243,15 @@ void intel_engines_driver_register(struct drm_i915_private *i915)
> >   		if (engine->uabi_class == I915_NO_UABI_CLASS)
> >   			continue;
> > +		/*
> > +		 * Do not list and do not count CCS engines other than the first
> > +		 */
> > +		if (engine->uabi_class == I915_ENGINE_CLASS_COMPUTE &&
> > +		    engine->uabi_instance > 0) {
> > +			i915->engine_uabi_class_count[engine->uabi_class]--;
> > +			continue;
> > +		}
> 
> It's a bit ugly to decrement after increment, instead of somehow
> restructuring the loop to satisfy both cases more elegantly.

yes, agree, indeed I had a hard time here to accept this change
myself.

But moving the check above where the counter was incremented it
would have been much uglier.

This check looks ugly everywhere you place it :-)

In any case, I'm working on a patch that is splitting this
function in two parts and there is some refactoring happening
here (for the first initialization and the dynamic update).

Please let me know if it's OK with you or you want me to fix it
in this run.

> And I wonder if
> internally (in dmesg when engine name is logged) we don't end up with ccs0
> ccs0 ccs0 ccs0.. for all instances.

I don't see this. Even in sysfs we see only one ccs. Where is it?

> > +
> >   		rb_link_node(&engine->uabi_node, prev, p);
> >   		rb_insert_color(&engine->uabi_node, &i915->uabi_engines);

[...]

> > diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> > index 3baa2f54a86e..d5a5143971f5 100644
> > --- a/drivers/gpu/drm/i915/i915_query.c
> > +++ b/drivers/gpu/drm/i915/i915_query.c
> > @@ -124,6 +124,7 @@ static int query_geometry_subslices(struct drm_i915_private *i915,
> >   	return fill_topology_info(sseu, query_item, sseu->geometry_subslice_mask);
> >   }
> > +
> 
> Zap please.

yes... yes... I noticed it after sending the patch :-)

Thanks,
Andi
