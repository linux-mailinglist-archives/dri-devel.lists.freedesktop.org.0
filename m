Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E5EB3FE9D
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 13:54:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C2D10E685;
	Tue,  2 Sep 2025 11:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="rTEFP3Ih";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B351610E685
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 11:54:11 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cGPKX0wrhz9tR3;
 Tue,  2 Sep 2025 13:54:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1756814048; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CQfOullEKJbtvzY93DucdIHN8FLO7u/qthSzwSFy9vY=;
 b=rTEFP3IhcEDcVCKEjC5sR0s5bQ98CVeCGFYfUfjXo02gK9IHf00Hy1WOb8Cl/6dbDQTvf8
 aU6bDns+h/UP0BSx8buaioiXnuDHPkDK217eACCfdIxVTROTteaVyIOuwf+ASPL+mArPIe
 KNWe8aHo9fUnd1EnmO2Qt53sH62Y5YM4rYq8q8cXucJpwM7CqFbfxC+L2xtHuy6Brs5pOs
 9PgPDg1K4ga4+tlu5HZTINpLIbp06aUItBpa0RuX1AhFQwZpuEJEF8wSlPeW2P7DqHs+SL
 qiISZS+J3ATfBvVVtsuu1pjByNlOSNvavaPXyQawYgG+ZtKAPiss8R6OvsA1Og==
Message-ID: <3ac127e7ae0c71c354eead23a77d2006bde42692.camel@mailbox.org>
Subject: Re: [PATCH v2] drm/sched: Fix racy access to
 drm_sched_entity.dependency
From: Philipp Stanner <phasta@mailbox.org>
To: phasta@kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>, Matthew
 Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Tue, 02 Sep 2025 13:54:02 +0200
In-Reply-To: <b40a3e3a75a8f504f3f0e1ed678eadce9a54baf5.camel@mailbox.org>
References: <20250901124032.1955-1-pierre-eric.pelloux-prayer@amd.com>
 <da59f28c7d8b3d83833aa0494b3b198335cf588f.camel@mailbox.org>
 <b9f7a493-5611-4450-a26a-10b03d1dc313@igalia.com>
 <22e70ef7472310ad5147f934044a7ba0e02e02d6.camel@mailbox.org>
 <b40a3e3a75a8f504f3f0e1ed678eadce9a54baf5.camel@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: d14s54ed9xbycoz7nw4dyh9twrrtknpx
X-MBO-RS-ID: cc990f10a1ae4e576e8
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

On Tue, 2025-09-02 at 10:22 +0200, Philipp Stanner wrote:
> On Tue, 2025-09-02 at 10:18 +0200, Philipp Stanner wrote:
> > On Tue, 2025-09-02 at 08:59 +0100, Tvrtko Ursulin wrote:
> > >=20
> > > On 02/09/2025 08:27, Philipp Stanner wrote:
> > > > On Mon, 2025-09-01 at 14:40 +0200, Pierre-Eric Pelloux-Prayer wrote=
:
> > > > > The drm_sched_job_unschedulable trace point can access
> > > > > entity->dependency after it was cleared by the callback
> > > > > installed in drm_sched_entity_add_dependency_cb, causing:
> > > > >=20
> > > > > BUG: kernel NULL pointer dereference, address: 0000000000000020
> > > > > [...]
> > > > > Workqueue: comp_1.1.0 drm_sched_run_job_work [gpu_sched]
> > > > > RIP: 0010:trace_event_raw_event_drm_sched_job_unschedulable+0x70/=
0xd0 [gpu_sched]
> > > > >=20
> > > > > To fix this we either need to keep a reference to the fence befor=
e
> > > > > setting up the callbacks, or move the trace_drm_sched_job_unsched=
ulable
> > > > > calls into drm_sched_entity_add_dependency_cb where they can be
> > > > > done earlier.
> > > > >=20
> > > > > Fixes: 76d97c870f29 ("drm/sched: Trace dependencies for GPU jobs"=
)
> > > > >=20
> > > > > Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-pr=
ayer@amd.com>
> > > > > Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > >=20
> > > > Applied to drm-misc-next
> > >=20
> > > Shouldn't it have been drm-misc-fixes?
> >=20
> > I considered that, but thought not: the fixed commit is only in this rc
> > (v6.17), and in this case the committer guidelines say it should go to
> > misc-next:
> >=20
> > https://drm.pages.freedesktop.org/maintainer-tools/committer/committer-=
drm-misc.html
>=20
> OK, wait, the opposite is the case. I slipped to the wrong branch in
> the diagram.
>=20
> Oh dear. My coffee machine broke a few days ago, and it shows.
>=20
> My bad, sorry. Let me ping the drm maintainers to sort that one out.

Maxime was so kind to fix this for me.
Merci, Maxime, and sorry guys.

Is now on drm-misc-fixes and we're good.

P.

>=20
> P.
>=20
>=20
>=20
> >=20
> > Same reason we don't need to +Cc stable.
> >=20
> > But correct me if I made a mistake.
> >=20
> > P.
> >=20
> >=20
> > >=20
> > > Regards,
> > >=20
> > > Tvrtko
> > >=20
> > > > > ---
> > > > > =C2=A0=C2=A0drivers/gpu/drm/scheduler/sched_entity.c | 11 +++++++=
----
> > > > > =C2=A0=C2=A01 file changed, 7 insertions(+), 4 deletions(-)
> > > > >=20
> > > > > diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/g=
pu/drm/scheduler/sched_entity.c
> > > > > index 8867b95ab089..3d06f72531ba 100644
> > > > > --- a/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> > > > > @@ -391,7 +391,8 @@ EXPORT_SYMBOL(drm_sched_entity_set_priority);
> > > > > =C2=A0=C2=A0 * Add a callback to the current dependency of the en=
tity to wake up the
> > > > > =C2=A0=C2=A0 * scheduler when the entity becomes available.
> > > > > =C2=A0=C2=A0 */
> > > > > -static bool drm_sched_entity_add_dependency_cb(struct drm_sched_=
entity *entity)
> > > > > +static bool drm_sched_entity_add_dependency_cb(struct drm_sched_=
entity *entity,
> > > > > +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_sched_job *=
sched_job)
> > > > > =C2=A0=C2=A0{
> > > > > =C2=A0=C2=A0	struct drm_gpu_scheduler *sched =3D entity->rq->sche=
d;
> > > > > =C2=A0=C2=A0	struct dma_fence *fence =3D entity->dependency;
> > > > > @@ -421,6 +422,10 @@ static bool drm_sched_entity_add_dependency_=
cb(struct drm_sched_entity *entity)
> > > > > =C2=A0=C2=A0		entity->dependency =3D fence;
> > > > > =C2=A0=C2=A0	}
> > > > > =C2=A0=20
> > > > > +	if (trace_drm_sched_job_unschedulable_enabled() &&
> > > > > +	=C2=A0=C2=A0=C2=A0 !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &enti=
ty->dependency->flags))
> > > > > +		trace_drm_sched_job_unschedulable(sched_job, entity->dependenc=
y);
> > > > > +
> > > > > =C2=A0=C2=A0	if (!dma_fence_add_callback(entity->dependency, &ent=
ity->cb,
> > > > > =C2=A0=C2=A0				=C2=A0=C2=A0=C2=A0 drm_sched_entity_wakeup))
> > > > > =C2=A0=C2=A0		return true;
> > > > > @@ -461,10 +466,8 @@ struct drm_sched_job *drm_sched_entity_pop_j=
ob(struct drm_sched_entity *entity)
> > > > > =C2=A0=20
> > > > > =C2=A0=C2=A0	while ((entity->dependency =3D
> > > > > =C2=A0=C2=A0			drm_sched_job_dependency(sched_job, entity))) {
> > > > > -		if (drm_sched_entity_add_dependency_cb(entity)) {
> > > > > -			trace_drm_sched_job_unschedulable(sched_job, entity->dependen=
cy);
> > > > > +		if (drm_sched_entity_add_dependency_cb(entity, sched_job))
> > > > > =C2=A0=C2=A0			return NULL;
> > > > > -		}
> > > > > =C2=A0=C2=A0	}
> > > > > =C2=A0=20
> > > > > =C2=A0=C2=A0	/* skip jobs from entity that marked guilty */
> > > >=20
> > >=20
> >=20
>=20

