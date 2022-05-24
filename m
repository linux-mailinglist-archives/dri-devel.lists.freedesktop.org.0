Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A64915330F9
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 21:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DD8410E08B;
	Tue, 24 May 2022 19:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1anam02on2086.outbound.protection.outlook.com [40.107.96.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02D5110E087;
 Tue, 24 May 2022 19:01:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jSst0GeLOFskrVCpMUfTRZYz7af9xtvyojoYsGEsOH3lHWTRR0kwDb3dtVf1QChZwh7Ga0HTyONGtKioFNRxUtNi8JtboAGzh4InVfz+4Wj7ooPQ7n+q8a9muzpYeU2R1zf67+ac3Q0pAuQfjNYjWDfXYbBZj90yNDC9cYQW+LTDJb6Pc0C+S2b3aR3JcZPEJlnnZqn909SgdNVJ0CdXXfMRa1B7YJbT2Qu6svBkaOZpt+Wo74dyReLxxpOyFCFfOPO0k7dORt7ikp0GdKRSi/7086fkfvQF5HyXcEHDyi/EmH64mhKORiUl6xtIMnc6vfS0lmNWVYvkQQVIHs5KLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uxITL+yeqchm5tgX103KqrEym+cCKMiq2Iza7NC5JvM=;
 b=T2yjDIG5mABfttC0tcwww66Oi87EaidFOPbqm1TdgLEVlP3x7Zb3UVLlRHJ8MShOlb0RzYFZaYeYsvoBIWepZElh1brOzvmQFnYHkXjdUt2zcN4x5E7Jefrkxa+7b4u7IYswj/+B6FppBr0yr3ueGu8G1/gOLZRzqrJk7OPQ6gAgz1e6p+s9PFZPUmzu4aK+w1evvBKXHosHk9pzHnVVCPv4eteu1RbAbERDiaKIMPXtIbIqffbwTTL1So5saVMi8DUTYGv/RUJO+5PoMYMHdmfjq6+0uougURrmPZUwtcPz90FZ/2fc6KsPVBFkzld/auDePec5hTYQLjG0iesdXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uxITL+yeqchm5tgX103KqrEym+cCKMiq2Iza7NC5JvM=;
 b=Zvj7uI+8VOVm8azYqm7kYkRyL6q9lHWEvzmY3XiIj+iZaBlADCmIa0W81AsvzN9n7ERhw8595J45gC/E9HKtahXmEe8Pq7YQHEeVxULsOlzX8UOhyjBzzetAtXB6HIRJxJzbos5NAq6fc8P1NoTeA40JlUcgSZpkMK4tFDYU9SQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 by BN8PR12MB3347.namprd12.prod.outlook.com (2603:10b6:408:43::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Tue, 24 May
 2022 19:01:11 +0000
Received: from SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::b9a8:66b3:9ed6:2db]) by SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::b9a8:66b3:9ed6:2db%5]) with mapi id 15.20.5273.023; Tue, 24 May 2022
 19:01:11 +0000
Message-ID: <b6e1c1dc-0f7a-42af-cbfe-7f7a8068a23a@amd.com>
Date: Tue, 24 May 2022 14:01:07 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 11/13] mm: handling Non-LRU pages returned by
 vm_normal_pages
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>
References: <20220516231432.20200-1-alex.sierra@amd.com>
 <20220516231432.20200-12-alex.sierra@amd.com>
 <87wnech1as.fsf@nvdebian.thelocal>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
In-Reply-To: <87wnech1as.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR17CA0031.namprd17.prod.outlook.com
 (2603:10b6:208:15e::44) To SN6PR12MB2717.namprd12.prod.outlook.com
 (2603:10b6:805:68::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21ce60cd-9e6d-4dff-efd8-08da3db7c483
X-MS-TrafficTypeDiagnostic: BN8PR12MB3347:EE_
X-Microsoft-Antispam-PRVS: <BN8PR12MB334712FA8D055B8D78F63E61FDD79@BN8PR12MB3347.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CDVTCJrzjNjUTS0FmtR7c4EOwAICSVtHs21XAjk9qP9YmWdaq6Wz0yVLitaxgNJDUrQ+JhmHgwHhEkqVQSUoHNHqrGo7YkJh+ENFafiWmwZL1v/K+gV6i1xeN8N1maRTcXr4IUDDUG1rsX8EtrdCxfV4M7/coxL7B5A0dyClb36ZeFJLoCz1KE6wEwcPYdl1jZiDToAyJiJoi9CRtg68rOE7qlfSAoiQ7CfW2V+ctQbL6CT3oNyydNDSD9TzHTstkB/lg9eo3rJ67eBrahwquCegNIlCLsDUcbTd0orcd4OuDzSqWeLPlaoD56BT+a3lvcjken0O0Cj5On07f4uPO+xsJMDb4RfeflXgdzO7c5RvoLTUlfqqDmXprpCAnq8zldfJgI1lwRQlvNY+xKON1qZYChdCq+9IkvKQYaejDGyt/Hh8l0WK0bP6VRlIyoYc6lBdoCQPBXKOt2suWAeVSxQLR7OEhcFAhYnnZ/DewWfX0TWsfbsOzXgRqP6544pxbWeb+57vTkLJYQQ1/qWB/lBkkB+nIZQYPHetxSnJGpYdLTA+Nmq/2ycTuVoe0iHLvFFjnIPUpsjkBTPA2fXSdW1JN7cYGCXotiG9iMUvcGLNU1WTquRTaCoJy91b4pgD7WZ0dx+lUHqoKZFvYLusIFf67RyrOvNrx/yGV6q+nMipYFkMk4EjSJE96F/PKbryTJmvRpWli9dpkK9srB6dj6G+lbUumIBLHI4Ipl8EEGtSAifdJPM50Yaj1GUNENVq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2717.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(86362001)(186003)(6916009)(36756003)(7416002)(38100700002)(66476007)(66556008)(4326008)(8676002)(31686004)(316002)(66946007)(6666004)(83380400001)(26005)(5660300002)(8936002)(2616005)(31696002)(2906002)(53546011)(6506007)(508600001)(6486002)(6512007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0xiY2ZGSlRiK1huUVIxbjA5QWtlSlQzditENmxiaWp5YklOQjIraXpnbWph?=
 =?utf-8?B?U0lSMTg2RnJjQnZSSUFFdzdiRm5IVURyZmVOdEVMY2RPVHp4U1ozajBMb2Vz?=
 =?utf-8?B?TTVBejcrbnFacTVOaGoxRHhaTSsrUTFUYlRwZmpzaVVSMnhxYUNnRmc4aFJ4?=
 =?utf-8?B?ZHlJcGR0ZzBTT2o1dkVVc2JJVksvcUdPNmMrUkR5TkhGWXZSYzdaMDM0UlRx?=
 =?utf-8?B?ZmN6Smp4dEJGY3d4Y3NxSmMwQkFJYVlxZmFubXFjVFB2MFdrWTQ5aWFJbzZr?=
 =?utf-8?B?SGVhU1ByTVpEZVVZa3ZEbmxBQW03ZlpkZXNZM0d0YWZiT051c1RMRk9pc2V2?=
 =?utf-8?B?bnBkUjdZek5iZURxS1gvallxQTJocTZ4YXdNMUJjTjZJdlhUSzJ0TjBETzdH?=
 =?utf-8?B?TFhyM3lucysrc0d2OTFjMUc0VE83cG9peFgxUXBjRXZiWmtHNzRia2NJWDdP?=
 =?utf-8?B?M2IxTUJXdTM4SzlVMlFHS3BEcmhiRWF5czJEL2R2U0VUU2lXZzlmc3ErcWlT?=
 =?utf-8?B?SkZtSGRHaGl2UWRoWm9FczU0MDRkaklEd1hGSmFkYmRRcmxNN1dXOUV5VDEw?=
 =?utf-8?B?SkVIYmxPbm9LdG9mK0xGRHExZ0ZlWXlxU1NZL3pXd0J1MHBIQkRWanZBN2ov?=
 =?utf-8?B?eUlTWS90SnpqemloNE0zc041WUlsakIzM0FJV3Byc1REWDEwRTFQUDI5RWM1?=
 =?utf-8?B?QXNLL0U4WHp3Rnh3MlNIQm0zTjhqQ2V5ckNhWlN2ZVY0QnFyd3JoNGFFMDVJ?=
 =?utf-8?B?VklqVE14Q3RKWXZ0Nk04Ti92aWU4bDFuVEpLNEdoVnBSSndWUGJXYm96TnAw?=
 =?utf-8?B?ZG5xVUZuVU5NNTVEL1g3eEp5SmM2VnFNUzg0Y1l2SUpReGdQQXczNWxQSXlI?=
 =?utf-8?B?S1Fkb010QXdaSWZtWFMzOHk2TWgvRnN1TVY1bVdBOEM4RnI1ckt0TVJLN1pI?=
 =?utf-8?B?eHhrdmdVKzNKS0g2T2NDR2FCSDZWZTRaWG1lam9FZldLRDArQVhYU2NSZVYy?=
 =?utf-8?B?TVUvaXZiaGxGSW8vRmxGUDFYMWQvOFpyd1J3STBad2F3ZnhFM3R0clJncVpa?=
 =?utf-8?B?MEZ0b3hFV1FVTGhEUlFxTEJIY0ZxR2hOWDdEcXVLZzE4OGpud0lpS0JIZjcv?=
 =?utf-8?B?ZXRhaUxVTk9FWEFiRG1aT25Jb1l5ciswTEJFdEZzbWRzd3UzdU9lMW8wZk52?=
 =?utf-8?B?d3hZNzJmemFHTWZJOU5wdDk0L3F5eEp5VUg3di8wSUN6TDZjZWlWTkF6WlBz?=
 =?utf-8?B?V2lvNldSZjJiYmNyRDd0cVVOc2x2a2ZWaFNJNmwvblJRbldDbGUxems3b2xW?=
 =?utf-8?B?ZWdCWGo5RVgreUtBQkJVdlYzT3FqUGwrSlJPekI0SEptc2R5VG16Z0lEY252?=
 =?utf-8?B?TmVyOE84eW83UkY4eXFtMlNua1BnZjBVbkFCS2NLT0x3dFQxRWNldXJ5MlR5?=
 =?utf-8?B?cm5mUHVLTStPRWFub0NUT0cvSWc5VmNpaTZTc1dvbVU4aDhMK3k4M3A0ajdS?=
 =?utf-8?B?WFlIL1lUOHFKdkhuZ2g5TGNMaXdpQ1EzNU9mckpZSVZjQUI4OG9pdHcybUVM?=
 =?utf-8?B?YUN5eGYvaTFVaCswMExUSU9Vd2pGS2o1Y2RSaTNHWVYyZ3liU04xR3hSVXFr?=
 =?utf-8?B?bldVTWJ1Mms3TldpVHdrMWczRldyUUczaDdVV2YxWlFiaUl0SGI4Q3piMEZQ?=
 =?utf-8?B?OUFkZWJpNnQxbjN4c2w4SW9HSXhSSDJDbUdrMnJycXZKZTFEancvMXpHakpt?=
 =?utf-8?B?TFNybzhtRXdQWG0zREFJNUMwUEV6S3MxOEtLRjBXZW5IVUtEeFhQR21CTTRl?=
 =?utf-8?B?TDhvanNvK2t1OFRaQmpPVkljR2lKdlVDWm44elFXbE80eG8wbnUvbDBBMjdH?=
 =?utf-8?B?aVordlNaT05vZjF3YW5KWHBCMEhaQi9LSjNKMEQ5UVovWFFrdkVENEZaTEVE?=
 =?utf-8?B?WS9wL3VwZjhRWitXcFcxN2JYVkR4U3lzVFBjenZVYXNKa2lkb0kzQjg3ZVIx?=
 =?utf-8?B?bmp1ZWkvK1ZDWGZSVURlQkNNOGo5akR3Ujdiamljd2NSMnQ5SG9aVkdFQ1FQ?=
 =?utf-8?B?S1Jsbms3N2RMOWwzSEhLMnVZM3MwSldIVFRSQ040RXFjYmxGcjN5TFNNTS9n?=
 =?utf-8?B?SlZlUG1iazVKa1lsWjBuaDBra2EyYlMvL3UranNpaDZKeTRMSDlQYkMrRU9j?=
 =?utf-8?B?UytnZnF6SjRMOWgvbzd2N3Q1ZzRTVW9nWlVSdnZKeHdWVDd1aVlSOUpHUTd5?=
 =?utf-8?B?NDNWY1ZjZDFsR0Jib2tJTDc1a0lnNWpWYmNwazQ5c3MxQys1R3p2enIxeUVB?=
 =?utf-8?B?S0JDZlNqaXpCNVk1VU01K0RRalhTL1F1QWpScmhmRlJaZ3Nkb3o2QT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21ce60cd-9e6d-4dff-efd8-08da3db7c483
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2022 19:01:11.4136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WbF2gdqPBQHu69nfkOS6oEO/SEHhTVcrH/wEImAMoedvW2Cz7YXD7EuwXnQiPUH9Ts/MJBSC8Wbe1sz3/CmY5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3347
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
 Felix.Kuehling@amd.com, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 5/23/2022 7:02 AM, Alistair Popple wrote:
> Technically I think this patch should be earlier in the series. As I
> understand it patch 1 allows DEVICE_COHERENT pages to be inserted in the
> page tables and therefore makes it possible for page table walkers to
> see non-LRU pages.

Patch will reordered in V3.

Regards,
Alex Sierra

>
> Some more comments below:
>
> Alex Sierra <alex.sierra@amd.com> writes:
>
>> With DEVICE_COHERENT, we'll soon have vm_normal_pages() return
>> device-managed anonymous pages that are not LRU pages. Although they
>> behave like normal pages for purposes of mapping in CPU page, and for
>> COW. They do not support LRU lists, NUMA migration or THP.
>>
>> We also introduced a FOLL_LRU flag that adds the same behaviour to
>> follow_page and related APIs, to allow callers to specify that they
>> expect to put pages on an LRU list.
> This means by default GUP can return non-LRU pages. I didn't see
> anywhere that would be a problem but I didn't check everything. Did you
> check this or is there some other reason I've missed that makes this not
> a problem?

I have double checked all gup and pin_user_pages callers and none of 
them seem to have interaction with LRU APIs.

Regards,
Alex Sierra

>
> [...]
>
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index a4e5eaf3eb01..eb3cfd679800 100644
>> --- a/mm/khugepaged.c
>> +++ b/mm/khugepaged.c
>> @@ -627,7 +627,7 @@ static int __collapse_huge_page_isolate(struct vm_area_struct *vma,
>>   			goto out;
>>   		}
>>   		page = vm_normal_page(vma, address, pteval);
>> -		if (unlikely(!page)) {
>> +		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
>>   			result = SCAN_PAGE_NULL;
>>   			goto out;
>>   		}
>> @@ -1276,7 +1276,7 @@ static int khugepaged_scan_pmd(struct mm_struct *mm,
>>   			writable = true;
>>
>>   		page = vm_normal_page(vma, _address, pteval);
>> -		if (unlikely(!page)) {
>> +		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
>>   			result = SCAN_PAGE_NULL;
>>   			goto out_unmap;
>>   		}
>> @@ -1484,7 +1484,8 @@ void collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr)
>>   			goto abort;
>>
>>   		page = vm_normal_page(vma, addr, *pte);
>> -
>> +		if (page && is_zone_device_page(page))
>> +			page = NULL;
>>   		/*
>>   		 * Note that uprobe, debugger, or MAP_PRIVATE may change the
>>   		 * page table, but the new page will not be a subpage of hpage.
>> @@ -1502,6 +1503,8 @@ void collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr)
>>   		if (pte_none(*pte))
>>   			continue;
>>   		page = vm_normal_page(vma, addr, *pte);
>> +		if (page && is_zone_device_page(page))
>> +			goto abort;
> Are either of these two cases actually possible? DEVICE_COHERENT doesn't
> currently support THP, so if I'm understanding correctly we couldn't
> have a pte mapped DEVICE_COHERENT THP right? Assuming that's the case I
> think WARN_ON_ONCE() would be better.

Correct, change included in V3 patch series.

Regards,
Alex

>
> Otherwise I think everything else looks reasonable.
>
>>   		page_remove_rmap(page, vma, false);
>>   	}
>>
>> diff --git a/mm/ksm.c b/mm/ksm.c
>> index 063a48eeb5ee..f16056efca21 100644
>> --- a/mm/ksm.c
>> +++ b/mm/ksm.c
>> @@ -474,7 +474,7 @@ static int break_ksm(struct vm_area_struct *vma, unsigned long addr)
>>   	do {
>>   		cond_resched();
>>   		page = follow_page(vma, addr,
>> -				FOLL_GET | FOLL_MIGRATION | FOLL_REMOTE);
>> +				FOLL_GET | FOLL_MIGRATION | FOLL_REMOTE | FOLL_LRU);
>>   		if (IS_ERR_OR_NULL(page))
>>   			break;
>>   		if (PageKsm(page))
>> @@ -559,7 +559,7 @@ static struct page *get_mergeable_page(struct rmap_item *rmap_item)
>>   	if (!vma)
>>   		goto out;
>>
>> -	page = follow_page(vma, addr, FOLL_GET);
>> +	page = follow_page(vma, addr, FOLL_GET | FOLL_LRU);
>>   	if (IS_ERR_OR_NULL(page))
>>   		goto out;
>>   	if (PageAnon(page)) {
>> @@ -2288,7 +2288,7 @@ static struct rmap_item *scan_get_next_rmap_item(struct page **page)
>>   		while (ksm_scan.address < vma->vm_end) {
>>   			if (ksm_test_exit(mm))
>>   				break;
>> -			*page = follow_page(vma, ksm_scan.address, FOLL_GET);
>> +			*page = follow_page(vma, ksm_scan.address, FOLL_GET | FOLL_LRU);
>>   			if (IS_ERR_OR_NULL(*page)) {
>>   				ksm_scan.address += PAGE_SIZE;
>>   				cond_resched();
>> diff --git a/mm/madvise.c b/mm/madvise.c
>> index 1873616a37d2..e9c24c834e98 100644
>> --- a/mm/madvise.c
>> +++ b/mm/madvise.c
>> @@ -413,7 +413,7 @@ static int madvise_cold_or_pageout_pte_range(pmd_t *pmd,
>>   			continue;
>>
>>   		page = vm_normal_page(vma, addr, ptent);
>> -		if (!page)
>> +		if (!page || is_zone_device_page(page))
>>   			continue;
>>
>>   		/*
>> @@ -628,7 +628,7 @@ static int madvise_free_pte_range(pmd_t *pmd, unsigned long addr,
>>   		}
>>
>>   		page = vm_normal_page(vma, addr, ptent);
>> -		if (!page)
>> +		if (!page || is_zone_device_page(page))
>>   			continue;
>>
>>   		/*
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 76e3af9639d9..571a26805ee1 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -621,6 +621,13 @@ struct page *vm_normal_page(struct vm_area_struct *vma, unsigned long addr,
>>   		if (is_zero_pfn(pfn))
>>   			return NULL;
>>   		if (pte_devmap(pte))
>> +/*
>> + * NOTE: New uers of ZONE_DEVICE will not set pte_devmap() and will have
>> + * refcounts incremented on their struct pages when they are inserted into
>> + * PTEs, thus they are safe to return here. Legacy ZONE_DEVICE pages that set
>> + * pte_devmap() do not have refcounts. Example of legacy ZONE_DEVICE is
>> + * MEMORY_DEVICE_FS_DAX type in pmem or virtio_fs drivers.
>> + */
>>   			return NULL;
>>
>>   		print_bad_pte(vma, addr, pte, NULL);
>> @@ -4422,7 +4429,7 @@ static vm_fault_t do_numa_page(struct vm_fault *vmf)
>>   	pte = pte_modify(old_pte, vma->vm_page_prot);
>>
>>   	page = vm_normal_page(vma, vmf->address, pte);
>> -	if (!page)
>> +	if (!page || is_zone_device_page(page))
>>   		goto out_map;
>>
>>   	/* TODO: handle PTE-mapped THP */
>> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
>> index 8c74107a2b15..e32edbecb0cd 100644
>> --- a/mm/mempolicy.c
>> +++ b/mm/mempolicy.c
>> @@ -528,7 +528,7 @@ static int queue_pages_pte_range(pmd_t *pmd, unsigned long addr,
>>   		if (!pte_present(*pte))
>>   			continue;
>>   		page = vm_normal_page(vma, addr, *pte);
>> -		if (!page)
>> +		if (!page || is_zone_device_page(page))
>>   			continue;
>>   		/*
>>   		 * vm_normal_page() filters out zero pages, but there might
>> diff --git a/mm/migrate.c b/mm/migrate.c
>> index 6c31ee1e1c9b..c5d50e96ecd7 100644
>> --- a/mm/migrate.c
>> +++ b/mm/migrate.c
>> @@ -1611,7 +1611,7 @@ static int add_page_for_migration(struct mm_struct *mm, unsigned long addr,
>>   		goto out;
>>
>>   	/* FOLL_DUMP to ignore special (like zero) pages */
>> -	page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP);
>> +	page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP | FOLL_LRU);
>>
>>   	err = PTR_ERR(page);
>>   	if (IS_ERR(page))
>> @@ -1802,7 +1802,7 @@ static void do_pages_stat_array(struct mm_struct *mm, unsigned long nr_pages,
>>   			goto set_status;
>>
>>   		/* FOLL_DUMP to ignore special (like zero) pages */
>> -		page = follow_page(vma, addr, FOLL_DUMP);
>> +		page = follow_page(vma, addr, FOLL_DUMP | FOLL_LRU);
>>
>>   		err = PTR_ERR(page);
>>   		if (IS_ERR(page))
>> diff --git a/mm/mlock.c b/mm/mlock.c
>> index 716caf851043..b14e929084cc 100644
>> --- a/mm/mlock.c
>> +++ b/mm/mlock.c
>> @@ -333,7 +333,7 @@ static int mlock_pte_range(pmd_t *pmd, unsigned long addr,
>>   		if (!pte_present(*pte))
>>   			continue;
>>   		page = vm_normal_page(vma, addr, *pte);
>> -		if (!page)
>> +		if (!page || is_zone_device_page(page))
>>   			continue;
>>   		if (PageTransCompound(page))
>>   			continue;
>> diff --git a/mm/mprotect.c b/mm/mprotect.c
>> index b69ce7a7b2b7..a6f3587ea29a 100644
>> --- a/mm/mprotect.c
>> +++ b/mm/mprotect.c
>> @@ -91,7 +91,7 @@ static unsigned long change_pte_range(struct vm_area_struct *vma, pmd_t *pmd,
>>   					continue;
>>
>>   				page = vm_normal_page(vma, addr, oldpte);
>> -				if (!page || PageKsm(page))
>> +				if (!page || is_zone_device_page(page) || PageKsm(page))
>>   					continue;
>>
>>   				/* Also skip shared copy-on-write pages */
