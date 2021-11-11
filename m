Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDA544D99C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Nov 2021 16:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B40F76E431;
	Thu, 11 Nov 2021 15:54:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F456E431
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Nov 2021 15:54:07 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636646049; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: From: References: Cc: To: Subject: MIME-Version: Date:
 Message-ID: Sender; bh=3ut1tOIFDUrtNdKJC2ByFvk+1pjalFc1Ajaij/2nI7Q=;
 b=QLAT04kgLUqKnOD7aJk319V/SNgr9qMiwtoSfdUivB1ZoZ6+Y+Sbceba20XOHn6NnU3qX9dI
 774eWgy8+ImNyLCGm0Y3XgPr54s9Ae1UYVuoNEzWVLmL1DKOSN96mE7v+j2NvakH+AB4gMif
 itaDaslGz2+9fTegIDbWvFmwzlI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 618d3c9d1b212dbdbd065377 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Nov 2021 15:54:05
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 68876C4360C; Thu, 11 Nov 2021 15:54:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
 version=3.4.0
Received: from [192.168.1.16] (unknown [117.210.184.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: akhilpo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 16E3BC4338F;
 Thu, 11 Nov 2021 15:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 16E3BC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
Message-ID: <7bc57359-0cf1-d657-f23e-e89404da6e91@codeaurora.org>
Date: Thu, 11 Nov 2021 21:23:56 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.1
Subject: Re: [PATCH v4 07/13] drm/msm: Track "seqno" fences by idr
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20210728010632.2633470-1-robdclark@gmail.com>
 <20210728010632.2633470-8-robdclark@gmail.com>
 <e9e50cad-2341-cb25-ef84-0d61a2cb7469@codeaurora.org>
 <CAF6AEGvTyy-MCv6wdkpPyohLwUg4U_2ACT0gsXRG2z6iOYQ+Tg@mail.gmail.com>
From: Akhil P Oommen <akhilpo@codeaurora.org>
In-Reply-To: <CAF6AEGvTyy-MCv6wdkpPyohLwUg4U_2ACT0gsXRG2z6iOYQ+Tg@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Sean Paul <sean@poorly.run>, freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/10/2021 10:25 PM, Rob Clark wrote:
> On Wed, Nov 10, 2021 at 7:28 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>>
>> On 7/28/2021 6:36 AM, Rob Clark wrote:
>>> From: Rob Clark <robdclark@chromium.org>
>>>
>>> Previously the (non-fd) fence returned from submit ioctl was a raw
>>> seqno, which is scoped to the ring.  But from UABI standpoint, the
>>> ioctls related to seqno fences all specify a submitqueue.  We can
>>> take advantage of that to replace the seqno fences with a cyclic idr
>>> handle.
>>>
>>> This is in preperation for moving to drm scheduler, at which point
>>> the submit ioctl will return after queuing the submit job to the
>>> scheduler, but before the submit is written into the ring (and
>>> therefore before a ring seqno has been assigned).  Which means we
>>> need to replace the dma_fence that userspace may need to wait on
>>> with a scheduler fence.
>>>
>>> Signed-off-by: Rob Clark <robdclark@chromium.org>
>>> Acked-by: Christian König <christian.koenig@amd.com>
>>> ---
>>>    drivers/gpu/drm/msm/msm_drv.c         | 30 +++++++++++++++++--
>>>    drivers/gpu/drm/msm/msm_fence.c       | 42 ---------------------------
>>>    drivers/gpu/drm/msm/msm_fence.h       |  3 --
>>>    drivers/gpu/drm/msm/msm_gem.h         |  1 +
>>>    drivers/gpu/drm/msm/msm_gem_submit.c  | 23 ++++++++++++++-
>>>    drivers/gpu/drm/msm/msm_gpu.h         |  5 ++++
>>>    drivers/gpu/drm/msm/msm_submitqueue.c |  5 ++++
>>>    7 files changed, 61 insertions(+), 48 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
>>> index 9b8fa2ad0d84..1594ae39d54f 100644
>>> --- a/drivers/gpu/drm/msm/msm_drv.c
>>> +++ b/drivers/gpu/drm/msm/msm_drv.c
>>> @@ -911,6 +911,7 @@ static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
>>>        ktime_t timeout = to_ktime(args->timeout);
>>>        struct msm_gpu_submitqueue *queue;
>>>        struct msm_gpu *gpu = priv->gpu;
>>> +     struct dma_fence *fence;
>>>        int ret;
>>>
>>>        if (args->pad) {
>>> @@ -925,10 +926,35 @@ static int msm_ioctl_wait_fence(struct drm_device *dev, void *data,
>>>        if (!queue)
>>>                return -ENOENT;
>>>
>>> -     ret = msm_wait_fence(gpu->rb[queue->prio]->fctx, args->fence, &timeout,
>>> -             true);
>>> +     /*
>>> +      * Map submitqueue scoped "seqno" (which is actually an idr key)
>>> +      * back to underlying dma-fence
>>> +      *
>>> +      * The fence is removed from the fence_idr when the submit is
>>> +      * retired, so if the fence is not found it means there is nothing
>>> +      * to wait for
>>> +      */
>>> +     ret = mutex_lock_interruptible(&queue->lock);
>>> +     if (ret)
>>> +             return ret;
>>> +     fence = idr_find(&queue->fence_idr, args->fence);
>>> +     if (fence)
>>> +             fence = dma_fence_get_rcu(fence);
>>> +     mutex_unlock(&queue->lock);
>>> +
>>> +     if (!fence)
>>> +             return 0;
>>>
>>> +     ret = dma_fence_wait_timeout(fence, true, timeout_to_jiffies(&timeout));
>>> +     if (ret == 0) {
>>> +             ret = -ETIMEDOUT;
>>> +     } else if (ret != -ERESTARTSYS) {
>>> +             ret = 0;
>>> +     }
>>> +
>>> +     dma_fence_put(fence);
>>>        msm_submitqueue_put(queue);
>>> +
>>>        return ret;
>>>    }
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_fence.c b/drivers/gpu/drm/msm/msm_fence.c
>>> index b92a9091a1e2..f2cece542c3f 100644
>>> --- a/drivers/gpu/drm/msm/msm_fence.c
>>> +++ b/drivers/gpu/drm/msm/msm_fence.c
>>> @@ -24,7 +24,6 @@ msm_fence_context_alloc(struct drm_device *dev, volatile uint32_t *fenceptr,
>>>        strncpy(fctx->name, name, sizeof(fctx->name));
>>>        fctx->context = dma_fence_context_alloc(1);
>>>        fctx->fenceptr = fenceptr;
>>> -     init_waitqueue_head(&fctx->event);
>>>        spin_lock_init(&fctx->spinlock);
>>>
>>>        return fctx;
>>> @@ -45,53 +44,12 @@ static inline bool fence_completed(struct msm_fence_context *fctx, uint32_t fenc
>>>                (int32_t)(*fctx->fenceptr - fence) >= 0;
>>>    }
>>>
>>> -/* legacy path for WAIT_FENCE ioctl: */
>>> -int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
>>> -             ktime_t *timeout, bool interruptible)
>>> -{
>>> -     int ret;
>>> -
>>> -     if (fence > fctx->last_fence) {
>>> -             DRM_ERROR_RATELIMITED("%s: waiting on invalid fence: %u (of %u)\n",
>>> -                             fctx->name, fence, fctx->last_fence);
>>> -             return -EINVAL;
>>
>> Rob, we changed this pre-existing behaviour in this patch. Now, when
>> userspace tries to wait on a future fence, we don't return an error.
>>
>> I just want to check if this was accidental or not?
> 
> Hmm, perhaps we should do this to restore the previous behavior:
> 
> -------------
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 73e827641024..3dd6da56eae6 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1000,8 +1000,12 @@ static int msm_ioctl_wait_fence(struct
> drm_device *dev, void *data,
>                  fence = dma_fence_get_rcu(fence);
>          mutex_unlock(&queue->lock);
> 
> -       if (!fence)
> -               return 0;
> +       if (!fence) {
> +               struct msm_fence_context *fctx = gpu->rb[queue->ring_nr]->fctx;
> +               DRM_ERROR_RATELIMITED("%s: waiting on invalid fence:
> %u (of %u)\n",
> +                                     fctx->name, fence, fctx->last_fence);
> +               return -EINVAL;
> +       }

With this, when userspace tries to wait on a fence which is already 
retired, it gets -EINVAL instead of success. Will this break userspace?

-Akhil.

> 
>          ret = dma_fence_wait_timeout(fence, true, timeout_to_jiffies(&timeout));
>          if (ret == 0) {
> -------------
> 
> BR,
> -R
> 
>> -Akhil.
>>
>>> -     }
>>> -
>>> -     if (!timeout) {
>>> -             /* no-wait: */
>>> -             ret = fence_completed(fctx, fence) ? 0 : -EBUSY;
>>> -     } else {
>>> -             unsigned long remaining_jiffies = timeout_to_jiffies(timeout);
>>> -
>>> -             if (interruptible)
>>> -                     ret = wait_event_interruptible_timeout(fctx->event,
>>> -                             fence_completed(fctx, fence),
>>> -                             remaining_jiffies);
>>> -             else
>>> -                     ret = wait_event_timeout(fctx->event,
>>> -                             fence_completed(fctx, fence),
>>> -                             remaining_jiffies);
>>> -
>>> -             if (ret == 0) {
>>> -                     DBG("timeout waiting for fence: %u (completed: %u)",
>>> -                                     fence, fctx->completed_fence);
>>> -                     ret = -ETIMEDOUT;
>>> -             } else if (ret != -ERESTARTSYS) {
>>> -                     ret = 0;
>>> -             }
>>> -     }
>>> -
>>> -     return ret;
>>> -}
>>> -
>>>    /* called from workqueue */
>>>    void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence)
>>>    {
>>>        spin_lock(&fctx->spinlock);
>>>        fctx->completed_fence = max(fence, fctx->completed_fence);
>>>        spin_unlock(&fctx->spinlock);
>>> -
>>> -     wake_up_all(&fctx->event);
>>>    }
>>>
>>>    struct msm_fence {
>>> diff --git a/drivers/gpu/drm/msm/msm_fence.h b/drivers/gpu/drm/msm/msm_fence.h
>>> index 6ab97062ff1a..4783db528bcc 100644
>>> --- a/drivers/gpu/drm/msm/msm_fence.h
>>> +++ b/drivers/gpu/drm/msm/msm_fence.h
>>> @@ -49,7 +49,6 @@ struct msm_fence_context {
>>>         */
>>>        volatile uint32_t *fenceptr;
>>>
>>> -     wait_queue_head_t event;
>>>        spinlock_t spinlock;
>>>    };
>>>
>>> @@ -57,8 +56,6 @@ struct msm_fence_context * msm_fence_context_alloc(struct drm_device *dev,
>>>                volatile uint32_t *fenceptr, const char *name);
>>>    void msm_fence_context_free(struct msm_fence_context *fctx);
>>>
>>> -int msm_wait_fence(struct msm_fence_context *fctx, uint32_t fence,
>>> -             ktime_t *timeout, bool interruptible);
>>>    void msm_update_fence(struct msm_fence_context *fctx, uint32_t fence);
>>>
>>>    struct dma_fence * msm_fence_alloc(struct msm_fence_context *fctx);
>>> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
>>> index da3af702a6c8..e0579abda5b9 100644
>>> --- a/drivers/gpu/drm/msm/msm_gem.h
>>> +++ b/drivers/gpu/drm/msm/msm_gem.h
>>> @@ -320,6 +320,7 @@ struct msm_gem_submit {
>>>        struct ww_acquire_ctx ticket;
>>>        uint32_t seqno;         /* Sequence number of the submit on the ring */
>>>        struct dma_fence *fence;
>>> +     int fence_id;       /* key into queue->fence_idr */
>>>        struct msm_gpu_submitqueue *queue;
>>>        struct pid *pid;    /* submitting process */
>>>        bool fault_dumped;  /* Limit devcoredump dumping to one per submit */
>>> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
>>> index 4f02fa3c78f9..f6f595aae2c5 100644
>>> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
>>> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
>>> @@ -68,7 +68,14 @@ void __msm_gem_submit_destroy(struct kref *kref)
>>>                        container_of(kref, struct msm_gem_submit, ref);
>>>        unsigned i;
>>>
>>> +     if (submit->fence_id) {
>>> +             mutex_lock(&submit->queue->lock);
>>> +             idr_remove(&submit->queue->fence_idr, submit->fence_id);
>>> +             mutex_unlock(&submit->queue->lock);
>>> +     }
>>> +
>>>        dma_fence_put(submit->fence);
>>> +
>>>        put_pid(submit->pid);
>>>        msm_submitqueue_put(submit->queue);
>>>
>>> @@ -872,6 +879,20 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>>>                goto out;
>>>        }
>>>
>>> +     /*
>>> +      * Allocate an id which can be used by WAIT_FENCE ioctl to map back
>>> +      * to the underlying fence.
>>> +      */
>>> +     mutex_lock(&queue->lock);
>>> +     submit->fence_id = idr_alloc_cyclic(&queue->fence_idr,
>>> +                     submit->fence, 0, INT_MAX, GFP_KERNEL);
>>> +     mutex_unlock(&queue->lock);
>>> +     if (submit->fence_id < 0) {
>>> +             ret = submit->fence_id = 0;
>>> +             submit->fence_id = 0;
>>> +             goto out;
>>> +     }
>>> +
>>>        if (args->flags & MSM_SUBMIT_FENCE_FD_OUT) {
>>>                struct sync_file *sync_file = sync_file_create(submit->fence);
>>>                if (!sync_file) {
>>> @@ -886,7 +907,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>>>
>>>        msm_gpu_submit(gpu, submit);
>>>
>>> -     args->fence = submit->fence->seqno;
>>> +     args->fence = submit->fence_id;
>>>
>>>        msm_reset_syncobjs(syncobjs_to_reset, args->nr_in_syncobjs);
>>>        msm_process_post_deps(post_deps, args->nr_out_syncobjs,
>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
>>> index 96efcb31e502..579627252540 100644
>>> --- a/drivers/gpu/drm/msm/msm_gpu.h
>>> +++ b/drivers/gpu/drm/msm/msm_gpu.h
>>> @@ -263,6 +263,9 @@ struct msm_gpu_perfcntr {
>>>     *             which set of pgtables do submits jobs associated with the
>>>     *             submitqueue use)
>>>     * @node:      node in the context's list of submitqueues
>>> + * @fence_idr: maps fence-id to dma_fence for userspace visible fence
>>> + *             seqno, protected by submitqueue lock
>>> + * @lock:      submitqueue lock
>>>     * @ref:       reference count
>>>     */
>>>    struct msm_gpu_submitqueue {
>>> @@ -272,6 +275,8 @@ struct msm_gpu_submitqueue {
>>>        int faults;
>>>        struct msm_file_private *ctx;
>>>        struct list_head node;
>>> +     struct idr fence_idr;
>>> +     struct mutex lock;
>>>        struct kref ref;
>>>    };
>>>
>>> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
>>> index 9e9fec61d629..66f8d0fb38b0 100644
>>> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
>>> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
>>> @@ -12,6 +12,8 @@ void msm_submitqueue_destroy(struct kref *kref)
>>>        struct msm_gpu_submitqueue *queue = container_of(kref,
>>>                struct msm_gpu_submitqueue, ref);
>>>
>>> +     idr_destroy(&queue->fence_idr);
>>> +
>>>        msm_file_private_put(queue->ctx);
>>>
>>>        kfree(queue);
>>> @@ -89,6 +91,9 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
>>>        if (id)
>>>                *id = queue->id;
>>>
>>> +     idr_init(&queue->fence_idr);
>>> +     mutex_init(&queue->lock);
>>> +
>>>        list_add_tail(&queue->node, &ctx->submitqueues);
>>>
>>>        write_unlock(&ctx->queuelock);
>>>
>>

