Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7CF553F7E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 02:26:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748EB112D9C;
	Wed, 22 Jun 2022 00:25:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09F87112D9A;
 Wed, 22 Jun 2022 00:25:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MUo29g+SzHQVYA2FfYIGRdnoY6zwyub9qZko1f4oXBKGKf/0bvvZEniY+6nvoz+GYEg31PLf7Df2ojwDyC7+YLWhYePgvybd/fD802Ip7Pxhg1OuUtP3Hm1/dqV/IWRCrJqBzIkmZy/jkL+WMfOvF4/Zr3Bi4WM6wsvdhSZELxaDS0iDbbBWlc//xINx8gbh+8xxqk+Pq/ZNe+kyWHnLK9q2Fw54PPgMkWaR9DsHhUTajW74UXiQrCiysxluK9keZijGT6oYbyMojyEQDutS8fnJRC0Z2A1Yd5p81BgagcZykeIyPnjDNh9WDrQ3tRk29aS+bI6OuQQAxt1WEovspg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6w34svrUQLF3Tp4x1rWdOpQe11+szgg1dnXVa4Fn9RM=;
 b=BZPjkvKI9BXMkw40hMAfrtnIHUPT8t/zJ3j1i/H81Q9lMv6hOyoicr0cuBBGVm0q7Q7GTqFgwTemlWstsPTzj1GAmdmbs5kYSRvx83AZW70zWPzvrDLQYG7+zEpFC1p8V4Vp+vu5bNy/ZGjxev1FBOe3J/omJL2HhFBaKzPTydt6+i3SyR1/twVCg9iAXdKuQq1biOWzoMjmifDLSVQGL5AzNKjNd9k9T8mI4bel1stBWheV9k0bkXse+fCq8yIWQgJm7FOnMatT31xvC5modJxY7OBoh0FP5NQkRl4E3tD5M2tZizC4vPgClF9VItXDGFgoxMduN9Al838qkuTbrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6w34svrUQLF3Tp4x1rWdOpQe11+szgg1dnXVa4Fn9RM=;
 b=RBfg5uGHacl86ahfXTlGGgCbaGnC5l2Rdoh9CMaV3Db1zrNApaEHTZX586HfNZA8aJiKij+kLGCEnY5D0snRoGvVX0ZlL70pWg/yeripmUHZ8Ga5Bh4vnxgxrOJ43IqODs2Dy7gSFZQITZ+DJvlPjszBh3TESWsYn/EJ9MqXS1Tlag359u6xIGW95QeUGm5Z+aDEB+kCg4/vnqX2vGwB6DtjJSgVcjP4wzEoeOMLxiREwQ6KAs0+u362IKTDkL3OgNyZH2yaMz3Pkca8nVu6wD6OwlqNyk6wLs6JpAjin1l5eIiiZo9GizKdgG8idjtORebsqWxB3+uC34xgCPD5lQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BYAPR12MB3176.namprd12.prod.outlook.com (2603:10b6:a03:134::26)
 by CY4PR12MB1413.namprd12.prod.outlook.com (2603:10b6:903:39::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.19; Wed, 22 Jun
 2022 00:25:53 +0000
Received: from BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::eca6:a4a7:e2b2:27e7]) by BYAPR12MB3176.namprd12.prod.outlook.com
 ([fe80::eca6:a4a7:e2b2:27e7%5]) with mapi id 15.20.5373.015; Wed, 22 Jun 2022
 00:25:53 +0000
References: <20220531200041.24904-1-alex.sierra@amd.com>
 <20220531200041.24904-2-alex.sierra@amd.com>
 <3ac89358-2ce0-7d0d-8b9c-8b0e5cc48945@redhat.com>
 <02ed2cb7-3ad3-8ffc-6032-04ae1853e234@amd.com>
 <7605beee-0a76-4ee9-e950-17419630f2cf@redhat.com>
 <ddcebcc1-fb0a-e565-f14d-77c9d48f2928@amd.com>
 <6aef4b7f-0ced-08cd-1f0c-50c22996aa41@redhat.com>
 <65987ab8-426d-e533-0295-069312b4f751@amd.com>
 <34e94bdb-675a-5d5c-6137-8aa1ee658d49@redhat.com>
 <87letq6wb5.fsf@nvdebian.thelocal>
 <643c44e7-48be-375b-c7ab-6a30b5ee2937@redhat.com>
 <f5b9f777-85a2-9c38-17f3-0c9be1eeb867@amd.com>
 <01cf9f24-d7fc-61e9-1c28-85dc5aabe645@redhat.com>
User-agent: mu4e 1.6.9; emacs 27.1
From: Alistair Popple <apopple@nvidia.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v5 01/13] mm: add zone device coherent type memory support
Date: Wed, 22 Jun 2022 10:16:27 +1000
In-reply-to: <01cf9f24-d7fc-61e9-1c28-85dc5aabe645@redhat.com>
Message-ID: <87h74d7dde.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0030.prod.exchangelabs.com (2603:10b6:a02:80::43)
 To BYAPR12MB3176.namprd12.prod.outlook.com
 (2603:10b6:a03:134::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 546f264d-56dc-4ccb-54b0-08da53e5c431
X-MS-TrafficTypeDiagnostic: CY4PR12MB1413:EE_
X-Microsoft-Antispam-PRVS: <CY4PR12MB1413E04C13030680839FBD96DFB29@CY4PR12MB1413.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A7JRtgMwjwx4Nqeogc0m0HYkO8asdNpPwNroh7D1FSDAKwLpkqjssv8tRD8ysMpaglC3rjCYa/YU6sr18fZo4ZinneNICsONWlUY9asE3ljg8ZChqu4UaHS/JXP7YyzS6XsqF/45/LX1hLkxktGDY8OwQQ48wTHDDuiX5RXwD/p+VzqrjUk9rDfqFf7ueJgAErVLrQ5UhLBmHQ8vHBZYY+/9I3G0fyFOki9o1YWuQzKe4J1YJ2ktim1AmUNqMrs9k7VlrYAen4IawSK7nn4SS9vl+w+mbwiCpKKntjXnfdmowJA5R1MzAD1HfromCi8f8qEqEpqpVucB88Z/pScUsteZDtGdOM8rgcpPr1RONDY8XYlGlrqP77kDgxa+q9qaR4qDJ+vrzHWUDfiQiI5clfnkO3Rf5GP6uBcmI5VPBNjENVNWsVBlPW25fZ6Lsv2YM7J+68BSeqSs4M78HJpAoIfH1iyiFruGMJLtJw8YmgzHy+Eu/MVS4VF4j7HG2k7PtrpJh8Hu1+jB3fG368/QN2CNRZgM4w0TcURDVgkPnoyOSp3JYo77BorpRYXmO3B8as4z8Tapoq3MFkwsSrpaBUd/3Mi4EcjmeGsK7uCQ/u4vWFMc84J/vtdGsok4YyPBRMDe8GAmKEQkmGs6VkeNXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3176.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(346002)(136003)(396003)(376002)(39860400002)(38100700002)(86362001)(5660300002)(8936002)(478600001)(2906002)(6486002)(7416002)(316002)(66946007)(8676002)(9686003)(54906003)(4326008)(66556008)(186003)(6666004)(83380400001)(53546011)(6506007)(41300700001)(66476007)(6916009)(26005)(6512007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?z7B4KjckXp0F3JZ8VPbOXYSyDLam7Fy0TvRl3+F2zOoDd8UAvEMBHM2ESKzA?=
 =?us-ascii?Q?oGcRUB608bq60cNQWFGz4q77RNZlu1TEMNCOAIS4CPxMwzEKonqOBk8/QmGL?=
 =?us-ascii?Q?DTO2/yVcgbae5oOBUKfhIZv675GgmkKxj56La1MzkdWl6cl3EsFiqSGWUnOZ?=
 =?us-ascii?Q?akmNJKTxHgQDWMS30AHb9Xt/PGsdyHV0BQkzXoh783vA1rPke1hEupghnLnC?=
 =?us-ascii?Q?HrWX4JZcWbTqDNkVpBgiKzU8k2khnWYrvZD0uwQb4blHcPe3ury48r26GXsQ?=
 =?us-ascii?Q?KxxHPWM2qLxK83Ph6oomiPrTDhKdvbklp4gzQ5tmYKVXLGevG3qyc2wx5fha?=
 =?us-ascii?Q?XFyJao4l8jqUnXobopeQlgodGm2yMJDB2lpcc9vLPUVZQ2qa4Izw00bpB1bq?=
 =?us-ascii?Q?3LG/WuSXCW6s/89Lvz2wCpkPUjYjmFNwUKlKNFKEYU6waFeEntq63O50H/D/?=
 =?us-ascii?Q?5tQqJNI/VxPVgFaKX6GGDEsfimjYTP1aDvQxMJ7V8XlvHfF8WIepAKdDFKKJ?=
 =?us-ascii?Q?SQnytdjtvHWR5LCBR+bgqIPw4mGivSittSQPNKqRgVGHZE5YBT8e7tWrxb5i?=
 =?us-ascii?Q?pW+Ox1+VlMxHphD3TaQFJwCh4MjhtgfGIFS1rvUFQXGep5kQzT1j23exqWn+?=
 =?us-ascii?Q?grBjp1cxB2sBOQvS/NZRHxyYbeMn6OnAHYpuFLk+BLyfICNzp+PubH+JglfX?=
 =?us-ascii?Q?yASwBFibmRui/RsniwBO8X9xMdHh1/bxWka1RiupR98qG4W0C+gf1Y6XkA07?=
 =?us-ascii?Q?KVwIEcDSkYZznWPyspT24NzwO1udasPTrddjrat3Q0fTxeQ++I0lBzpAc/um?=
 =?us-ascii?Q?L0GOZujl4RpqJxP5PC1nvqy6jcv99GnfiP8IFd+5nf4iCkZot4bY6OY7OA1o?=
 =?us-ascii?Q?e2ixnd8jMnSZidjb4NWgDXmI7yAfq9St6dGi7oL0NNDtBETVrJ0DMzg5m4jg?=
 =?us-ascii?Q?sqczaWdBlj62fdciFKSInZu2U8106IvpPQJdJcBJunoDCzKRzv+gjCsETGw6?=
 =?us-ascii?Q?jaF3XDZIchxmy51q3AmYf61zV8lkKMLt2zC0uCCCRm6m2sSQspDj4znEO2Is?=
 =?us-ascii?Q?XsDOG/v8CxAGHUYTLhjBNwJ23+UctnD/KxfHdbkMS79kbszCN5BCUWWTuBpd?=
 =?us-ascii?Q?ZeSz+Bp4EuXaoW0LFugdQLC8q3kFxorUUCGXCy85hUrYLq2oFMkSU3XzyVHC?=
 =?us-ascii?Q?jTG7/eiTUwS7Por69x79EOc6Paxch8mrMTNOI74AnYRwktVfvzBBYSQSaraZ?=
 =?us-ascii?Q?otp8zpHEIZc9MWC/nqCR1tW1chpwDjVoJsYHV5OfH2qCxar4Vs8kYOdl5iDs?=
 =?us-ascii?Q?Hq/QrNJ5I9ie8d7/MJV1RQ3ddcWrtMVGjIlDMXGHDjzXtv7aAIHLiOVREEYG?=
 =?us-ascii?Q?85r6h64r3FCLAegtaV1N8wNP2h6TpXBMgsvp4BcIJ4D4pYrbcYjzO8qAsL/f?=
 =?us-ascii?Q?tx9fQIfqznfGN5ylIZgyn6UagKHhowb/HltgiZWh0ly8yFv6KccWcBU0WnMf?=
 =?us-ascii?Q?KcnpPaG+QWYtVUX+uClQhWWcUbKuV86qCv9wF1uyKZrRIcs4HNEYPD5FfWTp?=
 =?us-ascii?Q?0AHAI7OA5i73MaJr9E8TWkDgUNnLLfwUAj+s/Z+S1WdmeLzWrIY0GWXioe9j?=
 =?us-ascii?Q?RjEI5y1MmkmsVd1mGN8Qy0pj55UeAo/tnpJxac+2on8gjfZgXaPBbKSXAuJG?=
 =?us-ascii?Q?b+e/hBKuP5LtlsXZkCPhZuBucvxdUzIlP54D3mCX0YUT9BULhWUPNbrygEvW?=
 =?us-ascii?Q?hZ6SiVKmsQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 546f264d-56dc-4ccb-54b0-08da53e5c431
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2022 00:25:53.3342 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eEWcwKTsM8F0zesYIlFdl/wxRZ+jKPRR79xEgGUVlVGIfhJmck6vD5opTG156FAIfQaxrFTxMj2Y41U0LzQ0qw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1413
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
Cc: "Sierra Guiza, Alejandro \(Alex\)" <alex.sierra@amd.com>,
 rcampbell@nvidia.com, willy@infradead.org,
 Felix Kuehling <felix.kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 linux-xfs@vger.kernel.org, linux-mm@kvack.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, akpm@linux-foundation.org,
 linux-ext4@vger.kernel.org, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


David Hildenbrand <david@redhat.com> writes:

> On 21.06.22 18:08, Sierra Guiza, Alejandro (Alex) wrote:
>>
>> On 6/21/2022 7:25 AM, David Hildenbrand wrote:
>>> On 21.06.22 13:55, Alistair Popple wrote:
>>>> David Hildenbrand<david@redhat.com>  writes:
>>>>
>>>>> On 21.06.22 13:25, Felix Kuehling wrote:
>>>>>> Am 6/17/22 um 23:19 schrieb David Hildenbrand:
>>>>>>> On 17.06.22 21:27, Sierra Guiza, Alejandro (Alex) wrote:
>>>>>>>> On 6/17/2022 12:33 PM, David Hildenbrand wrote:
>>>>>>>>> On 17.06.22 19:20, Sierra Guiza, Alejandro (Alex) wrote:
>>>>>>>>>> On 6/17/2022 4:40 AM, David Hildenbrand wrote:
>>>>>>>>>>> On 31.05.22 22:00, Alex Sierra wrote:
>>>>>>>>>>>> Device memory that is cache coherent from device and CPU point of view.
>>>>>>>>>>>> This is used on platforms that have an advanced system bus (like CAPI
>>>>>>>>>>>> or CXL). Any page of a process can be migrated to such memory. However,
>>>>>>>>>>>> no one should be allowed to pin such memory so that it can always be
>>>>>>>>>>>> evicted.
>>>>>>>>>>>>
>>>>>>>>>>>> Signed-off-by: Alex Sierra<alex.sierra@amd.com>
>>>>>>>>>>>> Acked-by: Felix Kuehling<Felix.Kuehling@amd.com>
>>>>>>>>>>>> Reviewed-by: Alistair Popple<apopple@nvidia.com>
>>>>>>>>>>>> [hch: rebased ontop of the refcount changes,
>>>>>>>>>>>>           removed is_dev_private_or_coherent_page]
>>>>>>>>>>>> Signed-off-by: Christoph Hellwig<hch@lst.de>
>>>>>>>>>>>> ---
>>>>>>>>>>>>      include/linux/memremap.h | 19 +++++++++++++++++++
>>>>>>>>>>>>      mm/memcontrol.c          |  7 ++++---
>>>>>>>>>>>>      mm/memory-failure.c      |  8 ++++++--
>>>>>>>>>>>>      mm/memremap.c            | 10 ++++++++++
>>>>>>>>>>>>      mm/migrate_device.c      | 16 +++++++---------
>>>>>>>>>>>>      mm/rmap.c                |  5 +++--
>>>>>>>>>>>>      6 files changed, 49 insertions(+), 16 deletions(-)
>>>>>>>>>>>>
>>>>>>>>>>>> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
>>>>>>>>>>>> index 8af304f6b504..9f752ebed613 100644
>>>>>>>>>>>> --- a/include/linux/memremap.h
>>>>>>>>>>>> +++ b/include/linux/memremap.h
>>>>>>>>>>>> @@ -41,6 +41,13 @@ struct vmem_altmap {
>>>>>>>>>>>>       * A more complete discussion of unaddressable memory may be found in
>>>>>>>>>>>>       * include/linux/hmm.h and Documentation/vm/hmm.rst.
>>>>>>>>>>>>       *
>>>>>>>>>>>> + * MEMORY_DEVICE_COHERENT:
>>>>>>>>>>>> + * Device memory that is cache coherent from device and CPU point of view. This
>>>>>>>>>>>> + * is used on platforms that have an advanced system bus (like CAPI or CXL). A
>>>>>>>>>>>> + * driver can hotplug the device memory using ZONE_DEVICE and with that memory
>>>>>>>>>>>> + * type. Any page of a process can be migrated to such memory. However no one
>>>>>>>>>>> Any page might not be right, I'm pretty sure. ... just thinking about special pages
>>>>>>>>>>> like vdso, shared zeropage, ... pinned pages ...
>>>>>>>>> Well, you cannot migrate long term pages, that's what I meant :)
>>>>>>>>>
>>>>>>>>>>>> + * should be allowed to pin such memory so that it can always be evicted.
>>>>>>>>>>>> + *
>>>>>>>>>>>>       * MEMORY_DEVICE_FS_DAX:
>>>>>>>>>>>>       * Host memory that has similar access semantics as System RAM i.e. DMA
>>>>>>>>>>>>       * coherent and supports page pinning. In support of coordinating page
>>>>>>>>>>>> @@ -61,6 +68,7 @@ struct vmem_altmap {
>>>>>>>>>>>>      enum memory_type {
>>>>>>>>>>>>      	/* 0 is reserved to catch uninitialized type fields */
>>>>>>>>>>>>      	MEMORY_DEVICE_PRIVATE = 1,
>>>>>>>>>>>> +	MEMORY_DEVICE_COHERENT,
>>>>>>>>>>>>      	MEMORY_DEVICE_FS_DAX,
>>>>>>>>>>>>      	MEMORY_DEVICE_GENERIC,
>>>>>>>>>>>>      	MEMORY_DEVICE_PCI_P2PDMA,
>>>>>>>>>>>> @@ -143,6 +151,17 @@ static inline bool folio_is_device_private(const struct folio *folio)
>>>>>>>>>>> In general, this LGTM, and it should be correct with PageAnonExclusive I think.
>>>>>>>>>>>
>>>>>>>>>>>
>>>>>>>>>>> However, where exactly is pinning forbidden?
>>>>>>>>>> Long-term pinning is forbidden since it would interfere with the device
>>>>>>>>>> memory manager owning the
>>>>>>>>>> device-coherent pages (e.g. evictions in TTM). However, normal pinning
>>>>>>>>>> is allowed on this device type.
>>>>>>>>> I don't see updates to folio_is_pinnable() in this patch.
>>>>>>>> Device coherent type pages should return true here, as they are pinnable
>>>>>>>> pages.
>>>>>>> That function is only called for long-term pinnings in try_grab_folio().
>>>>>>>
>>>>>>>>> So wouldn't try_grab_folio() simply pin these pages? What am I missing?
>>>>>>>> As far as I understand this return NULL for long term pin pages.
>>>>>>>> Otherwise they get refcount incremented.
>>>>>>> I don't follow.
>>>>>>>
>>>>>>> You're saying
>>>>>>>
>>>>>>> a) folio_is_pinnable() returns true for device coherent pages
>>>>>>>
>>>>>>> and that
>>>>>>>
>>>>>>> b) device coherent pages don't get long-term pinned
>>>>>>>
>>>>>>>
>>>>>>> Yet, the code says
>>>>>>>
>>>>>>> struct folio *try_grab_folio(struct page *page, int refs, unsigned int flags)
>>>>>>> {
>>>>>>> 	if (flags & FOLL_GET)
>>>>>>> 		return try_get_folio(page, refs);
>>>>>>> 	else if (flags & FOLL_PIN) {
>>>>>>> 		struct folio *folio;
>>>>>>>
>>>>>>> 		/*
>>>>>>> 		 * Can't do FOLL_LONGTERM + FOLL_PIN gup fast path if not in a
>>>>>>> 		 * right zone, so fail and let the caller fall back to the slow
>>>>>>> 		 * path.
>>>>>>> 		 */
>>>>>>> 		if (unlikely((flags & FOLL_LONGTERM) &&
>>>>>>> 			     !is_pinnable_page(page)))
>>>>>>> 			return NULL;
>>>>>>> 		...
>>>>>>> 		return folio;
>>>>>>> 	}
>>>>>>> }
>>>>>>>
>>>>>>>
>>>>>>> What prevents these pages from getting long-term pinned as stated in this patch?
>>>>>> Long-term pinning is handled by __gup_longterm_locked, which migrates
>>>>>> pages returned by __get_user_pages_locked that cannot be long-term
>>>>>> pinned. try_grab_folio is OK to grab the pages. Anything that can't be
>>>>>> long-term pinned will be migrated afterwards, and
>>>>>> __get_user_pages_locked will be retried. The migration of
>>>>>> DEVICE_COHERENT pages was implemented by Alistair in patch 5/13
>>>>>> ("mm/gup: migrate device coherent pages when pinning instead of failing").
>>>>> Thanks.
>>>>>
>>>>> __gup_longterm_locked()->check_and_migrate_movable_pages()
>>>>>
>>>>> Which checks folio_is_pinnable() and doesn't do anything if set.
>>>>>
>>>>> Sorry to be dense here, but I don't see how what's stated in this patch
>>>>> works without adjusting folio_is_pinnable().
>>>> Ugh, I think you might be right about try_grab_folio().
>>>>
>>>> We didn't update folio_is_pinnable() to include device coherent pages
>>>> because device coherent pages are pinnable. It is really just
>>>> FOLL_LONGTERM that we want to prevent here.
>>>>
>>>> For normal PUP that is done by my change in
>>>> check_and_migrate_movable_pages() which migrates pages being pinned with
>>>> FOLL_LONGTERM. But I think I incorrectly assumed we would take the
>>>> pte_devmap() path in gup_pte_range(), which we don't for coherent pages.
>>>> So I think the check in try_grab_folio() needs to be:
>>> I think I said it already (and I might be wrong without reading the
>>> code), but folio_is_pinnable() is *only* called for long-term pinnings.
>>>
>>> It should actually be called folio_is_longterm_pinnable().
>>>
>>> That's where that check should go, no?
>>
>> David, I think you're right. We didn't catch this since the LONGTERM gup
>> test we added to hmm-test only calls to pin_user_pages. Apparently
>> try_grab_folio is called only from fast callers (ex.
>> pin_user_pages_fast/get_user_pages_fast). I have added a conditional
>> similar to what Alistair has proposed to return null on LONGTERM &&
>> (coherent_pages || folio_is_pinnable) at try_grab_folio. Also a new gup
>> test was added with LONGTERM set that calls pin_user_pages_fast.
>> Returning null under this condition it does causes the migration from
>> dev to system memory.
>>
>
> Why can't coherent memory simply put its checks into
> folio_is_pinnable()? I don't get it why we have to do things differently
> here.

I'd made the reasonable assumption that
folio_is_pinnable()/is_pinnable_page() were used to check if the
folio/page is pinnable or not regardless of FOLL_LONGTERM. Looking at
the code more closely though I see both are actually only used on paths
checking for FOLL_LONGTERM pinning.

So I agree - we should rename these
folio_is_longterm_pinnable()/is_longterm_pinnable_page() and add the
check for coherent pages there. Thanks for pointing that out.

 - Alistair

>> Actually, Im having different problems with a call to PageAnonExclusive
>> from try_to_migrate_one during page fault from a HMM test that first
>> migrate pages to device private and forks to mark as COW these pages.
>> Apparently is catching the first BUG VM_BUG_ON_PGFLAGS(!PageAnon(page),
>> page)
>
> With or without this series? A backtrace would be great.
