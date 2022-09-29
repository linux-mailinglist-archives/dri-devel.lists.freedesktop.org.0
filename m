Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 067C55EFD15
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 20:31:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6345C10EBFA;
	Thu, 29 Sep 2022 18:31:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2088.outbound.protection.outlook.com [40.107.96.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B7210EBF6;
 Thu, 29 Sep 2022 18:30:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rb0EXjQPB0EkH9XClVRcCQYgejYeI449vvVph2WPpvKU85jU8Y7jRTjrK7Wwxm2tVX7Jeh2H1uvtFKjE1Ay2dAs24Co43pm58bDXAsr/uLhZqxOF1WuWIZdw1Cy/dSQkZ7ULG6HpakM0b7pwJXlGGF7+Ooc1rM3s1EGZiPMxXUEcqyjooNmWez8KGrkqhKYg201IxDoY9ejhQOTDLtI+JXFaBRiyDswl1Ve71IuSldlSuxhohKFhgl1/ft2Wj4v17DXAJUvF5hBxexJtnGijfqJODH1wg9fV9DBPeUDfhl8wFZsS2raKbKTzm9Ue6h/LhaWmpJH4mpfPanPjsxy9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6oqqELmp7gVTGjP1+IR443CZsT1yZta560noho9uaKk=;
 b=D+LwByhqvrvZwds9NMUef6kivg6rDrXNyKmG5t8WFbsF46cbg/gDd+UwVTiGStOROQVmt15XJEYFwIrPFuwIDnHe2gzL97F/Y65wdcaO0MF0vJkl3NndPdq3OlBzXETRcgLFOcdk55BtRCU3JPa28S777D0zU/0u0mImRp+oWmDvV+/DFCi7k61a5SoHBdhwu91DIcfvn8MvDu5FJ1FAyHbRWbtmEqim0idgn82GNNZkammlsWOLaYhAEb/YKklrHe4bkX0kxufjVZpDdKfaSfZDAqvew6czHIguZWhtlV8iywr3AtAlN91P9zzvs8pSKNY/ltulb/jGZjesd5KbYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6oqqELmp7gVTGjP1+IR443CZsT1yZta560noho9uaKk=;
 b=4LjhyTx83al++Y8tCOfV1A8BvfZ5GF53tMly1lUjW94Txt7ryqmJiPwpwwJqNx87eO/KLqyFazu4TxFm2nI1tgFqvVvEppS0xpPB/P1kHZ7qWeJ9qxikIB2Em4fwMVaB54uYjRID79oya+OqT55RAiyOAVpDs0t2jLjUQgNfObY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by IA1PR12MB6603.namprd12.prod.outlook.com (2603:10b6:208:3a1::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.24; Thu, 29 Sep
 2022 18:30:56 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::3de4:456f:800d:e013]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::3de4:456f:800d:e013%5]) with mapi id 15.20.5676.020; Thu, 29 Sep 2022
 18:30:56 +0000
Message-ID: <2193303e-84b9-d0a1-b121-d2a145fcc43a@amd.com>
Date: Thu, 29 Sep 2022 14:30:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 1/8] mm/memory.c: Fix race when faulting a device
 private page
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
References: <cover.60659b549d8509ddecafad4f498ee7f03bb23c69.1664366292.git-series.apopple@nvidia.com>
 <d3e813178a59e565e8d78d9b9a4e2562f6494f90.1664366292.git-series.apopple@nvidia.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <d3e813178a59e565e8d78d9b9a4e2562f6494f90.1664366292.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR16CA0011.namprd16.prod.outlook.com
 (2603:10b6:610:50::21) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|IA1PR12MB6603:EE_
X-MS-Office365-Filtering-Correlation-Id: 675003ce-5d7f-4e88-b9fe-08daa248bf98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AVGPnM19J6d3SeTh99LYUQECNyevsnwNz73iLJXNk5VOQsl4H7CmMxZZ30/+ZCAYxsYEfrmqtPt2zrnIDL05gdtcNppKQdy03v4XZbhrvQ2hDkj7/0OJFc/Mcb/ak47HWjxmNHDmL6MQ+6Z5vjwAvYjcKG2VHQWjzJHnASKET87xzqh47ZfM3o+2k5ZGa/oXhyXs7pEtafxoRdk4Xs989J1czOrbu7s3MEF4BhYg4U12CvLEiGXMN5SOoFXAzgQ5ZjO5o/l8nF78zVsyl9dGsk33p68bsFckBg9/a+t0jLR5mx73yOUecbB/qjoTVlsmhrvamVOXw/3Swd8l5zAK3/JdeEAcIYNxreUPzrLD8DlufqHz4HxQb59m1e2AAbPz0yJF9s76jE0FunbpXLt7IW87nOqe841FCmvk+XMBqjhqoyqQA6PeWXrwhTMuG8ox+2SO05jn3nwJAttF59o8JqzSOOfab4egjdwK5iDuIh9fjcbqc6PPVYZLsiJb4oAppV1G8d2hvYuWhl7Wro4j8jtGWEApU0F3UGEUTMjxVY+MxKikdrWqUGM1PQlWyxaSilUSHu/pq9Wm8UQQJ7E7SksBRNAOEGKTzgJYEvUx+3JIWHtKL+STglpQbpBc1dxrbQ6nI8ajUjbTQIYPumrxEb02kVCJaKaMjy9BR+IST2mM53qjlY1EQhB8L134D77BAkG9iK9KEpfzcujQ4lkBI0mlsQ5bv5w+ktBky6mfqTdT8Yoy4lf/FD6De3ISAayKWEzlHljM6cW0st3XXftxUMtXK33C2mzhnrSvbK68HFU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(346002)(366004)(39860400002)(376002)(451199015)(54906003)(36916002)(36756003)(8676002)(478600001)(83380400001)(53546011)(110136005)(6506007)(6486002)(44832011)(41300700001)(2906002)(6512007)(26005)(2616005)(8936002)(5660300002)(30864003)(31696002)(66476007)(86362001)(7416002)(186003)(316002)(66556008)(66946007)(4326008)(31686004)(38100700002)(66899015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aTd6dk9jeFJTSC9wc0dwSEhVQlE0cXM4QjBZMC9QQlJIcWxCK0lpTTdGaXQ3?=
 =?utf-8?B?NWFCM3lKY3JpczhtWXd3V2NwbGhTQnU5SXNTOVhSa0xqb0FmQmxJUDdnTEpH?=
 =?utf-8?B?K0paL2NpNGd1MVlzc0svMWxWbVJVNGwwN2pTUGh2MWlvZWl3elNvb1lmaUd0?=
 =?utf-8?B?alZCVXRRVjdnbnBDRTVtRmJwdGFGQjY0SjdRMWNWUzZVSmFWSVhwMHVRemkx?=
 =?utf-8?B?Z3RwQm4vbFJqQTMxdVAyeUZVa2k5S1ZKN1FvTUxIZ3ZycmxrREptRXpyZHRO?=
 =?utf-8?B?SVJOM1pvbXRSL216a0h4T0xWN1dzUlBIdjQ4NFRIRkFDQnUzSXdSQWZ0NEZr?=
 =?utf-8?B?MlRjdTZQYkVicnFZVVVMam1PNldMT2xvQTAreGhraGJPdnV5K1N4OEVQQjVo?=
 =?utf-8?B?SzB5Z1ZiZXNPcXhEZ3g0dGRHcWNTTERER0oyb1dhd3ZIUDV6SC85M1lBMHpK?=
 =?utf-8?B?a3Y1N1FPdVRzV3U1NG9JVkpySmh3eW5Db0s3U0Z4TEM3Tk81dld0OXBTTnRT?=
 =?utf-8?B?T04wQnRVWlAyTytxUlpVWUx0eitUMnpZNjFXdVNZS2lWOHBsZGdRdDl1T043?=
 =?utf-8?B?RjQ5MmErYzVrTTVEaEUyVDhiUFM3WVRtK0QrdHd5SFRjWUpOU2xtTmJ0N2cy?=
 =?utf-8?B?WitaaTZqOHJuN1VJSmdXVlNEdm1LNGYrQlJPY3owOHZpZ29QTTB6RnRYUFZs?=
 =?utf-8?B?TEFJNW1WSGYvR3drN3l1QWJyNTMrNm1RdTZORUY5bVQwazdESUhxNmhkT2Fz?=
 =?utf-8?B?NjFJSFpZZTFWWkpjdWN0QzNVYXZqS01oT3BYSGdRL3JvRXNpU0ZzNUxiVFpK?=
 =?utf-8?B?bC9kNFFJeFdkNGc0WTRsb1E2azY4Mk14dm1UajFBTFNpVVJOcDZ1SXZ4SlFO?=
 =?utf-8?B?aXFtN01pYjU1SUV2ZG4zS2FSZVFuM1RhRk9vV3RtT2huSVhaUG54MzJmcjB4?=
 =?utf-8?B?YWVHRTNNM0gzdFUzRWlsc2ppSmpOcDRsS2FOVDdJTGdFSVdCZ0piRGFaa3Ix?=
 =?utf-8?B?MW9KdHpjYnV6NTZQaXV5M3lRKzVlV2N6RzlzcUgzcXQyaFoxbEdKZFNOQ3Er?=
 =?utf-8?B?QlhhUUlQaFJaekR6aEwrY0NEUU90ZHJmNWl4VFVJMkpWWDV1eFBBYWVGY0pw?=
 =?utf-8?B?R3BpNnowcFFpdU9xT2h4dFZIQXl1b1BYVytpNXc4aDl6cnZzcUtBVS8vN3RS?=
 =?utf-8?B?dGVySjJvUDBhb0pleHFHa0JvWGdSZHVlMFU5Vjg4UWc5S2xWL3Mxa3h5dTAw?=
 =?utf-8?B?cy8wRWlSMFhhZnZYOEpIU3BIeStPTUlEc1h5NUhOY1JlY2JmdDRObDF4Y1RX?=
 =?utf-8?B?dmEzM0c3aHpQLzA2Tm1oekc3QzQrUC91ajBDZWFTVmE0VWZaeEU4YzdRWTFQ?=
 =?utf-8?B?aWVERjkvNWNTNDhjMUlaQThrT0NyUSsxMGpjR2Z0K1hDSDhDcnZCTDJjUkZp?=
 =?utf-8?B?cFpMQUR6azBCWlo4VnA2SHRzMFJTZnFqenpjdlZzZWJvbEVjYlhoQ0JGeDhF?=
 =?utf-8?B?eHZrNEUyRXFxT0VVa002d3VkVmFteVJ6cFNtc2d1eUJNL1lveTlvanBuMDBD?=
 =?utf-8?B?MjFJWHBiSFdNUm8ydXZlTzFyQ3NnZlpxUU5aT0tMd2MzTmNsR3N0d1c3dzhj?=
 =?utf-8?B?dnpwdG1tMSs5bEhXaCtRc0szQ2hZMGh4SkFpT0s1YVVpT2oyKzRHdVRWVGJE?=
 =?utf-8?B?T1ZZODZ1d1doOStsYzMzR0RQTnliQWxjM1VDOFN5MTR5b2xRbFU4cS85U0NJ?=
 =?utf-8?B?enpPeXFvY05vMWRqWmFGUVYrMThEZU03bmtvQ3hrcnkyQkp5UXB6NmNuTGtB?=
 =?utf-8?B?MUpRaWkvUFMydXJZUDRLQktsTm9PV3NtOEh6dGp3TGJ2TmVwT1RyS2h5SEJD?=
 =?utf-8?B?ZUM4UEpvYzgwODM5Vk53b1dKZ0tPV3E4Mk1kaU1Nc2h1TzNIbG9YRHEvcXBj?=
 =?utf-8?B?NFRad0xxc2Vkbk9FcENRZWRRS2U4ODhHUSs0cEE1bUVUd3phaFlteDRuNG0w?=
 =?utf-8?B?MWJBbEhpZW5DT3dUQ29jWE1CMWpaVUZqK0h6aUZubHg1b0NQSjlGUEZDYjFv?=
 =?utf-8?B?ZjQ4Y2oxVFBQeUlhYjZ0VDFFSkorOHlFNzh0VEtlYjE4M3ZiN0VIQXVrbWN2?=
 =?utf-8?Q?1VHxbf1MApec+T/SwZ0RRr2kJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 675003ce-5d7f-4e88-b9fe-08daa248bf98
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2022 18:30:56.3554 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQ7jRnRUFvixSz67iH4SJhkTLQHOvdvCH4PkafFF37lW06a+Nfnabx7RLW7uGmwoNkDeN4htacOy0loqfpIzhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6603
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Michael Ellerman <mpe@ellerman.id.au>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-09-28 08:01, Alistair Popple wrote:
> When the CPU tries to access a device private page the migrate_to_ram()
> callback associated with the pgmap for the page is called. However no
> reference is taken on the faulting page. Therefore a concurrent
> migration of the device private page can free the page and possibly the
> underlying pgmap. This results in a race which can crash the kernel due
> to the migrate_to_ram() function pointer becoming invalid. It also means
> drivers can't reliably read the zone_device_data field because the page
> may have been freed with memunmap_pages().
>
> Close the race by getting a reference on the page while holding the ptl
> to ensure it has not been freed. Unfortunately the elevated reference
> count will cause the migration required to handle the fault to fail. To
> avoid this failure pass the faulting page into the migrate_vma functions
> so that if an elevated reference count is found it can be checked to see
> if it's expected or not.

Do we really have to drag the fault_page all the way into the migrate 
structure? Is the elevated refcount still needed at that time? Maybe it 
would be easier to drop the refcount early in the ops->migrage_to_ram 
callbacks, so we won't have to deal with it in all the migration code.

Regards,
   Felix


>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Cc: Jason Gunthorpe <jgg@nvidia.com>
> Cc: John Hubbard <jhubbard@nvidia.com>
> Cc: Ralph Campbell <rcampbell@nvidia.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Felix Kuehling <Felix.Kuehling@amd.com>
> Cc: Lyude Paul <lyude@redhat.com>
> ---
>   arch/powerpc/kvm/book3s_hv_uvmem.c       | 15 ++++++-----
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.c | 17 +++++++------
>   drivers/gpu/drm/amd/amdkfd/kfd_migrate.h |  2 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 11 +++++---
>   include/linux/migrate.h                  |  8 ++++++-
>   lib/test_hmm.c                           |  7 ++---
>   mm/memory.c                              | 16 +++++++++++-
>   mm/migrate.c                             | 34 ++++++++++++++-----------
>   mm/migrate_device.c                      | 18 +++++++++----
>   9 files changed, 87 insertions(+), 41 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index 5980063..d4eacf4 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -508,10 +508,10 @@ unsigned long kvmppc_h_svm_init_start(struct kvm *kvm)
>   static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
>   		unsigned long start,
>   		unsigned long end, unsigned long page_shift,
> -		struct kvm *kvm, unsigned long gpa)
> +		struct kvm *kvm, unsigned long gpa, struct page *fault_page)
>   {
>   	unsigned long src_pfn, dst_pfn = 0;
> -	struct migrate_vma mig;
> +	struct migrate_vma mig = { 0 };
>   	struct page *dpage, *spage;
>   	struct kvmppc_uvmem_page_pvt *pvt;
>   	unsigned long pfn;
> @@ -525,6 +525,7 @@ static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
>   	mig.dst = &dst_pfn;
>   	mig.pgmap_owner = &kvmppc_uvmem_pgmap;
>   	mig.flags = MIGRATE_VMA_SELECT_DEVICE_PRIVATE;
> +	mig.fault_page = fault_page;
>   
>   	/* The requested page is already paged-out, nothing to do */
>   	if (!kvmppc_gfn_is_uvmem_pfn(gpa >> page_shift, kvm, NULL))
> @@ -580,12 +581,14 @@ static int __kvmppc_svm_page_out(struct vm_area_struct *vma,
>   static inline int kvmppc_svm_page_out(struct vm_area_struct *vma,
>   				      unsigned long start, unsigned long end,
>   				      unsigned long page_shift,
> -				      struct kvm *kvm, unsigned long gpa)
> +				      struct kvm *kvm, unsigned long gpa,
> +				      struct page *fault_page)
>   {
>   	int ret;
>   
>   	mutex_lock(&kvm->arch.uvmem_lock);
> -	ret = __kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa);
> +	ret = __kvmppc_svm_page_out(vma, start, end, page_shift, kvm, gpa,
> +				fault_page);
>   	mutex_unlock(&kvm->arch.uvmem_lock);
>   
>   	return ret;
> @@ -736,7 +739,7 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
>   		bool pagein)
>   {
>   	unsigned long src_pfn, dst_pfn = 0;
> -	struct migrate_vma mig;
> +	struct migrate_vma mig = { 0 };
>   	struct page *spage;
>   	unsigned long pfn;
>   	struct page *dpage;
> @@ -994,7 +997,7 @@ static vm_fault_t kvmppc_uvmem_migrate_to_ram(struct vm_fault *vmf)
>   
>   	if (kvmppc_svm_page_out(vmf->vma, vmf->address,
>   				vmf->address + PAGE_SIZE, PAGE_SHIFT,
> -				pvt->kvm, pvt->gpa))
> +				pvt->kvm, pvt->gpa, vmf->page))
>   		return VM_FAULT_SIGBUS;
>   	else
>   		return 0;
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> index b059a77..776448b 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.c
> @@ -409,7 +409,7 @@ svm_migrate_vma_to_vram(struct amdgpu_device *adev, struct svm_range *prange,
>   	uint64_t npages = (end - start) >> PAGE_SHIFT;
>   	struct kfd_process_device *pdd;
>   	struct dma_fence *mfence = NULL;
> -	struct migrate_vma migrate;
> +	struct migrate_vma migrate = { 0 };
>   	unsigned long cpages = 0;
>   	dma_addr_t *scratch;
>   	void *buf;
> @@ -668,7 +668,7 @@ svm_migrate_copy_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
>   static long
>   svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
>   		       struct vm_area_struct *vma, uint64_t start, uint64_t end,
> -		       uint32_t trigger)
> +		       uint32_t trigger, struct page *fault_page)
>   {
>   	struct kfd_process *p = container_of(prange->svms, struct kfd_process, svms);
>   	uint64_t npages = (end - start) >> PAGE_SHIFT;
> @@ -676,7 +676,7 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
>   	unsigned long cpages = 0;
>   	struct kfd_process_device *pdd;
>   	struct dma_fence *mfence = NULL;
> -	struct migrate_vma migrate;
> +	struct migrate_vma migrate = { 0 };
>   	dma_addr_t *scratch;
>   	void *buf;
>   	int r = -ENOMEM;
> @@ -699,6 +699,7 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
>   
>   	migrate.src = buf;
>   	migrate.dst = migrate.src + npages;
> +	migrate.fault_page = fault_page;
>   	scratch = (dma_addr_t *)(migrate.dst + npages);
>   
>   	kfd_smi_event_migration_start(adev->kfd.dev, p->lead_thread->pid,
> @@ -766,7 +767,7 @@ svm_migrate_vma_to_ram(struct amdgpu_device *adev, struct svm_range *prange,
>    * 0 - OK, otherwise error code
>    */
>   int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
> -			    uint32_t trigger)
> +			    uint32_t trigger, struct page *fault_page)
>   {
>   	struct amdgpu_device *adev;
>   	struct vm_area_struct *vma;
> @@ -807,7 +808,8 @@ int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
>   		}
>   
>   		next = min(vma->vm_end, end);
> -		r = svm_migrate_vma_to_ram(adev, prange, vma, addr, next, trigger);
> +		r = svm_migrate_vma_to_ram(adev, prange, vma, addr, next, trigger,
> +			fault_page);
>   		if (r < 0) {
>   			pr_debug("failed %ld to migrate prange %p\n", r, prange);
>   			break;
> @@ -851,7 +853,7 @@ svm_migrate_vram_to_vram(struct svm_range *prange, uint32_t best_loc,
>   	pr_debug("from gpu 0x%x to gpu 0x%x\n", prange->actual_loc, best_loc);
>   
>   	do {
> -		r = svm_migrate_vram_to_ram(prange, mm, trigger);
> +		r = svm_migrate_vram_to_ram(prange, mm, trigger, NULL);
>   		if (r)
>   			return r;
>   	} while (prange->actual_loc && --retries);
> @@ -938,7 +940,8 @@ static vm_fault_t svm_migrate_to_ram(struct vm_fault *vmf)
>   		goto out_unlock_prange;
>   	}
>   
> -	r = svm_migrate_vram_to_ram(prange, mm, KFD_MIGRATE_TRIGGER_PAGEFAULT_CPU);
> +	r = svm_migrate_vram_to_ram(prange, mm, KFD_MIGRATE_TRIGGER_PAGEFAULT_CPU,
> +				vmf->page);
>   	if (r)
>   		pr_debug("failed %d migrate 0x%p [0x%lx 0x%lx] to ram\n", r,
>   			 prange, prange->start, prange->last);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
> index b3f0754..a5d7e6d 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_migrate.h
> @@ -43,7 +43,7 @@ enum MIGRATION_COPY_DIR {
>   int svm_migrate_to_vram(struct svm_range *prange,  uint32_t best_loc,
>   			struct mm_struct *mm, uint32_t trigger);
>   int svm_migrate_vram_to_ram(struct svm_range *prange, struct mm_struct *mm,
> -			    uint32_t trigger);
> +			    uint32_t trigger, struct page *fault_page);
>   unsigned long
>   svm_migrate_addr_to_pfn(struct amdgpu_device *adev, unsigned long addr);
>   
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index 11074cc..9139e5a 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -2913,13 +2913,15 @@ svm_range_restore_pages(struct amdgpu_device *adev, unsigned int pasid,
>   				 */
>   				if (prange->actual_loc)
>   					r = svm_migrate_vram_to_ram(prange, mm,
> -					   KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU);
> +					   KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU,
> +					   NULL);
>   				else
>   					r = 0;
>   			}
>   		} else {
>   			r = svm_migrate_vram_to_ram(prange, mm,
> -					KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU);
> +					KFD_MIGRATE_TRIGGER_PAGEFAULT_GPU,
> +					NULL);
>   		}
>   		if (r) {
>   			pr_debug("failed %d to migrate svms %p [0x%lx 0x%lx]\n",
> @@ -3242,7 +3244,8 @@ svm_range_trigger_migration(struct mm_struct *mm, struct svm_range *prange,
>   		return 0;
>   
>   	if (!best_loc) {
> -		r = svm_migrate_vram_to_ram(prange, mm, KFD_MIGRATE_TRIGGER_PREFETCH);
> +		r = svm_migrate_vram_to_ram(prange, mm,
> +					KFD_MIGRATE_TRIGGER_PREFETCH, NULL);
>   		*migrated = !r;
>   		return r;
>   	}
> @@ -3303,7 +3306,7 @@ static void svm_range_evict_svm_bo_worker(struct work_struct *work)
>   		mutex_lock(&prange->migrate_mutex);
>   		do {
>   			r = svm_migrate_vram_to_ram(prange, mm,
> -						KFD_MIGRATE_TRIGGER_TTM_EVICTION);
> +					KFD_MIGRATE_TRIGGER_TTM_EVICTION, NULL);
>   		} while (!r && prange->actual_loc && --retries);
>   
>   		if (!r && prange->actual_loc)
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index 22c0a0c..82ffa47 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -62,6 +62,8 @@ extern const char *migrate_reason_names[MR_TYPES];
>   #ifdef CONFIG_MIGRATION
>   
>   extern void putback_movable_pages(struct list_head *l);
> +int migrate_folio_extra(struct address_space *mapping, struct folio *dst,
> +		struct folio *src, enum migrate_mode mode, int extra_count);
>   int migrate_folio(struct address_space *mapping, struct folio *dst,
>   		struct folio *src, enum migrate_mode mode);
>   extern int migrate_pages(struct list_head *l, new_page_t new, free_page_t free,
> @@ -212,6 +214,12 @@ struct migrate_vma {
>   	 */
>   	void			*pgmap_owner;
>   	unsigned long		flags;
> +
> +	/*
> +	 * Set to vmf->page if this is being called to migrate a page as part of
> +	 * a migrate_to_ram() callback.
> +	 */
> +	struct page		*fault_page;
>   };
>   
>   int migrate_vma_setup(struct migrate_vma *args);
> diff --git a/lib/test_hmm.c b/lib/test_hmm.c
> index e3965ca..89463ff 100644
> --- a/lib/test_hmm.c
> +++ b/lib/test_hmm.c
> @@ -907,7 +907,7 @@ static int dmirror_migrate_to_system(struct dmirror *dmirror,
>   	struct vm_area_struct *vma;
>   	unsigned long src_pfns[64] = { 0 };
>   	unsigned long dst_pfns[64] = { 0 };
> -	struct migrate_vma args;
> +	struct migrate_vma args = { 0 };
>   	unsigned long next;
>   	int ret;
>   
> @@ -968,7 +968,7 @@ static int dmirror_migrate_to_device(struct dmirror *dmirror,
>   	unsigned long src_pfns[64] = { 0 };
>   	unsigned long dst_pfns[64] = { 0 };
>   	struct dmirror_bounce bounce;
> -	struct migrate_vma args;
> +	struct migrate_vma args = { 0 };
>   	unsigned long next;
>   	int ret;
>   
> @@ -1334,7 +1334,7 @@ static void dmirror_devmem_free(struct page *page)
>   
>   static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>   {
> -	struct migrate_vma args;
> +	struct migrate_vma args = { 0 };
>   	unsigned long src_pfns = 0;
>   	unsigned long dst_pfns = 0;
>   	struct page *rpage;
> @@ -1357,6 +1357,7 @@ static vm_fault_t dmirror_devmem_fault(struct vm_fault *vmf)
>   	args.dst = &dst_pfns;
>   	args.pgmap_owner = dmirror->mdevice;
>   	args.flags = dmirror_select_device(dmirror);
> +	args.fault_page = vmf->page;
>   
>   	if (migrate_vma_setup(&args))
>   		return VM_FAULT_SIGBUS;
> diff --git a/mm/memory.c b/mm/memory.c
> index b994784..65d3977 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -3742,7 +3742,21 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>   			ret = remove_device_exclusive_entry(vmf);
>   		} else if (is_device_private_entry(entry)) {
>   			vmf->page = pfn_swap_entry_to_page(entry);
> -			ret = vmf->page->pgmap->ops->migrate_to_ram(vmf);
> +			vmf->pte = pte_offset_map_lock(vma->vm_mm, vmf->pmd,
> +					vmf->address, &vmf->ptl);
> +			if (unlikely(!pte_same(*vmf->pte, vmf->orig_pte))) {
> +				spin_unlock(vmf->ptl);
> +				goto out;
> +			}
> +
> +			/*
> +			 * Get a page reference while we know the page can't be
> +			 * freed.
> +			 */
> +			get_page(vmf->page);
> +			pte_unmap_unlock(vmf->pte, vmf->ptl);
> +			vmf->page->pgmap->ops->migrate_to_ram(vmf);
> +			put_page(vmf->page);
>   		} else if (is_hwpoison_entry(entry)) {
>   			ret = VM_FAULT_HWPOISON;
>   		} else if (is_swapin_error_entry(entry)) {
> diff --git a/mm/migrate.c b/mm/migrate.c
> index ce6a58f..e3f78a7 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -620,6 +620,25 @@ EXPORT_SYMBOL(folio_migrate_copy);
>    *                    Migration functions
>    ***********************************************************/
>   
> +int migrate_folio_extra(struct address_space *mapping, struct folio *dst,
> +		struct folio *src, enum migrate_mode mode, int extra_count)
> +{
> +	int rc;
> +
> +	BUG_ON(folio_test_writeback(src));	/* Writeback must be complete */
> +
> +	rc = folio_migrate_mapping(mapping, dst, src, extra_count);
> +
> +	if (rc != MIGRATEPAGE_SUCCESS)
> +		return rc;
> +
> +	if (mode != MIGRATE_SYNC_NO_COPY)
> +		folio_migrate_copy(dst, src);
> +	else
> +		folio_migrate_flags(dst, src);
> +	return MIGRATEPAGE_SUCCESS;
> +}
> +
>   /**
>    * migrate_folio() - Simple folio migration.
>    * @mapping: The address_space containing the folio.
> @@ -635,20 +654,7 @@ EXPORT_SYMBOL(folio_migrate_copy);
>   int migrate_folio(struct address_space *mapping, struct folio *dst,
>   		struct folio *src, enum migrate_mode mode)
>   {
> -	int rc;
> -
> -	BUG_ON(folio_test_writeback(src));	/* Writeback must be complete */
> -
> -	rc = folio_migrate_mapping(mapping, dst, src, 0);
> -
> -	if (rc != MIGRATEPAGE_SUCCESS)
> -		return rc;
> -
> -	if (mode != MIGRATE_SYNC_NO_COPY)
> -		folio_migrate_copy(dst, src);
> -	else
> -		folio_migrate_flags(dst, src);
> -	return MIGRATEPAGE_SUCCESS;
> +	return migrate_folio_extra(mapping, dst, src, mode, 0);
>   }
>   EXPORT_SYMBOL(migrate_folio);
>   
> diff --git a/mm/migrate_device.c b/mm/migrate_device.c
> index 7235424..f756c00 100644
> --- a/mm/migrate_device.c
> +++ b/mm/migrate_device.c
> @@ -313,14 +313,14 @@ static void migrate_vma_collect(struct migrate_vma *migrate)
>    * folio_migrate_mapping(), except that here we allow migration of a
>    * ZONE_DEVICE page.
>    */
> -static bool migrate_vma_check_page(struct page *page)
> +static bool migrate_vma_check_page(struct page *page, struct page *fault_page)
>   {
>   	/*
>   	 * One extra ref because caller holds an extra reference, either from
>   	 * isolate_lru_page() for a regular page, or migrate_vma_collect() for
>   	 * a device page.
>   	 */
> -	int extra = 1;
> +	int extra = 1 + (page == fault_page);
>   
>   	/*
>   	 * FIXME support THP (transparent huge page), it is bit more complex to
> @@ -393,7 +393,8 @@ static void migrate_vma_unmap(struct migrate_vma *migrate)
>   		if (folio_mapped(folio))
>   			try_to_migrate(folio, 0);
>   
> -		if (page_mapped(page) || !migrate_vma_check_page(page)) {
> +		if (page_mapped(page) ||
> +		    !migrate_vma_check_page(page, migrate->fault_page)) {
>   			if (!is_zone_device_page(page)) {
>   				get_page(page);
>   				putback_lru_page(page);
> @@ -505,6 +506,8 @@ int migrate_vma_setup(struct migrate_vma *args)
>   		return -EINVAL;
>   	if (!args->src || !args->dst)
>   		return -EINVAL;
> +	if (args->fault_page && !is_device_private_page(args->fault_page))
> +		return -EINVAL;
>   
>   	memset(args->src, 0, sizeof(*args->src) * nr_pages);
>   	args->cpages = 0;
> @@ -735,8 +738,13 @@ void migrate_vma_pages(struct migrate_vma *migrate)
>   			continue;
>   		}
>   
> -		r = migrate_folio(mapping, page_folio(newpage),
> -				page_folio(page), MIGRATE_SYNC_NO_COPY);
> +		if (migrate->fault_page == page)
> +			r = migrate_folio_extra(mapping, page_folio(newpage),
> +						page_folio(page),
> +						MIGRATE_SYNC_NO_COPY, 1);
> +		else
> +			r = migrate_folio(mapping, page_folio(newpage),
> +					page_folio(page), MIGRATE_SYNC_NO_COPY);
>   		if (r != MIGRATEPAGE_SUCCESS)
>   			migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
>   	}
