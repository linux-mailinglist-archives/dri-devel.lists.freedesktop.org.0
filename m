Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B141DA08EBC
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 12:00:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2424F10F073;
	Fri, 10 Jan 2025 11:00:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="PpK8Ubk8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE82F10F073
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 11:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WZPUh4OfYKaEE8HLkGkUfZUYenY/K3tqKoOYhonsPN8=; b=PpK8Ubk84cHS6iO6zcCFXa+Lmi
 jxobDD7lDQwL6pO55GCYaIces5VMUlSq0c3ptTDa0o/4bFk4i3grRSi7XTsaMLz6lnYjfaXN/cYPS
 kNzM+XBK0H1A3ykvgvvBdZDc45pGQrE5iLwFeES41kA7TKsviijVm2H5u3PezHq3PVgR+VuGC0252
 TFo3ldjtfww+QYjiIKF3zxn4LUiPGuHCc8f53QxcU2/F7rH62wzlq12djTniY9ofUfmh51xVc9YrT
 6ch9PHRE+PyT++nf05VooDspimxQv/jx+zedQ4yqnoL5M2nuOX8+z5627oh2j+IuuCJtLKtMF7Hqb
 a5SmDi3w==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tWCkq-00DvLB-Gl; Fri, 10 Jan 2025 12:00:40 +0100
Message-ID: <301f055d-d5d2-4af1-b9d9-1b991db8f2c2@igalia.com>
Date: Fri, 10 Jan 2025 11:00:39 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 10/18] drm/sched: Implement RR via FIFO
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
 <20250108183528.41007-11-tvrtko.ursulin@igalia.com>
 <e2dea565-96a0-4d83-81db-0d38ba180292@amd.com>
 <218feab1-f8a8-43cc-a23c-01e31e59a2b2@igalia.com>
 <b9abe236-fd01-45eb-873f-e458dfc0b0ee@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <b9abe236-fd01-45eb-873f-e458dfc0b0ee@amd.com>
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


On 09/01/2025 14:12, Christian König wrote:
> Am 09.01.25 um 14:27 schrieb Tvrtko Ursulin:
>> [SNIP]
>>>> @@ -259,7 +258,7 @@ struct drm_sched_rq {
>>>>       spinlock_t            lock;
>>>>       /* Following members are protected by the @lock: */
>>>> -    struct drm_sched_entity        *current_entity;
>>>> +    ktime_t                rr_deadline;
>>>>       struct list_head        entities;
>>>
>>> If I'm not completely mistaken you can now also nuke this entities 
>>> list if you haven't already removed all users.
>>
>> I had a version which did that too. But then I dropped it in favour of 
>> only keeping entities with queued jobs in the tree. (Before both the 
>> list and the tree contained entities which submitted at least one job 
>> in the past.)
>>
>> I kind of like keeping the tree trimmed (would it lower the rb tree 
>> re-balancing costs?) in which case the full list is needed for that 
>> karma processing business.
> 
> Well, is anybody still using this karma stuff (maybe amdgpu, but we 
> could drop that)? That as well turned out to be a quite broken approach.

Git grep says etnaviv, lima, panfrost, v3d.

> Basically the idea behind karma was that on a crash you re-submit the 
> same job over and over again until it either doesn't crash any more or 
> your karma became to bad.

Well I don't know, TBD I guess. In any case probably best to leave that 
work for a different series to keep this one reasonably focused.

I also still like the idea of keeping the tree pruned of idle entities 
so for me rq->entities list is not a big deal.

> And when you now think of what Einstein once said about insanity then 
> yeah that was also my first thought when I learned about that :)

Right, resubmitting hanging jobs sounds highly questionable indeed.

But it is also the entity->guilty business.

Now if entities were reference counted... ;) The list walk 
hack/workaround in drm_sched_increase_karma could also go away.

Regards,

Tvrtko

>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>       struct rb_root_cached rb_tree_root;
>>>>   };
>>>
> 
