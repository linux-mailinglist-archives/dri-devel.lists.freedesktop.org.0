Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD634C04AD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 23:35:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8588010E3B3;
	Tue, 22 Feb 2022 22:35:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CCBF10E3B3;
 Tue, 22 Feb 2022 22:35:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645569338; x=1677105338;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=UgejPx51ToloZZZLUuw++UN2w5kytsuGlJTnOx1RrFc=;
 b=EzWPqg//Q0b1y2Ei7mRWgmu30le47OsyhwMs8A7aTa398F0sZxmspJN+
 NJSXlc2EZXiiTibqbwgXn0v10AUkAqjWqPX+bxoI61oqkXgUA2GXTcDk4
 LklTFfVRV1H2syArY84meNlm2EP5Y4T/H813EKiQ2QR4AIF6FdkgNAJ9H
 eF5UnZBuVeAs7J5ZK1Ji68bpwXQELloj4do2wNBCE/iCR/M1YiyqlsyTd
 vZhk4oGoNs2t60D4Wc7vIbz1ofGIJhE/H5S23+AGtn5WbiwiehJE3Ehtk
 A5RAF7RlA8SXNrB+ZYFW/HvZX2YTjuIfrhV0kxi60iDir2RDGhVY7Lhcw w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10266"; a="232452172"
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="232452172"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 14:35:37 -0800
X-IronPort-AV: E=Sophos;i="5.88,389,1635231600"; d="scan'208";a="637187120"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 14:35:37 -0800
Date: Tue, 22 Feb 2022 14:35:36 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Michael Cheng <michael.cheng@intel.com>
Subject: Re: [PATCH v10 4/6] drm/i915/gt: Re-work reset_csb
Message-ID: <YhVlOIHOS9wInh8e@mdroper-desk1.amr.corp.intel.com>
References: <20220210183636.1187973-1-michael.cheng@intel.com>
 <20220210183636.1187973-5-michael.cheng@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220210183636.1187973-5-michael.cheng@intel.com>
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

On Thu, Feb 10, 2022 at 10:36:34AM -0800, Michael Cheng wrote:
> Use drm_clflush_virt_range instead of directly invoking clflush. This
> will prevent compiler errors when building for non-x86 architectures.
> 
> v2(Michael Cheng): Remove extra clflush
> 
> v3(Michael Cheng): Remove memory barrier since drm_clflush_virt_range
> 		   takes care of it.
> 
> Signed-off-by: Michael Cheng <michael.cheng@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_execlists_submission.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 6186a5e4b191..11b864fd68a5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -2945,9 +2945,8 @@ reset_csb(struct intel_engine_cs *engine, struct i915_request **inactive)
>  {
>  	struct intel_engine_execlists * const execlists = &engine->execlists;
>  
> -	mb(); /* paranoia: read the CSB pointers from after the reset */
> -	clflush(execlists->csb_write);
> -	mb();
> +	drm_clflush_virt_range(execlists->csb_write,
> +			       sizeof(execlists->csb_write));

I think you technically want sizeof(execlists->csb_write[0]) here,
right?  I.e., the size of the value (32-bits), not the size of the
pointer (32 or 64 depending on architecture).  Not that it will really
change the behavior since it all works out to a single cacheline in the
end.

Aside from that,

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

>  
>  	inactive = process_csb(engine, inactive); /* drain preemption events */
>  
> -- 
> 2.25.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
