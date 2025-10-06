Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D443CBBD6BB
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 11:19:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA30910E074;
	Mon,  6 Oct 2025 09:19:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EMXrMMk6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29BC110E074;
 Mon,  6 Oct 2025 09:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759742375; x=1791278375;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=JKC/5EimkENzxggy3OkTDZg7JiNle0nd2r+Rz/1WHgo=;
 b=EMXrMMk6FWPPRe5qOEp154vBGPJTVBUpBgpRGEgP+gxY5FvwmzQ+LwVm
 aBnd55MzL4lZplXmTJvewIwRp1Ioyb5kx9aOfuZJwgOedjUmxSZUWOn1B
 wkkKMPvKg0V64AUZNCYbS7lnrLihUmrMhpsr5aUakcRhVWtP8eBETM7rJ
 UJxn3B9naLqxYT3Nc0KU/zIVu/7LMsLe5XY+/2MmiAB4ak2qzQQqoli6u
 CW9s0JWRiFduzfRfQDT7q1sR4kGX6N6bVLVJ6GHV2/GHb6iUY8IDPRtQa
 /wvU0sRZpLG/5fdQxjeTcb6AG/RGKMl06nTWUFeFOfQ73xtP6o6Yu3nSh g==;
X-CSE-ConnectionGUID: RhUAKxZsSWu3SHxJ0aSmTw==
X-CSE-MsgGUID: L6pufHUHSJuH8LULQRisrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="61870749"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="61870749"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 02:19:35 -0700
X-CSE-ConnectionGUID: 3wxf5S8SRpS/EovHM+mitA==
X-CSE-MsgGUID: qepIKxbWR7KtfCeYQFzhCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,319,1751266800"; d="scan'208";a="179453568"
Received: from krybak-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.162])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Oct 2025 02:19:32 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: christian.koenig@amd.com, pstanner@redhat.com, dakr@kernel.org
Subject: Re: [RFC PATCH v2 1/4] drm/sched: Add pending job list iterator
In-Reply-To: <20251003201156.1995113-2-matthew.brost@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20251003201156.1995113-1-matthew.brost@intel.com>
 <20251003201156.1995113-2-matthew.brost@intel.com>
Date: Mon, 06 Oct 2025 12:19:29 +0300
Message-ID: <d95920d45821d0e1e73737889e3e1481102c2e3b@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Fri, 03 Oct 2025, Matthew Brost <matthew.brost@intel.com> wrote:
> Stop open coding pending job list in drivers. Add pending job list
> iterator which safely walks DRM scheduler list either locklessly
> asserting DRM scheduler is stopped or takes pending job list lock.
>
> v2:
>  - Fix checkpatch (CI)
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  include/drm/gpu_scheduler.h | 64 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 64 insertions(+)
>
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index fb88301b3c45..bb49d8b715eb 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -698,4 +698,68 @@ void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>  				   struct drm_gpu_scheduler **sched_list,
>  				   unsigned int num_sched_list);
>  
> +/* Inlines */

Do they need to be inlines for perf reasons? Otherwise, inlines just
make proper encapsulation harder, proliferate header interdependencies,
and make the incremental builds slower.

Have you tried running the header through the compiler to see if it's
self-contained?

Unfortunately, DRM_HEADER_TEST still depends on BROKEN so we don't get
that check as part of the build. :(

BR,
Jani.


> +
> +/**
> + * struct drm_sched_pending_job_iter - DRM scheduler pending job iterator state
> + * @sched: DRM scheduler associated with pending job iterator
> + * @stopped: DRM scheduler stopped state associated with pending job iterator
> + */
> +struct drm_sched_pending_job_iter {
> +	struct drm_gpu_scheduler *sched;
> +	bool stopped;
> +};
> +
> +/* Drivers should never call this directly */
> +static inline struct drm_sched_pending_job_iter
> +__drm_sched_pending_job_iter_begin(struct drm_gpu_scheduler *sched, bool stopped)
> +{
> +	struct drm_sched_pending_job_iter iter = {
> +		.sched = sched,
> +		.stopped = stopped,
> +	};
> +
> +	if (stopped)
> +		WARN_ON(!READ_ONCE(sched->pause_submit));
> +	else
> +		spin_lock(&sched->job_list_lock);
> +
> +	return iter;
> +}
> +
> +/* Drivers should never call this directly */
> +static inline void
> +__drm_sched_pending_job_iter_end(const struct drm_sched_pending_job_iter iter)
> +{
> +	if (iter.stopped)
> +		WARN_ON(!READ_ONCE(iter.sched->pause_submit));
> +	else
> +		spin_unlock(&iter.sched->job_list_lock);
> +}
> +
> +DEFINE_CLASS(drm_sched_pending_job_iter, struct drm_sched_pending_job_iter,
> +	     __drm_sched_pending_job_iter_end(_T),
> +	     __drm_sched_pending_job_iter_begin(__sched, __stopped),
> +	     struct drm_gpu_scheduler *__sched, bool __stopped);
> +static inline void
> +*class_drm_sched_pending_job_iter_lock_ptr(class_drm_sched_pending_job_iter_t *_T)
> +{return _T; }
> +#define class_drm_sched_pending_job_iter_is_conditional false
> +
> +/**
> + * drm_sched_for_each_pending_job() - Iterator for each pending job in scheduler
> + * @__job: Current pending job being iterated over
> + * @__sched: DRM scheduler to iterate over pending jobs
> + * @__entity: DRM scheduler entity to filter jobs, NULL indicates no filter
> + * @__stopped: DRM scheduler stopped state
> + *
> + * Iterator for each pending job in scheduler, filtering on an entity, and
> + * enforcing locking rules (either scheduler fully stopped or correctly takes
> + * job_list_lock).
> + */
> +#define drm_sched_for_each_pending_job(__job, __sched, __entity, __stopped)	\
> +	scoped_guard(drm_sched_pending_job_iter, (__sched), (__stopped))	\
> +		list_for_each_entry((__job), &(__sched)->pending_list, list)	\
> +			for_each_if(!(__entity) || (__job)->entity == (__entity))
> +
>  #endif

-- 
Jani Nikula, Intel
