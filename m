Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80CFE5B1AD8
	for <lists+dri-devel@lfdr.de>; Thu,  8 Sep 2022 13:05:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E2010EA8E;
	Thu,  8 Sep 2022 11:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A8EE10EA8E
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Sep 2022 11:05:13 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 t11-20020a05683014cb00b0063734a2a786so12089166otq.11
 for <dri-devel@lists.freedesktop.org>; Thu, 08 Sep 2022 04:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=iQ9amRmmVnRxpXcE5umaGoOgZh5PL9H2v0qg5K1KUpw=;
 b=FkR3LY1OY2JlwgbK6I/79qBwFZ73IHRrFlPC3Iffg8LBfgJI+AqFA8VCbA9YE08PrM
 INNJheZf5j3f73H1vhNLXMuDn70X9fPyBDD+jCAnobS0TZSBROZVNzWOwqOmrgPiR4X3
 5P7VcB5k9mDpdICWiiDFuC5zPWrB6/u8xAf8+sncmS8kb7Bla+CKu8u5p4fm/+T+x7+m
 dVz1nz6q8dgK0oHfSgFXiMdXIxuSj2U0NLURb/c2Xdq8uxAGwp277ar3dM0xycpTJOf/
 3tpo4502HhrG7LSDWMES8UIi0wMv9BZgOCaIN64EAIxm68OLr/LWLrGVsUeoP4n+T6rZ
 L/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=iQ9amRmmVnRxpXcE5umaGoOgZh5PL9H2v0qg5K1KUpw=;
 b=0B30ITd+xq3k8lVxQqetrL74f00OXmKqANZcsFgBLwba3Vy+mCt1G5Lg/LuPz4h5Jb
 HhSKkGGb2nhJrCz7oV2f0X9O6ttVlgGOzTLeqXoO9azehda7Kybg9hPGcN3JOYFi70y+
 6AYag2x6EOc+uce/qnm+npI3kS7uPhKgbv7ZH+wo9NCVGiIaSh7D90RkSxGfZmxIp6sc
 9lSQjPQ1D8BaI2dfRvLFoLrkyoUGQlQzgf1lM+lvt6gK+GmYGpSM3z/SdO6dzGDTr82K
 5/juH+ZecnFkL4yn32xfR6k5zr0udf9JhdC7YbrCBlrT3IvzDO6VaI7jnd4jqnJ4UHtN
 /xHQ==
X-Gm-Message-State: ACgBeo2NrLxXeHc9gcMHWyfKygwpABxVlqBsRI+i+4dXt2IhdBn9pWI8
 GknfUz9Un/dGXVZqH+5GHSm3oosKa0W4IeEPZ6mtZusYehtLe9nt
X-Google-Smtp-Source: AA6agR6oPYe4JrZ5gu/uerMql5gyw17AaKYCYrvVsF0ZW3UpTBIJiNqJdevV3y7ZXiQ0z0Vsm5Xr0IU+z9DCnUfOgxg=
X-Received: by 2002:a9d:809:0:b0:637:80b:3a3e with SMTP id
 9-20020a9d0809000000b00637080b3a3emr3135706oty.328.1662635112371; 
 Thu, 08 Sep 2022 04:05:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220815095423.11131-1-dmitry.osipenko@collabora.com>
 <8230a356-be38-f228-4a8e-95124e8e8db6@amd.com>
 <YxenK8xZHC6Q4Eu4@phenom.ffwll.local>
In-Reply-To: <YxenK8xZHC6Q4Eu4@phenom.ffwll.local>
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 8 Sep 2022 04:04:56 -0700
Message-ID: <CAF6AEGupz-2Kg9NtDB-agHXaWHT+RV3YAvDnxN0-5N+BLakbgg@mail.gmail.com>
Subject: Re: [PATCH v1] drm/ttm: Refcount allocated tail pages
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 David Airlie <airlied@linux.ie>, 
 Huang Rui <ray.huang@amd.com>, Trigger Huang <Trigger.Huang@gmail.com>, 
 Gert Wollny <gert.wollny@collabora.com>, 
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 kvm@vger.kernel.org, 
 kernel@collabora.com, virtualization@lists.linux-foundation.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 6, 2022 at 1:01 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Aug 15, 2022 at 12:05:19PM +0200, Christian K=C3=B6nig wrote:
> > Am 15.08.22 um 11:54 schrieb Dmitry Osipenko:
> > > Higher order pages allocated using alloc_pages() aren't refcounted an=
d they
> > > need to be refcounted, otherwise it's impossible to map them by KVM. =
This
> > > patch sets the refcount of the tail pages and fixes the KVM memory ma=
pping
> > > faults.
> > >
> > > Without this change guest virgl driver can't map host buffers into gu=
est
> > > and can't provide OpenGL 4.5 profile support to the guest. The host
> > > mappings are also needed for enabling the Venus driver using host GPU
> > > drivers that are utilizing TTM.
> > >
> > > Based on a patch proposed by Trigger Huang.
> >
> > Well I can't count how often I have repeated this: This is an absolutel=
y
> > clear NAK!
> >
> > TTM pages are not reference counted in the first place and because of t=
his
> > giving them to virgl is illegal.
> >
> > Please immediately stop this completely broken approach. We have discus=
sed
> > this multiple times now.
>
> Yeah we need to get this stuff closed for real by tagging them all with
> VM_IO or VM_PFNMAP asap.
>
> It seems ot be a recurring amount of fun that people try to mmap dma-buf
> and then call get_user_pages on them.
>
> Which just doesn't work. I guess this is also why Rob Clark send out that
> dma-buf patch to expos mapping information (i.e. wc vs wb vs uncached).

No, not really.. my patch was simply so that the VMM side of virtgpu
could send the correct cache mode to the guest when handed a dma-buf
;-)

BR,
-R

>
> There seems to be some serious bonghits going on :-/
> -Daniel
>
> >
> > Regards,
> > Christian.
> >
> > >
> > > Cc: stable@vger.kernel.org
> > > Cc: Trigger Huang <Trigger.Huang@gmail.com>
> > > Link: https://www.collabora.com/news-and-blog/blog/2021/11/26/venus-o=
n-qemu-enabling-new-virtual-vulkan-driver/#qcom1343
> > > Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com> # AMDGPU (=
Qemu and crosvm)
> > > Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> > > ---
> > >   drivers/gpu/drm/ttm/ttm_pool.c | 25 ++++++++++++++++++++++++-
> > >   1 file changed, 24 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm=
_pool.c
> > > index 21b61631f73a..11e92bb149c9 100644
> > > --- a/drivers/gpu/drm/ttm/ttm_pool.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> > > @@ -81,6 +81,7 @@ static struct page *ttm_pool_alloc_page(struct ttm_=
pool *pool, gfp_t gfp_flags,
> > >     unsigned long attr =3D DMA_ATTR_FORCE_CONTIGUOUS;
> > >     struct ttm_pool_dma *dma;
> > >     struct page *p;
> > > +   unsigned int i;
> > >     void *vaddr;
> > >     /* Don't set the __GFP_COMP flag for higher order allocations.
> > > @@ -93,8 +94,10 @@ static struct page *ttm_pool_alloc_page(struct ttm=
_pool *pool, gfp_t gfp_flags,
> > >     if (!pool->use_dma_alloc) {
> > >             p =3D alloc_pages(gfp_flags, order);
> > > -           if (p)
> > > +           if (p) {
> > >                     p->private =3D order;
> > > +                   goto ref_tail_pages;
> > > +           }
> > >             return p;
> > >     }
> > > @@ -120,6 +123,23 @@ static struct page *ttm_pool_alloc_page(struct t=
tm_pool *pool, gfp_t gfp_flags,
> > >     dma->vaddr =3D (unsigned long)vaddr | order;
> > >     p->private =3D (unsigned long)dma;
> > > +
> > > +ref_tail_pages:
> > > +   /*
> > > +    * KVM requires mapped tail pages to be refcounted because put_pa=
ge()
> > > +    * is invoked on them in the end of the page fault handling, and =
thus,
> > > +    * tail pages need to be protected from the premature releasing.
> > > +    * In fact, KVM page fault handler refuses to map tail pages to g=
uest
> > > +    * if they aren't refcounted because hva_to_pfn_remapped() checks=
 the
> > > +    * refcount specifically for this case.
> > > +    *
> > > +    * In particular, unreferenced tail pages result in a KVM "Bad ad=
dress"
> > > +    * failure for VMMs that use VirtIO-GPU when guest's Mesa VirGL d=
river
> > > +    * accesses mapped host TTM buffer that contains tail pages.
> > > +    */
> > > +   for (i =3D 1; i < 1 << order; i++)
> > > +           page_ref_inc(p + i);
> > > +
> > >     return p;
> > >   error_free:
> > > @@ -133,6 +153,7 @@ static void ttm_pool_free_page(struct ttm_pool *p=
ool, enum ttm_caching caching,
> > >   {
> > >     unsigned long attr =3D DMA_ATTR_FORCE_CONTIGUOUS;
> > >     struct ttm_pool_dma *dma;
> > > +   unsigned int i;
> > >     void *vaddr;
> > >   #ifdef CONFIG_X86
> > > @@ -142,6 +163,8 @@ static void ttm_pool_free_page(struct ttm_pool *p=
ool, enum ttm_caching caching,
> > >     if (caching !=3D ttm_cached && !PageHighMem(p))
> > >             set_pages_wb(p, 1 << order);
> > >   #endif
> > > +   for (i =3D 1; i < 1 << order; i++)
> > > +           page_ref_dec(p + i);
> > >     if (!pool || !pool->use_dma_alloc) {
> > >             __free_pages(p, order);
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
