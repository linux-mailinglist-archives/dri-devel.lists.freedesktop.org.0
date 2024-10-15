Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D736A99E089
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 10:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AE6310E533;
	Tue, 15 Oct 2024 08:12:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="EXPwX8tR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3745B10E533
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2024 08:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FWx8OCj6anZzATGuGVy9lYL8DgbKGPaY6Y2rg7OTtm8=; b=EXPwX8tRpIBhlvlBPc0A6SyI0f
 nGc+besWGooB0Yl5mtF5nLbRmgNgz5KnVJDRvN/89KqvKj2D0JSG4bx7sgm8be+uycFZhhaGIVfZF
 TKPAT+nfraePgbEnkpQ8A9DLbIcGTOBHFXYYvYnRsS8NXdFrN/mGDENN6dj460z/Xhk3uiH8O9eIg
 qeti9ewu0/ZugpflWrMDf8bW3mCw3Itf6i8XgIg9843M009fHgtLv8QpU9166qG6OJrlTv3x2mOWU
 AOuN5g8Bm/Oz9n9wBPuuGXIfGMoz7s05hMRyxzqdgbVw/boSfVrJhEteyMA4c3zQAzvZqMcKFe/Uy
 xSZA2tnw==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1t0cfa-00A7Ma-T3; Tue, 15 Oct 2024 10:12:42 +0200
Message-ID: <a3cb9eba-a13e-4f56-8e81-7a06eb655e3b@igalia.com>
Date: Tue, 15 Oct 2024 09:12:41 +0100
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
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <587ac0260e9c843ccd0e7d449fc6b6c9270ec741.camel@redhat.com>
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


On 15/10/2024 08:11, Philipp Stanner wrote:
> On Mon, 2024-10-14 at 13:07 +0100, Tvrtko Ursulin wrote:
>>
>> On 14/10/2024 12:32, Philipp Stanner wrote:
>>> Hi,
>>>
>>> On Mon, 2024-10-14 at 11:46 +0100, Tvrtko Ursulin wrote:
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>
>>>> In FIFO mode We can avoid dropping the lock only to immediately
>>>> re-
>>>> acquire
>>>> by adding a new drm_sched_rq_update_fifo_locked() helper.
>>>>
>>>
>>> Please write detailed commit messages, as described here [1].
>>>      1. Describe the problem: current state and why it's bad.
>>>      2. Then, describe in imperative (present tense) form what the
>>> commit
>>>         does about the problem.
>>
>> Both pieces of info are already there:
>>
>> 1. Drops the lock to immediately re-acquire it.
>> 2. We avoid that by by adding a locked helper.
>>> Optionally, in between can be information about why it's solved
>>> this
>>> way and not another etc.
>>>
>>> Applies to the other patches, too.
>>>
>>>
>>> [1]
>>> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes
>>
>> Thanks I am new here and did not know this.
>>
>> Seriosuly, lets not be too blindly strict about this because it can
>> get
>> IMO ridiculous.
>>
>> One example when I previously accomodated your request is patch 3/5
>> from
>> this series:
>>
>> """
>> Current kerneldoc for struct drm_sched_rq incompletely documents what
>> fields are protected by the lock.
>>
>> This is not good because it is misleading.
>>
>> Lets fix it by listing all the elements which are protected by the
>> lock.
>> """
>>
>> While this was the original commit text you weren't happy with:
>>
>> """
>> drm/sched: Re-order struct drm_sched_rq members for clarity
>>
>> Lets re-order the members to make it clear which are protected by the
>> lock
>> and at the same time document it via kerneldoc.
>> """
>>
>> I maintain the original text was passable.
>>
>> On top, this was just a respin to accomodate the merge process. All
>> approvals were done and dusted couple weeks or so ago so asking for
>> yet
>> another respin for such trivial objections is not great.
> 
> I understand that you're unhappy, but please understand the position
> I'm coming from. As you know, since you sent these patches within a
> different series (and, thus, since I reviewed them), I was trusted with
> co-maintaining this piece of shared infrastructure.
> 
> And since you've worked on it a bit now, I suppose you also know that
> the GPU Scheduler is arguably in quite a bad shape, has far too little
> documentation, has leaks, maybe race conditions, parts *where the
> locking rules are unclear* and is probably only fully understood by a
> small hand full of people. I also argue that this is a *very*
> complicated piece of software.

We already went over that and agreed. Not least I agreed the base is 
shaky since few years  ago. :)

Btw if things align, I hope you will at some point see a follow up 
series from me which makes some significant simplifications and 
improvements at the same time.
> So I might be or appear to be a bit pedantic, but I'm not doing that to
> terrorize you, but because I want this thing to become well documented,
> understandable, and bisectable. Working towards a canonical, idiot-
> proof commit style is one measure that will help with that.
> 
> I want to offer you the following: I can be more relaxed with things
> universally recognized as trivial (comment changes, struct member
> reordering) – but when something like a lock is touched in any way, we
> shall document that in the commit message as canonically as possible,
> so someone who's less experienced and just bisected the commit
> immediately understands what has been done (or rather: was supposed to
> be done).

So how would you suggest to expand this commit text so it doesn't read 
too self-repeating?

Regards,

Tvrtko
