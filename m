Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B43534FE5
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 15:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44BB310F34F;
	Thu, 26 May 2022 13:29:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3312E10F34F;
 Thu, 26 May 2022 13:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653571771; x=1685107771;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=CDg+TGx7gGRdWVAZ8Gvb9aIHZ73vJ+er6cK1qLaQP4E=;
 b=XQHfOv22o/Q5qLrIVQbXGST8esK95iLchxgrM50O4J4p6tyfvNDzphbX
 ptSecML8khhaEcmNZcMef2Ugq3/dVqBrZEKMclayhIc88W9ouSVQu17O9
 syxpXKg9YQ/OMm0XSJBWkyvVhmE/Hxu3sbQlmquJQ32b2ijz7J8BkE3jg
 QX3MP9YSTDs9pULukthP4x4pP4MpMd20milD2Eg6O5WiWd71548HiB9qf
 Cxh0vSiU5LfF4AGTpHpsf5QWNUHH5DVLi76j8qiNTIwpfbnx6+K4LYClp
 D58mypz05xFHbAjWI08ifbZtshRgNzbjEGabWBbuLSghNHLJkPQykkgXR w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10358"; a="256221169"
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="256221169"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 06:29:29 -0700
X-IronPort-AV: E=Sophos;i="5.91,252,1647327600"; d="scan'208";a="664938350"
Received: from tkinch-mobl.ger.corp.intel.com (HELO [10.213.214.182])
 ([10.213.214.182])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2022 06:29:26 -0700
Message-ID: <d15cccd3-4b77-992e-23f7-0c4808592a9f@linux.intel.com>
Date: Thu, 26 May 2022 14:29:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 12/13] drm/msm: Utilize gpu scheduler priorities
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20210728010632.2633470-1-robdclark@gmail.com>
 <20210728010632.2633470-13-robdclark@gmail.com>
 <84e03c5f-a3af-6592-d19a-a2f5d20b92fb@linux.intel.com>
 <CAJs_Fx6Nc337LPNh=p2GT2d2yDTdLWH934o4Cof3urDGhUJB6A@mail.gmail.com>
 <904ae104-1c30-d130-129f-ccae381261d5@linux.intel.com>
 <CAF6AEGuVhXuX63Od+kcJ0QtfAZ2-wqZsN0KOuEzKbivJdouzog@mail.gmail.com>
 <1972f50b-d71a-9e2e-d10b-cc4f13bb208f@linux.intel.com>
 <CAF6AEGsvmQYjzoFgEMTer3oDmb62y2Hq_unDbq2UEoZ6CA3CSw@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGsvmQYjzoFgEMTer3oDmb62y2Hq_unDbq2UEoZ6CA3CSw@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Jonathan Marek <jonathan@marek.ca>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 freedreno <freedreno@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 26/05/2022 04:15, Rob Clark wrote:
> On Wed, May 25, 2022 at 9:11 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 24/05/2022 15:57, Rob Clark wrote:
>>> On Tue, May 24, 2022 at 6:45 AM Tvrtko Ursulin
>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>
>>>> On 23/05/2022 23:53, Rob Clark wrote:
>>>>>
>>>>> btw, one fun (but unrelated) issue I'm hitting with scheduler... I'm
>>>>> trying to add an igt test to stress shrinker/eviction, similar to the
>>>>> existing tests/i915/gem_shrink.c.  But we hit an unfortunate
>>>>> combination of circumstances:
>>>>> 1. Pinning memory happens in the synchronous part of the submit ioctl,
>>>>> before enqueuing the job for the kthread to handle.
>>>>> 2. The first run_job() callback incurs a slight delay (~1.5ms) while
>>>>> resuming the GPU
>>>>> 3. Because of that delay, userspace has a chance to queue up enough
>>>>> more jobs to require locking/pinning more than the available system
>>>>> RAM..
>>>>
>>>> Is that one or multiple threads submitting jobs?
>>>
>>> In this case multiple.. but I think it could also happen with a single
>>> thread (provided it didn't stall on a fence, directly or indirectly,
>>> from an earlier submit), because of how resume and actual job
>>> submission happens from scheduler kthread.
>>>
>>>>> I'm not sure if we want a way to prevent userspace from getting *too*
>>>>> far ahead of the kthread.  Or maybe at some point the shrinker should
>>>>> sleep on non-idle buffers?
>>>>
>>>> On the direct reclaim path when invoked from the submit ioctl? In i915
>>>> we only shrink idle objects on direct reclaim and leave active ones for
>>>> the swapper. It depends on how your locking looks like whether you could
>>>> do them, whether there would be coupling of locks and fs-reclaim context.
>>>
>>> I think the locking is more or less ok, although lockdep is unhappy
>>> about one thing[1] which is I think a false warning (ie. not
>>> recognizing that we'd already successfully acquired the obj lock via
>>> trylock).  We can already reclaim idle bo's in this path.  But the
>>> problem with a bunch of submits queued up in the scheduler, is that
>>> they are already considered pinned and active.  So at some point we
>>> need to sleep (hopefully interruptabley) until they are no longer
>>> active, ie. to throttle userspace trying to shove in more submits
>>> until some of the enqueued ones have a chance to run and complete.
>>
>> Odd I did not think trylock could trigger that. Looking at your code it
>> indeed seems two trylocks. I am pretty sure we use the same trylock
>> trick to avoid it. I am confused..
> 
> The sequence is,
> 
> 1. kref_get_unless_zero()
> 2. trylock, which succeeds
> 3. attempt to evict or purge (which may or may not have succeeded)
> 4. unlock
> 
>   ... meanwhile this has raced with submit (aka execbuf) finishing and
> retiring and dropping *other* remaining reference to bo...
> 
> 5. drm_gem_object_put() which triggers drm_gem_object_free()
> 6. in our free path we acquire the obj lock again and then drop it.
> Which arguably is unnecessary and only serves to satisfy some
> GEM_WARN_ON(!msm_gem_is_locked(obj)) in code paths that are also used
> elsewhere
> 
> lockdep doesn't realize the previously successful trylock+unlock
> sequence so it assumes that the code that triggered recursion into
> shrinker could be holding the objects lock.

Ah yes, missed that lock after trylock in msm_gem_shrinker/scan(). Well 
i915 has the same sequence in our shrinker, but the difference is we use 
delayed work to actually free, _and_ use trylock in the delayed worker. 
It does feel a bit inelegant (objects with no reference count which 
cannot be trylocked?!), but as this is the code recently refactored by 
Maarten so I think best try and sync with him for the full story.

>> Otherwise if you can afford to sleep you can of course throttle
>> organically via direct reclaim. Unless I am forgetting some key gotcha -
>> it's been a while I've been active in this area.
> 
> So, one thing that is awkward about sleeping in this path is that
> there is no way to propagate back -EINTR, so we end up doing an
> uninterruptible sleep in something that could be called indirectly
> from userspace syscall.. i915 seems to deal with this by limiting it
> to shrinker being called from kswapd.  I think in the shrinker we want
> to know whether it is ok to sleep (ie. not syscall trigggered
> codepath, and whether we are under enough memory pressure to justify
> sleeping).  For the syscall path, I'm playing with something that lets
> me pass __GFP_RETRY_MAYFAIL | __GFP_NOWARN to
> shmem_read_mapping_page_gfp(), and then stall after the shrinker has
> failed, somewhere where we can make it interruptable.  Ofc, that
> doesn't help with all the other random memory allocations which can
> fail, so not sure if it will turn out to be a good approach or not.
> But I guess pinning the GEM bo's is the single biggest potential
> consumer of pages in the submit path, so maybe it will be better than
> nothing.

We play similar games, although by a quick look I am not sure we quite 
manage to honour/propagate signals. This has certainly been a 
historically fiddly area. If you first ask for no reclaim allocations 
and invoke the shrinker manually first, then falling back to a bigger 
hammer, you should be able to do it.

Regards,

Tvrtko
