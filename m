Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6394B3EF391
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 22:41:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54C656E241;
	Tue, 17 Aug 2021 20:41:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339F46E241;
 Tue, 17 Aug 2021 20:41:05 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10079"; a="301772285"
X-IronPort-AV: E=Sophos;i="5.84,329,1620716400"; d="scan'208";a="301772285"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Aug 2021 13:41:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,329,1620716400"; d="scan'208";a="449417979"
Received: from irvmail001.ir.intel.com ([10.43.11.63])
 by fmsmga007.fm.intel.com with ESMTP; 17 Aug 2021 13:41:02 -0700
Received: from [10.249.133.37] (mwajdecz-MOBL.ger.corp.intel.com
 [10.249.133.37])
 by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
 17HKf0n0002909; Tue, 17 Aug 2021 21:41:01 +0100
Subject: Re: [PATCH 22/22] drm/i915/guc: Add GuC kernel doc
To: Daniel Vetter <daniel@ffwll.ch>
Cc: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch
References: <20210816135139.10060-1-matthew.brost@intel.com>
 <20210816135139.10060-23-matthew.brost@intel.com>
 <YRuZbTJmeUAElOZj@phenom.ffwll.local>
 <20210817163647.GA30445@jons-linux-dev-box>
 <YRvv3Sbihp5ogz2u@phenom.ffwll.local>
 <d239000d-0382-2bd5-ff92-80c0925bfd92@intel.com>
 <YRvzMkaqPbQjvIlW@phenom.ffwll.local>
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
Message-ID: <0fbbf0fa-1e3e-4896-d462-7e7a9a02db84@intel.com>
Date: Tue, 17 Aug 2021 22:41:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YRvzMkaqPbQjvIlW@phenom.ffwll.local>
Content-Type: text/plain; charset=utf-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 17.08.2021 19:34, Daniel Vetter wrote:
> On Tue, Aug 17, 2021 at 07:27:18PM +0200, Michal Wajdeczko wrote:
>>
>>
>> On 17.08.2021 19:20, Daniel Vetter wrote:
>>> On Tue, Aug 17, 2021 at 09:36:49AM -0700, Matthew Brost wrote:
>>>> On Tue, Aug 17, 2021 at 01:11:41PM +0200, Daniel Vetter wrote:
>>>>> On Mon, Aug 16, 2021 at 06:51:39AM -0700, Matthew Brost wrote:
>>>>>> Add GuC kernel doc for all structures added thus far for GuC submission
>>>>>> and update the main GuC submission section with the new interface
>>>>>> details.
>>>>>>
>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>
>>>>> There's quite a bit more, e.g. intel_guc_ct, which has it's own world of
>>>>> locking design that also doesn't feel too consistent.
>>>>>
>>>>
>>>> That is a different layer than GuC submission so I don't we should
>>>> mention anything about that layer here. Didn't really write that layer
>>>> and it super painful to touch that code so I'm going to stay out of any
>>>> rework you think we need to do there. 
>>>
>>> Well there's three locks 
>>
>> It's likely me.
>>
>> There is one lock for the recv CTB, one for the send CTB, one for the
>> list of read messages ready to post process - do you want to use single
>> lock for both CTBs or single lock for all cases in CT ?
>>
>> Michal
>>
>> disclaimer: outstanding_g2h are not part of the CTB layer
> 
> Why? Like apparently there's not enough provided by that right now, so
> Matt is now papering over that gap with more book-keeping in the next
> layer. If the layer is not doing a good job it's either the wrong layer,
> or shouldn't be a layer.

Note that all "outstanding g2h" used by Matt are kind of unsolicited
"event" messages received from the GuC, that CTB layer is unable
correlate. CTB only tracks "requests" messages for which "response" (or
"error") reply is expected. Thus if CTB client is expecting some extra
message for its previous communication with GuC, it must track it on its
own, as only client knows where in the CTB message payload, actual
correlation data (like context ID) is stored.

> 
> And yeah the locking looks like serious amounts of overkill, was it
> benchmarked that we need the 3 separate locks for this?

I'm not aware of any (micro)benchmarking, but definitely we need some,
we were just gradually moving from single threaded blocking CTB calls
(waiting for CTB descriptor updates under mutex) to non-blocking calls
(protecting only reads/writes to CTB descriptors with spinlock - to
allow CTB usage from tasklet/irq).

And I was just assuming that we can sacrifice few more integers [1] and
have dedicated spinlocks and avoid early over-optimization.

> 
> While reading ctb code I also noticed that a bunch of stuff is checked
> before we grab the relevant spinlocks, and it's not
> - wrapped in a WARN_ON or GEM_BUG_ON or similar to just check everything
>   works as expected
> - there's no other locks
> 
> So either racy, buggy or playing some extremely clever tricks. None of
> which is very good.

I'm open to improve that code as needed, but maybe in exchange and to
increase motivation please provide feedback on already posted fixes [2] ;)

Michal

[1]
https://elixir.bootlin.com/linux/latest/source/arch/ia64/include/asm/spinlock_types.h#L10
[2] https://patchwork.freedesktop.org/series/92118/

> -Daniel
> 
>>
>>
>>> there plus it leaks out (you have your
>>> outstanding_submission_g2h atomic_t which is very closed tied to well,
>>> outstanding guc transmissions), so I guess I need someone else for that?
>>>
> 
