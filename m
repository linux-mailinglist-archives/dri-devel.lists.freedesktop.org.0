Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 452013A1CCE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 20:31:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF716EA95;
	Wed,  9 Jun 2021 18:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F7026EA95;
 Wed,  9 Jun 2021 18:31:06 +0000 (UTC)
IronPort-SDR: /7zTofgrN51Vmij7e1ALenlZt9J3X5ETJx4ERCRRCmXlyqUhFwX2+XCH3HQBO9lnS9RgcZJjZT
 TLD+GM5M3hQg==
X-IronPort-AV: E=McAfee;i="6200,9189,10010"; a="268991697"
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; d="scan'208";a="268991697"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 11:31:05 -0700
IronPort-SDR: lnmHA+e+hAUUN7Vw0gp3Oy14Mz9YU3lB0SlYhr6UNuAliincOux4Vgnkv/gpbk0R8pHzkozsGU
 e88rBEaN+UJA==
X-IronPort-AV: E=Sophos;i="5.83,261,1616482800"; d="scan'208";a="402531898"
Received: from dceraolo-mobl.amr.corp.intel.com (HELO [10.212.56.85])
 ([10.212.56.85])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2021 11:31:05 -0700
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/uc: Use platform specific
 defaults for GuC/HuC enabling
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org
References: <20210603164812.19045-1-matthew.brost@intel.com>
 <20210603164812.19045-2-matthew.brost@intel.com>
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Message-ID: <2eee394b-a040-2912-600c-51c08f9960c9@intel.com>
Date: Wed, 9 Jun 2021 11:31:02 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210603164812.19045-2-matthew.brost@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 6/3/2021 9:48 AM, Matthew Brost wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
>
> The meaning of 'default' for the enable_guc module parameter has been
> updated to accurately reflect what is supported on current platforms.
> So start using the defaults instead of forcing everything off.
> Although, note that right now, the default is for everything to be off
> anyway. So this is not a change for current platforms.
>
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Double checked the CI results and the 2 errors are unrelated.
Pushed to gt-next.

Daniele

> ---
>   drivers/gpu/drm/i915/i915_params.c | 2 +-
>   drivers/gpu/drm/i915/i915_params.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_params.c b/drivers/gpu/drm/i915/i915_params.c
> index 0320878d96b0..e07f4cfea63a 100644
> --- a/drivers/gpu/drm/i915/i915_params.c
> +++ b/drivers/gpu/drm/i915/i915_params.c
> @@ -160,7 +160,7 @@ i915_param_named_unsafe(edp_vswing, int, 0400,
>   i915_param_named_unsafe(enable_guc, int, 0400,
>   	"Enable GuC load for GuC submission and/or HuC load. "
>   	"Required functionality can be selected using bitmask values. "
> -	"(-1=auto, 0=disable [default], 1=GuC submission, 2=HuC load)");
> +	"(-1=auto [default], 0=disable, 1=GuC submission, 2=HuC load)");
>   
>   i915_param_named(guc_log_level, int, 0400,
>   	"GuC firmware logging level. Requires GuC to be loaded. "
> diff --git a/drivers/gpu/drm/i915/i915_params.h b/drivers/gpu/drm/i915/i915_params.h
> index 4a114a5ad000..f27eceb82c0f 100644
> --- a/drivers/gpu/drm/i915/i915_params.h
> +++ b/drivers/gpu/drm/i915/i915_params.h
> @@ -59,7 +59,7 @@ struct drm_printer;
>   	param(int, disable_power_well, -1, 0400) \
>   	param(int, enable_ips, 1, 0600) \
>   	param(int, invert_brightness, 0, 0600) \
> -	param(int, enable_guc, 0, 0400) \
> +	param(int, enable_guc, -1, 0400) \
>   	param(int, guc_log_level, -1, 0400) \
>   	param(char *, guc_firmware_path, NULL, 0400) \
>   	param(char *, huc_firmware_path, NULL, 0400) \

