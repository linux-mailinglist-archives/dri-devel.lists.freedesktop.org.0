Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7544A00B30
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jan 2025 16:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D83010E8E1;
	Fri,  3 Jan 2025 15:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="Ex4X2Tfs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8042310E8E1
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Jan 2025 15:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9JBd/iMuae9Kt6BzNUyFP8VEleKBMdP5zlytKJ8xV8s=; b=Ex4X2TfsPcjCogdUinOyyO2QMG
 eMlgUype0tF0VyxzfidLHJG+QTq2yELLam4w6t76Hqa70lPKaqglMUBATzkAhmz6ivu7IifcDjLJ1
 tcP18RleJf6EHGWZTF9H1L5U5jKFHsuSlK5R5y5TL67KObxJEWqB1uY84rFc+rI+C0RwuGUFA7Obz
 l2seBVUx3qv4YF99nJA0/kFhe0zggZ6OSlHMFuaVmMHha/FVAGd2E49LuZ69t3btsh1sk0sVp5qJ6
 8vR6ZxxFxvl5iJJgwlzQAkYbWP4BCh8bNK+Ny/1B47x2VSz0S6WdxSK7FrL3x8OS+ZnEhVhvH+L76
 VkZ6LKvA==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1tTjKN-00BG2a-I2; Fri, 03 Jan 2025 16:11:07 +0100
Message-ID: <24f09c93-8377-4106-b95a-2b3ba9b09bbc@igalia.com>
Date: Fri, 3 Jan 2025 15:11:06 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 08/14] drm/sched: Add deadline policy
To: Philipp Stanner <pstanner@redhat.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>
References: <20241230165259.95855-1-tursulin@igalia.com>
 <20241230165259.95855-9-tursulin@igalia.com>
 <2bab43a317a2049fc81993f694de9c0b8fae9700.camel@redhat.com>
 <64efd5c0-a10d-4aa5-bb0c-c06677375bfa@igalia.com>
 <cefbbae1915e337aa79fd4f7b8e2c942f1ca791b.camel@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <cefbbae1915e337aa79fd4f7b8e2c942f1ca791b.camel@redhat.com>
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


On 03/01/2025 12:59, Philipp Stanner wrote:
> On Fri, 2025-01-03 at 12:40 +0000, Tvrtko Ursulin wrote:
>>
>> On 02/01/2025 13:11, Philipp Stanner wrote:
>>> On Mon, 2024-12-30 at 16:52 +0000, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>
>>>> Deadline scheduling policy should be a fairer flavour of FIFO
>>>> with
>>>> two
>>>> main advantages being that it can naturally connect with the dma-
>>>> fence
>>>> deadlines, and secondly that it can get away with multiple run
>>>> queues
>>>> per
>>>> scheduler.
>>>>
>>>>   From the latter comes the fairness advantage. Where the current
>>>> FIFO
>>>> policy will always starve low priority entities by normal, and
>>>> normal
>>>> by high etc, deadline tracks all runnable entities in a single
>>>> run
>>>> queue
>>>> and assigns them deadlines based on priority. Instead of being
>>>> ordered
>>>> strictly by priority, jobs and entities become ordered by
>>>> deadlines.
>>>>
>>>> This means that a later higher priority submission can still
>>>> overtake
>>>> an
>>>> earlier lower priority one, but eventually the lower priority
>>>> will
>>>> get its
>>>> turn even if high priority is constantly feeding new work.
>>>
>>> So, as you're aware of, this is a major change in behavior. FIFO's
>>> purpose actually is to be unfair, and my understanding has always
>>> been
>>> that it is on purpose that the higher priority will with absolute
>>> certainty take precedence.
>>>
>>> Reason being that on the high priority things like configuring
>>> memory /
>>> mappings are done, which you want to be prioritized.
>>
>> Right. For the kernel priority for instance I could make them get a
>> very
>> early deadline ensuring they still run first.
> 
> That definitely sounds reasonable to me.
> I saw that you already gave the kernel quite a low deadline value.
> 
>>
>>> IOW in which scenario would you want the low priorities to be able
>>> to
>>> overtake the higher ones?
>>
>> I would say always. I don't see it as overtaking but avoiding
>> complete
>> starvation. In the CPU world if you run:
>>
>> $ game & nice computation
>>
>> You don't expect the computation to get zero CPU time while the game
>> is
>> running.
> 
> I expect exactly that *if* game is scheduled with SCHED_FIFO :)

:))

> That's why the process scheduler also has SCHED_DEADLINE since a few
> years, to address basically exactly the problem you're addressing he >
>> Although I am not saying with the current DRM scheduler it is
>> guaranteed
>> to get zero GPU time. It will still get scheduled in cases when the
>> priority run queues happen to be temporarily empty. But if someone
>> would
>> be submitting work very efficiently low priority would never run.
>>
>> Deadline in its current form is not perfect or immune to all
>> submission
>> patterns either, which is why this is RFC.
> 
> Will have to think about that, thx.
> 
> I'd definitely be more interested in why the priority levels were
> exposed to userspace and what applications most typically do with them.

EGL_IMG_context_priority and VK_KHR_global_priority. But both are just 
hints and definitely do not prescribe or require SCHED_FIFO like behaviour.

> As you're describing it it sounds as if they're not intending to use it
> like in the classic process scheduler with SCHED_FIFO, but that they
> are more on the default (SCHED_OTHER) and are trying to set the
> *niceness*

Yes exactly. I don't think DRM scheduler _needs_ to be like SCHED_FIFO. 
More like SCHED_OTHER would I think work better if we were to (finally) 
expose some external control (see 
https://blogs.igalia.com/tursulin/drm-scheduling-cgroup-controller/ for 
one related example).

Regards,

Tvrtko
