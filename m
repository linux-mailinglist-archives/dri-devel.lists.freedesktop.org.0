Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5661C7827C0
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 13:17:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3538E10E09A;
	Mon, 21 Aug 2023 11:17:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2042.outbound.protection.outlook.com [40.107.223.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BFEF10E22D;
 Mon, 21 Aug 2023 11:17:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=an2dndKzHFEZxvoFS3lGt0ll3KFfBeR4xgqfhh2mQvpKtZsnwrjiiSvoj1Wbmr0t7G52ydcD+4Sgxy/R+5Eq0e+J1OjbGQ1xgbKQISA65hlC2krlcZIXSF08NekpwUorTjdY1lPDJhl+vGtHqZvDjb7drzAKVwe3ppx8xQ2Dh6dnDkS9XLteGrRWOmdF1mafGktvUxtPqH3jxN3SxRpimEsa1H6DJNHssvBMcJ8sZIFCUymp9d6mzSKGeNvP1IuiIg+7MPnyniqW9qJ+3kXm/XX/i/j5OIv90juQIEp65Cl+1vuUktJftDDXwMIcQKv6ECbbTUlIx6Hvz4EkvrbZ8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8+3528EquRY0xMyASVdrudbQ9NyRqrtJ/iPoxsv8V9c=;
 b=gdBuiU1a/Kfq/lJGyqhfvRYTBNia1g8ihtJlFhB2N5giYs69LCGtaFPIIlXgNhj5uq5bK6tbcx9b2ahC6eSw9S/3HD9lqZtuuzl7mLq4qxDkH/LkXsZVGSJH2ngMXQkGX9szW6tf1VkhZoWgafe9DKBbzTnNhTfC8qzEQGlPDFZm7HNczxgLLRPu5W2hX/SLseV9awl0amWTi5c8Lfo5WwCFz38Q3B7iFKRNf3hvfiCjARpB0K8hfQkU1vTCXaQYImKmo1XN/VMfPgiKJAHUv/De6nnz2uaqarEwBLMdbp/KJCRJhvN+W05HG9CnAaOMri6aPfwaZh3C4AHnGsWwdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8+3528EquRY0xMyASVdrudbQ9NyRqrtJ/iPoxsv8V9c=;
 b=LvKlLu8FiGiaqqVbenv9XBi9VShQd5/tTsLou9xpqFSRbp/Q42d4zSCAYDSwyHGcnVQV8yiqCFUxBjNMzwW5OIj2iXhbAXl4kmQxgys83rHLoDiUsXpmNYicSDgHqAS8jLytEBq9C0z+OvMME5PrYMgv8uwPZ9qno8M1ENn9YWI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Mon, 21 Aug
 2023 11:17:00 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::3d:c14:667a:1c81%4]) with mapi id 15.20.6699.022; Mon, 21 Aug 2023
 11:17:00 +0000
Message-ID: <a1f422c6-728d-afae-29e1-6f091e16df7f@amd.com>
Date: Mon, 21 Aug 2023 13:16:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/3] drm/buddy: Fix contiguous memory allocation issues
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20230821101444.119601-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230821101444.119601-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::6) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: 9380f806-2191-4017-d144-08dba2382372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HUsfO3T+xFG4VaNDSrDJWTXgM/6ohUD40mNfQgvXCAZ+Xfzjl3++5/iqECGuvQKwBd78U/80H+rU/yEdrkR7qiHNeTgeU6vFc0d2Acy/ngtvP2e9dOAKSEE1J8o1DM89cMG4a+cljbPvU1JozpZdyvH/QYvbva1vF6KBsD0ZOhLa+xMV7G/Z6gcJJy+RbKAlYQ5RjDFsON8vEEzrwfO0z1P8quzRvrfBKRke1P+NFcGL/v2a/10Th+4c2UbVE1jkAYKO6cU8zLTDfAnBo3e8/z4y7JWQo6+Ygsa4YXaKQXKagMUc1QJArwBhO4WRVRmVNgNZ+SsOyUiiUpey4N5IhdJjIRQW2zn8XS5AoQ65jKfd21OMBybvrfclYYblOY3aLnFkulSClzVrdGUHgbwRS3zZbtSHaxYRnU28gLAYuJ9Ns3r3vKA3GdNvyS/Dv5ASmRsavz3X0dN1yxkggOB2oEabMdM4Fw86sDFSXVjBpsw4DmqgngJXAgXwuF3IGR5Z+DF/bAzFfywTmIbNzHCjWqlyDuoQXQL3vSpW4jN9L1f5uLypnqNQy9Rv53n+V/BGsFnNf+SslbpQnjGa4qUnV6V/lBAnowByNQMN6N69GMQFzlUCIFlXGJOnPku97OzHGlAtAHtXGM60rR2eYlzybw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(376002)(396003)(136003)(39860400002)(451199024)(1800799009)(186009)(83380400001)(2906002)(30864003)(38100700002)(6506007)(6486002)(5660300002)(26005)(86362001)(31686004)(31696002)(8676002)(8936002)(2616005)(4326008)(316002)(6512007)(66946007)(66556008)(66476007)(478600001)(6666004)(41300700001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akxrelFTcGgra0VHYy9mYUs4NUJGMmdYNGVscktyWUxRWHlGNHZOSGRFK0VK?=
 =?utf-8?B?bGVMUDNtUkZYSVZZL3FpdzJMNGRSY0tIVDVWelBMUTM4WGdZM1F3eDBzdkNU?=
 =?utf-8?B?V0tJRTJiblM0N3NDcjRQWFpYVUxaVUdWMm9CR1phaTRqQnlFR1ZZU0pMY0ht?=
 =?utf-8?B?WGZJZ01WZ21qMi82a2xZMzhHUXJ2d3RKZVhLNEZiVWhtZlBIYzArbmkyRFJP?=
 =?utf-8?B?TDdFanZFZ29vUTRXd1BXUGRhZS9OaytKZy9MTzZJT09MYnp2dzVCd3N4MGF1?=
 =?utf-8?B?Z2VXMWRoMzZNNjNKZmJEQ3RMMjB6VjFIdUwrR05YYnVyZlVRWTdpdUlTV3Mz?=
 =?utf-8?B?a1QwVWk5ZFQ0OFg5U280V0g2bVhQLzZvTmxOWHV1RmdhVUs5ek5TQ21zbHdj?=
 =?utf-8?B?WkdpWW9Wd1pxanNyRVV2R3JGYWV3NDNGUnFUYW1xMjdUOFhheWNScmtpTjls?=
 =?utf-8?B?eThkblhVWXdoVFRSWkxGY2tGbzR3MGlvK1BhWnJ6VFpJeVBpTk45cEhldWoz?=
 =?utf-8?B?SlNaWEN2WGY4Y0YrZGd1YUtPaWc0N0tzQkROeVNRNXBydmhzV1NwRGlsejdI?=
 =?utf-8?B?MkhxMWgvN0hNRUQvQ0l1YUJYUS9nSjg0dFIvSWRFbG15TW9GQ3lXbzlXdVQ0?=
 =?utf-8?B?cFoyaExseDkxY3RxQm5VdGVJcUxOOHVTa1J2aFZPWjJ3MVI5NVkwaStYTHRJ?=
 =?utf-8?B?eVN4TXd4dG9GdzM2bklqMmExQmRxNEtsR1pvc2Rhd1RVL2M4TzZxVFh5d245?=
 =?utf-8?B?eGNFU0ZkN204bHN1ckVQTmlzY1ZQSW9FUVBxZXRwTG90ZlFWdUFnZkI1TVpn?=
 =?utf-8?B?YnltWWtSVnVhbFpGczVWMkcxL0hvclA3S2JuNElVbmJpOFdqazh6a3pmL0F3?=
 =?utf-8?B?UjljZXY4Rkx0NEZYSk02ekt1Ri96RTFaUkJOTzVsTTFEWkNaV1dMQk0rajlu?=
 =?utf-8?B?YVZJUHZqMmFHK21JdVhLRUx2d20vVkVuRmVabjhaamFPZzdSTU90WnU5QUgr?=
 =?utf-8?B?cXFnMmhZTXB0NE9lcjN0dU8wazB3R1pqM0R4NTc1cmYwOVNrUlNrZjNFNkFu?=
 =?utf-8?B?dHpRMWpka0lrTk1ZRUp1NmQ0cWlxUGMrQ3dSWnVhb2ZZZjBaL2t3MVV6VGti?=
 =?utf-8?B?YWFHZVFBaVZMOGoxcTM3ZHo0Uk8rejlSdmlpRWUrWkVUY1JVeVorK3hhTmZq?=
 =?utf-8?B?eVJJa2F5UXY1ajZraHkyVHRhRFM5ZHlHZStybExqa0RLcU51dzQ2eHFXTXhv?=
 =?utf-8?B?ZGdQSHE2cUxrZHZ4b3k5QndCV1gyaGNQUDRJTGk4ZmNGaDdudXN6SDVFNXFa?=
 =?utf-8?B?QnJ4MElmeGl4N2VLOFlqSW1Lczl2RStBZEgrUHhucWpQYUg5eEozbkpzWUp2?=
 =?utf-8?B?YjlIT3h2d3hmdkwvOFo2TGNmaG5lYzNuSU5WdnlUVEpsdnZ6RFhGQ09xY0Z6?=
 =?utf-8?B?R0pNQXRUc2ljd05iYzRVbzdRd3RJeHN0NnZjSitYREZENHdpUjJIc1V1a0V4?=
 =?utf-8?B?NGUxUXRQRzJTVSs5R3JydGp4YUZHZktjSEFBY25TOTJvRFRkSGkzRFI0VlB6?=
 =?utf-8?B?MDUrcWlDTzdleWY2ZVhCTllQRHZlVldtYndvcnNLaUxYVHRaWFoxZEczbi9B?=
 =?utf-8?B?bGFnSUp2TUdnL29KRGxEYjczRUlVblZ0eFByL2p4T2dkTDV6czNiQncrd0tR?=
 =?utf-8?B?ZVd3bkxYajErazJlQkNoQUZtc3E1M2NUalkwcDRtRUFKRzJVWm9ZT2dpQzhU?=
 =?utf-8?B?d0dIZ0xybm4zQzM5cUh5bjFybElmQzJiTTNHSUJZa1JhaXBxbWdkempEc05T?=
 =?utf-8?B?dTEwYS9YVFR5SDYzYnd2anJ0c2kzdUdkVnh2NUJ1ZWpKZndSMmZleHM1WVMw?=
 =?utf-8?B?V0hxTm9RQ3RyM3U5STNWQ2lUOFRBU0dOalo1MmFVOFg3WW1PTmYzTkhvakNI?=
 =?utf-8?B?K3NVZ2RQekZsZlgxR1pNMEZXUEx1bEFUZitUZTFhYm5SWTc1Zkd4VmthSHNu?=
 =?utf-8?B?eWlrY2RnR0N0bGc4OG9Ld2NEZlo2QTkxUEJ1OUVUV1FPcGR0YnE1aWtFdEJx?=
 =?utf-8?B?VXFVQzJiR3l1dzdMSFlBYXg4dUt1c2F6UmV2cVc0R2xqdUY3TEtKNGRhV2dL?=
 =?utf-8?Q?UhOrxOoaaT4sJmSAydvHGa0AX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9380f806-2191-4017-d144-08dba2382372
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Aug 2023 11:17:00.0899 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A+XNgE55XT9qOqTNV8dTzQkPZZxAxWvwrJeVsuYkfs+WbXm3WJo9LMj90J0Od4/Z
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8013
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

Am 21.08.23 um 12:14 schrieb Arunpravin Paneer Selvam:
> The way now contiguous requests are implemented such that
> the size rounded up to power of 2 and the corresponding order
> block picked from the freelist.
>
> In addition to the older method, the new method will rounddown
> the size to power of 2 and the corresponding order block picked
> from the freelist. And for the remaining size we traverse the
> tree and try to allocate either from the freelist block's buddy
> or from the peer block. If the remaining size from peer/buddy
> block is not free, we pick the next freelist block and repeat
> the same method.

I think it's worth mentioning that Xinhui tried something similar a few 
month ago, but that didn't looked like it would work. For this here I'm 
more confident.

Of hand the implementation looks clean to me, but Matthew or others 
which have more background in how the implementation works need to take 
a look as well.

Thanks,
Christian.

>
> Moved contiguous/alignment size computation part and trim
> function to the drm buddy manager.
>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c | 253 ++++++++++++++++++++++++++++++++++--
>   include/drm/drm_buddy.h     |   6 +-
>   2 files changed, 248 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 7098f125b54a..220f60c08a03 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -569,6 +569,197 @@ static int __drm_buddy_alloc_range(struct drm_buddy *mm,
>   	return __alloc_range(mm, &dfs, start, size, blocks);
>   }
>   
> +static int __alloc_contiguous_block_from_buddy(struct drm_buddy *mm,
> +					       u64 size,
> +					       u64 min_block_size,
> +					       struct drm_buddy_block *block,
> +					       struct list_head *blocks)
> +{
> +	struct drm_buddy_block *buddy, *parent = NULL;
> +	u64 start, offset = 0;
> +	LIST_HEAD(dfs);
> +	int err;
> +
> +	if (!block)
> +		return -EINVAL;
> +
> +	buddy = __get_buddy(block);
> +	if (!buddy)
> +		return -ENOSPC;
> +
> +	if (drm_buddy_block_is_allocated(buddy))
> +		return -ENOSPC;
> +
> +	parent = block->parent;
> +	if (!parent)
> +		return -ENOSPC;
> +
> +	if (block->parent->right == block) {
> +		u64 remaining;
> +
> +		/* Compute the leftover size for allocation */
> +		remaining = max((size - drm_buddy_block_size(mm, buddy)),
> +				min_block_size);
> +		if (!IS_ALIGNED(remaining, min_block_size))
> +			remaining = round_up(remaining, min_block_size);
> +
> +		/* Check if remaining size is greater than buddy block size */
> +		if (drm_buddy_block_size(mm, buddy) < remaining)
> +			return -ENOSPC;
> +
> +		offset = drm_buddy_block_size(mm, buddy) - remaining;
> +	}
> +
> +	list_add(&parent->tmp_link, &dfs);
> +	start = drm_buddy_block_offset(parent) + offset;
> +
> +	err = __alloc_range(mm, &dfs, start, size, blocks);
> +	if (err)
> +		return -ENOSPC;
> +
> +	return 0;
> +}
> +
> +static int __alloc_contiguous_block_from_peer(struct drm_buddy *mm,
> +					      u64 size,
> +					      u64 min_block_size,
> +					      struct drm_buddy_block *block,
> +					      struct list_head *blocks)
> +{
> +	struct drm_buddy_block *first, *peer, *tmp;
> +	struct drm_buddy_block *parent = NULL;
> +	u64 start, offset = 0;
> +	unsigned int order;
> +	LIST_HEAD(dfs);
> +	int err;
> +
> +	if (!block)
> +		return -EINVAL;
> +
> +	order = drm_buddy_block_order(block);
> +	/* Add freelist block to dfs list */
> +	list_add(&block->tmp_link, &dfs);
> +
> +	tmp = block;
> +	parent = block->parent;
> +	while (parent) {
> +		if (block->parent->left == block) {
> +			if (parent->left != tmp) {
> +				peer = parent->left;
> +				break;
> +			}
> +		} else {
> +			if (parent->right != tmp) {
> +				peer = parent->right;
> +				break;
> +			}
> +		}
> +
> +		tmp = parent;
> +		parent = tmp->parent;
> +	}
> +
> +	if (!parent)
> +		return -ENOSPC;
> +
> +	do {
> +		if (drm_buddy_block_is_allocated(peer))
> +			return -ENOSPC;
> +		/* Exit loop if peer block order is equal to block order */
> +		if (drm_buddy_block_order(peer) == order)
> +			break;
> +
> +		if (drm_buddy_block_is_split(peer)) {
> +			/* Traverse down to the block order level */
> +			if (block->parent->left == block)
> +				peer = peer->right;
> +			else
> +				peer = peer->left;
> +		} else {
> +			break;
> +		}
> +	} while (1);
> +
> +	if (block->parent->left == block) {
> +		u64 remaining;
> +
> +		/* Compute the leftover size for allocation */
> +		remaining = max((size - drm_buddy_block_size(mm, block)),
> +				min_block_size);
> +		if (!IS_ALIGNED(remaining, min_block_size))
> +			remaining = round_up(remaining, min_block_size);
> +
> +		/* Check if remaining size is greater than peer block size */
> +		if (drm_buddy_block_size(mm, peer) < remaining)
> +			return -ENOSPC;
> +
> +		offset = drm_buddy_block_size(mm, peer) - remaining;
> +		/* Add left peer block to dfs list */
> +		list_add(&peer->tmp_link, &dfs);
> +	} else {
> +		/* Add right peer block to dfs list */
> +		list_add_tail(&peer->tmp_link, &dfs);
> +	}
> +
> +	first = list_first_entry_or_null(&dfs,
> +					 struct drm_buddy_block,
> +					 tmp_link);
> +	if (!first)
> +		return -EINVAL;
> +
> +	start = drm_buddy_block_offset(first) + offset;
> +	err = __alloc_range(mm, &dfs, start, size, blocks);
> +	if (err)
> +		return -ENOSPC;
> +
> +	return 0;
> +}
> +
> +static int __drm_buddy_alloc_contiguous_blocks(struct drm_buddy *mm,
> +					       u64 size,
> +					       u64 min_block_size,
> +					       struct list_head *blocks)
> +{
> +	struct drm_buddy_block *block;
> +	struct list_head *list;
> +	unsigned long pages;
> +	unsigned int order;
> +	u64 modify_size;
> +	int err;
> +
> +	modify_size = rounddown_pow_of_two(size);
> +	pages = modify_size >> ilog2(mm->chunk_size);
> +	order = fls(pages) - 1;
> +	if (order == 0)
> +		return -ENOSPC;
> +
> +	list = &mm->free_list[order];
> +	if (list_empty(list))
> +		return -ENOSPC;
> +
> +	list_for_each_entry_reverse(block, list, link) {
> +		/* Allocate contiguous blocks from the buddy */
> +		err = __alloc_contiguous_block_from_buddy(mm,
> +							  size,
> +							  min_block_size,
> +							  block,
> +							  blocks);
> +		if (!err)
> +			return 0;
> +
> +		/* Allocate contiguous blocks from tree traversal method */
> +		err = __alloc_contiguous_block_from_peer(mm,
> +							 size,
> +							 min_block_size,
> +							 block,
> +							 blocks);
> +		if (!err)
> +			return 0;
> +	}
> +
> +	return -ENOSPC;
> +}
> +
>   /**
>    * drm_buddy_block_trim - free unused pages
>    *
> @@ -645,7 +836,7 @@ EXPORT_SYMBOL(drm_buddy_block_trim);
>    * @start: start of the allowed range for this block
>    * @end: end of the allowed range for this block
>    * @size: size of the allocation
> - * @min_page_size: alignment of the allocation
> + * @min_block_size: alignment of the allocation
>    * @blocks: output list head to add allocated blocks
>    * @flags: DRM_BUDDY_*_ALLOCATION flags
>    *
> @@ -660,23 +851,24 @@ EXPORT_SYMBOL(drm_buddy_block_trim);
>    */
>   int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   			   u64 start, u64 end, u64 size,
> -			   u64 min_page_size,
> +			   u64 min_block_size,
>   			   struct list_head *blocks,
>   			   unsigned long flags)
>   {
>   	struct drm_buddy_block *block = NULL;
> +	u64 original_size, original_min_size;
>   	unsigned int min_order, order;
> -	unsigned long pages;
>   	LIST_HEAD(allocated);
> +	unsigned long pages;
>   	int err;
>   
>   	if (size < mm->chunk_size)
>   		return -EINVAL;
>   
> -	if (min_page_size < mm->chunk_size)
> +	if (min_block_size < mm->chunk_size)
>   		return -EINVAL;
>   
> -	if (!is_power_of_2(min_page_size))
> +	if (!is_power_of_2(min_block_size))
>   		return -EINVAL;
>   
>   	if (!IS_ALIGNED(start | end | size, mm->chunk_size))
> @@ -692,12 +884,21 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   	if (start + size == end)
>   		return __drm_buddy_alloc_range(mm, start, size, blocks);
>   
> -	if (!IS_ALIGNED(size, min_page_size))
> -		return -EINVAL;
> +	original_size = size;
> +	original_min_size = min_block_size;
> +
> +	/* Roundup the size to power of 2 */
> +	if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION) {
> +		size = roundup_pow_of_two(size);
> +		min_block_size = size;
> +	/* Align size value to min_block_size */
> +	} else if (!IS_ALIGNED(size, min_block_size)) {
> +		size = round_up(size, min_block_size);
> +	}
>   
>   	pages = size >> ilog2(mm->chunk_size);
>   	order = fls(pages) - 1;
> -	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
> +	min_order = ilog2(min_block_size) - ilog2(mm->chunk_size);
>   
>   	do {
>   		order = min(order, (unsigned int)fls(pages) - 1);
> @@ -716,6 +917,17 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   				break;
>   
>   			if (order-- == min_order) {
> +				if (flags & DRM_BUDDY_CONTIGUOUS_ALLOCATION &&
> +				    !(flags & DRM_BUDDY_RANGE_ALLOCATION))
> +					/*
> +					 * Try contiguous block allocation through
> +					 * tree traversal method
> +					 */
> +					return __drm_buddy_alloc_contiguous_blocks(mm,
> +										   original_size,
> +										   original_min_size,
> +										   blocks);
> +
>   				err = -ENOSPC;
>   				goto err_free;
>   			}
> @@ -732,6 +944,31 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   			break;
>   	} while (1);
>   
> +	/* Trim the allocated block to the required size */
> +	if (original_size != size) {
> +		struct list_head *trim_list;
> +		LIST_HEAD(temp);
> +		u64 trim_size;
> +
> +		trim_list = &allocated;
> +		trim_size = original_size;
> +
> +		if (!list_is_singular(&allocated)) {
> +			block = list_last_entry(&allocated, typeof(*block), link);
> +			list_move(&block->link, &temp);
> +			trim_list = &temp;
> +			trim_size = drm_buddy_block_size(mm, block) -
> +				(size - original_size);
> +		}
> +
> +		drm_buddy_block_trim(mm,
> +				     trim_size,
> +				     trim_list);
> +
> +		if (!list_empty(&temp))
> +			list_splice_tail(trim_list, &allocated);
> +	}
> +
>   	list_splice_tail(&allocated, blocks);
>   	return 0;
>   
> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
> index 572077ff8ae7..a5b39fc01003 100644
> --- a/include/drm/drm_buddy.h
> +++ b/include/drm/drm_buddy.h
> @@ -22,8 +22,9 @@
>   	start__ >= max__ || size__ > max__ - start__; \
>   })
>   
> -#define DRM_BUDDY_RANGE_ALLOCATION (1 << 0)
> -#define DRM_BUDDY_TOPDOWN_ALLOCATION (1 << 1)
> +#define DRM_BUDDY_RANGE_ALLOCATION		BIT(0)
> +#define DRM_BUDDY_TOPDOWN_ALLOCATION		BIT(1)
> +#define DRM_BUDDY_CONTIGUOUS_ALLOCATION		BIT(2)
>   
>   struct drm_buddy_block {
>   #define DRM_BUDDY_HEADER_OFFSET GENMASK_ULL(63, 12)
> @@ -155,5 +156,4 @@ void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p);
>   void drm_buddy_block_print(struct drm_buddy *mm,
>   			   struct drm_buddy_block *block,
>   			   struct drm_printer *p);
> -
>   #endif

