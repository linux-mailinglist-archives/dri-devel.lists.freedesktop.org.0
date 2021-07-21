Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 457273D0AFD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 11:12:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92BB96E4A7;
	Wed, 21 Jul 2021 09:12:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4FC089811;
 Wed, 21 Jul 2021 09:11:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="191678115"
X-IronPort-AV: E=Sophos;i="5.84,257,1620716400"; d="scan'208";a="191678115"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 02:11:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,257,1620716400"; d="scan'208";a="496546420"
Received: from jcornall-mobl.ger.corp.intel.com (HELO [10.213.197.250])
 ([10.213.197.250])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jul 2021 02:11:56 -0700
Subject: Re: [Intel-gfx] [PATCH 1/4] drm/i915/gt: fix platform prefix
To: Lucas De Marchi <lucas.demarchi@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210720232014.3302645-1-lucas.demarchi@intel.com>
 <20210720232014.3302645-2-lucas.demarchi@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <8aeb1af6-1302-544b-9358-1f292df12c43@linux.intel.com>
Date: Wed, 21 Jul 2021 10:11:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210720232014.3302645-2-lucas.demarchi@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Tomas Winkler <tomas.winkler@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 21/07/2021 00:20, Lucas De Marchi wrote:
> gen8_clear_engine_error_register() is actually not used by
> GRAPHICS_VER >= 8, since for those we are using another register that is
> not engine-dependent. Fix the platform prefix, to make clear we are not
> using any GEN6_RING_FAULT_REG_* one GRAPHICS_VER >= 8.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_gt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> index e714e21c0a4d..a8efdd44e9cf 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> @@ -205,7 +205,7 @@ static void clear_register(struct intel_uncore *uncore, i915_reg_t reg)
>   	intel_uncore_rmw(uncore, reg, 0, 0);
>   }
>   
> -static void gen8_clear_engine_error_register(struct intel_engine_cs *engine)
> +static void gen6_clear_engine_error_register(struct intel_engine_cs *engine)
>   {
>   	GEN6_RING_FAULT_REG_RMW(engine, RING_FAULT_VALID, 0);
>   	GEN6_RING_FAULT_REG_POSTING_READ(engine);
> @@ -251,7 +251,7 @@ intel_gt_clear_error_registers(struct intel_gt *gt,
>   		enum intel_engine_id id;
>   
>   		for_each_engine_masked(engine, gt, engine_mask, id)
> -			gen8_clear_engine_error_register(engine);
> +			gen6_clear_engine_error_register(engine);
>   	}
>   }
>   
> 

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko
