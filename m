Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1704878EFB4
	for <lists+dri-devel@lfdr.de>; Thu, 31 Aug 2023 16:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5751F10E0CA;
	Thu, 31 Aug 2023 14:42:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 95BA310E0CA
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Aug 2023 14:42:10 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2FC96C15;
 Thu, 31 Aug 2023 07:42:49 -0700 (PDT)
Received: from [10.1.26.48] (e122027.cambridge.arm.com [10.1.26.48])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4DDBC3F738;
 Thu, 31 Aug 2023 07:42:07 -0700 (PDT)
Message-ID: <9b28946d-3614-d8bd-4976-a2a3a64a66f1@arm.com>
Date: Thu, 31 Aug 2023 15:42:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 12/15] drm/panthor: Add the driver frontend block
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-13-boris.brezillon@collabora.com>
 <3dce4ef5-77d0-3502-2f6c-3a44b6f63b15@arm.com>
 <20230829194625.2845f463@collabora.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230829194625.2845f463@collabora.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Liviu Dudau <Liviu.Dudau@arm.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 29/08/2023 18:46, Boris Brezillon wrote:
> On Mon, 21 Aug 2023 12:31:29 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 09/08/2023 17:53, Boris Brezillon wrote:

[...]

>>> + *	// Collect signal operations on all jobs, such that each job can pick
>>> + *	// from it for its dependencies and update the fence to signal when
>>> + *	// the job is submitted.  
>>
>> I can't figure out here how we avoid depedency loops within a batch. 
>> What stops two jobs from each depending on each other?
>>
>> Or do we "allow" this but rely on the loop in panthor_submit_ctx_add_deps_and_arm_jobs()
>> to effectively enforce that a job cannot actually depend on a job
>> which is later in the batch.
> 
> You can't have circular dependencies because the job fence is created
> after its dependencies have been registered, so a job at the beginning
> of the array can't depend on a job that's coming after. It might be
> passed the same syncobj, but since a syncobj is just a container, the
> fence attached to the syncobj at the time the first job adds it as a
> dependency will point to a different dma_fence.
> 
>> In which case why bother with this
>> complexity rather than just performing all the steps on each job
>> in order?
> 
> Because, before submitting a set of jobs, we want to make sure all jobs
> that are passed to a submit request are valid and enough resources are
> available for their execution to proceed. We could allow partial
> execution (and that's actually the approach I had taken in one of the
> patch I proposed to allow submitting multiple jobs in one call to
> panfrost), but then you potentially have to figure out where things
> failed, not to mention that the syncobjs might point to intermediate
> dma_fence objects instead of the final one.
> 
>>
>> Being able to submit a forward dependency, but then having it
>> ignored seems like an odd design. So I feel like I must be
>> missing something.
> 
> It's not about allowing forward dependencies (that would be mess), but
> allowing one job to take a dependency on a job that was appearing
> earlier in the job array of the same submit call.
> 
>>
>>> + *	ret = panthor_submit_ctx_collect_jobs_signal_ops(&ctx);
> 
> Here panthor_submit_ctx_collect_jobs_signal_ops() is not registering
> job out_fences to the syncobjs, it's just collecting all signal
> operations from all jobs in an array. Each entry in this array contains
> the syncobj handle, the syncobj object, and the fence that was attached
> to it at the time the collection happens, and that's it.
> 
> Now, when a job are populated, and after we made sure it had
> everything it needs to be submitted, for each signal operation passed
> to this specific job, we update the corresponding entry in the signal
> array with the job finished fence, but the syncobj is not updated at
> that point, because we want to make sure all jobs belonging to a submit
> can be submitted before exposing their fences to the outside world.
> 
> For jobs happening later in the array, when we see a WAIT operation,
> we will first check the signal array to see if there's a
> corresponding entry cached there for the given syncobj handle, if there
> is, we take the dma_fence from here (this dma_fence might come from a
> job submitted earlier in this submit context, or it might be the fence
> that was there initially), if not, we call drm_syncobj_find_fence() to
> get the dependency.
> 
> Once all jobs have been parsed/checked/populated, we start the
> non-failing step => job submission. And after that point, we can start
> exposing the job fences to the outside world. This is what happens in
> panthor_submit_ctx_push_fences(): we iterate over the signal
> operations, and update each syncobj with the fence that was last
> attached to it (the last job in the submit array having a SIGNAL
> operation on that syncobj).

Thanks for the detailed explanation. I guess I hadn't considered the
benefits of checking everything is valid and obtaining resources before
submitting anything. That makes sense and I guess justifies this complexity.

[...]

>>> +static int
>>> +panthor_submit_ctx_add_job(struct panthor_submit_ctx *ctx, u32 idx,
>>> +			   struct drm_sched_job *job,
>>> +			   const struct drm_panthor_obj_array *syncs)
>>> +{
>>> +	struct panthor_device *ptdev = container_of(ctx->file->minor->dev,
>>> +						    struct panthor_device,
>>> +						    base);
>>> +	int ret;
>>> +
>>> +	if (drm_WARN_ON(&ptdev->base,
>>> +			idx >= ctx->job_count ||
>>> +			ctx->jobs[idx].job ||
>>> +			ctx->jobs[idx].syncops ||
>>> +			ctx->jobs[idx].syncop_count))
>>> +		return -EINVAL;
>>> +
>>> +	ctx->jobs[idx].job = job;  
>>
>> While the WARN_ON obviously shouldn't happen, this positioning of the 
>> ctx->jobs[].job assignment means the caller has no idea if the 
>> assignment has happened. AFAICT in the case of the WARN_ON the job isn't 
>> cleaned up properly.
> 
> It's not really about cleanup not happening, more about being passed an
> index that was already populated.
> 
>>
>> The options I can see are to move this line further down (and make the 
>> caller clean up that one job if this function fails), or to clean up the 
>> job in the case where the WARN_ON fails.
> 
> Maybe I should drop this WARN_ON() and assume the caller passed a valid
> index...

I'd be fine with that. My reordering suggestion is a bit pointless I
must admit ;)

[...]

>>> +
>>> +	for (u32 i = 0; i < sync_op_count; i++) {
>>> +		struct panthor_sync_signal *sig_sync;
>>> +		struct dma_fence *fence;
>>> +
>>> +		if (sync_ops[i].flags & DRM_PANTHOR_SYNC_OP_SIGNAL)
>>> +			continue;  
>>
>> NIT: It might be worth having a helper for the operation type. It's a 
>> little confusing that we have !(flags & SIGNAL) and (flags & SIGNAL) but 
>> not (flags & WAIT) - obviously looking at the definition shows why. Also 
>> there'll be a lot of careful refactoring needed if a third operation is 
>> ever added.
> 
> I had the operation as a separate field initially, but I couldn't think
> of any other operations we could do on a syncobj, so I decided to make
> it a flag, and mimic what Xe does.

A flag is fine, I just find it harder to read:

 if (sync_ops[i].flags & DRM_PANTHOR_SYNC_OP_SIGNAL)
 [...]
 if (!(sync_ops[i].flags & DRM_PANTHOR_SYNC_OP_SIGNAL)

vs

 bool is_signal_op(struct drm_panthor_sync_op *op)
 {
	return !!(op->flags & DRM_PANTHOR_SYNC_OP_SIGNAL);
 }

 bool is_wait_op(struct drm_panthor_sync_op *op)
 {
	return !(op->flags & DRM_PANTHOR_SYNC_OP_SIGNAL);
 }

 if (is_signal_op(&sync_ops[i]))
 [...]
 if (is_wait_op(&sync_ops[i]))

And it avoid anyone accidentally writing:

 if (sync_ops[i].flags & DRM_PANTHOR_SYNC_OP_WAIT)

which in my quick test the compiler doesn't even warn on :(

Although on the subject of the flag, apparently the enumeration type
value doesn't compile with -pedantic as it overflows into the sign bit:

include/drm/panthor_drm.h:237:31: warning: enumerator value for
‘DRM_PANTHOR_SYNC_OP_SIGNAL’ is not an integer constant expression
[-Wpedantic]
  237 |  DRM_PANTHOR_SYNC_OP_SIGNAL = 1 << 31,

Changing it to "(int)(1u << 31)" seems to be workaround. This affects
DRM_PANTHOR_VM_BIND_OP_TYPE_MASK too.

>>
[...]
>>> +#define PANTHOR_VM_CREATE_FLAGS			0
>>> +
>>> +static int panthor_ioctl_vm_create(struct drm_device *ddev, void *data,
>>> +				   struct drm_file *file)
>>> +{
>>> +	struct panthor_device *ptdev = container_of(ddev, struct panthor_device, base);
>>> +	u32 va_bits = GPU_MMU_FEATURES_VA_BITS(ptdev->gpu_info.mmu_features);
>>> +	struct panthor_file *pfile = file->driver_priv;
>>> +	struct drm_panthor_vm_create *args = data;
>>> +	u64 kernel_va_start = 0;
>>> +	int cookie, ret;
>>> +
>>> +	if (!drm_dev_enter(ddev, &cookie))
>>> +		return -ENODEV;
>>> +
>>> +	if (args->flags & ~PANTHOR_VM_CREATE_FLAGS) {
>>> +		ret = -EINVAL;
>>> +		goto out_dev_exit;
>>> +	}
>>> +
>>> +	if (drm_WARN_ON(ddev, !va_bits) || args->kernel_va_range > (1ull << (va_bits - 1))) {  
>>
>> The check for !va_bits would be better done at probe time. I'd also be 
>> tempted to move the change for kernel_va_range down to 
>> panthor_vm_create() as that has to repeat the va_bits calculation.
>>
>>> +		ret = -EINVAL;
>>> +		goto out_dev_exit;
>>> +	}
>>> +
>>> +	if (args->kernel_va_range)
>>> +		kernel_va_start = (1 << (va_bits - 1)) - args->kernel_va_range;  
>>
>> And also push the calculation of va_start down to 
>> panthor_vm_create() as well.
> 
> panthor_vm_create() is used internally, for the MCU VM creation, and
> I'd prefer to keep it uAPI agnostic. I don't mind moving it to
> panthor_vm_pool_create_vm() but we'd still have to do the va_bits
> calculation twice.

Ah true, for panthor_vm_create() you need to be able to pass in the VA
range for the MCU. We do have the "for_mcu" flag so the
CSF_MCU_SHARED_REGION_START/SIZE #defines could be used directly in
panthor_vm_create(). But I'd be happy with it in
panthor_vm_pool_create_vm() if you'd prefer.

Steve

