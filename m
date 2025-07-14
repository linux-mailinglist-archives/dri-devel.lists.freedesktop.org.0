Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B61DB03EF3
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 14:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B7610E07F;
	Mon, 14 Jul 2025 12:46:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="G+xRQRVK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A72510E07F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 12:46:09 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:b231:465::102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bghrZ1vpZz9t5M;
 Mon, 14 Jul 2025 14:46:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1752497166; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=D8LdAv1K0c2ZoOXvtFcrn8E3hwarQ9O9yhuk1Ug7Kmo=;
 b=G+xRQRVKJUPrNfyzI9mVD7ECHRcw45ihGeYAGB+FhG8G9IBLPRMEPxQ7DO9GbngIDwklGO
 QD/HLZuLHJq7UbxgHcCTxDYB+Ync/XVfyeJFT2W5nnUI4xG0+dmDe8YFrhKeVYYSViKCBf
 7EVk55jmR6qXDdk/0BavDEqRake2h2O0ICcjhUdKiXU2FfHgoiOV9rf6vuiXshVtyph2kV
 /D0Up6T38JMcOC3PDnHk2pGpk9TQc7CeHS5lsfNM4BKTGRSh5cCYeYqmXx5AXJc2jIMKSX
 +zLVeFZNMkqrgdlK8zBbB5i8VJ0TC+czO7xjhaffr1jiUH+AI8xxtJ/2VfhOBA==
Message-ID: <87d61f5b7809828a55caf779b10a90be802fe83a.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/scheduler: Fix sched hang when killing app with
 dependent jobs
From: Philipp Stanner <phasta@mailbox.org>
To: "Lin.Cao" <lincao12@amd.com>, dri-devel@lists.freedesktop.org
Cc: zhenguo.yin@amd.com, Emily.Deng@amd.com, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, phasta@kernel.org,
 dakr@kernel.org,  matthew.brost@intel.com
Date: Mon, 14 Jul 2025 14:46:00 +0200
In-Reply-To: <20250714062349.588235-1-lincao12@amd.com>
References: <20250714062349.588235-1-lincao12@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: qz7zpc7zm5aksjri1on9qg4zyfzwrh54
X-MBO-RS-ID: 18b9eee5d0364c46a11
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

regarding the patch subject: the prefix we use for the scheduler is:
drm/sched:


On Mon, 2025-07-14 at 14:23 +0800, Lin.Cao wrote:

> When Application A submits jobs (a1, a2, a3) and application B submits

s/Application/application

> job b1 with a dependency on a2's scheduler fence, killing application A
> before run_job(a1) causes drm_sched_entity_kill_jobs_work() to force
> signal all jobs sequentially. However, due to missing work_run_job or
> work_free_job
>=20

You probably mean "due to the work items work_run_job and work_free_job
not being started [=E2=80=A6]".

However, the call you add, drm_sched_wakeup(), immediately only
triggers work_run_job. It's not clear to me why you mention
work_free_job, because drm_sched_entity_kill_jobs_work() directly
invokes the free_job() callback.

>  in entity_kill_job_work(), the scheduler enters sleep
> state, causing application B hang.

So the issue is that if a1 never ran, the scheduler will not continue
with the jobs of application B, correct?

>=20
> Add drm_sched_wakeup() when entity_kill_job_work() to preventing

s/to preventing/to prevent

> scheduler sleep and subsequent application hangs.
>=20
> v2:
> - Move drm_sched_wakeup() to after drm_sched_fence_scheduled()

Changelogs are cool and useful, but move them below the Signed-off area
with another --- please, like so:

Signed-off by: =E2=80=A6
---
v2:
=E2=80=A6
---
drivers/gpu/drm/scheduler/sched_entity.c | 1 +


>=20
> Signed-off-by: Lin.Cao <lincao12@amd.com>

This fixes a bug. Even a racy bug, it seems. So we need a Fixes tag and
put the stable kernel in CC.

Please figure out with git blame, git log and git tag --contains which
commit your patch fixes and which is the oldest kernel that contains
the bug. Then add a Fixes: tag and Cc: the stable kernel. You'll find
lots of examples for that in git log.


Thx
P.

> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index e671aa241720..66f2a43c58fd 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -177,6 +177,7 @@ static void drm_sched_entity_kill_jobs_work(struct wo=
rk_struct *wrk)
> =C2=A0	struct drm_sched_job *job =3D container_of(wrk, typeof(*job), work=
);
> =C2=A0
> =C2=A0	drm_sched_fence_scheduled(job->s_fence, NULL);
> +	drm_sched_wakeup(job->sched);
> =C2=A0	drm_sched_fence_finished(job->s_fence, -ESRCH);
> =C2=A0	WARN_ON(job->s_fence->parent);
> =C2=A0	job->sched->ops->free_job(job);

