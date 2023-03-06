Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD986ABDDE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 12:10:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE5C210E224;
	Mon,  6 Mar 2023 11:10:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA8A610E0B0;
 Mon,  6 Mar 2023 11:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678101028; x=1709637028;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=yvCnMFFbSx8/gyouGbRuNjNoapmvl6TfQCIdUOEQLjI=;
 b=XcbXOPHRikrIEol8rQur6NAbx72rZo3oFfCw7KrvrR98tFkEW3ciTF4y
 0/gWdVBSrMPlcF9vQFK35s5RNUEasaBKPYYmzTpLrUoXoRMmG+DxHyP1+
 vURY5oTqeLJrVCnzJg+VqW644UXOayPjhb+MS/faJ6Simyosy+aYTvEw9
 uzpsrPGDtiX1BkJEVMxHcwt6sWKGu74ATH2kmYYV+njMsdTg4HGhAIc5s
 9uAJPk0cx9/EMw1RHPDM3s6xTPXuBEua21M6kA6WkfbhhsykqFejXm0+G
 RGJx/jvx+YZYw9PfnFcc6IrEZ2kZRTqdIIyIoh+SkVfitUjPb7ODPZSTK w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="319354504"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="319354504"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 03:10:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10640"; a="921879858"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; d="scan'208";a="921879858"
Received: from pjgubbin-mobl.ger.corp.intel.com (HELO [10.213.204.143])
 ([10.213.204.143])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2023 03:10:26 -0800
Message-ID: <6c005534-9919-aad7-eb6c-fba0c8e12448@linux.intel.com>
Date: Mon, 6 Mar 2023 11:10:24 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] drm/i915/pmu: Use correct requested freq for SLPC
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230304012705.70003-1-ashutosh.dixit@intel.com>
 <20230304012705.70003-3-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230304012705.70003-3-ashutosh.dixit@intel.com>
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
> SLPC does not use 'struct intel_rps'. Use UNSLICE_RATIO bits from

Would it be more accurate to say 'SLPC does not use rps->cur_freq' 
rather than it not using struct intel_rps?

Fixes: / stable ? CI chances of catching this?

> GEN6_RPNSWREQ for SLPC. See intel_rps_get_requested_frequency.
> 
> Bspec: 52745
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_pmu.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index f0a1e36915b8..5ee836610801 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -394,8 +394,13 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
>   		 * frequency. Fortunately, the read should rarely fail!
>   		 */
>   		val = intel_rps_get_cagf(rps, intel_rps_read_rpstat_fw(rps));
> -		if (!val)
> -			val = rps->cur_freq;
> +		if (!val) {
> +			if (intel_uc_uses_guc_slpc(&gt->uc))
> +				val = intel_rps_read_punit_req(rps) >>
> +						GEN9_SW_REQ_UNSLICE_RATIO_SHIFT;
> +			else
> +				val = rps->cur_freq;
> +		}

That's a bunch of duplication from intel_rps.c so perhaps the 
appropriate helpers should be exported (some way) from there.

Regards,

Tvrtko

>   
>   		add_sample_mult(&pmu->sample[__I915_SAMPLE_FREQ_ACT],
>   				intel_gpu_freq(rps, val), period_ns / 1000);
