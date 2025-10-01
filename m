Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4F4BB013B
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 13:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFF810E309;
	Wed,  1 Oct 2025 11:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="BVcY/f+X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0661010E309
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Oct 2025 11:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1759316421;
 bh=SW3XEJJoCSwUDOgZwA8JUPnvb5XNbAOw9b1x8zcyrL8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=BVcY/f+X469vGIJQQSyZP0xFq3AxplPhuYCUUZk/GmTbeVX/t11C0onkeH5KYHsOH
 9XpyoB4TnsArqN705kTdmdbrpsUbYUmRf5nzLtN+PL9xaWKncLDXcyzbBFeOBGzgnl
 DpK7G/sHviOKR4DR5oIfs8plIAS/Bdl2L5Y634//vZIRvVrPLL9t3GVs+yVAOFIXYu
 kGbWdAny8t3/h8H4c/pZS1hweAHJBs16dfe5dI7/sHT13tBltNMHPmj2rT6CVAi3eZ
 RVHdLojjuSOXO2aG7I9hXBod0BAndT0mWFa1+8l72u37238Ynxo6/nAFgZhJbX1MOa
 LX9jJKCXOXZmQ==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 23AB117E02B0;
 Wed,  1 Oct 2025 13:00:21 +0200 (CEST)
Date: Wed, 1 Oct 2025 13:00:17 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Steven
 Price <steven.price@arm.com>, kernel@collabora.com, Rob Herring
 <robh@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>
Subject: Re: [PATCH v4 06/10] drm/panfrost: Don't rework job IRQ enable mask
 in the enable path
Message-ID: <20251001130017.5eefe8ce@fedora>
In-Reply-To: <20251001022039.1215976-7-adrian.larumbe@collabora.com>
References: <20251001022039.1215976-1-adrian.larumbe@collabora.com>
 <20251001022039.1215976-7-adrian.larumbe@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
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

On Wed,  1 Oct 2025 03:20:27 +0100
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Up until now, panfrost_job_enable_interrupts() would always recalculate t=
he
> same job IRQ enablement mask, which is effectively a constant.
>=20
> Replace it with a compile-time constant value, and also in another couple
> places where an equivalent expression was being used.
>=20
> Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.h |  4 ++++
>  drivers/gpu/drm/panfrost/panfrost_job.c    | 19 ++++---------------
>  2 files changed, 8 insertions(+), 15 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm=
/panfrost/panfrost_device.h
> index 474b232bb38e..ac7147ed806b 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -26,6 +26,10 @@ struct panfrost_perfcnt;
> =20
>  #define MAX_PM_DOMAINS 5
> =20
> +#define ALL_JS_INT_MASK					\
> +	(GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |		\
> +	 GENMASK(NUM_JOB_SLOTS - 1, 0))
> +
>  enum panfrost_drv_comp_bits {
>  	PANFROST_COMP_BIT_GPU,
>  	PANFROST_COMP_BIT_JOB,
> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/pa=
nfrost/panfrost_job.c
> index ba934437a8ea..54764ce91dea 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> @@ -428,17 +428,10 @@ static struct dma_fence *panfrost_job_run(struct dr=
m_sched_job *sched_job)
> =20
>  void panfrost_job_enable_interrupts(struct panfrost_device *pfdev)
>  {
> -	int j;
> -	u32 irq_mask =3D 0;
> -
>  	clear_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended);
> =20
> -	for (j =3D 0; j < NUM_JOB_SLOTS; j++) {
> -		irq_mask |=3D MK_JS_MASK(j);
> -	}
> -
> -	job_write(pfdev, JOB_INT_CLEAR, irq_mask);
> -	job_write(pfdev, JOB_INT_MASK, irq_mask);
> +	job_write(pfdev, JOB_INT_CLEAR, ALL_JS_INT_MASK);
> +	job_write(pfdev, JOB_INT_MASK, ALL_JS_INT_MASK);
>  }
> =20
>  void panfrost_job_suspend_irq(struct panfrost_device *pfdev)
> @@ -757,9 +750,7 @@ panfrost_reset(struct panfrost_device *pfdev,
>  		drm_sched_start(&pfdev->js->queue[i].sched, 0);
> =20
>  	/* Re-enable job interrupts now that everything has been restarted. */
> -	job_write(pfdev, JOB_INT_MASK,
> -		  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
> -		  GENMASK(NUM_JOB_SLOTS - 1, 0));
> +	job_write(pfdev, JOB_INT_MASK, ALL_JS_INT_MASK);
> =20
>  	dma_fence_end_signalling(cookie);
>  }
> @@ -832,9 +823,7 @@ static irqreturn_t panfrost_job_irq_handler_thread(in=
t irq, void *data)
> =20
>  	/* Enable interrupts only if we're not about to get suspended */
>  	if (!test_bit(PANFROST_COMP_BIT_JOB, pfdev->is_suspended))
> -		job_write(pfdev, JOB_INT_MASK,
> -			  GENMASK(16 + NUM_JOB_SLOTS - 1, 16) |
> -			  GENMASK(NUM_JOB_SLOTS - 1, 0));
> +		job_write(pfdev, JOB_INT_MASK, ALL_JS_INT_MASK);
> =20
>  	return IRQ_HANDLED;
>  }

