Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F35FC3E1044
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 10:29:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 872F96E3AC;
	Thu,  5 Aug 2021 08:29:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E9146E3AC
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 08:29:14 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id o5so8227880ejy.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 01:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VlDz9mAvB5OoCcG+uWSANty00hdXqaRue4gxwEYMrd8=;
 b=KaGNhaFDdLosRipgJeJIfn2EaArVN0sIR/oFcpvUvC8Du6Dzofu99MhxuWRAGf3OgJ
 sJ7alvfVRfEX3Q1HgvOClyqwZEVyisICoPqByLpmvIoGSNIfi+ZPrlCGdaOtRRgYxlk9
 r5fFrQABy6A7ONei7GrLCYS+rrkEiwUmBz5H8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VlDz9mAvB5OoCcG+uWSANty00hdXqaRue4gxwEYMrd8=;
 b=JhvYAZe/xTlObGUtSO+uLM/Zd2s81m2flX0L9ekkWAjgj7+OkLyMf0HORu6T85mMAf
 8kykgt7UE083NN0G/DK/WbSuLp9ib1rmQ8H6IUSHMR7t7IG3v4wZ2OTaGJO9+OkA9sOu
 ujtyZ4eIzwpH39fcXSHpSz//ViHm2aRvCp2pBGANxoCw/v/gnXlt/lWOZcEAvzIIYlEF
 CvBeVzZc7qJhiAQywTVY+nNy3hxFTuKuqR0TRfkDuoSUfdLeTFLYO1zq1gfJ8suhsxxq
 XnCJ2cnaSmuDFWHBGfnJRDAEwxZ8RS6ROaK4vAxeuvueRyFg4AD9PHdd6LE8BMrQgSMQ
 0y5A==
X-Gm-Message-State: AOAM5314EnAbfpmXVTLui6O9TBCNwczCFjc37EWsU8k4yA4y2LNpR1LN
 e/pwireDdO9CFXEanRMBGxGemA==
X-Google-Smtp-Source: ABdhPJwb/DPAT/llOwI4O77ypnEkKsXetlQt1cZoQV/HzjiAiuIAIc5i9ZStMNrAJkeFAXSepvqZuA==
X-Received: by 2002:a17:906:cc57:: with SMTP id
 mm23mr3549161ejb.12.1628152152815; 
 Thu, 05 Aug 2021 01:29:12 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p16sm1945034eds.73.2021.08.05.01.29.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Aug 2021 01:29:12 -0700 (PDT)
Date: Thu, 5 Aug 2021 10:29:10 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Matthew Brost <matthew.brost@intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH 04/46] drm/i915/guc: Don't allow requests not
 ready to consume all guc_ids
Message-ID: <YQuhVr84ivLdVl2k@phenom.ffwll.local>
References: <20210803222943.27686-1-matthew.brost@intel.com>
 <20210803222943.27686-5-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803222943.27686-5-matthew.brost@intel.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Tue, Aug 03, 2021 at 03:29:01PM -0700, Matthew Brost wrote:
> Add a heuristic which checks if over half of the available guc_ids are
> currently consumed by requests not ready to be submitted. If this
> heuristic is true at request creation time (normal guc_id allocation
> location) force all submissions + guc_ids allocations to tasklet.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_context_types.h |  3 ++
>  drivers/gpu/drm/i915/gt/intel_reset.c         |  9 ++++
>  drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  1 +
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 53 +++++++++++++++++--
>  .../gpu/drm/i915/gt/uc/intel_guc_submission.h |  2 +
>  5 files changed, 65 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_context_types.h b/drivers/gpu/drm/i915/gt/intel_context_types.h
> index 8ed964ef967b..c01530d7dc67 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context_types.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context_types.h
> @@ -188,6 +188,9 @@ struct intel_context {
>  	/* Number of rq submitted without a guc_id */
>  	u16 guc_num_rq_submit_no_id;
>  
> +	/* GuC number of requests not ready */
> +	atomic_t guc_num_rq_not_ready;

atomic_t by default is unordered. This needs some giantic comments and
explainers why this is totally ok and we don't need barriers here.

I think good excuse to convert all the docs here into kerneldoc.
-Daniel

> +
>  	/*
>  	 * GuC ID link - in list when unpinned but guc_id still valid in GuC
>  	 */
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index 91200c43951f..ea763138197f 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -22,6 +22,7 @@
>  #include "intel_reset.h"
>  
>  #include "uc/intel_guc.h"
> +#include "uc/intel_guc_submission.h"
>  
>  #define RESET_MAX_RETRIES 3
>  
> @@ -850,6 +851,14 @@ static void nop_submit_request(struct i915_request *request)
>  {
>  	RQ_TRACE(request, "-EIO\n");
>  
> +	/*
> +	 * XXX: Kinda ugly to check for GuC submission here but this function is
> +	 * going away once we switch to the DRM scheduler so we can live with
> +	 * this for now.
> +	 */
> +	if (intel_engine_uses_guc(request->engine))
> +		intel_guc_decr_num_rq_not_ready(request->context);
> +
>  	request = i915_request_mark_eio(request);
>  	if (request) {
>  		i915_request_submit(request);
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> index e76579396efd..917352c9f323 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.h
> @@ -76,6 +76,7 @@ struct intel_guc {
>  	struct ida guc_ids;
>  	u32 num_guc_ids;
>  	u32 max_guc_ids;
> +	atomic_t num_guc_ids_not_ready;
>  	struct list_head guc_id_list_no_ref;
>  	struct list_head guc_id_list_unpinned;
>  
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index f42a707f60ca..ba750fc87af1 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1384,6 +1384,41 @@ static inline void queue_request(struct i915_sched_engine *sched_engine,
>  		kick_tasklet(&rq->engine->gt->uc.guc);
>  }
>  
> +/* Macro to tweak heuristic, using a simple over 50% not ready for now */
> +#define TOO_MANY_GUC_IDS_NOT_READY(avail, consumed) \
> +	((consumed) > (avail) / 2)
> +static bool too_many_guc_ids_not_ready(struct intel_guc *guc,
> +				       struct intel_context *ce)
> +{
> +	u32 available_guc_ids, guc_ids_consumed;
> +
> +	available_guc_ids = guc->num_guc_ids;
> +	guc_ids_consumed = atomic_read(&guc->num_guc_ids_not_ready);
> +
> +	if (TOO_MANY_GUC_IDS_NOT_READY(available_guc_ids, guc_ids_consumed)) {
> +		set_and_update_guc_ids_exhausted(guc);
> +		return true;
> +	}
> +
> +	return false;
> +}
> +
> +static void incr_num_rq_not_ready(struct intel_context *ce)
> +{
> +	struct intel_guc *guc = ce_to_guc(ce);
> +
> +	if (!atomic_fetch_add(1, &ce->guc_num_rq_not_ready))
> +		atomic_inc(&guc->num_guc_ids_not_ready);
> +}
> +
> +void intel_guc_decr_num_rq_not_ready(struct intel_context *ce)
> +{
> +	struct intel_guc *guc = ce_to_guc(ce);
> +
> +	if (atomic_fetch_add(-1, &ce->guc_num_rq_not_ready) == 1)
> +		atomic_dec(&guc->num_guc_ids_not_ready);
> +}
> +
>  static bool need_tasklet(struct intel_guc *guc, struct intel_context *ce)
>  {
>  	struct i915_sched_engine * const sched_engine =
> @@ -1430,6 +1465,8 @@ static void guc_submit_request(struct i915_request *rq)
>  		kick_tasklet(guc);
>  
>  	spin_unlock_irqrestore(&sched_engine->lock, flags);
> +
> +	intel_guc_decr_num_rq_not_ready(rq->context);
>  }
>  
>  static int new_guc_id(struct intel_guc *guc)
> @@ -2647,10 +2684,13 @@ static int guc_request_alloc(struct i915_request *rq)
>  	rq->reserved_space -= GUC_REQUEST_SIZE;
>  
>  	/*
> -	 * guc_ids are exhausted, don't allocate one here, defer to submission
> -	 * in the tasklet.
> +	 * guc_ids are exhausted or a heuristic is met indicating too many
> +	 * guc_ids are waiting on requests with submission dependencies (not
> +	 * ready to submit). Don't allocate one here, defer to submission in the
> +	 * tasklet.
>  	 */
> -	if (test_and_update_guc_ids_exhausted(guc)) {
> +	if (test_and_update_guc_ids_exhausted(guc) ||
> +	    too_many_guc_ids_not_ready(guc, ce)) {
>  		set_bit(I915_FENCE_FLAG_GUC_ID_NOT_PINNED, &rq->fence.flags);
>  		goto out;
>  	}
> @@ -2684,6 +2724,7 @@ static int guc_request_alloc(struct i915_request *rq)
>  		 */
>  		set_bit(I915_FENCE_FLAG_GUC_ID_NOT_PINNED, &rq->fence.flags);
>  		set_and_update_guc_ids_exhausted(guc);
> +		incr_num_rq_not_ready(ce);
>  
>  		return 0;
>  	} else if (unlikely(ret < 0)) {
> @@ -2708,6 +2749,8 @@ static int guc_request_alloc(struct i915_request *rq)
>  	clear_bit(CONTEXT_LRCA_DIRTY, &ce->flags);
>  
>  out:
> +	incr_num_rq_not_ready(ce);
> +
>  	/*
>  	 * We block all requests on this context if a G2H is pending for a
>  	 * schedule disable or context deregistration as the GuC will fail a
> @@ -3512,6 +3555,8 @@ void intel_guc_submission_print_info(struct intel_guc *guc,
>  	drm_printf(p, "GuC submit flags: 0x%04lx\n", guc->flags);
>  	drm_printf(p, "GuC total number request without guc_id: %d\n",
>  		   guc->total_num_rq_with_no_guc_id);
> +	drm_printf(p, "GuC Number GuC IDs not ready: %d\n",
> +		   atomic_read(&guc->num_guc_ids_not_ready));
>  	drm_printf(p, "GuC stall reason: %d\n", guc->submission_stall_reason);
>  	drm_printf(p, "GuC stalled request: %s\n",
>  		   yesno(guc->stalled_rq));
> @@ -3567,6 +3612,8 @@ void intel_guc_submission_print_context_info(struct intel_guc *guc,
>  			   atomic_read(&ce->pin_count));
>  		drm_printf(p, "\t\tGuC ID Ref Count: %u\n",
>  			   atomic_read(&ce->guc_id_ref));
> +		drm_printf(p, "\t\tNumber Requests Not Ready: %u\n",
> +			   atomic_read(&ce->guc_num_rq_not_ready));
>  		drm_printf(p, "\t\tSchedule State: 0x%x, 0x%x\n\n",
>  			   ce->guc_state.sched_state,
>  			   atomic_read(&ce->guc_sched_state_no_lock));
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> index c7ef44fa0c36..17af5e123b09 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.h
> @@ -51,4 +51,6 @@ static inline bool intel_guc_submission_is_used(struct intel_guc *guc)
>  	return intel_guc_is_used(guc) && intel_guc_submission_is_wanted(guc);
>  }
>  
> +void intel_guc_decr_num_rq_not_ready(struct intel_context *ce);
> +
>  #endif
> -- 
> 2.28.0
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
