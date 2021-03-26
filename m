Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BC8C34A66B
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 12:26:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 807816E12E;
	Fri, 26 Mar 2021 11:26:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98BC6E12E;
 Fri, 26 Mar 2021 11:20:47 +0000 (UTC)
IronPort-SDR: nCKQEil8a9WRxaA0Cy3CONDBXyvGHdTHr2CvUegYKDMJQsyHP6JmiFEN+Qmx7l7FWwOHKamkCI
 eEmxKNq4wb0Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9934"; a="191159431"
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="191159431"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Mar 2021 04:20:46 -0700
IronPort-SDR: cbNbwO3rS0YN3Gh3f1Hqy7Q5yuel5hxMQqg9+KY0lEsufxuampDcvacD/ZWCUYWyS5wGp+qA9V
 q175cF+Dro8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,280,1610438400"; d="scan'208";a="453478461"
Received: from gaia.fi.intel.com ([10.237.72.192])
 by orsmga001.jf.intel.com with ESMTP; 26 Mar 2021 04:20:45 -0700
Received: by gaia.fi.intel.com (Postfix, from userid 1000)
 id E3ADE5C1F43; Fri, 26 Mar 2021 13:20:36 +0200 (EET)
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Take request reference before
 arming the watchdog timer
In-Reply-To: <20210326105759.2387104-1-tvrtko.ursulin@linux.intel.com>
References: <20210326105759.2387104-1-tvrtko.ursulin@linux.intel.com>
Date: Fri, 26 Mar 2021 13:20:36 +0200
Message-ID: <87tuoyyxdn.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 26 Mar 2021 11:26:09 +0000
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com> writes:

> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>
> Reference needs to be taken before arming the timer. Luckily, given the
> default timer period of 20s, the potential to hit the race is extremely
> unlikely.
>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Fixes: 9b4d0598ee94 ("drm/i915: Request watchdog infrastructure")
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
> Test-with: 20210318162400.2065097-1-tvrtko.ursulin@linux.intel.com
> ---
>  drivers/gpu/drm/i915/i915_request.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index 9165971c3c47..bec9c3652188 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -350,6 +350,8 @@ static void __rq_arm_watchdog(struct i915_request *rq)
>  	if (!ce->watchdog.timeout_us)
>  		return;
>  
> +	i915_request_get(rq);
> +
>  	hrtimer_init(&wdg->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
>  	wdg->timer.function = __rq_watchdog_expired;
>  	hrtimer_start_range_ns(&wdg->timer,
> @@ -357,7 +359,6 @@ static void __rq_arm_watchdog(struct i915_request *rq)
>  					   NSEC_PER_USEC),
>  			       NSEC_PER_MSEC,
>  			       HRTIMER_MODE_REL);
> -	i915_request_get(rq);
>  }
>  
>  static void __rq_cancel_watchdog(struct i915_request *rq)
> -- 
> 2.27.0
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
