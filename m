Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 716835EEF74
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 09:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C7210E96D;
	Thu, 29 Sep 2022 07:43:02 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4E9910E2D9;
 Thu, 29 Sep 2022 07:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664437375; x=1695973375;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=GKHSL8cfFYxZ8ydlRB/Xj3NNQE8sEPx5uhxqrl/vJcs=;
 b=k3vApLAerQ+DXr3uyjZ6ihg6Kmsd3/h751YP+TBXLE4fwc+1VEXpCwvr
 L1PVyg0rWBqUjUttHCr3H6QgMe7AaZlCyMkr6BWGmvSMFmCYWG6nyuVQb
 WuhpJpy/alCrukL3vt5pRjj+8qFVs9meEE8NsVcWrxrc1XR7zVhLFxPoe
 rrF7qWW5c+QHaMKboshV8QQsA1/1WuUe/AWMytWCNEiyutWq2fL1qA6+f
 nuMBWPvxmxmIab3wMRbbWBJh2KYsz6KX2m44g/F4PYeea5Z8aGz3uRQ4Z
 939fyuA04TaWPJURxVIrEWs7Mo7m9CfW3tvyTfEN4W/Ev2AQtMEPLo5yZ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="282187908"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="282187908"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 00:42:54 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10484"; a="622249701"
X-IronPort-AV: E=Sophos;i="5.93,354,1654585200"; d="scan'208";a="622249701"
Received: from aknyaze1-mobl.ger.corp.intel.com (HELO [10.213.226.16])
 ([10.213.226.16])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2022 00:42:52 -0700
Message-ID: <a2c2cddf-009b-a2e0-2af2-6f1553c59cbc@linux.intel.com>
Date: Thu, 29 Sep 2022 08:42:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [Intel-gfx] [PATCH v4 3/4] drm/i915: Make the heartbeat play nice
 with long pre-emption timeouts
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20220929021813.2172701-1-John.C.Harrison@Intel.com>
 <20220929021813.2172701-4-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220929021813.2172701-4-John.C.Harrison@Intel.com>
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
Cc: DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 29/09/2022 03:18, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> Compute workloads are inherently not pre-emptible for long periods on
> current hardware. As a workaround for this, the pre-emption timeout
> for compute capable engines was disabled. This is undesirable with GuC
> submission as it prevents per engine reset of hung contexts. Hence the
> next patch will re-enable the timeout but bumped up by an order of
> magnitude.
> 
> However, the heartbeat might not respect that. Depending upon current
> activity, a pre-emption to the heartbeat pulse might not even be
> attempted until the last heartbeat period. Which means that only one
> period is granted for the pre-emption to occur. With the aforesaid
> bump, the pre-emption timeout could be significantly larger than this
> heartbeat period.
> 
> So adjust the heartbeat code to take the pre-emption timeout into
> account. When it reaches the final (high priority) period, it now
> ensures the delay before hitting reset is bigger than the pre-emption
> timeout.
> 
> v2: Fix for selftests which adjust the heartbeat period manually.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   .../gpu/drm/i915/gt/intel_engine_heartbeat.c  | 19 +++++++++++++++++++
>   1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> index a3698f611f457..823a790a0e2ae 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> @@ -22,9 +22,28 @@
>   
>   static bool next_heartbeat(struct intel_engine_cs *engine)
>   {
> +	struct i915_request *rq;
>   	long delay;
>   
>   	delay = READ_ONCE(engine->props.heartbeat_interval_ms);
> +
> +	rq = engine->heartbeat.systole;
> +
> +	if (rq && rq->sched.attr.priority >= I915_PRIORITY_BARRIER &&
> +	    delay == engine->defaults.heartbeat_interval_ms) {

Maybe I forgot but what is the reason for the check against the default 
heartbeat interval?

Regards,

Tvrtko

> +		long longer;
> +
> +		/*
> +		 * The final try is at the highest priority possible. Up until now
> +		 * a pre-emption might not even have been attempted. So make sure
> +		 * this last attempt allows enough time for a pre-emption to occur.
> +		 */
> +		longer = READ_ONCE(engine->props.preempt_timeout_ms) * 2;
> +		longer = intel_clamp_heartbeat_interval_ms(engine, longer);
> +		if (longer > delay)
> +			delay = longer;
> +	}
> +
>   	if (!delay)
>   		return false;
>   
