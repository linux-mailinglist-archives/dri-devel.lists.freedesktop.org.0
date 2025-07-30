Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F3A8B15A07
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jul 2025 09:56:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1A3510E41F;
	Wed, 30 Jul 2025 07:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.b="KC1syJUy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF5210E421;
 Wed, 30 Jul 2025 07:56:20 +0000 (UTC)
Received: from smtp2.mailbox.org (smtp2.mailbox.org
 [IPv6:2001:67c:2050:b231:465::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4bsPfm6Qhqz9sXg;
 Wed, 30 Jul 2025 09:56:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; 
 t=1753862177; h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ontXPx/waFW2vwfIZhpDrxs80xPxqKi4ay9J8j5IdJo=;
 b=KC1syJUy48BcRqN+svY6GQK8ljjnSpA06DlfPue5hKjzjG71lcZng0lgjaAwijMDItIiTx
 0sGs/9JAVW6TPvkUjRA01YM+OpdjKZh9lUp/7AOo85K0O03gz8p1B5ZOzrJ/SkIdJBPOjl
 2fLvd+1JOWCUnZ+0Z0LkOfmGWV7hTShJRwGNrdNLJtAy+ZEjQjeQ7xGDExMMFCDiVuvapz
 OufRhfvCjmKQ8ibDztQeUmXjPUBuDl7C/Uh1t/x+QDqmKvUM5b5zZQzTiGMZfR7T9mfy18
 vyeC30qhe/LgkZ0Bx9nsOQTCoXQgQeOelNvTwF7xIxwwIdmg1jZh7FXQ7qrICA==
Message-ID: <dda766b27e9a7035dee2f6368b882cc628a73772.camel@mailbox.org>
Subject: Re: [RFC v7 10/12] drm/sched: Break submission patterns with some
 randomness
From: Philipp Stanner <phasta@mailbox.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, Pierre-Eric Pelloux-Prayer
 <pierre-eric@damsy.net>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, Christian =?ISO-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Danilo Krummrich <dakr@kernel.org>, Matthew
 Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
Date: Wed, 30 Jul 2025 09:56:11 +0200
In-Reply-To: <0312116d-b216-4afb-bf9f-210b553fed7f@igalia.com>
References: <20250724141921.75583-1-tvrtko.ursulin@igalia.com>
 <20250724141921.75583-11-tvrtko.ursulin@igalia.com>
 <fe05e8fd-d56f-4b32-a65b-46c9ef6df9c7@damsy.net>
 <0312116d-b216-4afb-bf9f-210b553fed7f@igalia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MBO-RS-META: 1mzkczf3cpqwsa463waf8qbkcwfo7yts
X-MBO-RS-ID: 2d58de4d89f905860c1
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

On Mon, 2025-07-28 at 12:14 +0100, Tvrtko Ursulin wrote:
>=20
> On 28/07/2025 10:28, Pierre-Eric Pelloux-Prayer wrote:
> > Le 24/07/2025 =C3=A0 16:19, Tvrtko Ursulin a =C3=A9crit=C2=A0:
> > > GPUs generally don't implement preemption and DRM scheduler definitel=
y
> > > does not support it at the front end scheduling level. This means
> > > execution quanta can be quite long and is controlled by userspace,
> > > consequence of which is picking the "wrong" entity to run can have a
> > > larger negative effect than it would have with a virtual runtime base=
d=20
> > > CPU
> > > scheduler.
> > >=20
> > > Another important consideration is that rendering clients often have
> > > shallow submission queues, meaning they will be entering and exiting =
the
> > > scheduler's runnable queue often.
> > >=20
> > > Relevant scenario here is what happens when an entity re-joins the
> > > runnable queue with other entities already present. One cornerstone o=
f=20
> > > the
> > > virtual runtime algorithm is to let it re-join at the head and depend=
 on
> > > the virtual runtime accounting to sort out the order after an executi=
on
> > > quanta or two.
> > >=20
> > > However, as explained above, this may not work fully reliably in the =
GPU
> > > world. Entity could always get to overtake the existing entities, or =
not,
> > > depending on the submission order and rbtree equal key insertion
> > > behaviour.
> > >=20
> > > We can break this latching by adding some randomness for this specifi=
c
> > > corner case.
> > >=20
> > > If an entity is re-joining the runnable queue, was head of the queue =
the
> > > last time it got picked, and there is an already queued different ent=
ity
> > > of an equal scheduling priority, we can break the tie by randomly
> > > choosing
> > > the execution order between the two.
> > >=20
> > > For randomness we implement a simple driver global boolean which sele=
cts
> > > whether new entity will be first or not. Because the boolean is globa=
l=20
> > > and
> > > shared between all the run queues and entities, its actual effect can=
 be
> > > loosely called random. Under the assumption it will not always be the=
=20
> > > same
> > > entity which is re-joining the queue under these circumstances.
> > >=20
> > > Another way to look at this is that it is adding a little bit of limi=
ted
> > > random round-robin behaviour to the fair scheduling algorithm.
> > >=20
> > > Net effect is a significant improvemnt to the scheduling unit tests w=
hich
> > > check the scheduling quality for the interactive client running in
> > > parallel with GPU hogs.
> > >=20
> > > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > > Cc: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Cc: Danilo Krummrich <dakr@kernel.org>
> > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > Cc: Philipp Stanner <phasta@kernel.org>
> > > Cc: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> > > ---
> > > =C2=A0 drivers/gpu/drm/scheduler/sched_rq.c | 10 ++++++++++
> > > =C2=A0 1 file changed, 10 insertions(+)
> > >=20
> > > diff --git a/drivers/gpu/drm/scheduler/sched_rq.c b/drivers/gpu/drm/=
=20
> > > scheduler/sched_rq.c
> > > index d16ee3ee3653..087a6bdbb824 100644
> > > --- a/drivers/gpu/drm/scheduler/sched_rq.c
> > > +++ b/drivers/gpu/drm/scheduler/sched_rq.c
> > > @@ -147,6 +147,16 @@ drm_sched_entity_restore_vruntime(struct=20
> > > drm_sched_entity *entity,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 * Higher priority can go first.
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 */
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 vruntime =3D -us_to_ktime(rq_prio - prio);
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
tatic const int shuffle[2] =3D { -100, 100 };
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 s=
tatic bool r =3D 0;
> > > +
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /=
*
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 * For equal priority apply some randomness to break
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 * latching caused by submission patterns.
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 */
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v=
runtime =3D shuffle[r];
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 r=
 ^=3D 1;
> >=20
> > I don't understand why this is needed at all?
> >=20
> > I suppose this is related to how drm_sched_entity_save_vruntime saves a=
=20
> > relative vruntime (=3D entity rejoins with a 0 runtime would be impossi=
ble=20
> > otherwise) but I don't understand this either.
>=20
> Two things (and a bit more) to explain here for the record. And as=20
> agreed off-line I need to add some more code comments for this are in
> the next respin.
>=20
> First the saving of "vruntime - min_runtime" when entity exits the=20
> run-queue.
>=20
> That is a core CFS concept AFAIU which enables the relative position of=
=20
> the entity to be restored once it re-enters the rq.
>=20
> It only applies on the scenario when the picked entity was not the head=
=20
> of the queue, due the actual head being not runnable due a dependency.
>=20
> If the picked entity then leaves the queue and re-joins, this relative=
=20
> vruntime is used to put it back where it was relative to the unready=20
> entity (which may have became ready by now and so it needs to be picked=
=20
> next and not overtaken so easily.)

I'm afraid I also don't get it completely. So you're saying that with
this jitter-mechanism we can preserve the relative order of entities?
But the actual patch title says that it's about breaking such patterns,
or isn't it? "Break submission patterns"

Maybe you can help improve my understanding by us reversing the
question:

If that jitter-mechanism is dropped, what will be the negative
consequence?

Entities with similar vruntimes would always run in the same order,
correct? So the patch is not so much about GPU time fairness, but about
response / delay fairness.


P.

>=20
> It has to be the relative vruntime that is preserved, ie. entity which=
=20
> re-enters cannot simply keep its previous vruntime, since by then that=
=20
> could lag significantly behind the vruntime of other active entities,
> which in turn would mean the re-joining entity could be head of the=20
> queue for a long time.
>=20
> Second part is the special case from the quoted patch and that only=20
> applies to entities which are re-joining the queue after having been=20
> picked from the head _and_ there is another entity in the rq.
>=20
> By the nature of the CFS algorithm the re-joining entity continues with=
=20
> the vruntime assigned from the current rq min_vruntime. Which puts two=
=20
> entities with the same vruntime at the head of the queue and the actual=
=20
> picking order influenced by the submit order (FIFO) and rbtree sort=20
> order (did not check). But in any case it is not desirable for all the=
=20
> description of GPU scheduling weaknesses from the commit text (this patch=
).
>=20
> For this special case there are three sub-paths:
>=20
> =C2=A0 1. Re-joining entity is higher scheduling prio -> we pull its vrun=
time=20
> a tiny bit ahead of the min_vruntime so it runs first.
>=20
> =C2=A0 2. Lower re-joining prio -> the opposite of the above - we explici=
tly=20
> prevent it overtaking the higher priority head.
>=20
> =C2=A0 3. Equal prio -> apply some randomness as to which one runs first.
>=20
> Idea being avoidance of any "latching" of the execution order based on=
=20
> submission patterns. Which kind of applies a little bit of=20
> round/random-robin for this very specific case of equal priority entity=
=20
> re-joining at the top of the queue.
>=20
> Regards,
>=20
> Tvrtko
>=20

