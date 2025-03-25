Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3398AA70B32
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 21:13:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBEB10E614;
	Tue, 25 Mar 2025 20:12:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="oTdnA+UG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11F0810E602
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 20:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rGmU5uIkBoSEGRlxXsojMSV9bslaT/0WhPB1Wxhp5p8=; b=oTdnA+UG2QBGVWHVpGRsnrPxBE
 LKSn2ZgcEYwcxkHsaan9eS1ohBxY36zGrLNe5COkrlc92s9nHJ0NGJ6BU6XAngNW59a4Iw/7OqSoz
 qmF/fPzRjlog8BbkhfSlU17YrMD/9Fz+8LcNNi9szkz9Sv4QXiag7xE7N4KZ3BSCJEs4C7EjTle8U
 41EFVfDbDH/BJ8GDVufCJ5AWBfyK6TSVPzBLTVzIqO51ZsXa3hIkMqy/UcgQizZADartZXY8SGBI4
 5jCNnFRXWLviVDDuHtzXT5tE0bHlat7AVQ/2a0/S2ioCljxiiJI/F5oYnx0oa2lB8YzUzO95uYk1M
 XBlM50xA==;
Received: from [189.7.87.178] (helo=[192.168.0.224])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1txAdp-006It8-S3; Tue, 25 Mar 2025 21:12:54 +0100
Message-ID: <92628093-d649-49f6-aec7-18b72b82a57b@igalia.com>
Date: Tue, 25 Mar 2025 17:12:50 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] drm/syncobj: Add a fast path to drm_syncobj_array_find
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com
References: <20250318155424.78552-1-tvrtko.ursulin@igalia.com>
 <20250318155424.78552-8-tvrtko.ursulin@igalia.com>
 <ccd36973-8310-4dd7-855f-e09de3aecd54@igalia.com>
 <dfe43355-6b4e-432e-858b-8b6324310ef9@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <dfe43355-6b4e-432e-858b-8b6324310ef9@igalia.com>
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

Hi Tvrtko,

On 25/03/25 06:54, Tvrtko Ursulin wrote:
> 
> On 24/03/2025 23:06, Maíra Canal wrote:
>> Hi Tvrtko,
>>
>> Some nits inline, mostly personal comments. In any case,
>>
>> Reviewed-by: Maíra Canal <mcanal@igalia.com>
>>
>>
>> On 18/03/25 12:54, Tvrtko Ursulin wrote:
>>> Running the Cyberpunk 2077 benchmark we can observe that the lookup 
>>> helper
>>> is relatively hot, but the 97% of the calls are for a single object. 
>>> (~3%
>>> for two points, and never more than three points. While a more trivial
>>> workload like vkmark under Plasma is even more skewed to single point
>>> lookups.)
>>>
>>> Therefore lets add a fast path to bypass the kmalloc_array/kfree and 
>>> use a
>>> pre-allocated stack array for those cases.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> ---
>>>   drivers/gpu/drm/drm_syncobj.c | 53 +++++++++++++++++++++++++++--------
>>>   1 file changed, 41 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/ 
>>> drm_syncobj.c
>>> index 94932b89298f..233bdef53c87 100644
>>> --- a/drivers/gpu/drm/drm_syncobj.c
>>> +++ b/drivers/gpu/drm/drm_syncobj.c
>>> @@ -1223,6 +1223,8 @@ EXPORT_SYMBOL(drm_timeout_abs_to_jiffies);
>>>   static int drm_syncobj_array_find(struct drm_file *file_private,
>>>                     u32 __user *handles,
>>>                     uint32_t count,
>>> +                  struct drm_syncobj **stack_syncobjs,
>>> +                  u32 stack_count,
>>>                     struct drm_syncobj ***syncobjs_out)
>>>   {
>>>       struct drm_syncobj **syncobjs;
>>> @@ -1232,9 +1234,13 @@ static int drm_syncobj_array_find(struct 
>>> drm_file *file_private,
>>>       if (!access_ok(handles, count * sizeof(*handles)))
>>>           return -EFAULT;
>>> -    syncobjs = kmalloc_array(count, sizeof(*syncobjs), GFP_KERNEL);
>>> -    if (!syncobjs)
>>> -        return -ENOMEM;
>>> +    if (count > stack_count) {
>>
>> I believe it's worth adding a comment mentioning that using the stack
>> syncobj is a fast-path that covers most cases.
> 
> Yep. But it didn't feel like here is the place so I added comments to 
> where callers size the arrays. That however means there are two 
> duplicated comments. Okay with you?

Sure.

> 
>>> +        syncobjs = kmalloc_array(count, sizeof(*syncobjs), GFP_KERNEL);
>>> +        if (!syncobjs)
>>> +            return -ENOMEM;
>>> +    } else {
>>> +        syncobjs = stack_syncobjs;
>>> +    }
>>>       for (i = 0; i < count; i++) {
>>>           u64 handle;
>>> @@ -1260,25 +1266,31 @@ static int drm_syncobj_array_find(struct 
>>> drm_file *file_private,
>>>               drm_syncobj_put(syncobjs[i]);
>>>           i--;
>>>       }
>>> -    kfree(syncobjs);
>>> +
>>> +    if (syncobjs != stack_syncobjs)
>>
>> Again, I have a slight preference to make `syncobjs = NULL` and avoid
>> this if condition. But it's just a personal preference.
> 
> Pending clarifications from the other patch.

Nvm, it wasn't a good idea.

> 
>>
>>> +        kfree(syncobjs);
>>>       return ret;
>>>   }
>>>   static void drm_syncobj_array_free(struct drm_syncobj **syncobjs,
>>> -                   uint32_t count)
>>> +                   uint32_t count,
>>> +                   struct drm_syncobj **stack_syncobjs)
>>
>> IMO, I think the order `syncobjs, stack_syncobjs, count` is a bit more
>> intuitive.
> 
> But count is not directly related to the size of the stack array in this 
 > function. I could make it a boolean perhaps like this:>
> static void drm_syncobj_array_free(struct drm_syncobj **syncobjs,
>                     uint32_t count,
>                     bool free_array)
> 
> And then in the callers:
> 
> drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
> 
> Would that be clearer?

Yeah, it does.

> 
>>
>>>   {
>>>       uint32_t i;
>>>       for (i = 0; i < count; i++)
>>>           drm_syncobj_put(syncobjs[i]);
>>> -    kfree(syncobjs);
>>> +
>>> +    if (syncobjs != stack_syncobjs)
>>> +        kfree(syncobjs);
>>>   }
>>>   int
>>>   drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
>>>                  struct drm_file *file_private)
>>>   {
>>> +    struct drm_syncobj *stack_syncobjs[4];
>>>       struct drm_syncobj_wait *args = data;
>>>       ktime_t deadline, *pdeadline = NULL;
>>>       u32 count = args->count_handles;
>>> @@ -1304,6 +1316,8 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, 
>>> void *data,
>>>       ret = drm_syncobj_array_find(file_private,
>>>                        u64_to_user_ptr(args->handles),
>>>                        count,
>>> +                     stack_syncobjs,
>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>                        &syncobjs);
>>>       if (ret < 0)
>>>           return ret;
>>> @@ -1321,7 +1335,7 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, 
>>> void *data,
>>>                            &first,
>>>                            pdeadline);
>>> -    drm_syncobj_array_free(syncobjs, count);
>>> +    drm_syncobj_array_free(syncobjs, count, stack_syncobjs);
>>>       if (timeout < 0)
>>>           return timeout;
>>> @@ -1336,6 +1350,7 @@ drm_syncobj_timeline_wait_ioctl(struct 
>>> drm_device *dev, void *data,
>>>                   struct drm_file *file_private)
>>>   {
>>>       struct drm_syncobj_timeline_wait *args = data;
>>> +    struct drm_syncobj *stack_syncobjs[4];
>>
>> Zero initialize it?
> 
> Do you see it is required?

Not required, I was just suggesting to double-check if it wasn't needed
indeed.

Best Regards,
- Maíra

> 
> Regards,
> 
> Tvrtko
> 
>>>       ktime_t deadline, *pdeadline = NULL;
>>>       u32 count = args->count_handles;
>>>       struct drm_syncobj **syncobjs;
>>> @@ -1361,6 +1376,8 @@ drm_syncobj_timeline_wait_ioctl(struct 
>>> drm_device *dev, void *data,
>>>       ret = drm_syncobj_array_find(file_private,
>>>                        u64_to_user_ptr(args->handles),
>>>                        count,
>>> +                     stack_syncobjs,
>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>                        &syncobjs);
>>>       if (ret < 0)
>>>           return ret;
>>> @@ -1378,7 +1395,7 @@ drm_syncobj_timeline_wait_ioctl(struct 
>>> drm_device *dev, void *data,
>>>                            &first,
>>>                            pdeadline);
>>> -    drm_syncobj_array_free(syncobjs, count);
>>> +    drm_syncobj_array_free(syncobjs, count, stack_syncobjs);
>>>       if (timeout < 0)
>>>           return timeout;
>>> @@ -1496,6 +1513,7 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, 
>>> void *data,
>>>               struct drm_file *file_private)
>>>   {
>>>       struct drm_syncobj_array *args = data;
>>> +    struct drm_syncobj *stack_syncobjs[4];
>>>       struct drm_syncobj **syncobjs;
>>>       uint32_t i;
>>>       int ret;
>>> @@ -1512,6 +1530,8 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, 
>>> void *data,
>>>       ret = drm_syncobj_array_find(file_private,
>>>                        u64_to_user_ptr(args->handles),
>>>                        args->count_handles,
>>> +                     stack_syncobjs,
>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>                        &syncobjs);
>>>       if (ret < 0)
>>>           return ret;
>>> @@ -1519,7 +1539,7 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, 
>>> void *data,
>>>       for (i = 0; i < args->count_handles; i++)
>>>           drm_syncobj_replace_fence(syncobjs[i], NULL);
>>> -    drm_syncobj_array_free(syncobjs, args->count_handles);
>>> +    drm_syncobj_array_free(syncobjs, args->count_handles, 
>>> stack_syncobjs);
>>>       return 0;
>>>   }
>>> @@ -1529,6 +1549,7 @@ drm_syncobj_signal_ioctl(struct drm_device 
>>> *dev, void *data,
>>>                struct drm_file *file_private)
>>>   {
>>>       struct drm_syncobj_array *args = data;
>>> +    struct drm_syncobj *stack_syncobjs[4];
>>>       struct drm_syncobj **syncobjs;
>>>       uint32_t i;
>>>       int ret;
>>> @@ -1545,6 +1566,8 @@ drm_syncobj_signal_ioctl(struct drm_device 
>>> *dev, void *data,
>>>       ret = drm_syncobj_array_find(file_private,
>>>                        u64_to_user_ptr(args->handles),
>>>                        args->count_handles,
>>> +                     stack_syncobjs,
>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>                        &syncobjs);
>>>       if (ret < 0)
>>>           return ret;
>>> @@ -1555,7 +1578,7 @@ drm_syncobj_signal_ioctl(struct drm_device 
>>> *dev, void *data,
>>>               break;
>>>       }
>>> -    drm_syncobj_array_free(syncobjs, args->count_handles);
>>> +    drm_syncobj_array_free(syncobjs, args->count_handles, 
>>> stack_syncobjs);
>>>       return ret;
>>>   }
>>> @@ -1567,6 +1590,7 @@ drm_syncobj_timeline_signal_ioctl(struct 
>>> drm_device *dev, void *data,
>>>       struct drm_syncobj_timeline_array *args = data;
>>>       uint64_t __user *points = u64_to_user_ptr(args->points);
>>>       uint32_t i, j, count = args->count_handles;
>>> +    struct drm_syncobj *stack_syncobjs[4];
>>>       struct drm_syncobj **syncobjs;
>>>       struct dma_fence_chain **chains;
>>>       int ret;
>>> @@ -1586,6 +1610,8 @@ drm_syncobj_timeline_signal_ioctl(struct 
>>> drm_device *dev, void *data,
>>>       ret = drm_syncobj_array_find(file_private,
>>>                        u64_to_user_ptr(args->handles),
>>>                        count,
>>> +                     stack_syncobjs,
>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>                        &syncobjs);
>>>       if (ret < 0)
>>>           return ret;
>>> @@ -1622,7 +1648,7 @@ drm_syncobj_timeline_signal_ioctl(struct 
>>> drm_device *dev, void *data,
>>>   err_chains:
>>>       kfree(chains);
>>>   out:
>>> -    drm_syncobj_array_free(syncobjs, count);
>>> +    drm_syncobj_array_free(syncobjs, count, stack_syncobjs);
>>>       return ret;
>>>   }
>>> @@ -1631,6 +1657,7 @@ int drm_syncobj_query_ioctl(struct drm_device 
>>> *dev, void *data,
>>>                   struct drm_file *file_private)
>>>   {
>>>       struct drm_syncobj_timeline_array *args = data;
>>> +    struct drm_syncobj *stack_syncobjs[4];
>>>       struct drm_syncobj **syncobjs;
>>>       uint64_t __user *points = u64_to_user_ptr(args->points);
>>>       uint32_t i;
>>> @@ -1651,6 +1678,8 @@ int drm_syncobj_query_ioctl(struct drm_device 
>>> *dev, void *data,
>>>       ret = drm_syncobj_array_find(file_private,
>>>                        u64_to_user_ptr(args->handles),
>>>                        args->count_handles,
>>> +                     stack_syncobjs,
>>> +                     ARRAY_SIZE(stack_syncobjs),
>>>                        &syncobjs);
>>>       if (ret < 0)
>>>           return ret;
>>> @@ -1694,7 +1723,7 @@ int drm_syncobj_query_ioctl(struct drm_device 
>>> *dev, void *data,
>>>               break;
>>>           }
>>>       }
>>> -    drm_syncobj_array_free(syncobjs, args->count_handles);
>>> +    drm_syncobj_array_free(syncobjs, args->count_handles, 
>>> stack_syncobjs);
>>>       return ret;
>>>   }
>>
> 

