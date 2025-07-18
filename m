Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26E56B0A6C0
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 17:01:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DC9C10E9E0;
	Fri, 18 Jul 2025 15:01:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="ZWjResWg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7565F10E9E0
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 15:01:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1752850902; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=WadRH0zJABxzY64CNs6q19zu23tqqKYxsFJqyPOrbZvuizqbIR+NVsxPwC/SlXe+eqaat6RS8y3yNuEM+QPUUsyQDf2dP+/HMnO5uxEnLYSiLHub63pGYRgutvPYK/PHGBwgB+eGtzDMaKmFaYK7CjgWsZLK1VsDtUa32LIG3Jc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1752850902;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=ksqi0IH2WFRPwURXSfU+EBKvfQ8NegY60MqtB95hkGA=; 
 b=GQKgy/0kenWx3E41Y2r5TYNJzYz6cRb77N9SoJt37+N3nOEcLktemWqe5XpCFIl8lyArJjse4DG+qqQB8BWg7GSmt4nqSoWLegycizE38S0liDegRP+oF60NExHXpErjErrzh9s7MAFUWHOWOeuOfO58/PlW/PVe/y3yM+9ZnZA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1752850902; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=ksqi0IH2WFRPwURXSfU+EBKvfQ8NegY60MqtB95hkGA=;
 b=ZWjResWgY54yEoNImn3LDwgR0/gYWE5EO44SUr0k4S9noO3hT1imbPoegghjPjV9
 n3a9xFJVJ2x2r28+RJM99sbiiU6gQ336N881j8B8pq3Iyn24SGLNr7cur88R/GbHclr
 2KHk54R1xAH7YjtFore/lZE/hXm2UCVPYcrOU9HU=
Received: by mx.zohomail.com with SMTPS id 1752850900937669.0849005459913;
 Fri, 18 Jul 2025 08:01:40 -0700 (PDT)
Date: Fri, 18 Jul 2025 16:01:36 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/7] drm/panthor: Add suspend, resume and reset handling
Message-ID: <2vdubr5ieiuwmy7j6bogyzhpz27hsvaaeaktuqtuhm3nvgsnkv@jhy2f2pb3hyz>
References: <cover.1747148172.git.lukas.zapolskas@arm.com>
 <ae6144b6f6ccbd2c035956ce5085ae7fbb5ec96e.1747148172.git.lukas.zapolskas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ae6144b6f6ccbd2c035956ce5085ae7fbb5ec96e.1747148172.git.lukas.zapolskas@arm.com>
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

On 16.05.2025 16:49, Lukas Zapolskas wrote:
> The sampler must disable and re-enable counter sampling around suspends,
> and must re-program the FW interface after a reset to avoid losing
> data.
>
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |   7 +-
>  drivers/gpu/drm/panthor/panthor_perf.c   | 102 +++++++++++++++++++++++
>  drivers/gpu/drm/panthor/panthor_perf.h   |   6 ++
>  3 files changed, 114 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 7ac985d44655..92624a8717c5 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -139,6 +139,7 @@ static void panthor_device_reset_work(struct work_struct *work)
>  	if (!drm_dev_enter(&ptdev->base, &cookie))
>  		return;
>
> +	panthor_perf_pre_reset(ptdev);
>  	panthor_sched_pre_reset(ptdev);
>  	panthor_fw_pre_reset(ptdev, true);
>  	panthor_mmu_pre_reset(ptdev);
> @@ -148,6 +149,7 @@ static void panthor_device_reset_work(struct work_struct *work)
>  	ret = panthor_fw_post_reset(ptdev);
>  	atomic_set(&ptdev->reset.pending, 0);
>  	panthor_sched_post_reset(ptdev, ret != 0);
> +	panthor_perf_post_reset(ptdev);
>  	drm_dev_exit(cookie);
>
>  	if (ret) {
> @@ -496,8 +498,10 @@ int panthor_device_resume(struct device *dev)
>  			ret = panthor_device_resume_hw_components(ptdev);
>  		}
>
> -		if (!ret)
> +		if (!ret) {
>  			panthor_sched_resume(ptdev);
> +			panthor_perf_resume(ptdev);
> +		}
>
>  		drm_dev_exit(cookie);
>
> @@ -561,6 +565,7 @@ int panthor_device_suspend(struct device *dev)
>  		/* We prepare everything as if we were resetting the GPU.
>  		 * The end of the reset will happen in the resume path though.
>  		 */
> +		panthor_perf_suspend(ptdev);
>  		panthor_sched_suspend(ptdev);
>  		panthor_fw_suspend(ptdev);
>  		panthor_mmu_suspend(ptdev);
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/panthor/panthor_perf.c
> index 97603b168d2d..438319cf71ab 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.c
> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
> @@ -1845,6 +1845,76 @@ void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_per
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

In the two previous functions, you return an int, but you never used it
from where they're called. Also, in both of them, for the sake of
coherence, I'd get rid of the *sampler* subcalls because later in
'panthor_perf_pre_reset' and 'panthor_perf_post_reset' you manipulate the
sampler directly without referring it to another function. The functions
are short enough for us to be able to inline the content of
'panthor_perf_sampler_resume' into 'panthor_perf_resume'.

> +
>  /**
>   * panthor_perf_unplug - Terminate the performance counter subsystem.
>   * @ptdev: Panthor device.
> @@ -1878,3 +1948,35 @@ void panthor_perf_unplug(struct panthor_device *ptdev)
>
>  	ptdev->perf = NULL;
>  }
> +
> +void panthor_perf_pre_reset(struct panthor_device *ptdev)
> +{
> +	struct panthor_perf_sampler *sampler;
> +
> +	if (!ptdev || !ptdev->perf)
> +		return;
> +
> +	sampler = &ptdev->perf->sampler;
> +
> +	if (!atomic_read(&sampler->enabled_clients))
> +		return;
> +
> +	panthor_perf_fw_stop_sampling(sampler->ptdev);
> +}
> +
> +void panthor_perf_post_reset(struct panthor_device *ptdev)
> +{
> +	struct panthor_perf_sampler *sampler;
> +
> +	if (!ptdev || !ptdev->perf)
> +		return;

In both this function and the preceding one, ptdev is meant to be
available by the time they're called, so I'd turn the check of ptdev not
being null into a drm_WARN().

> +
> +	sampler = &ptdev->perf->sampler;
> +
> +	if (!atomic_read(&sampler->enabled_clients))
> +		return;
> +
> +	panthor_perf_fw_write_sampler_config(sampler);
> +
> +	panthor_perf_fw_start_sampling(sampler->ptdev);
> +}
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
> index c482198b6fbd..fc08a5440a35 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.h
> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
> @@ -13,6 +13,8 @@ struct panthor_file;
>  struct panthor_perf;
>
>  int panthor_perf_init(struct panthor_device *ptdev);
> +int panthor_perf_suspend(struct panthor_device *ptdev);
> +int panthor_perf_resume(struct panthor_device *ptdev);
>  void panthor_perf_unplug(struct panthor_device *ptdev);
>
>  int panthor_perf_session_setup(struct panthor_device *ptdev, struct panthor_perf *perf,
> @@ -30,5 +32,9 @@ void panthor_perf_session_destroy(struct panthor_file *pfile, struct panthor_per
>
>  void panthor_perf_report_irq(struct panthor_device *ptdev, u32 status);
>
> +void panthor_perf_pre_reset(struct panthor_device *ptdev);
> +
> +void panthor_perf_post_reset(struct panthor_device *ptdev);
> +
>  #endif /* __PANTHOR_PERF_H__ */
>
> --
> 2.33.0.dirty


Adrian Larumbe
