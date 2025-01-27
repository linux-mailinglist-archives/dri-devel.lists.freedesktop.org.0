Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D180FA1DD24
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jan 2025 21:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 478C110E5B1;
	Mon, 27 Jan 2025 20:06:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="laeTHM9k";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B68910E5B1
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jan 2025 20:06:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1738008386; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ho08J3Va4ALni81bgn5s7aM3Seicybgn/ItGFeglw5WcetpkrdcglWt3cxu1NYXVpg2Wr+IDe9NzZku7Bopk0xeV5EhQUlVghp/1Q6eB1EOviSFFaTpF+TTa50oNM9eYJFFDC3yFKtJsxP9pOWfAhcHIB745jumDk3Z+vDG2hMU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1738008386;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=4Ejvg9/YMi/cJW0b/dVzGmGW6dxSGc78OfihsW8TkC0=; 
 b=b2f8NokJWL75OjbFFQiWCJhArOsm2eOQp95phKgT010CmUpyKt5tP1OSlThCbJvZso9nPcrcD61iTImsUSFCZ/p39ZrMuU/KnRKcyWkf9+J2tsvTtmQRs+ugPG4dfR2pRrQ6vTn+yFuZaZXuPSOp4B8/PzpRqHweM3abvGgi7sI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1738008386; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=4Ejvg9/YMi/cJW0b/dVzGmGW6dxSGc78OfihsW8TkC0=;
 b=laeTHM9kz0JEK7CqDLM7acowQ59QCfjkRUVJp/T051+YE2aNVynXk1TJLagqiI8z
 LLrxxGyjo1iRm4F6evslfoEh2eiiWbJoi3cuwqDjisrEOmsLupj0U2ZNrgh/l3ecoSK
 rYlHBCCxzLXYavuceL7yZv7aU3C3jRJByVo8uBPY=
Received: by mx.zohomail.com with SMTPS id 1738008381502621.9566587318062;
 Mon, 27 Jan 2025 12:06:21 -0800 (PST)
Date: Mon, 27 Jan 2025 20:06:18 +0000
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Mihail Atanassov <mihail.atanassov@arm.com>, nd@arm.com
Subject: Re: [RFC v2 7/8] drm/panthor: Add suspend/resume handling for the
 performance counters
Message-ID: <vyjob57q2najc3ybjlgje6s2q26cfpicbz4kskcwpxirovdeht@7ljrdy7udmag>
References: <20241211165024.490748-1-lukas.zapolskas@arm.com>
 <20241211165024.490748-8-lukas.zapolskas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211165024.490748-8-lukas.zapolskas@arm.com>
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
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  3 +
>  drivers/gpu/drm/panthor/panthor_perf.c   | 86 ++++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_perf.h   |  2 +
>  3 files changed, 91 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 1a81a436143b..69536fbdb5ef 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -475,6 +475,7 @@ int panthor_device_resume(struct device *dev)
>  		ret = drm_WARN_ON(&ptdev->base, panthor_fw_resume(ptdev));
>  		if (!ret) {
>  			panthor_sched_resume(ptdev);
> +			panthor_perf_resume(ptdev);
>  		} else {
>  			panthor_mmu_suspend(ptdev);
>  			panthor_gpu_suspend(ptdev);
> @@ -543,6 +544,7 @@ int panthor_device_suspend(struct device *dev)
>  	    drm_dev_enter(&ptdev->base, &cookie)) {
>  		cancel_work_sync(&ptdev->reset.work);
>  
> +		panthor_perf_suspend(ptdev);
>  		/* We prepare everything as if we were resetting the GPU.
>  		 * The end of the reset will happen in the resume path though.
>  		 */
> @@ -561,6 +563,7 @@ int panthor_device_suspend(struct device *dev)
>  			panthor_mmu_resume(ptdev);
>  			drm_WARN_ON(&ptdev->base, panthor_fw_resume(ptdev));
>  			panthor_sched_resume(ptdev);
> +			panthor_perf_resume(ptdev);
>  			drm_dev_exit(cookie);
>  		}
>  
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
> index d62d97c448da..727e66074eab 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.c
> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
> @@ -433,6 +433,17 @@ static void panthor_perf_em_zero(struct panthor_perf_enable_masks *em)
>  		bitmap_zero(em->mask[i], PANTHOR_PERF_EM_BITS);
>  }
>  
> +static bool panthor_perf_em_empty(const struct panthor_perf_enable_masks *const em)
> +{
> +	bool empty = true;
> +	size_t i = 0;
> +
> +	for (i = DRM_PANTHOR_PERF_BLOCK_FW; i <= DRM_PANTHOR_PERF_BLOCK_LAST; i++)
> +		empty &= bitmap_empty(em->mask[i], PANTHOR_PERF_EM_BITS);
> +
> +	return empty;
> +}
> +
>  static void panthor_perf_destroy_em_kref(struct kref *em_kref)
>  {
>  	struct panthor_perf_enable_masks *em = container_of(em_kref, typeof(*em), refs);
> @@ -1652,6 +1663,81 @@ void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_per
>  	}
>  }
>  
> +static int panthor_perf_sampler_resume(struct panthor_perf_sampler *sampler)
> +{
> +	int ret;
> +
> +	if (!atomic_read(&sampler->enabled_clients))
> +		return 0;
> +
> +	if (!panthor_perf_em_empty(sampler->em)) {
> +		guard(mutex)(&sampler->config_lock);
> +		panthor_perf_fw_write_em(sampler, sampler->em);
> +	}

Aren't panthor_perf_em_empty(sampler->em) and !atomic_read(&sampler->enabled_clients) functionally equivalent?

> +
> +	ret = panthor_perf_fw_start_sampling(sampler->ptdev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int panthor_perf_sampler_suspend(struct panthor_perf_sampler *sampler)
> +{
> +	int ret;
> +
> +	if (!atomic_read(&sampler->enabled_clients))
> +		return 0;
> +
> +	ret = panthor_perf_fw_stop_sampling(sampler->ptdev);
> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +/**
> + * panthor_perf_suspend - Prepare the performance counter subsystem for system suspend.
> + * @ptdev: Panthor device.
> + *
> + * Indicate to the performance counters that the system is suspending.
> + *
> + * This function must not be used to handle MCU power state transitions: just before MCU goes
> + * from on to any inactive state, an automatic sample will be performed by the firmware, and
> + * the performance counter firmware state will be restored on warm boot.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int panthor_perf_suspend(struct panthor_device *ptdev)
> +{
> +	struct panthor_perf *perf = ptdev->perf;
> +
> +	if (!perf)
> +		return 0;
> +
> +	return panthor_perf_sampler_suspend(&perf->sampler);
> +}
> +
> +/**
> + * panthor_perf_resume - Resume the performance counter subsystem after system resumption.
> + * @ptdev: Panthor device.
> + *
> + * Indicate to the performance counters that the system has resumed. This must not be used
> + * to handle MCU state transitions, for the same reasons as detailed in the kerneldoc for
> + * @panthor_perf_suspend.
> + *
> + * Return: 0 on success, negative error code on failure.
> + */
> +int panthor_perf_resume(struct panthor_device *ptdev)
> +{
> +	struct panthor_perf *perf = ptdev->perf;
> +
> +	if (!perf)
> +		return 0;
> +
> +	return panthor_perf_sampler_resume(&perf->sampler);
> +}
> +
>  /**
>   * panthor_perf_unplug - Terminate the performance counter subsystem.
>   * @ptdev: Panthor device.
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
> index 3485e4a55e15..a22a511a0809 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.h
> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
> @@ -16,6 +16,8 @@ struct panthor_perf;
>  void panthor_perf_info_init(struct panthor_device *ptdev);
>  
>  int panthor_perf_init(struct panthor_device *ptdev);
> +int panthor_perf_suspend(struct panthor_device *ptdev);
> +int panthor_perf_resume(struct panthor_device *ptdev);
>  void panthor_perf_unplug(struct panthor_device *ptdev);
>  
>  int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
> -- 
> 2.25.1

Adrian Larumbe
