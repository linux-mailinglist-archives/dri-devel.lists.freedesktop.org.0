Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0821AAE1FB
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 16:08:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB60010E7FF;
	Wed,  7 May 2025 14:08:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cQ01P2au";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AAF210E7FF
 for <dri-devel@lists.freedesktop.org>; Wed,  7 May 2025 14:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KBB+WjVzByVFW+uRxe/1Yd1RcKwEfDRO1TW7gfbiVwU=; b=cQ01P2auP0r6SeVcSFIx3vrNUk
 5ydNj5/KYM4yU7mAbGqoBHUuIEGMQoO7wDEauD/ve9zwHj23DCdxRfMngrQcIH80dDTamG+VywcZB
 bC2IobKK6c4ViajaojgqzsMadQRdkOC4h0/by1qFBU0Vzecqktg3989YACQTHf10JewEWzuTgBzy0
 lkNym0Ys4v5wb8AxbjNaWWrIaiaSJq7PK2bkk9498ijs8D0xcf3waU5RstRpDJuMJFS007EnC2Abn
 HkZWztr5UpQsF9qqDFn5JE+RO+R482/TC2uJNY4nT+0hOn47PkCafCtYAi50cQqVgWCl7A5OJk3xE
 qqZQVomQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uCfNR-004kHV-DI; Wed, 07 May 2025 16:07:58 +0200
Message-ID: <33cf57f2-230d-4bab-bab9-848b5ace9dfc@igalia.com>
Date: Wed, 7 May 2025 15:07:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/4] Some (drm_sched_|dma_)fence lifetime issues
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner
 <phasta@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250418164246.72426-1-tvrtko.ursulin@igalia.com>
 <29b27ae3-de56-475d-ae85-fd593a011ea3@amd.com>
 <e4acf86d-ff22-423d-9769-80316fa96cb5@igalia.com>
 <ff76a94e-97cd-4d19-a02b-cf2a1fc00ac8@amd.com>
 <67a89aac-5eb6-46d2-b456-32e9f3e72f09@igalia.com>
 <67697ca1-e18e-4f9e-a315-43957e71dbef@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <67697ca1-e18e-4f9e-a315-43957e71dbef@amd.com>
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


On 07/05/2025 13:54, Christian König wrote:
> On 5/7/25 14:28, Tvrtko Ursulin wrote:
>>
>> On 28/04/2025 14:15, Christian König wrote:
>>> On 4/24/25 09:07, Tvrtko Ursulin wrote:
>>>>
>>>> On 23/04/2025 14:12, Christian König wrote:
>>>>> On 4/18/25 18:42, Tvrtko Ursulin wrote:
>>>>>> Hi all,
>>>>>>
>>>>>> Recently I mentioned to Danilo about some fence lifetime issues so here is a
>>>>>> rough series, more than anything intended to start the discussion.
>>>>>>
>>>>>> Most of the problem statement can be found in the first patch but to briefly
>>>>>> summarise - because sched fence can outlive the scheduler, we can trivially
>>>>>> engineer an use after free with xe and possibly other drivers. All that is
>>>>>> needed is to convert a syncobj into a sync file behind drivers back, and I don't
>>>>>> see what the driver can do about it.
>>>>>
>>>>>
>>>>> Yeah that topic again :) The problem here is that this is not a bug, it is a feature!
>>>>>
>>>>> IIRC it was Alex who pointed that issue out on the very first fence patch set, and we already discussed what to do back then.
>>>>>
>>>>> The problem with grabbing module references for fences is that you get trivially into circle references and so basically always preventing the module from unloading.
>>>>
>>>> Where "always" is only "while there are active objects from that module", no?
>>>
>>>
>>> The problem is that dma_fences stay around after they are signaled. And basically all drivers keep some dma_fence around for their resource management. E.g. amdgpu for the VMIDs.
>>>
>>> This means that some dma_fence is referenced by the module and the module referenced by some dma_fence. E.g. you are never able to unload the module.
>>
>> Are you thinking truly never or for as long someone has a reference?
> 
> Truly never. It's simply a circle dependency you can never break up.
> 
> In other words the module references the fence and the fence references the module.

Past fences being signaled? How?

>> For example while userspace has a reference to dma_fence via sync_file fence owning module would not unloadable. One would have to terminate the process, which granted wouldn't be easy to see which process prevents the unload, before driver could be unloaded.
>>
>> For the foreign fences kept around in kernel space, that would be solvable by some periodic house keeping at worst.
>>
>> Also, about the use cases for module unload. Since you and Brost especially seem to be expressing a hard no to module references, what are the use cases you are concerned about?
>>
>>>>> The decision was made to postpone this and live with the potential use after free on module unload until somebody has time to fix it. Well that was +10 years ago :)
>>>>>
>>>>> I discussed this with Sima again last year and we came to the conclusion that the easiest way forward would be to decouple the dma_fence implementation from the driver or component issuing the fence.
>>>>>
>>>>> I then came up with the following steps to allow this:
>>>>> 1. Decouple the lock used for protecting the dma_fence callback list from the caller.
>>>>> 2. Stop calling enable_signaling with the lock held.
>>>>> 3. Nuke all those kmem_cache implementations and force drivers to always allocate fences using kvmalloc().
>>>>> 4. Nuke the release callback (or maybe move it directly after signaling) and set fence->ops to NULL after signaling the fence.
>>>>>
>>>>> I already send patches out for #1 and #2, but don't have enough time to actually finish the work.
>>>>>
>>>>> If you want take a look at nuking all those kmem_cache implementations for allocating the fence memory. I think that can be completed completely separate to everything else.
>>>>
>>>> So enabling dma fence "revoke" so to say.
>>>>
>>>> Just to check we are on the same page, it is not just about the module references, but also use after frees which can happen even if module is still loaded but any memory reachable via dma fence entry points has been freed.
>>>
>>>
>>> Yeah, that came much later when people started to use the scheduler dynamically. Basically the sched pointer in the drm_sched_fence implementation becomes invalid as soon as the fence signals.
>>>
>>>>
>>>> In that case, as Matt has already asked, if you could dig up your unfinished work it would be interesting to see.
>>>
>>>
>>> This is what I already send out: https://gitlab.freedesktop.org/ckoenig/linux-drm/-/commits/dma-fence-rework-enable-signaling
>>>
>>> A bunch of the cleanup patches in that branch have already been applied, only the last one is missing IIRC.
>>>
>>> And here is a WIP patch to decouple the lock I wrote halve a year ago or so: https://gitlab.freedesktop.org/ckoenig/linux-drm/-/commits/dma-fence-rework-locking
>>
>> Thanks!
>>
>> My concern here is that to me it appears the whole premise is to leave fences dangling in memory and somehow make them safe to be accessed by importers.
> 
> As soon as you unload the last module using it the fences will automatically be released. So I don't see the problem.
> 
>> For starters this can create permanent memory leaks. Or at least for the same window of duration as would the exporters be not unloadable with the reference counting alternative. So we would not a strong argument for why poorly bound memory leaks are better than poorly bound unloadable modules.
> 
> When the module unloads it drops the reference to the fences ultimately freeing them.
> 
> The only issue is that modules can both reference their own as well a foreign fences. So what can happen is that you have module A which references fences A1, A2 and B1 and module B which references B1, B2 and A2.
> 
> Now you can't unload either module first because they cross reference their fences and unloading one would leave the other module with fences which can't be released without crashing.
> 
> So what we need to have is that the dma_fence framework guarantees that you don't need the fence->ops nor the fence->lock pointer any more after the fence signaled.

With this option it would mean guarding all entry points with the 
embedded lock or you had in mind something different? Going simply by 
the signaled bit looks impossible to be safe.

>> It is also a question how to "revoke" fences safely (race free). It sounds hard to me. It does not seem you got to this last problem in the above branches so I don't know if you had some elegant ideas for that.
>>
>> Maybe first to ask if anyone is aware of a precedent where something in the kernel already uses this design pattern?
> 
> Of hand I don't know of any, but the problem sounds rather common to me.

Uf I don't know. Feels very atypical to me but I would be very glad to 
be told otherwise.

Regards,

Tvrtko

