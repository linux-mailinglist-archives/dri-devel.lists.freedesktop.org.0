Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E967D4B0ACA
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 11:35:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5898D10E7E5;
	Thu, 10 Feb 2022 10:35:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7C810E7D3;
 Thu, 10 Feb 2022 10:35:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtgHl1i1dpVolDzLPPoxNUdT5ieav0EgL6RuA8vw4c258heavyAGLAEzsnPuFCTxGtpX5dUGPXcXj4X7lIy7Vz7yD5IK24NOqTvrb96A2+qz6/IQF2bIMCwL2rZch00L6ZztTSm+t4fcckuSTOs6GPFMiKhW1gPpe2gh9VW5EYPi1xF+OQ+Si7HOx1MWMbMY2SgWfZOvmysMpPRZqt7Q0tEupegx9M7+zo7TBFPi56JegahIcF3YQxOReiJDgPJe7UanuOdTjge462uj5lL2nGLvO0OEQ07NBGFT4WqzdenrquBQMLUEu13I3KLsHctiqGI2i6q1ul7rhBsuzDE7bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8SYYznbc6oYWcqid/DlJkCnV4aVC2ccgXYZGPYeT1sQ=;
 b=AizZNtO+7RRVG+ZdE01sHgm29F7J5noHYMwZLa2lG6x7eYjX0O8c2qcXn7pDt15y1csa4o52ASUxF9u2LVMIp53uVW3f0/dR+OfgifNp37rAPG4fEfDDSVAgo7pKJIzPHD0rmqJxxuBHl82o9u06piZIZOCZSdft/YDipXv/kYblxfYpyIZMkamr78js9IpqsGPpovX5v5eBX/WjKenrxcWxdLvi2qBvg3hbKexHkLRN3TIZ0anZsCoqJbHHb6mEbaEk24V2bUxAZWvKN0e49khERSCuhIL6bFO9fUe5AbtpD6FCj+7M5UCwibJQmRr0r0Z0IwkQz+EnVHEl1EB2gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.236) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com; dmarc=pass
 (p=reject sp=reject pct=100) action=none header.from=nvidia.com; dkim=none
 (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8SYYznbc6oYWcqid/DlJkCnV4aVC2ccgXYZGPYeT1sQ=;
 b=XU+ElbEwDhe/+6kwqOa28foaUuDLLfiNnbuzqd2JiUHn9E25YIVJVdFyd0AwMB8twY588Myies+zvJ+yp7Digz21JDVNqDF6OPiCOxNL2+T3UlNLzX9M0MAkze3jSjFGhZD+gk7RuULqcx6JMjcjhQW4lnjHYkv7E6R+hsDTHAzK1ERfFifIScE/SpWhQ4gsMRQr7QOYhZPZiJONk7nzZajc1l3NAWk5Lnzsbfpy34g1nW1pT/EzywCjWOOtAp+6GUMHI7GdC58vCl4xB51h9gBz3cDj7K3CCKJdcaZafnkxC7zddms0rb2rjwBclY8KWGYIlG8dOAPrIg3q7LkocQ==
Received: from BN9PR03CA0942.namprd03.prod.outlook.com (2603:10b6:408:108::17)
 by BYAPR12MB2968.namprd12.prod.outlook.com (2603:10b6:a03:ab::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.12; Thu, 10 Feb
 2022 10:35:18 +0000
Received: from BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::1) by BN9PR03CA0942.outlook.office365.com
 (2603:10b6:408:108::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Thu, 10 Feb 2022 10:35:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.236)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.236 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.236; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.236) by
 BN8NAM11FT030.mail.protection.outlook.com (10.13.177.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4975.11 via Frontend Transport; Thu, 10 Feb 2022 10:35:18 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by DRHQMAIL109.nvidia.com
 (10.27.9.19) with Microsoft SMTP Server (TLS) id 15.0.1497.18;
 Thu, 10 Feb 2022 10:35:17 +0000
Received: from nvdebian.localnet (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.9; Thu, 10 Feb 2022
 02:35:12 -0800
From: Alistair Popple <apopple@nvidia.com>
To: Andrew Morton <akpm@linux-foundation.org>, Dan Williams
 <dan.j.williams@intel.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 13/27] mm: move the migrate_vma_* device migration code
 into it's own file
Date: Thu, 10 Feb 2022 21:35:10 +1100
Message-ID: <2160837.zdNQNePZV9@nvdebian>
In-Reply-To: <20220210072828.2930359-14-hch@lst.de>
References: <20220210072828.2930359-1-hch@lst.de>
 <20220210072828.2930359-14-hch@lst.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9065be9-e220-400c-4191-08d9ec81083d
X-MS-TrafficTypeDiagnostic: BYAPR12MB2968:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB2968E053B7B43FA28C158A20DF2F9@BYAPR12MB2968.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DoT9v0KpevTheacEx016QuJM9i/DmIEzAV3Sh5K8NiCRDiDf2xJctebqYLttKrgjCLkwS68ih11SRU7tw+Htszt5bgbdbdplp9mtaNtHKzGZT/cokoNpzyZ0vxgXIWgAgSso7HkwOlV6WX+EpQeFm/povu4D934bfsPQqzi5yd9M2i+H5jTZ9EY4mUebK1CTBRDasNk+lRc13vtkDTH3JTQ+MwUc99+87SEGraMO3HP3Fbg3ceg8rgTOZ8WiUuP2y+m2nnP492pZUaQTzEUaWrs1zHtaOg2k8EQIL4HmUIM1Q9KEwDARroeLrXw1QalONsX0wWphlbAib3/A+RZ7au3NsoR9ycCQVj+4kzYGnZHI5fxj/7DCoRESxR/r1TBokoQ+b9Kih8JRE/zQ8OtD5A5h9Pnps4rHfxYGtJIuKmmetIEKA1K9zU5XPVxahCtmlgVGwocIDp8e0dGRGlGT6nn5vupgr3b18KNo3N9oRT+46qE53q5yfuL7Rkhwc7D7ettL2PUYll4n1jWvqe9uIwMh1RzdHMp5Nbaa8/QMMJHc7RqfyJMNx1WudnNrBBXmKpNoeJc5498Ltvh3WS3ctqdXdr38iiot5L4B1g0gqXk/cCzaJq8yMG11bSc1f2C1U4dMKwEbAhtP++QWGgWJ8x5yxhxdi/mXf3+0odjGluenNHrtnq/BuQYE+ZCtgyZej0s1ICHWxzeISnxCtF/ZyqGkus7KQ/roVaLMUGgE/hQ=
X-Forefront-Antispam-Report: CIP:12.22.5.236; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(81166007)(26005)(426003)(82310400004)(356005)(83380400001)(54906003)(86362001)(47076005)(66574015)(186003)(16526019)(33716001)(336012)(40460700003)(9686003)(36860700001)(508600001)(316002)(70206006)(8676002)(8936002)(5660300002)(70586007)(9576002)(7416002)(4326008)(2906002)(30864003)(110136005)(39026012)(36900700001)(579004)(559001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2022 10:35:18.0304 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9065be9-e220-400c-4191-08d9ec81083d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.236];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB2968
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 dri-devel@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Logan Gunthorpe <logang@deltatee.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I got the following build error:

/data/source/linux/mm/migrate_device.c: In function =E2=80=98migrate_vma_co=
llect_pmd=E2=80=99:
/data/source/linux/mm/migrate_device.c:242:3: error: implicit declaration o=
f function =E2=80=98flush_tlb_range=E2=80=99; did you mean =E2=80=98flush_p=
md_tlb_range=E2=80=99? [-Werror=3Dimplicit-function-declaration]
  242 |   flush_tlb_range(walk->vma, start, end);
      |   ^~~~~~~~~~~~~~~
      |   flush_pmd_tlb_range

Including asm/tlbflush.h in migrate_device.c fixed it for me.

On Thursday, 10 February 2022 6:28:14 PM AEDT Christoph Hellwig wrote:
> Split the code used to migrate to and from ZONE_DEVICE memory from
> migrate.c into a new file.
>=20
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  mm/Kconfig          |   3 +
>  mm/Makefile         |   1 +
>  mm/migrate.c        | 753 -------------------------------------------
>  mm/migrate_device.c | 765 ++++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 769 insertions(+), 753 deletions(-)
>  create mode 100644 mm/migrate_device.c
>=20
> diff --git a/mm/Kconfig b/mm/Kconfig
> index a1901ae6d06293..6391d8d3a616f3 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -249,6 +249,9 @@ config MIGRATION
>  	  pages as migration can relocate pages to satisfy a huge page
>  	  allocation instead of reclaiming.
> =20
> +config DEVICE_MIGRATION
> +	def_bool MIGRATION && DEVICE_PRIVATE
> +
>  config ARCH_ENABLE_HUGEPAGE_MIGRATION
>  	bool
> =20
> diff --git a/mm/Makefile b/mm/Makefile
> index 70d4309c9ce338..4cc13f3179a518 100644
> --- a/mm/Makefile
> +++ b/mm/Makefile
> @@ -92,6 +92,7 @@ obj-$(CONFIG_KFENCE) +=3D kfence/
>  obj-$(CONFIG_FAILSLAB) +=3D failslab.o
>  obj-$(CONFIG_MEMTEST)		+=3D memtest.o
>  obj-$(CONFIG_MIGRATION) +=3D migrate.o
> +obj-$(CONFIG_DEVICE_MIGRATION) +=3D migrate_device.o
>  obj-$(CONFIG_TRANSPARENT_HUGEPAGE) +=3D huge_memory.o khugepaged.o
>  obj-$(CONFIG_PAGE_COUNTER) +=3D page_counter.o
>  obj-$(CONFIG_MEMCG) +=3D memcontrol.o vmpressure.o
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 746e1230886ddb..c31d04b46a5e17 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -38,12 +38,10 @@
>  #include <linux/hugetlb.h>
>  #include <linux/hugetlb_cgroup.h>
>  #include <linux/gfp.h>
> -#include <linux/pagewalk.h>
>  #include <linux/pfn_t.h>
>  #include <linux/memremap.h>
>  #include <linux/userfaultfd_k.h>
>  #include <linux/balloon_compaction.h>
> -#include <linux/mmu_notifier.h>
>  #include <linux/page_idle.h>
>  #include <linux/page_owner.h>
>  #include <linux/sched/mm.h>
> @@ -2125,757 +2123,6 @@ int migrate_misplaced_page(struct page *page, str=
uct vm_area_struct *vma,
>  #endif /* CONFIG_NUMA_BALANCING */
>  #endif /* CONFIG_NUMA */
> =20
> -#ifdef CONFIG_DEVICE_PRIVATE
> -static int migrate_vma_collect_skip(unsigned long start,
> -				    unsigned long end,
> -				    struct mm_walk *walk)
> -{
> -	struct migrate_vma *migrate =3D walk->private;
> -	unsigned long addr;
> -
> -	for (addr =3D start; addr < end; addr +=3D PAGE_SIZE) {
> -		migrate->dst[migrate->npages] =3D 0;
> -		migrate->src[migrate->npages++] =3D 0;
> -	}
> -
> -	return 0;
> -}
> -
> -static int migrate_vma_collect_hole(unsigned long start,
> -				    unsigned long end,
> -				    __always_unused int depth,
> -				    struct mm_walk *walk)
> -{
> -	struct migrate_vma *migrate =3D walk->private;
> -	unsigned long addr;
> -
> -	/* Only allow populating anonymous memory. */
> -	if (!vma_is_anonymous(walk->vma))
> -		return migrate_vma_collect_skip(start, end, walk);
> -
> -	for (addr =3D start; addr < end; addr +=3D PAGE_SIZE) {
> -		migrate->src[migrate->npages] =3D MIGRATE_PFN_MIGRATE;
> -		migrate->dst[migrate->npages] =3D 0;
> -		migrate->npages++;
> -		migrate->cpages++;
> -	}
> -
> -	return 0;
> -}
> -
> -static int migrate_vma_collect_pmd(pmd_t *pmdp,
> -				   unsigned long start,
> -				   unsigned long end,
> -				   struct mm_walk *walk)
> -{
> -	struct migrate_vma *migrate =3D walk->private;
> -	struct vm_area_struct *vma =3D walk->vma;
> -	struct mm_struct *mm =3D vma->vm_mm;
> -	unsigned long addr =3D start, unmapped =3D 0;
> -	spinlock_t *ptl;
> -	pte_t *ptep;
> -
> -again:
> -	if (pmd_none(*pmdp))
> -		return migrate_vma_collect_hole(start, end, -1, walk);
> -
> -	if (pmd_trans_huge(*pmdp)) {
> -		struct page *page;
> -
> -		ptl =3D pmd_lock(mm, pmdp);
> -		if (unlikely(!pmd_trans_huge(*pmdp))) {
> -			spin_unlock(ptl);
> -			goto again;
> -		}
> -
> -		page =3D pmd_page(*pmdp);
> -		if (is_huge_zero_page(page)) {
> -			spin_unlock(ptl);
> -			split_huge_pmd(vma, pmdp, addr);
> -			if (pmd_trans_unstable(pmdp))
> -				return migrate_vma_collect_skip(start, end,
> -								walk);
> -		} else {
> -			int ret;
> -
> -			get_page(page);
> -			spin_unlock(ptl);
> -			if (unlikely(!trylock_page(page)))
> -				return migrate_vma_collect_skip(start, end,
> -								walk);
> -			ret =3D split_huge_page(page);
> -			unlock_page(page);
> -			put_page(page);
> -			if (ret)
> -				return migrate_vma_collect_skip(start, end,
> -								walk);
> -			if (pmd_none(*pmdp))
> -				return migrate_vma_collect_hole(start, end, -1,
> -								walk);
> -		}
> -	}
> -
> -	if (unlikely(pmd_bad(*pmdp)))
> -		return migrate_vma_collect_skip(start, end, walk);
> -
> -	ptep =3D pte_offset_map_lock(mm, pmdp, addr, &ptl);
> -	arch_enter_lazy_mmu_mode();
> -
> -	for (; addr < end; addr +=3D PAGE_SIZE, ptep++) {
> -		unsigned long mpfn =3D 0, pfn;
> -		struct page *page;
> -		swp_entry_t entry;
> -		pte_t pte;
> -
> -		pte =3D *ptep;
> -
> -		if (pte_none(pte)) {
> -			if (vma_is_anonymous(vma)) {
> -				mpfn =3D MIGRATE_PFN_MIGRATE;
> -				migrate->cpages++;
> -			}
> -			goto next;
> -		}
> -
> -		if (!pte_present(pte)) {
> -			/*
> -			 * Only care about unaddressable device page special
> -			 * page table entry. Other special swap entries are not
> -			 * migratable, and we ignore regular swapped page.
> -			 */
> -			entry =3D pte_to_swp_entry(pte);
> -			if (!is_device_private_entry(entry))
> -				goto next;
> -
> -			page =3D pfn_swap_entry_to_page(entry);
> -			if (!(migrate->flags &
> -				MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
> -			    page->pgmap->owner !=3D migrate->pgmap_owner)
> -				goto next;
> -
> -			mpfn =3D migrate_pfn(page_to_pfn(page)) |
> -					MIGRATE_PFN_MIGRATE;
> -			if (is_writable_device_private_entry(entry))
> -				mpfn |=3D MIGRATE_PFN_WRITE;
> -		} else {
> -			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
> -				goto next;
> -			pfn =3D pte_pfn(pte);
> -			if (is_zero_pfn(pfn)) {
> -				mpfn =3D MIGRATE_PFN_MIGRATE;
> -				migrate->cpages++;
> -				goto next;
> -			}
> -			page =3D vm_normal_page(migrate->vma, addr, pte);
> -			mpfn =3D migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
> -			mpfn |=3D pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
> -		}
> -
> -		/* FIXME support THP */
> -		if (!page || !page->mapping || PageTransCompound(page)) {
> -			mpfn =3D 0;
> -			goto next;
> -		}
> -
> -		/*
> -		 * By getting a reference on the page we pin it and that blocks
> -		 * any kind of migration. Side effect is that it "freezes" the
> -		 * pte.
> -		 *
> -		 * We drop this reference after isolating the page from the lru
> -		 * for non device page (device page are not on the lru and thus
> -		 * can't be dropped from it).
> -		 */
> -		get_page(page);
> -
> -		/*
> -		 * Optimize for the common case where page is only mapped once
> -		 * in one process. If we can lock the page, then we can safely
> -		 * set up a special migration page table entry now.
> -		 */
> -		if (trylock_page(page)) {
> -			pte_t swp_pte;
> -
> -			migrate->cpages++;
> -			ptep_get_and_clear(mm, addr, ptep);
> -
> -			/* Setup special migration page table entry */
> -			if (mpfn & MIGRATE_PFN_WRITE)
> -				entry =3D make_writable_migration_entry(
> -							page_to_pfn(page));
> -			else
> -				entry =3D make_readable_migration_entry(
> -							page_to_pfn(page));
> -			swp_pte =3D swp_entry_to_pte(entry);
> -			if (pte_present(pte)) {
> -				if (pte_soft_dirty(pte))
> -					swp_pte =3D pte_swp_mksoft_dirty(swp_pte);
> -				if (pte_uffd_wp(pte))
> -					swp_pte =3D pte_swp_mkuffd_wp(swp_pte);
> -			} else {
> -				if (pte_swp_soft_dirty(pte))
> -					swp_pte =3D pte_swp_mksoft_dirty(swp_pte);
> -				if (pte_swp_uffd_wp(pte))
> -					swp_pte =3D pte_swp_mkuffd_wp(swp_pte);
> -			}
> -			set_pte_at(mm, addr, ptep, swp_pte);
> -
> -			/*
> -			 * This is like regular unmap: we remove the rmap and
> -			 * drop page refcount. Page won't be freed, as we took
> -			 * a reference just above.
> -			 */
> -			page_remove_rmap(page, false);
> -			put_page(page);
> -
> -			if (pte_present(pte))
> -				unmapped++;
> -		} else {
> -			put_page(page);
> -			mpfn =3D 0;
> -		}
> -
> -next:
> -		migrate->dst[migrate->npages] =3D 0;
> -		migrate->src[migrate->npages++] =3D mpfn;
> -	}
> -	arch_leave_lazy_mmu_mode();
> -	pte_unmap_unlock(ptep - 1, ptl);
> -
> -	/* Only flush the TLB if we actually modified any entries */
> -	if (unmapped)
> -		flush_tlb_range(walk->vma, start, end);
> -
> -	return 0;
> -}
> -
> -static const struct mm_walk_ops migrate_vma_walk_ops =3D {
> -	.pmd_entry		=3D migrate_vma_collect_pmd,
> -	.pte_hole		=3D migrate_vma_collect_hole,
> -};
> -
> -/*
> - * migrate_vma_collect() - collect pages over a range of virtual address=
es
> - * @migrate: migrate struct containing all migration information
> - *
> - * This will walk the CPU page table. For each virtual address backed by=
 a
> - * valid page, it updates the src array and takes a reference on the pag=
e, in
> - * order to pin the page until we lock it and unmap it.
> - */
> -static void migrate_vma_collect(struct migrate_vma *migrate)
> -{
> -	struct mmu_notifier_range range;
> -
> -	/*
> -	 * Note that the pgmap_owner is passed to the mmu notifier callback so
> -	 * that the registered device driver can skip invalidating device
> -	 * private page mappings that won't be migrated.
> -	 */
> -	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_MIGRATE, 0,
> -		migrate->vma, migrate->vma->vm_mm, migrate->start, migrate->end,
> -		migrate->pgmap_owner);
> -	mmu_notifier_invalidate_range_start(&range);
> -
> -	walk_page_range(migrate->vma->vm_mm, migrate->start, migrate->end,
> -			&migrate_vma_walk_ops, migrate);
> -
> -	mmu_notifier_invalidate_range_end(&range);
> -	migrate->end =3D migrate->start + (migrate->npages << PAGE_SHIFT);
> -}
> -
> -/*
> - * migrate_vma_check_page() - check if page is pinned or not
> - * @page: struct page to check
> - *
> - * Pinned pages cannot be migrated. This is the same test as in
> - * folio_migrate_mapping(), except that here we allow migration of a
> - * ZONE_DEVICE page.
> - */
> -static bool migrate_vma_check_page(struct page *page)
> -{
> -	/*
> -	 * One extra ref because caller holds an extra reference, either from
> -	 * isolate_lru_page() for a regular page, or migrate_vma_collect() for
> -	 * a device page.
> -	 */
> -	int extra =3D 1;
> -
> -	/*
> -	 * FIXME support THP (transparent huge page), it is bit more complex to
> -	 * check them than regular pages, because they can be mapped with a pmd
> -	 * or with a pte (split pte mapping).
> -	 */
> -	if (PageCompound(page))
> -		return false;
> -
> -	/* Page from ZONE_DEVICE have one extra reference */
> -	if (is_zone_device_page(page))
> -		extra++;
> -
> -	/* For file back page */
> -	if (page_mapping(page))
> -		extra +=3D 1 + page_has_private(page);
> -
> -	if ((page_count(page) - extra) > page_mapcount(page))
> -		return false;
> -
> -	return true;
> -}
> -
> -/*
> - * migrate_vma_unmap() - replace page mapping with special migration pte=
 entry
> - * @migrate: migrate struct containing all migration information
> - *
> - * Isolate pages from the LRU and replace mappings (CPU page table pte) =
with a
> - * special migration pte entry and check if it has been pinned. Pinned p=
ages are
> - * restored because we cannot migrate them.
> - *
> - * This is the last step before we call the device driver callback to al=
locate
> - * destination memory and copy contents of original page over to new pag=
e.
> - */
> -static void migrate_vma_unmap(struct migrate_vma *migrate)
> -{
> -	const unsigned long npages =3D migrate->npages;
> -	unsigned long i, restore =3D 0;
> -	bool allow_drain =3D true;
> -
> -	lru_add_drain();
> -
> -	for (i =3D 0; i < npages; i++) {
> -		struct page *page =3D migrate_pfn_to_page(migrate->src[i]);
> -
> -		if (!page)
> -			continue;
> -
> -		/* ZONE_DEVICE pages are not on LRU */
> -		if (!is_zone_device_page(page)) {
> -			if (!PageLRU(page) && allow_drain) {
> -				/* Drain CPU's pagevec */
> -				lru_add_drain_all();
> -				allow_drain =3D false;
> -			}
> -
> -			if (isolate_lru_page(page)) {
> -				migrate->src[i] &=3D ~MIGRATE_PFN_MIGRATE;
> -				migrate->cpages--;
> -				restore++;
> -				continue;
> -			}
> -
> -			/* Drop the reference we took in collect */
> -			put_page(page);
> -		}
> -
> -		if (page_mapped(page))
> -			try_to_migrate(page, 0);
> -
> -		if (page_mapped(page) || !migrate_vma_check_page(page)) {
> -			if (!is_zone_device_page(page)) {
> -				get_page(page);
> -				putback_lru_page(page);
> -			}
> -
> -			migrate->src[i] &=3D ~MIGRATE_PFN_MIGRATE;
> -			migrate->cpages--;
> -			restore++;
> -			continue;
> -		}
> -	}
> -
> -	for (i =3D 0; i < npages && restore; i++) {
> -		struct page *page =3D migrate_pfn_to_page(migrate->src[i]);
> -
> -		if (!page || (migrate->src[i] & MIGRATE_PFN_MIGRATE))
> -			continue;
> -
> -		remove_migration_ptes(page, page, false);
> -
> -		migrate->src[i] =3D 0;
> -		unlock_page(page);
> -		put_page(page);
> -		restore--;
> -	}
> -}
> -
> -/**
> - * migrate_vma_setup() - prepare to migrate a range of memory
> - * @args: contains the vma, start, and pfns arrays for the migration
> - *
> - * Returns: negative errno on failures, 0 when 0 or more pages were migr=
ated
> - * without an error.
> - *
> - * Prepare to migrate a range of memory virtual address range by collect=
ing all
> - * the pages backing each virtual address in the range, saving them insi=
de the
> - * src array.  Then lock those pages and unmap them. Once the pages are =
locked
> - * and unmapped, check whether each page is pinned or not.  Pages that a=
ren't
> - * pinned have the MIGRATE_PFN_MIGRATE flag set (by this function) in the
> - * corresponding src array entry.  Then restores any pages that are pinn=
ed, by
> - * remapping and unlocking those pages.
> - *
> - * The caller should then allocate destination memory and copy source me=
mory to
> - * it for all those entries (ie with MIGRATE_PFN_VALID and MIGRATE_PFN_M=
IGRATE
> - * flag set).  Once these are allocated and copied, the caller must upda=
te each
> - * corresponding entry in the dst array with the pfn value of the destin=
ation
> - * page and with MIGRATE_PFN_VALID. Destination pages must be locked via
> - * lock_page().
> - *
> - * Note that the caller does not have to migrate all the pages that are =
marked
> - * with MIGRATE_PFN_MIGRATE flag in src array unless this is a migration=
 from
> - * device memory to system memory.  If the caller cannot migrate a devic=
e page
> - * back to system memory, then it must return VM_FAULT_SIGBUS, which has=
 severe
> - * consequences for the userspace process, so it must be avoided if at a=
ll
> - * possible.
> - *
> - * For empty entries inside CPU page table (pte_none() or pmd_none() is =
true) we
> - * do set MIGRATE_PFN_MIGRATE flag inside the corresponding source array=
 thus
> - * allowing the caller to allocate device memory for those unbacked virt=
ual
> - * addresses.  For this the caller simply has to allocate device memory =
and
> - * properly set the destination entry like for regular migration.  Note =
that
> - * this can still fail, and thus inside the device driver you must check=
 if the
> - * migration was successful for those entries after calling migrate_vma_=
pages(),
> - * just like for regular migration.
> - *
> - * After that, the callers must call migrate_vma_pages() to go over each=
 entry
> - * in the src array that has the MIGRATE_PFN_VALID and MIGRATE_PFN_MIGRA=
TE flag
> - * set. If the corresponding entry in dst array has MIGRATE_PFN_VALID fl=
ag set,
> - * then migrate_vma_pages() to migrate struct page information from the =
source
> - * struct page to the destination struct page.  If it fails to migrate t=
he
> - * struct page information, then it clears the MIGRATE_PFN_MIGRATE flag =
in the
> - * src array.
> - *
> - * At this point all successfully migrated pages have an entry in the src
> - * array with MIGRATE_PFN_VALID and MIGRATE_PFN_MIGRATE flag set and the=
 dst
> - * array entry with MIGRATE_PFN_VALID flag set.
> - *
> - * Once migrate_vma_pages() returns the caller may inspect which pages w=
ere
> - * successfully migrated, and which were not.  Successfully migrated pag=
es will
> - * have the MIGRATE_PFN_MIGRATE flag set for their src array entry.
> - *
> - * It is safe to update device page table after migrate_vma_pages() beca=
use
> - * both destination and source page are still locked, and the mmap_lock =
is held
> - * in read mode (hence no one can unmap the range being migrated).
> - *
> - * Once the caller is done cleaning up things and updating its page tabl=
e (if it
> - * chose to do so, this is not an obligation) it finally calls
> - * migrate_vma_finalize() to update the CPU page table to point to new p=
ages
> - * for successfully migrated pages or otherwise restore the CPU page tab=
le to
> - * point to the original source pages.
> - */
> -int migrate_vma_setup(struct migrate_vma *args)
> -{
> -	long nr_pages =3D (args->end - args->start) >> PAGE_SHIFT;
> -
> -	args->start &=3D PAGE_MASK;
> -	args->end &=3D PAGE_MASK;
> -	if (!args->vma || is_vm_hugetlb_page(args->vma) ||
> -	    (args->vma->vm_flags & VM_SPECIAL) || vma_is_dax(args->vma))
> -		return -EINVAL;
> -	if (nr_pages <=3D 0)
> -		return -EINVAL;
> -	if (args->start < args->vma->vm_start ||
> -	    args->start >=3D args->vma->vm_end)
> -		return -EINVAL;
> -	if (args->end <=3D args->vma->vm_start || args->end > args->vma->vm_end)
> -		return -EINVAL;
> -	if (!args->src || !args->dst)
> -		return -EINVAL;
> -
> -	memset(args->src, 0, sizeof(*args->src) * nr_pages);
> -	args->cpages =3D 0;
> -	args->npages =3D 0;
> -
> -	migrate_vma_collect(args);
> -
> -	if (args->cpages)
> -		migrate_vma_unmap(args);
> -
> -	/*
> -	 * At this point pages are locked and unmapped, and thus they have
> -	 * stable content and can safely be copied to destination memory that
> -	 * is allocated by the drivers.
> -	 */
> -	return 0;
> -
> -}
> -EXPORT_SYMBOL(migrate_vma_setup);
> -
> -/*
> - * This code closely matches the code in:
> - *   __handle_mm_fault()
> - *     handle_pte_fault()
> - *       do_anonymous_page()
> - * to map in an anonymous zero page but the struct page will be a ZONE_D=
EVICE
> - * private page.
> - */
> -static void migrate_vma_insert_page(struct migrate_vma *migrate,
> -				    unsigned long addr,
> -				    struct page *page,
> -				    unsigned long *src)
> -{
> -	struct vm_area_struct *vma =3D migrate->vma;
> -	struct mm_struct *mm =3D vma->vm_mm;
> -	bool flush =3D false;
> -	spinlock_t *ptl;
> -	pte_t entry;
> -	pgd_t *pgdp;
> -	p4d_t *p4dp;
> -	pud_t *pudp;
> -	pmd_t *pmdp;
> -	pte_t *ptep;
> -
> -	/* Only allow populating anonymous memory */
> -	if (!vma_is_anonymous(vma))
> -		goto abort;
> -
> -	pgdp =3D pgd_offset(mm, addr);
> -	p4dp =3D p4d_alloc(mm, pgdp, addr);
> -	if (!p4dp)
> -		goto abort;
> -	pudp =3D pud_alloc(mm, p4dp, addr);
> -	if (!pudp)
> -		goto abort;
> -	pmdp =3D pmd_alloc(mm, pudp, addr);
> -	if (!pmdp)
> -		goto abort;
> -
> -	if (pmd_trans_huge(*pmdp) || pmd_devmap(*pmdp))
> -		goto abort;
> -
> -	/*
> -	 * Use pte_alloc() instead of pte_alloc_map().  We can't run
> -	 * pte_offset_map() on pmds where a huge pmd might be created
> -	 * from a different thread.
> -	 *
> -	 * pte_alloc_map() is safe to use under mmap_write_lock(mm) or when
> -	 * parallel threads are excluded by other means.
> -	 *
> -	 * Here we only have mmap_read_lock(mm).
> -	 */
> -	if (pte_alloc(mm, pmdp))
> -		goto abort;
> -
> -	/* See the comment in pte_alloc_one_map() */
> -	if (unlikely(pmd_trans_unstable(pmdp)))
> -		goto abort;
> -
> -	if (unlikely(anon_vma_prepare(vma)))
> -		goto abort;
> -	if (mem_cgroup_charge(page_folio(page), vma->vm_mm, GFP_KERNEL))
> -		goto abort;
> -
> -	/*
> -	 * The memory barrier inside __SetPageUptodate makes sure that
> -	 * preceding stores to the page contents become visible before
> -	 * the set_pte_at() write.
> -	 */
> -	__SetPageUptodate(page);
> -
> -	if (is_device_private_page(page)) {
> -		swp_entry_t swp_entry;
> -
> -		if (vma->vm_flags & VM_WRITE)
> -			swp_entry =3D make_writable_device_private_entry(
> -						page_to_pfn(page));
> -		else
> -			swp_entry =3D make_readable_device_private_entry(
> -						page_to_pfn(page));
> -		entry =3D swp_entry_to_pte(swp_entry);
> -	} else {
> -		/*
> -		 * For now we only support migrating to un-addressable device
> -		 * memory.
> -		 */
> -		if (is_zone_device_page(page)) {
> -			pr_warn_once("Unsupported ZONE_DEVICE page type.\n");
> -			goto abort;
> -		}
> -		entry =3D mk_pte(page, vma->vm_page_prot);
> -		if (vma->vm_flags & VM_WRITE)
> -			entry =3D pte_mkwrite(pte_mkdirty(entry));
> -	}
> -
> -	ptep =3D pte_offset_map_lock(mm, pmdp, addr, &ptl);
> -
> -	if (check_stable_address_space(mm))
> -		goto unlock_abort;
> -
> -	if (pte_present(*ptep)) {
> -		unsigned long pfn =3D pte_pfn(*ptep);
> -
> -		if (!is_zero_pfn(pfn))
> -			goto unlock_abort;
> -		flush =3D true;
> -	} else if (!pte_none(*ptep))
> -		goto unlock_abort;
> -
> -	/*
> -	 * Check for userfaultfd but do not deliver the fault. Instead,
> -	 * just back off.
> -	 */
> -	if (userfaultfd_missing(vma))
> -		goto unlock_abort;
> -
> -	inc_mm_counter(mm, MM_ANONPAGES);
> -	page_add_new_anon_rmap(page, vma, addr, false);
> -	if (!is_zone_device_page(page))
> -		lru_cache_add_inactive_or_unevictable(page, vma);
> -	get_page(page);
> -
> -	if (flush) {
> -		flush_cache_page(vma, addr, pte_pfn(*ptep));
> -		ptep_clear_flush_notify(vma, addr, ptep);
> -		set_pte_at_notify(mm, addr, ptep, entry);
> -		update_mmu_cache(vma, addr, ptep);
> -	} else {
> -		/* No need to invalidate - it was non-present before */
> -		set_pte_at(mm, addr, ptep, entry);
> -		update_mmu_cache(vma, addr, ptep);
> -	}
> -
> -	pte_unmap_unlock(ptep, ptl);
> -	*src =3D MIGRATE_PFN_MIGRATE;
> -	return;
> -
> -unlock_abort:
> -	pte_unmap_unlock(ptep, ptl);
> -abort:
> -	*src &=3D ~MIGRATE_PFN_MIGRATE;
> -}
> -
> -/**
> - * migrate_vma_pages() - migrate meta-data from src page to dst page
> - * @migrate: migrate struct containing all migration information
> - *
> - * This migrates struct page meta-data from source struct page to destin=
ation
> - * struct page. This effectively finishes the migration from source page=
 to the
> - * destination page.
> - */
> -void migrate_vma_pages(struct migrate_vma *migrate)
> -{
> -	const unsigned long npages =3D migrate->npages;
> -	const unsigned long start =3D migrate->start;
> -	struct mmu_notifier_range range;
> -	unsigned long addr, i;
> -	bool notified =3D false;
> -
> -	for (i =3D 0, addr =3D start; i < npages; addr +=3D PAGE_SIZE, i++) {
> -		struct page *newpage =3D migrate_pfn_to_page(migrate->dst[i]);
> -		struct page *page =3D migrate_pfn_to_page(migrate->src[i]);
> -		struct address_space *mapping;
> -		int r;
> -
> -		if (!newpage) {
> -			migrate->src[i] &=3D ~MIGRATE_PFN_MIGRATE;
> -			continue;
> -		}
> -
> -		if (!page) {
> -			if (!(migrate->src[i] & MIGRATE_PFN_MIGRATE))
> -				continue;
> -			if (!notified) {
> -				notified =3D true;
> -
> -				mmu_notifier_range_init_owner(&range,
> -					MMU_NOTIFY_MIGRATE, 0, migrate->vma,
> -					migrate->vma->vm_mm, addr, migrate->end,
> -					migrate->pgmap_owner);
> -				mmu_notifier_invalidate_range_start(&range);
> -			}
> -			migrate_vma_insert_page(migrate, addr, newpage,
> -						&migrate->src[i]);
> -			continue;
> -		}
> -
> -		mapping =3D page_mapping(page);
> -
> -		if (is_device_private_page(newpage)) {
> -			/*
> -			 * For now only support private anonymous when migrating
> -			 * to un-addressable device memory.
> -			 */
> -			if (mapping) {
> -				migrate->src[i] &=3D ~MIGRATE_PFN_MIGRATE;
> -				continue;
> -			}
> -		} else if (is_zone_device_page(newpage)) {
> -			/*
> -			 * Other types of ZONE_DEVICE page are not supported.
> -			 */
> -			migrate->src[i] &=3D ~MIGRATE_PFN_MIGRATE;
> -			continue;
> -		}
> -
> -		r =3D migrate_page(mapping, newpage, page, MIGRATE_SYNC_NO_COPY);
> -		if (r !=3D MIGRATEPAGE_SUCCESS)
> -			migrate->src[i] &=3D ~MIGRATE_PFN_MIGRATE;
> -	}
> -
> -	/*
> -	 * No need to double call mmu_notifier->invalidate_range() callback as
> -	 * the above ptep_clear_flush_notify() inside migrate_vma_insert_page()
> -	 * did already call it.
> -	 */
> -	if (notified)
> -		mmu_notifier_invalidate_range_only_end(&range);
> -}
> -EXPORT_SYMBOL(migrate_vma_pages);
> -
> -/**
> - * migrate_vma_finalize() - restore CPU page table entry
> - * @migrate: migrate struct containing all migration information
> - *
> - * This replaces the special migration pte entry with either a mapping t=
o the
> - * new page if migration was successful for that page, or to the origina=
l page
> - * otherwise.
> - *
> - * This also unlocks the pages and puts them back on the lru, or drops t=
he extra
> - * refcount, for device pages.
> - */
> -void migrate_vma_finalize(struct migrate_vma *migrate)
> -{
> -	const unsigned long npages =3D migrate->npages;
> -	unsigned long i;
> -
> -	for (i =3D 0; i < npages; i++) {
> -		struct page *newpage =3D migrate_pfn_to_page(migrate->dst[i]);
> -		struct page *page =3D migrate_pfn_to_page(migrate->src[i]);
> -
> -		if (!page) {
> -			if (newpage) {
> -				unlock_page(newpage);
> -				put_page(newpage);
> -			}
> -			continue;
> -		}
> -
> -		if (!(migrate->src[i] & MIGRATE_PFN_MIGRATE) || !newpage) {
> -			if (newpage) {
> -				unlock_page(newpage);
> -				put_page(newpage);
> -			}
> -			newpage =3D page;
> -		}
> -
> -		remove_migration_ptes(page, newpage, false);
> -		unlock_page(page);
> -
> -		if (is_zone_device_page(page))
> -			put_page(page);
> -		else
> -			putback_lru_page(page);
> -
> -		if (newpage !=3D page) {
> -			unlock_page(newpage);
> -			if (is_zone_device_page(newpage))
> -				put_page(newpage);
> -			else
> -				putback_lru_page(newpage);
> -		}
> -	}
> -}
> -EXPORT_SYMBOL(migrate_vma_finalize);
> -#endif /* CONFIG_DEVICE_PRIVATE */
> -
>  /*
>   * node_demotion[] example:
>   *
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> new file mode 100644
> index 00000000000000..749e0bab8e4779
> --- /dev/null
> +++ b/mm/migrate_device.c
> @@ -0,0 +1,765 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Memory Migration functionality.
> + *
> + * Originally written by J=C3=A9r=C3=B4me Glisse.
> + */
> +#include <linux/export.h>
> +#include <linux/memremap.h>
> +#include <linux/migrate.h>
> +#include <linux/mm_inline.h>
> +#include <linux/mmu_notifier.h>
> +#include <linux/oom.h>
> +#include <linux/pagewalk.h>
> +#include <linux/rmap.h>
> +#include <linux/swapops.h>
> +#include "internal.h"
> +
> +static int migrate_vma_collect_skip(unsigned long start,
> +				    unsigned long end,
> +				    struct mm_walk *walk)
> +{
> +	struct migrate_vma *migrate =3D walk->private;
> +	unsigned long addr;
> +
> +	for (addr =3D start; addr < end; addr +=3D PAGE_SIZE) {
> +		migrate->dst[migrate->npages] =3D 0;
> +		migrate->src[migrate->npages++] =3D 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static int migrate_vma_collect_hole(unsigned long start,
> +				    unsigned long end,
> +				    __always_unused int depth,
> +				    struct mm_walk *walk)
> +{
> +	struct migrate_vma *migrate =3D walk->private;
> +	unsigned long addr;
> +
> +	/* Only allow populating anonymous memory. */
> +	if (!vma_is_anonymous(walk->vma))
> +		return migrate_vma_collect_skip(start, end, walk);
> +
> +	for (addr =3D start; addr < end; addr +=3D PAGE_SIZE) {
> +		migrate->src[migrate->npages] =3D MIGRATE_PFN_MIGRATE;
> +		migrate->dst[migrate->npages] =3D 0;
> +		migrate->npages++;
> +		migrate->cpages++;
> +	}
> +
> +	return 0;
> +}
> +
> +static int migrate_vma_collect_pmd(pmd_t *pmdp,
> +				   unsigned long start,
> +				   unsigned long end,
> +				   struct mm_walk *walk)
> +{
> +	struct migrate_vma *migrate =3D walk->private;
> +	struct vm_area_struct *vma =3D walk->vma;
> +	struct mm_struct *mm =3D vma->vm_mm;
> +	unsigned long addr =3D start, unmapped =3D 0;
> +	spinlock_t *ptl;
> +	pte_t *ptep;
> +
> +again:
> +	if (pmd_none(*pmdp))
> +		return migrate_vma_collect_hole(start, end, -1, walk);
> +
> +	if (pmd_trans_huge(*pmdp)) {
> +		struct page *page;
> +
> +		ptl =3D pmd_lock(mm, pmdp);
> +		if (unlikely(!pmd_trans_huge(*pmdp))) {
> +			spin_unlock(ptl);
> +			goto again;
> +		}
> +
> +		page =3D pmd_page(*pmdp);
> +		if (is_huge_zero_page(page)) {
> +			spin_unlock(ptl);
> +			split_huge_pmd(vma, pmdp, addr);
> +			if (pmd_trans_unstable(pmdp))
> +				return migrate_vma_collect_skip(start, end,
> +								walk);
> +		} else {
> +			int ret;
> +
> +			get_page(page);
> +			spin_unlock(ptl);
> +			if (unlikely(!trylock_page(page)))
> +				return migrate_vma_collect_skip(start, end,
> +								walk);
> +			ret =3D split_huge_page(page);
> +			unlock_page(page);
> +			put_page(page);
> +			if (ret)
> +				return migrate_vma_collect_skip(start, end,
> +								walk);
> +			if (pmd_none(*pmdp))
> +				return migrate_vma_collect_hole(start, end, -1,
> +								walk);
> +		}
> +	}
> +
> +	if (unlikely(pmd_bad(*pmdp)))
> +		return migrate_vma_collect_skip(start, end, walk);
> +
> +	ptep =3D pte_offset_map_lock(mm, pmdp, addr, &ptl);
> +	arch_enter_lazy_mmu_mode();
> +
> +	for (; addr < end; addr +=3D PAGE_SIZE, ptep++) {
> +		unsigned long mpfn =3D 0, pfn;
> +		struct page *page;
> +		swp_entry_t entry;
> +		pte_t pte;
> +
> +		pte =3D *ptep;
> +
> +		if (pte_none(pte)) {
> +			if (vma_is_anonymous(vma)) {
> +				mpfn =3D MIGRATE_PFN_MIGRATE;
> +				migrate->cpages++;
> +			}
> +			goto next;
> +		}
> +
> +		if (!pte_present(pte)) {
> +			/*
> +			 * Only care about unaddressable device page special
> +			 * page table entry. Other special swap entries are not
> +			 * migratable, and we ignore regular swapped page.
> +			 */
> +			entry =3D pte_to_swp_entry(pte);
> +			if (!is_device_private_entry(entry))
> +				goto next;
> +
> +			page =3D pfn_swap_entry_to_page(entry);
> +			if (!(migrate->flags &
> +				MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
> +			    page->pgmap->owner !=3D migrate->pgmap_owner)
> +				goto next;
> +
> +			mpfn =3D migrate_pfn(page_to_pfn(page)) |
> +					MIGRATE_PFN_MIGRATE;
> +			if (is_writable_device_private_entry(entry))
> +				mpfn |=3D MIGRATE_PFN_WRITE;
> +		} else {
> +			if (!(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
> +				goto next;
> +			pfn =3D pte_pfn(pte);
> +			if (is_zero_pfn(pfn)) {
> +				mpfn =3D MIGRATE_PFN_MIGRATE;
> +				migrate->cpages++;
> +				goto next;
> +			}
> +			page =3D vm_normal_page(migrate->vma, addr, pte);
> +			mpfn =3D migrate_pfn(pfn) | MIGRATE_PFN_MIGRATE;
> +			mpfn |=3D pte_write(pte) ? MIGRATE_PFN_WRITE : 0;
> +		}
> +
> +		/* FIXME support THP */
> +		if (!page || !page->mapping || PageTransCompound(page)) {
> +			mpfn =3D 0;
> +			goto next;
> +		}
> +
> +		/*
> +		 * By getting a reference on the page we pin it and that blocks
> +		 * any kind of migration. Side effect is that it "freezes" the
> +		 * pte.
> +		 *
> +		 * We drop this reference after isolating the page from the lru
> +		 * for non device page (device page are not on the lru and thus
> +		 * can't be dropped from it).
> +		 */
> +		get_page(page);
> +
> +		/*
> +		 * Optimize for the common case where page is only mapped once
> +		 * in one process. If we can lock the page, then we can safely
> +		 * set up a special migration page table entry now.
> +		 */
> +		if (trylock_page(page)) {
> +			pte_t swp_pte;
> +
> +			migrate->cpages++;
> +			ptep_get_and_clear(mm, addr, ptep);
> +
> +			/* Setup special migration page table entry */
> +			if (mpfn & MIGRATE_PFN_WRITE)
> +				entry =3D make_writable_migration_entry(
> +							page_to_pfn(page));
> +			else
> +				entry =3D make_readable_migration_entry(
> +							page_to_pfn(page));
> +			swp_pte =3D swp_entry_to_pte(entry);
> +			if (pte_present(pte)) {
> +				if (pte_soft_dirty(pte))
> +					swp_pte =3D pte_swp_mksoft_dirty(swp_pte);
> +				if (pte_uffd_wp(pte))
> +					swp_pte =3D pte_swp_mkuffd_wp(swp_pte);
> +			} else {
> +				if (pte_swp_soft_dirty(pte))
> +					swp_pte =3D pte_swp_mksoft_dirty(swp_pte);
> +				if (pte_swp_uffd_wp(pte))
> +					swp_pte =3D pte_swp_mkuffd_wp(swp_pte);
> +			}
> +			set_pte_at(mm, addr, ptep, swp_pte);
> +
> +			/*
> +			 * This is like regular unmap: we remove the rmap and
> +			 * drop page refcount. Page won't be freed, as we took
> +			 * a reference just above.
> +			 */
> +			page_remove_rmap(page, false);
> +			put_page(page);
> +
> +			if (pte_present(pte))
> +				unmapped++;
> +		} else {
> +			put_page(page);
> +			mpfn =3D 0;
> +		}
> +
> +next:
> +		migrate->dst[migrate->npages] =3D 0;
> +		migrate->src[migrate->npages++] =3D mpfn;
> +	}
> +	arch_leave_lazy_mmu_mode();
> +	pte_unmap_unlock(ptep - 1, ptl);
> +
> +	/* Only flush the TLB if we actually modified any entries */
> +	if (unmapped)
> +		flush_tlb_range(walk->vma, start, end);
> +
> +	return 0;
> +}
> +
> +static const struct mm_walk_ops migrate_vma_walk_ops =3D {
> +	.pmd_entry		=3D migrate_vma_collect_pmd,
> +	.pte_hole		=3D migrate_vma_collect_hole,
> +};
> +
> +/*
> + * migrate_vma_collect() - collect pages over a range of virtual address=
es
> + * @migrate: migrate struct containing all migration information
> + *
> + * This will walk the CPU page table. For each virtual address backed by=
 a
> + * valid page, it updates the src array and takes a reference on the pag=
e, in
> + * order to pin the page until we lock it and unmap it.
> + */
> +static void migrate_vma_collect(struct migrate_vma *migrate)
> +{
> +	struct mmu_notifier_range range;
> +
> +	/*
> +	 * Note that the pgmap_owner is passed to the mmu notifier callback so
> +	 * that the registered device driver can skip invalidating device
> +	 * private page mappings that won't be migrated.
> +	 */
> +	mmu_notifier_range_init_owner(&range, MMU_NOTIFY_MIGRATE, 0,
> +		migrate->vma, migrate->vma->vm_mm, migrate->start, migrate->end,
> +		migrate->pgmap_owner);
> +	mmu_notifier_invalidate_range_start(&range);
> +
> +	walk_page_range(migrate->vma->vm_mm, migrate->start, migrate->end,
> +			&migrate_vma_walk_ops, migrate);
> +
> +	mmu_notifier_invalidate_range_end(&range);
> +	migrate->end =3D migrate->start + (migrate->npages << PAGE_SHIFT);
> +}
> +
> +/*
> + * migrate_vma_check_page() - check if page is pinned or not
> + * @page: struct page to check
> + *
> + * Pinned pages cannot be migrated. This is the same test as in
> + * folio_migrate_mapping(), except that here we allow migration of a
> + * ZONE_DEVICE page.
> + */
> +static bool migrate_vma_check_page(struct page *page)
> +{
> +	/*
> +	 * One extra ref because caller holds an extra reference, either from
> +	 * isolate_lru_page() for a regular page, or migrate_vma_collect() for
> +	 * a device page.
> +	 */
> +	int extra =3D 1;
> +
> +	/*
> +	 * FIXME support THP (transparent huge page), it is bit more complex to
> +	 * check them than regular pages, because they can be mapped with a pmd
> +	 * or with a pte (split pte mapping).
> +	 */
> +	if (PageCompound(page))
> +		return false;
> +
> +	/* Page from ZONE_DEVICE have one extra reference */
> +	if (is_zone_device_page(page))
> +		extra++;
> +
> +	/* For file back page */
> +	if (page_mapping(page))
> +		extra +=3D 1 + page_has_private(page);
> +
> +	if ((page_count(page) - extra) > page_mapcount(page))
> +		return false;
> +
> +	return true;
> +}
> +
> +/*
> + * migrate_vma_unmap() - replace page mapping with special migration pte=
 entry
> + * @migrate: migrate struct containing all migration information
> + *
> + * Isolate pages from the LRU and replace mappings (CPU page table pte) =
with a
> + * special migration pte entry and check if it has been pinned. Pinned p=
ages are
> + * restored because we cannot migrate them.
> + *
> + * This is the last step before we call the device driver callback to al=
locate
> + * destination memory and copy contents of original page over to new pag=
e.
> + */
> +static void migrate_vma_unmap(struct migrate_vma *migrate)
> +{
> +	const unsigned long npages =3D migrate->npages;
> +	unsigned long i, restore =3D 0;
> +	bool allow_drain =3D true;
> +
> +	lru_add_drain();
> +
> +	for (i =3D 0; i < npages; i++) {
> +		struct page *page =3D migrate_pfn_to_page(migrate->src[i]);
> +
> +		if (!page)
> +			continue;
> +
> +		/* ZONE_DEVICE pages are not on LRU */
> +		if (!is_zone_device_page(page)) {
> +			if (!PageLRU(page) && allow_drain) {
> +				/* Drain CPU's pagevec */
> +				lru_add_drain_all();
> +				allow_drain =3D false;
> +			}
> +
> +			if (isolate_lru_page(page)) {
> +				migrate->src[i] &=3D ~MIGRATE_PFN_MIGRATE;
> +				migrate->cpages--;
> +				restore++;
> +				continue;
> +			}
> +
> +			/* Drop the reference we took in collect */
> +			put_page(page);
> +		}
> +
> +		if (page_mapped(page))
> +			try_to_migrate(page, 0);
> +
> +		if (page_mapped(page) || !migrate_vma_check_page(page)) {
> +			if (!is_zone_device_page(page)) {
> +				get_page(page);
> +				putback_lru_page(page);
> +			}
> +
> +			migrate->src[i] &=3D ~MIGRATE_PFN_MIGRATE;
> +			migrate->cpages--;
> +			restore++;
> +			continue;
> +		}
> +	}
> +
> +	for (i =3D 0; i < npages && restore; i++) {
> +		struct page *page =3D migrate_pfn_to_page(migrate->src[i]);
> +
> +		if (!page || (migrate->src[i] & MIGRATE_PFN_MIGRATE))
> +			continue;
> +
> +		remove_migration_ptes(page, page, false);
> +
> +		migrate->src[i] =3D 0;
> +		unlock_page(page);
> +		put_page(page);
> +		restore--;
> +	}
> +}
> +
> +/**
> + * migrate_vma_setup() - prepare to migrate a range of memory
> + * @args: contains the vma, start, and pfns arrays for the migration
> + *
> + * Returns: negative errno on failures, 0 when 0 or more pages were migr=
ated
> + * without an error.
> + *
> + * Prepare to migrate a range of memory virtual address range by collect=
ing all
> + * the pages backing each virtual address in the range, saving them insi=
de the
> + * src array.  Then lock those pages and unmap them. Once the pages are =
locked
> + * and unmapped, check whether each page is pinned or not.  Pages that a=
ren't
> + * pinned have the MIGRATE_PFN_MIGRATE flag set (by this function) in the
> + * corresponding src array entry.  Then restores any pages that are pinn=
ed, by
> + * remapping and unlocking those pages.
> + *
> + * The caller should then allocate destination memory and copy source me=
mory to
> + * it for all those entries (ie with MIGRATE_PFN_VALID and MIGRATE_PFN_M=
IGRATE
> + * flag set).  Once these are allocated and copied, the caller must upda=
te each
> + * corresponding entry in the dst array with the pfn value of the destin=
ation
> + * page and with MIGRATE_PFN_VALID. Destination pages must be locked via
> + * lock_page().
> + *
> + * Note that the caller does not have to migrate all the pages that are =
marked
> + * with MIGRATE_PFN_MIGRATE flag in src array unless this is a migration=
 from
> + * device memory to system memory.  If the caller cannot migrate a devic=
e page
> + * back to system memory, then it must return VM_FAULT_SIGBUS, which has=
 severe
> + * consequences for the userspace process, so it must be avoided if at a=
ll
> + * possible.
> + *
> + * For empty entries inside CPU page table (pte_none() or pmd_none() is =
true) we
> + * do set MIGRATE_PFN_MIGRATE flag inside the corresponding source array=
 thus
> + * allowing the caller to allocate device memory for those unbacked virt=
ual
> + * addresses.  For this the caller simply has to allocate device memory =
and
> + * properly set the destination entry like for regular migration.  Note =
that
> + * this can still fail, and thus inside the device driver you must check=
 if the
> + * migration was successful for those entries after calling migrate_vma_=
pages(),
> + * just like for regular migration.
> + *
> + * After that, the callers must call migrate_vma_pages() to go over each=
 entry
> + * in the src array that has the MIGRATE_PFN_VALID and MIGRATE_PFN_MIGRA=
TE flag
> + * set. If the corresponding entry in dst array has MIGRATE_PFN_VALID fl=
ag set,
> + * then migrate_vma_pages() to migrate struct page information from the =
source
> + * struct page to the destination struct page.  If it fails to migrate t=
he
> + * struct page information, then it clears the MIGRATE_PFN_MIGRATE flag =
in the
> + * src array.
> + *
> + * At this point all successfully migrated pages have an entry in the src
> + * array with MIGRATE_PFN_VALID and MIGRATE_PFN_MIGRATE flag set and the=
 dst
> + * array entry with MIGRATE_PFN_VALID flag set.
> + *
> + * Once migrate_vma_pages() returns the caller may inspect which pages w=
ere
> + * successfully migrated, and which were not.  Successfully migrated pag=
es will
> + * have the MIGRATE_PFN_MIGRATE flag set for their src array entry.
> + *
> + * It is safe to update device page table after migrate_vma_pages() beca=
use
> + * both destination and source page are still locked, and the mmap_lock =
is held
> + * in read mode (hence no one can unmap the range being migrated).
> + *
> + * Once the caller is done cleaning up things and updating its page tabl=
e (if it
> + * chose to do so, this is not an obligation) it finally calls
> + * migrate_vma_finalize() to update the CPU page table to point to new p=
ages
> + * for successfully migrated pages or otherwise restore the CPU page tab=
le to
> + * point to the original source pages.
> + */
> +int migrate_vma_setup(struct migrate_vma *args)
> +{
> +	long nr_pages =3D (args->end - args->start) >> PAGE_SHIFT;
> +
> +	args->start &=3D PAGE_MASK;
> +	args->end &=3D PAGE_MASK;
> +	if (!args->vma || is_vm_hugetlb_page(args->vma) ||
> +	    (args->vma->vm_flags & VM_SPECIAL) || vma_is_dax(args->vma))
> +		return -EINVAL;
> +	if (nr_pages <=3D 0)
> +		return -EINVAL;
> +	if (args->start < args->vma->vm_start ||
> +	    args->start >=3D args->vma->vm_end)
> +		return -EINVAL;
> +	if (args->end <=3D args->vma->vm_start || args->end > args->vma->vm_end)
> +		return -EINVAL;
> +	if (!args->src || !args->dst)
> +		return -EINVAL;
> +
> +	memset(args->src, 0, sizeof(*args->src) * nr_pages);
> +	args->cpages =3D 0;
> +	args->npages =3D 0;
> +
> +	migrate_vma_collect(args);
> +
> +	if (args->cpages)
> +		migrate_vma_unmap(args);
> +
> +	/*
> +	 * At this point pages are locked and unmapped, and thus they have
> +	 * stable content and can safely be copied to destination memory that
> +	 * is allocated by the drivers.
> +	 */
> +	return 0;
> +
> +}
> +EXPORT_SYMBOL(migrate_vma_setup);
> +
> +/*
> + * This code closely matches the code in:
> + *   __handle_mm_fault()
> + *     handle_pte_fault()
> + *       do_anonymous_page()
> + * to map in an anonymous zero page but the struct page will be a ZONE_D=
EVICE
> + * private page.
> + */
> +static void migrate_vma_insert_page(struct migrate_vma *migrate,
> +				    unsigned long addr,
> +				    struct page *page,
> +				    unsigned long *src)
> +{
> +	struct vm_area_struct *vma =3D migrate->vma;
> +	struct mm_struct *mm =3D vma->vm_mm;
> +	bool flush =3D false;
> +	spinlock_t *ptl;
> +	pte_t entry;
> +	pgd_t *pgdp;
> +	p4d_t *p4dp;
> +	pud_t *pudp;
> +	pmd_t *pmdp;
> +	pte_t *ptep;
> +
> +	/* Only allow populating anonymous memory */
> +	if (!vma_is_anonymous(vma))
> +		goto abort;
> +
> +	pgdp =3D pgd_offset(mm, addr);
> +	p4dp =3D p4d_alloc(mm, pgdp, addr);
> +	if (!p4dp)
> +		goto abort;
> +	pudp =3D pud_alloc(mm, p4dp, addr);
> +	if (!pudp)
> +		goto abort;
> +	pmdp =3D pmd_alloc(mm, pudp, addr);
> +	if (!pmdp)
> +		goto abort;
> +
> +	if (pmd_trans_huge(*pmdp) || pmd_devmap(*pmdp))
> +		goto abort;
> +
> +	/*
> +	 * Use pte_alloc() instead of pte_alloc_map().  We can't run
> +	 * pte_offset_map() on pmds where a huge pmd might be created
> +	 * from a different thread.
> +	 *
> +	 * pte_alloc_map() is safe to use under mmap_write_lock(mm) or when
> +	 * parallel threads are excluded by other means.
> +	 *
> +	 * Here we only have mmap_read_lock(mm).
> +	 */
> +	if (pte_alloc(mm, pmdp))
> +		goto abort;
> +
> +	/* See the comment in pte_alloc_one_map() */
> +	if (unlikely(pmd_trans_unstable(pmdp)))
> +		goto abort;
> +
> +	if (unlikely(anon_vma_prepare(vma)))
> +		goto abort;
> +	if (mem_cgroup_charge(page_folio(page), vma->vm_mm, GFP_KERNEL))
> +		goto abort;
> +
> +	/*
> +	 * The memory barrier inside __SetPageUptodate makes sure that
> +	 * preceding stores to the page contents become visible before
> +	 * the set_pte_at() write.
> +	 */
> +	__SetPageUptodate(page);
> +
> +	if (is_device_private_page(page)) {
> +		swp_entry_t swp_entry;
> +
> +		if (vma->vm_flags & VM_WRITE)
> +			swp_entry =3D make_writable_device_private_entry(
> +						page_to_pfn(page));
> +		else
> +			swp_entry =3D make_readable_device_private_entry(
> +						page_to_pfn(page));
> +		entry =3D swp_entry_to_pte(swp_entry);
> +	} else {
> +		/*
> +		 * For now we only support migrating to un-addressable device
> +		 * memory.
> +		 */
> +		if (is_zone_device_page(page)) {
> +			pr_warn_once("Unsupported ZONE_DEVICE page type.\n");
> +			goto abort;
> +		}
> +		entry =3D mk_pte(page, vma->vm_page_prot);
> +		if (vma->vm_flags & VM_WRITE)
> +			entry =3D pte_mkwrite(pte_mkdirty(entry));
> +	}
> +
> +	ptep =3D pte_offset_map_lock(mm, pmdp, addr, &ptl);
> +
> +	if (check_stable_address_space(mm))
> +		goto unlock_abort;
> +
> +	if (pte_present(*ptep)) {
> +		unsigned long pfn =3D pte_pfn(*ptep);
> +
> +		if (!is_zero_pfn(pfn))
> +			goto unlock_abort;
> +		flush =3D true;
> +	} else if (!pte_none(*ptep))
> +		goto unlock_abort;
> +
> +	/*
> +	 * Check for userfaultfd but do not deliver the fault. Instead,
> +	 * just back off.
> +	 */
> +	if (userfaultfd_missing(vma))
> +		goto unlock_abort;
> +
> +	inc_mm_counter(mm, MM_ANONPAGES);
> +	page_add_new_anon_rmap(page, vma, addr, false);
> +	if (!is_zone_device_page(page))
> +		lru_cache_add_inactive_or_unevictable(page, vma);
> +	get_page(page);
> +
> +	if (flush) {
> +		flush_cache_page(vma, addr, pte_pfn(*ptep));
> +		ptep_clear_flush_notify(vma, addr, ptep);
> +		set_pte_at_notify(mm, addr, ptep, entry);
> +		update_mmu_cache(vma, addr, ptep);
> +	} else {
> +		/* No need to invalidate - it was non-present before */
> +		set_pte_at(mm, addr, ptep, entry);
> +		update_mmu_cache(vma, addr, ptep);
> +	}
> +
> +	pte_unmap_unlock(ptep, ptl);
> +	*src =3D MIGRATE_PFN_MIGRATE;
> +	return;
> +
> +unlock_abort:
> +	pte_unmap_unlock(ptep, ptl);
> +abort:
> +	*src &=3D ~MIGRATE_PFN_MIGRATE;
> +}
> +
> +/**
> + * migrate_vma_pages() - migrate meta-data from src page to dst page
> + * @migrate: migrate struct containing all migration information
> + *
> + * This migrates struct page meta-data from source struct page to destin=
ation
> + * struct page. This effectively finishes the migration from source page=
 to the
> + * destination page.
> + */
> +void migrate_vma_pages(struct migrate_vma *migrate)
> +{
> +	const unsigned long npages =3D migrate->npages;
> +	const unsigned long start =3D migrate->start;
> +	struct mmu_notifier_range range;
> +	unsigned long addr, i;
> +	bool notified =3D false;
> +
> +	for (i =3D 0, addr =3D start; i < npages; addr +=3D PAGE_SIZE, i++) {
> +		struct page *newpage =3D migrate_pfn_to_page(migrate->dst[i]);
> +		struct page *page =3D migrate_pfn_to_page(migrate->src[i]);
> +		struct address_space *mapping;
> +		int r;
> +
> +		if (!newpage) {
> +			migrate->src[i] &=3D ~MIGRATE_PFN_MIGRATE;
> +			continue;
> +		}
> +
> +		if (!page) {
> +			if (!(migrate->src[i] & MIGRATE_PFN_MIGRATE))
> +				continue;
> +			if (!notified) {
> +				notified =3D true;
> +
> +				mmu_notifier_range_init_owner(&range,
> +					MMU_NOTIFY_MIGRATE, 0, migrate->vma,
> +					migrate->vma->vm_mm, addr, migrate->end,
> +					migrate->pgmap_owner);
> +				mmu_notifier_invalidate_range_start(&range);
> +			}
> +			migrate_vma_insert_page(migrate, addr, newpage,
> +						&migrate->src[i]);
> +			continue;
> +		}
> +
> +		mapping =3D page_mapping(page);
> +
> +		if (is_device_private_page(newpage)) {
> +			/*
> +			 * For now only support private anonymous when migrating
> +			 * to un-addressable device memory.
> +			 */
> +			if (mapping) {
> +				migrate->src[i] &=3D ~MIGRATE_PFN_MIGRATE;
> +				continue;
> +			}
> +		} else if (is_zone_device_page(newpage)) {
> +			/*
> +			 * Other types of ZONE_DEVICE page are not supported.
> +			 */
> +			migrate->src[i] &=3D ~MIGRATE_PFN_MIGRATE;
> +			continue;
> +		}
> +
> +		r =3D migrate_page(mapping, newpage, page, MIGRATE_SYNC_NO_COPY);
> +		if (r !=3D MIGRATEPAGE_SUCCESS)
> +			migrate->src[i] &=3D ~MIGRATE_PFN_MIGRATE;
> +	}
> +
> +	/*
> +	 * No need to double call mmu_notifier->invalidate_range() callback as
> +	 * the above ptep_clear_flush_notify() inside migrate_vma_insert_page()
> +	 * did already call it.
> +	 */
> +	if (notified)
> +		mmu_notifier_invalidate_range_only_end(&range);
> +}
> +EXPORT_SYMBOL(migrate_vma_pages);
> +
> +/**
> + * migrate_vma_finalize() - restore CPU page table entry
> + * @migrate: migrate struct containing all migration information
> + *
> + * This replaces the special migration pte entry with either a mapping t=
o the
> + * new page if migration was successful for that page, or to the origina=
l page
> + * otherwise.
> + *
> + * This also unlocks the pages and puts them back on the lru, or drops t=
he extra
> + * refcount, for device pages.
> + */
> +void migrate_vma_finalize(struct migrate_vma *migrate)
> +{
> +	const unsigned long npages =3D migrate->npages;
> +	unsigned long i;
> +
> +	for (i =3D 0; i < npages; i++) {
> +		struct page *newpage =3D migrate_pfn_to_page(migrate->dst[i]);
> +		struct page *page =3D migrate_pfn_to_page(migrate->src[i]);
> +
> +		if (!page) {
> +			if (newpage) {
> +				unlock_page(newpage);
> +				put_page(newpage);
> +			}
> +			continue;
> +		}
> +
> +		if (!(migrate->src[i] & MIGRATE_PFN_MIGRATE) || !newpage) {
> +			if (newpage) {
> +				unlock_page(newpage);
> +				put_page(newpage);
> +			}
> +			newpage =3D page;
> +		}
> +
> +		remove_migration_ptes(page, newpage, false);
> +		unlock_page(page);
> +
> +		if (is_zone_device_page(page))
> +			put_page(page);
> +		else
> +			putback_lru_page(page);
> +
> +		if (newpage !=3D page) {
> +			unlock_page(newpage);
> +			if (is_zone_device_page(newpage))
> +				put_page(newpage);
> +			else
> +				putback_lru_page(newpage);
> +		}
> +	}
> +}
> +EXPORT_SYMBOL(migrate_vma_finalize);
>=20




