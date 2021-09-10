Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7182A4060CB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 02:19:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13A8A6E947;
	Fri, 10 Sep 2021 00:19:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16F506E946;
 Fri, 10 Sep 2021 00:19:32 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10102"; a="243266400"
X-IronPort-AV: E=Sophos;i="5.85,281,1624345200"; d="scan'208";a="243266400"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 17:19:31 -0700
X-IronPort-AV: E=Sophos;i="5.85,281,1624345200"; d="scan'208";a="649158065"
Received: from jons-linux-dev-box.fm.intel.com (HELO jons-linux-dev-box)
 ([10.1.27.20])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 17:19:31 -0700
Date: Thu, 9 Sep 2021 17:14:29 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: John Harrison <john.c.harrison@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tony.ye@intel.com, zhengguo.xu@intel.com
Subject: Re: [Intel-gfx] [PATCH 02/27] drm/i915/guc: Allow flexible number of
 context ids
Message-ID: <20210910001429.GA12420@jons-linux-dev-box>
References: <20210820224446.30620-1-matthew.brost@intel.com>
 <20210820224446.30620-3-matthew.brost@intel.com>
 <29e4e25f-0296-c096-b483-de63f01daf69@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <29e4e25f-0296-c096-b483-de63f01daf69@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 09, 2021 at 03:13:29PM -0700, John Harrison wrote:
> On 8/20/2021 15:44, Matthew Brost wrote:
> > Number of available GuC contexts ids might be limited.
> > Stop referring in code to macro and use variable instead.
> > 
> > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > ---
> >   drivers/gpu/drm/i915/gt/uc/intel_guc.h            |  4 ++++
> >   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 15 +++++++++------
> >   2 files changed, 13 insertions(+), 6 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > index 112dd29a63fe..6fd2719d1b75 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> > @@ -60,6 +60,10 @@ struct intel_guc {
> >   	spinlock_t contexts_lock;
> >   	/** @guc_ids: used to allocate new guc_ids */
> >   	struct ida guc_ids;
> > +	/** @num_guc_ids: number of guc_ids that can be used */
> > +	u32 num_guc_ids;
> > +	/** @max_guc_ids: max number of guc_ids that can be used */
> > +	u32 max_guc_ids;
> How do these differ? The description needs to say how or why 'num' might be
> less than 'max'. And surely 'max' is not the count 'that can be used'? Num
> is how many can be used, but max is how many are physically possible or
> something?
>

Max is the possible per OS / PF / VF instance, while num is the current
setting. Makes more sense once SRIOV lands / if this is connected to
debugfs (e.g. only num can be set via debugfs).

Matt
 
> John.
> 
> >   	/**
> >   	 * @guc_id_list: list of intel_context with valid guc_ids but no refs
> >   	 */
> > diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > index 46158d996bf6..8235e49bb347 100644
> > --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> > @@ -344,7 +344,7 @@ static struct guc_lrc_desc *__get_lrc_desc(struct intel_guc *guc, u32 index)
> >   {
> >   	struct guc_lrc_desc *base = guc->lrc_desc_pool_vaddr;
> > -	GEM_BUG_ON(index >= GUC_MAX_LRC_DESCRIPTORS);
> > +	GEM_BUG_ON(index >= guc->max_guc_ids);
> >   	return &base[index];
> >   }
> > @@ -353,7 +353,7 @@ static struct intel_context *__get_context(struct intel_guc *guc, u32 id)
> >   {
> >   	struct intel_context *ce = xa_load(&guc->context_lookup, id);
> > -	GEM_BUG_ON(id >= GUC_MAX_LRC_DESCRIPTORS);
> > +	GEM_BUG_ON(id >= guc->max_guc_ids);
> >   	return ce;
> >   }
> > @@ -363,8 +363,7 @@ static int guc_lrc_desc_pool_create(struct intel_guc *guc)
> >   	u32 size;
> >   	int ret;
> > -	size = PAGE_ALIGN(sizeof(struct guc_lrc_desc) *
> > -			  GUC_MAX_LRC_DESCRIPTORS);
> > +	size = PAGE_ALIGN(sizeof(struct guc_lrc_desc) * guc->max_guc_ids);
> >   	ret = intel_guc_allocate_and_map_vma(guc, size, &guc->lrc_desc_pool,
> >   					     (void **)&guc->lrc_desc_pool_vaddr);
> >   	if (ret)
> > @@ -1193,7 +1192,7 @@ static void guc_submit_request(struct i915_request *rq)
> >   static int new_guc_id(struct intel_guc *guc)
> >   {
> >   	return ida_simple_get(&guc->guc_ids, 0,
> > -			      GUC_MAX_LRC_DESCRIPTORS, GFP_KERNEL |
> > +			      guc->num_guc_ids, GFP_KERNEL |
> >   			      __GFP_RETRY_MAYFAIL | __GFP_NOWARN);
> >   }
> > @@ -2704,6 +2703,8 @@ static bool __guc_submission_selected(struct intel_guc *guc)
> >   void intel_guc_submission_init_early(struct intel_guc *guc)
> >   {
> > +	guc->max_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
> > +	guc->num_guc_ids = GUC_MAX_LRC_DESCRIPTORS;
> >   	guc->submission_supported = __guc_submission_supported(guc);
> >   	guc->submission_selected = __guc_submission_selected(guc);
> >   }
> > @@ -2713,7 +2714,7 @@ g2h_context_lookup(struct intel_guc *guc, u32 desc_idx)
> >   {
> >   	struct intel_context *ce;
> > -	if (unlikely(desc_idx >= GUC_MAX_LRC_DESCRIPTORS)) {
> > +	if (unlikely(desc_idx >= guc->max_guc_ids)) {
> >   		drm_err(&guc_to_gt(guc)->i915->drm,
> >   			"Invalid desc_idx %u", desc_idx);
> >   		return NULL;
> > @@ -3063,6 +3064,8 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
> >   	drm_printf(p, "GuC Number Outstanding Submission G2H: %u\n",
> >   		   atomic_read(&guc->outstanding_submission_g2h));
> > +	drm_printf(p, "GuC Number GuC IDs: %u\n", guc->num_guc_ids);
> > +	drm_printf(p, "GuC Max GuC IDs: %u\n", guc->max_guc_ids);
> >   	drm_printf(p, "GuC tasklet count: %u\n\n",
> >   		   atomic_read(&sched_engine->tasklet.count));
> 
