Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6133CF68F
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 11:07:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A02889F38;
	Tue, 20 Jul 2021 09:07:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57E4189F38;
 Tue, 20 Jul 2021 09:07:46 +0000 (UTC)
Received: by mail-qv1-xf32.google.com with SMTP id ck17so9763523qvb.9;
 Tue, 20 Jul 2021 02:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/Q5L2a9jfb4khNE0pAjygNWB9Ut3AiXd2FZFom5CMmo=;
 b=S1iv3zWNz0TanPjy4jNGBYX4XRzDZXlQPKzN0CyBZ466J85N0aP/Sgyr3f5zZLmpdr
 iU4TDYMviWkucAdUnuB4Obcehu7FV15MwSgLk5YddYzwQvjGdu8Mqcs7Hm+YrGLn8OwP
 ZDjM0SsxLLGfR4mfhP/vE7SypySkIjTkS4ZhUy9bpzU224LbLrkyR8fNZVDGwU8LkH3t
 rr1X2BcSBCjzORYXpNo3HUb80YdonNohM9/voTK1ZOJ+PosTl8kbUC2yFGVpQyra0khf
 Y123MB24GQfEjngV+BevWSBfXWNbq8je2KXC6Q2uEH9YfQVtidjd/zSipJ5J0cs9u++l
 XmWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/Q5L2a9jfb4khNE0pAjygNWB9Ut3AiXd2FZFom5CMmo=;
 b=rS0ph9AnEuN8YeSFLUkkJWG4JukYcQ9abvxFk+S5AjqOUY7HqPoJt3Ld1CzMIThILd
 ZiEcU9Fn9ZSK7iIWbyABzV9g4Lq5tSS5l//fRjO9b94LpnSwwvilT+gEF/azyRfvQWcb
 w3HYB0cdUEsNdqFOByhBjWizovRJu4ygpfUjtb8TCAoUwZEd/ZGxw3uSkzlZbDrG6Asj
 4cOYKU06HSAzUfuAfPCyFDZ+t+4wFAItwG4J9V9mKd2rwCuSgiWfnh0SV2TK6pPuT4iJ
 26hhMNiQ1jocupUH204jzcGKH9dYSwIZ9tnOkRl69Dokw3Xzn0DOAlLtYaUl7vWn5cQa
 7SXA==
X-Gm-Message-State: AOAM53151vmM9m0+NLF1dyY7HOvQ93c9j+eMyNntPhbUtlgiTwT1iW1S
 KkTlfauyntG7ZQ6L+N0c75tTC4reomB5f8QGKHs=
X-Google-Smtp-Source: ABdhPJxB7EPM3v/mmgrhO7WGyXFx2rav1EG/Earx5dzyjlFJ44KN44zDsv5KqRY7AOqdvPvXpgYskRfK4OlTQyTf7ks=
X-Received: by 2002:ad4:456d:: with SMTP id o13mr29264233qvu.48.1626772065059; 
 Tue, 20 Jul 2021 02:07:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210716141426.1904528-1-jason@jlekstrand.net>
 <20210716141426.1904528-7-jason@jlekstrand.net>
In-Reply-To: <20210716141426.1904528-7-jason@jlekstrand.net>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Tue, 20 Jul 2021 10:07:18 +0100
Message-ID: <CAM0jSHP0CThxGJ-ABAO2kzhtKgh=ypbp+7iPsxPWd5F+Ydc7Tw@mail.gmail.com>
Subject: Re: [PATCH 6/7] drm/i915/gem: Correct the locking and pin pattern for
 dma-buf (v6)
To: Jason Ekstrand <jason@jlekstrand.net>
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
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 "Michael J . Ruhl" <michael.j.ruhl@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 16 Jul 2021 at 15:14, Jason Ekstrand <jason@jlekstrand.net> wrote:
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
> v4: (ruhl)
> - Put pages does not need to assert on the dma-resv
> v5: (jason)
> - Lock around dma_buf_unmap_attachment() when emulating a dynamic
>   importer in the subtests.
> - Use pin_pages_unlocked
> v6: (jason)
> - Use dma_buf_attach instead of dma_buf_attach_dynamic in the selftests
>
> Reported-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
> Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
> Reviewed-by: Jason Ekstrand <jason@jlekstrand.net>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c    |  43 ++++++--
>  .../drm/i915/gem/selftests/i915_gem_dmabuf.c  | 103 +++++++++++++++++-
>  2 files changed, 132 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c b/drivers/gpu/drm=
/i915/gem/i915_gem_dmabuf.c
> index 616c3a2f1baf0..9a655f69a0671 100644
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
> @@ -168,7 +160,31 @@ static int i915_gem_end_cpu_access(struct dma_buf *d=
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
> +       return i915_gem_object_pin_pages_unlocked(obj);
> +}
> +
> +static void i915_gem_dmabuf_detach(struct dma_buf *dmabuf,
> +                                  struct dma_buf_attachment *attach)
> +{
> +       struct drm_i915_gem_object *obj =3D dma_buf_to_obj(dmabuf);
> +
> +       i915_gem_object_unpin_pages(obj);
> +}
> +

We don't normally add kernel-doc for static functions? Otherwise
dmabuf_detach() needs matching kernel-doc.

<snip>

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

err =3D PTR_ERR(obj)

<snip>

> +       /* Now try a fake an importer */
> +       import_attach =3D dma_buf_attach(dmabuf, obj->base.dev->dev);
> +       if (IS_ERR(import_attach))
> +               goto out_import;
> +
> +       st =3D dma_buf_map_attachment(import_attach, DMA_BIDIRECTIONAL);
> +       if (IS_ERR(st))
> +               goto out_detach;

For these two maybe missing err =3D ?
