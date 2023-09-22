Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8886D7AB904
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 20:20:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4957E10E6F7;
	Fri, 22 Sep 2023 18:20:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [IPv6:2607:f8b0:4864:20::b2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB56610E1A0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 18:19:59 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-d81d09d883dso2981780276.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Sep 2023 11:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1695406799; x=1696011599;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MJEfWMki53C0C9QhqoAya3sbRCJGrb7hvD0oAvB4tgE=;
 b=o3uQHip7jxGrR53KPgsH/wnG/aFoWXHYtWJG9hRpJS1GFs8GrI19FJAnkQtgP/MMLs
 i/3XKpPjcfc3bn+QtHZSLCtkGberGxS8GbLLgTUHRPtsH0ShMNrZoZArUW3bHRZ6uYFl
 8ToGNfA8ip45mN5+sgaZEDfB+XuEgHTrIVAC8ny+VsJtCQBUBcLHR+CYMLNCPPNcZaze
 vhVTpim+PV0cn3TSPgQTCiqLIkEpHLjI7KBZ8vK+sG9rgl/jqaHl3DaYVfxshrzhqsfq
 X1K6A4GhPVU0XaT07C8VBehfoB6QNlYB8gr4Xsgh38LczEv8/LxbvffUVhrAlw9ee3qU
 fIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695406799; x=1696011599;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MJEfWMki53C0C9QhqoAya3sbRCJGrb7hvD0oAvB4tgE=;
 b=TkiHFggUrqJNMprtjP1/RK0HW2czBsEzKg2zZ4gM3EiYYOMmlCCa5DjHLaqaueoqGp
 ynpxF3j9flsdT4AIzGscd/SoKd+BF42gtqb6DarD+nhOE6hwUbY3RSaDwZXPg2EsMfyP
 4Z/1SDM1qjz3loZDJobU0gwt81oxzF+AdE7C/CzV4NvFJX5TP/l2tLATOO8Ye0smZ5Wa
 SjwcHw8m6NDmE3NlESHNmF0wUvlR6rhQu8/d5TFkgLpNnanQVoZxKDy/8c5TCP54OWXJ
 XB/YiKIRh50df0nkX7MCZEUVp/I/5Px67UqlIKVmWsvirRDWxHbQSl/69MSoWCfZupqa
 inrQ==
X-Gm-Message-State: AOJu0YyJh7h1dO40RUeYIkAFF4Q185puOxbMrf9lUkI4Sdamt62mbgpg
 72UOUzO8PbmygMdXnzjFLMn9RYQG6WP2xhKGOY6bbw==
X-Google-Smtp-Source: AGHT+IEHQohIXqITSfor/S743Ge1pG10gsNJCzDT+XFRdZSUhjj6xBKLS9Ve3hl88Y+oLZXD7F7ZDyjyqF5lKzjIhh8=
X-Received: by 2002:a25:9205:0:b0:d81:6344:540b with SMTP id
 b5-20020a259205000000b00d816344540bmr65049ybo.45.1695406798515; Fri, 22 Sep
 2023 11:19:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230911023038.30649-1-yong.wu@mediatek.com>
 <20230911023038.30649-3-yong.wu@mediatek.com>
 <71c435a6-ba43-5d26-e658-f55bddbb8b98@amd.com>
In-Reply-To: <71c435a6-ba43-5d26-e658-f55bddbb8b98@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 22 Sep 2023 11:19:46 -0700
Message-ID: <CABdmKX1-5ujRRVQHNVMkoC4Ls0mruxE8GCXNavRLyywD7SobOw@mail.gmail.com>
Subject: Re: [PATCH 2/9] dma-heap: Add proper kref handling on dma-buf heaps
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 jianjiao.zeng@mediatek.com,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Rob Herring <robh+dt@kernel.org>,
 John Stultz <jstultz@google.com>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-media@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Yong Wu <yong.wu@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 11, 2023 at 2:49=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 11.09.23 um 04:30 schrieb Yong Wu:
> > From: John Stultz <jstultz@google.com>
> >
> > Add proper refcounting on the dma_heap structure.
> > While existing heaps are built-in, we may eventually
> > have heaps loaded from modules, and we'll need to be
> > able to properly handle the references to the heaps
> >
> > Also moves minor tracking into the heap structure so
> > we can properly free things.
>
> This is completely unnecessary, see below.
>
> >
> > Signed-off-by: John Stultz <jstultz@google.com>
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> > [Yong: Just add comment for "minor" and "refcount"]
> > ---
> >   drivers/dma-buf/dma-heap.c | 38 ++++++++++++++++++++++++++++++++++---=
-
> >   include/linux/dma-heap.h   |  6 ++++++
> >   2 files changed, 40 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
> > index 51030f6c9d6e..dcc0e38c61fa 100644
> > --- a/drivers/dma-buf/dma-heap.c
> > +++ b/drivers/dma-buf/dma-heap.c
> > @@ -11,6 +11,7 @@
> >   #include <linux/dma-buf.h>
> >   #include <linux/dma-heap.h>
> >   #include <linux/err.h>
> > +#include <linux/kref.h>
> >   #include <linux/list.h>
> >   #include <linux/nospec.h>
> >   #include <linux/syscalls.h>
> > @@ -30,6 +31,8 @@
> >    * @heap_devt:              heap device node
> >    * @list:           list head connecting to list of heaps
> >    * @heap_cdev:              heap char device
> > + * @minor:           heap device node minor number
> > + * @refcount:                reference counter for this heap device
> >    *
> >    * Represents a heap of memory from which buffers can be made.
> >    */
> > @@ -40,6 +43,8 @@ struct dma_heap {
> >       dev_t heap_devt;
> >       struct list_head list;
> >       struct cdev heap_cdev;
> > +     int minor;
> > +     struct kref refcount;
> >   };
> >
> >   static LIST_HEAD(heap_list);
> > @@ -205,7 +210,6 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >   {
> >       struct dma_heap *heap, *h, *err_ret;
> >       struct device *dev_ret;
> > -     unsigned int minor;
> >       int ret;
> >
> >       if (!exp_info->name || !strcmp(exp_info->name, "")) {
> > @@ -222,12 +226,13 @@ struct dma_heap *dma_heap_add(const struct dma_he=
ap_export_info *exp_info)
> >       if (!heap)
> >               return ERR_PTR(-ENOMEM);
> >
> > +     kref_init(&heap->refcount);
> >       heap->name =3D exp_info->name;
> >       heap->ops =3D exp_info->ops;
> >       heap->priv =3D exp_info->priv;
> >
> >       /* Find unused minor number */
> > -     ret =3D xa_alloc(&dma_heap_minors, &minor, heap,
> > +     ret =3D xa_alloc(&dma_heap_minors, &heap->minor, heap,
> >                      XA_LIMIT(0, NUM_HEAP_MINORS - 1), GFP_KERNEL);
> >       if (ret < 0) {
> >               pr_err("dma_heap: Unable to get minor number for heap\n")=
;
> > @@ -236,7 +241,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap=
_export_info *exp_info)
> >       }
> >
> >       /* Create device */
> > -     heap->heap_devt =3D MKDEV(MAJOR(dma_heap_devt), minor);
> > +     heap->heap_devt =3D MKDEV(MAJOR(dma_heap_devt), heap->minor);
> >
> >       cdev_init(&heap->heap_cdev, &dma_heap_fops);
> >       ret =3D cdev_add(&heap->heap_cdev, heap->heap_devt, 1);
> > @@ -280,12 +285,37 @@ struct dma_heap *dma_heap_add(const struct dma_he=
ap_export_info *exp_info)
> >   err2:
> >       cdev_del(&heap->heap_cdev);
> >   err1:
> > -     xa_erase(&dma_heap_minors, minor);
> > +     xa_erase(&dma_heap_minors, heap->minor);
> >   err0:
> >       kfree(heap);
> >       return err_ret;
> >   }
> >
> > +static void dma_heap_release(struct kref *ref)
> > +{
> > +     struct dma_heap *heap =3D container_of(ref, struct dma_heap, refc=
ount);
> > +
> > +     /* Note, we already holding the heap_list_lock here */
> > +     list_del(&heap->list);
> > +
> > +     device_destroy(dma_heap_class, heap->heap_devt);
> > +     cdev_del(&heap->heap_cdev);
> > +     xa_erase(&dma_heap_minors, heap->minor);
>
> You can just use MINOR(heap->heap_devt) here instead.
>
Got it, thanks.

> > +
> > +     kfree(heap);
> > +}
> > +
> > +void dma_heap_put(struct dma_heap *h)
> > +{
> > +     /*
> > +      * Take the heap_list_lock now to avoid racing with code
> > +      * scanning the list and then taking a kref.
> > +      */
>
> This is usually considered a bad idea since it makes the kref approach
> superfluous.
>
> There are multiple possibilities how handle this, the most common one is
> to use kref_get_unless_zero() in your list traversal code and ignore the
> entry when that fails.
>
> Alternatively you could use kref_put_mutex() instead. This gives you the
> same functionality as this here, but as far as I know it's normally only
> used in a couple of special cases.
>
Ok, I'll move this mutex acquisition to dma_heap_release so that it
guards just the list_del, and change dma_heap_find to use
kref_get_unless_zero. Thanks.

> > +     mutex_lock(&heap_list_lock);
> > +     kref_put(&h->refcount, dma_heap_release);
> > +     mutex_unlock(&heap_list_lock);
> > +}
> > +
> >   static char *dma_heap_devnode(const struct device *dev, umode_t *mode=
)
> >   {
> >       return kasprintf(GFP_KERNEL, "dma_heap/%s", dev_name(dev));
> > diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
> > index c7c29b724ad6..f3c678892c5c 100644
> > --- a/include/linux/dma-heap.h
> > +++ b/include/linux/dma-heap.h
> > @@ -64,4 +64,10 @@ const char *dma_heap_get_name(struct dma_heap *heap)=
;
> >    */
> >   struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_=
info);
> >
> > +/**
> > + * dma_heap_put - drops a reference to a dmabuf heap, potentially free=
ing it
> > + * @heap: the heap whose reference count to decrement
> > + */
>
> Please don't add kerneldoc to the definition, add it to the
> implementation of the function.
>
Will fix.




> Regards,
> Christian.
>
> > +void dma_heap_put(struct dma_heap *heap);
> > +
> >   #endif /* _DMA_HEAPS_H */
>
