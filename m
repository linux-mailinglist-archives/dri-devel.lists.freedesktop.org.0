Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EED45495AA6
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 08:29:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A077610E8EE;
	Fri, 21 Jan 2022 07:28:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 123DC10E8EE;
 Fri, 21 Jan 2022 07:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642750137; x=1674286137;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=LZUw5vSWazE5zadSK8ugmnLN+ut6ie67693EpoTEH8s=;
 b=fHkvcrY24pa0SP0eDSVdDwyDnI4c9FOL8royIin0qYTZ3Jon/f1DFl4e
 +mqsk+4xGW6yX7ZH+FVvWZKdM8GiFcSX0ivn0DnoSSvjpDbEkacFvfkd6
 qW5LTfBxvT1tCgO3ySFN8LeYuXogoBDelUuR+JMgQAP70Zlql4F7xNSJD
 WvrN3+L0nqsyt2WjXuNa0keGTaRuIsqvu7LrPqrQWXW+qnCKdpRt/xsm3
 Sh2L5WZJnlIKV91FUUO95iDpP8AL1VDGHxi0w41ucbqWserjGHPLy+KLW
 gyKwWHShGSCKrJaxeWqDR1fch2dCIHpI81HaDH+KH6woIuRf5VRSdzCBU w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10233"; a="308918636"
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="308918636"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 23:28:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,304,1635231600"; d="scan'208";a="533166129"
Received: from chandra2-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.104])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2022 23:28:53 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] drm/i915/guc: Don't check CT descriptor status
 before CT write / read
In-Reply-To: <20220120183655.3228-2-matthew.brost@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220120183655.3228-1-matthew.brost@intel.com>
 <20220120183655.3228-2-matthew.brost@intel.com>
Date: Fri, 21 Jan 2022 09:28:46 +0200
Message-ID: <87k0et8s41.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: daniele.ceraolospurio@intel.com, john.c.harrison@intel.com,
 michal.wajdeczko@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Jan 2022, Matthew Brost <matthew.brost@intel.com> wrote:
> Don't check CT descriptor status, unless CONFIG_DRM_I915_DEBUG_GUC is
> set, before CT write / read as this could result in a read across the
> PCIe bus thus adding latency to every CT write / read. On well behavied
> systems this vaue should always read as zero. For some reason it doesn't
> the CT channel is broken and will eventually recover from a GT reset,
> albeit the GT reset will not be triggered immediately by seeing that
> descriptor status is non-zero.
>
> v2:
>  (CI)
>   - Fix build error (hide corrupted label in write function behind
>     CONFIG_DRM_I915_DEBUG_GUC)
>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> index de89d40abd38d..948cf31429412 100644
> --- a/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> +++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c
> @@ -379,8 +379,10 @@ static int ct_write(struct intel_guc_ct *ct,
>  	u32 *cmds = ctb->cmds;
>  	unsigned int i;
>  
> +#ifdef CONFIG_DRM_I915_DEBUG_GUC
>  	if (unlikely(desc->status))
>  		goto corrupted;
> +#endif

Please don't add #ifdefs inline. You can use
IS_ENABLED(CONFIG_DRM_I915_DEBUG_GUC) in if statements, but otherwise
the code needs to be split out to a separate function.

BR,
Jani.

>  
>  	GEM_BUG_ON(tail > size);
>  
> @@ -445,11 +447,13 @@ static int ct_write(struct intel_guc_ct *ct,
>  
>  	return 0;
>  
> +#ifdef CONFIG_DRM_I915_DEBUG_GUC
>  corrupted:
>  	CT_ERROR(ct, "Corrupted descriptor head=%u tail=%u status=%#x\n",
>  		 desc->head, desc->tail, desc->status);
>  	ctb->broken = true;
>  	return -EPIPE;
> +#endif
>  }
>  
>  /**
> @@ -815,8 +819,10 @@ static int ct_read(struct intel_guc_ct *ct, struct ct_incoming_msg **msg)
>  	if (unlikely(ctb->broken))
>  		return -EPIPE;
>  
> +#ifdef CONFIG_DRM_I915_DEBUG_GUC
>  	if (unlikely(desc->status))
>  		goto corrupted;
> +#endif
>  
>  	GEM_BUG_ON(head > size);

-- 
Jani Nikula, Intel Open Source Graphics Center
