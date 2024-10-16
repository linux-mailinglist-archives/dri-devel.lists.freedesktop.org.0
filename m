Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 127F59A02D8
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2024 09:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DEC810E6A8;
	Wed, 16 Oct 2024 07:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="cxQ39J/J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE1310E6A4
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2024 07:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qeHza77mGlwARQ8xN9RR0YFV0a58PqCev0MNO21raUs=; b=cxQ39J/J1bbNrgtSk7pacgj6Gu
 I4FA2QUuCnBGVwSk3SAm/6KLaVWA8uiU7GBIQ0V1KSJYFkh2Q+2oMQqaJYKwpPsarmIvgXk/YMeh2
 vxULAZWb0gU0UAArNmduoDLchwg4BZjac/Drl6HgcsLoDKHZDEPJz/jLfbaWoqh6tZiTgELCLnLTr
 coFHHFlQF1NQCDI318un5MbZYTvixt9ytJxNi6Otijp+PA8BZrOhUKAD8mw6gC1pIHwNTVzssJ5bB
 1SMwPFPmwQc89Wwd/b7wqc9GtiEg4s60I9z1svFIQ0C9IvgA2OkPgjPkQUEnjiTDAHUy8S6pUCdeQ
 lE9FrWcg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t0yes-00AddO-EE; Wed, 16 Oct 2024 09:41:26 +0200
Message-ID: <8816667f-a272-4ef9-87f0-880c47476a9f@igalia.com>
Date: Wed, 16 Oct 2024 08:41:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/sched: Optimise drm_sched_entity_push_job
To: Philipp Stanner <pstanner@redhat.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
References: <20241014104637.83209-1-tursulin@igalia.com>
 <20241014104637.83209-2-tursulin@igalia.com>
 <0df6b855b0974a88a3f6af42108e2596bd285898.camel@redhat.com>
 <8c038f91-716c-4a3d-8c70-10859d28d77f@igalia.com>
 <587ac0260e9c843ccd0e7d449fc6b6c9270ec741.camel@redhat.com>
 <a3cb9eba-a13e-4f56-8e81-7a06eb655e3b@igalia.com>
 <33ebe52c5df76611451685261f046d77efc44134.camel@redhat.com>
 <18e9dd02-2cdd-42a2-9e7f-271c685d9f93@igalia.com>
 <9b9378581aa75fc39117a03a573199920c832b31.camel@redhat.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <9b9378581aa75fc39117a03a573199920c832b31.camel@redhat.com>
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


On 15/10/2024 15:00, Philipp Stanner wrote:
> On Tue, 2024-10-15 at 14:14 +0100, Tvrtko Ursulin wrote:
>>
>> On 15/10/2024 12:38, Philipp Stanner wrote:
>>> On Tue, 2024-10-15 at 09:12 +0100, Tvrtko Ursulin wrote:
>>>>
>>>> On 15/10/2024 08:11, Philipp Stanner wrote:
>>>>> On Mon, 2024-10-14 at 13:07 +0100, Tvrtko Ursulin wrote:
>>>>>>
>>>>>> On 14/10/2024 12:32, Philipp Stanner wrote:
>>>>>>> Hi,
>>>>>>>
>>>>>>> On Mon, 2024-10-14 at 11:46 +0100, Tvrtko Ursulin wrote:
>>>>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>>>>
>>>>>>>> In FIFO mode We can avoid dropping the lock only to
>>>>>>>> immediately
>>>>>>>> re-
>>>>>>>> acquire
>>>>>>>> by adding a new drm_sched_rq_update_fifo_locked() helper.
>>>>>>>>
>>>>>>>
>>>>>>> Please write detailed commit messages, as described here
>>>>>>> [1].
>>>>>>>        1. Describe the problem: current state and why it's
>>>>>>> bad.
>>>>>>>        2. Then, describe in imperative (present tense) form
>>>>>>> what
>>>>>>> the
>>>>>>> commit
>>>>>>>           does about the problem.
>>>>>>
>>>>>> Both pieces of info are already there:
>>>>>>
>>>>>> 1. Drops the lock to immediately re-acquire it.
>>>>>> 2. We avoid that by by adding a locked helper.
>>>>>>> Optionally, in between can be information about why it's
>>>>>>> solved
>>>>>>> this
>>>>>>> way and not another etc.
>>>>>>>
>>>>>>> Applies to the other patches, too.
>>>>>>>
>>>>>>>
>>>>>>> [1]
>>>>>>> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
>>>>>>
>>>>>> Thanks I am new here and did not know this.
>>>>>>
>>>>>> Seriosuly, lets not be too blindly strict about this because
>>>>>> it
>>>>>> can
>>>>>> get
>>>>>> IMO ridiculous.
>>>>>>
>>>>>> One example when I previously accomodated your request is
>>>>>> patch
>>>>>> 3/5
>>>>>> from
>>>>>> this series:
>>>>>>
>>>>>> """
>>>>>> Current kerneldoc for struct drm_sched_rq incompletely
>>>>>> documents
>>>>>> what
>>>>>> fields are protected by the lock.
>>>>>>
>>>>>> This is not good because it is misleading.
>>>>>>
>>>>>> Lets fix it by listing all the elements which are protected
>>>>>> by
>>>>>> the
>>>>>> lock.
>>>>>> """
>>>>>>
>>>>>> While this was the original commit text you weren't happy
>>>>>> with:
>>>>>>
>>>>>> """
>>>>>> drm/sched: Re-order struct drm_sched_rq members for clarity
>>>>>>
>>>>>> Lets re-order the members to make it clear which are
>>>>>> protected by
>>>>>> the
>>>>>> lock
>>>>>> and at the same time document it via kerneldoc.
>>>>>> """
>>>>>>
>>>>>> I maintain the original text was passable.
>>>>>>
>>>>>> On top, this was just a respin to accomodate the merge
>>>>>> process.
>>>>>> All
>>>>>> approvals were done and dusted couple weeks or so ago so
>>>>>> asking
>>>>>> for
>>>>>> yet
>>>>>> another respin for such trivial objections is not great.
>>>>>
>>>>> I understand that you're unhappy, but please understand the
>>>>> position
>>>>> I'm coming from. As you know, since you sent these patches
>>>>> within a
>>>>> different series (and, thus, since I reviewed them), I was
>>>>> trusted
>>>>> with
>>>>> co-maintaining this piece of shared infrastructure.
>>>>>
>>>>> And since you've worked on it a bit now, I suppose you also
>>>>> know
>>>>> that
>>>>> the GPU Scheduler is arguably in quite a bad shape, has far too
>>>>> little
>>>>> documentation, has leaks, maybe race conditions, parts *where
>>>>> the
>>>>> locking rules are unclear* and is probably only fully
>>>>> understood by
>>>>> a
>>>>> small hand full of people. I also argue that this is a *very*
>>>>> complicated piece of software.
>>>>
>>>> We already went over that and agreed. Not least I agreed the base
>>>> is
>>>> shaky since few years  ago. :)
>>>>
>>>> Btw if things align, I hope you will at some point see a follow
>>>> up
>>>> series from me which makes some significant simplifications and
>>>> improvements at the same time.
>>>
>>> Cool, good to hear!
>>> (Would be even cooler if simplifications and improvements can be
>>> delivered through separate patch series to be easier to review
>>> etc.)
>>
>> Yes, when I spot something I pull it ahead and/or standalone when it
>> makes sense. But it is early days and a big job.
>>
>>>>> So I might be or appear to be a bit pedantic, but I'm not doing
>>>>> that to
>>>>> terrorize you, but because I want this thing to become well
>>>>> documented,
>>>>> understandable, and bisectable. Working towards a canonical,
>>>>> idiot-
>>>>> proof commit style is one measure that will help with that.
>>>>>
>>>>> I want to offer you the following: I can be more relaxed with
>>>>> things
>>>>> universally recognized as trivial (comment changes, struct
>>>>> member
>>>>> reordering) – but when something like a lock is touched in any
>>>>> way,
>>>>> we
>>>>> shall document that in the commit message as canonically as
>>>>> possible,
>>>>> so someone who's less experienced and just bisected the commit
>>>>> immediately understands what has been done (or rather: was
>>>>> supposed
>>>>> to
>>>>> be done).
>>>>
>>>> So how would you suggest to expand this commit text so it doesn't
>>>> read
>>>> too self-repeating?
>>>
>>> My issue with this particular commit message is mainly that it
>>> doesn't
>>> make it obvious what the patch is supposed to do. So one can make
>>> it
>>> quicker and better to review by detailing it a bit more, so the
>>> reviewer then can compare commit message vs. what the code does. It
>>> seems to me for example that the actual optimization is being done
>>> in
>>> drm_sched_entity_push_job(), and drm_sched_entity_pop_job() had to
>>> be
>>> ported, too, for correctness
>>
>> "It seems" aka the commit title says so. ;)
>>
>>> Another small thing that might be cool is something that makes it a
>>> bit
>>> more obvious that this is an optimization, not a fix.
>>>
>>> So I would probably write:
>>>
>>> "So far, drm_sched_rq_update_fifo() automatically takes
>>> drm_sched_entity.rq_lock. For DRM_SCHED_POLICY_FIFO, this is
>>> inefficient because that lock is then taken, released and retaken
>>> in
>>> drm_sched_entity_push_job().
>>>
>>> Improve performance by moving the locking out of
>>> drm_sched_rq_update_fifo()."
>>>
>>> Not that much longer but makes it far more obvious what shall be
>>> achieved where :]
>>
>> How about this:
>>
>> """
>> In FIFO mode (which is the default), both drm_sched_entity_push_job()
>> and drm_sched_rq_update_fifo(), where the latter calls the former,
>> are
>> currently taking and releasing the same entity->rq_lock.
>>
>> We can avoid that design inelegance, and also have a miniscule
>> efficiency improvement on the idle submit path, by introducing a new
>> drm_sched_rq_update_fifo_locked() helper and pulling up the lock
>> taking
>> to its callers.
>> """
> 
> That looks good to me

Cool. So this for 1/5, your text and some tweaks for 4/5, anything else 
or I can respin with that?

Regards,

Tvrtko

> 
> P.
> 
> 
>>
>>> (Let me read through the other patches briefly. Then we should be
>>> good
>>> with v2 of this series.. or would it be v3 then?)
>>
>> Depends how you count. By unique series titles or by fundamental
>> content.
>>
>> Regards,
>>
>> Tvrtko
>>
> 
