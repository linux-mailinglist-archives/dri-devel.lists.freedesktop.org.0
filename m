Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F31AAF92F4
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 14:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCDAA10EA27;
	Fri,  4 Jul 2025 12:42:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CkePV5SO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55A9D10EA27;
 Fri,  4 Jul 2025 12:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751632930; x=1783168930;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=JQoQcNTUkJNh0Geiuk0LnrhdRF9g3AgZ2DFB1IvqvEY=;
 b=CkePV5SOp7h6NBEOAmFnvUhkRiURxXwdzPlNau8Nf9wy9K/+5/bQMD5v
 QqXKLnW7qTcIF4JTuIsIgm1GcG85/li293xqrLXewLWlHdJ+FaNEdEKE6
 kuGS6rq2UkKZc+YOxknGkJTKgvo/jBqQ/MGaOKtz+JdO8ablEJRKPdqSB
 6FS8sQoIfaqcjiJTLadG0S/rmxLGQjcLBHptWq8/7oBJkPk5fZsI7RzoQ
 OMvMHtvcZXEdHGUwWXk8NbwjYKMuPu8vS2uQD9qX2Z91k9Zqg04E4AXvn
 ebblHnNNq8qLlGu5ClfdRNGLFO00WeT2c8lDgRWKdYfMrXF3IyLKU3k7s A==;
X-CSE-ConnectionGUID: lFGrYY3uR+2JmR18PoY93A==
X-CSE-MsgGUID: 3ba4L50KTLWigcjMGvgmIA==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="64659403"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="64659403"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:42:10 -0700
X-CSE-ConnectionGUID: NplU6H8GTOSyiwn91WZhIA==
X-CSE-MsgGUID: nPawnnFJQRCUMVrlQZ3KEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; d="scan'208";a="154763260"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jul 2025 05:42:04 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Uma Shankar <uma.shankar@intel.com>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com, Uma
 Shankar <uma.shankar@intel.com>
Subject: Re: [v5 13/24] drm/i915/color: Add callbacks to set plane CTM
In-Reply-To: <20250702091936.3004854-14-uma.shankar@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250702091936.3004854-1-uma.shankar@intel.com>
 <20250702091936.3004854-14-uma.shankar@intel.com>
Date: Fri, 04 Jul 2025 15:42:01 +0300
Message-ID: <0c14645115fc736bb9915f43f6b9f857d4cba71a@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Wed, 02 Jul 2025, Uma Shankar <uma.shankar@intel.com> wrote:
> From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>
> Add callback to intel color functions for setting plane CTM.
>
> v2: adapt to struct intel_display
> v3: add dsb support
>
> Signed-off-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> ---
>  drivers/gpu/drm/i915/display/intel_color.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
> index 7c53572f729b..f7237d00be7a 100644
> --- a/drivers/gpu/drm/i915/display/intel_color.c
> +++ b/drivers/gpu/drm/i915/display/intel_color.c
> @@ -33,6 +33,7 @@
>  #include "intel_dsb.h"
>  #include "intel_vrr.h"
>  #include "skl_universal_plane.h"
> +#include "skl_universal_plane_regs.h"

This patch does not need this.

>  
>  #define PLANE_DEGAMMA_SIZE 128
>  #define PLANE_GAMMA_SIZE 32
> @@ -91,6 +92,10 @@ struct intel_color_funcs {
>  	 * Read config other than LUTs and CSCs, before them. Optional.
>  	 */
>  	void (*get_config)(struct intel_crtc_state *crtc_state);
> +
> +	/* Plane CSC*/
> +	void (*load_plane_csc_matrix)(struct intel_dsb *dsb,
> +				      const struct intel_plane_state *plane_state);
>  };
>  
>  #define CTM_COEFF_SIGN	(1ULL << 63)
> @@ -3971,7 +3976,10 @@ static void
>  intel_color_load_plane_csc_matrix(struct intel_dsb *dsb,
>  				  const struct intel_plane_state *plane_state)
>  {
> -	/* CTM programming */
> +	struct intel_display *display = to_intel_display(plane_state);
> +
> +	if (display->funcs.color->load_plane_csc_matrix)
> +		display->funcs.color->load_plane_csc_matrix(dsb, plane_state);
>  }
>  
>  void intel_color_plane_program_pipeline(struct intel_dsb *dsb,

-- 
Jani Nikula, Intel
