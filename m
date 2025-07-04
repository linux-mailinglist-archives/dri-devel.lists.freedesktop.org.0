Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0BEBAF934D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 14:59:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E65610E214;
	Fri,  4 Jul 2025 12:59:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="vFb/EG4c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7954410E214;
 Fri,  4 Jul 2025 12:59:28 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bYYcY2TlLz9t13;
 Fri,  4 Jul 2025 14:59:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1751633965; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=85ulYrWa2aKa6X7PytppDzTSoBmaC9nM/f9Z+G5Oeu4=;
 b=vFb/EG4cHeJRyFTWy14fLOzuSNuEIqoOgM1bxQO+7l+I2CO8ZBSsKF+mOtj3CP/7hAGLuS
 XVGDwHkRhfJXltR3rQbyk6QGGCAMIjX0jUjgPfV/VzguDt7I9aqAj1x7Gs4qw302/6QW9T
 tBYCYuzbKEGwmkI7OnvHUt/pjydc89YxZ9wsvgT/RUpx24024+11t3V5VtwemrO5ATDW3W
 5Bcw86NsfK8BFnTyZxSlZMPqYYx8p1p1d+Yk1XpTdBRwv70eWbDBilcEcKmYNxXsu6TJPj
 nGaNRSB5i0lEDnjXaCTm/HNfXEEJa4RK+721iPJaRRxV4sOrg2qSoOehyoFe8Q==
Message-ID: <f010325d1d49b4d7cae44d12c77110c3c36de214.camel@mailbox.org>
Subject: Re: [PATCH v5 03/16] drm/sched: De-clutter drm_sched_init
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 amd-gfx@lists.freedesktop.org,  dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
Date: Fri, 04 Jul 2025 14:59:23 +0200
In-Reply-To: <20250623122746.46478-4-tvrtko.ursulin@igalia.com>
References: <20250623122746.46478-1-tvrtko.ursulin@igalia.com>
 <20250623122746.46478-4-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: tnwqegw6qa5tpxygq55tbw8am9hstkwz
X-MBO-RS-ID: 41c0739efc0bc8a2696
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
Reply-To: phasta@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2025-06-23 at 13:27 +0100, Tvrtko Ursulin wrote:
> Move work queue allocation into a helper for a more streamlined
> function
> body.
>=20
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 33 ++++++++++++++++-------=
-
> --
> =C2=A01 file changed, 20 insertions(+), 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
> b/drivers/gpu/drm/scheduler/sched_main.c
> index a1b445c3b4db..1f077782ec12 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -84,12 +84,6 @@
> =C2=A0#define CREATE_TRACE_POINTS
> =C2=A0#include "gpu_scheduler_trace.h"
> =C2=A0
> -#ifdef CONFIG_LOCKDEP
> -static struct lockdep_map drm_sched_lockdep_map =3D {
> -	.name =3D "drm_sched_lockdep_map"
> -};
> -#endif
> -
> =C2=A0int drm_sched_policy =3D DRM_SCHED_POLICY_FIFO;
> =C2=A0
> =C2=A0/**
> @@ -1263,6 +1257,25 @@ static void drm_sched_run_job_work(struct
> work_struct *w)
> =C2=A0	drm_sched_run_job_queue(sched);
> =C2=A0}
> =C2=A0
> +static struct workqueue_struct *drm_sched_alloc_wq(const char *name)
> +{
> +#if (IS_ENABLED(CONFIG_LOCKDEP))
> +	static struct lockdep_map map =3D {
> +		.name =3D "drm_sched_lockdep_map"
> +	};
> +
> +	/*
> +	 * Avoid leaking a lockdep map on each drm sched creation
> and
> +	 * destruction by using a single lockdep map for all drm
> sched
> +	 * allocated submit_wq.
> +	 */
> +
> +	return alloc_ordered_workqueue_lockdep_map(name,
> WQ_MEM_RECLAIM, &map);
> +#else
> +	return alloc_ordered_workqueue(name, WQ_MEM_RECLAIM);
> +#endif
> +}
> +
> =C2=A0/**
> =C2=A0 * drm_sched_init - Init a gpu scheduler instance
> =C2=A0 *
> @@ -1303,13 +1316,7 @@ int drm_sched_init(struct drm_gpu_scheduler
> *sched, const struct drm_sched_init_
> =C2=A0		sched->submit_wq =3D args->submit_wq;
> =C2=A0		sched->own_submit_wq =3D false;
> =C2=A0	} else {
> -#ifdef CONFIG_LOCKDEP
> -		sched->submit_wq =3D
> alloc_ordered_workqueue_lockdep_map(args->name,
> -
> 								=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WQ_MEM_RECLAIM,
> -
> 								=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &drm_sched_lockdep_map);
> -#else
> -		sched->submit_wq =3D alloc_ordered_workqueue(args-
> >name, WQ_MEM_RECLAIM);
> -#endif
> +		sched->submit_wq =3D drm_sched_alloc_wq(args->name);
> =C2=A0		if (!sched->submit_wq)
> =C2=A0			return -ENOMEM;

You could send this patch separately any time *wink wink*

We definitely wanna merge that, and you could then just rebase your RFC
series on drm-misc-next.

P.

> =C2=A0

