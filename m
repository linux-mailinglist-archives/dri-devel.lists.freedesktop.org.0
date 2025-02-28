Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B924A49C8B
	for <lists+dri-devel@lfdr.de>; Fri, 28 Feb 2025 15:58:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2770A10ECBE;
	Fri, 28 Feb 2025 14:58:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="O5v/WYO3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3028C10ECC2;
 Fri, 28 Feb 2025 14:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740754691; x=1772290691;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=P3/dKWCrXg9xbyVMzNavco2Gioz53PLfKQWPNVBdltI=;
 b=O5v/WYO3o++cCaQIQCWjnMo9FT5Ms+ZyutoXCg7UlJQwrFXXsa/flFJN
 UtuY73gkQHPZFq149do6NeUCMV+Ch/Hjyf6K/49Ztn3XwxZf4axpSJucU
 dHCL21lK18YMyRAFEc7Zk7P8WcYzhx2Edo3mxuM8mV/WQ2iXxygX78siF
 mi351q84/g21AN9XeRXm7u1tz0JSY4RlwRFwnB8PLJCzokeqUXpMjJA6k
 j26aCVyBzLYPtJOWsK3rzcLG1TgGIV0JVE6+AIs2/ZnGysD/+RQpsjN/Q
 DeM5orz4W3NM/nQ40kyzYZvThttzo2GLb8b6xts8LEY3whySWlpoTz8cD w==;
X-CSE-ConnectionGUID: DPD4wmCEQmWk6VWl3yWhAg==
X-CSE-MsgGUID: DDyRQ60xTOKNxkfklC2SNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11359"; a="45335793"
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="45335793"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 06:58:11 -0800
X-CSE-ConnectionGUID: 0I400npkTeaPtmZdVlAu4g==
X-CSE-MsgGUID: wON0cZZsTLqP4Z8vtGSuaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,322,1732608000"; d="scan'208";a="122308263"
Received: from black.fi.intel.com ([10.237.72.28])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Feb 2025 06:58:06 -0800
Date: Fri, 28 Feb 2025 16:58:02 +0200
From: Raag Jadav <raag.jadav@intel.com>
To: =?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 'Christian =?iso-8859-1?Q?K=F6nig'?= <christian.koenig@amd.com>,
 siqueira@igalia.com, airlied@gmail.com, simona@ffwll.ch,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com
Subject: Re: [PATCH 2/2] drm/amdgpu: Make use of drm_wedge_app_info
Message-ID: <Z8HO-s_otb2u44V7@black.fi.intel.com>
References: <20250228121353.1442591-1-andrealmeid@igalia.com>
 <20250228121353.1442591-3-andrealmeid@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250228121353.1442591-3-andrealmeid@igalia.com>
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

On Fri, Feb 28, 2025 at 09:13:53AM -0300, André Almeida wrote:
> To notify userspace about which app (if any) made the device get in a
> wedge state, make use of drm_wedge_app_info parameter, filling it with
> the app PID and name.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 19 +++++++++++++++++--
>  drivers/gpu/drm/amd/amdgpu/amdgpu_job.c    |  6 +++++-
>  2 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 00b9b87dafd8..e06adf6f34fd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -6123,8 +6123,23 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>  
>  	atomic_set(&adev->reset_domain->reset_res, r);
>  
> -	if (!r)
> -		drm_dev_wedged_event(adev_to_drm(adev), DRM_WEDGE_RECOVERY_NONE, NULL);
> +	if (!r) {
> +		struct drm_wedge_app_info aux, *info = NULL;
> +
> +		if (job) {
> +			struct amdgpu_task_info *ti;
> +
> +			ti = amdgpu_vm_get_task_info_pasid(adev, job->pasid);
> +			if (ti) {
> +				aux.pid = ti->pid;
> +				aux.comm = ti->process_name;
> +				info = &aux;
> +				amdgpu_vm_put_task_info(ti);
> +			}
> +		}

Is this guaranteed to be guilty app and not some scheduled worker?

Raag
