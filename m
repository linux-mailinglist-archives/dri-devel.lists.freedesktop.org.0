Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 643ABC3EF15
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 09:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF6410E1AC;
	Fri,  7 Nov 2025 08:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="allEpq75";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50B5510E1AC
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Nov 2025 08:28:10 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org [10.196.197.202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4d2sdL5n5Bz9v92;
 Fri,  7 Nov 2025 09:28:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1762504086; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g6c+wR5OUX7a2v3uoQXxO3f6A3/Jg6yxUDY1v6h0RlM=;
 b=allEpq75HTp0dm+F3EGqJbCpsw/xZ6bs1pnpHxmFyRRv40d/qrdzHEnXr8AECKK1rZxArq
 4ClprlOnpVL5i6lKvyUvX2IYj+Bn+ohpiZPc3bGQv9SzkNgyV2csJgGDAm91wE4NN+oieu
 qrHCkceZMafCPjuCqeq5S8oSSkE7DrDtLmR5NXsYkQrENabaom34ONWWXv54mzAlbzxiCh
 hsUbeJpXOrUzRwxzkqDoKzgKSUwAAN9gWdI0Rj7rLbfkbLeRwCbMbIs/OeTU41NoQHD4Fr
 sO3NCzlEYeSuyuyfUkoRLAK4Efn54FZCkv4oeh0YhG4WLNYD+bHUa1WbhWvNDg==
Message-ID: <3b6c211d4da50273ac5441bc939dfadb537c655d.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/sched: Replace use of system_wq with
 system_percpu_wq
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
Date: Fri, 07 Nov 2025 09:28:00 +0100
In-Reply-To: <20251106150121.256367-1-marco.crivellari@suse.com>
References: <20251106150121.256367-1-marco.crivellari@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-ID: 1d6f8abc1971d72ad65
X-MBO-RS-META: b3x6mitjoinicedcwpy6bbgd61fqqxf5
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

On Thu, 2025-11-06 at 16:01 +0100, Marco Crivellari wrote:
> In the general workqueue implementation, if a user enqueues a work item
> using schedule_delayed_work() the used wq is "system_wq" (per-cpu wq)
> while queue_delayed_work() use WORK_CPU_UNBOUND (used when a cpu is not
> specified). The same applies to schedule_work() that is using system_wq
> and queue_work(), that makes use again of WORK_CPU_UNBOUND.
>=20
> This lack of consistency cannot be addressed without refactoring the API.
> For more details see the Link tag below.
>=20
> This continues the effort to refactor worqueue APIs, which has begun
> with the change introducing new workqueues and a new alloc_workqueue flag=
:
>=20
> commit 128ea9f6ccfb ("workqueue: Add system_percpu_wq and system_dfl_wq")
> commit 930c2ea566af ("workqueue: Add new WQ_PERCPU flag")
>=20
> Use the successor of system_wq, system_percpu_wq, for the scheduler's
> default timeout_wq. system_wq will be removed in a few release cycles.
>=20
> Link: https://lore.kernel.org/all/20250221112003.1dSuoGyc@linutronix.de/
> Suggested-by: Tejun Heo <tj@kernel.org>
> Signed-off-by: Marco Crivellari <marco.crivellari@suse.com>

Applied to drm-misc-next.

Thanks a lot
P.

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
> =C2=A0	sched->score =3D args->score ? args->score : &sched->_score;
> =C2=A0	sched->dev =3D args->dev;
> =C2=A0

