Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D84102AB34C
	for <lists+dri-devel@lfdr.de>; Mon,  9 Nov 2020 10:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC7B789801;
	Mon,  9 Nov 2020 09:13:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2080.outbound.protection.outlook.com [40.107.94.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F53089801
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Nov 2020 09:13:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LzMmdiDwo2t2oEPEqlIvijXnd6lX4V04YOZY0n8XQWDSAFwH8x42EpmgsLGoV5ZBudHPp+8wGtgYXDUJR3qY8CvD0T9oGq3qEYuS5VgYS0RfPKr0Q5PtMWd/9yw9Je16JDLgyfOKYowGUjDnB6flsugs8wy92S1QSMuzAJYpvr3qUM7hsanix3PXzPghJpT+4NWiahGDA6QOS7rFX6id1WKYwxtprT44DoKHnK441x0GrFLL5A2JnGrII8AieVL099YZXULJAu4247iUF/HvKlursSy49/SFKWR7k96KZUSELDvtZd+33zDVPnGEh37gTBs+HOhD/X52CwkWOkaLTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMeSff6vqbyoFyZ3qWeeYcCHJ3iSOqY1mHucPfgMv3k=;
 b=ka3ofhXTEwPO6a92qzucqGjVjhuBCFKlrvTus9MYjGXhko9bs7Mlds8TXARAL89DCGO6czqBnmr2VFuvJKPZXT8EM0iSvaxUO5hNoic1eYbkTNGSvxe8golq764SNLHCWkR7dnZVY5we6d6rdT0VwKan3MMdslIM/v9Slwo6cqNSs2PuY4UQEviynlOUQowvyhi8NSjHpPsFPlkn1cYPjpzF0yQAR5klG1hE8oUpIQszProLtItRz5OvMozOpyVW3HFH7/X6XUT6UXbo2q59GcYzsQ+55wJhnI5gehPJFOW7WCV6R3XcdazDpfBio6+3BMUCHQZCEC7mfp6oXRUNsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rMeSff6vqbyoFyZ3qWeeYcCHJ3iSOqY1mHucPfgMv3k=;
 b=tfDpKWenz+vmELpM2GacdGs0wS4wIpdiEUy4CSDobBbvLDrxrK1RXfM2A2g/lYpPea/YON8JBEkH0cHasb39bqXfiOCmjWoZSfgtgV6GUxAm2k59cILgzcWYNSFzC2fXfT2jBnHJ08NIIPbViX5eT5q9gGBcfdTEhDg4c4IBf8s=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3770.namprd12.prod.outlook.com (2603:10b6:5:1c4::19)
 by DM5PR12MB1356.namprd12.prod.outlook.com (2603:10b6:3:74::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3541.25; Mon, 9 Nov
 2020 09:13:11 +0000
Received: from DM6PR12MB3770.namprd12.prod.outlook.com
 ([fe80::e580:a53a:abc8:6c5b]) by DM6PR12MB3770.namprd12.prod.outlook.com
 ([fe80::e580:a53a:abc8:6c5b%7]) with mapi id 15.20.3499.032; Mon, 9 Nov 2020
 09:13:11 +0000
Subject: Re: [PATCH 1/4] drm/ttm: add multihop infrastrucutre (v2)
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20201109005432.861936-1-airlied@gmail.com>
 <20201109005432.861936-2-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9fdcf880-be1a-5803-3e54-14a9910a91b7@amd.com>
Date: Wed, 11 Nov 2020 18:13:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201109005432.861936-2-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR06CA0109.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::14) To DM6PR12MB3770.namprd12.prod.outlook.com
 (2603:10b6:5:1c4::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR06CA0109.eurprd06.prod.outlook.com (2603:10a6:208:ab::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3541.21 via Frontend Transport; Mon, 9 Nov 2020 09:13:09 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 416aacd4-de70-4ec0-07fb-08d8848fadfa
X-MS-TrafficTypeDiagnostic: DM5PR12MB1356:
X-Microsoft-Antispam-PRVS: <DM5PR12MB135653CD5A5E061B1EFB11BC83EA0@DM5PR12MB1356.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UnddUYs2HjGPkm0iE2ZXVNPyPushHMCaC+dRSVnbi+oDUOw3DnVZPIM4KQMk/3DXS+uc39lg80aD8QXGLGtNrFM2hyTT9GPA8hSkKmiz42RutOO/pdpdhcZ9oHBFPgxS3HUyWEolCLQSOsqsv+GWUbG84Zkti2DCFY5IoSgSom48G+TpzJ50yjHdt+WvIDlTXSy1VmJxFmX2y3nsRjhHgMIzQ8bEgT81NfFID+5mpVVtwaV0Phlz7EjNMVvPbGjcTZxfigC7SVLbdJe2CdzbF6E9AskfVwNdmKCCr4mC5pWh0AYBsKLXO8YVq2MCAb3q37/1Y9e9PZTEPjnHsN+/PwggqWANUTiyrB+ZlwTtvVs6Ny/zyGcHMfnhzOaA4NTj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3770.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(136003)(376002)(346002)(39860400002)(36756003)(83380400001)(6486002)(316002)(86362001)(8936002)(31686004)(186003)(66946007)(6666004)(66556008)(66476007)(16526019)(31696002)(478600001)(30864003)(2906002)(52116002)(8676002)(5660300002)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: GIPx+m/1xutmiJt2/tDJYO0EK7/UnNG3YtfAqSTKDfWeZGZGzNsm56plhYi4bsopsxyT3zlkiVEls95wggKdUigyQra8cU7/uTIldiDDHbuiVQZl2gA857bH/OFNatmPLQWemP/NuQeko8vIH93gOxfUpnE8M4w2SiGTwtrzxsN+VisVpfLfu5l3rC0GWFp2HA6paY0A4MB0ihlcFpR/0XLJZInLjNfOAxGzvZDG9ZLLM85SL0ZvNKKx8zAm2msde4rPplkoBrHd2Cj6jF3LlYDg1RdnB1YZM2faGrmXqyz2jr/F9gSOqX8MzuXlZbgbjr680ssDNizqbD/OLfTQk6GK4ztcob9KLBwMsVIoKDv+upBWS+OW1BmFjDOLZsX9n7/yh4hNlbm5gGyzXEsJ4C/j032PnHN8XdFvKyX0V8dcvpB8bzNrtzvTnPTFx36StbolcBmX5/dme9Y+pSWaGE07WZJH1HfXQaDazwL1iO/cgOwXuWjDTTRp/OT+mCx91TpycdMsgD9+drIqdw7UpyEWULhy5bzVGRHBHgpfsvm4jEZhpLDWoIzc+kdlCJnZW5z1X69arR8+SVBq/kdOY+JQXrI+HTGta7AX4aQSCCFKbIAyWUMSbuNsAkq031RHSeZ757/jjDy/1dntMjx7c3Wt4osLzjycASd6PpjgS9pgmazbGvTy+gQdei51Fv4ZQ4KmRPC4mMK7KRZSSDjdow==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 416aacd4-de70-4ec0-07fb-08d8848fadfa
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3770.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Nov 2020 09:13:10.8568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2aRjri679qbK0a/QOiydcH/sVQGO8r2bdOhhAoDrGv4YvSNsjb0JCCVU1Nts8yOT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1356
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 09.11.20 um 01:54 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> Currently drivers get called to move a buffer, but if they have to
> move it temporarily through another space (SYSTEM->VRAM via TT)
> then they can end up with a lot of ttm->driver->ttm call stacks,
> if the temprorary space moves requires eviction.
>
> Instead of letting the driver do all the placement/space for the
> temporary, allow it to report back (-EMULTIHOP) and a placement (hop)
> to the move code, which will then do the temporary move, and the
> correct placement move afterwards.
>
> This removes a lot of code from drivers, at the expense of
> adding some midlayering. I've some further ideas on how to turn
> it inside out, but I think this is a good solution to the call
> stack problems.
>
> v2: separate out the driver patches, add WARN for getting
> MULTHOP in paths we shouldn't (Daniel)
>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  3 +-
>   drivers/gpu/drm/drm_gem_vram_helper.c      |  3 +-
>   drivers/gpu/drm/nouveau/nouveau_bo.c       |  3 +-
>   drivers/gpu/drm/qxl/qxl_ttm.c              |  3 +-
>   drivers/gpu/drm/radeon/radeon_ttm.c        |  3 +-
>   drivers/gpu/drm/ttm/ttm_bo.c               | 68 +++++++++++++++++++---
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c |  3 +-
>   include/drm/ttm/ttm_bo_driver.h            |  7 ++-
>   8 files changed, 77 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index c01c060e4ac5..ce0d82802333 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -656,7 +656,8 @@ static bool amdgpu_mem_visible(struct amdgpu_device *adev,
>    */
>   static int amdgpu_bo_move(struct ttm_buffer_object *bo, bool evict,
>   			  struct ttm_operation_ctx *ctx,
> -			  struct ttm_resource *new_mem)
> +			  struct ttm_resource *new_mem,
> +			  struct ttm_place *hop)
>   {
>   	struct amdgpu_device *adev;
>   	struct amdgpu_bo *abo;
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 16d68c04ea5d..2cec7b1482b8 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -964,7 +964,8 @@ static void bo_driver_delete_mem_notify(struct ttm_buffer_object *bo)
>   static int bo_driver_move(struct ttm_buffer_object *bo,
>   			  bool evict,
>   			  struct ttm_operation_ctx *ctx,
> -			  struct ttm_resource *new_mem)
> +			  struct ttm_resource *new_mem,
> +			  struct ttm_place *hop)
>   {
>   	struct drm_gem_vram_object *gbo;
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index 8133377d865d..fee07b9d19ed 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1023,7 +1023,8 @@ nouveau_bo_vm_cleanup(struct ttm_buffer_object *bo,
>   static int
>   nouveau_bo_move(struct ttm_buffer_object *bo, bool evict,
>   		struct ttm_operation_ctx *ctx,
> -		struct ttm_resource *new_reg)
> +		struct ttm_resource *new_reg,
> +		struct ttm_place *hop)
>   {
>   	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
>   	struct nouveau_bo *nvbo = nouveau_bo(bo);
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index a80d59634143..128c38c8a837 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -140,7 +140,8 @@ static void qxl_bo_move_notify(struct ttm_buffer_object *bo,
>   
>   static int qxl_bo_move(struct ttm_buffer_object *bo, bool evict,
>   		       struct ttm_operation_ctx *ctx,
> -		       struct ttm_resource *new_mem)
> +		       struct ttm_resource *new_mem,
> +		       struct ttm_place *hop)
>   {
>   	struct ttm_resource *old_mem = &bo->mem;
>   	int ret;
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 95038ac3382e..29062dbea299 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -303,7 +303,8 @@ static int radeon_move_ram_vram(struct ttm_buffer_object *bo,
>   
>   static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
>   			  struct ttm_operation_ctx *ctx,
> -			  struct ttm_resource *new_mem)
> +			  struct ttm_resource *new_mem,
> +			  struct ttm_place *hop)
>   {
>   	struct radeon_device *rdev;
>   	struct radeon_bo *rbo;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index e2a124b3affb..9f840f2a7836 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -231,7 +231,8 @@ EXPORT_SYMBOL(ttm_bo_bulk_move_lru_tail);
>   
>   static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>   				  struct ttm_resource *mem, bool evict,
> -				  struct ttm_operation_ctx *ctx)
> +				  struct ttm_operation_ctx *ctx,
> +				  struct ttm_place *hop)
>   {
>   	struct ttm_bo_device *bdev = bo->bdev;
>   	struct ttm_resource_manager *old_man = ttm_manager_type(bdev, bo->mem.mem_type);
> @@ -259,9 +260,12 @@ static int ttm_bo_handle_move_mem(struct ttm_buffer_object *bo,
>   		}
>   	}
>   
> -	ret = bdev->driver->move(bo, evict, ctx, mem);
> -	if (ret)
> +	ret = bdev->driver->move(bo, evict, ctx, mem, hop);
> +	if (ret) {
> +		if (ret == -EMULTIHOP)
> +			return ret;
>   		goto out_err;
> +	}
>   
>   	ctx->bytes_moved += bo->num_pages << PAGE_SHIFT;
>   	return 0;
> @@ -566,6 +570,7 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>   	struct ttm_bo_device *bdev = bo->bdev;
>   	struct ttm_resource evict_mem;
>   	struct ttm_placement placement;
> +	struct ttm_place hop = {};
>   	int ret = 0;
>   
>   	dma_resv_assert_held(bo->base.resv);
> @@ -596,8 +601,9 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>   		goto out;
>   	}
>   
> -	ret = ttm_bo_handle_move_mem(bo, &evict_mem, true, ctx);
> +	ret = ttm_bo_handle_move_mem(bo, &evict_mem, true, ctx, &hop);
>   	if (unlikely(ret)) {
> +		WARN(ret == -EMULTIHOP, "Unexpected multihop in eviction - likely driver bug\n");
>   		if (ret != -ERESTARTSYS)
>   			pr_err("Buffer eviction failed\n");
>   		ttm_resource_free(bo, &evict_mem);
> @@ -936,11 +942,39 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>   }
>   EXPORT_SYMBOL(ttm_bo_mem_space);
>   
> +static int ttm_bo_bounce_temp_buffer(struct ttm_buffer_object *bo,
> +				     struct ttm_resource *mem,
> +				     struct ttm_operation_ctx *ctx,
> +				     struct ttm_place *hop)
> +{
> +	struct ttm_placement hop_placement;
> +	int ret;
> +	struct ttm_resource hop_mem = *mem;
> +
> +	hop_mem.mm_node = NULL;
> +	hop_mem.mem_type = TTM_PL_SYSTEM;
> +	hop_mem.placement = 0;
> +
> +	hop_placement.num_placement = hop_placement.num_busy_placement = 1;
> +	hop_placement.placement = hop_placement.busy_placement = hop;
> +
> +	/* find space in the bounce domain */
> +	ret = ttm_bo_mem_space(bo, &hop_placement, &hop_mem, ctx);
> +	if (ret)
> +		return ret;
> +	/* move to the bounce domain */
> +	ret = ttm_bo_handle_move_mem(bo, &hop_mem, false, ctx, NULL);
> +	if (ret)
> +		return ret;
> +	return 0;
> +}
> +
>   static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
>   			      struct ttm_placement *placement,
>   			      struct ttm_operation_ctx *ctx)
>   {
>   	int ret = 0;
> +	struct ttm_place hop = {};
>   	struct ttm_resource mem;
>   
>   	dma_resv_assert_held(bo->base.resv);
> @@ -954,12 +988,25 @@ static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
>   
>   	/*
>   	 * Determine where to move the buffer.
> +	 *
> +	 * If driver determines move is going to need
> +	 * an extra step then it will return -EMULTIHOP
> +	 * and the buffer will be moved to the temporary
> +	 * stop and the driver will be called to make
> +	 * the second hop.
>   	 */
> +bounce:
>   	ret = ttm_bo_mem_space(bo, placement, &mem, ctx);
>   	if (ret)
> -		goto out_unlock;
> -	ret = ttm_bo_handle_move_mem(bo, &mem, false, ctx);
> -out_unlock:
> +		return ret;
> +	ret = ttm_bo_handle_move_mem(bo, &mem, false, ctx, &hop);
> +	if (ret == -EMULTIHOP) {
> +		ret = ttm_bo_bounce_temp_buffer(bo, &mem, ctx, &hop);
> +		if (ret)
> +			return ret;
> +		/* try and move to final place now. */
> +		goto bounce;
> +	}
>   	if (ret)
>   		ttm_resource_free(bo, &mem);
>   	return ret;
> @@ -1432,15 +1479,18 @@ int ttm_bo_swapout(struct ttm_operation_ctx *ctx)
>   	if (bo->mem.mem_type != TTM_PL_SYSTEM) {
>   		struct ttm_operation_ctx ctx = { false, false };
>   		struct ttm_resource evict_mem;
> +		struct ttm_place hop = {};

Please always use memset() if you want to zero initialize something in 
the kernel, we had enough trouble with that.

Apart from that looks good to me,
Christian.

>   
>   		evict_mem = bo->mem;
>   		evict_mem.mm_node = NULL;
>   		evict_mem.placement = 0;
>   		evict_mem.mem_type = TTM_PL_SYSTEM;
>   
> -		ret = ttm_bo_handle_move_mem(bo, &evict_mem, true, &ctx);
> -		if (unlikely(ret != 0))
> +		ret = ttm_bo_handle_move_mem(bo, &evict_mem, true, &ctx, &hop);
> +		if (unlikely(ret != 0)) {
> +			WARN(ret == -EMULTIHOP, "Unexpected multihop in swaput - likely driver bug.\n");
>   			goto out;
> +		}
>   	}
>   
>   	/**
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> index 51f70bea41cc..6a04261ce760 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -695,7 +695,8 @@ static void vmw_swap_notify(struct ttm_buffer_object *bo)
>   static int vmw_move(struct ttm_buffer_object *bo,
>   		    bool evict,
>   		    struct ttm_operation_ctx *ctx,
> -		    struct ttm_resource *new_mem)
> +		    struct ttm_resource *new_mem,
> +		    struct ttm_place *hop)
>   {
>   	struct ttm_resource_manager *old_man = ttm_manager_type(bo->bdev, bo->mem.mem_type);
>   	struct ttm_resource_manager *new_man = ttm_manager_type(bo->bdev, new_mem->mem_type);
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index da8208f43378..f02f7cf9ae90 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -121,6 +121,8 @@ struct ttm_bo_driver {
>   	 * Return the bo flags for a buffer which is not mapped to the hardware.
>   	 * These will be placed in proposed_flags so that when the move is
>   	 * finished, they'll end up in bo->mem.flags
> +	 * This should not cause multihop evictions, and the core will warn
> +	 * if one is proposed.
>   	 */
>   
>   	void (*evict_flags)(struct ttm_buffer_object *bo,
> @@ -134,12 +136,15 @@ struct ttm_bo_driver {
>   	 * the graphics address space
>   	 * @ctx: context for this move with parameters
>   	 * @new_mem: the new memory region receiving the buffer
> +	 @ @hop: placement for driver directed intermediate hop
>   	 *
>   	 * Move a buffer between two memory regions.
> +	 * Returns errno -EMULTIHOP if driver requests a hop
>   	 */
>   	int (*move)(struct ttm_buffer_object *bo, bool evict,
>   		    struct ttm_operation_ctx *ctx,
> -		    struct ttm_resource *new_mem);
> +		    struct ttm_resource *new_mem,
> +		    struct ttm_place *hop);
>   
>   	/**
>   	 * struct ttm_bo_driver_member verify_access

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
