Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9D9D12448
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 12:23:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA2110E38A;
	Mon, 12 Jan 2026 11:23:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oB2lvARq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A47110E0D7;
 Mon, 12 Jan 2026 11:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768217035; x=1799753035;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=vpQ9JqNi8vbXtk07HarRI+KUMBkRhb2mbzH+2yXf7sU=;
 b=oB2lvARqcmaPruSYEqRU7duY1Kb/+nVyD/VK5S0riHo4RjXLaHGZlb3F
 db6+q7MpRI9V3AI5mDP/0Y5YtDN8s3fuZeMAz28uRY4sraGUVbggDWRKy
 iIq5kkA2ux7VR+gbbho73Fiy17E9YM75x3Lmj93H3+3iXvjTbxLPIHEsJ
 kLewJIfFpvjQ4RIe1dGlOD46MDXalQvRp2bQoIn9ucc2wWqKODLDkulGk
 27pdYYjC5uPz+WFUPS40KgDVcmvqGjXit4YAJhJc9JiIb/0NZy/Yf7QzB
 kpDH9onVAC9lL0eY2V2jHHkFcl2R2hpBL8en+WLCq9kVk+rCMkz8DZOBD w==;
X-CSE-ConnectionGUID: ZzvpFO/jSqmuD5lu/8xkFQ==
X-CSE-MsgGUID: QZn5J2uSSD+zzFH08IqTDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="57038338"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="57038338"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 03:23:54 -0800
X-CSE-ConnectionGUID: VBTLzxHXRc6HuSdW7ski3g==
X-CSE-MsgGUID: pqAqYpfESSSGTYAIa7xZTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208";a="209139569"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.222])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 03:23:50 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, louis.chauvet@bootlin.com, mwen@igalia.com,
 contact@emersion.fr, alex.hung@amd.com, daniels@collabora.com,
 uma.shankar@intel.com, suraj.kandpal@intel.com, nfraprado@collabora.com,
 ville.syrjala@linux.intel.com, matthew.d.roper@intel.com
Subject: Re: [PATCH v2 05/13] drm/colorop: Add destroy helper for colorop
 objects
In-Reply-To: <20260109081728.478844-6-chaitanya.kumar.borah@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
References: <20260109081728.478844-1-chaitanya.kumar.borah@intel.com>
 <20260109081728.478844-6-chaitanya.kumar.borah@intel.com>
Date: Mon, 12 Jan 2026 13:23:46 +0200
Message-ID: <bd769e61d261899ada538818b5a3923070ba2b72@intel.com>
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

On Fri, 09 Jan 2026, Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com> wrote:
> Add a helper that performs common cleanup and frees the
> associated object. This can be used by drivers if they do not
> require any driver-specific teardown.
>
> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
> Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Reviewed-by: Alex Hung <alex.hung@amd.com>
> ---
>  drivers/gpu/drm/drm_colorop.c | 12 ++++++++++++
>  include/drm/drm_colorop.h     | 10 ++++++++++
>  2 files changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
> index 44eb823585d2..ba19a3ab23cb 100644
> --- a/drivers/gpu/drm/drm_colorop.c
> +++ b/drivers/gpu/drm/drm_colorop.c
> @@ -178,6 +178,18 @@ void drm_colorop_cleanup(struct drm_colorop *colorop)
>  }
>  EXPORT_SYMBOL(drm_colorop_cleanup);
>  
> +/**
> + * drm_colorop_destroy() - Helper for colorop destruction
> + *
> + * @colorop: colorop to destroy
> + */
> +void drm_colorop_destroy(struct drm_colorop *colorop)
> +{
> +	drm_colorop_cleanup(colorop);
> +	kfree(colorop);
> +}
> +EXPORT_SYMBOL(drm_colorop_destroy);
> +
>  /**
>   * drm_colorop_pipeline_destroy - Helper for color pipeline destruction
>   *
> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
> index a3a32f9f918c..0f5ba72c1704 100644
> --- a/include/drm/drm_colorop.h
> +++ b/include/drm/drm_colorop.h
> @@ -420,6 +420,16 @@ void drm_colorop_atomic_destroy_state(struct drm_colorop *colorop,
>   */
>  void drm_colorop_reset(struct drm_colorop *colorop);
>  
> +/**
> + * drm_colorop_destroy - destroy colorop
> + * @colorop: drm colorop
> + *
> + * Destroys @colorop by performing common DRM cleanup and freeing the
> + * colorop object. This can be used by drivers if they do not
> + * require any driver-specific teardown.
> + */

The kernel-doc should be with the function definition, not at the
declaration, and certainly not both.

BR,
Jani.

> +void drm_colorop_destroy(struct drm_colorop *colorop);
> +
>  /**
>   * drm_colorop_index - find the index of a registered colorop
>   * @colorop: colorop to find index for

-- 
Jani Nikula, Intel
