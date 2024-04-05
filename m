Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26663899D14
	for <lists+dri-devel@lfdr.de>; Fri,  5 Apr 2024 14:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E3C113BAB;
	Fri,  5 Apr 2024 12:34:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="14LMnu1M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2128.outbound.protection.outlook.com [40.107.100.128])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75B46113BA8;
 Fri,  5 Apr 2024 12:34:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3oLrybS6nYD32rE/pS2R8nV/d7N4BN6TOD7cDffCtMWT2oZfJGSUyjBLL2PohEi0+6jP0ZQIwdtn9O7TMtDiLHWA3HcHrj+NVK7wweEQ2qiENBlt85oE1TRYLpmrv2101jkJJCDhKxt4AUOy1q0TShFqZ7TtzYJVbPrxccBO3kX5j5XdGcWg389KIpRT5TwfUsDBbM+ysPaI9lU9ByotPm1lea/O2QhZrWNdDB4abfkSalB50csYJGnJIxMrQFGLRJdSDSEeY9coUBtnQHNYuUM1JxvwmKVas3zbhHyDFsXphKhPXEjg6MWpUQ+Y6tY6Oezh/7CQy0REkG5mCHriA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4r127wDlUfsf4FRceGtgyGLxvksUxd+1eBOC09RO1Fo=;
 b=fDEn1BMFPfJbL3NYEQYeaNl0hy5RfIXzpfD3uItH8F9VLaIxAa0hhSV4d3+Go0rpEMMGTeS3Wsho0It2KQXqtsCg5/EFwDiVL93hU5gNGEqskvX53c+iXnXKh/DxInX+3C7pxhQ0ZniHa54VTXLSBsxONePqEHmSTCFdQZ576d50IF+9dwGFugO1C3Oz7P2JRF+KuC8aqUls6iYTZBsLu0Q94AsWD86+9LXNScS9Zywxm4r5k4inUMbis3AzKrhtEB3ychukXpQ/G+Z78Q6p5YhsDrWOJmzyoqhG1yPm2WAY3qJpsUFUf/5gKyWy0uqYXjDxMvXjHMgXC80ckbAzDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4r127wDlUfsf4FRceGtgyGLxvksUxd+1eBOC09RO1Fo=;
 b=14LMnu1Mi9uzkybwfNhZfuRszvm31Je7FjKJWLxvwLYov5fsnDoy15KWjNk+wqTxOAaOQJJX0MlI2IHY0id0eCXmhGJ1tH8ucsXjJCL5mGgsBPrQVTf2RgrUDEWEknYTCnG2BHzFbc5ECZhYWuqP7ZoEWpVg2Jru+BzLRngC6Zs=
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB8321.namprd12.prod.outlook.com (2603:10b6:8:ec::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Fri, 5 Apr
 2024 12:34:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7409.042; Fri, 5 Apr 2024
 12:34:36 +0000
Message-ID: <3b9b1afb-0aed-4278-8781-01d64736d688@amd.com>
Date: Fri, 5 Apr 2024 14:34:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] drm/ttm: Allow TTM LRU list nodes of different types
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20240329145707.3087-1-thomas.hellstrom@linux.intel.com>
 <20240329145707.3087-2-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240329145707.3087-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0354.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB8321:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tr7P8Bi6mwqKku50bO/Rpv4WPxJVnvEiXujz577uBdcXVRCcmp9qMPi0sv5ocJQzpUIL9pcINDFFRBi5w5o01Gzaphjp+jLVS0+8i4mI/L9f9jJ0iTGqJcTMHq75YuR34Jn4WyfAuCO5FXBvkkECr8CDQFKxW0Yg11d6beE7QOslGrduAsXUqOblBsKjtTbD+Xt94uyBRQmrp9aEUH5rxEvIVNhV/Jf8pMFrF8nSdKeevx14u+ylIXYPtvq0w13kQtCJi9B6BvodPzyKZp1ClJUjQuZE7C1ZdoFbPxvdeAjs1j13/7VKtJX79Igc+FlhvoRrIGJBptyEIJ/JTL1HUkaksN/5bpcmWhm9iEe9BYDvUTb0WnNQgurKRh2vrkgSf1IYXbJi/RfkS6cG7HfZ2ExAa1R3HgS+r95TxMa4JXMOFlNpGvJq/BjxEqHXPViVeyAJDoT7XmZ/PgzNdpvYDkapPyoHO8Fxy1T0/6yNYaN3vUsb0pYSxwqC7BUVeitAx5wggR+iMjvjc9CfFv3yMCklEs+9HwnN+k3zvGOjzH1REzNUk0+bds6N1D2srB+MuuRHBW+pPC6cM8z0zonu01QfseDYTejwb/gLDy73AHiCWpnjB98ykQXv38HXE8b99WX0lWyIFxsRt+o7it6GavTCcalhQ3Q0aIc1fpbKC8I=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SUZycnJlRHVUMjQwL1diUXlqZk9CeGcrS2p1UFNxbGpKVmdkVU9SSDJ4aGpY?=
 =?utf-8?B?RVp2MFoxQVd4M2swZldlazg2dVNiem9iODdCM2w5VkFlamhNb1ZmNGdmZldT?=
 =?utf-8?B?eXRFU0lNUytVeUl2MVpaWHErSXNXZFd4RkZZOUdwOHJqZzRBUkJGWjI1VFVB?=
 =?utf-8?B?RDN1MFNIWEtaVDBkcjYybDNQUlo5bFU0dnlyUWdpZTlXNnloS1I1TXJVUmEr?=
 =?utf-8?B?TXYrZEtXUVhHQUpIRk9tT24zZC96S1BOeFVrRWc1eDZVVmw0MGZQWXhqSThT?=
 =?utf-8?B?cXNPZCsxVENpN1VVczh3TWZRbm5mcDJ4d0NhODlpbDRWSU9sSUdoMGM4blFt?=
 =?utf-8?B?RHpaU0locDBlUkozZ1Vtd1lUc2RvRndVTjNLcG5scTdQaVQ3cThsVVdpVkZ0?=
 =?utf-8?B?QU43OWkvaWpNTlc4Y0dBVkt6UXRrSDVZeUxlTTdWUFBQQUJtMWUxOUVXV2F0?=
 =?utf-8?B?Mkl1WU9oTUNMNk5ySUF0dFJpdHZ2eDZraE9NVWVJdlJ2MkpJRWVxQnYwVmV4?=
 =?utf-8?B?ZUFScVhWTUxHM21tdWh2eUFxdFh1SDBYUmpZRzhUQlJqTkFFRVFmWmlQdUsz?=
 =?utf-8?B?RVZBYnVtQmVOdEtHMHVyd1pYUlBScVE1THkrdUZaa0ZGZldHRDEvMWVhZE9m?=
 =?utf-8?B?RlNreElFNjV3c1o2SEN3WmxibUdLQTNWbXJBTTcxODFDQTlwM2tRQjl0MVM1?=
 =?utf-8?B?YTlIZUxneEFielU5ZjFDeUI1dkdGUGMzcEZZb3RISTB1Y0ZpQWI2SmFkR2V5?=
 =?utf-8?B?Slg5c2dPaFg1V0t3dGs2Uks0ejhuZVZaQW8yc1JXdnB2N3RUSGpPVHk3a3l4?=
 =?utf-8?B?RDlxOUxaK09xOWZoMWxCb3JIYmtjYU0yUU82cjd1eWJnd1ZGK3VDV3YrV1F1?=
 =?utf-8?B?M0xqTS84YWZJN1dSRGV0OWJFamd1eXVPMlQwS1I2SnlPanFHcHUvb1JmaUZh?=
 =?utf-8?B?Q3BheVlNdEpKVjlHODhTMHlXVzliNldGUWtZZ0VyZStCM0NaTlhQWE1Idy9r?=
 =?utf-8?B?TFR3OWs5RmhYS21SQmMreDVENS9qdHdWdXVLOWNVUE9ENm1NQjRjWUUxOUZB?=
 =?utf-8?B?bysyaXNDc1NhTEhyZml4Z290M0JhM1lkUkd4Qnprd0tRN2gwejdSSWdHNmFZ?=
 =?utf-8?B?Q2xEbENxNUE3RVhxWHRKWVJiWmdNU2hYNUljRGNnQWF5YXBOUEdJZENhcjZp?=
 =?utf-8?B?WVBqTlJDaEV2TzFpUkNLVDRBcjdJRUl4Z1EwUktYOFVGTjFSc1cyTENITkJ2?=
 =?utf-8?B?d0gzaDBwTG5jNlB6NmNBSmxITXN1dU1Jb0xMWklOZEFYWFRsQXZGZEhGZEhB?=
 =?utf-8?B?bEtuQTZNZnBYOWVaQTVVMVc3N2lDRWhOSVoxcnc2WmhUZ3JWbU9Icmk1azAx?=
 =?utf-8?B?ak1sKzBReDlkWDVpbEZ5OEU0SGZZRzVNREh5R0huWjRFdlRnVjB1YkR2Vm52?=
 =?utf-8?B?Mk1LNE1xME1EVzc4V0V1QWg0a3dML24zZFZhWXRSelJIajMxMUxvK0RISFNS?=
 =?utf-8?B?RlhJdGFHQ0c0aGFkRVNpOUR5WUFMWjNIN2h4bnJRMzNqZVBQWlFIMTJ1M051?=
 =?utf-8?B?ZVRhUnFzcGxrdzNualY4WEtBTE1VOWlaSSs0L1FpNlZmR2kxMVdTR3ZUTmY1?=
 =?utf-8?B?UHhKYnFqUXpjM3h4VkY0aEtpcUxjK0FiZlVsL04wWFYvTVBrODZ2Y3dRODhw?=
 =?utf-8?B?aDhTVkZmay96eGNENmgySzZ6dmgyWktvQkx3UXZIYUlhOWZSUTR5aGg1UzFu?=
 =?utf-8?B?N2VhL1FDMmNTM2F3MnYxanFZTGhkODVYMHVnQldBQnlBOWx4bW12aHBuZXNN?=
 =?utf-8?B?dnRqV2l5T1B1bDFCOHZnNXdQbkowd0pVTlNCWEFQQm5pSERRM2dmeVplQzJa?=
 =?utf-8?B?b2RxQlpBcWhTRURRTkNqVU9LSHQ4MjYrTWp6enFpR0Y5cEEybCtoWkxmV0Zm?=
 =?utf-8?B?YmJMT3FSTFcwVCtKRTIyalpRaGdoNEFhWHNvUEx4amRsVzFKUnIwZ1pWUy9j?=
 =?utf-8?B?WG5EWDJXUjljbUNvaUUwWjZsSFp0YUtaTnFrOFZMMHRhQkh5MWZlWXlBcG52?=
 =?utf-8?B?MkE4a2lhdm5zZVhWb0lQaFkvc1RzVVQ2RmR6VnlnZ2tlODkreFU4OWlzK1VC?=
 =?utf-8?Q?Yn+D56Q1NJ/CoFTFWszRarE1N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bce8cfbe-9196-418c-9cac-08dc556cc118
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2024 12:34:36.5490 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TWRGVZJwyi5KKC5oajotfaZHKD7ZOat7PbvbLdn4+5uKQhtMbrsLmpIXponEm3mV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8321
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

Am 29.03.24 um 15:57 schrieb Thomas Hellström:
> To be able to handle list unlocking while traversing the LRU
> list, we want the iterators not only to point to the next
> position of the list traversal, but to insert themselves as
> list nodes at that point to work around the fact that the
> next node might otherwise disappear from the list while
> the iterator is pointing to it.
>
> These list nodes need to be easily distinguishable from other
> list nodes so that others traversing the list can skip
> over them.
>
> So declare a struct ttm_lru_item, with a struct list_head member
> and a type enum. This will slightly increase the size of a
> struct ttm_resource.
>
> v2:
> - Update enum ttm_lru_item_type documentation.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_device.c   | 13 ++++--
>   drivers/gpu/drm/ttm/ttm_resource.c | 70 ++++++++++++++++++++++--------
>   include/drm/ttm/ttm_resource.h     | 51 +++++++++++++++++++++-
>   3 files changed, 110 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 76027960054f..f27406e851e5 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -270,17 +270,22 @@ EXPORT_SYMBOL(ttm_device_fini);
>   static void ttm_device_clear_lru_dma_mappings(struct ttm_device *bdev,
>   					      struct list_head *list)
>   {
> -	struct ttm_resource *res;
> +	struct ttm_lru_item *lru;
>   
>   	spin_lock(&bdev->lru_lock);
> -	while ((res = list_first_entry_or_null(list, typeof(*res), lru))) {
> -		struct ttm_buffer_object *bo = res->bo;
> +	while ((lru = list_first_entry_or_null(list, typeof(*lru), link))) {
> +		struct ttm_buffer_object *bo;
> +
> +		if (!ttm_lru_item_is_res(lru))
> +			continue;

We should probably define some ttm_lru_for_each_res() and 
ttm_lru_for_each_res_safe() to iterate over the LRU and abstract the 
whole thing much better.



> +
> +		bo = ttm_lru_item_to_res(lru)->bo;
>   
>   		/* Take ref against racing releases once lru_lock is unlocked */
>   		if (!ttm_bo_get_unless_zero(bo))
>   			continue;
>   
> -		list_del_init(&res->lru);
> +		list_del_init(&bo->resource->lru.link);
>   		spin_unlock(&bdev->lru_lock);
>   
>   		if (bo->ttm)
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index be8d286513f9..7aa5ca5c0e33 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -69,8 +69,8 @@ void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
>   			dma_resv_assert_held(pos->last->bo->base.resv);
>   
>   			man = ttm_manager_type(pos->first->bo->bdev, i);
> -			list_bulk_move_tail(&man->lru[j], &pos->first->lru,
> -					    &pos->last->lru);
> +			list_bulk_move_tail(&man->lru[j], &pos->first->lru.link,
> +					    &pos->last->lru.link);
>   		}
>   	}
>   }
> @@ -83,14 +83,38 @@ ttm_lru_bulk_move_pos(struct ttm_lru_bulk_move *bulk, struct ttm_resource *res)
>   	return &bulk->pos[res->mem_type][res->bo->priority];
>   }
>   
> +/* Return the previous resource on the list (skip over non-resource list items) */
> +static struct ttm_resource *ttm_lru_prev_res(struct ttm_resource *cur)
> +{
> +	struct ttm_lru_item *lru = &cur->lru;
> +
> +	do {
> +		lru = list_prev_entry(lru, link);
> +	} while (!ttm_lru_item_is_res(lru));
> +
> +	return ttm_lru_item_to_res(lru);
> +}
> +
> +/* Return the next resource on the list (skip over non-resource list items) */
> +static struct ttm_resource *ttm_lru_next_res(struct ttm_resource *cur)
> +{
> +	struct ttm_lru_item *lru = &cur->lru;
> +
> +	do {
> +		lru = list_next_entry(lru, link);
> +	} while (!ttm_lru_item_is_res(lru));
> +
> +	return ttm_lru_item_to_res(lru);
> +}
> +
>   /* Move the resource to the tail of the bulk move range */
>   static void ttm_lru_bulk_move_pos_tail(struct ttm_lru_bulk_move_pos *pos,
>   				       struct ttm_resource *res)
>   {
>   	if (pos->last != res) {
>   		if (pos->first == res)
> -			pos->first = list_next_entry(res, lru);
> -		list_move(&res->lru, &pos->last->lru);
> +			pos->first = ttm_lru_next_res(res);
> +		list_move(&res->lru.link, &pos->last->lru.link);
>   		pos->last = res;
>   	}
>   }
> @@ -121,11 +145,11 @@ static void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
>   		pos->first = NULL;
>   		pos->last = NULL;
>   	} else if (pos->first == res) {
> -		pos->first = list_next_entry(res, lru);
> +		pos->first = ttm_lru_next_res(res);
>   	} else if (pos->last == res) {
> -		pos->last = list_prev_entry(res, lru);
> +		pos->last = ttm_lru_prev_res(res);
>   	} else {
> -		list_move(&res->lru, &pos->last->lru);
> +		list_move(&res->lru.link, &pos->last->lru.link);
>   	}
>   }
>   
> @@ -154,7 +178,7 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
>   	lockdep_assert_held(&bo->bdev->lru_lock);
>   
>   	if (bo->pin_count) {
> -		list_move_tail(&res->lru, &bdev->pinned);
> +		list_move_tail(&res->lru.link, &bdev->pinned);
>   
>   	} else	if (bo->bulk_move) {
>   		struct ttm_lru_bulk_move_pos *pos =
> @@ -165,7 +189,7 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
>   		struct ttm_resource_manager *man;
>   
>   		man = ttm_manager_type(bdev, res->mem_type);
> -		list_move_tail(&res->lru, &man->lru[bo->priority]);
> +		list_move_tail(&res->lru.link, &man->lru[bo->priority]);
>   	}
>   }
>   
> @@ -196,9 +220,9 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>   	man = ttm_manager_type(bo->bdev, place->mem_type);
>   	spin_lock(&bo->bdev->lru_lock);
>   	if (bo->pin_count)
> -		list_add_tail(&res->lru, &bo->bdev->pinned);
> +		list_add_tail(&res->lru.link, &bo->bdev->pinned);
>   	else
> -		list_add_tail(&res->lru, &man->lru[bo->priority]);
> +		list_add_tail(&res->lru.link, &man->lru[bo->priority]);
>   	man->usage += res->size;
>   	spin_unlock(&bo->bdev->lru_lock);
>   }
> @@ -220,7 +244,7 @@ void ttm_resource_fini(struct ttm_resource_manager *man,
>   	struct ttm_device *bdev = man->bdev;
>   
>   	spin_lock(&bdev->lru_lock);
> -	list_del_init(&res->lru);
> +	list_del_init(&res->lru.link);
>   	man->usage -= res->size;
>   	spin_unlock(&bdev->lru_lock);
>   }
> @@ -471,14 +495,16 @@ struct ttm_resource *
>   ttm_resource_manager_first(struct ttm_resource_manager *man,
>   			   struct ttm_resource_cursor *cursor)
>   {
> -	struct ttm_resource *res;
> +	struct ttm_lru_item *lru;
>   
>   	lockdep_assert_held(&man->bdev->lru_lock);
>   
>   	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
>   	     ++cursor->priority)
> -		list_for_each_entry(res, &man->lru[cursor->priority], lru)
> -			return res;
> +		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
> +			if (ttm_lru_item_is_res(lru))
> +				return ttm_lru_item_to_res(lru);
> +		}
>   
>   	return NULL;
>   }
> @@ -497,15 +523,21 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
>   			  struct ttm_resource_cursor *cursor,
>   			  struct ttm_resource *res)
>   {
> +	struct ttm_lru_item *lru = &res->lru;
> +
>   	lockdep_assert_held(&man->bdev->lru_lock);
>   
> -	list_for_each_entry_continue(res, &man->lru[cursor->priority], lru)
> -		return res;
> +	list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
> +		if (ttm_lru_item_is_res(lru))
> +			return ttm_lru_item_to_res(lru);
> +	}
>   
>   	for (++cursor->priority; cursor->priority < TTM_MAX_BO_PRIORITY;
>   	     ++cursor->priority)
> -		list_for_each_entry(res, &man->lru[cursor->priority], lru)
> -			return res;
> +		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
> +			if (ttm_lru_item_is_res(lru))
> +				ttm_lru_item_to_res(lru);
> +		}
>   
>   	return NULL;
>   }
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 69769355139f..4babc4ff10b0 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -49,6 +49,43 @@ struct io_mapping;
>   struct sg_table;
>   struct scatterlist;
>   
> +/**
> + * enum ttm_lru_item_type - enumerate ttm_lru_item subclasses
> + */
> +enum ttm_lru_item_type {
> +	/** @TTM_LRU_RESOURCE: The resource subclass */
> +	TTM_LRU_RESOURCE,
> +	/** @TTM_LRU_HITCH: The iterator hitch subclass */
> +	TTM_LRU_HITCH

I'm really wondering we we can't use a special value for mem_type for 
the iterator hitch instead.

Regards,
Christian.

> +};
> +
> +/**
> + * struct ttm_lru_item - The TTM lru list node base class
> + * @link: The list link
> + * @type: The subclass type
> + */
> +struct ttm_lru_item {
> +	struct list_head link;
> +	enum ttm_lru_item_type type;
> +};
> +
> +/**
> + * ttm_lru_item_init() - initialize a struct ttm_lru_item
> + * @item: The item to initialize
> + * @type: The subclass type
> + */
> +static inline void ttm_lru_item_init(struct ttm_lru_item *item,
> +				     enum ttm_lru_item_type type)
> +{
> +	item->type = type;
> +	INIT_LIST_HEAD(&item->link);
> +}
> +
> +static inline bool ttm_lru_item_is_res(const struct ttm_lru_item *item)
> +{
> +	return item->type == TTM_LRU_RESOURCE;
> +}
> +
>   struct ttm_resource_manager_func {
>   	/**
>   	 * struct ttm_resource_manager_func member alloc
> @@ -217,9 +254,21 @@ struct ttm_resource {
>   	/**
>   	 * @lru: Least recently used list, see &ttm_resource_manager.lru
>   	 */
> -	struct list_head lru;
> +	struct ttm_lru_item lru;
>   };
>   
> +/**
> + * ttm_lru_item_to_res() - Downcast a struct ttm_lru_item to a struct ttm_resource
> + * @item: The struct ttm_lru_item to downcast
> + *
> + * Return: Pointer to the embedding struct ttm_resource
> + */
> +static inline struct ttm_resource *
> +ttm_lru_item_to_res(struct ttm_lru_item *item)
> +{
> +	return container_of(item, struct ttm_resource, lru);
> +}
> +
>   /**
>    * struct ttm_resource_cursor
>    *

