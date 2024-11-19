Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 095949D1EEA
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 04:40:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E464210E5B7;
	Tue, 19 Nov 2024 03:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nBlUxHNA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 079B510E5A6;
 Tue, 19 Nov 2024 03:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731987649; x=1763523649;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=b0KPEHwCA8hHfMOdHmdJxi+S0ydLh5HiisLDrc22j3U=;
 b=nBlUxHNA2Vb89sauQvbrTCeTK6QLQ9hwd04hmcFy9S6+91PfJutvPbiz
 MwjTZv4eeeNbiqCEuBCQuVhy5tYTctyxQ4Zl8tVQx0PUzYYECOGJq0SrO
 KLtPdzrX6Et2BRiqivLgX2HkMjxVD9yMJb8Cec8RHXfsMwf/dBsoId5fl
 +5j2gY7SNZyjyxgfuW9KzaPqc37GCO2tIYzR+Xfw1uBdEsbOdDaJodXt2
 oxknbUmKcZJDULIeUgZdzGgLIATT++FEsi5jNn22pvFInQ9zIM4qusBBF
 w5sGPOk+4n9KJKdW43g5lbBi3eF6/JuKxsYmnp4kx7oUPbNVzqCd7DVb9 Q==;
X-CSE-ConnectionGUID: gdbtPc9fQt+mcIRsmwx0nQ==
X-CSE-MsgGUID: 461rk4BtQkyuReWuhzxTlw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="43352060"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="43352060"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 19:40:48 -0800
X-CSE-ConnectionGUID: akoB1ctJT4+eHWoOqKL9Cg==
X-CSE-MsgGUID: R8hOi1jYSH+or9vmxFqKLQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="94477338"
Received: from aravind-dev.iind.intel.com (HELO [10.145.162.146])
 ([10.145.162.146])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 19:40:43 -0800
Message-ID: <cf31d73d-e416-469e-a049-fc4b1d987fa9@linux.intel.com>
Date: Tue, 19 Nov 2024 09:13:59 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 4/4] drm/i915: Use device wedged event
To: Raag Jadav <raag.jadav@intel.com>, airlied@gmail.com, simona@ffwll.ch,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 lina@asahilina.net, michal.wajdeczko@intel.com, christian.koenig@amd.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 anshuman.gupta@intel.com, alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com
References: <20241115050733.806934-1-raag.jadav@intel.com>
 <20241115050733.806934-5-raag.jadav@intel.com>
Content-Language: en-US
From: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>
In-Reply-To: <20241115050733.806934-5-raag.jadav@intel.com>
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
> Now that we have device wedged event provided by DRM core, make use
> of it and support both driver rebind and bus-reset based recovery.
> With this in place, userspace will be notified of wedged device on
> gt reset failure.
>
> Signed-off-by: Raag Jadav <raag.jadav@intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_reset.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_reset.c b/drivers/gpu/drm/i915/gt/intel_reset.c
> index f42f21632306..18cf50a1e84d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_reset.c
> +++ b/drivers/gpu/drm/i915/gt/intel_reset.c
> @@ -1418,6 +1418,9 @@ static void intel_gt_reset_global(struct intel_gt *gt,
>  
>  	if (!test_bit(I915_WEDGED, &gt->reset.flags))
>  		kobject_uevent_env(kobj, KOBJ_CHANGE, reset_done_event);
> +	else
> +		drm_dev_wedged_event(&gt->i915->drm,
> +				     DRM_WEDGE_RECOVERY_REBIND | DRM_WEDGE_RECOVERY_BUS_RESET);
Reviewed-by: Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>

Thanks,
Aravind.
>  }
>  
>  /**
