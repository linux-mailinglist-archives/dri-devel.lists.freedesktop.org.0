Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7FC603AD4
	for <lists+dri-devel@lfdr.de>; Wed, 19 Oct 2022 09:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92F3910F17C;
	Wed, 19 Oct 2022 07:41:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 464D210F17C;
 Wed, 19 Oct 2022 07:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666165259; x=1697701259;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=/1jN73caf/TzFHmQkwC4KF4wR6az/uEpVUj3toyr+DY=;
 b=g23qwDuSiT8H/KhfZfS/Nv+ruyQbSUflqlK2v7+80pZld0sT8QfUhCtG
 NXBV/f1ZnrCAp5/Abb+/EJ2JsOiJ4QE7CVtZXWYnWdM+YybZ5bifc5kmV
 4vwcmROULueBHPPOrR9aaKbNJJ1wTUkPHZYNiYsgq8y3S//1SlY0katf9
 G9s3Xp//e6qmAYFcFB6orcpehjomSezGasi/05bCG69v1EjUdP6CbvBYO
 pPqjMgvV7R8B1zHSBmw+yI1Iziiu0YK9j+28LjKHLC1fY7SAf2WUULch4
 3TGLoTk4WayMyEm5LbZlwPESHqL/uQ4ty4Qr1Hsf8ReGVViKVSfJIPALE w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="392635138"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; d="scan'208";a="392635138"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 00:40:57 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10504"; a="629124770"
X-IronPort-AV: E=Sophos;i="5.95,195,1661842800"; d="scan'208";a="629124770"
Received: from mjmcener-mobl1.amr.corp.intel.com (HELO [10.213.233.40])
 ([10.213.233.40])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2022 00:40:56 -0700
Message-ID: <c46f4714-7c12-c331-ec4f-ab52a7c499cf@linux.intel.com>
Date: Wed, 19 Oct 2022 08:40:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [Intel-gfx] [PATCH] drm/i915/slpc: Optmize waitboost for SLPC
Content-Language: en-US
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20221018221546.17852-1-vinay.belgaumkar@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20221018221546.17852-1-vinay.belgaumkar@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 18/10/2022 23:15, Vinay Belgaumkar wrote:
> Waitboost (when SLPC is enabled) results in a H2G message. This can result
> in thousands of messages during a stress test and fill up an already full
> CTB. There is no need to request for RP0 if GuC is already requesting the
> same.
> 
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_rps.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
> index fc23c562d9b2..a20ae4fceac8 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rps.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rps.c
> @@ -1005,13 +1005,20 @@ void intel_rps_dec_waiters(struct intel_rps *rps)
>   void intel_rps_boost(struct i915_request *rq)
>   {
>   	struct intel_guc_slpc *slpc;
> +	struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
>   
>   	if (i915_request_signaled(rq) || i915_request_has_waitboost(rq))
>   		return;
>   
> +	/* If GuC is already requesting RP0, skip */
> +	if (rps_uses_slpc(rps)) {
> +		slpc = rps_to_slpc(rps);
> +		if (intel_rps_get_requested_frequency(rps) == slpc->rp0_freq)
> +			return;
> +	}
> +

Feels a little bit like a layering violation. Wait boost reference 
counts and request markings will changed based on asynchronous state - a 
mmio read.

Also, a little below we have this:

"""
	/* Serializes with i915_request_retire() */
	if (!test_and_set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags)) {
		struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;

		if (rps_uses_slpc(rps)) {
			slpc = rps_to_slpc(rps);

			/* Return if old value is non zero */
			if (!atomic_fetch_inc(&slpc->num_waiters))

***>>>> Wouldn't it skip doing anything here already? <<<<***

				schedule_work(&slpc->boost_work);

			return;
		}

		if (atomic_fetch_inc(&rps->num_waiters))
			return;
"""

But I wonder if this is not a layering violation already. Looks like one 
for me at the moment. And as it happens there is an ongoing debug of 
clvk slowness where I was a bit puzzled by the lack of "boost fence" in 
trace_printk logs - but now I see how that happens. Does not feel right 
to me that we lose that tracing with SLPC.

So in general - why the correct approach wouldn't be to solve this in 
the worker - which perhaps should fork to slpc specific branch and do 
the consolidations/skips based on mmio reads in there?

Regards,

Tvrtko

>   	/* Serializes with i915_request_retire() */
>   	if (!test_and_set_bit(I915_FENCE_FLAG_BOOST, &rq->fence.flags)) {
> -		struct intel_rps *rps = &READ_ONCE(rq->engine)->gt->rps;
>   
>   		if (rps_uses_slpc(rps)) {
>   			slpc = rps_to_slpc(rps);
