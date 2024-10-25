Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8DE9B0617
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 16:46:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB01010EB02;
	Fri, 25 Oct 2024 14:46:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DUS86jvD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B1B010EB17;
 Fri, 25 Oct 2024 14:46:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729867567; x=1761403567;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=DWrbCb8jkLSPg12nVfEIzA0zjXePOAd2owE8P9KBnUs=;
 b=DUS86jvDMPoMWSX0LgdURBixvt0yHynN0iuBiC5OtDyvadTzgBEJaXzj
 JI5KgpiQFYQ0G7dKU0WHZsA6DmJDDFgkVThdtLkiDcjO0dA9DrcSycqJk
 Q/fY4Vb3CvyBI/Z4jcSwoluwq8gszWb9apYqipdjraSJ/w+4b5POsy8ge
 fHUXs3tkEFhbRUrAYDxCVzdmx2CyegawWUiXj1rmFpsrmyCRg82DyA2b7
 nL7czMu6l9eKDdFZcS4LxqCxRPMAG90ISPvHa6Pg3dsJREQVvlaVMbCD+
 eaWtON6MiiIH0pQ4KIYGRVxepvcXlOtwbYqLfKDFGoLqLNhTMN7rimu1t w==;
X-CSE-ConnectionGUID: mqzxU+7zTlmtc1kNW9UR6A==
X-CSE-MsgGUID: lRlGxbFrQ8GbzFKD/Ntghw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29670647"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29670647"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 07:46:06 -0700
X-CSE-ConnectionGUID: 7bnmPxxVSPKlCoeAPho3jQ==
X-CSE-MsgGUID: VALqTUHsRWaZefUSBC0uMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,232,1725346800"; d="scan'208";a="80579330"
Received: from smile.fi.intel.com ([10.237.72.154])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 07:46:02 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1t4LZf-00000006wh8-1JgX; Fri, 25 Oct 2024 17:45:59 +0300
Date: Fri, 25 Oct 2024 17:45:59 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com,
 christian.koenig@amd.com, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com,
 andrealmeid@igalia.com, amd-gfx@lists.freedesktop.org,
 kernel-dev@igalia.com
Subject: Re: [PATCH v8 1/4] drm: Introduce device wedged event
Message-ID: <ZxuvJ1Hhv4nt9oSH@smile.fi.intel.com>
References: <20241025084817.144621-1-raag.jadav@intel.com>
 <20241025084817.144621-2-raag.jadav@intel.com>
 <87r084r1lp.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87r084r1lp.fsf@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

On Fri, Oct 25, 2024 at 12:08:50PM +0300, Jani Nikula wrote:
> On Fri, 25 Oct 2024, Raag Jadav <raag.jadav@intel.com> wrote:

...

> > +/*
> > + * Available recovery methods for wedged device. To be sent along with device
> > + * wedged uevent.
> > + */
> > +static const char *const drm_wedge_recovery_opts[] = {
> > +	[ffs(DRM_WEDGE_RECOVERY_REBIND) - 1]	= "rebind",
> > +	[ffs(DRM_WEDGE_RECOVERY_BUS_RESET) - 1]	= "bus-reset",
> > +};
> > +static_assert(ARRAY_SIZE(drm_wedge_recovery_opts) == ffs(DRM_WEDGE_RECOVERY_BUS_RESET));
> 
> This might work in most cases, but you also might end up finding that
> there's an arch and compiler combo out there that just won't be able to
> figure out ffs() at compile time, and the array initialization fails.

We have ilog2() macro for such cases, but it is rather fls() and not ffs(),
and I have no idea why ffs() even being used here, especially in the index
part of the array assignments. It's unreadable.

> If that happens, you'd have to either convert back to an enum (and call
> the wedge event function with BIT(DRM_WEDGE_RECOVERY_REBIND) etc.), or
> make this a array of structs mapping the macro values to strings and
> loop over it.
> 
> Also, the main point of the static assert was to ensure the array is
> updated when a new recovery option is added, and there's no out of
> bounds access. That no longer holds, and the static assert is pretty
> much useless. You still have to manually find and update this.

-- 
With Best Regards,
Andy Shevchenko


