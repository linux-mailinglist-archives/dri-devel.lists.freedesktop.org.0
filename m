Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD9E3F6FB3
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 08:41:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877BE6E154;
	Wed, 25 Aug 2021 06:40:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2057.outbound.protection.outlook.com [40.107.244.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 606DC6E154;
 Wed, 25 Aug 2021 06:40:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CQvSa6lcuY91iunTJVLiw0ji2P2/GQHGhvMSMdgk9d+CJzduMvkx8hL6/5tWBOCEaZe5VjkwERtoyqDtMK2rO1SbQJJGLuNcqCc+u8iFwZDcmuDDJifnFbj/DLDOGM6Oa8v4vuQvZwQg4ibze8AD5dtYNfgCob/8dLf4jqpK6Q7soB6xjbeVKraPTARmeUb56LXpGKhi6AQOMwgadL0eNnAx2k4Qk1ex799j4SBxIUEAVuffBHkJWoGg48/iKZbFGEex7klREdmn3XlCGG6bCWazH/pbM5h+dG0QspgSwLn2ZutMSo3Cp98s4Gf65unuUhuBwvI8xMQYdbaX+JscCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUejuFdIssLTM2oYV01olbCCz+xAn4P+wZnhqAwujnM=;
 b=gNrmeZGQJkKDqCvXdNLTEs/V2iW8FV7+5uHr5N/BudiL3NIQVtdSKLB+XCudq6OTWUX8deutbuN2lkLXfroMQJwNBE7lK5MteNDFdVJPDKEgq0WiiWfozonQ3xc9kw5hjIBTo/LY/+HtKGGPV/QU+UGOoS9cecCJ7LFNwRoo7Dn1PylVrQN+iIwhMo+T1R1DOxLWqqEI9L+NfwnlC8+4r50LIHxvoTw1YbZLo0d76XxOGFtrEfin06da2xvINugLB+k4DKnYyhT6hqXYGbsBKX08NbqjYgmt36fWEgwyqLd7tPXDkRwW8os7DwqExgB6p8/dMY8bLc5iRu2XY6BHRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUejuFdIssLTM2oYV01olbCCz+xAn4P+wZnhqAwujnM=;
 b=VEG/EJ7sNWHvHf+ZHH8KQO9F6iz7BaUDlqx+UOB92nX/U/2l6PaV4X6jFVQcR15ECRkscC3KRVrrFNjRKPivvskPtq9Ij3qn7mOadRJiH8fFcR5qm0ExW7eXDJwh2ImqLI7+8DW/vSVhGVYXhuhn2xdUebjaCqtO4RYiqPULhvo=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3680.namprd12.prod.outlook.com (2603:10b6:208:169::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Wed, 25 Aug
 2021 06:40:51 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4436.024; Wed, 25 Aug 2021
 06:40:51 +0000
Subject: Re: [PATCH 2/4] drm/ttm: Create pinned list
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: ckoenig.leichtzumerken@gmail.com
References: <20210824210120.49812-1-andrey.grodzovsky@amd.com>
 <20210824210120.49812-3-andrey.grodzovsky@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <f7db0442-398e-0e40-e640-80f435dd947b@amd.com>
Date: Wed, 25 Aug 2021 08:40:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210824210120.49812-3-andrey.grodzovsky@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P191CA0029.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:102:54::34) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.178.21] (91.14.161.181) by
 PR3P191CA0029.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:54::34) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Wed, 25 Aug 2021 06:40:50 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f817dcb-2987-427e-2c19-08d9679347fb
X-MS-TrafficTypeDiagnostic: MN2PR12MB3680:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB36803C9CF1D7342EBC7DE55283C69@MN2PR12MB3680.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W/xzZbXXgMgxXqr+KrMpvcJeZdyJU3EAslOgKfb7Fb2/wGJyER4D4RpClXmujsbFgWLXAMjL5m/bCCUtiYEkUMPJu2X3l/ShszY68N+Kcd6WH9vQtURFf5UB8xi2XiPH0ogDzpQe21KQ3FUTOUYxNrU+5sspX2u7WfyfI+6COOeywx9wqssJxb9G2aOm0Vbj0tm/dNJVPoe7pPym8WPRF60fTuKG4JQOxUuhJ8mn8c/g6wEBHkaWKLbwO0iJZfv/5BSCd/FcXMSZO2jrIP7ZSNKbXZkm/cmIEGMlFfHatHoVRERsBh0Ffo6QjUPFuq+KxDZ9Dp9DhJD28L4Sje0sxa2XwpJFr2eisAtYeXA4XnliP2cbjUTLvsC1mAyr0sh4MTvnHRhA9eDZ6jVaxqM7awkZMg9YLN0ER9bJeN9Th9i297LSao1WCYs+mgEVcxFTo5efDMrC1n3e0xJjQriUy11xeyOMD1EjUZ2x960S2RuRSRwwKYJow8DgHh0uFKzMXDT4consumGXbVyFpnk1QvYRGIa3XwbUdBa5Igrm+y0iuXSYGaRofKeyRFX6+W17V0/03nZ6xjQDW9prVCQhp+Q1PxwmjwslUa9L1DVTmQ27+Uq4IpFQBtmaX5rHz3FnntBI9f3ZVlQKXO5AKddPBaJ0zq7LgwVG9TBNnaMoptC0urMoPq4hZ8AyUHnG/WfwXVnOUcKZJ43gy+afo4BeGAYZDCtWERMDvH9lDslijOI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(956004)(8676002)(4326008)(36756003)(31696002)(2616005)(86362001)(38100700002)(83380400001)(508600001)(66574015)(26005)(8936002)(31686004)(6666004)(66556008)(66476007)(316002)(5660300002)(16576012)(186003)(6486002)(66946007)(2906002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVAzbGkxV2Z4eXFkUk9NYzNhVFRFOHpqdS8yaDNsNWNuRlEvekFOd3FlWW5D?=
 =?utf-8?B?S3Fwd1l1Rk96d04rcmdEb0dWUlZiNnltTEpZQTBnN3RHVXNjM3dNcU5rMzNG?=
 =?utf-8?B?Z1dMeUt6OFJaQlJQNVNHMFpXak9uZkQvbmJOV2NDTXJIdjZITlBINDJydmdo?=
 =?utf-8?B?ZnRURkNNQzlORjBpOWtuemo2Vi8zeFliM0lCbTAvcnQyNXFkaHIxczRmc1lN?=
 =?utf-8?B?aWhYNTFhTGszamNtN2pCSU0xdzBaTUdiU0FWejUxVjM3QmF0enFWWjJWREdE?=
 =?utf-8?B?eFhGZDNjQ2Rtc0N3anJCNWxJVTQ3cmo5djFEeW14UHRjenF6TjBrWG9iK0l1?=
 =?utf-8?B?dFhXajlzT3h6TlZoV1FhV0ZpZzdlUENPbXhWSG15NHJBSGNVWHJwWE04b0lU?=
 =?utf-8?B?b1RqYThuQ0h0TGNENU8yS0ZKazVSVU1IOGhIbzhGL29wb0lpSWk4UEpmRXlQ?=
 =?utf-8?B?azMzcU52M3d6NHE3aG5qRUQvQndTYWFHMDJUMFE5QzRBRnBGMU9qTXZnUk5V?=
 =?utf-8?B?aFZESHhBY3Brc3RLU09odlhqRXE1OWsxaTA4VG1iY3JRNHNSbzJyOFF3d3h3?=
 =?utf-8?B?cVdGQmdPa2pIanUwRVNucm10QS95THNtYmYzdkJmdzhYRkNCSkI4QXRyZm1X?=
 =?utf-8?B?NWU4VFVLZjBHWi9yUXRIWUZnWG5IbDQvL1ZXdEU0NWcxK0tyUXUyOExjS1Ry?=
 =?utf-8?B?NTc0TEdWaGwyN04yeTV1SU9JSmV5U21uVVpxNG11engwU3dyUVZZSHJ0ci9G?=
 =?utf-8?B?L1ZXM0RFRERQRmx3bjR4VkpZaTEyMEoyQ0daKzFwcjA2S0NlNFVhVURIWXZt?=
 =?utf-8?B?VUdOTTlKOS82cnkyK2JFY1pVWnZmZVN2bE5NaS9sRXk2WlZxb2t0cXRxNW10?=
 =?utf-8?B?MnJ1ZWcyVzJYeGc1OE83TkM5dmxKY1dTa0dlYUl1VmdVWkRGZERDWVR0MmNr?=
 =?utf-8?B?cEVaSzBBU0xlK3IzQmFMS0NLSUcrTENNRDhKM2pyak9BNjMvWTFVMW0wNTc4?=
 =?utf-8?B?OVR3ME5uNGlSamZWQjlxMEZvV2VHL2JKdHJYYnJtVUhoRkdSMVd6WGJkZTND?=
 =?utf-8?B?cjNmNHBzYUE3SnlOY0V0ZFJoV2FUQm40QnpiTWp1Sk9IUkhqaHVBSnFiWmha?=
 =?utf-8?B?RCs4SDF1SFBuTEJ3WU5XQWRTSHdYUm0raW1VOVdJYlRwQzBMRWVrc0N1enRW?=
 =?utf-8?B?T0hBdzZJYU5rSDdRcXRtck8vNjdXdmJhenpjc29WdVF0TWJ5Q2N6cWNMU3ZY?=
 =?utf-8?B?RzJkbSthanBmdDBaajRMdnhnMTBPVUIxR3U3TWphS2NRTWZJczV3QkNLaGhN?=
 =?utf-8?B?a2JEd2Y2OUVzWERLbXhVTnpLejdMSG4raXcwZnl4M1U2aDQ4NGJKZnBnc3dW?=
 =?utf-8?B?VlB3K3BPenhSMUNvWkdnb3kxYklGN3VDNTVteE0rakpwMVpMdDE1emV2MzZn?=
 =?utf-8?B?R1Z2Z3YwVWNNNEFTaVhuMmljcWxtREZrcXhEam1nYW1YbDl3YTlRai9OZjBs?=
 =?utf-8?B?MnFoTG1GblZNOTB1U3VyLzN4R0Z3Wkt2aTA0U20xeVQ2VjhBTHVVb2JNYUY2?=
 =?utf-8?B?eDJ3OXRrUEQzM3d0N2JHYUZHd09iSW9QeWg1cE5NOTdhdUNPSE5kL25jMUQx?=
 =?utf-8?B?VUZwZTNWWG9VTlpqYzBBd1o3NithcmRpSDNJbXoyNzhLbzhuREJYOG9IVVox?=
 =?utf-8?B?MDdCOEJKc25XQ2dCMHZHNWJtRkJaazBvcDhKTklyYkR6aE9TMFUzY0UyT0kv?=
 =?utf-8?Q?LSFS/awwFTzN98uTtnYXNsHB+qxtrR46ZxznG2H?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f817dcb-2987-427e-2c19-08d9679347fb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2021 06:40:51.6451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jABiqt8BFrJTysO3Oa+I+MX5LfBvFeztSjKcQkr3Zu5YjRwV83mlDTS1a8lcwWv+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3680
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

Am 24.08.21 um 23:01 schrieb Andrey Grodzovsky:
> This list will be used to capture all non VRAM BOs not
> on LRU so when device is hot unplugged we can iterate
> the list and unmap DMA mappings before device is removed.
>
> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Suggested-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c       | 24 +++++++++++++++++++++---
>   drivers/gpu/drm/ttm/ttm_resource.c |  1 +
>   include/drm/ttm/ttm_resource.h     |  1 +
>   3 files changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 1b950b45cf4b..84ba76ace58f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -69,16 +69,34 @@ static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
>   	}
>   }
>   
> -static void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
> +static void ttm_bo_del_from_lru_imp(struct ttm_buffer_object *bo, bool final)

I think we should rather inline the only user where we actually need to 
delete the BO from the LRU and then rename the function here to 
ttm_bo_move_to_pinned().

Apart from that looks good to me.

Regards,
Christian.

>   {
>   	struct ttm_device *bdev = bo->bdev;
> +	struct ttm_resource_manager *man = NULL;
>   
> -	list_del_init(&bo->lru);
> +	if (bo->resource)
> +		man = ttm_manager_type(bdev, bo->resource->mem_type);
> +
> +
> +	if (!final && man && man->use_tt)
> +		list_move_tail(&bo->lru, &man->pinned);
> +	else
> +		list_del_init(&bo->lru);
>   
>   	if (bdev->funcs->del_from_lru_notify)
>   		bdev->funcs->del_from_lru_notify(bo);
>   }
>   
> +static inline void ttm_bo_del_from_lru_final(struct ttm_buffer_object *bo)
> +{
> +	ttm_bo_del_from_lru_imp(bo, true);
> +}
> +
> +static inline void ttm_bo_del_from_lru(struct ttm_buffer_object *bo)
> +{
> +	ttm_bo_del_from_lru_imp(bo, false);
> +}
> +
>   static void ttm_bo_bulk_move_set_pos(struct ttm_lru_bulk_move_pos *pos,
>   				     struct ttm_buffer_object *bo)
>   {
> @@ -453,7 +471,7 @@ static void ttm_bo_release(struct kref *kref)
>   	}
>   
>   	spin_lock(&bo->bdev->lru_lock);
> -	ttm_bo_del_from_lru(bo);
> +	ttm_bo_del_from_lru_final(bo);
>   	list_del(&bo->ddestroy);
>   	spin_unlock(&bo->bdev->lru_lock);
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 2431717376e7..91165f77fe0e 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -85,6 +85,7 @@ void ttm_resource_manager_init(struct ttm_resource_manager *man,
>   
>   	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>   		INIT_LIST_HEAD(&man->lru[i]);
> +	INIT_LIST_HEAD(&man->pinned);
>   	man->move = NULL;
>   }
>   EXPORT_SYMBOL(ttm_resource_manager_init);
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 140b6b9a8bbe..1ec0d5ebb59f 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -130,6 +130,7 @@ struct ttm_resource_manager {
>   	 */
>   
>   	struct list_head lru[TTM_MAX_BO_PRIORITY];
> +	struct list_head pinned;
>   
>   	/*
>   	 * Protected by @move_lock.

