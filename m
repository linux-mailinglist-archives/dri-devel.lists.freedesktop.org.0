Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 487EA3C7282
	for <lists+dri-devel@lfdr.de>; Tue, 13 Jul 2021 16:44:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5C789722;
	Tue, 13 Jul 2021 14:43:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com
 [IPv6:2607:f8b0:4864:20::b34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC5E89722
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 14:43:58 +0000 (UTC)
Received: by mail-yb1-xb34.google.com with SMTP id g5so35118989ybu.10
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jul 2021 07:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=JDHH24gXZKZAsIxnSmuCljEaZ01HldWRiJOxUt4Gcfk=;
 b=rhEnq4Q7vD3iyWANzxHQtljQNo/YP++TmIN7kR0lYJt+XAHw0dObv0pGiQ9l4mWg6E
 tiqpW8MTWNo4Or3+f6tZ8toJVq3hW8uJ1RFYZrSnlor7GEfYAigt0nxIk15mMWuBaTO5
 Y8NGqQbIrLBKl4QYyo+cklI0TfL6qXzZPc0DBC6ssId/p9OTWDAa9H+Tp2EBguTS3eZD
 4rj6posjLlAV5F4In4Es7qEfNY5CkpbI+WQgU8VDSYvI3asHp2TBEX/gjDLNJZV/Nzvk
 /di6exO3/anNGZpKsSM3mzUn+8UPaS3RlQeWjQtqP5xRj3FqyqkLrjS8pL5hOH1rM+CG
 1jXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JDHH24gXZKZAsIxnSmuCljEaZ01HldWRiJOxUt4Gcfk=;
 b=LE7qXc8zAEtBFwYn/Oir0goa4qzmypaAjXUmBAQh2gl73Ss/sXG8pci0EV+uNOZVz1
 yIkyRDx/JwY1I+PU3GMfKMMPDjBKpGL28Y0f6RIKJoc5r+vEfwtYX3LscK+KgsQSjR7j
 Jr1mpuF0x30OXxB0c5IdZahMU51KWPbpEoTtmCJfCXWO1PK2MdO+32CKKLH6zl5kr25K
 tOfOUYsKSvIINvG6Ht6GifEemBGNTrYmQniAamEnZbejcUw9uMX1W8za/dYfxbzt+wKJ
 J5MMhVIKCvd5X2qorfD/33vn1QvIqPYfHa6N8Ul8SWkN/Z/gc8sPEdxs/ML+r/KYi8LN
 nX8g==
X-Gm-Message-State: AOAM533IXm7n71nEGaycu0FO1LV6rau7LJJPlbm9XJhxV/saJAzsRjcB
 DZ/YB9jF4+UPm6FESHpGDgtNKFDIgLZIpZ6N2l0RqA==
X-Google-Smtp-Source: ABdhPJxaOZdXHdu3P2GPV1aC/z/Suk7DTLv7vNPw+KyaCc08YRhNosxtI+1mDKYP8F24tVVmZOT16B6iq6MZr4G1Sy0=
X-Received: by 2002:a25:2f89:: with SMTP id v131mr6432243ybv.469.1626187436873; 
 Tue, 13 Jul 2021 07:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210712231234.1031975-1-jason@jlekstrand.net>
 <YO2l2I6Ln1EI0RoS@phenom.ffwll.local>
In-Reply-To: <YO2l2I6Ln1EI0RoS@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Tue, 13 Jul 2021 09:43:45 -0500
Message-ID: <CAOFGe94LKUWERBR_dUat=6ESrdDwZ29cmkH5j1q-iEYxZwMVig@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/i915/gem: Correct the locking and pin pattern for
 dma-buf (v5)
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 "Michael J . Ruhl" <michael.j.ruhl@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 13, 2021 at 9:40 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Jul 12, 2021 at 06:12:33PM -0500, Jason Ekstrand wrote:
> > From: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> >
> > If our exported dma-bufs are imported by another instance of our driver=
,
> > that instance will typically have the imported dma-bufs locked during
> > dma_buf_map_attachment(). But the exporter also locks the same reservat=
ion
> > object in the map_dma_buf() callback, which leads to recursive locking.
> >
> > So taking the lock inside _pin_pages_unlocked() is incorrect.
> >
> > Additionally, the current pinning code path is contrary to the defined
> > way that pinning should occur.
> >
> > Remove the explicit pin/unpin from the map/umap functions and move them
> > to the attach/detach allowing correct locking to occur, and to match
> > the static dma-buf drm_prime pattern.
> >
> > Add a live selftest to exercise both dynamic and non-dynamic
> > exports.
> >
> > v2:
> > - Extend the selftest with a fake dynamic importer.
> > - Provide real pin and unpin callbacks to not abuse the interface.
> > v3: (ruhl)
> > - Remove the dynamic export support and move the pinning into the
> >   attach/detach path.
> > v4: (ruhl)
> > - Put pages does not need to assert on the dma-resv
> > v5: (jason)
> > - Lock around dma_buf_unmap_attachment() when emulating a dynamic
> >   importer in the subtests.
> > - Use pin_pages_unlocked
> >
> > Reported-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> > Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> > Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> > Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
> > ---
> >  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  43 +++++--
> >  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 118 +++++++++++++++++-
> >  2 files changed, 147 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/d=
rm/i915/gem/i915_gem_dmabuf.c
> > index 616c3a2f1baf0..9a655f69a0671 100644
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
> > @@ -25,15 +27,11 @@ static struct sg_table *i915_gem_map_dma_buf(struct=
 dma_buf_attachment *attachme
> >       struct scatterlist *src, *dst;
> >       int ret, i;
> >
> > -     ret =3D i915_gem_object_pin_pages_unlocked(obj);
> > -     if (ret)
> > -             goto err;
> > -
> >       /* Copy sg so that we make an independent mapping */
> >       st =3D kmalloc(sizeof(struct sg_table), GFP_KERNEL);
> >       if (st =3D=3D NULL) {
> >               ret =3D -ENOMEM;
> > -             goto err_unpin_pages;
> > +             goto err;
> >       }
> >
> >       ret =3D sg_alloc_table(st, obj->mm.pages->nents, GFP_KERNEL);
> > @@ -58,8 +56,6 @@ static struct sg_table *i915_gem_map_dma_buf(struct d=
ma_buf_attachment *attachme
> >       sg_free_table(st);
> >  err_free:
> >       kfree(st);
> > -err_unpin_pages:
> > -     i915_gem_object_unpin_pages(obj);
> >  err:
> >       return ERR_PTR(ret);
> >  }
> > @@ -68,13 +64,9 @@ static void i915_gem_unmap_dma_buf(struct dma_buf_at=
tachment *attachment,
> >                                  struct sg_table *sg,
> >                                  enum dma_data_direction dir)
> >  {
> > -     struct drm_i915_gem_object *obj =3D dma_buf_to_obj(attachment->dm=
abuf);
> > -
> >       dma_unmap_sgtable(attachment->dev, sg, dir, DMA_ATTR_SKIP_CPU_SYN=
C);
> >       sg_free_table(sg);
> >       kfree(sg);
> > -
> > -     i915_gem_object_unpin_pages(obj);
> >  }
> >
> >  static int i915_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_bu=
f_map *map)
> > @@ -168,7 +160,31 @@ static int i915_gem_end_cpu_access(struct dma_buf =
*dma_buf, enum dma_data_direct
> >       return err;
> >  }
> >
> > +/**
> > + * i915_gem_dmabuf_attach - Do any extra attach work necessary
> > + * @dmabuf: imported dma-buf
> > + * @attach: new attach to do work on
> > + *
> > + */
> > +static int i915_gem_dmabuf_attach(struct dma_buf *dmabuf,
> > +                               struct dma_buf_attachment *attach)
> > +{
> > +     struct drm_i915_gem_object *obj =3D dma_buf_to_obj(dmabuf);
> > +
> > +     return i915_gem_object_pin_pages_unlocked(obj);
> > +}
> > +
> > +static void i915_gem_dmabuf_detach(struct dma_buf *dmabuf,
> > +                                struct dma_buf_attachment *attach)
> > +{
> > +     struct drm_i915_gem_object *obj =3D dma_buf_to_obj(dmabuf);
> > +
> > +     i915_gem_object_unpin_pages(obj);
> > +}
> > +
> >  static const struct dma_buf_ops i915_dmabuf_ops =3D  {
> > +     .attach =3D i915_gem_dmabuf_attach,
> > +     .detach =3D i915_gem_dmabuf_detach,
> >       .map_dma_buf =3D i915_gem_map_dma_buf,
> >       .unmap_dma_buf =3D i915_gem_unmap_dma_buf,
> >       .release =3D drm_gem_dmabuf_release,
> > @@ -204,6 +220,8 @@ static int i915_gem_object_get_pages_dmabuf(struct =
drm_i915_gem_object *obj)
> >       struct sg_table *pages;
> >       unsigned int sg_page_sizes;
> >
> > +     assert_object_held(obj);
> > +
> >       pages =3D dma_buf_map_attachment(obj->base.import_attach,
> >                                      DMA_BIDIRECTIONAL);
> >       if (IS_ERR(pages))
> > @@ -241,7 +259,8 @@ struct drm_gem_object *i915_gem_prime_import(struct=
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
> > index dd74bc09ec88d..3dc0f8b3cdab0 100644
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
> > @@ -65,14 +65,127 @@ static int igt_dmabuf_import_self(void *arg)
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
>
> Since we don't do a fake dynamic importer please use the non-dynamic
> version here. I think just needs you to delete the attach_ops.

Isn't the whole point of these tests to test the dynamic import paths?

> > +                                            &igt_dmabuf_attach_ops,
> > +                                            NULL);
> > +     if (IS_ERR(import_attach))
> > +             goto out_import;
> > +
> > +     dma_resv_lock(dmabuf->resv, NULL);
>
> Also non-dynamic doesn't need dma_resv_lock here (dma-buf.c does that for
> you if needed).
>
> > +     st =3D dma_buf_map_attachment(import_attach, DMA_BIDIRECTIONAL);
> > +     dma_resv_unlock(dmabuf->resv);
> > +     if (IS_ERR(st))
> > +             goto out_detach;
> > +
> > +     timeout =3D dma_resv_wait_timeout(dmabuf->resv, false, true, 5 * =
HZ);
>
> And also not this one here.
>
> With that:
>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>
> > +     if (!timeout) {
> > +             pr_err("dmabuf wait for exclusive fence timed out.\n");
> > +             timeout =3D -ETIME;
> > +     }
> > +     err =3D timeout > 0 ? 0 : timeout;
> > +     dma_resv_lock(dmabuf->resv, NULL);
> > +     dma_buf_unmap_attachment(import_attach, st, DMA_BIDIRECTIONAL);
> > +     dma_resv_unlock(dmabuf->resv);
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
> > @@ -286,6 +399,7 @@ int i915_gem_dmabuf_live_selftests(struct drm_i915_=
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
