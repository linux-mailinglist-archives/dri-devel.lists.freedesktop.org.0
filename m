Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF67672377
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jan 2023 17:36:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70F3510E79B;
	Wed, 18 Jan 2023 16:36:35 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1411210E79B;
 Wed, 18 Jan 2023 16:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674059793; x=1705595793;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=OCA06Kmi/2/D8SI/Fy64xbEWpndrW4m4sPoR88m+mqo=;
 b=jF5QkAZlFTdgutbNXks/xGVeskmFa2QlqpdnGf43EixWaRqYLRfG0Q8j
 acEHWqz7qHbu3iyG0E/sOkB+KFOEsE0BcW+P0ia71VCrdF6TFVCzk6FPc
 zNUL+zicYhpEmFJBVrCx+mqhw+RWacun6sAlUxa6z1Qi/dFpNC9vuF2ne
 B7HJnuzhKb1Q9K/bWUTY0ad7FM0QqHLhv9CFguPiqEO/idrY7rMcULMZB
 X7SaZPNnoCl4pQIMQVFldu/YpOKY2j8sjuiq4idxhnzKmBXRQs2lL+Xhe
 a4WVwGMkr2CVdcG66OPDX63IRN7Z2qjQq+AZfYDSvansaa0idsTbg5OBe w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="327099635"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="327099635"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 08:36:02 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="728268014"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; d="scan'208";a="728268014"
Received: from llvincen-mobl.ger.corp.intel.com (HELO [10.213.215.37])
 ([10.213.215.37])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2023 08:36:01 -0800
Message-ID: <79171d6c-0084-5fb8-d507-94235df5df28@linux.intel.com>
Date: Wed, 18 Jan 2023 16:35:59 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH v2 3/5] drm/i915: Allow error capture of a
 pending request
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20230117213630.2897570-1-John.C.Harrison@Intel.com>
 <20230117213630.2897570-4-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230117213630.2897570-4-John.C.Harrison@Intel.com>
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


On 17/01/2023 21:36, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> A hang situation has been observed where the only requests on the
> context were either completed or not yet started according to the
> breaadcrumbs. However, the register state claimed a batch was (maybe)
> in progress. So, allow capture of the pending request on the grounds
> that this might be better than nothing.
> 
> v2: Reword 'not started' warning message (Tvrtko)
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/i915_gpu_error.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index 461489d599a7e..1d33822a8ca23 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1629,12 +1629,9 @@ capture_engine(struct intel_engine_cs *engine,
>   		intel_engine_clear_hung_context(engine);
>   		/* This will reference count the request (if found) */
>   		rq = intel_context_find_active_request(ce);
> -		if (rq && !i915_request_started(rq)) {
> -			drm_info(&engine->gt->i915->drm, "Got hung context on %s with no active request!\n",
> -				 engine->name);
> -			i915_request_put(rq);
> -			rq = NULL;
> -		}
> +		if (rq && !i915_request_started(rq))
> +			drm_info(&engine->gt->i915->drm, "Got hung context on %s with active request %lld:%lld [0x%04X] not yet started\n",
> +				 engine->name, rq->fence.context, rq->fence.seqno, ce->guc_id.id);
>   	} else {
>   		/*
>   		 * Getting here with GuC enabled means it is a forced error capture

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
