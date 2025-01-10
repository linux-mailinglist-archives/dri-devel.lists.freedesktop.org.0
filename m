Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A35A08B0C
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2025 10:14:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C19C410F01B;
	Fri, 10 Jan 2025 09:14:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DV0E16Om";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90AC810F01B
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 09:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736500493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TvhnUoLhIHaK7keflpwWlxa3XTfp0ya4SerLAydrcV4=;
 b=DV0E16OmVm9YIIOwh2QCB/uqZjQ3WpaPGT389bh+jabGznXjr93lBKom64VfUqLfKFI5jz
 SWqIdtIJRhBbN/BBZiPYnNxeZmIT2HAZT0A2TIxtC1blhcyRubVC/dNSvZerFIwjghd9hr
 XgrNBuEopvPLH7lwzp0nhJ8uG8uHhSU=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-387-s85dw7MtP_igyOSIalPdUg-1; Fri, 10 Jan 2025 04:14:52 -0500
X-MC-Unique: s85dw7MtP_igyOSIalPdUg-1
X-Mimecast-MFC-AGG-ID: s85dw7MtP_igyOSIalPdUg
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-385e3cbf308so723131f8f.2
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2025 01:14:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736500491; x=1737105291;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8WE2y7Tnn0z8S9WigHQq+Beyf3tmLnG35Pz4F1jLvso=;
 b=N53LmylUACsnE6Ai0V7AUt5iPfakq5HyhmdIHzDLRBa+mmPqk5SkSbnG6hLQr7u5K0
 eJAVRVsN3JY9Wk3zX7pb7WKETYsmXBIMFhMT7nk9nCMaxtdeVw09u8Ss8qInt0cxoB1S
 2Fcdet654MfUcHZ4BPH/Sq1S1MDiX1EuG50DtcDKE7xxeB1uXVYI7Obyi3HvMjOSTqXW
 lC78FzzCm8/icubkJnexwBx+91FE7WoP1KgXvAs8nbN6AIHdRuA0DzQvZ5gjSSqr3Bl4
 VsAJQv+hZ7LVAeyMQY1cXOxQhhhyKvvGCqRgXkcaMLd9P5zxKDmDDjINf1KWPpIlH8Ue
 C8GA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWD2zeFgTWqZ1WCosiGJBs8xvL4PWMNZVjtkdqXmqHResz68R7cu9LJSpJqcR1xYZd1W4eK/gn7lVs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxFwfC6eiW4rnwN9lz4bzf78GpNymqPSlGwhrDMKEHlsgY/8d2B
 2MiAQGzXUMMXlsSXFFHaCGpOtDc3oBNLbjENkv+GSM7/9mhlpzEi8Hgjeq3kpJSgY/U75w931v+
 BivcofV27aRXU+43FFqLINiZ37l5VcawGeEABruJo+ntvNfLc8QZcHRCoxdXJY5f7JQ==
X-Gm-Gg: ASbGncv0WWf4WCaj4puqm8euhWMb2P2kem2oh6siMC3O7G4xwKi+affeaVNvhzfBPG0
 AC3xlK8p1CbQHikakpspQVBMYG/61FJt2ishg7GXvDaQJ6qs/TaWg3sF5vckPCyZVKXObQtzUfz
 SyxJY8fyUK2bWSq9yeL+oG+t1yZfcbP4QiNqtjvtrJ3oL+W4hwOYLMkDwJjsdViWBi/6aSjE/o2
 4j6J9LqaP9XsOnB3gIO+6BhQ4qshz3J0XnXTgfBR4RO1D8hiAzDt1aaXuNzbRNaNIfO5zyZLQCD
 +6vBgG1ofbhZud8suhNm4UgcDugRTHtREL5oAKyJBKr3BmaVQ56Z7uUrvBtFJXj3gg5KBXQs7PM
 Cx5Cl7/umGglO
X-Received: by 2002:a5d:5f52:0:b0:382:4926:98fa with SMTP id
 ffacd0b85a97d-38a8733691amr9430329f8f.40.1736500491572; 
 Fri, 10 Jan 2025 01:14:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtXquHIJObzLgOAiA1rB/PNIksOhxW+GDPZKrOCv6KsWQW80GBE0j/RUI1fRpLdmchCqwXWg==
X-Received: by 2002:a5d:5f52:0:b0:382:4926:98fa with SMTP id
 ffacd0b85a97d-38a8733691amr9430298f8f.40.1736500491137; 
 Fri, 10 Jan 2025 01:14:51 -0800 (PST)
Received: from ?IPv6:2001:16b8:2d10:d100:478:f613:cd65:5ca1?
 (200116b82d10d1000478f613cd655ca1.dip.versatel-1u1.de.
 [2001:16b8:2d10:d100:478:f613:cd65:5ca1])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e37e375sm3932101f8f.22.2025.01.10.01.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 01:14:50 -0800 (PST)
Message-ID: <dc31c33626c5f6100c93cb51eaf37070d5a7ba9f.camel@redhat.com>
Subject: Re: [PATCH 1/3] drm/sched: Document run_job() refcount hazard
From: Philipp Stanner <pstanner@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Cc: Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>,  Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,  linaro-mm-sig@lists.linaro.org
Date: Fri, 10 Jan 2025 10:14:49 +0100
In-Reply-To: <Z3_dgYGOSfLUcI0J@pollux>
References: <20250109133710.39404-2-phasta@kernel.org>
 <20250109133710.39404-4-phasta@kernel.org> <Z3_dgYGOSfLUcI0J@pollux>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: w_G8yCBFlbEbkDO5HvhzKjnX6Pztq72FD5ViEiwOJ3c_1736500492
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

On Thu, 2025-01-09 at 15:30 +0100, Danilo Krummrich wrote:
> On Thu, Jan 09, 2025 at 02:37:10PM +0100, Philipp Stanner wrote:
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
> > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > ---
> > =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 10 +++++++---
> > =C2=A0include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 +++++++++++++++----
> > =C2=A02 files changed, 22 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index 57da84908752..5f46c01eb01e 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1218,15 +1218,19 @@ static void drm_sched_run_job_work(struct
> > work_struct *w)
> > =C2=A0=09drm_sched_fence_scheduled(s_fence, fence);
> > =C2=A0
> > =C2=A0=09if (!IS_ERR_OR_NULL(fence)) {
> > -=09=09/* Drop for original kref_init of the fence */
> > -=09=09dma_fence_put(fence);
> > -
> > =C2=A0=09=09r =3D dma_fence_add_callback(fence, &sched_job->cb,
> > =C2=A0=09=09=09=09=09=C2=A0=C2=A0 drm_sched_job_done_cb);
> > =C2=A0=09=09if (r =3D=3D -ENOENT)
> > =C2=A0=09=09=09drm_sched_job_done(sched_job, fence-
> > >error);
> > =C2=A0=09=09else if (r)
> > =C2=A0=09=09=09DRM_DEV_ERROR(sched->dev, "fence add
> > callback failed (%d)\n", r);
> > +
> > +=09=09/*
> > +=09=09 * s_fence took a new reference to fence in the
> > call to
> > +=09=09 * drm_sched_fence_scheduled() above. The
> > reference passed by
>=20
> I think mentioning that in this context is a bit misleading. The
> reason we can
> put the fence here, is because we stop using the local fence pointer
> we have a
> reference for (from run_job()).
>=20
> This has nothing to do with the fact that drm_sched_fence_scheduled()
> took its
> own reference when it stored a copy of this fence pointer in a
> separate data
> structure.
>=20
> With that fixed,

Then let's remove the comment completely I'd say.

>=20
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>

And I forgot your SB. Will add.


Danke,
P.

>=20
> > +=09=09 * run_job() above is now not needed any longer.
> > Drop it.
> > +=09=09 */
> > +=09=09dma_fence_put(fence);
> > =C2=A0=09} else {
> > =C2=A0=09=09drm_sched_job_done(sched_job, IS_ERR(fence) ?
> > =C2=A0=09=09=09=09=C2=A0=C2=A0 PTR_ERR(fence) : 0);
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index 95e17504e46a..d5cd2a78f27c 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -420,10 +420,21 @@ struct drm_sched_backend_ops {
> > =C2=A0=09=09=09=09=09 struct drm_sched_entity
> > *s_entity);
> > =C2=A0
> > =C2=A0=09/**
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
> > take a
> > +=09 * reference for the scheduler, and additional ones for
> > the driver's
> > +=09 * respective needs.
> > =C2=A0=09 */
> > =C2=A0=09struct dma_fence *(*run_job)(struct drm_sched_job
> > *sched_job);
> > =C2=A0
> > --=20
> > 2.47.1
> >=20

