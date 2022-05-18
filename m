Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BE152B839
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 13:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5464B10E02D;
	Wed, 18 May 2022 11:03:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 43E9810E02D
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 11:03:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B537423A;
 Wed, 18 May 2022 04:03:42 -0700 (PDT)
Received: from [10.57.36.134] (unknown [10.57.36.134])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C53403F718;
 Wed, 18 May 2022 04:03:41 -0700 (PDT)
Message-ID: <f2e9b614-427c-1838-3250-0e7ecc442dee@arm.com>
Date: Wed, 18 May 2022 12:03:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/1] drm/panfrost: Add support for devcoredump
Content-Language: en-GB
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>,
 robh@kernel.org, tomeu.vizoso@collabora.com,
 alyssa.rosenzweig@collabora.com, dri-devel@lists.freedesktop.org
References: <20220517174216.381287-1-adrian.larumbe@collabora.com>
 <20220517174216.381287-2-adrian.larumbe@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20220517174216.381287-2-adrian.larumbe@collabora.com>
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

On 17/05/2022 18:42, Adrián Larumbe wrote:
> In the event of a job timeout, debug dump information will be written into
> /sys/class/devcoredump.
> 
> Inspired by etnaviv's similar feature.
> 
> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>

Nice! Some comments below.

> ---
>  drivers/gpu/drm/panfrost/Kconfig         |   1 +
>  drivers/gpu/drm/panfrost/Makefile        |   3 +-
>  drivers/gpu/drm/panfrost/panfrost_dump.c | 198 +++++++++++++++++++++++
>  drivers/gpu/drm/panfrost/panfrost_dump.h |  12 ++
>  drivers/gpu/drm/panfrost/panfrost_job.c  |   3 +
>  include/uapi/drm/panfrost_drm.h          |  32 ++++
>  6 files changed, 248 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.c
>  create mode 100644 drivers/gpu/drm/panfrost/panfrost_dump.h
> 
> diff --git a/drivers/gpu/drm/panfrost/Kconfig b/drivers/gpu/drm/panfrost/Kconfig
> index 86cdc0ce79e6..079600328be1 100644
> --- a/drivers/gpu/drm/panfrost/Kconfig
> +++ b/drivers/gpu/drm/panfrost/Kconfig
> @@ -11,6 +11,7 @@ config DRM_PANFROST
>  	select DRM_GEM_SHMEM_HELPER
>  	select PM_DEVFREQ
>  	select DEVFREQ_GOV_SIMPLE_ONDEMAND
> +	select WANT_DEV_COREDUMP
>  	help
>  	  DRM driver for ARM Mali Midgard (T6xx, T7xx, T8xx) and
>  	  Bifrost (G3x, G5x, G7x) GPUs.
> diff --git a/drivers/gpu/drm/panfrost/Makefile b/drivers/gpu/drm/panfrost/Makefile
> index b71935862417..7da2b3f02ed9 100644
> --- a/drivers/gpu/drm/panfrost/Makefile
> +++ b/drivers/gpu/drm/panfrost/Makefile
> @@ -9,6 +9,7 @@ panfrost-y := \
>  	panfrost_gpu.o \
>  	panfrost_job.o \
>  	panfrost_mmu.o \
> -	panfrost_perfcnt.o
> +	panfrost_perfcnt.o \
> +	panfrost_dump.o
>  
>  obj-$(CONFIG_DRM_PANFROST) += panfrost.o
> diff --git a/drivers/gpu/drm/panfrost/panfrost_dump.c b/drivers/gpu/drm/panfrost/panfrost_dump.c
> new file mode 100644
> index 000000000000..a76dcf4acf6f
> --- /dev/null
> +++ b/drivers/gpu/drm/panfrost/panfrost_dump.c
> @@ -0,0 +1,198 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/* Copyright 2021 Collabora ltd. */
> +
> +#include <linux/err.h>
> +#include <linux/device.h>
> +#include <linux/devcoredump.h>
> +#include <linux/moduleparam.h>
> +#include <linux/iosys-map.h>
> +#include <drm/panfrost_drm.h>
> +#include <drm/drm_device.h>
> +
> +#include "panfrost_job.h"
> +#include "panfrost_gem.h"
> +#include "panfrost_regs.h"
> +#include "panfrost_dump.h"
> +#include "panfrost_device.h"
> +
> +static bool panfrost_dump_core = true;
> +module_param_named(dump_core, panfrost_dump_core, bool, 0600);
> +
> +struct panfrost_dump_iterator {
> +	void *start;
> +	struct panfrost_dump_object_header *hdr;
> +	void *data;
> +};
> +
> +static const unsigned short panfrost_dump_registers[] = {
> +	GPU_ID,
> +	GPU_L2_FEATURES,
> +	GPU_CORE_FEATURES,
> +	GPU_TILER_FEATURES,
> +	GPU_MEM_FEATURES,
> +	GPU_MMU_FEATURES,
> +	GPU_AS_PRESENT,
> +	GPU_JS_PRESENT,
> +	GPU_INT_RAWSTAT,
> +	GPU_INT_CLEAR,
> +	GPU_INT_MASK,
> +	GPU_INT_STAT,
> +};

It would be nice to also dump the contents of JS_HEAD/JS_TAIL and the
exception status (i.e. what panfrost_job_handle_err() prints). Although
I'm not sure how easy it is to plumb that in at the moment. The handling
of job faults in the Panfrost driver isn't great. So maybe that can wait
for a v2 and we can rely on dmesg for now.

To be honest this list of registers is a little random, some (like
JS_PRESENT) are almost entirely useless, but then we're missing some
which userspace uses such as most of the GPU_THREAD_xxx registers,
although usually when debugging such things you are well aware of the
platform the dump comes from.

But I'm not an expert on debugging descriptors - my approach in the past
with the similar kbase feature has been to simply replay the specific
job on a software model of the GPU (hence the value of JS_HEAD/JS_TAIL).

You may find the list of registers that kbase dumps[1] to be an
interesting reference, the set is designed to spot kernel bugs (e.g.
core power states being different from expected) and allow the job which
failed to be replayed. In the blob this is combined with a debugfs file
which allows dumping the complete GPU memory[2] and userspace code to
trigger a dump after a job fault. These can then be combined to make a
'dump file' which our tools allow replaying on the model, hardware or RTL.

[1]
https://github.com/LibreELEC/mali-midgard/blob/TX011-SW-99002-r28p0-01rel0/driver/product/kernel/drivers/gpu/arm/midgard/backend/gpu/mali_kbase_debug_job_fault_backend.c

[2]
https://github.com/LibreELEC/mali-midgard/blob/TX011-SW-99002-r28p0-01rel0/driver/product/kernel/drivers/gpu/arm/midgard/mali_kbase_debug_mem_view.c

> +
> +static void panfrost_core_dump_header(struct panfrost_dump_iterator *iter,
> +	u32 type, void *data_end)
> +{
> +	struct panfrost_dump_object_header *hdr = iter->hdr;
> +
> +	hdr->magic = cpu_to_le32(PANFROSTDUMP_MAGIC);
> +	hdr->type = cpu_to_le32(type);
> +	hdr->file_offset = cpu_to_le32(iter->data - iter->start);
> +	hdr->file_size = cpu_to_le32(data_end - iter->data);
> +
> +	iter->hdr++;
> +	iter->data += le32_to_cpu(hdr->file_size);
> +}
> +
> +static void
> +panfrost_core_dump_registers(struct panfrost_dump_iterator *iter,
> +			     struct panfrost_device *pfdev)
> +{
> +	struct panfrost_dump_registers *reg = iter->data;
> +	unsigned int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(panfrost_dump_registers); i++, reg++) {
> +		reg->reg = cpu_to_le32(panfrost_dump_registers[i]);
> +		reg->value = cpu_to_le32(gpu_read(pfdev, panfrost_dump_registers[i]));
> +	}
> +
> +	panfrost_core_dump_header(iter, PANFROSTDUMP_BUF_REG, reg);
> +}
> +
> +void panfrost_core_dump(struct panfrost_job *job)
> +{
> +	struct panfrost_device *pfdev = job->pfdev;
> +	struct panfrost_dump_iterator iter;
> +	struct drm_gem_object *dbo;
> +	unsigned int n_obj, n_bomap_pages;
> +	__le64 *bomap, *bomap_start;
> +	size_t file_size;
> +	int ret, i;
> +
> +	/* Only catch the first event, or when manually re-armed */
> +	if (!panfrost_dump_core)
> +		return;
> +	panfrost_dump_core = false;
> +
> +	/* At least, we dump registers and end marker */
> +	n_obj = 2;
> +	n_bomap_pages = 0;
> +	file_size = ARRAY_SIZE(panfrost_dump_registers) *
> +			sizeof(struct panfrost_dump_registers);
> +
> +	/* Add in the active buffer objects */
> +	for (i = 0; i < job->bo_count; i++) {
> +		dbo = job->bos[i];
> +		file_size += dbo->size;
> +		n_bomap_pages += dbo->size >> PAGE_SHIFT;
> +		n_obj++;
> +	}
> +
> +	/* If we have any buffer objects, add a bomap object */
> +	if (n_bomap_pages) {
> +		file_size += n_bomap_pages * sizeof(__le64);

Here you are using sizeof(__le64)....

> +		n_obj++;
> +	}
> +
> +	/* Add the size of the headers */
> +	file_size += sizeof(*iter.hdr) * n_obj;
> +
> +	/* Allocate the file in vmalloc memory, it's likely to be big */
> +	iter.start = __vmalloc(file_size, GFP_KERNEL | __GFP_NOWARN |
> +			__GFP_NORETRY);
> +	if (!iter.start) {
> +		dev_warn(pfdev->dev, "failed to allocate devcoredump file\n");
> +		return;
> +	}
> +
> +	/* Point the data member after the headers */
> +	iter.hdr = iter.start;
> +	iter.data = &iter.hdr[n_obj];
> +
> +	memset(iter.hdr, 0, iter.data - iter.start);
> +
> +	/*
> +	 * For now, we write the job identifier in the register dump header,
> +	 * so that we can decode the entire dump later with pandecode
> +	 */
> +	iter.hdr->jc = cpu_to_le64(job->jc);
> +	iter.hdr->version = cpu_to_le32(PANFROSTDUMP_VERSION_1);
> +	iter.hdr->gpu_id = cpu_to_le32(pfdev->features.id);
> +	iter.hdr->nbos = cpu_to_le64(job->bo_count);
> +
> +	panfrost_core_dump_registers(&iter, pfdev);
> +
> +	/* Reserve space for the bomap */
> +	if (n_bomap_pages) {
> +		bomap_start = bomap = iter.data;
> +		memset(bomap, 0, sizeof(*bomap) * n_bomap_pages);

... but here it's sizeof(*bomap). I prefer the latter (and consistency).

> +		panfrost_core_dump_header(&iter, PANFROSTDUMP_BUF_BOMAP,
> +					  bomap + n_bomap_pages);
> +	} else {
> +		/* Silence warning */
> +		bomap_start = bomap = NULL;

There's some confusion between using job->bo_count and checking
n_bomap_pages to check if there are any BOs. I've not tried it but I
suspect if you were to check job->bo_count!=0 then the compiler might be
able to follow what's going on and you wouldn't need to silence any
warnings. Certainly it would make it easier to read for the humans which
would be good.

> +	}
> +
> +	for (i = 0; i < job->bo_count; i++) {
> +		struct iosys_map map;
> +		struct panfrost_gem_mapping *mapping;
> +		struct panfrost_gem_object *bo;
> +		struct sg_page_iter page_iter;
> +		void *vaddr;
> +
> +		bo = to_panfrost_bo(job->bos[i]);
> +		mapping = job->mappings[i];
> +
> +		if (!bo->base.sgt) {
> +			dev_err(pfdev->dev, "Panfrost Dump: BO has no sgt, cannot dump\n");
> +			iter.hdr->valid = 0;
> +			continue;

In this case the header isn't written out - there's no call to
panfrost_core_dump_header(). Which I think means things will get out of
sync - certainly the valid==0 case won't reach the dump output.

> +		}
> +
> +		ret = drm_gem_shmem_vmap(&bo->base, &map);
> +		if (ret) {
> +			dev_err(pfdev->dev, "Panfrost Dump: couldn't map Buffer Object\n");
> +			iter.hdr->valid = 0;
> +			continue;

Same again

> +		}
> +
> +		WARN_ON(!mapping->active);
> +
> +		iter.hdr->data[0] = cpu_to_le32((bomap - bomap_start));
> +
> +		for_each_sgtable_page(bo->base.sgt, &page_iter, 0) {
> +			struct page *page = sg_page_iter_page(&page_iter);
> +
> +			if (!IS_ERR(page))
> +				*bomap++ = cpu_to_le64(page_to_phys(page));
> +			else {
> +				dev_err(pfdev->dev, "Panfrost Dump: wrong page\n");
> +				*bomap++ = ~cpu_to_le64(0);
> +			}
> +		}

I'm puzzled as to why you want the physical addresses? I can't imagine
what it would be useful for. From what I can see from the Mesa code the
address is just printed but otherwise completely ignored. Unless you are
actively debugging the MMU code for the GPU I've never found the
physical addresses useful.

> +
> +		iter.hdr->iova = cpu_to_le64(mapping->mmnode.start << PAGE_SHIFT);
> +
> +		vaddr = map.vaddr;
> +		memcpy(iter.data, vaddr, bo->base.base.size);
> +
> +		drm_gem_shmem_vunmap(&bo->base, &map);
> +
> +		iter.hdr->valid = cpu_to_le32(1);
> +
> +		panfrost_core_dump_header(&iter, PANFROSTDUMP_BUF_BO, iter.data +
> +					  bo->base.base.size);
> +	}
> +	panfrost_core_dump_header(&iter, PANFROSTDUMP_BUF_END, iter.data);
> +
> +	dev_coredumpv(pfdev->dev, iter.start, iter.data - iter.start, GFP_KERNEL);
> +}
> diff --git a/drivers/gpu/drm/panfrost/panfrost_dump.h b/drivers/gpu/drm/panfrost/panfrost_dump.h
> new file mode 100644
> index 000000000000..7d9bcefa5346
> --- /dev/null
> +++ b/drivers/gpu/drm/panfrost/panfrost_dump.h
> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright 2021 Collabora ltd.
> + */
> +
> +#ifndef PANFROST_DUMP_H
> +#define PANFROST_DUMP_H
> +
> +struct panfrost_job;
> +void panfrost_core_dump(struct panfrost_job *job);
> +
> +#endif
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/panfrost/panfrost_job.c
> index fda5871aebe3..f506d0ea067c 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -20,6 +20,7 @@
>  #include "panfrost_regs.h"
>  #include "panfrost_gpu.h"
>  #include "panfrost_mmu.h"
> +#include "panfrost_dump.h"
>  
>  #define JOB_TIMEOUT_MS 500
>  
> @@ -727,6 +728,8 @@ static enum drm_gpu_sched_stat panfrost_job_timedout(struct drm_sched_job
>  		job_read(pfdev, JS_TAIL_LO(js)),
>  		sched_job);
>  
> +	panfrost_core_dump(job);
> +
>  	atomic_set(&pfdev->reset.pending, 1);
>  	panfrost_reset(pfdev, sched_job);
>  
> diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
> index 9e40277d8185..a4e988be8478 100644
> --- a/include/uapi/drm/panfrost_drm.h
> +++ b/include/uapi/drm/panfrost_drm.h
> @@ -224,6 +224,38 @@ struct drm_panfrost_madvise {
>  	__u32 retained;       /* out, whether backing store still exists */
>  };
>  
> +/* Definitions for coredump decoding in user space */
> +enum {
> +	PANFROSTDUMP_MAGIC = 0xCAFECAFE,

Please can we have a magic which is specific to Panfrost. E.g. something
like 0x464e4150 ('PANF'), (although if you can think of something more
original even better! ;) ). 0xCAFE is a bad choice because everyone uses
it and it has no relation to Panfrost.

Also I can see from the Mesa review Alyssa has already pointed out that
MAGIC should be a #define and not in this enum.

On the subject of enums: I personally don't like them in UABI header
files - it's too easy to accidentially change the numbering. So I'd be
happier with #defines for the others too...

> +	PANFROSTDUMP_BUF_REG = 0,
> +	PANFROSTDUMP_BUF_BOMAP,
> +	PANFROSTDUMP_BUF_BO,
> +	PANFROSTDUMP_BUF_END,

... in particular this BUF_END looks suspiciously like it's just marking
the current number of types - but it's actually part of the dump format
and must always be 3 forever more (at least in version 1 of the dump
format). Although etnaviv has the same, so perhaps this is just me?

> +};
> +
> +#define PANFROSTDUMP_VERSION_1 1

I'm not sure how much it matters for a dump, but it's often useful to
have a major/minor concept for version numbers. E.g. we might want to
add an extra type which previous dump tools could just skip (i.e. a
minor version upgrade).

> +
> +struct panfrost_dump_object_header {
> +	__le32 magic;
> +	__le32 type;
> +	__le32 version;
> +	__le32 bifrost;

bifrost is never set/used.

> +	__le64 nbos;
> +	__le64 jc;
> +	__le32 file_offset;
> +	__le32 file_size;
> +	__le64 iova;
> +	__le32 gpu_id;

The GPU ID is already dumped as a register, so I'm not sure why it needs
to be here again.

> +	__le32 valid;
> +	__le32 data[2];
> +};

Also there's a number of fields here which are only relevant for a
particular value of type. E.g. jc/gpu_id/nbos/version - these could be
encoded into the data[] array rather than being left empty (I think this
is how etnaviv does it).

Alternativaly we could have an embedded union for the different types, e.g.:

struct panfrost_dump_object_header {
	__le32 magic;
	__le32 type;
	union {
		struct panfrost_dump_job {
			__le64 jc;
			__le32 nbos;
			...
		} job;
		struct panfrost_dump_bo {
			__le64 iova;
			...
		} bo;
		// Optional sizer to allow us to expand without
		// changing the structure size
		__le32 sizer[X];
	};
}

This is the style I've used in the past for extensible file formats.
Alternatively you can have a simple "magic, type, length" generic header
followed by a custom structure for each type. That way you don't have
any unused padding and the parser can still skip parts that it doesn't
understand.

Thanks,

Steve

> +
> +/* Registers object, an array of these */
> +struct panfrost_dump_registers {
> +	__le32 reg;
> +	__le32 value;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif

