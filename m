Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF92946F025
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:03:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A060210F723;
	Thu,  9 Dec 2021 16:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2054.outbound.protection.outlook.com [40.107.92.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44ADC10E116;
 Thu,  9 Dec 2021 16:30:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lH1ry+rpxAHgAEiaQMP/625wJk8F6PSsg96OMy+CzoN7bnvROi19WtSn7sEiyjTB+p4lwnIxEyKcLqq6MmtyiIVdt1LQSlN4YgeeMp7zAJcSaYFD732OkNQq5wwkwUXNe2PD23y5CPo47+27CGrMKCyVz12dAqNGtz9JSj50GEe+zbZ9G2wIuEH2M00VjFLPYdxsUvG1Zfbt4Ey8HWGSd+0csnYsQvMYSwsw+ybD0wTbz44JLw/Eu9wBZxpyZHzKtmRz333HOc+VxuQpUq50FcEWKUb3/a+XytTWVOVVp50psjR3zyHaYt91oeFI1nC1jKJP6OJoRAapBun3mtmM5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z/EJXld3TPW0y+6tVhnUMJaavQGPrfQof/h9xPCEuHw=;
 b=cSkttlSC08z2Mcu51eFyJSGBCgR7f61UczcpW0dT2xpyVvETnb5XCjGbB2IIgcUP7mqbcnvnBDA5GK6TVw2kcV4qxrp+UICirxYPpP1kpiYC1OPmpT8uUHIUR1bJZxpnKKwLMUaKuf9oKL6WwKtOINV7vfXL0VXSrD9F8GkTUmJ3cd14PRiv4mxLQzjygm4fq3ROa4iLf58w1DiygsHSWB+OmcTW2Y0sEH+V+ataKVxa/PAn+i99d7RWQ9O5wUai834DwzW5VdAqc2mq6XG0FdNKWCdfIdJPGZ8ZshnEHUQ89Mw2wBKJtLO2NlLIYxF2YyHpY2K90PWEO6gtV8p9Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z/EJXld3TPW0y+6tVhnUMJaavQGPrfQof/h9xPCEuHw=;
 b=2c72bjIdpvHXdsWDF88oZcwYhXbCfb16dinfKlzJFv9cUV58eyEmJcvMcLreS/ESG485GyUWP9T3cZm4g/A/9XBWW0wqmb17cQbVUQDHb7gHSfDabGLIdBG6pdn7Z76/L7NAh7VEgDXfRnGky8IOqAc4S0BsQH09dPlq/S6b4rM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5113.namprd12.prod.outlook.com (2603:10b6:408:136::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Thu, 9 Dec
 2021 16:29:57 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300%7]) with mapi id 15.20.4755.022; Thu, 9 Dec 2021
 16:29:57 +0000
Subject: Re: [PATCH v2 03/11] mm/gup: migrate PIN_LONGTERM dev coherent pages
 to system
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, rcampbell@nvidia.com, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org,
 "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
References: <20211206185251.20646-1-alex.sierra@amd.com>
 <2b996383-ebe6-e9d8-d794-58ecfd4a16e8@amd.com>
 <3f8a48d6-7ee7-fb30-5942-29054c34aac5@amd.com> <2497746.4npHOaMrmn@nvdebian>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <b9163ccc-829e-9939-8177-a66ab41187e7@amd.com>
Date: Thu, 9 Dec 2021 11:29:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <2497746.4npHOaMrmn@nvdebian>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTXPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:1::29) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
Received: from [192.168.2.100] (142.127.191.123) by
 YTXPR0101CA0052.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b00:1::29) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Thu, 9 Dec 2021 16:29:56 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9576076e-7b12-4803-0bd5-08d9bb312386
X-MS-TrafficTypeDiagnostic: BN9PR12MB5113:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB51136402E1795826BDEADD4492709@BN9PR12MB5113.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RMFHwQ6ecnc3wSIiyVbu+rDd1MLTtmnsn+MXhb7Lwxc8ZtKEakjUhFtZN12RlWn751paZU3s4A8tnc1aMeZdmxZQSZ+xg5c4O7W5FEbqtoiCZBhCib1vJ92Wt3XAV9Jmm99erV6DjCCO4R5VlvloNFniORoHmHYxUyRIy8CdOoSzGG/8B7Qny7CJrsu/a3IP6NzjIjf/nKJ9GZ8keFNeIJxBhm8/2tXM11m6PINEnKJXRDpaBK1OXJtuZIRJTyq5cEVABNE1VzN/y/URkvkmTYyTLhP0TPdYjXffuAKUYDryltuuHedTQAlwaviSNjanEuUGoa5UEmWIIZUJOIFTSOhn6pRIOj8RjTNdaLQgiyESYn0yqBOamWh5sfcpmooIpefxzpWEAryo+pPTOeIKGvr2qLticvkpHpymtYk6N8cyZ86x2vgyLkzTJrz21ccr/8RVOrlwnctqja8KSfScAbewvrMSz+4llZHgrFRtXMNsbcTCa4QyFurVV1Ns+9atClxPY5uQzasOYaypvGc5WN9FvxF37Z5sF3Ck4nyvslKoXNAA0nD8bPtDzifXLrp5ISqzmxcKX2k71xRLlh1uafbKt92EkfICCqWVEU6JuWGY4blFlQT8Qi2jG9LY8z759qp7J4xMk1tEz6+N7JrdAfuh6ZDcJ0tIzfxptmwOpuNRf3Sr61wXcXMXBbGWPyNPESN/tBsnPYYAL7NsEN6qNcMEc+fI8tHVciJ/fQgDEV1exW72CHK3AAMkgxSqTP5Z
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(316002)(508600001)(53546011)(66476007)(5660300002)(186003)(36756003)(26005)(86362001)(7416002)(31696002)(16576012)(110136005)(956004)(83380400001)(38100700002)(44832011)(6486002)(6636002)(66946007)(2616005)(4326008)(66556008)(8676002)(8936002)(2906002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEt6U2F0YW5zZjQrNmI0VXdOMHpEdlB3VEJsSFBrdG9lcmZ0Um1yQmptMTlW?=
 =?utf-8?B?aUJ1aHRCYVROVno4WVVHOUFDWjdhWlRBSGlJd3YrMUdzYWc2R0lkcVpraFJm?=
 =?utf-8?B?NDg4Mmd0WDduWmw0SlRTQUxFTHlCb0dNS0FWaEdBclFqWmlMVkp4MlNpWTJv?=
 =?utf-8?B?YjBiMm5XNjRtT0laUVphU2xHMXRGNGxyYkxFZlYxMUw5ZllBV3BqWCs0L1Vi?=
 =?utf-8?B?NEZUblFFZVZES3ZCSXZvQTlaNDltUjJQNktWdnZvWVMyS3JObC9jcFQwL3g1?=
 =?utf-8?B?blFGVnpwcWtNYU0zSEdDREd1TGVIenljOFZId2Q1OFh2WkJQM2xKSkNTalUx?=
 =?utf-8?B?UDJvZE84OXlLL3FwNkpzTTJYSXFGQnNVQTE0L25tdHRhdEs0ZGVKdUlRVE5G?=
 =?utf-8?B?MGU4NEVwSU1ET0xiSmdNMERYaVQ2Rm1xTkxkbXdaSmFUVytwMDVQdzdYdEhP?=
 =?utf-8?B?Q0xqQnd3N1hHamJhZ0pzbzlJRkRTY0NCVVk1WEpaTDFBaWZ6djlXR2ZjTWhF?=
 =?utf-8?B?Wm0xMkR0QTRMVXFIV3o2YUJUKzM5KzhETU5ySXI5ZE9SSzNSQUNVc3ZncGdj?=
 =?utf-8?B?eWhGRHhWdEMxMUdnbDdmTUozREdJSVNmYW1wcXJ3STFqL3I0Qmp3cGhTYjZ3?=
 =?utf-8?B?cS90bWl3UGNjRVlicWtZTjFYblJ3ZHYybnAza0t3clAvRjluUFA5dldxZlZD?=
 =?utf-8?B?RTE4STNlaTVKd2JXZ081eW1MQ1lFZEdlZjRJWXVsS290QURhb1c4c1h6NVp4?=
 =?utf-8?B?V0x2R3IvRVdseXlXYkNwMFJteHJ6R043bHpDdy9WM3loZkYvWVZuRDMzTTVY?=
 =?utf-8?B?MmJYRE5YR21QaVorYjBjZVBFU1JNaitIR29JcHNwenZ1VStXaGpSZWU2M0Mv?=
 =?utf-8?B?TWh5VjVOTDZraXZYZ1V5WDBlWDQ5Z0JSMjdWZE05ajh6OVY1YmcrZ29MckJT?=
 =?utf-8?B?YlpUSVNpdWJGdjFYakpScStQaWowNFhoaStwSTdhVStqUUVxRDJwS0JrZEhk?=
 =?utf-8?B?anJxYWZJS09SbUwrNEVSalJ0TEdZVnlyV05ldi9PT1BFNHhVUHZlZmRrSlcv?=
 =?utf-8?B?dzEzS3VqNUo4UG9Qd2lPb3lnNXZxMUl6R0lBOEpnMEJ6WHI0WXBZWHU3c3RZ?=
 =?utf-8?B?OFErckdNVjZEZkFIcUp5dmtuKzdIcDlhL0hYZTZRbmx1eFFMV1ArcnI0T2JN?=
 =?utf-8?B?dkFZWHZ2Ky9vWGI1OTJZVkVIRzNoVmdWK3NtMDBYSmZpVjdZQlRYVWNyRTM3?=
 =?utf-8?B?QWYvTGFYaERGVHVCd2NkNUo2NlhxUndBcGtTbE45aUVpQndUakUyM2QwdTV1?=
 =?utf-8?B?aXB2MUUzckZ3VmJLVEFHZ0s1UG1NOENSQ2hHYVhJV3hOSjVSdVlFbGhudzly?=
 =?utf-8?B?WTFDTVlwbjdReDBoWm0vbERpdFMvWkVMRFIyMmk2Wi9ocXRRWTF3VDNEd2JY?=
 =?utf-8?B?UXBQMmJKbmk1NzVQV0lLZ2xSL2U3ZXhRT0NVbXlpR2JWbmkrR253UmZiUC9H?=
 =?utf-8?B?NTE2QndGYXcvVlRheGlzdit4SjRZeVhGRnJFZFg3Q2RSZkgyaE91MG9wYktI?=
 =?utf-8?B?eHZsWGdwbUw2ckxhSWlmVmVzSnNrUnFMNVZlejFTU1Y5VmNVY1R0NlZFTng1?=
 =?utf-8?B?WWxIN205YXdrdHV0ZEdSZlU2alR0cVJjR3c1a21kOE5nanNjd2wyMXlFUWRl?=
 =?utf-8?B?enVvNUo0dE1MNGFVaDI3MVM3NUdOS2Fxa2s3YjZCcTUvV0ZjakdPOFlONXpv?=
 =?utf-8?B?QmZHaUxQeGY1bjRZTXI2aGM1VDJRd2hsYnlleVRCanZmVnRJZXI1aVk5S01U?=
 =?utf-8?B?NXhKSnVFa0JNVEt2UU9ubTRQUE5JRHI3UUVjTEVKcSs3S1haR3VYc0t5cTVi?=
 =?utf-8?B?NmNWaWErMEh4WVl6d25FaC9VN0pGZkdzSW5BdHErNXdWazJNR3AvOHY3OE5S?=
 =?utf-8?B?RkZ6NkFhb2lORVh0U0Zwb3NLMXdXMVE1ZEo5Rk5DdS9SN3NhWUhGMDdadUVB?=
 =?utf-8?B?RUZDS3B0dmcwNFpOOVNCOXFPWm41cVZJRUxxUkJFZk1iaDVjQ0sxRDJ1K1dO?=
 =?utf-8?B?MmhuakkwODdBVTUzRGk2aFp2MllJTUt0aE1aRC9iZGNheDQ3U2s4a09tQkIr?=
 =?utf-8?B?QmUxc0dyK0ZhU1E1anR6bm51Vi9zOTUwSitreDVPRWhaNWhpNmlCSFpVNnpO?=
 =?utf-8?Q?CosaqJvkK41WNeKsGR94VcQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9576076e-7b12-4803-0bd5-08d9bb312386
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 16:29:57.4858 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDIbPRNKTM5PNMH2bBTRHdTr0trcorGFcQ9GPyI0Zhz75695PAI90phsXiwzL4tgLkZyS2vDd8qGqaaZKurQ8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5113
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 jglisse@redhat.com, willy@infradead.org, jgg@nvidia.com, hch@lst.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2021-12-09 um 5:53 a.m. schrieb Alistair Popple:
> On Thursday, 9 December 2021 5:55:26 AM AEDT Sierra Guiza, Alejandro (Alex) wrote:
>> On 12/8/2021 11:30 AM, Felix Kuehling wrote:
>>> Am 2021-12-08 um 11:58 a.m. schrieb Felix Kuehling:
>>>> Am 2021-12-08 um 6:31 a.m. schrieb Alistair Popple:
>>>>> On Tuesday, 7 December 2021 5:52:43 AM AEDT Alex Sierra wrote:
>>>>>> Avoid long term pinning for Coherent device type pages. This could
>>>>>> interfere with their own device memory manager.
>>>>>> If caller tries to get user device coherent pages with PIN_LONGTERM flag
>>>>>> set, those pages will be migrated back to system memory.
>>>>>>
>>>>>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>>>>>> ---
>>>>>>   mm/gup.c | 32 ++++++++++++++++++++++++++++++--
>>>>>>   1 file changed, 30 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/mm/gup.c b/mm/gup.c
>>>>>> index 886d6148d3d0..1572eacf07f4 100644
>>>>>> --- a/mm/gup.c
>>>>>> +++ b/mm/gup.c
>>>>>> @@ -1689,17 +1689,37 @@ struct page *get_dump_page(unsigned long addr)
>>>>>>   #endif /* CONFIG_ELF_CORE */
>>>>>>   
>>>>>>   #ifdef CONFIG_MIGRATION
>>>>>> +static int migrate_device_page(unsigned long address,
>>>>>> +				struct page *page)
>>>>>> +{
>>>>>> +	struct vm_area_struct *vma = find_vma(current->mm, address);
>>>>>> +	struct vm_fault vmf = {
>>>>>> +		.vma = vma,
>>>>>> +		.address = address & PAGE_MASK,
>>>>>> +		.flags = FAULT_FLAG_USER,
>>>>>> +		.pgoff = linear_page_index(vma, address),
>>>>>> +		.gfp_mask = GFP_KERNEL,
>>>>>> +		.page = page,
>>>>>> +	};
>>>>>> +	if (page->pgmap && page->pgmap->ops->migrate_to_ram)
>>>>>> +		return page->pgmap->ops->migrate_to_ram(&vmf);
>>>>> How does this synchronise against pgmap being released? As I understand things
>>>>> at this point we're not holding a reference on either the page or pgmap, so
>>>>> the page and therefore the pgmap may have been freed.
>>>>>
>>>>> I think a similar problem exists for device private fault handling as well and
>>>>> it has been on my list of things to fix for a while. I think the solution is to
>>>>> call try_get_page(), except it doesn't work with device pages due to the whole
>>>>> refcount thing. That issue is blocking a fair bit of work now so I've started
>>>>> looking into it.
>>>> At least the page should have been pinned by the __get_user_pages_locked
>>>> call in __gup_longterm_locked. That refcount is dropped in
>>>> check_and_migrate_movable_pages when it returns 0 or an error.
>>> Never mind. We unpin the pages first. Alex, would the migration work if
>>> we unpinned them afterwards? Also, the normal CPU page fault code path
>>> seems to make sure the page is locked (check in pfn_swap_entry_to_page)
>>> before calling migrate_to_ram.
> I don't think that's true. The check in pfn_swap_entry_to_page() is only for
> migration entries:
>
> 	BUG_ON(is_migration_entry(entry) && !PageLocked(p));
>
> As this is coherent memory though why do we have to call into a device driver
> to do the migration? Couldn't this all be done in the kernel?

I think you're right. I hadn't thought of that mainly because I'm even
less familiar with the non-device migration code. Alex, can you give
that a try? As long as the driver still gets a page-free callback when
the device page is freed, it should work.

Regards,
  Felix


>
>> No, you can not unpinned after migration. Due to the expected_count VS 
>> page_count condition at migrate_page_move_mapping, during migrate_page call.
>>
>> Regards,
>> Alex Sierra
>>
>>> Regards,
>>>    Felix
>>>
>>>
>
>
