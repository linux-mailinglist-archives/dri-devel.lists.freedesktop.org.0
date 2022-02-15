Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3D8C4B748A
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 20:06:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA0B10E171;
	Tue, 15 Feb 2022 19:06:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 274F810E171
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 19:06:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lgLCibi13635YRcPqcZj4FHp/ewAF4O/wGnLzYOUIae1LDiDQElZTIyX6I8VhH2X2Q5n/I/eOzaQ2kbeOyncTR7yW7PkyBH1SK8kbkKk7gSn0FFpJSRvGc79JwgCcZZDJUdbMzso+4qYxy855eAfTy0MqdyZrTIFCqtqkLqgfGY25RDkILGsYFdnPSaQlZHvxwV5FquhSCgdtWNzgSJ5uSpWSLXGeCD1Z9MkG8yR3wiXLCTIpeaUNDFZWCuUuyEgvNooJjZ815xnVIrySJvz0WB+SMcYUyV1uWsujvJ+7tUdZSSrgFKzGSkwUFsyQTe4yQqj2XuCLGQMPap6GV61dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aL+sEJbnfFpmIkY/m9O7bQ2veH6TZyWEsugJqJn8ujU=;
 b=NKxmpqlSvyPP0euLvDWkC43ssaLVXMXeEGtdvpUocTkr/aR43dI8go4BjDWR3WkWS0Ks0iM6OvbpRrQzoa9R0v1zMNMUKgdyNr5U+nxDcCtMjoEW61VkX37V/yUlrF5wj5Q5wesNXVx2hd0n3tGp8Gc0cojggulf2Re8GZUQNg3fRnVb1+upqhNb7TXpV/2cc5K92zzON8S9o0ZgtIjoNIJHRdbnUfnPggKlN2Dyrafg8avHEqTlXlXmcsVadN9tRd6QfGYrsKD4W+Dfecd6RIu2BwphSQxYXrJrM2NSTh18WK5vrHRNBUBxjvlvmfaCr9FwEOmt5K5UYUMhQQA5+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aL+sEJbnfFpmIkY/m9O7bQ2veH6TZyWEsugJqJn8ujU=;
 b=cFHbTlcwpOPhA1WhFhlKZM2bUv2uZIKBVGU6kiVTp7rAYKh0500rphdtas3TbuWwdho8XcghHOTulAj+pTe3zImXl8c169mJTWfma0yRmKR9zE3u0uY4YJYMgmA+vm2fttgDVEBk1n8OdkTUUGv8c/o2nq6/nZ6rNujrOf44H/Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN2PR12MB3456.namprd12.prod.outlook.com (2603:10b6:208:ca::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Tue, 15 Feb
 2022 19:06:36 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::38ec:3a46:f85e:6cfa%4]) with mapi id 15.20.4975.019; Tue, 15 Feb 2022
 19:06:36 +0000
Message-ID: <cc99f141-e832-64b2-5abb-83213ba70f01@amd.com>
Date: Tue, 15 Feb 2022 14:06:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 2/6] drm/ttm: add resource iterator v3
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 matthew.william.auld@gmail.com, daniel@ffwll.ch
References: <20220215172259.196645-1-christian.koenig@amd.com>
 <20220215172259.196645-3-christian.koenig@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20220215172259.196645-3-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:610:4e::20) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ad837829-97a1-46d1-f500-08d9f0b64966
X-MS-TrafficTypeDiagnostic: MN2PR12MB3456:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB3456A7C280C50CF7A241589892349@MN2PR12MB3456.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w+LQBJRj5ZXFMRNKSZBcfEo5Op6duYhi7tRJlRlKQc/z2QOo+40qshAmO5aAqOKJ4aNxvjv3EP/vSecZNc1CgSCZ5G1AmBKoWihzsOTjc7wQEQuG7D3cgCsSYu4tqhZgyLiB5vJgqA5BwHgWFIXSL2tLCSNLADcclgqqxzPwyQn1aZ2rFPIf/iLswCnplbQzPUdeNK1L9BdZ+FWoZPR0JAKQzjTxScm2i9Lg9r+UZunPuFU4C75dNGR6jgB7WRiY830XbBz3A+8mWqu1gnZqgiSjHyjiCyh6B9ksEb8Tm6kjaKxQd67dbp6zrHDu9V4ToUCYwcuFJ4dVcAH0jzBsgkRvFKATFGHeE5ruFX4kdjqHUv44bQc0C2yRnTgO1M38yiJ1KZv7bj8de/awRzYH81jNUSibod9ej0RON5B6dI8cvUQ7KRz/qrxkQFhur4v8mK+DKjRpuim8p7WwVU7hlvt0k0WF3GdfiW18xttL6ZMVF/WnvKKSA/wl1ZZ2WQ8uwErMJALhM7UtJ5hRbZDRxMGMX0oNfJTX5vD4O5BlW5oZ80p4KFIRVh48+FqpkU9LQHSOrqsfakx0zDFEXqRLiQmZ6AMQ6U8AGTPqVV6ywixXqmu6iZAgGU/jGyG9pX/f6zw6vvBgizhQqEHeqenqO0xsmBdYd+ki+Uzl5Qqqor99ZhHddlTTE0sRFBqSnXUHnpsqt5Rj8jQzJ3BWvp0Or5l477mTXrDkboWeAJg+SdIuiNotGsuePCXOHhw9ugM/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(44832011)(38100700002)(6506007)(186003)(316002)(2616005)(26005)(31686004)(66946007)(66476007)(8676002)(83380400001)(2906002)(6512007)(8936002)(86362001)(66556008)(6486002)(66574015)(36916002)(53546011)(6666004)(4326008)(36756003)(508600001)(31696002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWNGZWVlekZDczY0Q2Y4dHplcGxUSFhzV0FoSjBXdDI0a28xeEl4aHV3OU9M?=
 =?utf-8?B?VG9GOGxBZEw2WktIenloTUdoOEdNS3QvZ04yaUJxNzdyQlkzVjRNKzRsUXBL?=
 =?utf-8?B?U2ZjWFp5UStjRXZOSTI5MmpzT2tlNTZFckpkYms0dHQrMnhBZ2lmMlQwMCt5?=
 =?utf-8?B?SEE3cXlBSDg0R3RaVkNaY3k0bWxUNEFUNVcxc0pxR2hlTExCa21vTWh3dnVr?=
 =?utf-8?B?RXlyc1JPMkdlQzlhczhpWkZtUlFRS09VL25NbU96dkhwMDNFRk9DeWVEUy90?=
 =?utf-8?B?Q2U2Q3YzQWtXaG1vdVIwTEpYVThRazd2VmF4eVp0anY3Sk5rS0tUKzBSWHFl?=
 =?utf-8?B?RkpkZGRZZENjdHRzUXVoTllyaU1KUjJxRVNjNjJkRitoMmN2UFFMYm5VNlJN?=
 =?utf-8?B?SnR6ajkwamlLelpVaHR0Z2M3a1NuWUhwY0R3NllVTWp0aFZBbkhFTFlXR3FV?=
 =?utf-8?B?bkVJL1hDL083dExoNUlYdDZCaERDL3lVQ21CT056M2F1bTRiZGhjMU9pTFdL?=
 =?utf-8?B?QTRVclM0cE9YYlI1dkxZV0ZrTm14YllVcUVrSHBxcjRmRFIyb253YlExVUFE?=
 =?utf-8?B?VmtjeUxMSEd2cytRblVBaU9ZM1Y4Q2hjTzhxVHZ5dmpzY3l0UnZqdS8vRHBK?=
 =?utf-8?B?VUhQTkp0Mis1R2V4eENxa3NNL1RmUjNidHJZL0xZL3NDUk41dXJTUncrWExH?=
 =?utf-8?B?dExVb0ROdDJ2ZkhiWjNNTGMyRjh5Yko1QlVwTUdFSURKZmNEU25OZ2tZTGhY?=
 =?utf-8?B?U0k2U3ZENVJzMGtKcTJ4cCtrTVlwSEJ6YVg4OUhoN05HL1p1b1YvS0pvcW1p?=
 =?utf-8?B?ZDFZYmtYbjBSQmNlQnpoenJNRWU3VDF5R3R2MEJDS1REcGZsd1grek9NYzFz?=
 =?utf-8?B?SGsvUFI3S2toZHYwZ0JOSmJzMnV2czhwQ1cvS2phby84cTJtSXI2TmE3V0M1?=
 =?utf-8?B?NDByL240UHI1Zyt0MVpLRVBmSmx0YjduOXpVV3BPTFFSc1FYY3F4M2lCa0do?=
 =?utf-8?B?S01rZ1UyZG9zMHN6RUdyMVNlRnFuekUyamxyZXZlWHU5eEF1aDZpYnlQQWd0?=
 =?utf-8?B?bCsvOU44djduYU91b0RmRkY2UElRNXRQWXNMbDNVZ2hhalc4SWNjNWF2VnB0?=
 =?utf-8?B?VkJaL0M3a0F0cUJVMmV2a3hqeDdwZmM4WTVXc1N4RG5aYTlKcHJZQlJwMkRk?=
 =?utf-8?B?WkxjcGJVWDgrSnlCWGttTUlBMHl1eC8yTldQeEszblpSMVRzSGZFZ2JTZi80?=
 =?utf-8?B?T2dsTFJuRW5jdTNFdHdjMEo5b3RZWXZ5blRVbDZWSzVwdXJFK0ZCa1llbzZj?=
 =?utf-8?B?d2NvNjVxOVczYUIxRS84SjNuQXlIV0tSaVhGVngzdjNPeDZEdTBmQXFzdWZa?=
 =?utf-8?B?NGZ3U2o5TytibDVCclNDYmFkQzN1eW1ab3hCVUlVZ0RNamZtakdyU1ZOc0dH?=
 =?utf-8?B?Z2g4WVErelMrak05Z2prMUFqdFhBYmhTWlJxNVBLUlhQUzVCcmlzaFRFWW1t?=
 =?utf-8?B?eHp0M2o0ZFp6THpJc2FvTFpCeUtCMHB4bnRJeEZoTWRYTVYydW5VU0cvTUE2?=
 =?utf-8?B?WWkxa2creml0bmZRbmVOZnNmTGwyVTQvN2ovMGV3SnRocHpXV0pKNWpGOGZo?=
 =?utf-8?B?QlVMOVpVYVl5WGpnaUhnRE5YeGNvWlJKTTN1bmVnSTJrWDdmLzdGb3FLN3VB?=
 =?utf-8?B?SkJuWVhUNjA1Mjl6cUtzOTlQcndUM2E3UXVnOXdHZGNmODhnNTFodEdweHpk?=
 =?utf-8?B?dmM1SENCOTNvL3BYRTl1K1VtcThyWHluRWFKV2sxRGM3ZlJ4N1BEWGh3bkhW?=
 =?utf-8?B?RnlwRTJ1M0d4UW1uTjd5OWF4dVRSL1c0TzNZeXQrdnNtT2o3aHY3SEpVYjAx?=
 =?utf-8?B?azdhU2NHNG85Q0E1dW1WTE9XQk9sRCtJZnpzRmh5LzltQWtZbng5UWlvMTFS?=
 =?utf-8?B?Q1krQ3BBZU9acVEvNWQwakRVakxOdkdhK0RQOVI2ZUdZdTJFT0hZQkJweGFS?=
 =?utf-8?B?OW9BWkN1OVFubFZna1IyZVRlV2JRb3JDaS9lS0NoZzNlazREWEhrTy9FVU1w?=
 =?utf-8?B?ZFV1YnMzRlh6VFFObzd2YmxLOU1jaUwxY0hwZWZLYUFEbDlhY3dTSFpWa24y?=
 =?utf-8?B?WUJNUmJtSVEzdmNCUGZ4NnpQUEtpd2VRUkV2UzlDRkVGcVI0Z1QzNjNGdG5T?=
 =?utf-8?Q?Q7/b5Wm+ZFZuEnYrEwt+Sqg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad837829-97a1-46d1-f500-08d9f0b64966
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 19:06:35.9583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8Vof/UdNxLNTTxMhxuXYnmHd2mUAMA4UicG6qvYt/VjXswEQqgW4f/SqKkmiwiFT/xObw/v98EZGYm1hnGv2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3456
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2022-02-15 12:22, Christian König wrote:
> Instead of duplicating that at different places add an iterator over all
> the resources in a resource manager.
>
> v2: add lockdep annotation and kerneldoc
> v3: fix various bugs pointed out by Felix
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Tested-by: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch> (v3)
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c       | 42 ++++++++++--------------
>   drivers/gpu/drm/ttm/ttm_device.c   | 26 +++++++--------
>   drivers/gpu/drm/ttm/ttm_resource.c | 51 ++++++++++++++++++++++++++++++
>   include/drm/ttm/ttm_resource.h     | 23 ++++++++++++++
>   4 files changed, 102 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index cb0fa932d495..11e698e3374c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -579,38 +579,30 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>   			struct ww_acquire_ctx *ticket)
>   {
>   	struct ttm_buffer_object *bo = NULL, *busy_bo = NULL;
> +	struct ttm_resource_cursor cursor;
>   	struct ttm_resource *res;
>   	bool locked = false;
> -	unsigned i;
>   	int ret;
>   
>   	spin_lock(&bdev->lru_lock);
> -	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
> -		list_for_each_entry(res, &man->lru[i], lru) {
> -			bool busy;
> -
> -			bo = res->bo;
> -			if (!ttm_bo_evict_swapout_allowable(bo, ctx, place,
> -							    &locked, &busy)) {
> -				if (busy && !busy_bo && ticket !=
> -				    dma_resv_locking_ctx(bo->base.resv))
> -					busy_bo = bo;
> -				continue;
> -			}
> -
> -			if (!ttm_bo_get_unless_zero(bo)) {
> -				if (locked)
> -					dma_resv_unlock(bo->base.resv);
> -				continue;
> -			}
> -			break;
> +	ttm_resource_manager_for_each_res(man, &cursor, res) {
> +		bool busy;
> +
> +		if (!ttm_bo_evict_swapout_allowable(res->bo, ctx, place,
> +						    &locked, &busy)) {
> +			if (busy && !busy_bo && ticket !=
> +			    dma_resv_locking_ctx(res->bo->base.resv))
> +				busy_bo = res->bo;
> +			continue;
>   		}
>   
> -		/* If the inner loop terminated early, we have our candidate */
> -		if (&res->lru != &man->lru[i])
> -			break;
> -
> -		bo = NULL;
> +		if (!ttm_bo_get_unless_zero(res->bo)) {

Just an unrelated nit-pick: If you invert the logic of this if, the loop 
behaves more like a normal loop (without a break at the very end, and 
one less continue statement):

    if (ttm_bo_get_unless_zero(res->bo)) {
         bo = res->bo;
         break;
    }
    if (locked)
         dma_resv_unlock(res->bo->base.resv);

Either way, the patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> +			if (locked)
> +				dma_resv_unlock(res->bo->base.resv);
> +			continue;
> +		}
> +		bo = res->bo;
> +		break;
>   	}
>   
>   	if (!bo) {
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index ba35887147ba..a0562ab386f5 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -142,10 +142,10 @@ EXPORT_SYMBOL(ttm_global_swapout);
>   int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   		       gfp_t gfp_flags)
>   {
> +	struct ttm_resource_cursor cursor;
>   	struct ttm_resource_manager *man;
> -	struct ttm_buffer_object *bo;
>   	struct ttm_resource *res;
> -	unsigned i, j;
> +	unsigned i;
>   	int ret;
>   
>   	spin_lock(&bdev->lru_lock);
> @@ -154,20 +154,16 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   		if (!man || !man->use_tt)
>   			continue;
>   
> -		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
> -			list_for_each_entry(res, &man->lru[j], lru) {
> -				uint32_t num_pages;
> -
> -				bo = res->bo;
> -				num_pages = PFN_UP(bo->base.size);
> +		ttm_resource_manager_for_each_res(man, &cursor, res) {
> +			struct ttm_buffer_object *bo = res->bo;
> +			uint32_t num_pages = PFN_UP(bo->base.size);
>   
> -				ret = ttm_bo_swapout(bo, ctx, gfp_flags);
> -				/* ttm_bo_swapout has dropped the lru_lock */
> -				if (!ret)
> -					return num_pages;
> -				if (ret != -EBUSY)
> -					return ret;
> -			}
> +			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
> +			/* ttm_bo_swapout has dropped the lru_lock */
> +			if (!ret)
> +				return num_pages;
> +			if (ret != -EBUSY)
> +				return ret;
>   		}
>   	}
>   	spin_unlock(&bdev->lru_lock);
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 3af788dd197e..88fc96c315b8 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -385,6 +385,57 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>   }
>   EXPORT_SYMBOL(ttm_resource_manager_debug);
>   
> +/**
> + * ttm_resource_manager_first
> + *
> + * @man: resource manager to iterate over
> + * @cursor: cursor to record the position
> + *
> + * Returns the first resource from the resource manager.
> + */
> +struct ttm_resource *
> +ttm_resource_manager_first(struct ttm_resource_manager *man,
> +			   struct ttm_resource_cursor *cursor)
> +{
> +	struct ttm_resource *res;
> +
> +	lockdep_assert_held(&man->bdev->lru_lock);
> +
> +	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
> +	     ++cursor->priority)
> +		list_for_each_entry(res, &man->lru[cursor->priority], lru)
> +			return res;
> +
> +	return NULL;
> +}
> +
> +/**
> + * ttm_resource_manager_next
> + *
> + * @man: resource manager to iterate over
> + * @cursor: cursor to record the position
> + * @res: the current resource pointer
> + *
> + * Returns the next resource from the resource manager.
> + */
> +struct ttm_resource *
> +ttm_resource_manager_next(struct ttm_resource_manager *man,
> +			  struct ttm_resource_cursor *cursor,
> +			  struct ttm_resource *res)
> +{
> +	lockdep_assert_held(&man->bdev->lru_lock);
> +
> +	list_for_each_entry_continue(res, &man->lru[cursor->priority], lru)
> +		return res;
> +
> +	for (++cursor->priority; cursor->priority < TTM_MAX_BO_PRIORITY;
> +	     ++cursor->priority)
> +		list_for_each_entry(res, &man->lru[cursor->priority], lru)
> +			return res;
> +
> +	return NULL;
> +}
> +
>   static void ttm_kmap_iter_iomap_map_local(struct ttm_kmap_iter *iter,
>   					  struct dma_buf_map *dmap,
>   					  pgoff_t i)
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 181e82e3d806..ef0ec700e896 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -184,6 +184,17 @@ struct ttm_resource {
>   	struct list_head lru;
>   };
>   
> +/**
> + * struct ttm_resource_cursor
> + *
> + * @priority: the current priority
> + *
> + * Cursor to iterate over the resources in a manager.
> + */
> +struct ttm_resource_cursor {
> +	unsigned int priority;
> +};
> +
>   /**
>    * struct ttm_lru_bulk_move_pos
>    *
> @@ -328,6 +339,18 @@ uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man);
>   void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>   				struct drm_printer *p);
>   
> +struct ttm_resource *
> +ttm_resource_manager_first(struct ttm_resource_manager *man,
> +			   struct ttm_resource_cursor *cursor);
> +struct ttm_resource *
> +ttm_resource_manager_next(struct ttm_resource_manager *man,
> +			  struct ttm_resource_cursor *cursor,
> +			  struct ttm_resource *res);
> +
> +#define ttm_resource_manager_for_each_res(man, cursor, res)		\
> +	for (res = ttm_resource_manager_first(man, cursor); res;	\
> +	     res = ttm_resource_manager_next(man, cursor, res))
> +
>   struct ttm_kmap_iter *
>   ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,
>   			 struct io_mapping *iomap,
