Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0814CCECD3
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 08:39:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3817710EEDA;
	Fri, 19 Dec 2025 07:39:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="nTvgXprA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A11A10EEDA
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Dec 2025 07:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1766129978;
 bh=HXAhA9wykRL4MR0xD5FP1QYOO/CimyBoEbZqgfveSjg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=nTvgXprAKPw/NtMbD58TTaNV/5/qo72OX+jz69Nut3HNZHxi9mBgH+z6CVVLst3Qe
 60zC96119xogjElcDxcYX979s74sPbGrUpZxVad1STmRlwU8oSQJ/tFr4PA0WknO/j
 J2ud7KWeQeduQctVUJxJJLY4Bj7GNixti2Mo5NJ2NSpqtgnwj4ZurS+5gEJopfYLFW
 /megWeHTqHs8l6Wl/Y+bQN7QUfT8r43A8StJRhxkcoK3yWK2bVxQN1yAWC5aMNEnVV
 x7yECvqRDbhriX6dgsK0mTCHq0nDXwmqNnDNs/aFJbIrHiNb/sR7c/ZRRLLqdUbEvh
 1hWAw2CMG1CJg==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits)
 server-digest SHA256) (No client certificate requested)
 (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id A1E5017E0C2E;
 Fri, 19 Dec 2025 08:39:37 +0100 (CET)
Date: Fri, 19 Dec 2025 08:39:33 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Chia-I Wu <olvaffe@gmail.com>
Cc: Steven Price <steven.price@arm.com>, Ketil Johnsen
 <ketil.johnsen@arm.com>, Liviu Dudau <liviu.dudau@arm.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Grant Likely
 <grant.likely@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/panthor: Evict groups before VM termination
Message-ID: <20251219083933.2dc9c009@fedora>
In-Reply-To: <CAPaKu7SY+jsUxyoiiBRUgH7_M3C0V1-Fv_ibCak_6X-saEZ+fw@mail.gmail.com>
References: <20251218162644.828495-1-ketil.johnsen@arm.com>
 <0939a54e-dc35-434b-9dbc-06837f04e62f@arm.com>
 <20251218185925.2aa246aa@fedora>
 <CAPaKu7SY+jsUxyoiiBRUgH7_M3C0V1-Fv_ibCak_6X-saEZ+fw@mail.gmail.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, 18 Dec 2025 14:54:35 -0800
Chia-I Wu <olvaffe@gmail.com> wrote:

> On Thu, Dec 18, 2025 at 10:36=E2=80=AFAM Boris Brezillon
> <boris.brezillon@collabora.com> wrote:
> >
> > On Thu, 18 Dec 2025 16:57:28 +0000
> > Steven Price <steven.price@arm.com> wrote:
> > =20
> > > On 18/12/2025 16:26, Ketil Johnsen wrote: =20
> > > > Ensure all related groups are evicted and suspended before VM
> > > > destruction takes place.
> > > >
> > > > This fixes an issue where panthor_vm_destroy() destroys and unmaps =
the
> > > > heap context while there are still on slot groups using this.
> > > > The FW will do a write out to the heap context when a CSG (group) is
> > > > suspended, so a premature unmap of the heap context will cause a
> > > > GPU page fault.
> > > > This page fault is quite harmless, and do not affect the continued
> > > > operation of the GPU.
> > > >
> > > > Fixes: 647810ec2476 ("drm/panthor: Add the MMU/VM logical block")
> > > > Co-developed-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > > Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
> > > > ---
> > > >  drivers/gpu/drm/panthor/panthor_mmu.c   |  4 ++++
> > > >  drivers/gpu/drm/panthor/panthor_sched.c | 16 ++++++++++++++++
> > > >  drivers/gpu/drm/panthor/panthor_sched.h |  1 +
> > > >  3 files changed, 21 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/panthor/panthor_mmu.c b/drivers/gpu/dr=
m/panthor/panthor_mmu.c
> > > > index 74230f7199121..0e4b301a9c70e 100644
> > > > --- a/drivers/gpu/drm/panthor/panthor_mmu.c
> > > > +++ b/drivers/gpu/drm/panthor/panthor_mmu.c
> > > > @@ -1537,6 +1537,10 @@ static void panthor_vm_destroy(struct pantho=
r_vm *vm)
> > > >
> > > >     vm->destroyed =3D true;
> > > >
> > > > +   /* Tell scheduler to stop all GPU work related to this VM */
> > > > +   if (refcount_read(&vm->as.active_cnt) > 0)
> > > > +           panthor_sched_prepare_for_vm_destruction(vm->ptdev);
> > > > +
> > > >     mutex_lock(&vm->heaps.lock);
> > > >     panthor_heap_pool_destroy(vm->heaps.pool);
> > > >     vm->heaps.pool =3D NULL; =20
> Is it better to remove the panthor_heap_pool_destroy call here instead
> and let panthor_vm_free take care of it?

We can't because the heap_pool contains heap chunks (kernel BOs) that
are mapped in the very same VM, thus creating a circular ref. The whole
point of calling panthor_heap_pool_destroy() here is to kill this
circular ref. We could introduce the concept of weak and hard VM refs,
but I'm not sure it's worth it.

>=20
> > > > diff --git a/drivers/gpu/drm/panthor/panthor_sched.c b/drivers/gpu/=
drm/panthor/panthor_sched.c
> > > > index f680edcd40aad..fbbaab9b25efb 100644
> > > > --- a/drivers/gpu/drm/panthor/panthor_sched.c
> > > > +++ b/drivers/gpu/drm/panthor/panthor_sched.c
> > > > @@ -2930,6 +2930,22 @@ void panthor_sched_report_mmu_fault(struct p=
anthor_device *ptdev)
> > > >             sched_queue_delayed_work(ptdev->scheduler, tick, 0);
> > > >  }
> > > >
> > > > +void panthor_sched_prepare_for_vm_destruction(struct panthor_devic=
e *ptdev)
> > > > +{
> > > > +   /* FW can write out internal state, like the heap context, duri=
ng CSG
> > > > +    * suspend. It is therefore important that the scheduler has fu=
lly
> > > > +    * evicted any pending and related groups before VM destruction=
 can
> > > > +    * safely continue. Failure to do so can lead to GPU page fault=
s.
> > > > +    * A controlled termination of a Panthor instance involves dest=
roying
> > > > +    * the group(s) before the VM. This means any relevant group ev=
iction
> > > > +    * has already been initiated by this point, and we just need to
> > > > +    * ensure that any pending tick_work() has been completed.
> > > > +    */
> > > > +   if (ptdev->scheduler) {
> > > > +           flush_work(&ptdev->scheduler->tick_work.work);
> > > > +   } =20
> > >
> > > NIT: braces not needed.
> > >
> > > But I'm also struggling to understand in what situation ptdev->schedu=
ler
> > > would be NULL? =20
> >
> > I thought it could happen if the FW initialization fails in the middle,
> > and the FW VM is destroyed before the scheduler had a chance to
> > initialize, but it turns out the FW logic never calls
> > panthor_vm_destroy().
> > =20
> > >
> > > Thanks,
> > > Steve
> > > =20
> > > > +}
> > > > +
> > > >  void panthor_sched_resume(struct panthor_device *ptdev)
> > > >  {
> > > >     /* Force a tick to re-evaluate after a resume. */
> > > > diff --git a/drivers/gpu/drm/panthor/panthor_sched.h b/drivers/gpu/=
drm/panthor/panthor_sched.h
> > > > index f4a475aa34c0a..9a8692de8aded 100644
> > > > --- a/drivers/gpu/drm/panthor/panthor_sched.h
> > > > +++ b/drivers/gpu/drm/panthor/panthor_sched.h
> > > > @@ -50,6 +50,7 @@ void panthor_sched_suspend(struct panthor_device =
*ptdev);
> > > >  void panthor_sched_resume(struct panthor_device *ptdev);
> > > >
> > > >  void panthor_sched_report_mmu_fault(struct panthor_device *ptdev);
> > > > +void panthor_sched_prepare_for_vm_destruction(struct panthor_devic=
e *ptdev);
> > > >  void panthor_sched_report_fw_events(struct panthor_device *ptdev, =
u32 events);
> > > >
> > > >  void panthor_fdinfo_gather_group_samples(struct panthor_file *pfil=
e); =20
> > > =20
> > =20

