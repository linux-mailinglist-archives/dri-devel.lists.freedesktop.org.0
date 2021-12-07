Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA96A46C4DF
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 21:46:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36A796F98B;
	Tue,  7 Dec 2021 20:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B2A6F9BE;
 Tue,  7 Dec 2021 20:46:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10191"; a="224941636"
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="224941636"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 12:46:52 -0800
X-IronPort-AV: E=Sophos;i="5.87,295,1631602800"; d="scan'208";a="600310545"
Received: from isyrjala-mobl.ger.corp.intel.com (HELO [10.249.254.187])
 ([10.249.254.187])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Dec 2021 12:46:50 -0800
Message-ID: <ef823120-ecdc-24c7-b9e2-33303c47d171@linux.intel.com>
Date: Tue, 7 Dec 2021 21:46:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [Intel-gfx] [Linaro-mm-sig] [RFC PATCH 1/2] dma-fence: Avoid
 establishing a locking order between fence classes
Content-Language: en-US
To: Daniel Vetter <daniel@ffwll.ch>
References: <193e36bd-ba64-1358-8178-73ee3afc3c41@amd.com>
 <c9109ec6-4265-ba8f-238f-4c793d076825@shipmail.org>
 <d1ada94c-88d3-d34d-9c51-0d427c3aca06@amd.com>
 <7ef3db03-8ae2-d886-2c39-36f661cac9a6@shipmail.org>
 <4805074d-7039-3eaf-eb5d-5797278b7f31@amd.com>
 <94435e0e-01db-5ae4-e424-64f73a09199f@shipmail.org>
 <a4df4d5f-ea74-8725-aca9-d0edae986e5c@amd.com>
 <fb9f50e2-aeba-6138-0cc0-aed252dc876d@shipmail.org>
 <8a7dbf22-727d-c1ec-1d3f-75e23394fee8@amd.com>
 <d4a9cb5a554ffc3af3d30ecacad6e57533eb7f3b.camel@linux.intel.com>
 <Ya+jL+SBTqdwqBeI@phenom.ffwll.local>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <Ya+jL+SBTqdwqBeI@phenom.ffwll.local>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 matthew.auld@intel.com, intel-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/7/21 19:08, Daniel Vetter wrote:
> Once more an entire week behind on mails, but this looked interesting
> enough.
>
> On Fri, Dec 03, 2021 at 03:18:01PM +0100, Thomas Hellström wrote:
>> On Fri, 2021-12-03 at 14:08 +0100, Christian König wrote:
>>> Am 01.12.21 um 13:16 schrieb Thomas Hellström (Intel):
>>>> On 12/1/21 12:25, Christian König wrote:
>>>>> And why do you use dma_fence_chain to generate a timeline for
>>>>> TTM?
>>>>> That should come naturally because all the moves must be ordered.
>>>> Oh, in this case because we're looking at adding stuff at the end
>>>> of
>>>> migration (like coalescing object shared fences and / or async
>>>> unbind
>>>> fences), which may not complete in order.
>>> Well that's ok as well. My question is why does this single dma_fence
>>> then shows up in the dma_fence_chain representing the whole
>>> migration?
>> What we'd like to happen during eviction is that we
>>
>> 1) await any exclusive- or moving fences, then schedule the migration
>> blit. The blit manages its own GPU ptes. Results in a single fence.
>> 2) Schedule unbind of any gpu vmas, resulting possibly in multiple
>> fences.
> This sounds like over-optimizing for nothing. We only really care about
> pipeling moves on dgpu, and on dgpu we only care about modern userspace
> (because even gl moves in that direction).
Hmm. It's not totally clear what you mean with over-optimizing for 
nothing, is it the fact that we want to start the blit before all shared 
fences have signaled or the fact that we're doing async unbinding to 
avoid a synchronization point that stops us from fully pipelining evictions?
> And modern means that usually even write access is only setting a read
> fence, because in vk/compute we only set write fences for object which
> need implicit sync, and _only_ when actually needed.
>
> So ignoring read fences for movings "because it's only reads" is actually
> busted.

I'm fine with awaiting also shared fences before we start the blit, as 
mentioned also later in the thread, but that is just a matter of when we 
coalesce the shared fences. So since difference in complexity is 
minimal, what's viewed as optimizing for nothing can also be conversely 
be viewed as unneccesarily waiting for nothing, blocking the migration 
context timeline from progressing with unrelated blits. (Unless there 
are correctness issues of course, see below).

But not setting a write fence after write seems to conflict with dma-buf 
rules as also discussed later in the thread. Perhaps some clarity is 
needed here. How would a writer or reader that implicitly *wants* to 
wait for previous writers go about doing that?

Note that what we're doing is not "moving" in the sense that we're 
giving up or modifying the old storage but rather start a blit assuming 
that the contents of the old storage is stable, or the writer doesn't care.

>
> I think for buffer moves we should document and enforce (in review) the
> rule that you have to wait for all fences, otherwise boom. Same really
> like before freeing backing storage. Otherwise there's just too many gaps
> and surprises.
>
> And yes with Christian's rework of dma_resv this will change, and we'll
> allow multiple write fences (because that's what amdgpu encoded into their
> uapi). Still means that you cannot move a buffer without waiting for read
> fences (or kernel fences or anything really).

Sounds like some agreement is needed here what rules we actually should 
obey. As mentioned above I'm fine with either.

>
> The other thing is this entire spinlock recursion topic for dma_fence, and
> I'm deeply unhappy about the truckload of tricks i915 plays and hence in
> favour of avoiding recursion in this area as much as possible.

TBH I think the i915 corresponding container manages to avoid both the 
deep recursive calls and lock nesting simply by early enable_signaling() 
and not storing the fence pointers of the array fences, which to me 
appears to be a simple and clean approach. No tricks there.

>
> If we really can't avoid it then irq_work to get a new clean context gets
> the job done. Making this messy and work is imo a feature, lock nesting of
> same level locks is just not a good&robust engineering idea.

For the dma-fence-chain and dma-fence-array there are four possibilities 
moving forward:

1) Keeping the current same-level locking nesting order of 
container-first containee later. This is fully annotated, but fragile 
and blows up if users attempt to nest containers in different orders.

2) Establishing a reverse-signaling locking order. Not annotatable. 
blows up on signal-on-any.

3) Early enable-signaling, no lock nesting, low latency but possibly 
unnecessary enable_signaling calls.

4) irq_work in enable_signaling(). High latency.

The tread finally agreed the solution would be to keep 1), add early 
warnings for the pitfalls and if possible provide helpers to flatten to 
avoid container recursion.

/Thomas


>
> /me back to being completely burried
>
> I do hope I can find some more time to review a few more of Christian's
> patches this week though :-/
>
> Cheers, Daniel
>
>> 3) Most but not all of the remaining resv shared fences will have been
>> finished in 2) We can't easily tell which so we have a couple of shared
>> fences left.
>> 4) Add all fences resulting from 1) 2) and 3) into the per-memory-type
>> dma-fence-chain.
>> 5) hand the resulting dma-fence-chain representing the end of migration
>> over to ttm's resource manager.
>>
>> Now this means we have a dma-fence-chain disguised as a dma-fence out
>> in the wild, and it could in theory reappear as a 3) fence for another
>> migration unless a very careful audit is done, or as an input to the
>> dma-fence-array used for that single dependency.
>>
>>> That somehow doesn't seem to make sense because each individual step
>>> of
>>> the migration needs to wait for those dependencies as well even when
>>> it
>>> runs in parallel.
>>>
>>>> But that's not really the point, the point was that an (at least to
>>>> me) seemingly harmless usage pattern, be it real or fictious, ends
>>>> up
>>>> giving you severe internal- or cross-driver headaches.
>>> Yeah, we probably should document that better. But in general I don't
>>> see much reason to allow mixing containers. The dma_fence_array and
>>> dma_fence_chain objects have some distinct use cases and and using
>>> them
>>> to build up larger dependency structures sounds really questionable.
>> Yes, I tend to agree to some extent here. Perhaps add warnings when
>> adding a chain or array as an input to array and when accidently
>> joining chains, and provide helpers for flattening if needed.
>>
>> /Thomas
>>
>>
>>> Christian.
>>>
>>>> /Thomas
>>>>
>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>
>>
