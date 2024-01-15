Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9126682D870
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 12:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E586210E252;
	Mon, 15 Jan 2024 11:37:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [IPv6:2a00:1098:ed:100::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDB910E252
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 11:37:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705318672;
 bh=8wBKDlG5KKr3QG65mdviLLdYI1chbe4EPhnYyiY9MVs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=i50S0L9WODm4EMqK8gmgIYCEIcuMmTufxObS2W5ukrPk3SHA3YCU1e76517lrR+yQ
 vHE/pK0/TFfWqoy6wHBXWLaCgIV/cqxSpKTmVcusH3pLWZAvuUPyvOgc9tOo/aDAuD
 xRfI0F6fDOrXehhE4RjTuY6VbojyCze2sUgrEN1dFWu2FzvxUoSuxDc3quOW+tp3nb
 84mMPd4zrFY8ykS96UOq8OlMniOacoQUyqpKrAFxFnegxA1tDc6uAWRIJsiw6h3ET4
 TsCoEut4OGrjrN+t97cu7W5fcTPMtW34DjLNECR+LqmrlesMPCtqHprQrffFCeRtV3
 2O7d44rHj1goQ==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id B94403780EC6;
 Mon, 15 Jan 2024 11:37:51 +0000 (UTC)
Date: Mon, 15 Jan 2024 12:37:50 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chris Diamand <chris.diamand@foss.arm.com>
Subject: Re: [PATCH v3 08/14] drm/panthor: Add the FW logical block
Message-ID: <20240115123750.28564ede@collabora.com>
In-Reply-To: <62049a0e-1441-47a5-8369-8f05028d76ec@foss.arm.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-9-boris.brezillon@collabora.com>
 <62049a0e-1441-47a5-8369-8f05028d76ec@foss.arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Daniel Stone <daniels@collabora.com>,
 Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2zDqW1lbnQgUMOpcm9u?= <peron.clem@gmail.com>, kernel@collabora.com,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>, "Marty E .
 Plummer" <hanetzer@startmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 18 Dec 2023 21:25:16 +0000
Chris Diamand <chris.diamand@foss.arm.com> wrote:

> On 04/12/2023 17:33, Boris Brezillon wrote:
> > Contains everything that's FW related, that includes the code dealing
> > with the microcontroller unit (MCU) that's running the FW, and anything
> > related to allocating memory shared between the FW and the CPU.
> > 
> > A few global FW events are processed in the IRQ handler, the rest is
> > forwarded to the scheduler, since scheduling is the primary reason for
> > the FW existence, and also the main source of FW <-> kernel
> > interactions.
> > 
> > v3:
> > - Make the FW path more future-proof (Liviu)
> > - Use one waitqueue for all FW events
> > - Simplify propagation of FW events to the scheduler logic
> > - Drop the panthor_fw_mem abstraction and use panthor_kernel_bo instead
> > - Account for the panthor_vm changes
> > - Replace magic number with 0x7fffffff with ~0 to better signify that
> >   it's the maximum permitted value.
> > - More accurate rounding when computing the firmware timeout.
> > - Add a 'sub iterator' helper function. This also adds a check that a
> >   firmware entry doesn't overflow the firmware image.
> > - Drop __packed from FW structures, natural alignment is good enough.
> > - Other minor code improvements.
> > 
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > Signed-off-by: Steven Price <steven.price@arm.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_fw.c | 1332 ++++++++++++++++++++++++++
> >  drivers/gpu/drm/panthor/panthor_fw.h |  504 ++++++++++
> >  2 files changed, 1836 insertions(+)
> >  create mode 100644 drivers/gpu/drm/panthor/panthor_fw.c
> >  create mode 100644 drivers/gpu/drm/panthor/panthor_fw.h
> > 
> > diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> > new file mode 100644
> > index 000000000000..85afe769f567
> > --- /dev/null
> > +++ b/drivers/gpu/drm/panthor/panthor_fw.c  
> 
> ...
> > +static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
> > +					 const struct firmware *fw,
> > +					 struct panthor_fw_binary_iter *iter,
> > +					 u32 ehdr)
> > +{
> > +	struct panthor_fw_binary_section_entry_hdr hdr;
> > +	struct panthor_fw_section *section;
> > +	u32 section_size;
> > +	u32 name_len;
> > +	int ret;
> > +
> > +	ret = panthor_fw_binary_iter_read(ptdev, iter, &hdr, sizeof(hdr));
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (hdr.data.end < hdr.data.start) {
> > +		drm_err(&ptdev->base, "Firmware corrupted, data.end < data.start (0x%x < 0x%x)\n",
> > +			hdr.data.end, hdr.data.start);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (hdr.va.end < hdr.va.start) {
> > +		drm_err(&ptdev->base, "Firmware corrupted, hdr.va.end < hdr.va.start (0x%x < 0x%x)\n",
> > +			hdr.va.end, hdr.va.start);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (hdr.data.end > fw->size) {
> > +		drm_err(&ptdev->base, "Firmware corrupted, file truncated? data_end=0x%x > fw size=0x%zx\n",
> > +			hdr.data.end, fw->size);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if ((hdr.va.start & ~PAGE_MASK) != 0 ||
> > +	    (hdr.va.end & ~PAGE_MASK) != 0) {
> > +		drm_err(&ptdev->base, "Firmware corrupted, virtual addresses not page aligned: 0x%x-0x%x\n",
> > +			hdr.va.start, hdr.va.end);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (hdr.flags & ~CSF_FW_BINARY_IFACE_ENTRY_RD_SUPPORTED_FLAGS) {
> > +		drm_err(&ptdev->base, "Firmware contains interface with unsupported flags (0x%x)\n",
> > +			hdr.flags);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_PROT) {
> > +		drm_warn(&ptdev->base,
> > +			 "Firmware protected mode entry not be supported, ignoring");
> > +		return 0;
> > +	}
> > +
> > +	if (hdr.va.start == CSF_MCU_SHARED_REGION_START &&
> > +	    !(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_SHARED)) {
> > +		drm_err(&ptdev->base,
> > +			"Interface at 0x%llx must be shared", CSF_MCU_SHARED_REGION_START);
> > +		return -EINVAL;
> > +	}
> > +
> > +	name_len = iter->size - iter->offset;
> > +
> > +	section = drmm_kzalloc(&ptdev->base, sizeof(*section), GFP_KERNEL);
> > +	if (!section)
> > +		return -ENOMEM;
> > +
> > +	list_add_tail(&section->node, &ptdev->fw->sections);
> > +	section->flags = hdr.flags;
> > +	section->data.size = hdr.data.end - hdr.data.start;
> > +
> > +	if (section->data.size > 0) {
> > +		void *data = drmm_kmalloc(&ptdev->base, section->data.size, GFP_KERNEL);
> > +
> > +		if (!data)
> > +			return -ENOMEM;
> > +
> > +		memcpy(data, fw->data + hdr.data.start, section->data.size);
> > +		section->data.buf = data;
> > +	}
> > +
> > +	if (name_len > 0) {
> > +		char *name = drmm_kmalloc(&ptdev->base, name_len + 1, GFP_KERNEL);
> > +
> > +		if (!name)
> > +			return -ENOMEM;
> > +
> > +		memcpy(name, iter->data + iter->offset, name_len);
> > +		name[name_len] = '\0';
> > +		section->name = name;
> > +	}
> > +
> > +	section_size = hdr.va.end - hdr.va.start;
> > +	if (section_size) {
> > +		u32 cache_mode = hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_MASK;
> > +		struct panthor_gem_object *bo;
> > +		u32 vm_map_flags = 0;
> > +		struct sg_table *sgt;
> > +		u64 va = hdr.va.start;
> > +
> > +		if (!(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_WR))
> > +			vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_READONLY;
> > +
> > +		if (!(hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_RD_EX))
> > +			vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_NOEXEC;
> > +
> > +		/* TODO: CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_*_COHERENT are mapped to
> > +		 * non-cacheable for now. We might want to introduce a new
> > +		 * IOMMU_xxx flag (or abuse IOMMU_MMIO, which maps to device
> > +		 * memory and is currently not used by our driver) for
> > +		 * AS_MEMATTR_AARCH64_SHARED memory, so we can take benefit
> > +		 * of IO-coherent systems.
> > +		 */
> > +		if (cache_mode != CSF_FW_BINARY_IFACE_ENTRY_RD_CACHE_MODE_CACHED)
> > +			vm_map_flags |= DRM_PANTHOR_VM_BIND_OP_MAP_UNCACHED;
> > +
> > +		section->mem = panthor_kernel_bo_create(ptdev, panthor_fw_vm(ptdev),
> > +							section_size,
> > +							DRM_PANTHOR_BO_NO_MMAP,
> > +							vm_map_flags, va);
> > +		if (IS_ERR(section->mem))
> > +			return PTR_ERR(section->mem);  
> 
> There's a small bug here - if panthor_kernel_bo_create() fails, section->mem will be
> left containing an error value, not NULL or a valid pointer.
> 
> This means that on rmmod, panthor_fw_unplug() will try and free the BO even though it
> was never allocated, causing a kernel panic.
> 
> The solution is obviously to only assign section->mem if the allocation actually succeeded.

Indeed.

> 
> However I also wonder if the list_add_tail() call should be moved to later in the function,
> after we know everything else has succeeded, or if this function needs some more error
> handling in general.

Actually, I did the insertion early such that any initialization step
that needs to be undone if something fails in the middle doesn't have
to take place in some additional error path in this function, but only
in panthor_fw_unplug() instead. What I lack though, is an

	if (!IS_ERR_OR_NULL(section->mem))
		panthor_kernel_bo_destroy()

in panthor_fw_unplug().

> 
> > +
> > +		if (drm_WARN_ON(&ptdev->base, section->mem->va_node.start != hdr.va.start))
> > +			return -EINVAL;
> > +
> > +		if (section->flags & CSF_FW_BINARY_IFACE_ENTRY_RD_SHARED) {
> > +			ret = panthor_kernel_bo_vmap(section->mem);
> > +			if (ret)
> > +				return ret;
> > +		}
> > +
> > +		panthor_fw_init_section_mem(ptdev, section);
> > +
> > +		bo = to_panthor_bo(section->mem->obj);
> > +		sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
> > +		if (IS_ERR(sgt))
> > +			return PTR_ERR(section->mem);
> > +
> > +		dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
> > +	}
> > +
> > +	if (hdr.va.start == CSF_MCU_SHARED_REGION_START)
> > +		ptdev->fw->shared_section = section;
> > +
> > +	return 0;
> > +}
> > +  
> 
> ...
> 
> > +/**
> > + * panthor_fw_unplug() - Called when the device is unplugged.
> > + * @ptdev: Device.
> > + *
> > + * This function must make sure all pending operations are flushed before
> > + * will release device resources, thus preventing any interaction with
> > + * the HW.
> > + *
> > + * If there is still FW-related work running after this function returns,
> > + * they must use drm_dev_{enter,exit}() and skip any HW access when
> > + * drm_dev_enter() returns false.
> > + */
> > +void panthor_fw_unplug(struct panthor_device *ptdev)
> > +{
> > +	struct panthor_fw_section *section;
> > +
> > +	cancel_delayed_work_sync(&ptdev->fw->watchdog.ping_work);
> > +
> > +	/* Make sure the IRQ handler can be called after that point. */
> > +	if (ptdev->fw->irq.irq)
> > +		panthor_job_irq_suspend(&ptdev->fw->irq);
> > +
> > +	panthor_fw_stop(ptdev);
> > +
> > +	if (ptdev->fw->vm)
> > +		panthor_vm_idle(ptdev->fw->vm);
> > +
> > +	list_for_each_entry(section, &ptdev->fw->sections, node)
> > +		panthor_kernel_bo_destroy(panthor_fw_vm(ptdev), section->mem);  
> 
> Here's where we destroy the potentially invalid section->mem.
> 
> Note that the issues are twofold:
> Firstly, section->mem could be an error pointer as mentioned earlier.
> Secondly, panthor_kernel_bo_destroy() doesn't actually check for error values or even NULL.
> 
> It would probably be worth adding NULL checks to panthor_kernel_bo_destroy() and panthor_kernel_bo_vunmap() to protect against this.

Or we just add an

	if (IS_ERR_OR_NULL(section->mem))

check here instead, unless we have other call sites where kernel_bo
can be ERR_OR_NULL.

> 
> > +
> > +	panthor_vm_put(ptdev->fw->vm);
> > +
> > +	panthor_gpu_power_off(ptdev, L2, ptdev->gpu_info.l2_present, 20000);
> > +}
> > +  
> 
> Cheers,
> Chris

