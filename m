Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FC7AAD04EF
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 17:12:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A1C910EAD7;
	Fri,  6 Jun 2025 15:12:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b2M3nuJz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5820410E38E;
 Fri,  6 Jun 2025 15:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749222774; x=1780758774;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=e48Pq0rx6OoOU7LpKHiM+GTbdj0nGWbWtPBBT1wNfJw=;
 b=b2M3nuJzxI3GXKOoyASaGF+JZYdIogXNV7vpIoN5I+MTV6caIlkZ0Rto
 VuZG0m5hBhgpOxQ2IsUPHT2c02s7UyD70Uri0nBI6958+GtX45d2JJNbp
 gAQB8NORrYDT1iz7qmtrZ1GYTA9PY3ft89b+gjQMiyu8igiPwqvpw3BNA
 WOrm6VyuBMQOZOPhc3lJgwuv31Y4AuxvZqI32fOYtxjsJB+EIH9PBgMSr
 +TGvo1VdP7JPOldroMYijnRBPWCIMMzttsCt9WPF+x9AehjRFOPmi92pc
 wAu46ev4cZzRM2ghoVbh6nDByhjapiPDccz8TzTFPgUbcIK109KSeHty0 Q==;
X-CSE-ConnectionGUID: 4WQpST8KSua4pIMasCUNKw==
X-CSE-MsgGUID: Brgvmg+NQtKVx1u+XFwvYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="54004346"
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="54004346"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:12:54 -0700
X-CSE-ConnectionGUID: covtjDdtTaW6K6rVfniBsQ==
X-CSE-MsgGUID: enLoMfLhS6+jCpCcOhJqvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,215,1744095600"; d="scan'208";a="149689122"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 08:12:52 -0700
Date: Fri, 6 Jun 2025 18:12:48 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 himal.prasad.ghimiray@intel.com, frank.scarbrough@intel.com
Subject: Re: [PATCH 2/4] drm/xe: Add a helper function to set recovery method
Message-ID: <aEMFcBSWL_jPMYKa@black.fi.intel.com>
References: <20250603081409.1509709-1-riana.tauro@intel.com>
 <20250603081409.1509709-3-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250603081409.1509709-3-riana.tauro@intel.com>
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

On Tue, Jun 03, 2025 at 01:43:58PM +0530, Riana Tauro wrote:
> Add a helper function to set recovery method. The recovery
> method has to be set before declaring the device wedged and sending the
> drm wedged uevent. If no method is set, default unbind/re-bind method
> will be set
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c       | 30 +++++++++++++++++++++-------
>  drivers/gpu/drm/xe/xe_device.h       |  1 +
>  drivers/gpu/drm/xe/xe_device_types.h |  2 ++
>  3 files changed, 26 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 660b0c5126dc..3fd604ebdc6e 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1120,16 +1120,28 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>  	xe_pm_runtime_put(xe);
>  }
>  
> +/**
> + * xe_device_set_wedged_method - Set wedged recovery method
> + * @xe: xe device instance

Missing @method

> + *
> + * Set wedged recovery method to be sent using drm wedged uevent.
> + */
> +void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method)
> +{
> +	xe->wedged.method = method;
> +}
> +
>  /**
>   * xe_device_declare_wedged - Declare device wedged
>   * @xe: xe device instance
>   *
> - * This is a final state that can only be cleared with a module
> - * re-probe (unbind + bind).
> - * In this state every IOCTL will be blocked so the GT cannot be used.
> + * This is a final state that can only be cleared with the method specified
> + * in the drm wedged uevent. The method needs to be set using xe_device_set_wedged_method
> + * before declaring the device as wedged or the default method of reprobe (unbind/re-bind)
> + * will be sent. In this state every IOCTL will be blocked so the GT cannot be used.

The file convention seems like 80 characters for kernel doc, so let's
stick to it.

>   * In general it will be called upon any critical error such as gt reset
> - * failure or guc loading failure. Userspace will be notified of this state
> - * through device wedged uevent.
> + * failure or guc loading failure or firmware failure.
> + * Userspace will be notified of this state through device wedged uevent.
>   * If xe.wedged module parameter is set to 2, this function will be called
>   * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
>   * snapshot capture. In this mode, GT reset won't be attempted so the state of
> @@ -1152,6 +1164,11 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  		return;
>  	}
>  
> +	/* If no wedge recovery method is set, use default */
> +	if (!xe->wedged.method)
> +		xe_device_set_wedged_method(xe, DRM_WEDGE_RECOVERY_REBIND
> +					    | DRM_WEDGE_RECOVERY_BUS_RESET);

Although there are no strict rules about this, we usually don't begin a
new line with a symbol.

> +
>  	if (!atomic_xchg(&xe->wedged.flag, 1)) {
>  		xe->needs_flr_on_fini = true;
>  		drm_err(&xe->drm,
> @@ -1161,8 +1178,7 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  			dev_name(xe->drm.dev));
>  
>  		/* Notify userspace of wedged device */
> -		drm_dev_wedged_event(&xe->drm,
> -				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
> +		drm_dev_wedged_event(&xe->drm, xe->wedged.method);

I was a bit late to realize it when I originally added this. The event
call should be after xe_gt_declare_wedged() to comply with wedging rules.
We notify userspace *after* we're done with driver cleanup.

Raag

>  	}
>  
>  	for_each_gt(gt, xe, id)
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 0bc3bc8e6803..06350740aac5 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -191,6 +191,7 @@ static inline bool xe_device_wedged(struct xe_device *xe)
>  }
>  
>  void xe_device_declare_wedged(struct xe_device *xe);
> +void xe_device_set_wedged_method(struct xe_device *xe, unsigned long method);
>  
>  struct xe_file *xe_file_get(struct xe_file *xef);
>  void xe_file_put(struct xe_file *xef);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index b93c04466637..fb3617956d63 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -559,6 +559,8 @@ struct xe_device {
>  		atomic_t flag;
>  		/** @wedged.mode: Mode controlled by kernel parameter and debugfs */
>  		int mode;
> +		/** @wedged.method: Recovery method to be sent in the drm device wedged uevent */
> +		unsigned long method;
>  	} wedged;
>  
>  	/** @bo_device: Struct to control async free of BOs */
> -- 
> 2.47.1
> 
