Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FDD9FE553
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 11:32:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D696F10E48A;
	Mon, 30 Dec 2024 10:32:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Uh/FfIdV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8835010E100
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 10:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1735554740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h5SIw1tEY4FDq4N5RdhATRwRuaew2wIkPnip4Fes3pg=;
 b=Uh/FfIdV8cmw9RzI8UX75BRIUDEY2H+sIuR3YN+yM3jZuTRS/pV0nRx9/n6yix5WaSoQjL
 G1sfbeAfTlE3R4TCZDn2wlNisDDfQwRANofCF5IYhDBZ0VoQkEJfvj1Yk5nKPAPkooFME8
 gqWQT0ZIzryIvpj1DTbtcpsFaecrhTI=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-45-jZDU2kfjOo-s3P9yrJScZw-1; Mon, 30 Dec 2024 05:32:19 -0500
X-MC-Unique: jZDU2kfjOo-s3P9yrJScZw-1
X-Mimecast-MFC-AGG-ID: jZDU2kfjOo-s3P9yrJScZw
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4361efc9d1fso67046495e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 02:32:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735554738; x=1736159538;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1Ejlp46RZvGD/F7TXnupAMS6ui8zDFj94kIEqbP/YBY=;
 b=qk2eEUFMTV0HBh3YHmz3bEW3b5NZE8i0GJnH5AND5MKHgU1QfRDRg4MNdNLQaFuwyZ
 YpFaIA/bG8ZepIxKY3mLKH2sFRdPbwyjbIg++AOdSGkO+vhUFUU4WZUUBuFN1cyGRbNh
 M8+kdgQV1ghDkjMRz9an8cjo/4y9/Yy0sSjqVkKSf0/Jx4rEP2pe6qy0xejSQ+DWz1UW
 TBiFgmAAA2/3ogS7FZ4D3trdccEixqLbItumpuD85a7cYke0XADI45iJcvLSK/zJNMYz
 7YQTu2YHUFbF8MMNdFet9m1ejpIMAylOXHVnjKk5WdFhYgafHR33nltTTjIphO9D4JJk
 nTDg==
X-Gm-Message-State: AOJu0YxdA//YB+3RWnTmHrBImPKNRLg2HNPC83wYA93PucoPOwR0zRlq
 tTrmFSU2eIwRz2POL/DTHkTlpW44N3OJ6Z8fpTdOmCO2REDkiDUZjaTSYX71325qZ4gYw7gtteP
 ekwCzOXqP3sp89ZTjATHggvHAu91BHbSH3l+TXPy8xARAAepQFMd+1IhZL87+IIHvhw==
X-Gm-Gg: ASbGncsTtRYQqhveORDDp2vfX4ejS9Nl3LWqQtNp0dcCW94wX+srqocFhQVVRn3cu/9
 5/1iz6TUKRjU3r9RjRwh9+PqwznMMWwMQgmCkT1pZbkbqSMV3LHJL3YescE+vAZeBujBkmS8aiV
 4NgscdOGbOlzKA3uwzoivp/P+s2U3MigSdJM2y9sgpvoF0uiZBKmfYiicIZnkV0bEfW+VIATNYl
 /pgjbB7sdEtAcdoG2BeSpzdJJR0tfvg+DNoSIJsArMxTaq7Snfa7DOc+IFs1j3oBco3aLEyAbfy
 6W3S9AxwCOSLmimEu6069TGgFDojWsU=
X-Received: by 2002:a05:600c:1c12:b0:431:58cd:b259 with SMTP id
 5b1f17b1804b1-4366d356dfcmr312941765e9.31.1735554737911; 
 Mon, 30 Dec 2024 02:32:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlRFlbNoY+KcqeO9+HeoBICEtrqoVNx6gMJZlhy1FeLcBM24INP3mDxq5/8fnYTHSYTUs38w==
X-Received: by 2002:a05:600c:1c12:b0:431:58cd:b259 with SMTP id
 5b1f17b1804b1-4366d356dfcmr312941545e9.31.1735554737541; 
 Mon, 30 Dec 2024 02:32:17 -0800 (PST)
Received: from ?IPv6:2001:16b8:3d0e:1700:7f81:92a8:f6f3:8c59?
 ([2001:16b8:3d0e:1700:7f81:92a8:f6f3:8c59])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436611fc161sm350155805e9.10.2024.12.30.02.32.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Dec 2024 02:32:17 -0800 (PST)
Message-ID: <ab3aad6bd82b99add72a6b015464d925bec638dc.camel@redhat.com>
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
Date: Mon, 30 Dec 2024 11:32:16 +0100
In-Reply-To: <5fb25705d202d40707730aacb6833d1939483cf4.camel@redhat.com>
References: <20241220124515.93169-2-phasta@kernel.org>
 <5c4c610e-26ec-447c-b4db-ad38e994720b@amd.com>
 <5fb25705d202d40707730aacb6833d1939483cf4.camel@redhat.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 20T1Uo_NRFunCdZlYuSE5qjZZyxgtuBCXV12cAMoCFU_1735554738
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

On Mon, 2024-12-30 at 11:25 +0100, Philipp Stanner wrote:
> On Fri, 2024-12-20 at 13:53 +0100, Christian K=C3=B6nig wrote:
> > Am 20.12.24 um 13:45 schrieb Philipp Stanner:
> > > From: Philipp Stanner <pstanner@redhat.com>
> > >=20
> > > drm_sched_backend_ops.run_job() returns a dma_fence for the
> > > scheduler.
> > > That fence is signalled by the driver once the hardware completed
> > > the
> > > associated job. The scheduler does not increment the reference
> > > count on
> > > that fence, but implicitly expects to inherit this fence from
> > > run_job().
> > >=20
> > > This is relatively subtle and prone to misunderstandings.
> > >=20
> > > This implies that, to keep a reference for itself, a driver needs
> > > to
> > > call dma_fence_get() in addition to dma_fence_init() in that
> > > callback.
> > >=20
> > > It's further complicated by the fact that the scheduler even
> > > decrements
> > > the refcount in drm_sched_run_job_work() since it created a new
> > > reference in drm_sched_fence_scheduled(). It does, however, still
> > > use
> > > its pointer to the fence after calling dma_fence_put() - which is
> > > safe
> > > because of the aforementioned new reference, but actually still
> > > violates
> > > the refcounting rules.
> > >=20
> > > Improve the explanatory comment for that decrement.
> > >=20
> > > Move the call to dma_fence_put() to the position behind the last
> > > usage
> > > of the fence.
> > >=20
> > > Document the necessity to increment the reference count in
> > > drm_sched_backend_ops.run_job().
> > >=20
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > > ---
> > > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 10 +++++++---
> > > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20 ++++++++++++++++---
> > > -
> > > =C2=A0 2 files changed, 23 insertions(+), 7 deletions(-)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > index 7ce25281c74c..d6f8df39d848 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > @@ -1218,15 +1218,19 @@ static void drm_sched_run_job_work(struct
> > > work_struct *w)
> > > =C2=A0=C2=A0=09drm_sched_fence_scheduled(s_fence, fence);
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09if (!IS_ERR_OR_NULL(fence)) {
> > > -=09=09/* Drop for original kref_init of the fence */
> > > -=09=09dma_fence_put(fence);
> > > -
> > > =C2=A0=C2=A0=09=09r =3D dma_fence_add_callback(fence, &sched_job-
> > > >cb,
> > > =C2=A0=C2=A0=09=09=09=09=09=C2=A0=C2=A0
> > > drm_sched_job_done_cb);
> > > =C2=A0=C2=A0=09=09if (r =3D=3D -ENOENT)
> > > =C2=A0=C2=A0=09=09=09drm_sched_job_done(sched_job, fence-
> > > > error);
> > > =C2=A0=C2=A0=09=09else if (r)
> > > =C2=A0=C2=A0=09=09=09DRM_DEV_ERROR(sched->dev, "fence add
> > > callback failed (%d)\n", r);
> > > +
> > > +=09=09/*
> > > +=09=09 * s_fence took a new reference to fence in the
> > > call to
> > > +=09=09 * drm_sched_fence_scheduled() above. The
> > > reference passed by
> > > +=09=09 * run_job() above is now not needed any longer.
> > > Drop it.
> > > +=09=09 */
> > > +=09=09dma_fence_put(fence);
> > > =C2=A0=C2=A0=09} else {
> > > =C2=A0=C2=A0=09=09drm_sched_job_done(sched_job, IS_ERR(fence) ?
> > > =C2=A0=C2=A0=09=09=09=09=C2=A0=C2=A0 PTR_ERR(fence) : 0);
> > > diff --git a/include/drm/gpu_scheduler.h
> > > b/include/drm/gpu_scheduler.h
> > > index 95e17504e46a..a1f5c9a14278 100644
> > > --- a/include/drm/gpu_scheduler.h
> > > +++ b/include/drm/gpu_scheduler.h
> > > @@ -420,10 +420,22 @@ struct drm_sched_backend_ops {
> > > =C2=A0=C2=A0=09=09=09=09=09 struct drm_sched_entity
> > > *s_entity);
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09/**
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @run_job: Called =
to execute the job once all of the
> > > dependencies
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * have been resolve=
d.=C2=A0 This may be called multiple
> > > times,
> > > if
> > > -=09 * timedout_job() has happened and
> > > drm_sched_job_recovery()
> > > -=09 * decides to try it again.
> > > +=09 * @run_job: Called to execute the job once all of the
> > > dependencies
> > > +=09 * have been resolved. This may be called multiple
> > > times,
> > > if
> > > +=09 * timedout_job() has happened and
> > > drm_sched_job_recovery() decides to
> > > +=09 * try it again.
> >=20
> > Maybe we should improve that here as well while at it.
> >=20
> > That drm_sched_job_recovery() can call this multiple times actually
> > goes=20
> > against the dma_fence rules since drivers can't easily allocate a
> > new
> > HW=20
> > fence.
> >=20
> > Something like "The deprecated drm_sched_job_recovery() function
> > might=20
> > call this again, but it is strongly advised to not be used because
> > it
> > violates dma_fence memory allocations rules."
>=20
> I just realized that drm_sched_job_recovery() is indeed deprecated so
> hard that it simply doesn't exist anymore. There is no such function.
>=20
> It seems to me that we (and that old docstring) are actually talking
> about drm_sched_resubmit_jobs(), which is also deprecated, and which
> does invoke backend_ops.run_job()?


Yo, wait a second
=E2=80=93 so drm_sched_resubmit_jobs() has been deprecated. Yet we still
happily encourage people to use it in the documentation of
timedout_job().

That's uncool. Especially since we don't tell users what they should be
using instead in timedout_job().

Suggestions?

P.

>=20
>=20
> P.
>=20
>=20
> >=20
> > On the other hand can of course be a separate patch.
> >=20
> > > +=09 *
> > > +=09 * @sched_job: the job to run
> > > +=09 *
> > > +=09 * Returns: dma_fence the driver must signal once the
> > > hardware has
> > > +=09 *=09completed the job ("hardware fence").
> > > +=09 *
> > > +=09 * Note that the scheduler expects to 'inherit' its own
> > > reference to
> > > +=09 * this fence from the callback. It does not invoke an
> > > extra
> > > +=09 * dma_fence_get() on it. Consequently, this callback
> > > must
> > > return a
> > > +=09 * fence whose refcount is at least 2: One for the
> > > scheduler's
> > > +=09 * reference returned here, another one for the
> > > reference
> > > kept by the
> > > +=09 * driver.
> >=20
> > Well the driver actually doesn't need any extra reference. The
> > scheduler=20
> > just needs to guarantee that this reference isn't dropped before it
> > is=20
> > signaled.
> >=20
> > Regards,
> > Christian.
> >=20
> > > =C2=A0=C2=A0=09 */
> > > =C2=A0=C2=A0=09struct dma_fence *(*run_job)(struct drm_sched_job
> > > *sched_job);
> > > =C2=A0=20
> >=20
>=20

