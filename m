Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED77667E4D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 19:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1828610E32B;
	Thu, 12 Jan 2023 18:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCCF910E32B;
 Thu, 12 Jan 2023 18:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673549034; x=1705085034;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yUfwBo9hV7SPPWwPijkwqFrfYtGa43gZ0wEj/9bJrKo=;
 b=F4bNskZTovfk5yiqbRD6QWIQaIhJT/fbibHdg5Uv5Jk5m3ITnB+xJmL/
 0X6MM/fOpBhij2BfMDwPuWDdB0J2OtaeBhe0Y1pWr3jtUFDGommm4xNSK
 MIc6GD822jYJD3D0Q6SML0SCwpR1g2ZgVKSb0Ql5e6tSzeqf92fDowM5N
 GBIUFCzajD1dm6MzHZZHZlMuY5cI5Ex4axYC5x1XPrS3kOtNKiUEcCwnb
 Osjq2ZDgUvZMG48Pjqu4ulCfk69oNZXBtiMFtvuCC2Q0aD38plfhqeJwr
 DFnNEFH0PDmFAJrZ2/kyCTQ8LvA1YGuDv1hpo/lB3utEIRNe48PUhdo/x A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="303490083"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="303490083"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 10:43:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10588"; a="746644252"
X-IronPort-AV: E=Sophos;i="5.97,211,1669104000"; d="scan'208";a="746644252"
Received: from jacton-mobl.ger.corp.intel.com (HELO [10.213.195.171])
 ([10.213.195.171])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 10:43:52 -0800
Message-ID: <dea3a298-eb72-409f-7850-c871604824f9@linux.intel.com>
Date: Thu, 12 Jan 2023 18:43:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [RFC PATCH 04/20] drm/sched: Convert drm scheduler to
 use a work queue rather than kthread
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>
References: <20221230125508.57af8a14@collabora.com>
 <20230102083019.24b99647@collabora.com>
 <7d6df13c-6c2e-d713-edc8-128d6e19f187@linux.intel.com>
 <Y7dEjcuc1arHBTGu@DUT025-TGLU.fm.intel.com>
 <Y7i0J3uQ+izOJcEb@DUT025-TGLU.fm.intel.com>
 <e8c301cb-c7d4-ed54-f3ab-61a5fcc7f940@linux.intel.com>
 <CAOFGe96yeF4SWxvHC5pxyggf=655q7+ZrFS+Zab42F-RE7UK1w@mail.gmail.com>
 <e6512993-5247-a577-abf4-97cdb21358a0@linux.intel.com>
 <CAOFGe957uYdTFccQp36QRJRDkWQZDCB0ztMNDH0=SSf-RTgzLw@mail.gmail.com>
 <705a0b3c-2fe5-0393-0fda-511f288007c7@linux.intel.com>
 <Y78QkWXj6dF5ji7G@DUT025-TGLU.fm.intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <Y78QkWXj6dF5ji7G@DUT025-TGLU.fm.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 11/01/2023 19:40, Matthew Brost wrote:
> On Wed, Jan 11, 2023 at 08:50:37AM +0000, Tvrtko Ursulin wrote:

[snip]

>> This example is where it would hurt on large systems. Imagine only an even
>> wider media transcode card...
>>
>> Second example is only a single engine class used (3d desktop?) but with a
>> bunch of not-runnable jobs queued and waiting on a fence to signal. Implicit
>> or explicit dependencies doesn't matter. Then the fence signals and call
>> backs run. N work items get scheduled, but they all submit to the same HW
>> engine. So we end up with:
>>
>>          /-- wi1 --\
>>         / ..     .. \
>>   cb --+---  wi.. ---+-- rq1 -- .. -- rqN
>>         \ ..    ..  /
>>          \-- wiN --/
>>
>>
>> All that we have achieved is waking up N CPUs to contend on the same lock
>> and effectively insert the job into the same single HW queue. I don't see
>> any positives there.
>>
> 
> I've said this before, the CT channel in practice isn't going to be full
> so the section of code protected by the mutex is really, really small.
> The mutex really shouldn't ever have contention. Also does a mutex spin
> for small period of time before going to sleep? I seem to recall some
> type of core lock did this, if we can use a lock that spins for short
> period of time this argument falls apart.

This argument already fell apart when we established it's the system_wq 
and not the unbound one. So a digression only - it did not fall apart 
because of the CT channel not being ever congested, there would still be 
the question of what's the point to wake up N cpus when there is a 
single work channel in the backend.

You would have been able to bypass all that by inserting work items 
directly, not via the scheduler workers. I thought that was what Jason 
was implying when he mentioned that a better frontend/backend drm 
scheduler split was considered at some point.

Because for 1:1:1, where GuC is truly 1, it does seem it would work 
better if that sort of a split would enable you to queue directly into 
the backend bypassing the kthread/worker / wait_on wake_up dance.

Would that work? From drm_sched_entity_push_job directly to the backend 
- not waking up but *calling* the equivalent of drm_sched_main.

>> Right, that's all solid I think. My takeaway is that frontend priority
>> sorting and that stuff isn't needed and that is okay. And that there are
>> multiple options to maybe improve drm scheduler, like the fore mentioned
>> making it deal with out of order, or split into functional components, or
>> split frontend/backend what you suggested. For most of them cost vs benefit
>> is more or less not completely clear, neither how much effort was invested
>> to look into them.
>>
>> One thing I missed from this explanation is how drm_scheduler per engine
>> class interferes with the high level concepts. And I did not manage to pick
>> up on what exactly is the TDR problem in that case. Maybe the two are one
>> and the same.
>>
>> Bottom line is I still have the concern that conversion to kworkers has an
>> opportunity to regress. Possibly more opportunity for some Xe use cases than
>> to affect other vendors, since they would still be using per physical engine
>> / queue scheduler instances.
>>
> 
> We certainly don't want to affect other vendors but I haven't yet heard
> any push back from other vendors. I don't think speculating about
> potential problems is helpful.

I haven't had any push back on the drm cgroup controller either. :D

>> And to put my money where my mouth is I will try to put testing Xe inside
>> the full blown ChromeOS environment in my team plans. It would probably also
>> be beneficial if Xe team could take a look at real world behaviour of the
>> extreme transcode use cases too. If the stack is ready for that and all. It
>> would be better to know earlier rather than later if there is a fundamental
>> issue.
>>
> 
> We don't have a media UMD yet it will be tough to test at this point in
> time. Also not sure when Xe is going to be POR for a Chrome product
> either so porting Xe into ChromeOS likely isn't a top priority for your
> team. I know from experience that porting things into ChromeOS isn't
> trivial as I've support several of these efforts. Not saying don't do
> this just mentioning the realities of what you are suggesting.

I know, I only said I'd put it in the plans, not that it will happen 
tomorrow.

Regards,

Tvrtko
