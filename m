Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08AF99F4999
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 12:09:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4655C10E082;
	Tue, 17 Dec 2024 11:09:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="aYoN8fQp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6389F10E082
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 11:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pgLhe4iK2kopQ0upUt6hQ9v47vRXrHQjwavoAE4YnCU=; b=aYoN8fQp3xIorp7wQRXxXd2LvV
 ZESG9Mw/GiJRDzmhhJvbYNKvpUB8Sta24nF1qmMiRgCEz11UAB18sqACpNf0kyPeoUhEwlCFuhRHp
 REMPmIKO7MYZcpE7P0vEh5D06Um63b23XLXWYuXK+5pRr8jnQe8n+s7N2lMP1RTRiB+ew4JTFy8lE
 4iRHqft12BDWKJftU1uR5n4trFM0HI/PHhQT63idHKTi+pRvAfs/P0noT46T/9JaxdtDCSYkmWoyb
 ZAfKNzhoUattu6qOAAkZ7g49Hnd6O2wqG+T8CC5jIGWAzvWsm9Zifud7V16SsPC7+Z6v0eVakswam
 nZ6dPnRQ==;
Received: from [187.36.213.55] (helo=[192.168.1.103])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tNVSR-004Kyc-9S; Tue, 17 Dec 2024 12:09:43 +0100
Message-ID: <479af980-8895-47c8-87fd-cae9a32b454e@igalia.com>
Date: Tue, 17 Dec 2024 08:09:37 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] drm/vc4: Use DRM Execution Contexts
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Melissa Wen <mwen@igalia.com>
Cc: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241212202337.381614-1-mcanal@igalia.com>
 <20241212202337.381614-2-mcanal@igalia.com>
 <tmg5jqpts47oqwuohcutyw44nlhvjz44ctsxogtwvjeky7hdwv@ykux7b3rrsco>
 <2147b626-f305-4b3c-93a0-14b5b0845e89@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <2147b626-f305-4b3c-93a0-14b5b0845e89@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 17/12/24 07:30, Christian König wrote:
> Am 16.12.24 um 20:08 schrieb Melissa Wen:
>> On 12/12, Maíra Canal wrote:
>>> VC4 has internal copies of `drm_gem_lock_reservations()` and
>>> `drm_gem_unlock_reservations()` inside the driver and ideally, we should
>>> move those hard-coded functions to the generic functions provided by 
>>> DRM.
>>> But, instead of using the DRM GEM functions to (un)lock reservations, 
>>> move
>>> the new DRM Execution Contexts API.
>>>
>>> Signed-off-by: Maíra Canal <mcanal@igalia.com>
>>> ---
>>>   drivers/gpu/drm/vc4/Kconfig   |  1 +
>>>   drivers/gpu/drm/vc4/vc4_gem.c | 99 ++++++++---------------------------
>>>   2 files changed, 22 insertions(+), 78 deletions(-)
>>>

[...]

>>> -
>>> -    ww_acquire_done(acquire_ctx);
>>> +    int ret;
>>>       /* Reserve space for our shared (read-only) fence references,
>>>        * before we commit the CL to the hardware.
>>>        */
>>> -    for (i = 0; i < exec->bo_count; i++) {
>>> -        bo = exec->bo[i];
>>> +    drm_exec_init(exec_ctx, DRM_EXEC_INTERRUPTIBLE_WAIT, exec- 
>>> >bo_count);
>>> +    drm_exec_until_all_locked(exec_ctx) {
>>> +        ret = drm_exec_prepare_array(exec_ctx, exec->bo,
>>> +                         exec->bo_count, 1);
>> Hi Maíra,
>>
>> So, I'm not familiar too drm_exec, but the original implementation of
>> vc4_lock_bo_reservations() has a retry of locks from the contention and
>> I don't see it inside the drm_exec_prepare_array(), why don't use the
>> loop drm_exec_prepare_obj() plus drm_exec_retry_on_contention() (similar
>> to the typical usage documented for drm_exec)?
> 
> The way how drm_exec and drm_exec_prepare_array is used seems to be 
> correct here.
> 
> drm_exec_prepare_array() basically just loops over all the GEM BOs in 
> the array and calls drm_exec_prepare_obj() on them, so no need to open 
> code that.
> 
> drm_exec_retry_on_contention() is only needed if you have multiple calls 
> to drm_exec_prepare_array() or drm_exec_prepare_obj(), so that the loop 
> is restarted in between the calls.

But doesn't `drm_exec_prepare_array()` have multiple calls to
`drm_exec_prepare_obj()`? The fact that the multiple calls are wrapped
in the function makes a difference?

Best Regards,
- Maíra

> 
> Regards,
> Christian.
> 
>>
>> Also, probably you already considered that: we can extend this update to
>> v3d, right?
>>
>> Melissa
>>
>>> +    }
>>> -        ret = dma_resv_reserve_fences(bo->resv, 1);
>>> -        if (ret) {
>>> -            vc4_unlock_bo_reservations(dev, exec, acquire_ctx);
>>> -            return ret;
>>> -        }
>>> +    if (ret) {
>>> +        drm_exec_fini(exec_ctx);
>>> +        return ret;
>>>       }
>>>       return 0;
>>> @@ -679,7 +620,7 @@ vc4_lock_bo_reservations(struct drm_device *dev,
>>>    */
>>>   static int
>>>   vc4_queue_submit(struct drm_device *dev, struct vc4_exec_info *exec,
>>> -         struct ww_acquire_ctx *acquire_ctx,
>>> +         struct drm_exec *exec_ctx,
>>>            struct drm_syncobj *out_sync)
>>>   {
>>>       struct vc4_dev *vc4 = to_vc4_dev(dev);
>>> @@ -708,7 +649,7 @@ vc4_queue_submit(struct drm_device *dev, struct 
>>> vc4_exec_info *exec,
>>>       vc4_update_bo_seqnos(exec, seqno);
>>> -    vc4_unlock_bo_reservations(dev, exec, acquire_ctx);
>>> +    drm_exec_fini(exec_ctx);
>>>       list_add_tail(&exec->head, &vc4->bin_job_list);
>>> @@ -1123,7 +1064,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, 
>>> void *data,
>>>       struct drm_vc4_submit_cl *args = data;
>>>       struct drm_syncobj *out_sync = NULL;
>>>       struct vc4_exec_info *exec;
>>> -    struct ww_acquire_ctx acquire_ctx;
>>> +    struct drm_exec exec_ctx;
>>>       struct dma_fence *in_fence;
>>>       int ret = 0;
>>> @@ -1216,7 +1157,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, 
>>> void *data,
>>>       if (ret)
>>>           goto fail;
>>> -    ret = vc4_lock_bo_reservations(dev, exec, &acquire_ctx);
>>> +    ret = vc4_lock_bo_reservations(exec, &exec_ctx);
>>>       if (ret)
>>>           goto fail;
>>> @@ -1224,7 +1165,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, 
>>> void *data,
>>>           out_sync = drm_syncobj_find(file_priv, args->out_sync);
>>>           if (!out_sync) {
>>>               ret = -EINVAL;
>>> -            goto fail;
>>> +            goto fail_unreserve;
>>>           }
>>>           /* We replace the fence in out_sync in vc4_queue_submit since
>>> @@ -1239,7 +1180,7 @@ vc4_submit_cl_ioctl(struct drm_device *dev, 
>>> void *data,
>>>        */
>>>       exec->args = NULL;
>>> -    ret = vc4_queue_submit(dev, exec, &acquire_ctx, out_sync);
>>> +    ret = vc4_queue_submit(dev, exec, &exec_ctx, out_sync);
>>>       /* The syncobj isn't part of the exec data and we need to free our
>>>        * reference even if job submission failed.
>>> @@ -1248,13 +1189,15 @@ vc4_submit_cl_ioctl(struct drm_device *dev, 
>>> void *data,
>>>           drm_syncobj_put(out_sync);
>>>       if (ret)
>>> -        goto fail;
>>> +        goto fail_unreserve;
>>>       /* Return the seqno for our job. */
>>>       args->seqno = vc4->emit_seqno;
>>>       return 0;
>>> +fail_unreserve:
>>> +    drm_exec_fini(&exec_ctx);
>>>   fail:
>>>       vc4_complete_exec(&vc4->base, exec);
>>> -- 
>>> 2.47.1
>>>
> 

