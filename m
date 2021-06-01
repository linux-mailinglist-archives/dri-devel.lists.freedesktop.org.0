Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C52E13970FF
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jun 2021 12:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CECA86E9D8;
	Tue,  1 Jun 2021 10:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9196E9C3;
 Tue,  1 Jun 2021 10:09:51 +0000 (UTC)
IronPort-SDR: 6n1oTNcSjcecyITXibtqEfuPCCAc67PK6tvtmYx9DzaZXACcVqgunWBafPhtf3lItSkvvFD5xn
 ScV8VpChS56Q==
X-IronPort-AV: E=McAfee;i="6200,9189,10001"; a="203321350"
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="203321350"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:09:50 -0700
IronPort-SDR: B+4luL5ESXs3Zfwqg/yUCLxCMSfaSUsrL8VzPkg0jmQbvJc42PHJwVCU0YKgox3I3CjMIbrCbV
 22yxIsvFfbLQ==
X-IronPort-AV: E=Sophos;i="5.83,239,1616482800"; d="scan'208";a="416426252"
Received: from deancarp-mobl.ger.corp.intel.com (HELO [10.213.232.28])
 ([10.213.232.28])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jun 2021 03:09:49 -0700
Subject: Re: [Intel-gfx] [PATCH 1/1] Let userspace know if they can trust
 timeslicing by including it as part of the
 I915_PARAM_HAS_SCHEDULER::I915_SCHEDULER_CAP_TIMESLICING
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210525135508.244659-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20210525135508.244659-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <b9ae1daa-6add-1c67-58b4-16491f2e1431@linux.intel.com>
 <YK0OHJcSwWY1mm7v@phenom.ffwll.local>
 <8cf2c5f4-87a3-ce6b-150c-65fa054586a4@linux.intel.com>
 <YK9wrCayUwSDzMWG@phenom.ffwll.local>
 <59d2eee9-35c1-01fc-c226-50ad98aadb99@linux.intel.com>
 <YK90LkRrMXTC/hF3@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <e96668b6-47a0-f426-51a8-d9824afd8887@linux.intel.com>
Date: Tue, 1 Jun 2021 11:09:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YK90LkRrMXTC/hF3@phenom.ffwll.local>
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
Cc: intel-gfx@lists.freedesktop.org,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, mahesh.meena@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 27/05/2021 11:27, Daniel Vetter wrote:
> On Thu, May 27, 2021 at 11:22:16AM +0100, Tvrtko Ursulin wrote:
>>
>> On 27/05/2021 11:13, Daniel Vetter wrote:
>>> On Wed, May 26, 2021 at 11:20:13AM +0100, Tvrtko Ursulin wrote:
>>>>
>>>> On 25/05/2021 15:47, Daniel Vetter wrote:
>>>>> On Tue, May 25, 2021 at 03:19:47PM +0100, Tvrtko Ursulin wrote:
>>>>>>
>>>>>> + dri-devel as per process
>>>>>>
>>>>>> On 25/05/2021 14:55, Tejas Upadhyay wrote:
>>>>>>> v2: Only declare timeslicing if we can safely preempt userspace.
>>>>>>
>>>>>> Commit message got butchered up somehow so you'll need to fix that at some
>>>>>> point.
>>>>>>
>>>>>> Regards,
>>>>>>
>>>>>> Tvrtko
>>>>>>
>>>>>>> Fixes: 8ee36e048c98 ("drm/i915/execlists: Minimalistic timeslicing")
>>>>>>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>>>>>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>>>> ---
>>>>>>>      drivers/gpu/drm/i915/gt/intel_engine_user.c | 1 +
>>>>>>>      include/uapi/drm/i915_drm.h                 | 1 +
>>>>>>>      2 files changed, 2 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
>>>>>>> index 3cca7ea2d6ea..12d165566ed2 100644
>>>>>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
>>>>>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
>>>>>>> @@ -98,6 +98,7 @@ static void set_scheduler_caps(struct drm_i915_private *i915)
>>>>>>>      		MAP(HAS_PREEMPTION, PREEMPTION),
>>>>>>>      		MAP(HAS_SEMAPHORES, SEMAPHORES),
>>>>>>>      		MAP(SUPPORTS_STATS, ENGINE_BUSY_STATS),
>>>>>>> +		MAP(TIMESLICE_BIT, TIMESLICING),
>>>>>>>      #undef MAP
>>>>>>>      	};
>>>>>>>      	struct intel_engine_cs *engine;
>>>>>>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>>>>>> index c2c7759b7d2e..af2212d6113c 100644
>>>>>>> --- a/include/uapi/drm/i915_drm.h
>>>>>>> +++ b/include/uapi/drm/i915_drm.h
>>>>>>> @@ -572,6 +572,7 @@ typedef struct drm_i915_irq_wait {
>>>>>>>      #define   I915_SCHEDULER_CAP_PREEMPTION	(1ul << 2)
>>>>>>>      #define   I915_SCHEDULER_CAP_SEMAPHORES	(1ul << 3)
>>>>>>>      #define   I915_SCHEDULER_CAP_ENGINE_BUSY_STATS	(1ul << 4)
>>>>>>> +#define   I915_SCHEDULER_CAP_TIMESLICING	(1ul << 5)
>>>>>
>>>>> Since this is uapi I think we should at least have some nice kerneldoc
>>>>> that explains what exactly this is, what for (link to userspace) and all
>>>>> that. Ideally also minimally filing in the gaps in our uapi docs for stuff
>>>>> this references.
>>>>
>>>> IIUC there is no userspace apart from IGT needing it not to fail scheduling
>>>> tests on ADL.
>>>>
>>>> Current tests use "has preemption + has semaphores" as a proxy to answer the
>>>> "does the kernel support timeslicing" question. This stops working with the
>>>> Guc backend because GuC decided not to support semaphores (for reasons yet
>>>> unknown, see other thread), so explicit "has timeslicing" flag is needed in
>>>> order for tests to know that GuC is supposed to support timeslicing, even if
>>>> it doesn't use semaphores for inter-ring synchronisation.
>>>
>>> Since this if for igt only: Cant we do just extend the check in igt with
>>> an || GEN >= 12? I really hope that our future hw will continue to support
>>> timeslicing ...
>>
>> Not the gen 12 check, but possible I think. Explicit feature test would be better, but if definitely not allowed then along the lines of:
>>
>> has_timeslicing =
>> 	(has_preemption && has_semaphores) || uses_guc_submission;
> 
> That works too. Otoh what exactly is the "uses guc submission" flag and
> why do we have that? I've seen media use it as a stand-in for "does the
> kernel want bonded or parallel ctx?". Maybe another thing to check.
> 
> Another option, if you really think the feature flag is the best approach
> (because future hw will drop timeslicing for some reason), then debugfs is
> the place of igt-only api.

Maybe check and potentially remove all I915_SCHEDULER_CAP_.. flags. It 
could be another easy pickings with a lot of IGT work type endeavour.

Regards,

Tvrtko
