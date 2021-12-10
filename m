Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9555B4705F6
	for <lists+dri-devel@lfdr.de>; Fri, 10 Dec 2021 17:39:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DABBB10E338;
	Fri, 10 Dec 2021 16:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2067.outbound.protection.outlook.com [40.107.244.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8B7510E2AB;
 Fri, 10 Dec 2021 16:39:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ki9OpU2W/UHje94LexT912XAJLwqiappC2hgTdxtHZAM2WoYWbVW/vgiVEB5zR9FYy6QxMC4X/OwkFjCNFmpRCA27f5yVxXY37dhyXm4CKlawUqm3ALFoK9iqzF4IuGpVzw1JOivhJqnkVmf66WWSUGhQgI9wQBkNfnDnObEU7B9Vk7aPeF7tt24f+sugQQQpzmSA8I8SM9JuePFWX0ifNVEqrLlQV71cSCYzVFwUwDqTamgLcVCevcHCilSLVe2MnEj6pO+cjNBJGn/IFQF3HwmFvpsiOnlqVPEwl3I9HfPJoQ5glsUSdN0Uxi/CNG+JkMjSrQc4F3Fs93KNIxnPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rh4jmBvwEY2nt94lkeONIwZhxQcBnz9hoAnB1NqqLY0=;
 b=JhSZGfD2IvehN9QxMv4d02jJk3BcNqJDFKJgrGpc64GXFVaUWdA0XyGQogNPXhfWYx5XlRP5N/PoTKjN6FTz7Us8P38SthSz9xW5dA5D4O3dubyK8LGnSTSKBMc9Qgwatz3I+VOyrHjQLp9zb9uVK61Jg5GhQmFifQgeFog+zy9H23nWtTEVpTffg5xZPR1aXdhd4/N+sgCwk97b3pyakUVPWrKn3YI9NY0SMgGG8cu2fnnjyAKLKp0s5Jb5VF5sfTHPfKpiI1kUPIpfdOy+QNLZHL/snMLm04EgANOoRxDnKqwBa3QbVxgqrIfAaIzt0hJMLqALnHHju16PciiYLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rh4jmBvwEY2nt94lkeONIwZhxQcBnz9hoAnB1NqqLY0=;
 b=TVU5ZOz4BJvfUqb43nEqM6ZN4LjTHPI9r43N6bYtQOP4qgf/O5OZmGsMscJVD131ttIEIFzPavNikw3T/OtfkrgB93SfYwWF33RsIGpP/72Af4VtusyqUtG5FqRDh913RteGUGY7GaWXIcF04GRwQw7PXzEGRaSk9mI8C9czMzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5196.namprd12.prod.outlook.com (2603:10b6:408:11d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.25; Fri, 10 Dec
 2021 16:39:42 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300%7]) with mapi id 15.20.4755.022; Fri, 10 Dec 2021
 16:39:42 +0000
Subject: Re: [PATCH v2 03/11] mm/gup: migrate PIN_LONGTERM dev coherent pages
 to system
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, rcampbell@nvidia.com, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org,
 "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
References: <20211206185251.20646-1-alex.sierra@amd.com>
 <b9163ccc-829e-9939-8177-a66ab41187e7@amd.com>
 <72fe6b48-4aa5-b766-3f33-8c3445fdcc99@amd.com> <2613033.KcdVtnzQgr@nvdebian>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <4ceda6e1-76c4-d92a-e4a3-a78d08620058@amd.com>
Date: Fri, 10 Dec 2021 11:39:39 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2613033.KcdVtnzQgr@nvdebian>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: CH0PR13CA0002.namprd13.prod.outlook.com
 (2603:10b6:610:b1::7) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
Received: from [172.27.226.80] (165.204.55.251) by
 CH0PR13CA0002.namprd13.prod.outlook.com (2603:10b6:610:b1::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Fri, 10 Dec 2021 16:39:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c30a377-793c-4381-65fc-08d9bbfbaa3a
X-MS-TrafficTypeDiagnostic: BN9PR12MB5196:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB519694EBEF424DB6B845D27F92719@BN9PR12MB5196.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 42eDIuy+RUcZSCoroFkkH+H3BWGwQA5mJ4K1SzpgzHeo/8Tb5gCVjz5y2WdGx3iP+U3rla89AbkXfEY3sdy+fSOPEccoFZXwlxfIoeBrc2bbWxpJuJcp/BntDVj1fcecq9YpaTaumzyk3bhyF5PPD1puDL+MeT8dWqkHLUjCOAl8zgRyMp7rFQQV/Xporo9BXTjtxgopj4SKxx/ciM6Klm5LJ15nWld4ZvJvZj+YaOMWEGyQku99HBmnkYDRw6/B9IplXOOhOL5/jUeLgLGXVlUhyBgIJKaOm0qlQxfrPjU7/laVz0awIDDEDky/yky+S02h24DG95PIYAcLkscMrXM09tl+w0s5yuXOLtNHkV7FNmukVTp/VfsYx6P0XTk3ZM0e/di7QXTYf62bsuNHrsP8HmXwQhNGhz/x75CnLATtb2t/Na1iGVKM1a1aSwLKqyuw5KxbK+PA8OWG2ftywlzmKh6iaPxeupNKRFHmae2LGXqRBuEyOjwKKtmSq+njgmGJpvf+yJF/rU9E2hMJe+ps6SOhVSBJ3eU1rt7Sly9Gr833QnhJ/PaO7fVu4D9KhAs+vbVpo4jFN3s/WJYwTHgMyGesgG7BLdEz4DL55ZWFsA4OpxpxFZE/p4AVUZ56EdwsGn+HnZZXNBZMOlljMNMTqz4JksgftBAyndb+rp2rBJFVSPAdUdZofxx3GelnKIP2LymJMWMGZlqz7qI6Rwn2eflfgxruUMDXh7eQer8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6636002)(31696002)(38100700002)(16576012)(36756003)(2906002)(8676002)(8936002)(44832011)(36916002)(5660300002)(956004)(26005)(2616005)(83380400001)(186003)(31686004)(66556008)(66476007)(66946007)(86362001)(7416002)(508600001)(6486002)(110136005)(53546011)(316002)(4326008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eSt3aWt0MDBIaVo0ZGUrQTVxejNDU3hHS05KRWNKaHJqRkwzYnROYXh4WmJZ?=
 =?utf-8?B?VWVLVDlWUUhnNFJqNlBKbXdXNjUrdSt1cUpkN2pQNVNxaTJOS3o0eW1FckN1?=
 =?utf-8?B?cksyNnd4NUxHZnBEQmdrZlFhbHljU0RwYS9Bcjk1VVIzMm5Oc20vUTBGbzMz?=
 =?utf-8?B?T0tJcWtkQTZJREo3Q0cvMGpROGlNQXNnd1ZuSTdkYkxlZjZqRkhPM0FhaVdV?=
 =?utf-8?B?TUk3TDhZYk9Ha2dvMDhOcUVwenFvSmpBWGNsUERNRlJ3R2lMOTQ4bi9jZnJU?=
 =?utf-8?B?WFNaeHVYd0I1ekZSTkpSZmhibktqMXJYakJvL2ZveWRFYkE1WXRSVGlKZmRa?=
 =?utf-8?B?N3Eyd2RyampCa1hObmp5RW9qeUtsMEZHYXcrVUtHMHE2MXFDZXQwRFdiMVFK?=
 =?utf-8?B?SnVWais0TnlpV3A2Zi8zRXB6OFMxc1VFZ0xIeGdMeTJuOTMyU1YyYS9GQnFB?=
 =?utf-8?B?T0dLZWVvSmJMLysrei9jUjFiK3k1NUw2WWJwMjNZdlIrY1pPaytBVkN1a2VS?=
 =?utf-8?B?QVVTMmxFZ2phQjc4cGNoTjhCSXViSkh0cU5LK0hWMlFyZ2tWMmZEcHpFZnc5?=
 =?utf-8?B?ais1S3A2bDE5THRLdjhIWVcza1EvMnROYWh4U3BOcTArenNLVVdDelpuNTlF?=
 =?utf-8?B?MVpDTDBjd2Jjd3hwZDJlbEl2Wjk0b09XR2lNdnpFMm5namovd2ZTNkk1UlJr?=
 =?utf-8?B?LzNFM1BNTU5hbkJIbjVvcnZHa3ZSSXoxZVRUeFNXSno0OHFHV3JwYnpoV1pZ?=
 =?utf-8?B?cXZMZnhDM1BudGFFZ2lGTEdZV3U3aUE0SWREZ3VnUERzdWJTTHl2ZzJOUklR?=
 =?utf-8?B?SVc4dHFiU3BCbGtpVTRjQ0lGd05ROFlFVHR2OUtmRHJYdnFHazFoSFRWMU5z?=
 =?utf-8?B?TW1aYXZiZWJ4bFJiTC8vZzlLYzhGUmwzeW1aMTdDK2RMWXdsWkpROS9iaGFa?=
 =?utf-8?B?aHN0NXVSR0pCdnBFcE13UWNyeEFudnNsZlhrZ1dYNE5mRk1pYkh6dnFsZ1BK?=
 =?utf-8?B?V3B3d0R3UFV6eXB6RG82S0srRDEyUGVCRG5WUXJ6RDFBQWNBT29oV0J4Z1Zw?=
 =?utf-8?B?N2hnb0NBME9wUU1nZFVRdE40d2NqRExtQ2xaOGw3YUJtTTg2aGdlc0V4WU1R?=
 =?utf-8?B?YW5VRlJGTXFyWmtHdUtxQnpsbW1VbzdFUEZsWmx4ZHR1QVI4UG5YK1MxNkd4?=
 =?utf-8?B?OWtjdWthb1BXN3hIdnRTVVN5azl1M0JCTzlQa0xjdWpUMjZqYWhuQ0p0UGVt?=
 =?utf-8?B?OWhwcW9wQ2F3YUpDNG9UemRsQ0dUTFliT2dkVUZuUTFFajJFNmc4T2Q5SnEy?=
 =?utf-8?B?S0syRE5QdnpGLzNsK29DQkdOY3kzeE5DZDRXZklneElxb24ydzQ4UXVMU2Mw?=
 =?utf-8?B?M0hxNEZtZU8wSnJRdWhYaDEvbVlYY1ZuaUx0L1BKWFczNElYU205Mm9qMHAv?=
 =?utf-8?B?WUVqOVllNkpFbnVRU0dEUGx2Q0RWaHp6Q0o3RU9ERDFmSnFOSlB1cjdJc0Fq?=
 =?utf-8?B?L3U4eDFzRkQ1b2pzdE94YSt6R0s5NGJmS3MyVHV6bzJONlo5TDZVdlJNN3lB?=
 =?utf-8?B?cTg0cmFoZUxtdDNCWHpzcFN0RlErZWtEQ0Q2M1lVVDI0VzdCU2RCQXorZkd2?=
 =?utf-8?B?bWJFNTZ5MC94OUVJY2hnblg5b0J1TFZIK0xraWp1cXdIMTNUUDJYeXFlRzlS?=
 =?utf-8?B?cG1xcnFxeDRNM3RoYkw5Z1lQcXpkdE5oQ0FkWjdKR3RJVnBINzFOVVRlQVNL?=
 =?utf-8?B?MVp4MWJ4TUhvUlcvR3Y0YnZ5Zmk1cC81M2xTZVF0M2FwL09FNHl5Z3NrVTg0?=
 =?utf-8?B?RHgxTFlqdWpBV1FrQ1k3WnJGcU9keG11enJPZ3NsV0hKY2E1bG5YZ0JYaGV6?=
 =?utf-8?B?aGV6Y3Q5Z1hCcGl0WnI3cEMrMU5GMUw5NXc0V0ZZU29ESG9qOUEyZ0g0dWQ0?=
 =?utf-8?B?ampOS0VMN2lUU3R2bTBlS0F4c0ZRaDdJcUViZm00Q2NiRElGeEZpRkFaSmsw?=
 =?utf-8?B?a3Z0bUU5MmdxT0VRdExyOE9JLzlmWGtOMzh4V0Q3RkZsZkV5cERyM1YxY25O?=
 =?utf-8?B?NXplRlliWW5oU2k4dlpWdE1rcjVTbGJHSUY0WW9VWkpnb2phZzJnSGtxRVBT?=
 =?utf-8?B?d3cxVnRWQ2hTT2pXMGpUbFFFZVhaQktSMkVsajYrYUdhanV6anN3VXR0K1R6?=
 =?utf-8?Q?5qul1p++2YUfFvW5TxaIs5g=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c30a377-793c-4381-65fc-08d9bbfbaa3a
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2021 16:39:42.0110 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 110y5jQmWAJ84ApBYP47xMpIyscmjBxdmJNfwubyuXocXRI8xR0iwhAN4TB7NnyoSc1xOECGaBNdcfIsfNntuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5196
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
Cc: amd-gfx@lists.freedesktop.org, willy@infradead.org, jglisse@redhat.com,
 dri-devel@lists.freedesktop.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-12-09 8:31 p.m., Alistair Popple wrote:
> On Friday, 10 December 2021 3:54:31 AM AEDT Sierra Guiza, Alejandro (Alex) wrote:
>> On 12/9/2021 10:29 AM, Felix Kuehling wrote:
>>> Am 2021-12-09 um 5:53 a.m. schrieb Alistair Popple:
>>>> On Thursday, 9 December 2021 5:55:26 AM AEDT Sierra Guiza, Alejandro (Alex) wrote:
>>>>> On 12/8/2021 11:30 AM, Felix Kuehling wrote:
>>>>>> Am 2021-12-08 um 11:58 a.m. schrieb Felix Kuehling:
>>>>>>> Am 2021-12-08 um 6:31 a.m. schrieb Alistair Popple:
>>>>>>>> On Tuesday, 7 December 2021 5:52:43 AM AEDT Alex Sierra wrote:
>>>>>>>>> Avoid long term pinning for Coherent device type pages. This could
>>>>>>>>> interfere with their own device memory manager.
>>>>>>>>> If caller tries to get user device coherent pages with PIN_LONGTERM flag
>>>>>>>>> set, those pages will be migrated back to system memory.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Alex Sierra<alex.sierra@amd.com>
>>>>>>>>> ---
>>>>>>>>>     mm/gup.c | 32 ++++++++++++++++++++++++++++++--
>>>>>>>>>     1 file changed, 30 insertions(+), 2 deletions(-)
>>>>>>>>>
>>>>>>>>> diff --git a/mm/gup.c b/mm/gup.c
>>>>>>>>> index 886d6148d3d0..1572eacf07f4 100644
>>>>>>>>> --- a/mm/gup.c
>>>>>>>>> +++ b/mm/gup.c
>>>>>>>>> @@ -1689,17 +1689,37 @@ struct page *get_dump_page(unsigned long addr)
>>>>>>>>>     #endif /* CONFIG_ELF_CORE */
>>>>>>>>>     
>>>>>>>>>     #ifdef CONFIG_MIGRATION
>>>>>>>>> +static int migrate_device_page(unsigned long address,
>>>>>>>>> +				struct page *page)
>>>>>>>>> +{
>>>>>>>>> +	struct vm_area_struct *vma = find_vma(current->mm, address);
>>>>>>>>> +	struct vm_fault vmf = {
>>>>>>>>> +		.vma = vma,
>>>>>>>>> +		.address = address & PAGE_MASK,
>>>>>>>>> +		.flags = FAULT_FLAG_USER,
>>>>>>>>> +		.pgoff = linear_page_index(vma, address),
>>>>>>>>> +		.gfp_mask = GFP_KERNEL,
>>>>>>>>> +		.page = page,
>>>>>>>>> +	};
>>>>>>>>> +	if (page->pgmap && page->pgmap->ops->migrate_to_ram)
>>>>>>>>> +		return page->pgmap->ops->migrate_to_ram(&vmf);
>>>>>>>> How does this synchronise against pgmap being released? As I understand things
>>>>>>>> at this point we're not holding a reference on either the page or pgmap, so
>>>>>>>> the page and therefore the pgmap may have been freed.
>>>>>>>>
>>>>>>>> I think a similar problem exists for device private fault handling as well and
>>>>>>>> it has been on my list of things to fix for a while. I think the solution is to
>>>>>>>> call try_get_page(), except it doesn't work with device pages due to the whole
>>>>>>>> refcount thing. That issue is blocking a fair bit of work now so I've started
>>>>>>>> looking into it.
>>>>>>> At least the page should have been pinned by the __get_user_pages_locked
>>>>>>> call in __gup_longterm_locked. That refcount is dropped in
>>>>>>> check_and_migrate_movable_pages when it returns 0 or an error.
>>>>>> Never mind. We unpin the pages first. Alex, would the migration work if
>>>>>> we unpinned them afterwards? Also, the normal CPU page fault code path
>>>>>> seems to make sure the page is locked (check in pfn_swap_entry_to_page)
>>>>>> before calling migrate_to_ram.
>>>> I don't think that's true. The check in pfn_swap_entry_to_page() is only for
>>>> migration entries:
>>>>
>>>> 	BUG_ON(is_migration_entry(entry) && !PageLocked(p));
>>>>
>>>> As this is coherent memory though why do we have to call into a device driver
>>>> to do the migration? Couldn't this all be done in the kernel?
>>> I think you're right. I hadn't thought of that mainly because I'm even
>>> less familiar with the non-device migration code. Alex, can you give
>>> that a try? As long as the driver still gets a page-free callback when
>>> the device page is freed, it should work.
> Yes, you should still get the page-free callback when the migration code drops
> the last page reference.
>
>> ACK.Will do
> There is currently not really any support for migrating device pages based on
> pfn. What I think is needed is something like migrate_pages(), but that API
> won't work for a couple of reasons - main one being that it relies on pages
> being LRU pages.
>
> I've been working on a series to implement an equivalent of migrate_pages() for
> device-private (and by extension device-coherent) pages. It might also be useful
> here so I will try and get it posted as an RFC next week.
If we want to make progress on this patch series in the shorter term, we 
could just fail get_user_pages with FOLL_LONGTERM for DEVICE_COHERENT 
pages. Then add the migration support when your patch series is ready.

Regards,
   Felix


>
>   - Alistair
>
>> Alex Sierra
>>
>>> Regards,
>>>     Felix
>>>
>>>
>>>>> No, you can not unpinned after migration. Due to the expected_count VS
>>>>> page_count condition at migrate_page_move_mapping, during migrate_page call.
>>>>>
>>>>> Regards,
>>>>> Alex Sierra
>>>>>
>>>>>> Regards,
>>>>>>      Felix
>>>>>>
>>>>>>
>
>
