Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BE196BAC8D
	for <lists+dri-devel@lfdr.de>; Wed, 15 Mar 2023 10:50:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE59710E997;
	Wed, 15 Mar 2023 09:50:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDAE10E98D;
 Wed, 15 Mar 2023 09:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678873821; x=1710409821;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=vLiIArtvwv6c3czwIdb0iwokJ8D5bXEn2Tf2YxLPV2E=;
 b=CrXwSNheaubqjyqmquCkBBtl2S340J1MrHwEQ4LSgt7NBhB5+k2UMIQV
 3Qlcip4qgKa53Bl3ssnDCcjvHQaxv8Ksi+iV86CbBfcoIbbrpw5dwRcMD
 /T1bVT2Op6kL2B9DVCpB+tMuAYbp29+ubVwMpAUD9gumSrxG1gE1SSYZe
 gvdX8Xjkk6tfztEgGth/mIJaWPGfSlGUDy7y147bhmlJiZuWI/415FHvB
 RxpU7qEdoqznFbDcg96umxeXfOhFGeQcx3TJ35VYP3XLq53qQw44ovM0Y
 advFooQkIXIC2qQjJwLZho7wmStrJtwyQH+MMqg+R4+ssodoY5RV+mfes g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="340021913"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="340021913"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 02:50:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10649"; a="743625700"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="743625700"
Received: from mchanan-mobl.ger.corp.intel.com (HELO [10.213.222.39])
 ([10.213.222.39])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 02:50:19 -0700
Message-ID: <f1334ee6-2fb8-3306-2344-0c93b76a886e@linux.intel.com>
Date: Wed, 15 Mar 2023 09:50:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] drm/i915/pmu: Remove fallback to requested freq for
 SLPC
Content-Language: en-US
To: Ashutosh Dixit <ashutosh.dixit@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230310005943.1029333-1-ashutosh.dixit@intel.com>
 <20230310005943.1029333-3-ashutosh.dixit@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20230310005943.1029333-3-ashutosh.dixit@intel.com>
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
 Badal Nilawar <badal.nilawar@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 10/03/2023 00:59, Ashutosh Dixit wrote:
> The fallback to requested freq does not work for SLPC because SLPC does not
> use 'struct intel_rps'. Also for SLPC requested freq can only be obtained
> from a hw register after acquiring forcewake which we don't want to do for
> PMU. Therefore remove fallback to requested freq for SLPC. The actual freq
> will be 0 when gt is in RC6 which is correct. Also this is rare since PMU
> freq sampling happens only when gt is unparked.
> 
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>   drivers/gpu/drm/i915/i915_pmu.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index 7ece883a7d95..f697fabed64a 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -393,7 +393,14 @@ frequency_sample(struct intel_gt *gt, unsigned int period_ns)
>   		 * frequency. Fortunately, the read should rarely fail!
>   		 */
>   		val = intel_rps_read_actual_frequency_fw(rps);
> -		if (!val)
> +
> +		/*
> +		 * SLPC does not use 'struct intel_rps'. Also for SLPC
> +		 * requested freq can only be obtained after acquiring
> +		 * forcewake and reading a hw register. For SLPC just
> +		 * let val be 0
> +		 */
> +		if (!val && !intel_uc_uses_guc_slpc(&gt->uc))
>   			val = intel_gpu_freq(rps, rps->cur_freq);

I really dislike sprinkling of "uses slpc" since I think the thing 
hasn't really been integrated nicely. Case in point is probably the flow 
duality in intel_rps_boost. Data structures as well, even though some 
fields and concepts are shared.

For instance why we can't have the notion of software tracked cur_freq 
in rps, and/or have it zero if with SLPC we can't have it otherwise?

I will abstain, sorry.

Regards,

Tvrtko

>   
>   		add_sample_mult(&pmu->sample[__I915_SAMPLE_FREQ_ACT],
