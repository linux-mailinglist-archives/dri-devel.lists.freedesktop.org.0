Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A5D785019
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 07:53:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43F010E27E;
	Wed, 23 Aug 2023 05:52:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2089.outbound.protection.outlook.com [40.107.93.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B47810E254;
 Wed, 23 Aug 2023 05:52:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CsE84ZuEWYhyI3A2wE0IOyeLxQ/qExdr7A7h3o4Y4wEPjb7JdQOmjGMVg1ELTD/Kn67Occxl1cgHk0XGMVekJm/ruSvF0cFyi/d0kSj3OQooPJ85ik2WaqpDcJ4YZHsCU2XEaB8MPDY2aYDPyaNcGgdd/DLKZmsQh6ahcFkz+rs6srdqn6OL6Rdw77cJbkX62VEyKcAaPVy4NpKB+Dcms8TwCRsKB0sxJQga7kflHnOJ514EwfBnNPrSevzDUaFv8AlUMKnqza9/p6Jf5vbOISLb3phNu53m9ZWbARWcLiz/mlbjwBgmQW4dhDSr+7Yzb/jwtyXVsKthSmkdt1wsaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ISltl5hYd28eIYkP6qyepFpeR0MtNXc7sy/OQogqebk=;
 b=bqd2uo8jMCwT1OHA/VSM87LnAC4uVUDMo0MLyJqUCWs7p+0TkzYeA4oR0qVGklJCOZQsJkogWrlJ5/ZRpSyuP/MuAXjCGFjJWbho+gS8Hz4mYH9tMUlfqvzqOWmXPr+TilUhCU5k//NGY/erIaQ0UfYVafOzsUy7YMKF5Jb0JWjXOiDZlFZ9/KhHYYKexpiSCRBvyz3LODgaZuaTsXvF6ZanT/f5Jw9gWRf+bETsvVAM6Saf2ucDk0TcO/d3k4qjpsjx3LYe2YmBMPzKcZWuZxGvAA+BXRU09RrDRSXMfOgwHuVE/fG7lmrOLmga2FrFsVy9EzacxHtaMn/aZk2raA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISltl5hYd28eIYkP6qyepFpeR0MtNXc7sy/OQogqebk=;
 b=cfQmPCIcD0DRHaNVTo7PNzwMECi/1KKEtJ7XOUoeLSJufVfyFcldKqKIB6FFxvv26sdTxJmCDkb9x+ujwpcROil/tI1icrDXfR0GjqxzUxewFOgGzPgvWgFyvtqS95IP2G2iX2flprDVop7+gLDFp7l0HF6rhPkzsU8Hk3e3/rI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ2PR12MB7961.namprd12.prod.outlook.com (2603:10b6:a03:4c0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.25; Wed, 23 Aug
 2023 05:52:50 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.025; Wed, 23 Aug 2023
 05:52:50 +0000
Message-ID: <4fa2c0ea-d8f7-f884-0eb7-c42cad75cd02@amd.com>
Date: Wed, 23 Aug 2023 07:52:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] drm/buddy: Fix contiguous memory allocation issues
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20230821101444.119601-1-Arunpravin.PaneerSelvam@amd.com>
 <a1f422c6-728d-afae-29e1-6f091e16df7f@amd.com>
In-Reply-To: <a1f422c6-728d-afae-29e1-6f091e16df7f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0010.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1d::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ2PR12MB7961:EE_
X-MS-Office365-Filtering-Correlation-Id: 89f60401-475b-4c85-24ec-08dba39d2f6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HcXUDgVptO/FnL1bH4S8Ld3xD6ODFHpXwCm347yZNjHszNjyCnY5tV0XLw6XDjNrLnt/xKeA1vkCdvAGTwvBGzXcNNWkxIN5z5tl4yfanTZ5UPTlhww+jx1IlVX6F1ZkleZm8veL6+/yVGB5GyTC2NR32CkXdlClSv0y17nGPDtNq/Ddwofi7xWh9SfhSZzw+NaLx9xn6u3s+D8hYmnHfnbuLuhhyNa1B4dOgVsrjPO9HRndqmOjCbvKXJv4zyoPMe8i3r8AdbtMIlkebKIJxJGDv1E11C2zVaAG5YT3nYGaZm3hBNT/SS9080Q0BMGt0RtHaauuY+/pXDuXbqnlR1WpZTZwUpTeG/FlNF+mblCSv17vB21QqqPu9cCGwQ30xkdCSfSp6drPwqMcLuRKx8Xp1NkD4ATdnMzhCm0h+aUpBdpOQ2hwBX1wmH3xW1SnaVDIu9PbCIkp2XOmK7ppyAVEiYqqJjyF8t2MphK0AJiYir9Iw7q3iB5gwpV5ESFw85Hbr40uIfOPl42ZX/K8AKnLUb/VpW5aWiF6qOCriwvoLW6iTvWShZJcoMSDZoH96S8DamKSPM6/QS2sFWmORK6lVP+SG9EF/H6Lo93w8sV4KrfY42mkMTXUGrmh91Bz1ZFAEJoZTir4kmSSSp1lbw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(396003)(136003)(376002)(39860400002)(366004)(451199024)(186009)(1800799009)(31686004)(478600001)(6666004)(6486002)(66574015)(83380400001)(38100700002)(30864003)(2906002)(26005)(6506007)(2616005)(6512007)(4326008)(31696002)(36756003)(86362001)(41300700001)(316002)(66946007)(5660300002)(8936002)(66556008)(8676002)(66476007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QjczMDNEYnNja0dORytUbmhJWnNOTnVRQzVkcDdJempnUUpncmdtYmoxcWYv?=
 =?utf-8?B?bUVzOEU0dGtsS0M3bmR1eDhJdEFJRWxEc1dKTlFKaEI1cVU0dlRFV3BXSmVF?=
 =?utf-8?B?WkFGNE4ydFJmb2toYVdpekJwbEE5RXJ2elEza3hNck5zQ0IzVko2NExwVzRt?=
 =?utf-8?B?Mi9DWWlLVjRQOURqZDZHN05Na0ZOSjB5bjR0SVVUdWhCOHdrbUZhcTJUNzFG?=
 =?utf-8?B?SGh6eURyWkZTREkvSHBDcm5nS2ZyWHJSN1dKVUpId3JoQktURkU5eFRYdEtM?=
 =?utf-8?B?N2lIZTkrYVphbWlKK2VwcS9ZT3lUV0w1TnVCOGhJNkxObUlkR1pmcDVzNTEz?=
 =?utf-8?B?NkYydzJjdjVxT2hZMm5OZEdhWldoQ3JaL2RGL25DL0l4bnc0QmRYVzU2ZEto?=
 =?utf-8?B?dVJGbnVWeE9HUEVWSmlEc0pZNHNmRWlBaWpBL29WV3VyREJsU0Y1djgrWTVl?=
 =?utf-8?B?UFU1bFg3MFFXRGVSeW9meSs4MXBJVDBuY2M0ZVM4SUhFTnFLbDg1aU9hL0Z5?=
 =?utf-8?B?aHh4UjBZSE1zSnZsSDE1VThHVitQNmZLWEc0dVBFKzBsOVdad2p6SnNwclhU?=
 =?utf-8?B?RWRsSmlKSkZJd3VHeEsyT1JVc0wySFpwaXJkNVVkSDRabEFFTnFEM2tmdk1i?=
 =?utf-8?B?YVdtZVFRZmoyQzNNZFFvKzI5YmFTaEdXYlk4RmFnT3Y1VUNvbWE0UlJDWHBs?=
 =?utf-8?B?NzV2ZG5zd2ovR0Y2c3VzN0ZPNGFBakl3bUN2LzVqOXFpY2Zja0E2MnVjZWRs?=
 =?utf-8?B?dXpoR2FyRExoOWFHakM3UXBESytHTjU3NmZndEgrdTFTZzFoRXZlZEpMNTJl?=
 =?utf-8?B?S1VrYjY4VlZHYUNOeXd0clBiYUVSMlJOanJGeXlkeGxyOGkrSlhvRUhFd1Y2?=
 =?utf-8?B?VnZTWFl1N0wvV1FTMDhZUUZsdGZ5Qm5QUlFSOVNhMGpsUVZlTFdYZG0wNitM?=
 =?utf-8?B?ck1mUWlhODdQT0xvdzZWWUZmWHBvZDdSUjNOOEtvczcyNEtiOTdNT2ZwSFRK?=
 =?utf-8?B?UTRRSG5nK2VNWUQ2VHdvaWEzTk9ZanBCZ0NXV25IaWF0Nm42STM2aytWcm0x?=
 =?utf-8?B?YkU3eHZTajRLMkdBRWVSK3pWYStObExBSTZ1dFlCVnBaRUNZZ2gxT2NzbVJv?=
 =?utf-8?B?cGkrczk0MmxqeHFrMVBiTnN2bVdmNkJKY1I3TFU4cVJ5UnZxWjJZUXpsTmpX?=
 =?utf-8?B?ZkNrQkhtYVBva0RoT2srV3kzVFgzdWNkNklaaU44anJ1Z3h5d0h6YmRibmNs?=
 =?utf-8?B?cDIycXNzYXNuTENMM0gybk1EZVVIMENaQ2Jxa2NqRFo4WCswRHNtMUNEZlBk?=
 =?utf-8?B?SEg3Vkd0SjRmRzBvQXFsWmFFaUtpZ0xkWW51cEc5SXI3UW9vcE9jclg3bWVt?=
 =?utf-8?B?WUJIM21abUo4RUlGWWVnN1ZqOXd5bWR4WDdXa1l5NmlmNlZnenN6Y0kxS1Rr?=
 =?utf-8?B?TC9aekxvekxVb1ozN2haUlJKUTFIN0s0M0ZWZjVzMGd3anZsYnN6L1B0VUZj?=
 =?utf-8?B?ZFFTUDR1bnVIRVc0UFZpbWsvWXBJN20yMmxLNks4VmVhUWc3dUZpYVFIOHZ2?=
 =?utf-8?B?U2M2N2Z2Y1JkYW1BdlBidmlUOXRtbnNNTXhOMGZxVVVmQ2ZEeEF6cVpNemZ0?=
 =?utf-8?B?SmkzYStubDBYL25aU0dVY1YydG9NemdkRkVyZ29NOG1DVEZ0eHNGRENHdm1M?=
 =?utf-8?B?dEZSVUJFd0FSUlBJS1NoV09EZjBDbXNuUDV6YUlxbXkwY0lwZHNRcW5ZSkc2?=
 =?utf-8?B?ZWFyOWpyUW9UMXA5VG50OHFqeEg3MmYxU0ZVNWx3SDl5L3RlVDlEdVN5eG9w?=
 =?utf-8?B?L05rc0xzZ2VUZDlkdDllN3BneklXTUVIK2ZxRWZQaDR5M2FhdXU1clpPVHJ3?=
 =?utf-8?B?R3gvV0U2S1UzRE0wNFVYRGRVQWFNT2FIMkppYU9GclkzWHB6K2E2UVJXd25O?=
 =?utf-8?B?OTFvVmxqaUlWa1BBYTZOSWlhbzlUS1JxQzNIUTZWeTNuT1FWMENibTN1N05S?=
 =?utf-8?B?N0VwYUxVU256NGIxU2hoekIxaVRjcHJSWEoyVkZzQ05zZEpsWlVQZGRKandH?=
 =?utf-8?B?ZVNSK3RqRnUxU0R1SDBJNXBwckNUSllMQWxBd3lpZFJ6WHBaNklpRFZsNWF1?=
 =?utf-8?Q?/nPuKTu4HUndrO+L78OnsNiXq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89f60401-475b-4c85-24ec-08dba39d2f6a
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2023 05:52:50.6026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v9ylNks6hitpcbwyxuBfyrBUHx2t0yHkAVe71L1hcR1hNN3yjBftIrrRtj6FGrXL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7961
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
Cc: alexander.deucher@amd.com, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.08.23 um 13:16 schrieb Christian König:
> Am 21.08.23 um 12:14 schrieb Arunpravin Paneer Selvam:
>> The way now contiguous requests are implemented such that
>> the size rounded up to power of 2 and the corresponding order
>> block picked from the freelist.
>>
>> In addition to the older method, the new method will rounddown
>> the size to power of 2 and the corresponding order block picked
>> from the freelist. And for the remaining size we traverse the
>> tree and try to allocate either from the freelist block's buddy
>> or from the peer block. If the remaining size from peer/buddy
>> block is not free, we pick the next freelist block and repeat
>> the same method.
>
> I think it's worth mentioning that Xinhui tried something similar a 
> few month ago, but that didn't looked like it would work. For this 
> here I'm more confident.
>
> Of hand the implementation looks clean to me, but Matthew or others 
> which have more background in how the implementation works need to 
> take a look as well.

One more thing I've just noticed, not sure if Matthew already noted it: 
When you mention "fix" in the subject line people might try to backport 
it, better write "improve" and drop the "issues" at the end.

Regards,
Christian.

>
> Thanks,
> Christian.
>
>>
>> Moved contiguous/alignment size computation part and trim
>> function to the drm buddy manager.
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 253 ++++++++++++++++++++++++++++++++++--
>>   include/drm/drm_buddy.h     |   6 +-
>>   2 files changed, 248 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 7098f125b54a..220f60c08a03 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -569,6 +569,197 @@ static int __drm_buddy_alloc_range(struct 
>> drm_buddy *mm,
>>       return __alloc_range(mm, &dfs, start, size, blocks);
>>   }
>>   +static int __alloc_contiguous_block_from_buddy(struct drm_buddy *mm,
>> +                           u64 size,
>> +                           u64 min_block_size,
>> +                           struct drm_buddy_block *block,
>> +                           struct list_head *blocks)
>> +{
>> +    struct drm_buddy_block *buddy, *parent = NULL;
>> +    u64 start, offset = 0;
>> +    LIST_HEAD(dfs);
>> +    int err;
>> +
>> +    if (!block)
>> +        return -EINVAL;
>> +
>> +    buddy = __get_buddy(block);
>> +    if (!buddy)
>> +        return -ENOSPC;
>> +
>> +    if (drm_buddy_block_is_allocated(buddy))
>> +        return -ENOSPC;
>> +
>> +    parent = block->parent;
>> +    if (!parent)
>> +        return -ENOSPC;
>> +
>> +    if (block->parent->right == block) {
>> +        u64 remaining;
>> +
>> +        /* Compute the leftover size for allocation */
>> +        remaining = max((size - drm_buddy_block_size(mm, buddy)),
>> +                min_block_size);
>> +        if (!IS_ALIGNED(remaining, min_block_size))
>> +            remaining = round_up(remaining, min_block_size);
>> +
>> +        /* Check if remaining size is greater than buddy block size */
>> +        if (drm_buddy_block_size(mm, buddy) < remaining)
>> +            return -ENOSPC;
>> +
>> +        offset = drm_buddy_block_size(mm, buddy) - remaining;
>> +    }
>> +
>> +    list_add(&parent->tmp_link, &dfs);
>> +    start = drm_buddy_block_offset(parent) + offset;
>> +
>> +    err = __alloc_range(mm, &dfs, start, size, blocks);
>> +    if (err)
>> +        return -ENOSPC;
>> +
>> +    return 0;
>> +}
>> +
>> +static int __alloc_contiguous_block_from_peer(struct drm_buddy *mm,
>> +                          u64 size,
>> +                          u64 min_block_size,
>> +                          struct drm_buddy_block *block,
>> +                          struct list_head *blocks)
>> +{
>> +    struct drm_buddy_block *first, *peer, *tmp;
>> +    struct drm_buddy_block *parent = NULL;
>> +    u64 start, offset = 0;
>> +    unsigned int order;
>> +    LIST_HEAD(dfs);
>> +    int err;
>> +
>> +    if (!block)
>> +        return -EINVAL;
>> +
>> +    order = drm_buddy_block_order(block);
>> +    /* Add freelist block to dfs list */
>> +    list_add(&block->tmp_link, &dfs);
>> +
>> +    tmp = block;
>> +    parent = block->parent;
>> +    while (parent) {
>> +        if (block->parent->left == block) {
>> +            if (parent->left != tmp) {
>> +                peer = parent->left;
>> +                break;
>> +            }
>> +        } else {
>> +            if (parent->right != tmp) {
>> +                peer = parent->right;
>> +                break;
>> +            }
>> +        }
>> +
>> +        tmp = parent;
>> +        parent = tmp->parent;
>> +    }
>> +
>> +    if (!parent)
>> +        return -ENOSPC;
>> +
>> +    do {
>> +        if (drm_buddy_block_is_allocated(peer))
>> +            return -ENOSPC;
>> +        /* Exit loop if peer block order is equal to block order */
>> +        if (drm_buddy_block_order(peer) == order)
>> +            break;
>> +
>> +        if (drm_buddy_block_is_split(peer)) {
>> +            /* Traverse down to the block order level */
>> +            if (block->parent->left == block)
>> +                peer = peer->right;
>> +            else
>> +                peer = peer->left;
>> +        } else {
>> +            break;
>> +        }
>> +    } while (1);
>> +
>> +    if (block->parent->left == block) {
>> +        u64 remaining;
>> +
>> +        /* Compute the leftover size for allocation */
>> +        remaining = max((size - drm_buddy_block_size(mm, block)),
>> +                min_block_size);
>> +        if (!IS_ALIGNED(remaining, min_block_size))
>> +            remaining = round_up(remaining, min_block_size);
>> +
>> +        /* Check if remaining size is greater than peer block size */
>> +        if (drm_buddy_block_size(mm, peer) < remaining)
>> +            return -ENOSPC;
>> +
>> +        offset = drm_buddy_block_size(mm, peer) - remaining;
>> +        /* Add left peer block to dfs list */
>> +        list_add(&peer->tmp_link, &dfs);
>> +    } else {
>> +        /* Add right peer block to dfs list */
>> +        list_add_tail(&peer->tmp_link, &dfs);
>> +    }
>> +
>> +    first = list_first_entry_or_null(&dfs,
>> +                     struct drm_buddy_block,
>> +                     tmp_link);
>> +    if (!first)
>> +        return -EINVAL;
>> +
>> +    start = drm_buddy_block_offset(first) + offset;
>> +    err = __alloc_range(mm, &dfs, start, size, blocks);
>> +    if (err)
>> +        return -ENOSPC;
>> +
>> +    return 0;
>> +}
>> +
>> +static int __drm_buddy_alloc_contiguous_blocks(struct drm_buddy *mm,
>> +                           u64 size,
>> +                           u64 min_block_size,
>> +                           struct list_head *blocks)
>> +{
>> +    struct drm_buddy_block *block;
>> +    struct list_head *list;
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
>> +        /* Allocate contiguous blocks from the buddy */
>> +        err = __alloc_contiguous_block_from_buddy(mm,
>> +                              size,
>> +                              min_block_size,
>> +                              block,
>> +                              blocks);
>> +        if (!err)
>> +            return 0;
>> +
>> +        /* Allocate contiguous blocks from tree traversal method */
>> +        err = __alloc_contiguous_block_from_peer(mm,
>> +                             size,
>> +                             min_block_size,
>> +                             block,
>> +                             blocks);
>> +        if (!err)
>> +            return 0;
>> +    }
>> +
>> +    return -ENOSPC;
>> +}
>> +
>>   /**
>>    * drm_buddy_block_trim - free unused pages
>>    *
>> @@ -645,7 +836,7 @@ EXPORT_SYMBOL(drm_buddy_block_trim);
>>    * @start: start of the allowed range for this block
>>    * @end: end of the allowed range for this block
>>    * @size: size of the allocation
>> - * @min_page_size: alignment of the allocation
>> + * @min_block_size: alignment of the allocation
>>    * @blocks: output list head to add allocated blocks
>>    * @flags: DRM_BUDDY_*_ALLOCATION flags
>>    *
>> @@ -660,23 +851,24 @@ EXPORT_SYMBOL(drm_buddy_block_trim);
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
>> @@ -692,12 +884,21 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>       if (start + size == end)
>>           return __drm_buddy_alloc_range(mm, start, size, blocks);
>>   -    if (!IS_ALIGNED(size, min_page_size))
>> -        return -EINVAL;
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
>> @@ -716,6 +917,17 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>                   break;
>>                 if (order-- == min_order) {
>> +                if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION &&
>> +                    !(flags & DRM_BUDDY_RANGE_ALLOCATION))
>> +                    /*
>> +                     * Try contiguous block allocation through
>> +                     * tree traversal method
>> +                     */
>> +                    return __drm_buddy_alloc_contiguous_blocks(mm,
>> +                                           original_size,
>> +                                           original_min_size,
>> +                                           blocks);
>> +
>>                   err = -ENOSPC;
>>                   goto err_free;
>>               }
>> @@ -732,6 +944,31 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
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
>

