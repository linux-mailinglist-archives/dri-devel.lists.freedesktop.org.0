Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8874BFBC10
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 14:01:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08CCE10E76B;
	Wed, 22 Oct 2025 12:01:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="YlQF9Kqj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 376 seconds by postgrey-1.36 at gabe;
 Wed, 22 Oct 2025 12:01:32 UTC
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com
 [95.215.58.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A936310E76B
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Oct 2025 12:01:32 +0000 (UTC)
X-Forwarded-Encrypted: i=1;
 AJvYcCVeggEZk3pvNRR+Z24pIx40oRPIh2juZW6VfvF7d1PNONLCjXN0+J8KQIrXT5Mf3PON/iWUdvGZ4jc=@lists.freedesktop.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1761134114;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3anz9Xoypecd3KnBJKu2SEe+GoHlBtB+8NICP5dLvZU=;
 b=YlQF9KqjIrsIuBFbMw1G2dbhcrDsl+hBHAWDOyMmXWyHUXFNnLsZKDQgM4KC9aNlPJCqw6
 kIFSdcusCpw5s5Tk84loqRddA2jr+aK1EBcVzaawTKz3p1xWTpG48EJSuXYuK15/kHG7Es
 KYMO8xzCsV+3DKevHozq6fryQXOJDII=
X-Gm-Message-State: AOJu0YzP5imRG3lrk8hHLh/vUhl8B1zqjo5bYn7cTemXE3czw5d6o7yb
 BiOpbjb0rHMJTCB1L9LTqDYCajYfbnkITj4+wAymFAnpEu/y6GFaj6QtaGdVksFnZf2NTydJv0r
 PP5p863mb+BAoH9bLLVQKVrL6x6GZrXM=
X-Google-Smtp-Source: AGHT+IHZJxZ1U3oPvy2l5YN+pFjSaAAubn8QK4QwG6aE2rmfYuNYY/hyqdkxjgytGV7PtICYeaJLn4Vz3+u/qBym7iE=
X-Received: by 2002:ad4:5b85:0:b0:766:be67:3e63 with SMTP id
 6a1803df08f44-87c20572737mr235341646d6.18.1761134105050; Wed, 22 Oct 2025
 04:55:05 -0700 (PDT)
MIME-Version: 1.0
References: <20251001065707.920170-1-balbirs@nvidia.com>
 <20251001065707.920170-5-balbirs@nvidia.com>
In-Reply-To: <20251001065707.920170-5-balbirs@nvidia.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Lance Yang <lance.yang@linux.dev>
Date: Wed, 22 Oct 2025 19:54:28 +0800
X-Gmail-Original-Message-ID: <CABzRoyZZ8QLF5PSeDCVxgcnQmF9kFQ3RZdNq0Deik3o9OrK+BQ@mail.gmail.com>
X-Gm-Features: AS18NWCWKcU0vSe5CKpt6Lz9fM0G_zvx7umDf5kOeC6brpsJ4Dt06pu0gaElRJ0
Message-ID: <CABzRoyZZ8QLF5PSeDCVxgcnQmF9kFQ3RZdNq0Deik3o9OrK+BQ@mail.gmail.com>
Subject: Re: [v7 04/16] mm/rmap: extend rmap and migration support
 device-private entries
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
 Francois Dugast <francois.dugast@intel.com>, SeongJae Park <sj@kernel.org>
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

On Wed, Oct 1, 2025 at 3:25=E2=80=AFPM Balbir Singh <balbirs@nvidia.com> wr=
ote:
>
> Add device-private THP support to reverse mapping infrastructure, enablin=
g
> proper handling during migration and walk operations.
>
> The key changes are:
> - add_migration_pmd()/remove_migration_pmd(): Handle device-private
>   entries during folio migration and splitting
> - page_vma_mapped_walk(): Recognize device-private THP entries during
>   VMA traversal operations
>
> This change supports folio splitting and migration operations on
> device-private entries.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
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
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> Reviewed-by: SeongJae Park <sj@kernel.org>
> ---
>  mm/damon/ops-common.c | 20 +++++++++++++++++---
>  mm/huge_memory.c      | 16 +++++++++++++++-
>  mm/page_idle.c        |  7 +++++--
>  mm/page_vma_mapped.c  |  7 +++++++
>  mm/rmap.c             | 24 ++++++++++++++++++++----
>  5 files changed, 64 insertions(+), 10 deletions(-)
>
> diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
> index 998c5180a603..ac54bf5b2623 100644
> --- a/mm/damon/ops-common.c
> +++ b/mm/damon/ops-common.c
> @@ -75,12 +75,24 @@ void damon_ptep_mkold(pte_t *pte, struct vm_area_stru=
ct *vma, unsigned long addr
>  void damon_pmdp_mkold(pmd_t *pmd, struct vm_area_struct *vma, unsigned l=
ong addr)
>  {
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -       struct folio *folio =3D damon_get_folio(pmd_pfn(pmdp_get(pmd)));
> +       pmd_t pmdval =3D pmdp_get(pmd);
> +       struct folio *folio;
> +       bool young =3D false;
> +       unsigned long pfn;
> +
> +       if (likely(pmd_present(pmdval)))
> +               pfn =3D pmd_pfn(pmdval);
> +       else
> +               pfn =3D swp_offset_pfn(pmd_to_swp_entry(pmdval));
>
> +       folio =3D damon_get_folio(pfn);
>         if (!folio)
>                 return;
>
> -       if (pmdp_clear_young_notify(vma, addr, pmd))
> +       if (likely(pmd_present(pmdval)))
> +               young |=3D pmdp_clear_young_notify(vma, addr, pmd);
> +       young |=3D mmu_notifier_clear_young(vma->vm_mm, addr, addr + HPAG=
E_PMD_SIZE);
> +       if (young)
>                 folio_set_young(folio);
>
>         folio_set_idle(folio);
> @@ -203,7 +215,9 @@ static bool damon_folio_young_one(struct folio *folio=
,
>                                 mmu_notifier_test_young(vma->vm_mm, addr)=
;
>                 } else {
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> -                       *accessed =3D pmd_young(pmdp_get(pvmw.pmd)) ||
> +                       pmd_t pmd =3D pmdp_get(pvmw.pmd);
> +
> +                       *accessed =3D (pmd_present(pmd) && pmd_young(pmd)=
) ||
>                                 !folio_test_idle(folio) ||
>                                 mmu_notifier_test_young(vma->vm_mm, addr)=
;
>  #else
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 8e0a1747762d..483b8341ce22 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -4628,7 +4628,10 @@ int set_pmd_migration_entry(struct page_vma_mapped=
_walk *pvmw,
>                 return 0;
>
>         flush_cache_range(vma, address, address + HPAGE_PMD_SIZE);
> -       pmdval =3D pmdp_invalidate(vma, address, pvmw->pmd);
> +       if (unlikely(!pmd_present(*pvmw->pmd)))
> +               pmdval =3D pmdp_huge_get_and_clear(vma->vm_mm, address, p=
vmw->pmd);
> +       else
> +               pmdval =3D pmdp_invalidate(vma, address, pvmw->pmd);
>
>         /* See folio_try_share_anon_rmap_pmd(): invalidate PMD first. */
>         anon_exclusive =3D folio_test_anon(folio) && PageAnonExclusive(pa=
ge);
> @@ -4678,6 +4681,17 @@ void remove_migration_pmd(struct page_vma_mapped_w=
alk *pvmw, struct page *new)
>         entry =3D pmd_to_swp_entry(*pvmw->pmd);
>         folio_get(folio);
>         pmde =3D folio_mk_pmd(folio, READ_ONCE(vma->vm_page_prot));
> +
> +       if (folio_is_device_private(folio)) {
> +               if (pmd_write(pmde))
> +                       entry =3D make_writable_device_private_entry(
> +                                                       page_to_pfn(new))=
;
> +               else
> +                       entry =3D make_readable_device_private_entry(
> +                                                       page_to_pfn(new))=
;
> +               pmde =3D swp_entry_to_pmd(entry);
> +       }
> +
>         if (pmd_swp_soft_dirty(*pvmw->pmd))
>                 pmde =3D pmd_mksoft_dirty(pmde);
>         if (is_writable_migration_entry(entry))
> diff --git a/mm/page_idle.c b/mm/page_idle.c
> index a82b340dc204..d4299de81031 100644
> --- a/mm/page_idle.c
> +++ b/mm/page_idle.c
> @@ -71,8 +71,11 @@ static bool page_idle_clear_pte_refs_one(struct folio =
*folio,
>                                 referenced |=3D ptep_test_and_clear_young=
(vma, addr, pvmw.pte);
>                         referenced |=3D mmu_notifier_clear_young(vma->vm_=
mm, addr, addr + PAGE_SIZE);
>                 } else if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE)) {
> -                       if (pmdp_clear_young_notify(vma, addr, pvmw.pmd))
> -                               referenced =3D true;
> +                       pmd_t pmdval =3D pmdp_get(pvmw.pmd);
> +
> +                       if (likely(pmd_present(pmdval)))
> +                               referenced |=3D pmdp_clear_young_notify(v=
ma, addr, pvmw.pmd);
> +                       referenced |=3D mmu_notifier_clear_young(vma->vm_=
mm, addr, addr + PMD_SIZE);
>                 } else {
>                         /* unexpected pmd-mapped page? */
>                         WARN_ON_ONCE(1);
> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> index c498a91b6706..137ce27ff68c 100644
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -277,6 +277,13 @@ bool page_vma_mapped_walk(struct page_vma_mapped_wal=
k *pvmw)
>                          * cannot return prematurely, while zap_huge_pmd(=
) has
>                          * cleared *pmd but not decremented compound_mapc=
ount().
>                          */
> +                       swp_entry_t entry =3D pmd_to_swp_entry(pmde);
> +
> +                       if (is_device_private_entry(entry)) {
> +                               pvmw->ptl =3D pmd_lock(mm, pvmw->pmd);
> +                               return true;
> +                       }
> +

We could make this simpler:

                        if (is_device_private_entry(pmd_to_swp_entry(pmde))=
) {
                                pvmw->ptl =3D pmd_lock(mm, pvmw->pmd);
                                return true;
                        }

Thanks,
Lance

>                         if ((pvmw->flags & PVMW_SYNC) &&
>                             thp_vma_suitable_order(vma, pvmw->address,
>                                                    PMD_ORDER) &&
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 9bab13429975..c3fc30cf3636 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -1046,9 +1046,16 @@ static int page_vma_mkclean_one(struct page_vma_ma=
pped_walk *pvmw)
>                 } else {
>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>                         pmd_t *pmd =3D pvmw->pmd;
> -                       pmd_t entry;
> +                       pmd_t entry =3D pmdp_get(pmd);
>
> -                       if (!pmd_dirty(*pmd) && !pmd_write(*pmd))
> +                       /*
> +                        * Please see the comment above (!pte_present).
> +                        * A non present PMD is not writable from a CPU
> +                        * perspective.
> +                        */
> +                       if (!pmd_present(entry))
> +                               continue;
> +                       if (!pmd_dirty(entry) && !pmd_write(entry))
>                                 continue;
>
>                         flush_cache_range(vma, address,
> @@ -2343,6 +2350,9 @@ static bool try_to_migrate_one(struct folio *folio,=
 struct vm_area_struct *vma,
>         while (page_vma_mapped_walk(&pvmw)) {
>                 /* PMD-mapped THP migration entry */
>                 if (!pvmw.pte) {
> +                       __maybe_unused unsigned long pfn;
> +                       __maybe_unused pmd_t pmdval;
> +
>                         if (flags & TTU_SPLIT_HUGE_PMD) {
>                                 split_huge_pmd_locked(vma, pvmw.address,
>                                                       pvmw.pmd, true);
> @@ -2351,8 +2361,14 @@ static bool try_to_migrate_one(struct folio *folio=
, struct vm_area_struct *vma,
>                                 break;
>                         }
>  #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> -                       subpage =3D folio_page(folio,
> -                               pmd_pfn(*pvmw.pmd) - folio_pfn(folio));
> +                       pmdval =3D pmdp_get(pvmw.pmd);
> +                       if (likely(pmd_present(pmdval)))
> +                               pfn =3D pmd_pfn(pmdval);
> +                       else
> +                               pfn =3D swp_offset_pfn(pmd_to_swp_entry(p=
mdval));
> +
> +                       subpage =3D folio_page(folio, pfn - folio_pfn(fol=
io));
> +
>                         VM_BUG_ON_FOLIO(folio_test_hugetlb(folio) ||
>                                         !folio_test_pmd_mappable(folio), =
folio);
>
> --
> 2.51.0
>
>
