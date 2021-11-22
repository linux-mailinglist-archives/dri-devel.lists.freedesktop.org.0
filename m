Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 155D34593D3
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 18:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF0B89DC7;
	Mon, 22 Nov 2021 17:17:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D28689DC7;
 Mon, 22 Nov 2021 17:17:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KSrJVCx2LWgEAgh/8H4zoC3oON2WR89hzSgj+RxvVwTXZ4vZ/eCvQbT5WWiski7HfnIv5ZsWzkQXJ7EfeTlvl3Oxy+zIX+z7O+W0dWLy34/lBWut1+OLuFD1Oft+AfVp9Qll4CMpQLe1t0p8HAcoamy/MovvpHBqL1waNGVGCeeAezpal+ouytrXC72kChAi5GgAIqsQR2+kZR14KJZ/dNI8IUvJSMWyFEs0Lp9sKYP4hKSgoGgbPIZujq5JAMHe5QahlWpAbwkKRH3s4pWapjNky2ymeTt87bq4oSX1q8cPJWeUEVsKW030+O0rUNUTznStwhBB+gB/0tKeTh7oeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WRpMjV4deLfHhSglqxxr1VjBEnMn/YOOOP211cMlJ7o=;
 b=dlVJkgs7CoGzSw357Urj3S9n4CePaAnWUHjHqiXtP7QxKCnR/iyv8/kvXw2lfpPNbET2ah7rpUbfVC1FekAxSul0tTsfvHP6LHRRFNlbKp8M3wIlo+BZtegrc02rsSyX0WfbE30BfxE0ZfPDz9LlrNagSJ5t0I1gpJkgNkZ8swAHgxpb3jRI6kq7fVvcXb4Z548lFLkkr6xhL6gvUwvMDS9z8n/baNg6j0qVhq4Xc2Z8l3fZEEa27YVZp5yarw3S4WwQcdHKPgUG3GwSDkPIeJWDokbc7fH9bVCYzVj5QUsH51WurJXEOSX1D0ve3VU3PF80etsqC3mw1ZGMaWbcgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WRpMjV4deLfHhSglqxxr1VjBEnMn/YOOOP211cMlJ7o=;
 b=oNDus5sTCC7eMo8e9/wkwgeyL3JDw+WBm3sd6neq4wwELq819avzZHu8Yx5c5AiBYW/53W7DZV+i3ADcXH1QTkukug1wQfJ/MxyLTYp6KgvJiH0CCVog9oKYWd9ZGmmH+bNTClLhYHDhG7Q+7ablNiA3twcHwmbgP6Z+p4DLKOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5193.namprd12.prod.outlook.com (2603:10b6:408:11a::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Mon, 22 Nov
 2021 17:16:58 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300%8]) with mapi id 15.20.4713.025; Mon, 22 Nov 2021
 17:16:58 +0000
Subject: Re: [PATCH v1 1/9] mm: add zone device coherent type memory support
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, rcampbell@nvidia.com, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, Alex Sierra <alex.sierra@amd.com>
References: <20211115193026.27568-1-alex.sierra@amd.com>
 <1997502.P62F5Z1OZk@nvdebian> <637b19c0-5ec4-b96b-f6f6-c17313f03762@amd.com>
 <4157439.BacSOyMZPU@nvdebian>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <f45fb007-ccc4-4d09-b609-09faa81d3b81@amd.com>
Date: Mon, 22 Nov 2021 12:16:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <4157439.BacSOyMZPU@nvdebian>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0098.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::7) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
Received: from [192.168.2.100] (142.127.191.123) by
 YT1PR01CA0098.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.21 via Frontend Transport; Mon, 22 Nov 2021 17:16:57 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b255e453-f942-411a-c932-08d9addbe3a3
X-MS-TrafficTypeDiagnostic: BN9PR12MB5193:
X-Microsoft-Antispam-PRVS: <BN9PR12MB51939358B80A49B43BEEBA98929F9@BN9PR12MB5193.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ftyjYxevAZNg7PxqiutK0mFQhyxPDmeERrtSfk9hIom6M4jRArhSwsEB0hsF4lqUDu9vhGffHs4+lUNl2eFl7NwVicn9s7FTbE6wZzsDVvjKwpBecmfqC3QjVCxkB4CZskgQn/HzAHNLkQ1S+GDd/iOvGge+Ys6bi9jjiOxTiIfL8JI6WM0P6bCzc2o+1af1lA6k9SEXAjHhwjnoprbg+HZV6cq7plkjSzPyYD+XAB6SrfGP6lKTt1PEOtQFzeGl3C1Nai8WKthHQTsdM9z8eU1SNRDxNB6wpQJGxydPGYN2MxFkJFKOAEP1SN/oHTvmmd0rZMej/3uaKMxI3ot2tPUstvi05BFMR8OujLcLDoXsoLngDK5gD8qH5NcTOJ+JNAG7yYYcUOQsv4GC9KzV/DbDhjbBxnHnGyEvuLOrA6/x1TtdpTRO1wsLbb4hpTSy8gL/+i8IXX5ePKTqVl5FzN3ZOUkmWpUACZvpRROZBTL3GZba1xLSZXuIBrrK2485QA/YF45e6buYyI8NjaVEGycqy/oH3ZlK/8QGLEEkAUAkOwiVA3BdYarpXgBjFVWZbK9WPdCiMjBvDA4n20hCBwOwlZ7dfklxwtgFIBAvgmNXTCeB/gRCE8BpCiBXnQImpl//PlfiLv3KIpiI2HEcRhTtvV5iYf6SStrovzx2iwlv4B0WKvfxBZYJHydo8tnWR5AvWcVyBJNxSeLYMlODFignZbhS9LnXvY+gmdaVDmjC4TfGbzNoa/WmxWI2K5JeUlzMrayOXO9V0g7Ov1lpmb9o41jXAKMQjaw88+W7quNhtef/sj65vS1JfikGQiqB05eOxs2Eh3SOrXYQV6ve0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(31696002)(66946007)(186003)(966005)(7416002)(508600001)(16576012)(31686004)(6486002)(66476007)(66556008)(36756003)(316002)(110136005)(8936002)(956004)(86362001)(2616005)(6636002)(2906002)(8676002)(26005)(4001150100001)(38100700002)(44832011)(5660300002)(4326008)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MjBDckxDK01Sd1Y2aXVhRmZuVk1nTDY2ZHdmY1FDUi9ZeFhUK1pkZEJxaDd3?=
 =?utf-8?B?T1ZjQlNraG5QWEZSR3g0Q2M1SHpJd21jQkVYckw3TTRMTXJWOTlULy9COUMr?=
 =?utf-8?B?VXk1S0g3Vjg4Z0crSHNCKzRSc1Joa3ZJWisyaXJlM0ZhaDR4NHd1SUcyaUtE?=
 =?utf-8?B?QmE5aHUra3dYWjJmOWZSNnZMdU9ZZVVDOTM1SUh3TGFWTXVQdXhiUmZxQTVV?=
 =?utf-8?B?MU5TSUZSRGVwY1JmUTJxUXNHUUJDS2F5NEVOZGpmcDRYV2EycWgxMXNUU2NC?=
 =?utf-8?B?N1pjUEU0UFVISHdsNDA0c3lCUzAzU1hGdXdTS082clEvd3R3a2JZMmtTY3Zj?=
 =?utf-8?B?UVRnTDFrUGpray9OZExqeU51Y3hxZkFXa0NFNHJBQ2RmbTJlYzMxOERpY0x3?=
 =?utf-8?B?UUcyZ2ROeEM3NEFjcCs1aG5uVTM0dmtqb29tZFlNRktJb0lreEJQbUFvdlhN?=
 =?utf-8?B?cG8yaTFja1BMV29NMGFGNDB1YlBjUDdKT1Mwd21maWRDNmtBZ2VlTXNhTC9X?=
 =?utf-8?B?Nzk3cFdGV08xZTkrQ2lOZTFHbWFNQXdFSkc4TXZvbzNpOUJTVE9KTXZic2kw?=
 =?utf-8?B?SjNVSzU1c2c0dEs2dE5pUTg5N1UvZWFsTytoQzRVYlZQQi9BZ2Rqb0JTRmZW?=
 =?utf-8?B?cDZ5ZENVUHlGcE5vSEQ4MnB4SEFRSDFIVWR1SlMyVTl6eUx3S2hDNTErM1F1?=
 =?utf-8?B?bEhJaHRlSkFNY3FiM2pVakZHaVR3WTlhN2VpS01GL1M4eDhTMnRRZHVJSWUv?=
 =?utf-8?B?cktvMnVvTXRIdHA1REZtdlRXSk96ZkpWTFFVSFZZOFhXUlNZdjMwZ0NZUTFP?=
 =?utf-8?B?YVVyK0lReFhtV1VEdDZkQkdORnJJdjJXeG13Q05ZNVNLTGFVZ0p6ZWdvQ2JQ?=
 =?utf-8?B?T3d3bzF5dVVQelI2blk5N3RmSFduOGlWUVhpQUdpWWxVZ0xqdytkM0V6MzF6?=
 =?utf-8?B?RGhzYmpJQVdtSTVMR2FWYTVSOXNZLzh5Z2UzVWVzZWIvNkdwS2VxY0cwVDh6?=
 =?utf-8?B?V1NQTHZLNTJadG9iU2FqNHhtMEhhYkhSK29ncGx2aXpKaG1mNmdUYVJWczVi?=
 =?utf-8?B?VmlUcGtVeFdQbmZUanoyZkxSUGNvczhuMU5ibWc3KzNWQ3VTMWg5blNkN0ZJ?=
 =?utf-8?B?dnZmUitiZjhDSWNTaThMWmU3eEl1Mnp6YWx3R2M2bW5jKzI0ZDhFbUhzayti?=
 =?utf-8?B?d0dGWnJSUDV1bCtvVk5oZzl5NUlwMyt0SmdzTXhLVDR0OWxpNmR1T2FBWWt1?=
 =?utf-8?B?TnhzQXN6MXNobURDaWRMNmRzaElTNmJseFRPY0ZMZ0VrNnVzTHhodDM1ZVlt?=
 =?utf-8?B?VFBGRkU1T1ZSRGJHTWJpdjRUUDdra2NlVzNUQS9jUVdXNFBRSG1oRklUZ2I1?=
 =?utf-8?B?aHptcVBuK2ZXVUY1ZkY0V3ZwdXgwZ2VybzB1eTRhTlIxM2l5cjljdEQ3MHgr?=
 =?utf-8?B?UW5DRmRIZkkvSlhIclNWbjNkUUpjVEpDM2REUi9XaS8xUzNZbllVbUQ3RjhH?=
 =?utf-8?B?VkVFSHYxZ3R3L0dYV3d2Ulg4QjdBSmo0S0xQOWw2cXhOdkJkcTNpR09UaWlk?=
 =?utf-8?B?Y1RLZTU1aERYeUFBZXBManV6UGU1UVhwZXo5dXQzMmxoQjBrNGhWWC9qN3ph?=
 =?utf-8?B?b0hyQWNiVFlUeHVBM3Z5cjVWY05Xb1pmeHk3clRvQWNTRkFYNHhNRThXZHow?=
 =?utf-8?B?MWJYeVlUNXlWdDR2M0lsTm1pQWRrcDVhOG1VNUE3bnZDQ0h2clR6ZVZSczMz?=
 =?utf-8?B?dlEvek1Qc0ZrQy8yNXVBRGFuMUNCS1ZpNU14WlREN0lVUkpQYUcrbndYMGFF?=
 =?utf-8?B?TXphL3QzSzgyOGlFa3BlUTV5YlFXQzhFcmZSTVNNdmJtZTEva1k0Lzk0Rk5x?=
 =?utf-8?B?OGFCQU5NNWY2U0RveGtaU25XUnhOU3ZYWW5tTWRhSko4cW9tbHIxYkI1R1RO?=
 =?utf-8?B?aXp3RjQ3dEZBTUMvdFF0eFVCWjB2MmZPT3RlSjNrODQwdGdCQjhFcVVjT0J3?=
 =?utf-8?B?cWR3TDdFZG54d1IweEljN0dQenJpOFU1VW85SjE0T0NMdXJUanZqVHB6c1lr?=
 =?utf-8?B?ekhTSDBMejU5emo0dnBJditFblAwRUdsME1GVWYzT0xHOWVBTzZNNGhnOURv?=
 =?utf-8?B?TjlIUkl3R1BBZHhoVDR0ZVNkYzIyVzlsMDVSM3d3eDY4UFM5aXRUeEYvalh2?=
 =?utf-8?Q?gl2VTYJ9ulhgigXY2zc+d9U=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b255e453-f942-411a-c932-08d9addbe3a3
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2021 17:16:57.9993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/JkKpLvOsR4DqnBusLVIJ5ysRlQEul/dHbVxoYm5160m+jN0mwNeLQ3ye7NI70gDxLij5nKsDJY9poyn1diYw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5193
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

Am 2021-11-21 um 9:40 p.m. schrieb Alistair Popple:
>>>> diff --git a/mm/migrate.c b/mm/migrate.c
>>>> index 1852d787e6ab..f74422a42192 100644
>>>> --- a/mm/migrate.c
>>>> +++ b/mm/migrate.c
>>>> @@ -362,7 +362,7 @@ static int expected_page_refs(struct address_space *mapping, struct page *page)
>>>>  	 * Device private pages have an extra refcount as they are
>>>>  	 * ZONE_DEVICE pages.
>>>>  	 */
>>>> -	expected_count += is_device_private_page(page);
>>>> +	expected_count += is_device_page(page);
>>>>  	if (mapping)
>>>>  		expected_count += thp_nr_pages(page) + page_has_private(page);
>>>>  
>>>> @@ -2503,7 +2503,7 @@ static bool migrate_vma_check_page(struct page *page)
>>>>  		 * FIXME proper solution is to rework migration_entry_wait() so
>>>>  		 * it does not need to take a reference on page.
>>>>  		 */
>>> Note that I have posted a patch to fix this - see
>>> https://lore.kernel.org/all/20211118020754.954425-1-apopple@nvidia.com/ This
>>> looks ok for now assuming coherent pages can never be pinned.
>>>
>>> However that raises a question - what happens when something calls
>>> get_user_pages() on a pfn pointing to a coherent device page? I can't see
>>> anything in this series that prevents pinning of coherent device pages, so we
>>> can't just assume they aren't pinned.
>> I agree. I think we need to depend on your patch to go in first.
>>
>> I'm also wondering if we need to do something to prevent get_user_pages
>> from pinning device pages. And by "pin", I think migrate_vma_check_page
>> is not talking about FOLL_PIN, but any get_user_pages call. As far as I
>> can tell, there should be nothing fundamentally wrong with pinning
>> device pages for a short time. But I think we'll want to avoid
>> FOLL_LONGTERM because that would affect our memory manager's ability to
>> evict device memory.
> Right, so long as my fix goes in I don't think there is anything wrong with
> pinning device public pages. Agree that we should avoid FOLL_LONGTERM pins for
> device memory though. I think the way to do that is update is_pinnable_page()
> so we treat device pages the same as other unpinnable pages ie. long-term pins
> will migrate the page.

I'm trying to understand check_and_migrate_movable_pages in gup.c. It
doesn't look like the right way to migrate device pages. We may have to
do something different there as well. So instead of changing
is_pinnable_page, it maybe better to explicitly check for is_device_page
or is_device_coherent_page in check_and_migrate_movable_pages to migrate
it correctly, or just fail outright.

Thanks,
  Felix


>
>>> In the case of device-private pages this is enforced by the fact they never
>>> have present pte's, so any attempt to GUP them results in a fault. But if I'm
>>> understanding this series correctly that won't be the case for coherent device
>>> pages right?
>> Right.
>>
>> Regards,
>>   Felix
>>
>>
>>>> -		return is_device_private_page(page);
>>>> +		return is_device_page(page);
>>>>  	}
>>>>  
>>>>  	/* For file back page */
>>>> @@ -2791,7 +2791,7 @@ EXPORT_SYMBOL(migrate_vma_setup);
>>>>   *     handle_pte_fault()
>>>>   *       do_anonymous_page()
>>>>   * to map in an anonymous zero page but the struct page will be a ZONE_DEVICE
>>>> - * private page.
>>>> + * private or coherent page.
>>>>   */
>>>>  static void migrate_vma_insert_page(struct migrate_vma *migrate,
>>>>  				    unsigned long addr,
>>>> @@ -2867,10 +2867,15 @@ static void migrate_vma_insert_page(struct migrate_vma *migrate,
>>>>  				swp_entry = make_readable_device_private_entry(
>>>>  							page_to_pfn(page));
>>>>  			entry = swp_entry_to_pte(swp_entry);
>>>> +		} else if (is_device_page(page)) {
>>> How about adding an explicit `is_device_coherent_page()` helper? It would make
>>> the test more explicit that this is expected to handle just coherent pages and
>>> I bet there will be future changes that need to differentiate between private
>>> and coherent pages anyway.
>>>
>>>> +			entry = pte_mkold(mk_pte(page,
>>>> +						 READ_ONCE(vma->vm_page_prot)));
>>>> +			if (vma->vm_flags & VM_WRITE)
>>>> +				entry = pte_mkwrite(pte_mkdirty(entry));
>>>>  		} else {
>>>>  			/*
>>>> -			 * For now we only support migrating to un-addressable
>>>> -			 * device memory.
>>>> +			 * We support migrating to private and coherent types
>>>> +			 * for device zone memory.
>>>>  			 */
>>>>  			pr_warn_once("Unsupported ZONE_DEVICE page type.\n");
>>>>  			goto abort;
>>>> @@ -2976,10 +2981,10 @@ void migrate_vma_pages(struct migrate_vma *migrate)
>>>>  		mapping = page_mapping(page);
>>>>  
>>>>  		if (is_zone_device_page(newpage)) {
>>>> -			if (is_device_private_page(newpage)) {
>>>> +			if (is_device_page(newpage)) {
>>>>  				/*
>>>> -				 * For now only support private anonymous when
>>>> -				 * migrating to un-addressable device memory.
>>>> +				 * For now only support private and coherent
>>>> +				 * anonymous when migrating to device memory.
>>>>  				 */
>>>>  				if (mapping) {
>>>>  					migrate->src[i] &= ~MIGRATE_PFN_MIGRATE;
>>>>
>
>
