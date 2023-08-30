Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D9678D6EB
	for <lists+dri-devel@lfdr.de>; Wed, 30 Aug 2023 17:20:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1A910E54D;
	Wed, 30 Aug 2023 15:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id D271C10E54D
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Aug 2023 15:20:37 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B14922F4;
 Wed, 30 Aug 2023 08:21:16 -0700 (PDT)
Received: from [10.57.92.7] (unknown [10.57.92.7])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE8B33F64C;
 Wed, 30 Aug 2023 08:20:34 -0700 (PDT)
Message-ID: <79e1feff-3d4f-51f7-81f5-dab76a0c2b86@arm.com>
Date: Wed, 30 Aug 2023 16:20:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 09/15] drm/panthor: Add the FW logical block
Content-Language: en-GB
To: Boris Brezillon <boris.brezillon@collabora.com>
References: <20230809165330.2451699-1-boris.brezillon@collabora.com>
 <20230809165330.2451699-10-boris.brezillon@collabora.com>
 <1a3467e4-16d8-f43a-38ea-fcbff6ad36d0@arm.com>
 <20230829181535.40d0ab98@collabora.com>
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230829181535.40d0ab98@collabora.com>
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

On 29/08/2023 17:15, Boris Brezillon wrote:
> On Wed, 16 Aug 2023 17:01:56 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
>> On 09/08/2023 17:53, Boris Brezillon wrote:

[...]

>>> +/**
>>> + * panthor_fw_mem_alloc() - Allocate a FW memory object and map it to the MCU VM.
>>> + * @ptdev: Device.
>>> + * @size: Size of the memory block.
>>> + * @bo_flags: BO flags.
>>> + * @vm_map_flags: VM_MAP flags.
>>> + * @va: Virtual address of the MCU mapping.
>>> + * Set to PANTHOR_GEM_ALLOC_VA for automatic VA-assignment. In that case, the
>>> + * VA will be allocated in the shared VA space.
>>> + *
>>> + * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
>>> + */
>>> +static struct panthor_fw_mem *
>>> +panthor_fw_mem_alloc(struct panthor_device *ptdev, size_t size,
>>> +		     u32 bo_flags, u32 vm_map_flags, u64 va)
>>> +{
>>> +	struct panthor_fw_mem *mem = kzalloc(sizeof(*mem), GFP_KERNEL);
>>> +	int ret;
>>> +
>>> +	if (!mem)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	mem->bo = panthor_gem_create_and_map(ptdev, ptdev->fw->vm,
>>> +					     size, bo_flags, vm_map_flags,
>>> +					     &va, NULL);
>>> +	if (IS_ERR(mem->bo)) {
>>> +		ret = PTR_ERR(mem->bo);
>>> +		mem->bo = NULL;
>>> +		goto err_free_mem;
>>> +	}
>>> +
>>> +	mem->va = va;
>>> +	return mem;
>>> +
>>> +err_free_mem:
>>> +	panthor_fw_mem_free(ptdev, mem);
>>> +	return ERR_PTR(ret);  
>>
>> The error handling seems more complex than needed, how about:
>>
>> 	struct panthor_fw_mem *mem = kzalloc(sizeof(*mem), GFP_KERNEL);
>> 	struct panthor_gem_object *bo;
>> 	int ret;
>>
>> 	if (!mem)
>> 		return ERR_PTR(-ENOMEM);
>>
>> 	bo = panthor_gem_create_and_map(ptdev, ptdev->fw->vm,
>> 					size, bo_flags, vm_map_flags,
>> 					&va, NULL);
>>
>> 	if (IS_ERR(bo)) {
>> 		kfree(mem);
>> 		return ERR_CAST(bo);
>> 	}
>>
>> 	mem->bo = bo;
>> 	mem->va = va;
>> 	return mem;
>> 	
>> Which I think also means we don't need the "if (mem->bo)" case in
>> panthor_fw_mem_free().
> 
> Not so sure about that one. I've been adding code to existing functions
> and having a structured error path, with free functions that can deal
> with partially initialized object makes code addition less error-prone.
> I agree on the local bo variable to avoid mem->bo re-initialization
> though.

Yeah the "free accepting NULL" style is generally a good one, so leaving
the NULL check in panthor_fw_mem_free() is fine. It was just in this
case having to explicitly assign NULL before the call to
panthor_fw_mem_free() looked ugly.

>>
>>> +}
>>> +
> 
> [...]
> 
>>> +/**
>>> + * panthor_fw_alloc_suspend_buf_mem() - Allocate a suspend buffer for a command stream group.
>>> + * @ptdev: Device.
>>> + * @size: Size of the suspend buffer.
>>> + *
>>> + * Return: A valid pointer in case of success, an ERR_PTR() otherwise.
>>> + */
>>> +struct panthor_fw_mem *
>>> +panthor_fw_alloc_suspend_buf_mem(struct panthor_device *ptdev, size_t size)
>>> +{
>>> +	return panthor_fw_mem_alloc(ptdev, size,
>>> +				    DRM_PANTHOR_BO_NO_MMAP,
>>> +				    DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC,
>>> +				    PANTHOR_GEM_ALLOC_VA);
>>> +}
>>> +
>>> +static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>>> +					 const struct firmware *fw,
>>> +					 struct panthor_fw_binary_iter *iter,
>>> +					 u32 ehdr)
>>> +{
>>> +	struct panthor_fw_binary_section_entry_hdr hdr;
>>> +	struct panthor_fw_section *section;
>>> +	u32 section_size;
>>> +	u32 name_len;
>>> +	int ret;
>>> +
>>> +	ret = panthor_fw_binary_iter_read(ptdev, iter, &hdr, sizeof(hdr));
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if (hdr.data.end < hdr.data.start) {
>>> +		drm_err(&ptdev->base, "Firmware corrupted, data.end < data.start (0x%x < 0x%x)\n",
>>> +			hdr.data.end, hdr.data.start);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	if (hdr.va.end < hdr.va.start) {
>>> +		drm_err(&ptdev->base, "Firmware corrupted, hdr.va.end < hdr.va.start (0x%x < 0x%x)\n",
>>> +			hdr.va.end, hdr.va.start);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	if (hdr.data.end > fw->size) {
>>> +		drm_err(&ptdev->base, "Firmware corrupted, file truncated? data_end=0x%x > fw size=0x%zx\n",
>>> +			hdr.data.end, fw->size);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	if ((hdr.va.start & ~PAGE_MASK) != 0 ||
>>> +	    (hdr.va.end & ~PAGE_MASK) != 0) {
>>> +		drm_err(&ptdev->base, "Firmware corrupted, virtual addresses not page aligned: 0x%x-0x%x\n",
>>> +			hdr.va.start, hdr.va.end);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	if (hdr.flags & ~CSF_FW_BINARY_IFACE_ENTRY_RD_SUPPORTED_FLAGS) {
>>> +		drm_err(&ptdev->base, "Firmware contains interface with unsupported flags (0x%x)\n",
>>> +			hdr.flags);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	if (hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_PROT) {
>>> +		drm_warn(&ptdev->base,
>>> +			 "Firmware protected mode entry not be supported, ignoring");
>>> +		return 0;
>>> +	}
>>> +
>>> +	if (hdr.va.start == CSF_MCU_SHARED_REGION_START &&
>>> +	    !(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_SHARED)) {
>>> +		drm_err(&ptdev->base,
>>> +			"Interface at 0x%llx must be shared", CSF_MCU_SHARED_REGION_START);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	name_len = iter->size - iter->offset;
>>> +
>>> +	section = drmm_kzalloc(&ptdev->base, sizeof(*section), GFP_KERNEL);
>>> +	if (!section)
>>> +		return -ENOMEM;
>>> +
>>> +	list_add_tail(&section->node, &ptdev->fw->sections);
>>> +	section->flags = hdr.flags;
>>> +	section->data.size = hdr.data.end - hdr.data.start;
>>> +
>>> +	if (section->data.size > 0) {
>>> +		void *data = drmm_kmalloc(&ptdev->base, section->data.size, GFP_KERNEL);
>>> +
>>> +		if (!data)
>>> +			return -ENOMEM;
>>> +
>>> +		memcpy(data, fw->data + hdr.data.start, section->data.size);
>>> +		section->data.buf = data;
>>> +	}
>>> +
>>> +	if (name_len > 0) {
>>> +		char *name = drmm_kmalloc(&ptdev->base, name_len + 1, GFP_KERNEL);
>>> +
>>> +		if (!name)
>>> +			return -ENOMEM;
>>> +
>>> +		memcpy(name, iter->data + iter->offset, name_len);
>>> +		name[name_len] = '\0';
>>> +		section->name = name;
>>> +	}
>>> +
>>> +	section_size = hdr.va.end - hdr.va.start;
>>> +	if (section_size) {
>>> +		u32 cache_mode = hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_MASK;
>>> +		u32 vm_map_flags = 0;
>>> +		struct sg_table *sgt;
>>> +		u64 va = hdr.va.start;
>>> +
>>> +		if (!(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_WR))
>>> +			vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_READONLY;
>>> +
>>> +		if (!(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_EX))
>>> +			vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC;
>>> +
>>> +		/* TODO: CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_*_COHERENT are mapped to
>>> +		 * non-cacheable for now. We might want to introduce a new
>>> +		 * IOMMU_xxx flag (or abuse IOMMU_MMIO, which maps to device
>>> +		 * memory and is currently not used by our driver) for
>>> +		 * AS_MEMATTR_AARCH64_SHARED memory, so we can take benefit
>>> +		 * of IO-coherent systems.
>>> +		 */
>>> +		if (cache_mode != CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_CACHED)
>>> +			vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED;
>>> +
>>> +		/* Shared section is in the auto-VA range. We need to
>>> +		 * reserve the VA range so it's not allocated to someone else.
>>> +		 */
>>> +		if (va >= CSF_MCU_SHARED_REGION_START &&
>>> +		    va < CSF_MCU_SHARED_REGION_START + CSF_MCU_SHARED_REGION_SIZE)
>>> +			va = PANTHOR_GEM_ALLOC_VA;
>>> +
>>> +		section->mem = panthor_fw_mem_alloc(ptdev, section_size,
>>> +						    DRM_PANTHOR_BO_NO_MMAP,
>>> +						    vm_map_flags, va);
>>> +		if (IS_ERR(section->mem))
>>> +			return PTR_ERR(section->mem);
>>> +
>>> +		if (drm_WARN_ON(&ptdev->base, section->mem->va != hdr.va.start))
>>> +			return -EINVAL;
>>> +
>>> +		panthor_fw_init_section_mem(ptdev, section);
>>> +
>>> +		sgt = drm_gem_shmem_get_pages_sgt(&section->mem->bo->base);
>>> +		if (IS_ERR(sgt))
>>> +			return PTR_ERR(section->mem);
>>> +
>>> +		dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
>>> +
>>> +		if (section->flags & CSF_FW_BINARY_IFACE_ENTRY_RD_SHARED) {
>>> +			if (!panthor_fw_mem_vmap(section->mem))  
>>
>> Moving this before panthor_fw_init_section_mem() would avoid an
>> unnecessary unmap/remap - althought this isn't exactly a performance path...
> 
> Sure, I can do that.
> 
>>
>>> +				return -ENOMEM;
>>> +		}
>>> +	}
>>> +
>>> +	if (hdr.va.start == CSF_MCU_SHARED_REGION_START)
>>> +		ptdev->fw->shared_section = section;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static void
>>> +panthor_reload_fw_sections(struct panthor_device *ptdev, bool full_reload)
>>> +{
>>> +	struct panthor_fw_section *section;
>>> +
>>> +	list_for_each_entry(section, &ptdev->fw->sections, node) {
>>> +		struct sg_table *sgt;
>>> +
>>> +		if (!full_reload && !(section->flags & CSF_FW_BINARY_IFACE_ENTRY_RD_WR))
>>> +			continue;
>>> +
>>> +		panthor_fw_init_section_mem(ptdev, section);
>>> +		sgt = drm_gem_shmem_get_pages_sgt(&section->mem->bo->base);
>>> +		if (!drm_WARN_ON(&ptdev->base, IS_ERR_OR_NULL(sgt)))
>>> +			dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
>>> +	}
>>> +}
>>> +
>>> +static int panthor_fw_load_entry(struct panthor_device *ptdev,
>>> +				 const struct firmware *fw,
>>> +				 struct panthor_fw_binary_iter *iter)
>>> +{
>>> +	struct panthor_fw_binary_iter eiter;
>>> +	u32 ehdr;
>>> +	int ret;
>>> +
>>> +	ret = panthor_fw_binary_iter_read(ptdev, iter, &ehdr, sizeof(ehdr));
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if ((iter->offset % sizeof(u32)) ||
>>> +	    (CSF_FW_BINARY_ENTRY_SIZE(ehdr) % sizeof(u32))) {
>>> +		drm_err(&ptdev->base, "Firmware entry isn't 32 bit aligned, offset=0x%x size=0x%x\n",
>>> +			(u32)(iter->offset - sizeof(u32)), CSF_FW_BINARY_ENTRY_SIZE(ehdr));
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	eiter.offset = 0;
>>> +	eiter.data = iter->data + iter->offset;
>>> +	eiter.size = CSF_FW_BINARY_ENTRY_SIZE(ehdr) - sizeof(ehdr);
>>> +	iter->offset += eiter.size;  
>>
>> There should really be a check like:
>>
>> 	if (iter->offset < eiter.size)
>> 		return -EINVAL;
> 
> Uh, I thought I had added size checks everywhere, but I apparently
> missed some places.
> 
>>
>> otherwise I think it's possible for a corrupt firmware to cause us to
>> run off the end of the buffer. Ideally the check would look something
>> more like the one in panthor_fw_binary_iter_read() (dealing with
>> potential overflow). I'm wondering if it makes sense to allow
>> panthor_fw_binary_iter_read() with a NULL 'out' and check the return
>> value. That way we can replace "iter->offset += eiter.size" with:
>>
>> 	ret = panthor_fw_binary_iter_read(ptdev, iter, NULL,
>> 					  eiter.size);
>> 	if (ret)
>> 		return ret;
>>
>> (or have a new _skip() function)
> 
> Might make sense to add a panthor_fw_binary_sub_iter_init() helper that
> would take care of doing the size check on the main iter, Unless you
> see other places requiring a size check that are not expressed as
> sub-iterators.

It was only the sub-iterators that I spotted the missing size check. A
helper for the sub-iterators is probably more clear than my 'skip' function.

[...]

>>> +struct panthor_fw_ringbuf_input_iface {
>>> +	u64 insert;
>>> +	u64 extract;
>>> +} __packed;
>>> +
>>> +struct panthor_fw_ringbuf_output_iface {
>>> +	u64 extract;
>>> +	u32 active;
>>> +} __packed;  
>>
>> Is there a good reason for these to be marked '__packed'? They are
>> naturally aligned so there's no padding, and we guarantee they are page
>> aligned. The compiler might have more freedom if they are not marked
>> __packed.
> 
> Nope, no good reason.
> 
>>
>>> +
>>> +struct panthor_fw_cs_control_iface {
>>> +#define CS_FEATURES_WORK_REGS(x)		(((x) & GENMASK(7, 0)) + 1)
>>> +#define CS_FEATURES_SCOREBOARDS(x)		(((x) & GENMASK(15, 8)) >> 8)
>>> +#define CS_FEATURES_COMPUTE			BIT(16)
>>> +#define CS_FEATURES_FRAGMENT			BIT(17)
>>> +#define CS_FEATURES_TILER			BIT(18)
>>> +	u32 features;
>>> +	u32 input_va;
>>> +	u32 output_va;
>>> +} __packed;  
>>
>> Here I have to admit I can't find a statement in the spec saying that
>> the stride must be a multiple of 4 bytes... but kbase makes that assumption.
> 
> The stride of?

The stride of this structure (panthor_fw_cs_control_iface or
STREAM_CONTROL_BLOCK in the spec). The stride is defined by
GROUP_CONTROL_BLOCK::GROUP_STREAM_STRIDE
(panthor_fw_cs_control_iface->stream_stride here), but the spec doesn't
specify that the FW must obey any restrictions on the stride. For that
reason the use of __packed here is technically correct (the FW could
choose a stride which causes this structure to be mis-aligned).

In reality the firmware always aligns to 4 bytes and kbase depends on
this. And I've raised this internally, so hopefully a future spec will
include the 4 byte alignment requirement.

TLDR; the __packed specifiers shouldn't be needed on any of these
structures.

>>
>>> +
>>> +struct panthor_fw_cs_input_iface {
>>> +#define CS_STATE_MASK				GENMASK(2, 0)
>>> +#define CS_STATE_STOP				0
>>> +#define CS_STATE_START				1
>>> +#define CS_EXTRACT_EVENT			BIT(4)
>>> +#define CS_IDLE_SYNC_WAIT			BIT(8)
>>> +#define CS_IDLE_PROTM_PENDING			BIT(9)
>>> +#define CS_IDLE_EMPTY				BIT(10)
>>> +#define CS_IDLE_RESOURCE_REQ			BIT(11)
>>> +#define CS_TILER_OOM				BIT(26)
>>> +#define CS_PROTM_PENDING			BIT(27)
>>> +#define CS_FATAL				BIT(30)
>>> +#define CS_FAULT				BIT(31)
>>> +#define CS_REQ_MASK				(CS_STATE_MASK | \
>>> +						 CS_EXTRACT_EVENT | \
>>> +						 CS_IDLE_SYNC_WAIT | \
>>> +						 CS_IDLE_PROTM_PENDING | \
>>> +						 CS_IDLE_EMPTY | \
>>> +						 CS_IDLE_RESOURCE_REQ)
>>> +#define CS_EVT_MASK				(CS_TILER_OOM | \
>>> +						 CS_PROTM_PENDING | \
>>> +						 CS_FATAL | \
>>> +						 CS_FAULT)
>>> +	u32 req;
>>> +
>>> +#define CS_CONFIG_PRIORITY(x)			((x) & GENMASK(3, 0))
>>> +#define CS_CONFIG_DOORBELL(x)			(((x) << 8) & GENMASK(15, 8))
>>> +	u32 config;
>>> +	u32 reserved1;
>>> +	u32 ack_irq_mask;
>>> +	u64 ringbuf_base;
>>> +	u32 ringbuf_size;
>>> +	u32 reserved2;
>>> +	u64 heap_start;
>>> +	u64 heap_end;
>>> +	u64 ringbuf_input;
>>> +	u64 ringbuf_output;
>>> +	u32 instr_config;
>>> +	u32 instrbuf_size;
>>> +	u64 instrbuf_base;
>>> +	u64 instrbuf_offset_ptr;
>>> +} __packed;  
>>
>> The spec says this has a minimal alignment of 64 bytes. Although I guess
>> the code should check this if we remove __packed and rely on it.
> 
> The allocation granularity is 4k, and we're not even in control of the
> offset inside the FW interface section. So yes, we can check it when
> parsing the FW sections, but there's no point adding __aligned() here.

Sorry, no I wasn't intending that we'd add __aligned() - I was just
trying to justify (to myself) that the __packed wasn't necessary.

>>
>>> +
>>> +struct panthor_fw_cs_output_iface {
>>> +	u32 ack;
>>> +	u32 reserved1[15];
>>> +	u64 status_cmd_ptr;
>>> +
>>> +#define CS_STATUS_WAIT_SB_MASK			GENMASK(15, 0)
>>> +#define CS_STATUS_WAIT_SB_SRC_MASK		GENMASK(19, 16)
>>> +#define CS_STATUS_WAIT_SB_SRC_NONE		(0 << 16)
>>> +#define CS_STATUS_WAIT_SB_SRC_WAIT		(8 << 16)
>>> +#define CS_STATUS_WAIT_SYNC_COND_LE		(0 << 24)
>>> +#define CS_STATUS_WAIT_SYNC_COND_GT		(1 << 24)
>>> +#define CS_STATUS_WAIT_SYNC_COND_MASK		GENMASK(27, 24)
>>> +#define CS_STATUS_WAIT_PROGRESS			BIT(28)
>>> +#define CS_STATUS_WAIT_PROTM			BIT(29)
>>> +#define CS_STATUS_WAIT_SYNC_64B			BIT(30)
>>> +#define CS_STATUS_WAIT_SYNC			BIT(31)
>>> +	u32 status_wait;
>>> +	u32 status_req_resource;
>>> +	u64 status_wait_sync_ptr;
>>> +	u32 status_wait_sync_value;
>>> +	u32 status_scoreboards;
>>> +
>>> +#define CS_STATUS_BLOCKED_REASON_UNBLOCKED	0
>>> +#define CS_STATUS_BLOCKED_REASON_SB_WAIT	1
>>> +#define CS_STATUS_BLOCKED_REASON_PROGRESS_WAIT	2
>>> +#define CS_STATUS_BLOCKED_REASON_SYNC_WAIT	3
>>> +#define CS_STATUS_BLOCKED_REASON_DEFERRED	5
>>> +#define CS_STATUS_BLOCKED_REASON_RES		6
>>> +#define CS_STATUS_BLOCKED_REASON_FLUSH		7
>>> +#define CS_STATUS_BLOCKED_REASON_MASK		GENMASK(3, 0)
>>> +	u32 status_blocked_reason;
>>> +	u32 status_wait_sync_value_hi;
>>> +	u32 reserved2[6];
>>> +
>>> +#define CS_EXCEPTION_TYPE(x)			((x) & GENMASK(7, 0))
>>> +#define CS_EXCEPTION_DATA(x)			(((x) >> 8) & GENMASK(23, 0))
>>> +	u32 fault;
>>> +	u32 fatal;
>>> +	u64 fault_info;
>>> +	u64 fatal_info;
>>> +	u32 reserved3[10];
>>> +	u32 heap_vt_start;
>>> +	u32 heap_vt_end;
>>> +	u32 reserved4;
>>> +	u32 heap_frag_end;
>>> +	u64 heap_address;
>>> +} __packed;  
>>
>> output is the same as input.
> 
> You mean in term of alignment?

Yep. (Sorry I did a terrible job of explaining myself here - I got
rather distracted trying to work out what alignment was guaranteed by
the spec for all these different structures).

>>
>>> +
>>> +struct panthor_fw_csg_control_iface {
>>> +	u32 features;
>>> +	u32 input_va;
>>> +	u32 output_va;
>>> +	u32 suspend_size;
>>> +	u32 protm_suspend_size;
>>> +	u32 stream_num;
>>> +	u32 stream_stride;
>>> +} __packed;  
>>
>> The spec is ambigious here. It one place it states the stride is 256
>> bytes, but in another that you need to look at the GLB_GROUP_STRIDE
>> value. In practice we can rely on 4 byte alignment.
>>
>> I'm beginning to wonder if it's worth worrying about, I think I'll stop
>> here ;)
> 
> Hehe. I'll add checks where I can in the parsing logic. I guess having
> things naturally aligned and making sure there's no overlap with other
> interfaces is a minimum.

Yes that would be good, and like I said there should be a clarification
in later specs that everything is (at least) 4 byte aligned.

Apparently the 256 byte stride mentioned in one place was due to the way
the structure was expressed in the XML and the XML->HTML tool
calculating it. Or in one word: 'wrong'! ;)

Steve

