Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 35567535951
	for <lists+dri-devel@lfdr.de>; Fri, 27 May 2022 08:28:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5D1F10EBC7;
	Fri, 27 May 2022 06:28:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4812710EBC7;
 Fri, 27 May 2022 06:28:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Il10UhmY+r7Nfec33n0cCt/UtjCOU7MrlJJUM+E6wgqg/UKKWv9ZPTddJ/a+wJfzvrBQ4Pt0hy6lP+5p2j8pYheLQP/7Ipihr+Ex1iRYwjvGuXNjbr/jUyjQYV+qDtnvgS95/Uqp8VLTp3D+TAvsfXWjnbKDK93/xxP8pb2EMOL5Erq6Xea12qU2ELAW0+QZ1JuoOiJ2gqhQToPMjyCYTaY5a1LZHzNVeNgjl/AZFITZ6e6eeF51s6B5E0+ZeV3WbWm5C8aYDWbuIgZpwEHrD6B1uwlKleW9ViYezReUGq7UIiN1j/cEd4Pl+QsCDvyM50UK21UfDYSrc3DNh0OX8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCzPEABuqDJdTOogJdeLuwJCP6FwWGYKCtlbxU1JYpg=;
 b=VJljZ/e8EZZhE1k0k/mB4q5tzjZclxVMZzlivxTDIMuyzHY+vZnZImwTwoHfy7cd3AR5lWNCvYNQEj9npBzZbVHPazisbAvKnzx5Nv6YTIHd8c3727j2aqGSr56jPMZ8iy62AnNOztkf7I4ymPct+ccxHBWrZS9ByXSxNFYDH/xrs9L+cRKWLBuwpkKXepPRcZ0qdPCZYE75PME5gLb/YItfixIWJnay14sCZueh0PGoOWNajkC6xikkJOuZmzF72mdiJEcQ9Mhr6d3+mhU3ccNtkRo9x7SDS6YwhpIqH/Munmzpj/V90z22rroQjAmieFQaYss2/CBTeZ76wr+x0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCzPEABuqDJdTOogJdeLuwJCP6FwWGYKCtlbxU1JYpg=;
 b=h1awsytMCDX/VUmNdsnYEvTBfF1yVxXSvWjiikhFNigmgZrkeEQLKD2sVWXl4ceYOgltEs/e24vyk4qHcvppe61E2NE8atFVEfa8OtQP1kR5tWjm/MQdUT/lh7H4D0Xo+Xq8S21J7dIMpo4AgiAFStlyE79oRn8vD5hNDcC/eiQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN6PR1201MB0257.namprd12.prod.outlook.com (2603:10b6:405:4e::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.17; Fri, 27 May
 2022 06:28:49 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::1cf6:2a9d:41d6:e8c3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::1cf6:2a9d:41d6:e8c3%4]) with mapi id 15.20.5293.015; Fri, 27 May 2022
 06:28:49 +0000
Message-ID: <a3619730-7aa8-1f0f-c524-bf37f6fd5125@amd.com>
Date: Fri, 27 May 2022 02:28:47 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v3 02/13] mm: handling Non-LRU pages returned by
 vm_normal_pages
Content-Language: en-US
To: Alistair Popple <apopple@nvidia.com>, Alex Sierra <alex.sierra@amd.com>
References: <20220524190632.3304-1-alex.sierra@amd.com>
 <20220524190632.3304-3-alex.sierra@amd.com>
 <87leuqf4oj.fsf@nvdebian.thelocal>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <87leuqf4oj.fsf@nvdebian.thelocal>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT1PR01CA0047.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::16) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1f68bd3-21c7-4421-a02c-08da3faa292f
X-MS-TrafficTypeDiagnostic: BN6PR1201MB0257:EE_
X-Microsoft-Antispam-PRVS: <BN6PR1201MB02579433F638B6FF73A2BA6E92D89@BN6PR1201MB0257.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7cbPDvvGNGE22mEfZs4HRjZNWoHFG3u1VsAAxBiBeQvUCKTP54rcy1poT+4ntkC7Nib4o43n6M+5FgthaNQ2oHRU/TO9FY4zTi9QyQ3UETCroFNQTFH9CcVU5C0EQb5oVAP+fFdScnDDi68Ro2lj3WNAm0/D90PfS57fjIy/RPMJZrP5biD4v3MW0JGO4A9VIiCGC8RjhQnKoMmvmLNCNz5cbtCKTw+1yIxPkoOJCRqB4m4KElsZOVdYWeSCV7XwrlQv7bdOnNvuhYl3YK1y1wtYfGmIx1bUjDnT4fdiIYiW+ADo7JjxqMR+p8MhZnSEO6+cSsmliW1GQHxftz4hesGCTXQZ6ypI0PctKDZ/18DFUkQX211MI+EdXB1JhtEDRA7Rv2fwBridXEYcLNmDJ6divKZWjjY4gQ59ceYTtgE7/ELDwkVlgPayuji2CHKhGgVCrTHvvRAROCViEZPKZxngO9bKi6c7TaxwCrJWlvTfzkm1owALDvMnPzqEqh+YBfbT7jCpHAhXPWR/MckkfioWj5jnzzQ1d8s3EEma4X9Ih4FeAQWm0qetp164i4LdhFjh6GprTyunwTUCH0TYcMUCWX6fIfWtnUmt7999C2DT3k4mX6JjLHVt0RGES5Q9UfIwrb6Wo7RqkWRG83bQN4rTOBedDjDvPYl0+09wJrQbV40J0a2OykxcWbjOG3Z29ZWyYmXgV/2/GhRJLv+VKNCvzCzD8osITsg6F77Dck/e3cpGkw+H5q/KLXvV70PN
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(38100700002)(8936002)(83380400001)(6636002)(26005)(31686004)(316002)(6486002)(6506007)(110136005)(36756003)(7416002)(8676002)(2616005)(86362001)(186003)(508600001)(31696002)(66946007)(66556008)(66476007)(44832011)(5660300002)(2906002)(30864003)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Zjh5VkRZWGpJeGNkUTBlajRxd3hUKzBudCtsRHhLNlUyaGdVZ3dla1VPTGxJ?=
 =?utf-8?B?bDcvOElObXZiaElYOGhkNDE4dDk3MEdzVkxzYVFNTk92VS96b085UHk2THdP?=
 =?utf-8?B?WllMMXlvemJReENYYi9DWUZhYWhFS3A2MzI3b2oxM0hHMjcvZm8yN0ZHSUZw?=
 =?utf-8?B?K2hMaG5LVzlwcFFXL040b0dua3hxTmFEczhoMHlwMy9CRnAxKzZZand1S2Nm?=
 =?utf-8?B?NTdaKyt4MzYrWlBEVWNyZkUvdTBWUGpHKzY0S3RUby9ldXArNFVTU2dQM3pB?=
 =?utf-8?B?L3k4dFY3WWpnTTNtdFhwYzRKZVQ3YnNvSTY4V0Mva1JGTGlCOWRaOXRTeFZC?=
 =?utf-8?B?TXJyM0Z3TE92OXREN2hXRVBpNCt3d0pFODNqQ013aXh5WXJvSkpsWlNPSGZS?=
 =?utf-8?B?WHVZMDlveDVoNlFMME9zRER2YWtyV0RTL2ljUjUwNUN5cjdJYklkK2dMc1I3?=
 =?utf-8?B?V1MxYTJLQ29HVnpTTzZZOWdMekZFT3JoaUE3Y2JDRHQ4UVRkS2dwUTZoYlgy?=
 =?utf-8?B?K0NPRkUzYTZOSDZXNlR3VG44T2daTDRBRGQyNWRjUEk1NUk2eEIrMFh6NWU2?=
 =?utf-8?B?K3FnSXdoejBsRnpmVnRkWmphQ3ZjU1dxSmxhaEVEbFdPRmhVNjRVR1NEL2J6?=
 =?utf-8?B?L1hGcklmYXNIYUpNYmRWenJIV1M3S2VjR2grcXBLN2I5eWZiOC9FTTJRQXk3?=
 =?utf-8?B?K3pDbm92amxObytHUjFSYm5oUWFSb0x0SndBUWlsN1ZKUkczbzZiTlFPWEd3?=
 =?utf-8?B?VmZuUTh2VjVmaXlHcEwwQm9rY3NONmtTN0NiR21VVlYzT1hkMVhrOWRSM25X?=
 =?utf-8?B?Y0d6SU9ZVWIzNlltdUdMSFlmaFozZ3ZyTEcza0MyNXF0ZXdZNW9xZG9QZVdl?=
 =?utf-8?B?SUhFbTdkemRpYnNsN1MvaGtQZitMd2Z4RnV4SUZrWG11djNTcERHZ1M1ZldR?=
 =?utf-8?B?QVZRRlBGZWRtQkZockxUMjdOdXE2VW5hRjl2cXRnbnJVVzFxMzFiUFV5dkRY?=
 =?utf-8?B?OEVIcWVsN0R5Vm1mVXdyOWpreFRtL0ZUNFdwZVdDVFFzZDVqRUx4MVRmYS9z?=
 =?utf-8?B?ODJ6RXZmM2MvamE0dUtzaCt3ejJKVC9KMnZ3SExZcDhyT2pZdThBSnZLQzAv?=
 =?utf-8?B?MzZzRFVRVDRvYU4rVldWd3NieVZobHg4dUdOdTRPUzZzdkFUQmF1TXlQTDBi?=
 =?utf-8?B?UlpOUXNPRjVmdG43YjdVZVpMYmVMT0tFSHI4SXQ3NE51L083NHlrNFlTcGVz?=
 =?utf-8?B?VUZhaXFNeTI1ZXNBU2lZWHgwOXJXV25CbmRKMDRIbkJ4L3BDNkVndzdKOXZG?=
 =?utf-8?B?aCtyV0pSWFJoeUE5YlFGS3laSmZ5QkNvQVNQYmR2b25Ydmd4UGg0RWY1REpx?=
 =?utf-8?B?cFlmbEsvb1N4S2REaGt2Qm9YektGazVwcHV5eXNWOWIxd1hHSC9Sd2hHRGJw?=
 =?utf-8?B?UGRYYllHMzg1aDNmQUcrQk9DWk1ybHR1NTBqckxPNTQwM29tejh1S1A0VVln?=
 =?utf-8?B?djlOS3lVUjVFNTFBTjFrYUF5bW9TMVhPRVBiYlJwcGkwY1BjVmN6UVBaelQ0?=
 =?utf-8?B?S0FPNkpkU2hRNkt0UjlOV3JqK3gvMFNmNjZNYlV6RENPWi82Z25ZVE0xbkxS?=
 =?utf-8?B?VnZXdk1vZG9hK0FHM2liZFFPZ0hWUCtHZ25WTEx2S0ZxU2Z6OTZjRVBWUFdY?=
 =?utf-8?B?UVUwUzNlbmJLMGg5WXVVUkZTai9BZ21vUkl2Y2psUC8xc0RQamhnS1lOb29U?=
 =?utf-8?B?dCtKNFlUUUpCUXlmcWV1bFNqQittNjRFK25JQVdWYkdKY0xYYVk5TmZTNmVm?=
 =?utf-8?B?NUNLaERZQ0o2Z3QvZWF1bVFJeUl2Q3ZEblJOREVsOThEZzFES0oyd2lRNzFq?=
 =?utf-8?B?YVhOeDNyZFk2SGJKZmxCQmoyajVSSTQycTFXckROWWxXdDc0MXkybEtGN1FF?=
 =?utf-8?B?UEtGR1ZOelBDMTBvYXRxaHdna0NFSVpLaWFleEpSWUI5R3U5eGVFV1lTMk9B?=
 =?utf-8?B?dG9lZDh6SHFxb1kydXVkcXYyZ1lwU1E5TjBoaWZGNURPY0F1TExPb1pGSkEw?=
 =?utf-8?B?SHNFcWlLKzR4T3gycmNZSFhuMWpSNmg2NHMwWFVoVmFHb1VGcS9pQkpPdDJO?=
 =?utf-8?B?Y1I4N2liVitNQk5tdGhVYTQyZWFZNkVIcjhISGt6Ym5ua01sOHFBS3pNZHVL?=
 =?utf-8?B?eUU2VVV2cEtsME9DSWJWUnRqbHBCR2xuazl4L3RPQ0orWHdBVEpSNW92TjRm?=
 =?utf-8?B?OTRpd3VaVk90anBvemFOYlhPcDFSRXAvcjJOZGRKUWtFMElDU1RJWHUyTWpr?=
 =?utf-8?B?VFlob1hvTWtibDY1S3BCcTV6NUFTMHFIbitUVnB6SnZOMEdrdVlYQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1f68bd3-21c7-4421-a02c-08da3faa292f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2022 06:28:49.5729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v0EUWUKBhaCoEo3msRBKDoabYUoEQsje6IEBfvEI8pJ/caSS+EVlfObce7eZbzt24ZdZZP1RQ7EoNZasAW4llg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR1201MB0257
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
 amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, dri-devel@lists.freedesktop.org, jgg@nvidia.com,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 2022-05-25 um 00:11 schrieb Alistair Popple:
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

This alone won't help if it still goes into the if (!page && 
pte_devmap(pte) ...) afterwards. I think what you're suggesting is:

+	if ((flags & FOLL_LRU) && (page && is_zone_device_page(page) ||
+				   !page && pte_devmap(pte)))
+		page = NULL;
-	|if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN))) { + 
else if (!page && pte_devmap(pte) && (flags & (FOLL_GET | FOLL_PIN))) { |

Is that what you meant?

Regards,
   Felix


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
