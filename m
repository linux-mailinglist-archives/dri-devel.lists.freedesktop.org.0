Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D44675246
	for <lists+dri-devel@lfdr.de>; Fri, 20 Jan 2023 11:22:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C73210E0E8;
	Fri, 20 Jan 2023 10:22:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467B310E0E8
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Jan 2023 10:22:50 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id D9DA9660230B;
 Fri, 20 Jan 2023 10:22:48 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1674210169;
 bh=ptuRG7LsHsZU+oAQngzoPiiWincIk39cXkLHaUC2kH4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aguffQLM2OByZw7hYXQQsNkRpGNUop95upx6HL0+VNyx2geBnfNqmKDkfm8o62Le0
 pwo/nZquimhIuwVefdXM2IoMjYgw00WAU1hk8oN/dv+DE2O7z1sFT26kZtvOCoSjTT
 VM2L4kGi0IAZZnXSzD/U9TgDhFocasHvYGutEF3uyPfdirZ6czeG0AVJGY+SF5e4P2
 +92ZYVZzSLyFJ8Z2TJgVaKT0CWrN0fbhvkgi7l7CsW8ydBIrB3ONqhb2IUlc6S1bkB
 8jIZ6wezoyDPjds5luE8Zfldya1mUFcrhGGuT6vlenyrSQwNuDt9smC6eaHf+M8Xhr
 bdsVgQIWOF9ag==
Date: Fri, 20 Jan 2023 11:22:45 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH drm-next 13/14] drm/nouveau: implement new VM_BIND UAPI
Message-ID: <20230120112245.0fc88338@collabora.com>
In-Reply-To: <Y8lx7nAh/PEqiWSl@DUT025-TGLU.fm.intel.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-14-dakr@redhat.com>
 <e371e8a1-88f8-1309-07ca-f48f4157fec8@shipmail.org>
 <8e10b46c-f934-8eee-904e-b3d8a7644a71@redhat.com>
 <Y8jOCE/PyNZ2Z6aX@DUT025-TGLU.fm.intel.com>
 <6f7d3389-aaf7-ce79-afbb-76abc446d442@redhat.com>
 <Y8lx7nAh/PEqiWSl@DUT025-TGLU.fm.intel.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
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
Cc: Danilo Krummrich <dakr@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 Jan 2023 16:38:06 +0000
Matthew Brost <matthew.brost@intel.com> wrote:

> On Thu, Jan 19, 2023 at 04:36:43PM +0100, Danilo Krummrich wrote:
> > On 1/19/23 05:58, Matthew Brost wrote: =20
> > > On Thu, Jan 19, 2023 at 04:44:23AM +0100, Danilo Krummrich wrote: =20
> > > > On 1/18/23 21:37, Thomas Hellstr=C3=B6m (Intel) wrote: =20
> > > > >=20
> > > > > On 1/18/23 07:12, Danilo Krummrich wrote: =20
> > > > > > This commit provides the implementation for the new uapi motiva=
ted by the
> > > > > > Vulkan API. It allows user mode drivers (UMDs) to:
> > > > > >=20
> > > > > > 1) Initialize a GPU virtual address (VA) space via the new
> > > > > >  =C2=A0=C2=A0=C2=A0 DRM_IOCTL_NOUVEAU_VM_INIT ioctl for UMDs to=
 specify the portion of VA
> > > > > >  =C2=A0=C2=A0=C2=A0 space managed by the kernel and userspace, =
respectively.
> > > > > >=20
> > > > > > 2) Allocate and free a VA space region as well as bind and unbi=
nd memory
> > > > > >  =C2=A0=C2=A0=C2=A0 to the GPUs VA space via the new DRM_IOCTL_=
NOUVEAU_VM_BIND ioctl.
> > > > > >  =C2=A0=C2=A0=C2=A0 UMDs can request the named operations to be=
 processed either
> > > > > >  =C2=A0=C2=A0=C2=A0 synchronously or asynchronously. It support=
s DRM syncobjs
> > > > > >  =C2=A0=C2=A0=C2=A0 (incl. timelines) as synchronization mechan=
ism. The management of the
> > > > > >  =C2=A0=C2=A0=C2=A0 GPU VA mappings is implemented with the DRM=
 GPU VA manager.
> > > > > >=20
> > > > > > 3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioc=
tl. The
> > > > > >  =C2=A0=C2=A0=C2=A0 execution happens asynchronously. It suppor=
ts DRM syncobj (incl.
> > > > > >  =C2=A0=C2=A0=C2=A0 timelines) as synchronization mechanism. DR=
M GEM object locking is
> > > > > >  =C2=A0=C2=A0=C2=A0 handled with drm_exec.
> > > > > >=20
> > > > > > Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC, use=
 the DRM
> > > > > > GPU scheduler for the asynchronous paths.
> > > > > >=20
> > > > > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > > > > ---
> > > > > >  =C2=A0 Documentation/gpu/driver-uapi.rst=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> > > > > >  =C2=A0 drivers/gpu/drm/nouveau/Kbuild=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > > > > >  =C2=A0 drivers/gpu/drm/nouveau/Kconfig=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > > > > >  =C2=A0 drivers/gpu/drm/nouveau/nouveau_abi16.c |=C2=A0 16 +
> > > > > >  =C2=A0 drivers/gpu/drm/nouveau/nouveau_abi16.h |=C2=A0=C2=A0 1=
 +
> > > > > >  =C2=A0 drivers/gpu/drm/nouveau/nouveau_drm.c=C2=A0=C2=A0 |=C2=
=A0 23 +-
> > > > > >  =C2=A0 drivers/gpu/drm/nouveau/nouveau_drv.h=C2=A0=C2=A0 |=C2=
=A0=C2=A0 9 +-
> > > > > >  =C2=A0 drivers/gpu/drm/nouveau/nouveau_exec.c=C2=A0 | 310 ++++=
++++++
> > > > > >  =C2=A0 drivers/gpu/drm/nouveau/nouveau_exec.h=C2=A0 |=C2=A0 55=
 ++
> > > > > >  =C2=A0 drivers/gpu/drm/nouveau/nouveau_sched.c | 780 +++++++++=
+++++++++++++++
> > > > > >  =C2=A0 drivers/gpu/drm/nouveau/nouveau_sched.h |=C2=A0 98 +++
> > > > > >  =C2=A0 11 files changed, 1295 insertions(+), 4 deletions(-)
> > > > > >  =C2=A0 create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec=
.c
> > > > > >  =C2=A0 create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec=
.h
> > > > > >  =C2=A0 create mode 100644 drivers/gpu/drm/nouveau/nouveau_sche=
d.c
> > > > > >  =C2=A0 create mode 100644 drivers/gpu/drm/nouveau/nouveau_sche=
d.h =20
> > > > > ... =20
> > > > > >=20
> > > > > > +static struct dma_fence *
> > > > > > +nouveau_bind_job_run(struct nouveau_job *job)
> > > > > > +{
> > > > > > +=C2=A0=C2=A0=C2=A0 struct nouveau_bind_job *bind_job =3D to_no=
uveau_bind_job(job);
> > > > > > +=C2=A0=C2=A0=C2=A0 struct nouveau_uvmm *uvmm =3D nouveau_cli_u=
vmm(job->cli);
> > > > > > +=C2=A0=C2=A0=C2=A0 struct bind_job_op *op;
> > > > > > +=C2=A0=C2=A0=C2=A0 int ret =3D 0;
> > > > > > + =20
> > > > >=20
> > > > > I was looking at how nouveau does the async binding compared to h=
ow xe
> > > > > does it.
> > > > > It looks to me that this function being a scheduler run_job callb=
ack is
> > > > > the main part of the VM_BIND dma-fence signalling critical sectio=
n for
> > > > > the job's done_fence and if so, needs to be annotated as such? =20
> > > >=20
> > > > Yes, that's the case.
> > > >  =20
> > > > >=20
> > > > > For example nouveau_uvma_region_new allocates memory, which is not
> > > > > allowed if in a dma_fence signalling critical section and the loc=
king
> > > > > also looks suspicious? =20
> > > >=20
> > > > Thanks for pointing this out, I missed that somehow.
> > > >=20
> > > > I will change it to pre-allocate new regions, mappings and page tab=
les
> > > > within the job's submit() function.
> > > >  =20
> > >=20
> > > Yea that what we basically do in Xe, in the IOCTL step allocate all t=
he
> > > backing store for new page tables, populate new page tables (these are
> > > not yet visible in the page table structure), and in last step which =
is
> > > executed after all the dependencies are satified program all the leaf
> > > entires making the new binding visible.
> > >=20
> > > We screwed have this up by defering most of the IOCTL to a worker but
> > > will fix this fix this one way or another soon - get rid of worker or
> > > introduce a type of sync that is signaled after the worker + publish =
the
> > > dma-fence in the worker. I'd like to close on this one soon. =20
> > > > For the ops structures the drm_gpuva_manager allocates for reportin=
g the
> > > > split/merge steps back to the driver I have ideas to entirely avoid
> > > > allocations, which also is a good thing in respect of Christians fe=
edback
> > > > regarding the huge amount of mapping requests some applications see=
m to
> > > > generate.
> > > >  =20
> > >=20
> > > It should be fine to have allocations to report the split/merge step =
as
> > > this step should be before a dma-fence is published, but yea if possi=
ble
> > > to avoid extra allocs as that is always better. =20
> >=20
> > I think we can't really ask for the split/merge steps before actually
> > running the job, since it requires the particular VA space not to change
> > while performing those operations.
> >=20
> > E.g. if we'd run the split/merge steps at job submit() time the underly=
ing
> > VA space could be changed by other bind jobs executing before this one,
> > which would make the calculated split/merge steps obsolete and wrong.
> >  =20
>=20
> Hmm, maybe I'm not understanding this implementation, admittedly I
> haven't studied the gpuva manager code in detail.
>=20
> Let me explain what we are doing in Xe.
>=20
> Map 0x0000 - 0x3000 -> this resolves into 1 bind operation and 1 VMA
> Unmap 0x1000-0x2000 -> this resolves into 1 unbind and 2 rebind operations
>=20
> 1. unbind 0x0000-0x3000 -> destroy old VMA
> 2. rebind 0x0000-0x1000 -> new VMA
> 3. rebind 0x2000-0x3000 -> new VMA
>=20
> All of the above steps resolving the operations can be done in the IOCTL
> phase and VM's VMA structure is also updated. When the dependencies
> are resolved the actual bindings are done on the GPU. We use the BO's
> dma-resv slots to ensure there is never a window 0x0000-0x1000 and
> 0x2000-0x3000 are never mapped with respect to execs (I forget the exact
> details of how we do this but if you want to know I'll explain further).
>=20

Ok, so I've been contemplating the idea of pre-reserving memory for any
future page-table updates, so I can guarantee the bind/unbind op in
->run_job() never fails (that's actually made more complicated in my
case, because we don't directly control the page table updates, but
defer that to the iommu/iopagetbl framework which does the allocation,
so I didn't really go as far as you did). But with bind ops happening in
a queue with dependencies to wait on, guessing what the page-table will
look like is a bit challenging. Sure, we can pre-allocate pages for all
levels needed to reach the leaf node(s) we're trying to insert or plan
for the worst case scenario in case of 2MB -> 4K block splits for
partial unmaps, but it sounds like a lot of memory reservation,
especially if we get lot of bind requests queued. Just curious to hear
how you solved that.
