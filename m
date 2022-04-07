Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4184F840E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 17:49:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B53C10EB42;
	Thu,  7 Apr 2022 15:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1302B10EB1F;
 Thu,  7 Apr 2022 15:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649346577; x=1680882577;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=XSc8pEK+RI47ykM9bp0qquvx1rqrmsm6Pqs6pey3OWQ=;
 b=MbAqjMV1iuGi2qcwld4qJyBkPudvXZ62CzIupFRlb04yW0Xf/k58HtcI
 AVZQTqqheX6K1oYOErTabhKU1Gu+TFNVgXm89MbhCeRbX+tx/ISDIVYnT
 uEBDILqkaYf3kQc1pADvCRyANNkzrL3onDFuFUC5V8+ZkGRtEP7rkFqZI
 RdBuONr0G8VAp8dP63ZmxdYAiBkPmFxNavXqalabuFpzAYCgRvMRKiXCv
 61kvqf+IIh0fl0OkfsiBMeg8ZgUAdMe0l26VBodRA6fzPgscY1zH6SYBk
 Td22LaFzrJAApVllDAwAjMMvfuPpLm108neSDSty8AERWgG9uZgKpgImG g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10310"; a="261053956"
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="261053956"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 08:49:36 -0700
X-IronPort-AV: E=Sophos;i="5.90,242,1643702400"; d="scan'208";a="550117245"
Received: from twsparks-mobl1.amr.corp.intel.com (HELO [10.212.41.19])
 ([10.212.41.19])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 08:49:35 -0700
Message-ID: <062c1a4b-f35d-6ecf-14a0-b41b438d3464@linux.intel.com>
Date: Thu, 7 Apr 2022 16:49:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [Intel-gfx] [PATCH 1/1] drm/i915/uc: Use platform specific
 defaults for GuC/HuC enabling
Content-Language: en-US
To: Matthew Brost <matthew.brost@intel.com>, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
References: <20210603164812.19045-1-matthew.brost@intel.com>
 <20210603164812.19045-2-matthew.brost@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20210603164812.19045-2-matthew.brost@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03/06/2021 17:48, Matthew Brost wrote:
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

What is the BKM to use this with multi-GPU setups? Specifically I have a 
TGL+DG1 laptop (off the shelf) and want to have GuC with DG1 only. If I 
pass i915.enable_guc=3 it seems it wants to enable it for TGL as well 
and wedges the GPU if it can't?

Regards,

Tvrtko
