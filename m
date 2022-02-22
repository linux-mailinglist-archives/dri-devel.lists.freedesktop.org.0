Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D624C0450
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 23:04:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B6AF10E4C9;
	Tue, 22 Feb 2022 22:04:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0637D10E4C9;
 Tue, 22 Feb 2022 22:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645567464; x=1677103464;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=gU3YZfHYAMVwMOaaRC1XQxMPzGH70cQ3svHCBaOXC+Y=;
 b=K1E4c5OJZvP4/pKUao/egCd6Rwit7oE7TrWD0yjR+YAsnj5SyfcLX9T7
 8Ax+fSKJBj7XsC/4/aIDrp43hTKDskX2ph1rFtabqtpTPBo9u8Qtqlof5
 tCr0phjsa4bTA+h57LVcuawbwcXjhFOj9pGbDOrgxUvm1hmSEnwrWgDA3
 3bTDbDmp7ROp4tJ3huTbJcAC4+4NhyrYkpU8LXAdmDQE1rOww06s2fmog
 bIoinN2K5RARaoVLWqORAmzDFlVdPwqHJqUU8DfkdzkTQrEilNSWQqM6C
 KqO5PUo+WZKCyAH9T1k7MuCGcAWynrRitPpqKFyCzOi896hDMq8BUPSZd w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="315054339"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="315054339"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 14:04:23 -0800
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="547949317"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 14:04:23 -0800
Date: Tue, 22 Feb 2022 14:04:21 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michael Cheng <michael.cheng@intel.com>
Subject: Re: [PATCH v10 2/6] drm/i915/gt: Re-work intel_write_status_page
Message-ID: <YhVd5bAYTLc9VbDu@mdroper-desk1.amr.corp.intel.com>
References: <20220210183636.1187973-1-michael.cheng@intel.com>
 <20220210183636.1187973-3-michael.cheng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220210183636.1187973-3-michael.cheng@intel.com>
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

On Thu, Feb 10, 2022 at 10:36:32AM -0800, Michael Cheng wrote:
> Re-work intel_write_status_page to use drm_clflush_virt_range. This
> will prevent compiler errors when building for non-x86 architectures.
> 

It looks like this will also cause old x86 cpu's that don't have clflush
to do an extra wbinvd that they didn't do before; based on commit
9a29dd85a09d ("drm/i915: Fixup intel_write_status_page() for old CPUs
without clflush") we were just hoping that they were sufficiently
coherent that we can get away without extra flushing.

As far as I can see, this function is only used from a selftest, not
from real driver codepaths, so the extra flushing shouldn't have any
negative impact on end users.

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_engine.h | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine.h b/drivers/gpu/drm/i915/gt/intel_engine.h
> index 0e353d8c2bc8..986777c2430d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine.h
> +++ b/drivers/gpu/drm/i915/gt/intel_engine.h
> @@ -4,6 +4,7 @@
>  
>  #include <asm/cacheflush.h>
>  #include <drm/drm_util.h>
> +#include <drm/drm_cache.h>
>  
>  #include <linux/hashtable.h>
>  #include <linux/irq_work.h>
> @@ -143,15 +144,9 @@ intel_write_status_page(struct intel_engine_cs *engine, int reg, u32 value)
>  	 * of extra paranoia to try and ensure that the HWS takes the value
>  	 * we give and that it doesn't end up trapped inside the CPU!
>  	 */
> -	if (static_cpu_has(X86_FEATURE_CLFLUSH)) {
> -		mb();
> -		clflush(&engine->status_page.addr[reg]);
> -		engine->status_page.addr[reg] = value;
> -		clflush(&engine->status_page.addr[reg]);
> -		mb();
> -	} else {
> -		WRITE_ONCE(engine->status_page.addr[reg], value);
> -	}
> +	drm_clflush_virt_range(&engine->status_page.addr[reg], sizeof(value));
> +	WRITE_ONCE(engine->status_page.addr[reg], value);
> +	drm_clflush_virt_range(&engine->status_page.addr[reg], sizeof(value));
>  }
>  
>  /*
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
