Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A909F93FE
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 15:11:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6821510E2A0;
	Fri, 20 Dec 2024 14:11:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ieTRQKRT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB22E10E2A0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 14:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1734703899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Po9j/kDHQSkOO7bkIrssGn4bx0ZxNo9Mz1APVM6CbfM=;
 b=ieTRQKRTBih37mL1nWUKULsZN6m5RieawkCWmnnwIGEv0RtLbKQFmOX0hrZhEe3e4N1w1T
 LdIR9fQQqbqhsfrPEqX339q+v7RcJ4y0DHfebBVHxE+yTRBiLbOpJh31+v1HDmgBIQqM3D
 kdn0gA9ImUYc2DJmjH8A29KlP8hzGfM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-76-ksa-uOPbMI-hR6ynIVnL2Q-1; Fri, 20 Dec 2024 09:11:37 -0500
X-MC-Unique: ksa-uOPbMI-hR6ynIVnL2Q-1
X-Mimecast-MFC-AGG-ID: ksa-uOPbMI-hR6ynIVnL2Q
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4362552ce62so11119955e9.0
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 06:11:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734703896; x=1735308696;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KR/Ybg3lzFNNrynj6GP2dfr+h48F8Y8mlhL1ZrgmhI0=;
 b=i5Rer1d8JedQbe3bOPkYrMNisSK1aEevpYsWjX/S8rrEDQ/WZX2FaADuRMPt97Jsp9
 +OOHbsetxTHmKyVLMaukMXtedK4eOucj63oXTwWTyPBFXLGqNZN1YGxJWwWXMm8sNc55
 fBgE30Y4x7LMEeepsTB8yhfhg+Uovb0YsvCpYNHDxYufZWrbs5m16hGQvdUfVHBB+xoK
 /BvK1Qn/z/mxGS+BXyRx9lsW+Ui6YzgUXxBOrC6P8HBN4to3BfdEIYxE6CpdZKSavuGK
 Y88aQWTalKhNRdVuCIHQw5TKcAmR6tlexLbXxehLjJsGKZeAZdCofzFFKgzti8Z9bXET
 6JPA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUj3qTsNUx1f1Sb8n7qrH4aSo8UqWVfaKMeBJ8YUyqXlKaF9GxPIwn4aUQE4+efG0LHUv2mfvfD+ME=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YykMR/WqPmETetRRvq9V6HbNec6mQ0jMkCiVeiT/5j+MC99NoR+
 Uz1hgNMjYDs+iJgol1fWJ7fU2qAoU9VHMqIJHQrTYORSp4+yVIu0V22zfo5Cs3PvZ7tipzFIZQw
 C2LKu0y0OAMqOyhLHbQVU8FyF0v6+fmKbMrndXrEm2bhFo2l+V5eUZDYIVAVoQaGsoA==
X-Gm-Gg: ASbGnctAtQ/0BrF+FZju5rrKB50A3J0E+jDBroJFuEX5eJwFs0TcZlkTPbkVDsDn+5A
 0k8CKxDSN1RYF2778egDzRgYw6amlKnwaX7+G5l00ZTGRkqVqdd0ihVO+fE2nYGUo2oJvIZxdov
 ykP6GHPYSPtobQL8/6YECW++refM6Rdauf4WLZhLo7tUTXenwWjNfwXF/qSFKTrHS/x3y4M2Ztj
 Nq3MRoM6kBryYH+WhPN+NZto8Ts0eV1D/mZFSglK5K/ITdqGdq2/HvPB2ZbVUmrNrH0P+1B19VD
 nY2M6BU8MvlrjVDJ3gjx24XtcX1sY6o=
X-Received: by 2002:a7b:c459:0:b0:434:ff30:a165 with SMTP id
 5b1f17b1804b1-436712441e2mr5994485e9.8.1734703896337; 
 Fri, 20 Dec 2024 06:11:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvm84P8soawQWG7WWO+ebyxGNN7WWXWb2n1BSpHTBIQgvoW1jO1ClH+ywj0Fo/WaCNkr7iYw==
X-Received: by 2002:a7b:c459:0:b0:434:ff30:a165 with SMTP id
 5b1f17b1804b1-436712441e2mr5994205e9.8.1734703895893; 
 Fri, 20 Dec 2024 06:11:35 -0800 (PST)
Received: from ?IPv6:2001:16b8:3db8:2e00:4b6c:c773:a3e0:8035?
 ([2001:16b8:3db8:2e00:4b6c:c773:a3e0:8035])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4366127c4fcsm47460175e9.29.2024.12.20.06.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Dec 2024 06:11:35 -0800 (PST)
Message-ID: <46f22193d960c0a0960c2ceaa525e9ff57fc09b6.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Document run_job() refcount hazard
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Danilo
 Krummrich <dakr@kernel.org>
Cc: Philipp Stanner <phasta@kernel.org>, Luben Tuikov <ltuikov89@gmail.com>,
 Matthew Brost <matthew.brost@intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org,  linaro-mm-sig@lists.linaro.org, Tvrtko
 Ursulin <tursulin@ursulin.net>, Andrey Grodzovsky
 <andrey.grodzovsky@amd.com>
Date: Fri, 20 Dec 2024 15:11:34 +0100
In-Reply-To: <e366a206-9fa3-4c6b-b307-d48855a7b183@amd.com>
References: <20241220124515.93169-2-phasta@kernel.org>
 <5c4c610e-26ec-447c-b4db-ad38e994720b@amd.com> <Z2VunIJ4ltfW_xqD@pollux>
 <e366a206-9fa3-4c6b-b307-d48855a7b183@amd.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JRGsntJAqmRAUGDec2JH1pf8pF7avybNN53B7veeHBg_1734703896
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

On Fri, 2024-12-20 at 14:25 +0100, Christian K=C3=B6nig wrote:
> Am 20.12.24 um 14:18 schrieb Danilo Krummrich:
> > On Fri, Dec 20, 2024 at 01:53:34PM +0100, Christian K=C3=B6nig wrote:
> > > Am 20.12.24 um 13:45 schrieb Philipp Stanner:
> > > > From: Philipp Stanner <pstanner@redhat.com>
> > > >=20
> > > > drm_sched_backend_ops.run_job() returns a dma_fence for the
> > > > scheduler.
> > > > That fence is signalled by the driver once the hardware
> > > > completed the
> > > > associated job. The scheduler does not increment the reference
> > > > count on
> > > > that fence, but implicitly expects to inherit this fence from
> > > > run_job().
> > > >=20
> > > > This is relatively subtle and prone to misunderstandings.
> > > >=20
> > > > This implies that, to keep a reference for itself, a driver
> > > > needs to
> > > > call dma_fence_get() in addition to dma_fence_init() in that
> > > > callback.
> > > >=20
> > > > It's further complicated by the fact that the scheduler even
> > > > decrements
> > > > the refcount in drm_sched_run_job_work() since it created a new
> > > > reference in drm_sched_fence_scheduled(). It does, however,
> > > > still use
> > > > its pointer to the fence after calling dma_fence_put() - which
> > > > is safe
> > > > because of the aforementioned new reference, but actually still
> > > > violates
> > > > the refcounting rules.
> > > >=20
> > > > Improve the explanatory comment for that decrement.
> > > >=20
> > > > Move the call to dma_fence_put() to the position behind the
> > > > last usage
> > > > of the fence.
> > > >=20
> > > > Document the necessity to increment the reference count in
> > > > drm_sched_backend_ops.run_job().
> > > >=20
> > > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > > Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> > > > Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> > > > Signed-off-by: Philipp Stanner <pstanner@redhat.com>
> > > > ---
> > > > =C2=A0=C2=A0 drivers/gpu/drm/scheduler/sched_main.c | 10 +++++++---
> > > > =C2=A0=C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 20
> > > > ++++++++++++++++----
> > > > =C2=A0=C2=A0 2 files changed, 23 insertions(+), 7 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > > > b/drivers/gpu/drm/scheduler/sched_main.c
> > > > index 7ce25281c74c..d6f8df39d848 100644
> > > > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > > > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > > > +=09 *
> > > > +=09 * @sched_job: the job to run
> > > > +=09 *
> > > > +=09 * Returns: dma_fence the driver must signal once the
> > > > hardware has
> > > > +=09 *=09completed the job ("hardware fence").
> > > > +=09 *
> > > > +=09 * Note that the scheduler expects to 'inherit' its
> > > > own reference to
> > > > +=09 * this fence from the callback. It does not invoke an
> > > > extra
> > > > +=09 * dma_fence_get() on it. Consequently, this callback
> > > > must return a
> > > > +=09 * fence whose refcount is at least 2: One for the
> > > > scheduler's
> > > > +=09 * reference returned here, another one for the
> > > > reference kept by the
> > > > +=09 * driver.
> > > Well the driver actually doesn't need any extra reference. The
> > > scheduler
> > > just needs to guarantee that this reference isn't dropped before
> > > it is
> > > signaled.
> > I think he means the reference the driver's fence context has to
> > have in order
> > to signal that thing eventually.
>=20
> Yeah, but this is usually a weak reference. IIRC most drivers don't=20
> increment the reference count for the reference they keep to signal a
> fence.
>=20
> It's expected that the consumers of the dma_fence keep the fence
> alive=20
> at least until it is signaled.

So are you saying that the driver having an extra reference (without
having obtained it with dma_fence_get()) is not an issue because the
driver is the one who will signal the fence [and then be done with it]?

>  That's why we have this nice warning in=20
> dma_fence_release().
>=20
> On the other hand I completely agree it would be more defensive if=20
> drivers increment the reference count for the reference they keep for
> signaling.
>=20
> So if we want to document that the fence reference count should at
> least=20
> be 2 we somehow need to enforce this with a warning for example.

We could =E2=80=93 but I'm not sure whether it really needs to be "enforced=
",
especially if it were only to be a minor issue, as you seem to hint at
above.
Document it is the minimum IMO


P.

>=20
> Regards,
> Christian.
>=20
>=20
>=20
> >=20
> > > Regards,
> > > Christian.
> > >=20
> > > > =C2=A0=C2=A0=C2=A0=09 */
> > > > =C2=A0=C2=A0=C2=A0=09struct dma_fence *(*run_job)(struct drm_sched_=
job
> > > > *sched_job);
>=20

