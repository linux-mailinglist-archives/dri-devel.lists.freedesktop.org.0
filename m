Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8215A9A18C1
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 04:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE1CC10E786;
	Thu, 17 Oct 2024 02:47:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gKi6+R3P";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1339C10E786;
 Thu, 17 Oct 2024 02:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729133267; x=1760669267;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=WjN7g0s6yY7Ptz11aoDD/6yExXaIWiXOn6FqdpviVeo=;
 b=gKi6+R3PJ1/fZUJqWKMQOHXx62R01Ua/un+tJbnQudQSgcme0wE8xzYR
 wT/dI5RmS1BB7CPKhDB+FO7LzCbHbo37zHYb9+Hf+0a7s4u05EdQXfSeX
 Tdi5KxUMsNtxeA1lm16PuGia/iez6ISv0lHax+FfDg6Y9yqu5j1ExkuAg
 jCAD9RVvCHbSx3Kre/cn+iA8R28X+CZm7nl60ax07oMzd/hv4+wUU9yOx
 gbyKBhgU1dBpmNYITePuyDB7n8M+hbjf9oxhYa2uo5QMa2WIMrW7pSvEd
 Z7e/k6YFS2aWonAaDqaVCfrlVgu6NJqIMVBUZjpVooCrfBllTADb+KoQM A==;
X-CSE-ConnectionGUID: a8JK6yLBSKmoEuDNaJRUMw==
X-CSE-MsgGUID: 0Cej1xWSRFKWCL9e+f14OQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28559923"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="28559923"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 19:47:47 -0700
X-CSE-ConnectionGUID: viSiYTf5TaOCpa9Sxj9AyA==
X-CSE-MsgGUID: lIt3X6l/Tqq+fG27oMlrEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,210,1725346800"; d="scan'208";a="78566938"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 19:47:40 -0700
Date: Thu, 17 Oct 2024 05:47:36 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, lina@asahilina.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 matthew.d.roper@intel.com, boris.brezillon@collabora.com,
 adrian.larumbe@collabora.com, kernel@collabora.com,
 maraeo@gmail.com, christian.koenig@amd.com, friedrich.vock@gmx.de,
 michel@daenzer.net, joshua@froggi.es, alexander.deucher@amd.com,
 andrealmeid@igalia.com, amd-gfx@lists.freedesktop.org
Subject: Re: [PATCH v7 1/5] drm: Introduce device wedged event
Message-ID: <ZxB6yKRrgvCoRK7y@black.fi.intel.com>
References: <20240930073845.347326-1-raag.jadav@intel.com>
 <20240930073845.347326-2-raag.jadav@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240930073845.347326-2-raag.jadav@intel.com>
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

On Mon, Sep 30, 2024 at 01:08:41PM +0530, Raag Jadav wrote:
> Introduce device wedged event, which will notify userspace of wedged
> (hanged/unusable) state of the DRM device through a uevent. This is
> useful especially in cases where the device is no longer operating as
> expected even after a hardware reset and has become unrecoverable from
> driver context.
> 
> Purpose of this implementation is to provide drivers a generic way to
> recover with the help of userspace intervention. Different drivers may
> have different ideas of a "wedged device" depending on their hardware
> implementation, and hence the vendor agnostic nature of the event.
> It is up to the drivers to decide when they see the need for recovery
> and how they want to recover from the available methods.
> 
> Current implementation defines three recovery methods, out of which,
> drivers can choose to support any one or multiple of them. Preferred
> recovery method will be sent in the uevent environment as WEDGED=<method>.
> Userspace consumers (sysadmin) can define udev rules to parse this event
> and take respective action to recover the device.
> 
>     =============== ==================================
>     Recovery method Consumer expectations
>     =============== ==================================
>     rebind          unbind + rebind driver
>     bus-reset       unbind + reset bus device + rebind
>     reboot          reboot system
>     =============== ==================================
> 
> v4: s/drm_dev_wedged/drm_dev_wedged_event
>     Use drm_info() (Jani)
>     Kernel doc adjustment (Aravind)
> v5: Send recovery method with uevent (Lina)
> v6: Access wedge_recovery_opts[] using helper function (Jani)
>     Use snprintf() (Jani)
> v7: Convert recovery helpers into regular functions (Andy, Jani)
>     Aesthetic adjustments (Andy)
>     Handle invalid method cases
> 
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---

Cc'ing amd, collabora and others as I found semi-related work at

https://lore.kernel.org/dri-devel/20230627132323.115440-1-andrealmeid@igalia.com/
https://lore.kernel.org/amd-gfx/20240725150055.1991893-1-alexander.deucher@amd.com/
https://lore.kernel.org/dri-devel/20241011225906.3789965-3-adrian.larumbe@collabora.com/
https://lore.kernel.org/amd-gfx/CAAxE2A5v_RkZ9ex4=7jiBSKVb22_1FAj0AANBcmKtETt5c3gVA@mail.gmail.com/


Please share feedback about usefulness and adoption of this.
Improvements are welcome.

Raag

>  drivers/gpu/drm/drm_drv.c | 77 +++++++++++++++++++++++++++++++++++++++
>  include/drm/drm_device.h  | 23 ++++++++++++
>  include/drm/drm_drv.h     |  3 ++
>  3 files changed, 103 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index ac30b0ec9d93..cfe9600da2ee 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -26,6 +26,8 @@
>   * DEALINGS IN THE SOFTWARE.
>   */
>  
> +#include <linux/array_size.h>
> +#include <linux/build_bug.h>
>  #include <linux/debugfs.h>
>  #include <linux/fs.h>
>  #include <linux/module.h>
> @@ -33,6 +35,7 @@
>  #include <linux/mount.h>
>  #include <linux/pseudo_fs.h>
>  #include <linux/slab.h>
> +#include <linux/sprintf.h>
>  #include <linux/srcu.h>
>  #include <linux/xarray.h>
>  
> @@ -70,6 +73,42 @@ static struct dentry *drm_debugfs_root;
>  
>  DEFINE_STATIC_SRCU(drm_unplug_srcu);
>  
> +/*
> + * Available recovery methods for wedged device. To be sent along with device
> + * wedged uevent.
> + */
> +static const char *const drm_wedge_recovery_opts[] = {
> +	[DRM_WEDGE_RECOVERY_REBIND] = "rebind",
> +	[DRM_WEDGE_RECOVERY_BUS_RESET] = "bus-reset",
> +	[DRM_WEDGE_RECOVERY_REBOOT] = "reboot",
> +};
> +
> +static bool drm_wedge_recovery_is_valid(enum drm_wedge_recovery method)
> +{
> +	static_assert(ARRAY_SIZE(drm_wedge_recovery_opts) == DRM_WEDGE_RECOVERY_MAX);
> +
> +	return method >= DRM_WEDGE_RECOVERY_REBIND && method < DRM_WEDGE_RECOVERY_MAX;
> +}
> +
> +/**
> + * drm_wedge_recovery_name - provide wedge recovery name
> + * @method: method to be used for recovery
> + *
> + * This validates wedge recovery @method against the available ones in
> + * drm_wedge_recovery_opts[] and provides respective recovery name in string
> + * format if found valid.
> + *
> + * Returns: pointer to const recovery string on success, NULL otherwise.
> + */
> +const char *drm_wedge_recovery_name(enum drm_wedge_recovery method)
> +{
> +	if (drm_wedge_recovery_is_valid(method))
> +		return drm_wedge_recovery_opts[method];
> +
> +	return NULL;
> +}
> +EXPORT_SYMBOL(drm_wedge_recovery_name);
> +
>  /*
>   * DRM Minors
>   * A DRM device can provide several char-dev interfaces on the DRM-Major. Each
> @@ -497,6 +536,44 @@ void drm_dev_unplug(struct drm_device *dev)
>  }
>  EXPORT_SYMBOL(drm_dev_unplug);
>  
> +/**
> + * drm_dev_wedged_event - generate a device wedged uevent
> + * @dev: DRM device
> + * @method: method to be used for recovery
> + *
> + * This generates a device wedged uevent for the DRM device specified by @dev.
> + * Recovery @method from drm_wedge_recovery_opts[] (if supprted by the device)
> + * is sent in the uevent environment as WEDGED=<method>, on the basis of which,
> + * userspace may take respective action to recover the device.
> + *
> + * Returns: 0 on success, or negative error code otherwise.
> + */
> +int drm_dev_wedged_event(struct drm_device *dev, enum drm_wedge_recovery method)
> +{
> +	/* Event string length up to 16+ characters with available methods */
> +	char event_string[32] = {};
> +	char *envp[] = { event_string, NULL };
> +	const char *recovery;
> +
> +	recovery = drm_wedge_recovery_name(method);
> +	if (!recovery) {
> +		drm_err(dev, "device wedged, invalid recovery method %d\n", method);
> +		return -EINVAL;
> +	}
> +
> +	if (!test_bit(method, &dev->wedge_recovery)) {
> +		drm_err(dev, "device wedged, %s based recovery not supported\n",
> +			drm_wedge_recovery_name(method));
> +		return -EOPNOTSUPP;
> +	}
> +
> +	snprintf(event_string, sizeof(event_string), "WEDGED=%s", recovery);
> +
> +	drm_info(dev, "device wedged, generating uevent for %s based recovery\n", recovery);
> +	return kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
> +}
> +EXPORT_SYMBOL(drm_dev_wedged_event);
> +
>  /*
>   * DRM internal mount
>   * We want to be able to allocate our own "struct address_space" to control
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index c91f87b5242d..fed6f20e52fb 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -40,6 +40,26 @@ enum switch_power_state {
>  	DRM_SWITCH_POWER_DYNAMIC_OFF = 3,
>  };
>  
> +/**
> + * enum drm_wedge_recovery - Recovery method for wedged device in order of
> + * severity. To be set as bit fields in drm_device.wedge_recovery variable.
> + * Drivers can choose to support any one or multiple of them depending on
> + * their needs.
> + */
> +enum drm_wedge_recovery {
> +	/** @DRM_WEDGE_RECOVERY_REBIND: unbind + rebind driver */
> +	DRM_WEDGE_RECOVERY_REBIND,
> +
> +	/** @DRM_WEDGE_RECOVERY_BUS_RESET: unbind + reset bus device + rebind */
> +	DRM_WEDGE_RECOVERY_BUS_RESET,
> +
> +	/** @DRM_WEDGE_RECOVERY_REBOOT: reboot system */
> +	DRM_WEDGE_RECOVERY_REBOOT,
> +
> +	/** @DRM_WEDGE_RECOVERY_MAX: for bounds checking, do not use */
> +	DRM_WEDGE_RECOVERY_MAX
> +};
> +
>  /**
>   * struct drm_device - DRM device structure
>   *
> @@ -317,6 +337,9 @@ struct drm_device {
>  	 * Root directory for debugfs files.
>  	 */
>  	struct dentry *debugfs_root;
> +
> +	/** @wedge_recovery: Supported recovery methods for wedged device */
> +	unsigned long wedge_recovery;
>  };
>  
>  #endif
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index 02ea4e3248fd..d8dbc77010b0 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -462,6 +462,9 @@ bool drm_dev_enter(struct drm_device *dev, int *idx);
>  void drm_dev_exit(int idx);
>  void drm_dev_unplug(struct drm_device *dev);
>  
> +const char *drm_wedge_recovery_name(enum drm_wedge_recovery method);
> +int drm_dev_wedged_event(struct drm_device *dev, enum drm_wedge_recovery method);
> +
>  /**
>   * drm_dev_is_unplugged - is a DRM device unplugged
>   * @dev: DRM device
> -- 
> 2.34.1
> 
