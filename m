Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCC0689E78
	for <lists+dri-devel@lfdr.de>; Fri,  3 Feb 2023 16:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC46310E079;
	Fri,  3 Feb 2023 15:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id A878210E079
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Feb 2023 15:41:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23EA4C14;
 Fri,  3 Feb 2023 07:42:24 -0800 (PST)
Received: from [10.1.39.17] (e122027.cambridge.arm.com [10.1.39.17])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 89A163F71E;
 Fri,  3 Feb 2023 07:41:40 -0800 (PST)
Message-ID: <bf9a7562-796b-d39e-ef4b-deb8217484b4@arm.com>
Date: Fri, 3 Feb 2023 15:41:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
From: Steven Price <steven.price@arm.com>
Subject: Re: [RFC PATCH] drm/pancsf: Add a new driver for Mali CSF-based GPUs
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230201084832.1708866-1-boris.brezillon@collabora.com>
Content-Language: en-GB
In-Reply-To: <20230201084832.1708866-1-boris.brezillon@collabora.com>
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
Cc: Jason Ekstrand <jason@jlekstrand.net>, Robin Murphy <robin.murphy@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Stone <daniels@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Boris,

Thanks for the post - it's great to see the progress!

On 01/02/2023 08:48, Boris Brezillon wrote:
> Mali v10 (second Valhal iteration) and later GPUs replaced the Job
> Manager block by a command stream based interface called CSF (for
> Command Stream Frontend). This interface is not only turning the job
> chain based submission model into a command stream based one, but also
> introducing FW-assisted scheduling of command stream queues. This is a
> fundamental shift in both how userspace is supposed to submit jobs, but
> also how the driver is architectured. We initially tried to retrofit the
> CSF model into panfrost, but this ended up introducing unneeded
> complexity to the existing driver, which we all know is a potential
> source of regression.

While I agree there's some big differences which effectively mandate
splitting the driver I do think there are some parts which make a lot of
sense to share.

For example pancsf_regs.h and panfrost_regs.h are really quite similar
and I think could easily be combined. The clock/regulator code is pretty
much a direct copy/paste (just adding support for more clocks), etc.

What would be ideal is factoring out 'generic' parts from panfrost and
then being able to use them from pancsf.

I had a go at starting that:

https://gitlab.arm.com/linux-arm/linux-sp/-/tree/pancsf-refactor

(lightly tested for Panfrost, only build tested for pancsf).

That saves around 200 lines overall and avoids needing to maintain two
lots of clock/regulator code. There's definite scope for sharing (most)
register definitions between the drivers and quite possibly some of the
MMU/memory code (although there's diminishing returns there).

> So here comes a brand new driver for CSF-based hardware. This is a
> preliminary version and some important features are missing (like devfreq
> , PM support and a memory shrinker implem, to name a few). The goal of
> this RFC is to gather some preliminary feedback on both the uAPI and some
> basic building blocks, like the MMU/VM code, the tiler heap allocation
> logic...

At the moment I don't have any CSF hardware available, so this review is
a pure code review. I'll try to organise some hardware and do some
testing, but it's probably going to take a while to arrive and get setup.

> It's also here to give concrete code to refer to for the discussion
> around scheduling and VM_BIND support that started on the Xe/nouveau
> threads[1][2]. Right now, I'm still using a custom timesharing-based
> scheduler, but I plan to give Daniel's suggestion a try (having one
> drm_gpu_scheduler per drm_sched_entity, and replacing the tick-based
> scheduler by some group slot manager with an LRU-based group eviction
> mechanism). I also have a bunch of things I need to figure out regarding
> the VM-based memory management code. The current design assumes explicit
> syncs everywhere, but we don't use resv objects yet. I see other modern
> drivers are adding BOOKKEEP fences to the VM resv object and using this
> VM resv to synchronize with kernel operations on the VM, but we
> currently don't do any of that. As Daniel pointed out it's likely to
> become an issue when we throw the memory shrinker into the mix. And of
> course, the plan is to transition to the drm_gpuva_manager infrastructure
> being discussed here [2] before merging the driver. Kind of related to
> this shrinker topic, I'm wondering if it wouldn't make sense to use
> the TTM infra for our buffer management (AFAIU, we'd get LRU-based BO
> eviction for free, without needing to expose an MADVISE(DONT_NEED) kind
> of API), but I'm a bit worried about the extra complexity this would pull
> in.

I'm afraid I haven't done much review of this yet - my knowledge of how
this is done in kbase is lacking as I was already leaving GPU around the
time this was being implemented... but since it's all about to change
perhaps that's for the best ;)

> Note that DT bindings are currently undocumented. For those who really
> care, they're based on the panfrost bindings, so I don't expect any
> pain points on that front. I'll provide a proper doc once all other
> aspects have been sorted out.
> 
> Regards,
> 
> Boris
> 
> [1]https://lore.kernel.org/dri-devel/20221222222127.34560-1-matthew.brost@intel.com/
> [2]https://lore.kernel.org/lkml/Y8jOCE%2FPyNZ2Z6aX@DUT025-TGLU.fm.intel.com/
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Cc: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> Cc: Steven Price <steven.price@arm.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Daniel Stone <daniels@collabora.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  drivers/gpu/drm/Kconfig                |    2 +
>  drivers/gpu/drm/Makefile               |    1 +
>  drivers/gpu/drm/pancsf/Kconfig         |   15 +
>  drivers/gpu/drm/pancsf/Makefile        |   14 +
>  drivers/gpu/drm/pancsf/pancsf_device.c |  391 ++++
>  drivers/gpu/drm/pancsf/pancsf_device.h |  168 ++
>  drivers/gpu/drm/pancsf/pancsf_drv.c    |  812 +++++++
>  drivers/gpu/drm/pancsf/pancsf_gem.c    |  161 ++
>  drivers/gpu/drm/pancsf/pancsf_gem.h    |   45 +
>  drivers/gpu/drm/pancsf/pancsf_gpu.c    |  381 ++++
>  drivers/gpu/drm/pancsf/pancsf_gpu.h    |   40 +
>  drivers/gpu/drm/pancsf/pancsf_heap.c   |  337 +++
>  drivers/gpu/drm/pancsf/pancsf_heap.h   |   30 +
>  drivers/gpu/drm/pancsf/pancsf_mcu.c    |  891 ++++++++
>  drivers/gpu/drm/pancsf/pancsf_mcu.h    |  313 +++
>  drivers/gpu/drm/pancsf/pancsf_mmu.c    | 1345 +++++++++++
>  drivers/gpu/drm/pancsf/pancsf_mmu.h    |   51 +
>  drivers/gpu/drm/pancsf/pancsf_regs.h   |  225 ++
>  drivers/gpu/drm/pancsf/pancsf_sched.c  | 2837 ++++++++++++++++++++++++
>  drivers/gpu/drm/pancsf/pancsf_sched.h  |   68 +
>  include/uapi/drm/pancsf_drm.h          |  414 ++++
>  21 files changed, 8541 insertions(+)
>  create mode 100644 drivers/gpu/drm/pancsf/Kconfig
>  create mode 100644 drivers/gpu/drm/pancsf/Makefile
>  create mode 100644 drivers/gpu/drm/pancsf/pancsf_device.c
>  create mode 100644 drivers/gpu/drm/pancsf/pancsf_device.h
>  create mode 100644 drivers/gpu/drm/pancsf/pancsf_drv.c
>  create mode 100644 drivers/gpu/drm/pancsf/pancsf_gem.c
>  create mode 100644 drivers/gpu/drm/pancsf/pancsf_gem.h
>  create mode 100644 drivers/gpu/drm/pancsf/pancsf_gpu.c
>  create mode 100644 drivers/gpu/drm/pancsf/pancsf_gpu.h
>  create mode 100644 drivers/gpu/drm/pancsf/pancsf_heap.c
>  create mode 100644 drivers/gpu/drm/pancsf/pancsf_heap.h
>  create mode 100644 drivers/gpu/drm/pancsf/pancsf_mcu.c
>  create mode 100644 drivers/gpu/drm/pancsf/pancsf_mcu.h
>  create mode 100644 drivers/gpu/drm/pancsf/pancsf_mmu.c
>  create mode 100644 drivers/gpu/drm/pancsf/pancsf_mmu.h
>  create mode 100644 drivers/gpu/drm/pancsf/pancsf_regs.h
>  create mode 100644 drivers/gpu/drm/pancsf/pancsf_sched.c
>  create mode 100644 drivers/gpu/drm/pancsf/pancsf_sched.h
>  create mode 100644 include/uapi/drm/pancsf_drm.h
> 

<snip>

> diff --git a/drivers/gpu/drm/pancsf/pancsf_drv.c b/drivers/gpu/drm/pancsf/pancsf_drv.c
> new file mode 100644
> index 000000000000..05c4df13ba90
> --- /dev/null
> +++ b/drivers/gpu/drm/pancsf/pancsf_drv.c
> @@ -0,0 +1,812 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2018 Marty E. Plummer <hanetzer@startmail.com> */
> +/* Copyright 2019 Linaro, Ltd., Rob Herring <robh@kernel.org> */
> +/* Copyright 2019 Collabora ltd. */
> +
> +#include <linux/module.h>
> +#include <linux/of_platform.h>
> +#include <linux/pagemap.h>
> +#include <linux/pm_runtime.h>
> +#include <drm/pancsf_drm.h>
> +#include <drm/drm_drv.h>
> +#include <drm/drm_ioctl.h>
> +#include <drm/drm_syncobj.h>
> +#include <drm/drm_utils.h>
> +#include <drm/drm_debugfs.h>
> +
> +#include "pancsf_sched.h"
> +#include "pancsf_device.h"
> +#include "pancsf_gem.h"
> +#include "pancsf_heap.h"
> +#include "pancsf_mcu.h"
> +#include "pancsf_mmu.h"
> +#include "pancsf_gpu.h"
> +
> +#define DRM_PANCSF_SYNC_OP_MIN_SIZE		24
> +#define DRM_PANCSF_QUEUE_SUBMIT_MIN_SIZE	32
> +#define DRM_PANCSF_QUEUE_CREATE_MIN_SIZE	8
> +#define DRM_PANCSF_VM_BIND_OP_MIN_SIZE		48

I'm not sure why these are #defines rather than using sizeof()?

> +static int pancsf_ioctl_dev_query(struct drm_device *ddev, void *data, struct drm_file *file)
> +{
> +	struct drm_pancsf_dev_query *args = data;
> +	struct pancsf_device *pfdev = ddev->dev_private;
> +	const void *src;
> +	size_t src_size;
> +
> +	switch (args->type) {
> +	case DRM_PANCSF_DEV_QUERY_GPU_INFO:
> +		src_size = sizeof(pfdev->gpu_info);
> +		src = &pfdev->gpu_info;
> +		break;
> +	case DRM_PANCSF_DEV_QUERY_CSIF_INFO:
> +		src_size = sizeof(pfdev->csif_info);
> +		src = &pfdev->csif_info;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	if (!args->pointer) {
> +		args->size = src_size;
> +		return 0;
> +	}
> +
> +	args->size = min_t(unsigned long, src_size, args->size);
> +	if (copy_to_user((void __user *)(uintptr_t)args->pointer, src, args->size))

NIT: use u64_to_user_ptr()

> +		return -EFAULT;
> +
> +	return 0;
> +}
> +
> +#define PANCSF_MAX_VMS_PER_FILE		32
> +#define PANCSF_VM_CREATE_FLAGS		0
> +
> +int pancsf_ioctl_vm_create(struct drm_device *ddev, void *data,
> +			   struct drm_file *file)
> +{
> +	struct pancsf_device *pfdev = ddev->dev_private;
> +	struct pancsf_file *pfile = file->driver_priv;
> +	struct drm_pancsf_vm_create *args = data;
> +	int ret;
> +
> +	if (args->flags & ~PANCSF_VM_CREATE_FLAGS)
> +		return -EINVAL;
> +
> +	ret = pancsf_vm_pool_create_vm(pfdev, pfile->vms);
> +	if (ret < 0)
> +		return ret;
> +
> +	args->id = ret;
> +	return 0;
> +}
> +
> +int pancsf_ioctl_vm_destroy(struct drm_device *ddev, void *data,
> +			    struct drm_file *file)
> +{
> +	struct pancsf_file *pfile = file->driver_priv;
> +	struct drm_pancsf_vm_destroy *args = data;
> +
> +	pancsf_vm_pool_destroy_vm(pfile->vms, args->id);
> +	return 0;
> +}
> +
> +#define PANCSF_BO_FLAGS		0
> +
> +static int pancsf_ioctl_bo_create(struct drm_device *ddev, void *data,
> +				  struct drm_file *file)
> +{
> +	struct pancsf_gem_object *bo;
> +	struct drm_pancsf_bo_create *args = data;
> +
> +	if (!args->size || args->pad ||
> +	    (args->flags & ~PANCSF_BO_FLAGS))
> +		return -EINVAL;
> +
> +	bo = pancsf_gem_create_with_handle(file, ddev, args->size, args->flags,
> +					   &args->handle);
> +	if (IS_ERR(bo))
> +		return PTR_ERR(bo);
> +
> +	return 0;
> +}
> +
> +#define PANCSF_VMA_MAP_FLAGS (PANCSF_VMA_MAP_READONLY | \
> +			      PANCSF_VMA_MAP_NOEXEC | \
> +			      PANCSF_VMA_MAP_UNCACHED | \
> +			      PANCSF_VMA_MAP_FRAG_SHADER | \
> +			      PANCSF_VMA_MAP_ON_FAULT | \
> +			      PANCSF_VMA_MAP_AUTO_VA)
> +
> +static int pancsf_ioctl_vm_map(struct drm_device *ddev, void *data,
> +			       struct drm_file *file)
> +{
> +	struct pancsf_file *pfile = file->driver_priv;
> +	struct drm_pancsf_vm_map *args = data;
> +	struct drm_gem_object *gem;
> +	struct pancsf_vm *vm;
> +	int ret;
> +
> +	if (args->flags & ~PANCSF_VMA_MAP_FLAGS)
> +		return -EINVAL;
> +
> +	gem = drm_gem_object_lookup(file, args->bo_handle);
> +	if (!gem)
> +		return -EINVAL;
> +
> +	vm = pancsf_vm_pool_get_vm(pfile->vms, args->vm_id);
> +	if (vm) {
> +		ret = pancsf_vm_map_bo_range(vm, to_pancsf_bo(gem), args->bo_offset,
> +					     args->size, &args->va, args->flags);
> +	} else {
> +		ret = -EINVAL;
> +	}
> +
> +	pancsf_vm_put(vm);
> +	drm_gem_object_put(gem);
> +	return ret;
> +}
> +
> +#define PANCSF_VMA_UNMAP_FLAGS 0
> +
> +static int pancsf_ioctl_vm_unmap(struct drm_device *ddev, void *data,
> +				 struct drm_file *file)
> +{
> +	struct pancsf_file *pfile = file->driver_priv;
> +	struct drm_pancsf_vm_unmap *args = data;
> +	struct pancsf_vm *vm;
> +	int ret;
> +
> +	if (args->flags & ~PANCSF_VMA_UNMAP_FLAGS)
> +		return -EINVAL;
> +
> +	vm = pancsf_vm_pool_get_vm(pfile->vms, args->vm_id);
> +	if (vm)
> +		ret = pancsf_vm_unmap_range(vm, args->va, args->size);
> +	else
> +		ret = -EINVAL;
> +
> +	pancsf_vm_put(vm);
> +	return ret;
> +}
> +
> +static void *pancsf_get_obj_array(struct drm_pancsf_obj_array *in, u32 min_stride)
> +{
> +	u32 elem_size = min_t(u32, in->stride, min_stride);
> +	int ret = 0;
> +	void *out;
> +
> +	if (in->stride < min_stride)
> +		return ERR_PTR(-EINVAL);
> +
> +	out = kvmalloc_array(in->count, elem_size, GFP_KERNEL);
> +	if (!out)
> +		return ERR_PTR(-ENOMEM);
> +
> +	if (elem_size == in->stride) {
> +		if (copy_from_user(out, u64_to_user_ptr(in->array), elem_size * in->count))
> +			ret = -EFAULT;
> +	} else {
> +		void __user *in_ptr = u64_to_user_ptr(in->array);
> +		void *out_ptr = out;
> +		u32 i;
> +
> +		for (i = 0; i < in->count; i++) {
> +			if (copy_from_user(out_ptr, in_ptr, elem_size)) {
> +				ret = -EFAULT;
> +				break;
> +			}

Missing the increment of out_ptr and in_ptr.

> +		}
> +	}
> +
> +	if (ret) {
> +		kvfree(out);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return out;
> +}
> +
> +static int pancsf_add_job_deps(struct drm_file *file, struct pancsf_job *job,
> +			       struct drm_pancsf_sync_op *sync_ops, u32 sync_op_count)
> +{
> +	u32 i;
> +
> +	for (i = 0; i < sync_op_count; i++) {
> +		struct dma_fence *fence;
> +		int ret;
> +
> +		if (sync_ops[i].op_type != DRM_PANCSF_SYNC_OP_WAIT)
> +			continue;
> +
> +		switch (sync_ops[i].handle_type) {
> +		case DRM_PANCSF_SYNC_HANDLE_TYPE_SYNCOBJ:
> +		case DRM_PANCSF_SYNC_HANDLE_TYPE_TIMELINE_SYNCOBJ:
> +			ret = drm_syncobj_find_fence(file, sync_ops[i].handle,
> +						     sync_ops[i].timeline_value,
> +						     0, &fence);
> +			if (ret)
> +				return ret;
> +
> +			ret = pancsf_add_job_dep(job, fence);
> +			if (ret) {
> +				dma_fence_put(fence);
> +				return ret;
> +			}
> +			break;
> +
> +		default:
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +struct pancsf_sync_signal {
> +	struct drm_syncobj *syncobj;
> +	struct dma_fence_chain *chain;
> +	u64 point;
> +};
> +
> +struct pancsf_sync_signal_array {
> +	struct pancsf_sync_signal *signals;
> +	u32 count;
> +};
> +
> +void
> +pancsf_free_sync_signal_array(struct pancsf_sync_signal_array *array)
> +{
> +	u32 i;
> +
> +	for (i = 0; i < array->count; i++) {
> +		drm_syncobj_put(array->signals[i].syncobj);
> +		dma_fence_chain_free(array->signals[i].chain);
> +	}
> +
> +	kvfree(array->signals);
> +	array->signals = NULL;
> +	array->count = 0;
> +}
> +
> +int
> +pancsf_collect_sync_signal_array(struct drm_file *file,
> +				 struct drm_pancsf_sync_op *sync_ops, u32 sync_op_count,
> +				 struct pancsf_sync_signal_array *array)
> +{
> +	u32 count = 0, i;
> +	int ret;
> +
> +	for (i = 0; i < sync_op_count; i++) {
> +		if (sync_ops[i].op_type == DRM_PANCSF_SYNC_OP_SIGNAL)
> +			count++;
> +	}
> +
> +	array->signals = kvmalloc_array(count, sizeof(*array->signals), GFP_KERNEL | __GFP_ZERO);
> +	if (!array->signals)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < sync_op_count; i++) {
> +		int ret;
> +
> +		if (sync_ops[i].op_type != DRM_PANCSF_SYNC_OP_SIGNAL)
> +			continue;
> +
> +		switch (sync_ops[i].handle_type) {
> +		case DRM_PANCSF_SYNC_HANDLE_TYPE_TIMELINE_SYNCOBJ:
> +			array->signals[array->count].chain = dma_fence_chain_alloc();
> +			if (!array->signals[array->count].chain) {
> +				ret = -ENOMEM;
> +				goto err;
> +			}
> +
> +			array->signals[array->count].point = sync_ops[i].timeline_value;
> +			fallthrough;
> +
> +		case DRM_PANCSF_SYNC_HANDLE_TYPE_SYNCOBJ:
> +			array->signals[array->count].syncobj = drm_syncobj_find(file, sync_ops[i].handle);
> +			if (!array->signals[array->count].syncobj) {
> +				ret = -EINVAL;
> +				goto err;
> +			}
> +
> +			array->count++;

NIT: it's not obvious in this function that array->count is set to 0
initially. It looks like it's correct because
pancsf_ioctl_group_submit() does an alloc with __GFP_ZERO, but it would
be much clearer with a local variable and assigning array->count at the end.

> +			break;
> +
> +		default:
> +			ret = -EINVAL;
> +			goto err;
> +		}
> +	}
> +
> +	return 0;
> +
> +err:
> +	pancsf_free_sync_signal_array(array);
> +	return ret;
> +}

<gigantic snip - sorry, I phased out somewhat reading through all the
code - hopefully when I get a platform and start playing with it
properly I can give some meaningful feedback. Nothing jumped out as
looking seriously wrong>

> diff --git a/include/uapi/drm/pancsf_drm.h b/include/uapi/drm/pancsf_drm.h
> new file mode 100644
> index 000000000000..d770d1d1037c
> --- /dev/null
> +++ b/include/uapi/drm/pancsf_drm.h
> @@ -0,0 +1,414 @@
> +/* SPDX-License-Identifier: MIT */
> +/* Copyright (C) 2023 Collabora ltd. */
> +#ifndef _PANCSF_DRM_H_
> +#define _PANCSF_DRM_H_
> +
> +#include "drm.h"
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +/*
> + * Userspace driver controls GPU cache flushling through CS instructions, but
> + * the flush reduction mechanism requires a flush_id. This flush_id could be
> + * queried with an ioctl, but Arm provides a well-isolated register page
> + * containing only this read-only register, so let's expose this page through
> + * a static mmap offset and allow direct mapping of this MMIO region so we
> + * can avoid the user <-> kernel round-trip.
> + */
> +#define DRM_PANCSF_USER_MMIO_OFFSET		(0xffffull << 48)
> +#define DRM_PANCSF_USER_FLUSH_ID_MMIO_OFFSET	(DRM_PANCSF_USER_MMIO_OFFSET | 0)
> +
> +/* Place new ioctls at the end, don't re-oder. */
> +enum drm_pancsf_ioctl_id {
> +	DRM_PANCSF_DEV_QUERY = 0,
> +	DRM_PANCSF_VM_CREATE,
> +	DRM_PANCSF_VM_DESTROY,
> +	DRM_PANCSF_BO_CREATE,
> +	DRM_PANCSF_BO_MMAP_OFFSET,
> +	DRM_PANCSF_VM_MAP,
> +	DRM_PANCSF_VM_UNMAP,
> +	DRM_PANCSF_GROUP_CREATE,
> +	DRM_PANCSF_GROUP_DESTROY,
> +	DRM_PANCSF_TILER_HEAP_CREATE,
> +	DRM_PANCSF_TILER_HEAP_DESTROY,
> +	DRM_PANCSF_GROUP_SUBMIT,
> +};
> +
> +#define DRM_IOCTL_PANCSF_DEV_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANCSF_DEV_QUERY, struct drm_pancsf_dev_query)
> +#define DRM_IOCTL_PANCSF_VM_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANCSF_VM_CREATE, struct drm_pancsf_vm_create)
> +#define DRM_IOCTL_PANCSF_VM_DESTROY		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANCSF_VM_DESTROY, struct drm_pancsf_vm_destroy)
> +#define DRM_IOCTL_PANCSF_BO_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANCSF_BO_CREATE, struct drm_pancsf_bo_create)
> +#define DRM_IOCTL_PANCSF_BO_MMAP_OFFSET		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANCSF_BO_MMAP_OFFSET, struct drm_pancsf_bo_mmap_offset)
> +#define DRM_IOCTL_PANCSF_VM_MAP			DRM_IOWR(DRM_COMMAND_BASE + DRM_PANCSF_VM_MAP, struct drm_pancsf_vm_map)
> +#define DRM_IOCTL_PANCSF_VM_UNMAP		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANCSF_VM_UNMAP, struct drm_pancsf_vm_unmap)
> +#define DRM_IOCTL_PANCSF_GROUP_CREATE		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANCSF_GROUP_CREATE, struct drm_pancsf_group_create)
> +#define DRM_IOCTL_PANCSF_GROUP_DESTROY		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANCSF_GROUP_DESTROY, struct drm_pancsf_group_destroy)
> +#define DRM_IOCTL_PANCSF_TILER_HEAP_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANCSF_TILER_HEAP_CREATE, struct drm_pancsf_tiler_heap_create)
> +#define DRM_IOCTL_PANCSF_TILER_HEAP_DESTROY	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANCSF_TILER_HEAP_DESTROY, struct drm_pancsf_tiler_heap_destroy)
> +#define DRM_IOCTL_PANCSF_GROUP_SUBMIT		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANCSF_GROUP_SUBMIT, struct drm_pancsf_group_submit)
> +
> +/* Place new types at the end, don't re-oder. */
> +enum drm_pancsf_dev_query_type {
> +	DRM_PANCSF_DEV_QUERY_GPU_INFO = 0,
> +	DRM_PANCSF_DEV_QUERY_CSIF_INFO,
> +};
> +
> +struct drm_pancsf_gpu_info {
> +#define DRM_PANCSF_ARCH_MAJOR(x)		((x) >> 28)
> +#define DRM_PANCSF_ARCH_MINOR(x)		(((x) >> 24) & 0xf)
> +#define DRM_PANCSF_ARCH_REV(x)			(((x) >> 20) & 0xf)
> +#define DRM_PANCSF_PRODUCT_MAJOR(x)		(((x) >> 16) & 0xf)
> +#define DRM_PANCSF_VERSION_MAJOR(x)		(((x) >> 12) & 0xf)
> +#define DRM_PANCSF_VERSION_MINOR(x)		(((x) >> 4) & 0xff)
> +#define DRM_PANCSF_VERSION_STATUS(x)		((x) & 0xf)
> +	__u32 gpu_id;
> +	__u32 gpu_rev;
> +#define DRM_PANCSF_CSHW_MAJOR(x)		(((x) >> 26) & 0x3f)
> +#define DRM_PANCSF_CSHW_MINOR(x)		(((x) >> 20) & 0x3f)
> +#define DRM_PANCSF_CSHW_REV(x)			(((x) >> 16) & 0xf)
> +#define DRM_PANCSF_MCU_MAJOR(x)			(((x) >> 10) & 0x3f)
> +#define DRM_PANCSF_MCU_MINOR(x)			(((x) >> 4) & 0x3f)
> +#define DRM_PANCSF_MCU_REV(x)			((x) & 0xf)
> +	__u32 csf_id;
> +	__u32 l2_features;
> +	__u32 tiler_features;
> +	__u32 mem_features;
> +	__u32 mmu_features;
> +	__u32 thread_features;
> +	__u32 max_threads;
> +	__u32 thread_max_workgroup_size;
> +	__u32 thread_max_barrier_size;
> +	__u32 coherency_features;
> +	__u32 texture_features[4];
> +	__u32 as_present;
> +	__u32 core_group_count;
> +	__u64 shader_present;
> +	__u64 l2_present;
> +	__u64 tiler_present;
> +};
> +
> +struct drm_pancsf_csif_info {
> +	__u32 csg_slot_count;
> +	__u32 cs_slot_count;
> +	__u32 cs_reg_count;
> +	__u32 scoreboard_slot_count;
> +	__u32 unpreserved_cs_reg_count;
> +};
> +
> +struct drm_pancsf_dev_query {
> +	/** @type: the query type (see enum drm_pancsf_dev_query_type). */
> +	__u32 type;
> +
> +	/**
> +	 * @size: size of the type being queried.
> +	 *
> +	 * If pointer is NULL, size is updated by the driver to provide the
> +	 * output structure size. If pointer is not NULL, the the driver will
> +	 * only copy min(size, actual_structure_size) bytes to the pointer,
> +	 * and update the size accordingly. This allows us to extend query
> +	 * types without breaking userspace.
> +	 */
> +	__u32 size;
> +
> +	/**
> +	 * @pointer: user pointer to a query type struct.
> +	 *
> +	 * Pointer can be NULL, in which case, nothing is copied, but the
> +	 * actual structure size is returned. If not NULL, it must point to
> +	 * a location that's large enough to hold size bytes.
> +	 */
> +	__u64 pointer;
> +};

Genuine question: is there something wrong with the panfrost 'get_param'
ioctl where individual features are queried one-by-one, rather than
passing a big structure back to user space.

I ask because we've had issues in the past with trying to 'deprecate'
registers - if a new version of the hardware stops providing a
(meaningful) value for a register then it's hard to fix up the
structures. The get_param method means it's possible to return a failure
for just the register(s) that have disappeared.

There is obviously overhead iterating over all the register that user
space cares about. Another option (used by kbase) is to return some form
of structured data so a missing property can be encoded.

> +
> +struct drm_pancsf_vm_create {
> +	/** @flags: VM flags, MBZ. */
> +	__u32 flags;
> +
> +	/** @id: Returned VM ID */
> +	__u32 id;
> +};
> +
> +struct drm_pancsf_vm_destroy {
> +	/** @id: ID of the VM to destroy */
> +	__u32 id;
> +
> +	/** @pad: MBZ. */
> +	__u32 pad;
> +};
> +
> +struct drm_pancsf_bo_create {
> +	/**
> +	 * @size: Requested size for the object
> +	 *
> +	 * The (page-aligned) allocated size for the object will be returned.
> +	 */
> +	__u64 size;
> +
> +	/**
> +	 * @flags: Flags, currently unused, MBZ.
> +	 */
> +	__u32 flags;
> +
> +	/**
> +	 * @vm_id: Attached VM, if any
> +	 *
> +	 * If a VM is specified, this BO must:
> +	 *
> +	 *  1. Only ever be bound to that VM.
> +	 *
> +	 *  2. Cannot be exported as a PRIME fd.
> +	 */
> +	__u32 vm_id;

Unless I'm mistaken this (vm_id) isn't used (or even checked) by the
current code.

> +
> +	/**
> +	 * @handle: Returned handle for the object.
> +	 *
> +	 * Object handles are nonzero.
> +	 */
> +	__u32 handle;
> +
> +	/* @pad: MBZ. */
> +	__u32 pad;
> +};
> +
> +struct drm_pancsf_bo_mmap_offset {
> +	/** @handle: Handle for the object being mapped. */
> +	__u32 handle;
> +
> +	/** @pad: MBZ. */
> +	__u32 pad;

pancsf_ioctl_bo_mmap_offset is missing validation for this pad field.

> +
> +	/** @offset: The fake offset to use for subsequent mmap call */
> +	__u64 offset;
> +};
> +
> +#define PANCSF_VMA_MAP_READONLY		0x1
> +#define PANCSF_VMA_MAP_NOEXEC		0x2
> +#define PANCSF_VMA_MAP_UNCACHED		0x4
> +#define PANCSF_VMA_MAP_FRAG_SHADER	0x8
> +#define PANCSF_VMA_MAP_ON_FAULT		0x10
> +#define PANCSF_VMA_MAP_AUTO_VA		0x20
> +
> +struct drm_pancsf_vm_map {
> +	/** @vm_id: VM to map BO range to */
> +	__u32 vm_id;
> +
> +	/** @flags: Combination of PANCSF_VMA_MAP_ flags */
> +	__u32 flags;
> +
> +	/** @pad: padding field, MBZ. */
> +	__u32 pad;

Missing validation in pancsf_ioctl_vm_map.

> +
> +	/** @bo_handle: Buffer object to map. */
> +	__u32 bo_handle;
> +
> +	/** @bo_offset: Buffer object offset. */
> +	__u64 bo_offset;
> +
> +	/**
> +	 * @va: Virtual address to map the BO to. Mapping address returned here if
> +	 *	PANCSF_VMA_MAP_ON_FAULT is set.
> +	 */
> +	__u64 va;
> +
> +	/** @size: Size to map. */
> +	__u64 size;
> +};
> +
> +struct drm_pancsf_vm_unmap {
> +	/** @vm_id: VM to map BO range to */
> +	__u32 vm_id;
> +
> +	/** @flags: MBZ. */
> +	__u32 flags;

Validation missing

> +
> +	/** @va: Virtual address to unmap. */
> +	__u64 va;
> +
> +	/** @size: Size to unmap. */
> +	__u64 size;
> +};
> +
> +enum drm_pancsf_sync_op_type {
> +	DRM_PANCSF_SYNC_OP_WAIT = 0,
> +	DRM_PANCSF_SYNC_OP_SIGNAL,
> +};
> +
> +enum drm_pancsf_sync_handle_type {
> +	DRM_PANCSF_SYNC_HANDLE_TYPE_SYNCOBJ = 0,
> +	DRM_PANCSF_SYNC_HANDLE_TYPE_TIMELINE_SYNCOBJ,
> +};
> +
> +struct drm_pancsf_sync_op {
> +	/** @op_type: Sync operation type. */
> +	__u32 op_type;
> +
> +	/** @handle_type: Sync handle type. */
> +	__u32 handle_type;
> +
> +	/** @handle: Sync handle. */
> +	__u32 handle;
> +
> +	/** @flags: MBZ. */
> +	__u32 flags;

I don't see any proper validation that op_type/handle_type/flags are not
invalid.

> +
> +	/** @timeline_value: MBZ if handle_type != DRM_PANCSF_SYNC_HANDLE_TYPE_TIMELINE_SYNCOBJ. */
> +	__u64 timeline_value;
> +};
> +
> +struct drm_pancsf_obj_array {
> +	/** @stride: Stride of object struct. Used for versioning. */
> +	__u32 stride;
> +
> +	/** @count: Number of objects in the array. */
> +	__u32 count;
> +
> +	/** @array: User pointer to an array of objects. */
> +	__u64 array;
> +};
> +
> +#define DRM_PANCSF_OBJ_ARRAY(cnt, ptr) \
> +	{ .stride = sizeof(ptr[0]), .count = cnt, .array = (__u64)(uintptr_t)ptr }
> +
> +struct drm_pancsf_queue_submit {
> +	/** @queue_index: Index of the queue inside a group. */
> +	__u32 queue_index;
> +
> +	/** @stream_size: Size of the command stream to execute. */
> +	__u32 stream_size;
> +
> +	/** @stream_addr: GPU address of the command stream to execute. */
> +	__u64 stream_addr;
> +
> +	/** @syncs: Array of sync operations. */
> +	struct drm_pancsf_obj_array syncs;
> +};
> +
> +struct drm_pancsf_group_submit {
> +	/** @group_handle: Handle of the group to queue jobs to. */
> +	__u32 group_handle;
> +
> +	/** @syncs: Array of queue submit operations. */
> +	struct drm_pancsf_obj_array queue_submits;
> +};
> +
> +struct drm_pancsf_queue_create {
> +	/**
> +	 * @priority: Defines the priority of queues inside a group. Goes from 0 to 15,
> +	 *	      15 being the highest priority.
> +	 */
> +	__u8 priority;
> +
> +	/** @pad: Padding fields, MBZ. */
> +	__u8 pad[3];
> +
> +	/** @ringbuf_size: Size of the ring buffer to allocate to this queue. */

(Must be PAGE_SIZE aligned and at most 64k)

> +	__u32 ringbuf_size;
> +};
> +
> +enum drm_pancsf_group_priority {
> +	PANCSF_GROUP_PRIORITY_LOW = 0,
> +	PANCSF_GROUP_PRIORITY_MEDIUM,
> +	PANCSF_GROUP_PRIORITY_HIGH,
> +};
> +
> +struct drm_pancsf_group_create {
> +	/** @queues: Array of drm_pancsf_create_cs_queue elements. */

NIT: s/drm_pancsf_create_cs_queue/drm_pancsf_queue_create/

> +	struct drm_pancsf_obj_array queues;
> +
> +	/**
> +	 * @max_compute_cores: Maximum number of cores that can be
> +	 *		       used by compute jobs across CS queues
> +	 *		       bound to this group.
> +	 */
> +	__u8 max_compute_cores;
> +
> +	/**
> +	 * @max_fragment_cores: Maximum number of cores that can be
> +	 *			used by fragment jobs across CS queues
> +	 *			bound to this group.
> +	 */
> +	__u8 max_fragment_cores;
> +
> +	/**
> +	 * @max_tiler_cores: Maximum number of tilers that can be
> +	 *		     used by tiler jobs across CS queues
> +	 *		     bound to this group.
> +	 */
> +	__u8 max_tiler_cores;
> +
> +	/** @priority: Group priority (see drm_drm_pancsf_cs_group_priority). */
> +	__u8 priority;
> +
> +	/** @compute_core_mask: Mask encoding cores that can be used for compute jobs. */
> +	__u64 compute_core_mask;
> +
> +	/** @fragment_core_mask: Mask encoding cores that can be used for fragment jobs. */
> +	__u64 fragment_core_mask;
> +
> +	/** @tiler_core_mask: Mask encoding cores that can be used for tiler jobs. */
> +	__u64 tiler_core_mask;
> +
> +	/**
> +	 * @vm_id: VM ID to bind this group to. All submission to queues bound to this
> +	 *	   group will use this VM.
> +	 */
> +	__u32 vm_id;
> +
> +	/*
> +	 * @group_handle: Returned group handle. Passed back when submitting jobs or
> +	 *		  destroying a group.
> +	 */
> +	__u32 group_handle;
> +};
> +
> +struct drm_pancsf_group_destroy {
> +	/** @group_handle: Group to destroy */
> +	__u32 group_handle;
> +
> +	/** @pad: Padding field, MBZ. */
> +	__u32 pad;

No validation for padding

> +};
> +
> +struct drm_pancsf_tiler_heap_create {
> +	/** @vm_id: VM ID the tiler heap should be mapped to */
> +	__u32 vm_id;
> +
> +	/** @initial_chunk_count: Initial number of chunks to allocate. */
> +	__u32 initial_chunk_count;
> +
> +	/** @chunk_size: Chunk size. Must be a power of two at least 256KB large. */
> +	__u32 chunk_size;
> +
> +	/* @max_chunks: Maximum number of chunks that can be allocated. */
> +	__u32 max_chunks;
> +
> +	/** @target_in_flight: Maximum number of in-flight render passes.
> +	 * If exceeded the FW will wait for render passes to finish before
> +	 * queuing new tiler jobs.
> +	 */
> +	__u32 target_in_flight;
> +
> +	/** @handle: Returned heap handle. Passed back to DESTROY_TILER_HEAP. */
> +	__u32 handle;
> +
> +	/** @tiler_heap_ctx_gpu_va: Returned heap GPU virtual address returned */
> +	__u64 tiler_heap_ctx_gpu_va;
> +	__u64 first_heap_chunk_gpu_va;
> +};
> +
> +struct drm_pancsf_tiler_heap_destroy {
> +	/** @handle: Handle of the tiler heap to destroy */
> +	__u32 handle;
> +
> +	/** @pad: Padding field, MBZ. */
> +	__u32 pad;

Validation

> +};
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif /* _PANCSF_DRM_H_ */


Thanks once again for this. I hope to be able to give it a spin soon!

Steve
