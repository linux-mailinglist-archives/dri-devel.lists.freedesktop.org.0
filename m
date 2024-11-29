Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 219EE9DE8CF
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2024 15:45:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDE9B10E4C5;
	Fri, 29 Nov 2024 14:44:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="cd5/5QiI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8551D10E4C5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Nov 2024 14:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732891497;
 bh=PSe2XVdJ4rObWH+5+BFAoRofkplu30l8Ett0sv/RHrA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=cd5/5QiI91LaKaX1Z+0dAQQII65FE91GKw6BZ5IRVXY7RJk9S3gXUPOJC7aXpHR9c
 EBGecBhJ5trw0EUfZsT1IXcTCJa1asTmdDC5vqjGnHD+8ALBR2eVlfEmYfOeSWx4Yh
 wQO+DpGWnhbuUZ13sxO6ntn77OJiKDXjdZJhJps3TVkmfaFfULL28XVFSU9JiSKdlK
 cAriAz6f8rY1BGimOUTR3+6FEPN9kM8vCJszkihbfcpK5GizM/fRkBpgQt9hca/dof
 8JwgbWfMlctBMPoBur/fKWhw1dR6NvlqA/manlyRZG3GfWlcFBPxYE5Nm2LYQmyC99
 2/aorOK4mCDng==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 9983E17E374C;
 Fri, 29 Nov 2024 15:44:57 +0100 (CET)
Date: Fri, 29 Nov 2024 15:44:48 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 dri-devel@lists.freedesktop.org, kernel@collabora.com
Subject: Re: [PATCH v2 4/5] drm/panthor: Be robust against resume failures
Message-ID: <20241129154448.21fcf641@collabora.com>
In-Reply-To: <yrcvsbykbiwcmar73zk2ffgfhqzgjppnsp2y4w3kascb3wvo76@dtaciivtaanx>
References: <20241128110255.3182366-1-boris.brezillon@collabora.com>
 <20241128110255.3182366-5-boris.brezillon@collabora.com>
 <yrcvsbykbiwcmar73zk2ffgfhqzgjppnsp2y4w3kascb3wvo76@dtaciivtaanx>
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

On Fri, 29 Nov 2024 13:59:13 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> Reviewed-by: Adrian Larumbe <adrian.larumbe@collabora.com>
>=20
> On 28.11.2024 12:02, Boris Brezillon wrote:
> > When the runtime PM resume callback returns an error, it puts the device
> > in a state where it can't be resumed anymore. Make sure we can recover
> > from such transient failures by calling pm_runtime_set_suspended()
> > explicitly after a pm_runtime_resume_and_get() failure.
> >=20
> > v2:
> > - Add a comment explaining potential races in
> >   panthor_device_resume_and_get()
> >=20
> > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > ---
> >  drivers/gpu/drm/panthor/panthor_device.c |  1 +
> >  drivers/gpu/drm/panthor/panthor_device.h | 26 ++++++++++++++++++++++++
> >  drivers/gpu/drm/panthor/panthor_drv.c    |  2 +-
> >  drivers/gpu/drm/panthor/panthor_sched.c  |  4 ++--
> >  4 files changed, 30 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.c b/drivers/gpu/drm=
/panthor/panthor_device.c
> > index e3b22107b268..0362101ea896 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.c
> > +++ b/drivers/gpu/drm/panthor/panthor_device.c
> > @@ -500,6 +500,7 @@ int panthor_device_resume(struct device *dev)
> > =20
> >  err_set_suspended:
> >  	atomic_set(&ptdev->pm.state, PANTHOR_DEVICE_PM_STATE_SUSPENDED);
> > +	atomic_set(&ptdev->pm.recovery_needed, 1); =20
>=20
> I think it might be the case that if PM resume fails, then ptdev->base.de=
v->power.runtime_error
> would be set to '1' and then you might use this state variable in panthor=
_device_resume_and_get()
> rather than encoding it explicity into the panthor driver struct?

So, there are two reasons for not using
ptdev->base.dev->power.runtime_error directly here:

1. I hate accessing subsystem's internal objects directly, and if
there's no helper to check if a runtime error is pending, I suspect
there's a good reason.

2. We need an atomic variable to ensure only one thread clears the
runtime_error (see the comment in panthor_device_resume_and_get()).

>=20
> >  	return ret;
> >  }
> > =20
> > diff --git a/drivers/gpu/drm/panthor/panthor_device.h b/drivers/gpu/drm=
/panthor/panthor_device.h
> > index 0e68f5a70d20..b6c4f25a5d6e 100644
> > --- a/drivers/gpu/drm/panthor/panthor_device.h
> > +++ b/drivers/gpu/drm/panthor/panthor_device.h
> > @@ -9,6 +9,7 @@
> >  #include <linux/atomic.h>
> >  #include <linux/io-pgtable.h>
> >  #include <linux/regulator/consumer.h>
> > +#include <linux/pm_runtime.h>
> >  #include <linux/sched.h>
> >  #include <linux/spinlock.h>
> > =20
> > @@ -180,6 +181,9 @@ struct panthor_device {
> >  		 * is suspended.
> >  		 */
> >  		struct page *dummy_latest_flush;
> > +
> > +		/** @recovery_needed: True when a resume attempt failed. */
> > +		atomic_t recovery_needed;
> >  	} pm;
> > =20
> >  	/** @profile_mask: User-set profiling flags for job accounting. */
> > @@ -243,6 +247,28 @@ int panthor_device_mmap_io(struct panthor_device *=
ptdev,
> >  int panthor_device_resume(struct device *dev);
> >  int panthor_device_suspend(struct device *dev);
> > =20
> > +static inline int panthor_device_resume_and_get(struct panthor_device =
*ptdev)
> > +{
> > +	int ret =3D pm_runtime_resume_and_get(ptdev->base.dev);
> > +
> > +	/* If the resume failed, we need to clear the runtime_error, which
> > +	 * can done by forcing the RPM state to suspended. If multiple
> > +	 * threads called panthor_device_resume_and_get(), we only want
> > +	 * one of them to update the state, hence the cmpxchg. Note that a
> > +	 * thread might enter panthor_device_resume_and_get() and call
> > +	 * pm_runtime_resume_and_get() after another thread had attempted
> > +	 * to resume and failed. This means we will end up with an error
> > +	 * without even attempting a resume ourselves. The only risk here
> > +	 * is to report an error when the second resume attempt might have
> > +	 * succeeded. Given resume errors are not expected, this is probably
> > +	 * something we can live with.
> > +	 */
> > +	if (ret && atomic_cmpxchg(&ptdev->pm.recovery_needed, 1, 0) =3D=3D 1)
> > +		pm_runtime_set_suspended(ptdev->base.dev);
> > +
> > +	return ret;
> > +}
> > +
> >  enum drm_panthor_exception_type {
> >  	DRM_PANTHOR_EXCEPTION_OK =3D 0x00,
> >  	DRM_PANTHOR_EXCEPTION_TERMINATED =3D 0x04,
> > diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/pa=
nthor/panthor_drv.c
> > index 1498c97b4b85..b7a9adc918e3 100644
> > --- a/drivers/gpu/drm/panthor/panthor_drv.c
> > +++ b/drivers/gpu/drm/panthor/panthor_drv.c
> > @@ -763,7 +763,7 @@ static int panthor_query_timestamp_info(struct pant=
hor_device *ptdev,
> >  {
> >  	int ret;
> > =20
> > -	ret =3D pm_runtime_resume_and_get(ptdev->base.dev);
> > +	ret =3D panthor_device_resume_and_get(ptdev);
> >  	if (ret)
> >  		return ret;
> > =20
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/drm/=
panthor/panthor_sched.c
> > index 97ed5fe5a191..77b184c3fb0c 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -2364,7 +2364,7 @@ static void tick_work(struct work_struct *work)
> >  	if (!drm_dev_enter(&ptdev->base, &cookie))
> >  		return;
> > =20
> > -	ret =3D pm_runtime_resume_and_get(ptdev->base.dev);
> > +	ret =3D panthor_device_resume_and_get(ptdev);
> >  	if (drm_WARN_ON(&ptdev->base, ret))
> >  		goto out_dev_exit;
> > =20
> > @@ -3131,7 +3131,7 @@ queue_run_job(struct drm_sched_job *sched_job)
> >  		return dma_fence_get(job->done_fence);
> >  	}
> > =20
> > -	ret =3D pm_runtime_resume_and_get(ptdev->base.dev);
> > +	ret =3D panthor_device_resume_and_get(ptdev);
> >  	if (drm_WARN_ON(&ptdev->base, ret))
> >  		return ERR_PTR(ret);
> > =20
> > --=20
> > 2.46.2 =20

