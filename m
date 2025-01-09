Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2528A07DED
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 17:44:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4392910E475;
	Thu,  9 Jan 2025 16:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="ik1rb3m/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9486510E475
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vldcw3BKRUYXdKoJf/Za9xqCpK8Bezroyw7ce/lmHzQ=; b=ik1rb3m/Ed3S/2FRx2zOff6zAU
 tqBVwZutaQoRFaYVmoczXNOd2mbMdv3+iPDUtL62Ex5HWt8yTZd6iY7rbGK0rxrS2pt7ywv3MDPqD
 MQkVqLwVYFArX0cTipkEpinWyXhN9IjAcILApErSsgy4o25szvpZCefY4YFqpHUKwHjDyOU0uQfU6
 9FQMSgQJIcoLSZaZD5Ec7a29b4FGbJ5ZaCoMzKLyy1JkKe+4o1JUZwzBnSos6ryJLcTcvd+GcRvw8
 /CXlPmDeJx84H+JgYRRXWze8v68Qmo1QPxDok8aFa1qb+lzxuouTKD9Ytfp/xSEyk6vWGXDzYNnTq
 afPoMLWA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tVvdi-00DddM-VW; Thu, 09 Jan 2025 17:44:11 +0100
Message-ID: <835b6133-1ee7-48e5-b3d3-b48d8a4d6867@igalia.com>
Date: Thu, 9 Jan 2025 16:44:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 11/14] drm/sched: Connect with dma-fence deadlines
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Rob Clark <robdclark@gmail.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <20241230165259.95855-12-tursulin@igalia.com>
 <7e74dffc-ff0c-449c-8b4d-20b500fa7800@mailbox.org>
 <70797b0f-e944-43e6-b5bd-5e22c92e2f38@igalia.com>
 <f12edb46-fce4-4822-a556-8435d8fe6863@mailbox.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <f12edb46-fce4-4822-a556-8435d8fe6863@mailbox.org>
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


On 09/01/2025 14:44, Michel Dänzer wrote:
> On 2025-01-09 14:31, Tvrtko Ursulin wrote:
>> On 09/01/2025 11:38, Michel Dänzer wrote:
>>> On 2024-12-30 17:52, Tvrtko Ursulin wrote:
>>>>
>>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>>> index 0f35f009b9d3..dfc7f50d4e0d 100644
>>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>>> @@ -168,6 +168,8 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>>>>          spin_unlock_irqrestore(&fence->lock, flags);
>>>>    +    drm_sched_entity_set_deadline(fence->entity, deadline);
>>>
>>> AFAICT sync_file_ioctl_set_deadline passes through the unmodified deadline from user space. If the scheduler uses that directly, all user space can fake unlimited high priority for its jobs via the ioctl?
>>
>> Yes, that wouldn't be great. I could only allow high priority contexts/entities to have their deadlines respected.
> 
> FWIW, there are more wrinkles here:
> 
> The user-space entity which sets the fence deadline isn't necessarily the one which submitted the corresponding GPU job, e.g. it could be the Wayland compositor. Not sure offhand whether the scheduling priority of the GPU job submitter and/or fence deadline setter should be taken into account in this case.

Hmm excellent point. Is that how things typically work? Compositors 
setting deadlines on fences received from clients?

> If the fence deadline is later than the original scheduler deadline based on job submission time and scheduling priority, should the scheduling deadline be moved back or not?

In the RFC I only pull in if fence deadline is sooner which I think 
makes more sense.

>> I hope the uapi side of deadlines did not make any hard promises. Well obviously it did not since it is not wired up at the moment anyway.
> 
> Right, I guess it's essentially a hint by when user space would like the fence to have signalled if possible.
> 
> 
>> I also need to improve it and pull in the internal deadline to some time before the userspace one.
> 
> Because the internal deadline corresponds to when the job starts executing, whereas the fence deadline to when it finishes? Not sure how that can be accounted for though, not knowing how long the job will take to execute.

Yes exactly. It would have to be heuristics. But likely something would 
be better than nothing.

> In summary, I'm not sure using the fence deadline for the scheduler one really makes sense after all.

IMO it doesn't have to be perfect. Just if we find a clean way which 
improves real uses cases.

Regards,

Tvrtko
