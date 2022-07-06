Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D72568626
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 12:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11D14113851;
	Wed,  6 Jul 2022 10:52:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3CC5113851;
 Wed,  6 Jul 2022 10:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657104740; x=1688640740;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=2NwnHUQ+1i1bQIU5tiViEs9faDnwXJ421nhEuxSIMuk=;
 b=m8z0AndhMJvBifm6ML9wpxLTysPWWMyHQ/PRUZJmL6wh7Cv5JNjkTbd5
 mB8tXYNe/Bdi9H9ecN0uXYazAdfAy9nXh7a0QaKusJahD5CJ5bJiHaIlj
 WNpnDPRrM7bHuyf7TxU+sLaSSj+MSP4y/iZ+SC6MPxnOxI+xp0xO0gtJO
 Pg2/wNo5X7zZYrEcH+MtT3jZyiwhKjRrZsmmKR5NdsmuPCa//xo6hfiLT
 /bOr30BPlP0CSxO4ZqHlnxNQ9cnrNHgC4IdFAa9sMmFelarEZZ9aWOvy3
 y5POxlRSRjzGipL/WGqTVaYlHBjZOjqFJjy9iMdTOWrKR6XeDNQDSPjFS w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10399"; a="347696932"
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="347696932"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 03:50:13 -0700
X-IronPort-AV: E=Sophos;i="5.92,249,1650956400"; d="scan'208";a="650610565"
Received: from mropara-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.49.154])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2022 03:50:07 -0700
Date: Wed, 6 Jul 2022 12:50:05 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [PATCH v3 2/2] drm/i915/gt: Serialize TLB invalidates with GT
 resets
Message-ID: <YsVo3ZBHGsodvFwQ@alfio.lan>
References: <cover.1656921701.git.mchehab@kernel.org>
 <3ecc1f94290a66b2e682f956b5232b4903c32a2c.1656921701.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3ecc1f94290a66b2e682f956b5232b4903c32a2c.1656921701.git.mchehab@kernel.org>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Lucas De Marchi <lucas.demarchi@intel.com>, linux-kernel@vger.kernel.org,
 Chris Wilson <chris.p.wilson@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Dave Airlie <airlied@redhat.com>,
 stable@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 John Harrison <John.C.Harrison@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro and Chris,

On Mon, Jul 04, 2022 at 09:09:29AM +0100, Mauro Carvalho Chehab wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> Avoid trying to invalidate the TLB in the middle of performing an
> engine reset, as this may result in the reset timing out. Currently,
> the TLB invalidate is only serialised by its own mutex, forgoing the
> uncore lock, but we can take the uncore->lock as well to serialise
> the mmio access, thereby serialising with the GDRST.
> 
> Tested on a NUC5i7RYB, BIOS RYBDWi35.86A.0380.2019.0517.1530 with
> i915 selftest/hangcheck.
> 
> Cc: stable@vger.kernel.org # Up to 4.4
> Fixes: 7938d61591d3 ("drm/i915: Flush TLBs before releasing backing store")
> Reported-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Tested-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Andi Shyti <andi.shyti@intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v3 0/2] at: https://lore.kernel.org/all/cover.1656921701.git.mchehab@kernel.org/
> 
>  drivers/gpu/drm/i915/gt/intel_gt.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 8da3314bb6bf..68c2b0d8f187 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -952,6 +952,20 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
>  	mutex_lock(&gt->tlb_invalidate_lock);
>  	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
>  
> +	spin_lock_irq(&uncore->lock); /* serialise invalidate with GT reset */
> +
> +	for_each_engine(engine, gt, id) {
> +		struct reg_and_bit rb;
> +
> +		rb = get_reg_and_bit(engine, regs == gen8_regs, regs, num);
> +		if (!i915_mmio_reg_offset(rb.reg))
> +			continue;
> +
> +		intel_uncore_write_fw(uncore, rb.reg, rb.bit);
> +	}
> +
> +	spin_unlock_irq(&uncore->lock);
> +

looks good,

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi

>  	for_each_engine(engine, gt, id) {
>  		/*
>  		 * HW architecture suggest typical invalidation time at 40us,
> @@ -966,7 +980,6 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
>  		if (!i915_mmio_reg_offset(rb.reg))
>  			continue;
>  
> -		intel_uncore_write_fw(uncore, rb.reg, rb.bit);
>  		if (__intel_wait_for_register_fw(uncore,
>  						 rb.reg, rb.bit, 0,
>  						 timeout_us, timeout_ms,
> -- 
> 2.36.1
