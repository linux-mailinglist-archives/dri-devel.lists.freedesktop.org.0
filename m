Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6DE5EFDD4
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 21:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4696E10EC64;
	Thu, 29 Sep 2022 19:21:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9139A10EC64;
 Thu, 29 Sep 2022 19:21:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Z40p0Q2vtOJmeGJVg2KDmE4ZD5ntV9agXNnX1sMm3qQm58Lq1aIL8/zoJOrx8Q3QIIrPNMdrxHR9L6zjuo+9wYweJSDvVWh43cv74fdbdr1kSultHORblIKgyV6J1jBHW7gZpIz+8jbKVq6f6Y3DvxRs+l5foT3okg9bHA41oddUsCliJzv483pNMY0prAa7drIwtS03pLBTQpWLONGAK6dC4vLf5bQIU4aMuMJ/AcaPusZ2bzlJZkbMNL3wHXfQ47RI5JrqQu1C4U4HpLocfBh2w8XAV0Rf//W4ZaaiDdhsMLWhUxPKZmZH111Q1LN50WAy40w4G74oQnPu3JoHiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDeAyO+A0RH70DxEyosSQYdmA1Pv9xSdvIXZUp3wNIc=;
 b=Ej+2+vxpVxZ8ZTIONPe0ImrN9ethBc89EnaCUTDVMAO2Ii9zupEXQsv9mM4Z5Tc6/1mg6lJa4U+4+4+wkG0VgG0noVV9dfkoOSx68Zga4XNg9M2fbucqar7UL9HU9LXMn8BjvOZKUv4GNne615kfqiNY2+FlF58DNO46uSb9zVW30ZnIemo4fzYJFF0zS+QHu5FWKZGFcsLYS+HqBi9LqIUJyZE9NEtJ73njzU1k96jnNXqJfZ8Vj0Myj68l3VSfECP0AA/wPh1VqPsU3WCBqF8yRlek2u3VyfRRGlEUKk/BBPWQY+OKUXSdVlZt2B0ARgrLWDtuw9sXnAcGSBeUmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDeAyO+A0RH70DxEyosSQYdmA1Pv9xSdvIXZUp3wNIc=;
 b=2aCFAnCfzt/TWl4UyJ8Ey3TKcUmrP+xOga7Ig44f881EY9UwzBtAu5t5MGkeI37h76FEFiItm/QeHIDUmMRM93xDLQPtBk6x5td2mEkpJ5JIwVNaaBQW62zduzSlbGDxkXRemhC/EqI6UPb4nWZjT2/x8aBCOfOrpT9kX7wqZoo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN0PR12MB6030.namprd12.prod.outlook.com (2603:10b6:208:3ce::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Thu, 29 Sep
 2022 19:21:12 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::3de4:456f:800d:e013]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::3de4:456f:800d:e013%5]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 19:21:12 +0000
Message-ID: <c5544de2-6f1a-ff05-8176-7e108da4e845@amd.com>
Date: Thu, 29 Sep 2022 15:21:10 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 2/8] mm: Free device private pages have zero refcount
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
References: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
 <cf70cf6f8c0bdb8aaebdbfb0d790aea4c683c3c6.1664366292.git-series.apopple@nvidia.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <cf70cf6f8c0bdb8aaebdbfb0d790aea4c683c3c6.1664366292.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0143.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::28) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MN0PR12MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: 616f0cac-043d-48e3-bb0e-08daa24fc572
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4wd5zYIieT9kdYMZZHQ63EAjS92dPGh+Llgq8GBdvTqJ+L1VQ471c1vzQmVdyudJLkEqrGnPuTHepiNZ/uzlyZ/h8sSYIm+79lmI1PHmETNXW+QHqrjEwvop58HLPieInaURp8FFBX9Sn6xpLU0ccnWUcjbnTtUwP7Rnc+koijy5Y1fUYWMUCzizUn9liRwp3yFtYUmDqe55e3xSf/gpYICXpWreR2geDm8XLQLiUCeTjSSoXWNE9cktwfBvyhjMPfiZxxb0F71kED4w11xG9JWORdKHBXtbaxpI09AXLX6Y1/FlLAUVjnz1iLOYzomtx2nWFvjXtGRlvd6WQRWfvzXtqKIvMu9FxBwkhHmOfuIzr9ccMLP+4g/RFvPfE2Dqtx9yf/RtCzw4ihvuVGQ9lthOOv2wHi/vCIftOKbKUXcpMxRzmN+jEdjz6uwZbCKpbcHJGLND5lG1KOKawrKrrKZCDyZzGhnsLYBy4HZFlBoDG5ANBI+Mw4WHsJGoit4Y+fMnirG9Gvi6JKZP2BTnAkHwMet3qDwQLcJ+vAC+AlOjYYucJrMVdQ6SFo7s1o8qLfYFBMtI4VCTVp/Lki3OTn8YyimCT/UpNSvpNBcuBCgXrFwSpSCcif5MSTKs4Z+Fz1Hmwpy7QYMbjaw1y3gjgH5k9ljtOxRm83R/jaBplnVpPwVZR3RFbs0L/0EsHkSQs6N4JWle4JNV5iueS0QeUb8ncJaz9p/FF1WwuHthq9c3E7BK1TcMjEM/V9qe02Kh3YnodDZouXUb+ojJRKq9e96znMmjLJsZusH2IE4/QCxorqA7041ST34LfQbnwSvRKTmsYPtfiHkuYTBcHMNT/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(136003)(376002)(346002)(451199015)(66574015)(186003)(86362001)(31696002)(2616005)(8676002)(6506007)(83380400001)(38100700002)(7416002)(44832011)(8936002)(4326008)(66476007)(2906002)(5660300002)(66556008)(316002)(26005)(66946007)(478600001)(41300700001)(6512007)(36916002)(54906003)(966005)(36756003)(110136005)(6486002)(31686004)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MEdhamx0YVpmeHFneER5eWdaUzRZTmJTYUdTUzZTcVRjZGlnOWpLNUFsaXl3?=
 =?utf-8?B?Vk1oU29UWW92Rit5R1NWWjV4ejdXQktYbFdLM0loeUpGSnJSa245bW8zM29x?=
 =?utf-8?B?ZEh0MVhISmRZbFRabnRoK0UwL0Z5ZEdTQzBXMHFmT3FYcTFIZDBSc0swUTZT?=
 =?utf-8?B?ZnV1Tit6b2Fka1JaRkVxSFFZVFdKdy9Wbmw5a2lkQ1hoU2tVMUVoRDVkQWhM?=
 =?utf-8?B?UnBISUtwenM3aGF1eTgyNnJNdkZudmt1RTZBdXp6alFVQlB5ZURadDl5amNJ?=
 =?utf-8?B?bVYraG5mWkJzeFJDZlc1b0hpS2o0N0NoL1pVTGYySEIvVll0V3pQR3NheVNS?=
 =?utf-8?B?REUybTZIdEs3OWNacDlKQnUzTW82eXZxalpzek43VDhiRkk3d1B3bk9MZU1o?=
 =?utf-8?B?aFNNTnRLQkQ0SEpxVXRmMGZQeWRtcmdOQTJkRFpPMklsWW1KZlEyNHYxRytt?=
 =?utf-8?B?c3FZT3RqQ1A1U0hNTlpJK1hGSVUwUkljay9pRWNsVVhjNkR2Y0RqSS9UaVlm?=
 =?utf-8?B?R2s3YkY1WWNKb3kwc3dNN3JWN1dqUlFkL3c4eHByOU5vWTk0Q0Q4MDhJbXpz?=
 =?utf-8?B?bEJad1hNWkJzb1Y1bnRzZEllUDZkQ1VrYlI4eEJMRmVOb2pNUkwxWmVSaFBs?=
 =?utf-8?B?Q0lRaEpTK0doRzZNSUdMVTNJZWtDcmhWMUU3Nlcyc3ZndmExYVpiVVM1aVVC?=
 =?utf-8?B?ZEJ1aUlTK1VyT2grLzZCZ3BJUVdyb3VSamtraWRubEl6bTV5ai9jeGFFSEVr?=
 =?utf-8?B?M2J1Z3IyZmVNTFN0ZSs5REQweXp4RS9MekVhUTk2SkMxQ01UY0I0VzFHZGlp?=
 =?utf-8?B?a3hob3RvZTUyUmJSQ29zNnJDSlRSZ25qQ1Y3am1Hc0ZLNVV0Z1NsYzl6M3VZ?=
 =?utf-8?B?L3BSSWpOVjcwaWtnVTFPWDNsYUtPSEx5ZFMrK25ucHlqZWZuMUt1ZG9tanhh?=
 =?utf-8?B?L0NvVEowbndEVndkcjFGczRXdlhTbmlFd2szUUhKcFF3d3poOFgyQXI5NVp2?=
 =?utf-8?B?M0VFNFFjenZLYUlLZ0syVVpqa3ZNOVgzZWpNc3B0Q1VVeVJVUzk5ckRwbXZQ?=
 =?utf-8?B?bEJGUGRTbjh2TmpvRC80NFlobWJ2UlBqWEN2ajdkZHFNTmtmSmt6Z0JEUDVW?=
 =?utf-8?B?NzVnMlk4b1prRGpqVTFVbGcwVWw3U2NKalhWUm1WTHVjRkt4SGdscGdCQXd5?=
 =?utf-8?B?RVo1QTM3VHFoRjNRYWpmanZCd1RoTDVyVytvMXIrampkbitiSjZNbVdhRE00?=
 =?utf-8?B?ZGxPSnR4Rkw4ZDBXOWhQU2RzNTEyZWZFUVZscHJxSWg0RzgybTlmM0pkMS9V?=
 =?utf-8?B?T0J5NTQ5Vy9MSUFkWDVvVldFM04weFNqaHhkV2dwd09XTEs4TkJpRUFPWSt3?=
 =?utf-8?B?OGJFd2IzRzhXQnVRWGRJazRONTJ6eno5TjFWQXM0YUc3Z2lHNm44bldCMCtM?=
 =?utf-8?B?c2lqL0RBSW1TcmpUbVpMM3lRWk9WclNlRitYVmUwWHNwT3NlWUdweVNXYjIx?=
 =?utf-8?B?ZkZFZmxxeG1mU0hTcnBlL3JneWFMWXVqeGYrNGpLaEJJdyt2cFhHS3pGbFlp?=
 =?utf-8?B?czlJZUpCMXNnVDRESWt3TXNUZ0RnNGN6Z0V2MlJua1hJRWZSRHRxRU5PUDVO?=
 =?utf-8?B?UzFmOFV5SmUya1ZZSVhJdFZMUEZYK0dZc2hYc2dubE9LeFdHQ3dVWVpRWWtH?=
 =?utf-8?B?QnA2NzFLNHYyVzJmbEdEd3FFZ0wrK2dwUjMySlFDeE5WSk16RS9IaXIyNjJ6?=
 =?utf-8?B?eEZudTdJL214MGFxR3ZTUktCeHNFNUJmMGgyTU1GdGpIT1RNYTB2WlVwcWtw?=
 =?utf-8?B?SVJVT0d2TnlnQ2o2NDR6ejRhcHVZdWdNYkpYcVBaUmlBQ3A1NUJTRTlMcjBX?=
 =?utf-8?B?UW9tME1DT0hCWTZ4cGpRZlUrajhZb0RXUVRpRUNzL3ZxdWJCTkJwL3IxUEVo?=
 =?utf-8?B?dUJkdStWNTZ1MjIzb1Nlc01pOHFHUHBMR1poVXl4d3JYSFVOS2hFREkwMEh4?=
 =?utf-8?B?akRMZVhscDN3WHk0cmZsWVpuTkZNN0Y5d0FnRzNVSFlPbmZVUUxWT0xORk1P?=
 =?utf-8?B?Z3dkWjUzUG9ETktaVWlacWptRWVhNU9Tcm0yR2x5R0hkUXVWbnUxbWZIUTQw?=
 =?utf-8?Q?5rsOhUM7HlU2xNKzzPZ/lbE9q?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 616f0cac-043d-48e3-bb0e-08daa24fc572
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 19:21:12.6185 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bJgBNYSw4KGFOILoM1ZIPe8Ogw/YOJtoYWCK8H1H/k4wZIQr0wOO8nBYlUzEfR5dEza5eKzoslLMczRq+Ip9Pw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6030
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
Cc: Alex Sierra <alex.sierra@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Michael Ellerman <mpe@ellerman.id.au>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-09-28 08:01, Alistair Popple wrote:
> Since 27674ef6c73f ("mm: remove the extra ZONE_DEVICE struct page
> refcount") device private pages have no longer had an extra reference
> count when the page is in use. However before handing them back to the
> owning device driver we add an extra reference count such that free
> pages have a reference count of one.
>
> This makes it difficult to tell if a page is free or not because both
> free and in use pages will have a non-zero refcount. Instead we should
> return pages to the drivers page allocator with a zero reference count.
> Kernel code can then safely use kernel functions such as
> get_page_unless_zero().
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>


> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Alex Sierra <alex.sierra@amd.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Dan Williams <dan.j.williams@intel.com>
>
> ---
>
> This will conflict with Dan's series to fix reference counts for DAX[1].
> At the moment this only makes changes for device private and coherent
> pages, however if DAX is fixed to remove the extra refcount then we
> should just be able to drop the checks for private/coherent pages and
> treat them the same.
>
> [1] - https://lore.kernel.org/linux-mm/166329930818.2786261.6086109734008025807.stgit@dwillia2-xfh.jf.intel.com/
> ---
>   arch/powerpc/kvm/book3s_hv_uvmem.c       |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_dmem.c   |  2 +-
>   include/linux/memremap.h                 |  1 +
>   lib/test_hmm.c                           |  2 +-
>   mm/memremap.c                            |  9 +++++++++
>   mm/page_alloc.c                          |  8 ++++++++
>   7 files changed, 22 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index d4eacf4..9d8de68 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -718,7 +718,7 @@ static struct page *kvmppc_uvmem_get_page(unsigned long gpa, struct kvm *kvm)
>   
>   	dpage = pfn_to_page(uvmem_pfn);
>   	dpage->zone_device_data = pvt;
> -	lock_page(dpage);
> +	zone_device_page_init(dpage);
>   	return dpage;
>   out_clear:
>   	spin_lock(&kvmppc_uvmem_bitmap_lock);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index 776448b..97a6845 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -223,7 +223,7 @@ svm_migrate_get_vram_page(struct svm_range *prange, unsigned long pfn)
>   	page = pfn_to_page(pfn);
>   	svm_range_bo_ref(prange->svm_bo);
>   	page->zone_device_data = prange->svm_bo;
> -	lock_page(page);
> +	zone_device_page_init(page);
>   }
>   
>   static void
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index 1635661..b092988 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -326,7 +326,7 @@ nouveau_dmem_page_alloc_locked(struct nouveau_drm *drm)
>   			return NULL;
>   	}
>   
> -	lock_page(page);
> +	zone_device_page_init(page);
>   	return page;
>   }
>   
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 1901049..f68bf6d 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -182,6 +182,7 @@ static inline bool folio_is_device_coherent(const struct folio *folio)
>   }
>   
>   #ifdef CONFIG_ZONE_DEVICE
> +void zone_device_page_init(struct page *page);
>   void *memremap_pages(struct dev_pagemap *pgmap, int nid);
>   void memunmap_pages(struct dev_pagemap *pgmap);
>   void *devm_memremap_pages(struct device *dev, struct dev_pagemap *pgmap);
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index 89463ff..688c15d 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -627,8 +627,8 @@ static struct page *dmirror_devmem_alloc_page(struct dmirror_device *mdevice)
>   			goto error;
>   	}
>   
> +	zone_device_page_init(dpage);
>   	dpage->zone_device_data = rpage;
> -	lock_page(dpage);
>   	return dpage;
>   
>   error:
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 25029a4..1c2c038 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -505,8 +505,17 @@ void free_zone_device_page(struct page *page)
>   	/*
>   	 * Reset the page count to 1 to prepare for handing out the page again.
>   	 */
> +	if (page->pgmap->type != MEMORY_DEVICE_PRIVATE &&
> +	    page->pgmap->type != MEMORY_DEVICE_COHERENT)
> +		set_page_count(page, 1);
> +}
> +
> +void zone_device_page_init(struct page *page)
> +{
>   	set_page_count(page, 1);
> +	lock_page(page);
>   }
> +EXPORT_SYMBOL_GPL(zone_device_page_init);
>   
>   #ifdef CONFIG_FS_DAX
>   bool __put_devmap_managed_page_refs(struct page *page, int refs)
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 9d49803..4df1e43 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -6744,6 +6744,14 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
>   		set_pageblock_migratetype(page, MIGRATE_MOVABLE);
>   		cond_resched();
>   	}
> +
> +	/*
> +	 * ZONE_DEVICE pages are released directly to the driver page allocator
> +	 * which will set the page count to 1 when allocating the page.
> +	 */
> +	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
> +	    pgmap->type == MEMORY_DEVICE_COHERENT)
> +		set_page_count(page, 0);
>   }
>   
>   /*
