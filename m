Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B909B399E11
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 11:49:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A66D26E581;
	Thu,  3 Jun 2021 09:49:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 405A26E581;
 Thu,  3 Jun 2021 09:49:52 +0000 (UTC)
IronPort-SDR: BaRTBNXxpScgJZdHpQ2Q+MPQK+TW2DgSIOMabgXURket3F25p97vyUAw/vNp6HvmraVKJONX8e
 mDBw0+0pi7Vw==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="225305085"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="225305085"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 02:49:50 -0700
IronPort-SDR: rEbLyRV8vfWmDKl7smaeTD47WyTX8yNp+Q7CfXZ+3MPmHttLzJqQeHb0PUMuu9BySXLOsYelRH
 q4QFRBcsMA0w==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="483408878"
Received: from aburk3x-mobl2.ger.corp.intel.com (HELO [10.213.243.139])
 ([10.213.243.139])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 02:49:48 -0700
Subject: Re: [Intel-gfx] [RFC PATCH 00/97] Basic GuC submission support in the
 i915
To: Daniel Vetter <daniel@ffwll.ch>, Matthew Brost <matthew.brost@intel.com>, 
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <de3965d8-d997-5685-0399-646d8823a27f@linux.intel.com>
 <20210525164504.GA9971@sdutt-i7>
 <d76ab0ec-4f0c-19ed-adaa-ed227af63c0e@linux.intel.com>
 <CAKMK7uHT2mPTyX9QiTBFP2Lt28vV3JcJLPAx_hMdTtyLJ=DZ2g@mail.gmail.com>
 <20210603034100.GA7593@sdutt-i7>
 <CAKMK7uF-SjHPBG6qyt0yc2fA35zy2=r-Ls_QtTtKPdKdBm=J4w@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <ad653a25-daa3-7e31-c838-465c71c2c697@linux.intel.com>
Date: Thu, 3 Jun 2021 10:49:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAKMK7uF-SjHPBG6qyt0yc2fA35zy2=r-Ls_QtTtKPdKdBm=J4w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Jason Ekstrand <jason.ekstrand@intel.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03/06/2021 05:47, Daniel Vetter wrote:
> On Thu, Jun 3, 2021 at 5:48 AM Matthew Brost <matthew.brost@intel.com> wrote:
>>
>> On Wed, Jun 02, 2021 at 08:57:02PM +0200, Daniel Vetter wrote:
>>> On Wed, Jun 2, 2021 at 5:27 PM Tvrtko Ursulin
>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>> On 25/05/2021 17:45, Matthew Brost wrote:
>>>>> On Tue, May 25, 2021 at 11:32:26AM +0100, Tvrtko Ursulin wrote:
>>>>>>    * Context pinning code with it's magical two adds, subtract and cmpxchg is
>>>>>> dodgy as well.
>>>>>
>>>>> Daniele tried to remove this and it proved quite difficult + created
>>>>> even more races in the backend code. This was prior to the pre-pin and
>>>>> post-unpin code which makes this even more difficult to fix as I believe
>>>>> these functions would need to be removed first. Not saying we can't
>>>>> revisit this someday but I personally really like it - it is a clever
>>>>> way to avoid reentering the pin / unpin code while asynchronous things
>>>>> are happening rather than some complex locking scheme. Lastly, this code
>>>>> has proved incredibly stable as I don't think we've had to fix a single
>>>>> thing in this area since we've been using this code internally.
>>>>
>>>> Pretty much same as above. The code like:
>>>>
>>>> static inline void __intel_context_unpin(struct intel_context *ce)
>>>> {
>>>>          if (!ce->ops->sched_disable) {
>>>>                  __intel_context_do_unpin(ce, 1);
>>>>          } else {
>>>>                  while (!atomic_add_unless(&ce->pin_count, -1, 1)) {
>>>>                          if (atomic_cmpxchg(&ce->pin_count, 1, 2) == 1) {
>>>>                                  ce->ops->sched_disable(ce);
>>>>                                  break;
>>>>                          }
>>>>                  }
>>>>          }
>>>> }
>>>>
>>>> That's pretty much impenetrable for me and the only thing I can think of
>>>> here is **ALARM** must be broken! See what others think..
>>
>> Yea, probably should add a comment:
>>
>> /*
>>   * If the context has the sched_disable function, it isn't safe to unpin
>>   * until this function completes. This function is allowed to complete
>>   * asynchronously too. To avoid this function from being entered twice
>>   * and move ownership of the unpin to this function's completion, adjust
>>   * the pin count to 2 before it is entered. When this function completes
>>   * the context can call intel_context_sched_unpin which decrements the
>>   * pin count by 2 potentially resulting in an unpin.
>>   *
>>   * A while loop is needed to ensure the atomicity of the pin count. e.g.
>>   * The below if / else statement has a race:
>>   *
>>   * if (atomic_cmpxchg(&ce->pin_count, 1, 2) == 1)
>>   *      ce->ops->sched_disable(ce);
>>   * else
>>   *      atomic_dec(ce, 1);
>>   *
>>   * Two threads could simultaneously fail the if clause resulting in the
>>   * pin_count going to 0 with scheduling enabled + the context pinned.
>>   */
>>
>>>
>>> pin_count is a hand-rolled mutex, except not actually a real one, and
>>> it's absolutely hiliarous in it's various incarnations (there's one
>>> each on i915_vm, vma, obj and probably a few more).
>>>
>>> Not the worst one I've seen by far in the code we've merged already.
>>> Minimally this needs a comment here and in the struct next to
>>> @pin_count to explain where all this is abused, which would already
>>> make it better than most of the in-tree ones.
>>>
>>> As part of the ttm conversion we have a plan to sunset the "pin_count
>>> as a lock" stuff, depending how bad that goes we might need to split
>>> up the task for each struct that has such a pin_count.
>>>
>>
>> Didn't know that with the TTM rework this value might go away. If that
>> is truely the direction I don't see the point in reworking this now. It
>> 100% works and with a comment I think it can be understood what it is
>> doing.
> 
> Well not go away, but things will change. Currently the various
> ->pin_count sprinkled all over the place have essentially two uses
> - pinning stuff long term (scanout, ctxs, anything that stays pinned
> after the ioctl is done essentially)
> - short-term lock-like construct
> 
> There's going to be two changes:
> - The short-term pins will be replaced by dma_resv_lock/unlock pairs
> - the locking rules for long-term pins will change, because we'll
> require that you must hold dma_resv_lock for unpinning. So no more
> atomic_t, also no more races for final unpins vs cleanup work
> 
> Also now that you've explained the why for this dance, especially the
> async part: Since the new unpin will hold dma_resv_lock, we can
> create&attach dma_fence for tracking async completion which then the
> next operation can wait on.

Yes, async would be an improvement in principle, because...

> The awkward state we have right now is that there's a lot of places
> where we require the unpin to be done locklessly with these atomic
> tricks, so there's going to be quite some surgery involved all over
> the code.

... I think the main problem with how impenetrable, both this and the 
guc context state machine in general are, stem from the fact that the 
design is not right.

For instance we have intel_context which is one thing to i915, but with 
the GuC adaptations the guc state machine handling has been shoved 
inside it. That makes it complex and destroys the separation of duties.

Instead intel_context should remain the common layer and handling of GuC 
firmware needs should go in a layer under it. Whether it would subclass, 
or use a different pattern I can't tell right now. But if it was clearly 
separated then the state machine handling would have it's place away 
from the common code.

In 2019 I did push to at least prefix the guc specific fields with guc, 
as minimum, but I don't think they, and accompanying code, really should 
be present in backend agnostic intel_context.

Regards,

Tvrtko
