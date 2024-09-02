Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7D99682AE
	for <lists+dri-devel@lfdr.de>; Mon,  2 Sep 2024 11:07:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4743D10E267;
	Mon,  2 Sep 2024 09:07:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LIbaJQbM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4DA810E267;
 Mon,  2 Sep 2024 09:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1725268024; x=1756804024;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=biGrAZixd+CiutT5ZMSnlwiEWW44FE0ZmHhwy6VXHzU=;
 b=LIbaJQbMXFA6WLVMK0fyMVb9qg1HLpH2BhXv+3ao3NpGXsu4KbYYXmz0
 H/U0X/9PeEwk1dWrs7HW/HuJMA2usq4gzJLvK9h1hlnrgHnkZpiao7LJk
 laG1ALl/VcJgp5XyoO1pO3Al9eiPLbVsx3NhhTfYZgExOHRhKma/a/FTy
 AJKBmstD+TMwwfwrCha0LcPcjZ3481aUdMfBVGPdLxqJko66rujOllmaz
 LAj1LnDWHTGisD2yefFXSJyJE/SqSDl7WXUFdGiXlUNr5JKVwPt1kelQQ
 tMZngzVJYeucocL2UWEG9R0MZyEOjve7v/5NjZI8PAvHFfCZ4e7U9WuFx Q==;
X-CSE-ConnectionGUID: weUhj7pAQku/l6FGFhiung==
X-CSE-MsgGUID: YyagndykSJe7sFHq7OGAPw==
X-IronPort-AV: E=McAfee;i="6700,10204,11182"; a="34997357"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="34997357"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 02:06:49 -0700
X-CSE-ConnectionGUID: qtA4LAMURuOGafUBQTx81A==
X-CSE-MsgGUID: CJVnLBimQeyRtrLRInBxWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; d="scan'208";a="64232817"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Sep 2024 02:06:44 -0700
Message-ID: <4774e2a3-f574-4ffe-9160-3d8c01e25d22@linux.intel.com>
Date: Mon, 2 Sep 2024 14:39:54 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] drm/xe: Use device wedged event
To: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, daniel@ffwll.ch,
 lucas.demarchi@intel.com, thomas.hellstrom@linux.intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, anshuman.gupta@intel.com,
 bellekallu.rajkiran@intel.com, saikishore.konda@intel.com
References: <20240902074859.2992849-1-raag.jadav@intel.com>
 <20240902074859.2992849-3-raag.jadav@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20240902074859.2992849-3-raag.jadav@intel.com>
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

This patch looks entirely new from what was sent earlier
so you could send it as a fresh patch.

Thanks,
Aravind,
> From: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>
> This was previously attempted as xe specific reset uevent but dropped
> in commit 77a0d4d1cea2 ("drm/xe/uapi: Remove reset uevent for now")
> as part of refactoring.
>
> Now that we have device wedged event supported by DRM core, make use
> of it. With this in place userspace will be notified of wedged device,
> on the basis of which, userspace may take respective action to recover
> the device.
>
> $ udevadm monitor --property --kernel
> monitor will print the received events for:
> KERNEL - the kernel uevent
>
> KERNEL[307.420340] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)
> ACTION=change
> DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0
> SUBSYSTEM=drm
> WEDGED=1
> DEVNAME=/dev/dri/card0
> DEVTYPE=drm_minor
> SEQNUM=5106
> MAJOR=226
> MINOR=0
>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Co-developed-by: Raag Jadav <raag.jadav@intel.com>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 1a0d7fdd094b..82b1583ada30 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -959,11 +959,12 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>   * xe_device_declare_wedged - Declare device wedged
>   * @xe: xe device instance
>   *
> - * This is a final state that can only be cleared with a mudule
> + * This is a final state that can only be cleared with a module
>   * re-probe (unbind + bind).
>   * In this state every IOCTL will be blocked so the GT cannot be used.
>   * In general it will be called upon any critical error such as gt reset
> - * failure or guc loading failure.
> + * failure or guc loading failure. Userspace will be notified of this state
> + * by a DRM uevent.
>   * If xe.wedged module parameter is set to 2, this function will be called
>   * on every single execution timeout (a.k.a. GPU hang) right after devcoredump
>   * snapshot capture. In this mode, GT reset won't be attempted so the state of
> @@ -993,6 +994,9 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
>  			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>  			dev_name(xe->drm.dev));
> +
> +		/* Notify userspace of wedged device */
> +		drm_dev_wedged(&xe->drm);
>  	}
>  
>  	for_each_gt(gt, xe, id)
