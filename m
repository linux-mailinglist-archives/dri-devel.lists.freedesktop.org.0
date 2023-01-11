Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E8A66558E
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 08:58:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E002310E2CD;
	Wed, 11 Jan 2023 07:58:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD16410E2CD
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jan 2023 07:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673423896; x=1704959896;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+1gsLzfeUTNnxTBMbhfrJENkiGgTX4GFtb+DOeduq6w=;
 b=UJ/U42quXya/Qlhm7TbuVQiOb4e5tCB3OOvW3oYuXeDJ3TXnPxCVbMV7
 R4jOHd4Bh+PjRq2zI14wPCV9CwGfmXG8pAAto/KKWQM37ty1Me72VgP7p
 u53BodxYmaaXWKTkjaY2Z3YjvUxAyUMLHiulkNWUf1flnZD6UXmaqPbQH
 PO19ugUZKiI8xvHDUm995S6edAKy9WHHI2B8pFUiPzLu5ziI4ClNCAtOF
 rEvrZUpn0Xd2m09X27g11FNbLLMwSxd/F/zLyDCr+PKdY8RgI5XKWgvGo
 UavrMa5+eb4zb/o5T7IO1pEClMnHU8KhPwbpq1Uy/nK4ExrYZSX8tntlr Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="321048068"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="321048068"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 23:58:15 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="650657427"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="650657427"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.130.168])
 ([10.249.130.168])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 23:58:14 -0800
Message-ID: <23a2c477-fb35-d735-8f12-5c71dd2f295c@linux.intel.com>
Date: Wed, 11 Jan 2023 08:58:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 3/7] accel/ivpu: Add GEM buffer object management
To: Oded Gabbay <oded.gabbay@gmail.com>
References: <20230109122344.253994-1-jacek.lawrynowicz@linux.intel.com>
 <20230109122344.253994-4-jacek.lawrynowicz@linux.intel.com>
 <CAFCwf13sz28tEaqktFOUj3LzAfmw5prfr5vmdKUsm0DFRH8+OQ@mail.gmail.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <CAFCwf13sz28tEaqktFOUj3LzAfmw5prfr5vmdKUsm0DFRH8+OQ@mail.gmail.com>
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
Cc: stanislaw.gruszka@linux.intel.com, quic_jhugo@quicinc.com,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 andrzej.kacprowski@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 10.01.2023 15:34, Oded Gabbay wrote:
> On Mon, Jan 9, 2023 at 2:24 PM Jacek Lawrynowicz
> <jacek.lawrynowicz@linux.intel.com> wrote:
>> Adds four types of GEM-based BOs for the VPU:
>>   - shmem
>>   - userptr
>>   - internal
>>   - prime
>>
>> All types are implemented as struct ivpu_bo, based on
>> struct drm_gem_object. VPU address is allocated when buffer is created
>> except for imported prime buffers that allocate it in BO_INFO IOCTL due
>> to missing file_priv arg in gem_prime_import callback.
>> Internal buffers are pinned on creation, the rest of buffers types
>> can be pinned on demand (in SUBMIT IOCTL).
>> Buffer VPU address, allocated pages and mappings are released when the
>> buffer is destroyed.
>> Eviction mechism is planned for future versions.
>>
>> Add three new IOCTLs: BO_CREATE, BO_INFO, BO_USERPTR
>>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>  drivers/accel/ivpu/Makefile   |   1 +
>>  drivers/accel/ivpu/ivpu_drv.c |  31 +-
>>  drivers/accel/ivpu/ivpu_drv.h |   1 +
>>  drivers/accel/ivpu/ivpu_gem.c | 820 ++++++++++++++++++++++++++++++++++
>>  drivers/accel/ivpu/ivpu_gem.h | 128 ++++++
>>  include/uapi/drm/ivpu_accel.h | 127 ++++++
>>  6 files changed, 1106 insertions(+), 2 deletions(-)
>>  create mode 100644 drivers/accel/ivpu/ivpu_gem.c
>>  create mode 100644 drivers/accel/ivpu/ivpu_gem.h
>>
>> diff --git a/drivers/accel/ivpu/Makefile b/drivers/accel/ivpu/Makefile
>> index 59cd7843b218..5d7c5862399c 100644
>> --- a/drivers/accel/ivpu/Makefile
>> +++ b/drivers/accel/ivpu/Makefile
>> @@ -3,6 +3,7 @@
>>
>>  intel_vpu-y := \
>>         ivpu_drv.o \
>> +       ivpu_gem.o \
>>         ivpu_hw_mtl.o \
>>         ivpu_mmu.o \
>>         ivpu_mmu_context.o
>> diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
>> index d7982f451781..0b9034499c4c 100644
>> --- a/drivers/accel/ivpu/ivpu_drv.c
>> +++ b/drivers/accel/ivpu/ivpu_drv.c
>> @@ -12,8 +12,10 @@
>>  #include <drm/drm_file.h>
>>  #include <drm/drm_gem.h>
>>  #include <drm/drm_ioctl.h>
>> +#include <drm/drm_prime.h>
>>
>>  #include "ivpu_drv.h"
>> +#include "ivpu_gem.h"
>>  #include "ivpu_hw.h"
>>  #include "ivpu_mmu.h"
>>  #include "ivpu_mmu_context.h"
>> @@ -49,6 +51,24 @@ struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv)
>>         return file_priv;
>>  }
>>
>> +struct ivpu_file_priv *ivpu_file_priv_get_by_ctx_id(struct ivpu_device *vdev, unsigned long id)
>> +{
>> +       struct ivpu_file_priv *file_priv;
>> +
>> +       xa_lock_irq(&vdev->context_xa);
>> +       file_priv = xa_load(&vdev->context_xa, id);
>> +       /* file_priv may still be in context_xa during file_priv_release() */
>> +       if (file_priv && !kref_get_unless_zero(&file_priv->ref))
>> +               file_priv = NULL;
>> +       xa_unlock_irq(&vdev->context_xa);
>> +
>> +       if (file_priv)
>> +               ivpu_dbg(vdev, KREF, "file_priv get by id: ctx %u refcount %u\n",
>> +                        file_priv->ctx.id, kref_read(&file_priv->ref));
>> +
>> +       return file_priv;
>> +}
>> +
>>  static void file_priv_release(struct kref *ref)
>>  {
>>         struct ivpu_file_priv *file_priv = container_of(ref, struct ivpu_file_priv, ref);
>> @@ -57,7 +77,7 @@ static void file_priv_release(struct kref *ref)
>>         ivpu_dbg(vdev, FILE, "file_priv release: ctx %u\n", file_priv->ctx.id);
>>
>>         ivpu_mmu_user_context_fini(vdev, &file_priv->ctx);
>> -       WARN_ON(xa_erase_irq(&vdev->context_xa, file_priv->ctx.id) != file_priv);
>> +       drm_WARN_ON(&vdev->drm, xa_erase_irq(&vdev->context_xa, file_priv->ctx.id) != file_priv);
>>         kfree(file_priv);
>>  }
>>
>> @@ -66,7 +86,7 @@ void ivpu_file_priv_put(struct ivpu_file_priv **link)
>>         struct ivpu_file_priv *file_priv = *link;
>>         struct ivpu_device *vdev = file_priv->vdev;
>>
>> -       WARN_ON(!file_priv);
>> +       drm_WARN_ON(&vdev->drm, !file_priv);
>>
>>         ivpu_dbg(vdev, KREF, "file_priv put: ctx %u refcount %u\n",
>>                  file_priv->ctx.id, kref_read(&file_priv->ref));
>> @@ -200,6 +220,9 @@ static void ivpu_postclose(struct drm_device *dev, struct drm_file *file)
>>  static const struct drm_ioctl_desc ivpu_drm_ioctls[] = {
>>         DRM_IOCTL_DEF_DRV(IVPU_GET_PARAM, ivpu_get_param_ioctl, 0),
>>         DRM_IOCTL_DEF_DRV(IVPU_SET_PARAM, ivpu_set_param_ioctl, 0),
>> +       DRM_IOCTL_DEF_DRV(IVPU_BO_CREATE, ivpu_bo_create_ioctl, 0),
>> +       DRM_IOCTL_DEF_DRV(IVPU_BO_INFO, ivpu_bo_info_ioctl, 0),
>> +       DRM_IOCTL_DEF_DRV(IVPU_BO_USERPTR, ivpu_bo_userptr_ioctl, 0),
>>  };
>>
>>  int ivpu_shutdown(struct ivpu_device *vdev)
>> @@ -233,6 +256,10 @@ static const struct drm_driver driver = {
>>
>>         .open = ivpu_open,
>>         .postclose = ivpu_postclose,
>> +       .prime_handle_to_fd = drm_gem_prime_handle_to_fd,
>> +       .prime_fd_to_handle = drm_gem_prime_fd_to_handle,
>> +       .gem_prime_import = ivpu_gem_prime_import,
>> +       .gem_prime_mmap = drm_gem_prime_mmap,
>>
>>         .ioctls = ivpu_drm_ioctls,
>>         .num_ioctls = ARRAY_SIZE(ivpu_drm_ioctls),
>> diff --git a/drivers/accel/ivpu/ivpu_drv.h b/drivers/accel/ivpu/ivpu_drv.h
>> index a749a0b97703..e8a43dbe5a3a 100644
>> --- a/drivers/accel/ivpu/ivpu_drv.h
>> +++ b/drivers/accel/ivpu/ivpu_drv.h
>> @@ -115,6 +115,7 @@ extern u8 ivpu_pll_min_ratio;
>>  extern u8 ivpu_pll_max_ratio;
>>
>>  struct ivpu_file_priv *ivpu_file_priv_get(struct ivpu_file_priv *file_priv);
>> +struct ivpu_file_priv *ivpu_file_priv_get_by_ctx_id(struct ivpu_device *vdev, unsigned long id);
>>  void ivpu_file_priv_put(struct ivpu_file_priv **link);
>>  int ivpu_shutdown(struct ivpu_device *vdev);
>>
>> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
>> new file mode 100644
>> index 000000000000..f6d1937c798f
>> --- /dev/null
>> +++ b/drivers/accel/ivpu/ivpu_gem.c
>> @@ -0,0 +1,820 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2020-2023 Intel Corporation
>> + */
>> +
>> +#include <linux/dma-buf.h>
>> +#include <linux/highmem.h>
>> +#include <linux/module.h>
>> +#include <linux/set_memory.h>
>> +#include <linux/xarray.h>
>> +
>> +#include <drm/drm_cache.h>
>> +#include <drm/drm_debugfs.h>
>> +#include <drm/drm_file.h>
>> +#include <drm/drm_utils.h>
>> +
>> +#include "ivpu_drv.h"
>> +#include "ivpu_gem.h"
>> +#include "ivpu_hw.h"
>> +#include "ivpu_mmu.h"
>> +#include "ivpu_mmu_context.h"
>> +
>> +MODULE_IMPORT_NS(DMA_BUF);
>> +
>> +static const struct drm_gem_object_funcs ivpu_gem_funcs;
>> +
>> +static struct lock_class_key prime_bo_lock_class_key;
>> +static struct lock_class_key userptr_bo_lock_class_key;
>> +
>> +static int __must_check prime_alloc_pages_locked(struct ivpu_bo *bo)
>> +{
>> +       /* Pages are managed by the underlying dma-buf */
>> +       return 0;
>> +}
>> +
>> +static void prime_free_pages_locked(struct ivpu_bo *bo)
>> +{
>> +       /* Pages are managed by the underlying dma-buf */
>> +}
>> +
>> +static int prime_map_pages_locked(struct ivpu_bo *bo)
>> +{
>> +       struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
>> +       struct sg_table *sgt;
>> +
>> +       WARN_ON(!bo->base.import_attach);
>> +
>> +       sgt = dma_buf_map_attachment(bo->base.import_attach, DMA_BIDIRECTIONAL);
>> +       if (IS_ERR(sgt)) {
>> +               ivpu_err(vdev, "Failed to map attachment: %ld\n", PTR_ERR(sgt));
>> +               return PTR_ERR(sgt);
>> +       }
>> +
>> +       bo->sgt = sgt;
>> +       return 0;
>> +}
>> +
>> +static void prime_unmap_pages_locked(struct ivpu_bo *bo)
>> +{
>> +       WARN_ON(!bo->base.import_attach);
>> +
>> +       dma_buf_unmap_attachment(bo->base.import_attach, bo->sgt, DMA_BIDIRECTIONAL);
>> +       bo->sgt = NULL;
>> +}
>> +
>> +static const struct ivpu_bo_ops prime_ops = {
>> +       .type = IVPU_BO_TYPE_PRIME,
>> +       .name = "prime",
>> +       .alloc_pages = prime_alloc_pages_locked,
>> +       .free_pages = prime_free_pages_locked,
>> +       .map_pages = prime_map_pages_locked,
>> +       .unmap_pages = prime_unmap_pages_locked,
>> +};
>> +
>> +static int __must_check shmem_alloc_pages_locked(struct ivpu_bo *bo)
>> +{
>> +       int npages = bo->base.size >> PAGE_SHIFT;
>> +       struct page **pages;
>> +
>> +       pages = drm_gem_get_pages(&bo->base);
>> +       if (IS_ERR(pages))
>> +               return PTR_ERR(pages);
>> +
>> +       if (bo->flags & DRM_IVPU_BO_WC)
>> +               set_pages_array_wc(pages, npages);
>> +       else if (bo->flags & DRM_IVPU_BO_UNCACHED)
>> +               set_pages_array_uc(pages, npages);
>> +
>> +       bo->pages = pages;
>> +       return 0;
>> +}
>> +
>> +static void shmem_free_pages_locked(struct ivpu_bo *bo)
>> +{
>> +       if (ivpu_bo_cache_mode(bo) != DRM_IVPU_BO_CACHED)
>> +               set_pages_array_wb(bo->pages, bo->base.size >> PAGE_SHIFT);
>> +
>> +       drm_gem_put_pages(&bo->base, bo->pages, true, false);
>> +       bo->pages = NULL;
>> +}
>> +
>> +static int ivpu_bo_map_pages_locked(struct ivpu_bo *bo)
>> +{
>> +       int npages = bo->base.size >> PAGE_SHIFT;
>> +       struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
>> +       struct sg_table *sgt;
>> +       int ret;
>> +
>> +       sgt = drm_prime_pages_to_sg(&vdev->drm, bo->pages, npages);
>> +       if (IS_ERR(sgt)) {
>> +               ivpu_err(vdev, "Failed to allocate sgtable\n");
>> +               return PTR_ERR(sgt);
>> +       }
>> +
>> +       ret = dma_map_sgtable(vdev->drm.dev, sgt, DMA_BIDIRECTIONAL, 0);
>> +       if (ret) {
>> +               ivpu_err(vdev, "Failed to map BO in IOMMU: %d\n", ret);
>> +               goto err_free_sgt;
>> +       }
>> +
>> +       bo->sgt = sgt;
>> +       return 0;
>> +
>> +err_free_sgt:
>> +       kfree(sgt);
>> +       return ret;
>> +}
>> +
>> +static void ivpu_bo_unmap_pages_locked(struct ivpu_bo *bo)
>> +{
>> +       struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
>> +
>> +       dma_unmap_sgtable(vdev->drm.dev, bo->sgt, DMA_BIDIRECTIONAL, 0);
>> +       sg_free_table(bo->sgt);
>> +       kfree(bo->sgt);
>> +       bo->sgt = NULL;
>> +}
>> +
>> +static const struct ivpu_bo_ops shmem_ops = {
>> +       .type = IVPU_BO_TYPE_SHMEM,
>> +       .name = "shmem",
>> +       .alloc_pages = shmem_alloc_pages_locked,
>> +       .free_pages = shmem_free_pages_locked,
>> +       .map_pages = ivpu_bo_map_pages_locked,
>> +       .unmap_pages = ivpu_bo_unmap_pages_locked,
>> +};
>> +
>> +static int __must_check userptr_alloc_pages_locked(struct ivpu_bo *bo)
>> +{
>> +       unsigned int npages = bo->base.size >> PAGE_SHIFT;
>> +       struct page **pages;
>> +       int ret;
>> +
>> +       pages = kvmalloc_array(npages, sizeof(*bo->pages), GFP_KERNEL);
>> +       if (!pages)
>> +               return -ENOMEM;
>> +
>> +       ret = pin_user_pages_fast(bo->user_ptr & PAGE_MASK, npages,
>> +                                 FOLL_FORCE | FOLL_WRITE | FOLL_LONGTERM, pages);
> You didn't fix this patch according to my comments in v4. Please
> remove FOLL_FORCE and
> use unpin_user_pages_dirty_lock (with true flag)

Right, sorry. I've added this change to our internal repo but missed it in the patch set.

Regards,
Jacek
