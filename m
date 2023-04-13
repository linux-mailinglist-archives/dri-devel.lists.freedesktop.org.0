Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2B36E0968
	for <lists+dri-devel@lfdr.de>; Thu, 13 Apr 2023 10:54:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCB010EA88;
	Thu, 13 Apr 2023 08:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B972910EA87;
 Thu, 13 Apr 2023 08:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681376063; x=1712912063;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=tfAoIKfWayM4xmxfJpBuzkgkVCUcE32N1uH+iLjpzFk=;
 b=kfn7wsMPObZvkUr6cfLDZ24gT+RVl95eYuNcGAZGwgp4hsX1QIX4ytuc
 Coton9yF1ttCXZcUarJRePjw16lCJIjLUEpE6wHP5B9HYuOJj6CUfEno+
 1DzGWrcvDnRoxq73RR0OnS2zyzDmsTkFHEIe+HTgQ4tRYkAbHDrQZ+i71
 kOfaMXAxM7x1Yz8K+xRDuEW2wvWpBsiV0gw/0B9AloVvjFynh02Ar1mcA
 dBUvurEy8IyfN4z0yeKy5N3nrqDJ2ye8PvkZZqEr7Tvq4o5+kMY7xLKAF
 tmrNfovKJD9jWgaA8O66w5WGMJcmL9hocPbcwOhUIV2qD3FXE5IzVC0RV g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="342874521"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; d="scan'208";a="342874521"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 01:54:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="758617012"
X-IronPort-AV: E=Sophos;i="5.98,341,1673942400"; d="scan'208";a="758617012"
Received: from zbiro-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.212.144])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 01:54:19 -0700
Date: Thu, 13 Apr 2023 10:53:51 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: Re: [PATCH v5 2/5] drm/i915: Create the locked version of the
 request create
Message-ID: <ZDfDHwrNEsaiCQ7T@ashyti-mobl2.lan>
References: <20230412113308.812468-1-andi.shyti@linux.intel.com>
 <20230412113308.812468-3-andi.shyti@linux.intel.com>
 <04f9e2ac-0967-1e26-fbfc-da7ff54c9a62@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <04f9e2ac-0967-1e26-fbfc-da7ff54c9a62@intel.com>
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
Cc: Maciej Patelczyk <maciej.patelczyk@intel.com>,
 intel-gfx@lists.freedesktop.org, stable@vger.kernel.org,
 Andi Shyti <andi.shyti@kernel.org>, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Andrzej,

> > Make version of the request creation that doesn't hold any
> > lock.
> > 
> > Signed-off-by: Andi Shyti <andi.shyti@linux.intel.com>
> > Cc: stable@vger.kernel.org
> > Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> > ---
> >   drivers/gpu/drm/i915/i915_request.c | 38 +++++++++++++++++++++--------
> >   drivers/gpu/drm/i915/i915_request.h |  2 ++
> >   2 files changed, 30 insertions(+), 10 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> > index 630a732aaecca..58662360ac34e 100644
> > --- a/drivers/gpu/drm/i915/i915_request.c
> > +++ b/drivers/gpu/drm/i915/i915_request.c
> > @@ -1028,15 +1028,11 @@ __i915_request_create(struct intel_context *ce, gfp_t gfp)
> >   	return ERR_PTR(ret);
> >   }
> > -struct i915_request *
> > -i915_request_create(struct intel_context *ce)
> > +static struct i915_request *
> > +__i915_request_create_locked(struct intel_context *ce)
> >   {
> > +	struct intel_timeline *tl = ce->timeline;
> >   	struct i915_request *rq;
> > -	struct intel_timeline *tl;
> > -
> > -	tl = intel_context_timeline_lock(ce);
> > -	if (IS_ERR(tl))
> > -		return ERR_CAST(tl);
> >   	/* Move our oldest request to the slab-cache (if not in use!) */
> >   	rq = list_first_entry(&tl->requests, typeof(*rq), link);
> > @@ -1046,16 +1042,38 @@ i915_request_create(struct intel_context *ce)
> >   	intel_context_enter(ce);
> >   	rq = __i915_request_create(ce, GFP_KERNEL);
> >   	intel_context_exit(ce); /* active reference transferred to request */
> > +
> >   	if (IS_ERR(rq))
> > -		goto err_unlock;
> > +		return rq;
> >   	/* Check that we do not interrupt ourselves with a new request */
> >   	rq->cookie = lockdep_pin_lock(&tl->mutex);
> >   	return rq;
> > +}
> > +
> > +struct i915_request *
> > +i915_request_create_locked(struct intel_context *ce)
> > +{
> > +	intel_context_assert_timeline_is_locked(ce->timeline);
> > +
> > +	return __i915_request_create_locked(ce);
> > +}
> 
> I wonder if we really need to have such granularity? Leaving only
> i915_request_create_locked and removing __i915_request_create_locked would
> simplify little bit the code,
> I guess the cost of calling intel_context_assert_timeline_is_locked twice
> sometimes is not big, or maybe it can be re-arranged, up to you.

There is some usage of such granularity in patch 4. I am adding
here the throttle on the timeline. I am adding it in the
"_locked" version to avoid potential deadlocks coming from
selftests (and from realworld?).

Here I'd love to have some comments from Chris and Matt.

I might still add this in the commit message:

"i915_request_create_locked() is now empty but will be used in
later commits where a throttle on the ringspace will be executed
to ensure exclusive ownership of the timeline."

> Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Thanks!

Andi
