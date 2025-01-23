Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6784BA1A00C
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 09:40:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D72A10E799;
	Thu, 23 Jan 2025 08:40:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="A8GlIxEI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60BEE10E79F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 08:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737621606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cVF1BWLlfkLfyAreYK9ftlrXj/sspdG9aDWb4HVECMw=;
 b=A8GlIxEIDfrhdCKEo7C4x4WMafrBHzaCQ4X6YY+k1MOQN2UC0ueHheXDCt6OralQXNgpWF
 sE2MhKEZLqj0xF+3YsXj5Y0dprLinHYBRoacydjyvok3unRiqjCIicSnVhfSw1febEdOlk
 vCExs9q5dIWWeODbUes8Pb6GOMpIYVs=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-LKW4frj8PPGYvLM5D03i9A-1; Thu, 23 Jan 2025 03:40:05 -0500
X-MC-Unique: LKW4frj8PPGYvLM5D03i9A-1
X-Mimecast-MFC-AGG-ID: LKW4frj8PPGYvLM5D03i9A
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-21655569152so12502375ad.2
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 00:40:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737621604; x=1738226404;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2UVrjYVF1Hj7ct/lR3WK34rJGq50fF4xm9N2x7OTNc8=;
 b=NfZk99RJt+vOjaTpxwOFZU2Qvxx06Qnj4ArfY+Nc94KYCJ7fIo90wzvTy6w81ueuZ1
 VvcHxWiYFed65UzLof4wbWlX4I+ZSTScQ4LWJ1hzFQHE1fmtmubKPz7u3DGKwKF/GzPi
 BnfFwzLaHCuAFUBaUhn2sw3b6Shl9yCVbNjhccsyAyMYjrWd9b1UifEekWdLCus/iWIr
 4/2leQ8K/vR503vv6MpWSuPbGEK2mM84nL47LSefq7IY9TtHFim7sIcaa6vZ+gP09CDk
 TAhEIf1kcw1vGXed6ibf2tXGXdz3vX7SlAs+CrVQ8rdEJ+gUs0UTxwupbSX6jyjJv7kP
 xXNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXWJYy/DVIvsPDAY6FVlNI26qzO9cQFvq7MC9U7VNDxwFhYmRgXL1yG8Oo9Sy5Ue1pLUXfVU9x3npI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwaUVCdDKAhy/EgAdVK+w0mtxzGNcC5CxO8wJWErgnm7983CjmK
 +0YUlgivcqZDXGEw9v7WDpC1lXARJqI9WFM3n4xAeqZHK03jlRNdGhKVM6YK+p8NU1J/GaK/dK/
 fiIwp/qmNnNGU0iTOvN0ltGx6IQA+LVeLhSve7zjh3dFvdpmoOQGBdGNArQkiQygr9A==
X-Gm-Gg: ASbGncuUbNC2OplM+0JZMO1Hq1NcVDrv3xvu7X+Sms1vThAGjyYVwgxIQ5RkqkmVwU/
 iqKzT0USlMaz1S78CJMMJjSyBGUqnvS+m5qiajQzZUVjoL8cxuKgOtNGQydkxGjDgTS67CA1jhA
 BhdYKsHpZhCq1CWML3cRodkMIUTi5hhrMQTtEX4yG1ye5UQZLX6am/HrQr+nGxKmQNm1Djd6rrh
 tm1UhkjNJDSyoY3rdSJ0KxWxTVEU2iMrrwsmoLb5RLcjs99nZd6xS8GE5AF1FyaS6f+YtHbMSX4
 tg9XiV+zLSnZzBI2PiAY
X-Received: by 2002:a17:902:ecd0:b0:21a:8d4c:a9b5 with SMTP id
 d9443c01a7336-21c354074d5mr440970745ad.12.1737621603769; 
 Thu, 23 Jan 2025 00:40:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjy5zeoBnE4MWUb8nS8W6PuTx5lRnMpBd96eiXkRiC93gkB/4V1moQBoGz9Tc4XIWiP/Uefw==
X-Received: by 2002:a17:902:ecd0:b0:21a:8d4c:a9b5 with SMTP id
 d9443c01a7336-21c354074d5mr440969935ad.12.1737621603306; 
 Thu, 23 Jan 2025 00:40:03 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21c2d3e907csm107632205ad.199.2025.01.23.00.39.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 00:40:02 -0800 (PST)
Message-ID: <55569c2edf754c0e751d272016630528a28e86c8.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
From: Philipp Stanner <pstanner@redhat.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Philipp Stanner
 <phasta@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>,  Christian Gmeiner
 <christian.gmeiner@gmail.com>, Frank Binns <frank.binns@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>,  Rob
 Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>,  Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, Boris
 Brezillon <boris.brezillon@collabora.com>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost
 <matthew.brost@intel.com>, Melissa Wen <mwen@igalia.com>, Lucas De Marchi
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
Date: Thu, 23 Jan 2025 09:39:31 +0100
In-Reply-To: <9713798aa175aef2041e6d688ac4814006f789bc.camel@redhat.com>
References: <20250122140818.45172-3-phasta@kernel.org>
 <24f1c52f-1768-47de-88e3-d4104969d0a9@igalia.com>
 <9713798aa175aef2041e6d688ac4814006f789bc.camel@redhat.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HkoVt7kQqjkrQZy7fvGKHQMliJxzHS6RsriqFCHfVA4_1737621604
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

On Thu, 2025-01-23 at 09:10 +0100, Philipp Stanner wrote:
> On Wed, 2025-01-22 at 19:07 -0300, Ma=C3=ADra Canal wrote:
> > Hi Philipp,
> >=20
> > On 22/01/25 11:08, Philipp Stanner wrote:
> > > drm_sched_init() has a great many parameters and upcoming new
> > > functionality for the scheduler might add even more. Generally,
> > > the
> > > great number of parameters reduces readability and has already
> > > caused
> > > one missnaming in:
> > >=20
> > > commit 6f1cacf4eba7 ("drm/nouveau: Improve variable name in
> > > nouveau_sched_init()").
> > >=20
> > > Introduce a new struct for the scheduler init parameters and port
> > > all
> > > users.
> > >=20
> > > Signed-off-by: Philipp Stanner <phasta@kernel.org>
> > > ---
> > > Howdy,
> > >=20
> > > I have a patch-series in the pipe that will add a `flags`
> > > argument
> > > to
> > > drm_sched_init(). I thought it would be wise to first rework the
> > > API as
> > > detailed in this patch. It's really a lot of parameters by now,
> > > and
> > > I
> > > would expect that it might get more and more over the years for
> > > special
> > > use cases etc.
> > >=20
> > > Regards,
> > > P.
> > > ---
> > > =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |=C2=A0 21 +++-
> > > =C2=A0 drivers/gpu/drm/etnaviv/etnaviv_sched.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 20 ++-
> > > =C2=A0 drivers/gpu/drm/imagination/pvr_queue.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 21 +++-
> > > =C2=A0 drivers/gpu/drm/lima/lima_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 21 +++-
> > > =C2=A0 drivers/gpu/drm/msm/msm_ringbuffer.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 22 ++--
> > > =C2=A0 drivers/gpu/drm/nouveau/nouveau_sched.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 20 ++-
> > > =C2=A0 drivers/gpu/drm/panfrost/panfrost_job.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 22 ++--
> > > =C2=A0 drivers/gpu/drm/panthor/panthor_mmu.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 18 ++-
> > > =C2=A0 drivers/gpu/drm/panthor/panthor_sched.c=C2=A0=C2=A0=C2=A0 |=C2=
=A0 23 ++--
> > > =C2=A0 drivers/gpu/drm/scheduler/sched_main.c=C2=A0=C2=A0=C2=A0=C2=A0=
 |=C2=A0 53 +++-----
> > > =C2=A0 drivers/gpu/drm/v3d/v3d_sched.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 135
> > > +++++++++++++++-
> > > -----
> > > =C2=A0 drivers/gpu/drm/xe/xe_execlist.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 20 ++-
> > > =C2=A0 drivers/gpu/drm/xe/xe_gpu_scheduler.c=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 |=C2=A0 19 ++-
> > > =C2=A0 include/drm/gpu_scheduler.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 35 +++++-
> > > =C2=A0 14 files changed, 311 insertions(+), 139 deletions(-)
> > >=20
> >=20
> > [...]
> >=20
> > > diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
> > > b/drivers/gpu/drm/v3d/v3d_sched.c
> > > index 99ac4995b5a1..716e6d074d87 100644
> > > --- a/drivers/gpu/drm/v3d/v3d_sched.c
> > > +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> > > @@ -814,67 +814,124 @@ static const struct drm_sched_backend_ops
> > > v3d_cpu_sched_ops =3D {
> > > =C2=A0=C2=A0=09.free_job =3D v3d_cpu_job_free
> > > =C2=A0 };
> > > =C2=A0=20
> > > +/*
> > > + * v3d's scheduler instances are all identical, except for ops
> > > and
> > > name.
> > > + */
> > > +static void
> > > +v3d_common_sched_init(struct drm_sched_init_params *params,
> > > struct
> > > device *dev)
> > > +{
> > > +=09memset(params, 0, sizeof(struct drm_sched_init_params));
> > > +
> > > +=09params->submit_wq =3D NULL; /* Use the system_wq. */
> > > +=09params->num_rqs =3D DRM_SCHED_PRIORITY_COUNT;
> > > +=09params->credit_limit =3D 1;
> > > +=09params->hang_limit =3D 0;
> > > +=09params->timeout =3D msecs_to_jiffies(500);
> > > +=09params->timeout_wq =3D NULL; /* Use the system_wq. */
> > > +=09params->score =3D NULL;
> > > +=09params->dev =3D dev;
> > > +}
> >=20
> > Could we use only one function that takes struct v3d_dev *v3d, enum
> > v3d_queue, and sched_ops as arguments (instead of one function per
> > queue)? You can get the name of the scheduler by concatenating
> > "v3d_"
> > to
> > the return of v3d_queue_to_string().
> >=20
> > I believe it would make the code much simpler.
>=20
> Hello,
>=20
> so just to get that right:
> You'd like to have one universal function that switch-cases over an
> enum, sets the ops and creates the name with string concatenation?

Oh, and here's another issue:
The @name string has life time issues to take into account. It must
live as long as the scheduler instance.

In your mind, where should the memory for the strings your
concatenating be and how should their life time be managed?

Currently they're in the TEXT segment, which is fine

P.


>=20
> I'm not convinced that this is simpler than a few small functions,
> but
> it's not my component, so=E2=80=A6
>=20
> Whatever we'll do will be simpler than the existing code, though.
> Right
> now no reader can see at first glance whether all those schedulers
> are
> identically parametrized or not.
>=20
> P.
>=20
>=20
> >=20
> > Best Regards,
> > - Ma=C3=ADra
> >=20
> > > +
> > > +static int
> > > +v3d_bin_sched_init(struct v3d_dev *v3d)
> > > +{
> > > +=09struct drm_sched_init_params params;
> > > +
> > > +=09v3d_common_sched_init(&params, v3d->drm.dev);
> > > +=09params.ops =3D &v3d_bin_sched_ops;
> > > +=09params.name =3D "v3d_bin";
> > > +
> > > +=09return drm_sched_init(&v3d->queue[V3D_BIN].sched,
> > > &params);
> > > +}
> > > +
> > > +static int
> > > +v3d_render_sched_init(struct v3d_dev *v3d)
> > > +{
> > > +=09struct drm_sched_init_params params;
> > > +
> > > +=09v3d_common_sched_init(&params, v3d->drm.dev);
> > > +=09params.ops =3D &v3d_render_sched_ops;
> > > +=09params.name =3D "v3d_render";
> > > +
> > > +=09return drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> > > &params);
> > > +}
> > > +
> > > +static int
> > > +v3d_tfu_sched_init(struct v3d_dev *v3d)
> > > +{
> > > +=09struct drm_sched_init_params params;
> > > +
> > > +=09v3d_common_sched_init(&params, v3d->drm.dev);
> > > +=09params.ops =3D &v3d_tfu_sched_ops;
> > > +=09params.name =3D "v3d_tfu";
> > > +
> > > +=09return drm_sched_init(&v3d->queue[V3D_TFU].sched,
> > > &params);
> > > +}
> > > +
> > > +static int
> > > +v3d_csd_sched_init(struct v3d_dev *v3d)
> > > +{
> > > +=09struct drm_sched_init_params params;
> > > +
> > > +=09v3d_common_sched_init(&params, v3d->drm.dev);
> > > +=09params.ops =3D &v3d_csd_sched_ops;
> > > +=09params.name =3D "v3d_csd";
> > > +
> > > +=09return drm_sched_init(&v3d->queue[V3D_CSD].sched,
> > > &params);
> > > +}
> > > +
> > > +static int
> > > +v3d_cache_sched_init(struct v3d_dev *v3d)
> > > +{
> > > +=09struct drm_sched_init_params params;
> > > +
> > > +=09v3d_common_sched_init(&params, v3d->drm.dev);
> > > +=09params.ops =3D &v3d_cache_clean_sched_ops;
> > > +=09params.name =3D "v3d_cache_clean";
> > > +
> > > +=09return drm_sched_init(&v3d-
> > > >queue[V3D_CACHE_CLEAN].sched,
> > > &params);
> > > +}
> > > +
> > > +static int
> > > +v3d_cpu_sched_init(struct v3d_dev *v3d)
> > > +{
> > > +=09struct drm_sched_init_params params;
> > > +
> > > +=09v3d_common_sched_init(&params, v3d->drm.dev);
> > > +=09params.ops =3D &v3d_cpu_sched_ops;
> > > +=09params.name =3D "v3d_cpu";
> > > +
> > > +=09return drm_sched_init(&v3d->queue[V3D_CPU].sched,
> > > &params);
> > > +}
> > > +
> > > =C2=A0 int
> > > =C2=A0 v3d_sched_init(struct v3d_dev *v3d)
> > > =C2=A0 {
> > > -=09int hw_jobs_limit =3D 1;
> > > -=09int job_hang_limit =3D 0;
> > > -=09int hang_limit_ms =3D 500;
> > > =C2=A0=C2=A0=09int ret;
> > > =C2=A0=20
> > > -=09ret =3D drm_sched_init(&v3d->queue[V3D_BIN].sched,
> > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_bin_sched_ops, NULL,
> > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit, job_hang_limit,
> > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms),
> > > NULL,
> > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_bin", v3d->drm.dev);
> > > +=09ret =3D v3d_bin_sched_init(v3d);
> > > =C2=A0=C2=A0=09if (ret)
> > > =C2=A0=C2=A0=09=09return ret;
> > > =C2=A0=20
> > > -=09ret =3D drm_sched_init(&v3d->queue[V3D_RENDER].sched,
> > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_render_sched_ops, NULL,
> > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit, job_hang_limit,
> > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms),
> > > NULL,
> > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_render", v3d->drm.dev);
> > > +=09ret =3D v3d_render_sched_init(v3d);
> > > =C2=A0=C2=A0=09if (ret)
> > > =C2=A0=C2=A0=09=09goto fail;
> > > =C2=A0=20
> > > -=09ret =3D drm_sched_init(&v3d->queue[V3D_TFU].sched,
> > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_tfu_sched_ops, NULL,
> > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit, job_hang_limit,
> > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms),
> > > NULL,
> > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_tfu", v3d->drm.dev);
> > > +=09ret =3D v3d_tfu_sched_init(v3d);
> > > =C2=A0=C2=A0=09if (ret)
> > > =C2=A0=C2=A0=09=09goto fail;
> > > =C2=A0=20
> > > =C2=A0=C2=A0=09if (v3d_has_csd(v3d)) {
> > > -=09=09ret =3D drm_sched_init(&v3d->queue[V3D_CSD].sched,
> > > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_csd_sched_ops, NULL,
> > > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit,
> > > job_hang_limit,
> > > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0
> > > msecs_to_jiffies(hang_limit_ms), NULL,
> > > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_csd", v3d-
> > > > drm.dev);
> > > +=09=09ret =3D v3d_csd_sched_init(v3d);
> > > =C2=A0=C2=A0=09=09if (ret)
> > > =C2=A0=C2=A0=09=09=09goto fail;
> > > =C2=A0=20
> > > -=09=09ret =3D drm_sched_init(&v3d-
> > > > queue[V3D_CACHE_CLEAN].sched,
> > > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_cache_clean_sched_ops,
> > > NULL,
> > > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 hw_jobs_limit,
> > > job_hang_limit,
> > > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0
> > > msecs_to_jiffies(hang_limit_ms), NULL,
> > > -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_cache_clean",
> > > v3d-
> > > > drm.dev);
> > > +=09=09ret =3D v3d_cache_sched_init(v3d);
> > > =C2=A0=C2=A0=09=09if (ret)
> > > =C2=A0=C2=A0=09=09=09goto fail;
> > > =C2=A0=C2=A0=09}
> > > =C2=A0=20
> > > -=09ret =3D drm_sched_init(&v3d->queue[V3D_CPU].sched,
> > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 &v3d_cpu_sched_ops, NULL,
> > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 DRM_SCHED_PRIORITY_COUNT,
> > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 1, job_hang_limit,
> > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 msecs_to_jiffies(hang_limit_ms),
> > > NULL,
> > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "v3d_cpu", v3d->drm.dev);
> > > +=09ret =3D v3d_cpu_sched_init(v3d);
> > > =C2=A0=C2=A0=09if (ret)
> > > =C2=A0=C2=A0=09=09goto fail;
> > > =C2=A0=20
> >=20
>=20

