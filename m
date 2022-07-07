Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7626F56AD6D
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 23:27:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1E6D11A11D;
	Thu,  7 Jul 2022 21:27:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFD4111A10C;
 Thu,  7 Jul 2022 21:27:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657229248; x=1688765248;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=PXbXvmkubPpAjg6VkvBTx8tBZLxZ+6mUsGiUQ/hzeUU=;
 b=R1magvU/wPnS9vM05qJZYsn4kWwyKvjOX6YPrYWcbzea69h+iRjh9DtH
 QZTTWbVm2tpm9KIs2gWcCRRVap4vBF9VrULmgv+zTrY+gxb8JGDPvniWS
 VSJApMb0mnnTDJY2Lywa/BNCn3uE6OdfN+29yrc+OHUQ0rglj9KltikBT
 WQxCPiy3FqqP24eTysC6SHXP0BT3acYacG6w+nk2l0swpJIjAK/qs1O7r
 yARdeyaefGXNI2xp7e50QoS/nPF01xnu2rQafowvhTbrsAeDGiEzEoC2q
 pVv+ZAmGKL/l36qLNj9hk5JqKoy9M0N5fXoWxLCSNGqqKH+in7T3mLNGd Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10401"; a="263907056"
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; d="scan'208";a="263907056"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 14:27:28 -0700
X-IronPort-AV: E=Sophos;i="5.92,253,1650956400"; d="scan'208";a="651297085"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.16.170])
 ([10.213.16.170])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2022 14:27:24 -0700
Message-ID: <4be08bb8-2068-c3b1-3663-5dfb69a66f17@intel.com>
Date: Thu, 7 Jul 2022 23:27:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH v3 1/2] drm/i915/gt: Serialize GRDOM access
 between multiple engine resets
Content-Language: en-US
To: Mauro Carvalho Chehab <mchehab@kernel.org>
References: <cover.1656921701.git.mchehab@kernel.org>
 <ccc54757d89d38af35e5c5885edfb980c7b227f6.1656921701.git.mchehab@kernel.org>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <ccc54757d89d38af35e5c5885edfb980c7b227f6.1656921701.git.mchehab@kernel.org>
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
 linux-kernel@vger.kernel.org, Chris Wilson <chris.p.wilson@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, stable@vger.kernel.org,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04.07.2022 10:09, Mauro Carvalho Chehab wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
> 
> Don't allow two engines to be reset in parallel, as they would both
> try to select a reset bit (and send requests to common registers)
> and wait on that register, at the same time. Serialize control of
> the reset requests/acks using the uncore->lock, which will also ensure
> that no other GT state changes at the same time as the actual reset.
> 
> Cc: stable@vger.kernel.org # Up to 4.4
> Reported-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> Reviewed-by: Andi Shyti <andi.shyti@intel.com>
> Acked-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej

> ---
> 
> To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
> See [PATCH v3 0/2] at: https://lore.kernel.org/all/cover.1656921701.git.mchehab@kernel.org/
> 
>   drivers/gpu/drm/i915/gt/intel_reset.c | 37 ++++++++++++++++++++-------
>   1 file changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index a5338c3fde7a..c68d36fb5bbd 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -300,9 +300,9 @@ static int gen6_hw_domain_reset(struct intel_gt *gt, u32 hw_domain_mask)
>   	return err;
>   }
>   
> -static int gen6_reset_engines(struct intel_gt *gt,
> -			      intel_engine_mask_t engine_mask,
> -			      unsigned int retry)
> +static int __gen6_reset_engines(struct intel_gt *gt,
> +				intel_engine_mask_t engine_mask,
> +				unsigned int retry)
>   {
>   	struct intel_engine_cs *engine;
>   	u32 hw_mask;
> @@ -321,6 +321,20 @@ static int gen6_reset_engines(struct intel_gt *gt,
>   	return gen6_hw_domain_reset(gt, hw_mask);
>   }
>   
> +static int gen6_reset_engines(struct intel_gt *gt,
> +			      intel_engine_mask_t engine_mask,
> +			      unsigned int retry)
> +{
> +	unsigned long flags;
> +	int ret;
> +
> +	spin_lock_irqsave(&gt->uncore->lock, flags);
> +	ret = __gen6_reset_engines(gt, engine_mask, retry);
> +	spin_unlock_irqrestore(&gt->uncore->lock, flags);
> +
> +	return ret;
> +}
> +
>   static struct intel_engine_cs *find_sfc_paired_vecs_engine(struct intel_engine_cs *engine)
>   {
>   	int vecs_id;
> @@ -487,9 +501,9 @@ static void gen11_unlock_sfc(struct intel_engine_cs *engine)
>   	rmw_clear_fw(uncore, sfc_lock.lock_reg, sfc_lock.lock_bit);
>   }
>   
> -static int gen11_reset_engines(struct intel_gt *gt,
> -			       intel_engine_mask_t engine_mask,
> -			       unsigned int retry)
> +static int __gen11_reset_engines(struct intel_gt *gt,
> +				 intel_engine_mask_t engine_mask,
> +				 unsigned int retry)
>   {
>   	struct intel_engine_cs *engine;
>   	intel_engine_mask_t tmp;
> @@ -583,8 +597,11 @@ static int gen8_reset_engines(struct intel_gt *gt,
>   	struct intel_engine_cs *engine;
>   	const bool reset_non_ready = retry >= 1;
>   	intel_engine_mask_t tmp;
> +	unsigned long flags;
>   	int ret;
>   
> +	spin_lock_irqsave(&gt->uncore->lock, flags);
> +
>   	for_each_engine_masked(engine, gt, engine_mask, tmp) {
>   		ret = gen8_engine_reset_prepare(engine);
>   		if (ret && !reset_non_ready)
> @@ -612,17 +629,19 @@ static int gen8_reset_engines(struct intel_gt *gt,
>   	 * This is best effort, so ignore any error from the initial reset.
>   	 */
>   	if (IS_DG2(gt->i915) && engine_mask == ALL_ENGINES)
> -		gen11_reset_engines(gt, gt->info.engine_mask, 0);
> +		__gen11_reset_engines(gt, gt->info.engine_mask, 0);
>   
>   	if (GRAPHICS_VER(gt->i915) >= 11)
> -		ret = gen11_reset_engines(gt, engine_mask, retry);
> +		ret = __gen11_reset_engines(gt, engine_mask, retry);
>   	else
> -		ret = gen6_reset_engines(gt, engine_mask, retry);
> +		ret = __gen6_reset_engines(gt, engine_mask, retry);
>   
>   skip_reset:
>   	for_each_engine_masked(engine, gt, engine_mask, tmp)
>   		gen8_engine_reset_cancel(engine);
>   
> +	spin_unlock_irqrestore(&gt->uncore->lock, flags);
> +
>   	return ret;
>   }
>   

