Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 806C756AD73
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 23:28:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF10911A78E;
	Thu,  7 Jul 2022 21:28:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0968811A78E;
 Thu,  7 Jul 2022 21:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657229304; x=1688765304;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=7/TlorJDQoNGY2gktJY2UhvNcAgpTuh1cVKPBgUm+/0=;
 b=Tm50b4H42fMdz2sQmN4SvDtDe+eRjmBzo8Ec9WcriD9bB02AdNzrWGdU
 cqwzwBitEA9/U0qlRd1XKbuHmu3MvT3bm5qLQosjH+BG6pm4Z33aUcKIU
 Iln4bi1OX1WKsPouMw3QoNxWLFsJpo6Qd/zUUxxscZKLCjXmttSbBc1l1
 ZyrNaC6eOFuL/ZAdXQI0yLS741aiczuOdNgbNk+M4NKcgWmLvhpmo+07q
 RKjSH6cayz9ECmcJO1LoYMF8EA3L9MwXSoGu9VRzqY4jDs3AmSouagI5j
 70XF23yHC5VQzbOn5blopSNQ7Z2NbJyd6cIoVKCMZECFf97AFni16GfUE A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="285254116"
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; d="scan'208";a="285254116"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 14:28:23 -0700
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; d="scan'208";a="651297397"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.16.170])
 ([10.213.16.170])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 14:28:20 -0700
Message-ID: <70a63b2e-23f5-9bf8-f782-5941f5cd01fc@intel.com>
Date: Thu, 7 Jul 2022 23:28:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH v3 2/2] drm/i915/gt: Serialize TLB invalidates
 with GT resets
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1656921701.git.mchehab@kernel.org>
 <3ecc1f94290a66b2e682f956b5232b4903c32a2c.1656921701.git.mchehab@kernel.org>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <3ecc1f94290a66b2e682f956b5232b4903c32a2c.1656921701.git.mchehab@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Andi Shyti <andi.shyti@intel.com>, David Airlie <airlied@linux.ie>,
 intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Chris Wilson <chris.p.wilson@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dave Airlie <airlied@redhat.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04.07.2022 10:09, Mauro Carvalho Chehab wrote:
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

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v3 0/2] at: https://lore.kernel.org/all/cover.1656921701.git.mchehab@kernel.org/
> 
>   drivers/gpu/drm/i915/gt/intel_gt.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index 8da3314bb6bf..68c2b0d8f187 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -952,6 +952,20 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
>   	mutex_lock(&gt->tlb_invalidate_lock);
>   	intel_uncore_forcewake_get(uncore, FORCEWAKE_ALL);
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
>   	for_each_engine(engine, gt, id) {
>   		/*
>   		 * HW architecture suggest typical invalidation time at 40us,
> @@ -966,7 +980,6 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
>   		if (!i915_mmio_reg_offset(rb.reg))
>   			continue;
>   
> -		intel_uncore_write_fw(uncore, rb.reg, rb.bit);
>   		if (__intel_wait_for_register_fw(uncore,
>   						 rb.reg, rb.bit, 0,
>   						 timeout_us, timeout_ms,

