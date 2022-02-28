Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0CCF4C7DA0
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 23:41:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D232010E93F;
	Mon, 28 Feb 2022 22:41:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2063.outbound.protection.outlook.com [40.107.220.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2ADCB10E403;
 Mon, 28 Feb 2022 22:41:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hiLetiZ2S2IQCMsSWH2a/VFK+GlmusqNpk3GZbEMSmdQFu1fQZYyk1uamnSdzX57KPt+bgwDaDJ9WrINwqEiydC5HKVhyPaNqS3DnFINNV3msyYpQvrEWVoK5s8Co59UGbJ4DRkFTsynDjNNRC6Fv76JvqrVafYyju2RDcYRpAb8KbMl0vIutnHTBZkQ6VT5cZB/aXDK2OmTKKDFY2WG7W+5AXM1vCtJ8441fYexQf97E9G9xqhQyU2P2asX+58w/0x+Xeu93me9a2sVimIOwwAyXba18XgK8H8s3FBhWjGUpPfuxZUqdHkJ8sBoD3rBRZK1WrjlU+CpJvNQuGpJHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=04MTcFRaXOySzwREPAl+oFi5WlVa5dkDON/2+XG9Jv8=;
 b=AbBwe1XfbMxO8CbFt7CvCYJeNnMzFy+9/cG/+yBnkK3Kq4QyAYGijpWJhQLFD5TL+wJgpeRLUN3FC1v8ZWgqsmxX+9Aa8xD5Y37eftNO7znZjNm3KyX4X2zLdQChHSgmcbVCcWFKMH29xwV2RaHpvkFQ55PqR3OuEhWT4Ztkozhiy6dKnRYZHYbs/IQ4gwzV/M4qfRwLBR2MC/DNSq0w1RKrVvI/vGtMLOgO8JZcOXdPO/rRv0TCFU4bUur8U7VzdnsK0IyXq6G0L6Nty+Ln0tagFkZ78zFeqIkOL2EMTkXBPIITyS67CDQprUOOy0cXMTgMbaUKAjoxaI1ZwFxwDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=04MTcFRaXOySzwREPAl+oFi5WlVa5dkDON/2+XG9Jv8=;
 b=UgbadUc1HJSKIy8920f8iuXcp7m33wJdmIBPNPVc0mVhLxRT2HsRNUoeGf+hzdYf8MWp56VIq9QTpJTJWQK54N6nvQB5AfeuPP4hFL6FPAUYK8eJ0RWac4vrFKA+5sBWY5xmpGklOcFik4E7/ALDDYU4uQraTHFn6oDFqOFgWLs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by SN1PR12MB2559.namprd12.prod.outlook.com (2603:10b6:802:29::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.23; Mon, 28 Feb
 2022 22:41:35 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::410c:b456:62cb:e3f]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::410c:b456:62cb:e3f%5]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 22:41:35 +0000
Message-ID: <e673332f-b35c-3774-49e3-994b8f885622@amd.com>
Date: Mon, 28 Feb 2022 17:41:32 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] mm: split vm_normal_pages for LRU and non-LRU handling
Content-Language: en-US
To: Alex Sierra <alex.sierra@amd.com>, jgg@nvidia.com
References: <20220218192640.GV4160@nvidia.com>
 <20220228203401.7155-1-alex.sierra@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20220228203401.7155-1-alex.sierra@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH0P220CA0002.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:610:ef::14) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87066c09-d917-473e-ed8e-08d9fb0b7963
X-MS-TrafficTypeDiagnostic: SN1PR12MB2559:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB25593015F5244D9F27D64D5792019@SN1PR12MB2559.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pZuqfCJqQZ5WisgtlQjeJ7WzMJGPeDLf3BzU1gO+lbhdDoKit7QauqLK9MGFXeXcKa/RZ5EMDFJBgoty4/H4uWswySVONJjYQURb1ezJQhtSdxOrtD05g7PC/z7h3WCMC2KreBK0g5nRRkuhTLXeXEAl9ou1O9MZZbMCiQfLy2nsu73Qkc1njfW5qRX9qokMypXviO2iEAxKKT6MA2NvjG9pl2PZr6FVlyPHUjHsZPcf+I2lLxtpu9gWyZZbrCLhSNjD9F0A+DSSA1VK3Sj7tSuYiT/h/TFcJH+rkJPkvFGmomi46MdnbhPp5fCkBBRFtPtqlFLk2kL+Qrl286baaBvNRDcuwSO0udmaWaepSXBM+Dvb5x4fPpeG/yxqUS8kShEC7rapEi6iTqJ+F1tiPTtMJ35pMRkHMonLvRrpUvd77Y/U7CHwY4LoJPPRsW7QlChlE/Q1KXPLYJ17kwLbF7jlnlp9okGYtV5+u1TSlDFq52O9tumvbzdXsvTmL6KsVpdZiN47F4bEXekQBRtOKvFXwjeGBtCYpK/S2KGeplgmdAusi8U8CoDj3tXJr4qWm6uKnS5Zzop9Fra6GtwY/AbWJwEO6uFt3hLdfprPOJMLxFGoJ25VLoJi56oGt48weAnLzkQw11HDvyV8bx8uCvT0DhmEYLgKSJmY4XA8BDfJUg0ekTEoqLt3BMg+9jA+AmYOqo3BMOcw1tdyFAYbZNW/JD834frGCb9upVEodnU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2906002)(8676002)(4326008)(66946007)(508600001)(31686004)(6486002)(66556008)(66476007)(30864003)(8936002)(5660300002)(7416002)(36756003)(2616005)(6666004)(36916002)(53546011)(316002)(44832011)(6506007)(6512007)(38100700002)(186003)(83380400001)(26005)(86362001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXpkSDFWRjdvakFlelJGcDZmYUNsNjdOZGlZQmg4K0ZGKzVpUDd2VFgxK1My?=
 =?utf-8?B?THFoRHFzWjFKRmluOXM4ZS96KzZDN3lHa05yczN1dHhGRXhvTEpJVUN6OHhP?=
 =?utf-8?B?TEt4ZDVXYkxGYkJKWS9SZjJtQm9tMS9JbnhIMXVkRi9QaFVnSFVtakFDVlI2?=
 =?utf-8?B?VzlPd1BYbWt5Z2NmUFFYVSsybm5GdHRETjRUM2k5VTNuTUJ1eHFWZHFrRGx1?=
 =?utf-8?B?dVdtYm4wRkJSTHVhK3VJWnV5SWpFT05PUW03VkJ6NHhWbzdZT08xWFI0dFh4?=
 =?utf-8?B?Qk1RS1AxakkrSVA2T251R01QSDVoV2dibjNFejFhaXdGSThscG5JZUt6UGk5?=
 =?utf-8?B?VEp3Q05pNGJuQ3cwaUNaaUpPY1NCWVozM0IvNGx2S1ZmS0E0VlFEbTloVkp1?=
 =?utf-8?B?azJPalF1dm12ZGlENUFvTC90SXhWSzg2NEViUitXMURxeWlmaHlVbmk5cVF0?=
 =?utf-8?B?Zk5WZ01Yc0t1WXVDM2FZenBMMzZqcEhZRG1KTk5Jamlqck1hZVkyYUkrZTI0?=
 =?utf-8?B?Q1lYaGc0YXRXVGtKWHFHOUJrdzlyQUZZdU9pd1hNVVlkYnZ3UklQY3RCNXdm?=
 =?utf-8?B?L24vamNtZkQzK1N1WWRicENyMjFpa0wrdCs0Q1hLSzVVMkZOZzY1SkVCNlY5?=
 =?utf-8?B?WnVNV3JGdFFudGdMTEU4R2k1QzNDdmMyYXc4dUxzSno1VmVQVFZ2QXgyQS9T?=
 =?utf-8?B?akh6SEdTbmRKQ25FN2RmZ3IyaUJLMTl1TUlCc1QreGJXZUF2RVBqT3gzVVBM?=
 =?utf-8?B?a1l3RlBTZ3dYVUN3cDk3WDdld2J3bVF6UW9SdDBCL1ZvQ1RoUnY3ajkyNW1N?=
 =?utf-8?B?QXR3UlVoZlNnTk5VeEhnNEM5REhtRU1IaTlxQUlPN1NucEtUa1hhNlY2ZXJo?=
 =?utf-8?B?K0ROeU54cldFZ3REMzhMbUVXbDh5b0QyajVtOFcxUllWRHdUSllYclgyK3dG?=
 =?utf-8?B?WThHMnFJM0dMYVFmYTJpWDZFZVRMQ1pUWERWejdRVDk5cE0wVzBNbUFqM1N6?=
 =?utf-8?B?ZS9lUHE2WmNuUGxkR0Z5MEYyZ1o4SkxDQWJsYW4wMjNuWlo2ejMvSXRUK1I3?=
 =?utf-8?B?SDVJOW95ODJ6MytLMEk5WTkzQ0sybEZRWEExSzZONW5MeGR4R2cyT3VYTVZq?=
 =?utf-8?B?UENqL0lydjZZcDlFckFYeHpGY0dJb0M4OUJDcDVwMll1emFBenI3R2xjT09H?=
 =?utf-8?B?SHZnU25HUTJOWWplOC9aMkdwZ3k3TE5laWJYalljU3hSb3dUVHh3QldhLzR5?=
 =?utf-8?B?L2RFcWNVZEdqbzlUQks5RzhBOFhGNVJCcjdaR1lzc3BSUjBmRXk2a3N4SlBj?=
 =?utf-8?B?clBGSS8yeWRINnVMY0xoQjgzTGl2VUNKeVFUVFpQQVNIMi90aUdZMm1ZWmRr?=
 =?utf-8?B?dlh3OEhNK3ZZRTNabVVyaU92cTRiMjhZOEZlSURLd1E1NytqRUIrQitLV1Yw?=
 =?utf-8?B?U2wxMUlVMlBzQnRjSEV2WWFabm9NRkNmdTdLOVFKd0htcDE4TDdpVmNoeFdt?=
 =?utf-8?B?QWxaeFNrZlA0NFVCWG9paG1Jb3JJMFFXVTltSWIzNzBqSVJpVnFGdG83N3hU?=
 =?utf-8?B?anVNbGJFS0RhdndyNGQzelQ1dEZ1UzlXRTh0RW1XNHNxOG9KRkJiY2ZiQUdL?=
 =?utf-8?B?OXF1UDJHU0MxdHl0WUhvRDZ3VW1ZSEFueDFLY0Nhb0h0UUJuWndNcUdYREF2?=
 =?utf-8?B?TlFmUEU3S0VuRDRkQlhaeEp1ZlFzVzBoRHFzY1BSUHNvTHZKQU5kNlV5RjlW?=
 =?utf-8?B?bXQ5T1VDNy84N1E0dDlYWFF5ckhpVmxrbGNXa2lpbTFJMG5FdTR5bEtUVkNN?=
 =?utf-8?B?S3g5RTE5TlZSVVhHM3NqNTZ6MHpkNTJic0hCeGdYeHlxQVlwOVNaZGlEWWxl?=
 =?utf-8?B?Wk5qM2RWUWgxY1FnRjh5eHRDUXdoSi9hNENBU3J1em9nYlY2WjJ1MkpKUWM5?=
 =?utf-8?B?am95QzZVbG1ENENLQVFKaUtVMlpVRVdmMnRVdWx2S0UwYTM4Rnk1WVFQcFFK?=
 =?utf-8?B?ZjRUQ2RXZXVNVDFmNlFXTExEYi9PWFp0MlNMalJFcUtuQ1ROV0lGeDZSQUxx?=
 =?utf-8?B?enJlRXl6L0x5Zi9OWS80MC9CQ2Rrb0NYQlNzQzZJenh1MG9zeUcrZTBYL3hB?=
 =?utf-8?B?K1UzenJUR1ZQRzJSczNjcmxPa3VDNW1rVFdZK0Y2Q0V5Z3czT2xXb2VoMEdN?=
 =?utf-8?Q?MIDKa7uYdKSCDuwSlIA/iPk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87066c09-d917-473e-ed8e-08d9fb0b7963
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 22:41:35.0701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qS4j4rIE0rrT58bi9ELcFz539J4Zsuabdt/qoJiG6HpV8q+hz4ud3Vs+ZU2tfsQxKHPrqvA6XfB8qGXgwy7ngw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2559
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
Cc: rcampbell@nvidia.com, willy@infradead.org, david@redhat.com,
 apopple@nvidia.com, amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-02-28 15:34, Alex Sierra wrote:
> DEVICE_COHERENT pages introduce a subtle distinction in the way
> "normal" pages can be used by various callers throughout the kernel.
> They behave like normal pages for purposes of mapping in CPU page
> tables, and for COW. But they do not support LRU lists, NUMA
> migration or THP.

Should have mentioned KSM here as well for completeness.


>   Therefore we split vm_normal_page into two
> functions vm_normal_any_page and vm_normal_lru_page. The latter will
> only return pages that can be put on an LRU list and that support
> NUMA migration and THP.
>
> We also introduced a FOLL_LRU flag that adds the same behaviour to
> follow_page and related APIs, to allow callers to specify that they
> expect to put pages on an LRU list.
>
> Signed-off-by: Alex Sierra <alex.sierra@amd.com>

Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>

FWIW. Full disclosure, Alex and I worked on this together, but it's a 
bit like the blind leading the blind. ;) It's mostly untested at this 
point. Alex is working on adding tests for get_user_pages of 
DEVICE_COHERENT pages without FOLL_LONGTERM to test_hmm and also a test 
for COW of DEVICE_COHERENT pages.

A few more nit-picks inline.


> ---
>   fs/proc/task_mmu.c  | 12 +++++-----
>   include/linux/mm.h  | 53 ++++++++++++++++++++++++---------------------
>   mm/gup.c            | 10 +++++----
>   mm/hmm.c            |  2 +-
>   mm/huge_memory.c    |  2 +-
>   mm/khugepaged.c     |  8 +++----
>   mm/ksm.c            |  4 ++--
>   mm/madvise.c        |  4 ++--
>   mm/memcontrol.c     |  2 +-
>   mm/memory.c         | 38 ++++++++++++++++++++++----------
>   mm/mempolicy.c      |  4 ++--
>   mm/migrate.c        |  2 +-
>   mm/migrate_device.c |  2 +-
>   mm/mlock.c          |  6 ++---
>   mm/mprotect.c       |  2 +-
>   15 files changed, 85 insertions(+), 66 deletions(-)
>
> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
> index 18f8c3acbb85..4274128fbb4c 100644
> --- a/fs/proc/task_mmu.c
> +++ b/fs/proc/task_mmu.c
> @@ -519,7 +519,7 @@ static void smaps_pte_entry(pte_t *pte, unsigned long addr,
>   	struct page *page = NULL;
>   
>   	if (pte_present(*pte)) {
> -		page = vm_normal_page(vma, addr, *pte);
> +		page = vm_normal_any_page(vma, addr, *pte);
>   	} else if (is_swap_pte(*pte)) {
>   		swp_entry_t swpent = pte_to_swp_entry(*pte);
>   
> @@ -705,7 +705,7 @@ static int smaps_hugetlb_range(pte_t *pte, unsigned long hmask,
>   	struct page *page = NULL;
>   
>   	if (pte_present(*pte)) {
> -		page = vm_normal_page(vma, addr, *pte);
> +		page = vm_normal_any_page(vma, addr, *pte);
>   	} else if (is_swap_pte(*pte)) {
>   		swp_entry_t swpent = pte_to_swp_entry(*pte);
>   
> @@ -1059,7 +1059,7 @@ static inline bool pte_is_pinned(struct vm_area_struct *vma, unsigned long addr,
>   		return false;
>   	if (likely(!test_bit(MMF_HAS_PINNED, &vma->vm_mm->flags)))
>   		return false;
> -	page = vm_normal_page(vma, addr, pte);
> +	page = vm_normal_any_page(vma, addr, pte);
>   	if (!page)
>   		return false;
>   	return page_maybe_dma_pinned(page);
> @@ -1172,7 +1172,7 @@ static int clear_refs_pte_range(pmd_t *pmd, unsigned long addr,
>   		if (!pte_present(ptent))
>   			continue;
>   
> -		page = vm_normal_page(vma, addr, ptent);
> +		page = vm_normal_any_page(vma, addr, ptent);
>   		if (!page)
>   			continue;
>   
> @@ -1383,7 +1383,7 @@ static pagemap_entry_t pte_to_pagemap_entry(struct pagemapread *pm,
>   		if (pm->show_pfn)
>   			frame = pte_pfn(pte);
>   		flags |= PM_PRESENT;
> -		page = vm_normal_page(vma, addr, pte);
> +		page = vm_normal_any_page(vma, addr, pte);
>   		if (pte_soft_dirty(pte))
>   			flags |= PM_SOFT_DIRTY;
>   		if (pte_uffd_wp(pte))
> @@ -1761,7 +1761,7 @@ static struct page *can_gather_numa_stats(pte_t pte, struct vm_area_struct *vma,
>   	if (!pte_present(pte))
>   		return NULL;
>   
> -	page = vm_normal_page(vma, addr, pte);
> +	page = vm_normal_lru_page(vma, addr, pte);
>   	if (!page)
>   		return NULL;
>   
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index ff9f149ca201..8c9f87151d93 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -593,8 +593,8 @@ struct vm_operations_struct {
>   					unsigned long addr);
>   #endif
>   	/*
> -	 * Called by vm_normal_page() for special PTEs to find the
> -	 * page for @addr.  This is useful if the default behavior
> +	 * Called by vm_normal_x_page() for special PTEs to find the

I'd use vm_normal_*_page in these comments to avoid confusion, because 
vm_normal_x_page is actually a valid symbol name, which doesn't exist.


> +	 * page for @addr. This is useful if the default behavior
>   	 * (using pte_page()) would not find the correct page.
>   	 */
>   	struct page *(*find_special_page)(struct vm_area_struct *vma,
> @@ -1781,7 +1781,9 @@ static inline bool can_do_mlock(void) { return false; }
>   extern int user_shm_lock(size_t, struct ucounts *);
>   extern void user_shm_unlock(size_t, struct ucounts *);
>   
> -struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
> +struct page *vm_normal_any_page(struct vm_area_struct *vma, unsigned long addr,
> +			     pte_t pte);
> +struct page *vm_normal_lru_page(struct vm_area_struct *vma, unsigned long addr,
>   			     pte_t pte);
>   struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
>   				pmd_t pmd);
> @@ -2880,27 +2882,28 @@ static inline vm_fault_t vmf_error(int err)
>   struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
>   			 unsigned int foll_flags);
>   
> -#define FOLL_WRITE	0x01	/* check pte is writable */
> -#define FOLL_TOUCH	0x02	/* mark page accessed */
> -#define FOLL_GET	0x04	/* do get_page on page */
> -#define FOLL_DUMP	0x08	/* give error on hole if it would be zero */
> -#define FOLL_FORCE	0x10	/* get_user_pages read/write w/o permission */
> -#define FOLL_NOWAIT	0x20	/* if a disk transfer is needed, start the IO
> -				 * and return without waiting upon it */
> -#define FOLL_POPULATE	0x40	/* fault in pages (with FOLL_MLOCK) */
> -#define FOLL_NOFAULT	0x80	/* do not fault in pages */
> -#define FOLL_HWPOISON	0x100	/* check page is hwpoisoned */
> -#define FOLL_NUMA	0x200	/* force NUMA hinting page fault */
> -#define FOLL_MIGRATION	0x400	/* wait for page to replace migration entry */
> -#define FOLL_TRIED	0x800	/* a retry, previous pass started an IO */
> -#define FOLL_MLOCK	0x1000	/* lock present pages */
> -#define FOLL_REMOTE	0x2000	/* we are working on non-current tsk/mm */
> -#define FOLL_COW	0x4000	/* internal GUP flag */
> -#define FOLL_ANON	0x8000	/* don't do file mappings */
> -#define FOLL_LONGTERM	0x10000	/* mapping lifetime is indefinite: see below */
> -#define FOLL_SPLIT_PMD	0x20000	/* split huge pmd before returning */
> -#define FOLL_PIN	0x40000	/* pages must be released via unpin_user_page */
> -#define FOLL_FAST_ONLY	0x80000	/* gup_fast: prevent fall-back to slow gup */
> +#define FOLL_WRITE	0x01	 /* check pte is writable */
> +#define FOLL_TOUCH	0x02	 /* mark page accessed */
> +#define FOLL_GET	0x04	 /* do get_page on page */
> +#define FOLL_DUMP	0x08	 /* give error on hole if it would be zero */
> +#define FOLL_FORCE	0x10	 /* get_user_pages read/write w/o permission */
> +#define FOLL_NOWAIT	0x20	 /* if a disk transfer is needed, start the IO
> +				  * and return without waiting upon it */
> +#define FOLL_POPULATE	0x40	 /* fault in pages (with FOLL_MLOCK) */
> +#define FOLL_NOFAULT	0x80	 /* do not fault in pages */
> +#define FOLL_HWPOISON	0x100	 /* check page is hwpoisoned */
> +#define FOLL_NUMA	0x200	 /* force NUMA hinting page fault */
> +#define FOLL_MIGRATION	0x400	 /* wait for page to replace migration entry */
> +#define FOLL_TRIED	0x800	 /* a retry, previous pass started an IO */
> +#define FOLL_MLOCK	0x1000	 /* lock present pages */
> +#define FOLL_REMOTE	0x2000	 /* we are working on non-current tsk/mm */
> +#define FOLL_COW	0x4000	 /* internal GUP flag */
> +#define FOLL_ANON	0x8000	 /* don't do file mappings */
> +#define FOLL_LONGTERM	0x10000	 /* mapping lifetime is indefinite: see below */
> +#define FOLL_SPLIT_PMD	0x20000	 /* split huge pmd before returning */
> +#define FOLL_PIN	0x40000	 /* pages must be released via unpin_user_page */
> +#define FOLL_FAST_ONLY	0x80000	 /* gup_fast: prevent fall-back to slow gup */
> +#define FOLL_LRU	0x100000 /* return only LRU (anon or page cache) */
>   
>   /*
>    * FOLL_PIN and FOLL_LONGTERM may be used in various combinations with each
> @@ -3227,7 +3230,7 @@ extern long copy_huge_page_from_user(struct page *dst_page,
>    * @vma: Pointer to the struct vm_area_struct to consider
>    *
>    * Whether transhuge page-table entries are considered "special" following
> - * the definition in vm_normal_page().
> + * the definition in vm_normal_x_page().

vm_normal_*_page


>    *
>    * Return: true if transhuge page-table entries should be considered special,
>    * false otherwise.
> diff --git a/mm/gup.c b/mm/gup.c
> index 41349b685eaf..9e172c906ded 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -539,8 +539,10 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>   		pte_unmap_unlock(ptep, ptl);
>   		return NULL;
>   	}
> -
> -	page = vm_normal_page(vma, address, pte);
> +	if (flags & (FOLL_MLOCK | FOLL_LRU))
> +		page = vm_normal_lru_page(vma, address, pte);
> +	else
> +		page = vm_normal_any_page(vma, address, pte);
>   	if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN))) {
>   		/*
>   		 * Only return device mapping pages in the FOLL_GET or FOLL_PIN
> @@ -824,7 +826,7 @@ static struct page *follow_p4d_mask(struct vm_area_struct *vma,
>    *
>    * Return: the mapped (struct page *), %NULL if no mapping exists, or
>    * an error pointer if there is a mapping to something not represented
> - * by a page descriptor (see also vm_normal_page()).
> + * by a page descriptor (see also vm_normal_x_page()).

vm_normal_*_page


>    */
>   static struct page *follow_page_mask(struct vm_area_struct *vma,
>   			      unsigned long address, unsigned int flags,
> @@ -917,7 +919,7 @@ static int get_gate_page(struct mm_struct *mm, unsigned long address,
>   	*vma = get_gate_vma(mm);
>   	if (!page)
>   		goto out;
> -	*page = vm_normal_page(*vma, address, *pte);
> +	*page = vm_normal_any_page(*vma, address, *pte);
>   	if (!*page) {
>   		if ((gup_flags & FOLL_DUMP) || !is_zero_pfn(pte_pfn(*pte)))
>   			goto unmap;
> diff --git a/mm/hmm.c b/mm/hmm.c
> index bd56641c79d4..90c949d66712 100644
> --- a/mm/hmm.c
> +++ b/mm/hmm.c
> @@ -300,7 +300,7 @@ static int hmm_vma_handle_pte(struct mm_walk *walk, unsigned long addr,
>   	 * Since each architecture defines a struct page for the zero page, just
>   	 * fall through and treat it like a normal page.
>   	 */
> -	if (!vm_normal_page(walk->vma, addr, pte) &&
> +	if (!vm_normal_any_page(walk->vma, addr, pte) &&
>   	    !pte_devmap(pte) &&
>   	    !is_zero_pfn(pte_pfn(pte))) {
>   		if (hmm_pte_need_fault(hmm_vma_walk, pfn_req_flags, 0)) {
> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> index 406a3c28c026..ea1efc825774 100644
> --- a/mm/huge_memory.c
> +++ b/mm/huge_memory.c
> @@ -2966,7 +2966,7 @@ static int split_huge_pages_pid(int pid, unsigned long vaddr_start,
>   		}
>   
>   		/* FOLL_DUMP to ignore special (like zero) pages */
> -		follflags = FOLL_GET | FOLL_DUMP;
> +		follflags = FOLL_GET | FOLL_DUMP | FOLL_LRU;
>   		page = follow_page(vma, addr, follflags);
>   
>   		if (IS_ERR(page))
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 131492fd1148..a7153db09afa 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -627,7 +627,7 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
>   			result = SCAN_PTE_NON_PRESENT;
>   			goto out;
>   		}
> -		page = vm_normal_page(vma, address, pteval);
> +		page = vm_normal_lru_page(vma, address, pteval);
>   		if (unlikely(!page)) {
>   			result = SCAN_PAGE_NULL;
>   			goto out;
> @@ -1286,7 +1286,7 @@ static int khugepaged_scan_pmd(struct mm_struct *mm,
>   		if (pte_write(pteval))
>   			writable = true;
>   
> -		page = vm_normal_page(vma, _address, pteval);
> +		page = vm_normal_lru_page(vma, _address, pteval);
>   		if (unlikely(!page)) {
>   			result = SCAN_PAGE_NULL;
>   			goto out_unmap;
> @@ -1494,7 +1494,7 @@ void collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr)
>   		if (!pte_present(*pte))
>   			goto abort;
>   
> -		page = vm_normal_page(vma, addr, *pte);
> +		page = vm_normal_lru_page(vma, addr, *pte);
>   
>   		/*
>   		 * Note that uprobe, debugger, or MAP_PRIVATE may change the
> @@ -1512,7 +1512,7 @@ void collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr)
>   
>   		if (pte_none(*pte))
>   			continue;
> -		page = vm_normal_page(vma, addr, *pte);
> +		page = vm_normal_lru_page(vma, addr, *pte);
>   		page_remove_rmap(page, false);
>   	}
>   
> diff --git a/mm/ksm.c b/mm/ksm.c
> index c20bd4d9a0d9..352d37e44694 100644
> --- a/mm/ksm.c
> +++ b/mm/ksm.c
> @@ -474,7 +474,7 @@ static int break_ksm(struct vm_area_struct *vma, unsigned long addr)
>   	do {
>   		cond_resched();
>   		page = follow_page(vma, addr,
> -				FOLL_GET | FOLL_MIGRATION | FOLL_REMOTE);
> +				FOLL_GET | FOLL_MIGRATION | FOLL_REMOTE | FOLL_LRU);
>   		if (IS_ERR_OR_NULL(page))
>   			break;
>   		if (PageKsm(page))
> @@ -559,7 +559,7 @@ static struct page *get_mergeable_page(struct rmap_item *rmap_item)
>   	if (!vma)
>   		goto out;
>   
> -	page = follow_page(vma, addr, FOLL_GET);
> +	page = follow_page(vma, addr, FOLL_GET | FOLL_LRU);
>   	if (IS_ERR_OR_NULL(page))
>   		goto out;
>   	if (PageAnon(page)) {
> diff --git a/mm/madvise.c b/mm/madvise.c
> index 5604064df464..1a553aad9aa3 100644
> --- a/mm/madvise.c
> +++ b/mm/madvise.c
> @@ -439,7 +439,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>   		if (!pte_present(ptent))
>   			continue;
>   
> -		page = vm_normal_page(vma, addr, ptent);
> +		page = vm_normal_lru_page(vma, addr, ptent);
>   		if (!page)
>   			continue;
>   
> @@ -649,7 +649,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>   			continue;
>   		}
>   
> -		page = vm_normal_page(vma, addr, ptent);
> +		page = vm_normal_lru_page(vma, addr, ptent);
>   		if (!page)
>   			continue;
>   
> diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> index 10259c35fde2..9677eb27dea8 100644
> --- a/mm/memcontrol.c
> +++ b/mm/memcontrol.c
> @@ -5476,7 +5476,7 @@ enum mc_target_type {
>   static struct page *mc_handle_present_pte(struct vm_area_struct *vma,
>   						unsigned long addr, pte_t ptent)
>   {
> -	struct page *page = vm_normal_page(vma, addr, ptent);
> +	struct page *page = vm_normal_any_page(vma, addr, ptent);
>   
>   	if (!page || !page_mapped(page))
>   		return NULL;
> diff --git a/mm/memory.c b/mm/memory.c
> index c125c4969913..cff84e6a6c4b 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -565,7 +565,7 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
>   }
>   
>   /*
> - * vm_normal_page -- This function gets the "struct page" associated with a pte.
> + * vm_normal_any_page -- This function gets the "struct page" associated with a pte.
>    *
>    * "Special" mappings do not wish to be associated with a "struct page" (either
>    * it doesn't exist, or it exists but they don't want to touch it). In this
> @@ -606,7 +606,7 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
>    * PFNMAP mappings in order to support COWable mappings.
>    *
>    */
> -struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
> +struct page *vm_normal_any_page(struct vm_area_struct *vma, unsigned long addr,
>   			    pte_t pte)
>   {
>   	unsigned long pfn = pte_pfn(pte);
> @@ -620,8 +620,6 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
>   			return NULL;
>   		if (is_zero_pfn(pfn))
>   			return NULL;
> -		if (pte_devmap(pte))
> -			return NULL;
>   
>   		print_bad_pte(vma, addr, pte, NULL);
>   		return NULL;
> @@ -661,6 +659,22 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
>   	return pfn_to_page(pfn);
>   }
>   
> +/*
> + * vm_normal_lru_page -- This function gets the "struct page" associated
> + * with a pte only for page cache and anon page. These pages are LRU handled.
> + */
> +struct page *vm_normal_lru_page(struct vm_area_struct *vma, unsigned long addr,
> +			    pte_t pte)
> +{
> +	struct page *page;
> +
> +	page = vm_normal_any_page(vma, addr, pte);
> +	if (is_zone_device_page(page))
> +		return NULL;
> +
> +	return page;
> +}
> +
>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>   struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
>   				pmd_t pmd)
> @@ -670,7 +684,7 @@ struct page *vm_normal_page_pmd(struct vm_area_struct *vma, unsigned long addr,
>   	/*
>   	 * There is no pmd_special() but there may be special pmds, e.g.
>   	 * in a direct-access (dax) mapping, so let's just replicate the
> -	 * !CONFIG_ARCH_HAS_PTE_SPECIAL case from vm_normal_page() here.
> +	 * !CONFIG_ARCH_HAS_PTE_SPECIAL case from vm_normal_any_page() here.
>   	 */
>   	if (unlikely(vma->vm_flags & (VM_PFNMAP|VM_MIXEDMAP))) {
>   		if (vma->vm_flags & VM_MIXEDMAP) {
> @@ -946,7 +960,7 @@ copy_present_pte(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
>   	pte_t pte = *src_pte;
>   	struct page *page;
>   
> -	page = vm_normal_page(src_vma, addr, pte);
> +	page = vm_normal_any_page(src_vma, addr, pte);
>   	if (page) {
>   		int retval;
>   
> @@ -1358,7 +1372,7 @@ static unsigned long zap_pte_range(struct mmu_gather *tlb,
>   		if (pte_present(ptent)) {
>   			struct page *page;
>   
> -			page = vm_normal_page(vma, addr, ptent);
> +			page = vm_normal_any_page(vma, addr, ptent);
>   			if (unlikely(zap_skip_check_mapping(details, page)))
>   				continue;
>   			ptent = ptep_get_and_clear_full(mm, addr, pte,
> @@ -2168,7 +2182,7 @@ EXPORT_SYMBOL(vmf_insert_pfn);
>   
>   static bool vm_mixed_ok(struct vm_area_struct *vma, pfn_t pfn)
>   {
> -	/* these checks mirror the abort conditions in vm_normal_page */
> +	/* these checks mirror the abort conditions in vm_normal_lru_page */
>   	if (vma->vm_flags & VM_MIXEDMAP)
>   		return true;
>   	if (pfn_t_devmap(pfn))

If this is to match the new vm_normal_lru_page, it should replace "if 
(pfn_t_devmap(pfn))" with a check that the page is not a device page. 
But for that it would have to actually look up the struct page.

I'm not sure what to do about this. __vm_insert_mixed still does 
something special with devmap pages, which no longer matches 
vm_normal_*_page.


> @@ -2198,7 +2212,7 @@ static vm_fault_t __vm_insert_mixed(struct vm_area_struct *vma,
>   
>   	/*
>   	 * If we don't have pte special, then we have to use the pfn_valid()
> -	 * based VM_MIXEDMAP scheme (see vm_normal_page), and thus we *must*
> +	 * based VM_MIXEDMAP scheme (see vm_normal_any_page), and thus we *must*
>   	 * refcount the page if pfn_valid is true (hence insert_page rather
>   	 * than insert_pfn).  If a zero_pfn were inserted into a VM_MIXEDMAP
>   	 * without pte special, it would there be refcounted as a normal page.
> @@ -2408,7 +2422,7 @@ int remap_pfn_range_notrack(struct vm_area_struct *vma, unsigned long addr,
>   	 * There's a horrible special case to handle copy-on-write
>   	 * behaviour that some programs depend on. We mark the "original"
>   	 * un-COW'ed pages by matching them up with "vma->vm_pgoff".
> -	 * See vm_normal_page() for details.
> +	 * See vm_normal_any_page() for details.
>   	 */
>   	if (is_cow_mapping(vma->vm_flags)) {
>   		if (addr != vma->vm_start || end != vma->vm_end)
> @@ -3267,7 +3281,7 @@ static vm_fault_t do_wp_page(struct vm_fault *vmf)
>   		     mm_tlb_flush_pending(vmf->vma->vm_mm)))
>   		flush_tlb_page(vmf->vma, vmf->address);
>   
> -	vmf->page = vm_normal_page(vma, vmf->address, vmf->orig_pte);
> +	vmf->page = vm_normal_any_page(vma, vmf->address, vmf->orig_pte);
>   	if (!vmf->page) {
>   		/*
>   		 * VM_MIXEDMAP !pfn_valid() case, or VM_SOFTDIRTY clear on a
> @@ -4364,7 +4378,7 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
>   	old_pte = ptep_get(vmf->pte);
>   	pte = pte_modify(old_pte, vma->vm_page_prot);
>   
> -	page = vm_normal_page(vma, vmf->address, pte);
> +	page = vm_normal_lru_page(vma, vmf->address, pte);
>   	if (!page)
>   		goto out_map;
>   
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 028e8dd82b44..9962de4981d6 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -527,11 +527,11 @@ static int queue_pages_pte_range(pmd_t *pmd, unsigned long addr,
>   	for (; addr != end; pte++, addr += PAGE_SIZE) {
>   		if (!pte_present(*pte))
>   			continue;
> -		page = vm_normal_page(vma, addr, *pte);
> +		page = vm_normal_lru_page(vma, addr, *pte);
>   		if (!page)
>   			continue;
>   		/*
> -		 * vm_normal_page() filters out zero pages, but there might
> +		 * vm_normal_lru_page() filters out zero pages, but there might
>   		 * still be PageReserved pages to skip, perhaps in a VDSO.
>   		 */
>   		if (PageReserved(page))
> diff --git a/mm/migrate.c b/mm/migrate.c
> index c31d04b46a5e..17d049311b78 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -1614,7 +1614,7 @@ static int add_page_for_migration(struct mm_struct *mm, unsigned long addr,
>   		goto out;
>   
>   	/* FOLL_DUMP to ignore special (like zero) pages */
> -	follflags = FOLL_GET | FOLL_DUMP;
> +	follflags = FOLL_GET | FOLL_DUMP | FOLL_LRU;
>   	page = follow_page(vma, addr, follflags);
>   
>   	err = PTR_ERR(page);
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 3373b535d5c9..fac1b6978361 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -154,7 +154,7 @@ static int migrate_vma_collect_pmd(pmd_t *pmdp,
>   				migrate->cpages++;
>   				goto next;
>   			}
> -			page = vm_normal_page(migrate->vma, addr, pte);
> +			page = vm_normal_any_page(migrate->vma, addr, pte);
>   			if (page && !is_zone_device_page(page) &&
>   			    !(migrate->flags & MIGRATE_VMA_SELECT_SYSTEM))
>   				goto next;
> diff --git a/mm/mlock.c b/mm/mlock.c
> index 8f584eddd305..52613e2f2a70 100644
> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -342,7 +342,7 @@ static void __munlock_pagevec(struct pagevec *pvec, struct zone *zone)
>    * a non-TPH page already pinned and in the @pvec, and that it belongs to @zone.
>    *
>    * The rest of @pvec is filled by subsequent pages within the same pmd and same
> - * zone, as long as the pte's are present and vm_normal_page() succeeds. These
> + * zone, as long as the pte's are present and vm_normal_any_page() succeeds. These

The comment says vm_normal_any_page. But the function uses 
vm_normal_lru_page.

Regards,
   Felix


>    * pages also get pinned.
>    *
>    * Returns the address of the next page that should be scanned. This equals
> @@ -373,7 +373,7 @@ static unsigned long __munlock_pagevec_fill(struct pagevec *pvec,
>   		struct page *page = NULL;
>   		pte++;
>   		if (pte_present(*pte))
> -			page = vm_normal_page(vma, start, *pte);
> +			page = vm_normal_lru_page(vma, start, *pte);
>   		/*
>   		 * Break if page could not be obtained or the page's node+zone does not
>   		 * match
> @@ -439,7 +439,7 @@ void munlock_vma_pages_range(struct vm_area_struct *vma,
>   		 * suits munlock very well (and if somehow an abnormal page
>   		 * has sneaked into the range, we won't oops here: great).
>   		 */
> -		page = follow_page(vma, start, FOLL_GET | FOLL_DUMP);
> +		page = follow_page(vma, start, FOLL_GET | FOLL_DUMP | FOLL_LRU);
>   
>   		if (page && !IS_ERR(page)) {
>   			if (PageTransTail(page)) {
> diff --git a/mm/mprotect.c b/mm/mprotect.c
> index 0138dfcdb1d8..d236394d41d5 100644
> --- a/mm/mprotect.c
> +++ b/mm/mprotect.c
> @@ -88,7 +88,7 @@ static unsigned long change_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
>   				if (pte_protnone(oldpte))
>   					continue;
>   
> -				page = vm_normal_page(vma, addr, oldpte);
> +				page = vm_normal_lru_page(vma, addr, oldpte);
>   				if (!page || PageKsm(page))
>   					continue;
>   
