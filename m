Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9E899D2757
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 14:53:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E73A10E647;
	Tue, 19 Nov 2024 13:53:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="cN32Y7EO";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="y3Sf5V7o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB9810E64C
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 13:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=To:From:Subject:Date:Message-ID; t=1732024111;
 bh=+1pHnWPTXrPaDWtdXsmofkH
 05BNrXU9gGB45p+nNMAo=; b=cN32Y7EOacRgWs/Jm/IHm30q37pPPnoI4iJttUYQoa4t9PD55a
 tQbKWjxR3emlQ8ORmnrE4eJOD0XqKRbATPiusgJfaeTAR6eEPcAK4sccZ7ClsyP7UvoJgZpMTF6
 WzPzhci+Djq+ZyLJ04xBOOExUY+CR6gPwhNcV8i7FhBxhMHdWEvqN7x63CtK75sF9kyhd77Gfld
 uuOYjCQH/6pVPAypZyXRmpPO77Llvl9jBdVzRdtKzp5lFF1mXnV0x+Rr+fnM2XheCnNJkYSaob2
 NIjZh/O/oFkfn3j3n2ZtX9d2GHsOgtDHCWBYSg3QY6qwkcsJhdK7SE9XcsQiFbCupaA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=To:From:Subject:Date:Message-ID; t=1732024111; bh=+1pHnWPTXrPaDWtdXsmofkH
 05BNrXU9gGB45p+nNMAo=; b=y3Sf5V7o6KNcyWb3cF3CKw6+Z8gW/soR0Po8t9lWT/eImPcSwY
 0k8z5YDbHns19XLKUMMW9plXAkhHVdXf5yDw==;
Message-ID: <caf0785f-58d1-4715-89dc-8061e4afa9e7@damsy.net>
Date: Tue, 19 Nov 2024 14:48:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/7] drm/sched: store the drm client_id in
 drm_sched_fence
References: <20241114100113.150647-1-pierre-eric.pelloux-prayer@amd.com>
 <20241114100113.150647-3-pierre-eric.pelloux-prayer@amd.com>
 <62a641970c2afda37f5850d5b532c21c1d147a49.camel@redhat.com>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
To: Philipp Stanner <pstanner@redhat.com>, dri-devel@lists.freedesktop.org
In-Reply-To: <62a641970c2afda37f5850d5b532c21c1d147a49.camel@redhat.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Le 15/11/2024 à 15:56, Philipp Stanner a écrit :
> On Thu, 2024-11-14 at 11:01 +0100, Pierre-Eric Pelloux-Prayer wrote:
>> This will be used in a later commit to trace the drm client_id in
>> some of the gpu_scheduler trace events.
> 
> I think this commit message should detail what the patch is actual
> intended to do.
> 
> Especially, it should mention that several drivers are being touched.
> 

Ack.

> Some other comments below
> 
>>
>> Signed-off-by: Pierre-Eric Pelloux-Prayer
>> <pierre-eric.pelloux-prayer@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c   |  2 +-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c       |  3 ++-
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.c      |  8 +++++---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_job.h      |  3 ++-
>>   drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c |  2 +-
>>   drivers/gpu/drm/imagination/pvr_job.c        |  2 +-
>>   drivers/gpu/drm/imagination/pvr_queue.c      |  5 +++--
>>   drivers/gpu/drm/imagination/pvr_queue.h      |  2 +-
>>   drivers/gpu/drm/lima/lima_gem.c              |  2 +-
>>   drivers/gpu/drm/lima/lima_sched.c            |  6 ++++--
>>   drivers/gpu/drm/lima/lima_sched.h            |  3 ++-
>>   drivers/gpu/drm/msm/msm_gem_submit.c         |  8 +++++---
>>   drivers/gpu/drm/nouveau/nouveau_sched.c      |  3 ++-
>>   drivers/gpu/drm/panfrost/panfrost_drv.c      |  2 +-
>>   drivers/gpu/drm/scheduler/sched_fence.c      |  4 +++-
>>   drivers/gpu/drm/scheduler/sched_main.c       |  6 ++++--
>>   drivers/gpu/drm/v3d/v3d_submit.c             |  2 +-
>>   drivers/gpu/drm/xe/xe_sched_job.c            |  3 ++-
>>   include/drm/gpu_scheduler.h                  | 12 ++++++++++--
>>   19 files changed, 51 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>> index b545940e512b..eede43701d51 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
>> @@ -681,7 +681,7 @@ int amdgpu_amdkfd_submit_ib(struct amdgpu_device
>> *adev,
>>   		goto err;
>>   	}
>>   
>> -	ret = amdgpu_job_alloc(adev, NULL, NULL, NULL, 1, &job);
>> +	ret = amdgpu_job_alloc(adev, NULL, NULL, NULL, 1, &job, 0);
>>   	if (ret)
>>   		goto err;
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> index 98aa4beee36a..a0a129405323 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
>> @@ -293,7 +293,8 @@ static int amdgpu_cs_pass1(struct
>> amdgpu_cs_parser *p,
>>   
>>   	for (i = 0; i < p->gang_size; ++i) {
>>   		ret = amdgpu_job_alloc(p->adev, vm, p->entities[i],
>> vm,
>> -				       num_ibs[i], &p->jobs[i]);
>> +				       num_ibs[i], &p->jobs[i],
>> +				       p->filp->client_id);
>>   		if (ret)
>>   			goto free_all_kdata;
>>   		p->jobs[i]->enforce_isolation = p->adev-
>>> enforce_isolation[fpriv->xcp_id];
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> index c774cd019a10..1dd8e940d1e9 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.c
>> @@ -186,7 +186,8 @@ static enum drm_gpu_sched_stat
>> amdgpu_job_timedout(struct drm_sched_job *s_job)
>>   
>>   int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm
>> *vm,
>>   		     struct drm_sched_entity *entity, void *owner,
>> -		     unsigned int num_ibs, struct amdgpu_job **job)
>> +		     unsigned int num_ibs, struct amdgpu_job **job,
>> +		     uint64_t drm_client_id)
> 
> You can take the short cut and use u64 instead of uint64_t. Easier to
> type for you and more congruent with the other code (in the kernel).

Ok, will do.

> 
> 
>>   {
>>   	if (num_ibs == 0)
>>   		return -EINVAL;
>> @@ -209,7 +210,8 @@ int amdgpu_job_alloc(struct amdgpu_device *adev,
>> struct amdgpu_vm *vm,
>>   	if (!entity)
>>   		return 0;
>>   
>> -	return drm_sched_job_init(&(*job)->base, entity, 1, owner);
>> +	return drm_sched_job_init(&(*job)->base, entity, 1, owner,
>> +				  drm_client_id);
>>   }
>>   
>>   int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
>> @@ -219,7 +221,7 @@ int amdgpu_job_alloc_with_ib(struct amdgpu_device
>> *adev,
>>   {
>>   	int r;
>>   
>> -	r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job);
>> +	r = amdgpu_job_alloc(adev, NULL, entity, owner, 1, job, 0);
>>   	if (r)
>>   		return r;
>>   
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>> index ce6b9ba967ff..41a03477ba5d 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_job.h
>> @@ -90,7 +90,8 @@ static inline struct amdgpu_ring
>> *amdgpu_job_ring(struct amdgpu_job *job)
>>   
>>   int amdgpu_job_alloc(struct amdgpu_device *adev, struct amdgpu_vm
>> *vm,
>>   		     struct drm_sched_entity *entity, void *owner,
>> -		     unsigned int num_ibs, struct amdgpu_job **job);
>> +		     unsigned int num_ibs, struct amdgpu_job **job,
>> +		     uint64_t drm_client_id);
> 
> same
> 
>>   int amdgpu_job_alloc_with_ib(struct amdgpu_device *adev,
>>   			     struct drm_sched_entity *entity, void
>> *owner,
>>   			     size_t size, enum amdgpu_ib_pool_type
>> pool_type,
>> diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>> b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>> index 3d0f8d182506..70294ca6202f 100644
>> --- a/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>> +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c
>> @@ -535,7 +535,7 @@ int etnaviv_ioctl_gem_submit(struct drm_device
>> *dev, void *data,
>>   
>>   	ret = drm_sched_job_init(&submit->sched_job,
>>   				 &ctx->sched_entity[args->pipe],
>> -				 1, submit->ctx);
>> +				 1, submit->ctx, file->client_id);
>>   	if (ret)
>>   		goto err_submit_put;
>>   
>> diff --git a/drivers/gpu/drm/imagination/pvr_job.c
>> b/drivers/gpu/drm/imagination/pvr_job.c
>> index 618503a212a7..64152b57e8b1 100644
>> --- a/drivers/gpu/drm/imagination/pvr_job.c
>> +++ b/drivers/gpu/drm/imagination/pvr_job.c
>> @@ -446,7 +446,7 @@ create_job(struct pvr_device *pvr_dev,
>>   	if (err)
>>   		goto err_put_job;
>>   
>> -	err = pvr_queue_job_init(job);
>> +	err = pvr_queue_job_init(job, pvr_file->file->client_id);
>>   	if (err)
>>   		goto err_put_job;
>>   
>> diff --git a/drivers/gpu/drm/imagination/pvr_queue.c
>> b/drivers/gpu/drm/imagination/pvr_queue.c
>> index c4f08432882b..598180fca141 100644
>> --- a/drivers/gpu/drm/imagination/pvr_queue.c
>> +++ b/drivers/gpu/drm/imagination/pvr_queue.c
>> @@ -1059,6 +1059,7 @@ static int pvr_queue_cleanup_fw_context(struct
>> pvr_queue *queue)
>>   /**
>>    * pvr_queue_job_init() - Initialize queue related fields in a
>> pvr_job object.
>>    * @job: The job to initialize.
>> + * @drm_client_id: drm_file.client_id submitting the job
>>    *
>>    * Bind the job to a queue and allocate memory to guarantee
>> pvr_queue_job_arm()
>>    * and pvr_queue_job_push() can't fail. We also make sure the
>> context type is
>> @@ -1068,7 +1069,7 @@ static int pvr_queue_cleanup_fw_context(struct
>> pvr_queue *queue)
>>    *  * 0 on success, or
>>    *  * An error code if something failed.
>>    */
>> -int pvr_queue_job_init(struct pvr_job *job)
>> +int pvr_queue_job_init(struct pvr_job *job, uint64_t drm_client_id)
> 
> same

Ack.

> 
>>   {
>>   	/* Fragment jobs need at least one native fence wait on the
>> geometry job fence. */
>>   	u32 min_native_dep_count = job->type ==
>> DRM_PVR_JOB_TYPE_FRAGMENT ? 1 : 0;
>> @@ -1085,7 +1086,7 @@ int pvr_queue_job_init(struct pvr_job *job)
>>   	if (!pvr_cccb_cmdseq_can_fit(&queue->cccb,
>> job_cmds_size(job, min_native_dep_count)))
>>   		return -E2BIG;
>>   
>> -	err = drm_sched_job_init(&job->base, &queue->entity, 1,
>> THIS_MODULE);
>> +	err = drm_sched_job_init(&job->base, &queue->entity, 1,
>> THIS_MODULE, drm_client_id);
>>   	if (err)
>>   		return err;
>>   
>> diff --git a/drivers/gpu/drm/imagination/pvr_queue.h
>> b/drivers/gpu/drm/imagination/pvr_queue.h
>> index e06ced69302f..bc556169b2cf 100644
>> --- a/drivers/gpu/drm/imagination/pvr_queue.h
>> +++ b/drivers/gpu/drm/imagination/pvr_queue.h
>> @@ -139,7 +139,7 @@ struct pvr_queue {
>>   
>>   bool pvr_queue_fence_is_ufo_backed(struct dma_fence *f);
>>   
>> -int pvr_queue_job_init(struct pvr_job *job);
>> +int pvr_queue_job_init(struct pvr_job *job, uint64_t drm_client_id);
> 
> Same. Probably applies to the other patches, too.

Noted.

> 
>>   
>>   void pvr_queue_job_cleanup(struct pvr_job *job);
>>   
>> diff --git a/drivers/gpu/drm/lima/lima_gem.c
>> b/drivers/gpu/drm/lima/lima_gem.c
>> index 9bb997dbb4b9..f46f961afc56 100644
>> --- a/drivers/gpu/drm/lima/lima_gem.c
>> +++ b/drivers/gpu/drm/lima/lima_gem.c
>> @@ -341,7 +341,7 @@ int lima_gem_submit(struct drm_file *file, struct
>> lima_submit *submit)
>>   
>>   	err = lima_sched_task_init(
>>   		submit->task, submit->ctx->context + submit->pipe,
>> -		bos, submit->nr_bos, vm);
>> +		bos, submit->nr_bos, vm, file->client_id);
>>   	if (err)
>>   		goto err_out1;
>>   
>> diff --git a/drivers/gpu/drm/lima/lima_sched.c
>> b/drivers/gpu/drm/lima/lima_sched.c
>> index b40c90e97d7e..84599549661a 100644
>> --- a/drivers/gpu/drm/lima/lima_sched.c
>> +++ b/drivers/gpu/drm/lima/lima_sched.c
>> @@ -113,7 +113,8 @@ static inline struct lima_sched_pipe
>> *to_lima_pipe(struct drm_gpu_scheduler *sch
>>   int lima_sched_task_init(struct lima_sched_task *task,
>>   			 struct lima_sched_context *context,
>>   			 struct lima_bo **bos, int num_bos,
>> -			 struct lima_vm *vm)
>> +			 struct lima_vm *vm,
>> +			 uint64_t drm_client_id)
>>   {
>>   	int err, i;
>>   
>> @@ -124,7 +125,8 @@ int lima_sched_task_init(struct lima_sched_task
>> *task,
>>   	for (i = 0; i < num_bos; i++)
>>   		drm_gem_object_get(&bos[i]->base.base);
>>   
>> -	err = drm_sched_job_init(&task->base, &context->base, 1,
>> vm);
>> +	err = drm_sched_job_init(&task->base, &context->base, 1, vm,
>> +				 drm_client_id);
>>   	if (err) {
>>   		kfree(task->bos);
>>   		return err;
>> diff --git a/drivers/gpu/drm/lima/lima_sched.h
>> b/drivers/gpu/drm/lima/lima_sched.h
>> index 85b23ba901d5..4041468586bd 100644
>> --- a/drivers/gpu/drm/lima/lima_sched.h
>> +++ b/drivers/gpu/drm/lima/lima_sched.h
>> @@ -88,7 +88,8 @@ struct lima_sched_pipe {
>>   int lima_sched_task_init(struct lima_sched_task *task,
>>   			 struct lima_sched_context *context,
>>   			 struct lima_bo **bos, int num_bos,
>> -			 struct lima_vm *vm);
>> +			 struct lima_vm *vm,
>> +			 uint64_t drm_client_id);
>>   void lima_sched_task_fini(struct lima_sched_task *task);
>>   
>>   int lima_sched_context_init(struct lima_sched_pipe *pipe,
>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c
>> b/drivers/gpu/drm/msm/msm_gem_submit.c
>> index fba78193127d..ceeedd4186ef 100644
>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
>> @@ -30,7 +30,7 @@
>>   static struct msm_gem_submit *submit_create(struct drm_device *dev,
>>   		struct msm_gpu *gpu,
>>   		struct msm_gpu_submitqueue *queue, uint32_t nr_bos,
>> -		uint32_t nr_cmds)
>> +		uint32_t nr_cmds, uint64_t drm_client_id)
>>   {
>>   	static atomic_t ident = ATOMIC_INIT(0);
>>   	struct msm_gem_submit *submit;
>> @@ -54,7 +54,8 @@ static struct msm_gem_submit *submit_create(struct
>> drm_device *dev,
>>   		return ERR_PTR(ret);
>>   	}
>>   
>> -	ret = drm_sched_job_init(&submit->base, queue->entity, 1,
>> queue);
>> +	ret = drm_sched_job_init(&submit->base, queue->entity, 1,
>> queue,
>> +				 drm_client_id);
>>   	if (ret) {
>>   		kfree(submit->hw_fence);
>>   		kfree(submit);
>> @@ -702,7 +703,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev,
>> void *data,
>>   		}
>>   	}
>>   
>> -	submit = submit_create(dev, gpu, queue, args->nr_bos, args-
>>> nr_cmds);
>> +	submit = submit_create(dev, gpu, queue, args->nr_bos, args-
>>> nr_cmds,
>> +			       file->client_id);
>>   	if (IS_ERR(submit)) {
>>   		ret = PTR_ERR(submit);
>>   		goto out_post_unlock;
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
>> b/drivers/gpu/drm/nouveau/nouveau_sched.c
>> index 4412f2711fb5..ebc31adea39a 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
>> @@ -87,7 +87,8 @@ nouveau_job_init(struct nouveau_job *job,
>>   	}
>>   
>>   	ret = drm_sched_job_init(&job->base, &sched->entity,
>> -				 args->credits, NULL);
>> +				 args->credits, NULL,
>> +				 job->file_priv->client_id);
>>   	if (ret)
>>   		goto err_free_chains;
>>   
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c
>> b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> index 04d615df5259..a8135bd75cae 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> @@ -312,7 +312,7 @@ static int panfrost_ioctl_submit(struct
>> drm_device *dev, void *data,
>>   
>>   	ret = drm_sched_job_init(&job->base,
>>   				 &file_priv->sched_entity[slot],
>> -				 1, NULL);
>> +				 1, NULL, file->client_id);
>>   	if (ret)
>>   		goto out_put_job;
>>   
>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c
>> b/drivers/gpu/drm/scheduler/sched_fence.c
>> index 0f35f009b9d3..909b886cd379 100644
>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>> @@ -204,7 +204,8 @@ struct drm_sched_fence *to_drm_sched_fence(struct
>> dma_fence *f)
>>   EXPORT_SYMBOL(to_drm_sched_fence);
>>   
>>   struct drm_sched_fence *drm_sched_fence_alloc(struct
>> drm_sched_entity *entity,
>> -					      void *owner)
>> +					      void *owner,
>> +					      uint64_t
>> drm_client_id)
>>   {
>>   	struct drm_sched_fence *fence = NULL;
>>   
>> @@ -213,6 +214,7 @@ struct drm_sched_fence
>> *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>   		return NULL;
>>   
>>   	fence->owner = owner;
>> +	fence->drm_client_id = drm_client_id;
>>   	spin_lock_init(&fence->lock);
>>   
>>   	return fence;
>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>> b/drivers/gpu/drm/scheduler/sched_main.c
>> index 7ce25281c74c..28ac709750e9 100644
>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>> @@ -776,6 +776,7 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>>    * @credits: the number of credits this job contributes to the
>> schedulers
>>    * credit limit
>>    * @owner: job owner for debugging
>> + * @drm_client_id: drm_file.client_id of the owner
>>    *
>>    * Refer to drm_sched_entity_push_job() documentation
>>    * for locking considerations.
>> @@ -796,7 +797,8 @@ EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>>    */
>>   int drm_sched_job_init(struct drm_sched_job *job,
>>   		       struct drm_sched_entity *entity,
>> -		       u32 credits, void *owner)
>> +		       u32 credits, void *owner,
>> +		       uint64_t drm_client_id)
>>   {
>>   	if (!entity->rq) {
>>   		/* This will most likely be followed by missing
>> frames
>> @@ -822,7 +824,7 @@ int drm_sched_job_init(struct drm_sched_job *job,
>>   
>>   	job->entity = entity;
>>   	job->credits = credits;
>> -	job->s_fence = drm_sched_fence_alloc(entity, owner);
>> +	job->s_fence = drm_sched_fence_alloc(entity, owner,
>> drm_client_id);
>>   	if (!job->s_fence)
>>   		return -ENOMEM;
>>   
>> diff --git a/drivers/gpu/drm/v3d/v3d_submit.c
>> b/drivers/gpu/drm/v3d/v3d_submit.c
>> index d607aa9c4ec2..a086da31f441 100644
>> --- a/drivers/gpu/drm/v3d/v3d_submit.c
>> +++ b/drivers/gpu/drm/v3d/v3d_submit.c
>> @@ -168,7 +168,7 @@ v3d_job_init(struct v3d_dev *v3d, struct drm_file
>> *file_priv,
>>   	job->file = file_priv;
>>   
>>   	ret = drm_sched_job_init(&job->base, &v3d_priv-
>>> sched_entity[queue],
>> -				 1, v3d_priv);
>> +				 1, v3d_priv, file_priv->client_id);
>>   	if (ret)
>>   		return ret;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_sched_job.c
>> b/drivers/gpu/drm/xe/xe_sched_job.c
>> index eeccc1c318ae..6617555e7a51 100644
>> --- a/drivers/gpu/drm/xe/xe_sched_job.c
>> +++ b/drivers/gpu/drm/xe/xe_sched_job.c
>> @@ -113,7 +113,8 @@ struct xe_sched_job *xe_sched_job_create(struct
>> xe_exec_queue *q,
>>   	kref_init(&job->refcount);
>>   	xe_exec_queue_get(job->q);
>>   
>> -	err = drm_sched_job_init(&job->drm, q->entity, 1, NULL);
>> +	err = drm_sched_job_init(&job->drm, q->entity, 1, NULL,
>> +				 q->xef->drm->client_id);
>>   	if (err)
>>   		goto err_free;
>>   
>> diff --git a/include/drm/gpu_scheduler.h
>> b/include/drm/gpu_scheduler.h
>> index 95e17504e46a..42c381449443 100644
>> --- a/include/drm/gpu_scheduler.h
>> +++ b/include/drm/gpu_scheduler.h
>> @@ -311,6 +311,13 @@ struct drm_sched_fence {
>>            * @owner: job owner for debugging
>>            */
>>   	void				*owner;
>> +
>> +	/**
>> +	 * @drm_client_id:
>> +	 *
>> +	 * The client_id of the drm_file who owned the job.
> 
> s/who owned/which owns

Thanks, will fix.

Pierre-Eric

> 
> 
> Thx,
> P.
> 
> 
>> +	 */
>> +	uint64_t			drm_client_id;
>>   };
>>   
>>   struct drm_sched_fence *to_drm_sched_fence(struct dma_fence *f);
>> @@ -563,7 +570,8 @@ int drm_sched_init(struct drm_gpu_scheduler
>> *sched,
>>   void drm_sched_fini(struct drm_gpu_scheduler *sched);
>>   int drm_sched_job_init(struct drm_sched_job *job,
>>   		       struct drm_sched_entity *entity,
>> -		       u32 credits, void *owner);
>> +		       u32 credits, void *owner,
>> +		       uint64_t drm_client_id);
>>   void drm_sched_job_arm(struct drm_sched_job *job);
>>   int drm_sched_job_add_dependency(struct drm_sched_job *job,
>>   				 struct dma_fence *fence);
>> @@ -624,7 +632,7 @@ bool drm_sched_entity_is_ready(struct
>> drm_sched_entity *entity);
>>   int drm_sched_entity_error(struct drm_sched_entity *entity);
>>   
>>   struct drm_sched_fence *drm_sched_fence_alloc(
>> -	struct drm_sched_entity *s_entity, void *owner);
>> +	struct drm_sched_entity *s_entity, void *owner, uint64_t
>> drm_client_id);
>>   void drm_sched_fence_init(struct drm_sched_fence *fence,
>>   			  struct drm_sched_entity *entity);
>>   void drm_sched_fence_free(struct drm_sched_fence *fence);
