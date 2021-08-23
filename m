Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D3A3F4FDB
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 19:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8172289C1B;
	Mon, 23 Aug 2021 17:51:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8851A89BF1;
 Mon, 23 Aug 2021 17:51:12 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 x10-20020a056830408a00b004f26cead745so38511134ott.10; 
 Mon, 23 Aug 2021 10:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3rREAyPOKdLF6NDEzn+rP2y6ycvNQqshJTP26LTwLYA=;
 b=AUOWTbDAsF2kSoMy1ltDzWDDka9y3jbqDIiddEymQ6xYDkzCjOrs3Arh+mUPc2ULzX
 pZ1Xyx4b0a6z4NiVFlfzzt+OYk/qf+uWcy4I1I9eym7owd7esqPvyqFI5M+P/6yZTn3F
 oiIaHKx3XYPXtNJo9ZfB2mFN0V/lhzcrJhGJuRMblyskmXqnN+f3MpAUsKjLhJZCYIaR
 Oekero8asdPtUvYhgt67HWgtdK9pzdNpd4nbp6Fad+KR19d//l5Zw2zgGylV3CZ6B4Fx
 14lQ0Mao5BL3xPVWPNAIXrLsdhNVNySHY68tiW2WXSVA1+QBaEXinzXxCAQHy5mJnVl4
 nM1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3rREAyPOKdLF6NDEzn+rP2y6ycvNQqshJTP26LTwLYA=;
 b=D21qS32enAlXG+ww8VEBTvVbeAmtSiUSVTF/lniLYmKkDskGEsvUoaIjEGNsQpe+0h
 op5UEXj1zMiyFkeydQOELf2UsGO+g29ounV4w+ZOb5oZxkvnx5WiOwIgZO40xAvGZfZt
 bQz2VmPH3DqvhmwwJuRCxShU4aHwalXzT6wGEsG1md2PxPnbJ+jH2/dCTguqsMwaobl4
 bXMqc5xoBW0Ih8O8GUWKiJQn7nH2p8FWj0UQYn8QuXtYRPGrnyq5oGZfjXs6IW3++ubV
 aLFmAWhWDQiBxMpKRs9WAJYAg1G0GigGb7HYcHqZi+UUfry1hBmsOSVbJPY+f8mkyTrB
 N7GQ==
X-Gm-Message-State: AOAM532MiZ6CndfLFDaUcRri28dlPbdylemTxvpPAcZkN6ZA4gk0BR98
 xLCjnRsdIunzudz44h4i+6VXmORELm+yaAfhj9s=
X-Google-Smtp-Source: ABdhPJyCzesKPtsp+veFGNMoo192/z38L5TnShuXRKh6DQbbg8b3d22M+M90/KZ4CSNKrPdy52aVEtHwkBUmmgc7BFc=
X-Received: by 2002:a05:6808:483:: with SMTP id
 z3mr11942026oid.5.1629741071769; 
 Mon, 23 Aug 2021 10:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <d959876c2c61827a0607f5de29fdec10c47dcd86.1629667175.git.christophe.jaillet@wanadoo.fr>
 <4421bb63-3e77-0646-a647-c387a5df060c@amd.com>
In-Reply-To: <4421bb63-3e77-0646-a647-c387a5df060c@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 23 Aug 2021 13:51:00 -0400
Message-ID: <CADnq5_Mz1c68XToo4MKy-Xq70ZcLUiM95uqB9Wa_6buM6vkLgA@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: switch from 'pci_' to 'dma_' API
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, 
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 xinhui pan <Xinhui.Pan@amd.com>, 
 Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>, 
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

On Mon, Aug 23, 2021 at 2:16 AM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> Am 22.08.21 um 23:21 schrieb Christophe JAILLET:
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
> > ---
> > If needed, see post from Christoph Hellwig on the kernel-janitors ML:
> >     https://marc.info/?l=3Dkernel-janitors&m=3D158745678307186&w=3D4
> > ---
> >   drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c | 6 +++---
> >   1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c b/drivers/gpu/drm=
/amd/amdgpu/amdgpu_gart.c
> > index b36405170ff3..76efd5f8950f 100644
> > --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> > +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gart.c
> > @@ -76,7 +76,7 @@ static int amdgpu_gart_dummy_page_init(struct amdgpu_=
device *adev)
> >       if (adev->dummy_page_addr)
> >               return 0;
> >       adev->dummy_page_addr =3D dma_map_page(&adev->pdev->dev, dummy_pa=
ge, 0,
> > -                                          PAGE_SIZE, PCI_DMA_BIDIRECTI=
ONAL);
> > +                                          PAGE_SIZE, DMA_BIDIRECTIONAL=
);
> >       if (dma_mapping_error(&adev->pdev->dev, adev->dummy_page_addr)) {
> >               dev_err(&adev->pdev->dev, "Failed to DMA MAP the dummy pa=
ge\n");
> >               adev->dummy_page_addr =3D 0;
> > @@ -96,8 +96,8 @@ void amdgpu_gart_dummy_page_fini(struct amdgpu_device=
 *adev)
> >   {
> >       if (!adev->dummy_page_addr)
> >               return;
> > -     pci_unmap_page(adev->pdev, adev->dummy_page_addr,
> > -                    PAGE_SIZE, PCI_DMA_BIDIRECTIONAL);
> > +     dma_unmap_page(&adev->pdev->dev, adev->dummy_page_addr, PAGE_SIZE=
,
> > +                    DMA_BIDIRECTIONAL);
> >       adev->dummy_page_addr =3D 0;
> >   }
> >
>
