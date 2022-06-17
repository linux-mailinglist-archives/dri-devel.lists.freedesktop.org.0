Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0495A54FC1F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 19:21:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7C6B10E3F2;
	Fri, 17 Jun 2022 17:20:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2040.outbound.protection.outlook.com [40.107.100.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9733110E0A3;
 Fri, 17 Jun 2022 17:20:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpXcGwA7jTIzXfsJADLRJRRYlox2vNOR546eFkzMDtTDrLYMQQ5uIu5TnGWowDOiQSlkga5snrQpK03Ftbn43yzgWS5opstZqBHDwwVtte6f2gLmapNPumnEjmPbzr/UBRkG/U05BI8ypvg8iovRngpZALw1zC4JaWjCrz2+jIeQFjwl82eTyw57lxKV9e0qgRmPFYWC5W0i2KT1gejxOq73k36cpWZK+8A0vM3/FyGbPg2MJems8DkANoNlPn/xkJbqxHzxfDLArHa2iBDxirKdO+yDEBYTL7hupvTSxNq0AnPKfmVHXcgxphlz2nre7+yqY4IKeQ8MstHoWtoELQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUWofxBVyvcwxsHoZ1gibU8HNEVVjDZdbYdKqlOsIxg=;
 b=OMc/DjXLkEksB/D0GUIMLKIJw3mQLVcHztEPgvjb2NZbxku0BcUk5I4cXRNMHoR8iZAa87slCxXIa7VX5y+lWMDHhU9UHeGcvXibIeF5UoSYMB/KE4LBOqB0EAGl3JlQXcks25cUSYF8tN+gPddV9XGytI71PHFsLpNVqOT5sYZVsgyEdrUiDT1Xbxs89fmi9tjXwZd0LXgdHabuYF01Uw42syL4ACGw90ZpuVxp9G6c3jSg9JOkWixcA/qXYSkbAFUHYv+TuIFL2W7MiV4AXBtir8WMy6EEqMshxpcjeL5AsO/6gruI8kPyUqh/Mdfx65qdHiNFOOscUpUiBfAxRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUWofxBVyvcwxsHoZ1gibU8HNEVVjDZdbYdKqlOsIxg=;
 b=JC8nngOvPbRABbEiW5Nuk1IWLBPs3LBwRt7MJ3F7ZsZXL/qOqEe68mN186msdH0DYn18zEdc6Nfu+5ullI//oxZRtu6Cl8IYYmRwTAdXeONs5FC2ahoxWgXEXNzrdM0a2sUaHr75tJGitAVQxd1mlz6rLqmlS4r9HClXU5PdfXQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 by MWHPR12MB1789.namprd12.prod.outlook.com (2603:10b6:300:112::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.14; Fri, 17 Jun
 2022 17:20:51 +0000
Received: from SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::b9a8:66b3:9ed6:2db]) by SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::b9a8:66b3:9ed6:2db%5]) with mapi id 15.20.5353.015; Fri, 17 Jun 2022
 17:20:51 +0000
Message-ID: <02ed2cb7-3ad3-8ffc-6032-04ae1853e234@amd.com>
Date: Fri, 17 Jun 2022 12:20:46 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 01/13] mm: add zone device coherent type memory support
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, jgg@nvidia.com
References: <20220531200041.24904-1-alex.sierra@amd.com>
 <20220531200041.24904-2-alex.sierra@amd.com>
 <3ac89358-2ce0-7d0d-8b9c-8b0e5cc48945@redhat.com>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
In-Reply-To: <3ac89358-2ce0-7d0d-8b9c-8b0e5cc48945@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0100.namprd03.prod.outlook.com
 (2603:10b6:208:32a::15) To SN6PR12MB2717.namprd12.prod.outlook.com
 (2603:10b6:805:68::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e5827a06-6820-452c-8f9d-08da5085ba36
X-MS-TrafficTypeDiagnostic: MWHPR12MB1789:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB1789B3783B6886EFDBB111B4FDAF9@MWHPR12MB1789.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dzxXc8F6+5txEy15wuxNH4GQWFZBWMWfi3U+zjMHUTGKt8slL0Z2klbApOXfuvbVtBX2KOgE2jkvEcPpXIGwTNeCSKmErD65Wl4lpssvTK9JscrQvz35VMAb04t2pIFcstbJGzYrgqEZmfklg8feGn1KsXjWv1z9MUDBAxc8r37Q/WQz0eSKi/CAaUa0zZrAC2YYTH4rzmzCSC+SFCe87EjAd2jcCtQd20kfPsHXv1YmWkNNCY1RF1MNAgS5IGFgn2oeOq040qgdDGRgH1hojKbSZxlyJI695q6DXEuHdVCIgHM6c9l70FR6uxTPHMd6C0nXNoq6GEwXayMY7MLEkRAIExwrH6x6CKAbQ6pMtCXB85/yis/BN4xGB73Uz0/RfILs8VxBo2OTSV2VKAodFTwZUJjkzUdDj6kM2qojhmihfQuFr/cOfClfGxeR6XdrTw3wcYreJd8phDRf6YL1NHGLR1cgOmfFoyCkTUKokZR5VvJjoll3JsI8ZzVeMLRvP5wiy/AwVwy1sRUjdtAgU61ix5QQ6amH9KEzUSIUbqUFJVnTQsV41jHZCvit/1hlcYHgK1wSLwqM31NcAYfZAM2gDYIOkMHVTfA2EwubOb0WzmrOsNlpu1rGiD7YoS4aFx66g9nP4yzlqFSRY85y2m681L8IsnOPy6orN7ybCZszlO8OJ/0Q6b6Wgl6vBsp1M95CfppVnjM/ewGfH4JMwh6PMDYkPP6cmDIvLnE70J84aKMxVRTevpe5gh7wTAzh
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2717.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(186003)(498600001)(6666004)(6486002)(66476007)(316002)(5660300002)(26005)(6506007)(2616005)(83380400001)(7416002)(66556008)(8676002)(36756003)(31686004)(2906002)(53546011)(6512007)(66946007)(8936002)(4326008)(86362001)(38100700002)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M291eWpIOFpzdWNwQnBTSGhvQmJtZVUwVVJEVFgvYWVaSE1oMjgwYkhtcVNN?=
 =?utf-8?B?UEpnSEZmc3p3eGZuZkUzZFppYVJocm1OTjVaelVxR25ORThFNzh2ZDMrQW5D?=
 =?utf-8?B?SXQ1Tml0L3hGRW5UVlV2bEQ2aTNSYURLMk9wNmxBWGZnRm9YNVR4RVh5WFlM?=
 =?utf-8?B?YVBYdDdSQ0RJbUdvMHFkQnRtMVNkMC9Vem4rSUxUWHJhU3VBeEVWZHBiYjBJ?=
 =?utf-8?B?Vml0ejZnU3NTNzc3eENDbFdnTU1tcHg3TWl6Yi9KZzE4bXBtbVRSSmhpNktO?=
 =?utf-8?B?RDVOWHhvMDlrcjI3WkZWaTFtdHdSR3JrbUhlWS9NdEdFR0dXVVA4T1ZDNzlC?=
 =?utf-8?B?TXBBTkszWFlRUEZFR0Fqd09GbGtReXRUUkxZUERHUmkrOHlUcmVGdXR1cjEv?=
 =?utf-8?B?dmpJd2lmR2tTZGVmbVNvNktFMHhYU2dxTVF2NklNVXZqVHBDck40RU9pWHVM?=
 =?utf-8?B?U2d2RUQvWVJjdTdjdmlsbC9icHIyQXhjblNULytRb21va2c2OENGTFNnT2Vi?=
 =?utf-8?B?M0VQWnRyVEdQRmNiRlhjTDM3MzQ2aXZmT2FxeTMyeXNsYUdjQ0VBY3lIWlB1?=
 =?utf-8?B?WFJKckhvSE84Q3BpTXFZZWlRMjU4UFBUS0lGSXdMQTBwV1RLSjVlUlRCekVQ?=
 =?utf-8?B?MjJIdWFsQ0dZT2FWWFhmWkhpNHh1Z3lDdGRtektqWFdSc1FiTXBkM1dWeVFu?=
 =?utf-8?B?ektmeVlYVmNlSm9HWGIxeksycVZjVG9wWHlFZnVjNGtmSEJRQkQwRlZYTlpV?=
 =?utf-8?B?T1pqS1JjVHVWY2ExRWJuTEJrM1FJUnBWTDEyelR5YzdVWW9hcW5LbldEem5x?=
 =?utf-8?B?VDVtMDJ1ZlowU2xiRnE1NCtuNE1mNnZzSWUxNFFsdThMK1h0NSszTllROEdF?=
 =?utf-8?B?RHNyK3hqK1ZLU2lCeVZRTGVmOXppK1dnYUlOblE0OEc3bW15MkJLL2lmRnRB?=
 =?utf-8?B?N3dzWjhjRmxKYmI3YVd6VkRYamxiOFM4NDE4RzBIak52Y0Y0aDIwSHh4V0t6?=
 =?utf-8?B?QisvSklqNXJqZWpzcnlaODNHUzlvYS9wOUU5OFJPaFVIRUVBa2YxS3Y0cVpt?=
 =?utf-8?B?RFJaRGhrZWtGSS9pcERaWmVpS051dHh4TXhyQWpwbGJHVEVjYlVIamw2QUpw?=
 =?utf-8?B?YytYWjdUM2ZQSmhJRXFBb3dNck9XQ3B6ZklwZ1ZjMFBLQ1VrSjFMdENZY2FM?=
 =?utf-8?B?TzhEc29PNWhJL2hzTGxzN2VhOUpmZGxQbzdJQms3M092ZUY1Uk9VekJSbTV6?=
 =?utf-8?B?dk5jT0VsdHk0aHlqUklLZEI4TmN3Qm1sdk5OV3ZNbUkyVCt0S0ZheEEvTWNW?=
 =?utf-8?B?RElmU1hlSW1QdUlRamNYR0d3allLZm9FcVZ2WTA4NDl5NDdxMmJHU29hbWhx?=
 =?utf-8?B?R3hQRVplNHBld3lOZllNS0owSUpqdzltcGlJZVhZK3ovY1k2ci9vN1pGdzVi?=
 =?utf-8?B?dlJBdVNpVG9pK0tyWmNDOHhGajAySE4za21iQXFYTDF3Y0F2S1U3cUowUlEw?=
 =?utf-8?B?dFJKYkMwQllKVU0yak9vQ3NSeHpPYmFJVENxOEtMRHRQcnJxYnBKbjMrK0RG?=
 =?utf-8?B?bEFFNW02NzdEYVE4bFozSzNkVmhrREVLcWNqbDVhN0tJZTQwcEUxN3lHOXpL?=
 =?utf-8?B?U3QzMWtuSDlucktuZnkvWTIvRjRpaVZhRDJ3cml4QUhWWWF3WTJpN0UwUGhR?=
 =?utf-8?B?Y0t5Mm54dkVNakJrTGtSNjZ1L3lLNHEyVzRqeVBzUElIY3ZHTStWZ1ZKeSsz?=
 =?utf-8?B?aUtOaHY1SjBYM1dxbC95b2ZkK3hwU2NaYXdrRzYyYTNnbnNYajlqS2tLSVkx?=
 =?utf-8?B?eDA2bkhFMW5MNmF5MWpZc3dSdEJEdUNsUFRTbWRLK3RzVmIvTVdIcEFYRHdz?=
 =?utf-8?B?eFMybERDTGVYenpVWkVqUytHclM3NW5EaUh4UG5MZnRIL3UwV2ZTbW8vSW5B?=
 =?utf-8?B?NkY4a1ZOcW5EdGdlL2ZBS2xmcEgydnc0djFqd1ZtbklMQ2ZvNnRkeUkrWkly?=
 =?utf-8?B?VUFyZ3dzdmVBSHhHMWFnUGNSR1NtMmx4R2RJN1VGSkx3NDFFQTRuTElTOUto?=
 =?utf-8?B?dUNWOTRZdWlQN3dZZmQ1ZU1TLzRlM3U1Q2I3b0Q0cmdwRVcrU2g2eXFRWVli?=
 =?utf-8?B?S0hDQ05waFJLWE5jaGRicWZkQ0RxbVI1Mm9OOE5GdjI5L2FCNGNNZmdyTHlG?=
 =?utf-8?B?cFpzWmNMN2FYa20xOHhJOEp6OFVuSGRnUE9QMHBvSk5YeHVmZEZMcFFaaVpM?=
 =?utf-8?B?L0M3V253MHhLUHd3b0RyZkF0eC9RbFVlVWxyc0VwUHYzWGVSRVlnMldWM2Vu?=
 =?utf-8?B?Y3EwbC9wSENTY1QyVHRxUFVVOE1wT0ErK0hJeDNCWk8zckp2UGtGZz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5827a06-6820-452c-8f9d-08da5085ba36
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2022 17:20:51.3856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSta839moXOZISNH/bPEJtkwaX59KHY6Qo4TeoJj/H4k1G8fHUOAREtiE30K9r47qiFloXzANxU53zvN6c9zyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1789
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
Cc: rcampbell@nvidia.com, willy@infradead.org, Felix.Kuehling@amd.com,
 apopple@nvidia.com, amd-gfx@lists.freedesktop.org, linux-xfs@vger.kernel.org,
 linux-mm@kvack.org, jglisse@redhat.com, dri-devel@lists.freedesktop.org,
 akpm@linux-foundation.org, linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/17/2022 4:40 AM, David Hildenbrand wrote:
> On 31.05.22 22:00, Alex Sierra wrote:
>> Device memory that is cache coherent from device and CPU point of view.
>> This is used on platforms that have an advanced system bus (like CAPI
>> or CXL). Any page of a process can be migrated to such memory. However,
>> no one should be allowed to pin such memory so that it can always be
>> evicted.
>>
>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>> Reviewed-by: Alistair Popple <apopple@nvidia.com>
>> [hch: rebased ontop of the refcount changes,
>>        removed is_dev_private_or_coherent_page]
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>> ---
>>   include/linux/memremap.h | 19 +++++++++++++++++++
>>   mm/memcontrol.c          |  7 ++++---
>>   mm/memory-failure.c      |  8 ++++++--
>>   mm/memremap.c            | 10 ++++++++++
>>   mm/migrate_device.c      | 16 +++++++---------
>>   mm/rmap.c                |  5 +++--
>>   6 files changed, 49 insertions(+), 16 deletions(-)
>>
>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>> index 8af304f6b504..9f752ebed613 100644
>> --- a/include/linux/memremap.h
>> +++ b/include/linux/memremap.h
>> @@ -41,6 +41,13 @@ struct vmem_altmap {
>>    * A more complete discussion of unaddressable memory may be found in
>>    * include/linux/hmm.h and Documentation/vm/hmm.rst.
>>    *
>> + * MEMORY_DEVICE_COHERENT:
>> + * Device memory that is cache coherent from device and CPU point of view. This
>> + * is used on platforms that have an advanced system bus (like CAPI or CXL). A
>> + * driver can hotplug the device memory using ZONE_DEVICE and with that memory
>> + * type. Any page of a process can be migrated to such memory. However no one
> Any page might not be right, I'm pretty sure. ... just thinking about special pages
> like vdso, shared zeropage, ... pinned pages ...

Hi David,

Yes, I think you're right. This type does not cover all special pages.  
I need to correct that on the cover letter.
Pinned pages are allowed as long as they're not long term pinned.

Regards,
Alex Sierra

>
>> + * should be allowed to pin such memory so that it can always be evicted.
>> + *
>>    * MEMORY_DEVICE_FS_DAX:
>>    * Host memory that has similar access semantics as System RAM i.e. DMA
>>    * coherent and supports page pinning. In support of coordinating page
>> @@ -61,6 +68,7 @@ struct vmem_altmap {
>>   enum memory_type {
>>   	/* 0 is reserved to catch uninitialized type fields */
>>   	MEMORY_DEVICE_PRIVATE = 1,
>> +	MEMORY_DEVICE_COHERENT,
>>   	MEMORY_DEVICE_FS_DAX,
>>   	MEMORY_DEVICE_GENERIC,
>>   	MEMORY_DEVICE_PCI_P2PDMA,
>> @@ -143,6 +151,17 @@ static inline bool folio_is_device_private(const struct folio *folio)
> In general, this LGTM, and it should be correct with PageAnonExclusive I think.
>
>
> However, where exactly is pinning forbidden?

Long-term pinning is forbidden since it would interfere with the device 
memory manager owning the
device-coherent pages (e.g. evictions in TTM). However, normal pinning 
is allowed on this device type.

Regards,
Alex Sierra

>
