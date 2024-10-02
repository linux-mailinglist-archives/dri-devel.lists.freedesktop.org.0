Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC0698D9E6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 16:15:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D9B10E75D;
	Wed,  2 Oct 2024 14:15:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C6RQ6IGP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B5CD10E75A;
 Wed,  2 Oct 2024 14:15:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727878537; x=1759414537;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vrKDtkzvCbfn1iEnoEHNTgFCx2GhBBccqTrXXTqzVRI=;
 b=C6RQ6IGPyxYXK0M9PW3u5Jri6U/xfOgcrPEjbsJNZn1H7fGMsN4gLFp6
 IO+fHLQI1bSGIivKuMB65nf5RBnQoWZZk1b/s9lQW3hq7u0eFgTtSRL7q
 n0xGRJK8C+Ww7fqfPUAIs185Pmisq5f1ZdFiKPoeaddiXOlyqsCOrnpl2
 7uPuF6iG3Q1BqWayMe7BROZOO28fcqY7cV19DsWU9+/0PZNwLhohKhSIB
 3CO8xMKawbj0LtRoPXOgQk/oqoxJbTjFOyfh2DQ4lAPGywkrlurrPws9N
 wEfXtnFdlAUuXcyduE2JW4/F5njVuGhXmb6/0utpkPiffyAQKhluENLua Q==;
X-CSE-ConnectionGUID: OkNfpZuHQZ6vTAHOYv5PDQ==
X-CSE-MsgGUID: TmOJSYqqQKqoaW5a0eQv6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="27174618"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="27174618"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 07:15:37 -0700
X-CSE-ConnectionGUID: bLHtxDyjQ5u5qHQlV9XflA==
X-CSE-MsgGUID: gLHi+q7/SaCUzuFTXTUeog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="74825692"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.245.192.230])
 ([10.245.192.230])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 07:15:35 -0700
Message-ID: <4f586fcd-b1b8-497c-b594-5fb89447296d@linux.intel.com>
Date: Wed, 2 Oct 2024 16:15:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] drm/xe: Drop GuC submit_wq pool
To: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: dakr@kernel.org, pstanner@redhat.com, ltuikov89@gmail.com
References: <20241002131639.3425022-1-matthew.brost@intel.com>
 <20241002131639.3425022-3-matthew.brost@intel.com>
Content-Language: en-US
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20241002131639.3425022-3-matthew.brost@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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


On 10/2/2024 3:16 PM, Matthew Brost wrote:
> Now that drm sched uses a single lockdep map for all submit_wq, drop the
> GuC submit_wq pool hack.
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>  drivers/gpu/drm/xe/xe_guc_submit.c | 60 +-----------------------------
>  drivers/gpu/drm/xe/xe_guc_types.h  |  7 ----
>  2 files changed, 1 insertion(+), 66 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index 80062e1d3f66..ce251845d59a 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -224,58 +224,6 @@ static bool exec_queue_killed_or_banned_or_wedged(struct xe_exec_queue *q)
>  		 EXEC_QUEUE_STATE_BANNED));
>  }
>  
> -#ifdef CONFIG_PROVE_LOCKING
> -static int alloc_submit_wq(struct xe_guc *guc)
> -{
> -	int i;
> -
> -	for (i = 0; i < NUM_SUBMIT_WQ; ++i) {
> -		guc->submission_state.submit_wq_pool[i] =
> -			alloc_ordered_workqueue("submit_wq", 0);
> -		if (!guc->submission_state.submit_wq_pool[i])
> -			goto err_free;
> -	}
> -
> -	return 0;
> -
> -err_free:
> -	while (i)
> -		destroy_workqueue(guc->submission_state.submit_wq_pool[--i]);
> -
> -	return -ENOMEM;
> -}
> -
> -static void free_submit_wq(struct xe_guc *guc)
> -{
> -	int i;
> -
> -	for (i = 0; i < NUM_SUBMIT_WQ; ++i)
> -		destroy_workqueue(guc->submission_state.submit_wq_pool[i]);
> -}
> -
> -static struct workqueue_struct *get_submit_wq(struct xe_guc *guc)
> -{
> -	int idx = guc->submission_state.submit_wq_idx++ % NUM_SUBMIT_WQ;
> -
> -	return guc->submission_state.submit_wq_pool[idx];
> -}
> -#else
> -static int alloc_submit_wq(struct xe_guc *guc)
> -{
> -	return 0;
> -}
> -
> -static void free_submit_wq(struct xe_guc *guc)
> -{
> -
> -}
> -
> -static struct workqueue_struct *get_submit_wq(struct xe_guc *guc)
> -{
> -	return NULL;
> -}
> -#endif
> -
>  static void xe_guc_submit_fini(struct xe_guc *guc)
>  {
>  	struct xe_device *xe = guc_to_xe(guc);
> @@ -297,7 +245,6 @@ static void guc_submit_fini(struct drm_device *drm, void *arg)
>  
>  	xe_guc_submit_fini(guc);
>  	xa_destroy(&guc->submission_state.exec_queue_lookup);
> -	free_submit_wq(guc);
>  }
>  
>  static void guc_submit_wedged_fini(void *arg)
> @@ -359,10 +306,6 @@ int xe_guc_submit_init(struct xe_guc *guc, unsigned int num_ids)
>  	if (err)
>  		return err;
>  
> -	err = alloc_submit_wq(guc);
> -	if (err)
> -		return err;
> -
>  	gt->exec_queue_ops = &guc_exec_queue_ops;
>  
>  	xa_init(&guc->submission_state.exec_queue_lookup);
> @@ -1482,8 +1425,7 @@ static int guc_exec_queue_init(struct xe_exec_queue *q)
>  	timeout = (q->vm && xe_vm_in_lr_mode(q->vm)) ? MAX_SCHEDULE_TIMEOUT :
>  		  msecs_to_jiffies(q->sched_props.job_timeout_ms);
>  	err = xe_sched_init(&ge->sched, &drm_sched_ops, &xe_sched_ops,
> -			    get_submit_wq(guc),
> -			    q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES, 64,
> +			    NULL, q->lrc[0]->ring.size / MAX_JOB_SIZE_BYTES, 64,
>  			    timeout, guc_to_gt(guc)->ordered_wq, NULL,
>  			    q->name, gt_to_xe(q->gt)->drm.dev);
>  	if (err)
> diff --git a/drivers/gpu/drm/xe/xe_guc_types.h b/drivers/gpu/drm/xe/xe_guc_types.h
> index 69046f698271..ed150fc09ad0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_types.h
> @@ -72,13 +72,6 @@ struct xe_guc {
>  		atomic_t stopped;
>  		/** @submission_state.lock: protects submission state */
>  		struct mutex lock;
> -#ifdef CONFIG_PROVE_LOCKING
> -#define NUM_SUBMIT_WQ	256
> -		/** @submission_state.submit_wq_pool: submission ordered workqueues pool */
> -		struct workqueue_struct *submit_wq_pool[NUM_SUBMIT_WQ];
> -		/** @submission_state.submit_wq_idx: submission ordered workqueue index */
> -		int submit_wq_idx;
> -#endif
>  		/** @submission_state.enabled: submission is enabled */
>  		bool enabled;
>  		/** @submission_state.fini_wq: submit fini wait queue */
