Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA38F512D89
	for <lists+dri-devel@lfdr.de>; Thu, 28 Apr 2022 09:58:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A226E10F3EE;
	Thu, 28 Apr 2022 07:58:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B6C10F2C5;
 Thu, 28 Apr 2022 07:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651132688; x=1682668688;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=qlXIojBuA4nQ8BcOAn+vlOpYi2RoWKk0pt8TTEDyHNQ=;
 b=frEP4uSNE8P7qxnnZOzeeUyv8vpCK7k+eSG073MSHpLgkwSSixeu+33q
 pdhFb1b4dWUgHrh4GPPmcnvU7DsseqoEbbH2S3k0gKn0u03MKh/6LNs+7
 sqBJM3/i751F5IxMUuOZGB3GUSMEsUGjV3RVKESSr8obmwKzwxZlOusK5
 sJe5nmQbyPGykZUGM42Fn+BUPREHLtAGzjCyZbTxvgIMNY2lyOIaiWSw/
 IpoGh4jnvzWtgHR4LyrXixAEbv2511l1nsl77yJvEAp7qK2lVWLK70SgL
 4HtCVPhXKE3W3GZnSfFDGLksWmijjoE96ziw/eRbW2m4nwILVcJkaX+3V A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10330"; a="265722875"
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="265722875"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 00:58:08 -0700
X-IronPort-AV: E=Sophos;i="5.90,295,1643702400"; d="scan'208";a="559521616"
Received: from wdries-mobl1.ger.corp.intel.com (HELO [10.213.210.166])
 ([10.213.210.166])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 00:58:06 -0700
Message-ID: <a55f18bb-0837-aa67-042b-afd0cbe0c124@linux.intel.com>
Date: Thu, 28 Apr 2022 08:58:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v2 3/4] drm/i915/xehp: Add compute engine ABI
Content-Language: en-US
To: Matt Roper <matthew.d.roper@intel.com>, intel-gfx@lists.freedesktop.org
References: <20220428041926.1483683-1-matthew.d.roper@intel.com>
 <20220428041926.1483683-4-matthew.d.roper@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220428041926.1483683-4-matthew.d.roper@intel.com>
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
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Szymon Morek <szymon.morek@intel.com>, dri-devel@lists.freedesktop.org,
 Jordan Justen <jordan.l.justen@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 28/04/2022 05:19, Matt Roper wrote:
> We're now ready to start exposing compute engines to userspace.
> 
> v2:
>   - Move kerneldoc for other engine classes to a separate patch.  (Andi)
> 
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> Cc: Jordan Justen <jordan.l.justen@intel.com>
> Cc: Szymon Morek <szymon.morek@intel.com>
> UMD (mesa): https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/14395

If in doubt cut it out. :) Works for me.

The rest looks complete.

Acked-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Anyone cares to smoke test and update intel_gpu_top to display a nice name?

Regards,

Tvrtko

> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>   drivers/gpu/drm/i915/gt/intel_engine_user.c | 2 +-
>   drivers/gpu/drm/i915/i915_drm_client.c      | 1 +
>   drivers/gpu/drm/i915/i915_drm_client.h      | 2 +-
>   include/uapi/drm/i915_drm.h                 | 9 +++++++++
>   4 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_user.c b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> index 0f6cd96b459f..46a174f8aa00 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_user.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_user.c
> @@ -47,7 +47,7 @@ static const u8 uabi_classes[] = {
>   	[COPY_ENGINE_CLASS] = I915_ENGINE_CLASS_COPY,
>   	[VIDEO_DECODE_CLASS] = I915_ENGINE_CLASS_VIDEO,
>   	[VIDEO_ENHANCEMENT_CLASS] = I915_ENGINE_CLASS_VIDEO_ENHANCE,
> -	/* TODO: Add COMPUTE_CLASS mapping once ABI is available */
> +	[COMPUTE_CLASS] = I915_ENGINE_CLASS_COMPUTE,
>   };
>   
>   static int engine_cmp(void *priv, const struct list_head *A,
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.c b/drivers/gpu/drm/i915/i915_drm_client.c
> index 475a6f824cad..18d38cb59923 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.c
> +++ b/drivers/gpu/drm/i915/i915_drm_client.c
> @@ -81,6 +81,7 @@ static const char * const uabi_class_names[] = {
>   	[I915_ENGINE_CLASS_COPY] = "copy",
>   	[I915_ENGINE_CLASS_VIDEO] = "video",
>   	[I915_ENGINE_CLASS_VIDEO_ENHANCE] = "video-enhance",
> +	[I915_ENGINE_CLASS_COMPUTE] = "compute",
>   };
>   
>   static u64 busy_add(struct i915_gem_context *ctx, unsigned int class)
> diff --git a/drivers/gpu/drm/i915/i915_drm_client.h b/drivers/gpu/drm/i915/i915_drm_client.h
> index 5f5b02b01ba0..f796c5e8e060 100644
> --- a/drivers/gpu/drm/i915/i915_drm_client.h
> +++ b/drivers/gpu/drm/i915/i915_drm_client.h
> @@ -13,7 +13,7 @@
>   
>   #include "gt/intel_engine_types.h"
>   
> -#define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_VIDEO_ENHANCE
> +#define I915_LAST_UABI_ENGINE_CLASS I915_ENGINE_CLASS_COMPUTE
>   
>   struct drm_i915_private;
>   
> diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> index ec000fc6c879..a2def7b27009 100644
> --- a/include/uapi/drm/i915_drm.h
> +++ b/include/uapi/drm/i915_drm.h
> @@ -203,6 +203,15 @@ enum drm_i915_gem_engine_class {
>   	 */
>   	I915_ENGINE_CLASS_VIDEO_ENHANCE	= 3,
>   
> +	/**
> +	 * @I915_ENGINE_CLASS_COMPUTE:
> +	 *
> +	 * Compute engines support a subset of the instructions available
> +	 * on render engines:  compute engines support Compute (GPGPU) and
> +	 * programmable media workloads, but do not support the 3D pipeline.
> +	 */
> +	I915_ENGINE_CLASS_COMPUTE	= 4,
> +
>   	/* Values in this enum should be kept compact. */
>   
>   	/**
