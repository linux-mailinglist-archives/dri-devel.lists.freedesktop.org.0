Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49A8F46D9AC
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 18:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4DBD6EAD3;
	Wed,  8 Dec 2021 17:30:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2048.outbound.protection.outlook.com [40.107.212.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ADDB6EAD3;
 Wed,  8 Dec 2021 17:30:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OJrSf3jAyJzrVU5GsMPqoRQEYDBuspR+WUIBE5okr3WJgdEAF2gNhy4bPfF8UAYnGdQE6rWOYPc8pyQdooCjxIOxpBOXMxjN0iv+ZaCir4unqbazk3uUxHdUj9aXXO+AIQiKN5wB/Wm25jchyl3JAEN2SYNXd6lazZeEQTPcbBNS0/dP9JmrQWtC7gvlmaYLcvuLl5pVNxDox84WU/VItG82yFpamp0kv4VOABgFxRrOVK+EQ50e+ZQAoSIV09HneP9rNvw1HwGIO7r4IJ04M8eg/hrDKqa2yiINbiu6Yo0z4jrrTYWN3yQd4G0rWQgFb5TTFVxNU/I8FvIm/Ttwyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NeWsiS1AEoCRe5LGPq3/EBIHIzIKN70DCYC3B8lkCdk=;
 b=maTSSkUlNQRR/I5BeGOdZXlbt5pyKFRcgGehyWX5S7JQBM1lpyr5VPYFA7ldR+LkvWlUWIxTLwJ7jMNZz6n5qlxe7zcBUJuwQwAbAkrRgnxM+NSxMoZL2O5U9SOhh2jl2H901fn+kMTdxoJovhjLHV5Hqo1C0tlrlfi/Hf5igWtDF/axeJzTcPbshc+Sy9KJQ7voCCRgQZyWsaIW/blltNpoQP6bgs8+9wraNX/j2Eb6gb6EgJLL4DMEDeAwwl3SLl4LzaeKAOdvf903DLdv/OMmoV7RL3Sp1ZVenpMsEAVdpYKfzBvWRmpH2KdPIcx1+Jz4famWPwC2g4zQ5h0Y0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NeWsiS1AEoCRe5LGPq3/EBIHIzIKN70DCYC3B8lkCdk=;
 b=38AAuvILcZXhE/flJcviydkdH6rWnR8ha9geBzDb647PhkuHi/Wchr6BD/jdYJiSFehQrMR8SJnk3pCmp9SzSXfik+LS5cdqp3luGIVnShVoC+9baJWfjsc6+mZjMZYmR1Lq9AGGAxWpqqNdo7iKVyptLTIaJMyckom1Ia5f1pA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5180.namprd12.prod.outlook.com (2603:10b6:408:11d::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 8 Dec
 2021 17:30:13 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9dfe:ccc6:102c:5300%7]) with mapi id 15.20.4755.022; Wed, 8 Dec 2021
 17:30:13 +0000
Subject: Re: [PATCH v2 03/11] mm/gup: migrate PIN_LONGTERM dev coherent pages
 to system
From: Felix Kuehling <felix.kuehling@amd.com>
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, rcampbell@nvidia.com, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, Alex Sierra <alex.sierra@amd.com>
References: <20211206185251.20646-1-alex.sierra@amd.com>
 <20211206185251.20646-4-alex.sierra@amd.com> <2858338.J0npWUQLIM@nvdebian>
 <9fa224e6-d51a-d3cc-575b-3d56517a331a@amd.com>
Message-ID: <2b996383-ebe6-e9d8-d794-58ecfd4a16e8@amd.com>
Date: Wed, 8 Dec 2021 12:30:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <9fa224e6-d51a-d3cc-575b-3d56517a331a@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT1PR01CA0040.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2e::9) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
Received: from [192.168.2.100] (142.127.191.123) by
 YT1PR01CA0040.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2e::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.17 via Frontend Transport; Wed, 8 Dec 2021 17:30:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6aebb47-32b0-4657-d7bf-08d9ba706460
X-MS-TrafficTypeDiagnostic: BN9PR12MB5180:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB518045587B73475E77DC13AE926F9@BN9PR12MB5180.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FlvgQcbj/sw//b8O35iFDLaHvcfOxet4GzH9sHNdoV4yd8SAnH3gGWMmGNhrPfMXNdwnERz7dIpSPpI1St1Fkzv4CwVLz8RkyEdz5ung0Tb32FwRkMWCE/g9SvAGoa6JdJwUYqta+KQHa1LmbzaahnVWLEBWbZpjsdJk9k9RKVm/yrHRLAzXb+g5xrP/FdFLRkzwiY9fAIulspjIguvpBWy+xdQbW891xOUWrdp5IuC+0r9mc8kbjMdl1ljmmnxoL/RM6LuaSaEBbuc7KvHIJItXE0Emlhsf1mMzsGBgFSBkRbkyU849o39YC5/5OfMGlA91RBptJKuPu3abxxqT7naFwxfIlw3epA0ZWTpj0Ld6VBDMAVboXYz02nKzssFUHnAFBeMycQhg7iKxpbOQSd6UlbsJVOVHU1X+gJ1kAIdISwNL7LgNU+yNiSBahFc93CQol3lHpusXCOR6u/M2vcfE+WLfVeehIL5CWXn0Cet4foj3RUaLC3sddsOtFkjqVdoz3dOf1eKoS+R93lQfQIFeDuaFeQr1MF6OjfoEkQYB72WzEmDFgnu6uF8Q7gUl4sm3TYg8D7l550ABr/PGhRGhEc7xJfXiPgELrhkXla+L1JgRRMJCO2C9sCUJKJxO/8rTz+nbPp6b5Kiazt4H8tVlwVmPPqvnvx3PVgcUYQ06u1tY5D0ccrXU/VBTVJ7hwc/HHHa1XhFHeDdEytuR3NrRobvc+jtbb66kyNIACI0C3geAeZ2hY1cYkxI3jjfW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(508600001)(26005)(186003)(36756003)(16576012)(8676002)(5660300002)(110136005)(86362001)(6486002)(38100700002)(6636002)(83380400001)(66946007)(44832011)(31696002)(2616005)(956004)(316002)(2906002)(4326008)(66556008)(7416002)(31686004)(66476007)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1NBOFpmMzQ5RW8veVJxbmZCUmc0OWQ1REdKbC9ZeG1kTkkxSmlZK2hpUTFo?=
 =?utf-8?B?MkcyMStXQ1duSmwySm5FK0JOVFZEaTZvbXBpZ1FNcXdxQ01oVFkzUy9FRjMv?=
 =?utf-8?B?Mzl1NEZsK0VSVUw5RERRNjlhWVpNdW9FMEdNdk1NblB1NkI5ZG5IMXFNNXZY?=
 =?utf-8?B?K3V0a3hzYjcwdHl3UlYzcHEyWFpVbkl5a3ZoeDNwdm5yRUZXUTIxZXRNdHZa?=
 =?utf-8?B?TUhvWWtDQlRFRWVONW4wL2VCTktYcXZFWWhXT2hDUWdqYkNaS3hNQ3V1empC?=
 =?utf-8?B?V2RBdkRtaE1yS2liMWE2QlU4azNQTFRvZHEvblk2WG1qdis1V1N3TndIVEwy?=
 =?utf-8?B?alJaUlpYOUpNYW96OG0zQzd3U1c3M2dSRkdzSGdXV1M3UmpCTDB5K3lOYWJT?=
 =?utf-8?B?V0wwaXVMNGJOMkorYlFTd0kyT3lUWDRZNGtiOXpsU0pzM3lpN2lNTFFEcHJL?=
 =?utf-8?B?Titlc1BoQitKOGRYbzROUmliQTFFbHZQanUyTXd3VlV5YXRtTjZabnZGVFJB?=
 =?utf-8?B?Zlc4Y1k5ajJoSFJoaUtUQ1ZraWRVWEhXSGMxR0ZxWEttWjRaNlE3WG9DWGMr?=
 =?utf-8?B?N1pZQkM0eTZkamhESUlheE82eEYzQndLRXcxUFNFNDR6VWJDZXYvTER3RndO?=
 =?utf-8?B?Z1NrOFhXZUx1c1BSNUkrV2ZvOFR4M2E4ak9PMkdTVTFQTS9oUy9YTWhhbUc3?=
 =?utf-8?B?eWpxSWNGNE1kM3lpcCtMaGhUdk5IT0xGTHFuTFBpa3pRWXprMDFWN3pFVDRk?=
 =?utf-8?B?S09CZStxc0JUVHg5NUk3RXkxSDJHV0t3eXM0ZVRtbnl4VytWUkMxekQ0eWhr?=
 =?utf-8?B?UHNHaUg4dHhrbVliVGk1akhNWmdsWFhnT1Ezckg4SVh4UlB6dkRCaU9mdzk4?=
 =?utf-8?B?Qk16UTRVUnMzWEU1YThZUThuTkZRK2ptemwrSzgrYUltNjluRmNzQ0Rsc1dJ?=
 =?utf-8?B?MGlVdm5wUWJSeFhMeHBzbU1wTjRTQzJJa2hVY3NOWTJCaVZvUC9iYzV1eWZI?=
 =?utf-8?B?MUNVOHloQ2liVnVIMlNCNnJSSWhCejN5azFSMmlWZUxuUUxCUFNDb0R3Q29n?=
 =?utf-8?B?dlNDajhhakdSWGdFdzFTdG95VkhiRVdMSE9Weks2TjhNbyszTnc1QmZCVjQ5?=
 =?utf-8?B?MmlBclk3bEV1a3ozaml5UUN2Qm5WNjkzM1VzQ3JjeHRMa0h5L3Ftb0VHRHRn?=
 =?utf-8?B?MmRyamdqNXNDb2F2VUtvZTdwcmZDaTY3RVRucjhCQTJHdGp2N2hDbnN2RERM?=
 =?utf-8?B?M1c1Q2JnRGpJb0pZdytiWUxnY3l6QlBIZzZ3TkxrWktvVWREazFidk1KNE5N?=
 =?utf-8?B?NXV2SWJqOGhoSFdFUjRXRXUzbldzNjN1Q1kraVN4OFJzMjhoTDVKQVo5eGRy?=
 =?utf-8?B?b0I4OWdQT2RWaGJJdXZxcklBd3pGMzdqbVE1QXdmSmtGamtBdDBlak1URC9y?=
 =?utf-8?B?cW9MUnNZTWFvRU9KcUg3QXdneUJ1V0UxYWt4RjdPeFIyYXQ3WU1YTnZib2xi?=
 =?utf-8?B?bDRsMDlNQVAwSCtwejdBZkxWTW5Cdkc1ZGlnR1dDY0xkYUg1dWpEZFo0elNu?=
 =?utf-8?B?MVNKWGN0RVdaZ3duc1FMWHppTUFqV1JKY0NZdmtiRGdYdFBLc1pIN1ZWeXpR?=
 =?utf-8?B?ZTZzVjZ2UEpud3lZOVBjakdWZTJheTAwaHBqOVRBbnVTYi9oeSs3UU0zQVVH?=
 =?utf-8?B?c3RaQ3l1a1NkRkR1ZVNoYmdIWGRzTW5Pa2UrSjJKYlJZcFlwbmRsdnlDcXVH?=
 =?utf-8?B?Z050SG9TL1hpZW5DbjRIM2lUMUd1b2lLWnNyZVpiZ24xanRScGRpc2VGV2NS?=
 =?utf-8?B?ZWh1Qm9zWG5OOUNiQlZWaGx2a3RqcEgxZG5wSWpaNHhEaVJGT3pLKzduckZV?=
 =?utf-8?B?WVlsMGk3T1BOMGlPcjZSTWZURVVLQ2FMbm1heGdLakVaazFCdUFOTnVac0w5?=
 =?utf-8?B?bzIwb3J5NDNtWFBzblhjdUgvS2xNcFpUVVBSOVJXZ2t0YzZTYWNNZzdwOUJ2?=
 =?utf-8?B?Rk1sM2ZiblAyWEVHSlEyZGd5dzIreEE3S3JXWnhuMDF6OU9KTnZZbEpIdko2?=
 =?utf-8?B?Qkh4ZHl4TmxmbTNrNERCUFV4b1lkdExVcEtka3B4QWEwSDVLZVhZaWlJQzVB?=
 =?utf-8?B?T1JZZjhYNDNMN2RwMjVnc3FMcHNYOW1qSzI1WWtUVjVldGpYZVVwSnE4bnR0?=
 =?utf-8?Q?eNVwtmp9/Ba6pIdm5KdCj7M=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6aebb47-32b0-4657-d7bf-08d9ba706460
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 17:30:13.4420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W/Ohz8ZkYqmofOQfUbwipT1VdhRatsIE5cdQjAIhGr585GG4ONPNklalE0EW/jPeuOdjRTRcERsMp7xYL1fzxg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5180
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


Am 2021-12-08 um 11:58 a.m. schrieb Felix Kuehling:
> Am 2021-12-08 um 6:31 a.m. schrieb Alistair Popple:
>> On Tuesday, 7 December 2021 5:52:43 AM AEDT Alex Sierra wrote:
>>> Avoid long term pinning for Coherent device type pages. This could
>>> interfere with their own device memory manager.
>>> If caller tries to get user device coherent pages with PIN_LONGTERM flag
>>> set, those pages will be migrated back to system memory.
>>>
>>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>>> ---
>>>  mm/gup.c | 32 ++++++++++++++++++++++++++++++--
>>>  1 file changed, 30 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/mm/gup.c b/mm/gup.c
>>> index 886d6148d3d0..1572eacf07f4 100644
>>> --- a/mm/gup.c
>>> +++ b/mm/gup.c
>>> @@ -1689,17 +1689,37 @@ struct page *get_dump_page(unsigned long addr)
>>>  #endif /* CONFIG_ELF_CORE */
>>>  
>>>  #ifdef CONFIG_MIGRATION
>>> +static int migrate_device_page(unsigned long address,
>>> +				struct page *page)
>>> +{
>>> +	struct vm_area_struct *vma = find_vma(current->mm, address);
>>> +	struct vm_fault vmf = {
>>> +		.vma = vma,
>>> +		.address = address & PAGE_MASK,
>>> +		.flags = FAULT_FLAG_USER,
>>> +		.pgoff = linear_page_index(vma, address),
>>> +		.gfp_mask = GFP_KERNEL,
>>> +		.page = page,
>>> +	};
>>> +	if (page->pgmap && page->pgmap->ops->migrate_to_ram)
>>> +		return page->pgmap->ops->migrate_to_ram(&vmf);
>> How does this synchronise against pgmap being released? As I understand things
>> at this point we're not holding a reference on either the page or pgmap, so
>> the page and therefore the pgmap may have been freed.
>>
>> I think a similar problem exists for device private fault handling as well and
>> it has been on my list of things to fix for a while. I think the solution is to
>> call try_get_page(), except it doesn't work with device pages due to the whole
>> refcount thing. That issue is blocking a fair bit of work now so I've started
>> looking into it.
> At least the page should have been pinned by the __get_user_pages_locked
> call in __gup_longterm_locked. That refcount is dropped in
> check_and_migrate_movable_pages when it returns 0 or an error.

Never mind. We unpin the pages first. Alex, would the migration work if
we unpinned them afterwards? Also, the normal CPU page fault code path
seems to make sure the page is locked (check in pfn_swap_entry_to_page)
before calling migrate_to_ram.

Regards,
  Felix


