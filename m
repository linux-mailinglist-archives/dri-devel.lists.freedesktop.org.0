Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 048305530D4
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jun 2022 13:25:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3322210E52D;
	Tue, 21 Jun 2022 11:25:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2050.outbound.protection.outlook.com [40.107.237.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C72EA10E52D;
 Tue, 21 Jun 2022 11:25:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EoC8LvSgmYaexxOjb7Ukjms7EQvvY7iV7hFY8l2m0knXb4Ijy/RPAudiIMtUA1OC1uS3LuukO8Ep38U852h9uTe/A91AkGXsR0PuiRjF0EYCaMa+Qhn5qQlW1/mjF6aYKjQV6Az6ZsGHb9lcfmo0fJosr+0PcaWDGbqhcQm1sHp7r8rbLtpWkpqR+R8JGRHqcZONiBzyEHYd7sPZZSNUSKuIVYeNDgCbPTGFqNnFDL88QdZkeN0aiB1LWls1TDd9bra0lyWixkJKr59xK++PlB2rDtGBdoXo1skSuH2RGNxHBp/UgHbZMmAdsQO8Yk4W8lontQcoNLwS+S9KfFREww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AAF3M5VgLn9W+D6+KqWJOr6y7X0Rp2dcfaCZ7KDiF7Y=;
 b=Zw8Xl9ZcsYbVFEdbIdVEBY0rCeiPWAcq2ARk8Lv87SI0FpJVbn1IoD4KDGB6rxkRATC16TJBhrEY1NuFc5kmoGD4rYUVQ0lhK4QVxBifOjtp1ZL5mGoKXgrwDnRpilsfF3mx4UZJy06CUkIWeK1F8VGkQ3UpiN3QGrQqXevTv5ZT0lVZMWGS1qqzbqsj1C6jO9iAsbeZsFJzWKHxAgJ5lnhl+f+p4AaNcOFnuN40lg1zK31ZGQMJht+Lid8iJIRMx3n4lVTxP8rHDfMgtX3LqDn9CoPth4EmcfWzujtJ2TmbmkIdqZpnFZaQTscw21C80B6He0peVcJFbjFAbFGyig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AAF3M5VgLn9W+D6+KqWJOr6y7X0Rp2dcfaCZ7KDiF7Y=;
 b=WPPNV7ngbjgV8uhd+1mkksTe8ySa92jRjkxahQ91E1BiYlsznOd/ySTvFbZhHvvetRJHjv8hNT8wXrGlWDf03LmozxrxoL0BBxUInwj10RSBWEDZn+kF8PR89/v6PNofq/KBgS6vDx92h3d+l9LoTHPZF6K8tupyZsLzI0eps7E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CY4PR12MB1335.namprd12.prod.outlook.com (2603:10b6:903:37::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.17; Tue, 21 Jun
 2022 11:25:44 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::1cf6:2a9d:41d6:e8c3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::1cf6:2a9d:41d6:e8c3%4]) with mapi id 15.20.5353.022; Tue, 21 Jun 2022
 11:25:44 +0000
Message-ID: <65987ab8-426d-e533-0295-069312b4f751@amd.com>
Date: Tue, 21 Jun 2022 13:25:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 01/13] mm: add zone device coherent type memory support
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>,
 "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>, jgg@nvidia.com
References: <20220531200041.24904-1-alex.sierra@amd.com>
 <20220531200041.24904-2-alex.sierra@amd.com>
 <3ac89358-2ce0-7d0d-8b9c-8b0e5cc48945@redhat.com>
 <02ed2cb7-3ad3-8ffc-6032-04ae1853e234@amd.com>
 <7605beee-0a76-4ee9-e950-17419630f2cf@redhat.com>
 <ddcebcc1-fb0a-e565-f14d-77c9d48f2928@amd.com>
 <6aef4b7f-0ced-08cd-1f0c-50c22996aa41@redhat.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <6aef4b7f-0ced-08cd-1f0c-50c22996aa41@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6P192CA0013.EURP192.PROD.OUTLOOK.COM
 (2603:10a6:209:83::26) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7872c0d6-5159-491d-e3c5-08da5378c7fa
X-MS-TrafficTypeDiagnostic: CY4PR12MB1335:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB133508A42773FBDC2F3D3F5492B39@CY4PR12MB1335.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /7VcJ/99XD+RBxr3zAr0XTvDmuzrUHLe1ATG8WHK+ZCcPwTvB2wtQBMTTNMMf/65Vkw4ddLW5PhEMYiGAWoZJGxhGNgBLhiwsZsbdQ0paOnPxqrIC6RyNfTF/mMeMREI4tC/RAg319rktJ9iGsnJAf+CGbpyQS2FYuMZ4eByQcuWnyGCRvA3SRQP4d4pctFBg1AFS/TqKbzuC1dwSQdX+uzuwatZBRSnTs1m0z9AkFNamEiRWTyBQUvG6s409IVhehGeQVVRbsw2RO2P/fCjGbYGtas5z9l1fhTig6O5k7ABQk2wqCy5W4bQG6K1g6nJdf2QHRKC7vZaqMMQ831y8SSKIf4fmp1CxaHfkTibJLLUL5lHH62NqL7XAWWzkjulZiUqlYBPuFJWAsvup7xbgcxARtPjkDmNNzZdSz41BnmPCKRnJK/kh6u4evhMCae26dMc0H1YqvH7fRtT+00uJmuN8Ne/DpFgz3nR9dVUrou3zD7P8xkNaPtnROl2JFgYh1jfSCGGB5v/Vl6LaazBbbzzELTcBVq3l+PWEQo713h4svqy8Q0nRBeIIBpE4smLaUYK4BUkbOIpJxNGzXq3G4c68XEPo/2LVJwbRUGDiyTE9+eFjaeIGeFP4PY3Ois5MnvrVTOvaxRsewnUk+GlujgoBbM4R2jk1vwZZb1yacpgrQNlLQCZj43Y1llcFk/AUklnNAFtoEAfJrfwbig/lCf8cx/01yKME/gSfCdjEmA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(366004)(39860400002)(376002)(396003)(346002)(53546011)(316002)(2616005)(110136005)(36756003)(6486002)(6666004)(66556008)(26005)(83380400001)(6512007)(41300700001)(4326008)(66946007)(31686004)(44832011)(6506007)(8676002)(66476007)(186003)(478600001)(8936002)(86362001)(5660300002)(7416002)(31696002)(2906002)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ejB0Y1VRZTlQTUdtdE9xaFQxNThQeitJUEFWS3FQL01iMXRzL3AwaXZQQm42?=
 =?utf-8?B?endWS3hqeXRHRlgrSWJjTFcwc01CbjFpTjFLOThYM29kWVZra1BFQUtZZFRh?=
 =?utf-8?B?QXhMS0RQRGM5RXlFekw1ZzkvdVE5WlBiOHkvNlFKcVRXRXpHemJyZjEwbFM2?=
 =?utf-8?B?SkdHU1lFMXpFMUdkYlRNbGxqL0VvVjNrVXlhVnhYVkowcUd0RXE4aGhsUzJZ?=
 =?utf-8?B?Y3hma3RRbnhNb2tIbU5IbDlZdnN6UTJNdUxGcW5GdHRYYWJiYVNtaVc2YVRC?=
 =?utf-8?B?MTlmLzBsalBNcGQ4Nm1uQTVXTWRqTDJCTnA1cmk5cGxoTmcxRjM4b1RENUJQ?=
 =?utf-8?B?Yk5DSWRnSkhBRDVSdG95ZFUzeVNvRzF1UW9Qa29HcUJMZjhTT1RpdUFvL2x2?=
 =?utf-8?B?MDlNMnU2N1h2bHNJRHVxZ09vUlFPMmhFUUcydFZ3UkpYOVJueUpNSi9yTGRs?=
 =?utf-8?B?eGphbkFMWDVjb1ZCQ2R4WHl5eXJONmwyR3JVdi9Bd3J6bVpsTHlYbE04aVJx?=
 =?utf-8?B?dDYzYTgzNVFSVU9PR21WRHRSR0hPYkNNTXYzTUpxUkxUNFMxaWRBZkJPaWtX?=
 =?utf-8?B?N0hFZzhReTRBZnJhZ0ZZUXlYUzU5SUJIYUdJeE1uMTNVTCtmMHdTWXpiWTBH?=
 =?utf-8?B?SFBOV3g2S1NEbUNaU0tBZzV6aUF3bjV1VS9hUTZPRlZRMmpkRDBNVUJLbmNp?=
 =?utf-8?B?SFNHOXNCTmVPN2RvUTdWWHdFTkVZays2ZDJEOGpPSjJMc3ZHZXlQVkpGMlcz?=
 =?utf-8?B?cUdaR3NXSmVBbndLVnlFZDViZWo3ckk1aUNTWWkxa2dnVDNRVXByMW9lSmNR?=
 =?utf-8?B?aG1MbEVEdHNwdHh4aC9RR2RTaGNEczZFbUF0MmphaG5lZWtwSUgyMTFkaGIr?=
 =?utf-8?B?QmJjT0xxQ1dVWlRDKytIMlJJakVld0k4c0djejBvb3kvbFdOQ2VlWk53MGZr?=
 =?utf-8?B?cDNGVnFmSFhZVWQwalN5V2tHM0plYlEvYk5qWHUrd0xTNGZlQitXUUVoV2x6?=
 =?utf-8?B?MHhPY0xhNHVGNkhZYXV3amdkMlkvOUkrN29oZDJweW94SlJqbWUwbjRjQlBo?=
 =?utf-8?B?QzVUQnBBOTRoQTNndzk3aG55S1NzQW8veXZBdFVhcnpPcFhpS2s2eWx1SzRv?=
 =?utf-8?B?NmI4Ukt5SXFXVVYwallPbGhtTyt3UjZjck5MWUtxYjFZbTRrSk1kK1ZoejIr?=
 =?utf-8?B?aUw1TUVjVEJsOUJFWGRseWdpanFOZWsrbWpRV0FHYkMwMkJrelZZeFFUNitZ?=
 =?utf-8?B?eS9uVEF4UG5Hd2FsSFBsQmlsMUpQVVpKZEd4NGgzT1lGb2xFenVDRXAxY016?=
 =?utf-8?B?MkNwN1k5aVVnUTZBTjRnQmhDOE93U3laamFxNDhpZzNna3d1VDdUT1d2RS8w?=
 =?utf-8?B?U1FBWnZjVmliMjFoQmtPKzF0UnRmcGNCenhFcVpJQkpUbHMrLzVJYmMzZ01K?=
 =?utf-8?B?NFJxVmZhNGIybEJmM1BmSDFCWVhKZDNEZVJNWHNnYUdyc2xQNkdGMVU1eDZO?=
 =?utf-8?B?c1ZyS2RDTW9KaWppTHZUUDYyS1VZUThSTmIzcGs4U3RFSGt2b2M5M0llekZB?=
 =?utf-8?B?YWVVZURaWDJyN29wWHNINmlURGE1V05HRnhhQml2R3lTNHpxeldZMDA5aHRv?=
 =?utf-8?B?N2hCRVhJWUY0MytRZWxGSTNrWG1BMGhUT2ZjZGhyZHVJMnNEK1NlVW5ZTXpV?=
 =?utf-8?B?cXNrQWEzS1pVYUVidm4za2x4QmYvMFFoVDVUdTdDZHh5VlgwWldlQzFYem1R?=
 =?utf-8?B?VnBuTXdxblBjQUdqc2ZRZlZxNXp2VWVKMFFnMHBiVGxNWitzWGxlUjdybkJY?=
 =?utf-8?B?MnMyTjlXY3B3Z04xSkpCbS9EQnEwa003UkMwRzVYWnNNRC9PSXB4Q0VWelhV?=
 =?utf-8?B?bkpvOG5adUdRUGRFS28xckE0UFltbFhyaHBLakY5SlpnWGdVWHJHR2xWUlBJ?=
 =?utf-8?B?ejhycE9VbFRxWU9tWVFkMWI1UEU0QnNrOFFwdFU1eVZSNDdramlYNlhFNUt0?=
 =?utf-8?B?WjNzTDY0VHdmL1JIeFBtUzZOekVEM0Q2ZWtHNithYnJwSk5hNjBHTE1wUXhT?=
 =?utf-8?B?NmlzTnNjUEIybmk2UTZUUmpja3JpbUQ2bzBjOHpPRkhSOXVabDlwNVIrZTlD?=
 =?utf-8?B?ZDB1c2tqbGJLMnk0L0hjbW1kcHdJM2R0TWN0eS9Wdm9sWTd6T2xKRkRZdkhH?=
 =?utf-8?B?WVZETjJvL08vSmFSQkMxV3Y4YlVtQTJuMUdEOWxPblBJV1B2cjZGbmIvSlN3?=
 =?utf-8?B?dVRaV3EzZkFFT1FxVlpHeERuZlFvMERLZzVNL01NUkZ5cS9zRlF6OVlGUlZo?=
 =?utf-8?B?K1EySCs1MTE4czJoaDZQaG5WZHh6T2Rxbk5Dd296SG5rYkhGbklJdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7872c0d6-5159-491d-e3c5-08da5378c7fa
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2022 11:25:44.6397 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N+DrF77sI8NAqL5mpRtm6i8jSMOA29rDuvKgRUxFMqJ5DqbteUllI/M2ElYfmtgZ9tenleGeIGE9966nztcN2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1335
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
Cc: rcampbell@nvidia.com, willy@infradead.org, apopple@nvidia.com,
 dri-devel@lists.freedesktop.org, linux-xfs@vger.kernel.org, linux-mm@kvack.org,
 jglisse@redhat.com, amd-gfx@lists.freedesktop.org, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 6/17/22 um 23:19 schrieb David Hildenbrand:
> On 17.06.22 21:27, Sierra Guiza, Alejandro (Alex) wrote:
>> On 6/17/2022 12:33 PM, David Hildenbrand wrote:
>>> On 17.06.22 19:20, Sierra Guiza, Alejandro (Alex) wrote:
>>>> On 6/17/2022 4:40 AM, David Hildenbrand wrote:
>>>>> On 31.05.22 22:00, Alex Sierra wrote:
>>>>>> Device memory that is cache coherent from device and CPU point of view.
>>>>>> This is used on platforms that have an advanced system bus (like CAPI
>>>>>> or CXL). Any page of a process can be migrated to such memory. However,
>>>>>> no one should be allowed to pin such memory so that it can always be
>>>>>> evicted.
>>>>>>
>>>>>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>>>>>> Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
>>>>>> Reviewed-by: Alistair Popple <apopple@nvidia.com>
>>>>>> [hch: rebased ontop of the refcount changes,
>>>>>>          removed is_dev_private_or_coherent_page]
>>>>>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>>>>>> ---
>>>>>>     include/linux/memremap.h | 19 +++++++++++++++++++
>>>>>>     mm/memcontrol.c          |  7 ++++---
>>>>>>     mm/memory-failure.c      |  8 ++++++--
>>>>>>     mm/memremap.c            | 10 ++++++++++
>>>>>>     mm/migrate_device.c      | 16 +++++++---------
>>>>>>     mm/rmap.c                |  5 +++--
>>>>>>     6 files changed, 49 insertions(+), 16 deletions(-)
>>>>>>
>>>>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>>>>>> index 8af304f6b504..9f752ebed613 100644
>>>>>> --- a/include/linux/memremap.h
>>>>>> +++ b/include/linux/memremap.h
>>>>>> @@ -41,6 +41,13 @@ struct vmem_altmap {
>>>>>>      * A more complete discussion of unaddressable memory may be found in
>>>>>>      * include/linux/hmm.h and Documentation/vm/hmm.rst.
>>>>>>      *
>>>>>> + * MEMORY_DEVICE_COHERENT:
>>>>>> + * Device memory that is cache coherent from device and CPU point of view. This
>>>>>> + * is used on platforms that have an advanced system bus (like CAPI or CXL). A
>>>>>> + * driver can hotplug the device memory using ZONE_DEVICE and with that memory
>>>>>> + * type. Any page of a process can be migrated to such memory. However no one
>>>>> Any page might not be right, I'm pretty sure. ... just thinking about special pages
>>>>> like vdso, shared zeropage, ... pinned pages ...
>>> Well, you cannot migrate long term pages, that's what I meant :)
>>>
>>>>>> + * should be allowed to pin such memory so that it can always be evicted.
>>>>>> + *
>>>>>>      * MEMORY_DEVICE_FS_DAX:
>>>>>>      * Host memory that has similar access semantics as System RAM i.e. DMA
>>>>>>      * coherent and supports page pinning. In support of coordinating page
>>>>>> @@ -61,6 +68,7 @@ struct vmem_altmap {
>>>>>>     enum memory_type {
>>>>>>     	/* 0 is reserved to catch uninitialized type fields */
>>>>>>     	MEMORY_DEVICE_PRIVATE = 1,
>>>>>> +	MEMORY_DEVICE_COHERENT,
>>>>>>     	MEMORY_DEVICE_FS_DAX,
>>>>>>     	MEMORY_DEVICE_GENERIC,
>>>>>>     	MEMORY_DEVICE_PCI_P2PDMA,
>>>>>> @@ -143,6 +151,17 @@ static inline bool folio_is_device_private(const struct folio *folio)
>>>>> In general, this LGTM, and it should be correct with PageAnonExclusive I think.
>>>>>
>>>>>
>>>>> However, where exactly is pinning forbidden?
>>>> Long-term pinning is forbidden since it would interfere with the device
>>>> memory manager owning the
>>>> device-coherent pages (e.g. evictions in TTM). However, normal pinning
>>>> is allowed on this device type.
>>> I don't see updates to folio_is_pinnable() in this patch.
>> Device coherent type pages should return true here, as they are pinnable
>> pages.
> That function is only called for long-term pinnings in try_grab_folio().
>
>>> So wouldn't try_grab_folio() simply pin these pages? What am I missing?
>> As far as I understand this return NULL for long term pin pages.
>> Otherwise they get refcount incremented.
> I don't follow.
>
> You're saying
>
> a) folio_is_pinnable() returns true for device coherent pages
>
> and that
>
> b) device coherent pages don't get long-term pinned
>
>
> Yet, the code says
>
> struct folio *try_grab_folio(struct page *page, int refs, unsigned int flags)
> {
> 	if (flags & FOLL_GET)
> 		return try_get_folio(page, refs);
> 	else if (flags & FOLL_PIN) {
> 		struct folio *folio;
>
> 		/*
> 		 * Can't do FOLL_LONGTERM + FOLL_PIN gup fast path if not in a
> 		 * right zone, so fail and let the caller fall back to the slow
> 		 * path.
> 		 */
> 		if (unlikely((flags & FOLL_LONGTERM) &&
> 			     !is_pinnable_page(page)))
> 			return NULL;
> 		...
> 		return folio;
> 	}
> }
>
>
> What prevents these pages from getting long-term pinned as stated in this patch?

Long-term pinning is handled by __gup_longterm_locked, which migrates 
pages returned by __get_user_pages_locked that cannot be long-term 
pinned. try_grab_folio is OK to grab the pages. Anything that can't be 
long-term pinned will be migrated afterwards, and 
__get_user_pages_locked will be retried. The migration of 
DEVICE_COHERENT pages was implemented by Alistair in patch 5/13 
("mm/gup: migrate device coherent pages when pinning instead of failing").

Regards,
   Felix


>
> I am probably missing something important.
>
P.S.: I'm on vacation and looking at a tiny screen. Hope I didn't miss 
anything myself.
