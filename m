Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4BAB98B384
	for <lists+dri-devel@lfdr.de>; Tue,  1 Oct 2024 07:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E461210E5D4;
	Tue,  1 Oct 2024 05:08:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Tyw1cA8W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 026EE10E5D2;
 Tue,  1 Oct 2024 05:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727759306; x=1759295306;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=Jc926JMUqMfDTY9f3p0BkuZbbOcDWoJTXcsE626tssI=;
 b=Tyw1cA8WSSOYqb2zkS0yhzceLOOipJ51KcYkwaJT/G4YjNwFw/Vim19/
 M7FExCV1kR9cNtVJCDFDIGLTVUnTeq4sSl1WLYhakfuIT7iFedT4XflD5
 8xQMSqn+c9OecL3ucaLFjaaPwU+wElu5eolvpCGwbejDVKxyctIm1gJpg
 G4ktBdnNQAtdN2FSLwvtP8ERYlRnhr3HCBZzPXRscdp0DAJIFzuxmMEtv
 JfoaJWEl7+ZAV0nVPNtMIaun6KcROtF5bpk1pthpJkUJFP9PpFlI1bm8j
 dzzUcFrJf0cJV8Ytro6SLZl67fr1DQBHjzZ2so8xXNvgeigHHfxpPlFtR w==;
X-CSE-ConnectionGUID: 03gfmaUzQna88Rm4+MwncA==
X-CSE-MsgGUID: BvdNPO4qTEa6grWhNLVWCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="44394592"
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="44394592"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 22:08:25 -0700
X-CSE-ConnectionGUID: oQXximSvS7CNbuDY6uyZjg==
X-CSE-MsgGUID: 8QxW98/OTHGCAMvj2NFBwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,167,1725346800"; d="scan'208";a="78382591"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 22:08:22 -0700
Date: Tue, 1 Oct 2024 08:08:18 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
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
Message-ID: <ZvuDwvtyJ4djuIQ7@black.fi.intel.com>
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
 <Zvqgz3Vpz2IS1Cua@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zvqgz3Vpz2IS1Cua@smile.fi.intel.com>
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

On Mon, Sep 30, 2024 at 03:59:59PM +0300, Andy Shevchenko wrote:
> On Mon, Sep 30, 2024 at 01:08:41PM +0530, Raag Jadav wrote:
> > Introduce device wedged event, which will notify userspace of wedged
> > (hanged/unusable) state of the DRM device through a uevent. This is
> > useful especially in cases where the device is no longer operating as
> > expected even after a hardware reset and has become unrecoverable from
> > driver context.
> > 
> > Purpose of this implementation is to provide drivers a generic way to
> > recover with the help of userspace intervention. Different drivers may
> > have different ideas of a "wedged device" depending on their hardware
> > implementation, and hence the vendor agnostic nature of the event.
> > It is up to the drivers to decide when they see the need for recovery
> > and how they want to recover from the available methods.
> > 
> > Current implementation defines three recovery methods, out of which,
> > drivers can choose to support any one or multiple of them. Preferred
> > recovery method will be sent in the uevent environment as WEDGED=<method>.
> > Userspace consumers (sysadmin) can define udev rules to parse this event
> > and take respective action to recover the device.
> > 
> >     =============== ==================================
> >     Recovery method Consumer expectations
> >     =============== ==================================
> >     rebind          unbind + rebind driver
> >     bus-reset       unbind + reset bus device + rebind
> >     reboot          reboot system
> >     =============== ==================================
> 
> ...
> 
> > +/*
> > + * Available recovery methods for wedged device. To be sent along with device
> > + * wedged uevent.
> > + */
> > +static const char *const drm_wedge_recovery_opts[] = {
> > +	[DRM_WEDGE_RECOVERY_REBIND] = "rebind",
> > +	[DRM_WEDGE_RECOVERY_BUS_RESET] = "bus-reset",
> > +	[DRM_WEDGE_RECOVERY_REBOOT] = "reboot",
> > +};
> 
> Place for static_assert() is here, as it closer to the actual data we test...

Shouldn't it be at the point of access?
If no, why do we care about the data when it's not being used?

> > +static bool drm_wedge_recovery_is_valid(enum drm_wedge_recovery method)
> > +{
> > +	static_assert(ARRAY_SIZE(drm_wedge_recovery_opts) == DRM_WEDGE_RECOVERY_MAX);
> 
> ...it doesn't fully belong to this function (or only to this function).

The purpose of having a helper is to have a single point of access, no?

Side note: It also goes well with is_valid() semantic IMHO.

> > +	return method >= DRM_WEDGE_RECOVERY_REBIND && method < DRM_WEDGE_RECOVERY_MAX;
> > +}
> 
> Why do we need this one-liner (after above comment being addressed) as a
> separate function?

I'm not sure if I'm following you. Method is not a constant here, we'll get it
on the stack.

Raag
