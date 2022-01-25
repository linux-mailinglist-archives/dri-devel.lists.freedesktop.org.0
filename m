Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 113CB49B3EF
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 13:27:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A412910E448;
	Tue, 25 Jan 2022 12:27:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9BAB10E40C;
 Tue, 25 Jan 2022 12:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643113669; x=1674649669;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=PvuK0TaAesXEqlSYRzsYrSd0/arqqxifFe74Pfe05tY=;
 b=WJ+0JQRnNF0lGC37AghYx8pSmBOAJX48ccN3gCWgXjNp+pAZUD3E75w3
 aXs3SdZsRoXiODbbjy5l1UWp4DrgXwtZ1FQZipvR+cF8jhGO0VSuUU52a
 2MiBoRDz0dBUWV8I/aL7C+hZpLTMOT69raW3X1daFtwzl7WwsV9gdE/v6
 DwZBQqvMytF/Y8oHzLa3xd7F+b2gc/6ATg/SXzM0H55qoHk6c514IknSm
 Laa1XnTZbdyES2tECZkPbgoCbImoleV7ZMk4US+3tv4osTCaBaV1iZ1oB
 Z6kojjSVQTodN9odzHbTub2yQnUukn4IjIUR1IIaTSUlMgnVuO4UV+pIu g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="309605487"
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="309605487"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 04:27:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,314,1635231600"; d="scan'208";a="766755817"
Received: from thpham-mobl1.amr.corp.intel.com (HELO [10.213.172.16])
 ([10.213.172.16])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 04:27:44 -0800
Message-ID: <fec72cb6-a008-103e-0f7b-5d6fec548618@linux.intel.com>
Date: Tue, 25 Jan 2022 12:27:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915: Add request cancel low level
 trace point
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20220124150157.15758-1-matthew.brost@intel.com>
 <20220124150157.15758-2-matthew.brost@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220124150157.15758-2-matthew.brost@intel.com>
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


On 24/01/2022 15:01, Matthew Brost wrote:
> Add request cancel trace point guarded by
> CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINT.

Okay-ish I guess (There is pr_notice with the only real caller, but I 
suppose you want it for selftests? Oh yes, why is missing from the 
commit message.), but I'd emit it from i915_request_cancel since that's 
what the tracepoint is called so it fits.

Regards,

Tvrtko

> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_context.h |  1 +
>   drivers/gpu/drm/i915/i915_trace.h       | 10 ++++++++++
>   2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_context.h b/drivers/gpu/drm/i915/gt/intel_context.h
> index d8c74bbf9aae2..3aed4d77f116c 100644
> --- a/drivers/gpu/drm/i915/gt/intel_context.h
> +++ b/drivers/gpu/drm/i915/gt/intel_context.h
> @@ -124,6 +124,7 @@ intel_context_is_pinned(struct intel_context *ce)
>   static inline void intel_context_cancel_request(struct intel_context *ce,
>   						struct i915_request *rq)
>   {
> +	trace_i915_request_cancel(rq);
>   	GEM_BUG_ON(!ce->ops->cancel_request);
>   	return ce->ops->cancel_request(ce, rq);
>   }
> diff --git a/drivers/gpu/drm/i915/i915_trace.h b/drivers/gpu/drm/i915/i915_trace.h
> index 37b5c9e9d260e..d0a11a8bb0ca3 100644
> --- a/drivers/gpu/drm/i915/i915_trace.h
> +++ b/drivers/gpu/drm/i915/i915_trace.h
> @@ -324,6 +324,11 @@ DEFINE_EVENT(i915_request, i915_request_add,
>   );
>   
>   #if defined(CONFIG_DRM_I915_LOW_LEVEL_TRACEPOINTS)
> +DEFINE_EVENT(i915_request, i915_request_cancel,
> +	     TP_PROTO(struct i915_request *rq),
> +	     TP_ARGS(rq)
> +);
> +
>   DEFINE_EVENT(i915_request, i915_request_guc_submit,
>   	     TP_PROTO(struct i915_request *rq),
>   	     TP_ARGS(rq)
> @@ -497,6 +502,11 @@ DEFINE_EVENT(intel_context, intel_context_do_unpin,
>   
>   #else
>   #if !defined(TRACE_HEADER_MULTI_READ)
> +static inline void
> +trace_i915_request_cancel(struct i915_request *rq)
> +{
> +}
> +
>   static inline void
>   trace_i915_request_guc_submit(struct i915_request *rq)
>   {
> 
