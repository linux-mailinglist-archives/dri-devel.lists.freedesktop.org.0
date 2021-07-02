Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FDA3BA382
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 19:09:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 930856E15F;
	Fri,  2 Jul 2021 17:09:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com
 [IPv6:2607:f8b0:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3B106E15D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 17:09:50 +0000 (UTC)
Received: by mail-oi1-x22e.google.com with SMTP id w127so12037157oig.12
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Jul 2021 10:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iFkSFdNSZ2uB74FmgzHQvEKwPiPJJ8u4nPVly1FT1bs=;
 b=W4lmsmcgEf8VrI++RUjBTQVTBxjGrxpoi0WY7uSyzbBFRFMzoUatkeuE6a72CYJuIB
 PqxhfRbBggxmMoDMbRERKR2JDLPOT+Pn1CcEUmM0tKNEfdl+81O0gr/OLFpJrB7NjkZ7
 R8n0R07n934kNcdTodr9FbYJPI6VI/MX18U0k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iFkSFdNSZ2uB74FmgzHQvEKwPiPJJ8u4nPVly1FT1bs=;
 b=gRkENho/1MqEjKt79kgrqM2ft4J/YMEtHpxPOO0FFbWV3WDCrdtuW+AYdhSs45mLNi
 mDkIXLjPltRsjAyDRL3ZlbY/zCz/SofmTGE/pTTMvkwTf/RE3JBBUfEkVNxsJMCCS//8
 0pYAjmANdfqVeoOtte7VSXtcV1zbKhcY1JNdatHuD7YsFvR8Y+bdko4gnC/4jNWgujJW
 UAcV6w36FImdnZNBsiSSLGRQcRY+HrjevOjdIvIXMKqMNhxkL5tE3Vr+aDnDO08cOSub
 4vZXk6clv9tLUAvHWtsxEkF9TMhGhpXZnzbdOQfzD0FMp0eAxeJim//D6m90xTYdVWxv
 6Aeg==
X-Gm-Message-State: AOAM533wMrBEGo/Nl7Mdf8tKDG+5scfRuigOvLl0Ida+0Nl2nn7sfM4D
 VOIj5Wg6lmSkDeTRUP4LBgUzu8n40OC2RjTUmayg2A==
X-Google-Smtp-Source: ABdhPJysi+/kjZnyslSz7yNnvGkPBBIIDGZ46Uza3yxaaPYIizokbDOQ/1dlSIWGSNzbi5TPmE/6uIy0NRerV1Xtz5M=
X-Received: by 2002:a05:6808:8f7:: with SMTP id
 d23mr645781oic.14.1625245790108; 
 Fri, 02 Jul 2021 10:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210701142407.458836-1-michael.j.ruhl@intel.com>
In-Reply-To: <20210701142407.458836-1-michael.j.ruhl@intel.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 2 Jul 2021 19:09:39 +0200
Message-ID: <CAKMK7uFHJcS-P73h3XarewVv5rEs-H928NJb-J_RJAZ1PRBENw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/i915/gem: Correct the locking and pin pattern for
 dma-buf
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
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
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 1, 2021 at 4:24 PM Michael J. Ruhl <michael.j.ruhl@intel.com> w=
rote:
>
> From: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>
> If our exported dma-bufs are imported by another instance of our driver,
> that instance will typically have the imported dma-bufs locked during
> dma_buf_map_attachment(). But the exporter also locks the same reservatio=
n
> object in the map_dma_buf() callback, which leads to recursive locking.
>
> So taking the lock inside _pin_pages_unlocked() is incorrect.
>
> Additionally, the current pinning code path is contrary to the defined
> way that pinning should occur.
>
> Remove the explicit pin/unpin from the map/umap functions and move them
> to the attach/detach allowing correct locking to occur, and to match
> the static dma-buf drm_prime pattern.
>
> Add a live selftest to exercise both dynamic and non-dynamic
> exports.
>
> v2:
> - Extend the selftest with a fake dynamic importer.
> - Provide real pin and unpin callbacks to not abuse the interface.
> v3: (ruhl)
> - Remove the dynamic export support and move the pinning into the
>   attach/detach path.
>
> Reported-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>

CI splat is because I got the locking rules wrong, I thought
->attach/detach are called under the dma_resv_lock, because when we
used the old dma_buf->lock those calls where protected by that lock
under the same critical section as adding/removing from the list. But
we changed that in

f45f57cce584 ("dma-buf: stop using the dmabuf->lock so much v2")
15fd552d186c ("dma-buf: change DMA-buf locking convention v3")

Because keeping dma_resv_lock over ->attach/detach would go boom on
all the ttm drivers, which pin/unpin the buffer in there. Iow we need
the unlocked version there, but also having this split up is a bit
awkward and might be good to patch up so that it's atomic again. Would
mean updating a bunch of drivers. Christian, any thoughts?

Mike, for now I'd just keep using the _unlocked variants and we should be f=
ine.
-Daniel

> ---
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  46 ++++++--
>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 111 +++++++++++++++++-
>  2 files changed, 143 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm=
/i915/gem/i915_gem_dmabuf.c
> index 616c3a2f1baf..00338c8d3739 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
> @@ -12,6 +12,8 @@
>  #include "i915_gem_object.h"
>  #include "i915_scatterlist.h"
>
> +I915_SELFTEST_DECLARE(static bool force_different_devices;)
> +
>  static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf)
>  {
>         return to_intel_bo(buf->priv);
> @@ -25,15 +27,11 @@ static struct sg_table *i915_gem_map_dma_buf(struct d=
ma_buf_attachment *attachme
>         struct scatterlist *src, *dst;
>         int ret, i;
>
> -       ret =3D i915_gem_object_pin_pages_unlocked(obj);
> -       if (ret)
> -               goto err;
> -
>         /* Copy sg so that we make an independent mapping */
>         st =3D kmalloc(sizeof(struct sg_table), GFP_KERNEL);
>         if (st =3D=3D NULL) {
>                 ret =3D -ENOMEM;
> -               goto err_unpin_pages;
> +               goto err;
>         }
>
>         ret =3D sg_alloc_table(st, obj->mm.pages->nents, GFP_KERNEL);
> @@ -58,8 +56,6 @@ static struct sg_table *i915_gem_map_dma_buf(struct dma=
_buf_attachment *attachme
>         sg_free_table(st);
>  err_free:
>         kfree(st);
> -err_unpin_pages:
> -       i915_gem_object_unpin_pages(obj);
>  err:
>         return ERR_PTR(ret);
>  }
> @@ -68,13 +64,9 @@ static void i915_gem_unmap_dma_buf(struct dma_buf_atta=
chment *attachment,
>                                    struct sg_table *sg,
>                                    enum dma_data_direction dir)
>  {
> -       struct drm_i915_gem_object *obj =3D dma_buf_to_obj(attachment->dm=
abuf);
> -
>         dma_unmap_sgtable(attachment->dev, sg, dir, DMA_ATTR_SKIP_CPU_SYN=
C);
>         sg_free_table(sg);
>         kfree(sg);
> -
> -       i915_gem_object_unpin_pages(obj);
>  }
>
>  static int i915_gem_dmabuf_vmap(struct dma_buf *dma_buf, struct dma_buf_=
map *map)
> @@ -168,7 +160,32 @@ static int i915_gem_end_cpu_access(struct dma_buf *d=
ma_buf, enum dma_data_direct
>         return err;
>  }
>
> +/**
> + * i915_gem_dmabuf_attach - Do any extra attach work necessary
> + * @dmabuf: imported dma-buf
> + * @attach: new attach to do work on
> + *
> + */
> +static int i915_gem_dmabuf_attach(struct dma_buf *dmabuf,
> +                                 struct dma_buf_attachment *attach)
> +{
> +       struct drm_i915_gem_object *obj =3D dma_buf_to_obj(dmabuf);
> +
> +       assert_object_held(obj);
> +       return i915_gem_object_pin_pages(obj);
> +}
> +
> +static void i915_gem_dmabuf_detach(struct dma_buf *dmabuf,
> +                                 struct dma_buf_attachment *attach)
> +{
> +       struct drm_i915_gem_object *obj =3D dma_buf_to_obj(dmabuf);
> +
> +       i915_gem_object_unpin_pages(obj);
> +}
> +
>  static const struct dma_buf_ops i915_dmabuf_ops =3D  {
> +       .attach =3D i915_gem_dmabuf_attach,
> +       .detach =3D i915_gem_dmabuf_detach,
>         .map_dma_buf =3D i915_gem_map_dma_buf,
>         .unmap_dma_buf =3D i915_gem_unmap_dma_buf,
>         .release =3D drm_gem_dmabuf_release,
> @@ -204,6 +221,8 @@ static int i915_gem_object_get_pages_dmabuf(struct dr=
m_i915_gem_object *obj)
>         struct sg_table *pages;
>         unsigned int sg_page_sizes;
>
> +       assert_object_held(obj);
> +
>         pages =3D dma_buf_map_attachment(obj->base.import_attach,
>                                        DMA_BIDIRECTIONAL);
>         if (IS_ERR(pages))
> @@ -219,6 +238,8 @@ static int i915_gem_object_get_pages_dmabuf(struct dr=
m_i915_gem_object *obj)
>  static void i915_gem_object_put_pages_dmabuf(struct drm_i915_gem_object =
*obj,
>                                              struct sg_table *pages)
>  {
> +       assert_object_held(obj);
> +
>         dma_buf_unmap_attachment(obj->base.import_attach, pages,
>                                  DMA_BIDIRECTIONAL);
>  }
> @@ -241,7 +262,8 @@ struct drm_gem_object *i915_gem_prime_import(struct d=
rm_device *dev,
>         if (dma_buf->ops =3D=3D &i915_dmabuf_ops) {
>                 obj =3D dma_buf_to_obj(dma_buf);
>                 /* is it from our device? */
> -               if (obj->base.dev =3D=3D dev) {
> +               if (obj->base.dev =3D=3D dev &&
> +                   !I915_SELFTEST_ONLY(force_differnt_devices)) {
>                         /*
>                          * Importing dmabuf exported from out own gem inc=
reases
>                          * refcount on gem itself instead of f_count of d=
mabuf.
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c b/drive=
rs/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> index dd74bc09ec88..10a113cc00a5 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_dmabuf.c
> @@ -35,7 +35,7 @@ static int igt_dmabuf_export(void *arg)
>  static int igt_dmabuf_import_self(void *arg)
>  {
>         struct drm_i915_private *i915 =3D arg;
> -       struct drm_i915_gem_object *obj;
> +       struct drm_i915_gem_object *obj, *import_obj;
>         struct drm_gem_object *import;
>         struct dma_buf *dmabuf;
>         int err;
> @@ -65,14 +65,120 @@ static int igt_dmabuf_import_self(void *arg)
>                 err =3D -EINVAL;
>                 goto out_import;
>         }
> +       import_obj =3D to_intel_bo(import);
> +
> +       i915_gem_object_lock(import_obj, NULL);
> +       err =3D ____i915_gem_object_get_pages(import_obj);
> +       i915_gem_object_unlock(import_obj);
> +       if (err) {
> +               pr_err("Same object dma-buf get_pages failed!\n");
> +               goto out_import;
> +       }
>
>         err =3D 0;
>  out_import:
> -       i915_gem_object_put(to_intel_bo(import));
> +       i915_gem_object_put(import_obj);
> +out_dmabuf:
> +       dma_buf_put(dmabuf);
> +out:
> +       i915_gem_object_put(obj);
> +       return err;
> +}
> +
> +static const struct dma_buf_attach_ops igt_dmabuf_attach_ops =3D {
> +       .move_notify =3D igt_dmabuf_move_notify,
> +};
> +
> +static int igt_dmabuf_import_same_driver(void *arg)
> +{
> +       struct drm_i915_private *i915 =3D arg;
> +       struct drm_i915_gem_object *obj, *import_obj;
> +       struct drm_gem_object *import;
> +       struct dma_buf *dmabuf;
> +       struct dma_buf_attachment *import_attach;
> +       struct sg_table *st;
> +       long timeout;
> +       int err;
> +
> +       force_different_devices =3D true;
> +       obj =3D i915_gem_object_create_shmem(i915, PAGE_SIZE);
> +       if (IS_ERR(obj))
> +               goto out_ret;
> +
> +       dmabuf =3D i915_gem_prime_export(&obj->base, 0);
> +       if (IS_ERR(dmabuf)) {
> +               pr_err("i915_gem_prime_export failed with err=3D%d\n",
> +                      (int)PTR_ERR(dmabuf));
> +               err =3D PTR_ERR(dmabuf);
> +               goto out;
> +       }
> +
> +       import =3D i915_gem_prime_import(&i915->drm, dmabuf);
> +       if (IS_ERR(import)) {
> +               pr_err("i915_gem_prime_import failed with err=3D%d\n",
> +                      (int)PTR_ERR(import));
> +               err =3D PTR_ERR(import);
> +               goto out_dmabuf;
> +       }
> +
> +       if (import =3D=3D &obj->base) {
> +               pr_err("i915_gem_prime_import reused gem object!\n");
> +               err =3D -EINVAL;
> +               goto out_import;
> +       }
> +
> +       import_obj =3D to_intel_bo(import);
> +
> +       i915_gem_object_lock(import_obj, NULL);
> +       err =3D ____i915_gem_object_get_pages(import_obj);
> +       if (err) {
> +               pr_err("Different objects dma-buf get_pages failed!\n");
> +               i915_gem_object_unlock(import_obj);
> +               goto out_import;
> +       }
> +
> +       /*
> +        * If the exported object is not in system memory, something
> +        * weird is going on. TODO: When p2p is supported, this is no
> +        * longer considered weird.
> +        */
> +       if (obj->mm.region !=3D i915->mm.regions[INTEL_REGION_SMEM]) {
> +               pr_err("Exported dma-buf is not in system memory\n");
> +               err =3D -EINVAL;
> +       }
> +
> +       i915_gem_object_unlock(import_obj);
> +
> +       /* Now try a fake dynamic importer */
> +       import_attach =3D dma_buf_dynamic_attach(dmabuf, obj->base.dev->d=
ev,
> +                                              &igt_dmabuf_attach_ops,
> +                                              NULL);
> +       if (IS_ERR(import_attach))
> +               goto out_import;
> +
> +       dma_resv_lock(dmabuf->resv, NULL);
> +       st =3D dma_buf_map_attachment(import_attach, DMA_BIDIRECTIONAL);
> +       dma_resv_unlock(dmabuf->resv);
> +       if (IS_ERR(st))
> +               goto out_detach;
> +
> +       timeout =3D dma_resv_wait_timeout(dmabuf->resv, false, true, 5 * =
HZ);
> +       if (!timeout) {
> +               pr_err("dmabuf wait for exclusive fence timed out.\n");
> +               timeout =3D -ETIME;
> +       }
> +       err =3D timeout > 0 ? 0 : timeout;
> +       dma_buf_unmap_attachment(import_attach, st, DMA_BIDIRECTIONAL);
> +out_detach:
> +       dma_buf_detach(dmabuf, import_attach);
> +out_import:
> +       i915_gem_object_put(import_obj);
>  out_dmabuf:
>         dma_buf_put(dmabuf);
>  out:
>         i915_gem_object_put(obj);
> +out_ret:
> +       force_different_devices =3D false;
>         return err;
>  }
>
> @@ -286,6 +392,7 @@ int i915_gem_dmabuf_live_selftests(struct drm_i915_pr=
ivate *i915)
>  {
>         static const struct i915_subtest tests[] =3D {
>                 SUBTEST(igt_dmabuf_export),
> +               SUBTEST(igt_dmabuf_import_same_driver),
>         };
>
>         return i915_subtests(tests, i915);
> --
> 2.31.1
>


--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
