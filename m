Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19100CCB6D5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 11:38:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331D610E68D;
	Thu, 18 Dec 2025 10:38:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="pJZSJfJG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 468FA10E68D
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 10:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1766054284;
 bh=EG1veNED77gRjus+pKiSZS+ahBNurbXXh7e0NykvyOk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pJZSJfJGJ3nCG/x6/8PE/2hOAq1nP4SLnvUWIgEtJWimzh1T+9sexdJvmtkXKo5Ph
 FG92mpIkGh+XvouubZMHazH8nvmOtzBj52AavhCUjnaHBPNmJhR+22CNSWopq76FJe
 NhRc+fOAYHhzIjrOUS+sm50jHX/kkzA41mOvla0rt5OVMXw8/rdnvaKHAK16S+DeTO
 y9xEy3yQrML4GAfabkqAY0JtTNmA8BTkPmt9MhFBwfbbIh41wsEXImM3WtUiEjCHTe
 4+Yf13FQubcP0LhM86RqOpDO8eZDbVybzyRzZu14JaLrWtD3vZRyfOW3zP+sSzLB1n
 +7+Da3FEA5qjQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 5E56D17E0FC2;
 Thu, 18 Dec 2025 11:38:04 +0100 (CET)
Date: Thu, 18 Dec 2025 11:37:58 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Lukas Zapolskas <lukas.zapolskas@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, =?UTF-8?B?QWRyacOhbg==?= Larumbe
 <adrian.larumbe@collabora.com>, nd@arm.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Mihail
 Atanassov <mihail.atanassov@arm.com>
Subject: Re: [PATCH v6 3/7] drm/panthor: Add panthor perf initialization and
 termination
Message-ID: <20251218113758.570a81b0@fedora>
In-Reply-To: <20251215171453.2506348-4-lukas.zapolskas@arm.com>
References: <20251215171453.2506348-1-lukas.zapolskas@arm.com>
 <20251215171453.2506348-4-lukas.zapolskas@arm.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, 15 Dec 2025 17:14:49 +0000
Lukas Zapolskas <lukas.zapolskas@arm.com> wrote:

> Added the panthor_perf system initialization and unplug code to allow
> for the handling of userspace sessions to be added in follow-up
> patches.
>=20
> Signed-off-by: Lukas Zapolskas <lukas.zapolskas@arm.com>
> Reviewed-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panthor/panthor_device.c |  2 +
>  drivers/gpu/drm/panthor/panthor_device.h |  5 +-
>  drivers/gpu/drm/panthor/panthor_perf.c   | 63 +++++++++++++++++++++++-
>  drivers/gpu/drm/panthor/panthor_perf.h   |  1 +
>  4 files changed, 69 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm/p=
anthor/panthor_device.c
> index dc237da92340..3063ffbead45 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.c
> +++ b/drivers/gpu/drm/panthor/panthor_device.c
> @@ -120,6 +120,7 @@ void panthor_device_unplug(struct panthor_device *ptd=
ev)
>  	/* Now, try to cleanly shutdown the GPU before the device resources
>  	 * get reclaimed.
>  	 */
> +	panthor_perf_unplug(ptdev);
>  	panthor_sched_unplug(ptdev);
>  	panthor_fw_unplug(ptdev);
>  	panthor_mmu_unplug(ptdev);
> @@ -323,6 +324,7 @@ int panthor_device_init(struct panthor_device *ptdev)
> =20
>  err_disable_autosuspend:
>  	pm_runtime_dont_use_autosuspend(ptdev->base.dev);
> +	panthor_perf_unplug(ptdev);
> =20
>  err_unplug_sched:
>  	panthor_sched_unplug(ptdev);
> diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm/p=
anthor/panthor_device.h
> index 64b0048de6ac..e1a6250cecc8 100644
> --- a/drivers/gpu/drm/panthor/panthor_device.h
> +++ b/drivers/gpu/drm/panthor/panthor_device.h
> @@ -28,8 +28,8 @@ struct panthor_hw;
>  struct panthor_job;
>  struct panthor_mmu;
>  struct panthor_fw;
> -struct panthor_perfcnt;
>  struct panthor_pwr;
> +struct panthor_perf;
>  struct panthor_vm;
>  struct panthor_vm_pool;
> =20
> @@ -160,6 +160,9 @@ struct panthor_device {
>  	/** @devfreq: Device frequency scaling management data. */
>  	struct panthor_devfreq *devfreq;
> =20
> +	/** @perf: Performance counter management data. */
> +	struct panthor_perf *perf;
> +
>  	/** @unplug: Device unplug related fields. */
>  	struct {
>  		/** @lock: Lock used to serialize unplug operations. */
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.c b/drivers/gpu/drm/pan=
thor/panthor_perf.c
> index 842d62826ac3..3a65d6d326e8 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.c
> +++ b/drivers/gpu/drm/panthor/panthor_perf.c
> @@ -4,6 +4,7 @@
> =20
>  #include <linux/bitops.h>
>  #include <drm/panthor_drm.h>
> +#include <drm/drm_print.h>
> =20
>  #include "panthor_device.h"
>  #include "panthor_fw.h"
> @@ -22,6 +23,19 @@
>   */
>  #define PANTHOR_HW_COUNTER_SIZE (sizeof(u32))
> =20
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
> @@ -76,14 +90,61 @@ static void panthor_perf_info_init(struct panthor_dev=
ice *const ptdev)
>   * panthor_perf_init - Initialize the performance counter subsystem.
>   * @ptdev: Panthor device
>   *
> + * The performance counters require the FW interface to be available to =
setup the
> + * sampling ringbuffers, so this must be called only after FW is initial=
ized.
> + *
>   * Return: 0 on success, negative error code on failure.
>   */
>  int panthor_perf_init(struct panthor_device *ptdev)
>  {
> +	struct panthor_perf *perf __free(kfree) =3D NULL;
> +	int ret =3D 0;
> +
>  	if (!ptdev)
>  		return -EINVAL;
> =20
>  	panthor_perf_info_init(ptdev);
> =20
> -	return 0;
> +	perf =3D kzalloc(sizeof(*perf), GFP_KERNEL);
> +	if (ZERO_OR_NULL_PTR(perf))
> +		return -ENOMEM;
> +
> +	xa_init_flags(&perf->sessions, XA_FLAGS_ALLOC);
> +
> +	perf->session_range =3D (struct xa_limit) {
> +		.min =3D 0,
> +		.max =3D 1,
> +	};
> +
> +	drm_info(&ptdev->base, "Performance counter subsystem initialized");
> +
> +	ptdev->perf =3D no_free_ptr(perf);
> +
> +	return ret;

	return 0;

and you can drop the ret.

> +}
> +
> +/**
> + * panthor_perf_unplug - Terminate the performance counter subsystem.
> + * @ptdev: Panthor device.
> + *
> + * This function will terminate the performance counter control structur=
es and any remaining
> + * sessions, after waiting for any pending interrupts.
> + */
> +void panthor_perf_unplug(struct panthor_device *ptdev)
> +{
> +	struct panthor_perf *perf =3D ptdev->perf;
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
> +	ptdev->perf =3D NULL;
>  }
> diff --git a/drivers/gpu/drm/panthor/panthor_perf.h b/drivers/gpu/drm/pan=
thor/panthor_perf.h
> index 3c32c24c164c..e4805727b9e7 100644
> --- a/drivers/gpu/drm/panthor/panthor_perf.h
> +++ b/drivers/gpu/drm/panthor/panthor_perf.h
> @@ -10,6 +10,7 @@
>  struct panthor_device;
> =20
>  int panthor_perf_init(struct panthor_device *ptdev);
> +void panthor_perf_unplug(struct panthor_device *ptdev);
> =20
>  #endif /* __PANTHOR_PERF_H__ */
> =20

