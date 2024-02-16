Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 183E5857CA7
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 13:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C2A10E684;
	Fri, 16 Feb 2024 12:33:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2048.outbound.protection.outlook.com [40.107.243.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 924B310E549;
 Fri, 16 Feb 2024 12:33:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lUGWKN6vzmF4Y8EnRs9Da7nMyOweGJFlrygDUWV7Vj89IRbHurkdpzCoyH1rSf5C6cs/MzBk5ojTDYwi5qiqiR12FlJZOcJ4gGAbga9VUfBYTS5185ZDAFtuofl/VAkeiyRV1fGgjv6bqBTYFUY+Ddm1sD6Q8sjS8inKq+XsHEH/MyMlH3kIOqvuaXXIGJDwe5Hs9rqCsaI0UNBRNtS5c7KwcE/kP7yxGwJuBwa54in2RkfNmruLP4qJBtAgycM2sUVJMWJnl+vrV7mC90XZCYJ71+TqYB73mVr+hn4WVBY1kazNE+AWugvXE8fDXfw/W4y5hD41utVTuuqzNU8CfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lH+MwrMqBKLm8L+ADv3u1nnHmbO4nf0CgPIIVfPkCuI=;
 b=f2q9sMaz+cWIyglAqyHuzL4WN1UkDa08YQBdZC2MVdRhoG7kCwUEWwC5h38pjnEH1nDJYg/fA71QwlhOVlM0li3HHuquYhzCovy6Qw90pgt0Lh5fYGI8xLMWmSCNeO8lQOQjYsImi7A3obJ96ezabCNdS9zpfMfJABv+koFQc875nIylwico/y7lrvnstJ9vwYpFVJ3Buvo8HR3YI1ArnDLE+ngFOGOqcDKUNYDicq0Yg5sWwDFdjp0gU8zoc+o1ba6QHFgitv0A8kzVWox8Jm/sTenprWMzv0vLWX9sotp3aeWqdbfqToeDvbRKsNY72fUC6I18l9dacdMT1zzsxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lH+MwrMqBKLm8L+ADv3u1nnHmbO4nf0CgPIIVfPkCuI=;
 b=hK+mTd83CE4bZ93smkZrsqYBCcFhRBCR42xwlv9pTHEjK6P/O05Zffs0YRe0GYWAt1V4K0dSL867niFW2xgYhamHp2LL/uGl5nTnLs88GBNmDvXrf06kYsdrkes7iXoWXVXYjddX85JQhnOHNiSthj1ahW0Th3YcHHPDetwIF7A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA1PR12MB6044.namprd12.prod.outlook.com (2603:10b6:208:3d4::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.25; Fri, 16 Feb
 2024 12:33:43 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7292.022; Fri, 16 Feb 2024
 12:33:43 +0000
Message-ID: <8f218231-68ae-4a9f-880c-11a37fac91f2@amd.com>
Date: Fri, 16 Feb 2024 13:33:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] drm/buddy: Add defragmentation support
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: alexander.deucher@amd.com, felix.kuehling@amd.com,
 mario.limonciello@amd.com
References: <20240208155000.339325-1-Arunpravin.PaneerSelvam@amd.com>
 <20240208155000.339325-3-Arunpravin.PaneerSelvam@amd.com>
 <af43196c-d926-454b-8914-c5753f5d3799@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <af43196c-d926-454b-8914-c5753f5d3799@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0227.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b2::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA1PR12MB6044:EE_
X-MS-Office365-Filtering-Correlation-Id: 413eabd3-e79a-4ad1-c90f-08dc2eeb832f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AzvmBwAuRwPYE2RvxU+a/7gfvsgnEe+Wyp6Xrgw5MPh7w3qEkm/1B0LUbKEsYds+N5sr5Yi1MpI18U48azt4ht5vGJ9hyLOeq7JFStAxZKJ8wMsvjs68oKxyouB6qFEmzEap4Dg4TRO3z1xO/MwMeEIYP3Wwi6VhhvWaaAjqQdR3DJkrZ3Aaqy+Ta4Uay7PKL4ZNtkb75lFqzkDgAdJhXuopL/JgA9pHBrwlttDB7qY2dKDc7hXEuu0en2tRA2GrcvknLsoD3sT5X5tUWPOxSJEt3Vlfde/mw5rabnDL+FMy+FhnZwtjKtQycmw2SUV+3T9Cm2q2N87GOxVbh3Ey+FO9uFnJ+2CMQ7YjvSJXaSLd8RLHer7xYyU6nKdh4cjMTR8H6OhKhVjcALTR7pGhpMyMvS90ypAlnamL9fadnpe+ICNPGce8odmLTFfrTaNv8n0/OuGGBaN01P22jIJC+VMcImakNabtERVYCEnSG+fVEs6lvqpbEXjBoAcSiNCoIIno8KbgzabJlG864pjA8ef6/r+xRSAzWiMco8GCqZSoY2Vmh9J/d7IYhEKT/llR
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(396003)(136003)(366004)(346002)(39860400002)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(316002)(110136005)(31686004)(41300700001)(31696002)(2906002)(83380400001)(8676002)(66476007)(8936002)(5660300002)(86362001)(4326008)(6486002)(53546011)(26005)(478600001)(36756003)(6506007)(6666004)(38100700002)(6512007)(2616005)(66946007)(66556008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzM5b2d5blVrTDZqTWJwc0dDQzFlNXJydXFaelBtUGxFNzVHa3BON3VhT0JS?=
 =?utf-8?B?RGRxNDZRamprNmFJL3g4T0kwbStBai9JVWtGYTFiZnZERTBWUWprSGV6Rmt2?=
 =?utf-8?B?RG5IdEhQV3d2Z1BtMHh5Ykk4MDVOSVorS082bDFTUWlPaFdJbEcwaFZyNzAv?=
 =?utf-8?B?TTZBdENWaDZqSjZmekpNZlFJSDhEMnRhOEpMbTJ4d2F1ZUROWVQzUXJFOTdD?=
 =?utf-8?B?VElwTUFDd2N5MDBROVhPUUVka01KYlJoUVhtcFpCZXl3eFMvWHpiNTVNekpM?=
 =?utf-8?B?VGd2eFVzWStobGtua3l4UWN2WlRVRjluZ0FscW52WGJOSE9GcFJwVC83VEht?=
 =?utf-8?B?ckg1dWNRYUx6VFpoUldsWUNEQ05Fb1hiSXg0VjNPVFV5TGVKZTZGeW9jeDd1?=
 =?utf-8?B?eUlac2xaOUdlMU9LS2JmS215V29XYXNOc3JFU2tzL2M3S1h0TTU1Zk9JV2t5?=
 =?utf-8?B?MFBXTG03YzBJa1hRWU9ybUFLZnJKOHhhbWhSbVBibFpLNFVkdE03dU9RSWlt?=
 =?utf-8?B?cWdEN3EwdGxKQ2hjWWc3YU5ObE9iMVUwVDE3V3M4Z3lwd1RiNTU2WDZTWFRG?=
 =?utf-8?B?MlU0K0hJYVJGd1NZVXhjZHpraFI0UHczWVEvNFd2RFdaNFVabFJ1QXY4c3Jo?=
 =?utf-8?B?TnFzY0hUYURkVWxuMC91V01SR21QeEZ4ZGFjdlB2ZE1BbXRXdEZCMEt5b0o0?=
 =?utf-8?B?Z1BRN1crV3U0NXZZUjRSTkQ2enVMWjMwaEFwS1o3NWt2cjlXVTVRQ0pSMFg0?=
 =?utf-8?B?UGFMbERoZDNVdHIyVlpsaXQzT0ZGNXJZS0U0aXgzUytoeUF6bkZXTGJ5QjNZ?=
 =?utf-8?B?cEJpSVBtc2RIbmU2Z0ZDRlFkMTZaYjZXUUlYaE5HODJGRTc1LzhPUElJbVVZ?=
 =?utf-8?B?eE5CM0JjWTdJcDhVbitSMktqczMwVVozSCt4VFNRdGY2MnN1UTY3enh4QTBt?=
 =?utf-8?B?Y3ltVXRJYlhyaTFUVmhEYTIvZVoreDFWeW1RK00zU1EvdWtHbWYrc3M5Y25I?=
 =?utf-8?B?SXByRUpocDltdXJxZC9MUzVNVGVwMm1sUmpnZHVlcjJOV2dudkI3b2dUcHFS?=
 =?utf-8?B?THBkK01NMXdMTHAzcDdVaHdYeWpObGNsTEZQZmJFQTFNQVBOSzVvaDNTM0VH?=
 =?utf-8?B?bHlyV0loT1dQZzVRQ1RTZlBjdEgrK0JhUDYrWU5qS1Z2b2tYQzc5Q1hLM2RZ?=
 =?utf-8?B?STRkMGZJMnNxdWVUc096Z2E1dDZtSmVIaE1zT0oySWlUUFkzQW5wWDBJSG14?=
 =?utf-8?B?RC9wcUVUNmxQcklGbm8zdzFCc0hETnhFY2JpQmkrbXJaMThObFJEd2JFTEZv?=
 =?utf-8?B?YWQ3dThLWGl0MVkzMDlJYzZpQlA0Tko2MXdXQlRIRVF2QzBmMlJ0bEd3T3NF?=
 =?utf-8?B?eWN1ZVFLTFVmMmpTMUtWcHUvWnlNb2RheGZxdU5jaWE5THBMTmRGcVNDUjZU?=
 =?utf-8?B?SytxYTJJcUtrdzRHbmZicThYQjYvWnVBTGtham83dkgxUnJQWkNYTm5MSnk0?=
 =?utf-8?B?b0UvYlMxUHYwWUtiSEhaYXI4dURXQXJCelJBQUw4NkNwNnZESWhUbWw5dkxC?=
 =?utf-8?B?N0JvT2ExayttZEJ0bmNzMWY0UHVwcDhYcWRrWGY2N2RadmxIcUNQK29VRjRp?=
 =?utf-8?B?MjQ3SENScFJIYlZ5VHZOM3h3aHVZMkRyZEVFSzNaYmN2TTlZSEFVS2p1bzJR?=
 =?utf-8?B?dzFudHpHQnVxcU5Kd0FNQVJ6UlgyVDhjc2dsMU1KbFJWNGdUcWppSWNLa3Yr?=
 =?utf-8?B?WDdLNFhOMEZndlZUcVlMcFNDSGJ1d09IZWZJZkJBUzlIcllwYXA2cjUrbXFZ?=
 =?utf-8?B?ZjhEODQ4dDNNbHlpNUczTHBYcVBHbGJXWEJQeDlEcE1NeDBUWjhTa05kcTZl?=
 =?utf-8?B?MmdlMUdjNUhJeGtrNkhFcmRuaEtPZGs3TWhWamNVeVI5ajJYbEFDVVBaQlJW?=
 =?utf-8?B?b0Zwd3hZYUJLRmc1RVRhNU0rdjZCOHVyVmJYWXJta0JiL2JYc0lPREtYS0hJ?=
 =?utf-8?B?MmNNaitSMXBwV1hjT0lTRDkrd2RjNFZoclZpb2l1OTlWWW9ERDFybkVDMzhy?=
 =?utf-8?B?M2lhNGN2ckJQNHllN3lhY1h4NnNHRjhwVytsdXh6WmFkWGQrWDRQT0djbzZ4?=
 =?utf-8?Q?MUTErA/hsvbnZqkhMAn6SaAnW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 413eabd3-e79a-4ad1-c90f-08dc2eeb832f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 12:33:43.5595 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64Xo65xAOpqHagSg0THlsth0KQOBlr9noE3+5obIdyVn7AT+X8k26xKQ7ErYmHGE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6044
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

Am 16.02.24 um 13:23 schrieb Matthew Auld:
> On 08/02/2024 15:50, Arunpravin Paneer Selvam wrote:
>> Add a function to support defragmentation.
>>
>> v1: Defragment the memory beginning from min_order
>>      till the required memory space is available.
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 67 +++++++++++++++++++++++++++++++------
>>   include/drm/drm_buddy.h     |  3 ++
>
> No users?

Other question is how can a buddy allocator fragment in the first place?

Christian.

>
>>   2 files changed, 59 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 33ad0cfbd54c..fac423d2cb73 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -276,10 +276,12 @@ drm_get_buddy(struct drm_buddy_block *block)
>>   }
>>   EXPORT_SYMBOL(drm_get_buddy);
>>   -static void __drm_buddy_free(struct drm_buddy *mm,
>> -                 struct drm_buddy_block *block)
>> +static unsigned int __drm_buddy_free(struct drm_buddy *mm,
>> +                     struct drm_buddy_block *block,
>> +                     bool defrag)
>>   {
>>       struct drm_buddy_block *parent;
>> +    unsigned int order;
>>         while ((parent = block->parent)) {
>>           struct drm_buddy_block *buddy;
>> @@ -289,12 +291,14 @@ static void __drm_buddy_free(struct drm_buddy *mm,
>>           if (!drm_buddy_block_is_free(buddy))
>>               break;
>>   -        if (drm_buddy_block_is_clear(block) !=
>> -            drm_buddy_block_is_clear(buddy))
>> -            break;
>> +        if (!defrag) {
>> +            if (drm_buddy_block_is_clear(block) !=
>> +                drm_buddy_block_is_clear(buddy))
>> +                break;
>>   -        if (drm_buddy_block_is_clear(block))
>> -            mark_cleared(parent);
>> +            if (drm_buddy_block_is_clear(block))
>> +                mark_cleared(parent);
>> +        }
>
> Maybe check if the two blocks are incompatible and chuck a warn if 
> they are not? Main thing is not to hide issues with split blocks that 
> should have been merged before.
>
>>             list_del(&buddy->link);
>>   @@ -304,8 +308,49 @@ static void __drm_buddy_free(struct drm_buddy 
>> *mm,
>>           block = parent;
>>       }
>>   +    order = drm_buddy_block_order(block);
>>       mark_free(mm, block);
>> +
>> +    return order;
>> +}
>> +
>> +/**
>> + * drm_buddy_defrag - Defragmentation routine
>> + *
>> + * @mm: DRM buddy manager
>> + * @min_order: minimum order in the freelist to begin
>> + * the defragmentation process
>> + *
>> + * Driver calls the defragmentation function when the
>> + * requested memory allocation returns -ENOSPC.
>> + */
>> +void drm_buddy_defrag(struct drm_buddy *mm,
>> +              unsigned int min_order)
>
> Just wondering if we need "full defag" also? We would probably need to 
> call this at fini() anyway.
>
>> +{
>> +    struct drm_buddy_block *block;
>> +    struct list_head *list;
>> +    unsigned int order;
>> +    int i;
>> +
>> +    if (min_order > mm->max_order)
>> +        return;
>> +
>> +    for (i = min_order - 1; i >= 0; i--) {
>
> Need to be careful with min_order = 0 ?
>
>> +        list = &mm->free_list[i];
>> +        if (list_empty(list))
>> +            continue;
>> +
>> +        list_for_each_entry_reverse(block, list, link) {
>
> Don't we need the safe_reverse() variant here, since this is removing 
> from the list?
>
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
>> @@ -321,7 +366,7 @@ void drm_buddy_free_block(struct drm_buddy *mm,
>>       if (drm_buddy_block_is_clear(block))
>>           mm->clear_avail += drm_buddy_block_size(mm, block);
>>   -    __drm_buddy_free(mm, block);
>> +    __drm_buddy_free(mm, block, 0);
>>   }
>>   EXPORT_SYMBOL(drm_buddy_free_block);
>>   @@ -470,7 +515,7 @@ __alloc_range_bias(struct drm_buddy *mm,
>>       if (buddy &&
>>           (drm_buddy_block_is_free(block) &&
>>            drm_buddy_block_is_free(buddy)))
>> -        __drm_buddy_free(mm, block);
>> +        __drm_buddy_free(mm, block, 0);
>>       return ERR_PTR(err);
>>   }
>>   @@ -588,7 +633,7 @@ alloc_from_freelist(struct drm_buddy *mm,
>>     err_undo:
>>       if (tmp != order)
>> -        __drm_buddy_free(mm, block);
>> +        __drm_buddy_free(mm, block, 0);
>>       return ERR_PTR(err);
>>   }
>>   @@ -668,7 +713,7 @@ static int __alloc_range(struct drm_buddy *mm,
>>       if (buddy &&
>>           (drm_buddy_block_is_free(block) &&
>>            drm_buddy_block_is_free(buddy)))
>> -        __drm_buddy_free(mm, block);
>> +        __drm_buddy_free(mm, block, 0);
>>     err_free:
>>       if (err == -ENOSPC && total_allocated_on_err) {
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index d81c596dfa38..d0f63e7b5915 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -166,6 +166,9 @@ void drm_buddy_free_list(struct drm_buddy *mm,
>>                struct list_head *objects,
>>                unsigned int flags);
>>   +void drm_buddy_defrag(struct drm_buddy *mm,
>> +              unsigned int min_order);
>> +
>>   void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
>>   void drm_buddy_block_print(struct drm_buddy *mm,
>>                  struct drm_buddy_block *block,

