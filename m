Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B7F9E001C
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 12:20:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 266B110E6D5;
	Mon,  2 Dec 2024 11:20:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="J0M8d3xs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB8210E6D5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 11:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733138447;
 bh=aMunDSBgHOeFdDKndUKhfvFLB5bS06GMKp4LeJe/ynQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=J0M8d3xsPe1J9ZMW5xLmJYUTGN2fC1r1Nxdyt2kBoTieFmNUshrjbip26SfzXgGfe
 6YDioOXtg/GgH/Ek1K/fTDM+zwbNo6Bwt8CLSutAQVUkTbo+9+q6u/HaaQ/faqSMGf
 czoVpJHCWQt64LzkvWwRo6tgSXz9fBxGmk9CF73iPwy5pfPOOuxIEoiMr8nSndCpBz
 ZSYgwaZPlQN6/4jBr+IDd3wGrk4GXpxJwvnwS3wPBwspGES6grupP7Smy7V3jrVKKA
 t77CrUPu0kNrmVsNOYpfXq+VGQ5Fql/vx9hHDE/vyZ7BGx4sktMXnV4f1AS9LUJ+dB
 dy739k/6dnXdQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A4D4817E3624;
 Mon,  2 Dec 2024 12:20:46 +0100 (CET)
Date: Mon, 2 Dec 2024 12:20:39 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Philipp Zabel
 <p.zabel@pengutronix.de>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/8] drm/panfrost: Make re-enabling job interrupts at
 device reset optional
Message-ID: <20241202122039.273f0e9f@collabora.com>
In-Reply-To: <20241128211223.1805830-7-adrian.larumbe@collabora.com>
References: <20241128211223.1805830-1-adrian.larumbe@collabora.com>
 <20241128211223.1805830-7-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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

On Thu, 28 Nov 2024 21:06:21 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Rather than remasking interrupts after a device reset in the main reset
> path, allow selecting whether to do this with an additional bool paramete=
r.
>=20
> To this end, split reenabling job interrupts into two functions, one that
> clears the interrupts and another one which unmasks them conditionally.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> ---
>  drivers/gpu/drm/panfrost/panfrost_device.c | 11 +++++--
>  drivers/gpu/drm/panfrost/panfrost_device.h |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 34 ++++++++++++----------
>  drivers/gpu/drm/panfrost/panfrost_job.h    |  3 +-
>  4 files changed, 29 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm=
/panfrost/panfrost_device.c
> index 4fe29286bbe3..7e5d39699982 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
> @@ -395,20 +395,25 @@ bool panfrost_exception_needs_reset(const struct pa=
nfrost_device *pfdev,
>  	return false;
>  }
> =20
> -void panfrost_device_reset(struct panfrost_device *pfdev)
> +void panfrost_device_reset(struct panfrost_device *pfdev, bool enable_jo=
b_int)
>  {
> +	u32 irq_mask;
> +
>  	panfrost_gpu_soft_reset(pfdev);
> =20
>  	panfrost_gpu_power_on(pfdev);
>  	panfrost_mmu_reset(pfdev);
> -	panfrost_job_enable_interrupts(pfdev);
> +
> +	irq_mask =3D panfrost_job_reset_interrupts(pfdev);
> +	if (enable_job_int)
> +		panfrost_enable_interrupts(pfdev, irq_mask);
>  }
> =20
>  static int panfrost_device_runtime_resume(struct device *dev)
>  {
>  	struct panfrost_device *pfdev =3D dev_get_drvdata(dev);
> =20
> -	panfrost_device_reset(pfdev);
> +	panfrost_device_reset(pfdev, true);
>  	panfrost_devfreq_resume(pfdev);
> =20
>  	return 0;
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm=
/panfrost/panfrost_device.h
> index d9aea2c2cbe5..fc83d5e104a3 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -205,7 +205,7 @@ int panfrost_unstable_ioctl_check(void);
> =20
>  int panfrost_device_init(struct panfrost_device *pfdev);
>  void panfrost_device_fini(struct panfrost_device *pfdev);
> -void panfrost_device_reset(struct panfrost_device *pfdev);
> +void panfrost_device_reset(struct panfrost_device *pfdev, bool enable_jo=
b_int);
> =20
>  extern const struct dev_pm_ops panfrost_pm_ops;
> =20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/pa=
nfrost/panfrost_job.c
> index fba1a376f593..79d2ee3625b2 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -27,6 +27,10 @@
>  #define job_write(dev, reg, data) writel(data, dev->iomem + (reg))
>  #define job_read(dev, reg) readl(dev->iomem + (reg))
> =20
> +#define JOB_INT_ENABLE_MASK			\
> +	(GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |	\
> +	 GENMASK(NUM_JOB_SLOTS - 1, 0))
> +
>  struct panfrost_queue_state {
>  	struct drm_gpu_scheduler sched;
>  	u64 fence_context;
> @@ -421,18 +425,23 @@ static struct dma_fence *panfrost_job_run(struct dr=
m_sched_job *sched_job)
>  	return fence;
>  }
> =20
> -void panfrost_job_enable_interrupts(struct panfrost_device *pfdev)
> +u32 panfrost_job_reset_interrupts(struct panfrost_device *pfdev)
>  {
>  	int j;
>  	u32 irq_mask =3D 0;
> =20
> -	clear_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended);
> -
>  	for (j =3D 0; j < NUM_JOB_SLOTS; j++) {
>  		irq_mask |=3D MK_JS_MASK(j);
>  	}
> =20
>  	job_write(pfdev, JOB_INT_CLEAR, irq_mask);
> +
> +	return irq_mask;
> +}

Let's define an ALL_JS_INT_MASK so we can get rid of the for loop and
can avoid returning a value that's constant.

> +
> +void panfrost_enable_interrupts(struct panfrost_device *pfdev, u32 irq_m=
ask)

Let's drop the irq_mask mask (use ALL_JS_INT_MASK), and call the
function panfrost_job_enable_interrupts() instead.

> +{
> +	clear_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended);
>  	job_write(pfdev, JOB_INT_MASK, irq_mask);
>  }
> =20
> @@ -725,12 +734,7 @@ panfrost_reset(struct panfrost_device *pfdev,
>  	spin_unlock(&pfdev->js->job_lock);
> =20
>  	/* Proceed with reset now. */
> -	panfrost_device_reset(pfdev);
> -
> -	/* panfrost_device_reset() unmasks job interrupts, but we want to
> -	 * keep them masked a bit longer.
> -	 */
> -	job_write(pfdev, JOB_INT_MASK, 0);
> +	panfrost_device_reset(pfdev, false);
> =20
>  	/* GPU has been reset, we can clear the reset pending bit. */
>  	atomic_set(&pfdev->reset.pending, 0);
> @@ -752,9 +756,7 @@ panfrost_reset(struct panfrost_device *pfdev,
>  		drm_sched_start(&pfdev->js->queue[i].sched, 0);
> =20
>  	/* Re-enable job interrupts now that everything has been restarted. */
> -	job_write(pfdev, JOB_INT_MASK,
> -		  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
> -		  GENMASK(NUM_JOB_SLOTS - 1, 0));
> +	panfrost_enable_interrupts(pfdev, JOB_INT_ENABLE_MASK);
> =20
>  	dma_fence_end_signalling(cookie);
>  }
> @@ -827,9 +829,7 @@ static irqreturn_t panfrost_job_irq_handler_thread(in=
t irq, void *data)
> =20
>  	/* Enable interrupts only if we're not about to get suspended */
>  	if (!test_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended))
> -		job_write(pfdev, JOB_INT_MASK,
> -			  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
> -			  GENMASK(NUM_JOB_SLOTS - 1, 0));
> +		job_write(pfdev, JOB_INT_MASK, JOB_INT_ENABLE_MASK);
> =20
>  	return IRQ_HANDLED;
>  }
> @@ -854,6 +854,7 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  {
>  	struct panfrost_job_slot *js;
>  	unsigned int nentries =3D 2;
> +	u32 irq_mask;
>  	int ret, j;
> =20
>  	/* All GPUs have two entries per queue, but without jobchain
> @@ -905,7 +906,8 @@ int panfrost_job_init(struct panfrost_device *pfdev)
>  		}
>  	}
> =20
> -	panfrost_job_enable_interrupts(pfdev);
> +	irq_mask =3D panfrost_job_reset_interrupts(pfdev);
> +	panfrost_enable_interrupts(pfdev, irq_mask);
> =20
>  	return 0;
> =20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.h b/drivers/gpu/drm/pa=
nfrost/panfrost_job.h
> index ec581b97852b..c09d42ee5039 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.h
> @@ -46,7 +46,8 @@ void panfrost_job_close(struct panfrost_file_priv *panf=
rost_priv);
>  int panfrost_job_get_slot(struct panfrost_job *job);
>  int panfrost_job_push(struct panfrost_job *job);
>  void panfrost_job_put(struct panfrost_job *job);
> -void panfrost_job_enable_interrupts(struct panfrost_device *pfdev);
> +u32 panfrost_job_reset_interrupts(struct panfrost_device *pfdev);
> +void panfrost_enable_interrupts(struct panfrost_device *pfdev, u32 irq_m=
ask);
>  void panfrost_job_suspend_irq(struct panfrost_device *pfdev);
>  int panfrost_job_is_idle(struct panfrost_device *pfdev);
> =20

