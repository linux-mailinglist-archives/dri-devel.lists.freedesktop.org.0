Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC09677826
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 11:02:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C60010E309;
	Mon, 23 Jan 2023 10:02:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD5DD10E232
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Jan 2023 10:02:00 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 27C286600879;
 Mon, 23 Jan 2023 10:01:59 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1674468119;
 bh=w6d7q60UnLDxH/OSfgxcq+G2wZj6bkXiZliWNjZbbS0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YEJCpZOoFeJ0dYaTes2AhYvrqCw9Lx/V39lJyX91ZLpN2SHKN5TTgskB7OpRmiW4I
 nrgPRL3cVJUYO97Q1RWKhQt3PmcN8E7iyeHh4VwroDqH+pPxW0haEON0V3U4U1MaS/
 udJU9Vpzk9sd1l4aRZn7xKODXNdKbyFKQ/npsh5zN792Vj10ddJ/valrngcMQDagr0
 Oh+66r5vDaMw5AQAMbJc0D4eIryXwTqAffEQIRD4/lzsvrcCjfbplWBbnCmE6cBM3v
 XzCXquUgbrKBb+KhoKXLVS0Ca11WV1rep3CLT5Yxh/8yIQvyCKdtQ/P64oenXK/LY6
 cCcHCMC0cGmcA==
Date: Mon, 23 Jan 2023 11:01:55 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH drm-next 13/14] drm/nouveau: implement new VM_BIND UAPI
Message-ID: <20230123110155.3a08ba51@collabora.com>
In-Reply-To: <Y8129SLhOmc+kHiZ@DUT025-TGLU.fm.intel.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <20230118061256.2689-14-dakr@redhat.com>
 <e371e8a1-88f8-1309-07ca-f48f4157fec8@shipmail.org>
 <8e10b46c-f934-8eee-904e-b3d8a7644a71@redhat.com>
 <Y8jOCE/PyNZ2Z6aX@DUT025-TGLU.fm.intel.com>
 <6f7d3389-aaf7-ce79-afbb-76abc446d442@redhat.com>
 <Y8lx7nAh/PEqiWSl@DUT025-TGLU.fm.intel.com>
 <20230120112245.0fc88338@collabora.com>
 <Y8129SLhOmc+kHiZ@DUT025-TGLU.fm.intel.com>
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

On Sun, 22 Jan 2023 17:48:37 +0000
Matthew Brost <matthew.brost@intel.com> wrote:

> On Fri, Jan 20, 2023 at 11:22:45AM +0100, Boris Brezillon wrote:
> > On Thu, 19 Jan 2023 16:38:06 +0000
> > Matthew Brost <matthew.brost@intel.com> wrote:
> >  =20
> > > On Thu, Jan 19, 2023 at 04:36:43PM +0100, Danilo Krummrich wrote: =20
> > > > On 1/19/23 05:58, Matthew Brost wrote:   =20
> > > > > On Thu, Jan 19, 2023 at 04:44:23AM +0100, Danilo Krummrich wrote:=
   =20
> > > > > > On 1/18/23 21:37, Thomas Hellstr=C3=B6m (Intel) wrote:   =20
> > > > > > >=20
> > > > > > > On 1/18/23 07:12, Danilo Krummrich wrote:   =20
> > > > > > > > This commit provides the implementation for the new uapi mo=
tivated by the
> > > > > > > > Vulkan API. It allows user mode drivers (UMDs) to:
> > > > > > > >=20
> > > > > > > > 1) Initialize a GPU virtual address (VA) space via the new
> > > > > > > >  =C2=A0=C2=A0=C2=A0 DRM_IOCTL_NOUVEAU_VM_INIT ioctl for UMD=
s to specify the portion of VA
> > > > > > > >  =C2=A0=C2=A0=C2=A0 space managed by the kernel and userspa=
ce, respectively.
> > > > > > > >=20
> > > > > > > > 2) Allocate and free a VA space region as well as bind and =
unbind memory
> > > > > > > >  =C2=A0=C2=A0=C2=A0 to the GPUs VA space via the new DRM_IO=
CTL_NOUVEAU_VM_BIND ioctl.
> > > > > > > >  =C2=A0=C2=A0=C2=A0 UMDs can request the named operations t=
o be processed either
> > > > > > > >  =C2=A0=C2=A0=C2=A0 synchronously or asynchronously. It sup=
ports DRM syncobjs
> > > > > > > >  =C2=A0=C2=A0=C2=A0 (incl. timelines) as synchronization me=
chanism. The management of the
> > > > > > > >  =C2=A0=C2=A0=C2=A0 GPU VA mappings is implemented with the=
 DRM GPU VA manager.
> > > > > > > >=20
> > > > > > > > 3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC=
 ioctl. The
> > > > > > > >  =C2=A0=C2=A0=C2=A0 execution happens asynchronously. It su=
pports DRM syncobj (incl.
> > > > > > > >  =C2=A0=C2=A0=C2=A0 timelines) as synchronization mechanism=
. DRM GEM object locking is
> > > > > > > >  =C2=A0=C2=A0=C2=A0 handled with drm_exec.
> > > > > > > >=20
> > > > > > > > Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC,=
 use the DRM
> > > > > > > > GPU scheduler for the asynchronous paths.
> > > > > > > >=20
> > > > > > > > Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> > > > > > > > ---
> > > > > > > >  =C2=A0 Documentation/gpu/driver-uapi.rst=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 3 +
> > > > > > > >  =C2=A0 drivers/gpu/drm/nouveau/Kbuild=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > > > > > > >  =C2=A0 drivers/gpu/drm/nouveau/Kconfig=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 2 +
> > > > > > > >  =C2=A0 drivers/gpu/drm/nouveau/nouveau_abi16.c |=C2=A0 16 +
> > > > > > > >  =C2=A0 drivers/gpu/drm/nouveau/nouveau_abi16.h |=C2=A0=C2=
=A0 1 +
> > > > > > > >  =C2=A0 drivers/gpu/drm/nouveau/nouveau_drm.c=C2=A0=C2=A0 |=
=C2=A0 23 +-
> > > > > > > >  =C2=A0 drivers/gpu/drm/nouveau/nouveau_drv.h=C2=A0=C2=A0 |=
=C2=A0=C2=A0 9 +-
> > > > > > > >  =C2=A0 drivers/gpu/drm/nouveau/nouveau_exec.c=C2=A0 | 310 =
++++++++++
> > > > > > > >  =C2=A0 drivers/gpu/drm/nouveau/nouveau_exec.h=C2=A0 |=C2=
=A0 55 ++
> > > > > > > >  =C2=A0 drivers/gpu/drm/nouveau/nouveau_sched.c | 780 +++++=
+++++++++++++++++++
> > > > > > > >  =C2=A0 drivers/gpu/drm/nouveau/nouveau_sched.h |=C2=A0 98 =
+++
> > > > > > > >  =C2=A0 11 files changed, 1295 insertions(+), 4 deletions(-)
> > > > > > > >  =C2=A0 create mode 100644 drivers/gpu/drm/nouveau/nouveau_=
exec.c
> > > > > > > >  =C2=A0 create mode 100644 drivers/gpu/drm/nouveau/nouveau_=
exec.h
> > > > > > > >  =C2=A0 create mode 100644 drivers/gpu/drm/nouveau/nouveau_=
sched.c
> > > > > > > >  =C2=A0 create mode 100644 drivers/gpu/drm/nouveau/nouveau_=
sched.h   =20
> > > > > > > ...   =20
> > > > > > > >=20
> > > > > > > > +static struct dma_fence *
> > > > > > > > +nouveau_bind_job_run(struct nouveau_job *job)
> > > > > > > > +{
> > > > > > > > +=C2=A0=C2=A0=C2=A0 struct nouveau_bind_job *bind_job =3D t=
o_nouveau_bind_job(job);
> > > > > > > > +=C2=A0=C2=A0=C2=A0 struct nouveau_uvmm *uvmm =3D nouveau_c=
li_uvmm(job->cli);
> > > > > > > > +=C2=A0=C2=A0=C2=A0 struct bind_job_op *op;
> > > > > > > > +=C2=A0=C2=A0=C2=A0 int ret =3D 0;
> > > > > > > > +   =20
> > > > > > >=20
> > > > > > > I was looking at how nouveau does the async binding compared =
to how xe
> > > > > > > does it.
> > > > > > > It looks to me that this function being a scheduler run_job c=
allback is
> > > > > > > the main part of the VM_BIND dma-fence signalling critical se=
ction for
> > > > > > > the job's done_fence and if so, needs to be annotated as such=
?   =20
> > > > > >=20
> > > > > > Yes, that's the case.
> > > > > >    =20
> > > > > > >=20
> > > > > > > For example nouveau_uvma_region_new allocates memory, which i=
s not
> > > > > > > allowed if in a dma_fence signalling critical section and the=
 locking
> > > > > > > also looks suspicious?   =20
> > > > > >=20
> > > > > > Thanks for pointing this out, I missed that somehow.
> > > > > >=20
> > > > > > I will change it to pre-allocate new regions, mappings and page=
 tables
> > > > > > within the job's submit() function.
> > > > > >    =20
> > > > >=20
> > > > > Yea that what we basically do in Xe, in the IOCTL step allocate a=
ll the
> > > > > backing store for new page tables, populate new page tables (thes=
e are
> > > > > not yet visible in the page table structure), and in last step wh=
ich is
> > > > > executed after all the dependencies are satified program all the =
leaf
> > > > > entires making the new binding visible.
> > > > >=20
> > > > > We screwed have this up by defering most of the IOCTL to a worker=
 but
> > > > > will fix this fix this one way or another soon - get rid of worke=
r or
> > > > > introduce a type of sync that is signaled after the worker + publ=
ish the
> > > > > dma-fence in the worker. I'd like to close on this one soon.   =20
> > > > > > For the ops structures the drm_gpuva_manager allocates for repo=
rting the
> > > > > > split/merge steps back to the driver I have ideas to entirely a=
void
> > > > > > allocations, which also is a good thing in respect of Christian=
s feedback
> > > > > > regarding the huge amount of mapping requests some applications=
 seem to
> > > > > > generate.
> > > > > >    =20
> > > > >=20
> > > > > It should be fine to have allocations to report the split/merge s=
tep as
> > > > > this step should be before a dma-fence is published, but yea if p=
ossible
> > > > > to avoid extra allocs as that is always better.   =20
> > > >=20
> > > > I think we can't really ask for the split/merge steps before actual=
ly
> > > > running the job, since it requires the particular VA space not to c=
hange
> > > > while performing those operations.
> > > >=20
> > > > E.g. if we'd run the split/merge steps at job submit() time the und=
erlying
> > > > VA space could be changed by other bind jobs executing before this =
one,
> > > > which would make the calculated split/merge steps obsolete and wron=
g.
> > > >    =20
> > >=20
> > > Hmm, maybe I'm not understanding this implementation, admittedly I
> > > haven't studied the gpuva manager code in detail.
> > >=20
> > > Let me explain what we are doing in Xe.
> > >=20
> > > Map 0x0000 - 0x3000 -> this resolves into 1 bind operation and 1 VMA
> > > Unmap 0x1000-0x2000 -> this resolves into 1 unbind and 2 rebind opera=
tions
> > >=20
> > > 1. unbind 0x0000-0x3000 -> destroy old VMA
> > > 2. rebind 0x0000-0x1000 -> new VMA
> > > 3. rebind 0x2000-0x3000 -> new VMA
> > >=20
> > > All of the above steps resolving the operations can be done in the IO=
CTL
> > > phase and VM's VMA structure is also updated. When the dependencies
> > > are resolved the actual bindings are done on the GPU. We use the BO's
> > > dma-resv slots to ensure there is never a window 0x0000-0x1000 and
> > > 0x2000-0x3000 are never mapped with respect to execs (I forget the ex=
act
> > > details of how we do this but if you want to know I'll explain furthe=
r).
> > >  =20
> >=20
> > Ok, so I've been contemplating the idea of pre-reserving memory for any
> > future page-table updates, so I can guarantee the bind/unbind op in =20
> > ->run_job() never fails (that's actually made more complicated in my =20
> > case, because we don't directly control the page table updates, but
> > defer that to the iommu/iopagetbl framework which does the allocation,
> > so I didn't really go as far as you did). But with bind ops happening in
> > a queue with dependencies to wait on, guessing what the page-table will
> > look like is a bit challenging. Sure, we can pre-allocate pages for all
> > levels needed to reach the leaf node(s) we're trying to insert or plan
> > for the worst case scenario in case of 2MB -> 4K block splits for
> > partial unmaps, but it sounds like a lot of memory reservation,
> > especially if we get lot of bind requests queued. Just curious to hear
> > how you solved that. =20
>=20
> A few thing here.
>=20
> First the reason we always do an unbind and possibly 2 rebinds is
> because we might crossing the 1GB / 2MB page boundary size. In the
> example I gave we could just unbind 0x1000-0x2000 and call it day but
> we'd have to build smarts into to our code to know that is ok which we
> don't have at this time.
>=20
> e.g. This wouldn't ok just to do an unbind as the page size goes from
> 2MB to 4k:
>=20
> Map   0x000000-0x200000 -> 2MB page
> Unmap 0x100000-0x200000 -> need 256 4k pages now
>=20
> For simplity we always do a unbind + 2 possible rebinds. Maybe we will
> be a little smarter in the future if needed.

Yeah, I see why you're doing that, but it's not really an option in
pancsf, because this is hidden behind the io_pgtable abstract, which
deals with splits/merges of PTEs on its own. So, when we call
io_pgtable_ops->unmap(0x1000-0x2000), what happens in practice is:

1/ allocate an L3 page table
2/ populate the 0x000000-0x001000 and 0x002000-0x200000 range in this
   new L3 page table
3/ update the L2 page table entry to point to the L3 one

In that regards, the io_pgtable abstraction makes it simpler for the
driver, but that also means we don't control memory allocation, and
both map and unmap operations can fail.

>=20
> WRT to the memory allocations, we haven't really thought about
> consequences of reserving memory for pending binds. My initial reaction
> is I don't think this an issue. Page table memory should be relatively
> small compared to user memory so having a bunch queue'd up shouldn't
> really be an issue, right? Going from 2MB -> 4k splits on either side is
> just another 2 4k allocs on either side.

Well, yes, for unmap ops, you'd probably need a maximum of 2 pages, but
for a map op, if you need to allocate L1 and L2 tables (they might not
exist when the map request reaches time of execution, and it's pretty
hard to predict the state of the page-table), that's actually more than
just 2 pages. It depends on the size of the mapping actually. And yes,
I agree it's not much compared to the amount of user memory, but if you
have plenty of map/unmap requests queued, pre-reserving those pages can
still consume a non-negligible amount of memory. But maybe we'll have
bigger problems if the amount of queued VM_BIND requests grows to the
point where the amount of memory reserved for future page-table updates
is a problem, dunno.
