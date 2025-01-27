Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB25DA1D9E3
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 16:50:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9070A10E321;
	Mon, 27 Jan 2025 15:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="M7iVJ83D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A33010E321
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 15:50:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1737993040; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mGUq0CF/vTXpp2CaxtH/o9HtMI5+KmymudDDoLO7Ueo2ug0wBpPz+UmNQr+z+pjLpIL7teAkkukH60u3LQZa8nvWLV4c39SIbWNQ/x2vRvHwO7hH0TxARVymP1GsWiFEsm9kWF1DE539xIu518MAK3VSueYYcVmfQFilwk2TvMI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1737993040;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Raz3VDWFX7OA0KFnV8b3nXn+gw9R5FjI3tQ/nG0OFc0=; 
 b=V1rePpfm2wLx+spNQeVpzHMWvOkXSkHjj1JVrwCH/BtwDB4MUrw6+abdQe2U2CyKL3tgROkpydianc+zoD48Lj3k1AStOURhI2e+2aC85/lX8A+Og+DByXmWu0dsIeof6B9SmqPcHHOZphyoxcinA32bEh6BS8zfb/gWbPkJJFc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737993040; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:Date:Date:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=Raz3VDWFX7OA0KFnV8b3nXn+gw9R5FjI3tQ/nG0OFc0=;
 b=M7iVJ83DMzRPV/b8DGs1jWJMkb5TBjv5l6iIg3Al/sZ3brnZeisUhhwnRq62xpPV
 kRyPgFlJRMLRu65AfnPfgRwYhAfonwixcaky9SqlxMkx/+Mzq1xlG1XS4ZcQaxZ7kuK
 6az8HbG5vkPVaXEU5bvyNjbFWuYHTmzami9zxCUk=
Received: by mx.zohomail.com with SMTPS id 1737993009579322.9985301707354;
 Mon, 27 Jan 2025 07:50:09 -0800 (PST)
From: adrian.larumbe@collabora.com
Date: Mon, 27 Jan 2025 15:50:06 +0000
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Mihail Atanassov <mihail.atanassov@arm.com>, nd@arm.com
Subject: Re: [RFC v2 3/8] drm/panthor: Add panthor_perf_init and
 panthor_perf_unplug
Message-ID: <lcl6powezrn65mced6rbwjfocc55h57qupducmp4u35vx4on6e@h5sfpossrvqd>
wFrom: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
References: <20241211165024.490748-1-lukas.zapolskas@arm.com>
 <20241211165024.490748-4-lukas.zapolskas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211165024.490748-4-lukas.zapolskas@arm.com>
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

On 11.12.2024 16:50, Lukas Zapolskas wrote:
> Added the panthor_perf system initialization and unplug code to allow
> for the handling of userspace sessions to be added in follow-up patches.
> 
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  7 +++
>  drivers/gpu/drm/panthor/panthor_device.h |  5 +-
>  drivers/gpu/drm/panthor/panthor_perf.c   | 77 ++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_perf.h   |  3 +
>  4 files changed, 91 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 00f7b8ce935a..1a81a436143b 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -19,6 +19,7 @@
>  #include "panthor_fw.h"
>  #include "panthor_gpu.h"
>  #include "panthor_mmu.h"
> +#include "panthor_perf.h"
>  #include "panthor_regs.h"
>  #include "panthor_sched.h"
>  
> @@ -97,6 +98,7 @@ void panthor_device_unplug(struct panthor_device *ptdev)
>  	/* Now, try to cleanly shutdown the GPU before the device resources
>  	 * get reclaimed.
>  	 */
> +	panthor_perf_unplug(ptdev);
>  	panthor_sched_unplug(ptdev);
>  	panthor_fw_unplug(ptdev);
>  	panthor_mmu_unplug(ptdev);
> @@ -262,6 +264,10 @@ int panthor_device_init(struct panthor_device *ptdev)
>  	if (ret)
>  		goto err_unplug_fw;
>  
> +	ret = panthor_perf_init(ptdev);
> +	if (ret)
> +		goto err_unplug_fw;
> +
>  	/* ~3 frames */
>  	pm_runtime_set_autosuspend_delay(ptdev->base.dev, 50);
>  	pm_runtime_use_autosuspend(ptdev->base.dev);
> @@ -275,6 +281,7 @@ int panthor_device_init(struct panthor_device *ptdev)
>  
>  err_disable_autosuspend:
>  	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
> +	panthor_perf_unplug(ptdev);
>  	panthor_sched_unplug(ptdev);
>  
>  err_unplug_fw:
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 636542c1dcbd..aca33d03036c 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -26,7 +26,7 @@ struct panthor_heap_pool;
>  struct panthor_job;
>  struct panthor_mmu;
>  struct panthor_fw;
> -struct panthor_perfcnt;
> +struct panthor_perf;
>  struct panthor_vm;
>  struct panthor_vm_pool;
>  
> @@ -137,6 +137,9 @@ struct panthor_device {
>  	/** @devfreq: Device frequency scaling management data. */
>  	struct panthor_devfreq *devfreq;
>  
> +	/** @perf: Performance counter management data. */
> +	struct panthor_perf *perf;
> +
>  	/** @unplug: Device unplug related fields. */
>  	struct {
>  		/** @lock: Lock used to serialize unplug operations. */
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
> index 0e3d769c1805..e0dc6c4b0cf1 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.c
> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
> @@ -13,6 +13,24 @@
>  #include "panthor_perf.h"
>  #include "panthor_regs.h"
>  
> +struct panthor_perf {
> +	/**
> +	 * @block_set: The global counter set configured onto the HW.
> +	 */
> +	u8 block_set;
> +
> +	/** @next_session: The ID of the next session. */
> +	u32 next_session;
> +
> +	/** @session_range: The number of sessions supported at a time. */
> +	struct xa_limit session_range;
> +
> +	/**
> +	 * @sessions: Global map of sessions, accessed by their ID.
> +	 */
> +	struct xarray sessions;
> +};
> +
>  /**
>   * PANTHOR_PERF_COUNTERS_PER_BLOCK - On CSF architectures pre-11.x, the number of counters
>   * per block was hardcoded to be 64. Arch 11.0 onwards supports the PRFCNT_FEATURES GPU register,
> @@ -45,3 +63,62 @@ void panthor_perf_info_init(struct panthor_device *ptdev)
>  	perf_info->shader_blocks = hweight64(ptdev->gpu_info.shader_present);
>  }
>  
> +/**
> + * panthor_perf_init - Initialize the performance counter subsystem.
> + * @ptdev: Panthor device
> + *
> + * The performance counters require the FW interface to be available to setup the
> + * sampling ringbuffers, so this must be called only after FW is initialized.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int panthor_perf_init(struct panthor_device *ptdev)
> +{
> +	struct panthor_perf *perf;
> +
> +	if (!ptdev)
> +		return -EINVAL;
> +
> +	perf = devm_kzalloc(ptdev->base.dev, sizeof(*perf), GFP_KERNEL);
> +	if (ZERO_OR_NULL_PTR(perf))
> +		return -ENOMEM;
> +
> +	xa_init_flags(&perf->sessions, XA_FLAGS_ALLOC);
> +
> +	/* Currently, we only support a single session at a time. */
> +	perf->session_range = (struct xa_limit) {
> +		.min = 0,
> +		.max = 1,
> +	};
> +
> +	drm_info(&ptdev->base, "Performance counter subsystem initialized");
> +
> +	ptdev->perf = perf;
> +
> +	return 0;
> +}
> +
> +/**
> + * panthor_perf_unplug - Terminate the performance counter subsystem.
> + * @ptdev: Panthor device.
> + *
> + * This function will terminate the performance counter control structures and any remaining
> + * sessions, after waiting for any pending interrupts.
> + */
> +void panthor_perf_unplug(struct panthor_device *ptdev)
> +{
> +	struct panthor_perf *perf = ptdev->perf;
> +
> +	if (!perf)
> +		return;
> +
> +	if (!xa_empty(&perf->sessions))
> +		drm_err(&ptdev->base,
> +				"Performance counter sessions active when unplugging the driver!");
> +
> +	xa_destroy(&perf->sessions);
> +
> +	devm_kfree(ptdev->base.dev, ptdev->perf);
> +
> +	ptdev->perf = NULL;

I thought this could be racy with the perfcnt IRQ handler, but maybe if the sessions array is
already empty by then then it doesn't matter.

> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
> index cff537a370c9..90af8b18358c 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.h
> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
> @@ -9,4 +9,7 @@ struct panthor_device;
>  
>  void panthor_perf_info_init(struct panthor_device *ptdev);
>  
> +int panthor_perf_init(struct panthor_device *ptdev);
> +void panthor_perf_unplug(struct panthor_device *ptdev);
> +
>  #endif /* __PANTHOR_PERF_H__ */
> -- 
> 2.25.1

Adrian Larumbe
