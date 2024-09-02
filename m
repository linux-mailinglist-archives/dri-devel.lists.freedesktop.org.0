Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BC59682CA
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 11:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EA4810E26B;
	Mon,  2 Sep 2024 09:11:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kY644Av9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634AD10E270;
 Mon,  2 Sep 2024 09:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725268277; x=1756804277;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=y8JOYv3zqvR4zXTBElS17o9P6N9q3t/mIuVGm9ATAq8=;
 b=kY644Av9F+ydxOGDRPjUkhH0OWwml1kJP0OTkhLxmhJzPbV7Hg9d2byd
 ilyMgkLF/hFkDuo0TgVA+kJ6J+RlxXJ90SCDjxNUx+qQ6gBeENYrZ47m8
 uXhqFb7NB5WYnETz3fH6F7nxZtL27GlcWiD6B/EVzblUuMxFLHZetuGMI
 +qyXDRcRmAzJup46SuuEWo4onio2WC/9tGrNsW1oapckN3+tOAXcyzija
 GGa2P57itWHq4od7XSSLj7WeZbqPXsrjoDM82NX0k/D3DJxpmF+JqhjZq
 p+tqnDS7x476O3qufTWuKepggzYPaKi+yMCSE6LAC+6QkWxG2WPtdylgx Q==;
X-CSE-ConnectionGUID: +SGcAbPWS0uS7XYofDTZ9w==
X-CSE-MsgGUID: Z0leZoMgRWat73QIM4fVzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="27713223"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="27713223"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 02:11:17 -0700
X-CSE-ConnectionGUID: WaLg3gnKRKSM6JP/hG8vew==
X-CSE-MsgGUID: avjXx4w4SQq1KBuS6j1uUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="65272580"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 02:11:12 -0700
Message-ID: <7724fc32-3dbe-41dd-ad13-e91f7e6ebd8c@linux.intel.com>
Date: Mon, 2 Sep 2024 14:44:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm: Introduce device wedged event
To: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, daniel@ffwll.ch,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, anshuman.gupta@intel.com,
 bellekallu.rajkiran@intel.com, saikishore.konda@intel.com
References: <20240902074859.2992849-1-raag.jadav@intel.com>
 <20240902074859.2992849-2-raag.jadav@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20240902074859.2992849-2-raag.jadav@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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


On 02/09/24 13:18, Raag Jadav wrote:
> Introduce device wedged event, which will notify userspace of wedged
> (hanged/unusable) state of the DRM device through a uevent. This is
> useful especially in cases where the device is in unrecoverable state
> and requires userspace intervention for recovery.
>
> Purpose of this implementation is to be vendor agnostic. Userspace
> consumers (sysadmin) can define udev rules to parse this event and
> take respective action to recover the device.
>
> Consumer expectations:
> ----------------------
> 1) Unbind driver
> 2) Reset bus device
> 3) Re-bind driver
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/drm_drv.c | 21 +++++++++++++++++++++
>  include/drm/drm_drv.h     |  1 +
>  2 files changed, 22 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 93543071a500..dc55cc237d89 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -499,6 +499,27 @@ void drm_dev_unplug(struct drm_device *dev)
>  }
>  EXPORT_SYMBOL(drm_dev_unplug);
>  
> +/**
> + * drm_dev_wedged - declare DRM device as wedged
> + * @dev: DRM device
> + *
> + * This declares a DRM device specified by @dev as wedged (hanged/unusable)
this doesn't seem to set any drm state as wedged, it is just sending an
uevent. you might need to correct the above statement.

Thanks,
Aravind.
> + * and generates a uevent for it, on the basis of which, userspace may take
> + * respective action to recover the device.
> + * Currently we only set WEDGED=1 in the uevent environment, but this can
> + * be expanded in the future.
> + */
> +void drm_dev_wedged(struct drm_device *dev)
> +{
> +	char *event_string = "WEDGED=1";
> +	char *envp[] = { event_string, NULL };
> +
> +	DRM_INFO("%s: device wedged, generating uevent\n", dev_name(dev->dev));
> +
> +	kobject_uevent_env(&dev->primary->kdev->kobj, KOBJ_CHANGE, envp);
> +}
> +EXPORT_SYMBOL(drm_dev_wedged);
> +
>  /*
>   * DRM internal mount
>   * We want to be able to allocate our own "struct address_space" to control
> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
> index cd37936c3926..a0b2d1435b86 100644
> --- a/include/drm/drm_drv.h
> +++ b/include/drm/drm_drv.h
> @@ -489,6 +489,7 @@ void drm_put_dev(struct drm_device *dev);
>  bool drm_dev_enter(struct drm_device *dev, int *idx);
>  void drm_dev_exit(int idx);
>  void drm_dev_unplug(struct drm_device *dev);
> +void drm_dev_wedged(struct drm_device *dev);
>  
>  /**
>   * drm_dev_is_unplugged - is a DRM device unplugged
