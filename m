Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A65E97AC61
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 09:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F04E10E429;
	Tue, 17 Sep 2024 07:49:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hZ1taoZx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD3610E1FE;
 Tue, 17 Sep 2024 07:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726559357; x=1758095357;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=VupqYhN1WRFuxJ07hRvshueuKjhF5q1GGZek8yzN44k=;
 b=hZ1taoZxF6hMkt6IUaU4dJQsyiQr095OEHa/rMgPwwqmEF2TiODvQ6E9
 yASSTq4Tx0i1ABbeZztmuU6Jyjy8wlHUry8Kr3yWHrYBpIuUxoRJRhXkB
 sSuY5V4OSPYPEtlH4XHlge/FGvfLCcJgJsh5zaxTR6DiBNkbPaWluuEHk
 NbRd6dhwtr8HaF9Y+nQzJKriX9KpFzrPp1Ka/Iwb1A4mpWmwa46h1XygG
 FWBhX9RlZbJ5teC3OQrV9RHretB/a8wfchlJs7e+4rJpSnQVlZclKW5QL
 tL3nrGrmd22jJYfaKO6yABlcxR5KCTRG2dgB83g0kS7/5SfgqdqIq8EYl g==;
X-CSE-ConnectionGUID: Utk/9t9gTfezoTXKqW4jZQ==
X-CSE-MsgGUID: vI7PTaBHR/qqhrqLmSrBHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="25527682"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="25527682"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 00:49:16 -0700
X-CSE-ConnectionGUID: EIf81ltNTcCXpsH9Hok4YQ==
X-CSE-MsgGUID: SGAFcZkbQ0mIwOirtBhhmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="69075543"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.102])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 00:49:10 -0700
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
Subject: Re: [PATCH v5 2/4] drm: Expose wedge recovery methods
In-Reply-To: <20240917040235.197019-3-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240917040235.197019-1-raag.jadav@intel.com>
 <20240917040235.197019-3-raag.jadav@intel.com>
Date: Tue, 17 Sep 2024 10:49:07 +0300
Message-ID: <87msk6d8jw.fsf@intel.com>
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
> Now that we have device wedged event in place, add wedge_recovery sysfs
> attribute which will expose recovery methods supported by the DRM device.
> This is useful for userspace consumers in cases where the device supports
> multiple recovery methods which can be used as fallbacks.
>
> $ cat /sys/class/drm/card0/wedge_recovery
> rebind
> bus-reset
> reboot
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/drm_sysfs.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
> index fb3bbb6adcd1..b88cdbfa3b5e 100644
> --- a/drivers/gpu/drm/drm_sysfs.c
> +++ b/drivers/gpu/drm/drm_sysfs.c
> @@ -36,6 +36,8 @@
>  #define to_drm_minor(d) dev_get_drvdata(d)
>  #define to_drm_connector(d) dev_get_drvdata(d)
>  
> +extern const char *const wedge_recovery_opts[];

Data is not an interface. Please add a function for this.

Side note, extern declarations for outside stuff don't belong in .c
files anyway.

BR,
Jani.

> +
>  /**
>   * DOC: overview
>   *
> @@ -508,6 +510,26 @@ void drm_sysfs_connector_property_event(struct drm_connector *connector,
>  }
>  EXPORT_SYMBOL(drm_sysfs_connector_property_event);
>  
> +static ssize_t wedge_recovery_show(struct device *device,
> +				   struct device_attribute *attr, char *buf)
> +{
> +	struct drm_minor *minor = to_drm_minor(device);
> +	struct drm_device *dev = minor->dev;
> +	int opt, count = 0;
> +
> +	for_each_set_bit(opt, &dev->wedge_recovery, DRM_WEDGE_RECOVERY_MAX)
> +		count += sysfs_emit_at(buf, count, "%s\n", wedge_recovery_opts[opt]);
> +
> +	return count;
> +}
> +static DEVICE_ATTR_RO(wedge_recovery);
> +
> +static struct attribute *minor_dev_attrs[] = {
> +	&dev_attr_wedge_recovery.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(minor_dev);
> +
>  struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
>  {
>  	const char *minor_str;
> @@ -532,6 +554,7 @@ struct device *drm_sysfs_minor_alloc(struct drm_minor *minor)
>  		kdev->devt = MKDEV(DRM_MAJOR, minor->index);
>  		kdev->class = drm_class;
>  		kdev->type = &drm_sysfs_device_minor;
> +		kdev->groups = minor_dev_groups;
>  	}
>  
>  	kdev->parent = minor->dev->dev;

-- 
Jani Nikula, Intel
