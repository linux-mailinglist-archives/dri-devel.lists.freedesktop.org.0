Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B853C2B8C
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 01:03:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C405F6E9B1;
	Fri,  9 Jul 2021 23:03:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 181886E9AD;
 Fri,  9 Jul 2021 23:03:25 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10040"; a="207969359"
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="207969359"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 16:03:16 -0700
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="649663637"
Received: from johnharr-mobl1.amr.corp.intel.com (HELO [10.212.142.243])
 ([10.212.142.243])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 16:03:15 -0700
Subject: Re: [PATCH 18/47] drm/i915: Disable preempt busywait when using GuC
 scheduling
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210624070516.21893-1-matthew.brost@intel.com>
 <20210624070516.21893-19-matthew.brost@intel.com>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <bb7c547e-bb3d-ce63-75b4-dada8d501c58@intel.com>
Date: Fri, 9 Jul 2021 16:03:15 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624070516.21893-19-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
Cc: daniele.ceraolospurio@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 6/24/2021 00:04, Matthew Brost wrote:
> Disable preempt busywait when using GuC scheduling. This isn't need as
needed

> the GuC control preemption when scheduling.
controls

With the above fixed:
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>


>
> Cc: John Harrison <john.c.harrison@intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/gen8_engine_cs.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> index 87b06572fd2e..f7aae502ec3d 100644
> --- a/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> +++ b/drivers/gpu/drm/i915/gt/gen8_engine_cs.c
> @@ -506,7 +506,8 @@ gen8_emit_fini_breadcrumb_tail(struct i915_request *rq, u32 *cs)
>   	*cs++ = MI_USER_INTERRUPT;
>   
>   	*cs++ = MI_ARB_ON_OFF | MI_ARB_ENABLE;
> -	if (intel_engine_has_semaphores(rq->engine))
> +	if (intel_engine_has_semaphores(rq->engine) &&
> +	    !intel_uc_uses_guc_submission(&rq->engine->gt->uc))
>   		cs = emit_preempt_busywait(rq, cs);
>   
>   	rq->tail = intel_ring_offset(rq, cs);
> @@ -598,7 +599,8 @@ gen12_emit_fini_breadcrumb_tail(struct i915_request *rq, u32 *cs)
>   	*cs++ = MI_USER_INTERRUPT;
>   
>   	*cs++ = MI_ARB_ON_OFF | MI_ARB_ENABLE;
> -	if (intel_engine_has_semaphores(rq->engine))
> +	if (intel_engine_has_semaphores(rq->engine) &&
> +	    !intel_uc_uses_guc_submission(&rq->engine->gt->uc))
>   		cs = gen12_emit_preempt_busywait(rq, cs);
>   
>   	rq->tail = intel_ring_offset(rq, cs);

