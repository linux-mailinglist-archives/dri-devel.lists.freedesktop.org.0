Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C06AE7A9583
	for <lists+dri-devel@lfdr.de>; Thu, 21 Sep 2023 17:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF0B10E012;
	Thu, 21 Sep 2023 15:27:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EC4310E012;
 Thu, 21 Sep 2023 15:27:07 +0000 (UTC)
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id AFB24660731B;
 Thu, 21 Sep 2023 16:27:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1695310026;
 bh=iSk2ckbYAN/XTNJK8G8uZaUu+uSKKEVpKeGB7KywgnA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=aBnd+wXpDgF8SoEfVb9ceGdEeRWKkoXvufu6wI7xOlVAF16vMITgMNNfYR7l1PYd7
 eAlLnghGgzF/PjlrZrWw7JMKppogajuz6dGOGy23T+rZ9SMRtpWx7JXaFypYNMTJ1f
 InbpX+uOSvcQoEJH6ZUYLpvHVZaQqSnM13e2grxgKdPQQDQ+XoK9mycxbcgR469F8p
 jnVcDKhZt8hpTBBGZex+Y2DsnwqhJ3B1SKBgcrjvKEaN9ovPzMCM+ByzKn/rDQ7h60
 y1+cTvSVg074LItc3J8CUAmltXRX9QNJh1ckQX7OXEgJPMG31+hoRHLQgDYl3UpJ6/
 qpy0v9nuWo3og==
Date: Thu, 21 Sep 2023 17:27:02 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>
Subject: Re: [PATCH drm-misc-next v4 4/8] drm/gpuvm: add common dma-resv per
 struct drm_gpuvm
Message-ID: <20230921172702.1b9a49a9@collabora.com>
In-Reply-To: <72ea51ca-f7b0-2e2a-b276-6c6c7413374b@amd.com>
References: <20230920144343.64830-1-dakr@redhat.com>
 <20230920144343.64830-5-dakr@redhat.com>
 <7951dc11-6047-6beb-8ef8-98c862e26ec3@amd.com>
 <964a1bdd-549d-7850-9a8c-8278c4cd32ec@redhat.com>
 <20230921162510.10903d90@collabora.com>
 <72ea51ca-f7b0-2e2a-b276-6c6c7413374b@amd.com>
Organization: Collabora
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: matthew.brost@intel.com, thomas.hellstrom@linux.intel.com,
 sarah.walker@imgtec.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>, donald.robson@imgtec.com,
 faith.ekstrand@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Sep 2023 16:34:54 +0200
Christian K=C3=B6nig <christian.koenig@amd.com> wrote:

> Am 21.09.23 um 16:25 schrieb Boris Brezillon:
> > On Thu, 21 Sep 2023 15:34:44 +0200
> > Danilo Krummrich <dakr@redhat.com> wrote:
> > =20
> >> On 9/21/23 09:39, Christian K=C3=B6nig wrote: =20
> >>> Am 20.09.23 um 16:42 schrieb Danilo Krummrich: =20
> >>>> Provide a common dma-resv for GEM objects not being used outside of =
this
> >>>> GPU-VM. This is used in a subsequent patch to generalize dma-resv,
> >>>> external and evicted object handling and GEM validation.
> >>>>
> >>>> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> >>>> ---
> >>>>  =C2=A0 drivers/gpu/drm/drm_gpuvm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 9 +++++++--
> >>>>  =C2=A0 drivers/gpu/drm/nouveau/nouveau_uvmm.c |=C2=A0 2 +-
> >>>>  =C2=A0 include/drm/drm_gpuvm.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 17 +++++++++++++++=
+-
> >>>>  =C2=A0 3 files changed, 24 insertions(+), 4 deletions(-)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm=
.c
> >>>> index bfea4a8a19ec..cbf4b738a16c 100644
> >>>> --- a/drivers/gpu/drm/drm_gpuvm.c
> >>>> +++ b/drivers/gpu/drm/drm_gpuvm.c
> >>>> @@ -655,6 +655,7 @@ drm_gpuva_range_valid(struct drm_gpuvm *gpuvm,
> >>>>  =C2=A0 /**
> >>>>  =C2=A0=C2=A0 * drm_gpuvm_init() - initialize a &drm_gpuvm
> >>>>  =C2=A0=C2=A0 * @gpuvm: pointer to the &drm_gpuvm to initialize
> >>>> + * @drm: the drivers &drm_device
> >>>>  =C2=A0=C2=A0 * @name: the name of the GPU VA space
> >>>>  =C2=A0=C2=A0 * @start_offset: the start offset of the GPU VA space
> >>>>  =C2=A0=C2=A0 * @range: the size of the GPU VA space
> >>>> @@ -668,7 +669,7 @@ drm_gpuva_range_valid(struct drm_gpuvm *gpuvm,
> >>>>  =C2=A0=C2=A0 * &name is expected to be managed by the surrounding d=
river structures.
> >>>>  =C2=A0=C2=A0 */
> >>>>  =C2=A0 void
> >>>> -drm_gpuvm_init(struct drm_gpuvm *gpuvm,
> >>>> +drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_device *drm,
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 const char *name,
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 u64 start_offset, u64 range,
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 u64 reserve_offset, u64 reserve_range,
> >>>> @@ -694,6 +695,8 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm,
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 reserve_range)))
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 __drm_gpuva_insert(gpuvm, &gpuvm->kernel_alloc_node);
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >>>> +
> >>>> +=C2=A0=C2=A0=C2=A0 drm_gem_private_object_init(drm, &gpuvm->d_obj, =
0);
> >>>>  =C2=A0 }
> >>>>  =C2=A0 EXPORT_SYMBOL_GPL(drm_gpuvm_init);
> >>>> @@ -713,7 +716,9 @@ drm_gpuvm_destroy(struct drm_gpuvm *gpuvm)
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 __drm_gpuva_=
remove(&gpuvm->kernel_alloc_node);
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 WARN(!RB_EMPTY_ROOT(&gpuvm->rb.tree.=
rb_root),
> >>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "GPUVA tree is not=
 empty, potentially leaking memory.");
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "GPUVA tree is not=
 empty, potentially leaking memory.\n");
> >>>> +
> >>>> +=C2=A0=C2=A0=C2=A0 drm_gem_private_object_fini(&gpuvm->d_obj);
> >>>>  =C2=A0 }
> >>>>  =C2=A0 EXPORT_SYMBOL_GPL(drm_gpuvm_destroy);
> >>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/dr=
m/nouveau/nouveau_uvmm.c
> >>>> index 6c86b64273c3..a80ac8767843 100644
> >>>> --- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> >>>> +++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
> >>>> @@ -1836,7 +1836,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, s=
truct nouveau_cli *cli,
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uvmm->kernel_managed_addr =3D kernel=
_managed_addr;
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uvmm->kernel_managed_size =3D kernel=
_managed_size;
> >>>> -=C2=A0=C2=A0=C2=A0 drm_gpuvm_init(&uvmm->base, cli->name,
> >>>> +=C2=A0=C2=A0=C2=A0 drm_gpuvm_init(&uvmm->base, cli->drm->dev, cli->=
name,
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NOUVEAU_VA_SPACE_START,
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NOUVEAU_VA_SPACE_END,
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel_managed_addr, kernel_managed_size,
> >>>> diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
> >>>> index 0e802676e0a9..6666c07d7c3e 100644
> >>>> --- a/include/drm/drm_gpuvm.h
> >>>> +++ b/include/drm/drm_gpuvm.h
> >>>> @@ -240,14 +240,29 @@ struct drm_gpuvm {
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * @ops: &drm_gpuvm_ops providi=
ng the split/merge steps to drivers
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 */
> >>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const struct drm_gpuvm_ops *ops;
> >>>> +
> >>>> +=C2=A0=C2=A0=C2=A0 /**
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * @d_obj: Dummy GEM object; used internall=
y to pass the GPU VMs
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * dma-resv to &drm_exec. Provides the GPUV=
M's &dma-resv.
> >>>> +=C2=A0=C2=A0=C2=A0=C2=A0 */
> >>>> +=C2=A0=C2=A0=C2=A0 struct drm_gem_object d_obj; =20
> >>> Yeah, as pointed out in the other mail that won't work like this. =20
> >> Which one? Seems that I missed it.
> >> =20
> >>> The GPUVM contains GEM objects and therefore should probably have a r=
eference to those objects.
> >>>
> >>> When those GEM objects now use the dma-resv object embedded inside th=
e GPUVM then they also need a reference to the GPUVM to make sure the dma-r=
esv object won't be freed before they are freed. =20
> >> My assumption here is that GEM objects being local to a certain VM nev=
er out-live the VM. We never share it with anyone, otherwise it would be ex=
ternal and hence wouldn't carray the VM's dma-resv. The only references I s=
ee are from the VM itself (which is fine) and from userspace. The latter is=
n't a problem as long as all GEM handles are closed before the VM is destro=
yed on FD close. =20
> > But we don't want to rely on userspace doing the right thing (calling
> > GEM_CLOSE before releasing the VM), do we?
> >
> > BTW, even though my private BOs have a ref to their exclusive VM, I just
> > ran into a bug because drm_gem_shmem_free() acquires the resv lock
> > (which is questionable, but that's not the topic :-)) and
> > I was calling vm_put(bo->exclusive_vm) before drm_gem_shmem_free(),
> > leading to a use-after-free when the gem->resv is acquired. This has
> > nothing to do with drm_gpuvm, but it proves that this sort of bug is
> > likely to happen if we don't pay attention.
> > =20
> >> Do I miss something? Do we have use cases where this isn't true? =20
> > The other case I can think of is GEM being v[un]map-ed (kernel
> > mapping) after the VM was released. =20
>=20
> I think the file reference and the VM stays around in those cases as=20
> well, but yes I also think we have use cases which won't work.
>=20
> > =20
> >>> This is a circle reference dependency. =20
> > FWIW, I solved that by having a vm_destroy() function that kills all the
> > mappings in a VM, which in turn releases all the refs the VM had on
> > private BOs. Then, it's just a matter of waiting for all private GEMs
> > to be destroyed to get the final steps of the VM destruction, which is
> > really just about releasing resources (it's called panthor_vm_release()
> > in my case) executed when the VM refcount drops to zero.
> > =20
> >>> The simplest solution I can see is to let the driver provide the GEM =
object to use. Amdgpu uses the root page directory object for this. =20
> >> Sure, we can do that, if we see cases where VM local GEM objects can o=
ut-live the VM. =20
> >>> Apart from that I strongly think that we shouldn't let the GPUVM code=
 create a driver GEM object. We did that in TTM for the ghost objects and i=
t turned out to be a bad idea. =20
> > Would that really solve the circular ref issue? I mean, if you're
> > taking the root page dir object as your VM resv, you still have to make
> > sure it outlives the private GEMs, which means, you either need
> > to take a ref on the object, leading to the same circular ref mess, or
> > you need to reset private GEMs resvs before destroying this root page
> > dir GEM (whose lifecyle is likely the same as your VM object which
> > embeds the drm_gpuvm instance). =20
>=20
> Yes it does help, see how amdgpu does it:
>=20
> The VM references all BOs, e.g. page tables as well as user BOs.
>=20
> The BOs which use the dma-resv of the root page directory also reference=
=20
> the root page directorys BO.
>=20
> So when the VM drops all references the page tables and user BO are=20
> released first and the root page directory which everybody references las=
t.

Right, now I see how having a dynamically allocated GEM on which both
the VM and private BOs hold a reference solve problem.

>=20
> > Making it driver-specific just moves the responsibility back to drivers
> > (and also allows re-using an real GEM object instead of a dummy one,
> > but I'm not sure we care about saving a few hundreds bytes at that
> > point), which is a good way to not take the blame if the driver does
> > something wrong, but also doesn't really help people do the right thing=
. =20
>=20
> The additional memory usage is irrelevant, but we have very very bad=20
> experience with TTM using dummy objects similar to this here.
>=20
> They tend to end up in driver specific functions and then the driver=20
> will try to upcast those dummy to driver specific BOs. In the end you=20
> get really hard to figure out memory corruptions.

Hm, I see. Anyway, I guess creating a dummy GEM is simple enough that
we can leave it to drivers (for drivers that don't have a real GEM to
pass, of course).
