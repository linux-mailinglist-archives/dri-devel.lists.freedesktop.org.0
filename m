Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F3398C0D5
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 16:55:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3E8910E642;
	Tue,  1 Oct 2024 14:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gVdG44w/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A92810E2C0;
 Tue,  1 Oct 2024 14:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727794499; x=1759330499;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=ecwBI6yVzkZLIXGC3sGQbIbn+aqLSYy+OdwyEgxXCgo=;
 b=gVdG44w/S0/NZj7iZYj/s+BNZKOAszm6IXYYl+FGfYS7cdAXFWmIarRm
 QkncxrrSTuaaYQdjMg6lhLXdVLaiIPSmic0rniPufowvN7eF+TM/3B54f
 HtBXD6vrkpyj8MOP/hEhd+RyqOWm7MMjDxeuQKgCm9ILzvvZKAap9DGRi
 QgOzz+pkfLr3x2djIh0yiyEiJ0YdIKWxX4tW+YrjB4BMdmhrPRLLiS3zw
 nxYYaZWZT0wiwf88XS5b7SvZm/n+KPu7xhE//81gfp8qudsscgjacBurF
 VK5DLfIHx0sko2rFV63OffpClgHB0k+6/7EiZ3FXcc965bxj6/DYGA738 w==;
X-CSE-ConnectionGUID: gen9IMooTh+rF4ii3eeM1w==
X-CSE-MsgGUID: Dkh2EoSRQtmnmRJ6hfVH9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="49455917"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="49455917"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:54:55 -0700
X-CSE-ConnectionGUID: Q3vajoooSKqRZ8KFv059Fw==
X-CSE-MsgGUID: 6Audy8LHRhqenlYEHO3U5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="73658322"
Received: from smile.fi.intel.com ([10.237.72.54])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 07:54:51 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1sveH1-0000000FEdp-077P; Tue, 01 Oct 2024 17:54:47 +0300
Date: Tue, 1 Oct 2024 17:54:46 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lina@asahilina.net,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 matthew.d.roper@intel.com
Subject: Re: [PATCH v7 1/5] drm: Introduce device wedged event
Message-ID: <ZvwNNsZ85oEAEJvh@smile.fi.intel.com>
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
 <Zvqgz3Vpz2IS1Cua@smile.fi.intel.com>
 <ZvuDwvtyJ4djuIQ7@black.fi.intel.com>
 <ZvvmH0n_y_vVSpvR@smile.fi.intel.com>
 <ZvwEubI8ldUT6TsK@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvwEubI8ldUT6TsK@black.fi.intel.com>
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

On Tue, Oct 01, 2024 at 05:18:33PM +0300, Raag Jadav wrote:
> On Tue, Oct 01, 2024 at 03:07:59PM +0300, Andy Shevchenko wrote:
> > On Tue, Oct 01, 2024 at 08:08:18AM +0300, Raag Jadav wrote:
> > > On Mon, Sep 30, 2024 at 03:59:59PM +0300, Andy Shevchenko wrote:
> > > > On Mon, Sep 30, 2024 at 01:08:41PM +0530, Raag Jadav wrote:

...

> > > > > +static const char *const drm_wedge_recovery_opts[] = {
> > > > > +	[DRM_WEDGE_RECOVERY_REBIND] = "rebind",
> > > > > +	[DRM_WEDGE_RECOVERY_BUS_RESET] = "bus-reset",
> > > > > +	[DRM_WEDGE_RECOVERY_REBOOT] = "reboot",
> > > > > +};
> > > > 
> > > > Place for static_assert() is here, as it closer to the actual data we test...
> > > 
> > > Shouldn't it be at the point of access?
> > 
> > No, the idea of static_assert() is in word 'static', meaning it's allowed to be
> > used in the global space.
> > 
> > > If no, why do we care about the data when it's not being used?
> > 
> > What does this suppose to mean? The assertion is for enforcing the boundaries
> > that are defined by different means (constant of the size and real size of
> > an array).
> 
> The point was to simply not assert without an active user of the array, which is
> not the case now but may be possible with growing functionality in the future.

static_assert() is a compile-time check. How is it even related to this?
So, i.o.w., you are contradicting yourself in this code: on one hand you want
compile-time static checker, on the other you do not want it and rely on the
usage of the function.

Possible solutions:
1) remove static_assert() completely;
2) move it as I said.

-- 
With Best Regards,
Andy Shevchenko


