Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B63546DBA4
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 19:55:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15C16E3BB;
	Wed,  8 Dec 2021 18:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2071.outbound.protection.outlook.com [40.107.92.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 218086E3BB;
 Wed,  8 Dec 2021 18:55:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VCswflGyHp1NtP8w84kNO7mZFbWwJ84d85L9NT0RGHUzDD9cia9nhxbiyqvEtTQEsfnzvNmUhiFlxiVkPkSZ1ikWTQweF82lurCS0rlu50BufRlhH0rX1ypwVqDlaR+BWSALXHHDUziIyOLlss+gUErOXP/gQ3HKb4vJ0vMFsZhR49R6NSxGaLSP/whBv03Mlbin4nEf7/TxjSMLZvScAHXr5Pgxj7ZaIF055DBz+WzHpfDZeFei/pKt08YNBC+QzAF9yE0Pl3apCI+RQDBT/rb6jSZR/QfsjgxYjQTFKPh3BE5SCazoScuh7EGAfsXklzuc2EB+MXr+/r36kruSVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRaCEgSjI2JzH2P9Q2kdim/wHNiPg6ukU98ZO4Xw+jI=;
 b=l5Iom8egwM2SB+uhmSlIdctyYITShv8d91v662/HR/CqhsKgQCjtLUoM03UIDX9sdzJ/sj5G6uhba4Ts8LFLunslO0vIa7YA4n7TJ9Op675UsDKtK2pAP+LioJlOoq9bhy65iAGJ9kOGyTDO9SMMrTtd4SYNwoNLC6jVezXdtSw9agFlANnuTsUzwjSNNxWoemOPAyNYZKV+hVL/IWnA/uVaC6nH75YnWXNb2XZJaovxnrw2dawvSsmKI7qrXGHyW0/mv/wnXbSMuJus+W8huptCecZZ6x7u0IxYzDp+cJj5wqLGi+CD78g4U5jG/84C1zEV86WuK43WKgfzQDe0/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRaCEgSjI2JzH2P9Q2kdim/wHNiPg6ukU98ZO4Xw+jI=;
 b=HpCxrx5XuTUQqjiHUWfWoS+5Q9Kx2VTkkLHksRcMvvQV15CdqPaQKg5QJIhHWth7rcY9TiVN+BwTrSIxZCMCDOJkMnTbCKjT9slUC3zR96d5wClJSguqH/nVnlcifHS4MPjG/9YLCnXR178n5+7gt4R4QXXgtpqejh8OLIbkL1U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB2717.namprd12.prod.outlook.com (2603:10b6:805:68::29)
 by SN1PR12MB2413.namprd12.prod.outlook.com (2603:10b6:802:2b::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Wed, 8 Dec
 2021 18:55:31 +0000
Received: from SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::d461:50bd:ac0c:8c37]) by SN6PR12MB2717.namprd12.prod.outlook.com
 ([fe80::d461:50bd:ac0c:8c37%3]) with mapi id 15.20.4755.021; Wed, 8 Dec 2021
 18:55:31 +0000
Message-ID: <3f8a48d6-7ee7-fb30-5942-29054c34aac5@amd.com>
Date: Wed, 8 Dec 2021 12:55:26 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: [PATCH v2 03/11] mm/gup: migrate PIN_LONGTERM dev coherent pages
 to system
Content-Language: en-US
To: Felix Kuehling <felix.kuehling@amd.com>,
 Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, rcampbell@nvidia.com, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org
References: <20211206185251.20646-1-alex.sierra@amd.com>
 <20211206185251.20646-4-alex.sierra@amd.com> <2858338.J0npWUQLIM@nvdebian>
 <9fa224e6-d51a-d3cc-575b-3d56517a331a@amd.com>
 <2b996383-ebe6-e9d8-d794-58ecfd4a16e8@amd.com>
From: "Sierra Guiza, Alejandro (Alex)" <alex.sierra@amd.com>
In-Reply-To: <2b996383-ebe6-e9d8-d794-58ecfd4a16e8@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0238.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::33) To SN6PR12MB2717.namprd12.prod.outlook.com
 (2603:10b6:805:68::29)
MIME-Version: 1.0
Received: from [172.31.9.47] (165.204.77.11) by
 BL1PR13CA0238.namprd13.prod.outlook.com (2603:10b6:208:2bf::33) with
 Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport;
 Wed, 8 Dec 2021 18:55:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b8e9e90-beb2-4149-db5a-08d9ba7c4ef4
X-MS-TrafficTypeDiagnostic: SN1PR12MB2413:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB2413E5D345C79D8BE86C6C7EFD6F9@SN1PR12MB2413.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: J+AaKEaIOtJr3B6KVJdQS7fy3Ex1v+4BqlEDlEVy1b1PdsAt00C2PFKm5dZS/Q8pTb1DLSMj2cEuzvIIHU71uP7IS0CGjmAUEnbFLfJVS6uRobvOWeH9bNZtAgYgVoNgTJMu+UqcXEkew7XoO69FFO6ooil9vCQ3WEtSxmeMObU3tq8agi+9FO3UU6giVWQfEIc0hs4Eajxvrvr1vVEoslkhYyiyhfluCfL1GHjnD56DsbDS8T2c/g4EJ2D05n3+/V7Vr/hUwdNK4Fe9278GnzxiS+UiSbVTHj0/RywWODqw+T0XUAf9HF33EnRQSKKmTH7AUvT/9ITwFlkKbY0Bbg14yGnISiD4TF8w3Bs6lfPc52BVTHN+wJCXBh9SD+jb+i8yRQooF/GFM2xrTJT2tDWEICcMneiMC8gsbGgTae+R4eLmSg+MQGVBWMdemjy9ZrzOKkPG0v4oYaSTwCouy9h4dS+LBu15aR7bT+tj55Gv9vM4QtNixVwU5oS+Kth5rkJWcWL7Ahp8WRUQOCxPa0hIoBhSTHidzVqA8QnohOP/iVNXSUyqKP0sf7wPycPdcCmJi9qOXuI+rKd03IQo5X45k/6eFHqWQMMgrsc1vx0im42vg4sT63NW4Zm3fPaliZO008Egy+XSy2P71bMqzS1DL8nxiUSefKjOf5OA8TbqbQU4G/fvLW+1W3hlzq9cvRiKddKf3/NjOtfBOcXcZfNqqLApLu9bO56smX91rU+ubi5C1deqU4RlOA/L7kTC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2717.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(53546011)(7416002)(36756003)(31696002)(2906002)(4326008)(316002)(8936002)(110136005)(6666004)(8676002)(38100700002)(83380400001)(86362001)(5660300002)(31686004)(956004)(66556008)(66946007)(2616005)(66476007)(186003)(26005)(508600001)(16576012)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TnUvcFFoWGlkRGkrUjdBTlRpNXlEZUlUTDdEQzkyd0RraFM3TFdNVU9qa1Ro?=
 =?utf-8?B?WkZXazNCcHQ5WDFhVjFmK2xoZVNTODZRQ2gwR0NxRkJOeU41SEMxa3o5QmJN?=
 =?utf-8?B?S2RIcXhnRnRWUkRXVzdWenE4WUpYdWhzdjdYMll4c0lKTGlHMFg2d2cxMG1D?=
 =?utf-8?B?ejdYWjhTalh6WGppME5mLzVVK2MvUVJHdE1obDN1NElNWDMxZGZMbDlyVU5Q?=
 =?utf-8?B?RFpLVXFwME9NYmJVMlBXT0Q0Y0RnUStJSjFBUWIyWVJ6cys5Y1hINFAyUHJU?=
 =?utf-8?B?LzdzYWlBd1JuelBzZk93anZqSzRTazlmd0hFTHp1Y2ZFZURWZ3haRnNRcXJ0?=
 =?utf-8?B?dnVpOUdGQlk1L2wrZlBqa0R5ZG93Nkd5VUpKeWRHQkhMbEU3REdRRUVwSkY3?=
 =?utf-8?B?U0ZUV2dDK3U1LzIzblAvOU9FbnY0Mmg1VFIxMHhTSkEwR2J2Skw0SFNORUdw?=
 =?utf-8?B?RDBjTllkc1JhbjRrNlN3NEJBcjJoS2l3WldORmptS2VkbEtlM3lGUjBHUGhy?=
 =?utf-8?B?aTFJNnJtKzBsK1F5Q2lGL3phRzRsMGVJUzEvMHNNMyt2SUdEQzc0SXhwMHFP?=
 =?utf-8?B?MHJSMkQ2QkNzd3pvK2haUUp2Z1pSRnpuOUVhVkhRMkwrTVJYbzVCem9iZXZ4?=
 =?utf-8?B?TkxLOWJkK0F3VWZ5VkgreS9wV2lxWlpUd2lTNG5EcGRyYWxMK3UxUmxwM2hk?=
 =?utf-8?B?MnpYRVRJa25CQXFnd2JYUlhJUkEyNHJ1NzlMSXI1akZxc0Zwb1BpZVcrWGZU?=
 =?utf-8?B?SmhTU1IrVmFLZkhGVEFOa0FUZVdPSXdHQnJPd2NCN0lzZEhMakFCSUhVbDZt?=
 =?utf-8?B?OWtKZys0cG83QTFvV3F1MGthK1lIeVJhUmJGYnc2ejlMWnRJejdkazRPU3Br?=
 =?utf-8?B?dmxDTStDSmNLOTlzNlB6aitIdjhrcGRFUTRxYmc4VWVnbFBjUmo0cVRiL0Zx?=
 =?utf-8?B?eDdkam5DQnpmTjh6bmRqOElOT1RRK1lQVkRQek1wRU1Pd0FQMDU2cjRwU2c4?=
 =?utf-8?B?L1VoZlhaME9FQUpVTnlib2I3S05LOW05SlBsSEZNOEZtZFdNaHdKSlVyVElm?=
 =?utf-8?B?QUJGL0VQQXZzdEZNa0VtQVNuaTNsTG1rOG9KUW5oMFp3eFZIR2lHU290Wk5p?=
 =?utf-8?B?ZW9JZ0F0MHN0amZ3bFE1YWdrZk0rTXQ5MWFMTEpRNUxGZzJzLzlUQ1dCUXlI?=
 =?utf-8?B?MXNrMlU2Wmpyelhxendaei8zNmlQYURlTWlPcmpWVUZwTWpKK0FrWEU2Rm1M?=
 =?utf-8?B?VVZXdWYzM0MrajNSeXd6L1JRdU5HMmU4LzgwQ1NKdVNLMmtsQTVGV3g2K1dj?=
 =?utf-8?B?UU4rNTBDeDhYR3p6bjRQcDc2eUZSV0h0Y0dTb0VKWlF6MTJLWEp2L1IyN3hS?=
 =?utf-8?B?bGxwcHlMN2FvRDZ5cG1UeXZXWjVHUFk3bEgxazM3bVpNQnNQOHQ4Q1VhYzhZ?=
 =?utf-8?B?OFhOdm1JaitpWStqS1dMRWJteDJqemJyR091WFc0eW1rdXFweTh1SmhiYlln?=
 =?utf-8?B?alRmSitTeEhDNE5WQmNHNlFHQlRkd1BCbk12VGdPM2duVHFicHU4WlMwZ0xJ?=
 =?utf-8?B?ZldxTWQzb2l3L0pJMWVqeWR2UUhiZkFLa3RZb1NsaE40R3oxSHE3NVFPK29C?=
 =?utf-8?B?SGIzVjd6ZmwydktKQmJVcTArQlF5MjhBeGthdkcyOVR5OUFadldiWUgvb3Aw?=
 =?utf-8?B?TzMyMGJZejJDK2FSeGl0Rmd2L1NEOTBIZ3RHZ3E5OTI3MEJmTXBZaTYzcjlt?=
 =?utf-8?B?eTVDUmRwd2lHRlUrTERIRUtRbnRzcWJBWEoybHFJcEhmLzVZZ1JyV2ptOHlY?=
 =?utf-8?B?TzB2K0FQc2lSdU8waGp3Z2RGVnkxN0Vtai80U3R0V3lIVVhSbG9WeU9YQXBv?=
 =?utf-8?B?eUNrTHJjMXVYWWFtTXNTeVdESzllYWY0NjEzR2lqWmhDaTI2WFR0Mkk2WHBK?=
 =?utf-8?B?Q0xDME96YmFNMFhSb2ZlNUV4S0thd1VHNWFJRmNQb2pxTFFGOUtORTlSNmtK?=
 =?utf-8?B?RVQ4eWNSOXlKbHkydkMyRmN4dGNMSGNHTGE0OTRNeWdEb2txVFkvdTloc1VK?=
 =?utf-8?B?YTIyNUNmcE93Q3JBZjIzdVZmVWhDOTFHb0k5SEhNUVM2OWsrTjl4RDBCK0VN?=
 =?utf-8?B?akU1Vy96WFAxaDA3bEFnZDVxMVJKU25EMkhYYkc5b3htM1ZxODh6L0dQL1dE?=
 =?utf-8?Q?tFSGeaCe+8b5e9yPB1hUfio=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8e9e90-beb2-4149-db5a-08d9ba7c4ef4
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2717.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 18:55:31.6254 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MoyvTilro8opjzyep8DPXXlj3eXdDfnn5ji5jb9VRJFz4DJX0skvcPzNNcwUsE9WwCfX543lA+06xAtKmpbxwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2413
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


On 12/8/2021 11:30 AM, Felix Kuehling wrote:
> Am 2021-12-08 um 11:58 a.m. schrieb Felix Kuehling:
>> Am 2021-12-08 um 6:31 a.m. schrieb Alistair Popple:
>>> On Tuesday, 7 December 2021 5:52:43 AM AEDT Alex Sierra wrote:
>>>> Avoid long term pinning for Coherent device type pages. This could
>>>> interfere with their own device memory manager.
>>>> If caller tries to get user device coherent pages with PIN_LONGTERM flag
>>>> set, those pages will be migrated back to system memory.
>>>>
>>>> Signed-off-by: Alex Sierra <alex.sierra@amd.com>
>>>> ---
>>>>   mm/gup.c | 32 ++++++++++++++++++++++++++++++--
>>>>   1 file changed, 30 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/mm/gup.c b/mm/gup.c
>>>> index 886d6148d3d0..1572eacf07f4 100644
>>>> --- a/mm/gup.c
>>>> +++ b/mm/gup.c
>>>> @@ -1689,17 +1689,37 @@ struct page *get_dump_page(unsigned long addr)
>>>>   #endif /* CONFIG_ELF_CORE */
>>>>   
>>>>   #ifdef CONFIG_MIGRATION
>>>> +static int migrate_device_page(unsigned long address,
>>>> +				struct page *page)
>>>> +{
>>>> +	struct vm_area_struct *vma = find_vma(current->mm, address);
>>>> +	struct vm_fault vmf = {
>>>> +		.vma = vma,
>>>> +		.address = address & PAGE_MASK,
>>>> +		.flags = FAULT_FLAG_USER,
>>>> +		.pgoff = linear_page_index(vma, address),
>>>> +		.gfp_mask = GFP_KERNEL,
>>>> +		.page = page,
>>>> +	};
>>>> +	if (page->pgmap && page->pgmap->ops->migrate_to_ram)
>>>> +		return page->pgmap->ops->migrate_to_ram(&vmf);
>>> How does this synchronise against pgmap being released? As I understand things
>>> at this point we're not holding a reference on either the page or pgmap, so
>>> the page and therefore the pgmap may have been freed.
>>>
>>> I think a similar problem exists for device private fault handling as well and
>>> it has been on my list of things to fix for a while. I think the solution is to
>>> call try_get_page(), except it doesn't work with device pages due to the whole
>>> refcount thing. That issue is blocking a fair bit of work now so I've started
>>> looking into it.
>> At least the page should have been pinned by the __get_user_pages_locked
>> call in __gup_longterm_locked. That refcount is dropped in
>> check_and_migrate_movable_pages when it returns 0 or an error.
> Never mind. We unpin the pages first. Alex, would the migration work if
> we unpinned them afterwards? Also, the normal CPU page fault code path
> seems to make sure the page is locked (check in pfn_swap_entry_to_page)
> before calling migrate_to_ram.

No, you can not unpinned after migration. Due to the expected_count VS 
page_count condition at migrate_page_move_mapping, during migrate_page call.

Regards,
Alex Sierra

> Regards,
>    Felix
>
>
