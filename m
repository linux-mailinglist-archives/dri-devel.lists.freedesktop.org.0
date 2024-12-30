Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 766F19FE54E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 11:25:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 237A510E121;
	Mon, 30 Dec 2024 10:25:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MHD0udbi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6035510E121
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 10:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735554345;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aUt1KdIhZ50jJ+Qr+qPQPj1I5hnNINDZJ+K4hip3pjM=;
 b=MHD0udbiq2IIcTJor1VuV8B5WMBeV4XeSx+IpgUYdzH3lxtCO5d+L41aU3FbfGX00O/Chr
 N18PkDatoGj+/sJrQ1Ik3OtoHP1ULAFlFwm0opM3RZAtfQQOyMDBG+GJvr2uJHk+9hyOVP
 LUG5RaLlHHv5En/4Z7A2J3TxWUnTke4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-_Tvpz_fZNHKvZLPqOBL8wA-1; Mon, 30 Dec 2024 05:25:42 -0500
X-MC-Unique: _Tvpz_fZNHKvZLPqOBL8wA-1
X-Mimecast-MFC-AGG-ID: _Tvpz_fZNHKvZLPqOBL8wA
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3862a49fbdaso958748f8f.1
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 02:25:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735554341; x=1736159141;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cVdmHsrNhDi44uqqzECxIUXBR3cty0k4vtSMFPeoM14=;
 b=Fba0jrJt057IVjBuW8johD3Phxgf5v0sKw8TQTNutGIHD1PIenxIOusO3Xc4zlVDaH
 ZN7L7/nPdTLd8Sh1WDej9R1fdsOZPAE88nj/rKcL0gKMsWtTvOy7BSFvgIuVkAV9lNCv
 2XSnJZV/HdE6J/9dJn7nsEnvRq+q+ItgLFQnWMLKwZ0f0NnFf+h/BJvS67nxX6Mnup15
 DXXfm1Nr2cWbiWyEUSvrT9kxpNX5G+wG+xdwRGhY1+a3qlFucXRxr1jwS1/VgFiR8KTM
 W4jPyf+AS1kmITgnczwGuyy6J9SI0LPiUA5LBsTjoi6vZZ0YYOBnkzZQhkiE7jiiZHud
 VScw==
X-Gm-Message-State: AOJu0Yz74BN0BVbGMTgSNt954YKUhxzMIlBIGJ8R2Yyls0YXJ0a4XOSg
 XTxI9zQquM7ppKEtWx9tMrPLUySpTHfyAkmjH0JgQuYN7OIb8ryc0MkdcT3VefwiQfU+11CuR5A
 PoaMnI33ExjLxoJh/93IHbJgfHMVKUMrFSk6iv9IjBeBZl36HyKExkVd7nus4vdSfMQ==
X-Gm-Gg: ASbGncsMd6YyBmrhH3g+nb3pMHzMzjgrWVh23DTNI8/BqWhdmQbpsZPMq8KiTUbM8DD
 nLas32Q7NWutsB5FRXh22IY0sWBu9WX9JNvliyd48YJUHLzp7YTaR3ZR2YO21S+S4NKVIQFGfMx
 fF4FTVCXThiWLcTuw2q65wB9IJeJqtpcUnibDxw5hIUyVjEhWQXEXMneXB0ZB7VWew3+4n9R+8+
 UkHRckdVC7COB2znBfdJ1TU9EH4yDgzXM/2I7qiOjNdCRLjpfnPfBmzhL+NWDcRdJLQoxm7eooZ
 fcGL7I3QChqd/p9ETp+0vISJ1TmNncM=
X-Received: by 2002:a5d:5985:0:b0:386:32ca:9e22 with SMTP id
 ffacd0b85a97d-38a223ff477mr23516777f8f.41.1735554340883; 
 Mon, 30 Dec 2024 02:25:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHXB17EQJu+klTnxp8LwHvdfA4cYR0URMrlxmzt4eQvr0KDUHYN953IpLh8B/apPcYWxNQCVA==
X-Received: by 2002:a5d:5985:0:b0:386:32ca:9e22 with SMTP id
 ffacd0b85a97d-38a223ff477mr23516761f8f.41.1735554340535; 
 Mon, 30 Dec 2024 02:25:40 -0800 (PST)
Received: from ?IPv6:2001:16b8:3d0e:1700:7f81:92a8:f6f3:8c59?
 ([2001:16b8:3d0e:1700:7f81:92a8:f6f3:8c59])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366e210cecsm315434025e9.2.2024.12.30.02.25.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 02:25:39 -0800 (PST)
Message-ID: <5fb25705d202d40707730aacb6833d1939483cf4.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Document run_job() refcount hazard
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Luben Tuikov <ltuikov89@gmail.com>, Matthew
 Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, Tvrtko Ursulin
 <tursulin@ursulin.net>, Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Date: Mon, 30 Dec 2024 11:25:38 +0100
In-Reply-To: <5c4c610e-26ec-447c-b4db-ad38e994720b@amd.com>
References: <20241220124515.93169-2-phasta@kernel.org>
 <5c4c610e-26ec-447c-b4db-ad38e994720b@amd.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: E1acEV3kwbuAEDL-GKgQ4eJGbQLO65SHDBjcpS5r0iE_1735554341
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 2024-12-20 at 13:53 +0100, Christian K=C3=B6nig wrote:
> Am 20.12.24 um 13:45 schrieb Philipp Stanner:
> > From: Philipp Stanner <pstanner@redhat.com>
> >=20
> > drm_sched_backend_ops.run_job() returns a dma_fence for the
> > scheduler.
> > That fence is signalled by the driver once the hardware completed
> > the
> > associated job. The scheduler does not increment the reference
> > count on
> > that fence, but implicitly expects to inherit this fence from
> > run_job().
> >=20
> > This is relatively subtle and prone to misunderstandings.
> >=20
> > This implies that, to keep a reference for itself, a driver needs
> > to
> > call dma_fence_get() in addition to dma_fence_init() in that
> > callback.
> >=20
> > It's further complicated by the fact that the scheduler even
> > decrements
> > the refcount in drm_sched_run_job_work() since it created a new
> > reference in drm_sched_fence_scheduled(). It does, however, still
> > use
> > its pointer to the fence after calling dma_fence_put() - which is
> > safe
> > because of the aforementioned new reference, but actually still
> > violates
> > the refcounting rules.
> >=20
> > Improve the explanatory comment for that decrement.
> >=20
> > Move the call to dma_fence_put() to the position behind the last
> > usage
> > of the fence.
> >=20
> > Document the necessity to increment the reference count in
> > drm_sched_backend_ops.run_job().
> >=20
> > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 10 +++++++---
> > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20 ++++++++++++++++----
> > =C2=A0 2 files changed, 23 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index 7ce25281c74c..d6f8df39d848 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1218,15 +1218,19 @@ static void drm_sched_run_job_work(struct
> > work_struct *w)
> > =C2=A0=C2=A0=09drm_sched_fence_scheduled(s_fence, fence);
> > =C2=A0=20
> > =C2=A0=C2=A0=09if (!IS_ERR_OR_NULL(fence)) {
> > -=09=09/* Drop for original kref_init of the fence */
> > -=09=09dma_fence_put(fence);
> > -
> > =C2=A0=C2=A0=09=09r =3D dma_fence_add_callback(fence, &sched_job->cb,
> > =C2=A0=C2=A0=09=09=09=09=09=C2=A0=C2=A0 drm_sched_job_done_cb);
> > =C2=A0=C2=A0=09=09if (r =3D=3D -ENOENT)
> > =C2=A0=C2=A0=09=09=09drm_sched_job_done(sched_job, fence-
> > >error);
> > =C2=A0=C2=A0=09=09else if (r)
> > =C2=A0=C2=A0=09=09=09DRM_DEV_ERROR(sched->dev, "fence add
> > callback failed (%d)\n", r);
> > +
> > +=09=09/*
> > +=09=09 * s_fence took a new reference to fence in the
> > call to
> > +=09=09 * drm_sched_fence_scheduled() above. The
> > reference passed by
> > +=09=09 * run_job() above is now not needed any longer.
> > Drop it.
> > +=09=09 */
> > +=09=09dma_fence_put(fence);
> > =C2=A0=C2=A0=09} else {
> > =C2=A0=C2=A0=09=09drm_sched_job_done(sched_job, IS_ERR(fence) ?
> > =C2=A0=C2=A0=09=09=09=09=C2=A0=C2=A0 PTR_ERR(fence) : 0);
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index 95e17504e46a..a1f5c9a14278 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -420,10 +420,22 @@ struct drm_sched_backend_ops {
> > =C2=A0=C2=A0=09=09=09=09=09 struct drm_sched_entity
> > *s_entity);
> > =C2=A0=20
> > =C2=A0=C2=A0=09/**
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @run_job: Called to=
 execute the job once all of the
> > dependencies
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * have been resolved.=
=C2=A0 This may be called multiple times,
> > if
> > -=09 * timedout_job() has happened and
> > drm_sched_job_recovery()
> > -=09 * decides to try it again.
> > +=09 * @run_job: Called to execute the job once all of the
> > dependencies
> > +=09 * have been resolved. This may be called multiple times,
> > if
> > +=09 * timedout_job() has happened and
> > drm_sched_job_recovery() decides to
> > +=09 * try it again.
>=20
> Maybe we should improve that here as well while at it.
>=20
> That drm_sched_job_recovery() can call this multiple times actually
> goes=20
> against the dma_fence rules since drivers can't easily allocate a new
> HW=20
> fence.
>=20
> Something like "The deprecated drm_sched_job_recovery() function
> might=20
> call this again, but it is strongly advised to not be used because it
> violates dma_fence memory allocations rules."

I just realized that drm_sched_job_recovery() is indeed deprecated so
hard that it simply doesn't exist anymore. There is no such function.

It seems to me that we (and that old docstring) are actually talking
about drm_sched_resubmit_jobs(), which is also deprecated, and which
does invoke backend_ops.run_job()?


P.


>=20
> On the other hand can of course be a separate patch.
>=20
> > +=09 *
> > +=09 * @sched_job: the job to run
> > +=09 *
> > +=09 * Returns: dma_fence the driver must signal once the
> > hardware has
> > +=09 *=09completed the job ("hardware fence").
> > +=09 *
> > +=09 * Note that the scheduler expects to 'inherit' its own
> > reference to
> > +=09 * this fence from the callback. It does not invoke an
> > extra
> > +=09 * dma_fence_get() on it. Consequently, this callback must
> > return a
> > +=09 * fence whose refcount is at least 2: One for the
> > scheduler's
> > +=09 * reference returned here, another one for the reference
> > kept by the
> > +=09 * driver.
>=20
> Well the driver actually doesn't need any extra reference. The
> scheduler=20
> just needs to guarantee that this reference isn't dropped before it
> is=20
> signaled.
>=20
> Regards,
> Christian.
>=20
> > =C2=A0=C2=A0=09 */
> > =C2=A0=C2=A0=09struct dma_fence *(*run_job)(struct drm_sched_job
> > *sched_job);
> > =C2=A0=20
>=20

