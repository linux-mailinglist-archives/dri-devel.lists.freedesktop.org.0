Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A26A39B1917
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2024 17:27:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B00AF10E414;
	Sat, 26 Oct 2024 15:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c0l4RsQe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02AD810E044;
 Sat, 26 Oct 2024 15:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729956439; x=1761492439;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=V+nfX3nSzb+YI8uVW+jEb7iJhvqZzOd8oemAUy/jUoc=;
 b=c0l4RsQeGpLPyeGRCCQEEAF8OkKzOOBXRj1lUoAJ4W+KNTxK3FchfaS0
 /90A4mjlK3Fcsj9VzSzpPxHCIA0H4IBoHobnwSAD6LoBi6J5tBg9xGKY5
 2RZ4c4x3tcRG73AxGRfiOT6StzjK7xWJz7Q4l5kpofeaPlJQRWXf47hUx
 WnGhU+PAQfQ6EjcNvX2EhTmIx0bIETA15/iYjLOFtooKXcH6+/KoGVSYT
 oCfj7uKwrs8pAhv/yVyLcQpSqZWXrOsV8HJ2aR903y7BhdVgZByzbxq7u
 ZSxtpUDJCgk8ztAkysRiBqbKLwprkeVgDiRNBbMV9B7hkdqyLA3d7kcfO w==;
X-CSE-ConnectionGUID: waSnmJr7Qs6re61SZ/dcZQ==
X-CSE-MsgGUID: MfqbwbrgSNW1YcEzUlDssg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29565655"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="29565655"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2024 08:27:18 -0700
X-CSE-ConnectionGUID: slJ/ljGlTLStWK+5r8OSWQ==
X-CSE-MsgGUID: VXy0XeZGQhGQqx3ooyKQ1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,235,1725346800"; d="scan'208";a="86324174"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Oct 2024 08:27:14 -0700
Date: Sat, 26 Oct 2024 18:27:11 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 jani.nikula@linux.intel.com
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, christian.koenig@amd.com,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
Subject: Re: [PATCH v8 1/4] drm: Introduce device wedged event
Message-ID: <Zx0KT2QIBQyJC7xB@black.fi.intel.com>
References: <20241025084817.144621-1-raag.jadav@intel.com>
 <20241025084817.144621-2-raag.jadav@intel.com>
 <87r084r1lp.fsf@intel.com> <ZxuvJ1Hhv4nt9oSH@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZxuvJ1Hhv4nt9oSH@smile.fi.intel.com>
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

On Fri, Oct 25, 2024 at 05:45:59PM +0300, Andy Shevchenko wrote:
> On Fri, Oct 25, 2024 at 12:08:50PM +0300, Jani Nikula wrote:
> > On Fri, 25 Oct 2024, Raag Jadav <raag.jadav@intel.com> wrote:
> 
> ...
> 
> > > +/*
> > > + * Available recovery methods for wedged device. To be sent along with device
> > > + * wedged uevent.
> > > + */
> > > +static const char *const drm_wedge_recovery_opts[] = {
> > > +	[ffs(DRM_WEDGE_RECOVERY_REBIND) - 1]	= "rebind",
> > > +	[ffs(DRM_WEDGE_RECOVERY_BUS_RESET) - 1]	= "bus-reset",
> > > +};
> > > +static_assert(ARRAY_SIZE(drm_wedge_recovery_opts) == ffs(DRM_WEDGE_RECOVERY_BUS_RESET));
> > 
> > This might work in most cases, but you also might end up finding that
> > there's an arch and compiler combo out there that just won't be able to
> > figure out ffs() at compile time, and the array initialization fails.
> 
> We have ilog2() macro for such cases, but it is rather fls() and not ffs(),
> and I have no idea why ffs() even being used here, especially in the index
> part of the array assignments. It's unreadable.

I initially had __builtin_ffs() in mind which is even more ugly.

> > If that happens, you'd have to either convert back to an enum (and call
> > the wedge event function with BIT(DRM_WEDGE_RECOVERY_REBIND) etc.), or

Which would confuse the users since that's not how enums are normally used.

> > make this a array of structs mapping the macro values to strings and
> > loop over it.

Why not just switch() it?

	for_each_set_bit(opt, &method, size) {
		switch (BIT(opt)) {
		case DRM_WEDGE_RECOVERY_REBIND:
			recovery = "rebind";
			break;
		case DRM_WEDGE_RECOVERY_BUS_RESET:
			recovery = "bus-reset";
			break;
		}

		...
	}

I know we'll have to update it with new additions, but it'd be much simpler,
atleast compared to introducing and maintaining a new struct.

> > Also, the main point of the static assert was to ensure the array is
> > updated when a new recovery option is added, and there's no out of
> > bounds access. That no longer holds, and the static assert is pretty
> > much useless. You still have to manually find and update this.

With above in place this won't be needed.

Raag
