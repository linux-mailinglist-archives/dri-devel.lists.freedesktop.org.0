Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 952CAA0798F
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 15:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8DF610EE0B;
	Thu,  9 Jan 2025 14:45:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="MkVvg9pZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8260510EE0B
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 14:45:30 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4YTSHY0SkBz9stY;
 Thu,  9 Jan 2025 15:44:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1736433897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O4T8TRq4jK6dbFnjF6ptf6C+DvnaKaI4Gqs9/G5oJds=;
 b=MkVvg9pZ1RY8F718FrylRfzY3SIYx3j8iaARS8ZBRDr9DTuKVBs0lYqvkYrocaC1z+nl7+
 u2258owIOcmSEnjK13lr2Gev8TWi5h+hkEJjBMgsVmaf9b/UjxBwWRHyGa6Makzqfez6fM
 0ceSzf+W0WQmEn/+Kg/rl0Pj2BgyOJ8O08pBgnHBd6PdVkiD/DWvm95XvNuqqzU8KWEHum
 vSq7mekgpD9n3ZAKlvheo77K63ppORMgniuNnbSwEwMYMrVVx4wYdiEvp7o051YgolGE1V
 kQcEkrFsrNg02n506MFKovNIhxrWA438iPjNXms0aWGZqD2QBPaz53IslNBJ1w==
Message-ID: <f12edb46-fce4-4822-a556-8435d8fe6863@mailbox.org>
Date: Thu, 9 Jan 2025 15:44:53 +0100
MIME-Version: 1.0
Subject: Re: [RFC 11/14] drm/sched: Connect with dma-fence deadlines
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Rob Clark <robdclark@gmail.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <20241230165259.95855-12-tursulin@igalia.com>
 <7e74dffc-ff0c-449c-8b4d-20b500fa7800@mailbox.org>
 <70797b0f-e944-43e6-b5bd-5e22c92e2f38@igalia.com>
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
Content-Language: de-CH-frami, en-CA
In-Reply-To: <70797b0f-e944-43e6-b5bd-5e22c92e2f38@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: hukq4t33fr4yxdaoi9jhrb14ngii3wgu
X-MBO-RS-ID: ab9d97a1d18bbd15213
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

On 2025-01-09 14:31, Tvrtko Ursulin wrote:
> On 09/01/2025 11:38, Michel Dänzer wrote:
>> On 2024-12-30 17:52, Tvrtko Ursulin wrote:
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>> index 0f35f009b9d3..dfc7f50d4e0d 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>> @@ -168,6 +168,8 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>>>         spin_unlock_irqrestore(&fence->lock, flags);
>>>   +    drm_sched_entity_set_deadline(fence->entity, deadline);
>>
>> AFAICT sync_file_ioctl_set_deadline passes through the unmodified deadline from user space. If the scheduler uses that directly, all user space can fake unlimited high priority for its jobs via the ioctl?
> 
> Yes, that wouldn't be great. I could only allow high priority contexts/entities to have their deadlines respected.

FWIW, there are more wrinkles here:

The user-space entity which sets the fence deadline isn't necessarily the one which submitted the corresponding GPU job, e.g. it could be the Wayland compositor. Not sure offhand whether the scheduling priority of the GPU job submitter and/or fence deadline setter should be taken into account in this case.

If the fence deadline is later than the original scheduler deadline based on job submission time and scheduling priority, should the scheduling deadline be moved back or not?


> I hope the uapi side of deadlines did not make any hard promises. Well obviously it did not since it is not wired up at the moment anyway.

Right, I guess it's essentially a hint by when user space would like the fence to have signalled if possible.


> I also need to improve it and pull in the internal deadline to some time before the userspace one.

Because the internal deadline corresponds to when the job starts executing, whereas the fence deadline to when it finishes? Not sure how that can be accounted for though, not knowing how long the job will take to execute.


In summary, I'm not sure using the fence deadline for the scheduler one really makes sense after all.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast
