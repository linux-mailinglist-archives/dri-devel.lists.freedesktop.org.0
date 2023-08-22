Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 560297842B3
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 16:01:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE0610E376;
	Tue, 22 Aug 2023 14:01:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2061.outbound.protection.outlook.com [40.107.96.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBC6710E1B8;
 Tue, 22 Aug 2023 14:01:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nPML3Maxxfu+dl4cQLT8xPdet+hr5FMu8vFR07dv1gL36RkmFrtYBDa9UEMIWPGlqeWuF9lv+rMEXJQ6GXERAVsE+KXVSsu2ZlIe0ueqUEF4hFW8+X8vN2NvKbhpOjV2jLaNbdNtdELNSOpeKpK+wv6rqapH1wQRnITWRtfG6hq4TTtYIHDHdiU1KV5Wmo5YfjcASS0kLFek6JltC66OjOJjoFl9k1CfGhn+0e7z4xDwsqMvqyizqXDCXwm8i83H2aDJbCdmdSlLdSzO15rqPICWz13Twtn4crHUqbYuRCtAmXvV+gjhGNvDAX8dufCQMFJe2pZQwjUEb9L6qi/AzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EhqVfdeW4b5R+6Gu9bdG3+nVJFBQs7vcAnSgj7/WLgI=;
 b=iIIaCwOreFhdhmVgtLgVH0xLMVgwqmvB5yAqWKctchYYaz45P599dRVMEESmJ2AajvPD27JnrXrx5uIdtUKk9D0AAsnO+kz5Jwx6NCI1U610vMt2M+O1sEAkG/71k0dCzmg+H4qtqsOAK/sxG5d5QF4Z67KjhZQEsCYg4mXmwX7KErvEvGY9Ta5/w2A6BiVNz2WJ2kECc+kzpg3MdSw3yagAPWlKBm1C29M935nFJsD+pIISVhm46MA76rOS2qS04NJZMM8+Y089Gwou3hpoW/iNk9meGKvLhjM7qux4I1HVkcxgbTPtA+CdvcpIILKpPFYeVK3bOW6LzlXaexdmWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EhqVfdeW4b5R+6Gu9bdG3+nVJFBQs7vcAnSgj7/WLgI=;
 b=KJFoe1mLyftRFt4PXUvMXfdgVdVSB2GQDo9pPdJMiba7ylhsuNpOnY1X9XhI/YhYQPnMLdwsWQ0aoJssvoqdaWWhhCIR2DPb1351AoIRNtTyDUh2X+yZh0QWQfgSxHAtKR0FiX3G0ZL8bVRk6GX0XxexYIMbi9P1U3jUF7Wt3+0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by SA1PR12MB8094.namprd12.prod.outlook.com (2603:10b6:806:336::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 14:01:20 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6787:e196:b8dc:93a1]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::6787:e196:b8dc:93a1%7]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 14:01:20 +0000
Message-ID: <7301d8ff-82bc-dc29-5df3-667fabfdd175@amd.com>
Date: Tue, 22 Aug 2023 07:01:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] drm/buddy: Fix contiguous memory allocation issues
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20230821101444.119601-1-Arunpravin.PaneerSelvam@amd.com>
 <bfe1e810-e3b9-775c-8b25-ceb0324f5b6b@intel.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <bfe1e810-e3b9-775c-8b25-ceb0324f5b6b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0144.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:bf::11) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB4342:EE_|SA1PR12MB8094:EE_
X-MS-Office365-Filtering-Correlation-Id: fddf5a1c-e4a5-4051-600a-08dba31842ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ohZYVpHTTYz08smFxTW6m3FbNAf74QjmpO6zAhJG3nNkjPKb2SpWliRoseX1b7XUlYQJsYhmAO+96+mnoflpChrmI+TSTJoYCNwLTXFaHMu9DJ/C9hUlvOjcHPljpIFS7JgdnIhmrikWWBz0f8h2Mo2xwQnUh8PuNHrxUyWRKWVYBHU4iR6vvscFQLcABscLzStL5nFObuoVAzOXaSxLrvMtdGFIXKE/pUSGphKvIWMx7fCsBWO7q5iMJD5Rh+sW0nsmK/TMKR/e+ftpY20YMKge4IcmwgsIgm5jbKpcCQ8zpALgaDiz8jbi0Onq/d/6Mrvw0izCQSLLSX5LRRsMakhuk6yfuPO8ceTZuH6M7/WasHX7KqOrYOW9tImNbxbPMGyuTGfstoZ4AEZ06D73Px9OiNQ3+O4xgryWQdnTwRVxPy8NnDIHiz3vPdARMAWod61WM2DYQn/BYDGCdAZYk6V53opXicp9S0hR6mW6EnB4oMsaHLeGSzlFFQePrJ2LsdCBKGP9vLSgApxJGHj9grnzd/Gx3ULDBcP5OUe+i9Ocj6m+3nMMD6J6tF056MDVTtzi4uC5w7/Du7vQZNZ7I8Of5oHqIZZS3YG3Bz5lX3GiU0hqHzEf7xEdwTKe5HDHwmYndyt0NkzskuXMxnedDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(376002)(39860400002)(346002)(366004)(1800799009)(186009)(451199024)(66476007)(66556008)(6512007)(316002)(66946007)(8676002)(8936002)(2616005)(4326008)(36756003)(41300700001)(478600001)(6666004)(38100700002)(6486002)(53546011)(6506007)(83380400001)(30864003)(2906002)(31686004)(31696002)(86362001)(5660300002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TjRLeG1mU01zR1FSTjZuR21LSXh3dUhIb2M1NmhzOWRQdHlqQnQ4d3BRbDZ1?=
 =?utf-8?B?UDNoTmtwbktEenBMQ2xGQXBzaWx5NWdGdmtvYnVya3JocTIxc0kzaG5KZTVC?=
 =?utf-8?B?bTRKRFdSVEhYVUJRYWxxWW4xUVFXanN3VWExU29VbDVrZVA4SFZUYm5NQkdZ?=
 =?utf-8?B?NXg0WFlOL3RGaC9yNlprbVoxRVpKdktWTmF3M1ZadEtOeHlRcnhncm9VUjhN?=
 =?utf-8?B?VVdSV1VCbU8yYU0xd3pJUzFyd0c5dGowdjBuRURFaVpvamhqbmh0MDI5SDZk?=
 =?utf-8?B?Q2Q1ZExTUlpFa1hobHdld21wRTkxR3JFZ0F0VXF5dDEyUEExY09hbGdDUmd3?=
 =?utf-8?B?UFdCVmxCbms3SVhBcWF2a2U4cEdDTjNrcXJ6ZUhXUSs0eFZwRUltQVltQmc2?=
 =?utf-8?B?dVVyVDc5NXhMbllQeTlKUmxFMCsvK1YzZUpHZ1c1c1RGRnM0MHFWMC9WRHEr?=
 =?utf-8?B?RXVYS0tzZWNIM1dxKzF3NnNCMkJsNWZZY2E2Q21QV2pGeUloTHJXZW1sbHBO?=
 =?utf-8?B?ZkcraXI5TTFQNEpyRjR4Vy9zNlJpUWVJMTNYQ3BISmdsaGZLakN5RW5mM1pq?=
 =?utf-8?B?c1h5MkFXTDZWUXgyQVFhbW9Hc3QyNGhjT1krbGp3aUxoYzQwMFlicysvcG1E?=
 =?utf-8?B?cGQyYStoSC92aTU4N2VpMmhvN3ZPTXdGWGt3VTlSaVVzRUFjL01LZm5DQ29L?=
 =?utf-8?B?TjhrSlFJcXIwVFR4OXZqSGw4S1pKeEJlTER2cmI0S3ZsRVBQY1psajNHUzF0?=
 =?utf-8?B?M1BMdG04U0F6OEViUzIvWkY2SmN2b0NQK29HaExHQm1mSlFLOEtjazFxTFo1?=
 =?utf-8?B?R1BVMkowNDY0TlFlZWpTaDdlbzgveHFzazkzMkpNWEUyVmFKVmZZZC9lZm9M?=
 =?utf-8?B?dXdTTHRTbE5nWTJmTlp0dDlLMmVRSm9QK041QmZWT1NpWXVqRkJOTVBtaElw?=
 =?utf-8?B?WVpiQ3FWZVFEOHI3WTNvWXdONEMyWE9tQjdvUXR4VnVDYzNiak1BTXBjdlJ3?=
 =?utf-8?B?eDRQR3U3Nk8xOEdDd1ozOVl3eVNrQUxUaG5Ic3dtQ1MwNEhwOEd0N1pvb2RP?=
 =?utf-8?B?NksrakJmeFh3Z3ZEYllZWmJaOWM2cmtuWldWem5qc25mREp4Z3dYTjFMa2JZ?=
 =?utf-8?B?V3RaMVl4UHBZN1g0WlRmWjFRU0JlQ0xJNGo2cWQ4UElKbGV1ZXJZbHk4dm43?=
 =?utf-8?B?OENrYWx6SkNqOGZnN2xORjh2OXJKb3hkMlhxZ2U3UjZBUnVBb0E5d3pmTmsv?=
 =?utf-8?B?TGhLSWpMcVFtdFFkZWpTaW5GVEJ3NHB1RVNWOEwwY3h5blJ5eHNPRFpnNzdy?=
 =?utf-8?B?dU9SN0JySTFwYWt2TzF2N3c1ZW1EVlN3VkJNeEZjU1NZNWJDc2xxSWFCWFlr?=
 =?utf-8?B?ZW5IWXNQdDljSzFINGRjcW80NEE1VktIL0R4TlczbUROT1Jub3ZsakZYU0hE?=
 =?utf-8?B?U0tuSHd4b2FXbTRTLzAxdU5LNkFaOWJ6eXNYRlBKbmJBWFNuNVlZS0JldFIv?=
 =?utf-8?B?M0RXS0RiMVRXWk9lMmdrMnB5SWdvRnlmVDRQZW9jSm5TS1VTN0lzcW05REI2?=
 =?utf-8?B?Y0NtNUpKK2tUOVU0emNqa0IwaUtsQWdSU3lSaUpucUw2YTJtTUpKVGF5NFVC?=
 =?utf-8?B?VTZ3WDU3S0dqVTlHMVQzRUc1STJSM0xsRTgzUzhFaWNIZFlYbzh6VEMzNFZy?=
 =?utf-8?B?M0ROM2VDSk8xQlN0cDVsSVdzd1VabGtKYU0vVFh6SnAwMWdHcGNZeHkrak52?=
 =?utf-8?B?akVIWmFRdFZzejdmSWZHVnBnaXRkcDB4NHRZWFNWak8wSVBTOEViVkVIdHJt?=
 =?utf-8?B?VUZYNjBLaVNoQ2tIanNQejhOTHc5R1pCTWdDcWRxYTZDYjhFMERtTGJUWXlV?=
 =?utf-8?B?bitEb3h5ZDc0MWZva1RJSFA4b2QrNHo3elFsY0xiNnhTUXY5a0IyK1U5aU0x?=
 =?utf-8?B?L0FxdkEwa3p6RXo0V3Y3R0lMOGR3MmlSdEE1dGhkQlRkS1lDb2FocTZqUlBt?=
 =?utf-8?B?Qmo3MGNXbjAzaHFWK2JVcW5DL1kwYVUyWkRzVmRneWlnU0k2TTB3VHp3OVcw?=
 =?utf-8?B?SE9LR0wrYzlPTDZqK0ZiQStQcVNreXRqanEvOTNzR2JqN293dG9sM0pNeGtt?=
 =?utf-8?Q?f8BouEohmgETmpWlbPwwmqCWr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fddf5a1c-e4a5-4051-600a-08dba31842ee
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 14:01:20.2010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5PAEhzCO0OcCjQWS3QIyIFS37rj2MHpEfHZdAVLQ78TLkw3MkNxMqLGalo8PpIk+1HHswwYJTxWN7v2kOvXijA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8094
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


On 21/08/23 10:46, Matthew Auld wrote:
> Hi,
>
> On 21/08/2023 11:14, Arunpravin Paneer Selvam wrote:
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
>>
>> Moved contiguous/alignment size computation part and trim
>> function to the drm buddy manager.
>
> I think we should also mention somewhere what issue this is trying to 
> solve. IIUC the roundup_power_of_two() might in some cases trigger 
> -ENOSPC even though there might be enough free space, and so to help 
> with that we introduce a try harder mechanism.
Yes, we are trying to solve the above issue. I will add the problem 
statement to the commit description.
>
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
>
> Wondering if this would be a lot simpler if we can tweak alloc_range() 
> to support allocating as much as it can up to some size? If it runs 
> out of space it still returns an error but doesn't actually free what 
> it has successfully allocated. It then also tells us how much it 
> allocated. We can then allocate the rhs first and then from whatever 
> is left we can figure out the precise offset we need for the lhs? I 
> think that looks sort of similar to what the above does, but here we 
> can for the most part just re-use alloc_range()? So maybe something like:
>
> __alloc_range(..., u64 *total_allocated_on_err)
> {
>     ....
>     err_free:
>         if (err == -ENOSPC && total_allocated_on_err)
>             *total_allocated_on_err = total_allocated;
>         else
>             drm_buddy_free_list(mm, &allocated);
>         return err;
> }
>
> alloc_contig_try_harder()
> {
>      ....
>      list_for_each_entry_reverse(b, list, link) {
>          .....
>
>          rhs_offset = block_offset(b);
>          err =  __drm_buddy_alloc_range(mm, rhs_offset,
>                                         size, &filled,
>                                         blocks);
>          if (!err || err != -ENOSPC)
>              break;
>
>          lhs_size = size - filled;
>          lhs_offset = block_offset(b) - lhs_size;
>          err =  __drm_buddy_alloc_range(mm, lhs_offset,
>                                         lhs_size, NULL,
>                                         blocks_lhs);
>          list_splice(blocks_lhs, blocks);
>
>          ....
>      }
> }
>
> ?
>
The difference between the above approach and this patch is that the 
above approach tries to allocate first from RHS and remaining size from 
LHS, but the patch tries to handle RHS and LHS separately through 
alloc_from_buddy() and alloc_from_peer() functions. I thought this would 
unblock the merge back operation of any one of the side (either LHS or 
RHS). If the above approach doesn't harm much, we will try and allocate 
from both the sides.

If we can add the immediate right block (i.e its buddy) to the dfs list 
for RHS traversal and if we could add only the immediate peer block for 
LHS traversal, this would eliminate the need for adding complete address 
space to the list and it might reduce the number of iterations.

Also, we should ALIGN the LHS remaining size to the min_block_size. 
Otherwise, I see glitches in some of the workloads.

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
