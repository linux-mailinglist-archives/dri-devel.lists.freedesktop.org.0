Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C6B8A7A18
	for <lists+dri-devel@lfdr.de>; Wed, 17 Apr 2024 03:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64DF610F45A;
	Wed, 17 Apr 2024 01:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lt+H0R1O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E1A10F43A;
 Wed, 17 Apr 2024 01:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713316541; x=1744852541;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=8E9jafzS07LRrUyaeQVhdXP3lpjBmPxX7cJ+3cDBBlI=;
 b=lt+H0R1OOc3VztpCwwBT+vADqNnUy9XLRwHkY0T9nLmBDn3EpzhtrTBk
 M8xW9XB5ZXVVy8WQdzmeXATWzx3YlZloRxotuU6Za7HA6sMLxl7QP2VVN
 X1QyFeCcjxzMTjGRFIPkPo8ogtdcyMf+MYhGYg9GhOGMqU4DhfS0ewF3H
 IgETECgVnxvTy7gOzfJsZo/k4NOKY+V3IguHDl0LdHtKEQlnpTXLSNdNW
 Snfcj493joLu4Cb5YjfsUocG7eSU+w8YSBUpUhu/ZKXYFGjo2cwE5W6JS
 s6vNOMQujdfNEx/I2JLz7XNoc109fD0np17xMYPhrJIDsEnRpSkqbeNTC Q==;
X-CSE-ConnectionGUID: gra+N97zRemwGqz5J+tESg==
X-CSE-MsgGUID: SPqHzAGmTnKwADUd1LCeSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="19349706"
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="19349706"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 18:15:40 -0700
X-CSE-ConnectionGUID: gpyHNjsUQtS60/EZukHj+g==
X-CSE-MsgGUID: zwo1UpAsTBCH2IE18pTQmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,207,1708416000"; d="scan'208";a="27008063"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 18:15:39 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 18:15:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 18:15:38 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 18:15:38 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.40) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 18:15:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuPRyq02rS+ycu8m+b7qsdTIl32KyQuPjrtV3jKpKROylSxBR+IAtAV9uNCF75oQtrF3LwUmGDk551Md+XUh9oIo7tTTxAb37ImqyhUFW/0kvTPG5P+VGBrmKTAi5p54AOsCXtBwqusXnzSmMAAV2jAOqknmq6CydZk3jVzemfK0yVXYR0TNV5wtk0qrgopphZT/8QN148uxs2hbOQvvLKmO4i0hxl24W8B0onDlnzjD0EOwPYwMu5V68DHi7cBoXc+W6xelMEb5NYsFCKRINls6mwRS+AtC4y+RPkYj8sSi/HW8GgI1bmf0VfJK0lroNa2miwrEmnzATd98aUFmYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RZ2kycdf0ELpRqllt67o6XGaog6Wkt/Ldiz2vpIgeA=;
 b=TDQ1mT8DdOY83e9v/BP5GnZ6J77hluPo4PYo5e4wuiZCgdB1QtdebwW+fO4cPlJ0zooOr5DTDIH5XWQmg1qpayNimtKgOx5CAhrp8dJVRO+A5EN2iUVo01CWVloTQ1ZELOOLvZBwYDB7OSp8nTNkJoc+lngeyGtMxvsF8NhlDO/VEwXpx3JoHuy/9slxcX1hIXBfiwQJDxu86uozsFwn1GX7B8F2EB9gI4VobTEA4ziG6ctBl6Xhv+j0XNVd+B/xVyPM5tUel99WIjUvGvwJM3A+7sagNxVx+GJDY65ZEMt+XetDhDkNjq+M6sGWcR0qvXXWWVzHo2SdbT0hg0U/gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by MN0PR11MB6086.namprd11.prod.outlook.com (2603:10b6:208:3ce::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.26; Wed, 17 Apr
 2024 01:15:36 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e7c:ccbc:a71c:6c15%5]) with mapi id 15.20.7472.027; Wed, 17 Apr 2024
 01:15:36 +0000
Date: Wed, 17 Apr 2024 01:15:30 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
CC: <intel-xe@lists.freedesktop.org>, Christian =?iso-8859-1?Q?K=F6nig?=
 <christian.koenig@amd.com>, Somalapuram Amaranath
 <Amaranath.Somalapuram@amd.com>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 1/9] drm/ttm: Allow TTM LRU list nodes of different
 types
Message-ID: <Zh8isq+3btgEJGTx@DUT025-TGLU.fm.intel.com>
References: <20240416100730.6666-1-thomas.hellstrom@linux.intel.com>
 <20240416100730.6666-2-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240416100730.6666-2-thomas.hellstrom@linux.intel.com>
X-ClientProxiedBy: SJ0PR05CA0156.namprd05.prod.outlook.com
 (2603:10b6:a03:339::11) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|MN0PR11MB6086:EE_
X-MS-Office365-Filtering-Correlation-Id: ba12ee68-fd33-487b-d5e5-08dc5e7be2ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jjCdWngFjuJT6DytR98nTa1xgGdh+Hz/yOpNCgkMjLEXTySjGOUq91+FZIQ0YV+K40ekA5N2VggJBYRm66R632aTSYVFIIku5ZJR9OxDYLZ1R5geEod4vAHNQ3N3HZNSPCmtwOEIh8l8EqcJdf2LEhwViVZC1/0aVCSf81NwpFMdhy5zQe5DMDtbWjwLDPXEC94fCeiuZpfEwiZLst7Y/6yQPZ6g/anuyXrs7541SwEWYMNKjTSg07svu6lQjzFaB3hW++N/lQJqEga7MVtaLQK0oy+rm+W3Fwg/eHD73rLtplgb7VnAeG1SwXuFIKcGnvmpaESli+7ygE1dya8CJM/czzaIHrOWSdkyZ8yhAArkqaxXdN5BpsgM+sv65I6xgumNuNJvCwfDL0h0DcAQvdUkf8vsXwu6aZUiqsEUyp1u/mg5eJa2cV/Ly6yyN7fbi4tMHig1+24byJF0lDKeYPusQA56/ZVkf/qnfpC9nwaz8dNHBU8i2YRh9WF3u489BM96MENB1TleKKASIyPwV0vpYVlUn0+FvjliFIPpAThryf1WugxudLGSrtxYnNg/EOldWyJOLQFIsNJ570bjBlVAloHZjmZY2Va3V0KqlGS3T+WxMFzHWfy2hEWiYbAlsp9H7ueOHhkISb3xzgtLYNQbVI+crzkIwKRyPgU3dog=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?Az3IYBqbNWoGrCdkeNRwwzq1/KUv4weYFoMMhMazVtuH3m24Og1RWqvVeC?=
 =?iso-8859-1?Q?75MRYB3dCQYjZewRbaFBfet9wVajs1wqYidMzp11x0tqD5z+Syq9IVm/PN?=
 =?iso-8859-1?Q?XMMINFl+R1qU1tOUGISYFDbow9m6eTyy2AoI0f0NczNxJb/HgPm+ROKX1t?=
 =?iso-8859-1?Q?1jISovxdkUMO2LNm97wgOFBdmGY6PnLd1r9vHDE7lm2d/TnFIPO6DqJ8fJ?=
 =?iso-8859-1?Q?MBe7BUMP/Pbu6l01/9MbiyDBbWFVy3GMLwvDiQgeNpm7JE3iSWxbBjb26P?=
 =?iso-8859-1?Q?bYlgF3FUTw0nmXgIopwdWlFE8roJiA92G8RDv2he8fxAczkK3OBYCmG9YN?=
 =?iso-8859-1?Q?SnIBHWKlXNeQqY++qOKdOcWPgLiQHY6mX+4Vm0guBXJo2n+m+s5lm+fNdW?=
 =?iso-8859-1?Q?1djbnZ8LkwdT12BOzat4vB/EmWFiaPgoLpL2vBMno4Li2u7peDqQseNOBg?=
 =?iso-8859-1?Q?Sj5CZJX4orvh0yas4FxAp2aZLnWbI9GP3BLAOMWFVnetvjBO9YRCtLCcIk?=
 =?iso-8859-1?Q?G7+9kz/iTjZ8p8oAy+GSq0EitE7ntNsPyPAA4Liz3KQ2CNN6/P0H77WoIX?=
 =?iso-8859-1?Q?fXO/Lqr4mi0Sovof4N0cZ06351CK5sVLGE/qj0NIFtzCOD8o3W96+mjY9k?=
 =?iso-8859-1?Q?9Q9yKU3R0+jRjHj+J25iBd9n68PoIJgXpG6NCzH2H5RSnAqbccUcAq0rjS?=
 =?iso-8859-1?Q?AGkKy4wlhWZM/cwhZXAfm13mi6rDG2vu0Y90nJ/LE5Nrx1cW8eikTtDzqn?=
 =?iso-8859-1?Q?mnkjwdoZRsp7hIXrZzCqya6GsFZgOs17oUO4ct1uZACotRY/fBZyaCD9VE?=
 =?iso-8859-1?Q?DZAUylHgcoY3W6+Y3qqeMFDwOTr9hZ+ALNkd5ppW5liyv7QG/viDfk6uDk?=
 =?iso-8859-1?Q?132aZX2fwrrMSgK8kIt/6ks01VkJe5lM+UUKT7pAQFHy0ZU2ZwQwVMdtgQ?=
 =?iso-8859-1?Q?eHnYvQW7Ah+krzCLBidp7cVXezTIc7GmV36kT5fCaz4nJaEb4YT0pC9rgs?=
 =?iso-8859-1?Q?eyKbCL1RYINVRAlU4zPHluFZ80iIGkLpK7e9ApseWh3GGgYlPmigQKPJ5Y?=
 =?iso-8859-1?Q?wchA2S3D1DcU+KdKEp74jTzrTtU8190K13PF9ZG0Pj6I31CizSrRFRcrX0?=
 =?iso-8859-1?Q?LgD1xalqHS5r8Y7qNRgQGuTjpvreAVbwllZnIHfNCTaGXpM09hLac4Juzv?=
 =?iso-8859-1?Q?PXZCris0d24T6DJ/Esc4Zsm00zdLIto3y2NaEn7FlUbLv1rtLHUMUiYLEy?=
 =?iso-8859-1?Q?zHjoEII4/dj10E4vygweU9e48Ry4MeF/kfF5xPbGOokOr9VLmnX54fY/AT?=
 =?iso-8859-1?Q?CSrZN11gqyLQs60gjchWd49XcENWeQdCPYfU3DvnsX9WcW9LbKrllh8B2Q?=
 =?iso-8859-1?Q?+xgS3cFmzIBWwwqh/H2FBFDmnJAcpfn9vx3iispJKnzS2j9fMMg2qKCNWY?=
 =?iso-8859-1?Q?X7kUD6sNAyXPsDejWEzb8m5w8umwD1XpAizcXesYxerCb7LwXdYHTbUzdV?=
 =?iso-8859-1?Q?lXRyB1Y2htTbMDyurYon5MbSxMJmojx0vuGwwBucUXhIkNqv3LwsMuo9EU?=
 =?iso-8859-1?Q?TTv1drexPLFbh69cEtaoyHOTC7P7M+ZkoukeE2m/h5xXxdq+X7bA5g1QNV?=
 =?iso-8859-1?Q?UGXhjuw8poCjY3rFgrKTJET/VZxFMMoQb40fP/9/oNXLb0F7fNUv4+vw?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ba12ee68-fd33-487b-d5e5-08dc5e7be2ca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2024 01:15:36.0142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k0MLkql4SsAZSrtdC4Zz1UrwDiZv/pFlkvuh06NyhBfSTJqheb60t2mO2x1W2oyDmC4a/5hGj4kIMKrVMGG6/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6086
X-OriginatorOrg: intel.com
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

On Tue, Apr 16, 2024 at 12:07:22PM +0200, Thomas Hellström wrote:
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
> Changes in previous series:
> - Update enum ttm_lru_item_type documentation.
> 

Patch itself makes sense to me. One style question (or maybe
suggestion?) below.

> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>  drivers/gpu/drm/ttm/ttm_device.c   | 13 ++++--
>  drivers/gpu/drm/ttm/ttm_resource.c | 70 ++++++++++++++++++++++--------
>  include/drm/ttm/ttm_resource.h     | 51 +++++++++++++++++++++-
>  3 files changed, 110 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 76027960054f..f27406e851e5 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -270,17 +270,22 @@ EXPORT_SYMBOL(ttm_device_fini);
>  static void ttm_device_clear_lru_dma_mappings(struct ttm_device *bdev,
>  					      struct list_head *list)
>  {
> -	struct ttm_resource *res;
> +	struct ttm_lru_item *lru;
>  
>  	spin_lock(&bdev->lru_lock);
> -	while ((res = list_first_entry_or_null(list, typeof(*res), lru))) {
> -		struct ttm_buffer_object *bo = res->bo;
> +	while ((lru = list_first_entry_or_null(list, typeof(*lru), link))) {
> +		struct ttm_buffer_object *bo;
> +
> +		if (!ttm_lru_item_is_res(lru))
> +			continue;
> +
> +		bo = ttm_lru_item_to_res(lru)->bo;
>  
>  		/* Take ref against racing releases once lru_lock is unlocked */
>  		if (!ttm_bo_get_unless_zero(bo))
>  			continue;
>  
> -		list_del_init(&res->lru);
> +		list_del_init(&bo->resource->lru.link);
>  		spin_unlock(&bdev->lru_lock);
>  
>  		if (bo->ttm)
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index be8d286513f9..7aa5ca5c0e33 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -69,8 +69,8 @@ void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
>  			dma_resv_assert_held(pos->last->bo->base.resv);
>  
>  			man = ttm_manager_type(pos->first->bo->bdev, i);
> -			list_bulk_move_tail(&man->lru[j], &pos->first->lru,
> -					    &pos->last->lru);
> +			list_bulk_move_tail(&man->lru[j], &pos->first->lru.link,
> +					    &pos->last->lru.link);
>  		}
>  	}
>  }
> @@ -83,14 +83,38 @@ ttm_lru_bulk_move_pos(struct ttm_lru_bulk_move *bulk, struct ttm_resource *res)
>  	return &bulk->pos[res->mem_type][res->bo->priority];
>  }
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
>  /* Move the resource to the tail of the bulk move range */
>  static void ttm_lru_bulk_move_pos_tail(struct ttm_lru_bulk_move_pos *pos,
>  				       struct ttm_resource *res)
>  {
>  	if (pos->last != res) {
>  		if (pos->first == res)
> -			pos->first = list_next_entry(res, lru);
> -		list_move(&res->lru, &pos->last->lru);
> +			pos->first = ttm_lru_next_res(res);
> +		list_move(&res->lru.link, &pos->last->lru.link);
>  		pos->last = res;
>  	}
>  }
> @@ -121,11 +145,11 @@ static void ttm_lru_bulk_move_del(struct ttm_lru_bulk_move *bulk,
>  		pos->first = NULL;
>  		pos->last = NULL;
>  	} else if (pos->first == res) {
> -		pos->first = list_next_entry(res, lru);
> +		pos->first = ttm_lru_next_res(res);
>  	} else if (pos->last == res) {
> -		pos->last = list_prev_entry(res, lru);
> +		pos->last = ttm_lru_prev_res(res);
>  	} else {
> -		list_move(&res->lru, &pos->last->lru);
> +		list_move(&res->lru.link, &pos->last->lru.link);
>  	}
>  }
>  
> @@ -154,7 +178,7 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
>  	lockdep_assert_held(&bo->bdev->lru_lock);
>  
>  	if (bo->pin_count) {
> -		list_move_tail(&res->lru, &bdev->pinned);
> +		list_move_tail(&res->lru.link, &bdev->pinned);
>  
>  	} else	if (bo->bulk_move) {
>  		struct ttm_lru_bulk_move_pos *pos =
> @@ -165,7 +189,7 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
>  		struct ttm_resource_manager *man;
>  
>  		man = ttm_manager_type(bdev, res->mem_type);
> -		list_move_tail(&res->lru, &man->lru[bo->priority]);
> +		list_move_tail(&res->lru.link, &man->lru[bo->priority]);
>  	}
>  }
>  
> @@ -196,9 +220,9 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>  	man = ttm_manager_type(bo->bdev, place->mem_type);
>  	spin_lock(&bo->bdev->lru_lock);
>  	if (bo->pin_count)
> -		list_add_tail(&res->lru, &bo->bdev->pinned);
> +		list_add_tail(&res->lru.link, &bo->bdev->pinned);
>  	else
> -		list_add_tail(&res->lru, &man->lru[bo->priority]);
> +		list_add_tail(&res->lru.link, &man->lru[bo->priority]);
>  	man->usage += res->size;
>  	spin_unlock(&bo->bdev->lru_lock);
>  }
> @@ -220,7 +244,7 @@ void ttm_resource_fini(struct ttm_resource_manager *man,
>  	struct ttm_device *bdev = man->bdev;
>  
>  	spin_lock(&bdev->lru_lock);
> -	list_del_init(&res->lru);
> +	list_del_init(&res->lru.link);
>  	man->usage -= res->size;
>  	spin_unlock(&bdev->lru_lock);
>  }
> @@ -471,14 +495,16 @@ struct ttm_resource *
>  ttm_resource_manager_first(struct ttm_resource_manager *man,
>  			   struct ttm_resource_cursor *cursor)
>  {
> -	struct ttm_resource *res;
> +	struct ttm_lru_item *lru;
>  
>  	lockdep_assert_held(&man->bdev->lru_lock);
>  
>  	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
>  	     ++cursor->priority)
> -		list_for_each_entry(res, &man->lru[cursor->priority], lru)
> -			return res;
> +		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
> +			if (ttm_lru_item_is_res(lru))
> +				return ttm_lru_item_to_res(lru);
> +		}
>  
>  	return NULL;
>  }
> @@ -497,15 +523,21 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
>  			  struct ttm_resource_cursor *cursor,
>  			  struct ttm_resource *res)
>  {
> +	struct ttm_lru_item *lru = &res->lru;
> +
>  	lockdep_assert_held(&man->bdev->lru_lock);
>  
> -	list_for_each_entry_continue(res, &man->lru[cursor->priority], lru)
> -		return res;
> +	list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
> +		if (ttm_lru_item_is_res(lru))
> +			return ttm_lru_item_to_res(lru);
> +	}
>  
>  	for (++cursor->priority; cursor->priority < TTM_MAX_BO_PRIORITY;
>  	     ++cursor->priority)
> -		list_for_each_entry(res, &man->lru[cursor->priority], lru)
> -			return res;
> +		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
> +			if (ttm_lru_item_is_res(lru))
> +				ttm_lru_item_to_res(lru);
> +		}
>  
>  	return NULL;
>  }
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 69769355139f..4babc4ff10b0 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -49,6 +49,43 @@ struct io_mapping;
>  struct sg_table;
>  struct scatterlist;
>  
> +/**
> + * enum ttm_lru_item_type - enumerate ttm_lru_item subclasses
> + */
> +enum ttm_lru_item_type {
> +	/** @TTM_LRU_RESOURCE: The resource subclass */
> +	TTM_LRU_RESOURCE,
> +	/** @TTM_LRU_HITCH: The iterator hitch subclass */
> +	TTM_LRU_HITCH
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
>  struct ttm_resource_manager_func {
>  	/**
>  	 * struct ttm_resource_manager_func member alloc
> @@ -217,9 +254,21 @@ struct ttm_resource {
>  	/**
>  	 * @lru: Least recently used list, see &ttm_resource_manager.lru
>  	 */
> -	struct list_head lru;
> +	struct ttm_lru_item lru;
>  };
>  
> +/**
> + * ttm_lru_item_to_res() - Downcast a struct ttm_lru_item to a struct ttm_resource
> + * @item: The struct ttm_lru_item to downcast
> + *
> + * Return: Pointer to the embedding struct ttm_resource
> + */
> +static inline struct ttm_resource *
> +ttm_lru_item_to_res(struct ttm_lru_item *item)

Pretty much everywhere in this series we have the following coding
pattern:

if (ttm_lru_item_is_res(item))
	do something with ttm_lru_item_to_res(item);

Would it make more sense to squash these functions together with only
ttm_lru_item_to_res which returns NULL if item is not TTM_LRU_RESOURCE?

The new pattern would be:

res = ttm_lru_item_is_res(item)
if (res)
	do something with res

What do you think?

Matt 

> +{
> +	return container_of(item, struct ttm_resource, lru);
> +}
> +
>  /**
>   * struct ttm_resource_cursor
>   *
> -- 
> 2.44.0
> 
