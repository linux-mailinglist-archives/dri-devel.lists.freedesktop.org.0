Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F38696BCC5
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 14:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68C8B10E7A1;
	Wed,  4 Sep 2024 12:46:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6645610E79F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2024 12:46:17 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1B893FEC;
 Wed,  4 Sep 2024 05:46:43 -0700 (PDT)
Received: from [10.57.75.163] (unknown [10.57.75.163])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E7EEE3F73B;
 Wed,  4 Sep 2024 05:46:13 -0700 (PDT)
Message-ID: <298d0516-3b92-47e9-ad54-185de97561ee@arm.com>
Date: Wed, 4 Sep 2024 13:46:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/10] drm/panthor: Add user submission
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Mihail Atanassov <mihail.atanassov@arm.com>,
 linux-kernel@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>,
 Shashank Sharma <shashank.sharma@amd.com>,
 Ketil Johnsen <ketil.johnsen@arm.com>, Akash Goel <akash.goel@arm.com>
References: <20240828172605.19176-1-mihail.atanassov@arm.com>
 <c64be651-2f40-4535-a537-b8304e6556ce@amd.com>
 <a3e78bf7-931e-4e49-8933-c3df9a503ffd@arm.com>
 <96ef7ae3-4df1-4859-8672-453055bbfe96@amd.com>
 <Ztd7g4Q8V9lFZ53R@phenom.ffwll.local>
 <090ae980-a944-4c00-a26e-d95434414417@amd.com>
 <80ffea9b-63a6-4ae2-8a32-2db051bd7f28@arm.com>
 <20240904132308.7664902e@collabora.com>
 <a5a53492-9651-403e-b613-91ef0b9e80b6@amd.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <a5a53492-9651-403e-b613-91ef0b9e80b6@amd.com>
Content-Type: text/plain; charset=UTF-8
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

On 04/09/2024 12:34, Christian König wrote:
> Hi Boris,
> 
> Am 04.09.24 um 13:23 schrieb Boris Brezillon:
>>>>>> Please read up here on why that stuff isn't allowed:
>>>>>> https://www.kernel.org/doc/html/latest/driver-api/dma-buf.html#indefinite-dma-fences  
>>>>> panthor doesn't yet have a shrinker, so all memory is pinned, which means
>>>>> memory management easy mode.  
>>>> Ok, that at least makes things work for the moment.  
>>> Ah, perhaps this should have been spelt out more clearly ;)
>>>
>>> The VM_BIND mechanism that's already in place jumps through some hoops
>>> to ensure that memory is preallocated when the memory operations are
>>> enqueued. So any memory required should have been allocated before any
>>> sync object is returned. We're aware of the issue with memory
>>> allocations on the signalling path and trying to ensure that we don't
>>> have that.
>>>
>>> I'm hoping that we don't need a shrinker which deals with (active) GPU
>>> memory with our design.
>> That's actually what we were planning to do: the panthor shrinker was
>> about to rely on fences attached to GEM objects to know if it can
>> reclaim the memory. This design relies on each job attaching its fence
>> to the GEM mapped to the VM at the time the job is submitted, such that
>> memory that's in-use or about-to-be-used doesn't vanish before the GPU
>> is done.

How progressed is this shrinker? It would be good to have an RFC so that
we can look to see how user submission could fit in with it.

> Yeah and exactly that doesn't work any more when you are using user
> queues, because the kernel has no opportunity to attach a fence for each
> submission.

User submission requires a cooperating user space[1]. So obviously user
space would need to ensure any BOs that it expects will be accessed to
be in some way pinned. Since the expectation of user space submission is
that we're reducing kernel involvement, I'd also expect these to be
fairly long-term pins.

[1] Obviously with a timer to kill things from a malicious user space.

The (closed) 'kbase' driver has a shrinker but is only used on a subset
of memory and it's up to user space to ensure that it keeps the relevant
parts pinned (or more specifically not marking them to be discarded if
there's memory pressure). Not that I think we should be taking it's
model as a reference here.

>>> Memory which user space thinks the GPU might
>>> need should be pinned before the GPU work is submitted. APIs which
>>> require any form of 'paging in' of data would need to be implemented by
>>> the GPU work completing and being resubmitted by user space after the
>>> memory changes (i.e. there could be a DMA fence pending on the GPU work).
>> Hard pinning memory could work (ioctl() around gem_pin/unpin()), but
>> that means we can't really transparently swap out GPU memory, or we
>> have to constantly pin/unpin around each job, which means even more
>> ioctl()s than we have now. Another option would be to add the XGS fence
>> to the BOs attached to the VM, assuming it's created before the job
>> submission itself, but you're no longer reducing the number of user <->
>> kernel round trips if you do that, because you now have to create an
>> XSG job for each submission, so you basically get back to one ioctl()
>> per submission.

As you say the granularity of pinning has to be fairly coarse for user
space submission to make sense. My assumption (could be wildly wrong)
was that most memory would be pinned whenever a context is rendering.

> For AMDGPU we are currently working on the following solution with
> memory management and user queues:
> 
> 1. User queues are created through an kernel IOCTL, submissions work by
> writing into a ring buffer and ringing a doorbell.
> 
> 2. Each queue can request the kernel to create fences for the currently
> pushed work for a queues which can then be attached to BOs, syncobjs,
> syncfiles etc...
> 
> 3. Additional to that we have and eviction/preemption fence attached to
> all BOs, page tables, whatever resources we need.
> 
> 4. When this eviction fences are requested to signal they first wait for
> all submission fences and then suspend the user queues and block
> creating new submission fences until the queues are restarted again.
> 
> This way you can still do your memory management inside the kernel (e.g.
> move BOs from local to system memory) or even completely suspend and
> resume applications without their interaction, but as Sima said it is
> just horrible complicated to get right.
> 
> We have been working on this for like two years now and it still could
> be that we missed something since it is not in production testing yet.

I'm not entirely sure I follow how this doesn't create a dependency
cycle. From your description it sounds like you create a fence from the
user space queue which is then used to prevent eviction of the BOs needed.

So to me it sounds like:

1. Attach fence to BOs to prevent eviction.

2. User space submits work to the ring buffer, rings doorbell.

3. Call into the kernel to create the fence for step 1.

Which is obviously broken. What am I missing?

One other thing to note is that Mali doesn't have local memory - so the
only benefit of unpinning is if we want to swap to disk (or zram etc).

Steve

