Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6F7D34A5A2
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 11:32:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE7806F3A6;
	Fri, 26 Mar 2021 10:32:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5780D6F3A6;
 Fri, 26 Mar 2021 10:32:10 +0000 (UTC)
IronPort-SDR: ipFTrS+dQNAZV/mk6ILT9vFOvZgVSx+efxxKNc5wJKnCW1SDSeBPk6cAaYOlvLcfD4Z8KpdCXw
 qSGrx8Zmz/ZA==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="178670487"
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="178670487"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 03:32:09 -0700
IronPort-SDR: 72EUJLuOhfNLDLQC8kuGNp2CcVNYRW3THdPZ0zXcmdoduOmGB9W/BHvL78D4IkusaPxaS+cMUU
 dQXUmJdespqw==
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="453466691"
Received: from andrewdo-mobl.ger.corp.intel.com (HELO [10.213.247.55])
 ([10.213.247.55])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 03:32:07 -0700
Subject: Re: [PATCH 5/7] drm/i915: Request watchdog infrastructure
To: Daniel Vetter <daniel@ffwll.ch>
References: <20210324121335.2307063-1-tvrtko.ursulin@linux.intel.com>
 <20210324121335.2307063-6-tvrtko.ursulin@linux.intel.com>
 <YF0kCsX0INuCSBat@phenom.ffwll.local>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <b5c1b7d8-af8b-a219-8faa-da1c69275800@linux.intel.com>
Date: Fri, 26 Mar 2021 10:32:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YF0kCsX0INuCSBat@phenom.ffwll.local>
Content-Language: en-US
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 26/03/2021 00:00, Daniel Vetter wrote:
> On Wed, Mar 24, 2021 at 12:13:33PM +0000, Tvrtko Ursulin wrote:

[snip]

>> +static enum hrtimer_restart __rq_watchdog_expired(struct hrtimer *hrtimer)
>> +{
>> +	struct i915_request *rq =
>> +		container_of(hrtimer, struct i915_request, watchdog.timer);
>> +	struct intel_gt *gt = rq->engine->gt;
>> +
>> +	if (!i915_request_completed(rq)) {
>> +		if (llist_add(&rq->watchdog.link, &gt->watchdog.list))
>> +			schedule_work(&gt->watchdog.work);
>> +	} else {
>> +		i915_request_put(rq);
>> +	}
>> +
>> +	return HRTIMER_NORESTART;
>> +}
>> +
>> +static void __rq_arm_watchdog(struct i915_request *rq)
>> +{
>> +	struct i915_request_watchdog *wdg = &rq->watchdog;
>> +	struct intel_context *ce = rq->context;
>> +
>> +	if (!ce->watchdog.timeout_us)
>> +		return;
>> +
>> +	hrtimer_init(&wdg->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>> +	wdg->timer.function = __rq_watchdog_expired;
>> +	hrtimer_start_range_ns(&wdg->timer,
>> +			       ns_to_ktime(ce->watchdog.timeout_us *
>> +					   NSEC_PER_USEC),
>> +			       NSEC_PER_MSEC,
>> +			       HRTIMER_MODE_REL);
>> +	i915_request_get(rq);
> 
> Shouldn't we grab the new reference before we arm the timer? Either way
> since fairly academic I went ahead and applied, but if you agree pls do a
> follow up patch.

Absolutely true.. my bad.

Regards,

Tvrtko
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
