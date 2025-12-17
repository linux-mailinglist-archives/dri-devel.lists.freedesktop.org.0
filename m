Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C65F4CC89CB
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 16:55:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B1A10ED1E;
	Wed, 17 Dec 2025 15:55:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id E18B110ED21
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 15:55:48 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 730F2FEC;
 Wed, 17 Dec 2025 07:55:41 -0800 (PST)
Received: from [10.57.45.201] (unknown [10.57.45.201])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6AF0B3F5CA;
 Wed, 17 Dec 2025 07:55:44 -0800 (PST)
Message-ID: <42a3d2dc-1e1a-49ef-b3e7-c2fe604ca09a@arm.com>
Date: Wed, 17 Dec 2025 15:55:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/panthor: fix for dma-fence safe access rules
To: Chia-I Wu <olvaffe@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Grant Likely <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tvrtko.ursulin@igalia.com
References: <20251204174545.399059-1-olvaffe@gmail.com>
 <20251205134307.6a06f9e1@fedora>
 <CAPaKu7RNOXSza-YP5cqnasPgs2E8HQ4yUzm4N2F649HgNxb18g@mail.gmail.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <CAPaKu7RNOXSza-YP5cqnasPgs2E8HQ4yUzm4N2F649HgNxb18g@mail.gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 05/12/2025 18:45, Chia-I Wu wrote:
> On Fri, Dec 5, 2025 at 4:43 AM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
>>
>> On Thu,  4 Dec 2025 09:45:45 -0800
>> Chia-I Wu <olvaffe@gmail.com> wrote:
>>
>>> Commit 506aa8b02a8d6 ("dma-fence: Add safe access helpers and document
>>> the rules") details the dma-fence safe access rules. The most common
>>> culprit is that drm_sched_fence_get_timeline_name may race with
>>> group_free_queue.
>>>
>>> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
>>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
>>> Reviewed-by: Steven Price <steven.price@arm.com>
>>>
>>> ---
>>> v2: collect R-bs and drop misleading Fixes: tag
>>
>> Should we at least
>>
>> Cc: stable@vger.kernel.org
>>
>> so this gets considered for backporting?
> This can be considered a follow-up to commit 506aa8b02a8d6. I think
> 
>   Cc: stable@vger.kernel.org # v6.17+
> 
> is appropriate. (Not sure if I should send v3 or leave it to
> maintainers, because I was once told to never add the line and always
> leave it to maintainers).
> 
> To help make the decision, commit 506aa8b02a8d6 itself narrowed the
> race window greatly. This follow-up closes the remaining case where
> panthor signals the fence and destroys the group while the consumer
> holds the rcu read lock.
> 

I've pushed this to drm-misc-next with the Cc tag.

Thanks,
Steve

>>
>>> ---
>>>  drivers/gpu/drm/panthor/panthor_sched.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/panthor/panthor_sched.c
>>> index 33b9ef537e359..a8b1347e4da71 100644
>>> --- a/drivers/gpu/drm/panthor/panthor_sched.c
>>> +++ b/drivers/gpu/drm/panthor/panthor_sched.c
>>> @@ -23,6 +23,7 @@
>>>  #include <linux/module.h>
>>>  #include <linux/platform_device.h>
>>>  #include <linux/pm_runtime.h>
>>> +#include <linux/rcupdate.h>
>>>
>>>  #include "panthor_devfreq.h"
>>>  #include "panthor_device.h"
>>> @@ -923,6 +924,9 @@ static void group_release_work(struct work_struct *work)
>>>                                                  release_work);
>>>       u32 i;
>>>
>>> +     /* dma-fences may still be accessing group->queues under rcu lock. */
>>> +     synchronize_rcu();
>>> +
>>>       for (i = 0; i < group->queue_count; i++)
>>>               group_free_queue(group, group->queues[i]);
>>>
>>

