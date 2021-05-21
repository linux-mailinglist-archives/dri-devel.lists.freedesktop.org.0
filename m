Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECA138C1A4
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 10:21:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EF96E4A6;
	Fri, 21 May 2021 08:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 830916E4A1;
 Fri, 21 May 2021 08:21:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hPlVj8Vhh9e6B3NAa4V6IIfn6VyUIYPswXb0ZK5zWl2BCV75i+XjgNJ8KgB8EnUwyO8wzuWubPaDPga5EamSc5gIIlAH/2CyUqZ1dZB642SBVp0L8vT4ooSlqA3h/SP782L1fG7mUlMU6jQ7WwCPlUttZzgFHJTMELQ7sxZzrPGwPunKSfK8ibGbFm70TPCEat2uE2jxfh/RXbQVp7tKuylTdgZEeIba6zcKKfDa+yIp0N37BbzWsqMoG460JmB/SESXAG+yyGGuPpdDw/Y9/TLZ0a+uGNdSM7cP7iMTbNUsAEMXtPUmuza9lJG6HVYlNR0hWaB6irQwvS9ZkI6ucA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zuap5YuEX8p6KLx8zF3qo/XKeKRdYr1EcnvVPrSvZHI=;
 b=KRTGkGDPm7W+5rD8BMsMXVOgvCJy6O8fDrVat0C93E1LK+ZCzKSalFGzWD6aiyVEV3hREX5/pFRnUpcvgpcQJxUnRxMe77hm7GtlAyUXYQFiQSHaesfbTYEAYodmooSnn0xJggCimXIU30++S3MTEHcKRMYiB13LOWl+DS3QuOpQb53l2D3f6iajB7L9FfLuV+aa+eNKD6r8pp4PXzYQM3ZP5x4V3Y8l3J1NPNJb1hBTndjmPnM4BSgHxoFsa482fTMY9imqQky86qdW/TmMXpDjDlHE/T3MESeboSNHHJPc8CZj2GXmbBO/ZX2xDDPPNfVig7EpWLnTaw67RLi2+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zuap5YuEX8p6KLx8zF3qo/XKeKRdYr1EcnvVPrSvZHI=;
 b=fKetgOvcylmIJgDZWDvS61O5dX9/DhkNG0WLuQ6OJ51WDeGUkpPEAYsHVvQ1QONwLjGtpph9eMbvNd/Z8HaQoqM4fEvS/g+pRdw/F/lcSYE0+wBRaBdy0+Us7aX+S6yGm5shxIja3CZ4/2/2wLp840RR/2ba4Hh9tFVciFfKHLY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3679.namprd12.prod.outlook.com (2603:10b6:208:159::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Fri, 21 May
 2021 08:21:24 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.023; Fri, 21 May 2021
 08:21:24 +0000
Subject: Re: [RFC PATCH 4/5] drm/ttm: Document and optimize
 ttm_bo_pipeline_gutting()
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210520150947.803891-1-thomas.hellstrom@linux.intel.com>
 <20210520150947.803891-5-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <96dd844a-6ef5-7502-7bb8-22ec21b9c15b@amd.com>
Date: Fri, 21 May 2021 10:21:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210520150947.803891-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d]
X-ClientProxiedBy: PR3PR09CA0023.eurprd09.prod.outlook.com
 (2603:10a6:102:b7::28) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d]
 (2a02:908:1252:fb60:b48f:ff97:fb4c:5b1d) by
 PR3PR09CA0023.eurprd09.prod.outlook.com (2603:10a6:102:b7::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4150.23 via Frontend Transport; Fri, 21 May 2021 08:21:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: af817b6b-8792-41aa-277b-08d91c316be5
X-MS-TrafficTypeDiagnostic: MN2PR12MB3679:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3679609BC2C148EA2CF65D3883299@MN2PR12MB3679.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uy5BQRvqtx4QNHV9l4XQd2AzJR1Ydxypkn+ZD7MPX7uP+KwXaLOUOSB9y/w9w2puwTJ+eJYuj82MpRu7frEwJL9xgvZU8WAPf+yaZwa0bY9yqyNmuHXNvKWOhwWijvbNPE3ARweqpCz9fMWmYGth3Vn7o41KMleOKP3tFzmV3ec5Ls1amMeTIfCz2pdN8pGGfA4+4qpafaiFjC1kkNetf4b0xLylp0beOByY5+nQ+0x77yMJ2UME4KcoKi4wL8ilCkTeKYKAuJNQcTnsWPicrBRIzUTij82m4WsAhH0IfWBbyS1+0J3tW2qhy+ngavfe/KRlROUVlX2aw94RHFzGyWu/Ywse6WkxXmKcXnepEue+1C2+1LMubE2hMrIEEPgF1pMap1SVrZExhDiD0BWQPazJphFdXAPRtPjp1h/TI3Rzn6v6ILD6OHp3MxsFhUXrPUioSclRUB7q8BnNbd9/ZQpXU9u89MaFX456VFldPrlhYeKzBoNqlHE0hTgvVnFUg51oqVkXOO/wXqFPwtmPqZFQn8TPPgYTJNCrrRRGrXmaoGL7kLWKSUtDEJdHyYHT0t6OYq4T/dzjbbnsT93lHUvr8TufrMI3mzX8WTSlyITMGWdIevKFJ9Q811cmRD5CKaR+Q46gqlllE2F3tymDnISEks9l3vLHR5IhULqwutPwy1V3F5zD59hPSVoNqP0b
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(366004)(136003)(396003)(346002)(8936002)(52116002)(316002)(66946007)(38100700002)(31686004)(36756003)(2906002)(8676002)(31696002)(6486002)(16526019)(5660300002)(83380400001)(478600001)(6666004)(66556008)(66476007)(66574015)(186003)(86362001)(2616005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?ME9OWmJGUUJwZTh6czlNQ2o2TmJPelVaYlJ3ek5SSkNqY1dNUWNiL2lZRzZ3?=
 =?utf-8?B?ZDVFamRuYjJxaitUeU9nNE1ZRExrd1hjYllpVTV2UytHbU9aZVRJa09hQ3hJ?=
 =?utf-8?B?eXBsTWsvZDFXckhONFhDS01NSVQzTmtDK0hMdklBdFFDdkRmd2JWV0pCZWhX?=
 =?utf-8?B?NDR0dStFcGtFRlE4WkFxbElhMlNiRFp0L2VnelFoWS9QZmM5bGNmbTZvL3Rk?=
 =?utf-8?B?VzJuajkxaDNrV0Q4Rk11eGkxYi9zeVZSd3lUZktrK0ErYzhlNis5MUN5R0Zo?=
 =?utf-8?B?c2NmL1I2VTFDU3p1UVdNNm5tOHV5VzdzNUVUczBrdS9xM2tXZm1SVUJDTXUz?=
 =?utf-8?B?bHRxVitERXc3UXlBd1BLZXk1RDBZQTkwM0NFODJacW5ZbERnM0FVTGJIRDYz?=
 =?utf-8?B?cnBTUVJEQmFZUVNHb01LUndEVFVlV212QlF5TGh1YlI1ZlIycTFhaU1ibmM0?=
 =?utf-8?B?OTFEcm5ZR1UxQU4rQUVuUUlPNkdSTUl5SThzK2I3NXlkMEJWc0l6UTZVY0du?=
 =?utf-8?B?RllScGxhVGdMaXBKUFlEeGZjU1JMVmhVTHk1TldIQzkweXFaU1JtNjhOam5x?=
 =?utf-8?B?Q0tQQUdKbUtoaWVYYWNBTFhkMUV6T25CM3hGT3NtNWNaNmxrcU1nTDRpbk9E?=
 =?utf-8?B?WmVkbk1yakpoa0ZnSU5WQk40UUppVWQ4cWw3YWYxRTREYm1QVTl5dTBRNzc3?=
 =?utf-8?B?Umpwa2pwNi9tWFBnNkRMYks0TGJyNkFVSE9OWjVSZDdqV1IwLzJVenV6TDVL?=
 =?utf-8?B?SnVkMmZxa0Nvem9hMzJzUUJ1THkrWW5wcWJEczZOTENXMlFxR1dqT2xIVUNJ?=
 =?utf-8?B?VzhYdGN4M1JpZ3ZqNDFYTXVpWEI5ZUZBZ0w5R3dsdDhsSWFVWlY4RkwzSXRY?=
 =?utf-8?B?NXBKQ2N6OHVxWHYrSHV3SXRFTk5oSEJpUkRVSDVaVWNiR2V6Q0Evak5BTWNH?=
 =?utf-8?B?bzJFRWx1bysxWk9XelBFWkpQWGNZWkxoNU10ODF6TGlLMU56cWZnSk1VRlhn?=
 =?utf-8?B?N0F3TjRwVW9zbXFjb04vdVo4QTNHZG1WN3c0VHFHSktzalpCWVJBb3NNOHFx?=
 =?utf-8?B?ejBncUNtM0o4TFBpNFc3MVdXOVRrKzlMblV2VGpJTGFBWnA5Y253VlhZejZw?=
 =?utf-8?B?MnFBVHZOcWlUYTFRak1hVVhIWWlYY0ppTjFFeFBzYjdJK1psNHhPZFFJWTMr?=
 =?utf-8?B?MGtkem1lNFpRSG5TYUQ3OWR4U3ozREVKSHN4NVBQUEx2RjJIQnVtd01IUHhy?=
 =?utf-8?B?UEpCckY0bTY5VTNrTDdJbXo3QllydmdtVTlsUDV2aFFCcHBMSU5DMTN5bjgy?=
 =?utf-8?B?b3FiK3NLMU5Ea0FsbVZJQzlEM2tjeGIyb05UVlhjMVlvSzdKYXc2MGdXbXJM?=
 =?utf-8?B?SHU4a3hVSlJ3ZE96Vm4vMEhEeURLNHZQSXlMam9VOTJMQWJtQU5UZlZwMks3?=
 =?utf-8?B?VGRNakFqY0JMLzIzWlJ0eFZQWkEwckdRQ2ZVWEhKRFV6YjNjOE9qdnp2Ykpn?=
 =?utf-8?B?Z1d6QmZ4S0pTU1YwcUEvSmovMjlFbERSWGpCQVYrREFxbVR5QXFRcm94U1lT?=
 =?utf-8?B?dGh0OWxLTFhBOTVVNytwU0pRUzlKaXZ1QTluME1MS05FK3RDWkhQd3dWUXBj?=
 =?utf-8?B?TmdPYUJxZFJWVWo0R2VmemhhbkgxYmlmWFgySzRGcU9mcitNbnRkT3h2eUxu?=
 =?utf-8?B?cE0zOWpuTTRHd0lSd3VQN0MvcURKWmtqbUVobSs4ZU9FL1hLeEZVdXp1R1ZF?=
 =?utf-8?B?b050aHVCZGxGNGxPWXk1Znh5QnZadVRvNmxSZjdHOWF6akVKYkF6enJEeWsz?=
 =?utf-8?B?eFdDV0VvTHVXNHFrdWI1alBtSWRjUEUzYnRITmE5eG02T3lUQTRHOXM5WWhJ?=
 =?utf-8?Q?UAG/+WjlRpQXY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af817b6b-8792-41aa-277b-08d91c316be5
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2021 08:21:24.0849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VDBubCyuPWqlJ52vODBsF+a9JRRAwcv5h7whYSkXY4Ah9rQ/hEWcbSKa8topafQJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3679
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

Am 20.05.21 um 17:09 schrieb Thomas Hellström:
> If the bo is idle when calling ttm_bo_pipeline_gutting(), we unnecessarily
> create a ghost object and push it out to delayed destroy.
> Fix this by adding a path for idle, and document the function.
>
> Also avoid having the bo end up in a bad state vulnerable to user-space
> triggered kernel BUGs if the call to ttm_tt_create() fails.
>
> Finally reuse ttm_bo_pipeline_gutting() in ttm_bo_evict().
>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c      | 20 +++++-----
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 63 ++++++++++++++++++++++++-------
>   drivers/gpu/drm/ttm/ttm_tt.c      |  5 +++
>   include/drm/ttm/ttm_tt.h          | 10 +++++
>   4 files changed, 75 insertions(+), 23 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index ca1b098b6a56..a8fa3375b8aa 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -501,10 +501,15 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>   	bdev->funcs->evict_flags(bo, &placement);
>   
>   	if (!placement.num_placement && !placement.num_busy_placement) {
> -		ttm_bo_wait(bo, false, false);
> +		ret = ttm_bo_wait(bo, true, false);
> +		if (ret)
> +			return ret;
>   
> -		ttm_bo_cleanup_memtype_use(bo);
> -		return ttm_tt_create(bo, false);
> +		/*
> +		 * Since we've already synced, this frees backing store
> +		 * immediately.
> +		 */
> +		return ttm_bo_pipeline_gutting(bo);

Yeah, we tried to avoid pipeline_gutting here because of eviction. But I 
think when you wait before that should work.

>   	}
>   
>   	ret = ttm_bo_mem_space(bo, &placement, &evict_mem, ctx);
> @@ -974,13 +979,8 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
>   	/*
>   	 * Remove the backing store if no placement is given.
>   	 */
> -	if (!placement->num_placement && !placement->num_busy_placement) {
> -		ret = ttm_bo_pipeline_gutting(bo);
> -		if (ret)
> -			return ret;
> -
> -		return ttm_tt_create(bo, false);
> -	}
> +	if (!placement->num_placement && !placement->num_busy_placement)
> +		return ttm_bo_pipeline_gutting(bo);
>   
>   	/*
>   	 * Check whether we need to move buffer.
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 919ee03f7eb3..1860e2e7563f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -479,7 +479,8 @@ static void ttm_transfered_destroy(struct ttm_buffer_object *bo)
>    */
>   
>   static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
> -				      struct ttm_buffer_object **new_obj)
> +				      struct ttm_buffer_object **new_obj,
> +				      bool realloc_tt)
>   {
>   	struct ttm_transfer_obj *fbo;
>   	int ret;
> @@ -493,6 +494,17 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>   	ttm_bo_get(bo);
>   	fbo->bo = bo;
>   
> +	if (realloc_tt) {
> +		bo->ttm = NULL;
> +		ret = ttm_tt_create(bo, true);
> +		if (ret) {
> +			bo->ttm = fbo->base.ttm;
> +			kfree(fbo);
> +			ttm_bo_put(bo);
> +			return ret;
> +		}
> +	}
> +

Can't we keep that logic in the caller? I think that would be cleaner.

>   	/**
>   	 * Fix up members that we shouldn't copy directly:
>   	 * TODO: Explicit member copy would probably be better here.
> @@ -763,7 +775,7 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
>   	dma_fence_put(bo->moving);
>   	bo->moving = dma_fence_get(fence);
>   
> -	ret = ttm_buffer_object_transfer(bo, &ghost_obj);
> +	ret = ttm_buffer_object_transfer(bo, &ghost_obj, false);
>   	if (ret)
>   		return ret;
>   
> @@ -836,26 +848,51 @@ int ttm_bo_move_accel_cleanup(struct ttm_buffer_object *bo,
>   }
>   EXPORT_SYMBOL(ttm_bo_move_accel_cleanup);
>   
> +/**
> + * ttm_bo_pipeline_gutting - purge the contents of a bo
> + * @bo: The buffer object
> + *
> + * Purge the contents of a bo, async if the bo is not idle.
> + * After a successful call, the bo is left unpopulated in
> + * system placement. The function may wait uninterruptible
> + * for idle on OOM.
> + *
> + * Return: 0 if successful, negative error code on failure.
> + */
>   int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
>   {
>   	static const struct ttm_place sys_mem = { .mem_type = TTM_PL_SYSTEM };
>   	struct ttm_buffer_object *ghost;
>   	int ret;
>   
> -	ret = ttm_buffer_object_transfer(bo, &ghost);
> -	if (ret)
> -		return ret;
> +	/* If already idle, no need for ghost object dance. */
> +	ret = ttm_bo_wait(bo, false, true);
> +	if (ret == -EBUSY) {
> +		ret = ttm_buffer_object_transfer(bo, &ghost, true);
> +		if (ret)
> +			return ret;

When this is a shortcout to avoid work we should rather use the inverse 
notation.

In other words something like that:

if (ret != -EBUSY) {
     ttm_resource_free(bo, &bo->mem);
     ttm_resource_alloc(bo, &sys_mem, &bo->mem);
     ttm_tt_create()...
     return ret;
}

>   
> -	ret = dma_resv_copy_fences(&ghost->base._resv, bo->base.resv);
> -	/* Last resort, wait for the BO to be idle when we are OOM */
> -	if (ret)
> -		ttm_bo_wait(bo, false, false);
> +		ret = dma_resv_copy_fences(&ghost->base._resv, bo->base.resv);
> +		/* Last resort, wait for the BO to be idle when we are OOM */
> +		if (ret)
> +			ttm_bo_wait(bo, false, false);
>   
> -	ttm_resource_alloc(bo, &sys_mem, &bo->mem);
> -	bo->ttm = NULL;
> +		dma_resv_unlock(&ghost->base._resv);
> +		ttm_bo_put(ghost);
> +	} else {
> +		if (!bo->ttm) {
> +			ret = ttm_tt_create(bo, true);
> +			if (ret)
> +				return ret;
> +		} else {
> +			ttm_tt_unpopulate(bo->bdev, bo->ttm);
> +			if (bo->type == ttm_bo_type_device)
> +				ttm_tt_mark_for_clear(bo->ttm);

That's not legal, you can't unpopulate it when the BO is busy.

Instead the TT object must be destroyed with the ghost and a new one 
created.

Christian.

> +		}
> +		ttm_resource_free(bo, &bo->mem);
> +	}
>   
> -	dma_resv_unlock(&ghost->base._resv);
> -	ttm_bo_put(ghost);
> +	ttm_resource_alloc(bo, &sys_mem, &bo->mem);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 539e0232cb3b..0b1053e93db2 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -134,6 +134,11 @@ void ttm_tt_destroy_common(struct ttm_device *bdev, struct ttm_tt *ttm)
>   }
>   EXPORT_SYMBOL(ttm_tt_destroy_common);
>   
> +void ttm_tt_mark_for_clear(struct ttm_tt *ttm)
> +{
> +	ttm->page_flags |= TTM_PAGE_FLAG_ZERO_ALLOC;
> +}
> +
>   void ttm_tt_destroy(struct ttm_device *bdev, struct ttm_tt *ttm)
>   {
>   	bdev->funcs->ttm_tt_destroy(bdev, ttm);
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 134d09ef7766..91552c83ac79 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -157,6 +157,16 @@ int ttm_tt_populate(struct ttm_device *bdev, struct ttm_tt *ttm, struct ttm_oper
>    */
>   void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm);
>   
> +/**
> + * ttm_tt_mark_for_clear - Mark pages for clearing on populate.
> + *
> + * @ttm: Pointer to the ttm_tt structure
> + *
> + * Marks pages for clearing so that the next time the page vector is
> + * populated, the pages will be cleared.
> + */
> +void ttm_tt_mark_for_clear(struct ttm_tt *ttm);
> +
>   void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages);
>   
>   #if IS_ENABLED(CONFIG_AGP)

