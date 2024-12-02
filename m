Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A80709DFD06
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 10:24:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F274B10E682;
	Mon,  2 Dec 2024 09:24:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="Ca0TKXjv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FCFB10E682
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Dec 2024 09:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1733131457;
 bh=2Jf130aYMyJrflZG2xaDlcBM6X5YKkKlyTb6KX2Ga2M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ca0TKXjv/Vj61OBvUWW4ISw467f/LEIi5PBMqLWTEmlDmoC+6lYvv7m04xBqgS6lL
 S2ORti5fAIwkhkCM39DdgYqpBX8TkMj8YahAILSaBnK9HKolx2cFMEXFReTlEfPH4A
 LSu4bYhg9JFAo9zLMj4B4FwvI/D3K1TzAWzSgge25NM6CIThByb06JnwLXVSLF1GKO
 xHrmpU2bGWnI51yGRouYn6zaR+FX8tKQe2uHCGJiFZkv//Xpqj5aCyKgVW+uG6VPp1
 ri8uo5UV9CzR1UM2kqtR1DaQCmoDxsU9dxwv7TUw4nkkh4DU75CBIzJKa+ndP4FVE+
 sFKeaPaz6K1uQ==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 6FA0E17E14EF;
 Mon,  2 Dec 2024 10:24:17 +0100 (CET)
Date: Mon, 2 Dec 2024 10:24:11 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Philipp Zabel
 <p.zabel@pengutronix.de>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/8] drm/panfrost: Handle job HW submit errors
Message-ID: <20241202102411.4e85b851@collabora.com>
In-Reply-To: <20241202102151.41cc3d4f@collabora.com>
References: <20241128211223.1805830-1-adrian.larumbe@collabora.com>
 <20241128211223.1805830-4-adrian.larumbe@collabora.com>
 <20241202102151.41cc3d4f@collabora.com>
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

On Mon, 2 Dec 2024 10:21:51 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Thu, 28 Nov 2024 21:06:18 +0000
> Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:
>=20
> > Avoid waiting for the DRM scheduler job timedout handler, and instead, =
let
> > the DRM scheduler core signal the error fence immediately when HW job
> > submission fails.
> >=20
> > That means we must also decrement the runtime-PM refcnt for the device,
> > because the job will never be enqueued or inflight.
> >=20
> > Signed-off-by: Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com>
> > ---
> >  drivers/gpu/drm/panfrost/panfrost_job.c | 20 ++++++++++++++++----
> >  1 file changed, 16 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c b/drivers/gpu/drm/=
panfrost/panfrost_job.c
> > index f640d211cc3a..3f4f0682d69d 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -195,7 +195,7 @@ panfrost_enqueue_job(struct panfrost_device *pfdev,=
 int slot,
> >  	return 1;
> >  }
> > =20
> > -static void panfrost_job_hw_submit(struct panfrost_job *job, int js)
> > +static int panfrost_job_hw_submit(struct panfrost_job *job, int js)
> >  {
> >  	struct panfrost_device *pfdev =3D job->pfdev;
> >  	unsigned int subslot;
> > @@ -207,10 +207,11 @@ static void panfrost_job_hw_submit(struct panfros=
t_job *job, int js)
> > =20
> >  	ret =3D pm_runtime_get_sync(pfdev->base.dev);
> >  	if (ret < 0)
> > -		return;
> > +		goto err_hwsubmit;
> > =20
> >  	if (WARN_ON(job_read(pfdev, JS_COMMAND_NEXT(js)))) {
> > -		return;
> > +		ret =3D -EINVAL;
> > +		goto err_hwsubmit;
> >  	}
> > =20
> >  	cfg =3D panfrost_mmu_as_get(pfdev, job->mmu);
> > @@ -261,6 +262,12 @@ static void panfrost_job_hw_submit(struct panfrost=
_job *job, int js)
> >  			job, js, subslot, jc_head, cfg & 0xf);
> >  	}
> >  	spin_unlock(&pfdev->js->job_lock);
> > +
> > +	return 0;
> > +
> > +err_hwsubmit:
> > +	pm_runtime_put_autosuspend(pfdev->base.dev);
> > +	return ret;
> >  }
> > =20
> >  static int panfrost_acquire_object_fences(struct drm_gem_object **bos,
> > @@ -382,6 +389,7 @@ static struct dma_fence *panfrost_job_run(struct dr=
m_sched_job *sched_job)
> >  	struct panfrost_device *pfdev =3D job->pfdev;
> >  	int slot =3D panfrost_job_get_slot(job);
> >  	struct dma_fence *fence =3D NULL;
> > +	int ret;
> > =20
> >  	if (unlikely(job->base.s_fence->finished.error))
> >  		return NULL;
> > @@ -400,7 +408,11 @@ static struct dma_fence *panfrost_job_run(struct d=
rm_sched_job *sched_job)
> >  		dma_fence_put(job->done_fence);
> >  	job->done_fence =3D dma_fence_get(fence);
> > =20
> > -	panfrost_job_hw_submit(job, slot);
> > +	ret =3D panfrost_job_hw_submit(job, slot);
> > +	if (ret) {
> > +		dma_fence_put(job->done_fence); =20
>=20
> If you call dma_fence_put() here, you need to set job->done_fence to
> NULL, otherwise dma_fence_put() will be called again on an already
> freed fence in panfrost_job_cleanup(). Question is, do we really need
> to call dma_fence_put(job->done_fence) here? Can't we let the job
> destructor take care of that?

My bad, it's the ref you've taken to return to drm_sched you're
releasing here. I'd go for `dma_fence_put(fence)` to make that clear.

With this minor change, the patch is

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

>=20
> > +		return ERR_PTR(ret);
> > +	}
> > =20
> >  	return fence;
> >  } =20
>=20

