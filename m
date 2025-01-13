Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF1DA0B65A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 13:07:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5307E10E660;
	Mon, 13 Jan 2025 12:07:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="G0JfC40Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3642610E660
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 12:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1736770038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5uAUjHgESm7nacJnDb6BFSuNVaS14mJSmhwdVFp6WIs=;
 b=G0JfC40Z2fNuBtJXnU7IgYny565ZfU0vRPZgmsbLRLeyXGQBBURPXQj/OPqfs9OOntuY3s
 x7d7gR1aTMsAI08qkBH2mfpdr2Bviv8vi3H9XyWj+HRBHaduTJ1Vo4D+GCIHmPQEph367A
 EowoJT3+JYPlxwfY7OuoMbvsbgoQlsg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-4T72u0rMPhiUfP7NsoIMGA-1; Mon, 13 Jan 2025 07:07:17 -0500
X-MC-Unique: 4T72u0rMPhiUfP7NsoIMGA-1
X-Mimecast-MFC-AGG-ID: 4T72u0rMPhiUfP7NsoIMGA
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4361fc2b2d6so24053135e9.3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 04:07:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736770036; x=1737374836;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+TdSHXspwnZXwF4h2DZEwKqf77S3RUPoHliyOCG8joM=;
 b=VCN0Xp0IsfAGgicaoSRX0bQ58PiDxxJ3RUYWbu6vE/VL3GcjWbNEQmDuONpcQsoUpU
 IsiJ2UcSEkTIdPubTRgj/QxwsqK8X2f7QS1mZih728TAdx7nOTpIHOdOMG2QEsXA9HII
 oJdP3i7yc8zxPJgqmP/jBnihlhTx/Wv/FJtyeh8DNgIX2MjFTQquOVk4xISe3f8wOINw
 11iEbYe0vXRsAwxIPgDK5HQFitp9tPKIAE8w7d4Y/O55xmycxV9z7Vb1PXTtf5joyK0u
 lHzCsMyAinfkKgN6zYHw+ViPveMaOS4+7VCCepaM5CUJSUWBfCOWjR7oZ0IZN7o2Sr5l
 D0HQ==
X-Gm-Message-State: AOJu0YwfJIVijL9v9Fa1Hd2ReG/yRomjiqma2HjQXX7ipDE/BeUYt29n
 FA5IsEhxWIwgzjqe0DbGETiymsoYQaK00GBRlc013TUe276GC/oG9woMuCLMOTNTHv//EpmVJ3J
 JzZMGq06O/0cfA+DffBWaqQEEnpnlSsV8oAAlA8spEnmUMyJrfJoJ5LJcsHtuCK7TYA==
X-Gm-Gg: ASbGnctZYkEaupxON6/YI9fwy5sMu8bW5WXIIsR7+ICHvfMqBDT1tlGycv8H3ZOL9Oa
 q8f8ak6MySBh1U4uR6r3R7NculERo4HQqLtWGAMFXoJRHZ/KjV0CnuaRxepXg6Z7xL7IwQ0+HYa
 B/G7Lmr0WR59oy9clSyjL6nRywG6VMJKLxSa2AT9HBEY+AHSJTY8wPvvjTP99FduX/TXy5jHVVv
 wXFd+wqwfgqcrwHBR6eX+e4dBS+vG4cSjaNAHxHxbvuJqYhSS1GVWqBCJDJkaKBnHRqi7QVoiyN
 J/XlEU35Cym3wF7JKcaovb213par5hd+G71IbdWF2T98MRHRka208MfHNP0+J0Pwg/SUbEfMOhm
 wczeHq+WGcI3Rdq90
X-Received: by 2002:a5d:64af:0:b0:38a:8e2e:9fcc with SMTP id
 ffacd0b85a97d-38a8e2ea11cmr15492275f8f.45.1736770035863; 
 Mon, 13 Jan 2025 04:07:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGpSJ9ro6ZHAQTx4w8s1hVHKl20+St+yEc7qTxW7zB/9BUgzdP9J0EacCpHEFeFW46e29u8xQ==
X-Received: by 2002:a5d:64af:0:b0:38a:8e2e:9fcc with SMTP id
 ffacd0b85a97d-38a8e2ea11cmr15492222f8f.45.1736770035376; 
 Mon, 13 Jan 2025 04:07:15 -0800 (PST)
Received: from ?IPv6:2001:16b8:2d84:4500:c248:649d:c975:50e7?
 (200116b82d844500c248649dc97550e7.dip.versatel-1u1.de.
 [2001:16b8:2d84:4500:c248:649d:c975:50e7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e3834a6sm11892576f8f.28.2025.01.13.04.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 04:07:15 -0800 (PST)
Message-ID: <24a1169b0d1a4ba895df30c2665265bbf3e78e2a.camel@redhat.com>
Subject: Re: [PATCH 1/3] drm/sched: Document run_job() refcount hazard
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Luben Tuikov <ltuikov89@gmail.com>, Matthew
 Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Mon, 13 Jan 2025 13:07:13 +0100
In-Reply-To: <a52651d1-16c3-4038-bea8-c6ec1812eb3d@amd.com>
References: <20250109133710.39404-2-phasta@kernel.org>
 <20250109133710.39404-4-phasta@kernel.org>
 <a52651d1-16c3-4038-bea8-c6ec1812eb3d@amd.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qhfVfPvDmDJ_P52_W29mEkgFEXYhLmggudc59XWbnLQ_1736770036
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

On Thu, 2025-01-09 at 15:01 +0100, Christian K=C3=B6nig wrote:
> Am 09.01.25 um 14:37 schrieb Philipp Stanner:
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
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 10 +++++++---
> > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 +++++++++++++++----
> > =C2=A0 2 files changed, 22 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index 57da84908752..5f46c01eb01e 100644
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
> > index 95e17504e46a..d5cd2a78f27c 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -420,10 +420,21 @@ struct drm_sched_backend_ops {
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
> I just came to realize that this hack with calling run_job multiple=20
> times won't work any more with this patch here.
>=20
> The background is that you can't allocate memory for a newly returned
> fence and as far as I know no driver pre allocates multiple HW fences
> for a job.
>=20
> So at least amdgpu used to re-use the same HW fence as return over
> and=20
> over again, just re-initialized the reference count. I removed that
> hack=20
> from amdgpu, but just FYI it could be that other driver did the same.
>=20
> Apart from that concern I think that this patch is really the right=20
> thing and that driver hacks relying on the order of dropping
> references=20
> are fundamentally broken approaches.

I don't see how a hack couldn't work anymore with this patch. All it
does is add comments, and it moves the putting of the dma_fence to
where it belongs. But we're in run_job_work() here, which executes
sequentially.
Drivers reusing fences or modifying the refcount might be bad and
hacky, but as long as we're not racing here it doesn't matter whether
the scheduler decrements the refcount a few nanoseconds later than
before.

Anyways, even if I'm wrong, it seems we agree that provoking such
explosions would be worth it.

P.

>=20
> So feel free to add Reviewed-by: Christian K=C3=B6nig
> <christian.koenig@amd.com>.
>=20
> Regards,
> Christian.
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
> > take a
> > +=09 * reference for the scheduler, and additional ones for
> > the driver's
> > +=09 * respective needs.
> > =C2=A0=C2=A0=09 */
> > =C2=A0=C2=A0=09struct dma_fence *(*run_job)(struct drm_sched_job
> > *sched_job);
> > =C2=A0=20
>=20

