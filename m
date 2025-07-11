Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B31A8B01D18
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jul 2025 15:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7502C10E28C;
	Fri, 11 Jul 2025 13:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="WsdhAlB6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E25C10E28C;
 Fri, 11 Jul 2025 13:14:04 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bdsc92GKZz9sdD;
 Fri, 11 Jul 2025 15:14:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1752239641; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ECZs2O26ABmW2s98wAb8+PSf7Nm7oZ2r/6cM8Z22Ly8=;
 b=WsdhAlB6GKKvBXLQnF+Du2VWiA5uEfRAR4B3CwdrMzQgCK0GfshAJW2zLH+fiQrO4BcFb4
 lPqQbPjV/IxxwwRkqXD5Yb3C5WhPgZuz80GRd3D/RpwqACO3I1vd0uPh8nHKOrOU83ynC7
 MC5+7eF6vgpj/giapk94QEvsgtdQauJK2gsQxQtEoqY2R8+ZAaagBRh9g9AtkxIh5AKO6u
 2iwtvrdrbXkJWZdwkBYDS3HizC24SCU26W+I11sxhizOFLzlCjTrbcipi8MAgbaBiDYDkE
 1jIc8UTFZfpOuKiwT/GnhtiBTfZEmQNio4VLlszzIQ00v90oKGocgHD0Dk38OA==
Message-ID: <d3999026bba8ace350c6e226881b98f901fa474b.camel@mailbox.org>
Subject: Re: [PATCH] drm/scheduler: Fix sched hang when killing app with
 dependent jobs
From: Philipp Stanner <phasta@mailbox.org>
To: "cao, lin" <lin.cao@amd.com>, "Koenig, Christian"
 <Christian.Koenig@amd.com>,  "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Cc: "Yin, ZhenGuo (Chris)" <ZhenGuo.Yin@amd.com>, "Deng, Emily"
 <Emily.Deng@amd.com>, Matthew Brost <matthew.brost@intel.com>, Danilo
 Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>
Date: Fri, 11 Jul 2025 15:13:58 +0200
In-Reply-To: <PH0PR12MB5497DBF0FD0A626EF5004800F548A@PH0PR12MB5497.namprd12.prod.outlook.com>
References: <20250710063633.498633-1-lincao12@amd.com>
 <4ebbdcf1-6123-4076-920d-bf6bcd292fac@amd.com>
 <PH0PR12MB5497DBF0FD0A626EF5004800F548A@PH0PR12MB5497.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: u9bs1jxx9x1wfcnpbfjdpjtz6dx5q96q
X-MBO-RS-ID: 427df47d3fbefdab01f
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

On Thu, 2025-07-10 at 08:33 +0000, cao, lin wrote:
>=20
> [AMD Official Use Only - AMD Internal Distribution Only]
>=20
>=20
>=20
> Hi Christian,
>=20
>=20
> Thanks for your suggestion, I modified the patch as:

Looks promising. You'll send a v2 I guess :)

P.

>=20
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> b/drivers/gpu/drm/scheduler/sched_entity.c
> index e671aa241720..66f2a43c58fd 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -177,6 +177,7 @@ static void
> drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
> =C2=A0 =C2=A0 struct drm_sched_job *job =3D container_of(wrk, typeof(*job=
),
> work);
> =C2=A0
> =C2=A0 =C2=A0 drm_sched_fence_scheduled(job->s_fence, NULL);
> + =C2=A0 drm_sched_wakeup(job->sched);
> =C2=A0 =C2=A0 drm_sched_fence_finished(job->s_fence, -ESRCH);
> =C2=A0 =C2=A0 WARN_ON(job->s_fence->parent);
> =C2=A0 =C2=A0 job->sched->ops->free_job(job);
> --
>=20
>=20
> Thanks,
> Lin
>=20
>=20
>=20
>=20
>=20
> From:=C2=A0Koenig, Christian <Christian.Koenig@amd.com>
> Sent:=C2=A0Thursday, July 10, 2025 15:52
> To:=C2=A0cao, lin <lin.cao@amd.com>; dri-devel@lists.freedesktop.org
> <dri-devel@lists.freedesktop.org>; amd-gfx@lists.freedesktop.org
> <amd-gfx@lists.freedesktop.org>
> Cc:=C2=A0Yin, ZhenGuo (Chris) <ZhenGuo.Yin@amd.com>; Deng, Emily
> <Emily.Deng@amd.com>; Matthew Brost <matthew.brost@intel.com>; Danilo
> Krummrich <dakr@kernel.org>; Philipp Stanner <phasta@kernel.org>
> Subject:=C2=A0Re: [PATCH] drm/scheduler: Fix sched hang when killing app
> with dependent jobs
>=20
>=20
> First of all you need to CC the scheduler maintainers, try to use the
> get_maintainer.pl script. Adding them on CC.
>=20
> On 10.07.25 08:36, Lin.Cao wrote:
> > When Application A submits jobs (a1, a2, a3) and application B
> > submits
> > job b1 with a dependency on a2's scheduler fence, killing
> > application A
> > before run_job(a1) causes drm_sched_entity_kill_jobs_work() to
> > force
> > signal all jobs sequentially. However, due to missing work_run_job
> > or
> > work_free_job in entity_kill_job_work(), the scheduler enters sleep
> > state, causing application B hang.
>=20
> Ah! Because of optimizing the dependency when submitting to the same
> scheduler in drm_sched_entity_add_dependency_cb().
>=20
> Yeah that suddenly starts to make sense.
>=20
> > Add drm_sched_wakeup() when entity_kill_job_work() to preventing
> > scheduler sleep and subsequent application hangs.
> >=20
> > Signed-off-by: Lin.Cao <lincao12@amd.com>
> > ---
> > =C2=A0 drivers/gpu/drm/scheduler/sched_entity.c | 1 +
> > =C2=A0 1 file changed, 1 insertion(+)
> >=20
> > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
> > b/drivers/gpu/drm/scheduler/sched_entity.c
> > index e671aa241720..a22b0f65558a 100644
> > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > @@ -180,6 +180,7 @@ static void
> > drm_sched_entity_kill_jobs_work(struct work_struct *wrk)
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_fence_finished(job=
->s_fence, -ESRCH);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN_ON(job->s_fence->parent=
);
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 job->sched->ops->free_job(jo=
b);
> > +=C2=A0=C2=A0=C2=A0=C2=A0 drm_sched_wakeup(job->sched);
>=20
> That should probably be after drm_sched_fence_scheduled().
>=20
> Alternatively we could also drop the optimization in
> drm_sched_entity_add_dependency_cb(), scheduling the work item again
> has only minimal overhead.
>=20
> Apart from that looks good to me.
>=20
> Regards,
> Christian.
>=20
> > =C2=A0 }
> > =C2=A0
> > =C2=A0 /* Signal the scheduler finished fence when the entity in
> > question is killed. */
>=20

