Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD0395D04E
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2024 16:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56C2810E082;
	Fri, 23 Aug 2024 14:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=boris.brezillon@collabora.com header.b="J/LrY7np";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3396810E082
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Aug 2024 14:46:22 +0000 (UTC)
Delivered-To: daniel.almeida@collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1724424376; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FyJt/XplByzSzcGfkfkD0L9FmOE+Tf9DwgmeEwZrZybPGYsormWIH3L8sBZWgwTdKw5vDBc0OGWP0qM/zQEmIXmtT4v1b7d61fF+NsMujs0Ex66vqsf27WXYWgOb0W3LSAprn7naUGctp6b0Z9Uhw8KCLO0rCxiG6qKXpjzJwZM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1724424376;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=r1beJeiKHlCI5PJay8A3Wq7xubHfoG7hWD8CtIsNlbU=; 
 b=gl47rt2kr19eDaAEkv8aP6/7huwGNdPm8Z5Gk3s8bf++fISiOo0E+lCXakVB4OZQfIU8A66u0+IHl4efKqyy1aUwt2gjEx/9vYHAfHZ8TgPBGRKwH+IEdqDOP2spQNfRPbNOzYHYd+Xxp334vtRgIwxF98GOjEAsba5tPyVrX2M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=boris.brezillon@collabora.com;
 dmarc=pass header.from=<boris.brezillon@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724424376; 
 s=zohomail; d=collabora.com; i=boris.brezillon@collabora.com; 
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=r1beJeiKHlCI5PJay8A3Wq7xubHfoG7hWD8CtIsNlbU=;
 b=J/LrY7npamXK8cxlDyfZAGEZHKCQlZ/l89JVGNEfzZXbJQhhixgS1m3l8AUT5NR0
 fIMifyno9J0A3mqseOCfA63n9Lx9lyPrILlOz0x9mLiTlCAfYxIOJSLjwu4jymf4+7Q
 L9ocGbI0//zmMzXl7fjkTyCEeLMgQSVCtknVIksU=
Received: by mx.zohomail.com with SMTPS id 1724424374353762.6549573697081;
 Fri, 23 Aug 2024 07:46:14 -0700 (PDT)
Date: Fri, 23 Aug 2024 16:46:08 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: liviu.dudau@arm.com, steven.price@arm.com, carsten.haitzler@arm.com,
 robh@kernel.org, faith.ekstrand@collabora.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 RESEND 2/5] drm: panthor: add devcoredump support
Message-ID: <20240823164608.3cbfb5c4@collabora.com>
In-Reply-To: <20240821143826.3720-3-daniel.almeida@collabora.com>
References: <20240710225011.275153-1-daniel.almeida@collabora.com>
 <20240821143826.3720-1-daniel.almeida@collabora.com>
 <20240821143826.3720-3-daniel.almeida@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

Hi Daniel

On Wed, 21 Aug 2024 11:37:28 -0300
Daniel Almeida <daniel.almeida@collabora.com> wrote:

[...]

> +static void *alloc_bytes(struct dump_allocator *alloc, size_t size)
> +{
> +	void *ret;
> +
> +	if (alloc->pos + size > alloc->capacity)
> +		return ERR_PTR(-ENOMEM);
> +
> +	ret = alloc->curr;

Hm, I suspect we might want to enforce some kind of alignment to make
sure things can be directly dereferenced without having to copy stuff.

> +	alloc->curr += size;
> +	alloc->pos += size;
> +	return ret;
> +}
> +
> +static struct drm_panthor_dump_header *
> +alloc_header(struct dump_allocator *alloc, u32 type, size_t size)
> +{
> +	struct drm_panthor_dump_header *hdr;
> +	int header_size = sizeof(*hdr);
> +
> +	hdr = alloc_bytes(alloc, header_size);
> +	if (IS_ERR(hdr))
> +		return hdr;
> +
> +	hdr->magic = PANT_DUMP_MAGIC;
> +	hdr->header_type = type;
> +	hdr->header_size = header_size;
> +	hdr->data_size = size;
> +	return hdr;
> +}
> +
> +static int dump_bo(struct panthor_device *ptdev, u8 *dst,
> +		   struct drm_gem_object *obj, int offset, int size)
> +{
> +	struct iosys_map map = {};
> +	int ret;
> +
> +	ret = drm_gem_vmap_unlocked(obj, &map);

This drm_gem_vmap_unlocked() call will be problematic as soon as you
call the dump logic from any of the scheduler work which are part of
the dma fence signalling path (see [1] for more details). TLDR; in this
path you're not allowed to block on a dma_resv_lock(), which
drm_gem_vmap_unlocked() does. You also can't call the locked variant,
otherwise you're breaking the lock_held assumption.

I had a quick look at the Xe driver which has a similar architecture
and implements devcoredump, and they do the dumping in 2 steps to
work around this:

1. In the fault path, they collect VA regions and their associated BOs
(they call that a VM snapshot) and a bunch of other information you
only have at fault time (other kind of snapshots) and might disappear if
you don't save them somewhere. All allocations in this path are done
with GFP_NOWAIT (see below for an explanation). They then use
dev_coredumpm() instead of dev_coredumpv(), so they don't have to
allocate memory for the final dump, and instead stream the dump when
userspace reads the core file.

2. In their xe_devcoredump_read() function, they can dump the BO content
because we're allowed to take the resv lock in that path. Not to
mention we no longer duplicate the BO data: it just leaves in the
original BO and is streamed when userspace reads the coredump file.

> +	if (ret)
> +		return ret;
> +
> +	drm_dbg(&ptdev->base, "dumping bo %p, offset %d, size %d\n", obj,
> +		offset, size);
> +
> +	memcpy(dst, map.vaddr + offset, size);
> +	drm_gem_vunmap_unlocked(obj, &map);
> +	return ret;
> +}
> +

[...]

> +
> +int panthor_core_dump(struct panthor_core_dump_args *args)
> +{
> +	u8 *mem;
> +	int dump_size;
> +	int ret = 0;
> +	struct dump_allocator alloc = {};
> +	struct vm_dump_count va_count = {};
> +	struct drm_panthor_dump_header *hdr;
> +	struct drm_panthor_dump_version *version;
> +	struct drm_panthor_gpu_info *gpu_info;
> +	struct drm_panthor_csif_info *csif_info;
> +	struct drm_panthor_fw_info *fw_info;
> +	struct queue_count group_and_q_cnt = {};
> +	struct dump_va_args dump_va_args = {};
> +	struct drm_panthor_dump_group_info group_info;
> +	struct dump_group_args dump_group_args;
> +
> +	panthor_vm_foreach_va(args->group_vm, count_va_cb, &va_count);
> +
> +	panthor_sched_get_groupinfo(args->group, &group_info);
> +
> +	count_queues(&group_and_q_cnt, &group_info);
> +
> +	dump_size = compute_dump_size(&va_count, &group_and_q_cnt);
> +
> +	mem = vzalloc(dump_size);

The dumper will be called in a path where it can't block on allocation,
because blocking/non-failable allocations might trigger the future
panthor shrinker that might in turn wait on fences that can't be
signalled because we're blocked waiting on devcoredump to complete its
dump.

You should use kvzalloc(GFP_NOWAIT) in this path.

> +	if (!mem)
> +		return ret;
> +
> +	alloc = (struct dump_allocator){
> +		.start = mem,
> +		.curr = mem,
> +		.pos = 0,
> +		.capacity = dump_size,
> +	};
> +
> +	hdr = alloc_header(&alloc, DRM_PANTHOR_DUMP_HEADER_TYPE_VERSION,
> +			   sizeof(struct drm_panthor_dump_version));
> +	if (IS_ERR(hdr)) {
> +		ret = PTR_ERR(hdr);
> +		goto free_valloc;
> +	}
> +
> +	version = alloc_bytes(&alloc, sizeof(*version));
> +	if (IS_ERR(version)) {
> +		ret = PTR_ERR(version);
> +		goto free_valloc;
> +	}
> +
> +	*version = (struct drm_panthor_dump_version){
> +		.major = PANT_DUMP_MAJOR,
> +		.minor = PANT_DUMP_MINOR,
> +	};
> +
> +	hdr = alloc_header(&alloc, DRM_PANTHOR_DUMP_HEADER_TYPE_GPU_INFO,
> +			   sizeof(args->ptdev->gpu_info));
> +	if (IS_ERR(hdr)) {
> +		ret = PTR_ERR(hdr);
> +		goto free_valloc;
> +	}
> +
> +	gpu_info = alloc_bytes(&alloc, sizeof(*gpu_info));
> +	if (IS_ERR(gpu_info)) {
> +		ret = PTR_ERR(gpu_info);
> +		goto free_valloc;
> +	}
> +
> +	*gpu_info = args->ptdev->gpu_info;
> +
> +	hdr = alloc_header(&alloc, DRM_PANTHOR_DUMP_HEADER_TYPE_CSIF_INFO,
> +			   sizeof(args->ptdev->csif_info));
> +	if (IS_ERR(hdr)) {
> +		ret = PTR_ERR(hdr);
> +		goto free_valloc;
> +	}
> +
> +	csif_info = alloc_bytes(&alloc, sizeof(*csif_info));
> +	if (IS_ERR(csif_info)) {
> +		ret = PTR_ERR(csif_info);
> +		goto free_valloc;
> +	}
> +
> +	*csif_info = args->ptdev->csif_info;
> +
> +	hdr = alloc_header(&alloc, DRM_PANTHOR_DUMP_HEADER_TYPE_FW_INFO,
> +			   sizeof(args->ptdev->fw_info));
> +	if (IS_ERR(hdr)) {
> +		ret = PTR_ERR(hdr);
> +		goto free_valloc;
> +	}
> +
> +	fw_info = alloc_bytes(&alloc, sizeof(*fw_info));
> +	if (IS_ERR(fw_info)) {
> +		ret = PTR_ERR(fw_info);
> +		goto free_valloc;
> +	}
> +
> +	*fw_info = args->ptdev->fw_info;
> +
> +	dump_va_args.ptdev = args->ptdev;
> +	dump_va_args.alloc = &alloc;
> +	ret = panthor_vm_foreach_va(args->group_vm, dump_va_cb, &dump_va_args);
> +	if (ret)
> +		goto free_valloc;
> +
> +	dump_group_args =
> +		(struct dump_group_args){ args->ptdev, &alloc, args->group };
> +	panthor_sched_get_groupinfo(args->group, &group_info);
> +	dump_group_info(&dump_group_args, &group_info);
> +
> +	if (alloc.pos < dump_size)
> +		drm_warn(&args->ptdev->base,
> +			 "dump size mismatch: expected %d, got %zu\n",
> +			 dump_size, alloc.pos);
> +
> +	dev_coredumpv(args->ptdev->base.dev, alloc.start, alloc.pos,
> +		      GFP_KERNEL);
> +
> +	return ret;
> +
> +free_valloc:
> +	vfree(mem);
> +	return ret;
> +}

[...]

> diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
> index e235cf452460..82ec0f20c49e 100644
> --- a/include/uapi/drm/panthor_drm.h
> +++ b/include/uapi/drm/panthor_drm.h
> @@ -969,6 +969,130 @@ struct drm_panthor_tiler_heap_destroy {
>  	__u32 pad;
>  };
>  
> +/**
> + * enum drm_panthor_dump_header_type - Identifies the type of data that follows
> + * in a panthor core dump.
> + */
> +enum drm_panthor_dump_header_type {
> +	DRM_PANTHOR_DUMP_HEADER_TYPE_VERSION = 0,
> +	/**
> +	 * @DRM_PANTHOR_DUMP_HEADER_TYPE_GPU_INFO: Gpu information.
> +	 */
> +	DRM_PANTHOR_DUMP_HEADER_TYPE_GPU_INFO = 1,
> +	/**
> +	 * @DRM_PANTHOR_DUMP_HEADER_TYPE_CSIF_INFO: Command stream interface information.
> +	 */
> +	DRM_PANTHOR_DUMP_HEADER_TYPE_CSIF_INFO = 2,
> +	/**
> +	 * @DRM_PANTHOR_DUMP_HEADER_TYPE_FW_INFO: Information about the firmware.
> +	 */
> +	DRM_PANTHOR_DUMP_HEADER_TYPE_FW_INFO = 3,
> +	/**
> +	 * @DRM_PANTHOR_DUMP_HEADER_TYPE_VM: A dump of the VM for the context.
> +	 */
> +	DRM_PANTHOR_DUMP_HEADER_TYPE_VM = 4,
> +	/**
> +	 * @DRM_PANTHOR_DUMP_HEADER_TYPE_GROUP_INFO: Describes a group. A dump can
> +	 * contain either the faulty group, or all groups for the DRM FD.

Let's decide on one. Given getting back to a drm_file from a faulty job
is not easy, I think we should focus on dumping the faulty group only
for now.

> +	 */
> +	DRM_PANTHOR_DUMP_HEADER_TYPE_GROUP_INFO = 5,
> +	/**
> +	 * @DRM_PANTHOR_DUMP_HEADER_TYPE_QUEUE_INFO: Describes a faulty queue. This
> +	 * will immediately follow a group info.
> +	 */
> +	DRM_PANTHOR_DUMP_HEADER_TYPE_QUEUE_INFO = 6,

Given a group has a maximum of 32 queues (see MAX_CS_PER_CSG), I'm not
sure we should split the group and queue info into 2 different
sections. Just add a

	struct drm_panthor_dump_queue_info queues[32];

field to drm_panthor_dump_queue_info and you should be good.

> +};
> +
> +/**
> + * struct drm_panthor_dump_header - A header that describes a section of a panthor core dump.
> + */
> +struct drm_panthor_dump_header {

I would call that one dump_section or dump_section_header.

> +	/** @magic: Always set to PANT (0x544e4150). */
> +	__u32 magic;

Not convinced we need to repeat the magic for each header. Having one
in the coredump entry should probably be enough.

> +
> +	/** @header_type: Identifies the type of data in the following section of the

For multiline doc headers, we use the following format:

	/**
	 * @xxx: blabla
	 *
	 * ...

> +	 * core dump file
> +	 */
> +	enum drm_panthor_dump_header_type header_type;
> +
> +	/** @header_size: The size of the header.
> +	 *
> +	 * This is for backward-compatibility purposes in case this structure is
> +	 * augmented in the future. It allows userspace to skip over the header and
> +	 * access the actual data it describes.
> +	 */
> +	__u32 header_size;

Feels like the section itself could embed the extra information needed,
with a new header_type so the old version keeps working. Not convinced
we will ever need anything more in the header that couldn't be
expressed through other means to be honest. There's one interesting
purpose for this field though: enforcing alignment of the following
data. Another way of doing that would be to split the headers and
content, and have the headers provide an explicit data_offset.

> +
> +	/** @data_size: The size of the following section */
> +	__u32 data_size;

If we want to make that future-proof, we should probably use an u64
here.

> +};
> +
> +/**
> + * struct drm_panthor_dump_version - Version information for a Panthor GPU dump.
> + *
> + * This structure is used to hold version information when performing a dump of
> + * the state of a Panthor GPU.
> + */
> +struct drm_panthor_dump_version {

I would move the magic here and call that one drm_panthor_dump_header.

> +	/** @major: Versioning information for backwards compatibility */
> +	__u32 major;

Please add an blank line between each field definition.

> +	/** @minor: Versioning information for backwards compatibility */
> +	__u32 minor;
> +};
> +
> +/**
> + * struct drm_panthor_dump_group_info - Group information for a Panthor GPU
> + * dump.
> + *
> + * This structure is used to hold information about a group when performing a
> + * dump of the state of a Panthor GPU.
> + */
> +struct drm_panthor_dump_group_info {
> +	/** @queue_count: The number of queues in the group. */
> +	__u32 queue_count;
> +	/** @faulty_queues: A bitmask denoting the faulty queues */
> +	__u32 faulty_bitmask;
> +};
> +
> +#define DRM_PANTHOR_DUMP_QUEUE_INFO_FLAGS_FAULTY	(1 << 0)
> +
> +/**
> + * struct drm_panthor_dump_queue_info - Queue information for a Panthor GPU
> + * dump.
> + *
> + * This structure is used to hold information about a queue when performing a
> + * dump of the state of a Panthor GPU.
> + */
> +struct drm_panthor_dump_queue_info {
> +	/** See DRM_PANTHOR_DUMP_QUEUE_INFO_FLAGS_XXX */
> +	u32 flags;
> +	/** @cs_id: The ID of the command stream. */
> +	__s32 cs_id;
> +	/** @faulty: Whether this queue has faulted */

There's no field defined, just the doc.

> +	/** @ringbuf_gpuva: The GPU virtual address of the ring buffer. */
> +	__u64 ringbuf_gpuva;
> +	/** @ringbuf_insert: The insert point (i.e.: offset) in the ring buffer. This
> +	 * is where a instruction would be inserted next by the CPU.
> +	 */
> +	__u64 ringbuf_insert;
> +	/** @ringbuf_extract: The extract point (i.e.: offset) in the ring buffer.
> +	 * This is where the GPU would read the next instruction.
> +	 */
> +	__u64 ringbuf_extract;

Is it not encoding the current ring buffer position, rather than the
next one? For instance, I would expect us to pass
ringbuf_gpuva + (ringbuf_extract % ringbuf_size) to the userspace
decoder if we want to follow the flow of instructions that lead to the
GPU fault.

> +	/** @ringbuf_size: The size of the ring buffer */
> +	__u64 ringbuf_size;

I think it's also interesting to dump
panthor_fw_cs_output_iface::status_cmd_ptr so we know exactly which CS
instruction was being executed when the crash happened (I can imagine
the faulty instruction being pointed at in pandecode). Actually, I think
pretty much everything in panthor_fw_cs_output_iface is interesting to
have. Beware that most of the information in panthor_fw_cs_output_iface
are only valid after a STATUS_UPDATE or SUSPEND operation, so probably
something to look at when you take the faulty group snapshot.

> +};
> +
> +/**
> + * struct drm_panthor_dump_gpuva - Describes a GPU VA range in the dump.
> + */
> +struct drm_panthor_dump_gpuva {
> +	/** @addr: The start address for the mapping */
> +	__u64 addr;
> +	/** @range: The range covered by the VA mapping */
> +	__u64 range;
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif

That's it for now. I didn't focus much on the implementation as I think
the redesign I suggested will significantly change it.

Regards,

Boris

[1]https://elixir.bootlin.com/linux/v6.10.4/source/drivers/dma-buf/dma-fence.c#L195
