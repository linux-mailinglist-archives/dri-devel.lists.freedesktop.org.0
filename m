Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C6C4B2145
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 10:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39C8E10EA3D;
	Fri, 11 Feb 2022 09:16:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68F2F10EA32;
 Fri, 11 Feb 2022 09:16:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kMlOmxLclSdnTC44Ab818pule+UB/NiIZTBMJQ0l9VLePWj4NfpNw3RPZ0+tK8QMA5tgsrscXXmsmRg1ksXdRESnVdkySaIpRBYtMlFXWXBJXv229Ptey7djyGmalw/JOXsyQ9XzpeA76FKE/hnLalTBcx/xJmF056pxeAbfZ5mcDUlTh3DNaw1J0+Vn4gUdnSsud6VRubEJkvkv3mtD5QOZLcwSWIaUWVuEtTA3iKb7Xkx+KwSp8Icq/Tn6dpPVjCjzSlDzjbyBstWvDdhyHvL0pI3SWzy/U4EfOLXrGkqr6FI1Crerz7NoYNV5CbWuAbSEJhSODyS+7n3lmNyCRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kAWjgQnDZ3l7ZNlfCG/mWTDunX5FyCGiIUpE6SNqP9M=;
 b=lR1GjH09wGHqa33XdKVxe5a/YVdUHrn7mHhOosROQhuZc7Ln9JzKIW9lig59AtdIMT5NMeDGUwL/HTMCWLa8Eq/zRXJcVhAHmo/O+L3wEauNG5s2OiIbrId/h5dwEWhVG5zedbB+l/hAppHzxBrKp6mG9BQUHtlghNvRORfRWQom5FAueGxZR4UZ4XzZujWlBCdxlhb8z6Ufvc7/Q/HDpkRkMp/N2od6yR/Mbq/0oxZjI0AU3l7M9n19S2nawnm2198PdrNv+wm3hPaDsfUsAO5zua7jI5HjnV80slBczt140uCVGtHh9aiWdrjQxswmzcAksuKtMbYSHz4Igfuo9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAWjgQnDZ3l7ZNlfCG/mWTDunX5FyCGiIUpE6SNqP9M=;
 b=p4kKqMSMDTNbXeLPAuPxY3p8VlJyLm0lD0KENO4hGeYEh9+Z0m2d4E8LTP7u17+RbwYOaNNuweT72hV5oUZKf+BVNnMHOVwVCDFM8O5Z5YmjRA1qTIs8jlmfAs6I/2+4qgzIwhUgvFCUtaYSrgMZa2qb2BJInw6QeFsfQmhsanU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by CH2PR12MB4838.namprd12.prod.outlook.com (2603:10b6:610:1::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Fri, 11 Feb
 2022 09:16:01 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::e550:4514:bbf5:fd82]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::e550:4514:bbf5:fd82%6]) with mapi id 15.20.4975.014; Fri, 11 Feb 2022
 09:16:01 +0000
Message-ID: <bf4d949d-5f85-ca2b-41eb-45d30ca0f7b5@amd.com>
Date: Fri, 11 Feb 2022 14:57:03 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v11 1/5] drm: improve drm_buddy_alloc function
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220127141107.173692-1-Arunpravin.PaneerSelvam@amd.com>
 <4763f9b0-6da7-b2a7-b73c-97c33e235826@intel.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <4763f9b0-6da7-b2a7-b73c-97c33e235826@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:99::16) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 64d65e65-77ee-49fd-6144-08d9ed3f1f3f
X-MS-TrafficTypeDiagnostic: CH2PR12MB4838:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB48380DAE0D997C1DDD87E1FEE4309@CH2PR12MB4838.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1013;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PB2aQSrxwTjKOtu6zCvfFNv7F8jLYmxpoGX66OK9k4rvXHG+d3r6E3d911UD+bAh5+SmpMfqWgZtWAqJuyMKLHA6gN9xuubxZn8PVFsQObU+Voh5EbiHmXxdLi949rQqoukcClZsbtz42DpGbl/CkzHjRa9cwlbV83hCnD1CotIBQNQkC91STYsRpjjCKAOQrOJ7WJTW+AG16uMq2ipsUXXjMsyG5JxS4gbpdJsfEXK2ArWEyhUbC/l76+JsCC4BiDZE8Z080rxTa8xijfRBriydhmU/CD2G4ssEFpCqLvbR9oBEzfH5FADtwSFBV+VBhtRRSTPZlNIrmapNeZu6mWOeEQnnWWf+nul2ZyvEUWQaK7+ql0ecgyMeQPcOP2AiBSJiQaCGsm5ukSN7tdNXVVv1ItLx8UUjyOlZhQ2ic2DWJCTGsh0eH2VqBovyXP8TD9qhFy21YYKJvWHi43FsQqVtThQtO9KDncVP2Czbkow79Nn8K0iWcKCCoacTvQIacSSn/bWHWGZWzq7txLSMOtpPfErX+v7stTR5rVPtiEQxwUxKJOTBjUOqnS419+oP95W6DlEZZLPOQ+zSwmfiD0lbZWk9kfo9qyp2wFJLeIyCEcNA8VToh5DeR0bm3UH/sqHUzfC1rczT3JSMAJm8/voBe9JQonOjYgTaupVombzjsRqFIuTx90aX1vxF8//CFHwLvWs3s8ZrSlEcyzrqpOa16Bu0XCTcbNYniWEZFq4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(508600001)(86362001)(6506007)(53546011)(6512007)(6486002)(186003)(26005)(31686004)(30864003)(31696002)(4326008)(66476007)(38100700002)(66946007)(66556008)(5660300002)(36756003)(2906002)(8676002)(2616005)(83380400001)(8936002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?U2RIellGKzdFUnhlNDQvQVdvSGRVaWVYcjFkNXlYRUVLTndOTGRxSmFiYlpU?=
 =?utf-8?B?M1NLQ3pkUFVGYWU3Wk5MeFpaWDRjZ3VyUFdiK3FabFh4cnN5RE9hd2M0OXhU?=
 =?utf-8?B?QUtJYk51aVpDekNSb0lOODA2a1dMczVnUVp1c250Y2h1dVJlQlpPSEpRYjNi?=
 =?utf-8?B?c1daM3QvSTFPbm5wZUNuUUlaYzlmUE8vRjZDTnNVYVg1VVFrTXJyQVl2RmNr?=
 =?utf-8?B?R2p2TXM0TE1HKzhIK1dxZktRT0NXZFI0bVB2emMrRjNLdDdWYmxSS3VBSFE5?=
 =?utf-8?B?eDMrZU9tSmppZXJKYStSRkJEVU1KcFZjRnBjdzhITEhqRWlzOU5ldHNybHpF?=
 =?utf-8?B?K0kvdlozTTlYU1I0MXV0NFo0Vm5mdzlDelF4dk5MOTRTK3h3UGNhcENWNlpw?=
 =?utf-8?B?bmRJc09kSEk4ckZtZCs0dDVJVVBpazREaTljL0d3S00ySmYxZDRRd1NFdDBy?=
 =?utf-8?B?dzhDOGJpaGlLQzg3RlVadGovSUpqZ2l6SExFUzdsb0lpbHg4d3lkZzVjbzRi?=
 =?utf-8?B?VXptLzhLSkR2eFZIRXZIQmk5Q1JjeE80dUl1RU9WNGxIV1g2UGRPcEluTDRL?=
 =?utf-8?B?OVNGRlVDOUhPR2piaDV0RzRtcVBQck83aXh4YkJPYlJNNDNnbGRaeFdrc0tv?=
 =?utf-8?B?ZnlMclNVSW15aXFtMEpPLzFseVRQY25SV2V1NmI4WnZteWpVTUluSElkM1FI?=
 =?utf-8?B?STdMaVhyR1o2d3V4bXB5M3N2V0VLOGhLNE1FMzg0cVFDYVFoMGR1ZFhOYXhq?=
 =?utf-8?B?ZTNBRHJuTHJmOFUzQ1pmWmsrdGdRTXFCOCtKcHd6ZnhSTktHeEh2bzlKUm9z?=
 =?utf-8?B?QkhBMW5ralV1VG1vWmFvdXpBaUc4N2MwR1daNUwzcFcrNG5TM0VqTnpPU01I?=
 =?utf-8?B?ZFgybnZBMlZXOHVqR1loNHp0bmZ6ekgwZmFSZUtyelIybkRCM0J6bUVMWEdE?=
 =?utf-8?B?NTlPMlZjYVdHVFZOTGhtaWowT1d6SUhkUGpMOGZpbDBTZUFyRGQrOWVRcURI?=
 =?utf-8?B?SEU3SjlIdDdLVXdRZ0owK0hYdGVqaWwyWnJ3c2h3TXovd0pOR0M3bEpDSkl3?=
 =?utf-8?B?bEE0WW5odXFmQjNPYWRYOHY4R0dBdlJhcnpUVUxrN09WN0dUT2N1a2xTNllD?=
 =?utf-8?B?cUpTUjBINk5yZjJVZUpYRWVhUkhhR3pFbFdPZmVzU2dpY0ZpSUNiOUxsb0VX?=
 =?utf-8?B?bDJpZkRnQkxocDRtNXpHQXo2UzI3blZuL05LMXhyVTFUNVhiMHZJcVZwd1JW?=
 =?utf-8?B?WUdKZ0tTQk5ROE83UjVFSW9TVWRxNlVYUE01MXlabU1xZXNMVmdsVWpBL1VE?=
 =?utf-8?B?UUZ1NnJyMnpsdFRpMU1lb3JVb25pai9sVDBZQmNyd0Jac1VYMmUzK2JGc3F5?=
 =?utf-8?B?ZHJDU2xDeTl4T3RwYkJSQndMZkU4N0ZENGE2S1MxcTViQVNCZitEamcwOUtS?=
 =?utf-8?B?TGJFSkhsdlBqaVM1STd4d3VjVGtlR3V0SElFVEFaaWZTeDJhY2xMK0pnRWJQ?=
 =?utf-8?B?QStsMW0vVXhKYTRMeUExTHR3aG5mSWtZbkxkRmswS1QwY0tHY2F0cURicXEy?=
 =?utf-8?B?TEdkYlVFUlJ2OCtZVG14aFU1SnZOWEFOcTFOQmV0ZzYraVlROGRxS1JrU29Q?=
 =?utf-8?B?RGJLSkx6R0lPS2t0N0QyNFRaQVcrenVla1NtQXozQ2g4R1hESlA3d0U3WVdL?=
 =?utf-8?B?RlN2UVBDVm5UWkdpSnViSlFBcTEwcHhEK3R1NkYydlJLU3c3REVRTVl2N1hO?=
 =?utf-8?B?SUQxMUoyczFxOG1kTllqb3MrWVVzZ0h0L3NQWFFZOUljbXp6dC9PQUJzODlo?=
 =?utf-8?B?UzM4cytnS25SSk13TXhCMzcvT3ZaNm00ZndNS0tsODNMbkxvWXdvdG95RWRo?=
 =?utf-8?B?ZkVmUXM3Y2pISitnWlhuaTl1RE5tNGpaUjBaMS9menFKTEJSTW1vMnNMOThz?=
 =?utf-8?B?b0t6Y0tLaXFkWEhnREZ3dVFoWnlKNDMyU0txVjBzU0x6NERTc2JwWXJZMTJ4?=
 =?utf-8?B?L204aFRpT0dSRk94MzYxaXFja3lNUlNNamtkcUt6cGpJNm9WbmxiUElEVHpw?=
 =?utf-8?B?b3NXVXQ0MmMwTTJyMWRuazBjM2tJODNiSkR2MmRLWGM0aVA3M051cU42Wmph?=
 =?utf-8?B?b3daSjhTWk9hNmJvL21tQ3lMNDVrL3JuMU9SY2pCbHlremRobGszL3RXbmZS?=
 =?utf-8?Q?W88q1+omq4FCbi3MJaKj8wE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d65e65-77ee-49fd-6144-08d9ed3f1f3f
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2022 09:16:01.4636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UNPKpi3O8BVztryCjMhjm2fZ208KkvmpznHF/bD5Oqcky8dYVJP9MVCzCewF9uRU3qFGCvDm6rR+kKZ+JLdxug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4838
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 10/02/22 9:40 pm, Matthew Auld wrote:
> On 27/01/2022 14:11, Arunpravin wrote:
>> - Make drm_buddy_alloc a single function to handle
>>    range allocation and non-range allocation demands
>>
>> - Implemented a new function alloc_range() which allocates
>>    the requested power-of-two block comply with range limitations
>>
>> - Moved order computation and memory alignment logic from
>>    i915 driver to drm buddy
>>
>> v2:
>>    merged below changes to keep the build unbroken
>>     - drm_buddy_alloc_range() becomes obsolete and may be removed
>>     - enable ttm range allocation (fpfn / lpfn) support in i915 driver
>>     - apply enhanced drm_buddy_alloc() function to i915 driver
>>
>> v3(Matthew Auld):
>>    - Fix alignment issues and remove unnecessary list_empty check
>>    - add more validation checks for input arguments
>>    - make alloc_range() block allocations as bottom-up
>>    - optimize order computation logic
>>    - replace uint64_t with u64, which is preferred in the kernel
>>
>> v4(Matthew Auld):
>>    - keep drm_buddy_alloc_range() function implementation for generic
>>      actual range allocations
>>    - keep alloc_range() implementation for end bias allocations
>>
>> v5(Matthew Auld):
>>    - modify drm_buddy_alloc() passing argument place->lpfn to lpfn
>>      as place->lpfn will currently always be zero for i915
>>
>> v6(Matthew Auld):
>>    - fixup potential uaf - If we are unlucky and can't allocate
>>      enough memory when splitting blocks, where we temporarily
>>      end up with the given block and its buddy on the respective
>>      free list, then we need to ensure we delete both blocks,
>>      and no just the buddy, before potentially freeing them
>>
>>    - fix warnings reported by kernel test robot <lkp@intel.com>
>>
>> v7(Matthew Auld):
>>    - revert fixup potential uaf
>>    - keep __alloc_range() add node to the list logic same as
>>      drm_buddy_alloc_blocks() by having a temporary list variable
>>    - at drm_buddy_alloc_blocks() keep i915 range_overflows macro
>>      and add a new check for end variable
>>
>> v8:
>>    - fix warnings reported by kernel test robot <lkp@intel.com>
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c                   | 315 +++++++++++++-----
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |  67 ++--
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |   2 +
>>   include/drm/drm_buddy.h                       |  13 +-
>>   4 files changed, 280 insertions(+), 117 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index d60878bc9c20..cfc160a1ef1a 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -282,23 +282,97 @@ void drm_buddy_free_list(struct drm_buddy *mm, struct list_head *objects)
>>   }
>>   EXPORT_SYMBOL(drm_buddy_free_list);
>>   
>> -/**
>> - * drm_buddy_alloc_blocks - allocate power-of-two blocks
>> - *
>> - * @mm: DRM buddy manager to allocate from
>> - * @order: size of the allocation
>> - *
>> - * The order value here translates to:
>> - *
>> - * 0 = 2^0 * mm->chunk_size
>> - * 1 = 2^1 * mm->chunk_size
>> - * 2 = 2^2 * mm->chunk_size
>> - *
>> - * Returns:
>> - * allocated ptr to the &drm_buddy_block on success
>> - */
>> -struct drm_buddy_block *
>> -drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order)
>> +static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
>> +{
>> +	return s1 <= e2 && e1 >= s2;
>> +}
>> +
>> +static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
>> +{
>> +	return s1 <= s2 && e1 >= e2;
>> +}
>> +
>> +static struct drm_buddy_block *
>> +alloc_range_bias(struct drm_buddy *mm,
>> +		 u64 start, u64 end,
>> +		 unsigned int order)
>> +{
>> +	struct drm_buddy_block *block;
>> +	struct drm_buddy_block *buddy;
>> +	LIST_HEAD(dfs);
>> +	int err;
>> +	int i;
>> +
>> +	end = end - 1;
>> +
>> +	for (i = 0; i < mm->n_roots; ++i)
>> +		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>> +
>> +	do {
>> +		u64 block_start;
>> +		u64 block_end;
>> +
>> +		block = list_first_entry_or_null(&dfs,
>> +						 struct drm_buddy_block,
>> +						 tmp_link);
>> +		if (!block)
>> +			break;
>> +
>> +		list_del(&block->tmp_link);
>> +
>> +		if (drm_buddy_block_order(block) < order)
>> +			continue;
>> +
>> +		block_start = drm_buddy_block_offset(block);
>> +		block_end = block_start + drm_buddy_block_size(mm, block) - 1;
>> +
>> +		if (!overlaps(start, end, block_start, block_end))
>> +			continue;
>> +
>> +		if (drm_buddy_block_is_allocated(block))
>> +			continue;
>> +
>> +		if (contains(start, end, block_start, block_end) &&
>> +		    order == drm_buddy_block_order(block)) {
>> +			/*
>> +			 * Find the free block within the range.
>> +			 */
>> +			if (drm_buddy_block_is_free(block))
>> +				return block;
>> +
>> +			continue;
>> +		}
>> +
>> +		if (!drm_buddy_block_is_split(block)) {
>> +			err = split_block(mm, block);
>> +			if (unlikely(err))
>> +				goto err_undo;
>> +		}
>> +
>> +		list_add(&block->right->tmp_link, &dfs);
>> +		list_add(&block->left->tmp_link, &dfs);
>> +	} while (1);
>> +
>> +	return ERR_PTR(-ENOSPC);
>> +
>> +err_undo:
>> +	/*
>> +	 * We really don't want to leave around a bunch of split blocks, since
>> +	 * bigger is better, so make sure we merge everything back before we
>> +	 * free the allocated blocks.
>> +	 */
>> +	buddy = get_buddy(block);
>> +	if (buddy &&
>> +	    (drm_buddy_block_is_free(block) &&
>> +	     drm_buddy_block_is_free(buddy)))
>> +		__drm_buddy_free(mm, block);
>> +	return ERR_PTR(err);
>> +}
>> +
>> +static struct drm_buddy_block *
>> +alloc_from_freelist(struct drm_buddy *mm,
>> +		    unsigned int order,
>> +		    unsigned long flags)
>>   {
>>   	struct drm_buddy_block *block = NULL;
>>   	unsigned int i;
>> @@ -320,78 +394,29 @@ drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order)
>>   	while (i != order) {
>>   		err = split_block(mm, block);
>>   		if (unlikely(err))
>> -			goto out_free;
>> +			goto err_undo;
>>   
>> -		/* Go low */
>> -		block = block->left;
>> +		block = block->right;
>>   		i--;
>>   	}
>> -
>> -	mark_allocated(block);
>> -	mm->avail -= drm_buddy_block_size(mm, block);
>> -	kmemleak_update_trace(block);
>>   	return block;
>>   
>> -out_free:
>> +err_undo:
>>   	if (i != order)
>>   		__drm_buddy_free(mm, block);
>>   	return ERR_PTR(err);
>>   }
>> -EXPORT_SYMBOL(drm_buddy_alloc_blocks);
>> -
>> -static inline bool overlaps(u64 s1, u64 e1, u64 s2, u64 e2)
>> -{
>> -	return s1 <= e2 && e1 >= s2;
>> -}
>>   
>> -static inline bool contains(u64 s1, u64 e1, u64 s2, u64 e2)
>> -{
>> -	return s1 <= s2 && e1 >= e2;
>> -}
>> -
>> -/**
>> - * drm_buddy_alloc_range - allocate range
>> - *
>> - * @mm: DRM buddy manager to allocate from
>> - * @blocks: output list head to add allocated blocks
>> - * @start: start of the allowed range for this block
>> - * @size: size of the allocation
>> - *
>> - * Intended for pre-allocating portions of the address space, for example to
>> - * reserve a block for the initial framebuffer or similar, hence the expectation
>> - * here is that drm_buddy_alloc_blocks() is still the main vehicle for
>> - * allocations, so if that's not the case then the drm_mm range allocator is
>> - * probably a much better fit, and so you should probably go use that instead.
>> - *
>> - * Note that it's safe to chain together multiple alloc_ranges
>> - * with the same blocks list
>> - *
>> - * Returns:
>> - * 0 on success, error code on failure.
>> - */
>> -int drm_buddy_alloc_range(struct drm_buddy *mm,
>> -			  struct list_head *blocks,
>> -			  u64 start, u64 size)
>> +static int __alloc_range(struct drm_buddy *mm,
>> +			 struct list_head *dfs,
>> +			 u64 start, u64 size,
>> +			 struct list_head *blocks)
>>   {
>>   	struct drm_buddy_block *block;
>>   	struct drm_buddy_block *buddy;
>>   	LIST_HEAD(allocated);
>> -	LIST_HEAD(dfs);
>>   	u64 end;
>>   	int err;
>> -	int i;
>> -
>> -	if (size < mm->chunk_size)
>> -		return -EINVAL;
>> -
>> -	if (!IS_ALIGNED(size | start, mm->chunk_size))
>> -		return -EINVAL;
>> -
>> -	if (range_overflows(start, size, mm->size))
>> -		return -EINVAL;
>> -
>> -	for (i = 0; i < mm->n_roots; ++i)
>> -		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>>   
>>   	end = start + size - 1;
>>   
>> @@ -399,7 +424,7 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>>   		u64 block_start;
>>   		u64 block_end;
>>   
>> -		block = list_first_entry_or_null(&dfs,
>> +		block = list_first_entry_or_null(dfs,
>>   						 struct drm_buddy_block,
>>   						 tmp_link);
>>   		if (!block)
>> @@ -436,8 +461,8 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>>   				goto err_undo;
>>   		}
>>   
>> -		list_add(&block->right->tmp_link, &dfs);
>> -		list_add(&block->left->tmp_link, &dfs);
>> +		list_add(&block->right->tmp_link, dfs);
>> +		list_add(&block->left->tmp_link, dfs);
>>   	} while (1);
>>   
>>   	list_splice_tail(&allocated, blocks);
>> @@ -459,7 +484,143 @@ int drm_buddy_alloc_range(struct drm_buddy *mm,
>>   	drm_buddy_free_list(mm, &allocated);
>>   	return err;
>>   }
>> -EXPORT_SYMBOL(drm_buddy_alloc_range);
>> +
>> +/**
>> + * __drm_buddy_alloc_range - actual range allocation
>> + *
>> + * @mm: DRM buddy manager to allocate from
>> + * @start: start of the allowed range for this block
>> + * @size: size of the allocation
>> + * @blocks: output list head to add allocated blocks
> 
> I guess no need to add kernel-doc for static functions.
> 
>> + *
>> + * Intended for pre-allocating portions of the address space, for example to
>> + * reserve a block for the initial framebuffer or similar
>> + *
>> + * Note that it's safe to chain together multiple alloc_ranges
>> + * with the same blocks list
>> + *
>> + * Returns:
>> + * 0 on success, error code on failure.
>> + */
>> +static int __drm_buddy_alloc_range(struct drm_buddy *mm,
>> +				   u64 start,
>> +				   u64 size,
>> +				   struct list_head *blocks)
>> +{
>> +	LIST_HEAD(dfs);
>> +	int i;
>> +
>> +	for (i = 0; i < mm->n_roots; ++i)
>> +		list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>> +
>> +	return __alloc_range(mm, &dfs, start, size, blocks);
>> +}
>> +
>> +/**
>> + * drm_buddy_alloc_blocks - allocate power-of-two blocks
>> + *
>> + * @mm: DRM buddy manager to allocate from
>> + * @start: start of the allowed range for this block
>> + * @end: end of the allowed range for this block
>> + * @size: size of the allocation
>> + * @min_page_size: alignment of the allocation
>> + * @blocks: output list head to add allocated blocks
>> + * @flags: DRM_BUDDY_*_ALLOCATION flags
>> + *
>> + * alloc_range_bias() called on range limitations, which traverses
>> + * the tree and returns the desired block.
>> + *
>> + * alloc_from_freelist() called when *no* range restrictions
>> + * are enforced, which picks the block from the freelist.
>> + *
>> + * blocks are allocated in order, the order value here translates to:
>> + *
>> + * 0 = 2^0 * mm->chunk_size
>> + * 1 = 2^1 * mm->chunk_size
>> + * 2 = 2^2 * mm->chunk_size
> 
> The order stuff here can be dropped I think, since this is now just 'size'.
> 
>> + *
>> + * Returns:
>> + * 0 on success, error code on failure.
>> + */
>> +int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>> +			   u64 start, u64 end, u64 size,
>> +			   u64 min_page_size,
>> +			   struct list_head *blocks,
>> +			   unsigned long flags)
>> +{
>> +	struct drm_buddy_block *block = NULL;
>> +	unsigned int min_order, order;
>> +	unsigned long pages;
>> +	LIST_HEAD(allocated);
>> +	int err;
>> +
>> +	if (size < mm->chunk_size)
>> +		return -EINVAL;
>> +
>> +	if (min_page_size < mm->chunk_size)
>> +		return -EINVAL;
>> +
>> +	if (!is_power_of_2(min_page_size))
>> +		return -EINVAL;
>> +
>> +	if (!IS_ALIGNED(start | end | size, mm->chunk_size))
>> +		return -EINVAL;
>> +
>> +	if (end > mm->size)
>> +		return -EINVAL;
>> +
>> +	if (range_overflows(start, size, mm->size))
>> +		return -EINVAL;
>> +
>> +	/* Actual range allocation */
>> +	if (start + size == end)
>> +		return __drm_buddy_alloc_range(mm, start, size, blocks);
>> +
>> +	pages = size >> ilog2(mm->chunk_size);
>> +	order = fls(pages) - 1;
>> +	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>> +
>> +	do {
>> +		order = min(order, (unsigned int)fls(pages) - 1);
>> +		BUG_ON(order > mm->max_order);
>> +		BUG_ON(order < min_order);
>> +
>> +		do {
>> +			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
> 
> Do we need an explicit flag for this? Can we not just check:
> 
> if (start || end < size)

amdgpu failed to load as some requirements are not met with the above
condition,

if we keep (start || end != size), amdgpu loads successfully.
> 
> We already implicitly determine the "actual range allocation" above. So 
> that would just leave the TODPOWN flag

ok, now we have only the TOPDOWN flag
#define DRM_BUDDY_TOPDOWN_ALLOCATION (1 << 0)

> 
> Otherwise,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
>> +				/* Allocate traversing within the range */
>> +				block = alloc_range_bias(mm, start, end, order);
>> +			else
>> +				/* Allocate from freelist */
>> +				block = alloc_from_freelist(mm, order, flags);
>> +
>> +			if (!IS_ERR(block))
>> +				break;
>> +
>> +			if (order-- == min_order) {
>> +				err = -ENOSPC;
>> +				goto err_free;
>> +			}
>> +		} while (1);
>> +
>> +		mark_allocated(block);
>> +		mm->avail -= drm_buddy_block_size(mm, block);
>> +		kmemleak_update_trace(block);
>> +		list_add_tail(&block->link, &allocated);
>> +
>> +		pages -= BIT(order);
>> +
>> +		if (!pages)
>> +			break;
>> +	} while (1);
>> +
>> +	list_splice_tail(&allocated, blocks);
>> +	return 0;
>> +
>> +err_free:
>> +	drm_buddy_free_list(mm, &allocated);
>> +	return err;
>> +}
>> +EXPORT_SYMBOL(drm_buddy_alloc_blocks);
>>   
>>   /**
>>    * drm_buddy_block_print - print block information
>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> index 247714bab044..a328a38fab07 100644
>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> @@ -36,13 +36,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>>   	struct i915_ttm_buddy_resource *bman_res;
>>   	struct drm_buddy *mm = &bman->mm;
>> -	unsigned long n_pages;
>> -	unsigned int min_order;
>> +	unsigned long n_pages, lpfn;
>>   	u64 min_page_size;
>>   	u64 size;
>>   	int err;
>>   
>> -	GEM_BUG_ON(place->fpfn || place->lpfn);
>> +	lpfn = place->lpfn;
>> +	if (!lpfn)
>> +		lpfn = man->size;
>>   
>>   	bman_res = kzalloc(sizeof(*bman_res), GFP_KERNEL);
>>   	if (!bman_res)
>> @@ -52,6 +53,9 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>   	INIT_LIST_HEAD(&bman_res->blocks);
>>   	bman_res->mm = mm;
>>   
>> +	if (place->fpfn || lpfn != man->size)
>> +		bman_res->flags |= DRM_BUDDY_RANGE_ALLOCATION;
>> +
>>   	GEM_BUG_ON(!bman_res->base.num_pages);
>>   	size = bman_res->base.num_pages << PAGE_SHIFT;
>>   
>> @@ -60,10 +64,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>   		min_page_size = bo->page_alignment << PAGE_SHIFT;
>>   
>>   	GEM_BUG_ON(min_page_size < mm->chunk_size);
>> -	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>> +
>>   	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>> +		unsigned long pages;
>> +
>>   		size = roundup_pow_of_two(size);
>> -		min_order = ilog2(size) - ilog2(mm->chunk_size);
>> +		min_page_size = size;
>> +
>> +		pages = size >> ilog2(mm->chunk_size);
>> +		if (pages > lpfn)
>> +			lpfn = pages;
>>   	}
>>   
>>   	if (size > mm->size) {
>> @@ -73,34 +83,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>   
>>   	n_pages = size >> ilog2(mm->chunk_size);
>>   
>> -	do {
>> -		struct drm_buddy_block *block;
>> -		unsigned int order;
>> -
>> -		order = fls(n_pages) - 1;
>> -		GEM_BUG_ON(order > mm->max_order);
>> -		GEM_BUG_ON(order < min_order);
>> -
>> -		do {
>> -			mutex_lock(&bman->lock);
>> -			block = drm_buddy_alloc_blocks(mm, order);
>> -			mutex_unlock(&bman->lock);
>> -			if (!IS_ERR(block))
>> -				break;
>> -
>> -			if (order-- == min_order) {
>> -				err = -ENOSPC;
>> -				goto err_free_blocks;
>> -			}
>> -		} while (1);
>> -
>> -		n_pages -= BIT(order);
>> -
>> -		list_add_tail(&block->link, &bman_res->blocks);
>> -
>> -		if (!n_pages)
>> -			break;
>> -	} while (1);
>> +	mutex_lock(&bman->lock);
>> +	err = drm_buddy_alloc_blocks(mm, (u64)place->fpfn << PAGE_SHIFT,
>> +				     (u64)lpfn << PAGE_SHIFT,
>> +				     (u64)n_pages << PAGE_SHIFT,
>> +				     min_page_size,
>> +				     &bman_res->blocks,
>> +				     bman_res->flags);
>> +	mutex_unlock(&bman->lock);
>> +	if (unlikely(err))
>> +		goto err_free_blocks;
>>   
>>   	*res = &bman_res->base;
>>   	return 0;
>> @@ -268,10 +260,17 @@ int i915_ttm_buddy_man_reserve(struct ttm_resource_manager *man,
>>   {
>>   	struct i915_ttm_buddy_manager *bman = to_buddy_manager(man);
>>   	struct drm_buddy *mm = &bman->mm;
>> +	unsigned long flags = 0;
>>   	int ret;
>>   
>> +	flags |= DRM_BUDDY_RANGE_ALLOCATION;
>> +
>>   	mutex_lock(&bman->lock);
>> -	ret = drm_buddy_alloc_range(mm, &bman->reserved, start, size);
>> +	ret = drm_buddy_alloc_blocks(mm, start,
>> +				     start + size,
>> +				     size, mm->chunk_size,
>> +				     &bman->reserved,
>> +				     flags);
>>   	mutex_unlock(&bman->lock);
>>   
>>   	return ret;
>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>> index 312077941411..72c90b432e87 100644
>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.h
>> @@ -20,6 +20,7 @@ struct drm_buddy;
>>    *
>>    * @base: struct ttm_resource base class we extend
>>    * @blocks: the list of struct i915_buddy_block for this resource/allocation
>> + * @flags: DRM_BUDDY_*_ALLOCATION flags
>>    * @mm: the struct i915_buddy_mm for this resource
>>    *
>>    * Extends the struct ttm_resource to manage an address space allocation with
>> @@ -28,6 +29,7 @@ struct drm_buddy;
>>   struct i915_ttm_buddy_resource {
>>   	struct ttm_resource base;
>>   	struct list_head blocks;
>> +	unsigned long flags;
>>   	struct drm_buddy *mm;
>>   };
>>   
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index f524db152413..54f25a372f27 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -22,6 +22,8 @@
>>   	start__ >= max__ || size__ > max__ - start__; \
>>   })
>>   
>> +#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
>> +
>>   struct drm_buddy_block {
>>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>>   #define DRM_BUDDY_HEADER_STATE  GENMASK_ULL(11, 10)
>> @@ -131,12 +133,11 @@ int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size);
>>   
>>   void drm_buddy_fini(struct drm_buddy *mm);
>>   
>> -struct drm_buddy_block *
>> -drm_buddy_alloc_blocks(struct drm_buddy *mm, unsigned int order);
>> -
>> -int drm_buddy_alloc_range(struct drm_buddy *mm,
>> -			  struct list_head *blocks,
>> -			  u64 start, u64 size);
>> +int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>> +			   u64 start, u64 end, u64 size,
>> +			   u64 min_page_size,
>> +			   struct list_head *blocks,
>> +			   unsigned long flags);
>>   
>>   void drm_buddy_free_block(struct drm_buddy *mm, struct drm_buddy_block *block);
>>   
>>
>> base-commit: 627e2885b51ab503a98aa89f0a0bd68416c731fc
