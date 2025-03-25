Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F074A6EC51
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 10:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAF1E10E527;
	Tue, 25 Mar 2025 09:12:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="D+H9DZsd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1163110E2CD
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 09:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QgmO880Z3EKXkplFj940B3WXZC3vzCFuBHXanf3ujig=; b=D+H9DZsdHRP0Wxm1t21310yqQV
 sz8xC+cP5ZNfq/6I7qyS3kT+pU+1n6cEzDErvNkd7kHs+MXt2DYNGGryNFQQJ4CszcS6iE0eo7dTp
 jUxBe9RAwTzMm+tUxzQkj9o3gXZbvIEjHHigYA8Foo4oMiQeoKjInjmuL43YQ4WF3+vvXDaRLSuuc
 3TF1yFx4quGYT1fbSYDP2fit38I3ZEuV+DJgt3dlL/ejttjQow8UB0Cj0Z0jMX1eHRyFRLtBXPUN1
 kiDn9CK0LclruaKFB1VPtcdGobpPmkYgNmMFGzDZmPtzpx9lt0ni/86SAD8hHa4RVTghxCuQnbh1t
 HeeoN+0A==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tx0Ku-0065Ak-4X; Tue, 25 Mar 2025 10:12:40 +0100
Message-ID: <51677a97-bd18-4ddc-8665-cb27c1c03e03@igalia.com>
Date: Tue, 25 Mar 2025 09:12:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] drm/syncobj: Remove unhelpful helper
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com
References: <20250318155424.78552-1-tvrtko.ursulin@igalia.com>
 <20250318155424.78552-2-tvrtko.ursulin@igalia.com>
 <fb62235b-0e18-4c7f-b14c-a6e809ff9e14@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <fb62235b-0e18-4c7f-b14c-a6e809ff9e14@igalia.com>
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


On 24/03/2025 21:38, Maíra Canal wrote:
> Hi Tvrtko,
> 
> Some nits inline, but feel free to ignore them if you don't think they
> are reasonable. Apart from that,
> 
> Reviewed-by: Maíra Canal <mcanal@igalia.com>
> 
> On 18/03/25 12:54, Tvrtko Ursulin wrote:
>> Helper which fails to consolidate the code and instead just forks into 
>> two
>> copies of the code based on a boolean parameter is not very helpful or
>> readable. Lets just remove it and proof in the pudding is the net smaller
>> code.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>   drivers/gpu/drm/drm_syncobj.c | 98 ++++++++++++++++-------------------
>>   1 file changed, 44 insertions(+), 54 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/ 
>> drm_syncobj.c
>> index 4f2ab8a7b50f..d0d60c331df8 100644
>> --- a/drivers/gpu/drm/drm_syncobj.c
>> +++ b/drivers/gpu/drm/drm_syncobj.c
>> @@ -1221,42 +1221,6 @@ signed long drm_timeout_abs_to_jiffies(int64_t 
>> timeout_nsec)
>>   }
>>   EXPORT_SYMBOL(drm_timeout_abs_to_jiffies);
>> -static int drm_syncobj_array_wait(struct drm_device *dev,
>> -                  struct drm_file *file_private,
>> -                  struct drm_syncobj_wait *wait,
>> -                  struct drm_syncobj_timeline_wait *timeline_wait,
>> -                  struct drm_syncobj **syncobjs, bool timeline,
>> -                  ktime_t *deadline)
>> -{
>> -    signed long timeout = 0;
>> -    uint32_t first = ~0;
>> -
>> -    if (!timeline) {
>> -        timeout = drm_timeout_abs_to_jiffies(wait->timeout_nsec);
>> -        timeout = drm_syncobj_array_wait_timeout(syncobjs,
>> -                             NULL,
>> -                             wait->count_handles,
>> -                             wait->flags,
>> -                             timeout, &first,
>> -                             deadline);
>> -        if (timeout < 0)
>> -            return timeout;
>> -        wait->first_signaled = first;
>> -    } else {
>> -        timeout = drm_timeout_abs_to_jiffies(timeline_wait- 
>> >timeout_nsec);
>> -        timeout = drm_syncobj_array_wait_timeout(syncobjs,
>> -                             u64_to_user_ptr(timeline_wait->points),
>> -                             timeline_wait->count_handles,
>> -                             timeline_wait->flags,
>> -                             timeout, &first,
>> -                             deadline);
>> -        if (timeout < 0)
>> -            return timeout;
>> -        timeline_wait->first_signaled = first;
>> -    }
>> -    return 0;
>> -}
>> -
>>   static int drm_syncobj_array_find(struct drm_file *file_private,
>>                     void __user *user_handles,
>>                     uint32_t count_handles,
>> @@ -1319,9 +1283,12 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, 
>> void *data,
>>                  struct drm_file *file_private)
>>   {
>>       struct drm_syncobj_wait *args = data;
>> +    ktime_t deadline, *pdeadline = NULL;
>> +    u32 count = args->count_handles;
> 
>  From my point of view, this variable didn't make the code more readable.
> I'd prefer to keep using `args->count_handles` in the code.

I think this one is 50-50. I made it a local since it used four times in 
both functions. Since you are not strongly against it I opted to keep it 
as is.

>>       struct drm_syncobj **syncobjs;
>>       unsigned int possible_flags;
>> -    ktime_t t, *tp = NULL;
>> +    u32 first = ~0;
>> +    long timeout;
>>       int ret = 0;
>>       if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ))
>> @@ -1334,27 +1301,37 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, 
>> void *data,
>>       if (args->flags & ~possible_flags)
>>           return -EINVAL;
>> -    if (args->count_handles == 0)
>> +    if (count == 0)
>>           return 0;
>>       ret = drm_syncobj_array_find(file_private,
>>                        u64_to_user_ptr(args->handles),
>> -                     args->count_handles,
>> +                     count,
>>                        &syncobjs);
>>       if (ret < 0)
>>           return ret;
>>       if (args->flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE) {
>> -        t = ns_to_ktime(args->deadline_nsec);
>> -        tp = &t;
>> +        deadline = ns_to_ktime(args->deadline_nsec);
>> +        pdeadline = &deadline;
>>       }
>> -    ret = drm_syncobj_array_wait(dev, file_private,
>> -                     args, NULL, syncobjs, false, tp);
>> +    timeout = drm_syncobj_array_wait_timeout(syncobjs,
>> +                         NULL,
>> +                         count,
>> +                         args->flags,
>> +                         drm_timeout_abs_to_jiffies(args->timeout_nsec),
> 
> Could you create a variable for the timeout instead of adding the
> function as a parameter?
> 
> Same comments for `drm_syncobj_timeline_wait_ioctl()`.

Good suggestion, done.

Regards,

Tvrtko

>> +                         &first,
>> +                         pdeadline);
>> -    drm_syncobj_array_free(syncobjs, args->count_handles);
>> +    drm_syncobj_array_free(syncobjs, count);
>> -    return ret;
>> +    if (timeout < 0)
>> +        return timeout;
>> +
>> +    args->first_signaled = first;
>> +
>> +    return 0;
>>   }
>>   int
>> @@ -1362,9 +1339,12 @@ drm_syncobj_timeline_wait_ioctl(struct 
>> drm_device *dev, void *data,
>>                   struct drm_file *file_private)
>>   {
>>       struct drm_syncobj_timeline_wait *args = data;
>> +    ktime_t deadline, *pdeadline = NULL;
>> +    u32 count = args->count_handles;
>>       struct drm_syncobj **syncobjs;
>>       unsigned int possible_flags;
>> -    ktime_t t, *tp = NULL;
>> +    u32 first = ~0;
>> +    long timeout;
>>       int ret = 0;
>>       if (!drm_core_check_feature(dev, DRIVER_SYNCOBJ_TIMELINE))
>> @@ -1378,27 +1358,37 @@ drm_syncobj_timeline_wait_ioctl(struct 
>> drm_device *dev, void *data,
>>       if (args->flags & ~possible_flags)
>>           return -EINVAL;
>> -    if (args->count_handles == 0)
>> +    if (count == 0)
>>           return 0;
>>       ret = drm_syncobj_array_find(file_private,
>>                        u64_to_user_ptr(args->handles),
>> -                     args->count_handles,
>> +                     count,
>>                        &syncobjs);
>>       if (ret < 0)
>>           return ret;
>>       if (args->flags & DRM_SYNCOBJ_WAIT_FLAGS_WAIT_DEADLINE) {
>> -        t = ns_to_ktime(args->deadline_nsec);
>> -        tp = &t;
>> +        deadline = ns_to_ktime(args->deadline_nsec);
>> +        pdeadline = &deadline;
>>       }
>> -    ret = drm_syncobj_array_wait(dev, file_private,
>> -                     NULL, args, syncobjs, true, tp);
>> +    timeout = drm_syncobj_array_wait_timeout(syncobjs,
>> +                         u64_to_user_ptr(args->points),
>> +                         count,
>> +                         args->flags,
>> +                         drm_timeout_abs_to_jiffies(args->timeout_nsec),
>> +                         &first,
>> +                         pdeadline);
>> -    drm_syncobj_array_free(syncobjs, args->count_handles);
>> +    drm_syncobj_array_free(syncobjs, count);
>> -    return ret;
>> +    if (timeout < 0)
>> +        return timeout;
>> +
>> +    args->first_signaled = first;
>> +
>> +    return 0;
>>   }
>>   static void syncobj_eventfd_entry_fence_func(struct dma_fence *fence,
> 

