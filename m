Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0748C85F9F7
	for <lists+dri-devel@lfdr.de>; Thu, 22 Feb 2024 14:38:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCC1010E933;
	Thu, 22 Feb 2024 13:37:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sUrnLh8o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C70D10E92E;
 Thu, 22 Feb 2024 13:37:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A5QDuIXwRW7yk6PYbOHM8lWsl6m1xij237i8B0PsN3rb6/LPdKmTMbjUrVm2I5YpYFbUKK4lHIq1ee4QV6JXFbnKgg0tn9DWAAk2WrP3+F1zSzIIGc+d+30eBo9qpRR2e7fVSaunxPEa8Cp3V6IJ0wYqVMgLQyjJMv2YKkHvLTURj2GRDDUA9zr2Yhh++L/DazxihdM503ZMeHQy9Ly0RvXeTkc1mrt6CH0julEfZxXuYe8MAXWnqQDP4zqTINvN4p0QPfJ2jvy1oE3n89kGhbF54YgUWcyONitYNy1SpCCJJU9AWS4zG0RxVjwniqtkKREwySVnGnZ3f+gfrxvcOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbTR58YH4EbZJuoym/94rfZ9vvDy0mkURdxHHIHf0yc=;
 b=hUloj+px+8V6hBaJod0CsHkaIx4KkXHghawR06Abcyo45XlwQhym3KGdayLmvLNm/ZUhv4taZYWIWIhlhhFDX0n0kXGjSsVyFzTPK+8gpDwm8fHb3nzj3IEhtLYLg3ipokrwG0JKy5guUwc6fo48VMCntTNQs8Z2ZQBhut1xNaH3yYj3+iNoDJohPSu7ruiK9c6Y7i4sOrfQ2YQwOSdja5WiTzrfcir4alGZ8z1Kab2CAnZUS4S1D1Kj1j0WAaEVog95g1p4jEa72TY+uHjbI7Ic02VqiFTaGY0zVUiiltGd78iWClNfRDse2Ohfs8jJre4yXGu6Qi2eHfNQOGSjNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbTR58YH4EbZJuoym/94rfZ9vvDy0mkURdxHHIHf0yc=;
 b=sUrnLh8oDl9072nxna7UT/XiLZJR7rXh/5WciXec/1d+u/KzXjyHxdWTWH49H0scIhAGSjXCUAhUPBCe/6azF227saBScECfFBgn1Rx/esGLjjAQjSOGcRm+Gg+Cm1Z4dk0dgeT+jT8jvVesk8+dSlH23HyimnwTqZzfw+Z6VBY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by IA0PR12MB8424.namprd12.prod.outlook.com (2603:10b6:208:40c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.24; Thu, 22 Feb
 2024 13:37:51 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c05f:756d:717e:e7c6]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c05f:756d:717e:e7c6%6]) with mapi id 15.20.7316.023; Thu, 22 Feb 2024
 13:37:51 +0000
Message-ID: <9bb5e62d-1012-6dca-3c48-db79a1f54a12@amd.com>
Date: Thu, 22 Feb 2024 19:07:44 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 3/3] drm/buddy: Add defragmentation support
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, matthew.auld@intel.com, felix.kuehling@amd.com
References: <20240221121801.3252-1-Arunpravin.PaneerSelvam@amd.com>
 <20240221121801.3252-3-Arunpravin.PaneerSelvam@amd.com>
 <e10103e0-d93a-4af8-b30c-ef8d868ebc25@amd.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <e10103e0-d93a-4af8-b30c-ef8d868ebc25@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0047.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::22) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|IA0PR12MB8424:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f1fff91-fed5-4401-5bb5-08dc33ab7707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XtNCMN5HkslMc5E9bbpYDFqhXUwVsJaPRxaVnWkVjVVRCaKi1eInkkjMSrb07u/r2IDazfxBQ35ZiavjEqM9OVCBVCQ/eFowjEpWntwmsMmyJ8RL9tJ8i3hVjxVkVFMruWZSc/id9MaAker4yttIPCErHsn4GIAwhK/Uxct63G6Q+gJcNdQbSH4hD7Oqn86FCAU2xskhx+JcGuajbpZo/Y4Ql0XxeoFSnNXX5k4Ejn65h2yz0082zaAgjzpBe0lKyagvLx8ixZzaJFNrNEMzUf4uZmWwCubFzv9nYwLoMNHMPogTj/AXilRhBZUmc0lXd9xLfXTr3k2qG+U4PNOQykVvjyCQp3zBxWVb2021AQYjkhldOTRMMsfoGgK/LuBlPiecR224k1io1+mbyz5AM9LJwo8Gy0yhFvAHJNTINuZ6i9SibMFc6kwDazs4WL0MLUSlGB40CBByRHrPCPt8uaU+ibMFxzLskM4tLRQcPoq0AkMsrqD2ZCYKMXHALpVtIJVnXJZI1nHMBDxKsvF1aWdTo1dBI+fTSryLACbNFEYgsYUdTr3XRzokaMiEOD1P
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WHBZdWhiTTJFU05mSFdXdEFBUHNmYmVTWVZTU0h0YmNka2EyQXF0NVZPSGpz?=
 =?utf-8?B?a08wQ096cE1qYjNCbHB0anVsMlpJbVFsVkVIelVaLzB3SDBYaFZ3eDE5M2Va?=
 =?utf-8?B?NlkyOWU3RDJMUWIySzJsV3lQdml0c3NpamZSd2J1L0hMM2p0OFZsRmV2YzhK?=
 =?utf-8?B?cTUxVWRzNTlzVlVFWTN4MUZsbFNUKzdhdTdmQ3ZseWM0Y1hXNVFvZzA5OXZ4?=
 =?utf-8?B?bmRrNXdkZnZwak1BcWluejZCMitVa1BiRWI5Yk5OdDZxYnBwZUQ2OVh6ekRZ?=
 =?utf-8?B?VzhkVVhVaDR5UU9LLzNTT0dnbUM2cVdONnhWU3k2eEd1aGhuVStTbHB3N1NG?=
 =?utf-8?B?Q3B6QzNpRXc1OTFYZGw5ZFR4WllhYWhwRDc4ZG9WL1V5bFowRU83R2srbUtX?=
 =?utf-8?B?bzE2cDR5Z3hzRFphM282L2VtU3J4Z243aEFIaVVJRGExMXd3RWZNbnBGd3k5?=
 =?utf-8?B?Y0FlNDFNeGxkMmxpU21DU1JnckZHSkhmQ1NSL1B2QkVhNkxNOVdHenM2MzlH?=
 =?utf-8?B?RkorT3ltaFJ3cDU0K1BXU3JVNXkyU0ZFc0xkMHhYblpEUk5va2VCZHZUZjdL?=
 =?utf-8?B?ZUJBclVwN1BRVm1hODVqWTJKOXhDUjBMOXV3MHU2K25EQnlabU1xUkJNVVdy?=
 =?utf-8?B?MHQ1WHNJUjgzM2UzYmlFaXlYRWV6V1E0cENPSE5NRTlMempOMlBodWZ3b0Jj?=
 =?utf-8?B?ckJZQlJTM3U1c1JMMlBYb2lNRkVYTWFpdkx3dGlIUUV1dE5ZSEZ3VFU0Mm9j?=
 =?utf-8?B?Zm9tdEE3dlkxTEkxQ2RXQWF6REwyOGx2aHlXeUhtMUxhdWVrSGFJWnhFZTho?=
 =?utf-8?B?MVRCc3RMckYxYlBVdGUxVDNKMWtuaG5hbTRSRkNwNVQ2K3hPaWhhYVNEMGxN?=
 =?utf-8?B?L0xLeXVLMXBmUGwzS2wzWlAwR1EveWNOOHNFck9UbWNjMHNYWE9Zamg0VUtr?=
 =?utf-8?B?YTkyOG1pWmQzUnE2YU1WdEwzRUpuU0s4U2x0QjJyb0JUenF1M3lqR0l2RHFi?=
 =?utf-8?B?SjNQdUxxdEpIajRWaS9yY1NYRHlyVHpFdlB1alA3d2IwQWM4RXpZQmdvWlFQ?=
 =?utf-8?B?dmlnQklOMDl0cUJJK0duN1Q0WmNjNjlUS1Zlb0RFU3dvUjZna3NnbFJ1aEVk?=
 =?utf-8?B?Yy9vSzR0bTltQlB5QWI2SGxudldmQjg4WWtBa01YVy9ya3ozOVk1c1p6Ylp0?=
 =?utf-8?B?emhxZkhpcUkycE45U0k1TndycXFxR0hBQlhyYnZGRng1c3lqZkJ3TUNnNm8x?=
 =?utf-8?B?Q1NGWlIrbEp1b1hhZytZeVV0a3FMQUNHQXM3amlBMVVFcmNLMFgrWUVFYkFj?=
 =?utf-8?B?TFpQdCsvVVQ1bjQyMEZmN0xxYmptbWhtY2p4WWFsUTF3WHRPNEd1aWJtd0V5?=
 =?utf-8?B?NEZFTTd4TU02Y2FSL2ZzSVREZTNkUmcyRXBpUUo3c0FuVis4a1NtSHA0b2ll?=
 =?utf-8?B?Y3B0UGZUbUZvTVd0SXE1YnlKV1FZWnBFUVZDRXcyZHN0c3hTam9HNURpVnRi?=
 =?utf-8?B?bzhzdjR4QTI5WUxmZU43anNkNWNQWmxtV2ljcGVvR0RjRGxNNE8zY1hyOWFM?=
 =?utf-8?B?QUsySm82S0lmUklSeHhTS0xzUzg2bksyR01XQ2NheVgxM0I2Qm51bUlyd2xD?=
 =?utf-8?B?TG9jWms2VXQycDlCUE1Oc1g5blhlRGFHL1NQN1FaVncySElUWDZkZGpjeGI1?=
 =?utf-8?B?aHVNZVIreHJJZExFZ2Z1WFFFSC9OU25NWThnZEliMjRiUkZQQ1diSEdtYnRq?=
 =?utf-8?B?cHAxbXNIMytZRGZESkl1MlhQRWxCL1A4Y0RPLzhiem9ETTNDVDdoeGVJWE9E?=
 =?utf-8?B?SjJaeEs5L1RJZWwrYlF4ZEhaUjhLUUpMaHRGQUVrUnUrM0tERDZDdXFFZEp1?=
 =?utf-8?B?SjdFS1VhNHBuU3hic2Qrc21XY1dDT2g0ZForYmhjdmIyTEVBMXdNN1htOGRK?=
 =?utf-8?B?SG9ZcEFSdzBTdkdTZ2l2akd5YjV5SmNCT25LOGZ3dnFpNWxvUEZ6NTkrdkJ3?=
 =?utf-8?B?cUlVSmtlb1VHWkcyZ3ZZQmxxVE1GOWVJNHM4dXVJZFRSSGVUU1FHVXJzU1lj?=
 =?utf-8?B?MHkzQjZKN1oxQkpkMTd4cFM5SG9TV293MmFVa3hub0p2dTNUaU1uUGZxM2lF?=
 =?utf-8?Q?tQ4u6tB1kWq1SMwIsJ3YHlmKx?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f1fff91-fed5-4401-5bb5-08dc33ab7707
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 13:37:51.2805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8bhucu29wv7HEMigO65EainmN6WowR5TWYSTNdaKn6weSftlvfOyNmVoJWdDvSNcORbvFAh11zCJCfD72jyIYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8424
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Christian,

On 2/21/2024 7:58 PM, Christian König wrote:
> Am 21.02.24 um 13:18 schrieb Arunpravin Paneer Selvam:
>> Add a function to support defragmentation.
>
> Thinking more about it maybe you want to call this function differently.
>
> Essentially we are force merging pages even if their cleared flag 
> doesn't match, that is something different than defragmentation I think.
>
> Maybe rename it for force_merge or something similar. Not mandatory, 
> just an idea how to improve the readability of the code.
>
> Apart from that just let me know when I can push it to drm-misc-next.
>
> Christian.
I am fixing few issues reported by user and addressing Matthew's 
suggestions on v7 version. I will post the v8 version incorporating
all the changes. I hope we can push v8 into drm-misc-next.

Thanks,
Arun.
>
>>
>> v1:
>>    - Defragment the memory beginning from min_order
>>      till the required memory space is available.
>>
>> v2(Matthew):
>>    - add amdgpu user for defragmentation
>>    - add a warning if the two blocks are incompatible on
>>      defragmentation
>>    - call full defragmentation in the fini() function
>>    - place a condition to test if min_order is equal to 0
>>    - replace the list with safe_reverse() variant as we might
>>      remove the block from the list.
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c | 17 +++-
>>   drivers/gpu/drm/drm_buddy.c                  | 93 +++++++++++++++++---
>>   include/drm/drm_buddy.h                      |  3 +
>>   3 files changed, 97 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> index e494f5bf136a..cff8a526c622 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
>> @@ -533,8 +533,21 @@ static int amdgpu_vram_mgr_new(struct 
>> ttm_resource_manager *man,
>>                          min_block_size,
>>                          &vres->blocks,
>>                          vres->flags);
>> -        if (unlikely(r))
>> -            goto error_free_blocks;
>> +        if (unlikely(r)) {
>> +            if (r == -ENOSPC) {
>> +                drm_buddy_defrag(mm, min_block_size);
>> +                r = drm_buddy_alloc_blocks(mm, fpfn,
>> +                               lpfn,
>> +                               size,
>> +                               min_block_size,
>> +                               &vres->blocks,
>> +                               vres->flags);
>> +                if (unlikely(r))
>> +                    goto error_free_blocks;
>> +            } else {
>> +                goto error_free_blocks;
>> +            }
>> +        }
>>             if (size > remaining_size)
>>               remaining_size = 0;
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 18e004fa39d3..56bd1560fbcd 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -203,6 +203,8 @@ void drm_buddy_fini(struct drm_buddy *mm)
>>           drm_block_free(mm, mm->roots[i]);
>>       }
>>   +    drm_buddy_defrag(mm, mm->chunk_size << mm->max_order);
>> +
>>       WARN_ON(mm->avail != mm->size);
>>         kfree(mm->roots);
>> @@ -276,25 +278,39 @@ drm_get_buddy(struct drm_buddy_block *block)
>>   }
>>   EXPORT_SYMBOL(drm_get_buddy);
>>   -static void __drm_buddy_free(struct drm_buddy *mm,
>> -                 struct drm_buddy_block *block)
>> +static unsigned int __drm_buddy_free(struct drm_buddy *mm,
>> +                     struct drm_buddy_block *block,
>> +                     bool defrag)
>>   {
>> +    unsigned int order, block_order;
>>       struct drm_buddy_block *parent;
>>   +    block_order = drm_buddy_block_order(block);
>> +
>>       while ((parent = block->parent)) {
>> -        struct drm_buddy_block *buddy;
>> +        struct drm_buddy_block *buddy = NULL;
>>             buddy = __get_buddy(block);
>>             if (!drm_buddy_block_is_free(buddy))
>>               break;
>>   -        if (drm_buddy_block_is_clear(block) !=
>> -            drm_buddy_block_is_clear(buddy))
>> -            break;
>> +        if (!defrag) {
>> +            /*
>> +             * Check the block and its buddy clear state and exit
>> +             * the loop if they both have the dissimilar state.
>> +             */
>> +            if (drm_buddy_block_is_clear(block) !=
>> +                drm_buddy_block_is_clear(buddy))
>> +                break;
>>   -        if (drm_buddy_block_is_clear(block))
>> -            mark_cleared(parent);
>> +            if (drm_buddy_block_is_clear(block))
>> +                mark_cleared(parent);
>> +        }
>> +
>> +        WARN_ON(defrag &&
>> +            (drm_buddy_block_is_clear(block) ==
>> +             drm_buddy_block_is_clear(buddy)));
>>             list_del(&buddy->link);
>>   @@ -304,8 +320,57 @@ static void __drm_buddy_free(struct drm_buddy 
>> *mm,
>>           block = parent;
>>       }
>>   -    mark_free(mm, block);
>> +    order = drm_buddy_block_order(block);
>> +    if (block_order != order)
>> +        mark_free(mm, block);
>> +
>> +    return order;
>> +}
>> +
>> +/**
>> + * drm_buddy_defrag - Defragmentation routine
>> + *
>> + * @mm: DRM buddy manager
>> + * @min_block_size: minimum size in bytes to begin
>> + * the defragmentation process
>> + *
>> + * Driver calls the defragmentation function when the
>> + * requested memory allocation returns -ENOSPC.
>> + */
>> +void drm_buddy_defrag(struct drm_buddy *mm,
>> +              unsigned int min_block_size)
>> +{
>> +    struct drm_buddy_block *block, *tmp;
>> +    unsigned int order, min_order;
>> +    struct list_head *list;
>> +    unsigned long pages;
>> +    int i;
>> +
>> +    pages = min_block_size >> ilog2(mm->chunk_size);
>> +    min_order = fls(pages) - 1;
>> +
>> +    if (!min_order)
>> +        return;
>> +
>> +    if (min_order > mm->max_order)
>> +        return;
>> +
>> +    for (i = min_order - 1; i >= 0; i--) {
>> +        list = &mm->free_list[i];
>> +        if (list_empty(list))
>> +            continue;
>> +
>> +        list_for_each_entry_safe_reverse(block, tmp, list, link) {
>> +            if (!block->parent)
>> +                continue;
>> +
>> +            order = __drm_buddy_free(mm, block, 1);
>> +            if (order >= min_order)
>> +                return;
>> +        }
>> +    }
>>   }
>> +EXPORT_SYMBOL(drm_buddy_defrag);
>>     /**
>>    * drm_buddy_free_block - free a block
>> @@ -321,7 +386,7 @@ void drm_buddy_free_block(struct drm_buddy *mm,
>>       if (drm_buddy_block_is_clear(block))
>>           mm->clear_avail += drm_buddy_block_size(mm, block);
>>   -    __drm_buddy_free(mm, block);
>> +    __drm_buddy_free(mm, block, 0);
>>   }
>>   EXPORT_SYMBOL(drm_buddy_free_block);
>>   @@ -468,7 +533,7 @@ __alloc_range_bias(struct drm_buddy *mm,
>>       if (buddy &&
>>           (drm_buddy_block_is_free(block) &&
>>            drm_buddy_block_is_free(buddy)))
>> -        __drm_buddy_free(mm, block);
>> +        __drm_buddy_free(mm, block, 0);
>>       return ERR_PTR(err);
>>   }
>>   @@ -586,7 +651,7 @@ alloc_from_freelist(struct drm_buddy *mm,
>>     err_undo:
>>       if (tmp != order)
>> -        __drm_buddy_free(mm, block);
>> +        __drm_buddy_free(mm, block, 0);
>>       return ERR_PTR(err);
>>   }
>>   @@ -666,7 +731,7 @@ static int __alloc_range(struct drm_buddy *mm,
>>       if (buddy &&
>>           (drm_buddy_block_is_free(block) &&
>>            drm_buddy_block_is_free(buddy)))
>> -        __drm_buddy_free(mm, block);
>> +        __drm_buddy_free(mm, block, 0);
>>     err_free:
>>       if (err == -ENOSPC && total_allocated_on_err) {
>> @@ -828,7 +893,7 @@ EXPORT_SYMBOL(drm_buddy_block_trim);
>>    * @mm: DRM buddy manager to allocate from
>>    * @start: start of the allowed range for this block
>>    * @end: end of the allowed range for this block
>> - * @size: size of the allocation
>> + * @size: size of the allocation in bytes
>>    * @min_block_size: alignment of the allocation
>>    * @blocks: output list head to add allocated blocks
>>    * @flags: DRM_BUDDY_*_ALLOCATION flags
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index 352a6364e26a..68a874846e78 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -167,6 +167,9 @@ void drm_buddy_free_list(struct drm_buddy *mm,
>>                struct list_head *objects,
>>                unsigned int flags);
>>   +void drm_buddy_defrag(struct drm_buddy *mm,
>> +              unsigned int min_order);
>> +
>>   void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
>>   void drm_buddy_block_print(struct drm_buddy *mm,
>>                  struct drm_buddy_block *block,
>

