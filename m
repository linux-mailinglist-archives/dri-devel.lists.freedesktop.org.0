Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58140C31DC3
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 16:35:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF4B510E631;
	Tue,  4 Nov 2025 15:35:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=damsy.net header.i=@damsy.net header.b="tPXgAH7H";
	dkim=permerror (0-bit key) header.d=damsy.net header.i=@damsy.net header.b="+l629BC5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from jeth.damsy.net (jeth.damsy.net [51.159.152.102])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4F510E631
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 15:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=202408r; d=damsy.net; c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1762270497;
 bh=MbNx/MvAK/wGX2ybmVhbP3Y
 QZm+xkrHKZTepIIrvPhI=; b=tPXgAH7HNNI50D7uTR0Y+o/NL4RgLmMbqPqz+BLAstEqr6k1KQ
 IPBckrUHffBfMaGmixzHaiGvAjhq5yV6XRZVG3bOTN24MaPqqIa1NUid5t8RXMi5LjpySwBKZbS
 AxqKzUzLc8gnKJ2s64SEjFgNYJ7ytsgLm//GIFrbXTfjx+QX9PXMDXvnJGIqrYp3qQ4cemkhSPf
 GtA6c0yzAYVahGTqYS436fz1TR3XbbNwdpXnavhV9Ae07ioPMUmg7EnrebIG+Vlzw5T8Jba1E89
 ebuJ+RcjpgPCuDbehsBDIs+1zPH3I9N9JkvbYw1UcRe9J6VBdLAQ7IE2o2qmCjf2D7g==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202408e; d=damsy.net;
 c=relaxed/relaxed; 
 h=From:To:Subject:Date:Message-ID; t=1762270497; bh=MbNx/MvAK/wGX2ybmVhbP3Y
 QZm+xkrHKZTepIIrvPhI=; b=+l629BC53Z8vWYkMXn+7VropGO4HiPqhEsh33T6MdDHO8DYUDb
 0sQ/yuVwsGErbqcRXkVg7ZQ9tMkYqvvib4Aw==;
Message-ID: <87f1343f-9baa-4b73-a570-6cc6707c4198@damsy.net>
Date: Tue, 4 Nov 2025 16:34:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] drm/sched: Fix deadlock in
 drm_sched_entity_kill_jobs_cb
To: phasta@kernel.org,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
References: <20251104095358.15092-1-pierre-eric.pelloux-prayer@amd.com>
 <628cdf3a0c5b783c09fe2a40aca4a4a48c614e66.camel@mailbox.org>
 <c1da66b4-3b71-4d83-8e8e-56151030b691@damsy.net>
 <85e573fa81913b4afe274f27142f526062f184f4.camel@mailbox.org>
Content-Language: en-US
From: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>
In-Reply-To: <85e573fa81913b4afe274f27142f526062f184f4.camel@mailbox.org>
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



Le 04/11/2025 à 16:30, Philipp Stanner a écrit :
> On Tue, 2025-11-04 at 16:24 +0100, Pierre-Eric Pelloux-Prayer wrote:
>>
>>
>> Le 04/11/2025 à 13:43, Philipp Stanner a écrit :
>>
>>>
>>> Some things I have unfortunately overlooked below.
>>>
>>>>
>>>> Fixes: 2fdb8a8f07c2 ("drm/scheduler: rework entity flush, kill and fini")
>>>
>>> We should +Cc stable. It's a deadlock after all.
>>
>> OK.
>>
>>>
>>>> Link: https://gitlab.freedesktop.org/mesa/mesa/-/issues/13908
>>>> Reported-by: Mikhail Gavrilov <mikhail.v.gavrilov@gmail.com>
>>>> Suggested-by: Christian König <christian.koenig@amd.com>
>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>>> ---
>>>>    drivers/gpu/drm/scheduler/sched_entity.c | 34 +++++++++++++-----------
>>>>    1 file changed, 19 insertions(+), 15 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> index c8e949f4a568..fe174a4857be 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>> @@ -173,26 +173,15 @@ int drm_sched_entity_error(struct drm_sched_entity *entity)
>>>>    }
>>>>    EXPORT_SYMBOL(drm_sched_entity_error);
>>>>    
>>>> +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>>>> +					  struct dma_fence_cb *cb);
>>>
>>> It's far better to move the function up instead. Can you do that?
>>
>> Since drm_sched_entity_kill_jobs_cb uses drm_sched_entity_kill_jobs and vice
>> versa, I'll have to forward declare one of the 2 functions anyway.
> 
> Ah, right.
> OK then.
> 
> I can push this and +Cc stable in the commit message if you want.
> 

Would be great, thanks!

Pierre-Eric
