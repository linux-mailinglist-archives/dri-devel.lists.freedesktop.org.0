Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2832C37ACB3
	for <lists+dri-devel@lfdr.de>; Tue, 11 May 2021 19:09:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CC296E5D1;
	Tue, 11 May 2021 17:09:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FFF6E5D1;
 Tue, 11 May 2021 17:09:27 +0000 (UTC)
IronPort-SDR: U7tEwtmcr/i8u9Dcd+DK5iLaWWnKyGaBkeEXShTm4gSLOcsGZG4/stV763H5nMrDGfwFqR471I
 GPxx/FvxmuOg==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="260759256"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="260759256"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 10:08:53 -0700
IronPort-SDR: bex332Le3gdwvTt0IYCTO2qmeYDCFFfa2PPYKuYRruwD0J4s4FqW/3rTLdbxRIuIrC1aYQei/J
 S4BQJepTCx1A==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="468999367"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 10:08:47 -0700
Date: Tue, 11 May 2021 10:01:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC PATCH 43/97] drm/i915/guc: Add lrc descriptor context
 lookup array
Message-ID: <20210511170124.GA30040@sdutt-i7>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <20210506191451.77768-44-matthew.brost@intel.com>
 <YJqiKksSqBpUDvPJ@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YJqiKksSqBpUDvPJ@phenom.ffwll.local>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: tvrtko.ursulin@intel.com, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jason.ekstrand@intel.com,
 daniele.ceraolospurio@intel.com, jon.bloomfield@intel.com,
 daniel.vetter@intel.com, john.c.harrison@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, May 11, 2021 at 05:26:34PM +0200, Daniel Vetter wrote:
> On Thu, May 06, 2021 at 12:13:57PM -0700, Matthew Brost wrote:
> > Add lrc descriptor context lookup array which can resolve the
> > intel_context from the lrc descriptor index. In addition to lookup, it
> > can determine in the lrc descriptor context is currently registered with
> > the GuC by checking if an entry for a descriptor index is present.
> > Future patches in the series will make use of this array.
> > 
> > Cc: John Harrison <john.c.harrison@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  5 +++
> >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 32 +++++++++++++++++--
> >  2 files changed, 35 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > index d84f37afb9d8..2eb6c497e43c 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > @@ -6,6 +6,8 @@
> >  #ifndef _INTEL_GUC_H_
> >  #define _INTEL_GUC_H_
> >  
> > +#include "linux/xarray.h"
> > +
> >  #include "intel_uncore.h"
> >  #include "intel_guc_fw.h"
> >  #include "intel_guc_fwif.h"
> > @@ -47,6 +49,9 @@ struct intel_guc {
> >  	struct i915_vma *lrc_desc_pool;
> >  	void *lrc_desc_pool_vaddr;
> >  
> > +	/* guc_id to intel_context lookup */
> > +	struct xarray context_lookup;
> 
> The current code sets a disastrous example, but for stuff like this it's
> always good to explain the locking, and who's holding references and how
> you're handling cycles. Since I guess the intel_context also holds the
> guc_id alive somehow.
> 

I think (?) I know what you mean by this comment. How about adding:

'If an entry in the the context_lookup is present, that means a context
associated with the guc_id is registered with the GuC. We use this xarray as a
lookup mechanism when the GuC communicate with the i915 about the context.'

> Again holds for the entire series, where it makes sense (as in we don't
> expect to rewrite the entire code anyway).

Slightly out of order but one of the last patches in the series, 'Update GuC
documentation' adds a big section of comments that attempts to clarify how all
of this code works. I likely should add a section explaining the data structures
as well.

Matt

> -Daniel
> 
> > +
> >  	/* Control params for fw initialization */
> >  	u32 params[GUC_CTL_MAX_DWORDS];
> >  
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 6acc1ef34f92..c2b6d27404b7 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -65,8 +65,6 @@ static inline struct i915_priolist *to_priolist(struct rb_node *rb)
> >  	return rb_entry(rb, struct i915_priolist, node);
> >  }
> >  
> > -/* Future patches will use this function */
> > -__attribute__ ((unused))
> >  static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
> >  {
> >  	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
> > @@ -76,6 +74,15 @@ static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
> >  	return &base[index];
> >  }
> >  
> > +static inline struct intel_context *__get_context(struct intel_guc *guc, u32 id)
> > +{
> > +	struct intel_context *ce = xa_load(&guc->context_lookup, id);
> > +
> > +	GEM_BUG_ON(id >= GUC_MAX_LRC_DESCRIPTORS);
> > +
> > +	return ce;
> > +}
> > +
> >  static int guc_lrc_desc_pool_create(struct intel_guc *guc)
> >  {
> >  	u32 size;
> > @@ -96,6 +103,25 @@ static void guc_lrc_desc_pool_destroy(struct intel_guc *guc)
> >  	i915_vma_unpin_and_release(&guc->lrc_desc_pool, I915_VMA_RELEASE_MAP);
> >  }
> >  
> > +static inline void reset_lrc_desc(struct intel_guc *guc, u32 id)
> > +{
> > +	struct guc_lrc_desc *desc = __get_lrc_desc(guc, id);
> > +
> > +	memset(desc, 0, sizeof(*desc));
> > +	xa_erase_irq(&guc->context_lookup, id);
> > +}
> > +
> > +static inline bool lrc_desc_registered(struct intel_guc *guc, u32 id)
> > +{
> > +	return __get_context(guc, id);
> > +}
> > +
> > +static inline void set_lrc_desc_registered(struct intel_guc *guc, u32 id,
> > +					   struct intel_context *ce)
> > +{
> > +	xa_store_irq(&guc->context_lookup, id, ce, GFP_ATOMIC);
> > +}
> > +
> >  static void guc_add_request(struct intel_guc *guc, struct i915_request *rq)
> >  {
> >  	/* Leaving stub as this function will be used in future patches */
> > @@ -404,6 +430,8 @@ int intel_guc_submission_init(struct intel_guc *guc)
> >  	 */
> >  	GEM_BUG_ON(!guc->lrc_desc_pool);
> >  
> > +	xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
> > +
> >  	return 0;
> >  }
> >  
> > -- 
> > 2.28.0
> > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
