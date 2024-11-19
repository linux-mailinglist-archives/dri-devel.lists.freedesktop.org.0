Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 749E09D1ECC
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 04:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49E2610E0E6;
	Tue, 19 Nov 2024 03:25:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LGDSpTjN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5709D10E0E6;
 Tue, 19 Nov 2024 03:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731986731; x=1763522731;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=AvQLeSWIB/RrVgpj4+hYmlLC2Bv3tG3pO/cE4+Qt9ZE=;
 b=LGDSpTjN67DrMVdHhVblNDgGmbEBYUt9Qtbl0XFu8eW6ujAJhyb75yTZ
 B9yXRb5qijVzLfgtZYMTTdQOIzPTwQZ1H0iGkOQq8L281kGz2/X9EtF0x
 gRg59B4JZFDpIMfomWcBG2dQN6zY3qwmy84jlKxoWutykNjjJ4VtyvrwS
 FqggsTqsup0MQ02FvkjXaCI9YvvRSfhmAYMlvPjk5AjQrT8AzoLXeR/vu
 eQnCX1zNZqwEHM4OD83SF2Z/33EYJVIuXw0Rtt0SJSnk2HBU2MtcyntKj
 7Fu+hGPqKp/qLAzFpOxvzh55GTs6y965xUMErALDcgvLDiP6NSACA9Kpb A==;
X-CSE-ConnectionGUID: HNCGlvAYSCCrWTDnP0d47w==
X-CSE-MsgGUID: Tq8bsHp4RhSLgiWPpnky1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="31721703"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="31721703"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 19:25:30 -0800
X-CSE-ConnectionGUID: IOrVK42mRei6J+uzsr7+Dw==
X-CSE-MsgGUID: MJq8zgCjQ12fLvQMrv1dsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="94358674"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 19:25:26 -0800
Message-ID: <c267f1e6-0669-4b25-8552-c0311b461450@linux.intel.com>
Date: Tue, 19 Nov 2024 08:58:42 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/4] drm/xe: Use device wedged event
To: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com, christian.koenig@amd.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241115050733.806934-1-raag.jadav@intel.com>
 <20241115050733.806934-4-raag.jadav@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20241115050733.806934-4-raag.jadav@intel.com>
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


On 15/11/24 10:37, Raag Jadav wrote:
> This was previously attempted as xe specific reset uevent but dropped
> in commit 77a0d4d1cea2 ("drm/xe/uapi: Remove reset uevent for now")
> as part of refactoring.
>
> Now that we have device wedged event provided by DRM core, make use
> of it and support both driver rebind and bus-reset based recovery.
> With this in place userspace will be notified of wedged device, on
> the basis of which, userspace may take respective action to recover
> the device.
>
> $ udevadm monitor --property --kernel
> monitor will print the received events for:
> KERNEL - the kernel uevent
>
> KERNEL[265.802982] change   /devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0 (drm)
> ACTION=change
> DEVPATH=/devices/pci0000:00/0000:00:01.0/0000:01:00.0/0000:02:01.0/0000:03:00.0/drm/card0
> SUBSYSTEM=drm
> WEDGED=rebind,bus-reset
> DEVNAME=/dev/dri/card0
> DEVTYPE=drm_minor
> SEQNUM=5208
> MAJOR=226
> MINOR=0
LGTM.
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

Thanks,
Aravind.
>
> v2: Change authorship to Himal (Aravind)
>     Add uevent for all device wedged cases (Aravind)
> v3: Generic re-implementation in DRM subsystem (Lucas)
> v4: Change authorship to Raag (Aravind)
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 0e2dd691bdae..5878b331e35c 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -989,11 +989,12 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
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
> @@ -1023,6 +1024,10 @@ void xe_device_declare_wedged(struct xe_device *xe)
>  			"IOCTLs and executions are blocked. Only a rebind may clear the failure\n"
>  			"Please file a _new_ bug report at https://gitlab.freedesktop.org/drm/xe/kernel/issues/new\n",
>  			dev_name(xe->drm.dev));
> +
> +		/* Notify userspace of wedged device */
> +		drm_dev_wedged_event(&xe->drm,
> +				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
>  	}
>  
>  	for_each_gt(gt, xe, id)
