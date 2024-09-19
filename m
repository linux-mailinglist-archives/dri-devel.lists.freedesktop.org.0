Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A38FC97C506
	for <lists+dri-devel@lfdr.de>; Thu, 19 Sep 2024 09:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F98410E29C;
	Thu, 19 Sep 2024 07:43:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eU4MOIQ7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BF8410E693;
 Thu, 19 Sep 2024 07:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726731818; x=1758267818;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=i+M/KFAznHphyZMEKqcY+FCG1G/jz6j5Nes3wNoW3NU=;
 b=eU4MOIQ7nSZxFR20OiAQOBopQeoY/PKrbweLV2O3y50jcFCMBwpwtLQM
 T4ZfHSRUc0LC23eavq0uF6NWbDRGbTuqefyE529MvR6flnAFSN3lpGMtD
 cZsYaJJf6p6vsCswQwx9R9OwP6lFBZ0XlIkp2+VD7eo3Vn+RYmao9SHa2
 xOPOBWuW0zZ7/8En+MYvTywmkyUojrPl138fhr5cvbsSrGVzYYB0AX1Ua
 SFBV06CWJy3oYKLibuIpTPL/twkJKU6EkzZYw3FIxPfT/VEt4echTZ/9h
 /7DFhP+gsBy72hNnRNet5AzFt3vYo/mmtG46bkBHNcyv0ZlOrqbuvhSo1 Q==;
X-CSE-ConnectionGUID: Bxj7nfUrQbCYEbQOmiSe/Q==
X-CSE-MsgGUID: Mz6RpsmiR0yb0XlJp/+kiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="37055942"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="37055942"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 00:43:37 -0700
X-CSE-ConnectionGUID: HhMaaDfEQjyFgwgpCeqYpA==
X-CSE-MsgGUID: B37Hbq8SRFCgb4TrUlgSTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; d="scan'208";a="74382125"
Received: from sschumil-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.59])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 00:43:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lina@asahilina.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 andriy.shevchenko@linux.intel.com, matthew.d.roper@intel.com, Raag Jadav
 <raag.jadav@intel.com>
Subject: Re: [PATCH v5 1/4] drm: Introduce device wedged event
In-Reply-To: <20240917040235.197019-2-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240917040235.197019-1-raag.jadav@intel.com>
 <20240917040235.197019-2-raag.jadav@intel.com>
Date: Thu, 19 Sep 2024 10:43:23 +0300
Message-ID: <87o74k9jhg.fsf@intel.com>
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

On Tue, 17 Sep 2024, Raag Jadav <raag.jadav@intel.com> wrote:
> Introduce device wedged event, which will notify userspace of wedged
> (hanged/unusable) state of the DRM device through a uevent. This is
> useful especially in cases where the device is no longer operating as
> expected and has become unrecoverable from driver context.
>
> Purpose of this implementation is to provide drivers a way to recover
> through userspace intervention. Different drivers may have different
> ideas of a "wedged device" depending on their hardware implementation,
> and hence the vendor agnostic nature of the event. It is upto the drivers
> to decide when they see the need for recovery and how they want to recover
> from the available methods.
>
> Current implementation defines three recovery methods, out of which,
> drivers can choose to support any one or multiple of them. Preferred
> recovery method will be sent in the uevent environment as WEDGED=<method>.
> Userspace consumers (sysadmin) can define udev rules to parse this event
> and take respective action to recover the device.
>
>  Method    | Consumer expectations
> -----------|-----------------------------------
>  rebind    | unbind + rebind driver
>  bus-reset | unbind + reset bus device + rebind
>  reboot    | reboot system
>
> v4: s/drm_dev_wedged/drm_dev_wedged_event
>     Use drm_info() (Jani)
>     Kernel doc adjustment (Aravind)
> v5: Send recovery method with uevent (Lina)
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 37 +++++++++++++++++++++++++++++++++++++
>  include/drm/drm_device.h  | 24 ++++++++++++++++++++++++
>  include/drm/drm_drv.h     |  1 +
>  3 files changed, 62 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index ac30b0ec9d93..1e850a9f608d 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -497,6 +497,43 @@ void drm_dev_unplug(struct drm_device *dev)
>  }
>  EXPORT_SYMBOL(drm_dev_unplug);
>  
> +const char *const wedge_recovery_opts[] = {
> +	[DRM_WEDGE_RECOVERY_REBIND] = "rebind",
> +	[DRM_WEDGE_RECOVERY_BUS_RESET] = "bus-reset",
> +	[DRM_WEDGE_RECOVERY_REBOOT] = "reboot",
> +};
> +
> +/**
> + * drm_dev_wedged_event - generate a device wedged uevent
> + * @dev: DRM device
> + * @method: method to be used for recovery
> + *
> + * This generates a device wedged uevent for the DRM device specified by @dev.
> + * Recovery @method from wedge_recovery_opts[] (if supprted by the device) is
> + * sent in the uevent environment as WEDGED=<method>, on the basis of which,
> + * userspace may take respective action to recover the device.
> + *
> + * Returns: 0 on success, or negative error code otherwise.
> + */
> +int drm_dev_wedged_event(struct drm_device *dev, enum wedge_recovery_method method)
> +{
> +	char event_string[32] = "WEDGED=";
> +	char *envp[] = { event_string, NULL };
> +	bool supported;
> +
> +	supported = test_bit(method, &dev->wedge_recovery);
> +	if (unlikely(!supported)) {

The unlikely is unnecessary.

> +		drm_err(dev, "device wedged, recovery method not supported\n");
> +		return -EOPNOTSUPP;
> +	}
> +
> +	strcat(event_string, wedge_recovery_opts[method]);

Emphasizing here too, you need bounds checking for
wedge_recovery_opts. And avoid strcat, it's hardly ever the right
choice, as you'll need bounds checking on event_string.

> +
> +	drm_info(dev, "device wedged, generating uevent\n");
> +	return kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
> +}
> +EXPORT_SYMBOL(drm_dev_wedged_event);
> +
>  /*
>   * DRM internal mount
>   * We want to be able to allocate our own "struct address_space" to control
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index c91f87b5242d..e4f32967b5ae 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -40,6 +40,27 @@ enum switch_power_state {
>  	DRM_SWITCH_POWER_DYNAMIC_OFF = 3,
>  };
>  
> +/**
> + * enum wedge_recovery_method - Recovery method for wedged device in order
> + * of severity. To be set as bit fields in drm_device.wedge_recovery variable.
> + * Drivers can choose to support any one or multiple of them depending on their
> + * needs.
> + */
> +
> +enum wedge_recovery_method {
> +	/** @DRM_WEDGE_RECOVERY_REBIND: unbind + rebind driver */
> +	DRM_WEDGE_RECOVERY_REBIND = 0,

I don't see a need to initialize the enumerations, it's automatic.

> +
> +	/** @DRM_WEDGE_RECOVERY_BUS_RESET: unbind + reset bus device + rebind */
> +	DRM_WEDGE_RECOVERY_BUS_RESET = 1,
> +
> +	/** @DRM_WEDGE_RECOVERY_REBOOT: reboot system */
> +	DRM_WEDGE_RECOVERY_REBOOT = 2,
> +
> +	/** @DRM_WEDGE_RECOVERY_MAX: for bounds checking, do not use */
> +	DRM_WEDGE_RECOVERY_MAX = 3,
> +};
> +
>  /**
>   * struct drm_device - DRM device structure
>   *
> @@ -317,6 +338,9 @@ struct drm_device {
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
> index 02ea4e3248fd..6e02187f1f6c 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -461,6 +461,7 @@ void drm_put_dev(struct drm_device *dev);
>  bool drm_dev_enter(struct drm_device *dev, int *idx);
>  void drm_dev_exit(int idx);
>  void drm_dev_unplug(struct drm_device *dev);
> +int drm_dev_wedged_event(struct drm_device *dev, enum wedge_recovery_method method);
>  
>  /**
>   * drm_dev_is_unplugged - is a DRM device unplugged

-- 
Jani Nikula, Intel
