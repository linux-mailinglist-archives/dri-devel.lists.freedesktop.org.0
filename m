Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69EAF6CB9E5
	for <lists+dri-devel@lfdr.de>; Tue, 28 Mar 2023 10:54:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99A4110E83C;
	Tue, 28 Mar 2023 08:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F28810E2E5
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Mar 2023 08:54:47 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1ph56E-0002sU-Jk; Tue, 28 Mar 2023 10:54:38 +0200
Message-ID: <2a84875dde6565842aa07ddb96245b7d939cb4fd.camel@pengutronix.de>
Subject: Re: [Regression] drm/scheduler: track GPU active time per entity
From: Lucas Stach <l.stach@pengutronix.de>
To: Danilo Krummrich <dakr@redhat.com>, daniel@ffwll.ch, Dave Airlie
 <airlied@gmail.com>, luben.tuikov@amd.com, Bagas Sanjaya
 <bagasdotme@gmail.com>,  andrey.grodzovsky@amd.com, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org,  linux-kernel@vger.kernel.org
Date: Tue, 28 Mar 2023 10:54:37 +0200
In-Reply-To: <3e00d8a9-b6c4-8202-4f2d-5a659c61d094@redhat.com>
References: <3e00d8a9-b6c4-8202-4f2d-5a659c61d094@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi Danilo,

Am Dienstag, dem 28.03.2023 um 02:57 +0200 schrieb Danilo Krummrich:
> Hi all,
>=20
> Commit df622729ddbf ("drm/scheduler: track GPU active time per entity")=
=20
> tries to track the accumulated time that a job was active on the GPU=20
> writing it to the entity through which the job was deployed to the=20
> scheduler originally. This is done within drm_sched_get_cleanup_job()=20
> which fetches a job from the schedulers pending_list.
>=20
> Doing this can result in a race condition where the entity is already=20
> freed, but the entity's newly added elapsed_ns field is still accessed=
=20
> once the job is fetched from the pending_list.
>=20
> After drm_sched_entity_destroy() being called it should be safe to free=
=20
> the structure that embeds the entity. However, a job originally handed=
=20
> over to the scheduler by this entity might still reside in the=20
> schedulers pending_list for cleanup after drm_sched_entity_destroy()=20
> already being called and the entity being freed. Hence, we can run into=
=20
> a UAF.
>=20
Sorry about that, I clearly didn't properly consider this case.

> In my case it happened that a job, as explained above, was just picked=
=20
> from the schedulers pending_list after the entity was freed due to the=
=20
> client application exiting. Meanwhile this freed up memory was already=
=20
> allocated for a subsequent client applications job structure again.=20
> Hence, the new jobs memory got corrupted. Luckily, I was able to=20
> reproduce the same corruption over and over again by just using=20
> deqp-runner to run a specific set of VK test cases in parallel.
>=20
> Fixing this issue doesn't seem to be very straightforward though (unless=
=20
> I miss something), which is why I'm writing this mail instead of sending=
=20
> a fix directly.
>=20
> Spontaneously, I see three options to fix it:
>=20
> 1. Rather than embedding the entity into driver specific structures=20
> (e.g. tied to file_priv) we could allocate the entity separately and=20
> reference count it, such that it's only freed up once all jobs that were=
=20
> deployed through this entity are fetched from the schedulers pending list=
.
>=20
My vote is on this or something in similar vain for the long term. I
have some hope to be able to add a GPU scheduling algorithm with a bit
more fairness than the current one sometime in the future, which
requires execution time tracking on the entities.

> 2. Somehow make sure drm_sched_entity_destroy() does block until all=20
> jobs deployed through this entity were fetched from the schedulers=20
> pending list. Though, I'm pretty sure that this is not really desirable.
>=20
> 3. Just revert the change and let drivers implement tracking of GPU=20
> active times themselves.
>=20
Given that we are already pretty late in the release cycle and etnaviv
being the only driver so far making use of the scheduler elapsed time
tracking I think the right short term solution is to either move the
tracking into etnaviv or just revert the change for now. I'll have a
look at this.

Regards,
Lucas

> In the case of just reverting the change I'd propose to also set a jobs=
=20
> entity pointer to NULL  once the job was taken from the entity, such=20
> that in case of a future issue we fail where the actual issue resides=20
> and to make it more obvious that the field shouldn't be used anymore=20
> after the job was taken from the entity.
>=20
> I'm happy to implement the solution we agree on. However, it might also=
=20
> make sense to revert the change until we have a solution in place. I'm=
=20
> also happy to send a revert with a proper description of the problem.=20
> Please let me know what you think.
>=20
> - Danilo
>=20

