Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD9362A07A3
	for <lists+dri-devel@lfdr.de>; Fri, 30 Oct 2020 15:17:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FC976EDDA;
	Fri, 30 Oct 2020 14:17:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from honk.sigxcpu.org (honk.sigxcpu.org [24.134.29.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 150196EDDA;
 Fri, 30 Oct 2020 14:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by honk.sigxcpu.org (Postfix) with ESMTP id 8EFCDFB03;
 Fri, 30 Oct 2020 15:17:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
 by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5RT3Dr6ncZMs; Fri, 30 Oct 2020 15:17:36 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
 id 103304463D; Fri, 30 Oct 2020 15:17:35 +0100 (CET)
Date: Fri, 30 Oct 2020 15:17:35 +0100
From: Guido =?iso-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>
To: Lucas Stach <l.stach@pengutronix.de>
Subject: Re: [RFC PATCH 2/2] drm: etnaviv: Unmap gems on gem_close
Message-ID: <20201030141735.GA62306@bogon.m.sigxcpu.org>
References: <cover.1603981111.git.agx@sigxcpu.org>
 <a92da13ed190e6d49550b78dadad3c0003ef6881.1603981111.git.agx@sigxcpu.org>
 <8a354530944e6a606212fe537c689ec20422a954.camel@pengutronix.de>
 <20201029182054.GC401619@phenom.ffwll.local>
 <f8ee093c78fc99ef087e84441b8b8c79836d563d.camel@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f8ee093c78fc99ef087e84441b8b8c79836d563d.camel@pengutronix.de>
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
Cc: David Airlie <airlied@linux.ie>, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Russell King <linux+etnaviv@armlinux.org.uk>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,
On Fri, Oct 30, 2020 at 10:19:54AM +0100, Lucas Stach wrote:
> Am Donnerstag, den 29.10.2020, 19:20 +0100 schrieb Daniel Vetter:
> > On Thu, Oct 29, 2020 at 03:38:21PM +0100, Lucas Stach wrote:
> > > Hi Guido,
> > > =

> > > Am Donnerstag, den 29.10.2020, 15:20 +0100 schrieb Guido G=FCnther:
> > > > So far the unmap from gpu address space only happened when dropping=
 the
> > > > last ref in gem_free_object_unlocked, however that is skipped if th=
ere's
> > > > still multiple handles to the same GEM object.
> > > > =

> > > > Since userspace (here mesa) in the case of softpin hands back the m=
emory
> > > > region to the pool of available GPU virtual memory closing the hand=
le
> > > > via DRM_IOCTL_GEM_CLOSE this can lead to etnaviv_iommu_insert_exact
> > > > failing later since userspace thinks the vaddr is available while t=
he
> > > > kernel thinks it isn't making the submit fail like
> > > > =

> > > >   [E] submit failed: -14 (No space left on device) (etna_cmd_stream=
_flush:244)
> > > > =

> > > > Fix this by unmapping the memory via the .gem_close_object callback.
> > > > =

> > > > Signed-off-by: Guido G=FCnther <agx@sigxcpu.org>
> > > > ---
> > > >  drivers/gpu/drm/etnaviv/etnaviv_drv.c |  1 +
> > > >  drivers/gpu/drm/etnaviv/etnaviv_drv.h |  1 +
> > > >  drivers/gpu/drm/etnaviv/etnaviv_gem.c | 32 +++++++++++++++++++++++=
++++
> > > >  3 files changed, 34 insertions(+)
> > > > =

> > > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/dr=
m/etnaviv/etnaviv_drv.c
> > > > index a9a3afaef9a1..fdcc6405068c 100644
> > > > --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
> > > > @@ -491,6 +491,7 @@ static struct drm_driver etnaviv_drm_driver =3D=
 {
> > > >  	.open               =3D etnaviv_open,
> > > >  	.postclose           =3D etnaviv_postclose,
> > > >  	.gem_free_object_unlocked =3D etnaviv_gem_free_object,
> > > > +	.gem_close_object   =3D etnaviv_gem_close_object,
> > > >  	.gem_vm_ops         =3D &vm_ops,
> > > >  	.prime_handle_to_fd =3D drm_gem_prime_handle_to_fd,
> > > >  	.prime_fd_to_handle =3D drm_gem_prime_fd_to_handle,
> > > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.h b/drivers/gpu/dr=
m/etnaviv/etnaviv_drv.h
> > > > index 4d8dc9236e5f..2226a9af0d63 100644
> > > > --- a/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> > > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.h
> > > > @@ -65,6 +65,7 @@ int etnaviv_gem_cpu_prep(struct drm_gem_object *o=
bj, u32 op,
> > > >  		struct drm_etnaviv_timespec *timeout);
> > > >  int etnaviv_gem_cpu_fini(struct drm_gem_object *obj);
> > > >  void etnaviv_gem_free_object(struct drm_gem_object *obj);
> > > > +void etnaviv_gem_close_object(struct drm_gem_object *obj, struct d=
rm_file *file);
> > > >  int etnaviv_gem_new_handle(struct drm_device *dev, struct drm_file=
 *file,
> > > >  		u32 size, u32 flags, u32 *handle);
> > > >  int etnaviv_gem_new_userptr(struct drm_device *dev, struct drm_fil=
e *file,
> > > > diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/dr=
m/etnaviv/etnaviv_gem.c
> > > > index f06e19e7be04..5aec4a23c77e 100644
> > > > --- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > > > +++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
> > > > @@ -515,6 +515,38 @@ static const struct etnaviv_gem_ops etnaviv_ge=
m_shmem_ops =3D {
> > > >  	.mmap =3D etnaviv_gem_mmap_obj,
> > > >  };
> > > >  =

> > > > +void etnaviv_gem_close_object(struct drm_gem_object *obj, struct d=
rm_file *unused)
> > > > +{
> > > > +	struct etnaviv_gem_object *etnaviv_obj =3D to_etnaviv_bo(obj);
> > > > +	struct etnaviv_vram_mapping *mapping, *tmp;
> > > > +
> > > > +	/* Handle this via etnaviv_gem_free_object */
> > > > +	if (obj->handle_count =3D=3D 1)
> > > > +		return;
> > > > +
> > > > +	WARN_ON(is_active(etnaviv_obj));
> > > > +
> > > > +	/*
> > > > +	 * userspace wants to release the handle so we need to remove
> > > > +	 * the mapping from the gpu's virtual address space to stay
> > > > +	 * in sync.
> > > > +	 */
> > > > +	list_for_each_entry_safe(mapping, tmp, &etnaviv_obj->vram_list,
> > > > +				 obj_node) {
> > > > +		struct etnaviv_iommu_context *context =3D mapping->context;
> > > > +
> > > > +		WARN_ON(mapping->use);
> > > > +
> > > > +		if (context) {
> > > > +			etnaviv_iommu_unmap_gem(context, mapping);
> > > > +			etnaviv_iommu_context_put(context);
> > > =

> > > I see the issue you are trying to fix here, but this is not a viable
> > > fix. While userspace may close the handle, the GPU may still be
> > > processing jobs referening the BO, so we can't just unmap it from the
> > > address space.
> > > =

> > > I think what we need to do here is waiting for the current jobs/fences
> > > of the BO when we hit the case where userspace tries to assign a new
> > > address to the BO. Basically wait for current jobs -> unamp from the
> > > address space -> map at new userspace assigned address.
> > =

> > Yeah was about to say the same. There's two solutions to this:
> > - let the kernel manage the VA space. This is what amdgpu does in some
> >   cases (but still no relocations)
> > - pipeline the VA/PTE updates in your driver, because userspace has a
> >   somewhat hard time figuring out when a buffer is done. Doing that wou=
ld
> >   either at complexity or stalls when the kernel is doing all the track=
ing
> >   already anyway. Minimal fix is to do what Lucas explained above, but
> >   importantly with the kernel solution we have the option to fully
> >   pipeline everything and avoid stalls. I think this is what everyone e=
lse
> >   who lets userspace manage VA does in their kernel side.
> =

> I thought a bit more about this and the issue is only about userspace
> reusing regions of its _private_ address space, before they are GPU
> inactive. So the problem of tracking BO active for figuring out when it
> is safe to close the handle (and thus forget about the last placement
> of the BO in the AS) goes from "is this BO globally active anywhere?"
> to "is this BO still active in one of the jobs I submitted?", which is
> not hard at all for the userspace to figure out.

It's about private address space, yes.
  =

> With this in mind I think we can reasonably declare the kernel behavior
> of rejecting the submit as okay and just add the tiny bit of userspace
> fencing needed for the userspace driver to not close the handle until
> the last submit referencing this BO has finished.

Sounds reasonable, i'll have a look.
Cheers,
 -- Guido

> =

> Regards,
> Lucas
> =

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
