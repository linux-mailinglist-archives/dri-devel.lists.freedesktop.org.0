Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA735B5809
	for <lists+dri-devel@lfdr.de>; Mon, 12 Sep 2022 12:18:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 839EE10E370;
	Mon, 12 Sep 2022 10:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5691310E362;
 Mon, 12 Sep 2022 10:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662977866; x=1694513866;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/MPCcJ4MpKdwDYHL+WW5d/8BsMLAxp/XjAo0FswLV4I=;
 b=GXaxZYsdpNh9/rl4L2bO3erDsU6Hq/GkXLTrySMF8Ux1mwp3mNYFl0K/
 DVEMN1KIEgQFN12ZcbGny4t51JPpg3hELhPFRBbZuAl0/cjl/NomGzscm
 zKPhnEFQ5Jem0TNkiIc1kdKC/xuYXk0LkfLmTdBtqYvafB36qvOFl31XO
 YFBzuMbm3dMBqAHttrA/mZawcivrE2qFgoeYY/0N9lLHqZ+vFHxEQ2jtp
 t5ofRHLZYOxYTZMIXxJvDtvW5CgqsBVtLKCEOmyFS5Ryb3bvhSPbRPpU0
 eyrXZAs2TCFLWfx6dRGsxAhelI4VJxO7rG2Wb+WgSSP6pnHZD4BwbJAs/ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10467"; a="359555325"
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="359555325"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 03:17:45 -0700
X-IronPort-AV: E=Sophos;i="5.93,310,1654585200"; d="scan'208";a="678028256"
Received: from abijaz-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.58.140])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 03:17:41 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Jim Cromie <jim.cromie@gmail.com>, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/9] drm_print: condense enum drm_debug_category
In-Reply-To: <20220912052852.1123868-2-jim.cromie@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220912052852.1123868-1-jim.cromie@gmail.com>
 <20220912052852.1123868-2-jim.cromie@gmail.com>
Date: Mon, 12 Sep 2022 13:17:34 +0300
Message-ID: <87sfkw6gn5.fsf@intel.com>
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
Cc: seanpaul@chromium.org, daniel.vetter@ffwll.ch, joe@perches.com,
 linux@rasmusvillemoes.dk
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 11 Sep 2022, Jim Cromie <jim.cromie@gmail.com> wrote:
> enum drm_debug_category has 10 categories, but is initialized with
> bitmasks which require 10 bits of underlying storage.  By using
> natural enumeration, and moving the BIT(cat) into drm_debug_enabled(),
> the enum fits in 4 bits, allowing the category to be represented
> directly in pr_debug callsites, via the ddebug.class_id field.
>
> While this slightly pessimizes the bit-test in drm_debug_enabled(),
> using dyndbg with JUMP_LABEL will avoid the function entirely.
>
> NOTE: this change forecloses the possibility of doing:
>
>   drm_dbg(DRM_UT_CORE|DRM_UT_KMS, "weird 2-cat experiment")
>
> but thats already strongly implied by the use of the enum itself; its
> not a normal enum if it can be 2 values simultaneously.

The drm.debug module parameter values are, arguably, ABI. There are tons
of people, scripts, test environments, documentation, bug reports, etc,
etc, referring to specific drm.debug module parameter values to enable
specific drm debug logging categories.

AFAICT you're not changing any of the values here, but having an enum
without the hard coded values makes it more likely to accidentally
change the category to bit mapping. At the very least deserves a
comment.


BR,
Jani.


>
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>  include/drm/drm_print.h | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 22fabdeed297..b3b470440e46 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -279,49 +279,49 @@ enum drm_debug_category {
>  	 * @DRM_UT_CORE: Used in the generic drm code: drm_ioctl.c, drm_mm.c,
>  	 * drm_memory.c, ...
>  	 */
> -	DRM_UT_CORE		= 0x01,
> +	DRM_UT_CORE,
>  	/**
>  	 * @DRM_UT_DRIVER: Used in the vendor specific part of the driver: i915,
>  	 * radeon, ... macro.
>  	 */
> -	DRM_UT_DRIVER		= 0x02,
> +	DRM_UT_DRIVER,
>  	/**
>  	 * @DRM_UT_KMS: Used in the modesetting code.
>  	 */
> -	DRM_UT_KMS		= 0x04,
> +	DRM_UT_KMS,
>  	/**
>  	 * @DRM_UT_PRIME: Used in the prime code.
>  	 */
> -	DRM_UT_PRIME		= 0x08,
> +	DRM_UT_PRIME,
>  	/**
>  	 * @DRM_UT_ATOMIC: Used in the atomic code.
>  	 */
> -	DRM_UT_ATOMIC		= 0x10,
> +	DRM_UT_ATOMIC,
>  	/**
>  	 * @DRM_UT_VBL: Used for verbose debug message in the vblank code.
>  	 */
> -	DRM_UT_VBL		= 0x20,
> +	DRM_UT_VBL,
>  	/**
>  	 * @DRM_UT_STATE: Used for verbose atomic state debugging.
>  	 */
> -	DRM_UT_STATE		= 0x40,
> +	DRM_UT_STATE,
>  	/**
>  	 * @DRM_UT_LEASE: Used in the lease code.
>  	 */
> -	DRM_UT_LEASE		= 0x80,
> +	DRM_UT_LEASE,
>  	/**
>  	 * @DRM_UT_DP: Used in the DP code.
>  	 */
> -	DRM_UT_DP		= 0x100,
> +	DRM_UT_DP,
>  	/**
>  	 * @DRM_UT_DRMRES: Used in the drm managed resources code.
>  	 */
> -	DRM_UT_DRMRES		= 0x200,
> +	DRM_UT_DRMRES
>  };
>  
>  static inline bool drm_debug_enabled(enum drm_debug_category category)
>  {
> -	return unlikely(__drm_debug & category);
> +	return unlikely(__drm_debug & BIT(category));
>  }
>  
>  /*

-- 
Jani Nikula, Intel Open Source Graphics Center
