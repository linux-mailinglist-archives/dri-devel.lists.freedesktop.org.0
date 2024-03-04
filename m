Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F06870129
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 13:22:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B6E1120B3;
	Mon,  4 Mar 2024 12:22:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="T4XP/Sv9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2047.outbound.protection.outlook.com [40.107.243.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A0971120B4;
 Mon,  4 Mar 2024 12:22:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gPACRKY6g0YUfbpRzvSivBe8IGbAfJSnbjt0k/g1tFh5Yql0/JVxYfa0iNtteHONPhqGVHn8DIVcZr3uxjk+IDWK15E+SZq3GjCmhx1GnJuhuF7gUtHObUfnI+CBKBNDS+05zAlSbAgt4aac7Z9K5x1ZkpYsW5hCR2G7rhxzQmUIYdxaX3XSFH4f2iRWGlQUODcrOoLQuG3V6M5zoAsPIYMBLxHScfg4zMDdqwULBcibvWq4o4blYnFcSe3fTPZVFHAepKF6WVpjNMbBPyBhteftVKTqNx/NTTtCl9r+xolQQrXJ+Xovz/B7zVb6Uuy2zxjCgFUlgNJVAJ6Y1eNQfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BGqHGkt2sq43z1oBpEWOEK/hWSnWT65H/ahkTP0eEh8=;
 b=Z746LN5jFoDNdI5rjg0MAucxqEhwyNo8REWYryMUQ+n1qVIXLuX4tJZbDprjodmoJXs2gXEGC2sliNDkYcz4ZF6dmKTY6vBaUv3rDpLWdjXyeCOpcRNX7IwiSq9fdHvi1onWwKp3qWnn6Tc38k+v5uiPGkzbG26F6QfL5asro1NElSZnQHjFssiiwy2XLJs69xzw5fCZTyYRsm+KyXmhop1ZbVaxFilhkgSBXN85SRYdLThayFbBYw5h8Uw4QHQwEnZ4Oh84+OvaPIoYdksXiycTGtXk+eU7YXgo0dRZ9ZQZlpeT/dyNJRl7BO0IFd2Cn0LlCnJ8qqySlybP40yH5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BGqHGkt2sq43z1oBpEWOEK/hWSnWT65H/ahkTP0eEh8=;
 b=T4XP/Sv9Yh/5ZFb8iivvGMyJNUQzrKYx6Nm0JdLUcw/pkEUUUMDqyJcU7f2sLcUT/l9nR6nlWzDHyc+EF3A74RfHit1KlZ/wYT6DknyGtYRBZ4VaDiNWxyFAagJpJNp8Zx8Zl+3YvGQywEptZK1r8SbYy7UbQy9UnTEMn+syaz0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by SA3PR12MB8046.namprd12.prod.outlook.com (2603:10b6:806:304::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38; Mon, 4 Mar
 2024 12:22:46 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6610:4b4b:1f3a:151b]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6610:4b4b:1f3a:151b%6]) with mapi id 15.20.7339.035; Mon, 4 Mar 2024
 12:22:46 +0000
Message-ID: <ebdc7ceb-2ec4-460c-b8a3-c90184cd800e@amd.com>
Date: Mon, 4 Mar 2024 17:52:38 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] drm/buddy: Add defragmentation support
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com, felix.kuehling@amd.com
References: <20240221121801.3252-1-Arunpravin.PaneerSelvam@amd.com>
 <20240221121801.3252-3-Arunpravin.PaneerSelvam@amd.com>
 <2c841f63-10d5-4de3-b331-6b320a92dc64@intel.com>
Content-Language: en-US
From: "Paneer Selvam, Arunpravin" <arunpravin.paneerselvam@amd.com>
In-Reply-To: <2c841f63-10d5-4de3-b331-6b320a92dc64@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0039.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::14) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|SA3PR12MB8046:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bfb4016-b7d4-45ba-0bc3-08dc3c45cc9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bNlmEe9oxAv5LkvMC5FTHm9fNCXBZ5sunqR0UbaH6K9tLFmUQnyPMCpGif5/GFqPofpn5Bs5cRRhYK7zw9psAHuGLWXqVaCs209rsSoyQEpQJjmS8KeOE5lOV+gqcIqq5uFRbkDMZZZ0DVSrIpCvmtgB9X+ZevT1MOdqHnOdjEYvsZ/x71+4La+g5URnXBPD9g9A+yG99oBOV1BG9dEenGXEXeC79g8RgZMtcda/zoimkDUJ3htVCBn9zOqR3KyoUE0ZFVypraKC4v3x6L7h+I9taRHlBb2srtHF7qdVrDkedPKwtRggxEPh6XgDk4rtJp/hf+Z8Rrx6gU5VeORufnFIjwqkcKVlHQssyMHAbgCk3SuNKh1jJUnRA3gWDg0ArcxtAR/WCJWns0EVxER0DhkgZQWDzXVvtkd7SCI+QO5mdAmrn+WtsItHkg5m0VZ5TSCG0nPwEQwD0fKFKbH3MF7H7GO2Oti4p+uocMbUyDblh5py93eCusnG6Z1sMZT5a9usD+lbuGgz3eopEalbIZ2i0+iRVJFqp0uDODD1EQGJ4CR6kgY0MyWwb+OlVOzjC+7+O3ccd1wKphBuW2VdfmRdOSihGITDlrEURBW9SKAMZtRsfUPKXvSoBuRHZPW/3OwrwZm41wSDSHPm+su7V1oK4na8IjPDv1uS3nRVX1E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dTY1NFdUZnRYa3laazVhV1BUMHpMeGI5SzhERDBOcmhLYjVqK3BteCtWMnpU?=
 =?utf-8?B?T0UxMXhJSFUxb0gyY01TMFNOaGZtVXlpOGdZNWtwaGVPOXI5ZGlWMUhqV1Bh?=
 =?utf-8?B?YWlaK3g0cDFwYWI0UG5DUXNTYm1ibEJBSU4ycjNsdkdZVzQxdkhFemV6eEpS?=
 =?utf-8?B?R2ZqTG1ydW1EeWthajBka2RDb3gvbk5HbmRLdUtCT2RBMWl5UUlhQXEyZFlk?=
 =?utf-8?B?Z05ZRUxDZitxNGlKZlhLL3h0QUhvK0gyc1hST0xwbTR3NXN4dXJzSVV6YTVL?=
 =?utf-8?B?Wk9IREk0TlVkeVVqcVRYSVRJNkZPMnNTK0tWZmorcmFKcW8xQnRHRE1nQVA5?=
 =?utf-8?B?RXZ1aDZkd2xFRFEreXJNWDV0b1Y4TEFyWERva3FrVjh5Ky9JdHE2cVFOZUxi?=
 =?utf-8?B?TnFJazFMd2Y5cGFpdWRIUEhkSHhtOHBJNFBvMmVwbWJFdTRMOU5rcnF0NUJG?=
 =?utf-8?B?bkxtUDBWaE5UVmpMYzNaUDZGdUVlRnFUZ2x5QzRIc08vM0NhN3ZaNWxJbm5l?=
 =?utf-8?B?UUJ4RWJuT3Zpc3BGd3ZOVmdCRjQzQWp6V3VDOWlIemhnKyt3ZTE5TjFxcEhn?=
 =?utf-8?B?UURYUU9xaWxMeE9ncHU0ZUFaaWNuSmlwS1JKTFBJbXhJVFNMSXF2VzNOV2ZU?=
 =?utf-8?B?Y1BFaU9VOWZYcEVTUFl6amphTXkxL1BHVWNtdnBXTXVHYlp5ZTNycEY0bVpj?=
 =?utf-8?B?bS9hbmJibTFReDNzYk9UWEFhQ0Y3MkFpOWRrdkNkdm5lRENYbEhCUnJweUxY?=
 =?utf-8?B?cUZJM2NlbzBLcjQvWko1TXRqNXBNd0dFWDNZMlA5UnM0Wk5sWnJkTHgySzNk?=
 =?utf-8?B?S2Vpa1ZMYU5FWWNnS01Qci8ybFZaci9OcnMxSTJvRCt1NURPMDdEamplVXV5?=
 =?utf-8?B?SSs1dlZqZzk1M0ZiYmN0WTVwSVdocGxkM0lGWmlaOE1DWHZHeEZjS0JPR0Vk?=
 =?utf-8?B?dmxTRVFGcWJweXZyamttMkRNdkNsSGI5ODFONzEvRHpvL1UxczFpdnZpdXNM?=
 =?utf-8?B?V3NBejcvekt5SldNQ0xMUjdJT2szOThYVWJieGFkMWd6VFZackM3b1dSMjdR?=
 =?utf-8?B?Z0xHelg5elA2RmJvdWI0b2RsUFpQRnBxeDY2K1Uxb0ROcHZGN0ZyL3JqdUZa?=
 =?utf-8?B?QVZEZlIxOEJLdWcxM3FqWHBabTl0Nlhwb0dJazVPanZlTExWU29FSU8rN1Bu?=
 =?utf-8?B?QmpLV3lJai85N25OWmU5NHNETU1MODQ4MStHdXNuR3FJb3RSSmx3UHFEQW5t?=
 =?utf-8?B?OUloZEIrT2dDNlZFa1lsa0RUdHJNVDMzWHdSMlA0dkRNZTMxNFlIOW9tMStV?=
 =?utf-8?B?Nyt2ZmNxZzJyRDkvNTdBRU5SR2JTQjUzR2RsL0UzaVRzd2doU2JqZ3BVNDJ5?=
 =?utf-8?B?OXRxUDIyQTJNSWVESnZiSVpxT3ZzeHJxblZIQWpZY2w5WHlVKzZTcUs4emlo?=
 =?utf-8?B?MHBWWDdjZWJDeFpjaXk1cHd1OFZXWkxENUsyaTIyM0FxazcvYnAvR25ZNmpn?=
 =?utf-8?B?Q1pwZnBQZmUwaUpjbVFtQzhZRHRUVnUrbnNlTGx4S1dVMSt4U3B4YTAvOVg3?=
 =?utf-8?B?ZmpLcnBmYi9PRlVQU1VEcW1oR3c2Uy9qSWR3YzJvb1RuZEpGcmozUnU2ZmZR?=
 =?utf-8?B?YUpZczJUUWxuMk9vVFFqRWVwS1JLK3Yzbkt4bG84am0vK2tVYS81dWR1WndY?=
 =?utf-8?B?QmkyU096U0hFQVhsSytOL1pERjJFdzRMaFBHeG5MWFhzajY5a0pXczlvYzlh?=
 =?utf-8?B?d1JsREJjWmt4ZklYMm1sc3hNSHdNZFZCRWF5R3FlRVVsMmhibENKYnIyU2Nu?=
 =?utf-8?B?dVFsdjUzRTUxVnZwVFlYTEJxcC9RTDhRcUgrd0RtQkJrTlYzK01tdm5ZS3Fq?=
 =?utf-8?B?MDNRYmZ2ejdxVWhjUm1Ccisvbmhpclh4MlYvQktHNlZNdDMyNnRxWUpnRWtt?=
 =?utf-8?B?eWdGby94T0syMklSUUhscER1amt4dkZoc1ZqanZaanJvdUk5T3YzL0NON2tv?=
 =?utf-8?B?dURUaFVrdzgyTXpkZTg3L2ZLRjBqR1VRaEJyRnh2WS9ULzBhVGQxckJ6YU4r?=
 =?utf-8?B?YjFRU2tjWi91b25iekhPSU5VWTRaZmZBRm1QMVR6ZlNFbGFpeXFlRVdUOEpX?=
 =?utf-8?Q?/ghKeGLibyqjwtP2jBVxhvjLg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bfb4016-b7d4-45ba-0bc3-08dc3c45cc9e
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 12:22:46.7162 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YkUvWziP2GImfBbXq+K5CubUMx4kTqgeMvFH5HrGA7gQsVBTTjhdaB3mVzCw3SMQqhmCyl8zzZh2is7mJ5BuJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8046
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

Hi Matthew,

On 2/22/2024 12:12 AM, Matthew Auld wrote:
> On 21/02/2024 12:18, Arunpravin Paneer Selvam wrote:
>> Add a function to support defragmentation.
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
>
> I think this needs to be called higher up, otherwise we blow up with 
> the WARN, plus we just freed the root(s). There is also the case with 
> non-power-of-two VRAM size, in which case you get multiple roots and 
> max_order is just the largest root and not entire address space. I 
> guess do this in the loop above and use the root order instead?
>
> Also this should be done as part of the first patch and then in this 
> patch it is just a case of exporting it. Every commit should ideally 
> be functional by itself.
You mean we move the above change in drm_buddy_fini function and 
drm_buddy_defrag function as part of first patch.
And just we add export function and add amdgpu user in this patch. Is my 
understanding correct?

Thanks,
Arun.
>
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
>
> u64 min_block_size. Most cards have 4G+ of VRAM :)
>
>> +{
>> +    struct drm_buddy_block *block, *tmp;
>> +    unsigned int order, min_order;
>> +    struct list_head *list;
>> +    unsigned long pages;
>> +    int i;
>> +
>> +    pages = min_block_size >> ilog2(mm->chunk_size);
>> +    min_order = fls(pages) - 1;
>
> I think min_block_size should be power-of-two, no?
>
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
>
> s/1/true/
>
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

