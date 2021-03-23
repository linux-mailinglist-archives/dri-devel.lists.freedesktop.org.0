Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 252F334612B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 15:16:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA376E8BE;
	Tue, 23 Mar 2021 14:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 756AC6E8BE
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 14:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YB0TWDLPYVEfjCZHSpM9+30NS8HHF0fF1mXgtu7Kgxc=; b=hFAOAGjxCzX0l37Ixu8+lKqhJ1
 2V2Gk9Pyobh1b5Jkn7Pq2OMD5CV7cvIMSXRtixDR7sIngt1ojckqp/w5PYW15kNND2gEltBtsmSd4
 po827Mjxd56TGGkNKECGY6aTNshnKQ4CnxokJyBTE6WOoUBgqr63KcbemeaV0OIWFbNvwekHb+cTO
 eN2reTbeGKwhbSMiGgaGd7Yzj3i1c9bd9iO3r8qnFPAYmGIdBFCgYY25ruz0Ikb1Us5/s4lUxTAhG
 iDNrzgWY4LKI4GiUk/Hf78cbTF0PdZ0RVWx/kWY3W+weX01ybjc1GfIBc3NpMIVAj8bWJQvEvxHy/
 Z7ppa2RA==;
Received: from dsl-hkibng22-54f986-236.dhcp.inet.fi ([84.249.134.236]
 helo=[192.168.1.10])
 by mail.kapsi.fi with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <cyndis@kapsi.fi>)
 id 1lOhpB-0003V0-Os; Tue, 23 Mar 2021 16:16:01 +0200
Subject: Re: [PATCH v5 20/21] drm/tegra: Implement job submission part of new
 UAPI
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <20210111130019.3515669-21-mperttunen@nvidia.com>
 <YFnvQYvT7E/kCAuj@orome.fritz.box>
From: Mikko Perttunen <cyndis@kapsi.fi>
Message-ID: <49820423-e3aa-6c99-b92f-3d3ece739ed7@kapsi.fi>
Date: Tue, 23 Mar 2021 16:16:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <YFnvQYvT7E/kCAuj@orome.fritz.box>
Content-Language: en-US
X-SA-Exim-Connect-IP: 84.249.134.236
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, jonathanh@nvidia.com,
 talho@nvidia.com, bhuntsman@nvidia.com, linux-tegra@vger.kernel.org,
 digetx@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 3/23/21 3:38 PM, Thierry Reding wrote:
> On Mon, Jan 11, 2021 at 03:00:18PM +0200, Mikko Perttunen wrote:
>> Implement the job submission IOCTL with a minimum feature set.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> ---
>> v5:
>> * Add 16K size limit to copies from userspace.
>> * Guard RELOC_BLOCKLINEAR flag handling to only exist in ARM64
>>    to prevent oversized shift on 32-bit platforms.
>> v4:
>> * Remove all features that are not strictly necessary.
>> * Split into two patches.
>> v3:
>> * Remove WRITE_RELOC. Relocations are now patched implicitly
>>    when patching is needed.
>> * Directly call PM runtime APIs on devices instead of using
>>    power_on/power_off callbacks.
>> * Remove incorrect mutex unlock in tegra_drm_ioctl_channel_open
>> * Use XA_FLAGS_ALLOC1 instead of XA_FLAGS_ALLOC
>> * Accommodate for removal of timeout field and inlining of
>>    syncpt_incrs array.
>> * Copy entire user arrays at a time instead of going through
>>    elements one-by-one.
>> * Implement waiting of DMA reservations.
>> * Split out gather_bo implementation into a separate file.
>> * Fix length parameter passed to sg_init_one in gather_bo
>> * Cosmetic cleanup.
>> ---
>>   drivers/gpu/drm/tegra/Makefile         |   2 +
>>   drivers/gpu/drm/tegra/drm.c            |   2 +
>>   drivers/gpu/drm/tegra/uapi/gather_bo.c |  86 +++++
>>   drivers/gpu/drm/tegra/uapi/gather_bo.h |  22 ++
>>   drivers/gpu/drm/tegra/uapi/submit.c    | 428 +++++++++++++++++++++++++
>>   drivers/gpu/drm/tegra/uapi/submit.h    |  17 +
>>   6 files changed, 557 insertions(+)
>>   create mode 100644 drivers/gpu/drm/tegra/uapi/gather_bo.c
>>   create mode 100644 drivers/gpu/drm/tegra/uapi/gather_bo.h
>>   create mode 100644 drivers/gpu/drm/tegra/uapi/submit.c
>>   create mode 100644 drivers/gpu/drm/tegra/uapi/submit.h
>>
>> diff --git a/drivers/gpu/drm/tegra/Makefile b/drivers/gpu/drm/tegra/Makefile
>> index 0abdb21b38b9..059322e88943 100644
>> --- a/drivers/gpu/drm/tegra/Makefile
>> +++ b/drivers/gpu/drm/tegra/Makefile
>> @@ -4,6 +4,8 @@ ccflags-$(CONFIG_DRM_TEGRA_DEBUG) += -DDEBUG
>>   tegra-drm-y := \
>>   	drm.o \
>>   	uapi/uapi.o \
>> +	uapi/submit.o \
>> +	uapi/gather_bo.o \
>>   	gem.o \
>>   	fb.o \
>>   	dp.o \
>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>> index 6a51035ce33f..60eab403ae9b 100644
>> --- a/drivers/gpu/drm/tegra/drm.c
>> +++ b/drivers/gpu/drm/tegra/drm.c
>> @@ -737,6 +737,8 @@ static const struct drm_ioctl_desc tegra_drm_ioctls[] = {
>>   			  DRM_RENDER_ALLOW),
>>   	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_UNMAP, tegra_drm_ioctl_channel_unmap,
>>   			  DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(TEGRA_CHANNEL_SUBMIT, tegra_drm_ioctl_channel_submit,
>> +			  DRM_RENDER_ALLOW),
>>   	DRM_IOCTL_DEF_DRV(TEGRA_GEM_CREATE, tegra_drm_ioctl_gem_create,
>>   			  DRM_RENDER_ALLOW),
>>   	DRM_IOCTL_DEF_DRV(TEGRA_GEM_MMAP, tegra_drm_ioctl_gem_mmap,
>> diff --git a/drivers/gpu/drm/tegra/uapi/gather_bo.c b/drivers/gpu/drm/tegra/uapi/gather_bo.c
>> new file mode 100644
>> index 000000000000..b487a0d44648
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tegra/uapi/gather_bo.c
>> @@ -0,0 +1,86 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/* Copyright (c) 2020 NVIDIA Corporation */
>> +
>> +#include <linux/scatterlist.h>
>> +#include <linux/slab.h>
>> +
>> +#include "gather_bo.h"
>> +
>> +static struct host1x_bo *gather_bo_get(struct host1x_bo *host_bo)
>> +{
>> +	struct gather_bo *bo = container_of(host_bo, struct gather_bo, base);
>> +
>> +	kref_get(&bo->ref);
>> +
>> +	return host_bo;
>> +}
>> +
>> +static void gather_bo_release(struct kref *ref)
>> +{
>> +	struct gather_bo *bo = container_of(ref, struct gather_bo, ref);
>> +
>> +	kfree(bo->gather_data);
>> +	kfree(bo);
>> +}
>> +
>> +void gather_bo_put(struct host1x_bo *host_bo)
>> +{
>> +	struct gather_bo *bo = container_of(host_bo, struct gather_bo, base);
>> +
>> +	kref_put(&bo->ref, gather_bo_release);
>> +}
>> +
>> +static struct sg_table *
>> +gather_bo_pin(struct device *dev, struct host1x_bo *host_bo, dma_addr_t *phys)
>> +{
>> +	struct gather_bo *bo = container_of(host_bo, struct gather_bo, base);
>> +	struct sg_table *sgt;
>> +	int err;
>> +
>> +	if (phys) {
>> +		*phys = virt_to_phys(bo->gather_data);
>> +		return NULL;
>> +	}
>> +
>> +	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
>> +	if (!sgt)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	err = sg_alloc_table(sgt, 1, GFP_KERNEL);
>> +	if (err) {
>> +		kfree(sgt);
>> +		return ERR_PTR(err);
>> +	}
>> +
>> +	sg_init_one(sgt->sgl, bo->gather_data, bo->gather_data_words*4);
>> +
>> +	return sgt;
>> +}
>> +
>> +static void gather_bo_unpin(struct device *dev, struct sg_table *sgt)
>> +{
>> +	if (sgt) {
>> +		sg_free_table(sgt);
>> +		kfree(sgt);
>> +	}
>> +}
>> +
>> +static void *gather_bo_mmap(struct host1x_bo *host_bo)
>> +{
>> +	struct gather_bo *bo = container_of(host_bo, struct gather_bo, base);
>> +
>> +	return bo->gather_data;
>> +}
>> +
>> +static void gather_bo_munmap(struct host1x_bo *host_bo, void *addr)
>> +{
>> +}
>> +
>> +const struct host1x_bo_ops gather_bo_ops = {
>> +	.get = gather_bo_get,
>> +	.put = gather_bo_put,
>> +	.pin = gather_bo_pin,
>> +	.unpin = gather_bo_unpin,
>> +	.mmap = gather_bo_mmap,
>> +	.munmap = gather_bo_munmap,
>> +};
>> diff --git a/drivers/gpu/drm/tegra/uapi/gather_bo.h b/drivers/gpu/drm/tegra/uapi/gather_bo.h
>> new file mode 100644
>> index 000000000000..6b4c9d83ac91
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tegra/uapi/gather_bo.h
>> @@ -0,0 +1,22 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/* Copyright (c) 2020 NVIDIA Corporation */
>> +
>> +#ifndef _TEGRA_DRM_SUBMIT_GATHER_BO_H
>> +#define _TEGRA_DRM_SUBMIT_GATHER_BO_H
>> +
>> +#include <linux/host1x.h>
>> +#include <linux/kref.h>
>> +
>> +struct gather_bo {
>> +	struct host1x_bo base;
>> +
>> +	struct kref ref;
>> +
>> +	u32 *gather_data;
>> +	size_t gather_data_words;
>> +};
>> +
>> +extern const struct host1x_bo_ops gather_bo_ops;
>> +void gather_bo_put(struct host1x_bo *host_bo);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/tegra/uapi/submit.c b/drivers/gpu/drm/tegra/uapi/submit.c
>> new file mode 100644
>> index 000000000000..398be3065e21
>> --- /dev/null
>> +++ b/drivers/gpu/drm/tegra/uapi/submit.c
>> @@ -0,0 +1,428 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/* Copyright (c) 2020 NVIDIA Corporation */
>> +
>> +#include <linux/dma-fence-array.h>
>> +#include <linux/file.h>
>> +#include <linux/host1x.h>
>> +#include <linux/iommu.h>
>> +#include <linux/kref.h>
>> +#include <linux/list.h>
>> +#include <linux/nospec.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/sync_file.h>
>> +
>> +#include <drm/drm_drv.h>
>> +#include <drm/drm_file.h>
>> +
>> +#include "../uapi.h"
>> +#include "../drm.h"
>> +#include "../gem.h"
>> +
>> +#include "gather_bo.h"
>> +#include "submit.h"
>> +
>> +static struct tegra_drm_mapping *
>> +tegra_drm_mapping_get(struct tegra_drm_channel_ctx *ctx, u32 id)
>> +{
>> +	struct tegra_drm_mapping *mapping;
>> +
>> +	xa_lock(&ctx->mappings);
>> +	mapping = xa_load(&ctx->mappings, id);
>> +	if (mapping)
>> +		kref_get(&mapping->ref);
>> +	xa_unlock(&ctx->mappings);
>> +
>> +	return mapping;
>> +}
>> +
>> +static void *alloc_copy_user_array(void __user *from, size_t count, size_t size)
>> +{
>> +	unsigned long copy_err;
>> +	size_t copy_len;
>> +	void *data;
>> +
>> +	if (check_mul_overflow(count, size, &copy_len))
>> +		return ERR_PTR(-EINVAL);
>> +
>> +	if (copy_len > 0x4000)
>> +		return ERR_PTR(-E2BIG);
>> +
>> +	data = kvmalloc(copy_len, GFP_KERNEL);
>> +	if (!data)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	copy_err = copy_from_user(data, from, copy_len);
>> +	if (copy_err) {
>> +		kvfree(data);
>> +		return ERR_PTR(-EFAULT);
>> +	}
>> +
>> +	return data;
>> +}
>> +
>> +static int submit_copy_gather_data(struct drm_device *drm,
>> +				   struct gather_bo **pbo,
>> +				   struct drm_tegra_channel_submit *args)
>> +{
>> +	unsigned long copy_err;
>> +	struct gather_bo *bo;
>> +	size_t copy_len;
>> +
>> +	if (args->gather_data_words == 0) {
>> +		drm_info(drm, "gather_data_words can't be 0");
>> +		return -EINVAL;
>> +	}
>> +
>> +	if (check_mul_overflow((size_t)args->gather_data_words, (size_t)4, &copy_len))
>> +		return -EINVAL;
>> +
>> +	bo = kzalloc(sizeof(*bo), GFP_KERNEL);
>> +	if (!bo)
>> +		return -ENOMEM;
>> +
>> +	kref_init(&bo->ref);
>> +	host1x_bo_init(&bo->base, &gather_bo_ops);
>> +
>> +	bo->gather_data = kmalloc(copy_len, GFP_KERNEL | __GFP_NOWARN);
>> +	if (!bo->gather_data) {
>> +		kfree(bo);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	copy_err = copy_from_user(bo->gather_data,
>> +				  u64_to_user_ptr(args->gather_data_ptr),
>> +				  copy_len);
>> +	if (copy_err) {
>> +		kfree(bo->gather_data);
>> +		kfree(bo);
>> +		return -EFAULT;
>> +	}
>> +
>> +	bo->gather_data_words = args->gather_data_words;
>> +
>> +	*pbo = bo;
>> +
>> +	return 0;
>> +}
>> +
>> +static int submit_write_reloc(struct gather_bo *bo,
>> +			      struct drm_tegra_submit_buf *buf,
>> +			      struct tegra_drm_mapping *mapping)
>> +{
>> +	/* TODO check that target_offset is within bounds */
>> +	dma_addr_t iova = mapping->iova + buf->reloc.target_offset;
>> +	u32 written_ptr = (u32)(iova >> buf->reloc.shift);
>> +
>> +#ifdef CONFIG_ARM64
>> +	if (buf->flags & DRM_TEGRA_SUBMIT_BUF_RELOC_BLOCKLINEAR)
>> +		written_ptr |= BIT(39);
>> +#endif
> 
> Sorry, but this still isn't correct. written_ptr is still only 32-bits
> wide, so your BIT(39) is going to get discarded even on 64-bit ARM. The
> idiomatic way to do this is to make written_ptr dma_addr_t and use a
> CONFIG_ARCH_DMA_ADDR_T_64BIT guard. >
> But even with that this looks wrong because you're OR'ing this in after
> shifting by buf->reloc.shift. Doesn't that OR it in at the wrong offset?
> Should you perhaps be doing this instead:
> 
> 	#ifdef CONFIG_ARCH_DMA_ADDR_T_64BIT
> 		if (buf->flags & DRM_TEGRA_SUBMIT_BUF_RELOC_BLOCKLINEAR)
> 			iova |= BIT(39);
> 	#endif
> 
> 	written_ptr = (u32)(iova >> buf->reloc_shift);
> 
> ?

Yes, you are of course right.. will fix this. That might explain some of 
the VIC test failures I've seen.

> 
> Also, on a side-note: BLOCKLINEAR really isn't the right term here. I
> recently dealt with this for display (though I haven't sent out that
> patch yet) and this is actually a bit that selects which sector layout
> swizzling is being applied. That's independent of block linear format
> and I think you can have different sector layouts irrespective of the
> block linear format (though I don't think that's usually done).
> 
> That said, I wonder if a better interface here would be to reuse format
> modifiers here. That would allow us to more fully describe the format of
> a surface in case we ever need it, and it already includes the sector
> layout information as well.

I think having just a flag that enables or disables the swizzling is 
better -- that way it is the responsibility of the userspace, which is 
where all the engine knowledge is as well, to know for each buffer 
whether it wants swizzling or not. Now, in practice at the moment the 
kernel can just lookup the format and set the bit based on that, but 
e.g. if there was an engine that could do the swizzling natively, and we 
had the format modifier here, we'd need to have the knowledge in the 
kernel to decide for each chip/engine whether to apply the bit.

For display it is a bit different since the knowledge is already in the 
kernel.

Mikko

> 
> Thierry
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
