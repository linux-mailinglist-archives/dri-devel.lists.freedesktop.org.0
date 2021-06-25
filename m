Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 661B03B4844
	for <lists+dri-devel@lfdr.de>; Fri, 25 Jun 2021 19:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A938B6EE20;
	Fri, 25 Jun 2021 17:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE1016EE1C;
 Fri, 25 Jun 2021 17:33:42 +0000 (UTC)
IronPort-SDR: LXleegtXJKfgr9X03XwZnQmSDh99RVM1irVySue85zJaLf79ghrDkZ4p+tfEROiZS9nYsWMWNx
 Ftvzf6UEpouA==
X-IronPort-AV: E=McAfee;i="6200,9189,10026"; a="207532695"
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="207532695"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 10:33:40 -0700
IronPort-SDR: vEJIWAhmxsMQH/fz70ULIkUEYneDWKa1ClmUc305RicCbTVLq1+CDoEUiaZvWsJgamgxh1w9P8
 82qQLw5GmZ1w==
X-IronPort-AV: E=Sophos;i="5.83,299,1616482800"; d="scan'208";a="557763660"
Received: from unknown (HELO sdutt-i7) ([10.165.21.147])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 10:33:40 -0700
Date: Fri, 25 Jun 2021 10:26:59 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: Re: [PATCH 10/47] drm/i915/guc: Add lrc descriptor context lookup
 array
Message-ID: <20210625172659.GA11719@sdutt-i7>
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-11-matthew.brost@intel.com>
 <fa12d809-0b13-b816-d36d-d251b70918a6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fa12d809-0b13-b816-d36d-d251b70918a6@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, daniele.ceraolospurio@intel.com,
 john.c.harrison@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 25, 2021 at 03:17:51PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 24.06.2021 09:04, Matthew Brost wrote:
> > Add lrc descriptor context lookup array which can resolve the
> > intel_context from the lrc descriptor index. In addition to lookup, it
> > can determine in the lrc descriptor context is currently registered with
> > the GuC by checking if an entry for a descriptor index is present.
> > Future patches in the series will make use of this array.
> 
> s/lrc/LRC
> 

I guess? lrc and LRC are used interchangeably throughout the current
code base. 

> > 
> > Cc: John Harrison <john.c.harrison@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >  drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  5 +++
> >  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 32 +++++++++++++++++--
> >  2 files changed, 35 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > index b28fa54214f2..2313d9fc087b 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > @@ -6,6 +6,8 @@
> >  #ifndef _INTEL_GUC_H_
> >  #define _INTEL_GUC_H_
> >  
> > +#include "linux/xarray.h"
> 
> #include <linux/xarray.h>
> 

Yep.

> > +
> >  #include "intel_uncore.h"
> >  #include "intel_guc_fw.h"
> >  #include "intel_guc_fwif.h"
> > @@ -46,6 +48,9 @@ struct intel_guc {
> >  	struct i915_vma *lrc_desc_pool;
> >  	void *lrc_desc_pool_vaddr;
> >  
> > +	/* guc_id to intel_context lookup */
> > +	struct xarray context_lookup;
> > +
> >  	/* Control params for fw initialization */
> >  	u32 params[GUC_CTL_MAX_DWORDS];
> 
> btw, IIRC there was idea to move most struct definitions to
> intel_guc_types.h, is this still a plan ?
> 

I don't ever recall discussing this but we can certainly do this. For
what it is worth we do introduce intel_guc_submission_types.h a bit
later. I'll make a note about intel_guc_types.h though.

Matt

> >  
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index a366890fb840..23a94a896a0b 100644
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
> > @@ -400,6 +426,8 @@ int intel_guc_submission_init(struct intel_guc *guc)
> >  	 */
> >  	GEM_BUG_ON(!guc->lrc_desc_pool);
> >  
> > +	xa_init_flags(&guc->context_lookup, XA_FLAGS_LOCK_IRQ);
> > +
> >  	return 0;
> >  }
> >  
> > 
