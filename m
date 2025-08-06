Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F54B1CE1D
	for <lists+dri-devel@lfdr.de>; Wed,  6 Aug 2025 22:58:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DECA10E0F0;
	Wed,  6 Aug 2025 20:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="WJcl6oxd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33FAB10E0F0
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Aug 2025 20:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1754513913;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fFNdR9gJvxUJ76WkzFWy6OZiky5m3qPp0Fyvysc9k2k=;
 b=WJcl6oxdFO7hgJk7/qyla5ZLW3OIOxrAcMnH2F+cVsI1tdbf5+cr2OJiT/BorYOeBv3mLY
 RQuBEffI5slfNowfmrOKnDW7Fz51+dbUEWWspofzxNh6lrlN+QavwYyKTq6iNHVEhgP9DS
 R4BPqStwYdyjWw//aZW2oN+rQSbPqtQ=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-PtVxFizgNiS0WHPJ7kzylw-1; Wed, 06 Aug 2025 16:58:30 -0400
X-MC-Unique: PtVxFizgNiS0WHPJ7kzylw-1
X-Mimecast-MFC-AGG-ID: PtVxFizgNiS0WHPJ7kzylw_1754513909
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-3e3fff9eb72so831075ab.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Aug 2025 13:58:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754513909; x=1755118709;
 h=content-transfer-encoding:mime-version:organization:references
 :in-reply-to:message-id:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XL3JtSDnypcZCdbt3A90Mr99TpavO/k4/VrpLyiBez8=;
 b=ppVLMIRuSErnp2IggnbABMzlosquHu24MBL7yGnolwhYbyxa7dpqlK272ttnN25kL5
 uj4mMmZrY8dGb5JMPb9gbSYtmao6OM45ceHUbWbBbjRJoEfQg6zOiq4KBsHu23j+ath9
 KrHAx7KJjcx3tzF3ku1sVp9vSrQeN23V+t7T2zhz8CSLnZqRqK/5Kdq19pl93Ncgmobt
 +KLbG/fwOPhUMDf8Tmvl2YsqLs0S/2uZ6TL8chvR2IcfFIsG9/KRYL2Cj/KIZQLnma+H
 eUCxVg4Ei9u8mduIEfYorUkr5z9IkivW2cNA7WrpkG7t51+mzJ0Yx48Z94cWFHC1sYl1
 qoSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJDIkBs5Ba6Oko7nvZVmt02EkqI6wQcOEL1VbqGZn+AIgTmokzh3t7/yoTn3HX3YWqKJlmgO27oOA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzjkxJEG0+FMOuG71yAz6SgzL97F5O4Q8SeUl2ZBNeRlx7FoIxR
 O/B3UwhGD2P+BI1EmWPfgmVp+aBU55rQqyUrlqkuzCrXChnPsT5CsDgSaWAnGh/st1EqHS7Xdaa
 Eh2YcrZJmf9YPJEOlO/RJL/b3HbvaVOxgCe2NZkBhoJkRO4KoGxlUp8OSPRl92IpO4h7g3Q==
X-Gm-Gg: ASbGncu4g2R08ZUljiPXeijjeeqwlQ2A9X/MMR/YcxWZ1P88XjCw+tsWz15xYQt+hse
 bgeB/IS+Dd+vZVHqyXLL6wb9cU/HhrfrBXQrTJaXRlZWd8DXdLCMfW64NnL4NbO/eW87NZeQepQ
 oXrvGSb3TE86EaQqR0So/8/5923zOxeiCwTcnUwASWpwMNfhBCChWksUk0+GtNNFF/LVNOfHi0O
 9gmVSvUi9E/724yarbNWx4AF3Anc364swzQAavSvNBnkn6aRZl/krQVmdJM6DgjqzlQ3bzapiLI
 bMgrSbPRzPX6CUo9cAsrsBD4L0ovP8DbwuZ6GL4AaC0=
X-Received: by 2002:a05:6e02:152e:b0:3e3:d2eb:52db with SMTP id
 e9e14a558f8ab-3e51b79eae2mr20687265ab.0.1754513909049; 
 Wed, 06 Aug 2025 13:58:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEvMHObcGautLtJ7984K/wyyriLvMdPXmyUUT5V0nwJ7vFbNm7fOcxZIXtiLyBYuGHd6raZZQ==
X-Received: by 2002:a05:6e02:152e:b0:3e3:d2eb:52db with SMTP id
 e9e14a558f8ab-3e51b79eae2mr20686945ab.0.1754513908609; 
 Wed, 06 Aug 2025 13:58:28 -0700 (PDT)
Received: from redhat.com ([38.15.36.11]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-50ab01e84desm2049992173.51.2025.08.06.13.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 13:58:27 -0700 (PDT)
Date: Wed, 6 Aug 2025 14:58:25 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Christoph Hellwig <hch@lst.de>,
 dri-devel@lists.freedesktop.org, iommu@lists.linux.dev, Jens Axboe
 <axboe@kernel.dk>, Joerg Roedel <joro@8bytes.org>, kvm@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, linux-block@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mm@kvack.org, linux-pci@vger.kernel.org, Logan Gunthorpe
 <logang@deltatee.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Robin
 Murphy <robin.murphy@arm.com>, Sumit Semwal <sumit.semwal@linaro.org>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Will Deacon <will@kernel.org>
Subject: Re: [PATCH v1 01/10] PCI/P2PDMA: Remove redundant bus_offset from
 map state
Message-ID: <20250806145825.2654ee59.alex.williamson@redhat.com>
In-Reply-To: <c9b6237964b9606418af400bb6bec5178fcffff2.1754311439.git.leon@kernel.org>
References: <cover.1754311439.git.leon@kernel.org>
 <c9b6237964b9606418af400bb6bec5178fcffff2.1754311439.git.leon@kernel.org>
Organization: Red Hat
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: slM04J6Fu2q1EF6meZ0vhrf3uxAKq4DJSFzSE8DYLMY_1754513909
X-Mimecast-Originator: redhat.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon,  4 Aug 2025 16:00:36 +0300
Leon Romanovsky <leon@kernel.org> wrote:

> From: Leon Romanovsky <leonro@nvidia.com>
>=20
> Remove the bus_off field from pci_p2pdma_map_state since it duplicates
> information already available in the pgmap structure. The bus_offset
> is only used in one location (pci_p2pdma_bus_addr_map) and is always
> identical to pgmap->bus_offset.
>=20
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  drivers/pci/p2pdma.c       | 1 -
>  include/linux/pci-p2pdma.h | 3 +--
>  2 files changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/drivers/pci/p2pdma.c b/drivers/pci/p2pdma.c
> index da5657a020074..274bb7bcc0bc5 100644
> --- a/drivers/pci/p2pdma.c
> +++ b/drivers/pci/p2pdma.c
> @@ -1009,7 +1009,6 @@ void __pci_p2pdma_update_state(struct pci_p2pdma_ma=
p_state *state,
>  {
>  =09state->pgmap =3D page_pgmap(page);
>  =09state->map =3D pci_p2pdma_map_type(state->pgmap, dev);
> -=09state->bus_off =3D to_p2p_pgmap(state->pgmap)->bus_offset;
>  }
> =20
>  /**
> diff --git a/include/linux/pci-p2pdma.h b/include/linux/pci-p2pdma.h
> index 075c20b161d98..b502fc8b49bf9 100644
> --- a/include/linux/pci-p2pdma.h
> +++ b/include/linux/pci-p2pdma.h
> @@ -146,7 +146,6 @@ enum pci_p2pdma_map_type {
>  struct pci_p2pdma_map_state {
>  =09struct dev_pagemap *pgmap;
>  =09enum pci_p2pdma_map_type map;
> -=09u64 bus_off;
>  };
> =20
>  /* helper for pci_p2pdma_state(), do not use directly */
> @@ -186,7 +185,7 @@ static inline dma_addr_t
>  pci_p2pdma_bus_addr_map(struct pci_p2pdma_map_state *state, phys_addr_t =
paddr)
>  {
>  =09WARN_ON_ONCE(state->map !=3D PCI_P2PDMA_MAP_BUS_ADDR);
> -=09return paddr + state->bus_off;
> +=09return paddr + to_p2p_pgmap(state->pgmap)->bus_offsetf;
>  }
> =20
>  #endif /* _LINUX_PCI_P2P_H */

Looks like you're relying on this bogus code getting resolved in the
next patch...

In file included from kernel/dma/direct.c:16:
./include/linux/pci-p2pdma.h: In function =E2=80=98pci_p2pdma_bus_addr_map=
=E2=80=99:
./include/linux/pci-p2pdma.h:188:24: error: implicit declaration of functio=
n =E2=80=98to_p2p_pgmap=E2=80=99 [-Wimplicit-function-declaration]
  188 |         return paddr + to_p2p_pgmap(state->pgmap)->bus_offsetf;
      |                        ^~~~~~~~~~~~
./include/linux/pci-p2pdma.h:188:50: error: invalid type argument of =E2=80=
=98->=E2=80=99 (have =E2=80=98int=E2=80=99)
  188 |         return paddr + to_p2p_pgmap(state->pgmap)->bus_offsetf;
      |                                                  ^~
./include/linux/pci-p2pdma.h:189:1: error: control reaches end of non-void =
function [-Werror=3Dreturn-type]
  189 | }
      | ^

to_p2p_pgmap() is a static function and struct pci_p2pdma_pagemap
doesn't have a bus_offsetf member.  Thanks,

Alex

