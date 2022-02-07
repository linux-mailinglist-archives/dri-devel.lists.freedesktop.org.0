Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 716AA4ABD21
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 12:57:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9270310F958;
	Mon,  7 Feb 2022 11:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17E1810F957;
 Mon,  7 Feb 2022 11:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644235067; x=1675771067;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=/5SNVjdQs30ggBa+/icV1yYk2nVduQHv6WwVWN1TLfo=;
 b=A8AY+hiYMHCqFtG/5vQe74V8lWQYYpf6gAAhfoH9SBB5R+4Dhmvyi7M/
 G7QCj5lys5r3tkHRbWd5oWmZi9cNLtvNYn8bOMJdxtg3zt9egYvDjdXJ9
 W3vJFGlLbq6wcicx9kHq50IIxBwuE25HeuPKzM2mCSfAwy/SEpAgTofoG
 CV7vfVrXznGEOMZorx+VpbVd5rMxI5GN4WAsWHbn4U+KxFGwgSfe3DogD
 cXeWR0NJTV5BVRTfOLhZAkyl3tVh52eQLt7Y7Zkpvuqglo4dTK4qMmyHT
 2a1Ths6Jzlm6JsE6GVQdn2Todaxs4Ko6gX8ucAiniYEOEFepdY7OVkZ9r Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="311998099"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="311998099"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 03:57:46 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600"; d="scan'208";a="481563904"
Received: from conroyco-mobl2.ger.corp.intel.com (HELO [10.213.251.21])
 ([10.213.251.21])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 03:57:44 -0800
Message-ID: <9db989f9-5d56-5b17-0075-9bdb0af5d25c@linux.intel.com>
Date: Mon, 7 Feb 2022 11:57:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 2/5] drm/i915/gt: Drop invalidate_csb_entries
Content-Language: en-US
To: Michael Cheng <michael.cheng@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220204163711.439403-1-michael.cheng@intel.com>
 <20220204163711.439403-3-michael.cheng@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220204163711.439403-3-michael.cheng@intel.com>
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
Cc: casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org, wayne.boyer@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/02/2022 16:37, Michael Cheng wrote:
> Drop invalidate_csb_entries and directly call drm_clflush_virt_range.
> This allows for one less function call, and prevent complier errors when
> building for non-x86 architectures.
> 
> v2(Michael Cheng): Drop invalidate_csb_entries function and directly
> 		   invoke drm_clflush_virt_range. Thanks to Tvrtko for the
> 		   sugguestion.
> 
> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 9bb7c863172f..7500c06562da 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -1646,12 +1646,6 @@ cancel_port_requests(struct intel_engine_execlists * const execlists,
>   	return inactive;
>   }
>   
> -static void invalidate_csb_entries(const u64 *first, const u64 *last)
> -{
> -	clflush((void *)first);
> -	clflush((void *)last);
> -}
> -
>   /*
>    * Starting with Gen12, the status has a new format:
>    *
> @@ -1999,7 +1993,7 @@ process_csb(struct intel_engine_cs *engine, struct i915_request **inactive)
>   	 * the wash as hardware, working or not, will need to do the
>   	 * invalidation before.
>   	 */
> -	invalidate_csb_entries(&buf[0], &buf[num_entries - 1]);
> +	drm_clflush_virt_range(&buf[0], num_entries * sizeof(buf[0]));
>   
>   	/*
>   	 * We assume that any event reflects a change in context flow
> @@ -2783,8 +2777,8 @@ static void reset_csb_pointers(struct intel_engine_cs *engine)
>   
>   	/* Check that the GPU does indeed update the CSB entries! */
>   	memset(execlists->csb_status, -1, (reset_value + 1) * sizeof(u64));
> -	invalidate_csb_entries(&execlists->csb_status[0],
> -			       &execlists->csb_status[reset_value]);
> +	drm_clflush_virt_range(&execlists->csb_status[0],
> +				sizeof(&execlists->csb_status[reset_value]));

Hm I thought we covered this already, should be:

drm_clflush_virt_range(&execlists->csb_status[0],
		       execlists->csb_size * sizeof(execlists->csb_status[0]));

Regards,

Tvrtko

>   
>   	/* Once more for luck and our trusty paranoia */
>   	ENGINE_WRITE(engine, RING_CONTEXT_STATUS_PTR,
