Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E276D77D5
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 11:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5134D10E89F;
	Wed,  5 Apr 2023 09:11:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 245F910E89E;
 Wed,  5 Apr 2023 09:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680685875; x=1712221875;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=g/j1mtR8YOaIbR1DwRmdRxf3+m7WP0g1fLqVVG9iLNM=;
 b=cNByC2Qh3ZuLOkSvjZlnYJojCx+j04M0bxrjSPkVsQQfLoEGreufnd8w
 mD3wmjqk2roXWu812JuUTZ3kvSwAPLzRQwEXQZ47yzmVDIbXZSKJ6J48p
 DmIq8HCkdCdV7wq0Bu0fBz4IDvXIOEtbyY2V2RvvlOE4BpX5zVBEpDtgY
 jluJ2e7rgg5QgtP3jgA6spcW0OcK4sZkoYark6mXcW8KUiIeXGhjuLVwU
 ACkqBp+p1ZCIrC1AcytbYDUotz5nzZt8yebaz2aujtJzn2K12Th3eqE8+
 QqMy1cnVBntHN69VhnT+Keldm6328zpp8zGQrKvoewn4VVeHXkH8q1Uax g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="407482310"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="407482310"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 02:11:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="860900361"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; d="scan'208";a="860900361"
Received: from rcpalaku-mobl1.ger.corp.intel.com (HELO [10.213.226.223])
 ([10.213.226.223])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2023 02:10:56 -0700
Message-ID: <1cdd1c32-f56c-93f3-4e72-51a8782f7b34@linux.intel.com>
Date: Wed, 5 Apr 2023 10:10:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: fdinfo blew up? (Was: [RFC PATCH 0/4] uapi, drm: Add and implement
 RLIMIT_GPUPRIO)
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <20230403194058.25958-1-joshua@froggi.es>
 <fa0360e4-b845-92ee-3c6d-a593cc4135b5@linux.intel.com>
 <CAKMK7uE7iFJL4_3GD2Vx4g99rJ2tQoLLsFA9GmYw_CBf1VB1Rw@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAKMK7uE7iFJL4_3GD2Vx4g99rJ2tQoLLsFA9GmYw_CBf1VB1Rw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: Matthew Brost <matthew.brost@intel.com>, Asahi Lina <lina@asahilina.net>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Danilo Krummrich <dakr@redhat.com>, Qiang Yu <yuq825@gmail.com>,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 05/04/2023 09:28, Daniel Vetter wrote:
> On Tue, 4 Apr 2023 at 12:45, Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> Hi,
>>
>> On 03/04/2023 20:40, Joshua Ashton wrote:
>>> Hello all!
>>>
>>> I would like to propose a new API for allowing processes to control
>>> the priority of GPU queues similar to RLIMIT_NICE/RLIMIT_RTPRIO.
>>>
>>> The main reason for this is for compositors such as Gamescope and
>>> SteamVR vrcompositor to be able to create realtime async compute
>>> queues on AMD without the need of CAP_SYS_NICE.
>>>
>>> The current situation is bad for a few reasons, one being that in order
>>> to setcap the executable, typically one must run as root which involves
>>> a pretty high privelage escalation in order to achieve one
>>> small feat, a realtime async compute queue queue for VR or a compositor.
>>> The executable cannot be setcap'ed inside a
>>> container nor can the setcap'ed executable be run in a container with
>>> NO_NEW_PRIVS.
>>>
>>> I go into more detail in the description in
>>> `uapi: Add RLIMIT_GPUPRIO`.
>>>
>>> My initial proposal here is to add a new RLIMIT, `RLIMIT_GPUPRIO`,
>>> which seems to make most initial sense to me to solve the problem.
>>>
>>> I am definitely not set that this is the best formulation however
>>> or if this should be linked to DRM (in terms of it's scheduler
>>> priority enum/definitions) in any way and and would really like other
>>> people's opinions across the stack on this.
>>>
>>> Once initial concern is that potentially this RLIMIT could out-live
>>> the lifespan of DRM. It sounds crazy saying it right now, something
>>> that definitely popped into my mind when touching `resource.h`. :-)
>>>
>>> Anyway, please let me know what you think!
>>> Definitely open to any feedback and advice you may have. :D
>>
>> Interesting! I tried to solved the similar problem two times in the past already.
>>
>> First time I was proposing to tie nice to DRM scheduling priority [1] - if the latter has been left at default - drawing the analogy with the nice+ionice handling. That was rejected and I was nudged towards the cgroups route.
>>
>> So with that second attempt I implemented a hierarchical opaque drm.priority cgroup controller [2]. I think it would allow you to solve your use case too by placing your compositor in a cgroup with an elevated priority level.
>>
>> Implementation wise in my proposal it was left to individual drivers to "meld" the opaque cgroup drm.priority with the driver specific priority concept.
>>
>> That too wasn't too popular with the feedback (AFAIR) that the priority is a too subsystem specific concept.
>>
>> Finally I was left with a weight based drm cgroup controller, exactly following the controls of the CPU and IO ones, but with much looser runtime guarantees. [3]
>>
>> I don't think this last one works for your use case, at least not at the current state for drm scheduling capability, where the implementation is a "bit" too reactive for realtime.
>>
>> Depending on how the discussion around your rlimit proposal goes, perhaps one alternative could be to go the cgroup route and add an attribute like drm.realtime. That perhaps sounds abstract and generic enough to be passable. Built as a simplification of [2] it wouldn't be too complicated.
>>
>> On the actual proposal of RLIMIT_GPUPRIO...
>>
>> The name would be problematic since we have generic hw accelerators (not just GPUs) under the DRM subsystem. Perhaps RLIMIT_DRMPRIO would be better but I think you will need to copy some more mailing lists and people on that one. Because I can imagine one or two more fundamental questions this opens up, as you have eluded in your cover letter as well.
> 
> So I don't want to get into the bikeshed, I think Tvrtko summarized
> pretty well that this is a hard problem with lots of attempts (I think
> some more from amd too). I think what we need are two pieces here
> really:
> - A solid summary of all the previous attempts from everyone in this
> space of trying to manage gpu compute resources (all the various
> cgroup attempts, sched priority), listening the pros/cons. There's
> also the fdinfo stuff just for reporting gpu usage which blew up kinda
> badly and didn't have much discussion among all the stakeholders.
> - Everyone on cc who's doing new drivers using drm/sched (which I
> think is everyone really, or using that currently. So that's like
> etnaviv, lima, amd, intel with the new xe, probably new nouveau driver
> too, amd ofc, panfrost, asahi. Please cc everyone.
> 
> Unless we do have some actual rough consens in this space across all
> stakeholders I think all we'll achieve is just yet another rfc that
> goes nowhere. Or maybe something like the minimal fdinfo stuff
> (minimal I guess to avoid wider discussion) which then blew up because
> it wasn't thought out well enough.

On the particular point how fdinfo allegedly blew up - are you referring 
to client usage stats? If so this would be the first time I hear about 
any problems in that space. Which would be "a bit" surprising given it's 
the thing I drove standardisation of. All I heard were positive 
comments. Both "works for us" from driver implementors and positives 
from the users.

Regards,

Tvrtko
