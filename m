Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B30E47F9C30
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 09:59:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0581510E1ED;
	Mon, 27 Nov 2023 08:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F1D210E1ED
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 08:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pMWnOynjcehhsJOYHIDraeiCOU3/whVcEJ9W0eyQbrU=; b=m3Lczm8/6Mu1xi9cKExzCtzxQm
 JvNxB0pkXUadGGPW4GVCY4qsG5g5vTrkao6J5rXyB/Lqcd/6eopvYrerOUWHSLOJacDpvv7vA6MMG
 XbeJT8fmw9dAwPub9q2WeZEViV+SCPLJSF8+SApprQT3MdnKyZuIMY4kdWEBQIiKI2EYIzqqO8aK+
 qAED25ati6BbwqT4FUmUeKyHmfsYFbfXLzZHAuGMS0CQ01uEnhRY9bfSVMjbYqviJtvLnkoYt/kSE
 ihERFY8pyfBoT1/qrFikTPW2Lk6oSEKShPog4kIcIyDKlSOLtRbZ5jLk9GAzo/mzCqhzxHUdtr26O
 KEp6OsIw==;
Received: from 21.49.60.213.dynamic.reverse-mundo-r.com ([213.60.49.21]
 helo=[192.168.0.100]) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r7XSN-007VaB-Ls; Mon, 27 Nov 2023 09:59:07 +0100
Message-ID: <eae9a0537edab4dff9153d1cb2efe5ec380a26e0.camel@igalia.com>
Subject: Re: [PATCH v2 07/17] drm/v3d: Add a CPU job submission
From: Iago Toral <itoral@igalia.com>
To: =?ISO-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>, Melissa Wen
 <mwen@igalia.com>, David Airlie <airlied@gmail.com>, Daniel Vetter
 <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Date: Mon, 27 Nov 2023 09:59:06 +0100
In-Reply-To: <20231124012548.772095-8-mcanal@igalia.com>
References: <20231124012548.772095-1-mcanal@igalia.com>
 <20231124012548.772095-8-mcanal@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
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
Cc: kernel-dev@igalia.com, Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, Faith Ekstrand <faith.ekstrand@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

El jue, 23-11-2023 a las 21:47 -0300, Ma=C3=ADra Canal escribi=C3=B3:
> From: Melissa Wen <mwen@igalia.com>
>=20
> Create a new type of job, a CPU job. A CPU job is a type of job that
> performs operations that requires CPU intervention. The overall idea
> is
> to use user extensions to enable different types of CPU job, allowing
> the
> CPU job to perform different operations according to the type of user
> externsion. The user extension ID identify the type of CPU job that
> must
> be dealt.
>=20
> Having a CPU job is interesting for synchronization purposes as a CPU
> job has a queue like any other V3D job and can be synchoronized by
> the
> multisync extension.
>=20
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> Co-developed-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> ---
>=20
(...)

> diff --git a/drivers/gpu/drm/v3d/v3d_sched.c
> b/drivers/gpu/drm/v3d/v3d_sched.c
> index fccbea2a5f2e..a32c91b94898 100644
> --- a/drivers/gpu/drm/v3d/v3d_sched.c
> +++ b/drivers/gpu/drm/v3d/v3d_sched.c
> @@ -55,6 +55,12 @@ to_csd_job(struct drm_sched_job *sched_job)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return container_of(sched=
_job, struct v3d_csd_job,
> base.base);
> =C2=A0}
> =C2=A0
> +static struct v3d_cpu_job *
> +to_cpu_job(struct drm_sched_job *sched_job)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return container_of(sched_job,=
 struct v3d_cpu_job,
> base.base);
> +}
> +
> =C2=A0static void
> =C2=A0v3d_sched_job_free(struct drm_sched_job *sched_job)
> =C2=A0{
> @@ -262,6 +268,42 @@ v3d_csd_job_run(struct drm_sched_job *sched_job)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return fence;
> =C2=A0}
> =C2=A0
> +static struct dma_fence *
> +v3d_cpu_job_run(struct drm_sched_job *sched_job)
> +{
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct v3d_cpu_job *job =3D to=
_cpu_job(sched_job);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct v3d_dev *v3d =3D job->b=
ase.v3d;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct v3d_file_priv *file =3D=
 job->base.file->driver_priv;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0u64 runtime;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0void (*v3d_cpu_job_fn[])(struc=
t v3d_cpu_job *job) =3D { };

Shouldn't this be a static const? Also, maybe we want declare it
outside the function itself?

Iago

> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0v3d->cpu_job =3D job;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (job->job_type >=3D ARRAY_S=
IZE(v3d_cpu_job_fn)) {
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0DRM_DEBUG_DRIVER("Unknown CPU job: %d\n", job-
> >job_type);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return NULL;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0file->start_ns[V3D_CPU] =3D lo=
cal_clock();
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0v3d->queue[V3D_CPU].start_ns =
=3D file->start_ns[V3D_CPU];
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0v3d_cpu_job_fn[job->job_type](=
job);
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0runtime =3D local_clock() - fi=
le->start_ns[V3D_CPU];
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0file->enabled_ns[V3D_CPU] +=3D=
 runtime;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0v3d->queue[V3D_CPU].enabled_ns=
 +=3D runtime;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0file->jobs_sent[V3D_CPU]++;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0v3d->queue[V3D_CPU].jobs_sent+=
+;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0file->start_ns[V3D_CPU] =3D 0;
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0v3d->queue[V3D_CPU].start_ns =
=3D 0;
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return NULL;
> +}
