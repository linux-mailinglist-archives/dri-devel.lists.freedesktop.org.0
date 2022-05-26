Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 416695351D9
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 18:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0B7E10E1A7;
	Thu, 26 May 2022 16:07:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2077.outbound.protection.outlook.com [40.107.243.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925B510E141;
 Thu, 26 May 2022 16:07:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gXibm7fJyb3KAMQULG0GvIol8qVm+p6l9sXmMgx1H2C+OgSC+zAnvn4qlZPR3oC0v1l0Ik6U0D+ZhBzRY6QguTRXCmb1paI3zLNXqE107OFfve3H3mM31+mzViFQl3Q7RJ68W7NkB6r/ag8AfUBjn9x+KAsgKAo5AdkoSrc7HcteyDc2xbJgPDFx1tnY8PG0exJMEQTNqzuvmlc7+rS4HJ0koEOGmqc7gHVaSHghP2zgdBUXF7H8OD6rh+oClHHi+pqo6MoyxBJi/S290Mu1FCRi3xBDCqCmsUikTwKC/QUq+JDFwINP+wO1XmaF5en1ScLAFnGD9NMyNwKBL+OlZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58Ynfe8Khy4vRvlA+sUG1IGySsNmALCq9+wAm072MhY=;
 b=QibBCHVG9jJ6zBEy0MvNuivEo2Dje6+3dClBjIqmb6AsEHLyCO2fOKM48ZhdO5XD2aX6JdC/xt5Kr39WwjZl4hjW7hi7on62aYfQlrj8gOYvjk0fHp+jgGsHuq0mvKMuiDzPa0n9hMlomrIXZTG2LUf5iSL+bSWIOxfzAd26NmpoapZs6PoxfbabND65e2hI1FXYYq3fF0YSJgf7NWnS3laMyQ+QmycwKR3YJx7S8aApNJDIZwh3QWhaXwXCj1e8f3syNaaRA6yxz/JhVGcfHHTFoeEYjkRoz4Pg7+LX6pAdMqmHUmpGys6NHil//a87+AvWcaKuilvFr1JcEeNtHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58Ynfe8Khy4vRvlA+sUG1IGySsNmALCq9+wAm072MhY=;
 b=FS8cSOPZ1NeQmnlcYZhHdVvhGzEoU3BK+02q8MBnX5Ydadn1a4wGoRL04TXRnjaEZNO/3Y2RiKFOpB17quMd9blk2gawV3zaQQC9JQhvjX10FcSnHCU8zQdSLbMEf1fOhtS8XOvFjwEzPwPPl9YQvfrl9OH49ASQLBQ1N0MWl44=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 by MN0PR12MB5809.namprd12.prod.outlook.com (2603:10b6:208:375::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.23; Thu, 26 May
 2022 16:07:51 +0000
Received: from SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::b9a8:66b3:9ed6:2db]) by SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::b9a8:66b3:9ed6:2db%5]) with mapi id 15.20.5273.023; Thu, 26 May 2022
 16:07:50 +0000
Message-ID: <52fa81b5-c79e-6308-10f9-9304afa10727@amd.com>
Date: Thu, 26 May 2022 11:07:47 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 02/13] mm: handling Non-LRU pages returned by
 vm_normal_pages
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>
References: <20220524190632.3304-1-alex.sierra@amd.com>
 <20220524190632.3304-3-alex.sierra@amd.com>
 <87leuqf4oj.fsf@nvdebian.thelocal>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
In-Reply-To: <87leuqf4oj.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MN2PR16CA0057.namprd16.prod.outlook.com
 (2603:10b6:208:234::26) To SN6PR12MB2717.namprd12.prod.outlook.com
 (2603:10b6:805:68::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8088a171-fc18-4aae-a4fd-08da3f31e223
X-MS-TrafficTypeDiagnostic: MN0PR12MB5809:EE_
X-Microsoft-Antispam-PRVS: <MN0PR12MB58090C7193A1115AB0D0F2C5FDD99@MN0PR12MB5809.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0uJ81CW2bYcRCMQceQl8dvRVPjsAGkhkctjexI1Jt0ifwGXTQt/xjZIxhPW29GY60OLvEOxPsMqB72He968kVaZOhuBWMv1iQm0BTZWjGqXWkGL1BalMYhmU+KuZ9ZjVRHh8o4Pc9DeCH4qXNPb/OXpdG563AN1I4nt3zAjdPN30fQOTV4X/n3QASpfmCayP3NwLty6ydUlDm+I7qvhlf5DAzTIGb1FiNo5gv/qK/3J3EkmfwemfWGidPGMIxBLeaExLlKialQobvGVwSLnSP+gawZ2ZJAeLhhfxKT5+jogf7MPXJKMVz07Bnhqub1e9LsL/9BggTwUD1X7V9DNl7n4Fw4Zky9awQyUfo7aD7qFrkgh9Tp3p93D4OtbRs9a/w8OmRBSOt6ZkgFZFuCa3ux0D72lCi+vgeisFeAhjAto8GIJGdJwjG9IXYuUU1cQdVuYejV0xLZoTftkkvtcrL3lu6mUpr/JtY94xFAyzo5eHA3hGSHpy6RDzZ6QdLLKUfW5PCacicdO6P/9PnM6LX+1ff1lf+mf6tYTaNUglPDyMC4YUe20WqcWeMTOVK5kPe+F4fWjvg+9NuyN0ZFwb0t95LRLdHk4FQbdAHkjHqJA6R5Z+Wd74xDfXiYube44IkEEM9teYBIIlMtgKnRnL3p1JBDTGhOWbIK/kTE8twRgS2A9C/Ycy6Im5pSPu8O9kY0J6mumG0/Kn/tcbO1+pS9E7Gmf+mhH5i1OENWD5lZc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2717.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(83380400001)(31686004)(36756003)(4326008)(6916009)(86362001)(8936002)(5660300002)(186003)(2906002)(316002)(30864003)(66476007)(66556008)(66946007)(7416002)(6486002)(2616005)(6666004)(26005)(6506007)(53546011)(6512007)(508600001)(38100700002)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEs2T1orb0R5Vno4NmxBOElyRmMwd043STlGaE1nZXlRblRXYWdiOU5YNDJW?=
 =?utf-8?B?Z0RpVldxQlRKSUVER3F1MzE3Tis2ZTBFcS82d2hEaXVSWjNlc3RDNnRQZGhU?=
 =?utf-8?B?UExKL0VtSmwvM3dTUUV6N29rUURFNy9mM1l2S3U2bzVyQ1h6UVUxUVlUNkgz?=
 =?utf-8?B?dnZtQ2tzWVNTb2pwcS9OMXFFMnNZUzVLMUdpRTR2TElKZ2lPRTNyMEFiRjRZ?=
 =?utf-8?B?MFpuVitiSi8wYXFtZHJpekdMM3RmYlpNVXFIdFB4TEY0N042d2ZPenhpdytX?=
 =?utf-8?B?UWxCY3NDd0hXVmZnSHBtKzIvOFVncHdzS21rbklIR1RBSGdkc0NsZktEcDdj?=
 =?utf-8?B?L0VoZTViczF6a1I4ZVFuQk9QV0Q0SDZaaVZZWkI3L0xrMFBRZWI5WXdmV0dN?=
 =?utf-8?B?Qm5YZjFqZU1RUWRXTXF3NU1RRGZaYVZPTnQxQnpRTy91TFR2K055aUpCUWxV?=
 =?utf-8?B?dm1lNExsK2t0ZjJHOGliZkxwbzJBOEd3aGZMa0lHbEp2TGlHY0REckpGRkIx?=
 =?utf-8?B?MDNTaXVabVVnVnhvWUFzMlFTVFBhM0ZRaFhPY25TUU1IQ0I3ZXNIakI5OWs2?=
 =?utf-8?B?dUtVYjJZbWlHY2ZDOE1ycjlHb1ZVMXpCWGZBTlU1b1VmblhEZjNKc2tNTkhM?=
 =?utf-8?B?QWk2bDFQSC94dG5qV01vNWc3ZWlqMGxVUDhlWGpma1poVDZnNjNReDgzd3NR?=
 =?utf-8?B?ek5vcy9WN2lDNDRQdGZaQThPelFLT2NraFFwU095UlY4U29IZ0EyTWFKcFUr?=
 =?utf-8?B?MXhla0tJVmRXMUFpL1lSc2FmV0VQWFEzMHJUWEI5UDJaQy9JekRjakE2Vkhh?=
 =?utf-8?B?d1E3dXJYak51L3hxeEhac253TWRDMVF0cWtHWXVVMUJnc3MwcEsrbVZybFJq?=
 =?utf-8?B?bTBvOGhGR0I5bjd4QmE5UFZxb2JqSWU2UFBRODAzLzlOVUQ0WVNTQkdOQUpT?=
 =?utf-8?B?OG1BNW1HL1NHb0I3U1JBeWRiYmN0dDFsRCtlcGV0cEZESW9GdytQS2JJM05I?=
 =?utf-8?B?bGxOK2M2UE5DR0UzOE90YVYwUWo0V1VNYWkwWit2dkRrYzU2ZFhSblhSTEQz?=
 =?utf-8?B?dEZLdTFTN09vZ25aZFNNc2NRUDFRMkhQWk91K1d5N2pOUDBzTU0zc040cmFU?=
 =?utf-8?B?dlVWOUphOW5xZWRaUHAvZm9qSUVIQm9XZ0ZDZ2loUUxvaWpOSVg1VVFxKzd6?=
 =?utf-8?B?NUs1NjgvTnhvWCtkTVhrZFB3NVIxVUdsTlZ5M3loZXRZVkFiaTNtSlRsL1Bo?=
 =?utf-8?B?THZQOWZnMjJYdEcyYnFqR0FmT0IrZHlZaGpBOEs5akpqbUVqaHFVNDJ5a3h1?=
 =?utf-8?B?UTdsZzJLZ0pLaCtJREUvV2ZyYkhSSjhVQmdSWCtPUnZxVGZkKzc4aWtTSk9m?=
 =?utf-8?B?eXR4WDdQTVZZeXREbm80WHF4cERzREJaQkFxR2lVNTA0ZWhjc3RYK0hhSlFZ?=
 =?utf-8?B?NWFDWUZyMkZiNXduQlF3eU5KazhJczVxUDNNbnNvamxyL01GZ1BLOEhlWVBG?=
 =?utf-8?B?YXZLSmpYeW1sK0RmbjFzSDVLN1ZlanhSWUdsWFQyREpIdlFQYlR5aUdMMEFN?=
 =?utf-8?B?RzBFU0krUFJzQys2cUFsRHZQLzh0cFMyWkczYTlRMGRMVk1XeDZJRHo2azRt?=
 =?utf-8?B?aDExSEJJYUxDZkNhdDZvV3F2bkdzVCszblNSSnYwTTRjZk5GV25HUmxjS3k3?=
 =?utf-8?B?bHc2UVF1S1pPTWc1MzVlbi9iMkk1bzQwNjUyTld6NW5FdzcwU0llYnZFeEwx?=
 =?utf-8?B?RFlXU1c2blZHNTdlalBPR0JOcFFhNzA1dTdEOFVzMDEzS1dsd1RuOU5qUkV6?=
 =?utf-8?B?WmM3UDRYYXlqM0JKUDc5dlJHWnJMaXdKbUxNV1RYOGl2c2VQT1hGaGQ4WC83?=
 =?utf-8?B?UWhUd3VnOWFUeFE1cmJWTlVHYm5jZVJ3S2kwYWlpTGFITjQvT3ppYUpNWDkx?=
 =?utf-8?B?Q1lPWi9LNTUvemNMTmVWNDMrOHBPU0hieXA1M0M1WTJENWdKUWFvNm1ZSXVS?=
 =?utf-8?B?NGVYLzdrTHdGTTVTQVdURm9rVDdtYkxCd2ZuZHpPNEFvRnNUNTRkYVlnYlVq?=
 =?utf-8?B?ajltK0lldktiN0tXNEUwUS9TQ0wvRTdQTWdqZldLaE1uN2c0SDhUcGlpZzFJ?=
 =?utf-8?B?RHNHRWUwU0pRY3dGMXA3VmFZY1F6UjFpUFdJRURqN3d2TUlaOHFaVVFjdXdL?=
 =?utf-8?B?QjlPN0pUV05NbHIrd2hDazFKNW5XdUdnYTBJVFcrN2huY2M1bUFPRC9HdEUr?=
 =?utf-8?B?RGRsL0piQVE0YUtUSndzcTdodHJXb2NHY21UZnkxNFBHcmNpc0NzSDArbmQr?=
 =?utf-8?B?M0RORThrUTIwRHJOZkxDTkxLVXFtT0JDOURpRHFlMFhtcis3ay9Qdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8088a171-fc18-4aae-a4fd-08da3f31e223
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 16:07:50.8624 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AbXuE9CecQ5powuyqHbFGbeY8J4GsLUvQad6pN+G6hteFYm3/lVq9NPxxaTHawZiwowk3/SiN+8aOZJAZkfW4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5809
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


On 5/24/2022 11:11 PM, Alistair Popple wrote:
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
> Continuing the follow up from the thread for v2:
>
>>> This means by default GUP can return non-LRU pages. I didn't see
>>> anywhere that would be a problem but I didn't check everything. Did you
>>> check this or is there some other reason I've missed that makes this not
>>> a problem?
>> I have double checked all gup and pin_user_pages callers and none of them seem
>> to have interaction with LRU APIs.
> And actually if I'm understanding things correctly callers of
> GUP/PUP/follow_page_pte() should already expect to get non-LRU pages
> returned:
>
>      page = vm_normal_page(vma, address, pte);
>      if ((flags & FOLL_LRU) && page && is_zone_device_page(page))
>          page = NULL;
>      if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN))) {
>          /*
>           * Only return device mapping pages in the FOLL_GET or FOLL_PIN
>           * case since they are only valid while holding the pgmap
>           * reference.
>           */
>          *pgmap = get_dev_pagemap(pte_pfn(pte), *pgmap);
>          if (*pgmap)
>              page = pte_page(pte);
>
> Which I think makes FOLL_LRU confusing, because if understand correctly
> even with FOLL_LRU it is still possible for follow_page_pte() to return
> a non-LRU page. Could we do something like this to make it consistent:
>
>      if ((flags & FOLL_LRU) && (page && is_zone_device_page(page) ||
>          !page && pte_devmap(pte)))

Hi Alistair,
Not sure if this suggestion is a replacement for the first or the second 
condition in the snip code above. We know device coherent type will not 
be set with devmap. So we could do the following:

  if ((flags & FOLL_LRU) && page && is_zone_device_page(page))
-	page = NULL;
+	goto no_page;

Regards,
Alex Sierra

>
> Looking at callers that currently use FOLL_LRU I don't think this would
> change any behaviour as they already filter out devmap through various
> other means.
>
>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> ---
>>   fs/proc/task_mmu.c | 2 +-
>>   include/linux/mm.h | 3 ++-
>>   mm/gup.c           | 2 ++
>>   mm/huge_memory.c   | 2 +-
>>   mm/khugepaged.c    | 9 ++++++---
>>   mm/ksm.c           | 6 +++---
>>   mm/madvise.c       | 4 ++--
>>   mm/memory.c        | 9 ++++++++-
>>   mm/mempolicy.c     | 2 +-
>>   mm/migrate.c       | 4 ++--
>>   mm/mlock.c         | 2 +-
>>   mm/mprotect.c      | 2 +-
>>   12 files changed, 30 insertions(+), 17 deletions(-)
>>
>> diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
>> index f46060eb91b5..5d620733f173 100644
>> --- a/fs/proc/task_mmu.c
>> +++ b/fs/proc/task_mmu.c
>> @@ -1785,7 +1785,7 @@ static struct page *can_gather_numa_stats(pte_t pte, struct vm_area_struct *vma,
>>   		return NULL;
>>
>>   	page = vm_normal_page(vma, addr, pte);
>> -	if (!page)
>> +	if (!page || is_zone_device_page(page))
>>   		return NULL;
>>
>>   	if (PageReserved(page))
>> diff --git a/include/linux/mm.h b/include/linux/mm.h
>> index 9f44254af8ce..d7f253a0c41e 100644
>> --- a/include/linux/mm.h
>> +++ b/include/linux/mm.h
>> @@ -601,7 +601,7 @@ struct vm_operations_struct {
>>   #endif
>>   	/*
>>   	 * Called by vm_normal_page() for special PTEs to find the
>> -	 * page for @addr.  This is useful if the default behavior
>> +	 * page for @addr. This is useful if the default behavior
>>   	 * (using pte_page()) would not find the correct page.
>>   	 */
>>   	struct page *(*find_special_page)(struct vm_area_struct *vma,
>> @@ -2929,6 +2929,7 @@ struct page *follow_page(struct vm_area_struct *vma, unsigned long address,
>>   #define FOLL_NUMA	0x200	/* force NUMA hinting page fault */
>>   #define FOLL_MIGRATION	0x400	/* wait for page to replace migration entry */
>>   #define FOLL_TRIED	0x800	/* a retry, previous pass started an IO */
>> +#define FOLL_LRU        0x1000  /* return only LRU (anon or page cache) */
>>   #define FOLL_REMOTE	0x2000	/* we are working on non-current tsk/mm */
>>   #define FOLL_COW	0x4000	/* internal GUP flag */
>>   #define FOLL_ANON	0x8000	/* don't do file mappings */
>> diff --git a/mm/gup.c b/mm/gup.c
>> index 501bc150792c..c9cbac06bcc5 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -479,6 +479,8 @@ static struct page *follow_page_pte(struct vm_area_struct *vma,
>>   	}
>>
>>   	page = vm_normal_page(vma, address, pte);
>> +	if ((flags & FOLL_LRU) && page && is_zone_device_page(page))
>> +		page = NULL;
>>   	if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN))) {
>>   		/*
>>   		 * Only return device mapping pages in the FOLL_GET or FOLL_PIN
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 910a138e9859..eed80696c5fd 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -2856,7 +2856,7 @@ static int split_huge_pages_pid(int pid, unsigned long vaddr_start,
>>   		}
>>
>>   		/* FOLL_DUMP to ignore special (like zero) pages */
>> -		page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP);
>> +		page = follow_page(vma, addr, FOLL_GET | FOLL_DUMP | FOLL_LRU);
>>
>>   		if (IS_ERR(page))
>>   			continue;
>> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
>> index a4e5eaf3eb01..8bf4126b6b9c 100644
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
>> +		if (WARN_ON_ONCE(page && is_zone_device_page(page)))
>> +			page = NULL;
>>   		/*
>>   		 * Note that uprobe, debugger, or MAP_PRIVATE may change the
>>   		 * page table, but the new page will not be a subpage of hpage.
>> @@ -1502,6 +1503,8 @@ void collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr)
>>   		if (pte_none(*pte))
>>   			continue;
>>   		page = vm_normal_page(vma, addr, *pte);
>> +		if (WARN_ON_ONCE(page && is_zone_device_page(page)))
>> +			goto abort;
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
