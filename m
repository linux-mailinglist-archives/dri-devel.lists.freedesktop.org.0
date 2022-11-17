Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B78062DD73
	for <lists+dri-devel@lfdr.de>; Thu, 17 Nov 2022 15:00:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43F710E615;
	Thu, 17 Nov 2022 14:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3097210E604
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Nov 2022 14:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668693636; x=1700229636;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=6OHUllzf+LcPEuI8NQlXbqlblHMC8KU9KNe2tBwmP2U=;
 b=DfZ6uCurixEz/hM2zq5Tb6eHVxwdw7mGw9y8BNB4LFv4NIaKNlMi8IVe
 9zFAGL9vc2kFOxhczUX2kLGO5LnRPV/1uf7TEbr2/w6P/htVIBkGSRJ7f
 AopzRWbZ/pOZ0DwANbFpyPDTbv0AYvmJJrV8X5vWK7eb3W7dRJw6qFHRS
 eQFCxLe0A4fRQFny2266BQWUjLap9TtTEF7UP4c9gmUJonSp+tsnVbo2B
 UNSafgaZQlfbg6/on6bBkpU0l4f67iXIA0lC0RJM2A5FnbvZzWpO1V3OE
 ZlYBEw/wpboG06b4XgRwE5RZ5G8PkwNxwAnOEr52WFVLNQ4g8seWuuuZX w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="399143301"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="399143301"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 06:00:35 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="703341650"
X-IronPort-AV: E=Sophos;i="5.96,171,1665471600"; d="scan'208";a="703341650"
Received: from jlawryno-mobl.ger.corp.intel.com (HELO [10.249.148.197])
 ([10.249.148.197])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 06:00:33 -0800
Message-ID: <0684f048-423d-9350-b377-6d8b826734e7@linux.intel.com>
Date: Thu, 17 Nov 2022 15:00:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 2/7] drm/ivpu: Add Intel VPU MMU support
To: Jeffrey Hugo <quic_jhugo@quicinc.com>, dri-devel@lists.freedesktop.org,
 airlied@gmail.com, daniel@ffwll.ch
References: <20220924151149.323622-1-jacek.lawrynowicz@linux.intel.com>
 <20220924151149.323622-3-jacek.lawrynowicz@linux.intel.com>
 <e5db1ae6-773f-a2da-ab1b-465cb51d7db0@quicinc.com>
 <51204e64-8686-78a8-91f0-18c7bd5b5bdd@linux.intel.com>
 <23ea08ea-a1be-edd3-2b13-1c1849ccac0d@quicinc.com>
Content-Language: en-US
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <23ea08ea-a1be-edd3-2b13-1c1849ccac0d@quicinc.com>
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

On 10/27/2022 7:44 PM, Jeffrey Hugo wrote:
> On 10/27/2022 3:14 AM, Jacek Lawrynowicz wrote:
>> Hi,
>>
>> Thanks for an in-depth review. My responses are inline.
>>
>> On 10/26/2022 2:12 AM, Jeffrey Hugo wrote:
>>> On 9/24/2022 9:11 AM, Jacek Lawrynowicz wrote:
>>>> VPU Memory Management Unit is based on ARM MMU-600.
>>>> It allows to create multiple virtual address spaces for the device and
>>>
>>> "It allows the creation of"?
>>
>> OK
>>
>>>> map noncontinuous host memory (there is no dedicated memory on the VPU).
>>>>
>>>> Address space is implemented as a struct ivpu_mmu_context, it has an ID,
>>>> drm_mm allocator for VPU addresses and struct ivpu_mmu_pgtable that holds
>>>> actual 3-level, 4KB page table.
>>>> Context with ID 0 (global context) is created upon driver initialization
>>>> and it's mainly used for mapping memory required to execute
>>>> the firmware.
>>>> Contexts with non-zero IDs are user contexts allocated each time
>>>> the devices is open()-ed and they map command buffers and other
>>>> workload-related memory.
>>>> Workloads executing in a given contexts have access only
>>>> to the memory mapped in this context.
>>>>
>>>> This patch is has to main files:
>>>>     - ivpu_mmu_context.c handles MMU page tables and memory mapping
>>>>     - ivpu_mmu.c implements a driver that programs the MMU device
>>>>
>>>> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
>>>> Signed-off-by: Krystian Pradzynski <krystian.pradzynski@linux.intel.com>
>>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>>
>>> So, this doesn't look valid.  This indicates that Karol wrote this patch, then it was handed off to Krystian, and then to you.  However, if that were the case, then the patch should be from Karol (which is then the author in git).  It is not.  It is from you.
>>>
>>> What I suspect is happening is that the three of you all co-authroed this change.  In that case, there should probably be Co-developed-by tags in addition to SOB to make that clear.
>>>
>>> Also, I missed this on the first patch I reviewed eariler, but it looks to have the same issue.
>>
>> OK, I will change this in all the patches.
>>
>>>> ---
>>>>    drivers/gpu/drm/ivpu/Makefile           |   4 +-
>>>>    drivers/gpu/drm/ivpu/ivpu_drv.c         |  59 +-
>>>>    drivers/gpu/drm/ivpu/ivpu_drv.h         |   7 +
>>>>    drivers/gpu/drm/ivpu/ivpu_hw_mtl.c      |  10 +
>>>>    drivers/gpu/drm/ivpu/ivpu_mmu.c         | 883 ++++++++++++++++++++++++
>>>>    drivers/gpu/drm/ivpu/ivpu_mmu.h         |  53 ++
>>>>    drivers/gpu/drm/ivpu/ivpu_mmu_context.c | 419 +++++++++++
>>>>    drivers/gpu/drm/ivpu/ivpu_mmu_context.h |  49 ++
>>>>    include/uapi/drm/ivpu_drm.h             |   4 +
>>>>    9 files changed, 1485 insertions(+), 3 deletions(-)
>>>>    create mode 100644 drivers/gpu/drm/ivpu/ivpu_mmu.c
>>>>    create mode 100644 drivers/gpu/drm/ivpu/ivpu_mmu.h
>>>>    create mode 100644 drivers/gpu/drm/ivpu/ivpu_mmu_context.c
>>>>    create mode 100644 drivers/gpu/drm/ivpu/ivpu_mmu_context.h
>>>>
>>>> diff --git a/drivers/gpu/drm/ivpu/Makefile b/drivers/gpu/drm/ivpu/Makefile
>>>> index e59dc65abe6a..95bb04f26296 100644
>>>> --- a/drivers/gpu/drm/ivpu/Makefile
>>>> +++ b/drivers/gpu/drm/ivpu/Makefile
>>>> @@ -3,6 +3,8 @@
>>>>      intel_vpu-y := \
>>>>        ivpu_drv.o \
>>>> -    ivpu_hw_mtl.o
>>>> +    ivpu_hw_mtl.o \
>>>> +    ivpu_mmu.o \
>>>> +    ivpu_mmu_context.o
>>>>      obj-$(CONFIG_DRM_IVPU) += intel_vpu.o
>>>> diff --git a/drivers/gpu/drm/ivpu/ivpu_drv.c b/drivers/gpu/drm/ivpu/ivpu_drv.c
>>>> index a01c7244f6e5..cbeb9a801a31 100644
>>>> --- a/drivers/gpu/drm/ivpu/ivpu_drv.c
>>>> +++ b/drivers/gpu/drm/ivpu/ivpu_drv.c
>>>> @@ -14,6 +14,8 @@
>>>>      #include "ivpu_drv.h"
>>>>    #include "ivpu_hw.h"
>>>> +#include "ivpu_mmu.h"
>>>> +#include "ivpu_mmu_context.h"
>>>>      #ifndef DRIVER_VERSION_STR
>>>>    #define DRIVER_VERSION_STR __stringify(DRM_IVPU_DRIVER_MAJOR) "." \
>>>> @@ -50,6 +52,11 @@ char *ivpu_platform_to_str(u32 platform)
>>>>      void ivpu_file_priv_get(struct ivpu_file_priv *file_priv, struct ivpu_file_priv **link)
>>>>    {
>>>> +    struct ivpu_device *vdev = file_priv->vdev;
>>>> +
>>>> +    ivpu_dbg(KREF, "file_priv get: ctx %u refcount %u\n",
>>>> +         file_priv->ctx.id, kref_read(&file_priv->ref));
>>>> +
>>>>        kref_get(&file_priv->ref);
>>>>        *link = file_priv;
>>>>    }
>>>
>>> This hunk doesn't appear related to $SUBJECT.  It looks like it would fit better as part of patch 1.
>>
>> file_priv->ctx is added in this patch and without context id this message does not make sense so
>> this patch is the earliest the message can be printed.
> 
> I see
> 
>>
>>>> @@ -57,6 +64,12 @@ void ivpu_file_priv_get(struct ivpu_file_priv *file_priv, struct ivpu_file_priv
>>>>    static void file_priv_release(struct kref *ref)
>>>>    {
>>>>        struct ivpu_file_priv *file_priv = container_of(ref, struct ivpu_file_priv, ref);
>>>> +    struct ivpu_device *vdev = file_priv->vdev;
>>>
>>> Why do we need this?  It doesn't appear to be used at this time.  If it is needed later in the series, add it then.
>>
>> vdev is implicitly used by ivpu_dbg(). This allows us to keep messages a bit longer and cleaner.
> 
> Violates coding-style -
> 
> 12) Macros, Enums and RTL
> -------------------------
> .
> .
> Things to avoid when using macros:
> .
> .
> 2) macros that depend on having a local variable with a magic name:
> 
> .. code-block:: c
> 
>     #define FOO(val) bar(index, val)
> 
> might look like a good thing, but it's confusing as hell when one reads the
> code and it's prone to breakage from seemingly innocent changes.

Yeah, this was a mistake. I'll add explicit argument.

>>>> +
>>>> +    ivpu_dbg(FILE, "file_priv release: ctx %u\n", file_priv->ctx.id);
>>>> +
>>>> +    if (file_priv->ctx.id)
>>>> +        ivpu_mmu_user_context_fini(file_priv);
>>>>          kfree(file_priv);
>>>>    }
>>>> @@ -64,6 +77,10 @@ static void file_priv_release(struct kref *ref)
>>>>    void ivpu_file_priv_put(struct ivpu_file_priv **link)
>>>>    {
>>>>        struct ivpu_file_priv *file_priv = *link;
>>>> +    struct ivpu_device *vdev = file_priv->vdev;
>>>> +
>>>> +    ivpu_dbg(KREF, "file_priv put: ctx %u refcount %u\n",
>>>> +         file_priv->ctx.id, kref_read(&file_priv->ref));
>>>>    
>>>
>>> vdev doesn't appear to be used, and the log message doesn't appear related to $SUBJECT
>>
>> vdev is implicitly used by ivpu_dbg() and file_priv->ctx.id is added in this patch.
>>
>>>>        *link = NULL;
>>>>        kref_put(&file_priv->ref, file_priv_release);
>>>> @@ -75,7 +92,11 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
>>>>        struct ivpu_device *vdev = file_priv->vdev;
>>>>        struct pci_dev *pdev = to_pci_dev(vdev->drm.dev);
>>>>        struct drm_ivpu_param *args = data;
>>>> -    int ret = 0;
>>>> +    int ret;
>>>> +
>>>> +    ret = ivpu_mmu_user_context_init(file_priv);
>>>> +    if (ret)
>>>> +        return ret;
>>>
>>> I fail to understand why we are initializing a user context in an ioctl.  This will happen N times, for N ioctl calls that a particular user does.  Feels like something that should occur in ivpu_open().  What am I missing?
>>
>> The context is lazy initialized and it will be only initialized once during first buffer related ioctl.
>> We don't want to allocate context ids and page tables for random user processes (Xorg, chrome, etc.).
>> Currently user space has to open /dev/dri device in order to figure out what it is so we are optimizing for this case.
> 
> Hmm.  So, I haven't suggested this yet, but this driver looks like a good candidate for the newly proposed accel subsystem.  Since that subsystem has different devnodes, it will probably address this concern.
> 
> Regardless, is there an actual observed performance hit or other downside to this, or was this just something that was optimized for the sake of being optimal?

There were like 8MB of dma memory allocated on open() for the page tables but
since then we moved to lazy alloc for the page tables and this is no longer an issue.
I will remove lazy context alloc.

 
>>
>>>>          switch (args->param) {
>>>>        case DRM_IVPU_PARAM_DEVICE_ID:
>>>> @@ -99,6 +120,9 @@ static int ivpu_get_param_ioctl(struct drm_device *dev, void *data, struct drm_f
>>>>        case DRM_IVPU_PARAM_CONTEXT_PRIORITY:
>>>>            args->value = file_priv->priority;
>>>>            break;
>>>> +    case DRM_IVPU_PARAM_CONTEXT_ID:
>>>> +        args->value = file_priv->ctx.id;
>>>> +        break;
>>>>        default:
>>>>            ret = -EINVAL;
>>>>        }
>>>> @@ -110,7 +134,11 @@ static int ivpu_set_param_ioctl(struct drm_device *dev, void *data, struct drm_f
>>>>    {
>>>>        struct ivpu_file_priv *file_priv = file->driver_priv;
>>>>        struct drm_ivpu_param *args = data;
>>>> -    int ret = 0;
>>>> +    int ret;
>>>> +
>>>> +    ret = ivpu_mmu_user_context_init(file_priv);
>>>> +    if (ret)
>>>> +        return ret;
>>>>    
>>>
>>> Again, initializing a context in an ioctl isn't making sense to me.
>>
>> See above.
>>
>>>>        switch (args->param) {
>>>>        case DRM_IVPU_PARAM_CONTEXT_PRIORITY:
>>>> @@ -139,9 +167,13 @@ static int ivpu_open(struct drm_device *dev, struct drm_file *file)
>>>>        file_priv->priority = DRM_IVPU_CONTEXT_PRIORITY_NORMAL;
>>>>          kref_init(&file_priv->ref);
>>>> +    mutex_init(&file_priv->lock);
>>>>          file->driver_priv = file_priv;
>>>>    +    ivpu_dbg(FILE, "file_priv alloc: process %s pid %d\n",
>>>> +         current->comm, task_pid_nr(current));
>>>> +
>>>
>>> As it is, this doesn't seem related to $SUBJECT and seems to belong in patch 1.
>>>
>>> However, this seems dubious. Trace gives you the task name and pid for the process that triggered a trace, and you don't need to add anything to your code to be able to trace any symbol.
>>
>> Sure but then it would be difficult to correlate this with the rest of dbg messages.
>> In order to properly use ftrace we have to implement tracing in the whole driver.
>> This is a first iteration of the driver that supposed to be as minimal as possible to make upstreaming easy :P
> 
> You could remove all the debug info if "minimal" is the goal  :P
> 
> I see improvements listed in the TODO, so I guess thats fair.
> 
>>
>>>>        return 0;
>>>>    }
>>>>    @@ -164,6 +196,7 @@ int ivpu_shutdown(struct ivpu_device *vdev)
>>>>        int ret;
>>>>          ivpu_hw_irq_disable(vdev);
>>>> +    ivpu_mmu_disable(vdev);
>>>>          ret = ivpu_hw_power_down(vdev);
>>>
>>> I'm a bit confused.  It is good practice to balance your init and cleanup (fini in this series).  Everything that is done in init, is undone in fini in the reverse order.  This makes it easy to make sure things haven't been forgotten.
>>>
>>> I don't understand what ivpu_shutdown() is suposed to be paired with.  I thought it was ivpu_hw_power_up(), but you have power_down() in shutdown().
>>>
>>> I can't tell what mmu_disable() is suposed to pair with.  dev_init()?
>>
>> Yeah I know this is a bit confusing in this patch. ivpu_shutdown() will be paired by ivpu_boot() in patch 5.
>> I've added ivpu_shutdown() here so next patches in the series only add new code hoping it will be easier to review :/
>> Still it's gonna be confusing also later on. We have different boot flows for initial driver load and runtime resume.
>> ivpu_dev_init() cannot power up the vpu in ivpu_boot() as it needs access to registers before boot.
>> Also MMU has to be initialized early so internal allocations can be done in page tables.
>> Please take a look ivpu_dev_init() and ivpu_resume(), maybe you could suggest a better approach.
> 
> I went an looked at the final code result at the end of the series, and it doesn't look too bad.  I'm not seeing an easy alternative.  A few comments stating in code what you just explained about why things are how they are as little helper pointers to the reader might be good.

OK, I will add some comments.

>>
>>>>        if (ret)
>>>> @@ -272,6 +305,10 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>>>>        if (!vdev->hw)
>>>>            return -ENOMEM;
>>>>    +    vdev->mmu = devm_kzalloc(vdev->drm.dev, sizeof(*vdev->mmu), GFP_KERNEL);
>>>> +    if (!vdev->mmu)
>>>> +        return -ENOMEM;
>>>> +
>>>>        vdev->hw->ops = &ivpu_hw_mtl_ops;
>>>>        vdev->platform = IVPU_PLATFORM_INVALID;
>>>>    @@ -303,8 +340,24 @@ static int ivpu_dev_init(struct ivpu_device *vdev)
>>>>            goto err_irq_fini;
>>>>        }
>>>>    +    ret = ivpu_mmu_global_context_init(vdev);
>>>> +    if (ret) {
>>>> +        ivpu_err(vdev, "Failed to initialize global MMU context: %d\n", ret);
>>>> +        goto err_power_down;
>>>> +    }
>>>> +
>>>> +    ret = ivpu_mmu_init(vdev);
>>>> +    if (ret) {
>>>> +        ivpu_err(vdev, "Failed to initialize MMU device: %d\n", ret);
>>>> +        goto err_mmu_gctx_fini;
>>>> +    }
>>>> +
>>>>        return 0;
>>>>    +err_mmu_gctx_fini:
>>>> +    ivpu_mmu_global_context_fini(vdev);
>>>> +err_power_down:
>>>> +    ivpu_hw_power_down(vdev);
>>>>    err_irq_fini:
>>>>        ivpu_irq_fini(vdev);
>>>>    err_pci_fini:
>>>> @@ -316,6 +369,8 @@ static void ivpu_dev_fini(struct ivpu_device *vdev)
>>>>    {
>>>>        ivpu_shutdown(vdev);
>>>>    +    ivpu_mmu_fini(vdev);
>>>> +    ivpu_mmu_global_context_fini(vdev);
>>>>        ivpu_irq_fini(vdev);
>>>>        ivpu_pci_fini(vdev);
>>>>    diff --git a/drivers/gpu/drm/ivpu/ivpu_drv.h b/drivers/gpu/drm/ivpu/ivpu_drv.h
>>>> index 43dfa78544c6..6eec3eb76c2f 100644
>>>> --- a/drivers/gpu/drm/ivpu/ivpu_drv.h
>>>> +++ b/drivers/gpu/drm/ivpu/ivpu_drv.h
>>>> @@ -14,6 +14,8 @@
>>>>    #include <linux/xarray.h>
>>>>    #include <uapi/drm/ivpu_drm.h>
>>>>    +#include "ivpu_mmu_context.h"
>>>> +
>>>>    #define DRIVER_NAME "intel_vpu"
>>>>    #define DRIVER_DESC "Driver for Intel Versatile Processing Unit (VPU)"
>>>>    #define DRIVER_DATE "20220913"
>>>> @@ -70,6 +72,7 @@ struct ivpu_wa_table {
>>>>    };
>>>>      struct ivpu_hw_info;
>>>> +struct ivpu_mmu_info;
>>>
>>> Why not just include ivpu_mmu.h?
>>
>> To minimize dependencies between c files. We don't want all driver headers included in ivpu_drv.h.
>>
>>>>      struct ivpu_device {
>>>>        struct drm_device drm; /* Must be first */
>>>> @@ -80,7 +83,9 @@ struct ivpu_device {
>>>>          struct ivpu_wa_table wa;
>>>>        struct ivpu_hw_info *hw;
>>>> +    struct ivpu_mmu_info *mmu;
>>>>    +    struct ivpu_mmu_context gctx;
>>>>        struct xarray context_xa;
>>>>        struct xa_limit context_xa_limit;
>>>>    @@ -95,6 +100,8 @@ struct ivpu_device {
>>>>    struct ivpu_file_priv {
>>>>        struct kref ref;
>>>>        struct ivpu_device *vdev;
>>>> +    struct mutex lock;
>>>
>>> A comment indicating what this protects would be extremely useful.
>>
>> OK
>>
>>>> +    struct ivpu_mmu_context ctx;
>>>>        u32 priority;
>>>>    };
>>>>    diff --git a/drivers/gpu/drm/ivpu/ivpu_hw_mtl.c b/drivers/gpu/drm/ivpu/ivpu_hw_mtl.c
>>>> index 17fc8e1104df..525b57c4029c 100644
>>>> --- a/drivers/gpu/drm/ivpu/ivpu_hw_mtl.c
>>>> +++ b/drivers/gpu/drm/ivpu/ivpu_hw_mtl.c
>>>> @@ -7,6 +7,7 @@
>>>>    #include "ivpu_hw_mtl_reg.h"
>>>>    #include "ivpu_hw_reg_io.h"
>>>>    #include "ivpu_hw.h"
>>>> +#include "ivpu_mmu.h"
>>>>      #define TILE_FUSE_ENABLE_BOTH         0x0
>>>>    #define TILE_FUSE_ENABLE_UPPER         0x1
>>>> @@ -930,6 +931,15 @@ static irqreturn_t ivpu_hw_mtl_irqv_handler(struct ivpu_device *vdev, int irq)
>>>>          REGV_WR32(MTL_VPU_HOST_SS_ICB_CLEAR_0, status);
>>>>    +    if (REG_TEST_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, MMU_IRQ_0_INT, status))
>>>> +        ret &= ivpu_mmu_irq_evtq_handler(vdev);
>>>> +
>>>> +    if (REG_TEST_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, MMU_IRQ_1_INT, status))
>>>> +        ivpu_dbg(IRQ, "MMU sync complete\n");
>>>> +
>>>> +    if (REG_TEST_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, MMU_IRQ_2_INT, status))
>>>> +        ret &= ivpu_mmu_irq_gerr_handler(vdev);
>>>> +
>>>>        if (REG_TEST_FLD(MTL_VPU_HOST_SS_ICB_STATUS_0, CPU_INT_REDIRECT_0_INT, status))
>>>>            ret &= ivpu_hw_mtl_irq_wdt_mss_handler(vdev);
>>>>    diff --git a/drivers/gpu/drm/ivpu/ivpu_mmu.c b/drivers/gpu/drm/ivpu/ivpu_mmu.c
>>>> new file mode 100644
>>>> index 000000000000..b9f225a83c45
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/ivpu/ivpu_mmu.c
>>>> @@ -0,0 +1,883 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>>> +/*
>>>> + * Copyright © 2020-2022 Intel Corporation
>>>> + */
>>>> +
>>>> +#include <linux/highmem.h>
>>>> +#include <linux/circ_buf.h>
>>>
>>> Alphabetical order?
>>
>> OK
>>
>>>> +
>>>> +#include "ivpu_drv.h"
>>>> +#include "ivpu_hw_mtl_reg.h"
>>>> +#include "ivpu_hw_reg_io.h"
>>>> +#include "ivpu_mmu.h"
>>>> +#include "ivpu_mmu_context.h"
>>>> +
>>>> +#define IVPU_MMU_IDR0_REF        0x080f3e0f
>>>> +#define IVPU_MMU_IDR0_REF_SIMICS    0x080f3e1f
>>>> +#define IVPU_MMU_IDR1_REF        0x0e739d18
>>>> +#define IVPU_MMU_IDR3_REF        0x0000003c
>>>> +#define IVPU_MMU_IDR5_REF        0x00040070
>>>> +#define IVPU_MMU_IDR5_REF_SIMICS    0x00000075
>>>> +#define IVPU_MMU_IDR5_REF_FPGA        0x00800075
>>>> +
>>>> +#define IVPU_MMU_CDTAB_ENT_SIZE        64
>>>> +#define IVPU_MMU_CDTAB_ENT_COUNT_LOG2    8 /* 256 entries */
>>>> +#define IVPU_MMU_CDTAB_ENT_COUNT    ((u32)1 << IVPU_MMU_CDTAB_ENT_COUNT_LOG2)
>>>
>>> Isn't this just BIT(IVPU_MMU_CDTAB_ENT_COUNT_LOG2)?
>>
>> It is but shift here is more readable in my opinion.
>>
>>>> +
>>>> +#define IVPU_MMU_STREAM_ID0        0
>>>> +#define IVPU_MMU_STREAM_ID3        3
>>>> +
>>>> +#define IVPU_MMU_STRTAB_ENT_SIZE    64
>>>> +#define IVPU_MMU_STRTAB_ENT_COUNT    4
>>>> +#define IVPU_MMU_STRTAB_CFG_LOG2SIZE    2
>>>> +#define IVPU_MMU_STRTAB_CFG        IVPU_MMU_STRTAB_CFG_LOG2SIZE
>>>> +
>>>> +#define IVPU_MMU_Q_COUNT_LOG2        4 /* 16 entries */
>>>> +#define IVPU_MMU_Q_COUNT        ((u32)1 << IVPU_MMU_Q_COUNT_LOG2)
>>>> +#define IVPU_MMU_Q_WRAP_BIT        (IVPU_MMU_Q_COUNT << 1)
>>>> +#define IVPU_MMU_Q_WRAP_MASK        (IVPU_MMU_Q_WRAP_BIT - 1)
>>>> +#define IVPU_MMU_Q_IDX_MASK        (IVPU_MMU_Q_COUNT - 1)
>>>> +#define IVPU_MMU_Q_IDX(val)        ((val) & IVPU_MMU_Q_IDX_MASK)
>>>> +
>>>> +#define IVPU_MMU_CMDQ_CMD_SIZE        16
>>>> +#define IVPU_MMU_CMDQ_SIZE        (IVPU_MMU_Q_COUNT * IVPU_MMU_CMDQ_CMD_SIZE)
>>>> +
>>>> +#define IVPU_MMU_EVTQ_CMD_SIZE        32
>>>> +#define IVPU_MMU_EVTQ_SIZE        (IVPU_MMU_Q_COUNT * IVPU_MMU_EVTQ_CMD_SIZE)
>>>> +
>>>> +#define IVPU_MMU_CMD_OPCODE        GENMASK(8, 0)
>>>> +
>>>> +#define IVPU_MMU_CMD_SYNC_0_CS        GENMASK(13, 12)
>>>> +#define IVPU_MMU_CMD_SYNC_0_MSH        GENMASK(23, 22)
>>>> +#define IVPU_MMU_CMD_SYNC_0_MSI_ATTR    GENMASK(27, 24)
>>>> +#define IVPU_MMU_CMD_SYNC_0_MSI_ATTR    GENMASK(27, 24)
>>>> +#define IVPU_MMU_CMD_SYNC_0_MSI_DATA    GENMASK(63, 32)
>>>> +
>>>> +#define IVPU_MMU_CMD_CFGI_0_SSEC    BIT(10)
>>>> +#define IVPU_MMU_CMD_CFGI_0_SSV        BIT(11)
>>>> +#define IVPU_MMU_CMD_CFGI_0_SSID    GENMASK(31, 12)
>>>> +#define IVPU_MMU_CMD_CFGI_0_SID        GENMASK(63, 32)
>>>> +#define IVPU_MMU_CMD_CFGI_1_RANGE    GENMASK(4, 0)
>>>> +
>>>> +#define IVPU_MMU_CMD_TLBI_0_ASID    GENMASK(63, 48)
>>>> +#define IVPU_MMU_CMD_TLBI_0_VMID    GENMASK(47, 32)
>>>> +
>>>> +#define CMD_PREFETCH_CFG        0x1
>>>> +#define CMD_CFGI_STE            0x3
>>>> +#define CMD_CFGI_ALL            0x4
>>>> +#define CMD_CFGI_CD            0x5
>>>> +#define CMD_CFGI_CD_ALL            0x6
>>>> +#define CMD_TLBI_NH_ASID        0x11
>>>> +#define CMD_TLBI_EL2_ALL        0x20
>>>> +#define CMD_TLBI_NSNH_ALL        0x30
>>>> +#define CMD_SYNC            0x46
>>>> +
>>>> +#define IVPU_MMU_EVT_F_UUT        0x01
>>>> +#define IVPU_MMU_EVT_C_BAD_STREAMID    0x02
>>>> +#define IVPU_MMU_EVT_F_STE_FETCH    0x03
>>>> +#define IVPU_MMU_EVT_C_BAD_STE        0x04
>>>> +#define IVPU_MMU_EVT_F_BAD_ATS_TREQ    0x05
>>>> +#define IVPU_MMU_EVT_F_STREAM_DISABLED    0x06
>>>> +#define IVPU_MMU_EVT_F_TRANSL_FORBIDDEN    0x07
>>>> +#define IVPU_MMU_EVT_C_BAD_SUBSTREAMID    0x08
>>>> +#define IVPU_MMU_EVT_F_CD_FETCH        0x09
>>>> +#define IVPU_MMU_EVT_C_BAD_CD        0x0a
>>>> +#define IVPU_MMU_EVT_F_WALK_EABT    0x0b
>>>> +#define IVPU_MMU_EVT_F_TRANSLATION    0x10
>>>> +#define IVPU_MMU_EVT_F_ADDR_SIZE    0x11
>>>> +#define IVPU_MMU_EVT_F_ACCESS        0x12
>>>> +#define IVPU_MMU_EVT_F_PERMISSION    0x13
>>>> +#define IVPU_MMU_EVT_F_TLB_CONFLICT    0x20
>>>> +#define IVPU_MMU_EVT_F_CFG_CONFLICT    0x21
>>>> +#define IVPU_MMU_EVT_E_PAGE_REQUEST    0x24
>>>> +#define IVPU_MMU_EVT_F_VMS_FETCH    0x25
>>>> +
>>>> +#define IVPU_MMU_EVTS_MAX        8
>>>> +
>>>> +#define IVPU_MMU_EVT_OP_MASK        GENMASK_ULL(7, 0)
>>>> +#define IVPU_MMU_EVT_SSID_MASK        GENMASK_ULL(31, 12)
>>>> +
>>>> +#define IVPU_MMU_Q_BASE_RWA        BIT(62)
>>>> +#define IVPU_MMU_Q_BASE_ADDR_MASK    GENMASK_ULL(51, 5)
>>>> +#define IVPU_MMU_STRTAB_BASE_RA        BIT(62)
>>>> +#define IVPU_MMU_STRTAB_BASE_ADDR_MASK    GENMASK_ULL(51, 6)
>>>> +
>>>> +#define IVPU_MMU_IRQ_EVTQ_EN        BIT(2)
>>>> +#define IVPU_MMU_IRQ_GERROR_EN        BIT(0)
>>>> +
>>>> +#define IVPU_MMU_CR0_ATSCHK        BIT(4)
>>>> +#define IVPU_MMU_CR0_CMDQEN        BIT(3)
>>>> +#define IVPU_MMU_CR0_EVTQEN        BIT(2)
>>>> +#define IVPU_MMU_CR0_PRIQEN        BIT(1)
>>>> +#define IVPU_MMU_CR0_SMMUEN        BIT(0)
>>>> +
>>>> +#define IVPU_MMU_CR1_TABLE_SH        GENMASK(11, 10)
>>>> +#define IVPU_MMU_CR1_TABLE_OC        GENMASK(9, 8)
>>>> +#define IVPU_MMU_CR1_TABLE_IC        GENMASK(7, 6)
>>>> +#define IVPU_MMU_CR1_QUEUE_SH        GENMASK(5, 4)
>>>> +#define IVPU_MMU_CR1_QUEUE_OC        GENMASK(3, 2)
>>>> +#define IVPU_MMU_CR1_QUEUE_IC        GENMASK(1, 0)
>>>> +#define IVPU_MMU_CACHE_NC        0
>>>> +#define IVPU_MMU_CACHE_WB        1
>>>> +#define IVPU_MMU_CACHE_WT        2
>>>> +#define IVPU_MMU_SH_NSH            0
>>>> +#define IVPU_MMU_SH_OSH            2
>>>> +#define IVPU_MMU_SH_ISH            3
>>>> +
>>>> +#define IVPU_MMU_CMDQ_OP        GENMASK_ULL(7, 0)
>>>> +
>>>> +#define IVPU_MMU_CD_0_TCR_T0SZ        GENMASK_ULL(5, 0)
>>>> +#define IVPU_MMU_CD_0_TCR_TG0        GENMASK_ULL(7, 6)
>>>> +#define IVPU_MMU_CD_0_TCR_IRGN0        GENMASK_ULL(9, 8)
>>>> +#define IVPU_MMU_CD_0_TCR_ORGN0        GENMASK_ULL(11, 10)
>>>> +#define IVPU_MMU_CD_0_TCR_SH0        GENMASK_ULL(13, 12)
>>>> +#define IVPU_MMU_CD_0_TCR_EPD0        BIT_ULL(14)
>>>> +#define IVPU_MMU_CD_0_TCR_EPD1        BIT_ULL(30)
>>>> +#define IVPU_MMU_CD_0_ENDI        BIT(15)
>>>> +#define IVPU_MMU_CD_0_V            BIT(31)
>>>> +#define IVPU_MMU_CD_0_TCR_IPS        GENMASK_ULL(34, 32)
>>>> +#define IVPU_MMU_CD_0_TCR_TBI0        BIT_ULL(38)
>>>> +#define IVPU_MMU_CD_0_AA64        BIT(41)
>>>> +#define IVPU_MMU_CD_0_S            BIT(44)
>>>> +#define IVPU_MMU_CD_0_R            BIT(45)
>>>> +#define IVPU_MMU_CD_0_A            BIT(46)
>>>> +#define IVPU_MMU_CD_0_ASET        BIT(47)
>>>> +#define IVPU_MMU_CD_0_ASID        GENMASK_ULL(63, 48)
>>>> +
>>>> +#define IVPU_MMU_CD_1_TTB0_MASK        GENMASK_ULL(51, 4)
>>>> +
>>>> +#define IVPU_MMU_STE_0_S1CDMAX        GENMASK_ULL(63, 59)
>>>> +#define IVPU_MMU_STE_0_S1FMT        GENMASK_ULL(5, 4)
>>>> +#define IVPU_MMU_STE_0_S1FMT_LINEAR    0
>>>> +#define IVPU_MMU_STE_DWORDS        8
>>>> +#define IVPU_MMU_STE_0_CFG_S1_TRANS    5
>>>> +#define IVPU_MMU_STE_0_CFG        GENMASK_ULL(3, 1)
>>>> +#define IVPU_MMU_STE_0_S1CTXPTR_MASK    GENMASK_ULL(51, 6)
>>>> +#define IVPU_MMU_STE_0_V            BIT(0)
>>>> +
>>>> +#define IVPU_MMU_STE_1_STRW_NSEL1    0ul
>>>> +#define IVPU_MMU_STE_1_CONT        GENMASK_ULL(16, 13)
>>>> +#define IVPU_MMU_STE_1_STRW        GENMASK_ULL(31, 30)
>>>> +#define IVPU_MMU_STE_1_PRIVCFG        GENMASK_ULL(49, 48)
>>>> +#define IVPU_MMU_STE_1_PRIVCFG_UNPRIV    2ul
>>>> +#define IVPU_MMU_STE_1_INSTCFG        GENMASK_ULL(51, 50)
>>>> +#define IVPU_MMU_STE_1_INSTCFG_DATA    2ul
>>>> +#define IVPU_MMU_STE_1_MEV        BIT(19)
>>>> +#define IVPU_MMU_STE_1_S1STALLD        BIT(27)
>>>> +#define IVPU_MMU_STE_1_S1C_CACHE_NC    0ul
>>>> +#define IVPU_MMU_STE_1_S1C_CACHE_WBRA    1ul
>>>> +#define IVPU_MMU_STE_1_S1C_CACHE_WT    2ul
>>>> +#define IVPU_MMU_STE_1_S1C_CACHE_WB    3ul
>>>> +#define IVPU_MMU_STE_1_S1CIR        GENMASK_ULL(3, 2)
>>>> +#define IVPU_MMU_STE_1_S1COR        GENMASK_ULL(5, 4)
>>>> +#define IVPU_MMU_STE_1_S1CSH        GENMASK_ULL(7, 6)
>>>> +#define IVPU_MMU_STE_1_S1DSS        GENMASK_ULL(1, 0)
>>>> +#define IVPU_MMU_STE_1_S1DSS_TERMINATE    0x0
>>>> +
>>>> +#define IVPU_MMU_REG_TIMEOUT_US        (10 * USEC_PER_MSEC)
>>>> +#define IVPU_MMU_QUEUE_TIMEOUT_US    (100 * USEC_PER_MSEC)
>>>> +
>>>> +#define IVPU_MMU_GERROR_ERR_MASK ((REG_FLD(MTL_VPU_HOST_MMU_GERROR, CMDQ)) | \
>>>> +                  (REG_FLD(MTL_VPU_HOST_MMU_GERROR, EVTQ_ABT)) | \
>>>> +                  (REG_FLD(MTL_VPU_HOST_MMU_GERROR, PRIQ_ABT)) | \
>>>> +                  (REG_FLD(MTL_VPU_HOST_MMU_GERROR, MSI_CMDQ_ABT)) | \
>>>> +                  (REG_FLD(MTL_VPU_HOST_MMU_GERROR, MSI_EVTQ_ABT)) | \
>>>> +                  (REG_FLD(MTL_VPU_HOST_MMU_GERROR, MSI_PRIQ_ABT)) | \
>>>> +                  (REG_FLD(MTL_VPU_HOST_MMU_GERROR, MSI_ABT)) | \
>>>> +                  (REG_FLD(MTL_VPU_HOST_MMU_GERROR, SFM)))
>>>> +
>>>> +static char *ivpu_mmu_evt_to_str(u32 cmd)
>>>> +{
>>>> +    switch (cmd) {
>>>> +    case IVPU_MMU_EVT_F_UUT:
>>>> +        return "Unsupported Upstream Transaction";
>>>> +    case IVPU_MMU_EVT_C_BAD_STREAMID:
>>>> +        return "Transaction StreamID out of range";
>>>> +    case IVPU_MMU_EVT_F_STE_FETCH:
>>>> +        return "Fetch of STE caused external abort";
>>>> +    case IVPU_MMU_EVT_C_BAD_STE:
>>>> +        return "Used STE invalid";
>>>> +    case IVPU_MMU_EVT_F_BAD_ATS_TREQ:
>>>> +        return "Address Request disallowed for a StreamID";
>>>> +    case IVPU_MMU_EVT_F_STREAM_DISABLED:
>>>> +        return "Transaction marks non-substream disabled";
>>>> +    case IVPU_MMU_EVT_F_TRANSL_FORBIDDEN:
>>>> +        return "MMU bypass is disallowed for this StreamID";
>>>> +    case IVPU_MMU_EVT_C_BAD_SUBSTREAMID:
>>>> +        return "Invalid StreamID";
>>>> +    case IVPU_MMU_EVT_F_CD_FETCH:
>>>> +        return "Fetch of CD caused external abort";
>>>> +    case IVPU_MMU_EVT_C_BAD_CD:
>>>> +        return "Fetched CD invalid";
>>>> +    case IVPU_MMU_EVT_F_WALK_EABT:
>>>> +        return " An external abort occurred fetching a TLB";
>>>> +    case IVPU_MMU_EVT_F_TRANSLATION:
>>>> +        return "Translation fault";
>>>> +    case IVPU_MMU_EVT_F_ADDR_SIZE:
>>>> +        return " Output address caused address size fault";
>>>> +    case IVPU_MMU_EVT_F_ACCESS:
>>>> +        return "Access flag fault";
>>>> +    case IVPU_MMU_EVT_F_PERMISSION:
>>>> +        return "Permission fault occurred on page access";
>>>> +    case IVPU_MMU_EVT_F_TLB_CONFLICT:
>>>> +        return "A TLB conflict";
>>>> +    case IVPU_MMU_EVT_F_CFG_CONFLICT:
>>>> +        return "A configuration cache conflict";
>>>> +    case IVPU_MMU_EVT_E_PAGE_REQUEST:
>>>> +        return "Page request hint from a client device";
>>>> +    case IVPU_MMU_EVT_F_VMS_FETCH:
>>>> +        return "Fetch of VMS caused external abort";
>>>> +    default:
>>>> +        return "Unknown CMDQ command";
>>>> +    }
>>>> +}
>>>> +
>>>> +static int ivpu_mmu_config_check(struct ivpu_device *vdev)
>>>> +{
>>>> +    u32 val_ref;
>>>> +    u32 val;
>>>> +
>>>> +    if (ivpu_is_simics(vdev))
>>>> +        val_ref = IVPU_MMU_IDR0_REF_SIMICS;
>>>> +    else
>>>> +        val_ref = IVPU_MMU_IDR0_REF;
>>>> +
>>>> +    val = REGV_RD32(MTL_VPU_HOST_MMU_IDR0);
>>>> +    if (val != val_ref)
>>>> +        ivpu_err(vdev, "IDR0 0x%x != IDR0_REF 0x%x\n", val, val_ref);
>>>> +
>>>> +    val = REGV_RD32(MTL_VPU_HOST_MMU_IDR1);
>>>> +    if (val != IVPU_MMU_IDR1_REF)
>>>> +        ivpu_warn(vdev, "IDR1 0x%x != IDR1_REF 0x%x\n", val, IVPU_MMU_IDR1_REF);
>>>> +
>>>> +    val = REGV_RD32(MTL_VPU_HOST_MMU_IDR3);
>>>> +    if (val != IVPU_MMU_IDR3_REF)
>>>> +        ivpu_warn(vdev, "IDR3 0x%x != IDR3_REF 0x%x\n", val, IVPU_MMU_IDR3_REF);
>>>> +
>>>> +    if (ivpu_is_simics(vdev))
>>>> +        val_ref = IVPU_MMU_IDR5_REF_SIMICS;
>>>> +    else if (ivpu_is_fpga(vdev))
>>>> +        val_ref = IVPU_MMU_IDR5_REF_FPGA;
>>>> +    else
>>>> +        val_ref = IVPU_MMU_IDR5_REF;
>>>> +
>>>> +    val = REGV_RD32(MTL_VPU_HOST_MMU_IDR5);
>>>> +    if (val != val_ref)
>>>> +        ivpu_warn(vdev, "IDR5 0x%x != IDR5_REF 0x%x\n", val, val_ref);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int ivpu_mmu_cdtab_alloc(struct ivpu_device *vdev)
>>>> +{
>>>> +    struct ivpu_mmu_info *mmu = vdev->mmu;
>>>> +    struct ivpu_mmu_cdtab *cdtab = &mmu->cdtab;
>>>> +    size_t size = IVPU_MMU_CDTAB_ENT_COUNT * IVPU_MMU_CDTAB_ENT_SIZE;
>>>> +
>>>> +    cdtab->base = dmam_alloc_coherent(vdev->drm.dev, size, &cdtab->dma, GFP_KERNEL);
>>>> +    if (!cdtab->base)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    ivpu_dbg(MMU, "CDTAB alloc: dma=%pad size=%zu\n", &cdtab->dma, size);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int ivpu_mmu_strtab_alloc(struct ivpu_device *vdev)
>>>> +{
>>>> +    struct ivpu_mmu_info *mmu = vdev->mmu;
>>>> +    struct ivpu_mmu_strtab *strtab = &mmu->strtab;
>>>> +    size_t size = IVPU_MMU_STRTAB_ENT_COUNT * IVPU_MMU_STRTAB_ENT_SIZE;
>>>> +
>>>> +    strtab->base = dmam_alloc_coherent(vdev->drm.dev, size, &strtab->dma, GFP_KERNEL);
>>>> +    if (!strtab->base)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    strtab->base_cfg = IVPU_MMU_STRTAB_CFG;
>>>> +    strtab->dma_q = IVPU_MMU_STRTAB_BASE_RA;
>>>> +    strtab->dma_q |= strtab->dma & IVPU_MMU_STRTAB_BASE_ADDR_MASK;
>>>> +
>>>> +    ivpu_dbg(MMU, "STRTAB alloc: dma=%pad dma_q=%pad size=%zu\n",
>>>> +         &strtab->dma, &strtab->dma_q, size);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int ivpu_mmu_cmdq_alloc(struct ivpu_device *vdev)
>>>> +{
>>>> +    struct ivpu_mmu_info *mmu = vdev->mmu;
>>>> +    struct ivpu_mmu_queue *q = &mmu->cmdq;
>>>> +
>>>> +    q->base = dmam_alloc_coherent(vdev->drm.dev, IVPU_MMU_CMDQ_SIZE, &q->dma, GFP_KERNEL);
>>>> +    if (!q->base)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    q->dma_q = IVPU_MMU_Q_BASE_RWA;
>>>> +    q->dma_q |= q->dma & IVPU_MMU_Q_BASE_ADDR_MASK;
>>>> +    q->dma_q |= IVPU_MMU_Q_COUNT_LOG2;
>>>> +
>>>> +    ivpu_dbg(MMU, "CMDQ alloc: dma=%pad dma_q=%pad size=%u\n",
>>>> +         &q->dma, &q->dma_q, IVPU_MMU_CMDQ_SIZE);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int ivpu_mmu_evtq_alloc(struct ivpu_device *vdev)
>>>> +{
>>>> +    struct ivpu_mmu_info *mmu = vdev->mmu;
>>>> +    struct ivpu_mmu_queue *q = &mmu->evtq;
>>>> +
>>>> +    q->base = dmam_alloc_coherent(vdev->drm.dev, IVPU_MMU_EVTQ_SIZE, &q->dma, GFP_KERNEL);
>>>> +    if (!q->base)
>>>> +        return -ENOMEM;
>>>> +
>>>> +    q->dma_q = IVPU_MMU_Q_BASE_RWA;
>>>> +    q->dma_q |= q->dma & IVPU_MMU_Q_BASE_ADDR_MASK;
>>>> +    q->dma_q |= IVPU_MMU_Q_COUNT_LOG2;
>>>> +
>>>> +    ivpu_dbg(MMU, "EVTQ alloc: dma=%pad dma_q=%pad size=%u\n",
>>>> +         &q->dma, &q->dma_q, IVPU_MMU_EVTQ_SIZE);
>>>> +
>>>> +    return 0;
>>>> +}
>>>> +
>>>> +static int ivpu_mmu_structs_alloc(struct ivpu_device *vdev)
>>>> +{
>>>> +    int ret;
>>>> +
>>>> +    ret = ivpu_mmu_cdtab_alloc(vdev);
>>>> +    if (ret) {
>>>> +        ivpu_err(vdev, "Failed to allocate cdtab: %d\n", ret);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    ret = ivpu_mmu_strtab_alloc(vdev);
>>>> +    if (ret) {
>>>> +        ivpu_err(vdev, "Failed to allocate strtab: %d\n", ret);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    ret = ivpu_mmu_cmdq_alloc(vdev);
>>>> +    if (ret) {
>>>> +        ivpu_err(vdev, "Failed to allocate cmdq: %d\n", ret);
>>>> +        return ret;
>>>> +    }
>>>> +
>>>> +    ret = ivpu_mmu_evtq_alloc(vdev);
>>>> +    if (ret)
>>>> +        ivpu_err(vdev, "Failed to allocate evtq: %d\n", ret);
>>>> +
>>>> +    return ret;
>>>> +}
>>>> +
>>>> +static int ivpu_mmu_reg_write(struct ivpu_device *vdev, u32 reg, u32 val)
>>>> +{
>>>> +    u32 reg_ack = reg + 4; /* ACK register is 4B after base register */
>>>> +    u32 val_ack;
>>>> +    int ret;
>>>> +
>>>> +    REGV_WR32(reg, val);
>>>> +
>>>> +    ret = REGV_POLL(reg_ack, val_ack, (val == val_ack), IVPU_MMU_REG_TIMEOUT_US);
>>>> +    if (ret)
>>>> +        ivpu_err(vdev, "Failed to write register 0x%x\n", reg);
>>>> +
>>>> +    return ret;
>>>> +}
>>>
>>> It really seems like you are reinventing regmap.  Any particular reason that mechanism doesn't work for you?
>>
>> REGV_POLL() is actually just calling read_poll_timeout(), same as regmap, no reinvention here, just iopoll reuse.
>> We don't need most of regmap features (locking, caching, etc) so I don't think is worth using it in our case.
>>
>>> Also, given that this is a PCI device, I'm suprised there is no 0xFFFFFFFF handling.
>>
>> We have some explicit handling of 0xFFFFFFFF (REG_IO_ERROR in the whole patchset) but it may be too little.
>> I will review register reads and add handling where it seems to be needed.
>>

Regards,
Jacek
