Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA62A327942
	for <lists+dri-devel@lfdr.de>; Mon,  1 Mar 2021 09:32:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4094A6E4FE;
	Mon,  1 Mar 2021 08:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A92D06E500
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Mar 2021 08:32:43 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id x9so11348647otp.8
 for <dri-devel@lists.freedesktop.org>; Mon, 01 Mar 2021 00:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KZxkgusAEAszVfaWvGB//toXTmfPRkQPutMJ/Wn2lM4=;
 b=R+HvKpH/ktAqKYHPMkLvBolOuGIJde9DeaMYCGtA2c7czV4k3QRmZbxN/u0G4WZHUp
 1DicmnpfstpRLxSVJLaMGjicBhJ+KCviwWWeQgHcSIzf8xcGQXaN3DkmQzfc9LkJb/fi
 sqjwHP6iPc9Pn0wmjZAQIbt4b94orrZbusfCM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KZxkgusAEAszVfaWvGB//toXTmfPRkQPutMJ/Wn2lM4=;
 b=QX5iPKw/FTbZ7fw47jlS9vRAFtMq7rW/jJ4JTyEctrT/wwaMhVv53StIXmP4gKMxcM
 PnT3eOENJPy8zPg2voxNEdAdkYTY2Gn7NT1yDTQRE/PSeaO3G5qd7hPTWDQJHikJR9jC
 WKhE1XVOhl7p4vA2sY3Fn9seL6jb8Y2qngIHATc+M8hjd1/MRJfe4yVX1oC6uwpd5otl
 0RMCiGJiJzL/hCPedBeFWOkX70hP65mVbLEKsHVb1PkvMpnKYpMcq9OUZkb8tGew7+oT
 mt8Aaokb+ImhkyQ8Ai/FmMXOK62A2ArhS2shm9XVE8/MPGnqrdLkydGiA8K+5rqzKg7y
 4V6Q==
X-Gm-Message-State: AOAM531p0UnfkW/IT2N3Sn6Il/kpUfrC0U7vl8ktDsHHCjB35EVuf4D7
 XtdNE40HX8Oc/2kWx4k+83TMcglMN/UcSje0Wc58RQ==
X-Google-Smtp-Source: ABdhPJzt2jbPRUu994o/idF9dZbBTtqKD0CoMP8Ul8/tfW+eVQu74GDiVRxGcNkrDvvfZDNdVzUCbvha7SPNFjO2ASU=
X-Received: by 2002:a9d:648f:: with SMTP id g15mr1053870otl.188.1614587562889; 
 Mon, 01 Mar 2021 00:32:42 -0800 (PST)
MIME-Version: 1.0
References: <20210107030127.20393-1-Felix.Kuehling@amd.com>
 <20210107030127.20393-18-Felix.Kuehling@amd.com>
In-Reply-To: <20210107030127.20393-18-Felix.Kuehling@amd.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Mon, 1 Mar 2021 09:32:32 +0100
Message-ID: <CAKMK7uEd9KZAmeNd9Z9GF9p0yUButHc+8_PERRuNR79+uqAhbQ@mail.gmail.com>
Subject: Re: [PATCH 17/35] drm/amdkfd: register HMM device private zone
To: Felix Kuehling <Felix.Kuehling@amd.com>, 
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m_=28VMware=29?= <thomas_os@shipmail.org>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: Alex Sierra <alex.sierra@amd.com>, Philip Yang <Philip.Yang@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jan 06, 2021 at 10:01:09PM -0500, Felix Kuehling wrote:
> From: Philip Yang <Philip.Yang@amd.com>
>
> Register vram memory as MEMORY_DEVICE_PRIVATE type resource, to
> allocate vram backing pages for page migration.
>
> Signed-off-by: Philip Yang <Philip.Yang@amd.com>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>

So maybe I'm getting this all wrong, but I think that the current ttm
fault code relies on devmap pte entries (especially for hugepte entries)
to stop get_user_pages. But this only works if the pte happens to not
point at a range with devmap pages.

This patch here changes that, and so probably breaks this devmap pte hack
ttm is using?

If I'm not wrong here then I think we need to first fix up the ttm code to
not use the devmap hack anymore, before a ttm based driver can register a
dev_pagemap. Also adding Thomas since that just came up in another
discussion.
-Daniel


> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c |   3 +
>  drivers/gpu/drm/amd/amdkfd/Makefile        |   3 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c   | 101 +++++++++++++++++++++
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.h   |  48 ++++++++++
>  drivers/gpu/drm/amd/amdkfd/kfd_priv.h      |   3 +
>  5 files changed, 157 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
>  create mode 100644 drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> index db96d69eb45e..562bb5b69137 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c
> @@ -30,6 +30,7 @@
>  #include <linux/dma-buf.h>
>  #include "amdgpu_xgmi.h"
>  #include <uapi/linux/kfd_ioctl.h>
> +#include "kfd_migrate.h"
>
>  /* Total memory size in system memory and all GPU VRAM. Used to
>   * estimate worst case amount of memory to reserve for page tables
> @@ -170,12 +171,14 @@ void amdgpu_amdkfd_device_init(struct amdgpu_device *adev)
>               }
>
>               kgd2kfd_device_init(adev->kfd.dev, adev_to_drm(adev), &gpu_resources);
> +             svm_migrate_init(adev);
>       }
>  }
>
>  void amdgpu_amdkfd_device_fini(struct amdgpu_device *adev)
>  {
>       if (adev->kfd.dev) {
> +             svm_migrate_fini(adev);
>               kgd2kfd_device_exit(adev->kfd.dev);
>               adev->kfd.dev = NULL;
>       }
> diff --git a/drivers/gpu/drm/amd/amdkfd/Makefile b/drivers/gpu/drm/amd/amdkfd/Makefile
> index 387ce0217d35..a93301dbc464 100644
> --- a/drivers/gpu/drm/amd/amdkfd/Makefile
> +++ b/drivers/gpu/drm/amd/amdkfd/Makefile
> @@ -55,7 +55,8 @@ AMDKFD_FILES        := $(AMDKFD_PATH)/kfd_module.o \
>               $(AMDKFD_PATH)/kfd_dbgmgr.o \
>               $(AMDKFD_PATH)/kfd_smi_events.o \
>               $(AMDKFD_PATH)/kfd_crat.o \
> -             $(AMDKFD_PATH)/kfd_svm.o
> +             $(AMDKFD_PATH)/kfd_svm.o \
> +             $(AMDKFD_PATH)/kfd_migrate.o
>
>  ifneq ($(CONFIG_AMD_IOMMU_V2),)
>  AMDKFD_FILES += $(AMDKFD_PATH)/kfd_iommu.o
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> new file mode 100644
> index 000000000000..1950b86f1562
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -0,0 +1,101 @@
> +/*
> + * Copyright 2020 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + */
> +
> +#include <linux/types.h>
> +#include <linux/hmm.h>
> +#include <linux/dma-direction.h>
> +#include <linux/dma-mapping.h>
> +#include "amdgpu_sync.h"
> +#include "amdgpu_object.h"
> +#include "amdgpu_vm.h"
> +#include "amdgpu_mn.h"
> +#include "kfd_priv.h"
> +#include "kfd_svm.h"
> +#include "kfd_migrate.h"
> +
> +static void svm_migrate_page_free(struct page *page)
> +{
> +}
> +
> +/**
> + * svm_migrate_to_ram - CPU page fault handler
> + * @vmf: CPU vm fault vma, address
> + *
> + * Context: vm fault handler, mm->mmap_sem is taken
> + *
> + * Return:
> + * 0 - OK
> + * VM_FAULT_SIGBUS - notice application to have SIGBUS page fault
> + */
> +static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
> +{
> +     return VM_FAULT_SIGBUS;
> +}
> +
> +static const struct dev_pagemap_ops svm_migrate_pgmap_ops = {
> +     .page_free              = svm_migrate_page_free,
> +     .migrate_to_ram         = svm_migrate_to_ram,
> +};
> +
> +int svm_migrate_init(struct amdgpu_device *adev)
> +{
> +     struct kfd_dev *kfddev = adev->kfd.dev;
> +     struct dev_pagemap *pgmap;
> +     struct resource *res;
> +     unsigned long size;
> +     void *r;
> +
> +     /* Page migration works on Vega10 or newer */
> +     if (kfddev->device_info->asic_family < CHIP_VEGA10)
> +             return -EINVAL;
> +
> +     pgmap = &kfddev->pgmap;
> +     memset(pgmap, 0, sizeof(*pgmap));
> +
> +     /* TODO: register all vram to HMM for now.
> +      * should remove reserved size
> +      */
> +     size = ALIGN(adev->gmc.real_vram_size, 2ULL << 20);
> +     res = devm_request_free_mem_region(adev->dev, &iomem_resource, size);
> +     if (IS_ERR(res))
> +             return -ENOMEM;
> +
> +     pgmap->type = MEMORY_DEVICE_PRIVATE;
> +     pgmap->res = *res;
> +     pgmap->ops = &svm_migrate_pgmap_ops;
> +     pgmap->owner = adev;
> +     pgmap->flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
> +     r = devm_memremap_pages(adev->dev, pgmap);
> +     if (IS_ERR(r)) {
> +             pr_err("failed to register HMM device memory\n");
> +             return PTR_ERR(r);
> +     }
> +
> +     pr_info("HMM registered %ldMB device memory\n", size >> 20);
> +
> +     return 0;
> +}
> +
> +void svm_migrate_fini(struct amdgpu_device *adev)
> +{
> +     memunmap_pages(&adev->kfd.dev->pgmap);
> +}
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
> new file mode 100644
> index 000000000000..98ab685d3e17
> --- /dev/null
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
> @@ -0,0 +1,48 @@
> +/*
> + * Copyright 2020 Advanced Micro Devices, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining a
> + * copy of this software and associated documentation files (the "Software"),
> + * to deal in the Software without restriction, including without limitation
> + * the rights to use, copy, modify, merge, publish, distribute, sublicense,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be included in
> + * all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
> + * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
> + * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
> + * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
> + * OTHER DEALINGS IN THE SOFTWARE.
> + *
> + */
> +
> +#ifndef KFD_MIGRATE_H_
> +#define KFD_MIGRATE_H_
> +
> +#include <linux/rwsem.h>
> +#include <linux/list.h>
> +#include <linux/mutex.h>
> +#include <linux/sched/mm.h>
> +#include <linux/hmm.h>
> +#include "kfd_priv.h"
> +#include "kfd_svm.h"
> +
> +#if defined(CONFIG_DEVICE_PRIVATE)
> +int svm_migrate_init(struct amdgpu_device *adev);
> +void svm_migrate_fini(struct amdgpu_device *adev);
> +
> +#else
> +static inline int svm_migrate_init(struct amdgpu_device *adev)
> +{
> +     DRM_WARN_ONCE("DEVICE_PRIVATE kernel config option is not enabled, "
> +                   "add CONFIG_DEVICE_PRIVATE=y in config file to fix\n");
> +     return -ENODEV;
> +}
> +static inline void svm_migrate_fini(struct amdgpu_device *adev) {}
> +#endif
> +#endif /* KFD_MIGRATE_H_ */
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> index 7a4b4b6dcf32..d5367e770b39 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_priv.h
> @@ -317,6 +317,9 @@ struct kfd_dev {
>       unsigned int max_doorbell_slices;
>
>       int noretry;
> +
> +     /* HMM page migration MEMORY_DEVICE_PRIVATE mapping */
> +     struct dev_pagemap pgmap;
>  };
>
>  enum kfd_mempool {
> --
> 2.29.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
