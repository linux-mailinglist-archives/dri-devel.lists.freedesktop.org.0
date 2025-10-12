Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ACFBD0664
	for <lists+dri-devel@lfdr.de>; Sun, 12 Oct 2025 17:47:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0543210E14F;
	Sun, 12 Oct 2025 15:47:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="rR0Hf5Bl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com
 [91.218.175.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6035B10E14F
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Oct 2025 15:47:23 +0000 (UTC)
X-Forwarded-Encrypted: i=1;
 AJvYcCXSHjmB4hpOryClV0lqt7Z2DCOaPDmWzZ8Agm0EVUXH1fxDLPpqDzqtuXqtcRVkkjK7rb8ARxH/xmM=@lists.freedesktop.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1760284040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Jx1siiS1fIaEuoSsnbHqhfsPiky05Z0AF/a/E5n05I=;
 b=rR0Hf5BljZOa7Ba25bgpxVRX7/v55OqzTvuvaavUyCJLeyGQ5fOag1p3cWh7hGiLesdRtN
 OrT/OD97VIdE1D3wYVf7d4t2Xzz50rDaKrHRiYdmu0THf8d6vLZZieAAlplU6zbyD9ZI1P
 9xWljbLRaAa7NULq0a9vIUALddpfWGs=
X-Gm-Message-State: AOJu0YzSzhLcioSw0AY/NCVs4aFk35jC461/abiQNQQK5ykLIGuuG8de
 6/31nbMc2p8sz18zSBZNxT9IpaJMbKIsU8jqOgCb+/rv1/gTgE1Pu3Cgq80qESjlfnQUv6DmuE0
 i1QCHwu7Xo5w4gEW6iDO9/H7F/tCmgt8=
X-Google-Smtp-Source: AGHT+IGU4is0tfGyAf+Y4eW/H1uhqTUANrqoJRsnGW1pXXpN0gbGnn4Uzr/64CQuR05MJPbhXZu3PZbIRbRVL68AkiE=
X-Received: by 2002:a05:6214:2121:b0:782:3caf:668e with SMTP id
 6a1803df08f44-87b2efa9a8fmr222378096d6.40.1760284037401; Sun, 12 Oct 2025
 08:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20251001065707.920170-1-balbirs@nvidia.com>
 <20251001065707.920170-4-balbirs@nvidia.com>
In-Reply-To: <20251001065707.920170-4-balbirs@nvidia.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Lance Yang <lance.yang@linux.dev>
Date: Sun, 12 Oct 2025 23:46:39 +0800
X-Gmail-Original-Message-ID: <CABzRoyYg1o8Oyjx1AQ8or-Vxm94zQXeAx7mWco2qs7=w4mBcMw@mail.gmail.com>
X-Gm-Features: AS18NWAW-r80P4VIv9gONLI57HYmyaK4SvQH1hgWyVYA6Kk8PKp1BoVJHXMPTaE
Message-ID: <CABzRoyYg1o8Oyjx1AQ8or-Vxm94zQXeAx7mWco2qs7=w4mBcMw@mail.gmail.com>
Subject: Re: [v7 03/16] mm/huge_memory: add device-private THP support to PMD
 operations
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
 Francois Dugast <francois.dugast@intel.com>
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

On Wed, Oct 1, 2025 at 4:20=E2=80=AFPM Balbir Singh <balbirs@nvidia.com> wr=
ote:
>
> Extend core huge page management functions to handle device-private THP
> entries.  This enables proper handling of large device-private folios in
> fundamental MM operations.
>
> The following functions have been updated:
>
> - copy_huge_pmd(): Handle device-private entries during fork/clone
> - zap_huge_pmd(): Properly free device-private THP during munmap
> - change_huge_pmd(): Support protection changes on device-private THP
> - __pte_offset_map(): Add device-private entry awareness
>
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
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Balbir Singh <balbirs@nvidia.com>
> ---
>  include/linux/swapops.h | 32 +++++++++++++++++++++++
>  mm/huge_memory.c        | 56 ++++++++++++++++++++++++++++++++++-------
>  mm/pgtable-generic.c    |  2 +-
>  3 files changed, 80 insertions(+), 10 deletions(-)
>
> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
> index 64ea151a7ae3..2687928a8146 100644
> --- a/include/linux/swapops.h
> +++ b/include/linux/swapops.h
> @@ -594,10 +594,42 @@ static inline int is_pmd_migration_entry(pmd_t pmd)
>  }
>  #endif  /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
>
> +#if defined(CONFIG_ZONE_DEVICE) && defined(CONFIG_ARCH_ENABLE_THP_MIGRAT=
ION)
> +
> +/**
> + * is_pmd_device_private_entry() - Check if PMD contains a device privat=
e swap entry
> + * @pmd: The PMD to check
> + *
> + * Returns true if the PMD contains a swap entry that represents a devic=
e private
> + * page mapping. This is used for zone device private pages that have be=
en
> + * swapped out but still need special handling during various memory man=
agement
> + * operations.
> + *
> + * Return: 1 if PMD contains device private entry, 0 otherwise
> + */
> +static inline int is_pmd_device_private_entry(pmd_t pmd)
> +{
> +       return is_swap_pmd(pmd) && is_device_private_entry(pmd_to_swp_ent=
ry(pmd));
> +}
> +
> +#else /* CONFIG_ZONE_DEVICE && CONFIG_ARCH_ENABLE_THP_MIGRATION */
> +
> +static inline int is_pmd_device_private_entry(pmd_t pmd)
> +{
> +       return 0;
> +}
> +
> +#endif /* CONFIG_ZONE_DEVICE && CONFIG_ARCH_ENABLE_THP_MIGRATION */
> +
>  static inline int non_swap_entry(swp_entry_t entry)
>  {
>         return swp_type(entry) >=3D MAX_SWAPFILES;
>  }
>
> +static inline int is_pmd_non_present_folio_entry(pmd_t pmd)
> +{
> +       return is_pmd_migration_entry(pmd) || is_pmd_device_private_entry=
(pmd);
> +}
> +
>  #endif /* CONFIG_MMU */
>  #endif /* _LINUX_SWAPOPS_H */
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 1b81680b4225..8e0a1747762d 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1703,17 +1703,45 @@ int copy_huge_pmd(struct mm_struct *dst_mm, struc=
t mm_struct *src_mm,
>         if (unlikely(is_swap_pmd(pmd))) {
>                 swp_entry_t entry =3D pmd_to_swp_entry(pmd);
>
> -               VM_BUG_ON(!is_pmd_migration_entry(pmd));
> -               if (!is_readable_migration_entry(entry)) {
> -                       entry =3D make_readable_migration_entry(
> -                                                       swp_offset(entry)=
);
> +               VM_WARN_ON(!is_pmd_non_present_folio_entry(pmd));
> +
> +               if (is_writable_migration_entry(entry) ||
> +                   is_readable_exclusive_migration_entry(entry)) {
> +                       entry =3D make_readable_migration_entry(swp_offse=
t(entry));
>                         pmd =3D swp_entry_to_pmd(entry);
>                         if (pmd_swp_soft_dirty(*src_pmd))
>                                 pmd =3D pmd_swp_mksoft_dirty(pmd);
>                         if (pmd_swp_uffd_wp(*src_pmd))
>                                 pmd =3D pmd_swp_mkuffd_wp(pmd);
>                         set_pmd_at(src_mm, addr, src_pmd, pmd);
> +               } else if (is_device_private_entry(entry)) {
> +                       /*
> +                        * For device private entries, since there are no
> +                        * read exclusive entries, writable =3D !readable
> +                        */
> +                       if (is_writable_device_private_entry(entry)) {
> +                               entry =3D make_readable_device_private_en=
try(swp_offset(entry));
> +                               pmd =3D swp_entry_to_pmd(entry);
> +
> +                               if (pmd_swp_soft_dirty(*src_pmd))
> +                                       pmd =3D pmd_swp_mksoft_dirty(pmd)=
;
> +                               if (pmd_swp_uffd_wp(*src_pmd))
> +                                       pmd =3D pmd_swp_mkuffd_wp(pmd);
> +                               set_pmd_at(src_mm, addr, src_pmd, pmd);
> +                       }
> +
> +                       src_folio =3D pfn_swap_entry_folio(entry);
> +                       VM_WARN_ON(!folio_test_large(src_folio));
> +
> +                       folio_get(src_folio);
> +                       /*
> +                        * folio_try_dup_anon_rmap_pmd does not fail for
> +                        * device private entries.
> +                        */
> +                       folio_try_dup_anon_rmap_pmd(src_folio, &src_folio=
->page,
> +                                                       dst_vma, src_vma)=
;
>                 }
> +
>                 add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
>                 mm_inc_nr_ptes(dst_mm);
>                 pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
> @@ -2211,15 +2239,16 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct v=
m_area_struct *vma,
>                         folio_remove_rmap_pmd(folio, page, vma);
>                         WARN_ON_ONCE(folio_mapcount(folio) < 0);
>                         VM_BUG_ON_PAGE(!PageHead(page), page);
> -               } else if (thp_migration_supported()) {
> +               } else if (is_pmd_non_present_folio_entry(orig_pmd)) {
>                         swp_entry_t entry;
>
> -                       VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
>                         entry =3D pmd_to_swp_entry(orig_pmd);
>                         folio =3D pfn_swap_entry_folio(entry);
>                         flush_needed =3D 0;
> -               } else
> -                       WARN_ONCE(1, "Non present huge pmd without pmd mi=
gration enabled!");
> +
> +                       if (!thp_migration_supported())
> +                               WARN_ONCE(1, "Non present huge pmd withou=
t pmd migration enabled!");
> +               }
>
>                 if (folio_test_anon(folio)) {
>                         zap_deposited_table(tlb->mm, pmd);
> @@ -2239,6 +2268,12 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm=
_area_struct *vma,
>                                 folio_mark_accessed(folio);
>                 }
>
> +               if (folio_is_device_private(folio)) {
> +                       folio_remove_rmap_pmd(folio, &folio->page, vma);
> +                       WARN_ON_ONCE(folio_mapcount(folio) < 0);
> +                       folio_put(folio);
> +               }

IIUC, a device-private THP is always anonymous, right? would it make sense
to move this folio_is_device_private() block inside the folio_test_anon()
check above?

> +
>                 spin_unlock(ptl);
>                 if (flush_needed)
>                         tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD=
_SIZE);
> @@ -2367,7 +2402,7 @@ int change_huge_pmd(struct mmu_gather *tlb, struct =
vm_area_struct *vma,
>                 struct folio *folio =3D pfn_swap_entry_folio(entry);
>                 pmd_t newpmd;
>
> -               VM_BUG_ON(!is_pmd_migration_entry(*pmd));
> +               VM_WARN_ON(!is_pmd_non_present_folio_entry(*pmd));
>                 if (is_writable_migration_entry(entry)) {
>                         /*
>                          * A protection check is difficult so
> @@ -2380,6 +2415,9 @@ int change_huge_pmd(struct mmu_gather *tlb, struct =
vm_area_struct *vma,
>                         newpmd =3D swp_entry_to_pmd(entry);
>                         if (pmd_swp_soft_dirty(*pmd))
>                                 newpmd =3D pmd_swp_mksoft_dirty(newpmd);
> +               } else if (is_writable_device_private_entry(entry)) {
> +                       entry =3D make_readable_device_private_entry(swp_=
offset(entry));
> +                       newpmd =3D swp_entry_to_pmd(entry);
>                 } else {
>                         newpmd =3D *pmd;
>                 }
> diff --git a/mm/pgtable-generic.c b/mm/pgtable-generic.c
> index 567e2d084071..0c847cdf4fd3 100644
> --- a/mm/pgtable-generic.c
> +++ b/mm/pgtable-generic.c
> @@ -290,7 +290,7 @@ pte_t *___pte_offset_map(pmd_t *pmd, unsigned long ad=
dr, pmd_t *pmdvalp)
>
>         if (pmdvalp)
>                 *pmdvalp =3D pmdval;
> -       if (unlikely(pmd_none(pmdval) || is_pmd_migration_entry(pmdval)))
> +       if (unlikely(pmd_none(pmdval) || !pmd_present(pmdval)))
>                 goto nomap;
>         if (unlikely(pmd_trans_huge(pmdval)))
>                 goto nomap;
> --
> 2.51.0
>
>
