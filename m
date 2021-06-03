Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25450399F48
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 12:52:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E94B6E12C;
	Thu,  3 Jun 2021 10:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18F16E12C;
 Thu,  3 Jun 2021 10:52:09 +0000 (UTC)
IronPort-SDR: PKeYyVRNGELDV+7LHkPVzRAc0XxCXkBA0sb2N8EQtK3gtM6Pe0mXAOhS7MZXNHK6bMzuf5TSYi
 BCc7ma4iiUVA==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="191361369"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="191361369"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 03:52:08 -0700
IronPort-SDR: AC2GL52VYfCOWRMN5obUe17DXrJCRYpIClwBNv9MuNxM8AAoYpjbMokiHM/Rqo2DDQfpfqSJ9U
 l0AvUBo6klwg==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="483427818"
Received: from aburk3x-mobl2.ger.corp.intel.com (HELO [10.213.243.139])
 ([10.213.243.139])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2021 03:52:07 -0700
Subject: Re: [Intel-gfx] [RFC PATCH 00/97] Basic GuC submission support in the
 i915
To: Matthew Brost <matthew.brost@intel.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20210506191451.77768-1-matthew.brost@intel.com>
 <de3965d8-d997-5685-0399-646d8823a27f@linux.intel.com>
 <20210525164504.GA9971@sdutt-i7>
 <d76ab0ec-4f0c-19ed-adaa-ed227af63c0e@linux.intel.com>
 <CAKMK7uHT2mPTyX9QiTBFP2Lt28vV3JcJLPAx_hMdTtyLJ=DZ2g@mail.gmail.com>
 <20210603034100.GA7593@sdutt-i7>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <628c9edd-eb38-dd7f-fe59-b373c3c42a50@linux.intel.com>
Date: Thu, 3 Jun 2021 11:52:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210603034100.GA7593@sdutt-i7>
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


On 03/06/2021 04:41, Matthew Brost wrote:
> On Wed, Jun 02, 2021 at 08:57:02PM +0200, Daniel Vetter wrote:
>> On Wed, Jun 2, 2021 at 5:27 PM Tvrtko Ursulin
>> <tvrtko.ursulin@linux.intel.com> wrote:
>>> On 25/05/2021 17:45, Matthew Brost wrote:
>>>> On Tue, May 25, 2021 at 11:32:26AM +0100, Tvrtko Ursulin wrote:
>>>>>    * Context pinning code with it's magical two adds, subtract and cmpxchg is
>>>>> dodgy as well.
>>>>
>>>> Daniele tried to remove this and it proved quite difficult + created
>>>> even more races in the backend code. This was prior to the pre-pin and
>>>> post-unpin code which makes this even more difficult to fix as I believe
>>>> these functions would need to be removed first. Not saying we can't
>>>> revisit this someday but I personally really like it - it is a clever
>>>> way to avoid reentering the pin / unpin code while asynchronous things
>>>> are happening rather than some complex locking scheme. Lastly, this code
>>>> has proved incredibly stable as I don't think we've had to fix a single
>>>> thing in this area since we've been using this code internally.
>>>
>>> Pretty much same as above. The code like:
>>>
>>> static inline void __intel_context_unpin(struct intel_context *ce)
>>> {
>>>          if (!ce->ops->sched_disable) {
>>>                  __intel_context_do_unpin(ce, 1);
>>>          } else {
>>>                  while (!atomic_add_unless(&ce->pin_count, -1, 1)) {
>>>                          if (atomic_cmpxchg(&ce->pin_count, 1, 2) == 1) {
>>>                                  ce->ops->sched_disable(ce);
>>>                                  break;
>>>                          }
>>>                  }
>>>          }
>>> }
>>>
>>> That's pretty much impenetrable for me and the only thing I can think of
>>> here is **ALARM** must be broken! See what others think..
> 
> Yea, probably should add a comment:
> 
> /*
>   * If the context has the sched_disable function, it isn't safe to unpin
>   * until this function completes. This function is allowed to complete
>   * asynchronously too. To avoid this function from being entered twice
>   * and move ownership of the unpin to this function's completion, adjust
>   * the pin count to 2 before it is entered. When this function completes
>   * the context can call intel_context_sched_unpin which decrements the
>   * pin count by 2 potentially resulting in an unpin.
>   *
>   * A while loop is needed to ensure the atomicity of the pin count. e.g.
>   * The below if / else statement has a race:
>   *
>   * if (atomic_cmpxchg(&ce->pin_count, 1, 2) == 1)
>   * 	ce->ops->sched_disable(ce);
>   * else
>   * 	atomic_dec(ce, 1);
>   *
>   * Two threads could simultaneously fail the if clause resulting in the
>   * pin_count going to 0 with scheduling enabled + the context pinned.
>   */

I have many questions here..

How time bound is the busy loop?

In guc_context_sched_disable the case where someone pins after the magic 
2 has been set is handled.

But what is pin_count got to 2 legitimately, via the unpin and pin 
between the atomic_cmpxchg in __intel_context_unpin and relevant lines 
in guc_context_sched_disable get to execute?

Why is the pin_count dec in guc_context_sched_disable under the 
ce->guc_state.lock?

What is the point of:

	enabled = context_enabled(ce);
	if (unlikely(!enabled || submission_disabled(guc))) {
		if (!enabled)
			clr_context_enabled(ce);

Reads like clearing the enabled bit if it is not set?!

Why is:

static inline void clr_context_enabled(struct intel_context *ce)
{
	atomic_and((u32)~SCHED_STATE_NO_LOCK_ENABLED,
		   &ce->guc_sched_state_no_lock);
}

Operating on a field called "guc_sched_state_no_lock" (no lock!) while 
the caller is holding guc_state.lock while manipulating that lock.

Regards,

Tvrtko
