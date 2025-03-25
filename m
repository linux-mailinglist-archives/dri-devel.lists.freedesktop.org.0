Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CC0A6EC7D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Mar 2025 10:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EFD310E274;
	Tue, 25 Mar 2025 09:33:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PMrf6cTH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83BC010E274
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Mar 2025 09:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T0nYQx42N266JQrASnmElfR1fKh4t5cpVOgZ5ffnaaU=; b=PMrf6cTH1U2Ar1g8GzV1JhQgqE
 rgm3gUHN3fq+A3hG3oU3MBYBUs9dqkOrCMvCAMkKXydigtpj58cKqSmqWLBW/pRSqfsRpeMNFiPBu
 puV+3EEV2xh0mcSMkOpz9yg8zNXqGswYbUSufBaSL//uraxlLh2chcA9cHNPu+NaSCv3qI0pdrj7Y
 MmIq4Fn0f7OjHXY5AQxSoEjcETokT0ciRt+/ci7KdIaf6Nkiz6G6GTO4W+OHwZXl0rDqxyMBFM+sw
 WCO8Fj8IQE1oXO0V9IemgHtv+10szWnWwPS04P7dHctdNaSHGsb906K6sFiIid9NHFJvm2E+huiwv
 ztXCaY1Q==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tx0er-0065bK-TG; Tue, 25 Mar 2025 10:33:17 +0100
Message-ID: <41deeab2-2943-499f-9a3e-19ff7ef08787@igalia.com>
Date: Tue, 25 Mar 2025 09:33:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] drm/syncobj: Add a fast path to
 drm_syncobj_array_wait_timeout
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com
References: <20250318155424.78552-1-tvrtko.ursulin@igalia.com>
 <20250318155424.78552-7-tvrtko.ursulin@igalia.com>
 <da00cb1d-ea1d-4a42-bd07-c769d2283e7a@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <da00cb1d-ea1d-4a42-bd07-c769d2283e7a@igalia.com>
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


On 24/03/2025 23:00, Maíra Canal wrote:
> Hi Tvrtko,
> 
> On 18/03/25 12:54, Tvrtko Ursulin wrote:
>> Running the Cyberpunk 2077 benchmark we can observe that waiting on DRM
>> sycobjs is relatively hot, but the 96% of the calls are for a single
>> object. (~4% for two points, and never more than three points. While
>> a more trivial workload like vkmark under Plasma is even more skewed
>> to single point waits.)
>>
>> Therefore lets add a fast path to bypass the kcalloc/kfree and use a pre-
>> allocated stack array for those cases.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> ---
>>   drivers/gpu/drm/drm_syncobj.c | 16 ++++++++++++----
>>   1 file changed, 12 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/ 
>> drm_syncobj.c
>> index b4563c696056..94932b89298f 100644
>> --- a/drivers/gpu/drm/drm_syncobj.c
>> +++ b/drivers/gpu/drm/drm_syncobj.c
>> @@ -1035,6 +1035,7 @@ static signed long 
>> drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>>                             uint32_t *idx,
>>                             ktime_t *deadline)
>>   {
>> +    struct syncobj_wait_entry stack_entries[4];
> 
> Can't you initialize as
> 
> struct syncobj_wait_entry stack_entries[4] = {0};
> 
> ?

Could do but I preferred to only do it when it is used.

> 
>>       struct syncobj_wait_entry *entries;
>>       uint32_t signaled_count, i;
>>       struct dma_fence *fence;
>> @@ -1049,9 +1050,14 @@ static signed long 
>> drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>>           !access_ok(user_points, count * sizeof(*user_points)))
>>           return -EFAULT;
>> -    entries = kcalloc(count, sizeof(*entries), GFP_KERNEL);
>> -    if (!entries)
>> -        return -ENOMEM;
>> +    if (count > ARRAY_SIZE(stack_entries)) {
>> +        entries = kcalloc(count, sizeof(*entries), GFP_KERNEL);
>> +        if (!entries)
>> +            return -ENOMEM;
>> +    } else {
>> +        memset(stack_entries, 0, sizeof(stack_entries));
> 
> Then, you can avoid this step.
> 
>> +        entries = stack_entries;
>> +    }
>>       /* Walk the list of sync objects and initialize entries.  We do
>>        * this up-front so that we can properly return -EINVAL if there is
>> @@ -1174,7 +1180,9 @@ static signed long 
>> drm_syncobj_array_wait_timeout(struct drm_syncobj **syncobjs,
>>                             &entries[i].fence_cb);
>>           dma_fence_put(entries[i].fence);
>>       }
>> -    kfree(entries);
>> +
>> +    if (entries != stack_entries)
> 
> You can initialize `entries = NULL` and avoid this step.

Hmm where? You mean like:

if (entries == stack_entries)
	entries = NULL;
kfree(entries);

Or something different?

Regards,

Tvrtko

> 
> Anyway,
> 
> Reviewed-by: Maíra Canal <mcanal@igalia.com>
> 
> Best Regards,
> - Maíra
> 
>> +        kfree(entries);
>>       return timeout;
>>   }
> 

