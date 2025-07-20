Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94EBAB0B5A5
	for <lists+dri-devel@lfdr.de>; Sun, 20 Jul 2025 13:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60FE10E207;
	Sun, 20 Jul 2025 11:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GN+TnxmM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD8010E207;
 Sun, 20 Jul 2025 11:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753012060; x=1784548060;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=PS2wJLBlLM/FuLnFxvc4A1rRtk1V8DP3WmioodBjivg=;
 b=GN+TnxmMwaEcnyvV6yDwL535Y6uJqjRVMBu3hq4dF0tqCr8vPeh7HtZN
 xbzb40Y17KzHS5Yp3gAPVL/158nXF+6B1PD7dozdesecJPnWc7DUUzyyD
 HlfMzq+5kUnkQWVghWgHT8pegQn4dWG+ULFAOK6I3o07uA6BUICCxEyI7
 xnQCvGAlKiJw/VDkuN6LMsSgJDrORzQ53VI0gojORlvaq6sO84QaMdmsh
 JBQdIj523N5WJV8jeJDtPmCVRnvAsxbUCrilCJLfNba+2+B5gYewQCtIi
 XqBgZY6xx0M5cfkBR9zSJezuxkIjzg47h/ttafON7FovG9v/Hpj7qzKL9 w==;
X-CSE-ConnectionGUID: iR9K7Sa9QQazXDPU7G/MWw==
X-CSE-MsgGUID: 7gxmvHycTUKCE1qq6A+3pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="66595443"
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; d="scan'208";a="66595443"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2025 04:47:39 -0700
X-CSE-ConnectionGUID: oVpK9IT6QhyAba8NtANceQ==
X-CSE-MsgGUID: Tc80ItjXTHGyHIwLleEeWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,326,1744095600"; d="scan'208";a="164096490"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2025 04:47:35 -0700
Date: Sun, 20 Jul 2025 14:47:32 +0300
From: Raag Jadav <raag.jadav@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 anshuman.gupta@intel.com, rodrigo.vivi@intel.com,
 lucas.demarchi@intel.com, aravind.iddamsetty@linux.intel.com,
 umesh.nerlige.ramappa@intel.com, frank.scarbrough@intel.com,
 sk.anirban@intel.com, simona.vetter@ffwll.ch, airlied@gmail.com,
 =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH v5 1/9] drm: Add a vendor-specific recovery method to
 device wedged uevent
Message-ID: <aHzXVKj_ZbIi6vg9@black.fi.intel.com>
References: <20250715104730.2109506-1-riana.tauro@intel.com>
 <20250715104730.2109506-2-riana.tauro@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250715104730.2109506-2-riana.tauro@intel.com>
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

On Tue, Jul 15, 2025 at 04:17:21PM +0530, Riana Tauro wrote:
> This patch addresses the need for a recovery method (firmware-update
> on Firmware errors) introduced in the later patches of Xe KMD. Whenever
> XE KMD detects a firmware error, a drm wedged uevent needs to be sent
> to the system administrator/userspace to trigger a firmware update.
> 
> The initial proposal to use 'firmware-flash' as a recovery method was
> not applicable to other drivers and could cause multiple recovery
> methods specific to vendors to be added.
> To address this a more generic 'vendor-specific' method is introduced,
> guiding users to refer to vendor specific documentation and system logs
> for detailed vendor specific recovery mechanism.
> 
> Add a recovery method 'WEDGED=vendor-specific' for such errors.
> Vendors must provide additional recovery documentation if this method
> is used.
> 
> It is the responsibility of the consumer to refer to the correct vendor
> specific documentation and usecase before attempting a recovery.
> 
> For example: If driver is XE KMD, the consumer must refer
> to the documentation of 'Device Wedging' under 'Documentation/gpu/xe/'
> 
> Recovery script contributed by Raag

Thank you, and a fullstop would make it even more awesome ;)

> v2: fix documentation (Raag)
> v3: add more details to commit message (Sima, Rodrigo, Raag)
>     add an example to the documentation (by Raag)
> 
> Cc: André Almeida <andrealmeid@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Co-developed-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>  Documentation/gpu/drm-uapi.rst | 41 +++++++++++++++++++++++++++++-----
>  drivers/gpu/drm/drm_drv.c      |  2 ++
>  include/drm/drm_device.h       |  4 ++++
>  3 files changed, 41 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
> index 843facf01b2d..a1a5a4de68ea 100644
> --- a/Documentation/gpu/drm-uapi.rst
> +++ b/Documentation/gpu/drm-uapi.rst
> @@ -421,10 +421,13 @@ Recovery
>  Current implementation defines three recovery methods, out of which, drivers
>  can use any one, multiple or none. Method(s) of choice will be sent in the
>  uevent environment as ``WEDGED=<method1>[,..,<methodN>]`` in order of less to
> -more side-effects. If driver is unsure about recovery or method is unknown
> -(like soft/hard system reboot, firmware flashing, physical device replacement
> -or any other procedure which can't be attempted on the fly), ``WEDGED=unknown``
> -will be sent instead.
> +more side-effects. If recovery method is specific to vendor
> +``WEDGED=vendor-specific`` will be sent and userspace should refer to vendor
> +specific documentation for further recovery steps. As an example if the driver

We'd want to be consistent with terminologies, so it's either 'steps' ...

> +is 'xe' then the documentation of 'Device Wedging' of xe driver needs to be
> +referred for the recovery mechanism.

... or 'mechanism'. Personally I'd use 'procedure' and make it consistent
with the example, but upto you.

> +If driver is unsure about recovery or method is unknown, ``WEDGED=unknown``
> +will be sent instead

And again, punctuations please!

Raag

>  Userspace consumers can parse this event and attempt recovery as per the
>  following expectations.
> @@ -435,6 +438,7 @@ following expectations.
>      none            optional telemetry collection
>      rebind          unbind + bind driver
>      bus-reset       unbind + bus reset/re-enumeration + bind
> +    vendor-specific vendor specific recovery method
>      unknown         consumer policy
>      =============== ========================================
>  
> @@ -472,8 +476,12 @@ erroring out, all device memory should be unmapped and file descriptors should
>  be closed to prevent leaks or undefined behaviour. The idea here is to clear the
>  device of all user context beforehand and set the stage for a clean recovery.
>  
> -Example
> --------
> +For ``WEDGED=vendor-specific`` recovery method, it is the responsibility of the
> +consumer to check the driver documentation and the usecase before attempting
> +a recovery.
> +
> +Example - rebind
> +----------------
>  
>  Udev rule::
>  
> @@ -491,6 +499,27 @@ Recovery script::
>      echo -n $DEVICE > $DRIVER/unbind
>      echo -n $DEVICE > $DRIVER/bind
>  
> +Example - vendor-specific
> +-------------------------
> +
> +Udev rule::
> +
> +    SUBSYSTEM=="drm", ENV{WEDGED}=="vendor-specific", DEVPATH=="*/drm/card[0-9]",
> +    RUN+="/path/to/vendor_specific_recovery.sh $env{DEVPATH}"
> +
> +Recovery script::
> +
> +    #!/bin/sh
> +
> +    DEVPATH=$(readlink -f /sys/$1/device)
> +    DRIVERPATH=$(readlink -f $DEVPATH/driver)
> +    DRIVER=$(basename $DRIVERPATH)
> +
> +    if [ "$DRIVER" = "xe" ]; then
> +        # Refer XE documentation and check usecase and recovery procedure
> +    fi
> +
> +
>  Customization
>  -------------
>  
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index cdd591b11488..0ac723a46a91 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -532,6 +532,8 @@ static const char *drm_get_wedge_recovery(unsigned int opt)
>  		return "rebind";
>  	case DRM_WEDGE_RECOVERY_BUS_RESET:
>  		return "bus-reset";
> +	case DRM_WEDGE_RECOVERY_VENDOR:
> +		return "vendor-specific";
>  	default:
>  		return NULL;
>  	}
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index a33aedd5e9ec..59fd3f4d5995 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -26,10 +26,14 @@ struct pci_controller;
>   * Recovery methods for wedged device in order of less to more side-effects.
>   * To be used with drm_dev_wedged_event() as recovery @method. Callers can
>   * use any one, multiple (or'd) or none depending on their needs.
> + *
> + * Refer to "Device Wedging" chapter in Documentation/gpu/drm-uapi.rst for more
> + * details.
>   */
>  #define DRM_WEDGE_RECOVERY_NONE		BIT(0)	/* optional telemetry collection */
>  #define DRM_WEDGE_RECOVERY_REBIND	BIT(1)	/* unbind + bind driver */
>  #define DRM_WEDGE_RECOVERY_BUS_RESET	BIT(2)	/* unbind + reset bus device + bind */
> +#define DRM_WEDGE_RECOVERY_VENDOR	BIT(3)	/* vendor specific recovery method */
>  
>  /**
>   * struct drm_wedge_task_info - information about the guilty task of a wedge dev
> -- 
> 2.47.1
> 
