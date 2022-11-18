Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A1B62F24E
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 11:16:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5395A10E21F;
	Fri, 18 Nov 2022 10:16:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D132810E21F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Nov 2022 10:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668766549; x=1700302549;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=SaHeugNKo8OZK/lZ3uROir5ZbKTL8GEV1vddhbpqyZg=;
 b=ePq6/maJ+YdGkVh8TyhtHmGoAdfJV7jKeixyZAX7MHeGjzDqDcQBgXbg
 t4K4NgppKXr37X2ryCj2GFs/xJhmU74Kw4EOQRhqBopn6eODOujvwcETo
 IXSJUPc11OV7uw17HMVUXy+13nF5jRX3/vb+ZiheRIG93URhJBNKHKSXA
 SLgnWGbxYjS29PKH26YoZhCg868wtx8V4D9H/dWCclYS84w3egd5WseF9
 u+I+YRvbTdEP9+3+BGgByeLWyM3A7yFvg+0b4EsCTeWX2/whb+eRWZjEy
 9IyNcxxe07pt1Om5e41eAbjEIomuf377rzyZU3w2mtbw5KD+D6FIKK7QQ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="300641949"
X-IronPort-AV: E=Sophos;i="5.96,173,1665471600"; d="scan'208";a="300641949"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 02:15:49 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="703691293"
X-IronPort-AV: E=Sophos;i="5.96,173,1665471600"; d="scan'208";a="703691293"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.149.49])
 ([10.249.149.49])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2022 02:15:47 -0800
Message-ID: <eea3f0ca-e0d1-1bc6-b65b-b4ef0658c5a9@linux.intel.com>
Date: Fri, 18 Nov 2022 11:15:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 2/7] drm/ivpu: Add Intel VPU MMU support
Content-Language: en-US
To: Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 airlied@gmail.com, daniel@ffwll.ch
References: <20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com>
 <20220924151149.323622-3-jacek.lawrynowicz@linux.intel.com>
 <6cfd6459-4ea2-742a-aa94-4b1ecd253d7d@suse.de>
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <6cfd6459-4ea2-742a-aa94-4b1ecd253d7d@suse.de>
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
Cc: andrzej.kacprowski@linux.intel.com, stanislaw.gruszka@linux.intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 11/1/2022 10:00 AM, Thomas Zimmermann wrote:
> Hi
> 
> Am 24.09.22 um 17:11 schrieb Jacek Lawrynowicz:
>> VPU Memory Management Unit is based on ARM MMU-600.
>> It allows to create multiple virtual address spaces for the device and
>> map noncontinuous host memory (there is no dedicated memory on the VPU).
>>
>> Address space is implemented as a struct ivpu_mmu_context, it has an ID,
>> drm_mm allocator for VPU addresses and struct ivpu_mmu_pgtable that holds
>> actual 3-level, 4KB page table.
>> Context with ID 0 (global context) is created upon driver initialization
>> and it's mainly used for mapping memory required to execute
>> the firmware.
>> Contexts with non-zero IDs are user contexts allocated each time
>> the devices is open()-ed and they map command buffers and other
>> workload-related memory.
>> Workloads executing in a given contexts have access only
>> to the memory mapped in this context.
>>
>> This patch is has to main files:
>>    - ivpu_mmu_context.c handles MMU page tables and memory mapping
>>    - ivpu_mmu.c implements a driver that programs the MMU device
>>
>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>> Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>> ---
>>   drivers/gpu/drm/ivpu/Makefile           |   4 +-
>>   drivers/gpu/drm/ivpu/ivpu_drv.c         |  59 +-
>>   drivers/gpu/drm/ivpu/ivpu_drv.h         |   7 +
>>   drivers/gpu/drm/ivpu/ivpu_hw_mtl.c      |  10 +
>>   drivers/gpu/drm/ivpu/ivpu_mmu.c         | 883 ++++++++++++++++++++++++
>>   drivers/gpu/drm/ivpu/ivpu_mmu.h         |  53 ++
>>   drivers/gpu/drm/ivpu/ivpu_mmu_context.c | 419 +++++++++++
>>   drivers/gpu/drm/ivpu/ivpu_mmu_context.h |  49 ++
>>   include/uapi/drm/ivpu_drm.h             |   4 +
>>   9 files changed, 1485 insertions(+), 3 deletions(-)
>>   create mode 100644 drivers/gpu/drm/ivpu/ivpu_mmu.c
>>   create mode 100644 drivers/gpu/drm/ivpu/ivpu_mmu.h
>>   create mode 100644 drivers/gpu/drm/ivpu/ivpu_mmu_context.c
>>   create mode 100644 drivers/gpu/drm/ivpu/ivpu_mmu_context.h
>>
>> diff --git a/drivers/gpu/drm/ivpu/Makefile b/drivers/gpu/drm/ivpu/Makefile
>> index e59dc65abe6a..95bb04f26296 100644
>> --- a/drivers/gpu/drm/ivpu/Makefile
>> +++ b/drivers/gpu/drm/ivpu/Makefile
>> @@ -3,6 +3,8 @@
>>     intel_vpu-y := \
>>       ivpu_drv.o \
>> -    ivpu_hw_mtl.o
>> +    ivpu_hw_mtl.o \
>> +    ivpu_mmu.o \
>> +    ivpu_mmu_context.o
>>     obj-$(CONFIG_DRM_IVPU) += intel_vpu.o
>> diff --git a/drivers/gpu/drm/ivpu/ivpu_drv.c b/drivers/gpu/drm/ivpu/ivpu_drv.c
>> index a01c7244f6e5..cbeb9a801a31 100644
>> --- a/drivers/gpu/drm/ivpu/ivpu_drv.c
>> +++ b/drivers/gpu/drm/ivpu/ivpu_drv.c
>> @@ -14,6 +14,8 @@
>>     #include "ivpu_drv.h"
>>   #include "ivpu_hw.h"
>> +#include "ivpu_mmu.h"
>> +#include "ivpu_mmu_context.h"
>>     #ifndef DRIVER_VERSION_STR
>>   #define DRIVER_VERSION_STR __stringify(DRM_IVPU_DRIVER_MAJOR) "." \
>> @@ -50,6 +52,11 @@ char *ivpu_platform_to_str(u32 platform)
>>     void ivpu_file_priv_get(struct ivpu_file_priv *file_priv, struct ivpu_file_priv **link)
>>   {
>> +    struct ivpu_device *vdev = file_priv->vdev;
>> +
>> +    ivpu_dbg(KREF, "file_priv get: ctx %u refcount %u\n",
>> +         file_priv->ctx.id, kref_read(&file_priv->ref));
>> +
>>       kref_get(&file_priv->ref);
>>       *link = file_priv;
>>   }
>> @@ -57,6 +64,12 @@ void ivpu_file_priv_get(struct ivpu_file_priv *file_priv, struct ivpu_file_priv
>>   static void file_priv_release(struct kref *ref)
>>   {
>>       struct ivpu_file_priv *file_priv = container_of(ref, struct ivpu_file_priv, ref);
>> +    struct ivpu_device *vdev = file_priv->vdev;
>> +
>> +    ivpu_dbg(FILE, "file_priv release: ctx %u\n", file_priv->ctx.id);
>> +
>> +    if (file_priv->ctx.id)
>> +        ivpu_mmu_user_context_fini(file_priv);
>>         kfree(file_priv);
>>   }
>> @@ -64,6 +77,10 @@ static void file_priv_release(struct kref *ref)
>>   void ivpu_file_priv_put(struct ivpu_file_priv **link)
>>   {
>>       struct ivpu_file_priv *file_priv = *link;
>> +    struct ivpu_device *vdev = file_priv->vdev;
>> +
>> +    ivpu_dbg(KREF, "file_priv put: ctx %u refcount %u\n",
>> +         file_priv->ctx.id, kref_read(&file_priv->ref));
>>         *link = NULL;
>>       kref_put(&file_priv->ref, file_priv_release);
>> @@ -75,7 +92,11 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
>>       struct ivpu_device *vdev = file_priv->vdev;
>>       struct pci_dev *pdev = to_pci_dev(vdev->drm.dev);
>>       struct drm_ivpu_param *args = data;
>> -    int ret = 0;
>> +    int ret;
>> +
>> +    ret = ivpu_mmu_user_context_init(file_priv);
>> +    if (ret)
>> +        return ret;
>>         switch (args->param) {
>>       case DRM_IVPU_PARAM_DEVICE_ID:
>> @@ -99,6 +120,9 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
>>       case DRM_IVPU_PARAM_CONTEXT_PRIORITY:
>>           args->value = file_priv->priority;
>>           break;
>> +    case DRM_IVPU_PARAM_CONTEXT_ID:
>> +        args->value = file_priv->ctx.id;
>> +        break;
>>       default:
>>           ret = -EINVAL;
>>       }
>> @@ -110,7 +134,11 @@ static int ivpu_set_param_ioctl(struct drm_device *dev, void *data, struct drm_f
>>   {
>>       struct ivpu_file_priv *file_priv = file->driver_priv;
>>       struct drm_ivpu_param *args = data;
>> -    int ret = 0;
>> +    int ret;
>> +
>> +    ret = ivpu_mmu_user_context_init(file_priv);
>> +    if (ret)
>> +        return ret;
>>         switch (args->param) {
>>       case DRM_IVPU_PARAM_CONTEXT_PRIORITY:
>> @@ -139,9 +167,13 @@ static int ivpu_open(struct drm_device *dev, struct drm_file *file)
>>       file_priv->priority = DRM_IVPU_CONTEXT_PRIORITY_NORMAL;
>>         kref_init(&file_priv->ref);
>> +    mutex_init(&file_priv->lock);
>>         file->driver_priv = file_priv;
>>   +    ivpu_dbg(FILE, "file_priv alloc: process %s pid %d\n",
>> +         current->comm, task_pid_nr(current));
>> +
>>       return 0;
>>   }
>>   @@ -164,6 +196,7 @@ int ivpu_shutdown(struct ivpu_device *vdev)
>>       int ret;
>>         ivpu_hw_irq_disable(vdev);
>> +    ivpu_mmu_disable(vdev);
>>         ret = ivpu_hw_power_down(vdev);
>>       if (ret)
>> @@ -272,6 +305,10 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>>       if (!vdev->hw)
>>           return -ENOMEM;
>>   +    vdev->mmu = devm_kzalloc(vdev->drm.dev, sizeof(*vdev->mmu), GFP_KERNEL);
>> +    if (!vdev->mmu)
>> +        return -ENOMEM;
>> +
>>       vdev->hw->ops = &ivpu_hw_mtl_ops;
>>       vdev->platform = IVPU_PLATFORM_INVALID;
>>   @@ -303,8 +340,24 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>>           goto err_irq_fini;
>>       }
>>   +    ret = ivpu_mmu_global_context_init(vdev);
>> +    if (ret) {
>> +        ivpu_err(vdev, "Failed to initialize global MMU context: %d\n", ret);
>> +        goto err_power_down;
>> +    }
>> +
>> +    ret = ivpu_mmu_init(vdev);
>> +    if (ret) {
>> +        ivpu_err(vdev, "Failed to initialize MMU device: %d\n", ret);
>> +        goto err_mmu_gctx_fini;
>> +    }
>> +
>>       return 0;
>>   +err_mmu_gctx_fini:
>> +    ivpu_mmu_global_context_fini(vdev);
>> +err_power_down:
>> +    ivpu_hw_power_down(vdev);
>>   err_irq_fini:
>>       ivpu_irq_fini(vdev);
>>   err_pci_fini:
>> @@ -316,6 +369,8 @@ static void ivpu_dev_fini(struct ivpu_device *vdev)
>>   {
>>       ivpu_shutdown(vdev);
>>   +    ivpu_mmu_fini(vdev);
>> +    ivpu_mmu_global_context_fini(vdev);
>>       ivpu_irq_fini(vdev);
>>       ivpu_pci_fini(vdev);
>>   diff --git a/drivers/gpu/drm/ivpu/ivpu_drv.h b/drivers/gpu/drm/ivpu/ivpu_drv.h
>> index 43dfa78544c6..6eec3eb76c2f 100644
>> --- a/drivers/gpu/drm/ivpu/ivpu_drv.h
>> +++ b/drivers/gpu/drm/ivpu/ivpu_drv.h
>> @@ -14,6 +14,8 @@
>>   #include <linux/xarray.h>
>>   #include <uapi/drm/ivpu_drm.h>
>>   +#include "ivpu_mmu_context.h"
>> +
>>   #define DRIVER_NAME "intel_vpu"
>>   #define DRIVER_DESC "Driver for Intel Versatile Processing Unit (VPU)"
>>   #define DRIVER_DATE "20220913"
>> @@ -70,6 +72,7 @@ struct ivpu_wa_table {
>>   };
>>     struct ivpu_hw_info;
>> +struct ivpu_mmu_info;
>>     struct ivpu_device {
>>       struct drm_device drm; /* Must be first */
>> @@ -80,7 +83,9 @@ struct ivpu_device {
>>         struct ivpu_wa_table wa;
>>       struct ivpu_hw_info *hw;
>> +    struct ivpu_mmu_info *mmu;
>>   +    struct ivpu_mmu_context gctx;
>>       struct xarray context_xa;
>>       struct xa_limit context_xa_limit;
>>   @@ -95,6 +100,8 @@ struct ivpu_device {
>>   struct ivpu_file_priv {
>>       struct kref ref;
>>       struct ivpu_device *vdev;
>> +    struct mutex lock;
> 
> There was another lock in the mmu struct, but what's this lock for?

It is used for protecting lazy context init and cmdq added in patch 6.
The comment for this mutex is also in patch 6.
I've removed lazy context init so it will be now used only for cmdq.
The comment will also be in the correct patch.


Regards,
Jacek
