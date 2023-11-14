Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E75CF7EB584
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 18:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D577610E3BC;
	Tue, 14 Nov 2023 17:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 403BE10E3BC;
 Tue, 14 Nov 2023 17:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699982905; x=1731518905;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=BawaWMWsjWYFDXa0Qd0AyO+yeFqson2ED84SJdsw1NI=;
 b=Gmr5HvHjoU7XV36Ocqqd0Gp15TRHX5daUjaQjCmVTBGE62bTgrlDprtU
 zdMiXrg+t4uVsRDj0icwsqY50BKl9bQrJ8Vm3Qqi59v5fD+zJYQUYlCN8
 0JKbUQAange8QIE1NnuAFfr4wfGiI2YjFrA6d6FedtnGZSP6bEpp8BuGX
 iTzza6TLLXvA/NCB/DdT9X1FCoDAysRhE1RsKOAACBHfXxqyTGpCRIqca
 SkKW9rrwooKwRlMQTGNrUkqmLvKh3oa1tLi7RvCz+KrLfYLnvgpeQuIXy
 ylUbtjYgdyxQZVxWXVSbhJ6WP3JN7mCux02dKU3BVhrffhvQjTnvFF2FV A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="3808466"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; 
   d="scan'208";a="3808466"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 09:27:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10894"; a="938169588"
X-IronPort-AV: E=Sophos;i="6.03,302,1694761200"; d="scan'208";a="938169588"
Received: from mahajan1-mobl.ger.corp.intel.com (HELO [10.213.195.180])
 ([10.213.195.180])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2023 09:27:20 -0800
Message-ID: <eeded970-cee7-420c-9b34-26ea9d78e420@linux.intel.com>
Date: Tue, 14 Nov 2023 17:27:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Intel-gfx] [PATCH v4 3/3] drm/i915/gt: Timeout when waiting for
 idle in suspending
Content-Language: en-US
To: "Teres Alexis, Alan Previn" <alan.previn.teres.alexis@intel.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>
References: <20230926190518.105393-1-alan.previn.teres.alexis@intel.com>
 <20230926190518.105393-4-alan.previn.teres.alexis@intel.com>
 <9ca17c5c-7bb4-ff6b-69cb-3983299729c1@linux.intel.com>
 <123edf6b37aa982de20279d64c213156a2dc8c2e.camel@intel.com>
 <fad657e7-beec-75fc-9003-5883412d6e6b@linux.intel.com>
 <0c1e1e713fc46bf0783ca6e0a72a39d6671a6b57.camel@intel.com>
 <ace7375e-d9a8-4b6f-aa92-6360ca3bfa96@linux.intel.com>
 <16068beebe0fdac5aabd83816fd25367f5170c24.camel@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <16068beebe0fdac5aabd83816fd25367f5170c24.camel@intel.com>
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
Cc: "Jana, Mousumi" <mousumi.jana@intel.com>,
 "intel.com@freedesktop.org" <intel.com@freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 13/11/2023 17:57, Teres Alexis, Alan Previn wrote:
> On Wed, 2023-10-25 at 13:58 +0100, Tvrtko Ursulin wrote:
>> On 04/10/2023 18:59, Teres Alexis, Alan Previn wrote:
>>> On Thu, 2023-09-28 at 13:46 +0100, Tvrtko Ursulin wrote:
>>>> On 27/09/2023 17:36, Teres Alexis, Alan Previn wrote:
> alan:snip
>>>> It is not possible to wait for lost G2H in something like
>>>> intel_uc_suspend() and simply declare "bad things happened" if it times
>>>> out there, and forcibly clean it all up? (Which would include releasing
>>>> all the abandoned pm refs, so this patch wouldn't be needed.)
>>>>
>>> alan: I'm not sure if intel_uc_suspend should be held up by gt-level wakeref
>>> check unless huc/guc/gsc-uc are the only ones ever taking a gt wakeref.
>>>
>>> As we already know, what we do know from a uc-perspective:
>>> -  ensure the outstanding guc related workers is flushed which we didnt before
>>> (addressed by patch #1).
>>> - any further late H2G-SchedDisable is not leaking wakerefs when calling H2G
>>> and not realizing it failed (addressed by patch #2).
>>> - (we already), "forcibly clean it all up" at the end of the intel_uc_suspend
>>> when we do the guc reset and cleanup all guc-ids. (pre-existing upstream code)
>>> - we previously didnt have a coherrent guarantee that "this is the end" i.e. no
>>> more new request after intel_uc_suspend. I mean by code logic, we thought we did
>>> (thats why intel_uc_suspend ends wth a guc reset), but we now know otherwise.
>>> So we that fix by adding the additional rcu_barrier (also part of patch #2).
>>
>> It is not clear to me from the above if that includes cleaning up the
>> outstanding CT replies or no. But anyway..
> alan: Apologies, i should have made it clearer by citing the actual function
> name calling out the steps of interest: So if you look at the function
> "intel_gt_suspend_late", it calls "intel_uc_suspend" which in turn calls
> "intel_guc_suspend" which does a soft reset onto guc firmware - so after that
> we can assume all outstanding G2Hs are done. Going back up the stack,
> intel_gt_suspend_late finally calls gt_sanitize which calls "intel_uc_reset_prepare"
> which calls "intel_guc_submission_reset_prepare" which calls
> "scrub_guc_desc_for_outstanding_g2h" which does what we are looking for for all
> types of outstanding G2H. As per prior review comments, besides closing the race
> condition, we were missing an rcu_barrier (which caused new requests to come in way
> late). So we have resolved both in Patch #2.

Cool, I read this as all known bugs are fixed by first two patches.

>>> That said, patch-3 is NOT fixing a bug in guc -its about "if we ever have
>>> a future racy gt-wakeref late-leak somewhere - no matter which subsystem
>>> took it (guc is not the only subsystem taking gt wakerefs), we at
>>> least don't hang forever in this code. Ofc, based on that, even without
>>> patch-3 i am confident the issue is resolved anyway.
>>> So we could just drop patch-3 is you prefer?
>>
>> .. given this it does sound to me that if you are confident patch 3
>> isn't fixing anything today that it should be dropped.
> alan: I won't say its NOT fixing anything - i am saying it's not fixing
> this specific bug where we have the outstanding G2H from a context destruction
> operation that got dropped. I am okay with dropping this patch in the next rev
> but shall post a separate stand alone version of Patch3 - because I believe
> all other i915 subsystems that take runtime-pm's DO NOT wait forever when entering
> suspend - but GT is doing this. This means if there ever was a bug introduced,
> it would require serial port or ramoops collection to debug. So i think such a
> patch, despite not fixing this specific bug will be very helpful for debuggability
> of future issues. After all, its better to fail our suspend when we have a bug
> rather than to hang the kernel forever.

Issue I have is that I am not seeing how it fails the suspend when 
nothing is passed out from *void* wait_suspend(gt). To me it looks the 
suspend just carries on. And if so, it sounds dangerous to allow it to 
do that with any future/unknown bugs in the suspend sequence. Existing 
timeout wedges the GPU (and all that entails). New code just says "meh 
I'll just carry on regardless".

Regards,

Tvrtko

