Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 550F435F760
	for <lists+dri-devel@lfdr.de>; Wed, 14 Apr 2021 17:16:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 202B46E94A;
	Wed, 14 Apr 2021 15:16:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91D166E948;
 Wed, 14 Apr 2021 15:16:16 +0000 (UTC)
IronPort-SDR: OoGK8f9WeS5SgbZ6zlfNPQI4oaDiJOYs7zzYjuLbgUJrTeArbVmRRBPQWWHiGrZusagUtdvVeB
 oRVnLKTL0LiQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9954"; a="279972501"
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; d="scan'208";a="279972501"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 08:16:13 -0700
IronPort-SDR: DLCFbRb2L37VZ+fcE8tXkCv1U2DDcRFnbmSZIB7dDszJKf54pFzWc4VfuAWQEnDHNIO2TQ7XMe
 ta7HWLvUH9yA==
X-IronPort-AV: E=Sophos;i="5.82,222,1613462400"; d="scan'208";a="418359124"
Received: from bdebhal-mobl.ger.corp.intel.com (HELO [10.213.205.119])
 ([10.213.205.119])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 08:16:12 -0700
Subject: Re: [Intel-gfx] [PATCH 08/19] drm/i915: Return error value when bo
 not in LMEM for discrete
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20210412090526.30547-1-matthew.auld@intel.com>
 <20210412090526.30547-9-matthew.auld@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
Message-ID: <28227924-447c-6ceb-eaec-7c55be29b1b1@linux.intel.com>
Date: Wed, 14 Apr 2021 16:16:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210412090526.30547-9-matthew.auld@intel.com>
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
Cc: Mohammed Khajapasha <mohammed.khajapasha@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 12/04/2021 10:05, Matthew Auld wrote:
> From: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
> 
> Return EREMOTE value when frame buffer object is not backed by LMEM
> for discrete. If Local memory is supported by hardware the framebuffer
> backing gem objects should be from local memory.
> 
> Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
> ---
>   drivers/gpu/drm/i915/display/intel_display.c | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 411b46c012f8..57b06d8728af 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -63,6 +63,7 @@
>   #include "display/intel_vdsc.h"
>   #include "display/intel_vrr.h"
>   
> +#include "gem/i915_gem_lmem.h"
>   #include "gem/i915_gem_object.h"
>   
>   #include "gt/intel_rps.h"
> @@ -11279,11 +11280,20 @@ intel_user_framebuffer_create(struct drm_device *dev,
>   	struct drm_framebuffer *fb;
>   	struct drm_i915_gem_object *obj;
>   	struct drm_mode_fb_cmd2 mode_cmd = *user_mode_cmd;
> +	struct drm_i915_private *i915;
>   
>   	obj = i915_gem_object_lookup(filp, mode_cmd.handles[0]);
>   	if (!obj)
>   		return ERR_PTR(-ENOENT);
>   
> +	/* object is backed with LMEM for discrete */
> +	i915 = to_i915(obj->base.dev);
> +	if (HAS_LMEM(i915) && !i915_gem_object_is_lmem(obj)) {
> +		/* object is "remote", not in local memory */
> +		i915_gem_object_put(obj);
> +		return ERR_PTR(-EREMOTE);

I am a fan of rich errnos and this one feels appropriately descriptive, 
but please get an ack from Daniel or so.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Regards,

Tvrtko

> +	}
> +
>   	fb = intel_framebuffer_create(obj, &mode_cmd);
>   	i915_gem_object_put(obj);
>   
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
