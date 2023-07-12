Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A38750C7D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jul 2023 17:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C69BC10E575;
	Wed, 12 Jul 2023 15:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id C8E1710E575
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jul 2023 15:31:03 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A57B12FC;
 Wed, 12 Jul 2023 08:31:45 -0700 (PDT)
Received: from [10.57.35.132] (unknown [10.57.35.132])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3828A3F67D;
 Wed, 12 Jul 2023 08:31:01 -0700 (PDT)
Message-ID: <1f6272fb-dd16-0d39-8e67-f4a6069a2507@arm.com>
Date: Wed, 12 Jul 2023 16:31:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 5/7] drm/panfrost: switch to using drm_exec
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20230712124704.333004-1-christian.koenig@amd.com>
 <20230712124704.333004-6-christian.koenig@amd.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230712124704.333004-6-christian.koenig@amd.com>
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 12/07/2023 13:47, Christian König wrote:
> Just a straightforward conversion without any optimization.
> 
> Only compile tested for now.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/Kconfig        |  1 +
>  drivers/gpu/drm/panfrost/panfrost_job.c | 12 +++++++-----
>  2 files changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/Kconfig b/drivers/gpu/drm/panfrost/Kconfig
> index e6403a9d66ad..e86a1a2fd8e1 100644
> --- a/drivers/gpu/drm/panfrost/Kconfig
> +++ b/drivers/gpu/drm/panfrost/Kconfig
> @@ -7,6 +7,7 @@ config DRM_PANFROST
>  	depends on !GENERIC_ATOMIC64    # for IOMMU_IO_PGTABLE_LPAE
>  	depends on MMU
>  	select DRM_SCHED
> +	select DRM_EXEC
>  	select IOMMU_SUPPORT
>  	select IOMMU_IO_PGTABLE_LPAE
>  	select DRM_GEM_SHMEM_HELPER
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index dbc597ab46fb..8b9206e910b5 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -8,6 +8,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/dma-resv.h>
> +#include <drm/drm_exec.h>
>  #include <drm/gpu_scheduler.h>
>  #include <drm/panfrost_drm.h>
>  
> @@ -275,13 +276,14 @@ static void panfrost_attach_object_fences(struct drm_gem_object **bos,
>  int panfrost_job_push(struct panfrost_job *job)
>  {
>  	struct panfrost_device *pfdev = job->pfdev;
> -	struct ww_acquire_ctx acquire_ctx;
> +	struct drm_exec exec;
>  	int ret = 0;
>  
> -	ret = drm_gem_lock_reservations(job->bos, job->bo_count,
> -					    &acquire_ctx);
> +	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> +	drm_exec_until_all_locked(&exec)
> +		ret = drm_exec_prepare_array(&exec, job->bos, job->bo_count, 1);

This loop bothers me - the return value is ignored until
drm_exec_until_all_locked() decides we can exit. It also reads badly
without the braces and with the "if" unindented below. The documentation
("a typical usage pattern") suggests this should be something like:

	drm_exec_until_all_locked(&exec) {
		ret = drm_exec_prepare_array(...);
		drm_exec_retry_on_contention(&exec);
		if (ret)
			goto unlock;
	}

Although I'm not sure if that's actually different because if there's no
contention that drm_exec_until_all_locked() looks like it should exit.

Perhaps it's just the name drm_exec_until_all_locked() which perhaps
should be drm_exec_until_not_contended()...?

Anyway I gave it a quick spin on a Firefly-RK3288 and didn't see any
problems, but I don't think I've got any tests which would create
contention on the BOs.

Steve

>  	if (ret)
> -		return ret;
> +		goto unlock;
>  
>  	mutex_lock(&pfdev->sched_lock);
>  	drm_sched_job_arm(&job->base);
> @@ -305,7 +307,7 @@ int panfrost_job_push(struct panfrost_job *job)
>  				      job->render_done_fence);
>  
>  unlock:
> -	drm_gem_unlock_reservations(job->bos, job->bo_count, &acquire_ctx);
> +	drm_exec_fini(&exec);
>  
>  	return ret;
>  }

