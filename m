Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C51B2090D
	for <lists+dri-devel@lfdr.de>; Mon, 11 Aug 2025 14:42:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8997610E469;
	Mon, 11 Aug 2025 12:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="QqFifrMh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B29D10E460
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Aug 2025 12:42:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1754916167; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OrxeoxHqn7SbJYoeowFkaXUqiOvowmRdNvDsl6n5Qm5cXa6SWoif00qhR+t/ziPiDUerQAHMUSABpol1cN+IJvmFddHQyE0bTxn/Fkdi50qrTSvotZ4mOetgtTl5Qdlwb4pbGyYjHWYznfaF6/1yGT9knG9plHG7qpa2ApR3Qrs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1754916167;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=F3kVqB/vWxEWDbBQ8Q6U07Ve3BBXfdiR4PHBdfR+t98=; 
 b=Xc8pkdatySKG3E+jygVjyZM2XadU2ZD8moBcmiXMcOLNP7rX8GlJrL1CAlvRFaSLbz0O1y4iBHW/l2DInCWIJO2f0aaUA5w7IUj4xbvxYYa7Cs7cO72WED1jll8NZD/IFn0sfBHx07JlBDP2wYe1CXjbGNlPgz4ywlXQdiqc6DY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1754916167; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
 bh=F3kVqB/vWxEWDbBQ8Q6U07Ve3BBXfdiR4PHBdfR+t98=;
 b=QqFifrMhRLMMwbCcyYq1PKus6mj+EDjLl3M1rJrV2PQ6y+7TQXYoaz/igjk7WzAZ
 lrzaD8Q8hlwJX0CBet3lkQuOJC/LpQkZJqXJKYW4H7C8uc9pwM+p286ExBPccBz6Eo0
 u4W6r+GfePPzrjWS8uiY3c2EvMgvpO8HpbgiPiyk=
Received: by mx.zohomail.com with SMTPS id 1754916165966977.3418279049838;
 Mon, 11 Aug 2025 05:42:45 -0700 (PDT)
Date: Mon, 11 Aug 2025 13:42:41 +0100
From: =?utf-8?Q?Adri=C3=A1n?= Larumbe <adrian.larumbe@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: dri-devel@lists.freedesktop.org, nd@arm.com, 
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/7] drm/panthor: Add panthor perf initialization and
 termination
Message-ID: <qrchlyyic3bezb77ai7gfe7yvthlhiftpkcyd5b2eswmcdxivm@ssvlq5hgh437>
References: <cover.1753449448.git.lukas.zapolskas@arm.com>
 <7674845a8c23b379c67b5aa279a29b3963489d26.1753449448.git.lukas.zapolskas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7674845a8c23b379c67b5aa279a29b3963489d26.1753449448.git.lukas.zapolskas@arm.com>
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

On 25.07.2025 15:57, Lukas Zapolskas wrote:
> Added the panthor_perf system initialization and unplug code to allow
> for the handling of userspace sessions to be added in follow-up
> patches.
>
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>

Reviewed-by: Adrián Larumbe <adrian.larumbe@collabora.com>

> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  2 +
>  drivers/gpu/drm/panthor/panthor_device.h |  5 +-
>  drivers/gpu/drm/panthor/panthor_perf.c   | 62 +++++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_perf.h   |  1 +
>  4 files changed, 68 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/panthor/panthor_device.c
> index 15ab329722cc..ab3e65cc17bd 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -98,6 +98,7 @@ void panthor_device_unplug(struct panthor_device *ptdev)
>  	/* Now, try to cleanly shutdown the GPU before the device resources
>  	 * get reclaimed.
>  	 */
> +	panthor_perf_unplug(ptdev);
>  	panthor_sched_unplug(ptdev);
>  	panthor_fw_unplug(ptdev);
>  	panthor_mmu_unplug(ptdev);
> @@ -282,6 +283,7 @@ int panthor_device_init(struct panthor_device *ptdev)
>
>  err_disable_autosuspend:
>  	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
> +	panthor_perf_unplug(ptdev);
>
>  err_unplug_sched:
>  	panthor_sched_unplug(ptdev);
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/panthor/panthor_device.h
> index 720d39b9e783..a31dbc1919c8 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -27,7 +27,7 @@ struct panthor_heap_pool;
>  struct panthor_job;
>  struct panthor_mmu;
>  struct panthor_fw;
> -struct panthor_perfcnt;
> +struct panthor_perf;
>  struct panthor_vm;
>  struct panthor_vm_pool;
>
> @@ -138,6 +138,9 @@ struct panthor_device {
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
> index e58a62ad7988..af1c58e70a78 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.c
> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
> @@ -10,6 +10,19 @@
>  #include "panthor_perf.h"
>  #include "panthor_regs.h"
>
> +struct panthor_perf {
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
>  struct panthor_perf_counter_block {
>  	struct drm_panthor_perf_block_header header;
>  	u64 counters[];
> @@ -64,14 +77,61 @@ static void panthor_perf_info_init(struct panthor_device *const ptdev)
>   * panthor_perf_init - Initialize the performance counter subsystem.
>   * @ptdev: Panthor device
>   *
> + * The performance counters require the FW interface to be available to setup the
> + * sampling ringbuffers, so this must be called only after FW is initialized.
> + *
>   * Return: 0 on success, negative error code on failure.
>   */
>  int panthor_perf_init(struct panthor_device *ptdev)
>  {
> +	struct panthor_perf *perf __free(kfree) = NULL;
> +	int ret = 0;
> +
>  	if (!ptdev)
>  		return -EINVAL;
>
>  	panthor_perf_info_init(ptdev);
>
> -	return 0;
> +	perf = kzalloc(sizeof(*perf), GFP_KERNEL);
> +	if (ZERO_OR_NULL_PTR(perf))
> +		return -ENOMEM;
> +
> +	xa_init_flags(&perf->sessions, XA_FLAGS_ALLOC);
> +
> +	perf->session_range = (struct xa_limit) {
> +		.min = 0,
> +		.max = 1,
> +	};
> +
> +	drm_info(&ptdev->base, "Performance counter subsystem initialized");
> +
> +	ptdev->perf = no_free_ptr(perf);
> +
> +	return ret;
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
> +	if (!xa_empty(&perf->sessions)) {
> +		drm_err(&ptdev->base,
> +			"Performance counter sessions active when unplugging the driver!");
> +	}
> +
> +	xa_destroy(&perf->sessions);
> +
> +	kfree(ptdev->perf);
> +
> +	ptdev->perf = NULL;
>  }
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/panthor/panthor_perf.h
> index 3c32c24c164c..e4805727b9e7 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.h
> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
> @@ -10,6 +10,7 @@
>  struct panthor_device;
>
>  int panthor_perf_init(struct panthor_device *ptdev);
> +void panthor_perf_unplug(struct panthor_device *ptdev);
>
>  #endif /* __PANTHOR_PERF_H__ */
>
> --
> 2.33.0.dirty


Adrian Larumbe
