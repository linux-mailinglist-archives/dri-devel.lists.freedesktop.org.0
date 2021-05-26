Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E6A3914C5
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 12:20:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F50E6EC5F;
	Wed, 26 May 2021 10:20:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7157E6EC3D;
 Wed, 26 May 2021 10:20:23 +0000 (UTC)
IronPort-SDR: ehxfydNgO7bRKRjoRN4bR8Wu6mNywhG+z+yhY+vhEBzfhtpHut544e7pIrn0k8JnUjqiCzXyTe
 Tpp28TtrP3xw==
X-IronPort-AV: E=McAfee;i="6200,9189,9995"; a="200532960"
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="200532960"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 03:20:18 -0700
IronPort-SDR: Wf2O0sWu0iJUUiFExmEu/N8/u6ZoGMkLl3ua7stbGlwlgD6nmWsQcU82nIa7Fzp2CF4z6wvQyS
 nXGekskQy92w==
X-IronPort-AV: E=Sophos;i="5.82,331,1613462400"; d="scan'208";a="479873638"
Received: from wardmich-mobl.ger.corp.intel.com (HELO [10.213.209.181])
 ([10.213.209.181])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 03:20:16 -0700
Subject: Re: [Intel-gfx] [PATCH 1/1] Let userspace know if they can trust
 timeslicing by including it as part of the
 I915_PARAM_HAS_SCHEDULER::I915_SCHEDULER_CAP_TIMESLICING
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210525135508.244659-1-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <20210525135508.244659-2-tejaskumarx.surendrakumar.upadhyay@intel.com>
 <b9ae1daa-6add-1c67-58b4-16491f2e1431@linux.intel.com>
 <YK0OHJcSwWY1mm7v@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <8cf2c5f4-87a3-ce6b-150c-65fa054586a4@linux.intel.com>
Date: Wed, 26 May 2021 11:20:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YK0OHJcSwWY1mm7v@phenom.ffwll.local>
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


On 25/05/2021 15:47, Daniel Vetter wrote:
> On Tue, May 25, 2021 at 03:19:47PM +0100, Tvrtko Ursulin wrote:
>>
>> + dri-devel as per process
>>
>> On 25/05/2021 14:55, Tejas Upadhyay wrote:
>>> v2: Only declare timeslicing if we can safely preempt userspace.
>>
>> Commit message got butchered up somehow so you'll need to fix that at some
>> point.
>>
>> Regards,
>>
>> Tvrtko
>>
>>> Fixes: 8ee36e048c98 ("drm/i915/execlists: Minimalistic timeslicing")
>>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>>> Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>> ---
>>>    drivers/gpu/drm/i915/gt/intel_engine_user.c | 1 +
>>>    include/uapi/drm/i915_drm.h                 | 1 +
>>>    2 files changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
>>> index 3cca7ea2d6ea..12d165566ed2 100644
>>> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
>>> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
>>> @@ -98,6 +98,7 @@ static void set_scheduler_caps(struct drm_i915_private *i915)
>>>    		MAP(HAS_PREEMPTION, PREEMPTION),
>>>    		MAP(HAS_SEMAPHORES, SEMAPHORES),
>>>    		MAP(SUPPORTS_STATS, ENGINE_BUSY_STATS),
>>> +		MAP(TIMESLICE_BIT, TIMESLICING),
>>>    #undef MAP
>>>    	};
>>>    	struct intel_engine_cs *engine;
>>> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
>>> index c2c7759b7d2e..af2212d6113c 100644
>>> --- a/include/uapi/drm/i915_drm.h
>>> +++ b/include/uapi/drm/i915_drm.h
>>> @@ -572,6 +572,7 @@ typedef struct drm_i915_irq_wait {
>>>    #define   I915_SCHEDULER_CAP_PREEMPTION	(1ul << 2)
>>>    #define   I915_SCHEDULER_CAP_SEMAPHORES	(1ul << 3)
>>>    #define   I915_SCHEDULER_CAP_ENGINE_BUSY_STATS	(1ul << 4)
>>> +#define   I915_SCHEDULER_CAP_TIMESLICING	(1ul << 5)
> 
> Since this is uapi I think we should at least have some nice kerneldoc
> that explains what exactly this is, what for (link to userspace) and all
> that. Ideally also minimally filing in the gaps in our uapi docs for stuff
> this references.

IIUC there is no userspace apart from IGT needing it not to fail 
scheduling tests on ADL.

Current tests use "has preemption + has semaphores" as a proxy to answer 
the "does the kernel support timeslicing" question. This stops working 
with the Guc backend because GuC decided not to support semaphores (for 
reasons yet unknown, see other thread), so explicit "has timeslicing" 
flag is needed in order for tests to know that GuC is supposed to 
support timeslicing, even if it doesn't use semaphores for inter-ring 
synchronisation.

Regards,

Tvrtko
