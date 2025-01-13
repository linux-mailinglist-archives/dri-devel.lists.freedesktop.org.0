Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC81A0B7D0
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 14:13:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB8EA10E678;
	Mon, 13 Jan 2025 13:13:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="DF9UqXGO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED7CD10E676
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 13:13:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4C10E5C06D9;
 Mon, 13 Jan 2025 13:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62825C4CED6;
 Mon, 13 Jan 2025 13:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736774026;
 bh=6LrBRiOOXANMyahat5YthoKohz+mVIf1ySamhrqBpcE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DF9UqXGOlqIZUnD1S/GMwwxpbLFkPxhHAYtQeb0RsPE79qpq9JkF/GREPJ1J5RJri
 m+K7uXfQAKr4Ceyapfdjr0bg1HbIiygx42OiIS+LlVvx6/V5o2XqTrFGJl3Gouv/kM
 sqcEqUXDy975aUEynVzQP9OPuQIbkaYgMyu+2EWQNzgo81nLYeO5pxQ5oWGkkUGzoa
 w9UNVvIIdkTnnErprGV9ZdyFWc3wG7ATQV5X68pd3hZiwj/VyrUyM4yJzDcfSa9ql6
 0ZiSUayaBN8rpsvLuPEYo0tC2RaFRVuauBLQ169JhfROqIl/vz0+ZDdqCdIGlw9XM0
 XOSuxBjyN2gzw==
Message-ID: <c00fb7af-4e13-4e35-8a34-b5fd0083381c@kernel.org>
Date: Mon, 13 Jan 2025 14:12:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: Add helper to check job dependencies
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Matt Coster <matt.coster@imgtec.com>,
 dri-devel@lists.freedesktop.org
References: <20250113103341.43914-1-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: Danilo Krummrich <dakr@kernel.org>
In-Reply-To: <20250113103341.43914-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 13.01.2025 11:33, Tvrtko Ursulin wrote:
> Lets isolate scheduler internals from drivers such as pvr which currently
> walks the dependency array to look for fences.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <pstanner@redhat.com>
> Reviewed-by: Matt Coster <matt.coster@imgtec.com>

Acked-by: Danilo Krummrich <dakr@kernel.org>

> ---
>  drivers/gpu/drm/scheduler/sched_main.c | 23 +++++++++++++++++++++++
>  include/drm/gpu_scheduler.h            |  3 ++-
>  2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index 57da84908752..e6f1f2a8e033 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -997,6 +997,29 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>  }
>  EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);
>  
> +/**
> + * drm_sched_job_has_dependency - check whether fence is the job's dependency
> + * @job: scheduler job to check
> + * @fence: fence to look for
> + *
> + * Returns:
> + * True if @fence is found within the job's dependencies, or otherwise false.
> + */
> +bool drm_sched_job_has_dependency(struct drm_sched_job *job,
> +				  struct dma_fence *fence)
> +{
> +	struct dma_fence *f;
> +	unsigned long index;
> +
> +	xa_for_each(&job->dependencies, index, f) {
> +		if (f == fence)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +EXPORT_SYMBOL(drm_sched_job_has_dependency);
> +
>  /**
>   * drm_sched_job_cleanup - clean up scheduler job resources
>   * @job: scheduler job to clean up
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 95e17504e46a..d118a0a57ab1 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -577,7 +577,8 @@ int drm_sched_job_add_resv_dependencies(struct drm_sched_job *job,
>  int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
>  					    struct drm_gem_object *obj,
>  					    bool write);
> -
> +bool drm_sched_job_has_dependency(struct drm_sched_job *job,
> +				  struct dma_fence *fence);
>  
>  void drm_sched_entity_modify_sched(struct drm_sched_entity *entity,
>  				    struct drm_gpu_scheduler **sched_list,

