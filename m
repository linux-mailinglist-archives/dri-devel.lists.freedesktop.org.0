Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6211879EBBF
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 16:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DDE410E0A1;
	Wed, 13 Sep 2023 14:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2049.outbound.protection.outlook.com [40.107.92.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 936EB10E0A1;
 Wed, 13 Sep 2023 14:56:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQBXn0aacqSiPH8aPvYGLOkTiTVHCNtPcLfgR6B1XDFObBIRkSFSuub9O3ZLw29QoOw+NLS4M3eCN/myWx9vujfFtTBtCUbXaBUZAHGgJlTgJfwaAw6U6ehFOxbUxoh/CZlZZlrubcErrIQegQ/7mF0rgPeQARMWTt9QCsoIg4+rBeZ9CEVuFi8JrYK4f6rA7yEQvVzKK7XQJhNCd+BrIskcfOe8tTQSqsogFFDumTgSxmDdTggCtGSwIMKTPUwyjlJpuBXzUTVThcDkhdrl7eim1RtThEChnxOUGTTWF5xcNmIaEryOz1Pif9XbU/IkhoCQvSqDAD9OnErre/jNmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QYrN4VxlzZPiT7y5a3LCcbTPtTKSFiiAwr2Yee7TSg8=;
 b=kw7g/cvnv/IOCR/2Q16IjqU9v+1FumdJgiLEsX9aqAxj86JCKaJ7c2vU7kfk14DkRHahxCf19sI+/XYJC4FYDNw6nF80CcFYU/10bJHtzGHoFLuOACG3Bs6Hx3IKYoneNrO6jFvBFncEzMQBtAl5y/Bm3mjOJyt8zl+Up27XRRYm6WcDp+tWiY/7cfRCSjZu4QxuuCFxYCOTc6g2Pd2evNc9VgdFRzzypSQLT7FbJj50PMyJpwkFTCB/dFzXCWExrCiE0bWnhiIMEwr5+Y8gMflRGazombAtTPi8SfTW/Qe94i8l11i/JXd4x8qUP+R5mHuWv2JWfYyPdFvHOjUHIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QYrN4VxlzZPiT7y5a3LCcbTPtTKSFiiAwr2Yee7TSg8=;
 b=dMrbYRi0tG0+nIO8HlP2zUjezWl1wn23EaWrRJmJxYyE/8SYSq0gUzE5TCUo11nnJGibBKabFxQed+Zrpi6r1LAs2SZ/Jwd39NNXnRk7M7M4Hbj3OXO0lHFZwBNPREBV8wT+ULL2p08mMMqtZGz/N7dRlv7/FWHideJvx+Pwh68=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB4301.namprd12.prod.outlook.com (2603:10b6:208:1d4::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.40; Wed, 13 Sep
 2023 14:56:20 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::d09f:171e:f000:b619]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::d09f:171e:f000:b619%7]) with mapi id 15.20.6768.036; Wed, 13 Sep 2023
 14:56:19 +0000
Message-ID: <14c3502d-9f0a-887a-7862-592569ca8d16@amd.com>
Date: Wed, 13 Sep 2023 07:56:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 1/3] drm/buddy: Improve contiguous memory allocation
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20230909160902.15644-1-Arunpravin.PaneerSelvam@amd.com>
 <eb7a84ee-a9df-b1b7-0aa8-488146ccd747@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <eb7a84ee-a9df-b1b7-0aa8-488146ccd747@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0112.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:27::27) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|MN2PR12MB4301:EE_
X-MS-Office365-Filtering-Correlation-Id: 272c1333-643a-448b-12a5-08dbb469969c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +2iR2NwJFMg39UIFlZCmqzHhq5eeVWkFSqiIZi3AsP0LJ/8DD5ChE9W0ja/zVdJzzWDqhsyEHG6ZPPR6iVSfbfHCp6kQdCztN80kfq05je6+ZPQ5Pkuw7Nx8Ld4B+nszGmp5nhy+PVsPsCNxrR17h5XIclalOULRiyWFX70bncLYEc2a15RDYYlDb0783n3HEkJzY13M4va7L7Y8nD+wmnHWqup1RCCOYdyZx/CMhdZVQdRk8dmIcgyoJTNCFLEJiOUJfSGyNtrQCl5Ko/j/qOyItH0AU/AOH4guTMk3sg8QMTGAFkV5O5VcGa5u+BPgxN0JRYxvXcRpuhcFXhkggK4pr6sWrMj5mdZwRYlZxR+5QvD1PB4NHr+p0sd/ThWKIrCd11hH1EII5S85klpF+y169Stfe+jn0SFUSwwvXBlY1ClcxhhBWI/ef2MzGh9TDurXcjjPW6c2DlTJ47nXVnABcij8VX+hrgT+3IbfnNSUv/YvIIjIsI+tShYMmqbi8OBJxoL5VMG/jhjL+eI3ikc3nxJ5QeFE0/8cHHvbujEEBnJ7RL87DgJFrzssh6TcdzW565o8RVNCM4mwOcf+H1HDD3C/5w/hOKhzRytLUhkIR51sqnQZ8UEmpKjxBHUQOgsvEC4cXnJOJ+h2AM+a4bW0/1SdaBQRHcyDyhWGXK0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(366004)(136003)(396003)(39860400002)(186009)(451199024)(1800799009)(8936002)(5660300002)(8676002)(6506007)(53546011)(4326008)(6486002)(31686004)(41300700001)(478600001)(316002)(66476007)(66556008)(66946007)(6666004)(2906002)(6512007)(26005)(2616005)(83380400001)(36756003)(38100700002)(86362001)(31696002)(25903002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Mm1QM3VOK0lCTWVMUE5TZTd5K2JQZTNwRVplLzRTOEMzY3lhQVJDVk5oUXlu?=
 =?utf-8?B?ejBtV0dPTWN1SlZGUnZTZ25kcE54Q0gvTi91UHZuZk9oZTczUFBVN1N2ZTZ4?=
 =?utf-8?B?K0phem9OQlVtKytjRWgrRDBzNXJseEZRZWpRc1NaT1Jzbm9DejRFY3pRMHpH?=
 =?utf-8?B?KzdHR3RBYTZNTFNoOGdXTC85SFI3V2cva3JlbVZBSXBXbnFUOGdKYkVueXBl?=
 =?utf-8?B?NkI1L0x6c2prdm9CaFNkL2EvR25tQUtNZ3JUakkxYXVJd3kwdGV1K3EyTlB0?=
 =?utf-8?B?d3ZvTDZCMUg5QVM5RnduZWw1cnhuMTRjK2tKb0FUUTdhd25NK2FpU1pGbDd0?=
 =?utf-8?B?RUdNdmJZemQ1SS9wRjQxZUNJbDJqWVI0SkVzSkpHL05oaDN3N2RhRXNsdnVj?=
 =?utf-8?B?S2VzRjdZeUxJeWNzSjdRUTJCZlN6TzBvbjhVWHh1TTFPNU9xYU1PVWFERzBP?=
 =?utf-8?B?bnpzZ052eFZqQTlMVS9tY3RtVExGOTFIMlBYbEIvSW0ySWVwVHQ0ZzdnL2xp?=
 =?utf-8?B?OUJRR3A5V2ZWdlBsRDYxaEk4eU11RFpDWEFBQWVRUWJ5ZzlmdW12UzdXWkpZ?=
 =?utf-8?B?YXlrd3dhd2s2ZVR5WGdqZWMxejVOZXdteWV6K3JpOEw3aG1CWTFiaW5ackVl?=
 =?utf-8?B?a0pMYnpFZmJ2Uk1DSzllbWhSemFjS3A2MjlEbXB1L0d0REpGeWdVa1JlcWVD?=
 =?utf-8?B?ejBPZkhVazgrL21nemRQUjc1eUdiaGZtUWxEZzJQN3ZoaVpnUmpIZjFVajJy?=
 =?utf-8?B?N2ZaUFgzWCtVNHdWaXRzdWtWMkxLOEdjQzhUL2JXMGRPSUtpQm14L0diK2tJ?=
 =?utf-8?B?VlZFMmlZdzFmOEhjeDB2QmtLWVFQQmJVZzNVVG0xUk5Hdzd0Y2N4VVlVVnVS?=
 =?utf-8?B?ZUYvMHBQTnozelA1MnhuellocjBvUWRpZkpUb1ZFOVpsdlorTmhRWUlHYnEr?=
 =?utf-8?B?MFU0c0JoTFFHcWNHTlNhUDhkYzk3K0RhWFRhRXI0WXpPaTF3VUxvSU9rMHkz?=
 =?utf-8?B?eEwrVzMwZGVLSU5aYUVZQTVDZkZrQS92V3VNazRXdU41dUdtSExRUERWRWsx?=
 =?utf-8?B?VkZWbVpMZ2trN21UVHVnbTFkVDFxZWx1SDNRY1BLNTJIdjh4YzFYK1dCWEZo?=
 =?utf-8?B?Vm9obnE4MlM2MkhTWHJoMEVOblpQRGxOKzBZVU5JY3R6Q0Y5bnlpc2RpdHZl?=
 =?utf-8?B?NVpGVk9BVVJ3NVRCcVJFRGVqcVhpaHRXcDNubHAwMHo4bUlXM0o2ZUZPUmVp?=
 =?utf-8?B?NURXOURCZHN4dGpzSFd0ZkZpTFpJVlA1SjI3QmZ4NnFBa21FSlVPc0ROSDVl?=
 =?utf-8?B?cGFIOGZ3aFR6OHpYbE5TY2hwMXhCV3dZRXNLeXdGSjB0czhaazBPSFBUVzhU?=
 =?utf-8?B?YUhnc1dySXNmNXFnQkw0VE95RHhZV2JRQW54VkRaWDdqZ3NJMTJrbDRWVXVV?=
 =?utf-8?B?SnVBL0JuUUduNGpJbGI4N2pIdGNRWTByOGYwZm9ZdEpQUnNMUHQyeDdFTUJ5?=
 =?utf-8?B?d0N0d2F2eEhBaHRsbFlKN1NoaFVaQUN3SE8xSWFYMXFsY3NwZ0t4SDljb1NN?=
 =?utf-8?B?VldEanpVV1prdjI2ZTMvNmF3ZU5pM0V3QTVzZnltS2lQaUtKTUx3SGRHRmpW?=
 =?utf-8?B?MmpzVCtKczA0L1dMWkcyaWRMUlRoUzA1cGIzeFpqY2hYSTJDTGpTazB1Ylo1?=
 =?utf-8?B?REtYODhoVW1BdW9RK1laRHlRMkRTempLTjh1UVV0VTU4OExDc3ZydVFzT2tP?=
 =?utf-8?B?VVNsYzJRc2todEczak1qUzZHNUxHaDJ2U1RkMEJwMWxnV0VaZUo3ZldUZzNt?=
 =?utf-8?B?ZVFXb1pQRUc1RzVobHQzcXhxZXBZUm9rUkhsVjFtYnVsRkJMd1NCc1JYMU9k?=
 =?utf-8?B?UE80NGRlSUhFb0ZweE14THhVVHNsZ3N1VlFJUS9FUnM4VG9SYVZVZXhvVkdy?=
 =?utf-8?B?QjdDSkVWU1pLUllhNVVsVWZVdFlLeUFtR0FrSVowVWhoLzNPV1pPeFFZaDhy?=
 =?utf-8?B?YmVYeU1HQ2tjak1VWUtQSW9DeWhPODhHcFhSOVRiTSsxSmQzVkZtNTBQQk5x?=
 =?utf-8?B?Tld5d2NuSFlMUC9ycEx5RDNmY1FxRlA3Nkx1cUwrU1BnM0RwL2xsSzkwR0p1?=
 =?utf-8?Q?w/FZC27dI+68OQItTkMcvMaZ2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 272c1333-643a-448b-12a5-08dbb469969c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Sep 2023 14:56:19.8336 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fkzRsjlNnPFoPTQ3SSjaU2Sr/YpTT4GPorfy4vRwe5IlWQ1ci8ZHhlMC/LTM2TjALqYjgurhY8V3Ma1wH1+A9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4301
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/09/23 03:46, Matthew Auld wrote:
> On 09/09/2023 17:09, Arunpravin Paneer Selvam wrote:
>> Problem statement: The current method roundup_power_of_two()
>> to allocate contiguous address triggers -ENOSPC in some cases
>> even though we have enough free spaces and so to help with
>> that we introduce a try harder mechanism.
>>
>> In case of -ENOSPC, the new try harder mechanism rounddown the
>> original size to power of 2 and iterating over the round down
>> sized freelist blocks to allocate the required size traversing
>> RHS and LHS.
>>
>> As part of the above new method implementation we moved
>> contiguous/alignment size computation part and trim function
>> to the drm buddy file.
>>
>> v2: Modify the alloc_range() function to return total allocated size
>>      on -ENOSPC err and traverse RHS/LHS to allocate the required
>>      size (Matthew).
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 138 ++++++++++++++++++++++++++++++++----
>>   include/drm/drm_buddy.h     |   6 +-
>>   2 files changed, 127 insertions(+), 17 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 7098f125b54a..e909eed9cf60 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -480,10 +480,12 @@ alloc_from_freelist(struct drm_buddy *mm,
>>   static int __alloc_range(struct drm_buddy *mm,
>>                struct list_head *dfs,
>>                u64 start, u64 size,
>> -             struct list_head *blocks)
>> +             struct list_head *blocks,
>> +             u64 *total_allocated_on_err)
>>   {
>>       struct drm_buddy_block *block;
>>       struct drm_buddy_block *buddy;
>> +    u64 total_allocated = 0;
>>       LIST_HEAD(allocated);
>>       u64 end;
>>       int err;
>> @@ -520,6 +522,7 @@ static int __alloc_range(struct drm_buddy *mm,
>>               }
>>                 mark_allocated(block);
>> +            total_allocated += drm_buddy_block_size(mm, block);
>>               mm->avail -= drm_buddy_block_size(mm, block);
>>               list_add_tail(&block->link, &allocated);
>>               continue;
>> @@ -551,13 +554,20 @@ static int __alloc_range(struct drm_buddy *mm,
>>           __drm_buddy_free(mm, block);
>>     err_free:
>> -    drm_buddy_free_list(mm, &allocated);
>> +    if (err == -ENOSPC && total_allocated_on_err) {
>> +        list_splice_tail(&allocated, blocks);
>> +        *total_allocated_on_err = total_allocated;
>> +    } else {
>> +        drm_buddy_free_list(mm, &allocated);
>> +    }
>> +
>>       return err;
>>   }
>>     static int __drm_buddy_alloc_range(struct drm_buddy *mm,
>>                      u64 start,
>>                      u64 size,
>> +                   u64 *total_allocated_on_err,
>>                      struct list_head *blocks)
>>   {
>>       LIST_HEAD(dfs);
>> @@ -566,7 +576,62 @@ static int __drm_buddy_alloc_range(struct 
>> drm_buddy *mm,
>>       for (i = 0; i < mm->n_roots; ++i)
>>           list_add_tail(&mm->roots[i]->tmp_link, &dfs);
>>   -    return __alloc_range(mm, &dfs, start, size, blocks);
>> +    return __alloc_range(mm, &dfs, start, size,
>> +                 blocks, total_allocated_on_err);
>> +}
>> +
>> +static int __alloc_contig_try_harder(struct drm_buddy *mm,
>> +                     u64 size,
>> +                     u64 min_block_size,
>> +                     struct list_head *blocks)
>> +{
>> +    u64 rhs_offset, lhs_offset, lhs_size, filled;
>> +    struct drm_buddy_block *block;
>> +    struct list_head *list;
>> +    LIST_HEAD(blocks_lhs);
>> +    unsigned long pages;
>> +    unsigned int order;
>> +    u64 modify_size;
>> +    int err;
>> +
>> +    modify_size = rounddown_pow_of_two(size);
>> +    pages = modify_size >> ilog2(mm->chunk_size);
>> +    order = fls(pages) - 1;
>> +    if (order == 0)
>> +        return -ENOSPC;
>> +
>> +    list = &mm->free_list[order];
>> +    if (list_empty(list))
>> +        return -ENOSPC;
>> +
>> +    list_for_each_entry_reverse(block, list, link) {
>> +        /* Allocate blocks traversing RHS */
>> +        rhs_offset = drm_buddy_block_offset(block);
>> +        err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
>> +                           &filled, blocks);
>> +        if (!err || err != -ENOSPC)
>> +            return err;
>> +
>> +        lhs_size = max((size - filled), min_block_size);
>> +        if (!IS_ALIGNED(lhs_size, min_block_size))
>> +            lhs_size = round_up(lhs_size, min_block_size);
>> +
>> +        /* Allocate blocks traversing LHS */
>> +        lhs_offset = drm_buddy_block_offset(block) - lhs_size;
>> +        err =  __drm_buddy_alloc_range(mm, lhs_offset, lhs_size,
>> +                           NULL, &blocks_lhs);
>> +        if (!err) {
>> +            list_splice(&blocks_lhs, blocks);
>> +            return 0;
>
> I guess we could attempt to trim this also (could tweak the trim to 
> work on multiple nodes)? But I guess in practice should be pretty meh, 
> given that the extra rhs is hopefully not too big in the corner case 
> where the alignment doesn't fit the min_block_size?

Thanks for the review. good point. I will take a look into it.

Regards,

Arun.

>
> Anyway, for patches 1-3,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
>> +        } else if (err != -ENOSPC) {
>> +            drm_buddy_free_list(mm, blocks);
>> +            return err;
>> +        }
>> +        /* Free blocks for the next iteration */
>> +        drm_buddy_free_list(mm, blocks);
>> +    }
>> +
>> +    return -ENOSPC;
>>   }
>>     /**
>> @@ -626,7 +691,7 @@ int drm_buddy_block_trim(struct drm_buddy *mm,
>>         new_start = drm_buddy_block_offset(block);
>>       list_add(&block->tmp_link, &dfs);
>> -    err =  __alloc_range(mm, &dfs, new_start, new_size, blocks);
>> +    err =  __alloc_range(mm, &dfs, new_start, new_size, blocks, NULL);
>>       if (err) {
>>           mark_allocated(block);
>>           mm->avail -= drm_buddy_block_size(mm, block);
>> @@ -645,7 +710,7 @@ EXPORT_SYMBOL(drm_buddy_block_trim);
>>    * @start: start of the allowed range for this block
>>    * @end: end of the allowed range for this block
>>    * @size: size of the allocation
>> - * @min_page_size: alignment of the allocation
>> + * @min_block_size: alignment of the allocation
>>    * @blocks: output list head to add allocated blocks
>>    * @flags: DRM_BUDDY_*_ALLOCATION flags
>>    *
>> @@ -660,23 +725,24 @@ EXPORT_SYMBOL(drm_buddy_block_trim);
>>    */
>>   int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>                  u64 start, u64 end, u64 size,
>> -               u64 min_page_size,
>> +               u64 min_block_size,
>>                  struct list_head *blocks,
>>                  unsigned long flags)
>>   {
>>       struct drm_buddy_block *block = NULL;
>> +    u64 original_size, original_min_size;
>>       unsigned int min_order, order;
>> -    unsigned long pages;
>>       LIST_HEAD(allocated);
>> +    unsigned long pages;
>>       int err;
>>         if (size < mm->chunk_size)
>>           return -EINVAL;
>>   -    if (min_page_size < mm->chunk_size)
>> +    if (min_block_size < mm->chunk_size)
>>           return -EINVAL;
>>   -    if (!is_power_of_2(min_page_size))
>> +    if (!is_power_of_2(min_block_size))
>>           return -EINVAL;
>>         if (!IS_ALIGNED(start | end | size, mm->chunk_size))
>> @@ -690,14 +756,23 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>         /* Actual range allocation */
>>       if (start + size == end)
>> -        return __drm_buddy_alloc_range(mm, start, size, blocks);
>> -
>> -    if (!IS_ALIGNED(size, min_page_size))
>> -        return -EINVAL;
>> +        return __drm_buddy_alloc_range(mm, start, size, NULL, blocks);
>> +
>> +    original_size = size;
>> +    original_min_size = min_block_size;
>> +
>> +    /* Roundup the size to power of 2 */
>> +    if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION) {
>> +        size = roundup_pow_of_two(size);
>> +        min_block_size = size;
>> +    /* Align size value to min_block_size */
>> +    } else if (!IS_ALIGNED(size, min_block_size)) {
>> +        size = round_up(size, min_block_size);
>> +    }
>>         pages = size >> ilog2(mm->chunk_size);
>>       order = fls(pages) - 1;
>> -    min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>> +    min_order = ilog2(min_block_size) - ilog2(mm->chunk_size);
>>         do {
>>           order = min(order, (unsigned int)fls(pages) - 1);
>> @@ -716,6 +791,16 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>                   break;
>>                 if (order-- == min_order) {
>> +                if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION &&
>> +                    !(flags & DRM_BUDDY_RANGE_ALLOCATION))
>> +                    /*
>> +                     * Try contiguous block allocation through
>> +                     * try harder method
>> +                     */
>> +                    return __alloc_contig_try_harder(mm,
>> +                                     original_size,
>> +                                     original_min_size,
>> +                                     blocks);
>>                   err = -ENOSPC;
>>                   goto err_free;
>>               }
>> @@ -732,6 +817,31 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>               break;
>>       } while (1);
>>   +    /* Trim the allocated block to the required size */
>> +    if (original_size != size) {
>> +        struct list_head *trim_list;
>> +        LIST_HEAD(temp);
>> +        u64 trim_size;
>> +
>> +        trim_list = &allocated;
>> +        trim_size = original_size;
>> +
>> +        if (!list_is_singular(&allocated)) {
>> +            block = list_last_entry(&allocated, typeof(*block), link);
>> +            list_move(&block->link, &temp);
>> +            trim_list = &temp;
>> +            trim_size = drm_buddy_block_size(mm, block) -
>> +                (size - original_size);
>> +        }
>> +
>> +        drm_buddy_block_trim(mm,
>> +                     trim_size,
>> +                     trim_list);
>> +
>> +        if (!list_empty(&temp))
>> +            list_splice_tail(trim_list, &allocated);
>> +    }
>> +
>>       list_splice_tail(&allocated, blocks);
>>       return 0;
>>   diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index 572077ff8ae7..a5b39fc01003 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -22,8 +22,9 @@
>>       start__ >= max__ || size__ > max__ - start__; \
>>   })
>>   -#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
>> -#define DRM_BUDDY_TOPDOWN_ALLOCATION (1 << 1)
>> +#define DRM_BUDDY_RANGE_ALLOCATION        BIT(0)
>> +#define DRM_BUDDY_TOPDOWN_ALLOCATION        BIT(1)
>> +#define DRM_BUDDY_CONTIGUOUS_ALLOCATION        BIT(2)
>>     struct drm_buddy_block {
>>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
>> @@ -155,5 +156,4 @@ void drm_buddy_print(struct drm_buddy *mm, struct 
>> drm_printer *p);
>>   void drm_buddy_block_print(struct drm_buddy *mm,
>>                  struct drm_buddy_block *block,
>>                  struct drm_printer *p);
>> -
>>   #endif
