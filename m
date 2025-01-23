Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DDEA19F10
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2025 08:35:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F41AE10E77D;
	Thu, 23 Jan 2025 07:35:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ilkRkNmt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D2510E77E
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jan 2025 07:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1737617705;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lf0BZUp7ZGmjxG/9Q7auKIncjplw19R9RJmfyaaXa+8=;
 b=ilkRkNmtiDgU1SkPEZMnoyGqiZvv0pl5GNaAlXxjypkuJn4QJozmeFnS7E1efcqVs+RiS6
 q0OPTEG9Iz1mIW7eOutJA55QSxIQM7+Yq5NTdLS04DMpEpBcBNT2uhSwI+nebIsSSmyp0z
 UkTKUIT/nD4GB2P9TwCQSCda9LcG/uU=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-620-Mh15KkpfMzu2b1NQjhuGqw-1; Thu, 23 Jan 2025 02:35:03 -0500
X-MC-Unique: Mh15KkpfMzu2b1NQjhuGqw-1
X-Mimecast-MFC-AGG-ID: Mh15KkpfMzu2b1NQjhuGqw
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-2166f9f52fbso18853315ad.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Jan 2025 23:35:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737617702; x=1738222502;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W4BN572VUFCarYdnwN8cGa+EHCfnb6F5sly/f0mJXB8=;
 b=ayG8t+txK9meqEbzd9ZJiTIY+MkraBPD3GduM//Oaellv0j/2Q1STcGHw32rovFfVR
 PWB5Anw5QJFwUsYTdEj2AW5OVoCsMTNjb3aLouFwW7rxqPD+HX/Ip/zC41UOsLUWLjDh
 uGqC7J0+Pt4gqbxKtr/B+u1jlwCNVmuIumN/3M8rOI2MRw498RFh0zvey+uFlN08rTr2
 tUSeV7+CrYoo1SJ+cSRrXqhvflfux+TK602Nqzbct68vZnPPuq6dmT6ruQhNsvJn42M2
 w/7axHgCSzrjBgf1t/t/TBsHUuMiF0Gnc/F/nlw7Sqs9XPD1hLcVFXmM3lKh5Sznf6Ej
 f1mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVU8fjMOzDDsNmWD/MzOcblKMyV0zenlOY7ynTU5gG/2zUp2plz7Hgz9SnLAsSWIamjj2jNesr0640=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxq/Z83GDZsk3KlY8fvPAE7LWNH9pG/QP2zm9puE7WYtZhpyViT
 7xH529YrGIF454qjmpwDE+55eovwj7UNpUTDRm5sxSsujmyxGCt8JfYShx7vLO6lE5ThTrwh3Ih
 t/FpSk/aE4CwlQ5fa4qLEwcOJqC0s0jIF/+ciDqHjy1EeMw+sckA/ZPO5pDYPPuOnyQ==
X-Gm-Gg: ASbGncvIQt9zEUxdq+f09oU2iayXDDWsi7JQqsuadJmiyxCVNNvuGikMWyvkx0y8j/v
 WdOg8VZd6fd+oH0PlYrbXKHE2LKQhUU7pW6nXS8nWdBNe/O72KWYe7p5P/8VboCHhIzYYOUCWUA
 M2/JpvLMk22lHGKDzHoQFej/VHnbM5oSZ6ZbBbl38JAHc3F0NVEr3VRO149G3sfYsMb5cBE3803
 8X7IlqGTYIF0Kk+QnBVSQKUvEpSFt8Kg+rwZbj+8tgksew1mbloBx9KXysWpbO1rTNo1my7rkNi
 aRiQtt99iVRNQhV/fnYn
X-Received: by 2002:a05:6a20:7b07:b0:1e1:ae83:ad04 with SMTP id
 adf61e73a8af0-1eb215902cbmr29852243637.27.1737617702199; 
 Wed, 22 Jan 2025 23:35:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHh77DDXX36dyhexySOTFKoaJSg/tDd255UJXbhLAfDvHlHC7l2xvqlFBRPYqoRrLU70wpG+g==
X-Received: by 2002:a05:6a20:7b07:b0:1e1:ae83:ad04 with SMTP id
 adf61e73a8af0-1eb215902cbmr29852184637.27.1737617701798; 
 Wed, 22 Jan 2025 23:35:01 -0800 (PST)
Received: from [10.200.68.91] (nat-pool-muc-u.redhat.com. [149.14.88.27])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72dab9c9462sm12612476b3a.100.2025.01.22.23.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Jan 2025 23:35:01 -0800 (PST)
Message-ID: <e6aea551ec14bcece31c3cbb861afee361547f84.camel@redhat.com>
Subject: Re: [PATCH] drm/sched: Use struct for drm_sched_init() params
From: Philipp Stanner <pstanner@redhat.com>
To: Matthew Brost <matthew.brost@intel.com>, Boris Brezillon
 <boris.brezillon@collabora.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>, Philipp Stanner
 <phasta@kernel.org>,  Alex Deucher <alexander.deucher@amd.com>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,  Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>,  Lucas Stach <l.stach@pengutronix.de>, Russell King
 <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner
 <christian.gmeiner@gmail.com>, Frank Binns <frank.binns@imgtec.com>, Matt
 Coster <matt.coster@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Qiang Yu <yuq825@gmail.com>,  Rob
 Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Konrad Dybcio
 <konradybcio@kernel.org>,  Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Marijn Suijten
 <marijn.suijten@somainline.org>, Karol Herbst <kherbst@redhat.com>, Lyude
 Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, Rob Herring
 <robh@kernel.org>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, Luben Tuikov <ltuikov89@gmail.com>, Melissa Wen
 <mwen@igalia.com>, =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo
 Vivi <rodrigo.vivi@intel.com>,  Sunil Khatri <sunil.khatri@amd.com>, Lijo
 Lazar <lijo.lazar@amd.com>, Mario Limonciello <mario.limonciello@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, Yunxiang Li <Yunxiang.Li@amd.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,  etnaviv@lists.freedesktop.org,
 lima@lists.freedesktop.org,  linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org,  nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Date: Thu, 23 Jan 2025 08:34:30 +0100
In-Reply-To: <Z5HHjnTzhNX9j05U@lstrano-desk.jf.intel.com>
References: <20250122140818.45172-3-phasta@kernel.org>
 <20250122165104.536c4143@collabora.com>
 <ce6bd1f3-8d7c-4b3c-af07-b8c9e0912f51@ursulin.net>
 <20250122180353.7ef8fbc1@collabora.com>
 <Z5HHjnTzhNX9j05U@lstrano-desk.jf.intel.com>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LjX-cpb7vRh-jZul9nrdd9TjN1SEc1YVP8lvZerIk6E_1737617702
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

On Wed, 2025-01-22 at 20:37 -0800, Matthew Brost wrote:
> On Wed, Jan 22, 2025 at 06:04:58PM +0100, Boris Brezillon wrote:
> > On Wed, 22 Jan 2025 16:14:59 +0000
> > Tvrtko Ursulin <tursulin@ursulin.net> wrote:
> >=20
> > > On 22/01/2025 15:51, Boris Brezillon wrote:
> > > > On Wed, 22 Jan 2025 15:08:20 +0100
> > > > Philipp Stanner <phasta@kernel.org> wrote:
> > > > =C2=A0=20
> > > > > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > > > > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > > > > @@ -3272,6 +3272,7 @@ group_create_queue(struct panthor_group
> > > > > *group,
> > > > > =C2=A0=C2=A0=09=09=C2=A0=C2=A0 const struct drm_panthor_queue_cre=
ate
> > > > > *args)
> > > > > =C2=A0 {
> > > > > =C2=A0=C2=A0=09struct drm_gpu_scheduler *drm_sched;
> > > > > +=09struct drm_sched_init_params sched_params;=C2=A0=20
> > > >=20
> > > > nit: Could we use a struct initializer instead of a
> > > > memset(0)+field-assignment?
> > > >=20
> > > > =09struct drm_sched_init_params sched_params =3D {
> >=20
> > Actually, you can even make it const if it's not modified after the
> > declaration.
> >=20
> > > > =09=09.ops =3D &panthor_queue_sched_ops,
> > > > =09=09.submit_wq =3D group->ptdev->scheduler->wq,
> > > > =09=09.num_rqs =3D 1,
> > > > =09=09.credit_limit =3D args->ringbuf_size /
> > > > sizeof(u64),
> > > > =09=09.hang_limit =3D 0,
> > > > =09=09.timeout =3D msecs_to_jiffies(JOB_TIMEOUT_MS),
> > > > =09=09.timeout_wq =3D group->ptdev->reset.wq,
> > > > =09=09.name =3D "panthor-queue",
> > > > =09=09.dev =3D group->ptdev->base.dev,
> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 };=C2=A0=20
> > >=20
>=20
> +2

Yup, getting rid of memset() similar to Danilo's suggestion is surely a
good idea.

I personally don't like mixing initialization and declaration when
possible (readability), but having it const is probably a good
argument.

P.

>=20
> Matt
>=20
> > > +1 on this as a general approach for the whole series. And I'd
> > > drop the=20
> > > explicit zeros and NULLs. Memsets could then go too.
> > >=20
> > > Regards,
> > >=20
> > > Tvrtko
> > >=20
> > > >=20
> > > > The same comment applies the panfrost changes BTW.
> > > > =C2=A0=20
> > > > > =C2=A0=C2=A0=09struct panthor_queue *queue;
> > > > > =C2=A0=C2=A0=09int ret;
> > > > > =C2=A0=20
> > > > > @@ -3289,6 +3290,8 @@ group_create_queue(struct panthor_group
> > > > > *group,
> > > > > =C2=A0=C2=A0=09if (!queue)
> > > > > =C2=A0=C2=A0=09=09return ERR_PTR(-ENOMEM);
> > > > > =C2=A0=20
> > > > > +=09memset(&sched_params, 0, sizeof(struct
> > > > > drm_sched_init_params));
> > > > > +
> > > > > =C2=A0=C2=A0=09queue->fence_ctx.id =3D dma_fence_context_alloc(1)=
;
> > > > > =C2=A0=C2=A0=09spin_lock_init(&queue->fence_ctx.lock);
> > > > > =C2=A0=C2=A0=09INIT_LIST_HEAD(&queue->fence_ctx.in_flight_jobs);
> > > > > @@ -3341,17 +3344,23 @@ group_create_queue(struct
> > > > > panthor_group *group,
> > > > > =C2=A0=C2=A0=09if (ret)
> > > > > =C2=A0=C2=A0=09=09goto err_free_queue;
> > > > > =C2=A0=20
> > > > > +=09sched_params.ops =3D &panthor_queue_sched_ops;
> > > > > +=09sched_params.submit_wq =3D group->ptdev->scheduler-
> > > > > >wq;
> > > > > +=09sched_params.num_rqs =3D 1;
> > > > > =C2=A0=C2=A0=09/*
> > > > > -=09 * Credit limit argument tells us the total number
> > > > > of instructions
> > > > > +=09 * The credit limit argument tells us the total
> > > > > number of instructions
> > > > > =C2=A0=C2=A0=09 * across all CS slots in the ringbuffer, with som=
e
> > > > > jobs requiring
> > > > > =C2=A0=C2=A0=09 * twice as many as others, depending on their
> > > > > profiling status.
> > > > > =C2=A0=C2=A0=09 */
> > > > > -=09ret =3D drm_sched_init(&queue->scheduler,
> > > > > &panthor_queue_sched_ops,
> > > > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 group->ptdev->scheduler->wq, 1=
,
> > > > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 args->ringbuf_size /
> > > > > sizeof(u64),
> > > > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 0,
> > > > > msecs_to_jiffies(JOB_TIMEOUT_MS),
> > > > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 group->ptdev->reset.wq,
> > > > > -=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 NULL, "panthor-queue", group-
> > > > > >ptdev->base.dev);
> > > > > +=09sched_params.credit_limit =3D args->ringbuf_size /
> > > > > sizeof(u64);
> > > > > +=09sched_params.hang_limit =3D 0;
> > > > > +=09sched_params.timeout =3D
> > > > > msecs_to_jiffies(JOB_TIMEOUT_MS);
> > > > > +=09sched_params.timeout_wq =3D group->ptdev->reset.wq;
> > > > > +=09sched_params.score =3D NULL;
> > > > > +=09sched_params.name =3D "panthor-queue";
> > > > > +=09sched_params.dev =3D group->ptdev->base.dev;
> > > > > +
> > > > > +=09ret =3D drm_sched_init(&queue->scheduler,
> > > > > &sched_params);
> > > > > =C2=A0=C2=A0=09if (ret)
> > > > > =C2=A0=C2=A0=09=09goto err_free_queue;=C2=A0=20
> >=20

