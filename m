Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1B323BF066
	for <lists+dri-devel@lfdr.de>; Wed,  7 Jul 2021 21:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 433586E1BC;
	Wed,  7 Jul 2021 19:42:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD686E1BC;
 Wed,  7 Jul 2021 19:41:59 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10037"; a="209415787"
X-IronPort-AV: E=Sophos;i="5.84,221,1620716400"; d="scan'208";a="209415787"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 12:41:58 -0700
X-IronPort-AV: E=Sophos;i="5.84,221,1620716400"; d="scan'208";a="449670139"
Received: from mdroper-desk1.fm.intel.com (HELO
 mdroper-desk1.amr.corp.intel.com) ([10.1.27.134])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2021 12:41:58 -0700
Date: Wed, 7 Jul 2021 12:41:56 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Subject: Re: [PATCH 3/3] gpu/drm/i915: nuke old GEN macros
Message-ID: <20210707194156.GR951094@mdroper-desk1.amr.corp.intel.com>
References: <20210707181325.2130821-1-lucas.demarchi@intel.com>
 <20210707181325.2130821-4-lucas.demarchi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210707181325.2130821-4-lucas.demarchi@intel.com>
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

On Wed, Jul 07, 2021 at 11:13:25AM -0700, Lucas De Marchi wrote:
> Now that all the codebase is converted to the new *VER macros, remove
> the old GEN ones.
> 
> Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Matt Roper <matthew.d.roper@intel.com>

We're still going to need another patch or two to kill off
IS_GEN9_{BC,LP}, but we can do that separately.  We're less likely to be
adding new instances of those macros now anyway.

> ---
>  drivers/gpu/drm/i915/i915_drv.h | 15 ---------------
>  1 file changed, 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index 6dff4ca01241..bc6799f75670 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -1243,21 +1243,6 @@ static inline struct drm_i915_private *pdev_to_i915(struct pci_dev *pdev)
>  
>  #define INTEL_DEVID(dev_priv)	(RUNTIME_INFO(dev_priv)->device_id)
>  
> -/*
> - * Deprecated: this will be replaced by individual IP checks:
> - * GRAPHICS_VER(), MEDIA_VER() and DISPLAY_VER()
> - */
> -#define INTEL_GEN(dev_priv)		GRAPHICS_VER(dev_priv)
> -/*
> - * Deprecated: use IS_GRAPHICS_VER(), IS_MEDIA_VER() and IS_DISPLAY_VER() as
> - * appropriate.
> - */
> -#define IS_GEN_RANGE(dev_priv, s, e)	IS_GRAPHICS_VER(dev_priv, (s), (e))
> -/*
> - * Deprecated: use GRAPHICS_VER(), MEDIA_VER() and DISPLAY_VER() as appropriate.
> - */
> -#define IS_GEN(dev_priv, n)		(GRAPHICS_VER(dev_priv) == (n))
> -
>  #define GRAPHICS_VER(i915)		(INTEL_INFO(i915)->graphics_ver)
>  #define IS_GRAPHICS_VER(i915, from, until) \
>  	(GRAPHICS_VER(i915) >= (from) && GRAPHICS_VER(i915) <= (until))
> -- 
> 2.31.1
> 

-- 
Matt Roper
Graphics Software Engineer
VTT-OSGC Platform Enablement
Intel Corporation
(916) 356-2795
