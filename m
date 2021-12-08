Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B824146D90F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 17:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7287D6F94A;
	Wed,  8 Dec 2021 16:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8198D6EA49;
 Wed,  8 Dec 2021 16:58:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lXQMZ/raIE97fpuRhXz4wy36vYi5Avy5+7+IRgP/2sV38Qi/fdGMgc4y9opaGlTaNVKmErWXrzyaSH1EKLo7Xq8rImHDWZSYsLuOyug15047z+A30aFtlQQK7cT5Zq/JJFczBtv+V8HJgtWDFp4u0RwM5ZtXMQdvqaNy/i8u3Rv/MyQAWMfnqq7E6Kb1hOsffF3+hnMvh0EyszmaHOMqB11yWnL0S7FnjC+v9H4uH4B2PF0VEjb+uOCXe/Y4owcO6hJ6pUf9cmroT9YdR8I5fJjryHWEHKVj0Ox8LBDzieLpl56eO0nfYAeQMI1fl0oXHV46qabYpqm+uPhSdyk23A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HMfelmiAu8qJRI6DYq6bnj5kc5xr1/NVqUnA2eWCy5M=;
 b=g6PLah5VOk9e7Ow8OwrR/V5FqYVAdOqoNqy1/cB/9ZiEOKigzIfx4mAReDd5OcR4TQnNBCP3vXBmCvx4zqyu9XOCF3RJo5GKzKP1AtLTThx0uuCD+ka6GFqr3XBgq0Dxfuah1beZrO/FFNJMwq/IKvSNp5+BBBJchR1OV++mcCdr9VnroVW3z2x3aMJpbPsl2OfaEP2MKpqc3sNtRH6VWF14owOxe0la7W7FEg2uA7quvSzy6G0jUn/wc+ATI51l0zbghXGapc0xeD4fov/phN4ClffPnCCUU3p1Tsc9BH2aRWToUHbjBzJ5+vttWPpf566UV37bitELKXYAdNWyzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HMfelmiAu8qJRI6DYq6bnj5kc5xr1/NVqUnA2eWCy5M=;
 b=KXDbWktW6IOlL7BAySAVtgMFB4SBj4F+5WJ7TvpvNovm7sF6yxqAN2ppxT52mX6qEZYvZ5vRk9IdTuF5Osy1ILlJMxMASrhN52uYnvrhozLhb9szux+LWo0YDR0/ehj1FlMnNhT329ckwDEyS0W7du7kaE5H8IU34ywTXDmI9xI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5308.namprd12.prod.outlook.com (2603:10b6:408:105::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 8 Dec
 2021 16:58:29 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300%7]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 16:58:29 +0000
Subject: Re: [PATCH v2 03/11] mm/gup: migrate PIN_LONGTERM dev coherent pages
 to system
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, rcampbell@nvidia.com, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, Alex Sierra <alex.sierra@amd.com>
References: <20211206185251.20646-1-alex.sierra@amd.com>
 <20211206185251.20646-4-alex.sierra@amd.com> <2858338.J0npWUQLIM@nvdebian>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <9fa224e6-d51a-d3cc-575b-3d56517a331a@amd.com>
Date: Wed, 8 Dec 2021 11:58:27 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2858338.J0npWUQLIM@nvdebian>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0077.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::25) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
Received: from [192.168.2.100] (142.127.191.123) by
 YT3PR01CA0077.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:84::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.19 via Frontend Transport; Wed, 8 Dec 2021 16:58:28 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 13dc960f-a16f-4f07-522a-08d9ba6bf55f
X-MS-TrafficTypeDiagnostic: BN9PR12MB5308:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB53089C4A63F846B6D80AD8A8926F9@BN9PR12MB5308.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v2Pm4bv/Mauxo++G9XNI/sVVFsPzpI+2I+Ni1SLTIrYdT/w4RhbEnebTv1zo8KSbZkWdh5bNNzk3VBMR7QcW7Q2JH4bTOqUYu5jmh4A6gCX6C+z9VoteW+az5G6cG7R3WchPG+/R9SMEFlZX7Q3HTgqIEHoUrsACLKRifR+7RKLgcJzry5W0F1lrS9pcH3bw0XBtGkztisOIGw2TCeeXl7vpB2PxrO/DqI3oHs/rVAmXGFyeP+UW7oknE6zuAm9aBmvFLfCCHIzwZ4icXzPji/ewbWbTqGqi8H9aOS7f/Xm/UcwATNEa6MVBqfOGYN+BE9cXfQwbvNO967iEnjV9E2BQRYvIcPC6+QGh443Iq6g955DMHS41Ktl7jfCEj42xxHCinI290d4rMiIwfab/HqfrUtEUkeOUbpIjn+HSa6j2CCWR59KkZeTFt9XUFsbyC0qqVYuWQ9Bm73EA3v4VY3xehvq0a7F/RxUNsYczlfuWiwpQv3Ts81WcjMC5XSX3FMxQSsTmfBIr1plemD6/3xoplMCqKik2ZumbF8RmFt2A+sVK+RdVcZXfDQ6F6Xd9QifVF6ZzbZB5HzN7+iEMZXFKOzKKtOt7kqeNq0TzxbEFZU9w/ynr4WMChv2PrWooJWv61iXvE2Lf4v5EngjiIvR+wZFW/AECmSk53nb2lQNL6vv8gCiLBytoKvPcUI0UAMUdpbzTeXKqL1+VML5FyjUgbbe9G8eCFVqG8f1HcUjKXlIX/VhseseUZvSIP3wU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(16576012)(5660300002)(4326008)(66476007)(8936002)(66946007)(26005)(7416002)(8676002)(110136005)(38100700002)(66556008)(31696002)(186003)(6636002)(316002)(956004)(86362001)(6486002)(508600001)(2616005)(2906002)(36756003)(31686004)(44832011)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?amlFejJtMjhYa2l0Z3owbm9rU0RIN1lUcnR3UnZ1NEtKNkE0VlVLeldWMnRs?=
 =?utf-8?B?TzVJVlo2d25xcXdFZXN0TDhMZm92azFKdVY4RXh3SlhlMGVqRjFOc2V4NFBG?=
 =?utf-8?B?NEszTUU2a0Q4a2tMRi9pbnJVVU1WZzh5SGhDakZFVEJkMUhVU0lDbTRCMEFx?=
 =?utf-8?B?VU1TaFZydkEwVWFLRkZ5WFZvTDJTUmhzVzZOZ2VKV2UxREpxNllCajBnYW5T?=
 =?utf-8?B?b01xQkFUbTlaaGFaZnhPRjRTQWFmeUh5Ry9MV0xLK1krVEtxdGVGM1NVUHFx?=
 =?utf-8?B?enl0cGU3QWVXakoxa3NhSFVBZzd1cUpwNXFlbzloUk0rZmY4MEhOOGRvQmNy?=
 =?utf-8?B?UGNZNStabm1jZ3J2Qm9BL3RJN3hTY3h2aHNTU3FQbjJuVHMxUC9MY0tEQjJl?=
 =?utf-8?B?bUgybWVoMWZpVDFuVUJkeGdyMzFDZHNENzNsL2g0cG00Mmx2a2dQa3NVdk0r?=
 =?utf-8?B?algwK3VpZ2NRVGNQU2ZIc0lJYUQ4aWlYdTZVdUFVK0xtbXdTUEJ0WVlXZnZs?=
 =?utf-8?B?akJ5TnJPSEZBeWtpck82RzhiVTF4clFBNHVTajZJUjd5T1U0VU1udUQzSlg4?=
 =?utf-8?B?Tm8zcy9nY0JXNUdGVUovQWJtU0p4SHVaM1k2L0g0WUdaV0YvM2JwcnBGa0J5?=
 =?utf-8?B?NFpTMURJaWZVTFlTa25IZW13ZGtodzVJSGw3Qi9PYnFOTnlXMFhCenREN1NF?=
 =?utf-8?B?VGJiR1RkWExiTmIvUjdSRXRkZE5lYldpV1pXUW5MbFRkb2pMeUJiNUI3T0pR?=
 =?utf-8?B?VW50ellKaU9IeUZUL3VxU1NEaUpaN29DNGNPVXordU9IZmtFaTM0UktIOElB?=
 =?utf-8?B?U0ZqODlNdU1GNWdYNk9zdzNQNXB2OVErZEdoaWlvM3BuTmlZSjcxZGlkdk1r?=
 =?utf-8?B?aXVlUjhFeVlQNkVzckFKWTZGM2pPQUZsa3NHM05EQTNoNEdtS1U0cTE0ZElq?=
 =?utf-8?B?cDRFR0sxMkNOWnM4QWx2Q2NUZHMvUHF3ZVlyQWpJRGRxcHFhVlIxaWVTZlZq?=
 =?utf-8?B?TDFCaFpKQXNxMWRpeFhMRldUdXkxRkRMT0lEWHpkdERUbTFJNGpRZjJGZW9C?=
 =?utf-8?B?ZTA0Y3VEeDVqaGFuNHlGeU1ZR2NIdFdvVnpXOUZBNHFvQXYyZnVXYVZsQldw?=
 =?utf-8?B?VFR2VmR0WmtqQytzMzZhK3l2UlpMZ1F0OTFnK2JxQkF1eFpzU0g5SFFuVisz?=
 =?utf-8?B?dnZlRHZlamJkMFdCRXQ0azFDbGVPRE9yNkx0NjhNSmVjUCtzWUtNRVNacFBE?=
 =?utf-8?B?RHA3bW5lblhOWlptWTdXRzRWeUlvR1NvMmk5Z29vaXl4VDJPR3l6WUxBNzRt?=
 =?utf-8?B?WFlvaHhwc2pwTk81ZXRwbkdPMjBKZFlkN0xYNE1oblk0d3NHdVBOYkJ5Q05m?=
 =?utf-8?B?ay9rK0d2OFdiVjdvZVBXbGw1MlZMU2llTlQxSlJPcUYrVE1vcEVIb2didXQ3?=
 =?utf-8?B?dlV0eWdBTUM3bWo2eStvZGZ2ek5Va3FndTNRWHVVY2taYUtHYjduL1VZdVgw?=
 =?utf-8?B?bnB2ZStDVWNhOVRoRTFVK2FuSlBYZ0ROSDJPZDVIb2xJN2o3WEtFZW9ZNmdx?=
 =?utf-8?B?alBVbFNvTmJQeUdsc1Y4dVIwdTVrQVV6M2hpUFpWeXNwa3NmQythc3d0eE9l?=
 =?utf-8?B?WGFyY24wanQ1b29rUGtwdmVKN1BWS2xBYjRKUVRvbi90ZXdrVlRMejZYSitq?=
 =?utf-8?B?ZjhkU3RFRUUvbU5GNlVOTDQwZ3V4M3ZOTGRUdC9XZHlkSVNrYjZTUkJkZEVG?=
 =?utf-8?B?VlNmMUFjbUFueDIwODJ3ZEh5VCtudmpiQjZvNHZvR1plKzhVTVdRSnlLbmxJ?=
 =?utf-8?B?TUpYM3J4MmVlY0J4ZEVXV05jNjR5c0RpejdNd0hQWCtIbU05Um9SWU1Pekhw?=
 =?utf-8?B?azNSS1dmeFVLWGxlSWVrSnNEeE5nUERxcXhqc21vK0FFZjcvdGlkQTBZZFV6?=
 =?utf-8?B?NTg5WWk5YVQyUzExMTlFcjR6U1I0NGRRLzN5eUpjNW4xcjA4a1hnRUdFTk5q?=
 =?utf-8?B?VkFQb3p3eFpnZWkxWU9kRkxSaE5SUjJkUkYzVjZuNy9KNkJNVU1Ub1BxcFFF?=
 =?utf-8?B?Zmd2K21oNjQ2Tk1PbnBXMlhYcnpYNjZUbG81ODJ1dWY0ZUFmS2NpcUo5V0gv?=
 =?utf-8?B?b0xBbXZTSHRmdlpBcm9adkY3REdUZ2xnR0l5a1VTemFUVmRFclpMOFpMT2VH?=
 =?utf-8?Q?NL34BxvKKp1YwDmIdJ0zQIU=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13dc960f-a16f-4f07-522a-08d9ba6bf55f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 16:58:29.2011 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YjVk046th977F+xJFWNf8HmCXLMCGXA97oLE95R3umUK7vG80ySQ4ZJP7p/0yw3rZpjoIokgwZPN0WYjL9lAeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5308
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

Am 2021-12-08 um 6:31 a.m. schrieb Alistair Popple:
> On Tuesday, 7 December 2021 5:52:43 AM AEDT Alex Sierra wrote:
>> Avoid long term pinning for Coherent device type pages. This could
>> interfere with their own device memory manager.
>> If caller tries to get user device coherent pages with PIN_LONGTERM flag
>> set, those pages will be migrated back to system memory.
>>
>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>> ---
>>  mm/gup.c | 32 ++++++++++++++++++++++++++++++--
>>  1 file changed, 30 insertions(+), 2 deletions(-)
>>
>> diff --git a/mm/gup.c b/mm/gup.c
>> index 886d6148d3d0..1572eacf07f4 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -1689,17 +1689,37 @@ struct page *get_dump_page(unsigned long addr)
>>  #endif /* CONFIG_ELF_CORE */
>>  
>>  #ifdef CONFIG_MIGRATION
>> +static int migrate_device_page(unsigned long address,
>> +				struct page *page)
>> +{
>> +	struct vm_area_struct *vma = find_vma(current->mm, address);
>> +	struct vm_fault vmf = {
>> +		.vma = vma,
>> +		.address = address & PAGE_MASK,
>> +		.flags = FAULT_FLAG_USER,
>> +		.pgoff = linear_page_index(vma, address),
>> +		.gfp_mask = GFP_KERNEL,
>> +		.page = page,
>> +	};
>> +	if (page->pgmap && page->pgmap->ops->migrate_to_ram)
>> +		return page->pgmap->ops->migrate_to_ram(&vmf);
> How does this synchronise against pgmap being released? As I understand things
> at this point we're not holding a reference on either the page or pgmap, so
> the page and therefore the pgmap may have been freed.
>
> I think a similar problem exists for device private fault handling as well and
> it has been on my list of things to fix for a while. I think the solution is to
> call try_get_page(), except it doesn't work with device pages due to the whole
> refcount thing. That issue is blocking a fair bit of work now so I've started
> looking into it.

At least the page should have been pinned by the __get_user_pages_locked
call in __gup_longterm_locked. That refcount is dropped in
check_and_migrate_movable_pages when it returns 0 or an error.


>
>> +
>> +	return -EBUSY;
>> +}
>> +
>>  /*
>>   * Check whether all pages are pinnable, if so return number of pages.  If some
>>   * pages are not pinnable, migrate them, and unpin all pages. Return zero if
>>   * pages were migrated, or if some pages were not successfully isolated.
>>   * Return negative error if migration fails.
>>   */
>> -static long check_and_migrate_movable_pages(unsigned long nr_pages,
>> +static long check_and_migrate_movable_pages(unsigned long start,
>> +					    unsigned long nr_pages,
>>  					    struct page **pages,
>>  					    unsigned int gup_flags)
>>  {
>>  	unsigned long i;
>> +	unsigned long page_index;
>>  	unsigned long isolation_error_count = 0;
>>  	bool drain_allow = true;
>>  	LIST_HEAD(movable_page_list);
>> @@ -1720,6 +1740,10 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>>  		 * If we get a movable page, since we are going to be pinning
>>  		 * these entries, try to move them out if possible.
>>  		 */
>> +		if (is_device_page(head)) {
>> +			page_index = i;
>> +			goto unpin_pages;
>> +		}
>>  		if (!is_pinnable_page(head)) {
>>  			if (PageHuge(head)) {
>>  				if (!isolate_huge_page(head, &movable_page_list))
>> @@ -1750,12 +1774,16 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>>  	if (list_empty(&movable_page_list) && !isolation_error_count)
>>  		return nr_pages;
>>  
>> +unpin_pages:
>>  	if (gup_flags & FOLL_PIN) {
>>  		unpin_user_pages(pages, nr_pages);
>>  	} else {
>>  		for (i = 0; i < nr_pages; i++)
>>  			put_page(pages[i]);
>>  	}
>> +	if (is_device_page(head))
>> +		return migrate_device_page(start + page_index * PAGE_SIZE, head);
> This isn't very optimal - if a range contains more than one device page (which
> seems likely) we will have to go around the whole gup/check_and_migrate loop
> once for each device page which seems unnecessary. You should be able to either
> build a list or migrate them as you go through the loop. I'm also currently
> looking into how to extend migrate_pages() to support device pages which might
> be useful here too.

We have to do it this way because page->pgmap->ops->migrate_to_ram can
migrate multiple pages per "CPU page fault" to amortize the cost of
migration. The AMD driver typically migrates 2MB at a time. Calling
page->pgmap->ops->migrate_to_ram for each page would probably be even
less optimal.

Regards,
  Felix


>
>> +
>>  	if (!list_empty(&movable_page_list)) {
>>  		ret = migrate_pages(&movable_page_list, alloc_migration_target,
>>  				    NULL, (unsigned long)&mtc, MIGRATE_SYNC,
>> @@ -1798,7 +1826,7 @@ static long __gup_longterm_locked(struct mm_struct *mm,
>>  					     NULL, gup_flags);
>>  		if (rc <= 0)
>>  			break;
>> -		rc = check_and_migrate_movable_pages(rc, pages, gup_flags);
>> +		rc = check_and_migrate_movable_pages(start, rc, pages, gup_flags);
>>  	} while (!rc);
>>  	memalloc_pin_restore(flags);
>>  
>>
>
>
