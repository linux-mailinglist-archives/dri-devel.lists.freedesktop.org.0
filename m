Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8E8476C2C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 09:47:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7011B10E322;
	Thu, 16 Dec 2021 08:47:53 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA1A610E322;
 Thu, 16 Dec 2021 08:47:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10199"; a="239661317"
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="239661317"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 00:47:52 -0800
X-IronPort-AV: E=Sophos;i="5.88,211,1635231600"; d="scan'208";a="506194567"
Received: from brazx-mobl.ger.corp.intel.com (HELO [10.213.247.73])
 ([10.213.247.73])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2021 00:47:51 -0800
Message-ID: <71a04b30-7019-f2df-e18d-f04893860e71@linux.intel.com>
Date: Thu, 16 Dec 2021 08:47:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH] drm/i915/guc: Check for wedged before doing
 stuff
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20211215224556.3382217-1-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20211215224556.3382217-1-John.C.Harrison@Intel.com>
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



On 15/12/2021 22:45, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> A fault injection probe test hit a BUG_ON in a GuC error path. It
> showed that the GuC code could potentially attempt to do many things
> when the device is actually wedged. So, add a check in to prevent that.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> index 97311119da6f..88f002c4d41b 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c
> @@ -1350,7 +1350,8 @@ submission_disabled(struct intel_guc *guc)
>   	struct i915_sched_engine * const sched_engine = guc->sched_engine;
>   
>   	return unlikely(!sched_engine ||
> -			!__tasklet_is_enabled(&sched_engine->tasklet));
> +			!__tasklet_is_enabled(&sched_engine->tasklet) ||
> +			test_bit(I915_WEDGED, &guc_to_gt(guc)->reset.flags));

Or intel_gt_is_wedged ?

Regards,

Tvrtko

>   }
>   
>   static void disable_submission(struct intel_guc *guc)
> 
