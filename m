Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 856CFAD6E73
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 12:58:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BCCA10E7CC;
	Thu, 12 Jun 2025 10:58:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ctV/j8ra";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5DA410E7CA;
 Thu, 12 Jun 2025 10:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FoJTKkNs8YcMO/lpu2NBPmbwjVZ9M0OkrX6y/SqfmeE=; b=ctV/j8raz/FyPrdf250u1ElMcd
 QTWF2Ma+2EmvIrxpt8HWy46AUlkPewAmpO6MSJ+2EzUHy+lDsvgTq0H6WOiiDs9a5vB89yQTaeCOV
 KO06S15i+0+qim7aOjezL2/od/3gz2yeOii+hDP18WkjMhaPlKItWaWZ88d4/zjiooX39/SVLI1Tp
 +93HbZjNDzS62HvSqOMQpvwLfOQ9L5W8/NCPifMXjHNsVDpmFYkvDdPHiR+32eNTF6UTVaIzXOUtq
 xZ+lclcKk6q+enitD6NIwMiRtsJwyjX6dBZ5iE7CqQ9K2EoGO8gCBiMAsv4KX4mRR4IVxd2ZNi+rN
 3If6FN6w==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uPfdQ-002b3N-Nr; Thu, 12 Jun 2025 12:58:16 +0200
Message-ID: <28ec6760-c2d4-472e-84fd-211bfea47d4b@igalia.com>
Date: Thu, 12 Jun 2025 11:58:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] drm/syncobj: Add a fast path to
 drm_syncobj_array_find
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <michel.daenzer@mailbox.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>
References: <20250611140057.27259-1-tvrtko.ursulin@igalia.com>
 <20250611140057.27259-7-tvrtko.ursulin@igalia.com>
 <b57b6549-7dbe-45fe-ab8e-4232041ec1a5@amd.com>
 <10e83252-e565-4cb4-9bc2-ae238528df92@igalia.com>
 <c17f25ef-390a-43e3-a467-45e64048ed6c@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <c17f25ef-390a-43e3-a467-45e64048ed6c@amd.com>
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


On 12/06/2025 08:21, Christian König wrote:
> On 6/11/25 17:29, Tvrtko Ursulin wrote:
>>
>> On 11/06/2025 15:21, Christian König wrote:
>>> On 6/11/25 16:00, Tvrtko Ursulin wrote:
>>>> Running the Cyberpunk 2077 benchmark we can observe that the lookup helper
>>>> is relatively hot, but the 97% of the calls are for a single object. (~3%
>>>> for two points, and never more than three points. While a more trivial
>>>> workload like vkmark under Plasma is even more skewed to single point
>>>> lookups.)
>>>>
>>>> Therefore lets add a fast path to bypass the kmalloc_array/kfree and use a
>>>> pre-allocated stack array for those cases.
>>>
>>> Have you considered using memdup_user()? That's using a separate bucket IIRC and might give similar performance.
>>
>> I haven't but I can try it. I would be surprised if it made a (positive) difference though.
> 
> Yeah, it's mostly for extra security I think.

On this topic, this discussion prompted me to quickly cook up some 
trivial cleanups for amdgpu to use memdup_user & co where it was easy. 
Series is on the mailing list but I did not copy you explicitly giving 
chance for someone else to notice it and off load you a bit.

>> And I realised I need to repeat the benchmarks anyway, since in v4 I had to stop doing access_ok+__get_user, after kernel test robot let me know 64-bit get_user is a not a thing on all platforms. I thought the gains are from avoiding allocations but, as you say, now I need to see if copy_from_user doesn't nullify them..
>>
>>> If that is still not sufficient I'm really wondering if we shouldn't have a macro for doing this. It's a really common use case as far as I can see.
>>
>> Hmm macro for what exactly?
> 
> Like a macro which uses an array on the stack for small (<4) number of values and k(v)malloc() for large ones.
> 
> IIRC there is also a relatively new functionality which allows releasing the memory automatically when we leave the function.

Okay I will have a look at all those options. But it's going to the 
bottom of my priority pile so it might be a while.

Regards,

Tvrtko

>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>> Reviewed-by: Maíra Canal <mcanal@igalia.com>
>>>> ---
>>>> v2:
>>>>    * Added comments describing how the fast path arrays were sized.
>>>>    * Make container freeing criteria clearer by using a boolean.
>>>> ---
>>>>    drivers/gpu/drm/drm_syncobj.c | 56 +++++++++++++++++++++++++++--------
>>>>    1 file changed, 44 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
>>>> index be5905dca87f..65c301852f0d 100644
>>>> --- a/drivers/gpu/drm/drm_syncobj.c
>>>> +++ b/drivers/gpu/drm/drm_syncobj.c
>>>> @@ -1259,6 +1259,8 @@ EXPORT_SYMBOL(drm_timeout_abs_to_jiffies);
>>>>    static int drm_syncobj_array_find(struct drm_file *file_private,
>>>>                      u32 __user *handles,
>>>>                      uint32_t count,
>>>> +                  struct drm_syncobj **stack_syncobjs,
>>>> +                  u32 stack_count,
>>>>                      struct drm_syncobj ***syncobjs_out)
>>>>    {
>>>>        struct drm_syncobj **syncobjs;
>>>> @@ -1268,9 +1270,13 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
>>>>        if (!access_ok(handles, count * sizeof(*handles)))
>>>>            return -EFAULT;
>>>>    -    syncobjs = kmalloc_array(count, sizeof(*syncobjs), GFP_KERNEL);
>>>> -    if (!syncobjs)
>>>> -        return -ENOMEM;
>>>> +    if (count > stack_count) {
>>>> +        syncobjs = kmalloc_array(count, sizeof(*syncobjs), GFP_KERNEL);
>>>> +        if (!syncobjs)
>>>> +            return -ENOMEM;
>>>> +    } else {
>>>> +        syncobjs = stack_syncobjs;
>>>> +    }
>>>>          for (i = 0; i < count; i++) {
>>>>            u32 handle;
>>>> @@ -1292,25 +1298,31 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
>>>>    err_put_syncobjs:
>>>>        while (i-- > 0)
>>>>            drm_syncobj_put(syncobjs[i]);
>>>> -    kfree(syncobjs);
>>>> +
>>>> +    if (syncobjs != stack_syncobjs)
>>>> +        kfree(syncobjs);
>>>>          return ret;
>>>>    }
>>>>      static void drm_syncobj_array_free(struct drm_syncobj **syncobjs,
>>>> -                   uint32_t count)
>>>> +                   uint32_t count,
>>>> +                   bool free_container)
>>>>    {
>>>>        uint32_t i;
>>>>          for (i = 0; i < count; i++)
>>>>            drm_syncobj_put(syncobjs[i]);
>>>> -    kfree(syncobjs);
>>>> +
>>>> +    if (free_container)
>>>> +        kfree(syncobjs);
>>>>    }
>>>>      int
>>>>    drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
>>>>                   struct drm_file *file_private)
>>>>    {
>>>> +    struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>>>>        struct drm_syncobj_wait *args = data;
>>>>        ktime_t deadline, *pdeadline = NULL;
>>>>        u32 count = args->count_handles;
>>>> @@ -1336,6 +1348,8 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
>>>>        ret = drm_syncobj_array_find(file_private,
>>>>                         u64_to_user_ptr(args->handles),
>>>>                         count,
>>>> +                     stack_syncobjs,
>>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>>                         &syncobjs);
>>>>        if (ret < 0)
>>>>            return ret;
>>>> @@ -1354,7 +1368,7 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
>>>>                             &first,
>>>>                             pdeadline);
>>>>    -    drm_syncobj_array_free(syncobjs, count);
>>>> +    drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
>>>>          if (timeout < 0)
>>>>            return timeout;
>>>> @@ -1368,6 +1382,7 @@ int
>>>>    drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>>>>                    struct drm_file *file_private)
>>>>    {
>>>> +    struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>>>>        struct drm_syncobj_timeline_wait *args = data;
>>>>        ktime_t deadline, *pdeadline = NULL;
>>>>        u32 count = args->count_handles;
>>>> @@ -1394,6 +1409,8 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>>>>        ret = drm_syncobj_array_find(file_private,
>>>>                         u64_to_user_ptr(args->handles),
>>>>                         count,
>>>> +                     stack_syncobjs,
>>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>>                         &syncobjs);
>>>>        if (ret < 0)
>>>>            return ret;
>>>> @@ -1412,7 +1429,7 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>>>>                             &first,
>>>>                             pdeadline);
>>>>    -    drm_syncobj_array_free(syncobjs, count);
>>>> +    drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
>>>>          if (timeout < 0)
>>>>            return timeout;
>>>> @@ -1529,6 +1546,7 @@ int
>>>>    drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
>>>>                struct drm_file *file_private)
>>>>    {
>>>> +    struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>>>>        struct drm_syncobj_array *args = data;
>>>>        struct drm_syncobj **syncobjs;
>>>>        uint32_t i;
>>>> @@ -1546,6 +1564,8 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
>>>>        ret = drm_syncobj_array_find(file_private,
>>>>                         u64_to_user_ptr(args->handles),
>>>>                         args->count_handles,
>>>> +                     stack_syncobjs,
>>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>>                         &syncobjs);
>>>>        if (ret < 0)
>>>>            return ret;
>>>> @@ -1553,7 +1573,8 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
>>>>        for (i = 0; i < args->count_handles; i++)
>>>>            drm_syncobj_replace_fence(syncobjs[i], NULL);
>>>>    -    drm_syncobj_array_free(syncobjs, args->count_handles);
>>>> +    drm_syncobj_array_free(syncobjs, args->count_handles,
>>>> +                   syncobjs != stack_syncobjs);
>>>>          return 0;
>>>>    }
>>>> @@ -1562,6 +1583,7 @@ int
>>>>    drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
>>>>                 struct drm_file *file_private)
>>>>    {
>>>> +    struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>>>>        struct drm_syncobj_array *args = data;
>>>>        struct drm_syncobj **syncobjs;
>>>>        uint32_t i;
>>>> @@ -1579,6 +1601,8 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
>>>>        ret = drm_syncobj_array_find(file_private,
>>>>                         u64_to_user_ptr(args->handles),
>>>>                         args->count_handles,
>>>> +                     stack_syncobjs,
>>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>>                         &syncobjs);
>>>>        if (ret < 0)
>>>>            return ret;
>>>> @@ -1589,7 +1613,8 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
>>>>                break;
>>>>        }
>>>>    -    drm_syncobj_array_free(syncobjs, args->count_handles);
>>>> +    drm_syncobj_array_free(syncobjs, args->count_handles,
>>>> +                   syncobjs != stack_syncobjs);
>>>>          return ret;
>>>>    }
>>>> @@ -1598,6 +1623,7 @@ int
>>>>    drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>>>>                      struct drm_file *file_private)
>>>>    {
>>>> +    struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>>>>        struct drm_syncobj_timeline_array *args = data;
>>>>        uint64_t __user *points = u64_to_user_ptr(args->points);
>>>>        uint32_t i, j, count = args->count_handles;
>>>> @@ -1617,6 +1643,8 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>>>>        ret = drm_syncobj_array_find(file_private,
>>>>                         u64_to_user_ptr(args->handles),
>>>>                         count,
>>>> +                     stack_syncobjs,
>>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>>                         &syncobjs);
>>>>        if (ret < 0)
>>>>            return ret;
>>>> @@ -1653,7 +1681,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>>>>    err_chains:
>>>>        kfree(chains);
>>>>    out:
>>>> -    drm_syncobj_array_free(syncobjs, count);
>>>> +    drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
>>>>          return ret;
>>>>    }
>>>> @@ -1661,6 +1689,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>>>>    int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>>>>                    struct drm_file *file_private)
>>>>    {
>>>> +    struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>>>>        struct drm_syncobj_timeline_array *args = data;
>>>>        struct drm_syncobj **syncobjs;
>>>>        uint64_t __user *points = u64_to_user_ptr(args->points);
>>>> @@ -1679,6 +1708,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>>>>        ret = drm_syncobj_array_find(file_private,
>>>>                         u64_to_user_ptr(args->handles),
>>>>                         args->count_handles,
>>>> +                     stack_syncobjs,
>>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>>                         &syncobjs);
>>>>        if (ret < 0)
>>>>            return ret;
>>>> @@ -1722,7 +1753,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>>>>            if (ret)
>>>>                break;
>>>>        }
>>>> -    drm_syncobj_array_free(syncobjs, args->count_handles);
>>>> +    drm_syncobj_array_free(syncobjs, args->count_handles,
>>>> +                   syncobjs != stack_syncobjs);
>>>>          return ret;
>>>>    }
>>>
>>
> 

