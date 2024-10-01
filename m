Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 288D498BBCC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 14:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F396F10E1E1;
	Tue,  1 Oct 2024 12:08:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TFWieGZG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E6F10E154;
 Tue,  1 Oct 2024 12:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727784488; x=1759320488;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=D3kQ/KMUiTV+0NS0HrW5LfZMjysK4yjbjcsTbLYtz2I=;
 b=TFWieGZGIEX+RrdJb8EFOCf0si4Z30jLB7vnHP1ysbK8mlHUrIY7fQF/
 usLTM80qYJwIaqe8h2BmTnPsx8lD7kGFQV9/73FWhsmmTowmoALgfOeIx
 wuroqHDPnKzxBywVup91NPnvwEXvs63TS95wIgNfbwDUyCC+bbObn4yMt
 nj6rwP8KB9K9t47qsbQhYT7Rm56IXuIZvyr+mC8mVGi8Lm2O5dArbmKxJ
 TTDH6cMjVxsAlJQCD6N+zRQb9L43fPRkkAqf4XoUMc5paw8WW5XPg7rNp
 pS3iUQEiWNpwuV1/WjhJOYopkoeEv91H436wDw87eZpurrJv0aQvwMbfl A==;
X-CSE-ConnectionGUID: YlvGvKxXSjC3BW33cfjHxA==
X-CSE-MsgGUID: iDFCLqwsSpymug487w8pyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="27043886"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="27043886"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 05:08:07 -0700
X-CSE-ConnectionGUID: 3FVtLNBLQjemfTG/uVzCMg==
X-CSE-MsgGUID: 0w+cR4XPQWSA2z0KVfyj9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="74058422"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2024 05:08:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1svbfb-0000000FAPw-2e3D; Tue, 01 Oct 2024 15:07:59 +0300
Date: Tue, 1 Oct 2024 15:07:59 +0300
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
Message-ID: <ZvvmH0n_y_vVSpvR@smile.fi.intel.com>
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
 <Zvqgz3Vpz2IS1Cua@smile.fi.intel.com>
 <ZvuDwvtyJ4djuIQ7@black.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZvuDwvtyJ4djuIQ7@black.fi.intel.com>
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

On Tue, Oct 01, 2024 at 08:08:18AM +0300, Raag Jadav wrote:
> On Mon, Sep 30, 2024 at 03:59:59PM +0300, Andy Shevchenko wrote:
> > On Mon, Sep 30, 2024 at 01:08:41PM +0530, Raag Jadav wrote:

...

> > > +static const char *const drm_wedge_recovery_opts[] = {
> > > +	[DRM_WEDGE_RECOVERY_REBIND] = "rebind",
> > > +	[DRM_WEDGE_RECOVERY_BUS_RESET] = "bus-reset",
> > > +	[DRM_WEDGE_RECOVERY_REBOOT] = "reboot",
> > > +};
> > 
> > Place for static_assert() is here, as it closer to the actual data we test...
> 
> Shouldn't it be at the point of access?

No, the idea of static_assert() is in word 'static', meaning it's allowed to be
used in the global space.

> If no, why do we care about the data when it's not being used?

What does this suppose to mean? The assertion is for enforcing the boundaries
that are defined by different means (constant of the size and real size of
an array).

...

> > > +static bool drm_wedge_recovery_is_valid(enum drm_wedge_recovery method)
> > > +{
> > > +	static_assert(ARRAY_SIZE(drm_wedge_recovery_opts) == DRM_WEDGE_RECOVERY_MAX);
> > 
> > ...it doesn't fully belong to this function (or only to this function).
> 
> The purpose of having a helper is to have a single point of access, no?

What single access you are talking about? It seems you are trying to solve
non-existing issue. There is a function that is being used exactly once
and it's a one-liner. There is no point to have it being separated (at least
right now).

> Side note: It also goes well with is_valid() semantic IMHO.

It doesn't matter at all, it's unrelated to the point.

> > > +	return method >= DRM_WEDGE_RECOVERY_REBIND && method < DRM_WEDGE_RECOVERY_MAX;
> > > +}
> > 
> > Why do we need this one-liner (after above comment being addressed) as a
> > separate function?
> 
> I'm not sure if I'm following you. Method is not a constant here, we'll get it
> on the stack.

I elaborated above.

-- 
With Best Regards,
Andy Shevchenko


