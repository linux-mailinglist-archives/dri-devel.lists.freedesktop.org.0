Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B983F4FF0
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 19:53:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 559BE89B01;
	Mon, 23 Aug 2021 17:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B208F89B01;
 Mon, 23 Aug 2021 17:53:49 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 x10-20020a056830408a00b004f26cead745so38533285ott.10; 
 Mon, 23 Aug 2021 10:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZQomryc6rUW/QpCZz/zN784OOX3FK9mSd+n7gkdCcUg=;
 b=GYZKfIhnP/AUtsvBuwr4kKzf4C0u22P7lBumXF8aw3bfjh5Z8ibPee+tK0DTd/i+tH
 Xzfn5AlKUEl9UKolkHjDra8eUNQDqsVRmV7pU0JCEBYkRMuHt680TczIex1v+gNYWaAW
 8FqMh/nNhzVl3y5pb9I4rV0VuRwRUUi7whivD9A4IjFQmuSWyUMByO0fJU8cBnbIkVL1
 Fmesa9dGHwq8j7lIpcehH/9s7AqtoIhpRCJvuGjM1Nduw5KIm/jg4cqjFGQGKPaTliE6
 BmBVlT5zW7csd0eoAP7y3PY0pIO1Lf616U3OyGHekNFENFLvxQj2u/yjVBc8Es3p/Hm5
 5rHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZQomryc6rUW/QpCZz/zN784OOX3FK9mSd+n7gkdCcUg=;
 b=AuHdT0RIqGLtSh91NRfx+UUeqSmlVZ8PZ46mOWwLmrJVw+I0bhB5g2NjxcUZ5ifLd7
 sq0oFfSpHGh1tum2/ku0x3fyC6IoKQvOY0UmI5V9Tjk0m+G/dMTRUOBz5WMkQMk1WLoE
 uQ01AS7nztPPk87thKex1mWzbR6AKZM6FMNDZiuwebBuKP3V3eMwLyr92Wwffidl5c6w
 nfVjH87grfYhsjYK6bqfbdY6Bne/gAVNBa0pgnOBFPVV3/Nrvp4rluoabRnTU1bzLIWv
 JevciVcld/faTT92fcVRTRU+KfHd/GrM3yIJjK9XJ7ik/Ww6fuSmY0OIUF+nD9siSmn4
 4LeQ==
X-Gm-Message-State: AOAM532wDDCrGTT81IHIRrFkP3NKxOVou8mgLnKXaxeNyUeTg7YicacZ
 3ergIg2dCT3vKWUcurq3HiS+dScfUd2ja4kiTqQ=
X-Google-Smtp-Source: ABdhPJwujOOZljA91OYN5H6dukXF63lJ2O87nAd49AlEjNXKsEKPf59CWweVy6tO5kbpZma/LC108skbsGrZelu1rDI=
X-Received: by 2002:a9d:4c15:: with SMTP id l21mr15572911otf.311.1629741229119; 
 Mon, 23 Aug 2021 10:53:49 -0700 (PDT)
MIME-Version: 1.0
References: <1187ca1dbaa74ca4a87db9496061243e9a810faa.1629667363.git.christophe.jaillet@wanadoo.fr>
 <cd7b5eb2-24c1-d54d-d6dd-c529d3eb140f@amd.com>
In-Reply-To: <cd7b5eb2-24c1-d54d-d6dd-c529d3eb140f@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 23 Aug 2021 13:53:38 -0400
Message-ID: <CADnq5_NU=DKqiHURbB70No94wi-qz7YbwA11_18DbCXPfxWzLQ@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: switch from 'pci_' to 'dma_' API
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 xinhui pan <Xinhui.Pan@amd.com>, 
 Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org
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

Applied.  Thanks!

Alex

On Mon, Aug 23, 2021 at 2:17 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 22.08.21 um 23:23 schrieb Christophe JAILLET:
> > The wrappers in include/linux/pci-dma-compat.h should go away.
> >
> > The patch has been generated with the coccinelle script below.
> >
> > It has been compile tested.
> >
> > @@
> > @@
> > -    PCI_DMA_BIDIRECTIONAL
> > +    DMA_BIDIRECTIONAL
> >
> > @@
> > @@
> > -    PCI_DMA_TODEVICE
> > +    DMA_TO_DEVICE
> >
> > @@
> > @@
> > -    PCI_DMA_FROMDEVICE
> > +    DMA_FROM_DEVICE
> >
> > @@
> > @@
> > -    PCI_DMA_NONE
> > +    DMA_NONE
> >
> > @@
> > expression e1, e2, e3;
> > @@
> > -    pci_alloc_consistent(e1, e2, e3)
> > +    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)
> >
> > @@
> > expression e1, e2, e3;
> > @@
> > -    pci_zalloc_consistent(e1, e2, e3)
> > +    dma_alloc_coherent(&e1->dev, e2, e3, GFP_)
> >
> > @@
> > expression e1, e2, e3, e4;
> > @@
> > -    pci_free_consistent(e1, e2, e3, e4)
> > +    dma_free_coherent(&e1->dev, e2, e3, e4)
> >
> > @@
> > expression e1, e2, e3, e4;
> > @@
> > -    pci_map_single(e1, e2, e3, e4)
> > +    dma_map_single(&e1->dev, e2, e3, e4)
> >
> > @@
> > expression e1, e2, e3, e4;
> > @@
> > -    pci_unmap_single(e1, e2, e3, e4)
> > +    dma_unmap_single(&e1->dev, e2, e3, e4)
> >
> > @@
> > expression e1, e2, e3, e4, e5;
> > @@
> > -    pci_map_page(e1, e2, e3, e4, e5)
> > +    dma_map_page(&e1->dev, e2, e3, e4, e5)
> >
> > @@
> > expression e1, e2, e3, e4;
> > @@
> > -    pci_unmap_page(e1, e2, e3, e4)
> > +    dma_unmap_page(&e1->dev, e2, e3, e4)
> >
> > @@
> > expression e1, e2, e3, e4;
> > @@
> > -    pci_map_sg(e1, e2, e3, e4)
> > +    dma_map_sg(&e1->dev, e2, e3, e4)
> >
> > @@
> > expression e1, e2, e3, e4;
> > @@
> > -    pci_unmap_sg(e1, e2, e3, e4)
> > +    dma_unmap_sg(&e1->dev, e2, e3, e4)
> >
> > @@
> > expression e1, e2, e3, e4;
> > @@
> > -    pci_dma_sync_single_for_cpu(e1, e2, e3, e4)
> > +    dma_sync_single_for_cpu(&e1->dev, e2, e3, e4)
> >
> > @@
> > expression e1, e2, e3, e4;
> > @@
> > -    pci_dma_sync_single_for_device(e1, e2, e3, e4)
> > +    dma_sync_single_for_device(&e1->dev, e2, e3, e4)
> >
> > @@
> > expression e1, e2, e3, e4;
> > @@
> > -    pci_dma_sync_sg_for_cpu(e1, e2, e3, e4)
> > +    dma_sync_sg_for_cpu(&e1->dev, e2, e3, e4)
> >
> > @@
> > expression e1, e2, e3, e4;
> > @@
> > -    pci_dma_sync_sg_for_device(e1, e2, e3, e4)
> > +    dma_sync_sg_for_device(&e1->dev, e2, e3, e4)
> >
> > @@
> > expression e1, e2;
> > @@
> > -    pci_dma_mapping_error(e1, e2)
> > +    dma_mapping_error(&e1->dev, e2)
> >
> > @@
> > expression e1, e2;
> > @@
> > -    pci_set_dma_mask(e1, e2)
> > +    dma_set_mask(&e1->dev, e2)
> >
> > @@
> > expression e1, e2;
> > @@
> > -    pci_set_consistent_dma_mask(e1, e2)
> > +    dma_set_coherent_mask(&e1->dev, e2)
> >
> > Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>
>
> Should we pick them up or do you want to push them upstream?
>
> Regards,
> Christian.
>
> > ---
> > If needed, see post from Christoph Hellwig on the kernel-janitors ML:
> >     https://marc.info/?l=3Dkernel-janitors&m=3D158745678307186&w=3D4
> > ---
> >   drivers/gpu/drm/radeon/radeon_device.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon_device.c b/drivers/gpu/drm/r=
adeon/radeon_device.c
> > index ac8c3251b616..4f0fbf667431 100644
> > --- a/drivers/gpu/drm/radeon/radeon_device.c
> > +++ b/drivers/gpu/drm/radeon/radeon_device.c
> > @@ -785,7 +785,7 @@ int radeon_dummy_page_init(struct radeon_device *rd=
ev)
> >       if (rdev->dummy_page.page =3D=3D NULL)
> >               return -ENOMEM;
> >       rdev->dummy_page.addr =3D dma_map_page(&rdev->pdev->dev, rdev->du=
mmy_page.page,
> > -                                     0, PAGE_SIZE, PCI_DMA_BIDIRECTION=
AL);
> > +                                     0, PAGE_SIZE, DMA_BIDIRECTIONAL);
> >       if (dma_mapping_error(&rdev->pdev->dev, rdev->dummy_page.addr)) {
> >               dev_err(&rdev->pdev->dev, "Failed to DMA MAP the dummy pa=
ge\n");
> >               __free_page(rdev->dummy_page.page);
> > @@ -808,8 +808,8 @@ void radeon_dummy_page_fini(struct radeon_device *r=
dev)
> >   {
> >       if (rdev->dummy_page.page =3D=3D NULL)
> >               return;
> > -     pci_unmap_page(rdev->pdev, rdev->dummy_page.addr,
> > -                     PAGE_SIZE, PCI_DMA_BIDIRECTIONAL);
> > +     dma_unmap_page(&rdev->pdev->dev, rdev->dummy_page.addr, PAGE_SIZE=
,
> > +                    DMA_BIDIRECTIONAL);
> >       __free_page(rdev->dummy_page.page);
> >       rdev->dummy_page.page =3D NULL;
> >   }
>
