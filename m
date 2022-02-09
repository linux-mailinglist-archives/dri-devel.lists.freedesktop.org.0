Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E604AEB7C
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 08:51:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B125010E3DF;
	Wed,  9 Feb 2022 07:51:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02A4310E16E;
 Wed,  9 Feb 2022 07:51:23 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id s7so3399487edd.3;
 Tue, 08 Feb 2022 23:51:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=hn+Rij3MO1nSS56eQ6f4nw/ign4qr+sU25yT6ODsIWo=;
 b=oGOAeV4OVQ6aCWB49+QuKxfFj2QB1F3d+l5UHQOIXhcbZzOmCoSZuGduvTwp8InW6a
 ntembeB4KQ5fLPVSAruDp7Vb5M00BcMVKfTEFMN3IXrEm3xuGItYU7BNy/4Bjo+VuFfs
 NAZDDlVeKN9XYAaFAbh4sD2nsM1tV0Jz1u5Y7IM0n07SCOL1oqJ4ZcH2yuF8vuRYGgK/
 Q5kDBSIoSm3+0FIfFRdMj29AM/5sSfaILwHdFcfmuiAILVnIMporCNYW/TdsXn98U8VK
 bYrB9DTTQpFm0o2c3I2y2itg+2PCD2gJ038VTG8QDVs61BGQSaSSMbZnAL+VFXfA3cdn
 pP0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=hn+Rij3MO1nSS56eQ6f4nw/ign4qr+sU25yT6ODsIWo=;
 b=E1bXzukJrU11ZxKsHLDt51Xq2/SLOjbN/v5jkqZQTf9Oyifkb7FVrixJadj8HD7jpw
 1AW1GMwSMzaAakid4vmNxGUVIJILOZRacTAknceIR4Yjnqg7/E86cFeQo563IF6CljZW
 MtH5IAnrdVg120ocnjFrWz6x7VhuZoHKLHG68fcEU75+q8hur1rosn87MVvQNzM1w1NI
 jVz4XAubUATL/iolZlxvCqcjpr5XQw/JnSOCvkJ6x0Aly3XtQKmZOkfeHmnk5GXyluiq
 eSNLzK2oflaL+OnJp0cDQe9bryTch17xY3jFekY6qfXsz5f4YndKv/eddk362rdol3DM
 bzIA==
X-Gm-Message-State: AOAM532IQMfWiC5VGC01EoiRzWyiii+gsvUzS3zCLjOhq27zV5qdmZKK
 GvJjamqfb2KyHKCWVT3omYg=
X-Google-Smtp-Source: ABdhPJyYMDclrjezi+sK1ENPmb9aeQjRmoJH7EZtwCvf+0cXdy+GPaFGFNmxkXELVk8SafnhiiQYOA==
X-Received: by 2002:a05:6402:371:: with SMTP id
 s17mr1096231edw.315.1644393082319; 
 Tue, 08 Feb 2022 23:51:22 -0800 (PST)
Received: from ?IPV6:2a02:908:1252:fb60:5f8a:b8f9:e10:2aaa?
 ([2a02:908:1252:fb60:5f8a:b8f9:e10:2aaa])
 by smtp.gmail.com with ESMTPSA id gq1sm4777170ejb.58.2022.02.08.23.51.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Feb 2022 23:51:21 -0800 (PST)
Message-ID: <f4ee8210-67f4-e35f-eae1-c14453698a47@gmail.com>
Date: Wed, 9 Feb 2022 08:51:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v4] drm/amdgpu: Rework reset domain to be refcounted.
Content-Language: en-US
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 "Lazar, Lijo" <lijo.lazar@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220125223752.200211-9-andrey.grodzovsky@amd.com>
 <20220202172617.16181-1-andrey.grodzovsky@amd.com>
 <8e4dc322-2946-9047-7cd4-8a734dc29bd3@amd.com>
 <f13f817d-530b-605f-9034-bfec0ef3e2a8@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <f13f817d-530b-605f-9034-bfec0ef3e2a8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: horace.chen@amd.com, jingwech@amd.com, christian.koenig@amd.com,
 Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 08.02.22 um 17:19 schrieb Andrey Grodzovsky:
>
> On 2022-02-08 06:25, Lazar, Lijo wrote:
>>
>>
>> On 2/2/2022 10:56 PM, Andrey Grodzovsky wrote:
>>> The reset domain contains register access semaphor
>>> now and so needs to be present as long as each device
>>> in a hive needs it and so it cannot be binded to XGMI
>>> hive life cycle.
>>> Adress this by making reset domain refcounted and pointed
>>> by each member of the hive and the hive itself.
>>>
>>> v4:
>>> Fix crash on boot with XGMI hive by adding type to reset_domain.
>>> XGMI will only create a new reset_domain if prevoius was of single
>>> device type meaning it's first boot. Otherwsie it will take a
>>> refocunt to exsiting reset_domain from the amdgou device.
>>>
>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  6 +--
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 44 
>>> +++++++++++++---------
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c  | 38 +++++++++++++++++++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h  | 18 +++++++++
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   | 29 +++++++++++---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |  2 +-
>>>   drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c      |  4 +-
>>>   drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c      |  4 +-
>>>   drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c      |  4 +-
>>>   9 files changed, 118 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> index 8e96b9a14452..f2ba460bfd59 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
>>> @@ -813,9 +813,7 @@ struct amd_powerplay {
>>>   #define AMDGPU_RESET_MAGIC_NUM 64
>>>   #define AMDGPU_MAX_DF_PERFMONS 4
>>>   -struct amdgpu_reset_domain {
>>> -    struct workqueue_struct *wq;
>>> -};
>>> +struct amdgpu_reset_domain;
>>>     struct amdgpu_device {
>>>       struct device            *dev;
>>> @@ -1102,7 +1100,7 @@ struct amdgpu_device {
>>>       struct amdgpu_reset_control     *reset_cntl;
>>>       uint32_t ip_versions[HW_ID_MAX][HWIP_MAX_INSTANCE];
>>>   -    struct amdgpu_reset_domain    reset_domain;
>>> +    struct amdgpu_reset_domain    *reset_domain;
>>>   };
>>>     static inline struct amdgpu_device *drm_to_adev(struct 
>>> drm_device *ddev)
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> index fef952ca8db5..cd1b7af69c35 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>>> @@ -2313,7 +2313,7 @@ static int 
>>> amdgpu_device_init_schedulers(struct amdgpu_device *adev)
>>>             r = drm_sched_init(&ring->sched, &amdgpu_sched_ops,
>>>                      ring->num_hw_submission, amdgpu_job_hang_limit,
>>> -                   timeout, adev->reset_domain.wq, 
>>> ring->sched_score, ring->name);
>>> +                   timeout, adev->reset_domain->wq, 
>>> ring->sched_score, ring->name);
>>>           if (r) {
>>>               DRM_ERROR("Failed to create scheduler on ring %s.\n",
>>>                     ring->name);
>>> @@ -2432,24 +2432,22 @@ static int amdgpu_device_ip_init(struct 
>>> amdgpu_device *adev)
>>>       if (r)
>>>           goto init_failed;
>>>   +    /**
>>> +     * In case of XGMI grab extra reference for reset domain for 
>>> this device
>>> +     */
>>>       if (adev->gmc.xgmi.num_physical_nodes > 1) {
>>> -        struct amdgpu_hive_info *hive;
>>> -
>>> -        amdgpu_xgmi_add_device(adev);
>>> +        if (amdgpu_xgmi_add_device(adev) == 0) {
>>> +            struct amdgpu_hive_info *hive = 
>>> amdgpu_get_xgmi_hive(adev);
>>>   -        hive = amdgpu_get_xgmi_hive(adev);
>>> -        if (!hive || !hive->reset_domain.wq) {
>>> -            DRM_ERROR("Failed to obtain reset domain info for XGMI 
>>> hive:%llx", hive->hive_id);
>>> -            r = -EINVAL;
>>> -            goto init_failed;
>>> -        }
>>> +            if (!hive->reset_domain ||
>>> + !kref_get_unless_zero(&hive->reset_domain->refcount)) {
>>> +                r = -ENOENT;
>>> +                goto init_failed;
>>> +            }
>>>   -        adev->reset_domain.wq = hive->reset_domain.wq;
>>> -    } else {
>>> -        adev->reset_domain.wq = 
>>> alloc_ordered_workqueue("amdgpu-reset-dev", 0);
>>> -        if (!adev->reset_domain.wq) {
>>> -            r = -ENOMEM;
>>> -            goto init_failed;
>>> +            /* Drop the early temporary reset domain we created for 
>>> device */
>>> +            kref_put(&adev->reset_domain->refcount, 
>>> amdgpu_reset_destroy_reset_domain);
>>> +            adev->reset_domain = hive->reset_domain;
>>>           }
>>>       }
>>>   @@ -3599,6 +3597,15 @@ int amdgpu_device_init(struct amdgpu_device 
>>> *adev,
>>>           return r;
>>>       }
>>>   +    /*
>>> +     * Reset domain needs to be present early, before XGMI hive 
>>> discovered
>>> +     * (if any) and intitialized to use reset sem and in_gpu reset 
>>> flag
>>> +     * early on during init.
>>> +     */
>>> +    adev->reset_domain = 
>>> amdgpu_reset_create_reset_domain(SINGLE_DEVICE ,"amdgpu-reset-dev");
>>> +    if (!adev->reset_domain)
>>> +        return -ENOMEM;
>>> +
>>>       /* early init functions */
>>>       r = amdgpu_device_ip_early_init(adev);
>>>       if (r)
>>> @@ -3949,6 +3956,9 @@ void amdgpu_device_fini_sw(struct 
>>> amdgpu_device *adev)
>>>       if (adev->mman.discovery_bin)
>>>           amdgpu_discovery_fini(adev);
>>>   +    kref_put(&adev->reset_domain->refcount, 
>>> amdgpu_reset_destroy_reset_domain);
>>> +    adev->reset_domain = NULL;
>>> +
>>>       kfree(adev->pci_state);
>>>     }
>>> @@ -5186,7 +5196,7 @@ int amdgpu_device_gpu_recover(struct 
>>> amdgpu_device *adev,
>>>         INIT_WORK(&work.base, amdgpu_device_queue_gpu_recover_work);
>>>   -    if (!queue_work(adev->reset_domain.wq, &work.base))
>>> +    if (!queue_work(adev->reset_domain->wq, &work.base))
>>>           return -EAGAIN;
>>>         flush_work(&work.base);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>> index 02afd4115675..14f003d5ebe8 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.c
>>> @@ -96,3 +96,41 @@ int amdgpu_reset_perform_reset(struct 
>>> amdgpu_device *adev,
>>>       return reset_handler->restore_hwcontext(adev->reset_cntl,
>>>                           reset_context);
>>>   }
>>> +
>>> +
>>> +void amdgpu_reset_destroy_reset_domain(struct kref *ref)
>>> +{
>>> +    struct amdgpu_reset_domain *reset_domain = container_of(ref,
>>> +                                struct amdgpu_reset_domain,
>>> +                                refcount);
>>> +    destroy_workqueue(reset_domain->wq);
>>> +    kvfree(reset_domain);
>>> +}
>>> +
>>> +struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(enum 
>>> amdgpu_reset_domain_type type,
>>> +                                 char *wq_name)
>>> +{
>>> +    struct amdgpu_reset_domain *reset_domain;
>>> +
>>> +    reset_domain = kvzalloc(sizeof(struct amdgpu_reset_domain), 
>>> GFP_KERNEL);
>>> +    if (!reset_domain) {
>>> +        DRM_ERROR("Failed to allocate amdgpu_reset_domain!");
>>> +        return NULL;
>>> +    }
>>> +
>>> +    reset_domain->type = type;
>>> +    kref_init(&reset_domain->refcount);
>>> +
>>> +    reset_domain->wq = create_singlethread_workqueue(wq_name);
>>> +    if (!reset_domain->wq) {
>>> +        DRM_ERROR("Failed to allocate wq for amdgpu_reset_domain!");
>>> +        kref_put(&reset_domain->refcount, 
>>> amdgpu_reset_destroy_reset_domain);
>>> +        return NULL;
>>> +
>>> +    }
>>> +
>>> +    return reset_domain;
>>> +}
>>> +
>>> +
>>> +
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>>> index e00d38d9160a..0b310cd963d9 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_reset.h
>>> @@ -70,6 +70,19 @@ struct amdgpu_reset_control {
>>>       void (*async_reset)(struct work_struct *work);
>>>   };
>>>   +
>>> +enum amdgpu_reset_domain_type {
>>> +    SINGLE_DEVICE,
>>> +    XGMI_HIVE
>>> +};
>>> +
>>> +struct amdgpu_reset_domain {
>>> +    struct kref refcount;
>>> +    struct workqueue_struct *wq;
>>> +    enum amdgpu_reset_domain_type type;
>>> +};
>>> +
>>> +
>>>   int amdgpu_reset_init(struct amdgpu_device *adev);
>>>   int amdgpu_reset_fini(struct amdgpu_device *adev);
>>>   @@ -82,4 +95,9 @@ int amdgpu_reset_perform_reset(struct 
>>> amdgpu_device *adev,
>>>   int amdgpu_reset_add_handler(struct amdgpu_reset_control *reset_ctl,
>>>                    struct amdgpu_reset_handler *handler);
>>>   +struct amdgpu_reset_domain *amdgpu_reset_create_reset_domain(enum 
>>> amdgpu_reset_domain_type type,
>>> +                                 char *wq_name);
>>> +
>>> +void amdgpu_reset_destroy_reset_domain(struct kref *ref);
>>> +
>>>   #endif
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
>>> index 9ad742039ac9..a216e88a7b54 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
>>> @@ -32,6 +32,8 @@
>>>   #include "wafl/wafl2_4_0_0_smn.h"
>>>   #include "wafl/wafl2_4_0_0_sh_mask.h"
>>>   +#include "amdgpu_reset.h"
>>> +
>>>   #define smnPCS_XGMI23_PCS_ERROR_STATUS   0x11a01210
>>>   #define smnPCS_XGMI3X16_PCS_ERROR_STATUS 0x11a0020c
>>>   #define smnPCS_GOPX1_PCS_ERROR_STATUS    0x12200210
>>> @@ -226,6 +228,9 @@ static void amdgpu_xgmi_hive_release(struct 
>>> kobject *kobj)
>>>       struct amdgpu_hive_info *hive = container_of(
>>>           kobj, struct amdgpu_hive_info, kobj);
>>>   +    kref_put(&hive->reset_domain->refcount, 
>>> amdgpu_reset_destroy_reset_domain);
>>> +    hive->reset_domain = NULL;
>>> +
>>>       mutex_destroy(&hive->hive_lock);
>>>       kfree(hive);
>>>   }
>>> @@ -392,12 +397,24 @@ struct amdgpu_hive_info 
>>> *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
>>>           goto pro_end;
>>>       }
>>>   -    hive->reset_domain.wq = 
>>> alloc_ordered_workqueue("amdgpu-reset-hive", 0);
>>> -    if (!hive->reset_domain.wq) {
>>> -        dev_err(adev->dev, "XGMI: failed allocating wq for reset 
>>> domain!\n");
>>> -        kfree(hive);
>>> -        hive = NULL;
>>> -        goto pro_end;
>>> +    /**
>>> +     * Avoid recreating reset domain when hive is reconstructed for 
>>> the case
>>> +     * of reset the devices in the XGMI hive during probe for SRIOV
>>> +     * See https://www.spinics.net/lists/amd-gfx/msg58836.html
>>> +     */
>>> +    if (adev->reset_domain->type != XGMI_HIVE) {
>>> +        hive->reset_domain = 
>>> amdgpu_reset_create_reset_domain(XGMI_HIVE, "amdgpu-reset-hive");
>>> +            if (!hive->reset_domain) {
>>> +                dev_err(adev->dev, "XGMI: failed initializing reset 
>>> domain for xgmi hive\n");
>>> +                ret = -ENOMEM;
>>> +                kobject_put(&hive->kobj);
>>> +                kfree(hive);
>>> +                hive = NULL;
>>> +                goto pro_end;
>>> +            }
>>> +    } else {
>>> + kref_get_unless_zero(&adev->reset_domain->refcount);
>>> +        hive->reset_domain = adev->reset_domain;
>>
>> Suggest to wrap this like -
>>     amdgpu_reset_domain_get(reset_domain)
>>
>> and another like
>>     amdgpu_reset_domain_put(reset_domain)
>
>
>
> I already use kref_put, kref_get on reset domain so this will be 
> confusing  to use same naming for
> reset domain creation a bit I think to use it for creation.
> I can do those wrappers around the direct usage of kref_put/kref_get

Small inline wrappers in the header around kref_put/kref_get are pretty 
common, but not necessary mandatory.

>
>
>>
>> Even smaller wrappers like
>>     amdgpu_reset_domain_schedule(reset_domain, reset_work)
>
>
> This really would be a one line syntactic wrapper but sure
>
>
>>
>> Other than that, looks good to me (need to combine with earlier 
>> series as this misses a few other members in reset domain).
>
>
> It's all because i added this and later patches on top of existing old 
> patches since i had a lot of merge conflicts if i put this changes in 
> original patches.
> See patches 9 and 10 for moving the other members into reset domain.

I only skimmed over the set. It's a bit confusing, but if it makes 
things easier I would say go for it.

Regards,
Christian.

>
> Andrey
>
>
>>
>> Thanks,
>> Lijo
>>
>>>       }
>>>         hive->hive_id = adev->gmc.xgmi.hive_id;
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h 
>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
>>> index 2f2ce53645a5..dcaad22be492 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
>>> @@ -42,7 +42,7 @@ struct amdgpu_hive_info {
>>>           AMDGPU_XGMI_PSTATE_UNKNOWN
>>>       } pstate;
>>>   -    struct amdgpu_reset_domain reset_domain;
>>> +    struct amdgpu_reset_domain *reset_domain;
>>>   };
>>>     struct amdgpu_pcs_ras_field {
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c 
>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>> index b2b40e169342..05e98af30b48 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_ai.c
>>> @@ -32,6 +32,8 @@
>>>   #include "soc15_common.h"
>>>   #include "mxgpu_ai.h"
>>>   +#include "amdgpu_reset.h"
>>> +
>>>   static void xgpu_ai_mailbox_send_ack(struct amdgpu_device *adev)
>>>   {
>>>       WREG8(AI_MAIBOX_CONTROL_RCV_OFFSET_BYTE, 2);
>>> @@ -302,7 +304,7 @@ static int xgpu_ai_mailbox_rcv_irq(struct 
>>> amdgpu_device *adev,
>>>       switch (event) {
>>>           case IDH_FLR_NOTIFICATION:
>>>           if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
>>> -            WARN_ONCE(!queue_work(adev->reset_domain.wq,
>>> + WARN_ONCE(!queue_work(adev->reset_domain->wq,
>>>                             &adev->virt.flr_work),
>>>                     "Failed to queue work! at %s",
>>>                     __func__);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c 
>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>> index 08411924150d..6e12055f3f4a 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_nv.c
>>> @@ -31,6 +31,8 @@
>>>   #include "soc15_common.h"
>>>   #include "mxgpu_nv.h"
>>>   +#include "amdgpu_reset.h"
>>> +
>>>   static void xgpu_nv_mailbox_send_ack(struct amdgpu_device *adev)
>>>   {
>>>       WREG8(NV_MAIBOX_CONTROL_RCV_OFFSET_BYTE, 2);
>>> @@ -337,7 +339,7 @@ static int xgpu_nv_mailbox_rcv_irq(struct 
>>> amdgpu_device *adev,
>>>       switch (event) {
>>>       case IDH_FLR_NOTIFICATION:
>>>           if (amdgpu_sriov_runtime(adev) && !amdgpu_in_reset(adev))
>>> -            WARN_ONCE(!queue_work(adev->reset_domain.wq,
>>> + WARN_ONCE(!queue_work(adev->reset_domain->wq,
>>>                             &adev->virt.flr_work),
>>>                     "Failed to queue work! at %s",
>>>                     __func__);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c 
>>> b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
>>> index 02290febfcf4..fe1570c2146e 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/mxgpu_vi.c
>>> @@ -42,6 +42,8 @@
>>>   #include "smu/smu_7_1_3_d.h"
>>>   #include "mxgpu_vi.h"
>>>   +#include "amdgpu_reset.h"
>>> +
>>>   /* VI golden setting */
>>>   static const u32 xgpu_fiji_mgcg_cgcg_init[] = {
>>>       mmRLC_CGTT_MGCG_OVERRIDE, 0xffffffff, 0xffffffff,
>>> @@ -551,7 +553,7 @@ static int xgpu_vi_mailbox_rcv_irq(struct 
>>> amdgpu_device *adev,
>>>             /* only handle FLR_NOTIFY now */
>>>           if (!r && !amdgpu_in_reset(adev))
>>> -            WARN_ONCE(!queue_work(adev->reset_domain.wq,
>>> + WARN_ONCE(!queue_work(adev->reset_domain->wq,
>>>                             &adev->virt.flr_work),
>>>                     "Failed to queue work! at %s",
>>>                     __func__);
>>>

