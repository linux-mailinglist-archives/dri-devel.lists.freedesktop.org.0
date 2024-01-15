Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64BC782D93B
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 13:56:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5595110E29D;
	Mon, 15 Jan 2024 12:56:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91FF410E29D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 12:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1705323375;
 bh=4rBvvrfTDG2xAJuqtMbqViWD4XZcImq20nlqD9zkpyg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=f06//rJ0EZq1bvMDD9F29HDggL09SAgHh01uMV1zsA0zWTCMLIjnQRa8/l4NnjGu5
 V+tbkhxdzJXI4ORU2oNjnvXjx9VWCep4+7ryP3TKNafSlahszHMaiOP+Z3dQES7AUW
 2hbxYdUwlrj1XMWdVgyEq3Y3DorN0N5oEwqFwIvXTTqGNGCnLzN6bav8Za6JepAfnn
 pzYObgrCLXur7jXLsqG5syTboe1cpSsqmcBC+sFFk0nLMzSucc0oZAX2VTeZTwj8jf
 C1vXDoAE1/kQpewmjjn/71TQ2Flb+71A2MExYZ9m1zHNBrXktvOjBZO1QYPPNSsqgj
 qk70d/0Wrf9eA==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 5670A3780624;
 Mon, 15 Jan 2024 12:56:14 +0000 (UTC)
Date: Mon, 15 Jan 2024 13:56:12 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Liviu Dudau <Liviu.Dudau@arm.com>
Subject: Re: [PATCH v3 08/14] drm/panthor: Add the FW logical block
Message-ID: <20240115135612.4b440568@collabora.com>
In-Reply-To: <ZYMET9YdCJAcdVD0@e110455-lin.cambridge.arm.com>
References: <20231204173313.2098733-1-boris.brezillon@collabora.com>
 <20231204173313.2098733-9-boris.brezillon@collabora.com>
 <ZYMET9YdCJAcdVD0@e110455-lin.cambridge.arm.com>
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
Cc: Nicolas Boichat <drinkcat@chromium.org>, kernel@collabora.com,
 Daniel Stone <daniels@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>,
 =?UTF-8?B?Q2w=?= =?UTF-8?B?w6ltZW50IFDDqXJvbg==?= <peron.clem@gmail.com>,
 "Marty E . Plummer" <hanetzer@startmail.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 20 Dec 2023 15:12:15 +0000
Liviu Dudau <Liviu.Dudau@arm.com> wrote:

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
> 
> I think here we should return PTR_ERR(sgt).

Will fix.

> 
> In general I agree with Chris that the list_add_tail() call should be delayed
> until all of the above allocations and preparations have succeeded.

If you don't mind, I'd rather patch panthor_fw_unplug() so it can deal
with partially initialized mem sections than adding an error path to
panthor_fw_load_section_entry().
