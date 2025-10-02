Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 279E4BB49B8
	for <lists+dri-devel@lfdr.de>; Thu, 02 Oct 2025 19:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79F4110E819;
	Thu,  2 Oct 2025 17:00:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYPazlgO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9787210E1CA;
 Thu,  2 Oct 2025 17:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759424401; x=1790960401;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=GUZV8YmlzjH2/RShYbeKv2H7/Ifr0wYLQQDZqdP58hg=;
 b=PYPazlgOAv768vAXYE1RO/q7Dle+Vsf/rFoRxVI/+dMMqubcrCNR7K7K
 PgMtUH5HzcyaOt7OCLbDJojg4dAG0pLTh0P1mwY0B+gdLQORELYRWwFvD
 mPuMFVglMQsmbQYsl/EH5nav4QqnnSf1E8je+LX2EbP7gjrp3tt+ZNbTX
 s6ADilTIl9GRB2VJDx8cSZipkQBWlwHZoCBuK2C/OgcMd/kDY1qB50XRs
 sh5eG6j5P8iG86lpK9CcH64325LSHXh+i+caKvZ62IDLYCAqFzUwL99Zu
 Ceck2OrZ83v18FfnjtmfGZUpbJAW17Og2ZS3SsB8aV8pN4DnOxbthzB9P w==;
X-CSE-ConnectionGUID: 8EvN77s9S92WVqsZf+41xQ==
X-CSE-MsgGUID: EsnZEvwIQWmeOo4DQ5fFsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="79138651"
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="79138651"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 10:00:00 -0700
X-CSE-ConnectionGUID: EMqVWqnuTA+mZUl+yGD9ng==
X-CSE-MsgGUID: 0ejGAm0WTWyO4bgIcrxGFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,310,1751266800"; d="scan'208";a="183488996"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.245.245.228])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 09:59:56 -0700
Date: Thu, 2 Oct 2025 19:59:54 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Alexandr Sapozhnkiov <alsp705@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 lvc-project@linuxtesting.org
Subject: Re: [PATCH 5.10] gpu/i915: fix error return in mmap_offset_attach()
Message-ID: <aN6vivjT61-MXVlt@intel.com>
References: <20251002084828.11-1-alsp705@gmail.com>
 <aN6EbmgZYchyMHRn@intel.com> <aN6YVtnJ3Guh43n5@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aN6YVtnJ3Guh43n5@intel.com>
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

On Thu, Oct 02, 2025 at 06:20:54PM +0300, Ville Syrjälä wrote:
> On Thu, Oct 02, 2025 at 09:55:58AM -0400, Rodrigo Vivi wrote:
> > On Thu, Oct 02, 2025 at 11:48:26AM +0300, Alexandr Sapozhnkiov wrote:
> > > From: Alexandr Sapozhnikov <alsp705@gmail.com>
> > 
> > About the subject, this is not just a 5.10 kernel issue.
> > This code is the current code in our tip.
> > So this needs to target drm-tip branch, and then Cc stable
> > and perhaps a Fixes: tag.
> > 
> > > 
> > > In the drm_vma_node_allow function, kmalloc may 
> > > return NULL, in which case the file element will not be 
> > > added to the mmo->vma_node list. It would be good to 
> > > not ignore this event, but at least log an error message.
> > > 
> > > Found by Linux Verification Center (linuxtesting.org) with SVACE.
> > > 
> > > Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
> > > ---
> > >  drivers/gpu/drm/i915/gem/i915_gem_mman.c | 7 +++++--
> > >  1 file changed, 5 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_mman.c b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > index a2195e28b625..adaef8f09d59 100644
> > > --- a/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > +++ b/drivers/gpu/drm/i915/gem/i915_gem_mman.c
> > > @@ -706,8 +706,11 @@ mmap_offset_attach(struct drm_i915_gem_object *obj,
> > >  	mmo = insert_mmo(obj, mmo);
> > >  	GEM_BUG_ON(lookup_mmo(obj, mmap_type) != mmo);
> > >  out:
> > > -	if (file)
> > > -		drm_vma_node_allow_once(&mmo->vma_node, file);
> > > +	if (file) {
> > > +		err = drm_vma_node_allow_once(&mmo->vma_node, file);
> > > +		if (err)
> > 
> > perhaps we also need to drm_vma_offset_remove here?
> > I mean... honest question, doubt here. Is there any further clean-up needed?
> 
> Yeah, mmo->vma_node has already been linked to varius places here.
> So this will lead to use-after-free in short order.
> 
> With the current code if this fails then I think all that ends up
> happening is that subsequent mmap() will fail. Maybe that's just
> fine?

Hmm, or maybe it would be better to just directly return an error
here without freeing/cleaning up anything. Looks to me like that
should work fine as well, and userspace would get the error
immediately instead of later.

> 
> > 
> > > +			goto err;
> > > +	}
> > >  	return mmo;
> > >  
> > >  err:
> > > -- 
> > > 2.43.0
> > > 
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Ville Syrjälä
Intel
