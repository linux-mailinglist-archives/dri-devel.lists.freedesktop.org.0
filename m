Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A8FC34829
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 09:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18B2B10E132;
	Wed,  5 Nov 2025 08:40:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="RKckWx8v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2A4910E132
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Nov 2025 08:39:57 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4d1dzt5kTRz9vCR;
 Wed,  5 Nov 2025 09:39:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1762331994; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yWwJvJiQhpOXo2m19sGkCSOjZ04ykFuMGX6vhFuj3tE=;
 b=RKckWx8vDdQTusdYmMivfYpC8pyNxVxxyRQaZJGr1jrSW/C3l0nzoM4XYcmW8Cy1J7rC5r
 HYRjERxE9IwNErXsSuZ6HYdm1VGQweiq4T+z5ezEk5NRT8GgPlMjeH/ESD2P6nNAkIhqjd
 wDCJYEAyMduhm1TPBf0SIV+qSECt8/H5bm1x/UiArma2hA+Eo3tvgJaAcE7/0hwRhg+VGH
 S82Y2vOPgnk+JxHKpJ8yc34csNtsmbj3HX3APcn9rYv9oDJKCgGITFE70aKz080LL/C4Au
 Uum9s4JpN6OR1jMthMT0zlERq48Mpt4MRjvHs993szUW2H68wM8ogY4WnwsF5A==
Message-ID: <7808bc5fcac1236640f481733d1c8aaaf8accb02.camel@mailbox.org>
Subject: Re: [PATCH] drm/sched: replace use of system_wq with system_percpu_wq
From: Philipp Stanner <phasta@mailbox.org>
To: Marco Crivellari <marco.crivellari@suse.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>,  Michal Hocko <mhocko@suse.com>, Matthew Brost
 <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,  Philipp
 Stanner <phasta@kernel.org>, Christian Konig
 <ckoenig.leichtzumerken@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Date: Wed, 05 Nov 2025 09:39:46 +0100
In-Reply-To: <20251104165209.309545-1-marco.crivellari@suse.com>
References: <20251104165209.309545-1-marco.crivellari@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 6798g4q11qanmdn67zdf7c735ufzcbt6
X-MBO-RS-ID: ca2565784354206ff6b
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

nit: s/replace/Replace

On Tue, 2025-11-04 at 17:52 +0100, Marco Crivellari wrote:
> Currently if a user enqueue a work item using schedule_delayed_work() the

s/enqueue/enqueues

Also: maybe start the sentence with something like "In the general
workqueue implementation, if a user [=E2=80=A6]". Otherwise it at first rea=
ds
as if we're talking about a drm/sched user here.

In general, the commit message should focus more on drm/sched. See
below, too.

> used wq is "system_wq" (per-cpu wq) while queue_delayed_work() use
> WORK_CPU_UNBOUND (used when a cpu is not specified). The same applies to
> schedule_work() that is using system_wq and queue_work(), that makes use
> again of WORK_CPU_UNBOUND.
>=20
> This lack of consistentcy cannot be addressed without refactoring the API=
.
>=20
> This patch continues the effort to refactor worqueue APIs, which has begu=
n
> with the change introducing new workqueues and a new alloc_workqueue flag=
:
>=20
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")

From my POV it would be enough if you provide these commits in this
commit message and maybe a Link: to the overall discussion in the
workqueue subsystem / implementation.

You can give the details above if you want, but I think drm/sched
doesn't care too much about them. The drm/sched users who really care
about the timeout_wq's exact behavior use one they allocate themselves
anyways.

>=20
> system_wq should be the per-cpu workqueue, yet in this name nothing makes
> that clear, so replace system_wq with system_percpu_wq.
>=20
> The old wq (system_wq) will be kept for a few release cycles.

Please state in your commit message what you're actually doing to
drm/sched. Like:

"Use the successor of system_wq, system_percpu_wq, for the scheduler's
default timeout_wq. system_wq will be removed in a few release cycles."

>=20
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>
> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_main.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/sch=
eduler/sched_main.c
> index c39f0245e3a9..13192e99637a 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -1315,7 +1315,7 @@ int drm_sched_init(struct drm_gpu_scheduler *sched,=
 const struct drm_sched_init_
> =C2=A0	sched->name =3D args->name;
> =C2=A0	sched->timeout =3D args->timeout;
> =C2=A0	sched->hang_limit =3D args->hang_limit;
> -	sched->timeout_wq =3D args->timeout_wq ? args->timeout_wq : system_wq;
> +	sched->timeout_wq =3D args->timeout_wq ? args->timeout_wq : system_perc=
pu_wq;

Actual change looks fine by me.


Thanks for your patch,
P.

> =C2=A0	sched->score =3D args->score ? args->score : &sched->_score;
> =C2=A0	sched->dev =3D args->dev;
> =C2=A0

