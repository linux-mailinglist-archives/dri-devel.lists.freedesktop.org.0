Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F494BC032
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 20:20:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11DE210E820;
	Fri, 18 Feb 2022 19:20:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2068.outbound.protection.outlook.com [40.107.92.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E703F10E7D9;
 Fri, 18 Feb 2022 19:20:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I99Y0oKoC/EEB9kipVlhEvCM9dVK+kH9tL/laeKwV3dFn0hrwfVxdf4gzHOh7Z+gbvcsbLIaSjKw6AhB9mofTvTgW34JxrUFjBD3L5D+kq74CBr4HxnIt/L3qQxqprF3yZWX4YMMYOAvpuaJjIRTZIF5KxhNAuSFRDBh3El0DfT707sgyQ0R0WIz27V+8/vteSuQeDdj0NFBIHIrtnofajbOYgRL79RJDgoNp5lIef9BxhMxEUOm+Lm3qJ37s0yBsNRC6E8XlQQ8FXsSWVMBOMwBUH4LrJhHWU42+3pWNy/sMrEeMv984e31yok+571zYmmBxlF26oQFR15c2bEWEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQRRxEl1dIjnmyqc9ybdRKlG0TdGdNm62a2GHGrFcNc=;
 b=OcJh3rKWvr9YXtM9ju4Vzodrr+RMjzIE79ecx92bhDoqQH+g6inj0TY8RgxAp1ECiyhy2nWTJfsmhO3NHeM/d5SoWX1Jm3dxpntwX5ubcfC381z29vXFIzqs6UE6qKn22gsi9ilfqn/jvVDrycnmT0fHeYJWyrg8a5FE6q/majRFszZaLQfK63b6c+x59Uc6ODya15QhYVvvIxT3AqXK09V70qkO78DL308b1RxdHXmzCz5VI9lTHwuxWwm2VIslwBHPiqZlUNJOSJMYiCvidAyx43XPeQ3gqqkI/RspT25ABPO7+O7GuIjRKXTJyq+1pa02DtduDADa6q27Sdmh/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQRRxEl1dIjnmyqc9ybdRKlG0TdGdNm62a2GHGrFcNc=;
 b=pMSs1a3heyZzkzpIvVAEeWIMwqe878gnwLtkA4b+NZtfmhgQhGeuh1/5guqZ3rO5AAhS6O3ruDeQqQTYzMbJDE2Vp8A/ALbnyZ4QPSejEkabImzbABjJCYlnBf7bS2LUQu+7Fha0yVJAZMPlAXoYjliquMQ97ObOp7BH50GUIt4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CY4PR12MB1509.namprd12.prod.outlook.com (2603:10b6:910:8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.19; Fri, 18 Feb
 2022 19:20:47 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa%4]) with mapi id 15.20.4995.016; Fri, 18 Feb 2022
 19:20:47 +0000
Message-ID: <2f2569d5-df0d-7975-7f4a-2d85ceaf29ef@amd.com>
Date: Fri, 18 Feb 2022 14:20:45 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 01/10] mm: add zone device coherent type memory support
Content-Language: en-US
To: Jason Gunthorpe <jgg@nvidia.com>
References: <beb38138-2266-1ff8-cc82-8fe914bed862@redhat.com>
 <877d9vd10u.fsf@nvdebian.thelocal> <20220216020357.GD4160@nvidia.com>
 <6156515.kVgMqSaHHm@nvdebian>
 <98d8bbc5-ffc2-8966-fdc1-a844874e7ae8@redhat.com>
 <20220216122600.GG4160@nvidia.com>
 <bf16195e-2570-3687-2b53-3f597ebfcfec@amd.com>
 <20220218001935.GN4160@nvidia.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20220218001935.GN4160@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT3PR01CA0139.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::31) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57749aec-f7f3-4ba8-9f80-08d9f313c467
X-MS-TrafficTypeDiagnostic: CY4PR12MB1509:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB15096CEBF6076A2BB2F1DBE492379@CY4PR12MB1509.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 96A0sLYVG72fTEPxL3DRu0wS5WM2L2IMkvsBw6wtLV41F51oTT7MbaT2v1dZT7LNU7eIHhYGIobNa9eWptZYxyDfy0pOu+AxXOpGBM0E9FZcZqIdVpLEZN7ypB/EFXZJCQfveh4/Gnhog8LFns86UYp+aEilRgztFbcCjbYlacFMLMv9r/dlYywoXPd8TRqNHwnEFlOJlNKmf/2R2/WA89HLKuFrCYA1Ko+Mq1aIFxZOdFitsFnTip9w06JY+NtotpLLOXGCTeW2REm8IPf8IuZ3pN81N5iZ4TIgNivKEhUJ1jWGo1K9seKAzRbTqHRdfAA8A/a/zFExy1Q/MTuLqQxOaSGD6pqsjj4b1++YjCbEtKV2gIPpPDIZ2W0+CgZpsDVVdKQuVKFMapaDudj7sRp9S3lEAIVQcjqREKIVf7DfpeYNhJMGhTFTMsq1gHggA6/F84jj/bsvkM1WkFvi7apmsEd0KqnWjWHhNBFOV7e3HjbHPVV+xf/b5OLXaUgxZnGoKrw1OtazV9Lmtms7NvSQZ1M9bc+81ouGRJBpEHHR5nIEsomNfx/uEAL9PklkBgn58nfz0yhGKKok1EGHG51zpncLaISebZymU+EhkWatasCCb3F04YmXx2CIsLerA8SV4U8hcwOTViSZK3SSgdCPJAUK5otX3fqDurD06NzPbbkUOp2kx8tWJd+YEwU1tBXeNa0YLOEI+Qs3OcoYAp8V4AKDahj6VZvDCsu43Ms=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(38100700002)(44832011)(2906002)(36756003)(7416002)(31696002)(8936002)(26005)(66946007)(186003)(66556008)(4326008)(8676002)(66476007)(508600001)(54906003)(6916009)(316002)(2616005)(83380400001)(6512007)(86362001)(6486002)(6506007)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aDduaDh5eTQ2Z1FiRDFMb1NoL0M5d0JqNlJvdm43SHFiTDFBMURkMWJyQjJx?=
 =?utf-8?B?OW81dFE2RHJucHk2UkFTOXFrd3gyU0EwL2kvV1hXRFdpOUlwTjRSU0VDRzQ4?=
 =?utf-8?B?R3ZDMXJJVFRSNSswNVhJVHhPM084eE1KM3FnL1FRVU5GUkx5YmVWai9uUll3?=
 =?utf-8?B?bnhRbkU3bER2SytSeFpHOGtrZy9qNGpyWVlTNG5iazZYcjJ3S0lxcDExdm1a?=
 =?utf-8?B?TjJHR215NGpWd1dtdlZCT1IydmdhS2RYUVZueTJpYzIxUHlDRXpPTHBQUjZY?=
 =?utf-8?B?UjNTSW5MaGlUKytlNFZ2cjdnREl0bnRlcGZROW4vVVNocGwwOWtnanZHTHVt?=
 =?utf-8?B?MUFCY0pYM2luWm00NVpBNVZwU3czbVJJOUh3UktIUG9rNGpDL1Z1NmYyTjds?=
 =?utf-8?B?bnJJKytFeWp1bTNuWm1pSXV6RkcvNXY2YjhocEhJT2NScUhUT0x5dmFsdVo4?=
 =?utf-8?B?V2FzVHhRS01HYUd3eTUwalRyb3JWNTdKaW9HNDNnSXlqb3prNW9ZQS9nMHUr?=
 =?utf-8?B?ZllISjRTWHNRTzZ6NkVYTHIrRG9HMUEzc1Brdk5hdEFmN1luM0UrQkhwRGl2?=
 =?utf-8?B?a08vR0Z2Rk44eEFsT1dHMTNFazd2dGJRaTh4eCtSY25TRmFRSDhRNXdBU3o4?=
 =?utf-8?B?a3RHYWp5U3ZBL3I3aU05K3dac2JlaUJzdWtqeVlKNjVCSmpjeWxaSFhsRkVD?=
 =?utf-8?B?aVoyYWtDS2JXUFZRdHc5WC9tdmdTaHN6M3NGZjdSL2lxYW1rbmdRK3JHL2VQ?=
 =?utf-8?B?b3NsWXhxNGFreVRFVm9FL1kxVDlRR3JnYTNyQ3NabjRFelM0OGxDM3E1UEN2?=
 =?utf-8?B?MXdpZjAyeGJiZlR1UC9XNEtienRGSXlzeENWa1ZBVGNkTXZuRGhhTkNjZVBm?=
 =?utf-8?B?YUlWU1pLQVJBaEROa2hhLzdJbWtQT0RrSzNRUFVFbkI3UUxVbjRnakZ1Vzgy?=
 =?utf-8?B?TTRkNzFvUTJzNStneUdoV1NJR2RUYVJ2K2U4VlY3UXV4bS9RVVFZVCtTampj?=
 =?utf-8?B?NnozSlBKUFZVcUtyVytMRVlBalBlc3NVeWNqeGlmeWxJQmFCR0xnUGhSR0pM?=
 =?utf-8?B?ZWVLbUtOSUYyekNmWmJHaWJkTXdyUENsWlBYQjFmWUkrR1hNUDBuUEVVVVMy?=
 =?utf-8?B?OURRL1BwWUdIVGxxb2ZWN25MQjlJaVo2SDlCZjNxUFVhbXZpUlZ5eHpkRlBn?=
 =?utf-8?B?QUdaNm5UTGVFaTlsNnc1ZlRhSW0rV0ZwQUxTM011TTErcHZHc2tuWDQ0Wmxv?=
 =?utf-8?B?Y0Q4bjdNZWx1aDNDUkFTN1ZpeFR3UU81YVliYXM0Q1pYNTFtVEdjZXd6MnIz?=
 =?utf-8?B?MzVxVGJnbXRLVHk1YzIybUdkbHFOc0RjM3RNazE0TGhBS2pxRTJ0YWU1YTRO?=
 =?utf-8?B?dGRuM3l6OG9YanhrZXBwR3c5SDBrYWU3MDVWSXRHcXcxdU5tWjl5ODhpVFBz?=
 =?utf-8?B?TElaSkN4dm45UVZaWHM1bG5sTUJ2U2MwYzlXbndOVGNDb3JZY3NTMVFSMGU4?=
 =?utf-8?B?ZHpuVkpQb1ZRMU02b0FqZm5Bcnd4c0hMU1pFV2I4TVh4SHUyQ1ZEWkk3VElO?=
 =?utf-8?B?Z0h5RWVQK1hITHdJR0dQVXJENmRmOGpEUmJBbnhZQnBNeVFOZDUwKzdNWFpB?=
 =?utf-8?B?YWc4ckNod0p1SzBFSENvZE5ZS25kT2NONGEvSjJOdllEdklqTmV6ZGxzdVB6?=
 =?utf-8?B?clJLeWorZU1GdXVrV2I0Ly9mNE1iVXJCL09aK095UDQzaUUwSGlOM3FkVUgy?=
 =?utf-8?B?V3JWZFVPUDk4dUcxRjVnRXphT1Roa0h2SVFiSWxGRnY4UHdhc1orRzFTcnZ0?=
 =?utf-8?B?UUJJOEQyMFRLWGo3VHgxcEdpcjUrOUFwRmt5TEU5NStoQk5mRktQWWVCcGcw?=
 =?utf-8?B?eU9EZTNVL2JTVVA5UUJoTUd0dnYrb3VQTEIzV250L1V0bkUzWlNDQVJ4amFz?=
 =?utf-8?B?cE1WNS8rQ0JFSlNiM2ExQWh1NzdMNkVZQzFJNExmcG9lTzNaWHBBbDFvTjhQ?=
 =?utf-8?B?NE5ZMjhncDNhS2JndWtHTWZKMUxSYWFVN3FLdisvVGF0WVB0TkFsL2NWdzQz?=
 =?utf-8?B?YmEwNmtIQytRNWJkZElMd0x3bS8zY2N1QnFYR0xYOTV1YnZ5bUQwMWZFL0RP?=
 =?utf-8?B?R3A5Mk1zUE4rYjRrK09PNWJtVGl6Z2tzeXlCaEJ1d3ZHOEFUVjVHSzhQLzFG?=
 =?utf-8?Q?NIBKE89ZG+zswD4ru4IWjrs=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57749aec-f7f3-4ba8-9f80-08d9f313c467
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2022 19:20:47.5626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dBW2pqF7Z8NqCOwcHgGmy21QWBxDAn+kbWfkeih4UKMBa4tFhIlbG5awVlv0AVKdp9JGn8HbX5jiE8w1uBGyGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1509
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
Cc: Alex Sierra <alex.sierra@amd.com>, rcampbell@nvidia.com,
 willy@infradead.org, David Hildenbrand <david@redhat.com>,
 Alistair Popple <apopple@nvidia.com>, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-02-17 um 19:19 schrieb Jason Gunthorpe:
> On Thu, Feb 17, 2022 at 04:12:20PM -0500, Felix Kuehling wrote:
>
>> I'm thinking of a more theoretical approach: Instead of auditing all users,
>> I'd ask, what are the invariants that a vm_normal_page should have. Then
>> check, whether our DEVICE_COHERENT pages satisfy them. But maybe the concept
>> of a vm_normal_page isn't defined clearly enough for that.
> I would say the expectation is that only 'page cache and anon' pages
> are returned - ie the first union in struct page
>
> This is because the first file in your list I looked at:
>
> static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
> 				unsigned long addr, unsigned long end,
> 				struct mm_walk *walk)
>
> {
> 		page = vm_normal_page(vma, addr, ptent);
> [..]
> 		if (pageout) {
> 			if (!isolate_lru_page(page)) {
>
> Uses the LRU field, so this is incompatible with all the other page
> types.
>
> One mitigation of this might be to formally make vm_normal_page() ==
> 'pte to page cache and anon page' and add a new function that is 'pte
> to any struct page'
>
> Then go through and sort callers as appropriate.
>
> The 'pte to page cache and anon page' can detect ZONE_DEVICE by
> calling is_zone_device_page() insted of pte_devmap() and then continue
> to return NULL. This same trick will fix GUP_fast.

Sounds good to me. What about vm_normal_page_pmd? Should we remove the 
pmd_devmap check from that function as well. I'm not even sure what a 
huge zone_device page would look like, but maybe that's a worthwhile 
future optimization for our driver.

I'd propose the function names vm_normal_page and 
vm_normal_or_device_page for the two functions you described. The latter 
would basically be the current vm_normal_page with the pte_devmap check 
removed. vm_normal_page could be implemented as a wrapper around 
vm_normal_or_device_page, which just adds the !is_zone_device_page() check.

Regards,
   Felix


>
> Jason
>
