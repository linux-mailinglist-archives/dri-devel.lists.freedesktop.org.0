Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3278E666F10
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 11:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41F610E8C2;
	Thu, 12 Jan 2023 10:06:47 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C711010E8C2;
 Thu, 12 Jan 2023 10:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673518005; x=1705054005;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=T43Tj+CPtPKimAqY26twBIzPqHnewT7dmTdem1+3nRo=;
 b=KdhZvtsULulFYBToDMxLt79v5XUiXABYwD+QD8ns8YH2QZRMLlftTnDB
 11jIEJ8vftgbh5wadaCSxtAIWE/JxMPNrnTkXQFjRIu7I6tUBXC5hyioZ
 F4hH2duj/HB+HEzrctrrylimQqMHa+l6y6JQ/Hk6lVWisrOx3fEc95AQl
 80EedsTvvU1q5/jjS4gsCtCQopsMhY7yQcOQCptTJCHYDNj110C4cigY9
 Vv8CB4R/p2ynfkfvJ1s+tfnEvcNbCSW0WwZZipGsMEnKjcgrmjH4x5WzO
 sMWxBbyeyQSWfZ0P25tNRE6CxWsWGoiThaYgEdljaDYBHp1cmucudMnTn A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="321355928"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="321355928"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 02:06:45 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="831636929"
X-IronPort-AV: E=Sophos;i="5.96,319,1665471600"; d="scan'208";a="831636929"
Received: from jacton-mobl.ger.corp.intel.com (HELO [10.213.195.171])
 ([10.213.195.171])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2023 02:06:43 -0800
Message-ID: <dab002d8-75f7-d8b5-d0a0-a6a21ec724b0@linux.intel.com>
Date: Thu, 12 Jan 2023 10:06:41 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [Intel-gfx] [PATCH 2/4] drm/i915: Allow error capture of a
 pending request
Content-Language: en-US
To: John.C.Harrison@Intel.com, Intel-GFX@Lists.FreeDesktop.Org
References: <20230112025311.2577084-1-John.C.Harrison@Intel.com>
 <20230112025311.2577084-3-John.C.Harrison@Intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230112025311.2577084-3-John.C.Harrison@Intel.com>
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


On 12/01/2023 02:53, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> A hang situation has been observed where the only requests on the
> context were either completed or not yet started according to the
> breaadcrumbs. However, the register state claimed a batch was (maybe)
> in progress. So, allow capture of the pending request on the grounds
> that this might be better than nothing.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/i915/i915_gpu_error.c | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_gpu_error.c b/drivers/gpu/drm/i915/i915_gpu_error.c
> index bd2cf7d235df0..2e338a9667a4b 100644
> --- a/drivers/gpu/drm/i915/i915_gpu_error.c
> +++ b/drivers/gpu/drm/i915/i915_gpu_error.c
> @@ -1628,11 +1628,9 @@ capture_engine(struct intel_engine_cs *engine,
>   	if (ce) {
>   		intel_engine_clear_hung_context(engine);
>   		rq = intel_context_find_active_request(ce);
> -		if (rq && !i915_request_started(rq)) {
> -			drm_info(&engine->gt->i915->drm, "Got hung context on %s with no active request!\n",
> -				 engine->name);
> -			rq = NULL;
> -		}
> +		if (rq && !i915_request_started(rq))
> +			drm_info(&engine->gt->i915->drm, "Confused - active request not yet started: %lld:%lld, ce = 0x%04X/%s!\n",
> +				 rq->fence.context, rq->fence.seqno, ce->guc_id.id, engine->name);

Ah you change active to started in this patch! :)

I suggest no "ce" in user visible messages and maybe stick with the 
convention grep suggest is already established:

"Hung context with active request %lld:%lld [0x%04X] not started!"

Regards,

Tvrtko

>   	} else {
>   		/*
>   		 * Getting here with GuC enabled means it is a forced error capture
