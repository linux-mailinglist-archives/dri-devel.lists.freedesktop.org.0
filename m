Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C928B3A2E5E
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 16:36:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1C036ECD3;
	Thu, 10 Jun 2021 14:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31DAB6ECD3;
 Thu, 10 Jun 2021 14:36:15 +0000 (UTC)
IronPort-SDR: V5Rhfv7tKqs4Vlx5thpsZ8krjaID6IMG6nfLbI0kVJ0BjvbB0oVuKLG8KkOSQugWSueFePGIob
 rwCpmqVeTc1A==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="205342975"
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="205342975"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 07:36:14 -0700
IronPort-SDR: QWWavEbTEniavad8n1R7uDIrnXODM/MxaqihOMTRcuNomJzbqJuTyHKdPcJb8SdvPPX9B9wMZu
 mugTLMTuy2bw==
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; d="scan'208";a="552373518"
Received: from jeremyhi-mobl2.amr.corp.intel.com (HELO intel.com)
 ([10.254.4.145])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2021 07:36:13 -0700
Date: Thu, 10 Jun 2021 10:36:12 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Subject: Re: [Intel-gfx] [PATCH] drm/i915: Add relocation exceptions for two
 other platforms
Message-ID: <YMIjXG1x7dwAsJxj@intel.com>
References: <20210610103955.67802-1-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210610103955.67802-1-zbigniew.kempczynski@intel.com>
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
Cc: Daniel Vetter <daniel.vetter@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 10, 2021 at 12:39:55PM +0200, Zbigniew Kempczyński wrote:
> We have established previously we stop using relocations starting
> from gen12 platforms with Tigerlake as an exception. We keep this
> statement but we want to enable relocations conditionally for
> Rocketlake and Alderlake under require_force_probe flag set.
> 
> Keeping relocations under require_force_probe flag is interim solution
> until IGTs will be rewritten to use softpin.

hmm... to be really honest I'm not so happy that we are introducing
a new criteria to the force_probe.

The criteria was to have a functional driver and not to track uapi.

But on the other hand I do recognize that the current definition
of the flag allows that, because we have established that with
this behavior, the "driver for new Intel graphics devices that
are recognized but not properly supported by this kernel version"
(as stated in the Kconfig for the DRM_I915_FORCE_PROBE).

However...

> 
> v2: - remove inline from function definition (Jani)
>     - fix indentation
> 
> v3: change to GRAPHICS_VER() (Zbigniew)
> 
> Signed-off-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Jason Ekstrand <jason@jlekstrand.net>
> Acked-by: Dave Airlie <airlied@redhat.com>
> ---
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 24 +++++++++++++++----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index a8abc9af5ff4..30c4f0549ea0 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -491,16 +491,30 @@ eb_unreserve_vma(struct eb_vma *ev)
>  	ev->flags &= ~__EXEC_OBJECT_RESERVED;
>  }
>  
> +static bool platform_has_relocs_enabled(const struct i915_execbuffer *eb)
> +{
> +	/*
> +	 * Relocations are disallowed starting from gen12 with Tigerlake
> +	 * as an exception. We allow temporarily use relocations for Rocketlake
> +	 * and Alderlake when require_force_probe flag is set.
> +	 */
> +	if (GRAPHICS_VER(eb->i915) < 12 || IS_TIGERLAKE(eb->i915))
> +		return true;
> +
> +	if (INTEL_INFO(eb->i915)->require_force_probe &&
> +	    (IS_ROCKETLAKE(eb->i915)

This ship has sailed... RKL is not protected by this flag any longer.
Should this be on the TGL side now?

>  || IS_ALDERLAKE_S(eb->i915) ||
> +	     IS_ALDERLAKE_P(eb->i915)))

How to ensure that we will easily catch this when removing the
flag?

I mean, should we have a GEM_BUG or drm_err message when these
platforms in this list has not the required_force_probe?

> +		return true;
> +
> +	return false;
> +}
> +
>  static int
>  eb_validate_vma(struct i915_execbuffer *eb,
>  		struct drm_i915_gem_exec_object2 *entry,
>  		struct i915_vma *vma)
>  {
> -	/* Relocations are disallowed for all platforms after TGL-LP.  This
> -	 * also covers all platforms with local memory.
> -	 */
> -	if (entry->relocation_count &&
> -	    GRAPHICS_VER(eb->i915) >= 12 && !IS_TIGERLAKE(eb->i915))
> +	if (entry->relocation_count && !platform_has_relocs_enabled(eb))
>  		return -EINVAL;
>  
>  	if (unlikely(entry->flags & eb->invalid_flags))
> -- 
> 2.26.0
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
