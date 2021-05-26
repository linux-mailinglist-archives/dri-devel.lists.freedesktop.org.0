Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F6B3918C5
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 15:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD0F26E4B1;
	Wed, 26 May 2021 13:26:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2085.outbound.protection.outlook.com [40.107.100.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AABDC6E4AB;
 Wed, 26 May 2021 13:26:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eTb0pb6cnQ/DGQZcxKwrpxglHT39oJlah7uy2HmRW/F1JG2vuRDP7qVfncvcwOTEv/C1EHA7KQCu8/ogllEMZF9Fyn45aQxbma8IulipnSHOd5IVzFOQim50X3182D97F4M3gmnTa0Hm1pleJvga/uagVxkNyAJdqXHJzzGugMZaVSXNQxksVKMMNtBqfh69NGggAuXaMBTMPXYRXI3AhE9iPYxTmoQ+UYvcMV2+AzRByjI1FOyzBJ1yDmjnOwScgr1d8nS06+gGTj41115zjfYUQIfVErTG81doEnKMQ8+h4ZNDWHdjKF1NppdMWt0Tu48BQgD9mcXiBV2ULQ9TNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Cq2kmEIsXOIRGQ9KGU4HgwfiiokI6o4UaaZN4uNxhU=;
 b=f84eMNJ5quzA1uPDfsC+c0mZfPcPpfgaboaGGj4ZuwnRSlebc+62z3Z2TqO3SC04tlN10Rah9S0mlnhNRCVuOsw9FADr0FR2Aav1K4SeGYNhuDq6KLKiK04VDL8vwsXuWGj212KZ1gQaVWPZp4twd0moYSRsm16kq2Ks/5nQfg4S6THobP3CZhlWCVzHsSeUxZv2M2kAvvM9E5UIJgSzqGotdcsTOR1yMQuXjCZlvXeqAE0BwKn7VDM6gnH7JEdug2v5GF5PXr6jFvC9JmseZdyLXPGJkndCHtwJ6OAsmWpWzDY0wQD1nxt7Oj32bwHgmmGntqPTilXCI8s62nCQyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Cq2kmEIsXOIRGQ9KGU4HgwfiiokI6o4UaaZN4uNxhU=;
 b=dadcFkzyv9+8D0AW1UsTg2I/MKfYkhM21vA7Evwq8BAbmEA3uJfdDoXLFtJ5Cxd4/xbtJqx5TYmv5MQqFgghmwOSbOsVJLhGveRfgd6WFHOp5OrtOk7Fq+KJonyXL5kgJGd2ZnyA67ueLedXgb7m4+p/JXZkh2YnaMwI2Pryi0w=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4389.namprd12.prod.outlook.com (2603:10b6:208:262::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Wed, 26 May
 2021 13:26:12 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4150.027; Wed, 26 May 2021
 13:26:12 +0000
Subject: Re: [PATCH v4 10/15] drm/ttm, drm/amdgpu: Allow the driver some
 control over swapping
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20210526113259.1661914-1-thomas.hellstrom@linux.intel.com>
 <20210526113259.1661914-11-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9f49eb8e-8ec5-cb24-0ce1-3e63272628e8@amd.com>
Date: Wed, 26 May 2021 15:26:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210526113259.1661914-11-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:1950:35e:cae9:5bed]
X-ClientProxiedBy: FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::9) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:1950:35e:cae9:5bed]
 (2a02:908:1252:fb60:1950:35e:cae9:5bed) by
 FR0P281CA0004.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:15::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.12 via Frontend Transport; Wed, 26 May 2021 13:26:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d144e534-5661-4503-070d-08d92049d497
X-MS-TrafficTypeDiagnostic: MN2PR12MB4389:
X-Microsoft-Antispam-PRVS: <MN2PR12MB43892996A3161EB35BF2039D83249@MN2PR12MB4389.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wdmoqGq93hNvDcWuVIOvuwr10e8c273yQULpduAglGbTnz4Uou5mXAMKGWd/3N2A3pbYr2ioU+MOTjIa0tRpxw9fEAx63J7wMUhs71Gl8it0WgmXuPTE8DloMVIZ/nzdTEjEM3JE+QomrJUALxmOdcRLWAao4TpV4YhWwS1K7Q/LnmN/ZL0xysTiweTcXUdKxowSv4XHglOjsqiyGkMcKJpiyG6/7DvkEBfAJ9DqkvL+chuym6kcMpggeWwp3l54NQVW9ozBaX25PL0+Vgv9MjRiRy0OOy5U79ESaa1E62Q96g0AwNMzoCrM0PYUqUm4o8c/rujUR+FMO2gfIjMp7WuoZXtZei5uS1b+OwKGXp1JshggoQ78/TPmabkl1EUyZe1AfxW4z97d7i+KyvfmPyczNFnCHEw0PgZ8ey4jqfa4eiBjrG/Y+2GuGTMnuClMCH+hIdQXw6Jpb4E/bmEbicqqyfIpA7xT0DwncjOf1iBRgai4R1W6FDNU1Bh7ZkIV9GGYj7mRlVJHlrPjf0f7SuZxMnTXsrS/UBldUJLr37Sj9pFylYhsYtcJl3srUO0eKNMSDDONvtkvZM2TkuxfZ+dS5hhPtK33Ye0KM0SeCoEvuBMQ/RDsl6aTX36krgLoHtvLpeADCuhiTGG8zR61eEG96vxuj0I5FlDUaNTNcz5rxK46ugHDOOXhNg4DsSOs
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(346002)(39860400002)(396003)(366004)(186003)(66476007)(66556008)(31686004)(478600001)(5660300002)(66946007)(36756003)(8936002)(4326008)(6486002)(16526019)(38100700002)(8676002)(2906002)(2616005)(66574015)(83380400001)(31696002)(52116002)(6666004)(316002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QTRDQ0NCUWk3ZVliZHNzQWUyclE3bUJnUDRCTzlienU0dGM1OEpoYk1wRmxo?=
 =?utf-8?B?SEZzK25LMWczVHV0TFFQaG4rb0haTWYxWXB3cm9zYW1QZS9rRWtHTHZIaW9x?=
 =?utf-8?B?ZWNjYWQ4SXY1Q2ZPYitnM2lUZ2xkSHNKNFM3UTdGai9KU3N4QVlBQTVsNWw2?=
 =?utf-8?B?bjVFVTVid3FhcDViSnoyNGZvMTYwc2tRdjZoczVndVpMeHRCbkVMOHJXTEJO?=
 =?utf-8?B?cjgrSEMrcG1ORXltckNtNDZNSlc4OGU3NDZJSzhnOVlwSitHcjdIWCtKanpR?=
 =?utf-8?B?UHl0NmNJbFpHcjBxMTJHZUhUcTh1NDI5cWxkVlphTmxrT1hGRkJhdGZWRHdL?=
 =?utf-8?B?aDhDWVYvOUpUZUFHdUk2R3U1M3orRmxEMkVna3hsSmViNFU3amx1SUt3YlZn?=
 =?utf-8?B?ZWVBc2wxZzAvaEdaQzFQUC9wVFZ2NElML21vZTIzZmxScTVUaG9ueXprTmVr?=
 =?utf-8?B?eE1aOGhreUk5OFJnSnJINjd6VGdZekxKYlNsZWRvY0oyOXQwUHczQjhacmhV?=
 =?utf-8?B?QUpDK2l4TStnVCtaVW1xejRVY2FPMzBPakhucC8wWGxmOUYxaGJJaWJsRGF4?=
 =?utf-8?B?ci9yUzBUVW1HQWxoWG5pV3BhcEpONnhKaUNUWm9DWk1SMEtDMXR2U3hGWG53?=
 =?utf-8?B?THNWSkdGOE1XVmttQ2dmM0N2OTdUR2Jmd0pXbzRIbjI5Z3h3MnZKTlBwaG01?=
 =?utf-8?B?aTVwaWRVMUJjMFhkSTc2REYya1RvR1ZvZnh4Z281cWI0YnBrSFFXVjEyRk9H?=
 =?utf-8?B?U1lLa3hLRFIrQlM5QUdSc0xQUTJTUFRZMWpoRDFZdTlsdXVYUTlNNThKZXlh?=
 =?utf-8?B?dFhJVXhWYVArYTRYT1ZaYlh6R2IzSDNJSndBbDZUL29tb1lhK01aeWx4Ynpy?=
 =?utf-8?B?QkJBTlVOeEp3KzU2RUQxNEl6dWJVVy93eVFZV2xVRGdwT3k4U2ZZdURtYUMy?=
 =?utf-8?B?NGE1Znc2ZlFML1drVENtR1F0YXArT2dTdThZaVNSRGZPcVdsN2V5eDlIMEZX?=
 =?utf-8?B?TCtHRFR3eG5VbVNpUVpHQjlhNnZ1dXRTUXRxNENKbW5FeG9vZmtIRFpleE0y?=
 =?utf-8?B?WWhnU2xxcWNLTU5pTm5wbWI1WEVuM3JoZW9EZGMyRy9aenllWTdKWnRPTUtP?=
 =?utf-8?B?eXRlZHZrQVJlQUd6R3dETTRSZ1V6NXhRS0JJeVZPV0VJV1Q4eFoyVHV0OUg3?=
 =?utf-8?B?eHBGQUV5alNwSDY3ZzhXU21jRHo1ZjAvZVZ6UVVSNGhZenhzWkNkdGVKeTg3?=
 =?utf-8?B?bWJNdlBlYUEvRjZMeVV5TGFwenNJbC9sa0VzeUx1Z1NVc0VlUDQ4dU9lbWgx?=
 =?utf-8?B?VGZuVlZoZlhPMFI0cHlyWWlVMXBkbHUzcm1kMzlMTVFqUFoxUnVUbzFramZk?=
 =?utf-8?B?NEZIY3AwWTdKTzNQK29jVzhwM1pPY2V2OVREVlI0cmxqSFZvRmkwRXR5Y3Q4?=
 =?utf-8?B?ZTM2a29rT0ZsZnVGYU1EVXM2Z1pmRmdXYlJzSmw4U3RpZW1rcS9oMUpiL0pM?=
 =?utf-8?B?MWpob1YzMStQMXZKRFdzS2x1MWlmUG9JSlFEay90ci96REJ0VGJXL3FmeVZx?=
 =?utf-8?B?cCtxcGIxSXBLdEFOcVZpTmo4emdsRkFJYTFDZ2ZrRWFXM2UwTHU5bnF6MGZ2?=
 =?utf-8?B?dllSNnZnOWNObmZVVGlkT0l5ak1IM2xwOVZZblhmNGZENC9iWmdnUXdFQkJC?=
 =?utf-8?B?QzUyRDY1Ylk4akF6SjRNZVBob205T1pSQjZTSVdSQWs5TkZyOHY1SFNJamxH?=
 =?utf-8?B?M3dpQzhkYWZJMVpzNjBsbVFvQmxRTGwzdUFvdXFKSFo1WXR5djFtODFGdW04?=
 =?utf-8?B?QkhQYlBYNTFYZ0QzK0NWUmREeXAyMEtBWXYySjVFYVJDT3Jkd3ZkNVNsK0V4?=
 =?utf-8?Q?zfDiLMWuiM97e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d144e534-5661-4503-070d-08d92049d497
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2021 13:26:12.2913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UalM4W19MPkMvV0a59bn9c5BUT/3towaHAi1pP35jXBe0k585dXLTwx0aPxhtlod
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4389
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

Am 26.05.21 um 13:32 schrieb Thomas Hellström:
> We are calling the eviction_valuable driver callback at eviction time to
> determine whether we actually can evict a buffer object.
> The upcoming i915 TTM backend needs the same functionality for swapout,
> and that might actually be beneficial to other drivers as well.
>
> Add an eviction_valuable call also in the swapout path. Try to keep the
> current behaviour for all drivers by returning true if the buffer object
> is already in the TTM_PL_SYSTEM placement. We change behaviour for the
> case where a buffer object is in a TT backed placement when swapped out,
> in which case the drivers normal eviction_valuable path is run.
>
> Finally make sure we don't try to swapout a bo that was recently purged
> and therefore unpopulated.
>
> Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
> v3:
> - Don't export ttm_tt_unpopulate
> - Fix confusion reading the locked pointer instead of the value
>    pointed to in ttm_bo_evict_swapout_allowable (Reported by
>    Maarten Lankhorst)
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c |  4 +++
>   drivers/gpu/drm/ttm/ttm_bo.c            | 43 ++++++++++++++++---------
>   drivers/gpu/drm/ttm/ttm_tt.c            |  3 ++
>   3 files changed, 34 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 3bc3aebfef7c..45d194bffc3f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1348,6 +1348,10 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>   	struct dma_fence *f;
>   	int i;
>   
> +	/* Swapout? */
> +	if (bo->mem.mem_type == TTM_PL_SYSTEM)
> +		return true;
> +
>   	if (bo->type == ttm_bo_type_kernel &&
>   	    !amdgpu_vm_evictable(ttm_to_amdgpu_bo(bo)))
>   		return false;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index be0406466460..1b2d062266ed 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -536,6 +536,10 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>   bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>   			      const struct ttm_place *place)
>   {
> +	dma_resv_assert_held(bo->base.resv);
> +	if (bo->mem.mem_type == TTM_PL_SYSTEM)
> +		return true;
> +
>   	/* Don't evict this BO if it's outside of the
>   	 * requested placement range
>   	 */
> @@ -558,7 +562,9 @@ EXPORT_SYMBOL(ttm_bo_eviction_valuable);
>    * b. Otherwise, trylock it.
>    */
>   static bool ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
> -			struct ttm_operation_ctx *ctx, bool *locked, bool *busy)
> +					   struct ttm_operation_ctx *ctx,
> +					   const struct ttm_place *place,
> +					   bool *locked, bool *busy)
>   {
>   	bool ret = false;
>   
> @@ -576,6 +582,14 @@ static bool ttm_bo_evict_swapout_allowable(struct ttm_buffer_object *bo,
>   			*busy = !ret;
>   	}
>   
> +	if (ret && place && !bo->bdev->funcs->eviction_valuable(bo, place)) {
> +		ret = false;
> +		if (*locked) {
> +			dma_resv_unlock(bo->base.resv);
> +			*locked = false;
> +		}
> +	}
> +
>   	return ret;
>   }
>   
> @@ -630,20 +644,14 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>   		list_for_each_entry(bo, &man->lru[i], lru) {
>   			bool busy;
>   
> -			if (!ttm_bo_evict_swapout_allowable(bo, ctx, &locked,
> -							    &busy)) {
> +			if (!ttm_bo_evict_swapout_allowable(bo, ctx, place,
> +							    &locked, &busy)) {
>   				if (busy && !busy_bo && ticket !=
>   				    dma_resv_locking_ctx(bo->base.resv))
>   					busy_bo = bo;
>   				continue;
>   			}
>   
> -			if (place && !bdev->funcs->eviction_valuable(bo,
> -								      place)) {
> -				if (locked)
> -					dma_resv_unlock(bo->base.resv);
> -				continue;
> -			}
>   			if (!ttm_bo_get_unless_zero(bo)) {
>   				if (locked)
>   					dma_resv_unlock(bo->base.resv);
> @@ -1140,10 +1148,18 @@ EXPORT_SYMBOL(ttm_bo_wait);
>   int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>   		   gfp_t gfp_flags)
>   {
> +	struct ttm_place place = {};
>   	bool locked;
>   	int ret;
>   
> -	if (!ttm_bo_evict_swapout_allowable(bo, ctx, &locked, NULL))
> +	/*
> +	 * While the bo may already reside in SYSTEM placement, set
> +	 * SYSTEM as new placement to cover also the move further below.
> +	 * The driver may use the fact that we're moving from SYSTEM
> +	 * as an indication that we're about to swap out.
> +	 */
> +	place.mem_type = TTM_PL_SYSTEM;
> +	if (!ttm_bo_evict_swapout_allowable(bo, ctx, &place, &locked, NULL))
>   		return -EBUSY;
>   
>   	if (!ttm_bo_get_unless_zero(bo)) {
> @@ -1168,12 +1184,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>   	if (bo->mem.mem_type != TTM_PL_SYSTEM) {
>   		struct ttm_operation_ctx ctx = { false, false };
>   		struct ttm_resource evict_mem;
> -		struct ttm_place place, hop;
> -
> -		memset(&place, 0, sizeof(place));
> -		memset(&hop, 0, sizeof(hop));
> -
> -		place.mem_type = TTM_PL_SYSTEM;
> +		struct ttm_place hop = {};

I would stick with memset because of the padding reasons.

>   
>   		ret = ttm_resource_alloc(bo, &place, &evict_mem);
>   		if (unlikely(ret))
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 913b330a234b..d9793cbb6d13 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -263,6 +263,9 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
>   	struct page *to_page;
>   	int i, ret;
>   
> +	if (!ttm_tt_is_populated(ttm))
> +		return 0;
> +

This here is just because of a bug in the higher level function.

I've just pushed the fix for that to drm-misc-fixes, so maybe drop that 
here as soon as this is backmerged.

Apart from that patch looks good to me.

Christian.


>   	swap_storage = shmem_file_setup("ttm swap", size, 0);
>   	if (IS_ERR(swap_storage)) {
>   		pr_err("Failed allocating swap storage\n");

