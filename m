Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 560296D96F3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 14:19:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8879610E2E4;
	Thu,  6 Apr 2023 12:19:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7DB10E2E4
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 12:19:45 +0000 (UTC)
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77]
 helo=[IPv6:::1]) by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <l.stach@pengutronix.de>)
 id 1pkOaJ-0007Oi-3b; Thu, 06 Apr 2023 14:19:23 +0200
Message-ID: <dc41058a457b737fee8d366c7aa5467ef5156a1a.camel@pengutronix.de>
Subject: Re: [Regression] drm/scheduler: track GPU active time per entity
From: Lucas Stach <l.stach@pengutronix.de>
To: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 06 Apr 2023 14:19:20 +0200
In-Reply-To: <ZC62cxVD5xc31FEL@phenom.ffwll.local>
References: <3e00d8a9-b6c4-8202-4f2d-5a659c61d094@redhat.com>
 <2a84875dde6565842aa07ddb96245b7d939cb4fd.camel@pengutronix.de>
 <8b28151c-f2db-af3f-8dff-87dd5d57417b@amd.com>
 <3004a2bf-e725-643e-82af-8a217784e796@redhat.com>
 <013781a3-5abd-8c66-8a0a-dd36c9c487af@amd.com>
 <28d10733-b217-7ccc-4b8c-54bdc8249234@amd.com>
 <CAKMK7uFeeAaG8+1EutgMtmVANTb-acL0faEkJfUp1_35rSjaEg@mail.gmail.com>
 <9c72c7162da56234addd7083ec774e525a13957c.camel@pengutronix.de>
 <ZC62cxVD5xc31FEL@phenom.ffwll.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
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
Cc: Matthew Brost <matthew.brost@intel.com>, andrey.grodzovsky@amd.com,
 tvrtko.ursulin@linux.intel.com, lina@asahilina.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Luben Tuikov <luben.tuikov@amd.com>, Danilo Krummrich <dakr@redhat.com>,
 yuq825@gmail.com, Bagas Sanjaya <bagasdotme@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Donnerstag, dem 06.04.2023 um 14:09 +0200 schrieb Daniel Vetter:
> On Thu, Apr 06, 2023 at 12:45:12PM +0200, Lucas Stach wrote:
> > Am Donnerstag, dem 06.04.2023 um 10:27 +0200 schrieb Daniel Vetter:
> > > On Thu, 6 Apr 2023 at 10:22, Christian K=C3=B6nig <christian.koenig@a=
md.com> wrote:
> > > >=20
> > > > Am 05.04.23 um 18:09 schrieb Luben Tuikov:
> > > > > On 2023-04-05 10:05, Danilo Krummrich wrote:
> > > > > > On 4/4/23 06:31, Luben Tuikov wrote:
> > > > > > > On 2023-03-28 04:54, Lucas Stach wrote:
> > > > > > > > Hi Danilo,
> > > > > > > >=20
> > > > > > > > Am Dienstag, dem 28.03.2023 um 02:57 +0200 schrieb Danilo K=
rummrich:
> > > > > > > > > Hi all,
> > > > > > > > >=20
> > > > > > > > > Commit df622729ddbf ("drm/scheduler: track GPU active tim=
e per entity")
> > > > > > > > > tries to track the accumulated time that a job was active=
 on the GPU
> > > > > > > > > writing it to the entity through which the job was deploy=
ed to the
> > > > > > > > > scheduler originally. This is done within drm_sched_get_c=
leanup_job()
> > > > > > > > > which fetches a job from the schedulers pending_list.
> > > > > > > > >=20
> > > > > > > > > Doing this can result in a race condition where the entit=
y is already
> > > > > > > > > freed, but the entity's newly added elapsed_ns field is s=
till accessed
> > > > > > > > > once the job is fetched from the pending_list.
> > > > > > > > >=20
> > > > > > > > > After drm_sched_entity_destroy() being called it should b=
e safe to free
> > > > > > > > > the structure that embeds the entity. However, a job orig=
inally handed
> > > > > > > > > over to the scheduler by this entity might still reside i=
n the
> > > > > > > > > schedulers pending_list for cleanup after drm_sched_entit=
y_destroy()
> > > > > > > > > already being called and the entity being freed. Hence, w=
e can run into
> > > > > > > > > a UAF.
> > > > > > > > >=20
> > > > > > > > Sorry about that, I clearly didn't properly consider this c=
ase.
> > > > > > > >=20
> > > > > > > > > In my case it happened that a job, as explained above, wa=
s just picked
> > > > > > > > > from the schedulers pending_list after the entity was fre=
ed due to the
> > > > > > > > > client application exiting. Meanwhile this freed up memor=
y was already
> > > > > > > > > allocated for a subsequent client applications job struct=
ure again.
> > > > > > > > > Hence, the new jobs memory got corrupted. Luckily, I was =
able to
> > > > > > > > > reproduce the same corruption over and over again by just=
 using
> > > > > > > > > deqp-runner to run a specific set of VK test cases in par=
allel.
> > > > > > > > >=20
> > > > > > > > > Fixing this issue doesn't seem to be very straightforward=
 though (unless
> > > > > > > > > I miss something), which is why I'm writing this mail ins=
tead of sending
> > > > > > > > > a fix directly.
> > > > > > > > >=20
> > > > > > > > > Spontaneously, I see three options to fix it:
> > > > > > > > >=20
> > > > > > > > > 1. Rather than embedding the entity into driver specific =
structures
> > > > > > > > > (e.g. tied to file_priv) we could allocate the entity sep=
arately and
> > > > > > > > > reference count it, such that it's only freed up once all=
 jobs that were
> > > > > > > > > deployed through this entity are fetched from the schedul=
ers pending list.
> > > > > > > > >=20
> > > > > > > > My vote is on this or something in similar vain for the lon=
g term. I
> > > > > > > > have some hope to be able to add a GPU scheduling algorithm=
 with a bit
> > > > > > > > more fairness than the current one sometime in the future, =
which
> > > > > > > > requires execution time tracking on the entities.
> > > > > > > Danilo,
> > > > > > >=20
> > > > > > > Using kref is preferable, i.e. option 1 above.
> > > > > > I think the only real motivation for doing that would be for ge=
nerically
> > > > > > tracking job statistics within the entity a job was deployed th=
rough. If
> > > > > > we all agree on tracking job statistics this way I am happy to =
prepare a
> > > > > > patch for this option and drop this one:
> > > > > > https://lore.kernel.org/all/20230331000622.4156-1-dakr@redhat.c=
om/T/#u
> > > > > Hmm, I never thought about "job statistics" when I preferred usin=
g kref above.
> > > > > The reason kref is attractive is because one doesn't need to worr=
y about
> > > > > it--when the last user drops the kref, the release is called to d=
o
> > > > > housekeeping. If this never happens, we know that we have a bug t=
o debug.
> > > >=20
> > > > Yeah, reference counting unfortunately have some traps as well. For
> > > > example rarely dropping the last reference from interrupt context o=
r
> > > > with some unexpected locks help when the cleanup function doesn't e=
xpect
> > > > that is a good recipe for problems as well.
> > > >=20
> > Fully agreed.
> >=20
> > > > > Regarding the patch above--I did look around the code, and it see=
ms safe,
> > > > > as per your analysis, I didn't see any reference to entity after =
job submission,
> > > > > but I'll comment on that thread as well for the record.
> > > >=20
> > > > Reference counting the entities was suggested before. The intention=
ally
> > > > avoided that so far because the entity might be the tip of the iceb=
erg
> > > > of stuff you need to keep around.
> > > >=20
> > > > For example for command submission you also need the VM and when yo=
u
> > > > keep the VM alive you also need to keep the file private alive....
> > >=20
> > > Yeah refcounting looks often like the easy way out to avoid
> > > use-after-free issue, until you realize you've just made lifetimes
> > > unbounded and have some enourmous leaks: entity keeps vm alive, vm
> > > keeps all the bo alives, somehow every crash wastes more memory
> > > because vk_device_lost means userspace allocates new stuff for
> > > everything.
> > >=20
> > > If possible a lifetime design where lifetimes have hard bounds and yo=
u
> > > just borrow a reference under a lock (or some other ownership rule) i=
s
> > > generally much more solid. But also much harder to design correctly
> > > :-/
> > >=20
> > The use we are discussing here is to keep the entity alive as long as
> > jobs from that entity are still active on the HW. While there are no
> > hard bounds on when a job will get inactive, at least it's not
> > unbounded. On a crash/fault the job will be removed from the hardware
> > pretty soon.
> >=20
> > Well behaved jobs after a application shutdown might take a little
> > longer, but I don't really see the new problem with keeping the entity
> > alive? As long as a job is active on the hardware, we can't throw out
> > the VM or BOs, no difference whether the entity is kept alive or not.
> >=20
> > Some hardware might have ways to expedite job inactivation by
> > deactivating scheduling queues, or just taking a fault, but for some HW
> > we'll just have to wait for the job to finish.
>=20
> Shouldn't the scheduler's timed_out/tdr logic take care of these? It's
> probably not good to block in something like the close(drmfd) or process
> exit() for these, but it's all dma_fence underneath and those _must_
> singal in finite time no matter what. So shouldn't be a deadlock problem,
> but might still be a "userspace really doesn't like a big stall there"
> problem.

I'm not sure if we are talking past each other here. I don't really
follow where you see the problem here?

If the hardware works as expected and the job is behaving well, it will
finish in finite time when the HW is done with the job. When the job is
bad and crashes the HW, sure it will be shot down by the timeout
handling. Both cases will signal the fences and clean up resources
eventually.

Keeping the scheduler entity alive is really orthogonal to that. If the
entity is kept alive until the job is cleaned up we could potentially
add more common state, like the GPU time tracking, to the entity
without the risk of use after free.

Regards,
Lucas
