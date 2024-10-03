Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B79DA98EF23
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 14:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BCD10E829;
	Thu,  3 Oct 2024 12:23:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HpJQxAmn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 915B210E236;
 Thu,  3 Oct 2024 12:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727958204; x=1759494204;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8+Nb51KEogXE77PpyQoBafWuKkipDKsRryhilX83ejQ=;
 b=HpJQxAmnwBCti9V4cT3i2/1otKQvwWTvZFeLUni37TH1LFycaXEVG/WV
 moAA6oxRqZOIqKOwTJgKthAux7SLaSAgHEj+/KD9+UHrwQQNKYzywlKpv
 cn/+Le3qx85THEXr7Jf/bpN+LT/V/EgKtZnE6uR0jMo+wJw6EzS2rEPcA
 qo86vOIFnk6hX4VBueWdQOzmfSmYNxzbg1hlgHochvJg/7r/5r5phJcV5
 xMkES3Kjy3PmQlsLLvR9n8E5gYA35UspNWrSpJ6yQ34uVCLpAjTAyue5q
 8+6YWQ3KyJQy/qSVYOR5CGGNfz8S4k0lieerf4CYSuF/fy0ZoQtn1pg6H A==;
X-CSE-ConnectionGUID: h0i1PZaQROmt+8t4S18hAw==
X-CSE-MsgGUID: On2re/qCRnmdtTr+YmWf/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="37810590"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="37810590"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 05:23:23 -0700
X-CSE-ConnectionGUID: uZ1C13vMRAyZtZmpA2Xzig==
X-CSE-MsgGUID: R4qnhdpeS9+EDxMc8BaDng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; d="scan'208";a="75129663"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Oct 2024 05:23:19 -0700
Date: Thu, 3 Oct 2024 15:23:15 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
Cc: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net,
 lina@asahilina.net, intel-xe@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 himal.prasad.ghimiray@intel.com, francois.dugast@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 andi.shyti@linux.intel.com, matthew.d.roper@intel.com
Subject: Re: [PATCH v7 1/5] drm: Introduce device wedged event
Message-ID: <Zv6Ms7G4pSLdgUKo@black.fi.intel.com>
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
 <26f90d12-6a04-445e-96ff-aafbe3dc8132@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <26f90d12-6a04-445e-96ff-aafbe3dc8132@intel.com>
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

On Tue, Oct 01, 2024 at 02:20:29PM +0200, Michal Wajdeczko wrote:
> Hi,
> 
> sorry for late comments,

Sure, no problem.

> On 30.09.2024 09:38, Raag Jadav wrote:
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
> 
> what about when driver just wants to tell that it is in unusable state,
> but recovery method is unknown or not possible?

Interesting... However, what would be the consumer expectation for it?
If the expectation is to not recover, why send an event at all?

> > 
> > Current implementation defines three recovery methods, out of which,
> > drivers can choose to support any one or multiple of them. Preferred
> > recovery method will be sent in the uevent environment as WEDGED=<method>.
> 
> could this be something like below instead:
> 
> 	WEDGED=<reason>
> 	RECOVERY=<method>[,<method>]
> 
> then driver will have a chance to tell what happen _and_ additionally
> provide a hint(s) how to recover from that situation

Documentation/gpu/drm-uapi.rst +337

UMD can issue an ioctl to the KMD to check the reset status

...or <reason> for wedging, which KMD will signify with an error code...

UMD will then proceed to report it to the application using the appropriate
API error code

(should've explicitly added, sorry)

> > Userspace consumers (sysadmin) can define udev rules to parse this event
> > and take respective action to recover the device.
> > 
> >     =============== ==================================
> >     Recovery method Consumer expectations
> >     =============== ==================================
> >     rebind          unbind + rebind driver
> >     bus-reset       unbind + reset bus device + rebind
> >     reboot          reboot system
> 
> btw, what if driver detects a really broken HW, or has no clue what will
> help here, shouldn't we have a "none" method?

Sure. But same as above, we have to define expectations.

> >     =============== ==================================
> > 
> > v4: s/drm_dev_wedged/drm_dev_wedged_event
> >     Use drm_info() (Jani)
> >     Kernel doc adjustment (Aravind)
> > v5: Send recovery method with uevent (Lina)
> > v6: Access wedge_recovery_opts[] using helper function (Jani)
> >     Use snprintf() (Jani)
> > v7: Convert recovery helpers into regular functions (Andy, Jani)
> >     Aesthetic adjustments (Andy)
> >     Handle invalid method cases
> > 
> > Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> > ---
> >  drivers/gpu/drm/drm_drv.c | 77 +++++++++++++++++++++++++++++++++++++++
> >  include/drm/drm_device.h  | 23 ++++++++++++
> >  include/drm/drm_drv.h     |  3 ++
> >  3 files changed, 103 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index ac30b0ec9d93..cfe9600da2ee 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -26,6 +26,8 @@
> >   * DEALINGS IN THE SOFTWARE.
> >   */
> >  
> > +#include <linux/array_size.h>
> > +#include <linux/build_bug.h>
> >  #include <linux/debugfs.h>
> >  #include <linux/fs.h>
> >  #include <linux/module.h>
> > @@ -33,6 +35,7 @@
> >  #include <linux/mount.h>
> >  #include <linux/pseudo_fs.h>
> >  #include <linux/slab.h>
> > +#include <linux/sprintf.h>
> >  #include <linux/srcu.h>
> >  #include <linux/xarray.h>
> >  
> > @@ -70,6 +73,42 @@ static struct dentry *drm_debugfs_root;
> >  
> >  DEFINE_STATIC_SRCU(drm_unplug_srcu);
> >  
> > +/*
> > + * Available recovery methods for wedged device. To be sent along with device
> > + * wedged uevent.
> > + */
> > +static const char *const drm_wedge_recovery_opts[] = {
> > +	[DRM_WEDGE_RECOVERY_REBIND] = "rebind",
> > +	[DRM_WEDGE_RECOVERY_BUS_RESET] = "bus-reset",
> > +	[DRM_WEDGE_RECOVERY_REBOOT] = "reboot",
> > +};
> > +
> > +static bool drm_wedge_recovery_is_valid(enum drm_wedge_recovery method)
> > +{
> > +	static_assert(ARRAY_SIZE(drm_wedge_recovery_opts) == DRM_WEDGE_RECOVERY_MAX);
> > +
> > +	return method >= DRM_WEDGE_RECOVERY_REBIND && method < DRM_WEDGE_RECOVERY_MAX;
> > +}
> > +
> > +/**
> > + * drm_wedge_recovery_name - provide wedge recovery name
> > + * @method: method to be used for recovery
> > + *
> > + * This validates wedge recovery @method against the available ones in
> 
> do we really need to validate an enum?

I'm all for trusting the drivers explicitly, but since this is a core feature
I thought we'd have some guard rails (for abusers).

> maybe the problem is that there is MAX enumerator that just shouldn't be there?

With MAX in place we won't need to adjust the helpers to match with enum
modifications in the future (if any).

> > + * drm_wedge_recovery_opts[] and provides respective recovery name in string
> > + * format if found valid.
> > + *
> > + * Returns: pointer to const recovery string on success, NULL otherwise.
> > + */
> > +const char *drm_wedge_recovery_name(enum drm_wedge_recovery method)
> > +{
> > +	if (drm_wedge_recovery_is_valid(method))
> > +		return drm_wedge_recovery_opts[method];
> 
> as we only have 3 methods, maybe simple switch() will do the work?

Sure.

> > +
> > +	return NULL;
> > +}
> > +EXPORT_SYMBOL(drm_wedge_recovery_name);
> > +
> >  /*
> >   * DRM Minors
> >   * A DRM device can provide several char-dev interfaces on the DRM-Major. Each
> > @@ -497,6 +536,44 @@ void drm_dev_unplug(struct drm_device *dev)
> >  }
> >  EXPORT_SYMBOL(drm_dev_unplug);
> >  
> > +/**
> > + * drm_dev_wedged_event - generate a device wedged uevent
> > + * @dev: DRM device
> > + * @method: method to be used for recovery
> > + *
> > + * This generates a device wedged uevent for the DRM device specified by @dev.
> > + * Recovery @method from drm_wedge_recovery_opts[] (if supprted by the device)
> 
> typo

Good catch.

> > + * is sent in the uevent environment as WEDGED=<method>, on the basis of which,
> > + * userspace may take respective action to recover the device.
> > + *
> > + * Returns: 0 on success, or negative error code otherwise.
> > + */
> > +int drm_dev_wedged_event(struct drm_device *dev, enum drm_wedge_recovery method)
> > +{
> > +	/* Event string length up to 16+ characters with available methods */
> > +	char event_string[32] = {};
> 
> magic 32 here

Anything to add to the event string length comment above?

> > +	char *envp[] = { event_string, NULL };
> > +	const char *recovery;
> > +
> > +	recovery = drm_wedge_recovery_name(method);
> > +	if (!recovery) {
> > +		drm_err(dev, "device wedged, invalid recovery method %d\n", method);
> 
> maybe use drm_WARN() to see who is abusing the API ?

Sure.

> > +		return -EINVAL;
> 
> but shouldn't we still trigger an event with "none" recovery?

Explained above.

> > +	}
> > +
> > +	if (!test_bit(method, &dev->wedge_recovery)) {
> > +		drm_err(dev, "device wedged, %s based recovery not supported\n",
> > +			drm_wedge_recovery_name(method));
> 
> do we really need this kind of guard? it will be a driver code that will
> call this function, so likely it knows better what will work to recover

Agree, although unsupported method could cause undefined behaviour.

> > +		return -EOPNOTSUPP;
> > +	}
> > +
> > +	snprintf(event_string, sizeof(event_string), "WEDGED=%s", recovery);
> > +
> > +	drm_info(dev, "device wedged, generating uevent for %s based recovery\n", recovery);
> 
> nit:
> 	drm_info(dev, "device wedged, needs %s to recover\n", recovery);

Sure.

> > +	return kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
> > +}
> > +EXPORT_SYMBOL(drm_dev_wedged_event);
> > +
> >  /*
> >   * DRM internal mount
> >   * We want to be able to allocate our own "struct address_space" to control
> > diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> > index c91f87b5242d..fed6f20e52fb 100644
> > --- a/include/drm/drm_device.h
> > +++ b/include/drm/drm_device.h
> > @@ -40,6 +40,26 @@ enum switch_power_state {
> >  	DRM_SWITCH_POWER_DYNAMIC_OFF = 3,
> >  };
> >  
> > +/**
> > + * enum drm_wedge_recovery - Recovery method for wedged device in order of
> > + * severity. To be set as bit fields in drm_device.wedge_recovery variable.
> > + * Drivers can choose to support any one or multiple of them depending on
> > + * their needs.
> > + */
> > +enum drm_wedge_recovery {
> > +	/** @DRM_WEDGE_RECOVERY_REBIND: unbind + rebind driver */
> > +	DRM_WEDGE_RECOVERY_REBIND,
> > +
> > +	/** @DRM_WEDGE_RECOVERY_BUS_RESET: unbind + reset bus device + rebind */
> > +	DRM_WEDGE_RECOVERY_BUS_RESET,
> > +
> > +	/** @DRM_WEDGE_RECOVERY_REBOOT: reboot system */
> > +	DRM_WEDGE_RECOVERY_REBOOT,
> > +
> > +	/** @DRM_WEDGE_RECOVERY_MAX: for bounds checking, do not use */
> > +	DRM_WEDGE_RECOVERY_MAX
> > +};
> > +
> >  /**
> >   * struct drm_device - DRM device structure
> >   *
> > @@ -317,6 +337,9 @@ struct drm_device {
> >  	 * Root directory for debugfs files.
> >  	 */
> >  	struct dentry *debugfs_root;
> > +
> > +	/** @wedge_recovery: Supported recovery methods for wedged device */
> > +	unsigned long wedge_recovery;
> 
> hmm, so before the driver can ask for a reboot as a recovery method from
> wedge it has to somehow add 'reboot' as available method? why it that?

It's for consumers to use as fallbacks in case the preferred recovery method
(sent along with uevent) don't workout. (patch 2/5)

> and if you insist that this is useful then at least document how this
> should be initialized (to not forcing developers to look at
> drm_dev_wedged_event code where it's used)

Sure.

Raag
