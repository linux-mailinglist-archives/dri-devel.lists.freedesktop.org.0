Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB55BCFFC5
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 08:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248BC10E155;
	Sun, 12 Oct 2025 06:18:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="ZNnpHteU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 425 seconds by postgrey-1.36 at gabe;
 Sun, 12 Oct 2025 06:18:34 UTC
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com
 [91.218.175.186])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B07110E010
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 06:18:34 +0000 (UTC)
X-Forwarded-Encrypted: i=1;
 AJvYcCWComEDiSAE5jslyxEuCOIF9Z8Cqmz4maWthqSxPgmsWkktnRq2fjsuRqETF3dn+SMnMNQnkU2RzcY=@lists.freedesktop.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1760249487;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=foNWJ4E25V51roHi1w2GGGZKjeKD6i3dCTeTVLACyRo=;
 b=ZNnpHteUlv/VrB6uP9om/VDbT86LZhk7Y8/p7CXLaM/pUYAtGjC9Id6FZ5BeMjm+EgeJmP
 SBCIjGUGbLm6H/dEAMlYh+rl5SPnyc1kACLl7KpAalxcrDXuKdPOHO16PaRQcK9ZrtiZ8G
 hLyoQ5PBliwfBrSSKAhDyq9GNrDH6n4=
X-Gm-Message-State: AOJu0Yxh+5bHa/cEDSOkNQZxmbbNYttnQyntpnn6jxUpE9+JAUaGn6mW
 W+ny6BDyC8UuJhuASn3icwXVdcHtvu+mbg3lDNI705CWYZrLthGHErNNOH61zyJISlH/bVDMGju
 2zJJW48d5FuAgtZUSXM7cDbQtgCGTFk8=
X-Google-Smtp-Source: AGHT+IGS0m07WNkCv+xO8uTbgSUz2CohzI7fDRMEZdBsffTcs/wloxbDLAkjPyEDGkuh6+Hjmc9gNd3T1rXw4qkFyCk=
X-Received: by 2002:ad4:5ca4:0:b0:77c:a783:c9c6 with SMTP id
 6a1803df08f44-87b21015103mr220167516d6.3.1760249475096; Sat, 11 Oct 2025
 23:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20251001065707.920170-1-balbirs@nvidia.com>
 <20251001065707.920170-2-balbirs@nvidia.com>
In-Reply-To: <20251001065707.920170-2-balbirs@nvidia.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Lance Yang <lance.yang@linux.dev>
Date: Sun, 12 Oct 2025 14:10:37 +0800
X-Gmail-Original-Message-ID: <CABzRoyYJXVdgTdoz9uYxeYHeejU1bbe6_rQnvbKns7fjvz_kqQ@mail.gmail.com>
X-Gm-Features: AS18NWC8_Z-3ZIKnbl1wff6T8kbSmzYyB0uKsUmMixJLXumxkUIzTUIiVVMKwFw
Message-ID: <CABzRoyYJXVdgTdoz9uYxeYHeejU1bbe6_rQnvbKns7fjvz_kqQ@mail.gmail.com>
Subject: Re: [v7 01/16] mm/zone_device: support large zone device private
 folios
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mm@kvack.org, akpm@linux-foundation.org, 
 David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, 
 Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>,
 Gregory Price <gourry@gourry.net>, 
 Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Oscar Salvador <osalvador@suse.de>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, 
 Barry Song <baohua@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Ralph Campbell <rcampbell@nvidia.com>,
 =?UTF-8?Q?Mika_Penttil=C3=A4?= <mpenttil@redhat.com>, 
 Matthew Brost <matthew.brost@intel.com>,
 Francois Dugast <francois.dugast@intel.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT
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

Hi Balbir,

Just one nit below :)

On Wed, Oct 1, 2025 at 3:43=E2=80=AFPM Balbir Singh <balbirs@nvidia.com> wr=
ote:
>
> Add routines to support allocation of large order zone device folios
> and helper functions for zone device folios, to check if a folio is
> device private and helpers for setting zone device data.
>
> When large folios are used, the existing page_free() callback in
> pgmap is called when the folio is freed, this is true for both
> PAGE_SIZE and higher order pages.
>
> Zone device private large folios do not support deferred split and
> scan like normal THP folios.
>
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Zi Yan <ziy@nvidia.com>
> Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
> Cc: Rakie Kim <rakie.kim@sk.com>
> Cc: Byungchul Park <byungchul@sk.com>
> Cc: Gregory Price <gourry@gourry.net>
> Cc: Ying Huang <ying.huang@linux.alibaba.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> Cc: Nico Pache <npache@redhat.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Dev Jain <dev.jain@arm.com>
> Cc: Barry Song <baohua@kernel.org>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Mika Penttil=C3=A4 <mpenttil@redhat.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Francois Dugast <francois.dugast@intel.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
>  arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
>  drivers/gpu/drm/drm_pagemap.c            |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
>  include/linux/memremap.h                 | 10 ++++++++-
>  lib/test_hmm.c                           |  2 +-
>  mm/memremap.c                            | 26 ++++++++++++++----------
>  mm/rmap.c                                |  6 +++++-
>  8 files changed, 34 insertions(+), 18 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s=
_hv_uvmem.c
> index 03f8c34fa0a2..91f763410673 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -723,7 +723,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned lo=
ng gpa, struct kvm *kvm)
>
>         dpage =3D pfn_to_page(uvmem_pfn);
>         dpage->zone_device_data =3D pvt;
> -       zone_device_page_init(dpage);
> +       zone_device_page_init(dpage, 0);
>         return dpage;
>  out_clear:
>         spin_lock(&kvmppc_uvmem_bitmap_lock);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/a=
md/amdkfd/kfd_migrate.c
> index 79251f22b702..d0e2cae33035 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -217,7 +217,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, u=
nsigned long pfn)
>         page =3D pfn_to_page(pfn);
>         svm_range_bo_ref(prange->svm_bo);
>         page->zone_device_data =3D prange->svm_bo;
> -       zone_device_page_init(page);
> +       zone_device_page_init(page, 0);
>  }
>
>  static void
> diff --git a/drivers/gpu/drm/drm_pagemap.c b/drivers/gpu/drm/drm_pagemap.=
c
> index 1da55322af12..31c53f724e25 100644
> --- a/drivers/gpu/drm/drm_pagemap.c
> +++ b/drivers/gpu/drm/drm_pagemap.c
> @@ -196,7 +196,7 @@ static void drm_pagemap_get_devmem_page(struct page *=
page,
>                                         struct drm_pagemap_zdd *zdd)
>  {
>         page->zone_device_data =3D drm_pagemap_zdd_get(zdd);
> -       zone_device_page_init(page);
> +       zone_device_page_init(page, 0);
>  }
>
>  /**
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nou=
veau/nouveau_dmem.c
> index ca4932a150e3..53cc1926b9da 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -318,7 +318,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *dr=
m)
>                         return NULL;
>         }
>
> -       zone_device_page_init(page);
> +       zone_device_page_init(page, 0);
>         return page;
>  }
>
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index e5951ba12a28..d2487a19cba2 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -206,7 +206,7 @@ static inline bool is_fsdax_page(const struct page *p=
age)
>  }
>
>  #ifdef CONFIG_ZONE_DEVICE
> -void zone_device_page_init(struct page *page);
> +void zone_device_page_init(struct page *page, unsigned int order);
>  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>  void memunmap_pages(struct dev_pagemap *pgmap);
>  void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap)=
;
> @@ -215,6 +215,14 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pf=
n);
>  bool pgmap_pfn_valid(struct dev_pagemap *pgmap, unsigned long pfn);
>
>  unsigned long memremap_compat_align(void);
> +
> +static inline void zone_device_folio_init(struct folio *folio, unsigned =
int order)
> +{
> +       zone_device_page_init(&folio->page, order);
> +       if (order)
> +               folio_set_large_rmappable(folio);
> +}
> +
>  #else
>  static inline void *devm_memremap_pages(struct device *dev,
>                 struct dev_pagemap *pgmap)
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 83e3d8208a54..24d82121cde8 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -627,7 +627,7 @@ static struct page *dmirror_devmem_alloc_page(struct =
dmirror_device *mdevice)
>                         goto error;
>         }
>
> -       zone_device_page_init(dpage);
> +       zone_device_page_init(dpage, 0);
>         dpage->zone_device_data =3D rpage;
>         return dpage;
>
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 46cb1b0b6f72..e45dfb568710 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -416,20 +416,19 @@ EXPORT_SYMBOL_GPL(get_dev_pagemap);
>  void free_zone_device_folio(struct folio *folio)
>  {
>         struct dev_pagemap *pgmap =3D folio->pgmap;
> +       unsigned long nr =3D folio_nr_pages(folio);
> +       int i;
>
>         if (WARN_ON_ONCE(!pgmap))
>                 return;
>
>         mem_cgroup_uncharge(folio);
>
> -       /*
> -        * Note: we don't expect anonymous compound pages yet. Once suppo=
rted
> -        * and we could PTE-map them similar to THP, we'd have to clear
> -        * PG_anon_exclusive on all tail pages.
> -        */
>         if (folio_test_anon(folio)) {
> -               VM_BUG_ON_FOLIO(folio_test_large(folio), folio);
> -               __ClearPageAnonExclusive(folio_page(folio, 0));
> +               for (i =3D 0; i < nr; i++)
> +                       __ClearPageAnonExclusive(folio_page(folio, i));
> +       } else {
> +               VM_WARN_ON_ONCE(folio_test_large(folio));
>         }
>
>         /*
> @@ -456,8 +455,8 @@ void free_zone_device_folio(struct folio *folio)
>         case MEMORY_DEVICE_COHERENT:
>                 if (WARN_ON_ONCE(!pgmap->ops || !pgmap->ops->page_free))
>                         break;
> -               pgmap->ops->page_free(folio_page(folio, 0));
> -               put_dev_pagemap(pgmap);
> +               pgmap->ops->page_free(&folio->page);
> +               percpu_ref_put_many(&folio->pgmap->ref, nr);

Nit: &pgmap->ref here for consistency?

Cheers,
Lance
