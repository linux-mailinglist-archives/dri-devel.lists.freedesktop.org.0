Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1B16ABDA9
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 12:04:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7A410E220;
	Mon,  6 Mar 2023 11:04:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5E710E220;
 Mon,  6 Mar 2023 11:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678100684; x=1709636684;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=59LCx0e7fWrd6zc39JKACRvst+l9vqU1ah4dHd6vhVY=;
 b=hvdclBuyviNU4yxVUPtxcr0Xtix367UAX8jn3gkDxV4sYzgisRaf1ZRQ
 KEMkGcA1SuxKHVBWS9OYFf3d7hzdf+KdxnUnbi/YDQf6pHQetioP/cYZh
 Ub9NrI7/NjGcCSB/VNb7lATsydZjI0m6/TZDZVsnEM+xj/7Rv7iGQWUal
 YIqlPYST/G7hv9FiUrbOhcYPUR4swHGuSfwS3H0oGliMxEuOVG0pCKuHp
 Q2NFKKFu6qoIZPax/u2npCPwRxMr4Vn3T5iD/bsN0L6Hrdpsinr8RmBO6
 kMkYYo/TKnYaeJQ6ptYehQK0DwJBua+xOPYL+EQfao1rw7y8GZf+7mD4t A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="337044161"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="337044161"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 03:04:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="653571159"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="653571159"
Received: from pjgubbin-mobl.ger.corp.intel.com (HELO [10.213.204.143])
 ([10.213.204.143])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 03:04:42 -0800
Message-ID: <6abc2ea5-4d60-765b-a830-ee0225c63871@linux.intel.com>
Date: Mon, 6 Mar 2023 11:04:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] drm/i915/pmu: Use only freq bits for falling back to
 requested freq
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230304012705.70003-1-ashutosh.dixit@intel.com>
 <20230304012705.70003-2-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230304012705.70003-2-ashutosh.dixit@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 04/03/2023 01:27, Ashutosh Dixit wrote:
> On newer generations, the GEN12_RPSTAT1 register contains more than freq
> information, e.g. see GEN12_VOLTAGE_MASK. Therefore use only the freq bits
> to decide whether to fall back to requested freq.

Could you find an appropriate Fixes: tag please? If it can affects a 
platform out of force probe then cc: stable to.

CI is not catching the problem?

> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_pmu.c | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 52531ab28c5f..f0a1e36915b8 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -393,10 +393,8 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
>   		 * case we assume the system is running at the intended
>   		 * frequency. Fortunately, the read should rarely fail!
>   		 */
> -		val = intel_rps_read_rpstat_fw(rps);
> -		if (val)
> -			val = intel_rps_get_cagf(rps, val);
> -		else
> +		val = intel_rps_get_cagf(rps, intel_rps_read_rpstat_fw(rps));

Will this work with gen5_invert_freq as called by intel_rps_get_cagf?

Regards,

Tvrtko

> +		if (!val)
>   			val = rps->cur_freq;
>   
>   		add_sample_mult(&pmu->sample[__I915_SAMPLE_FREQ_ACT],
