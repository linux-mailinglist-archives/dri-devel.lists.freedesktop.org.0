Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 849D4C1FFED
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 13:26:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58FFF10E036;
	Thu, 30 Oct 2025 12:26:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="vYHaRMpx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8638610E036
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Oct 2025 12:26:20 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cy3Hs1HYnz9vBj;
 Thu, 30 Oct 2025 13:26:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1761827177; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9DK/EsSrv/ZUc4X4MrgLDSTB0kWrjlTtTs1nlO5FmUg=;
 b=vYHaRMpx01AqFN5eK8xNSNlujKnBCKhUWW+nXEEbLsTAXCQapvG+uBzxAT7/zTIq0Ocn4e
 EkNumxB1SbEdozNM9GV4IhJZqNaYp0US2CWJUfA7OPVFsZo2mgHeFN/mEG1drwN6+qIQYN
 tNqHw3eQgMfUbXto1Eu3Dcw6cSEUc9p5IDvdEviWqTSn7sVCqeEMRMyAPMC8mOxwkYYD4W
 R2sdzkDzqMigZ+YFphSmFs2aza7IBYMxkgnuj2l5u9fbuCZZhNwr08A2Kj+AR7Y6ioSeVF
 bRW6BQeov+jAFvcfaoKN/8AL5T0ShhlBcIyXaCPxACA21jk+LhcQQisqcPh2EA==
Message-ID: <c51ea5a408ca6d404074be1df219077457ea76f6.camel@mailbox.org>
Subject: Re: [PATCH v1] drm/sched: fix deadlock in
 drm_sched_entity_kill_jobs_cb
From: Philipp Stanner <phasta@mailbox.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>, phasta@kernel.org, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Matthew
 Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
 <sumit.semwal@linaro.org>
Cc: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Date: Thu, 30 Oct 2025 13:26:10 +0100
In-Reply-To: <442d0e70-c9e2-4bd6-a144-ea083dbf86d2@damsy.net>
References: <20251029091103.1159-1-pierre-eric.pelloux-prayer@amd.com>
 <fb2881006f843bd85dd02948c4467c81086effc8.camel@mailbox.org>
 <442d0e70-c9e2-4bd6-a144-ea083dbf86d2@damsy.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: t5i1pxoekhdn1m5qnn8hwnur5fmqbb8o
X-MBO-RS-ID: 8afa6dd1f8f1b2c6dfd
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

On Thu, 2025-10-30 at 13:06 +0100, Pierre-Eric Pelloux-Prayer wrote:
>=20
>=20
> Le 30/10/2025 =C3=A0 12:17, Philipp Stanner a =C3=A9crit=C2=A0:
> > On Wed, 2025-10-29 at 10:11 +0100, Pierre-Eric Pelloux-Prayer wrote:
> > > https://gitlab.freedesktop.org/mesa/mesa/-/issues/13908=C2=A0pointed =
out
> >=20
> > This link should be moved to the tag section at the bottom at a Closes:
> > tag. Optionally a Reported-by:, too.
>=20
> The bug report is about a different issue. The potential deadlock being f=
ixed by=20
> this patch was discovered while investigating it.
> I'll add a Reported-by tag though.
>=20
> >=20
> > > a possible deadlock:
> > >=20
> > > [ 1231.611031]=C2=A0 Possible interrupt unsafe locking scenario:
> > >=20
> > > [ 1231.611033]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU1
> > > [ 1231.611034]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ----=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ----
> > > [ 1231.611035]=C2=A0=C2=A0 lock(&xa->xa_lock#17);
> > > [ 1231.611038]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 local_irq_disable=
();
> > > [ 1231.611039]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock(&fence->lock=
);
> > > [ 1231.611041]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock(&xa->xa_lock=
#17);
> > > [ 1231.611044]=C2=A0=C2=A0 <Interrupt>
> > > [ 1231.611045]=C2=A0=C2=A0=C2=A0=C2=A0 lock(&fence->lock);
> > > [ 1231.611047]
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 *** DEADLOCK ***
> > >=20
> >=20
> > The commit message is lacking an explanation as to _how_ and _when_ the
> > deadlock comes to be. That's a prerequisite for understanding why the
> > below is the proper fix and solution.
>=20
> I copy-pasted a small chunk of the full deadlock analysis report included=
 in the=20
> ticket because it's 300+ lines long. Copying the full log isn't useful IM=
O, but=20
> I can add more context.

The log wouldn't be useful, but a human-generated explanation as you
detail it below.

>=20
> The problem is that a thread (CPU0 above) can lock the job's dependencies=
=20
> xa_array without disabling the interrupts.

Which drm_sched function would that be?

> If a fence signals while CPU0 holds this lock and drm_sched_entity_kill_j=
obs_cb=20
> is called, it will try to grab the xa_array lock which is not possible be=
cause=20
> CPU0 holds it already.

You mean an *interrupt* signals the fence? Shouldn't interrupt issues
be solved with spin_lock_irqdisable() =E2=80=93 but we can't have that beca=
use
it's the xarray doing that internally?

You don't have to explain that in this mail-thread, a v2 detailing that
would be suficient.

>=20
>=20
> >=20
> > The issue seems to be that you cannot perform certain tasks from within
> > that work item?

[=E2=80=A6]

> >=20
> > > +static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
> > > +					=C2=A0 struct dma_fence_cb *cb);
> > > +
> > > =C2=A0=C2=A0static void drm_sched_entity_kill_jobs_work(struct work_s=
truct *wrk)
> > > =C2=A0=C2=A0{
> > > =C2=A0=C2=A0	struct drm_sched_job *job =3D container_of(wrk, typeof(*=
job), work);
> > > -
> > > -	drm_sched_fence_scheduled(job->s_fence, NULL);
> > > -	drm_sched_fence_finished(job->s_fence, -ESRCH);
> > > -	WARN_ON(job->s_fence->parent);
> > > -	job->sched->ops->free_job(job);
> >=20
> > Can free_job() really not be called from within work item context?
>=20
> It's still called from drm_sched_entity_kill_jobs_work but the diff is sl=
ightly=20
> confusing.

OK, probably my bad. But just asking, do you use
git format-patch --histogram
?

histogram often produces better diffs than default.


P.
