Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E21C756D4C
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 21:33:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A97E110E2AE;
	Mon, 17 Jul 2023 19:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF19110E2AE
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 19:32:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f8qTz45rRelzzpoecvD3iz/zMuBbkdOmNpDw5F4bPH4=; b=MyLj4f4fzy2Pizl70yXxs7QGjP
 hYRzuLqtfUqzn/M4kZYqxNPf1jIgG9cacks9Mg3m/iTMNKb+SEptisXtCjOpSmmqjCM2AR9XUNZqh
 8mgZ4Lpr/sG36RlN3C1gUbQkyVsAKWLLz37wWkQLaH7G3eGn3pFbe9Lpvyh/52wjp8HbS/01g40yR
 6Hr0zAVsCKpDGV+S7xcq6X8XpBWgGUEBNvh0P4nVbf3lCTmWryV0EKuN1FQzY/1anTj3mn8bTpkoU
 t59rfq+L5/rAewqqbVphJIE8g96O+ecIN+GVtQPeLtD7I4MVMEupdLSSGp/DmMKK9VVzxRLnsdqeX
 pAZQU4LQ==;
Received: from [187.36.235.191] (helo=[192.168.1.212])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1qLTxh-00GNeI-Du; Mon, 17 Jul 2023 21:32:49 +0200
Message-ID: <f448676e-5398-8a55-27d7-f6784f8c78b6@igalia.com>
Date: Mon, 17 Jul 2023 16:32:42 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 6/7] drm/v3d: switch to using drm_exec
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org
References: <20230712124704.333004-1-christian.koenig@amd.com>
 <20230712124704.333004-7-christian.koenig@amd.com>
From: Maira Canal <mcanal@igalia.com>
In-Reply-To: <20230712124704.333004-7-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Melissa Wen <mwen@igalia.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Emma Anholt <emma@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

I believe that `select DRM_EXEC` is missing on v3d's Kconfig file. If
we don't select it, we will get some compilation errors.

Apart from this problem, I ran some tests on the RPi 4 and didn't see
any problems.

Best Regards,
- Maíra

On 7/12/23 09:47, Christian König wrote:
> Just a straightforward conversion without any optimization.
> 
> Only compile tested for now.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: Melissa Wen <mwen@igalia.com>
> ---
>   drivers/gpu/drm/v3d/v3d_gem.c | 44 ++++++++++++++++-------------------
>   1 file changed, 20 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/v3d/v3d_gem.c b/drivers/gpu/drm/v3d/v3d_gem.c
> index 2e94ce788c71..190e2a9f64a4 100644
> --- a/drivers/gpu/drm/v3d/v3d_gem.c
> +++ b/drivers/gpu/drm/v3d/v3d_gem.c
> @@ -10,6 +10,7 @@
>   #include <linux/sched/signal.h>
>   #include <linux/uaccess.h>
>   
> +#include <drm/drm_exec.h>
>   #include <drm/drm_managed.h>
>   #include <drm/drm_syncobj.h>
>   #include <uapi/drm/v3d_drm.h>
> @@ -249,20 +250,17 @@ v3d_invalidate_caches(struct v3d_dev *v3d)
>    * to v3d, so we don't attach dma-buf fences to them.
>    */
>   static int
> -v3d_lock_bo_reservations(struct v3d_job *job,
> -			 struct ww_acquire_ctx *acquire_ctx)
> +v3d_lock_bo_reservations(struct v3d_job *job, struct drm_exec *exec)
>   {
>   	int i, ret;
>   
> -	ret = drm_gem_lock_reservations(job->bo, job->bo_count, acquire_ctx);
> +	drm_exec_init(exec, DRM_EXEC_INTERRUPTIBLE_WAIT);
> +	drm_exec_until_all_locked(exec)
> +		ret = drm_exec_prepare_array(exec, job->bo, job->bo_count, 1);
>   	if (ret)
> -		return ret;
> +		goto fail;
>   
>   	for (i = 0; i < job->bo_count; i++) {
> -		ret = dma_resv_reserve_fences(job->bo[i]->resv, 1);
> -		if (ret)
> -			goto fail;
> -
>   		ret = drm_sched_job_add_implicit_dependencies(&job->base,
>   							      job->bo[i], true);
>   		if (ret)
> @@ -272,7 +270,7 @@ v3d_lock_bo_reservations(struct v3d_job *job,
>   	return 0;
>   
>   fail:
> -	drm_gem_unlock_reservations(job->bo, job->bo_count, acquire_ctx);
> +	drm_exec_fini(exec);
>   	return ret;
>   }
>   
> @@ -477,7 +475,7 @@ v3d_push_job(struct v3d_job *job)
>   static void
>   v3d_attach_fences_and_unlock_reservation(struct drm_file *file_priv,
>   					 struct v3d_job *job,
> -					 struct ww_acquire_ctx *acquire_ctx,
> +					 struct drm_exec *exec,
>   					 u32 out_sync,
>   					 struct v3d_submit_ext *se,
>   					 struct dma_fence *done_fence)
> @@ -492,7 +490,7 @@ v3d_attach_fences_and_unlock_reservation(struct drm_file *file_priv,
>   				   DMA_RESV_USAGE_WRITE);
>   	}
>   
> -	drm_gem_unlock_reservations(job->bo, job->bo_count, acquire_ctx);
> +	drm_exec_fini(exec);
>   
>   	/* Update the return sync object for the job */
>   	/* If it only supports a single signal semaphore*/
> @@ -669,7 +667,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
>   	struct v3d_render_job *render = NULL;
>   	struct v3d_job *clean_job = NULL;
>   	struct v3d_job *last_job;
> -	struct ww_acquire_ctx acquire_ctx;
> +	struct drm_exec exec;
>   	int ret = 0;
>   
>   	trace_v3d_submit_cl_ioctl(&v3d->drm, args->rcl_start, args->rcl_end);
> @@ -731,7 +729,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
>   	if (ret)
>   		goto fail;
>   
> -	ret = v3d_lock_bo_reservations(last_job, &acquire_ctx);
> +	ret = v3d_lock_bo_reservations(last_job, &exec);
>   	if (ret)
>   		goto fail;
>   
> @@ -775,7 +773,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
>   
>   	v3d_attach_fences_and_unlock_reservation(file_priv,
>   						 last_job,
> -						 &acquire_ctx,
> +						 &exec,
>   						 args->out_sync,
>   						 &se,
>   						 last_job->done_fence);
> @@ -791,8 +789,7 @@ v3d_submit_cl_ioctl(struct drm_device *dev, void *data,
>   fail_unreserve:
>   	mutex_unlock(&v3d->sched_lock);
>   fail_perfmon:
> -	drm_gem_unlock_reservations(last_job->bo,
> -				    last_job->bo_count, &acquire_ctx);
> +	drm_exec_fini(&exec);
>   fail:
>   	v3d_job_cleanup((void *)bin);
>   	v3d_job_cleanup((void *)render);
> @@ -819,7 +816,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
>   	struct drm_v3d_submit_tfu *args = data;
>   	struct v3d_submit_ext se = {0};
>   	struct v3d_tfu_job *job = NULL;
> -	struct ww_acquire_ctx acquire_ctx;
> +	struct drm_exec exec;
>   	int ret = 0;
>   
>   	trace_v3d_submit_tfu_ioctl(&v3d->drm, args->iia);
> @@ -870,7 +867,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
>   		job->base.bo[job->base.bo_count] = bo;
>   	}
>   
> -	ret = v3d_lock_bo_reservations(&job->base, &acquire_ctx);
> +	ret = v3d_lock_bo_reservations(&job->base, &exec);
>   	if (ret)
>   		goto fail;
>   
> @@ -879,7 +876,7 @@ v3d_submit_tfu_ioctl(struct drm_device *dev, void *data,
>   	mutex_unlock(&v3d->sched_lock);
>   
>   	v3d_attach_fences_and_unlock_reservation(file_priv,
> -						 &job->base, &acquire_ctx,
> +						 &job->base, &exec,
>   						 args->out_sync,
>   						 &se,
>   						 job->base.done_fence);
> @@ -914,7 +911,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
>   	struct v3d_submit_ext se = {0};
>   	struct v3d_csd_job *job = NULL;
>   	struct v3d_job *clean_job = NULL;
> -	struct ww_acquire_ctx acquire_ctx;
> +	struct drm_exec exec;
>   	int ret;
>   
>   	trace_v3d_submit_csd_ioctl(&v3d->drm, args->cfg[5], args->cfg[6]);
> @@ -957,7 +954,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
>   	if (ret)
>   		goto fail;
>   
> -	ret = v3d_lock_bo_reservations(clean_job, &acquire_ctx);
> +	ret = v3d_lock_bo_reservations(clean_job, &exec);
>   	if (ret)
>   		goto fail;
>   
> @@ -983,7 +980,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
>   
>   	v3d_attach_fences_and_unlock_reservation(file_priv,
>   						 clean_job,
> -						 &acquire_ctx,
> +						 &exec,
>   						 args->out_sync,
>   						 &se,
>   						 clean_job->done_fence);
> @@ -996,8 +993,7 @@ v3d_submit_csd_ioctl(struct drm_device *dev, void *data,
>   fail_unreserve:
>   	mutex_unlock(&v3d->sched_lock);
>   fail_perfmon:
> -	drm_gem_unlock_reservations(clean_job->bo, clean_job->bo_count,
> -				    &acquire_ctx);
> +	drm_exec_fini(&exec);
>   fail:
>   	v3d_job_cleanup((void *)job);
>   	v3d_job_cleanup(clean_job);
