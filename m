Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9692D4C04A3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 23:32:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1705E89C59;
	Tue, 22 Feb 2022 22:32:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9BA189C59;
 Tue, 22 Feb 2022 22:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645569120; x=1677105120;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=MewtKr7ftfS16HioQBVfoeiIGS2K8zmHkkZcx4l4mh8=;
 b=F+Gj0qJ5jwE+edz1ZEAOAitsNTFBtpU57dSgRJfIBN0Zk/guOob79SLw
 9GPrFkpdoJFatqpa5lry18cdqODu+byNkcM8EplKXW0p8xSBLfzikXnCn
 LGqCszzUN8ah5Y5WdeC+ZnwqLLQqS9LIV+zd3RgDgXJM0hMHVJuTnEM4c
 P71Cdhs9K3RQF88cgQnQYvl/cQuNHmvcPlYSWiIMtdYutVgJvloEwd4Wj
 qKtE43b3F8fHlj5hUYUdMC6Bh1nP2pc4A1hC3szK1pavA882RRGoN4Ve1
 0LjVHFf+AV9LagmKL/27ZicC7l7u5vG8ZWRp46IZvZwKu5F/HPKOP+3yF g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="338265632"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="338265632"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 14:32:00 -0800
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="776466929"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 14:32:00 -0800
Date: Tue, 22 Feb 2022 14:31:58 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michael Cheng <michael.cheng@intel.com>
Subject: Re: [PATCH v10 3/6] drm/i915/gt: Drop invalidate_csb_entries
Message-ID: <YhVkXoWfPPr0+5sf@mdroper-desk1.amr.corp.intel.com>
References: <20220210183636.1187973-1-michael.cheng@intel.com>
 <20220210183636.1187973-4-michael.cheng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220210183636.1187973-4-michael.cheng@intel.com>
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
Cc: tvrtko.ursulin@linux.intel.com, balasubramani.vivekanandan@intel.com,
 wayne.boyer@intel.com, intel-gfx@lists.freedesktop.org,
 casey.g.bowman@intel.com, lucas.demarchi@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 10, 2022 at 10:36:33AM -0800, Michael Cheng wrote:
> Drop invalidate_csb_entries and directly call drm_clflush_virt_range.
> This allows for one less function call, and prevent complier errors when
> building for non-x86 architectures.
> 
> v2(Michael Cheng): Drop invalidate_csb_entries function and directly
> 		   invoke drm_clflush_virt_range. Thanks to Tvrtko for the
> 		   sugguestion.
> 
> v3(Michael Cheng): Use correct parameters for drm_clflush_virt_range.
> 		   Thanks to Tvrtko for pointing this out.
> 
> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
> ---
>  .../gpu/drm/i915/gt/intel_execlists_submission.c    | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 9bb7c863172f..6186a5e4b191 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -1646,12 +1646,6 @@ cancel_port_requests(struct intel_engine_execlists * const execlists,
>  	return inactive;
>  }
>  
> -static void invalidate_csb_entries(const u64 *first, const u64 *last)
> -{
> -	clflush((void *)first);
> -	clflush((void *)last);
> -}
> -
>  /*
>   * Starting with Gen12, the status has a new format:
>   *
> @@ -1999,7 +1993,7 @@ process_csb(struct intel_engine_cs *engine, struct i915_request **inactive)
>  	 * the wash as hardware, working or not, will need to do the
>  	 * invalidation before.
>  	 */
> -	invalidate_csb_entries(&buf[0], &buf[num_entries - 1]);
> +	drm_clflush_virt_range(&buf[0], num_entries * sizeof(buf[0]));
>  
>  	/*
>  	 * We assume that any event reflects a change in context flow
> @@ -2783,8 +2777,9 @@ static void reset_csb_pointers(struct intel_engine_cs *engine)
>  
>  	/* Check that the GPU does indeed update the CSB entries! */
>  	memset(execlists->csb_status, -1, (reset_value + 1) * sizeof(u64));
> -	invalidate_csb_entries(&execlists->csb_status[0],
> -			       &execlists->csb_status[reset_value]);
> +	drm_clflush_virt_range(&execlists->csb_status[0],

I think you could simplify the parameter slightly by just writing it as
'execlists->csb_status'

> +			       execlists->csb_size *
> +			       sizeof(execlists->csb_status[0]));

The existing code only issues a clflush for the first and last entries
rather than the range from 0..reset_value, but since there are only a
maximum of 12 u64 entries, which fits into two cachelines, the end
result should be the same either way.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>


>  
>  	/* Once more for luck and our trusty paranoia */
>  	ENGINE_WRITE(engine, RING_CONTEXT_STATUS_PTR,
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
