Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F17CF3B8782
	for <lists+dri-devel@lfdr.de>; Wed, 30 Jun 2021 19:15:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEDF6EA5A;
	Wed, 30 Jun 2021 17:15:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2147B6EA5A
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 17:15:08 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 x22-20020a9d6d960000b0290474a76f8bd4so1858465otp.5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Jun 2021 10:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=h+fMd98A2oIFaDTJbPKAQTmLGUCAw9+7Of4QZBmji2U=;
 b=PPv8+vJwRH15R/Av73TRBCmPhAW3UuKMV8xeCXqZ3xcoODaQ5csZrcylNfwFKdbBFH
 E6HW6kLSaFIO+Ci2j6+qDvmiQ3ApF+3xcvefsnGzoNFGQYybvU2LJ/Zs/Xf1xdOgSMK6
 zugh44vD2AaBdZesFuI+PzkJvbX8pEACTpoPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=h+fMd98A2oIFaDTJbPKAQTmLGUCAw9+7Of4QZBmji2U=;
 b=GfBRfRXI7ySHKxjWiiKBmxIW8C4kPPYI9yQ/AeWWkbIw2p0Oq7oKl3JowfFzE66qYM
 MoCZrYUB4ko5JirCs7f1L8ZbGamFeVSS8rvbhdHrv9CTftbA9VovSh2ie48/MzSrr9UX
 6IrzEy+Bvqr8pDz3A0NzDLOUFUQk7eQtuKnSPV0AJtA+H8rAPMJ8aGGTEqp07PuNyWRJ
 2RXZWgrHM6vR1kCy831Sy7YXL0WMOxnnwYDZlVrF1kpVBaK/nhV3DlZ1FdM+JNtGDN1H
 14oyY9ccXZWKRUj0vrRLqEc/bkiCSM2s68O+FWNqQMxnp8ZI9VydqZ+dkaUTOeMtRClb
 1p0g==
X-Gm-Message-State: AOAM530QoxEXC3dS5rTPC7e69/ZMooCSiUS++2ECgi8DQpvpu0Bbnuns
 qqOE7p4B0Y1Ax+HoF31fiq00aMc5UKI3ln2aoDfW7w==
X-Google-Smtp-Source: ABdhPJxpQAkftE3d1DEQRXmhHVew/tm9cGfTIjyxb1/N/F8yxXGTHvfYDESGwBXEvWSr3xrZUFwCH4zHDfPNsvh8+oA=
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr9949560otb.281.1625073307241; 
 Wed, 30 Jun 2021 10:15:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210630130701.349458-1-thomas.hellstrom@linux.intel.com>
 <20210630130701.349458-2-thomas.hellstrom@linux.intel.com>
 <YNx5QuPR4VdXB2u3@phenom.ffwll.local>
In-Reply-To: <YNx5QuPR4VdXB2u3@phenom.ffwll.local>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 30 Jun 2021 19:14:56 +0200
Message-ID: <CAKMK7uHm4oSwyr_=DOBenoqWKv+eBU4pBPoXag9M0vtEec3P6A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/i915/gem: Make our dma-buf exporter dynamic
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Michael J . Ruhl" <michael.j.ruhl@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 30, 2021 at 4:01 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> On Wed, Jun 30, 2021 at 03:07:00PM +0200, Thomas Hellstr=C3=B6m wrote:
> > If our exported dma-bufs are imported by another instance of our driver=
,
> > that instance will typically have the imported dma-bufs locked during
> > dma_buf_map_attachment(). But the exporter also locks the same reservat=
ion
> > object in the map_dma_buf() callback, which leads to recursive locking.
> >
> > Add a live selftest to exercise both dynamic and non-dynamic exports,
> > and as a workaround until we fully support dynamic import and export,
> > declare the exporter dynamic by providing pin() and unpin() implementat=
ions.
> > For dynamic importers, make sure we keep the pinning also in map_dma_bu=
f(),
> > to ensure we never need to call dma_buf_move_notify().
> > Calling dma_buf_move_notify() is at the discretion of the exporter.
> >
> > v2:
> > - Extend the selftest with a fake dynamic importer.
> > - Provide real pin and unpin callbacks to not abuse the interface.
> >
> > Reported-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>
> I'm not happy with this, because i915 is currently violating the dma-resv
> fencing rules for dynamic dma-buf.
>
> Yes since this is just the exporter we can probably get away with yolo'in=
g
> things, but Christian and me just spend a lot of angry typing figuring ou=
t
> what the rules actually are, so I really don't like bending them even mor=
e
> just because it's less typing.

To clarify what I meant here: I think the code is correct in the sense
that it's not breaking any other existing code upstream in a
functional or security relevant way.

What I meant with yolo merging is that if we land some dynamic dma-buf
exporter support just to fix a bug which with slightly more lines can
be fixed without resorting to quickly enabling dynamic dma-buf
exporting while a) we know i915 is breaking dma-resv rules already and
b) there was just a few weeks of rather angry discussions on this
topic.

That's just a recipe to piss people off, at least if I'd be in
Christian's shoes and see this land I'd get furious. So yolo on the
collaboration and people side of things, not so much technically
incorrect.

Plus with the sketch I described below we can fix the underlying issue
we're seeing in a clean way, by essentially aligning what i915 does to
what all other non-dynamic dma-buf ttm driver implementations do in
drm_prime.c. Defacto that's the only way that works, and it is the
contract for non-dynamic dma-buf for a driver using dma_resv_lock. The
only reason we could get away without lockdep splats with our current
dma-buf code in i915 of attempting to handle dma-buf more dynamic was
because we used our completely independent locking design (and also
never shared with another i915 instance). That illusion falls apart
with i915 using dma-resv and with now multiple i915 instances being
possible.

tldr; Using this way we can cleanly untangle solving the locking issue
at hand from the fairly bigger topic of how we are going to support
dynamic dma-buf and p2p and all that in i915.

I hope this explains a bit better why I have my take here like that.
-Daniel

> All we need for a quick interim fix is to not take the dma_resv_lock from
> our map/unamp callbacks. Pinning our backing storage from attach/detach
> callbacks (which are also called under dma_resv_lock) would also achieve
> that, without mudding any waters. So essentially just moving the
> pin/unpin_pages_unlocked and we should be good, which is almost as little
> typing.
>
> Michael, since Thomas is on vacations now, care to type that up? The
> selftest is imo solid.
>
> This is also consistent with what all other ttm based drivers do (aside
> from amdgpu, which is fully dynamic), see drm_gem_map_attach in
> drm_prime.c
>
> Adding Christian as fyi.
> -Daniel
>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  31 ++++-
> >  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 116 +++++++++++++++++-
> >  2 files changed, 143 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_dmabuf.c
> > index 616c3a2f1baf..918c19df7b66 100644
> > --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> > @@ -12,6 +12,8 @@
> >  #include "i915_gem_object.h"
> >  #include "i915_scatterlist.h"
> >
> > +I915_SELFTEST_DECLARE(static bool force_different_devices;)
> > +
> >  static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf)
> >  {
> >       return to_intel_bo(buf->priv);
> > @@ -25,7 +27,14 @@ static struct sg_table *i915_gem_map_dma_buf(struct =
dma_buf_attachment *attachme
> >       struct scatterlist *src, *dst;
> >       int ret, i;
> >
> > -     ret =3D i915_gem_object_pin_pages_unlocked(obj);
> > +     assert_object_held(obj);
> > +
> > +     /*
> > +      * Note. In the dynamic importer case, the object is not yet pinn=
ed.
> > +      * Let's pin it here to avoid having to call the move_notify
> > +      * callback, The call of which is not yet implemented.
> > +      */
> > +     ret =3D i915_gem_object_pin_pages(obj);
> >       if (ret)
> >               goto err;
> >
> > @@ -168,6 +177,21 @@ static int i915_gem_end_cpu_access(struct dma_buf =
*dma_buf, enum dma_data_direct
> >       return err;
> >  }
> >
> > +static int i915_gem_dmabuf_pin(struct dma_buf_attachment *attach)
> > +{
> > +     struct drm_i915_gem_object *obj =3D dma_buf_to_obj(attach->dmabuf=
);
> > +
> > +     assert_object_held(obj);
> > +     return i915_gem_object_pin_pages(obj);
> > +}
> > +
> > +static void i915_gem_dmabuf_unpin(struct dma_buf_attachment *attach)
> > +{
> > +     struct drm_i915_gem_object *obj =3D dma_buf_to_obj(attach->dmabuf=
);
> > +
> > +     i915_gem_object_unpin_pages(obj);
> > +}
> > +
> >  static const struct dma_buf_ops i915_dmabuf_ops =3D  {
> >       .map_dma_buf =3D i915_gem_map_dma_buf,
> >       .unmap_dma_buf =3D i915_gem_unmap_dma_buf,
> > @@ -177,6 +201,8 @@ static const struct dma_buf_ops i915_dmabuf_ops =3D=
  {
> >       .vunmap =3D i915_gem_dmabuf_vunmap,
> >       .begin_cpu_access =3D i915_gem_begin_cpu_access,
> >       .end_cpu_access =3D i915_gem_end_cpu_access,
> > +     .pin =3D i915_gem_dmabuf_pin,
> > +     .unpin =3D i915_gem_dmabuf_unpin,
> >  };
> >
> >  struct dma_buf *i915_gem_prime_export(struct drm_gem_object *gem_obj, =
int flags)
> > @@ -241,7 +267,8 @@ struct drm_gem_object *i915_gem_prime_import(struct=
 drm_device *dev,
> >       if (dma_buf->ops =3D=3D &i915_dmabuf_ops) {
> >               obj =3D dma_buf_to_obj(dma_buf);
> >               /* is it from our device? */
> > -             if (obj->base.dev =3D=3D dev) {
> > +             if (obj->base.dev =3D=3D dev &&
> > +                 !I915_SELFTEST_ONLY(force_different_devices)) {
> >                       /*
> >                        * Importing dmabuf exported from out own gem inc=
reases
> >                        * refcount on gem itself instead of f_count of d=
mabuf.
> > diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/dri=
vers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> > index dd74bc09ec88..868b3469ecbd 100644
> > --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> > +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> > @@ -35,7 +35,7 @@ static int igt_dmabuf_export(void *arg)
> >  static int igt_dmabuf_import_self(void *arg)
> >  {
> >       struct drm_i915_private *i915 =3D arg;
> > -     struct drm_i915_gem_object *obj;
> > +     struct drm_i915_gem_object *obj, *import_obj;
> >       struct drm_gem_object *import;
> >       struct dma_buf *dmabuf;
> >       int err;
> > @@ -65,14 +65,125 @@ static int igt_dmabuf_import_self(void *arg)
> >               err =3D -EINVAL;
> >               goto out_import;
> >       }
> > +     import_obj =3D to_intel_bo(import);
> > +
> > +     i915_gem_object_lock(import_obj, NULL);
> > +     err =3D ____i915_gem_object_get_pages(import_obj);
> > +     i915_gem_object_unlock(import_obj);
> > +     if (err) {
> > +             pr_err("Same object dma-buf get_pages failed!\n");
> > +             goto out_import;
> > +     }
> >
> >       err =3D 0;
> >  out_import:
> > -     i915_gem_object_put(to_intel_bo(import));
> > +     i915_gem_object_put(import_obj);
> > +out_dmabuf:
> > +     dma_buf_put(dmabuf);
> > +out:
> > +     i915_gem_object_put(obj);
> > +     return err;
> > +}
> > +
> > +static void igt_dmabuf_move_notify(struct dma_buf_attachment *attach)
> > +{
> > +     GEM_WARN_ON(1);
> > +}
> > +
> > +static const struct dma_buf_attach_ops igt_dmabuf_attach_ops =3D {
> > +     .move_notify =3D igt_dmabuf_move_notify,
> > +};
> > +
> > +static int igt_dmabuf_import_same_driver(void *arg)
> > +{
> > +     struct drm_i915_private *i915 =3D arg;
> > +     struct drm_i915_gem_object *obj, *import_obj;
> > +     struct drm_gem_object *import;
> > +     struct dma_buf *dmabuf;
> > +     struct dma_buf_attachment *import_attach;
> > +     struct sg_table *st;
> > +     long timeout;
> > +     int err;
> > +
> > +     force_different_devices =3D true;
> > +     obj =3D i915_gem_object_create_shmem(i915, PAGE_SIZE);
> > +     if (IS_ERR(obj))
> > +             goto out_ret;
> > +
> > +     dmabuf =3D i915_gem_prime_export(&obj->base, 0);
> > +     if (IS_ERR(dmabuf)) {
> > +             pr_err("i915_gem_prime_export failed with err=3D%d\n",
> > +                    (int)PTR_ERR(dmabuf));
> > +             err =3D PTR_ERR(dmabuf);
> > +             goto out;
> > +     }
> > +
> > +     import =3D i915_gem_prime_import(&i915->drm, dmabuf);
> > +     if (IS_ERR(import)) {
> > +             pr_err("i915_gem_prime_import failed with err=3D%d\n",
> > +                    (int)PTR_ERR(import));
> > +             err =3D PTR_ERR(import);
> > +             goto out_dmabuf;
> > +     }
> > +
> > +     if (import =3D=3D &obj->base) {
> > +             pr_err("i915_gem_prime_import reused gem object!\n");
> > +             err =3D -EINVAL;
> > +             goto out_import;
> > +     }
> > +
> > +     import_obj =3D to_intel_bo(import);
> > +
> > +     i915_gem_object_lock(import_obj, NULL);
> > +     err =3D ____i915_gem_object_get_pages(import_obj);
> > +     if (err) {
> > +             pr_err("Different objects dma-buf get_pages failed!\n");
> > +             i915_gem_object_unlock(import_obj);
> > +             goto out_import;
> > +     }
> > +
> > +     /*
> > +      * If the exported object is not in system memory, something
> > +      * weird is going on. TODO: When p2p is supported, this is no
> > +      * longer considered weird.
> > +      */
> > +     if (obj->mm.region !=3D i915->mm.regions[INTEL_REGION_SMEM]) {
> > +             pr_err("Exported dma-buf is not in system memory\n");
> > +             err =3D -EINVAL;
> > +     }
> > +
> > +     i915_gem_object_unlock(import_obj);
> > +
> > +     /* Now try a fake dynamic importer */
> > +     import_attach =3D dma_buf_dynamic_attach(dmabuf, obj->base.dev->d=
ev,
> > +                                            &igt_dmabuf_attach_ops,
> > +                                            NULL);
> > +     if (IS_ERR(import_attach))
> > +             goto out_import;
> > +
> > +     dma_resv_lock(dmabuf->resv, NULL);
> > +     st =3D dma_buf_map_attachment(import_attach, DMA_BIDIRECTIONAL);
> > +     dma_resv_unlock(dmabuf->resv);
> > +     if (IS_ERR(st))
> > +             goto out_detach;
> > +
> > +     timeout =3D dma_resv_wait_timeout(dmabuf->resv, false, true, 5 * =
HZ);
> > +     if (!timeout) {
> > +             pr_err("dmabuf wait for exclusive fence timed out.\n");
> > +             timeout =3D -ETIME;
> > +     }
> > +     err =3D timeout > 0 ? 0 : timeout;
> > +     dma_buf_unmap_attachment(import_attach, st, DMA_BIDIRECTIONAL);
> > +out_detach:
> > +     dma_buf_detach(dmabuf, import_attach);
> > +out_import:
> > +     i915_gem_object_put(import_obj);
> >  out_dmabuf:
> >       dma_buf_put(dmabuf);
> >  out:
> >       i915_gem_object_put(obj);
> > +out_ret:
> > +     force_different_devices =3D false;
> >       return err;
> >  }
> >
> > @@ -286,6 +397,7 @@ int i915_gem_dmabuf_live_selftests(struct drm_i915_=
private *i915)
> >  {
> >       static const struct i915_subtest tests[] =3D {
> >               SUBTEST(igt_dmabuf_export),
> > +             SUBTEST(igt_dmabuf_import_same_driver),
> >       };
> >
> >       return i915_subtests(tests, i915);
> > --
> > 2.31.1
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
