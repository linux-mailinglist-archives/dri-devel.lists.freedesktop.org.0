Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD18A3315EE
	for <lists+dri-devel@lfdr.de>; Mon,  8 Mar 2021 19:24:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C8A46E41B;
	Mon,  8 Mar 2021 18:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr770047.outbound.protection.outlook.com [40.107.77.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17F9E6E41B;
 Mon,  8 Mar 2021 18:24:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N3SluPBnESia5now7qkcdk8mIT5krwsiGsR1dBtkYncpZML/SwU6X7FOzwNkFRPOFQoyiDCRIe1snxYdOedMyfsTd+Jqsvsge+TCi2fxYcdWHVe5pnwJzbVVxoOvhgNCKcP8Vb/GhSUrUvoC1jzeDvbsfQVUGHtXj7YljeEmNAeo8z8Jcs77/R6kBCR6jBdBH3KO9SEqRv3dsUG37lWsXiwZ6xjJCInFYhVQ39vCJVwRLQ9jQBTw5cYpO8AHjAOBNyGfEPd7GCFeeWUedRWHEZ4f5nZB8XApD5OzzA5Ms5UK0VgYk5CBG/mtUDVZoQB2xgJQUVG2EO6kfz/bMMIBvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Inx/k1FWhF0FZfbhCeTw7SIpBymxCF/eIf9y+khVLCU=;
 b=SLiOMGe6UY3wb702ZI6dq6vj0nZG4x9Sf7Z0cCVBj+EgF+qHK5qj33cLi41VHjfr9KL1gXtcN9yFnWAJ+UJZXltfL99i9ElRZ9enHP6LNdCX6xG/iAxOiiLVKiEeujPF/8Wa3yc/c64X5yecPyxZ9dFGi0WjvV6aEdFCQrapN05YT2CuhChOYxFtfn9EQywJSYw5hpEmqq9kBysaWapjE7ITX3vzHaVHW5BncWIk50tV/SZBHTzVYdHfk0TGrA4CrZ4Yl6nr6SCs9BFdldb3cfKisHZPZeknIpvufcBb7GXWXWdFe6/QwU/LSc1JqK/NUqVaM066kHydlJntuZ5DEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Inx/k1FWhF0FZfbhCeTw7SIpBymxCF/eIf9y+khVLCU=;
 b=ApwFXV8wDTwzGIiq7HObn2oNPCh905Wqiaan0chk/+uIT1xEH3WP5Dzwj7+L4no8TjF2SS2L9fCVRa5mlOGfNb/mjK425zgNk0e7FXF1DmJk+NYfaZz9qPGwKu2QMXiLC9ORvLyyc+G5tLeqtNTGaGbVCEIS7K7YLIca6LMfIlk=
Received: from DM5PR11CA0015.namprd11.prod.outlook.com (2603:10b6:3:115::25)
 by DM5PR12MB1594.namprd12.prod.outlook.com (2603:10b6:4:e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3912.17; Mon, 8 Mar 2021 18:24:46 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:115:cafe::7d) by DM5PR11CA0015.outlook.office365.com
 (2603:10b6:3:115::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Mon, 8 Mar 2021 18:24:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3912.17 via Frontend Transport; Mon, 8 Mar 2021 18:24:45 +0000
Received: from rcampbell-test.nvidia.com (172.20.145.6) by
 HQMAIL107.nvidia.com (172.20.187.13) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 8 Mar 2021 18:24:45 +0000
Subject: Re: [PATCH v4 1/8] mm: Remove special swap entry functions
To: Alistair Popple <apopple@nvidia.com>, <linux-mm@kvack.org>,
 <nouveau@lists.freedesktop.org>, <bskeggs@redhat.com>,
 <akpm@linux-foundation.org>
References: <20210304061645.29747-1-apopple@nvidia.com>
 <20210304061645.29747-2-apopple@nvidia.com>
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <15a0a23a-54ad-71d3-d519-0750981a81b5@nvidia.com>
Date: Mon, 8 Mar 2021 10:24:45 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210304061645.29747-2-apopple@nvidia.com>
Content-Language: en-US
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b432fd9a-93f5-43da-fcb7-08d8e25f738f
X-MS-TrafficTypeDiagnostic: DM5PR12MB1594:
X-Microsoft-Antispam-PRVS: <DM5PR12MB159451B13490E691DC9F7796C2939@DM5PR12MB1594.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:198;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Fcq80RWI0MetJvkPbdI9RMSylLUjp/AohLZyDMwKj1YQjx6+CpoB2TFJUSu/TY1FACwqBZrBaTxNodxmOqG+jXRk/WgFzrSUx/pXwNmNB+WalT90AiaXGDrciuV6y4f+PMEHnDp2AHGYRrGaed7XHwH+oAxXWBeFCqX0KDlCmlLnrFmcXhr8bwAhPPuq0lbnU0J7oQzDEPkyV+KLbAPcXDKYGw6NqKzv6NtmRP6Z6ZJSUrOUuLw609Iszn/y3p9fzeGK0O9pdz/jJ1iphNeGvu2Cn9mmP5A4wY9xfa1IeNG5fYRh433UGMQbJ5colHy+cIh5/lnb0ZdjC7liLj/DTDfARUmS7DEGKszAvmmsuANS7C/tk3s0qPFbyTOQ/txnqTI2MQEbZs82gjg20TvMbGt75eS6lVOXtER4gGbX1NnQVGo1xrlRnWNWoOYLLBjUzAW1/B3t7jLDRr7gMQC5MP8heB1HVpbHa6t8N+XtL7H3NSrNqyT/3FD9+acg8Q8TYlEx2WYxBCh3UP82f3n0bW65kNDyzd6nq7eX8/eHeeDZhakqWBhZA5bFNp2QCWNCnwQK/ljSo7fSMA+Lv7LkOD4Spz+rj+uqkj7TEufnda1bX7y4s5DerMnrQGIQgzapMVTeY/LET453NKCZDQa0nYJDuSfYmBn5hOAMKFZNEZCCPoxEWyobFfGCyeM7rYD0WC6AswsGMVch0lBZXTmnyS9+RAATBkZo1oXemePBI88=
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(376002)(39860400002)(36840700001)(46966006)(31686004)(36906005)(36860700001)(356005)(26005)(16526019)(316002)(2616005)(54906003)(53546011)(82740400003)(186003)(7636003)(7696005)(31696002)(2906002)(336012)(34020700004)(478600001)(426003)(4326008)(82310400003)(47076005)(30864003)(36756003)(5660300002)(86362001)(70586007)(8936002)(8676002)(83380400001)(70206006)(110136005)(43740500002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2021 18:24:45.9912 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b432fd9a-93f5-43da-fcb7-08d8e25f738f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1594
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
Cc: linux-doc@vger.kernel.org, jhubbard@nvidia.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, kvm-ppc@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 3/3/21 10:16 PM, Alistair Popple wrote:
> Remove the migration and device private entry_to_page() and
> entry_to_pfn() inline functions and instead open code them directly.
> This results in shorter code which is easier to understand.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

Looks OK to me.
Reviewed-by: Ralph Campbell <rcampbell@nvidia.com>

> ---
> 
> v4:
> * Added pfn_swap_entry_to_page()
> * Reinstated check that migration entries point to locked pages
> * Removed #define swapcache_prepare which isn't needed for CONFIG_SWAP=0
>    builds
> ---
>   arch/s390/mm/pgtable.c  |  2 +-
>   fs/proc/task_mmu.c      | 23 +++++---------
>   include/linux/swap.h    |  4 +--
>   include/linux/swapops.h | 69 ++++++++++++++---------------------------
>   mm/hmm.c                |  5 ++-
>   mm/huge_memory.c        |  4 +--
>   mm/memcontrol.c         |  2 +-
>   mm/memory.c             | 10 +++---
>   mm/migrate.c            |  6 ++--
>   mm/page_vma_mapped.c    |  6 ++--
>   10 files changed, 50 insertions(+), 81 deletions(-)
> 
> diff --git a/arch/s390/mm/pgtable.c b/arch/s390/mm/pgtable.c
> index 18205f851c24..aae001096c46 100644
> --- a/arch/s390/mm/pgtable.c
> +++ b/arch/s390/mm/pgtable.c
> @@ -691,7 +691,7 @@ static void ptep_zap_swap_entry(struct mm_struct *mm, swp_entry_t entry)
>   	if (!non_swap_entry(entry))
>   		dec_mm_counter(mm, MM_SWAPENTS);
>   	else if (is_migration_entry(entry)) {
> -		struct page *page = migration_entry_to_page(entry);
> +		struct page *page = pfn_swap_entry_to_page(entry));
>   
>   		dec_mm_counter(mm, mm_counter(page));
>   	}
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 602e3a52884d..7c75af0fc423 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -514,10 +514,8 @@ static void smaps_pte_entry(pte_t *pte, unsigned long addr,
>   			} else {
>   				mss->swap_pss += (u64)PAGE_SIZE << PSS_SHIFT;
>   			}
> -		} else if (is_migration_entry(swpent))
> -			page = migration_entry_to_page(swpent);
> -		else if (is_device_private_entry(swpent))
> -			page = device_private_entry_to_page(swpent);
> +		} else if (is_pfn_swap_entry(swpent))
> +			page = pfn_swap_entry_to_page(swpent);
>   	} else if (unlikely(IS_ENABLED(CONFIG_SHMEM) && mss->check_shmem_swap
>   							&& pte_none(*pte))) {
>   		page = xa_load(&vma->vm_file->f_mapping->i_pages,
> @@ -549,7 +547,7 @@ static void smaps_pmd_entry(pmd_t *pmd, unsigned long addr,
>   		swp_entry_t entry = pmd_to_swp_entry(*pmd);
>   
>   		if (is_migration_entry(entry))
> -			page = migration_entry_to_page(entry);
> +			page = pfn_swap_entry_to_page(entry);
>   	}
>   	if (IS_ERR_OR_NULL(page))
>   		return;
> @@ -691,10 +689,8 @@ static int smaps_hugetlb_range(pte_t *pte, unsigned long hmask,
>   	} else if (is_swap_pte(*pte)) {
>   		swp_entry_t swpent = pte_to_swp_entry(*pte);
>   
> -		if (is_migration_entry(swpent))
> -			page = migration_entry_to_page(swpent);
> -		else if (is_device_private_entry(swpent))
> -			page = device_private_entry_to_page(swpent);
> +		if (is_pfn_swap_entry(swpent))
> +			page = pfn_swap_entry_to_page(swpent);
>   	}
>   	if (page) {
>   		int mapcount = page_mapcount(page);
> @@ -1382,11 +1378,8 @@ static pagemap_entry_t pte_to_pagemap_entry(struct pagemapread *pm,
>   			frame = swp_type(entry) |
>   				(swp_offset(entry) << MAX_SWAPFILES_SHIFT);
>   		flags |= PM_SWAP;
> -		if (is_migration_entry(entry))
> -			page = migration_entry_to_page(entry);
> -
> -		if (is_device_private_entry(entry))
> -			page = device_private_entry_to_page(entry);
> +		if (is_pfn_swap_entry(entry))
> +			page = pfn_swap_entry_to_page(entry);
>   	}
>   
>   	if (page && !PageAnon(page))
> @@ -1443,7 +1436,7 @@ static int pagemap_pmd_range(pmd_t *pmdp, unsigned long addr, unsigned long end,
>   			if (pmd_swp_soft_dirty(pmd))
>   				flags |= PM_SOFT_DIRTY;
>   			VM_BUG_ON(!is_pmd_migration_entry(pmd));
> -			page = migration_entry_to_page(entry);
> +			page = pfn_swap_entry_to_page(entry);
>   		}
>   #endif
>   
> diff --git a/include/linux/swap.h b/include/linux/swap.h
> index 596bc2f4d9b0..57a7690966a4 100644
> --- a/include/linux/swap.h
> +++ b/include/linux/swap.h
> @@ -519,8 +519,8 @@ static inline void show_swap_cache_info(void)
>   {
>   }
>   
> -#define free_swap_and_cache(e) ({(is_migration_entry(e) || is_device_private_entry(e));})
> -#define swapcache_prepare(e) ({(is_migration_entry(e) || is_device_private_entry(e));})
> +/* used to sanity check ptes in zap_pte_range when CONFIG_SWAP=0 */
> +#define free_swap_and_cache(e) is_pfn_swap_entry(e)
>   
>   static inline int add_swap_count_continuation(swp_entry_t swp, gfp_t gfp_mask)
>   {
> diff --git a/include/linux/swapops.h b/include/linux/swapops.h
> index d9b7c9132c2f..3fd88081107c 100644
> --- a/include/linux/swapops.h
> +++ b/include/linux/swapops.h
> @@ -121,16 +121,6 @@ static inline bool is_write_device_private_entry(swp_entry_t entry)
>   {
>   	return unlikely(swp_type(entry) == SWP_DEVICE_WRITE);
>   }
> -
> -static inline unsigned long device_private_entry_to_pfn(swp_entry_t entry)
> -{
> -	return swp_offset(entry);
> -}
> -
> -static inline struct page *device_private_entry_to_page(swp_entry_t entry)
> -{
> -	return pfn_to_page(swp_offset(entry));
> -}
>   #else /* CONFIG_DEVICE_PRIVATE */
>   static inline swp_entry_t make_device_private_entry(struct page *page, bool write)
>   {
> @@ -150,16 +140,6 @@ static inline bool is_write_device_private_entry(swp_entry_t entry)
>   {
>   	return false;
>   }
> -
> -static inline unsigned long device_private_entry_to_pfn(swp_entry_t entry)
> -{
> -	return 0;
> -}
> -
> -static inline struct page *device_private_entry_to_page(swp_entry_t entry)
> -{
> -	return NULL;
> -}
>   #endif /* CONFIG_DEVICE_PRIVATE */
>   
>   #ifdef CONFIG_MIGRATION
> @@ -182,22 +162,6 @@ static inline int is_write_migration_entry(swp_entry_t entry)
>   	return unlikely(swp_type(entry) == SWP_MIGRATION_WRITE);
>   }
>   
> -static inline unsigned long migration_entry_to_pfn(swp_entry_t entry)
> -{
> -	return swp_offset(entry);
> -}
> -
> -static inline struct page *migration_entry_to_page(swp_entry_t entry)
> -{
> -	struct page *p = pfn_to_page(swp_offset(entry));
> -	/*
> -	 * Any use of migration entries may only occur while the
> -	 * corresponding page is locked
> -	 */
> -	BUG_ON(!PageLocked(compound_head(p)));
> -	return p;
> -}
> -
>   static inline void make_migration_entry_read(swp_entry_t *entry)
>   {
>   	*entry = swp_entry(SWP_MIGRATION_READ, swp_offset(*entry));
> @@ -217,16 +181,6 @@ static inline int is_migration_entry(swp_entry_t swp)
>   	return 0;
>   }
>   
> -static inline unsigned long migration_entry_to_pfn(swp_entry_t entry)
> -{
> -	return 0;
> -}
> -
> -static inline struct page *migration_entry_to_page(swp_entry_t entry)
> -{
> -	return NULL;
> -}
> -
>   static inline void make_migration_entry_read(swp_entry_t *entryp) { }
>   static inline void __migration_entry_wait(struct mm_struct *mm, pte_t *ptep,
>   					spinlock_t *ptl) { }
> @@ -241,6 +195,29 @@ static inline int is_write_migration_entry(swp_entry_t entry)
>   
>   #endif
>   
> +static inline struct page *pfn_swap_entry_to_page(swp_entry_t entry)
> +{
> +	struct page *p = pfn_to_page(swp_offset(entry));
> +
> +	/*
> +	 * Any use of migration entries may only occur while the
> +	 * corresponding page is locked
> +	 */
> +	BUG_ON(is_migration_entry(entry) && !PageLocked(compound_head(p)));
> +
> +	return p;
> +}
> +
> +/*
> + * A pfn swap entry is a special type of swap entry that always has a pfn stored
> + * in the swap offset. They are used to represent unaddressable device memory
> + * and to restrict access to a page undergoing migration.
> + */
> +static inline bool is_pfn_swap_entry(swp_entry_t entry)
> +{
> +	return is_migration_entry(entry) || is_device_private_entry(entry);
> +}
> +
>   struct page_vma_mapped_walk;
>   
>   #ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> diff --git a/mm/hmm.c b/mm/hmm.c
> index 943cb2ba4442..3b2dda71d0ed 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -214,7 +214,7 @@ static inline bool hmm_is_device_private_entry(struct hmm_range *range,
>   		swp_entry_t entry)
>   {
>   	return is_device_private_entry(entry) &&
> -		device_private_entry_to_page(entry)->pgmap->owner ==
> +		pfn_swap_entry_to_page(entry)->pgmap->owner ==
>   		range->dev_private_owner;
>   }
>   
> @@ -257,8 +257,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>   			cpu_flags = HMM_PFN_VALID;
>   			if (is_write_device_private_entry(entry))
>   				cpu_flags |= HMM_PFN_WRITE;
> -			*hmm_pfn = device_private_entry_to_pfn(entry) |
> -					cpu_flags;
> +			*hmm_pfn = swp_offset(entry) | cpu_flags;
>   			return 0;
>   		}
>   
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 91ca9b103ee5..d65eebf446ae 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -1695,7 +1695,7 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
>   
>   			VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
>   			entry = pmd_to_swp_entry(orig_pmd);
> -			page = pfn_to_page(swp_offset(entry));
> +			page = pfn_swap_entry_to_page(entry);
>   			flush_needed = 0;
>   		} else
>   			WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
> @@ -2103,7 +2103,7 @@ static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
>   		swp_entry_t entry;
>   
>   		entry = pmd_to_swp_entry(old_pmd);
> -		page = pfn_to_page(swp_offset(entry));
> +		page = pfn_swap_entry_to_page(entry);
>   		write = is_write_migration_entry(entry);
>   		young = false;
>   		soft_dirty = pmd_swp_soft_dirty(old_pmd);
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 913c2b9e5c72..9fa9ec9d0ace 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -5544,7 +5544,7 @@ static struct page *mc_handle_swap_pte(struct vm_area_struct *vma,
>   	 * as special swap entry in the CPU page table.
>   	 */
>   	if (is_device_private_entry(ent)) {
> -		page = device_private_entry_to_page(ent);
> +		page = pfn_swap_entry_to_page(ent);
>   		/*
>   		 * MEMORY_DEVICE_PRIVATE means ZONE_DEVICE page and which have
>   		 * a refcount of 1 when free (unlike normal page)
> diff --git a/mm/memory.c b/mm/memory.c
> index feff48e1465a..99a6a695b1b1 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -718,7 +718,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>   		}
>   		rss[MM_SWAPENTS]++;
>   	} else if (is_migration_entry(entry)) {
> -		page = migration_entry_to_page(entry);
> +		page = pfn_swap_entry_to_page(entry);
>   
>   		rss[mm_counter(page)]++;
>   
> @@ -737,7 +737,7 @@ copy_nonpresent_pte(struct mm_struct *dst_mm, struct mm_struct *src_mm,
>   			set_pte_at(src_mm, addr, src_pte, pte);
>   		}
>   	} else if (is_device_private_entry(entry)) {
> -		page = device_private_entry_to_page(entry);
> +		page = pfn_swap_entry_to_page(entry);
>   
>   		/*
>   		 * Update rss count even for unaddressable pages, as
> @@ -1274,7 +1274,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>   
>   		entry = pte_to_swp_entry(ptent);
>   		if (is_device_private_entry(entry)) {
> -			struct page *page = device_private_entry_to_page(entry);
> +			struct page *page = pfn_swap_entry_to_page(entry);
>   
>   			if (unlikely(details && details->check_mapping)) {
>   				/*
> @@ -1303,7 +1303,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>   		else if (is_migration_entry(entry)) {
>   			struct page *page;
>   
> -			page = migration_entry_to_page(entry);
> +			page = pfn_swap_entry_to_page(entry);
>   			rss[mm_counter(page)]--;
>   		}
>   		if (unlikely(!free_swap_and_cache(entry)))
> @@ -3271,7 +3271,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>   			migration_entry_wait(vma->vm_mm, vmf->pmd,
>   					     vmf->address);
>   		} else if (is_device_private_entry(entry)) {
> -			vmf->page = device_private_entry_to_page(entry);
> +			vmf->page = pfn_swap_entry_to_page(entry);
>   			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
>   		} else if (is_hwpoison_entry(entry)) {
>   			ret = VM_FAULT_HWPOISON;
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 20ca887ea769..39246907eac3 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -321,7 +321,7 @@ void __migration_entry_wait(struct mm_struct *mm, pte_t *ptep,
>   	if (!is_migration_entry(entry))
>   		goto out;
>   
> -	page = migration_entry_to_page(entry);
> +	page = pfn_swap_entry_to_page(entry);
>   
>   	/*
>   	 * Once page cache replacement of page migration started, page_count
> @@ -361,7 +361,7 @@ void pmd_migration_entry_wait(struct mm_struct *mm, pmd_t *pmd)
>   	ptl = pmd_lock(mm, pmd);
>   	if (!is_pmd_migration_entry(*pmd))
>   		goto unlock;
> -	page = migration_entry_to_page(pmd_to_swp_entry(*pmd));
> +	page = pfn_swap_entry_to_page(pmd_to_swp_entry(*pmd));
>   	if (!get_page_unless_zero(page))
>   		goto unlock;
>   	spin_unlock(ptl);
> @@ -2437,7 +2437,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>   			if (!is_device_private_entry(entry))
>   				goto next;
>   
> -			page = device_private_entry_to_page(entry);
> +			page = pfn_swap_entry_to_page(entry);
>   			if (!(migrate->flags &
>   				MIGRATE_VMA_SELECT_DEVICE_PRIVATE) ||
>   			    page->pgmap->owner != migrate->pgmap_owner)
> diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
> index 86e3a3688d59..eed988ab2e81 100644
> --- a/mm/page_vma_mapped.c
> +++ b/mm/page_vma_mapped.c
> @@ -96,7 +96,7 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
>   		if (!is_migration_entry(entry))
>   			return false;
>   
> -		pfn = migration_entry_to_pfn(entry);
> +		pfn = swp_offset(entry);
>   	} else if (is_swap_pte(*pvmw->pte)) {
>   		swp_entry_t entry;
>   
> @@ -105,7 +105,7 @@ static bool check_pte(struct page_vma_mapped_walk *pvmw)
>   		if (!is_device_private_entry(entry))
>   			return false;
>   
> -		pfn = device_private_entry_to_pfn(entry);
> +		pfn = swp_offset(entry);
>   	} else {
>   		if (!pte_present(*pvmw->pte))
>   			return false;
> @@ -200,7 +200,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
>   				if (is_migration_entry(pmd_to_swp_entry(*pvmw->pmd))) {
>   					swp_entry_t entry = pmd_to_swp_entry(*pvmw->pmd);
>   
> -					if (migration_entry_to_page(entry) != page)
> +					if (pfn_swap_entry_to_page(entry) != page)
>   						return not_found(pvmw);
>   					return true;
>   				}
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
