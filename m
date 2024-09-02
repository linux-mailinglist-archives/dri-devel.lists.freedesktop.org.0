Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FA49680EF
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 09:51:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C59E710E229;
	Mon,  2 Sep 2024 07:51:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YCsLtOyM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30CEA10E227;
 Mon,  2 Sep 2024 07:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725263492; x=1756799492;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=1bIYyDRN6Itv/V+SI+wNCPVM+EQ7icu2HlWKL4h3sM4=;
 b=YCsLtOyME8yWdrW7nx9G02MFa6MiRdzRsSMVZ1RRthnJRWyfPaJdmVOG
 9gDMAw2+5XL9G+O0HNceC2shk5ecqswvF2mgswuiZ0SM8lUnaqyj5M5Bx
 WqSZdjB+m6qqd2p5/fwzIPkfWFEx7flTR4W5tDXGAdDwVuYymweWeMoBk
 DziKEv5hju00mR0LJvSeaxXtd6FcRZj79JOTKeBjcGrMSSNWfGhd9EI1p
 mw26kITV8EVMEBClORWksolbHwi2rK02S1F5YSSkFp9F2ALVh69aGLOD3
 FydEGZv71jpDgRsTjz4W54gC7Nj2ZojRBbC/0yszeRfj+AgLHQQDDTEgG Q==;
X-CSE-ConnectionGUID: gVhcFtDzQUmIlGzyigXQNA==
X-CSE-MsgGUID: Ze6o1VL1Qgy8pPfDzcommQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="34990144"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="34990144"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 00:51:31 -0700
X-CSE-ConnectionGUID: KbbecFu2SdO00Ntsy0NBXQ==
X-CSE-MsgGUID: +Vy0lC4rQDGjZQDwGpLnJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="101995326"
Received: from ltuz-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.4])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 00:51:25 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, daniel@ffwll.ch,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, bellekallu.rajkiran@intel.com,
 saikishore.konda@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: Re: [PATCH v3 1/3] drm: Introduce device wedged event
In-Reply-To: <20240902074859.2992849-2-raag.jadav@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240902074859.2992849-1-raag.jadav@intel.com>
 <20240902074859.2992849-2-raag.jadav@intel.com>
Date: Mon, 02 Sep 2024 10:51:12 +0300
Message-ID: <87o756v6hb.fsf@intel.com>
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

On Mon, 02 Sep 2024, Raag Jadav <raag.jadav@intel.com> wrote:
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

drm_info() please, and you can drop that handrolled dev_name().

BR,
Jani.

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

-- 
Jani Nikula, Intel
