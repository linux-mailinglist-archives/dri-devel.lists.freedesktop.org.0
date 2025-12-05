Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B1DCA7A2C
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 13:51:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2F5E10E044;
	Fri,  5 Dec 2025 12:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="X266o0EB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D9110E044
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 12:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mxf6F5azhlLiM73Ar4oF/jjdMNj+7xqHba/Bo3gvuCs=; b=X266o0EB4uxo/WNCkFVmIIyz3R
 vFLTpNGqONpzU4eAXZMXDFPHJUKRp/AVgGnwBMKrFD5Y7p3lGYW9+l1fm4d2Htt5VJkXqbfElBpW6
 hh70bVlavUaB5XQMNAfTmsawSxmw9MwkIWTGGWJ9+9L67sc3My1bdpX3wqKBZG4lPvqbYGMRFmRWW
 C/FIYbtAyDY2gNbxKyhmb8qajTjDDR7L2KONyonG5EC77RTdgUnQ6HHauodHeiTaj3CarPsOcOHTi
 lD78mbhEPW0HUs5Up03gudK7n72rLJNF5Y9MeU1hRGRfUi8MnMpTF6d6S5pmaM+AxdwsmMgvZAzeX
 15CrOo6g==;
Received: from [90.240.106.137] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1vRVGN-0094qC-Kg; Fri, 05 Dec 2025 13:50:19 +0100
Message-ID: <34d18685-d07f-4e13-b5ca-d4d75d33d6f6@igalia.com>
Date: Fri, 5 Dec 2025 12:50:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/panthor: fix for dma-fence safe access rules
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Grant Likely <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20251204015034.841235-1-olvaffe@gmail.com>
 <4e59c6f8-bc9b-4fd5-9b0f-511cce760ac2@igalia.com>
 <CAPaKu7QuUS_Nkh9cya4Nf9_=gTEMSZR-iUrFXMYyV3C=2jFjhg@mail.gmail.com>
 <20251205134629.608df99b@fedora>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20251205134629.608df99b@fedora>
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


On 05/12/2025 12:46, Boris Brezillon wrote:
> On Thu, 4 Dec 2025 09:42:37 -0800
> Chia-I Wu <olvaffe@gmail.com> wrote:
> 
>> On Thu, Dec 4, 2025 at 1:27 AM Tvrtko Ursulin <tvrtko.ursulin@igalia.com> wrote:
>>>
>>>
>>> On 04/12/2025 01:50, Chia-I Wu wrote:
>>>> Commit 506aa8b02a8d6 ("dma-fence: Add safe access helpers and document
>>>> the rules") details the dma-fence safe access rules. The most common
>>>> culprit is that drm_sched_fence_get_timeline_name may race with
>>>> group_free_queue.
>>>>
>>>> Fixes: d2624d90a0b77 ("drm/panthor: assign unique names to queues")
>>>> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
>>>> ---
>>>>    drivers/gpu/drm/panthor/panthor_sched.c | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
>>>> index 33b9ef537e359..a8b1347e4da71 100644
>>>> --- a/drivers/gpu/drm/panthor/panthor_sched.c
>>>> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
>>>> @@ -23,6 +23,7 @@
>>>>    #include <linux/module.h>
>>>>    #include <linux/platform_device.h>
>>>>    #include <linux/pm_runtime.h>
>>>> +#include <linux/rcupdate.h>
>>>>
>>>>    #include "panthor_devfreq.h"
>>>>    #include "panthor_device.h"
>>>> @@ -923,6 +924,9 @@ static void group_release_work(struct work_struct *work)
>>>>                                                   release_work);
>>>>        u32 i;
>>>>
>>>> +     /* dma-fences may still be accessing group->queues under rcu lock. */
>>>> +     synchronize_rcu();
>>>> +
>>>>        for (i = 0; i < group->queue_count; i++)
>>>>                group_free_queue(group, group->queues[i]);
>>>>   
>>>
>>> This handles the shared queue->fence_ctx.lock as well (which is also
>>> unsafe until Christian lands the inline lock, etc patch series) so it
>>> looks good to me as well.
>> Yeah, I will send v2 to drop the misleading "Fixes:" tag.
>>
>> FWIW, the UAF I saw was from accessing the string returned by
>>
>> static const char *drm_sched_fence_get_timeline_name(struct dma_fence *f)
>> {
>>          struct drm_sched_fence *fence = to_drm_sched_fence(f);
>>          return (const char *)fence->sched->name;
>> }
> 
> IIRC, the only place calling this callback is some debugsfs knob
> dumping fences attached to dma_buf resvs, and we're not supposed to
> expose our driver fences to the outside world (we use the
> drm_sched_fence proxy for that), so I'm curious where the access was
> coming from.

Via the sync_file uapi.

For reference here is a reproducer for xe:
https://patchwork.freedesktop.org/patch/642709/?series=146211&rev=2

Regards,

Tvrtko


> 
>>
>> I thought it was "name" and added the "Fixes:" tag. But actually
>> "sched" was also freed by group_release_work.
>>
>>>
>>> Just to mention an alternative could be to simply switch release_work to
>>> INIT_RCU_WORK/queue_rcu_work, but I am not sure if that has an advantage.
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>   
> 

