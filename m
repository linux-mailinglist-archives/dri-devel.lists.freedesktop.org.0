Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B750CA7B9E9
	for <lists+dri-devel@lfdr.de>; Fri,  4 Apr 2025 11:27:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFC9010EB9B;
	Fri,  4 Apr 2025 09:27:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="IV3Z5F0w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88C3710EB9C;
 Fri,  4 Apr 2025 09:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8WQntQT5S1Y64ZNsp1wMA1VIX7q1/cGMWOmE9XAgcww=; b=IV3Z5F0wdpjRuJlcFigTwub2au
 gAWExtMJkDw2wBptMHtDt103xO3pTmz2AAol6zi2cPc2KZzVLcEsPq5um5STDl2ONhNDkEXsFiCyV
 zo5K5SzVtx+hbMvxzMMzJknf9LVKA2KOrb6X4gEeugNwmFEUigfux8uWCMsCy+d6ws+2TSlb/RhAr
 103SYO96CbkNw6pirPP3MXp/T/j9pfPmgph4Eo4JwMqLpdHvPRVse9R64o3TqZoPK9Q8InrDahF8z
 NzMlK2YBEvT4jhaulSYvrtDYl3s0omDeT6nT8486UB7mMkp/jYOtC+uRMLeJ9kVzyeLzsG1BZXWDk
 B8WL7ATg==;
Received: from [90.241.98.187] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1u0dKY-00BI7j-Nv; Fri, 04 Apr 2025 11:27:18 +0200
Message-ID: <1ec3512d-6a41-4fef-9bf1-da31adc115b5@igalia.com>
Date: Fri, 4 Apr 2025 10:27:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v3 06/14] drm/sched: Implement RR via FIFO
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>,
 phasta@kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>
References: <20250331201705.60663-1-tvrtko.ursulin@igalia.com>
 <20250331201705.60663-7-tvrtko.ursulin@igalia.com>
 <e4594adff1606e6a92714bbcad5838c3f100acdf.camel@mailbox.org>
 <264be6a0-b9be-4430-9de4-276456e34214@mailbox.org>
 <58b680faeeeea1c317b43a34c71d978efe72009d.camel@mailbox.org>
 <3bdd9d9a-e019-4469-a90b-92d105c67427@mailbox.org>
 <84f1d69b-039b-4098-b0cd-33e0b92b048a@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <84f1d69b-039b-4098-b0cd-33e0b92b048a@amd.com>
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


On 02/04/2025 14:37, Christian König wrote:
> Am 02.04.25 um 15:22 schrieb Michel Dänzer:
>> On 2025-04-02 14:00, Philipp Stanner wrote:
>>> On Wed, 2025-04-02 at 12:58 +0200, Michel Dänzer wrote:
>>>> On 2025-04-02 12:46, Philipp Stanner wrote:
>>>>> On Mon, 2025-03-31 at 21:16 +0100, Tvrtko Ursulin wrote:
>>>>>> Round-robin being the non-default policy and unclear how much it
>>>>>> is
>>>>>> used,
>>>>>> we can notice that it can be implemented using the FIFO data
>>>>>> structures if
>>>>>> we only invent a fake submit timestamp which is monotonically
>>>>>> increasing
>>>>>> inside drm_sched_rq instances.
>>>>>>
>>>>>> So instead of remembering which was the last entity the scheduler
>>>>>> worker
>>>>>> picked, we can bump the picked one to the bottom of the tree,
>>>>>> achieving
>>>>>> the same round-robin behaviour.
>>>>>>
>>>>>> Advantage is that we can consolidate to a single code path and
>>>>>> remove
>>>>>> a
>>>>>> bunch of code. Downside is round-robin mode now needs to lock on
>>>>>> the
>>>>>> job
>>>>>> pop path but that should not be visible.
>>>>> Why did you decide to do it that way and then later remove RR &
>>>>> FIFO
>>>>> alltogether in patch 10, basically?
>>>>>
>>>>> I think the far cleaner way for our development-process would be a
>>>>> separate patch(-series) that *removes* RR completely. Advantages
>>>>> are:
>>>>>
>>>>>     1. It should be relatively easy to do
>>>>>     2. It would simplify the existing code base independently of
>>>>> what
>>>>>        happens with your RFC series here
>>>>>     3. Before changing everyone's scheduling policy to a completely
>>>>> new,
>>>>>        deadline-based one, we could first be sure for a few release
>>>>>        cycles that everyone is now on FIFO, establishing common
>>>>> ground.
>>>>>     4. We could CC every- and anyone who might use RR or might know
>>>>>        someone who does
>>>>>     5. If it turns out we screwed up and someone really relies on
>>>>> RR, it
>>>>>        would be easy to revert.
>>>>>
>>>>> I am not aware of any RR users and have, in past discussions, never
>>>>> heard of any. So removing it is more tempting for the above
>>>>> reasons.
>>>> https://gitlab.freedesktop.org/drm/amd/-/issues/2516 has a bunch of
>>>> RR users...
>>> Right, there's a number of people complaining about the regression. But
>>> what I'm interested in is: how did it evolve since then. Are there
>>> distributions who set the module parameter? Does Steam do it? Or is it
>>> individual users who work around the problem that way?
>> I know only of the latter.
>>> https://gitlab.freedesktop.org/drm/amd/-/issues/2516#note_2679509
> 
> Tvrtko, you should probably prepare a branch on fdo and let the people 
> on that bug report test it.

If people are interested to test I have two branches. This qddl approach:

https://gitlab.freedesktop.org/tursulin/kernel/-/commits/drm-sched-deadline?ref_type=heads

And a very early CFS-like experiment:

https://gitlab.freedesktop.org/tursulin/kernel/-/commits/drm-sched-cfs?ref_type=heads

I would certainly be very interested to get feedback.

>>> ^ this comment for example seems to indicate that on newer Wayland
>>> versions part of the problem has vanished?
>> That's about using the Wine wayland driver (which uses the Wayland protocol directly) instead of the x11 driver (which uses the X11 protocol via Xwayland). Xwayland not being involved can avoid at least some of the issues (in particular, the scenario I described inhttps://gitlab.freedesktop.org/drm/amd/-/issues/2516#note_2119750 can't happen then). That doesn't solve the issues when Xwayland is involved though, just avoids them.
>>
> 
>  From what I remember the bug condition is that the display server 
> submits works after the client has started rendering the next frame. 
> With RR that resulted in the display servers work to be picked first 
> while with FIFO the clients works would be picked first.
> 
> Arguable that RR picked the display server was just coincident while 
> with Tvrtko's work the fair queuing should make that perfectly intentional.
> 
> So this patch set here should (in theory) help a lot with that bug 
> report and finally make RR superfluous.

Disclaimer that it is way too generous to call what I made fair. It may 
help with the above described case *if* the client has queue depth > 1, 
which would then push out its deadline a bit further out so display 
server could beat it even if submitted later. But it also may need 
refining to account for currently executing jobs as the queue-depth too 
(currently it does not). And also to perhaps base the deadline buckets 
on some dynamically adjusting runtime measure rather than hardcoding them.

Regards,

Tvrtko

