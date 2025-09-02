Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B87B3F6AF
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 09:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5882C10E242;
	Tue,  2 Sep 2025 07:27:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="cQprZjxX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED30B10E555
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 07:27:32 +0000 (UTC)
Received: from smtp202.mailbox.org (smtp202.mailbox.org
 [IPv6:2001:67c:2050:b231:465::202])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4cGHPs58DJz9spP;
 Tue,  2 Sep 2025 09:27:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1756798049; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yG8I1xuTHEhEIkmbynHckFwP9cXa9p2PM0q5O3/0wtg=;
 b=cQprZjxXkdXeulkN41CYFIAnkNH/Qp3/xIVXYGi/Dddld7LiwABAnVp+y1Dj0cxHUNZgtf
 RePcPQWbQmleFUPyg8Rn3rhjqJx81lFVLLjyBK97BPH9CbQ5y2Bg1XkVo5HnMTRSz63wq/
 f5e0ecoOHeclDG2HCUrBEthyr2ADxK1DlXv319P1gUTRYR3cDIyoZ9yauIkAjljBco/JBV
 Z6GTe7BWIUZT2/7z5sxnPiuhLR2eO3LxooKIbs2NUz+WiSppJIgVbV2TLhHMpqV9RiZ4gJ
 KrJ1DtGp/B6PlbUNFBswKPIDvPr59R+wnWbkFsktF41aTFCIJSSUIBQj8sWAAw==
Message-ID: <da59f28c7d8b3d83833aa0494b3b198335cf588f.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/sched: Fix racy access to
 drm_sched_entity.dependency
From: Philipp Stanner <phasta@mailbox.org>
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, 
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich
 <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,  Christian
 =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 02 Sep 2025 09:27:24 +0200
In-Reply-To: <20250901124032.1955-1-pierre-eric.pelloux-prayer@amd.com>
References: <20250901124032.1955-1-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: m9kgt19mrt1xki6y19ipjzxmsq48bans
X-MBO-RS-ID: e19ebd61c6c47cd73d7
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

On Mon, 2025-09-01 at 14:40 +0200, Pierre-Eric Pelloux-Prayer wrote:
> The drm_sched_job_unschedulable trace point can access
> entity->dependency after it was cleared by the callback
> installed in drm_sched_entity_add_dependency_cb, causing:
>=20
> BUG: kernel NULL pointer dereference, address: 0000000000000020
> [...]
> Workqueue: comp_1.1.0 drm_sched_run_job_work [gpu_sched]
> RIP: 0010:trace_event_raw_event_drm_sched_job_unschedulable+0x70/0xd0 [gp=
u_sched]
>=20
> To fix this we either need to keep a reference to the fence before
> setting up the callbacks, or move the trace_drm_sched_job_unschedulable
> calls into drm_sched_entity_add_dependency_cb where they can be
> done earlier.
>=20
> Fixes: 76d97c870f29 ("drm/sched: Trace dependencies for GPU jobs")
>=20
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd=
.com>
> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Applied to drm-misc-next

Thx
P.

> ---
> =C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 11 +++++++----
> =C2=A01 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/s=
cheduler/sched_entity.c
> index 8867b95ab089..3d06f72531ba 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -391,7 +391,8 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
> =C2=A0 * Add a callback to the current dependency of the entity to wake u=
p the
> =C2=A0 * scheduler when the entity becomes available.
> =C2=A0 */
> -static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *=
entity)
> +static bool drm_sched_entity_add_dependency_cb(struct drm_sched_entity *=
entity,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_job *sched_jo=
b)
> =C2=A0{
> =C2=A0	struct drm_gpu_scheduler *sched =3D entity->rq->sched;
> =C2=A0	struct dma_fence *fence =3D entity->dependency;
> @@ -421,6 +422,10 @@ static bool drm_sched_entity_add_dependency_cb(struc=
t drm_sched_entity *entity)
> =C2=A0		entity->dependency =3D fence;
> =C2=A0	}
> =C2=A0
> +	if (trace_drm_sched_job_unschedulable_enabled() &&
> +	=C2=A0=C2=A0=C2=A0 !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &entity->depe=
ndency->flags))
> +		trace_drm_sched_job_unschedulable(sched_job, entity->dependency);
> +
> =C2=A0	if (!dma_fence_add_callback(entity->dependency, &entity->cb,
> =C2=A0				=C2=A0=C2=A0=C2=A0 drm_sched_entity_wakeup))
> =C2=A0		return true;
> @@ -461,10 +466,8 @@ struct drm_sched_job *drm_sched_entity_pop_job(struc=
t drm_sched_entity *entity)
> =C2=A0
> =C2=A0	while ((entity->dependency =3D
> =C2=A0			drm_sched_job_dependency(sched_job, entity))) {
> -		if (drm_sched_entity_add_dependency_cb(entity)) {
> -			trace_drm_sched_job_unschedulable(sched_job, entity->dependency);
> +		if (drm_sched_entity_add_dependency_cb(entity, sched_job))
> =C2=A0			return NULL;
> -		}
> =C2=A0	}
> =C2=A0
> =C2=A0	/* skip jobs from entity that marked guilty */

