Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80880A1945B
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2025 15:49:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C311710E6FD;
	Wed, 22 Jan 2025 14:49:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BvqdfRLA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A30910E6F7
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 14:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737557343;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dnZBMQdcanWkm1jfT9NEbxrsQV9YobZXJXi43i+bIDk=;
 b=BvqdfRLAkDtRNzckCTNIekGd0igvWltMdWrrMn5MXy7dDl/csX9Ld56S/9k32V6tuDJKAL
 VigqOUBXkxzhtDs5eWd2ARtI96bstpByXQU/Ov78O5jVL6TtlOYXVCEqAMbGKYHLo/C5La
 BHOOjaQb3DexhH3KGiksNnuOBnHiyWs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-IdijiYh8MJCCr2XPlwQvYA-1; Wed, 22 Jan 2025 09:49:00 -0500
X-MC-Unique: IdijiYh8MJCCr2XPlwQvYA-1
X-Mimecast-MFC-AGG-ID: IdijiYh8MJCCr2XPlwQvYA
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4359eb032c9so53271545e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 06:48:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737557339; x=1738162139;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ffQZzI2GeKbdRCx1c3zKoYl9TBN9X9Sx0MSZr2ZMjHw=;
 b=ZxnVOWWdLVz2fcONq6laTzvMS4sF9rCcCTHpJnMwcRk+rq55GTkKWw7TFnrwstA62K
 ml0qiSho4uDvF/XsOZX91u+awxTI3l9ZoHX9vYkOtdjS57D5DSwk/iH5Q8kiQDSyjnbd
 q5yHBoXdxBJ2mfdufoIQoRQ/3PaV+eLWLVBFvCNgy+X8GwdTclSGLNURAEp/Nd3bvGAk
 Rn1pWcKtpZojx/ERuAjlKEhIBbUz1Lz5a0CtErulcFmzLAxPAGGPYuuisNFcCk5KlnyS
 R3fORAtvjD+Bhu3H2jf3L3y/xgBSJ3esDFldCaQ3N6J5D9DT2vDRjqudqxB0eYvw6Kew
 uaRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUThnJ5IvVxllsoq/aNiyi545xj6BU/CUtMBmyL+11ipu64MAVDhhLppof3RIsTehsw1KqPrLtdj+I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz2fmcRBYoP8XamZhBn/pmogKjWoEspRXLhj7uyljRwmbjNU5l6
 mOjpRxPd1lVdNb1n3DHCWM/p/VKzszhK7IY9Epk2KaFoZueENvykIKtO+uq3ZfI1rCR8Tt6JLfb
 TOThDMqn9uNxLdCYxuV6FFvT6qle4pp5sRtoL6rLb7GyaJF0UQgW8+K89S8ntH+duBg==
X-Gm-Gg: ASbGncsBKsL1Wc/GhL6p9TKZZZQczvmDNt2CLw4tYjzybST4CfLjAmpcqhlEZZyIg9D
 j7+R323dOA1FvRQEgB9M4+ZIDRm+6Il/0WOl2Pt+gV4mEMNjZTq/ZWLkMSBykO1DnbXkOmwv75m
 FuJydH/npV2Cl0uvaLo5osoBJHvGgrQc5lMIwEbTFCbxvx8N4U+iEFSVh75P5Q9bG7GaO61rKpj
 pA2pCXA85alV1dFLxHihBkrTnPmZ33xsDSPe6HSVNixB8GTMvhdGotO/lB7CRPUi0LfSFahlQFY
 H5NHe22Codkd6Y2vanRH
X-Received: by 2002:a05:600c:1f8e:b0:435:d22:9c9e with SMTP id
 5b1f17b1804b1-4389141c352mr169489955e9.19.1737557338426; 
 Wed, 22 Jan 2025 06:48:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMWFKWBRExA8O4Zr3kYeHT/dLy5B6fLPNBx04niYQty7L4FTKE49zaATrkZkvvgtuZ2WwHLg==
X-Received: by 2002:a05:600c:1f8e:b0:435:d22:9c9e with SMTP id
 5b1f17b1804b1-4389141c352mr169489565e9.19.1737557337737; 
 Wed, 22 Jan 2025 06:48:57 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438b31c8764sm26761145e9.38.2025.01.22.06.48.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 06:48:57 -0800 (PST)
Message-ID: <5fe5160c06d3648d9bcff7bdc52a0167d05271d7.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
From: Philipp Stanner <pstanner@redhat.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Philipp
 Stanner <phasta@kernel.org>, Alex Deucher <alexander.deucher@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>, Russell
 King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>,  Frank Binns <frank.binns@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>, Rob
 Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>, Dmitry
 Baryshkov <dmitry.baryshkov@linaro.org>,  Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>,  Danilo Krummrich <dakr@kernel.org>, Boris
 Brezillon <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>, Melissa Wen <mwen@igalia.com>, 
 =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Thomas =?ISO-8859-1?Q?Hellstr=F6m?=
 <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sunil Khatri <sunil.khatri@amd.com>,  Lijo Lazar <lijo.lazar@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, Ma Jun <Jun.Ma2@amd.com>, 
 Yunxiang Li <Yunxiang.Li@amd.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org, 
 lima@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Date: Wed, 22 Jan 2025 15:48:54 +0100
In-Reply-To: <f149ca5c-b30a-4a24-82dd-c0b5e99a34e5@amd.com>
References: <20250122140818.45172-3-phasta@kernel.org>
 <f149ca5c-b30a-4a24-82dd-c0b5e99a34e5@amd.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zBttfr3KSAsfHpqK2UF34FzLQLf7MauCObeCBMQsem8_1737557339
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

On Wed, 2025-01-22 at 15:34 +0100, Christian K=C3=B6nig wrote:
> Am 22.01.25 um 15:08 schrieb Philipp Stanner:
> > drm_sched_init() has a great many parameters and upcoming new
> > functionality for the scheduler might add even more. Generally, the
> > great number of parameters reduces readability and has already
> > caused
> > one missnaming in:
> >=20
> > commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in
> > nouveau_sched_init()").
> >=20
> > Introduce a new struct for the scheduler init parameters and port
> > all
> > users.
> >=20
> > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > ---
> > Howdy,
> >=20
> > I have a patch-series in the pipe that will add a `flags` argument
> > to
> > drm_sched_init(). I thought it would be wise to first rework the
> > API as
> > detailed in this patch. It's really a lot of parameters by now, and
> > I
> > would expect that it might get more and more over the years for
> > special
> > use cases etc.
> >=20
> > Regards,
> > P.
> > ---
> > =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |=C2=A0 21 +++-
> > =C2=A0 drivers/gpu/drm/etnaviv/etnaviv_sched.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 20 ++-
> > =C2=A0 drivers/gpu/drm/imagination/pvr_queue.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 21 +++-
> > =C2=A0 drivers/gpu/drm/lima/lima_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 21 +++-
> > =C2=A0 drivers/gpu/drm/msm/msm_ringbuffer.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 22 ++--
> > =C2=A0 drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 20 ++-
> > =C2=A0 drivers/gpu/drm/panfrost/panfrost_job.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 22 ++--
> > =C2=A0 drivers/gpu/drm/panthor/panthor_mmu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 18 ++-
> > =C2=A0 drivers/gpu/drm/panthor/panthor_sched.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 23 ++--
> > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 53 +++-----
> > =C2=A0 drivers/gpu/drm/v3d/v3d_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 135 +++++++++++++++-
> > -----
> > =C2=A0 drivers/gpu/drm/xe/xe_execlist.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 20 ++-
> > =C2=A0 drivers/gpu/drm/xe/xe_gpu_scheduler.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0 19 ++-
> > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 35 +++++-
> > =C2=A0 14 files changed, 311 insertions(+), 139 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > index cd4fac120834..c1f03eb5f5ea 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> > @@ -2821,6 +2821,9 @@ static int
> > amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> > =C2=A0 {
> > =C2=A0=C2=A0=09long timeout;
> > =C2=A0=C2=A0=09int r, i;
> > +=09struct drm_sched_init_params params;
>=20
> Please keep the reverse xmas tree ordering for variable declaration.=20
> E.g. long lines first and variables like "i" and "r" last.

Okay dokay

>=20
> Apart from that looks like a good idea to me.
>=20
>=20
> > +
> > +=09memset(&params, 0, sizeof(struct drm_sched_init_params));
> > =C2=A0=20
> > =C2=A0=C2=A0=09for (i =3D 0; i < AMDGPU_MAX_RINGS; ++i) {
> > =C2=A0=C2=A0=09=09struct amdgpu_ring *ring =3D adev->rings[i];
> > @@ -2844,12 +2847,18 @@ static int
> > amdgpu_device_init_schedulers(struct amdgpu_device *adev)
> > =C2=A0=C2=A0=09=09=09break;
> > =C2=A0=C2=A0=09=09}
> > =C2=A0=20
> > -=09=09r =3D drm_sched_init(&ring->sched,
> > &amdgpu_sched_ops, NULL,
> > -=09=09=09=09=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -=09=09=09=09=C2=A0=C2=A0 ring->num_hw_submission, 0,
> > -=09=09=09=09=C2=A0=C2=A0 timeout, adev->reset_domain-
> > >wq,
> > -=09=09=09=09=C2=A0=C2=A0 ring->sched_score, ring->name,
> > -=09=09=09=09=C2=A0=C2=A0 adev->dev);
> > +=09=09params.ops =3D &amdgpu_sched_ops;
> > +=09=09params.submit_wq =3D NULL; /* Use the system_wq. */
> > +=09=09params.num_rqs =3D DRM_SCHED_PRIORITY_COUNT;
> > +=09=09params.credit_limit =3D ring->num_hw_submission;
> > +=09=09params.hang_limit =3D 0;
>=20
> Could we please remove the hang limit as first step to get this awful
> feature deprecated?

Remove it? From the struct you mean?

We can mark it as deprecated in the docstring of the new struct. That's
what you mean, don't you?

P.

>=20
> Thanks,
> Christian.
>=20
> > +=09=09params.timeout =3D timeout;
> > +=09=09params.timeout_wq =3D adev->reset_domain->wq;
> > +=09=09params.score =3D ring->sched_score;
> > +=09=09params.name =3D ring->name;
> > +=09=09params.dev =3D adev->dev;
> > +
> > +=09=09r =3D drm_sched_init(&ring->sched, &params);
> > =C2=A0=C2=A0=09=09if (r) {
> > =C2=A0=C2=A0=09=09=09DRM_ERROR("Failed to create scheduler on
> > ring %s.\n",
> > =C2=A0=C2=A0=09=09=09=09=C2=A0 ring->name);
> > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > index 5b67eda122db..7d8517f1963e 100644
> > --- a/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > +++ b/drivers/gpu/drm/etnaviv/etnaviv_sched.c
> > @@ -145,12 +145,22 @@ int etnaviv_sched_push_job(struct
> > etnaviv_gem_submit *submit)
> > =C2=A0 int etnaviv_sched_init(struct etnaviv_gpu *gpu)
> > =C2=A0 {
> > =C2=A0=C2=A0=09int ret;
> > +=09struct drm_sched_init_params params;
> > =C2=A0=20
> > -=09ret =3D drm_sched_init(&gpu->sched, &etnaviv_sched_ops,
> > NULL,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 etnaviv_hw_jobs_limit,
> > etnaviv_job_hang_limit,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(500), NULL, NULL,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 dev_name(gpu->dev), gpu->dev);
> > +=09memset(&params, 0, sizeof(struct drm_sched_init_params));
> > +
> > +=09params.ops =3D &etnaviv_sched_ops;
> > +=09params.submit_wq =3D NULL; /* Use the system_wq. */
> > +=09params.num_rqs =3D DRM_SCHED_PRIORITY_COUNT;
> > +=09params.credit_limit =3D etnaviv_hw_jobs_limit;
> > +=09params.hang_limit =3D etnaviv_job_hang_limit;
> > +=09params.timeout =3D msecs_to_jiffies(500);
> > +=09params.timeout_wq =3D NULL; /* Use the system_wq. */
> > +=09params.score =3D NULL;
> > +=09params.name =3D dev_name(gpu->dev);
> > +=09params.dev =3D gpu->dev;
> > +
> > +=09ret =3D drm_sched_init(&gpu->sched, &params);
> > =C2=A0=C2=A0=09if (ret)
> > =C2=A0=C2=A0=09=09return ret;
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/imagination/pvr_queue.c
> > b/drivers/gpu/drm/imagination/pvr_queue.c
> > index c4f08432882b..03a2ce1a88e7 100644
> > --- a/drivers/gpu/drm/imagination/pvr_queue.c
> > +++ b/drivers/gpu/drm/imagination/pvr_queue.c
> > @@ -1211,10 +1211,13 @@ struct pvr_queue *pvr_queue_create(struct
> > pvr_context *ctx,
> > =C2=A0=C2=A0=09};
> > =C2=A0=C2=A0=09struct pvr_device *pvr_dev =3D ctx->pvr_dev;
> > =C2=A0=C2=A0=09struct drm_gpu_scheduler *sched;
> > +=09struct drm_sched_init_params sched_params;
> > =C2=A0=C2=A0=09struct pvr_queue *queue;
> > =C2=A0=C2=A0=09int ctx_state_size, err;
> > =C2=A0=C2=A0=09void *cpu_map;
> > =C2=A0=20
> > +=09memset(&sched_params, 0, sizeof(struct
> > drm_sched_init_params));
> > +
> > =C2=A0=C2=A0=09if (WARN_ON(type >=3D sizeof(props)))
> > =C2=A0=C2=A0=09=09return ERR_PTR(-EINVAL);
> > =C2=A0=20
> > @@ -1282,12 +1285,18 @@ struct pvr_queue *pvr_queue_create(struct
> > pvr_context *ctx,
> > =C2=A0=20
> > =C2=A0=C2=A0=09queue->timeline_ufo.value =3D cpu_map;
> > =C2=A0=20
> > -=09err =3D drm_sched_init(&queue->scheduler,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 &pvr_queue_sched_ops,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 pvr_dev->sched_wq, 1, 64 * 1024, 1,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(500),
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 pvr_dev->sched_wq, NULL, "pvr-queue"=
,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 pvr_dev->base.dev);
> > +=09sched_params.ops =3D &pvr_queue_sched_ops;
> > +=09sched_params.submit_wq =3D pvr_dev->sched_wq;
> > +=09sched_params.num_rqs =3D 1;
> > +=09sched_params.credit_limit =3D 64 * 1024;
> > +=09sched_params.hang_limit =3D 1;
> > +=09sched_params.timeout =3D msecs_to_jiffies(500);
> > +=09sched_params.timeout_wq =3D pvr_dev->sched_wq;
> > +=09sched_params.score =3D NULL;
> > +=09sched_params.name =3D "pvr-queue";
> > +=09sched_params.dev =3D pvr_dev->base.dev;
> > +
> > +=09err =3D drm_sched_init(&queue->scheduler, &sched_params);
> > =C2=A0=C2=A0=09if (err)
> > =C2=A0=C2=A0=09=09goto err_release_ufo;
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/lima/lima_sched.c
> > b/drivers/gpu/drm/lima/lima_sched.c
> > index b40c90e97d7e..a64c50fb6d1e 100644
> > --- a/drivers/gpu/drm/lima/lima_sched.c
> > +++ b/drivers/gpu/drm/lima/lima_sched.c
> > @@ -513,20 +513,29 @@ static void lima_sched_recover_work(struct
> > work_struct *work)
> > =C2=A0=20
> > =C2=A0 int lima_sched_pipe_init(struct lima_sched_pipe *pipe, const cha=
r
> > *name)
> > =C2=A0 {
> > +=09struct drm_sched_init_params params;
> > =C2=A0=C2=A0=09unsigned int timeout =3D lima_sched_timeout_ms > 0 ?
> > =C2=A0=C2=A0=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lima_sched_ti=
meout_ms : 10000;
> > =C2=A0=20
> > +=09memset(&params, 0, sizeof(struct drm_sched_init_params));
> > +
> > =C2=A0=C2=A0=09pipe->fence_context =3D dma_fence_context_alloc(1);
> > =C2=A0=C2=A0=09spin_lock_init(&pipe->fence_lock);
> > =C2=A0=20
> > =C2=A0=C2=A0=09INIT_WORK(&pipe->recover_work, lima_sched_recover_work);
> > =C2=A0=20
> > -=09return drm_sched_init(&pipe->base, &lima_sched_ops, NULL,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 1,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lima_job_hang_limit,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(timeout), NUL=
L,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NULL, name, pipe->ldev->dev);
> > +=09params.ops =3D &lima_sched_ops;
> > +=09params.submit_wq =3D NULL; /* Use the system_wq. */
> > +=09params.num_rqs =3D DRM_SCHED_PRIORITY_COUNT;
> > +=09params.credit_limit =3D 1;
> > +=09params.hang_limit =3D lima_job_hang_limit;
> > +=09params.timeout =3D msecs_to_jiffies(timeout);
> > +=09params.timeout_wq =3D NULL; /* Use the system_wq. */
> > +=09params.score =3D NULL;
> > +=09params.name =3D name;
> > +=09params.dev =3D pipe->ldev->dev;
> > +
> > +=09return drm_sched_init(&pipe->base, &params);
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 void lima_sched_pipe_fini(struct lima_sched_pipe *pipe)
> > diff --git a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > index c803556a8f64..49a2c7422dc6 100644
> > --- a/drivers/gpu/drm/msm/msm_ringbuffer.c
> > +++ b/drivers/gpu/drm/msm/msm_ringbuffer.c
> > @@ -59,11 +59,13 @@ static const struct drm_sched_backend_ops
> > msm_sched_ops =3D {
> > =C2=A0 struct msm_ringbuffer *msm_ringbuffer_new(struct msm_gpu *gpu,
> > int id,
> > =C2=A0=C2=A0=09=09void *memptrs, uint64_t memptrs_iova)
> > =C2=A0 {
> > +=09struct drm_sched_init_params params;
> > =C2=A0=C2=A0=09struct msm_ringbuffer *ring;
> > -=09long sched_timeout;
> > =C2=A0=C2=A0=09char name[32];
> > =C2=A0=C2=A0=09int ret;
> > =C2=A0=20
> > +=09memset(&params, 0, sizeof(struct drm_sched_init_params));
> > +
> > =C2=A0=C2=A0=09/* We assume everywhere that MSM_GPU_RINGBUFFER_SZ is a
> > power of 2 */
> > =C2=A0=C2=A0=09BUILD_BUG_ON(!is_power_of_2(MSM_GPU_RINGBUFFER_SZ));
> > =C2=A0=20
> > @@ -95,13 +97,19 @@ struct msm_ringbuffer
> > *msm_ringbuffer_new(struct msm_gpu *gpu, int id,
> > =C2=A0=C2=A0=09ring->memptrs =3D memptrs;
> > =C2=A0=C2=A0=09ring->memptrs_iova =3D memptrs_iova;
> > =C2=A0=20
> > -=09 /* currently managing hangcheck ourselves: */
> > -=09sched_timeout =3D MAX_SCHEDULE_TIMEOUT;
> > +=09params.ops =3D &msm_sched_ops;
> > +=09params.submit_wq =3D NULL; /* Use the system_wq. */
> > +=09params.num_rqs =3D DRM_SCHED_PRIORITY_COUNT;
> > +=09params.credit_limit =3D num_hw_submissions;
> > +=09params.hang_limit =3D 0;
> > +=09/* currently managing hangcheck ourselves: */
> > +=09params.timeout =3D MAX_SCHEDULE_TIMEOUT;
> > +=09params.timeout_wq =3D NULL; /* Use the system_wq. */
> > +=09params.score =3D NULL;
> > +=09params.name =3D to_msm_bo(ring->bo)->name;
> > +=09params.dev =3D gpu->dev->dev;
> > =C2=A0=20
> > -=09ret =3D drm_sched_init(&ring->sched, &msm_sched_ops, NULL,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 num_hw_submissions, 0, sched_timeout=
,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 NULL, NULL, to_msm_bo(ring->bo)-
> > >name, gpu->dev->dev);
> > +=09ret =3D drm_sched_init(&ring->sched, &params);
> > =C2=A0=C2=A0=09if (ret) {
> > =C2=A0=C2=A0=09=09goto fail;
> > =C2=A0=C2=A0=09}
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > index 4412f2711fb5..f20c2e612750 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_sched.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
> > @@ -404,9 +404,11 @@ nouveau_sched_init(struct nouveau_sched
> > *sched, struct nouveau_drm *drm,
> > =C2=A0 {
> > =C2=A0=C2=A0=09struct drm_gpu_scheduler *drm_sched =3D &sched->base;
> > =C2=A0=C2=A0=09struct drm_sched_entity *entity =3D &sched->entity;
> > -=09const long timeout =3D
> > msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
> > +=09struct drm_sched_init_params params;
> > =C2=A0=C2=A0=09int ret;
> > =C2=A0=20
> > +=09memset(&params, 0, sizeof(struct drm_sched_init_params));
> > +
> > =C2=A0=C2=A0=09if (!wq) {
> > =C2=A0=C2=A0=09=09wq =3D alloc_workqueue("nouveau_sched_wq_%d", 0,
> > WQ_MAX_ACTIVE,
> > =C2=A0=C2=A0=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 current->pid);
> > @@ -416,10 +418,18 @@ nouveau_sched_init(struct nouveau_sched
> > *sched, struct nouveau_drm *drm,
> > =C2=A0=C2=A0=09=09sched->wq =3D wq;
> > =C2=A0=C2=A0=09}
> > =C2=A0=20
> > -=09ret =3D drm_sched_init(drm_sched, &nouveau_sched_ops, wq,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 NOUVEAU_SCHED_PRIORITY_COUNT,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 credit_limit, 0, timeout,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 NULL, NULL, "nouveau_sched", drm-
> > >dev->dev);
> > +=09params.ops =3D &nouveau_sched_ops;
> > +=09params.submit_wq =3D wq;
> > +=09params.num_rqs =3D DRM_SCHED_PRIORITY_COUNT;
> > +=09params.credit_limit =3D credit_limit;
> > +=09params.hang_limit =3D 0;
> > +=09params.timeout =3D
> > msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS);
> > +=09params.timeout_wq =3D NULL; /* Use the system_wq. */
> > +=09params.score =3D NULL;
> > +=09params.name =3D "nouveau_sched";
> > +=09params.dev =3D drm->dev->dev;
> > +
> > +=09ret =3D drm_sched_init(drm_sched, &params);
> > =C2=A0=C2=A0=09if (ret)
> > =C2=A0=C2=A0=09=09goto fail_wq;
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c
> > b/drivers/gpu/drm/panfrost/panfrost_job.c
> > index 9b8e82fb8bc4..6b509ff446b5 100644
> > --- a/drivers/gpu/drm/panfrost/panfrost_job.c
> > +++ b/drivers/gpu/drm/panfrost/panfrost_job.c
> > @@ -836,10 +836,13 @@ static irqreturn_t
> > panfrost_job_irq_handler(int irq, void *data)
> > =C2=A0=20
> > =C2=A0 int panfrost_job_init(struct panfrost_device *pfdev)
> > =C2=A0 {
> > +=09struct drm_sched_init_params params;
> > =C2=A0=C2=A0=09struct panfrost_job_slot *js;
> > =C2=A0=C2=A0=09unsigned int nentries =3D 2;
> > =C2=A0=C2=A0=09int ret, j;
> > =C2=A0=20
> > +=09memset(&params, 0, sizeof(struct drm_sched_init_params));
> > +
> > =C2=A0=C2=A0=09/* All GPUs have two entries per queue, but without
> > jobchain
> > =C2=A0=C2=A0=09 * disambiguation stopping the right job in the close pa=
th
> > is tricky,
> > =C2=A0=C2=A0=09 * so let's just advertise one entry in that case.
> > @@ -872,16 +875,21 @@ int panfrost_job_init(struct panfrost_device
> > *pfdev)
> > =C2=A0=C2=A0=09if (!pfdev->reset.wq)
> > =C2=A0=C2=A0=09=09return -ENOMEM;
> > =C2=A0=20
> > +=09params.ops =3D &panfrost_sched_ops;
> > +=09params.submit_wq =3D NULL; /* Use the system_wq. */
> > +=09params.num_rqs =3D DRM_SCHED_PRIORITY_COUNT;
> > +=09params.credit_limit =3D nentries;
> > +=09params.hang_limit =3D 0;
> > +=09params.timeout =3D msecs_to_jiffies(JOB_TIMEOUT_MS);
> > +=09params.timeout_wq =3D pfdev->reset.wq;
> > +=09params.score =3D NULL;
> > +=09params.name =3D "pan_js";
> > +=09params.dev =3D pfdev->dev;
> > +
> > =C2=A0=C2=A0=09for (j =3D 0; j < NUM_JOB_SLOTS; j++) {
> > =C2=A0=C2=A0=09=09js->queue[j].fence_context =3D
> > dma_fence_context_alloc(1);
> > =C2=A0=20
> > -=09=09ret =3D drm_sched_init(&js->queue[j].sched,
> > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 &panfrost_sched_ops, NULL,
> > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 nentries, 0,
> > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0
> > msecs_to_jiffies(JOB_TIMEOUT_MS),
> > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 pfdev->reset.wq,
> > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "pan_js", pfdev->dev);
> > +=09=09ret =3D drm_sched_init(&js->queue[j].sched,
> > &params);
> > =C2=A0=C2=A0=09=09if (ret) {
> > =C2=A0=C2=A0=09=09=09dev_err(pfdev->dev, "Failed to create
> > scheduler: %d.", ret);
> > =C2=A0=C2=A0=09=09=09goto err_sched;
> > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c
> > b/drivers/gpu/drm/panthor/panthor_mmu.c
> > index a49132f3778b..4362442cbfd8 100644
> > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > @@ -2268,6 +2268,7 @@ panthor_vm_create(struct panthor_device
> > *ptdev, bool for_mcu,
> > =C2=A0=C2=A0=09u64 full_va_range =3D 1ull << va_bits;
> > =C2=A0=C2=A0=09struct drm_gem_object *dummy_gem;
> > =C2=A0=C2=A0=09struct drm_gpu_scheduler *sched;
> > +=09struct drm_sched_init_params sched_params;
> > =C2=A0=C2=A0=09struct io_pgtable_cfg pgtbl_cfg;
> > =C2=A0=C2=A0=09u64 mair, min_va, va_range;
> > =C2=A0=C2=A0=09struct panthor_vm *vm;
> > @@ -2284,6 +2285,8 @@ panthor_vm_create(struct panthor_device
> > *ptdev, bool for_mcu,
> > =C2=A0=C2=A0=09=09goto err_free_vm;
> > =C2=A0=C2=A0=09}
> > =C2=A0=20
> > +=09memset(&sched_params, 0, sizeof(struct
> > drm_sched_init_params));
> > +
> > =C2=A0=C2=A0=09mutex_init(&vm->heaps.lock);
> > =C2=A0=C2=A0=09vm->for_mcu =3D for_mcu;
> > =C2=A0=C2=A0=09vm->ptdev =3D ptdev;
> > @@ -2325,11 +2328,18 @@ panthor_vm_create(struct panthor_device
> > *ptdev, bool for_mcu,
> > =C2=A0=C2=A0=09=09goto err_mm_takedown;
> > =C2=A0=C2=A0=09}
> > =C2=A0=20
> > +=09sched_params.ops =3D &panthor_vm_bind_ops;
> > +=09sched_params.submit_wq =3D ptdev->mmu->vm.wq;
> > +=09sched_params.num_rqs =3D 1;
> > +=09sched_params.credit_limit =3D 1;
> > +=09sched_params.hang_limit =3D 0;
> > =C2=A0=C2=A0=09/* Bind operations are synchronous for now, no timeout
> > needed. */
> > -=09ret =3D drm_sched_init(&vm->sched, &panthor_vm_bind_ops,
> > ptdev->mmu->vm.wq,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 1, 1, 0,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 MAX_SCHEDULE_TIMEOUT, NULL, NULL,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 "panthor-vm-bind", ptdev->base.dev);
> > +=09sched_params.timeout =3D MAX_SCHEDULE_TIMEOUT;
> > +=09sched_params.timeout_wq =3D NULL; /* Use the system_wq. */
> > +=09sched_params.score =3D NULL;
> > +=09sched_params.name =3D "panthor-vm-bind";
> > +=09sched_params.dev =3D ptdev->base.dev;
> > +=09ret =3D drm_sched_init(&vm->sched, &sched_params);
> > =C2=A0=C2=A0=09if (ret)
> > =C2=A0=C2=A0=09=09goto err_free_io_pgtable;
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c
> > b/drivers/gpu/drm/panthor/panthor_sched.c
> > index ef4bec7ff9c7..a324346d302f 100644
> > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > @@ -3272,6 +3272,7 @@ group_create_queue(struct panthor_group
> > *group,
> > =C2=A0=C2=A0=09=09=C2=A0=C2=A0 const struct drm_panthor_queue_create *a=
rgs)
> > =C2=A0 {
> > =C2=A0=C2=A0=09struct drm_gpu_scheduler *drm_sched;
> > +=09struct drm_sched_init_params sched_params;
> > =C2=A0=C2=A0=09struct panthor_queue *queue;
> > =C2=A0=C2=A0=09int ret;
> > =C2=A0=20
> > @@ -3289,6 +3290,8 @@ group_create_queue(struct panthor_group
> > *group,
> > =C2=A0=C2=A0=09if (!queue)
> > =C2=A0=C2=A0=09=09return ERR_PTR(-ENOMEM);
> > =C2=A0=20
> > +=09memset(&sched_params, 0, sizeof(struct
> > drm_sched_init_params));
> > +
> > =C2=A0=C2=A0=09queue->fence_ctx.id =3D dma_fence_context_alloc(1);
> > =C2=A0=C2=A0=09spin_lock_init(&queue->fence_ctx.lock);
> > =C2=A0=C2=A0=09INIT_LIST_HEAD(&queue->fence_ctx.in_flight_jobs);
> > @@ -3341,17 +3344,23 @@ group_create_queue(struct panthor_group
> > *group,
> > =C2=A0=C2=A0=09if (ret)
> > =C2=A0=C2=A0=09=09goto err_free_queue;
> > =C2=A0=20
> > +=09sched_params.ops =3D &panthor_queue_sched_ops;
> > +=09sched_params.submit_wq =3D group->ptdev->scheduler->wq;
> > +=09sched_params.num_rqs =3D 1;
> > =C2=A0=C2=A0=09/*
> > -=09 * Credit limit argument tells us the total number of
> > instructions
> > +=09 * The credit limit argument tells us the total number of
> > instructions
> > =C2=A0=C2=A0=09 * across all CS slots in the ringbuffer, with some jobs
> > requiring
> > =C2=A0=C2=A0=09 * twice as many as others, depending on their profiling
> > status.
> > =C2=A0=C2=A0=09 */
> > -=09ret =3D drm_sched_init(&queue->scheduler,
> > &panthor_queue_sched_ops,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 group->ptdev->scheduler->wq, 1,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 args->ringbuf_size / sizeof(u64),
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 0, msecs_to_jiffies(JOB_TIMEOUT_MS),
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 group->ptdev->reset.wq,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "panthor-queue", group->ptdev-
> > >base.dev);
> > +=09sched_params.credit_limit =3D args->ringbuf_size /
> > sizeof(u64);
> > +=09sched_params.hang_limit =3D 0;
> > +=09sched_params.timeout =3D msecs_to_jiffies(JOB_TIMEOUT_MS);
> > +=09sched_params.timeout_wq =3D group->ptdev->reset.wq;
> > +=09sched_params.score =3D NULL;
> > +=09sched_params.name =3D "panthor-queue";
> > +=09sched_params.dev =3D group->ptdev->base.dev;
> > +
> > +=09ret =3D drm_sched_init(&queue->scheduler, &sched_params);
> > =C2=A0=C2=A0=09if (ret)
> > =C2=A0=C2=A0=09=09goto err_free_queue;
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> > b/drivers/gpu/drm/scheduler/sched_main.c
> > index 57da84908752..27db748a5269 100644
> > --- a/drivers/gpu/drm/scheduler/sched_main.c
> > +++ b/drivers/gpu/drm/scheduler/sched_main.c
> > @@ -1240,40 +1240,25 @@ static void drm_sched_run_job_work(struct
> > work_struct *w)
> > =C2=A0=C2=A0 * drm_sched_init - Init a gpu scheduler instance
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * @sched: scheduler instance
> > - * @ops: backend operations for this scheduler
> > - * @submit_wq: workqueue to use for submission. If NULL, an
> > ordered wq is
> > - *=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allocated and used
> > - * @num_rqs: number of runqueues, one for each priority, up to
> > DRM_SCHED_PRIORITY_COUNT
> > - * @credit_limit: the number of credits this scheduler can hold
> > from all jobs
> > - * @hang_limit: number of times to allow a job to hang before
> > dropping it
> > - * @timeout: timeout value in jiffies for the scheduler
> > - * @timeout_wq: workqueue to use for timeout work. If NULL, the
> > system_wq is
> > - *=09=09used
> > - * @score: optional score atomic shared with other schedulers
> > - * @name: name used for debugging
> > - * @dev: target &struct device
> > + * @params: scheduler initialization parameters
> > =C2=A0=C2=A0 *
> > =C2=A0=C2=A0 * Return 0 on success, otherwise error code.
> > =C2=A0=C2=A0 */
> > =C2=A0 int drm_sched_init(struct drm_gpu_scheduler *sched,
> > -=09=09=C2=A0=C2=A0 const struct drm_sched_backend_ops *ops,
> > -=09=09=C2=A0=C2=A0 struct workqueue_struct *submit_wq,
> > -=09=09=C2=A0=C2=A0 u32 num_rqs, u32 credit_limit, unsigned int
> > hang_limit,
> > -=09=09=C2=A0=C2=A0 long timeout, struct workqueue_struct
> > *timeout_wq,
> > -=09=09=C2=A0=C2=A0 atomic_t *score, const char *name, struct
> > device *dev)
> > +=09=09const struct drm_sched_init_params *params)
> > =C2=A0 {
> > =C2=A0=C2=A0=09int i;
> > =C2=A0=20
> > -=09sched->ops =3D ops;
> > -=09sched->credit_limit =3D credit_limit;
> > -=09sched->name =3D name;
> > -=09sched->timeout =3D timeout;
> > -=09sched->timeout_wq =3D timeout_wq ? : system_wq;
> > -=09sched->hang_limit =3D hang_limit;
> > -=09sched->score =3D score ? score : &sched->_score;
> > -=09sched->dev =3D dev;
> > +=09sched->ops =3D params->ops;
> > +=09sched->credit_limit =3D params->credit_limit;
> > +=09sched->name =3D params->name;
> > +=09sched->timeout =3D params->timeout;
> > +=09sched->timeout_wq =3D params->timeout_wq ? : system_wq;
> > +=09sched->hang_limit =3D params->hang_limit;
> > +=09sched->score =3D params->score ? params->score : &sched-
> > >_score;
> > +=09sched->dev =3D params->dev;
> > =C2=A0=20
> > -=09if (num_rqs > DRM_SCHED_PRIORITY_COUNT) {
> > +=09if (params->num_rqs > DRM_SCHED_PRIORITY_COUNT) {
> > =C2=A0=C2=A0=09=09/* This is a gross violation--tell drivers what
> > the=C2=A0 problem is.
> > =C2=A0=C2=A0=09=09 */
> > =C2=A0=C2=A0=09=09drm_err(sched, "%s: num_rqs cannot be greater than
> > DRM_SCHED_PRIORITY_COUNT\n",
> > @@ -1288,16 +1273,16 @@ int drm_sched_init(struct drm_gpu_scheduler
> > *sched,
> > =C2=A0=C2=A0=09=09return 0;
> > =C2=A0=C2=A0=09}
> > =C2=A0=20
> > -=09if (submit_wq) {
> > -=09=09sched->submit_wq =3D submit_wq;
> > +=09if (params->submit_wq) {
> > +=09=09sched->submit_wq =3D params->submit_wq;
> > =C2=A0=C2=A0=09=09sched->own_submit_wq =3D false;
> > =C2=A0=C2=A0=09} else {
> > =C2=A0 #ifdef CONFIG_LOCKDEP
> > -=09=09sched->submit_wq =3D
> > alloc_ordered_workqueue_lockdep_map(name,
> > -
> > =09=09=09=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WQ_MEM_REC=
LAIM,
> > -
> > =09=09=09=09=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &drm_sched=
_lockdep_map);
> > +=09=09sched->submit_wq =3D
> > alloc_ordered_workqueue_lockdep_map(
> > +=09=09=09=09=09params->name,
> > WQ_MEM_RECLAIM,
> > +=09=09=09=09=09&drm_sched_lockdep_map);
> > =C2=A0 #else
> > -=09=09sched->submit_wq =3D alloc_ordered_workqueue(name,
> > WQ_MEM_RECLAIM);
> > +=09=09sched->submit_wq =3D alloc_ordered_workqueue(params-
> > >name, WQ_MEM_RECLAIM);
> > =C2=A0 #endif
> > =C2=A0=C2=A0=09=09if (!sched->submit_wq)
> > =C2=A0=C2=A0=09=09=09return -ENOMEM;
> > @@ -1305,11 +1290,11 @@ int drm_sched_init(struct drm_gpu_scheduler
> > *sched,
> > =C2=A0=C2=A0=09=09sched->own_submit_wq =3D true;
> > =C2=A0=C2=A0=09}
> > =C2=A0=20
> > -=09sched->sched_rq =3D kmalloc_array(num_rqs, sizeof(*sched-
> > >sched_rq),
> > +=09sched->sched_rq =3D kmalloc_array(params->num_rqs,
> > sizeof(*sched->sched_rq),
> > =C2=A0=C2=A0=09=09=09=09=09GFP_KERNEL | __GFP_ZERO);
> > =C2=A0=C2=A0=09if (!sched->sched_rq)
> > =C2=A0=C2=A0=09=09goto Out_check_own;
> > -=09sched->num_rqs =3D num_rqs;
> > +=09sched->num_rqs =3D params->num_rqs;
> > =C2=A0=C2=A0=09for (i =3D DRM_SCHED_PRIORITY_KERNEL; i < sched->num_rqs=
;
> > i++) {
> > =C2=A0=C2=A0=09=09sched->sched_rq[i] =3D kzalloc(sizeof(*sched-
> > >sched_rq[i]), GFP_KERNEL);
> > =C2=A0=C2=A0=09=09if (!sched->sched_rq[i])
> > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
> > b/drivers/gpu/drm/v3d/v3d_sched.c
> > index 99ac4995b5a1..716e6d074d87 100644
> > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > @@ -814,67 +814,124 @@ static const struct drm_sched_backend_ops
> > v3d_cpu_sched_ops =3D {
> > =C2=A0=C2=A0=09.free_job =3D v3d_cpu_job_free
> > =C2=A0 };
> > =C2=A0=20
> > +/*
> > + * v3d's scheduler instances are all identical, except for ops and
> > name.
> > + */
> > +static void
> > +v3d_common_sched_init(struct drm_sched_init_params *params, struct
> > device *dev)
> > +{
> > +=09memset(params, 0, sizeof(struct drm_sched_init_params));
> > +
> > +=09params->submit_wq =3D NULL; /* Use the system_wq. */
> > +=09params->num_rqs =3D DRM_SCHED_PRIORITY_COUNT;
> > +=09params->credit_limit =3D 1;
> > +=09params->hang_limit =3D 0;
> > +=09params->timeout =3D msecs_to_jiffies(500);
> > +=09params->timeout_wq =3D NULL; /* Use the system_wq. */
> > +=09params->score =3D NULL;
> > +=09params->dev =3D dev;
> > +}
> > +
> > +static int
> > +v3d_bin_sched_init(struct v3d_dev *v3d)
> > +{
> > +=09struct drm_sched_init_params params;
> > +
> > +=09v3d_common_sched_init(&params, v3d->drm.dev);
> > +=09params.ops =3D &v3d_bin_sched_ops;
> > +=09params.name =3D "v3d_bin";
> > +
> > +=09return drm_sched_init(&v3d->queue[V3D_BIN].sched,
> > &params);
> > +}
> > +
> > +static int
> > +v3d_render_sched_init(struct v3d_dev *v3d)
> > +{
> > +=09struct drm_sched_init_params params;
> > +
> > +=09v3d_common_sched_init(&params, v3d->drm.dev);
> > +=09params.ops =3D &v3d_render_sched_ops;
> > +=09params.name =3D "v3d_render";
> > +
> > +=09return drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> > &params);
> > +}
> > +
> > +static int
> > +v3d_tfu_sched_init(struct v3d_dev *v3d)
> > +{
> > +=09struct drm_sched_init_params params;
> > +
> > +=09v3d_common_sched_init(&params, v3d->drm.dev);
> > +=09params.ops =3D &v3d_tfu_sched_ops;
> > +=09params.name =3D "v3d_tfu";
> > +
> > +=09return drm_sched_init(&v3d->queue[V3D_TFU].sched,
> > &params);
> > +}
> > +
> > +static int
> > +v3d_csd_sched_init(struct v3d_dev *v3d)
> > +{
> > +=09struct drm_sched_init_params params;
> > +
> > +=09v3d_common_sched_init(&params, v3d->drm.dev);
> > +=09params.ops =3D &v3d_csd_sched_ops;
> > +=09params.name =3D "v3d_csd";
> > +
> > +=09return drm_sched_init(&v3d->queue[V3D_CSD].sched,
> > &params);
> > +}
> > +
> > +static int
> > +v3d_cache_sched_init(struct v3d_dev *v3d)
> > +{
> > +=09struct drm_sched_init_params params;
> > +
> > +=09v3d_common_sched_init(&params, v3d->drm.dev);
> > +=09params.ops =3D &v3d_cache_clean_sched_ops;
> > +=09params.name =3D "v3d_cache_clean";
> > +
> > +=09return drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
> > &params);
> > +}
> > +
> > +static int
> > +v3d_cpu_sched_init(struct v3d_dev *v3d)
> > +{
> > +=09struct drm_sched_init_params params;
> > +
> > +=09v3d_common_sched_init(&params, v3d->drm.dev);
> > +=09params.ops =3D &v3d_cpu_sched_ops;
> > +=09params.name =3D "v3d_cpu";
> > +
> > +=09return drm_sched_init(&v3d->queue[V3D_CPU].sched,
> > &params);
> > +}
> > +
> > =C2=A0 int
> > =C2=A0 v3d_sched_init(struct v3d_dev *v3d)
> > =C2=A0 {
> > -=09int hw_jobs_limit =3D 1;
> > -=09int job_hang_limit =3D 0;
> > -=09int hang_limit_ms =3D 500;
> > =C2=A0=C2=A0=09int ret;
> > =C2=A0=20
> > -=09ret =3D drm_sched_init(&v3d->queue[V3D_BIN].sched,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_bin_sched_ops, NULL,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit, job_hang_limit,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms),
> > NULL,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_bin", v3d->drm.dev);
> > +=09ret =3D v3d_bin_sched_init(v3d);
> > =C2=A0=C2=A0=09if (ret)
> > =C2=A0=C2=A0=09=09return ret;
> > =C2=A0=20
> > -=09ret =3D drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_render_sched_ops, NULL,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit, job_hang_limit,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms),
> > NULL,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_render", v3d->drm.dev);
> > +=09ret =3D v3d_render_sched_init(v3d);
> > =C2=A0=C2=A0=09if (ret)
> > =C2=A0=C2=A0=09=09goto fail;
> > =C2=A0=20
> > -=09ret =3D drm_sched_init(&v3d->queue[V3D_TFU].sched,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_tfu_sched_ops, NULL,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit, job_hang_limit,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms),
> > NULL,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_tfu", v3d->drm.dev);
> > +=09ret =3D v3d_tfu_sched_init(v3d);
> > =C2=A0=C2=A0=09if (ret)
> > =C2=A0=C2=A0=09=09goto fail;
> > =C2=A0=20
> > =C2=A0=C2=A0=09if (v3d_has_csd(v3d)) {
> > -=09=09ret =3D drm_sched_init(&v3d->queue[V3D_CSD].sched,
> > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_csd_sched_ops, NULL,
> > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit,
> > job_hang_limit,
> > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0
> > msecs_to_jiffies(hang_limit_ms), NULL,
> > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_csd", v3d-
> > >drm.dev);
> > +=09=09ret =3D v3d_csd_sched_init(v3d);
> > =C2=A0=C2=A0=09=09if (ret)
> > =C2=A0=C2=A0=09=09=09goto fail;
> > =C2=A0=20
> > -=09=09ret =3D drm_sched_init(&v3d-
> > >queue[V3D_CACHE_CLEAN].sched,
> > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_cache_clean_sched_ops,
> > NULL,
> > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit,
> > job_hang_limit,
> > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0
> > msecs_to_jiffies(hang_limit_ms), NULL,
> > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_cache_clean", v3d-
> > >drm.dev);
> > +=09=09ret =3D v3d_cache_sched_init(v3d);
> > =C2=A0=C2=A0=09=09if (ret)
> > =C2=A0=C2=A0=09=09=09goto fail;
> > =C2=A0=C2=A0=09}
> > =C2=A0=20
> > -=09ret =3D drm_sched_init(&v3d->queue[V3D_CPU].sched,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_cpu_sched_ops, NULL,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 1, job_hang_limit,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms),
> > NULL,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_cpu", v3d->drm.dev);
> > +=09ret =3D v3d_cpu_sched_init(v3d);
> > =C2=A0=C2=A0=09if (ret)
> > =C2=A0=C2=A0=09=09goto fail;
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/xe/xe_execlist.c
> > b/drivers/gpu/drm/xe/xe_execlist.c
> > index a8c416a48812..7f29b7f04af4 100644
> > --- a/drivers/gpu/drm/xe/xe_execlist.c
> > +++ b/drivers/gpu/drm/xe/xe_execlist.c
> > @@ -332,10 +332,13 @@ static const struct drm_sched_backend_ops
> > drm_sched_ops =3D {
> > =C2=A0 static int execlist_exec_queue_init(struct xe_exec_queue *q)
> > =C2=A0 {
> > =C2=A0=C2=A0=09struct drm_gpu_scheduler *sched;
> > +=09struct drm_sched_init_params params;
> > =C2=A0=C2=A0=09struct xe_execlist_exec_queue *exl;
> > =C2=A0=C2=A0=09struct xe_device *xe =3D gt_to_xe(q->gt);
> > =C2=A0=C2=A0=09int err;
> > =C2=A0=20
> > +=09memset(&params, 0, sizeof(struct drm_sched_init_params));
> > +
> > =C2=A0=C2=A0=09xe_assert(xe, !xe_device_uc_enabled(xe));
> > =C2=A0=20
> > =C2=A0=C2=A0=09drm_info(&xe->drm, "Enabling execlist submission (GuC
> > submission disabled)\n");
> > @@ -346,11 +349,18 @@ static int execlist_exec_queue_init(struct
> > xe_exec_queue *q)
> > =C2=A0=20
> > =C2=A0=C2=A0=09exl->q =3D q;
> > =C2=A0=20
> > -=09err =3D drm_sched_init(&exl->sched, &drm_sched_ops, NULL, 1,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 q->lrc[0]->ring.size /
> > MAX_JOB_SIZE_BYTES,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 XE_SCHED_HANG_LIMIT,
> > XE_SCHED_JOB_TIMEOUT,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 NULL, NULL, q->hwe->name,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 gt_to_xe(q->gt)->drm.dev);
> > +=09params.ops =3D &drm_sched_ops;
> > +=09params.submit_wq =3D NULL; /* Use the system_wq. */
> > +=09params.num_rqs =3D 1;
> > +=09params.credit_limit =3D q->lrc[0]->ring.size /
> > MAX_JOB_SIZE_BYTES;
> > +=09params.hang_limit =3D XE_SCHED_HANG_LIMIT;
> > +=09params.timeout =3D XE_SCHED_JOB_TIMEOUT;
> > +=09params.timeout_wq =3D NULL; /* Use the system_wq. */
> > +=09params.score =3D NULL;
> > +=09params.name =3D q->hwe->name;
> > +=09params.dev =3D gt_to_xe(q->gt)->drm.dev;
> > +
> > +=09err =3D drm_sched_init(&exl->sched, &params);
> > =C2=A0=C2=A0=09if (err)
> > =C2=A0=C2=A0=09=09goto err_free;
> > =C2=A0=20
> > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > index 50361b4638f9..2129fee83f25 100644
> > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > @@ -63,13 +63,26 @@ int xe_sched_init(struct xe_gpu_scheduler
> > *sched,
> > =C2=A0=C2=A0=09=09=C2=A0 atomic_t *score, const char *name,
> > =C2=A0=C2=A0=09=09=C2=A0 struct device *dev)
> > =C2=A0 {
> > +=09struct drm_sched_init_params params;
> > +
> > =C2=A0=C2=A0=09sched->ops =3D xe_ops;
> > =C2=A0=C2=A0=09INIT_LIST_HEAD(&sched->msgs);
> > =C2=A0=C2=A0=09INIT_WORK(&sched->work_process_msg,
> > xe_sched_process_msg_work);
> > =C2=A0=20
> > -=09return drm_sched_init(&sched->base, ops, submit_wq, 1,
> > hw_submission,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hang_limit, timeout, timeout_w=
q,
> > score, name,
> > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev);
> > +=09memset(&params, 0, sizeof(struct drm_sched_init_params));
> > +
> > +=09params.ops =3D ops;
> > +=09params.submit_wq =3D submit_wq;
> > +=09params.num_rqs =3D 1;
> > +=09params.credit_limit =3D hw_submission;
> > +=09params.hang_limit =3D hang_limit;
> > +=09params.timeout =3D timeout;
> > +=09params.timeout_wq =3D timeout_wq;
> > +=09params.score =3D score;
> > +=09params.name =3D name;
> > +=09params.dev =3D dev;
> > +
> > +=09return drm_sched_init(&sched->base, &params);
> > =C2=A0 }
> > =C2=A0=20
> > =C2=A0 void xe_sched_fini(struct xe_gpu_scheduler *sched)
> > diff --git a/include/drm/gpu_scheduler.h
> > b/include/drm/gpu_scheduler.h
> > index 95e17504e46a..1a834ef43862 100644
> > --- a/include/drm/gpu_scheduler.h
> > +++ b/include/drm/gpu_scheduler.h
> > @@ -553,12 +553,37 @@ struct drm_gpu_scheduler {
> > =C2=A0=C2=A0=09struct device=09=09=09*dev;
> > =C2=A0 };
> > =C2=A0=20
> > +/**
> > + * struct drm_sched_init_params - parameters for initializing a
> > DRM GPU scheduler
> > + *
> > + * @ops: backend operations provided by the driver
> > + * @submit_wq: workqueue to use for submission. If NULL, an
> > ordered wq is
> > + *=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 allocated and used
> > + * @num_rqs: Number of run-queues. This is at most
> > DRM_SCHED_PRIORITY_COUNT,
> > + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 as ther=
e's usually one run-queue per priority, but
> > could be less.
> > + * @credit_limit: the number of credits this scheduler can hold
> > from all jobs
> > + * @hang_limit: number of times to allow a job to hang before
> > dropping it
> > + * @timeout: timeout value in jiffies for the scheduler
> > + * @timeout_wq: workqueue to use for timeout work. If NULL, the
> > system_wq is
> > + *=09=09used
> > + * @score: optional score atomic shared with other schedulers
> > + * @name: name used for debugging
> > + * @dev: associated device. Used for debugging
> > + */
> > +struct drm_sched_init_params {
> > +=09const struct drm_sched_backend_ops *ops;
> > +=09struct workqueue_struct *submit_wq;
> > +=09struct workqueue_struct *timeout_wq;
> > +=09u32 num_rqs, credit_limit;
> > +=09unsigned int hang_limit;
> > +=09long timeout;
> > +=09atomic_t *score;
> > +=09const char *name;
> > +=09struct device *dev;
> > +};
> > +
> > =C2=A0 int drm_sched_init(struct drm_gpu_scheduler *sched,
> > -=09=09=C2=A0=C2=A0 const struct drm_sched_backend_ops *ops,
> > -=09=09=C2=A0=C2=A0 struct workqueue_struct *submit_wq,
> > -=09=09=C2=A0=C2=A0 u32 num_rqs, u32 credit_limit, unsigned int
> > hang_limit,
> > -=09=09=C2=A0=C2=A0 long timeout, struct workqueue_struct
> > *timeout_wq,
> > -=09=09=C2=A0=C2=A0 atomic_t *score, const char *name, struct
> > device *dev);
> > +=09=09const struct drm_sched_init_params *params);
> > =C2=A0=20
> > =C2=A0 void drm_sched_fini(struct drm_gpu_scheduler *sched);
> > =C2=A0 int drm_sched_job_init(struct drm_sched_job *job,
>=20

