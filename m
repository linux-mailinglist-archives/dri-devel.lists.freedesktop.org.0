Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 764C768A03F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 18:30:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45BC910E80F;
	Fri,  3 Feb 2023 17:30:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3E7F10E819
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 17:30:00 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1011E6602F10;
 Fri,  3 Feb 2023 17:29:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675445399;
 bh=xU064NRrWWuVcBnK0Qsg7PxByxPWBR1fZeIejUoVQX8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ll8uwMTEiBA+MKySAGwF45gEes4Pu1IUnVPsHAdJTY8vFOO7FaQd0OEjkaJOMfgT7
 ns6oBTNgCSGknQW8bfSNOuoQjtSDjZghSNjGNlWAE0LbBDrw2c/eWhldWu8W0Ut2b0
 Nih7onds1J1O8XwjSzX1xXIYyna0ukRKgKew+nyaH06PUVrBkLpXc8zEVOcXL6jFZc
 1L7mTt0m0StAGFMa28Md/cKcFYvJka3O+G/aSBTyfN1PgA1o5rlR4dvr0U/XkUqc2c
 VCuSPOT6YOSybQED4Ri726bcYjO6NU6NdK0xlolZoTkCJk4u56c0NPcEwtQ1gWgrAv
 3Mnpk0f06RaRw==
Date: Fri, 3 Feb 2023 18:29:56 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Subject: Re: [RFC PATCH] drm/pancsf: Add a new driver for Mali CSF-based GPUs
Message-ID: <20230203182956.4e7f8730@collabora.com>
In-Reply-To: <bf9a7562-796b-d39e-ef4b-deb8217484b4@arm.com>
References: <20230201084832.1708866-1-boris.brezillon@collabora.com>
 <bf9a7562-796b-d39e-ef4b-deb8217484b4@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: dri-devel@lists.freedesktop.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Jason Ekstrand <jason@jlekstrand.net>, Robin Murphy <robin.murphy@arm.com>,
 Daniel Stone <daniels@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Steven,

On Fri, 3 Feb 2023 15:41:38 +0000
Steven Price <steven.price@arm.com> wrote:

> Hi Boris,
> 
> Thanks for the post - it's great to see the progress!

Thanks for chiming in!

> 
> On 01/02/2023 08:48, Boris Brezillon wrote:
> > Mali v10 (second Valhal iteration) and later GPUs replaced the Job
> > Manager block by a command stream based interface called CSF (for
> > Command Stream Frontend). This interface is not only turning the job
> > chain based submission model into a command stream based one, but also
> > introducing FW-assisted scheduling of command stream queues. This is a
> > fundamental shift in both how userspace is supposed to submit jobs, but
> > also how the driver is architectured. We initially tried to retrofit the
> > CSF model into panfrost, but this ended up introducing unneeded
> > complexity to the existing driver, which we all know is a potential
> > source of regression.  
> 
> While I agree there's some big differences which effectively mandate
> splitting the driver I do think there are some parts which make a lot of
> sense to share.
> 
> For example pancsf_regs.h and panfrost_regs.h are really quite similar
> and I think could easily be combined.

For registers, I'm not so sure. I mean, yes, most of them are identical,
but some disappeared, while others were kept but with a different
layout (see GPU_CMD), or bits re-purposed for different meaning
(MMU_INT_STAT where BUS_FAULT just became OPERATION_COMPLETE). This
makes the whole thing very confusing, so I'd rather keep those definitions
separate for my own sanity (spent a bit of time trying to understand
why my GPU command was doing nothing or why I was receiving BUS_FAULT
interrupts, before realizing I was referring to the old layout) :-).

> The clock/regulator code is pretty
> much a direct copy/paste (just adding support for more clocks), etc.

Clock and regulators, maybe, but there's not much to be shared here. I
mean, Linux already provides quite a few helpers making the
clk/regulator retrieval/enabling/disabling pretty straightforward. Not
to mention that, by keeping them separate, we don't really need to deal
with old Mali HW quirks, and we can focus on new HW bugs instead :-).

> 
> What would be ideal is factoring out 'generic' parts from panfrost and
> then being able to use them from pancsf.

I've been refactoring this pancsf driver a few times already, and I must
admit I'd prefer to keep things separate, at least for the initial
submission. If we see things that should be shared, then we can do that
in a follow-up series, but I think it's a bit premature to do it now.

> 
> I had a go at starting that:
> 
> https://gitlab.arm.com/linux-arm/linux-sp/-/tree/pancsf-refactor
> 
> (lightly tested for Panfrost, only build tested for pancsf).

Thanks, I'll have a look.

> 
> That saves around 200 lines overall and avoids needing to maintain two
> lots of clock/regulator code. There's definite scope for sharing (most)
> register definitions between the drivers and quite possibly some of the
> MMU/memory code (although there's diminishing returns there).

Yeah, actually the MMU code is likely to diverge even more if we want
to support VM_BIND (require pre-allocating pages for the page-table
updates, so the map/unmap operations can't fail in the run_job path),
so I'm not sure it's a good idea to share that bit, at least not until
we have a clearer idea of how we want things done.

> 
> > So here comes a brand new driver for CSF-based hardware. This is a
> > preliminary version and some important features are missing (like devfreq
> > , PM support and a memory shrinker implem, to name a few). The goal of
> > this RFC is to gather some preliminary feedback on both the uAPI and some
> > basic building blocks, like the MMU/VM code, the tiler heap allocation
> > logic...  
> 
> At the moment I don't have any CSF hardware available, so this review is
> a pure code review.

That's still very useful.

> I'll try to organise some hardware and do some
> testing, but it's probably going to take a while to arrive and get setup.

I'm actively working on the driver, and fixing things as I go, so let
me know when you're ready to test and I'll point you to the latest
version.

> > +#define DRM_PANCSF_SYNC_OP_MIN_SIZE		24
> > +#define DRM_PANCSF_QUEUE_SUBMIT_MIN_SIZE	32
> > +#define DRM_PANCSF_QUEUE_CREATE_MIN_SIZE	8
> > +#define DRM_PANCSF_VM_BIND_OP_MIN_SIZE		48  
> 
> I'm not sure why these are #defines rather than using sizeof()?

Yeah, I don't really like that. Those min sizes are here to deal with
potential new versions of the various objects passed as arrays
referenced from the main ioctl struct, so we can't really use
sizeof(struct drm_pancsf_xxx), because the size will change when those
structs are extended.

I'm considering using some macro trickery based on
offsetof(struct drm_pancsf_xxx, last_mandatory_field) +
sizeof(drm_pancsf_xxx.last_mandatory_field) to get
the minimum struct size instead of those static defines. On the other
hand, this should never change, so it's only a pain point while the
initial struct are under discussion.

> 
> > +static int pancsf_ioctl_dev_query(struct drm_device *ddev, void *data, struct drm_file *file)
> > +{
> > +	struct drm_pancsf_dev_query *args = data;
> > +	struct pancsf_device *pfdev = ddev->dev_private;
> > +	const void *src;
> > +	size_t src_size;
> > +
> > +	switch (args->type) {
> > +	case DRM_PANCSF_DEV_QUERY_GPU_INFO:
> > +		src_size = sizeof(pfdev->gpu_info);
> > +		src = &pfdev->gpu_info;
> > +		break;
> > +	case DRM_PANCSF_DEV_QUERY_CSIF_INFO:
> > +		src_size = sizeof(pfdev->csif_info);
> > +		src = &pfdev->csif_info;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (!args->pointer) {
> > +		args->size = src_size;
> > +		return 0;
> > +	}
> > +
> > +	args->size = min_t(unsigned long, src_size, args->size);
> > +	if (copy_to_user((void __user *)(uintptr_t)args->pointer, src, args->size))  
> 
> NIT: use u64_to_user_ptr()

Sure, will fix that.

> 
> > +		return -EFAULT;
> > +
> > +	return 0;
> > +}
> > +

> > +static void *pancsf_get_obj_array(struct drm_pancsf_obj_array *in, u32 min_stride)
> > +{
> > +	u32 elem_size = min_t(u32, in->stride, min_stride);
> > +	int ret = 0;
> > +	void *out;
> > +
> > +	if (in->stride < min_stride)
> > +		return ERR_PTR(-EINVAL);
> > +
> > +	out = kvmalloc_array(in->count, elem_size, GFP_KERNEL);
> > +	if (!out)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	if (elem_size == in->stride) {
> > +		if (copy_from_user(out, u64_to_user_ptr(in->array), elem_size * in->count))
> > +			ret = -EFAULT;
> > +	} else {
> > +		void __user *in_ptr = u64_to_user_ptr(in->array);
> > +		void *out_ptr = out;
> > +		u32 i;
> > +
> > +		for (i = 0; i < in->count; i++) {
> > +			if (copy_from_user(out_ptr, in_ptr, elem_size)) {
> > +				ret = -EFAULT;
> > +				break;
> > +			}  
> 
> Missing the increment of out_ptr and in_ptr.

Actually, it's just one of the problem here. There's a confusion
between min_stride and actual object size, which I didn't notice
because they match right now, but as soon as we extend the base
structs it will break. The following version should fix that:

static void *pancsf_get_obj_array(struct drm_pancsf_obj_array *in, u32 min_stride, u32 obj_size)
{
        u32 cpy_elem_size = min_t(u32, in->stride, obj_size);
        int ret = 0;
        void *out;

        if (in->stride < min_stride)
                return ERR_PTR(-EINVAL);

        out = kvmalloc_array(in->count, obj_size, GFP_KERNEL | __GFP_ZERO);
        if (!out)
                return ERR_PTR(-ENOMEM);

        if (obj_size == in->stride) {
                if (copy_from_user(out, u64_to_user_ptr(in->array), obj_size * in->count))
                        ret = -EFAULT;
        } else {
                void __user *in_ptr = u64_to_user_ptr(in->array);
                void *out_ptr = out;
                u32 i;

                for (i = 0; i < in->count; i++) {
                        if (copy_from_user(out_ptr, in_ptr, cpy_elem_size)) {
                                ret = -EFAULT;
                                break;
                        }

                        out_ptr += obj_size;
                        in_ptr += in->stride;
                }
        }

        if (ret) {
                kvfree(out);
                return ERR_PTR(ret);
        }

        return out;
}

> 
> > +		}
> > +	}
> > +
> > +	if (ret) {
> > +		kvfree(out);
> > +		return ERR_PTR(ret);
> > +	}
> > +
> > +	return out;
> > +}



> > +int
> > +pancsf_collect_sync_signal_array(struct drm_file *file,
> > +				 struct drm_pancsf_sync_op *sync_ops, u32 sync_op_count,
> > +				 struct pancsf_sync_signal_array *array)
> > +{
> > +	u32 count = 0, i;
> > +	int ret;
> > +
> > +	for (i = 0; i < sync_op_count; i++) {
> > +		if (sync_ops[i].op_type == DRM_PANCSF_SYNC_OP_SIGNAL)
> > +			count++;
> > +	}
> > +
> > +	array->signals = kvmalloc_array(count, sizeof(*array->signals), GFP_KERNEL | __GFP_ZERO);
> > +	if (!array->signals)
> > +		return -ENOMEM;
> > +
> > +	for (i = 0; i < sync_op_count; i++) {
> > +		int ret;
> > +
> > +		if (sync_ops[i].op_type != DRM_PANCSF_SYNC_OP_SIGNAL)
> > +			continue;
> > +
> > +		switch (sync_ops[i].handle_type) {
> > +		case DRM_PANCSF_SYNC_HANDLE_TYPE_TIMELINE_SYNCOBJ:
> > +			array->signals[array->count].chain = dma_fence_chain_alloc();
> > +			if (!array->signals[array->count].chain) {
> > +				ret = -ENOMEM;
> > +				goto err;
> > +			}
> > +
> > +			array->signals[array->count].point = sync_ops[i].timeline_value;
> > +			fallthrough;
> > +
> > +		case DRM_PANCSF_SYNC_HANDLE_TYPE_SYNCOBJ:
> > +			array->signals[array->count].syncobj = drm_syncobj_find(file, sync_ops[i].handle);
> > +			if (!array->signals[array->count].syncobj) {
> > +				ret = -EINVAL;
> > +				goto err;
> > +			}
> > +
> > +			array->count++;  
> 
> NIT: it's not obvious in this function that array->count is set to 0
> initially. It looks like it's correct because
> pancsf_ioctl_group_submit() does an alloc with __GFP_ZERO, but it would
> be much clearer with a local variable and assigning array->count at the end.

Definitely.

> 
> > +			break;
> > +
> > +		default:
> > +			ret = -EINVAL;
> > +			goto err;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +
> > +err:
> > +	pancsf_free_sync_signal_array(array);
> > +	return ret;
> > +}  

> > +
> > +struct drm_pancsf_gpu_info {
> > +#define DRM_PANCSF_ARCH_MAJOR(x)		((x) >> 28)
> > +#define DRM_PANCSF_ARCH_MINOR(x)		(((x) >> 24) & 0xf)
> > +#define DRM_PANCSF_ARCH_REV(x)			(((x) >> 20) & 0xf)
> > +#define DRM_PANCSF_PRODUCT_MAJOR(x)		(((x) >> 16) & 0xf)
> > +#define DRM_PANCSF_VERSION_MAJOR(x)		(((x) >> 12) & 0xf)
> > +#define DRM_PANCSF_VERSION_MINOR(x)		(((x) >> 4) & 0xff)
> > +#define DRM_PANCSF_VERSION_STATUS(x)		((x) & 0xf)
> > +	__u32 gpu_id;
> > +	__u32 gpu_rev;
> > +#define DRM_PANCSF_CSHW_MAJOR(x)		(((x) >> 26) & 0x3f)
> > +#define DRM_PANCSF_CSHW_MINOR(x)		(((x) >> 20) & 0x3f)
> > +#define DRM_PANCSF_CSHW_REV(x)			(((x) >> 16) & 0xf)
> > +#define DRM_PANCSF_MCU_MAJOR(x)			(((x) >> 10) & 0x3f)
> > +#define DRM_PANCSF_MCU_MINOR(x)			(((x) >> 4) & 0x3f)
> > +#define DRM_PANCSF_MCU_REV(x)			((x) & 0xf)
> > +	__u32 csf_id;
> > +	__u32 l2_features;
> > +	__u32 tiler_features;
> > +	__u32 mem_features;
> > +	__u32 mmu_features;
> > +	__u32 thread_features;
> > +	__u32 max_threads;
> > +	__u32 thread_max_workgroup_size;
> > +	__u32 thread_max_barrier_size;
> > +	__u32 coherency_features;
> > +	__u32 texture_features[4];
> > +	__u32 as_present;
> > +	__u32 core_group_count;
> > +	__u64 shader_present;
> > +	__u64 l2_present;
> > +	__u64 tiler_present;
> > +};
> > +
> > +struct drm_pancsf_csif_info {
> > +	__u32 csg_slot_count;
> > +	__u32 cs_slot_count;
> > +	__u32 cs_reg_count;
> > +	__u32 scoreboard_slot_count;
> > +	__u32 unpreserved_cs_reg_count;
> > +};
> > +
> > +struct drm_pancsf_dev_query {
> > +	/** @type: the query type (see enum drm_pancsf_dev_query_type). */
> > +	__u32 type;
> > +
> > +	/**
> > +	 * @size: size of the type being queried.
> > +	 *
> > +	 * If pointer is NULL, size is updated by the driver to provide the
> > +	 * output structure size. If pointer is not NULL, the the driver will
> > +	 * only copy min(size, actual_structure_size) bytes to the pointer,
> > +	 * and update the size accordingly. This allows us to extend query
> > +	 * types without breaking userspace.
> > +	 */
> > +	__u32 size;
> > +
> > +	/**
> > +	 * @pointer: user pointer to a query type struct.
> > +	 *
> > +	 * Pointer can be NULL, in which case, nothing is copied, but the
> > +	 * actual structure size is returned. If not NULL, it must point to
> > +	 * a location that's large enough to hold size bytes.
> > +	 */
> > +	__u64 pointer;
> > +};  
> 
> Genuine question: is there something wrong with the panfrost 'get_param'
> ioctl where individual features are queried one-by-one, rather than
> passing a big structure back to user space.

Well, I've just seen the Xe driver exposing things this way, and I thought
it was a good idea, but I don't have a strong opinion here, and if others
think it's preferable to stick to GET_PARAM, I'm fine with that too.

> 
> I ask because we've had issues in the past with trying to 'deprecate'
> registers - if a new version of the hardware stops providing a
> (meaningful) value for a register then it's hard to fix up the
> structures. The get_param method means it's possible to return a failure
> for just the register(s) that have disappeared.

There's still the option to fork the struct and add a new type if
things differ too much, or just extend the existing info struct, with
new flags to invalidate previous fields and new fields for new stuff.

> 
> There is obviously overhead iterating over all the register that user
> space cares about. Another option (used by kbase) is to return some form
> of structured data so a missing property can be encoded.

I'll have a look at how kbase does that. Thanks for the pointer.

> > +struct drm_pancsf_bo_create {
> > +	/**
> > +	 * @size: Requested size for the object
> > +	 *
> > +	 * The (page-aligned) allocated size for the object will be returned.
> > +	 */
> > +	__u64 size;
> > +
> > +	/**
> > +	 * @flags: Flags, currently unused, MBZ.
> > +	 */
> > +	__u32 flags;
> > +
> > +	/**
> > +	 * @vm_id: Attached VM, if any
> > +	 *
> > +	 * If a VM is specified, this BO must:
> > +	 *
> > +	 *  1. Only ever be bound to that VM.
> > +	 *
> > +	 *  2. Cannot be exported as a PRIME fd.
> > +	 */
> > +	__u32 vm_id;  
> 
> Unless I'm mistaken this (vm_id) isn't used (or even checked) by the
> current code.

Yeah, it will be used once we hook up the VM resv object and make all
private BOs point to this resv (instead of their own). Didn't really
see a need for that yet, since we don't have a shrinker reclaiming BOs
behind our back, and the new uAPI is all about letting the userspace driver
deal with object lifetime and passing explicit syncs. I might have missed
a use case where this is required though...

> 
> > +
> > +	/**
> > +	 * @handle: Returned handle for the object.
> > +	 *
> > +	 * Object handles are nonzero.
> > +	 */
> > +	__u32 handle;
> > +
> > +	/* @pad: MBZ. */
> > +	__u32 pad;
> > +};
> > +
> > +struct drm_pancsf_bo_mmap_offset {
> > +	/** @handle: Handle for the object being mapped. */
> > +	__u32 handle;
> > +
> > +	/** @pad: MBZ. */
> > +	__u32 pad;  
> 
> pancsf_ioctl_bo_mmap_offset is missing validation for this pad field.

I suspect most of them do, because I've added them progressively
along with other fields to keep things 64-bit aligned. I'll do a pass
and add missing checks before submitting v2.

> > +
> > +	/** @timeline_value: MBZ if handle_type != DRM_PANCSF_SYNC_HANDLE_TYPE_TIMELINE_SYNCOBJ. */
> > +	__u64 timeline_value;
> > +};
> > +
> > +struct drm_pancsf_obj_array {
> > +	/** @stride: Stride of object struct. Used for versioning. */
> > +	__u32 stride;
> > +
> > +	/** @count: Number of objects in the array. */
> > +	__u32 count;
> > +
> > +	/** @array: User pointer to an array of objects. */
> > +	__u64 array;
> > +};
> > +
> > +#define DRM_PANCSF_OBJ_ARRAY(cnt, ptr) \
> > +	{ .stride = sizeof(ptr[0]), .count = cnt, .array = (__u64)(uintptr_t)ptr }
> > +
> > +struct drm_pancsf_queue_submit {
> > +	/** @queue_index: Index of the queue inside a group. */
> > +	__u32 queue_index;
> > +
> > +	/** @stream_size: Size of the command stream to execute. */
> > +	__u32 stream_size;
> > +
> > +	/** @stream_addr: GPU address of the command stream to execute. */
> > +	__u64 stream_addr;
> > +
> > +	/** @syncs: Array of sync operations. */
> > +	struct drm_pancsf_obj_array syncs;
> > +};
> > +
> > +struct drm_pancsf_group_submit {
> > +	/** @group_handle: Handle of the group to queue jobs to. */
> > +	__u32 group_handle;
> > +
> > +	/** @syncs: Array of queue submit operations. */
> > +	struct drm_pancsf_obj_array queue_submits;
> > +};
> > +
> > +struct drm_pancsf_queue_create {
> > +	/**
> > +	 * @priority: Defines the priority of queues inside a group. Goes from 0 to 15,
> > +	 *	      15 being the highest priority.
> > +	 */
> > +	__u8 priority;
> > +
> > +	/** @pad: Padding fields, MBZ. */
> > +	__u8 pad[3];
> > +
> > +	/** @ringbuf_size: Size of the ring buffer to allocate to this queue. */  
> 
> (Must be PAGE_SIZE aligned and at most 64k)

I'll add it to the doc. Thanks 

> > +
> > +#if defined(__cplusplus)
> > +}
> > +#endif
> > +
> > +#endif /* _PANCSF_DRM_H_ */  
> 
> 
> Thanks once again for this. I hope to be able to give it a spin soon!

And thanks for your preliminary review. That's really appreciated.

Boris
