Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FD69464C71
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 12:15:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C64C6F52C;
	Wed,  1 Dec 2021 11:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09FE6F52C;
 Wed,  1 Dec 2021 11:15:11 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="322682499"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; d="scan'208";a="322682499"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2021 03:15:11 -0800
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; d="scan'208";a="500206972"
Received: from edegouwx-mobl.amr.corp.intel.com (HELO [10.252.35.171])
 ([10.252.35.171])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2021 03:15:10 -0800
Message-ID: <2a7b5eaa-0d0c-12ac-6d37-5146a4a44042@linux.intel.com>
Date: Wed, 1 Dec 2021 12:15:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.3.2
Subject: Re: [Intel-gfx] [PATCH v2 00/16] drm/i915: Remove short term pins
 from execbuf.
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20211129134735.628712-1-maarten.lankhorst@linux.intel.com>
 <f1202314-f42d-e37a-49a7-16148f5018be@linux.intel.com>
 <b40c5455-7b60-7c97-9fcd-fba67ed71f6d@linux.intel.com>
 <ea3869e7-a4f7-52a6-0ef9-7531655d5647@linux.intel.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <ea3869e7-a4f7-52a6-0ef9-7531655d5647@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 30-11-2021 19:38, Tvrtko Ursulin wrote:
>
> On 30/11/2021 11:17, Maarten Lankhorst wrote:
>> On 30-11-2021 09:54, Tvrtko Ursulin wrote:
>>>
>>> Hi,
>>>
>>> On 29/11/2021 13:47, Maarten Lankhorst wrote:
>>>> New version of the series, with feedback from previous series added.
>>>
>>> If there was a cover letter sent for this work in the past could you please keep attaching it? Or if there wasn't, could you please write one?
>>>
>>> I am worried about two things. First is that we need to have a high level overview of the rules/design changes documented so third party people have any hope of getting code right after this lands. (Where we are, where we are going, how we will get there, how far did we get and when we will get to the end.)
>>>
>>> Second is that when parts of the series land piecemeal (Which they have in this right, right?), it gets very hard to write up a maintainer level changelog.
>>
>> The preparation part is to ensure we always hold vma->obj->resv when unbinding.
>>
>> The first preparation series ensured vma->obj always existed. This was not the case for mock gtt and gen6 aliasing gtt. This allowed us to remove all the special handling for those uncommon cases, and actually enforce we can always take that lock. This part is merged.
>
> Sounds good. But also mention the high level motivation for why we always want to hold vma->obj->resv when unbinding in the introduction as well.
>
>>
>> Patch 2-11 in this series adds the vma->obj->resv to eviction and shrinker. Those are the only parts where we don't take the lock yet.
>>
>> After that, we always hold the lock when required, and we can start requiring the obj-> resv lock when unbinding. This is completed in patch 15.
>>
>> With that fixed, removing short term pins can be done, because for unbind we now always take obj->resv, so holding obj->resv during execbuf submission is sufficient, and all short term pinning can be removed.
>
> I'd also like the cover letter to contain a high level description on _why_ is removing short term pins needed or beneficial.
>
> What was the flow and object lifetimes so far, and what it will be going forward etc.

Previously, short term pinning in execbuf was required because i915_vma was effectively independent from objects, and has its own refcount, locking, and lifetime rules and pinning.
This series removes the separate locking, by requiring vma->obj->resv to be held when pinning and unbinding. This will also be required for VM_BIND work.
With pinning required for pinning and unbinding, the lock is enough to prevent unbinding when trying to pin with the lock held, like in execbuf.
This makes binding/unbinding similar to ttm_bo_validate()'s use, which just cares that an object is in a certain place, without pinning it in place.

Having it part of gem bo removes a lot of the vma refcounting, and makes i915_vma more a part of the bo, instead of its own floating object that just
happens to be part of a bo. This is also required to make it more compatible with TTM, and migration in general.

For future work, it makes things a lot simpler and clear. We want to end up with i915_vma just being a specific mapping of the BO, just like is the
case in other drivers. i915_vma->active removal is the next step there, and makes it when object is destroyed, the bindings are destroyed (after idle),
instead of object being destroyed when bindings are idle.

>>
>> We only pin temporarily when calling i915_gem_evict_vm in execbuf, which could also be handled in theory by just marking all objects as unpinned.
>>
>> As a bonus, using TTM for delayed eviction on all objects becomes easy, just need to get rid of i915_active in i915_vma, as it keeps the object refcount alive.
>>
>> Remainder is removing refcount to i915_vma, to make it a real
>
> Sounds on the right track with maybe a bit more text so the readers can easily understand it on the higher level.

With the obj->resv being the master lock, pinning for execbuf becomes obsolete and can be removed.


>
>>
>>> But in any case, even on the mundane process level, we need to have cover letters for any non trivial work was the conclusion since some time ago.
>>
>> Here you go! I hope it explains the reasoning.
>
> It is on the right track. I think just needs to be expanded a bit with high level direction and plan, pointing out where in the grand scheme this series is. And then don't forget to add the improved text as cover letter when sending next time please.
>
> Regards,
>
> Tvrtko


