Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F333FEACC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Sep 2021 10:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91E1F6E48C;
	Thu,  2 Sep 2021 08:45:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84BA06E48C
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Sep 2021 08:45:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=An9Xwt/x029iSyjvtUbigynp5QitUq8NOjOaHoG6BPjXU1weBgCJF4ozYCoCFjkzYXMEgcGjMYqg5/7e38R4OJgqyK/iY/KcCV+G+RyCdtu1LbLOIRRaccX0QR5HFvSqnnXkbENd6yIwAsLv+mNoAh4NunWqVHzWKY7FqB9GL5dnusUlkAOPSMZTRqbG8VvReenm0Hos0AwRuTReiBuExx+Dl39h4qYFM2n/18YdZ+/YpdVRbunmP9Wge4GhNH4nTvA1tjjzm4DVPxLyCyQqGrDFt316nwP8l/g0yKqmMmjBB7n4LQ1aNt4s0JWMMoPgWZmTWHUIcsKWdmmOvyKxFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Wpy1ocpjv8pE+PZM5FcnF/VYD8mGKdNV7v2d9VPlgo=;
 b=Uxd20vaQQPNKxhtA01DDEiJ2fSofJMvs4Cp34ds/5VFBPdVtdrFV8uLnoG21gvzV/aUAxl+Pv8XvA8B6sEl5Z7suZ83w6x2xpibBSKKBD2ZN8PhZMXj+LyToDhYN45f4KxaL821Hf/hCJ7fx+0ObNPAsmMMtjHeks/evuUex8q6EWhfcT3NTxmdwl0nFGDllWsq4h4RABEGxfz8tz7PO2HUNEmcKNWwcECP2Z54Mu5/qHLrzU13N2L58ZKXlelL8Z4jqero1RMyyzvEf4W081u4rO8IPPnsOd81y312tqsRiXuGh13geX1yZkDeITLYWKKyneE2wbJq9rlsjXl/hgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Wpy1ocpjv8pE+PZM5FcnF/VYD8mGKdNV7v2d9VPlgo=;
 b=tkVFzTY1hVYYP/bh49WLJ6tfHHifotBfbb4aru6hM/q/9BSIkGABouBaJRqxNL1gilz9OppLmllbbMC2UmYl6dpqj3tjVCRUf/aOCeubPN18ob6cA5rP76Q51ne+OA2cJSH2YtEd35MYJ/EgGkE1YtjyCkou1kpebMp2I0oFaZ0=
Received: from DM5PR13CA0025.namprd13.prod.outlook.com (2603:10b6:3:7b::11) by
 BY5PR12MB3746.namprd12.prod.outlook.com (2603:10b6:a03:1a7::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.21; Thu, 2 Sep
 2021 08:45:27 +0000
Received: from DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:7b:cafe::6) by DM5PR13CA0025.outlook.office365.com
 (2603:10b6:3:7b::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.6 via Frontend
 Transport; Thu, 2 Sep 2021 08:45:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT065.mail.protection.outlook.com (10.13.172.109) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 08:45:21 +0000
Received: from hr-amd (10.180.168.240) by SATLEXMB04.amd.com (10.181.40.145)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.12; Thu, 2 Sep
 2021 03:45:19 -0500
Date: Thu, 2 Sep 2021 16:45:31 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH 1/5] drm/ttm: cleanup ttm_resource_compat
Message-ID: <20210902084531.GA3926070@hr-amd>
References: <20210831112110.113196-1-christian.koenig@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210831112110.113196-1-christian.koenig@amd.com>
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d73f4ebe-4903-48bf-14f9-08d96dedffc1
X-MS-TrafficTypeDiagnostic: BY5PR12MB3746:
X-Microsoft-Antispam-PRVS: <BY5PR12MB3746AD9248B4E7887A023D16ECCE9@BY5PR12MB3746.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OZb2EZmJGYjdcjOfrDh8AK5W0kvthPckG3rfOJm8dUjMLxVqhxzb9Q/NsgGBg6M0mYgVte0NmBlLTHaUcTEVIRDEPgwFO/cLejYHfS5yly47FWGKkGwtfz+ow5ZCZ+FFirFzdyGUbvwSW2zU0R/6r23zN8g3vPTfaXTHrmehJ75NdcpSYk0JLIkmiPacmgRbHiPx4racXZOKWbRy7ye4wvQl/NInN/lkqaAxgcCj5teplr4QYlszbKnf4mse/v2x5ft3HZTRVAoIikUfl7XwBOZ6Kfdd0ek4lqkXW/37BbXBXFRQWYf7D/yBz5MtoFo3dfKRYoEvvKWQIpevGRHZ/f8sGkG4Bix8LyxWry9XUv6RROdYiVJ1+rSjD3r7XmomJiDz2CfmTIE6kRNra1czr6VZ/myrKezO9r5UfJ104hzNxp0DMEoamQ8oXuBgmTSmAMpi5u5qwz1CT+vOGcjX6lzcoyYgewfuO3XXh38KEWDoKYaL5yJns4Gw8+tYWpue/kHWaXhXaXdQtLBOnn8UzUIm05bCuP9s5lQJ0tT0gtaopIJ2QEcGUq5OiRVYFF69q3FfURPMixlSJjvBMZuPyOAddV8qXE/aWXcrT06TzQd3nzFpw8oPJBlMzU0Z66SxHqbxPhNCebRL+b9gf2xIZUAUxnF3r1T1mUbd20zb7PFEHts5TE16M+slIq1V+R7JQlg+QVDRBGFxehnnvksY4zhclWTOcI5LKZWloIfc2mI=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(396003)(136003)(36840700001)(46966006)(82310400003)(70586007)(426003)(82740400003)(5660300002)(55016002)(6916009)(6666004)(478600001)(33656002)(4326008)(336012)(36860700001)(26005)(8936002)(33716001)(1076003)(86362001)(66574015)(81166007)(47076005)(2906002)(54906003)(9686003)(316002)(83380400001)(16526019)(70206006)(8676002)(186003)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 08:45:21.4227 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d73f4ebe-4903-48bf-14f9-08d96dedffc1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT065.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3746
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

On Tue, Aug 31, 2021 at 07:21:06PM +0800, Christian König wrote:
> Move that function into the resource handling and remove an unused parameter.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Looks this patch is separate from others in this series.

new_flags won't be used anymore.

Reviewed-by: Huang Rui <ray.huang@amd.com>

> ---
>  drivers/gpu/drm/ttm/ttm_bo.c       | 48 +----------------------------
>  drivers/gpu/drm/ttm/ttm_resource.c | 49 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/vmwgfx/vmwgfx_bo.c | 15 ++++-----
>  include/drm/ttm/ttm_bo_api.h       | 12 --------
>  include/drm/ttm/ttm_resource.h     |  3 ++
>  5 files changed, 59 insertions(+), 68 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 3573f9e393be..0a3127436f61 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -924,57 +924,11 @@ static int ttm_bo_move_buffer(struct ttm_buffer_object *bo,
>  	return ret;
>  }
>  
> -static bool ttm_bo_places_compat(const struct ttm_place *places,
> -				 unsigned num_placement,
> -				 struct ttm_resource *mem,
> -				 uint32_t *new_flags)
> -{
> -	unsigned i;
> -
> -	if (mem->placement & TTM_PL_FLAG_TEMPORARY)
> -		return false;
> -
> -	for (i = 0; i < num_placement; i++) {
> -		const struct ttm_place *heap = &places[i];
> -
> -		if ((mem->start < heap->fpfn ||
> -		     (heap->lpfn != 0 && (mem->start + mem->num_pages) > heap->lpfn)))
> -			continue;
> -
> -		*new_flags = heap->flags;
> -		if ((mem->mem_type == heap->mem_type) &&
> -		    (!(*new_flags & TTM_PL_FLAG_CONTIGUOUS) ||
> -		     (mem->placement & TTM_PL_FLAG_CONTIGUOUS)))
> -			return true;
> -	}
> -	return false;
> -}
> -
> -bool ttm_bo_mem_compat(struct ttm_placement *placement,
> -		       struct ttm_resource *mem,
> -		       uint32_t *new_flags)
> -{
> -	if (ttm_bo_places_compat(placement->placement, placement->num_placement,
> -				 mem, new_flags))
> -		return true;
> -
> -	if ((placement->busy_placement != placement->placement ||
> -	     placement->num_busy_placement > placement->num_placement) &&
> -	    ttm_bo_places_compat(placement->busy_placement,
> -				 placement->num_busy_placement,
> -				 mem, new_flags))
> -		return true;
> -
> -	return false;
> -}
> -EXPORT_SYMBOL(ttm_bo_mem_compat);
> -
>  int ttm_bo_validate(struct ttm_buffer_object *bo,
>  		    struct ttm_placement *placement,
>  		    struct ttm_operation_ctx *ctx)
>  {
>  	int ret;
> -	uint32_t new_flags;
>  
>  	dma_resv_assert_held(bo->base.resv);
>  
> @@ -987,7 +941,7 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
>  	/*
>  	 * Check whether we need to move buffer.
>  	 */
> -	if (!ttm_bo_mem_compat(placement, bo->resource, &new_flags)) {
> +	if (!ttm_resource_compat(bo->resource, placement)) {
>  		ret = ttm_bo_move_buffer(bo, placement, ctx);
>  		if (ret)
>  			return ret;
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 2431717376e7..035d71332d18 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -67,6 +67,55 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
>  }
>  EXPORT_SYMBOL(ttm_resource_free);
>  
> +static bool ttm_resource_places_compat(struct ttm_resource *res,
> +				       const struct ttm_place *places,
> +				       unsigned num_placement)
> +{
> +	unsigned i;
> +
> +	if (res->placement & TTM_PL_FLAG_TEMPORARY)
> +		return false;
> +
> +	for (i = 0; i < num_placement; i++) {
> +		const struct ttm_place *heap = &places[i];
> +
> +		if (res->start < heap->fpfn || (heap->lpfn &&
> +		    (res->start + res->num_pages) > heap->lpfn))
> +			continue;
> +
> +		if ((res->mem_type == heap->mem_type) &&
> +		    (!(heap->flags & TTM_PL_FLAG_CONTIGUOUS) ||
> +		     (res->placement & TTM_PL_FLAG_CONTIGUOUS)))
> +			return true;
> +	}
> +	return false;
> +}
> +
> +/**
> + * ttm_resource_compat - check if resource is compatible with placement
> + *
> + * @res: the resource to check
> + * @placement: the placement to check against
> + *
> + * Returns true if the placement is compatible.
> + */
> +bool ttm_resource_compat(struct ttm_resource *res,
> +			 struct ttm_placement *placement)
> +{
> +	if (ttm_resource_places_compat(res, placement->placement,
> +				       placement->num_placement))
> +		return true;
> +
> +	if ((placement->busy_placement != placement->placement ||
> +	     placement->num_busy_placement > placement->num_placement) &&
> +	    ttm_resource_places_compat(res, placement->busy_placement,
> +				       placement->num_busy_placement))
> +		return true;
> +
> +	return false;
> +}
> +EXPORT_SYMBOL(ttm_resource_compat);
> +
>  /**
>   * ttm_resource_manager_init
>   *
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> index 9e3e1429db94..fd007f1c1776 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -94,7 +94,6 @@ int vmw_bo_pin_in_placement(struct vmw_private *dev_priv,
>  	struct ttm_operation_ctx ctx = {interruptible, false };
>  	struct ttm_buffer_object *bo = &buf->base;
>  	int ret;
> -	uint32_t new_flags;
>  
>  	vmw_execbuf_release_pinned_bo(dev_priv);
>  
> @@ -103,8 +102,8 @@ int vmw_bo_pin_in_placement(struct vmw_private *dev_priv,
>  		goto err;
>  
>  	if (buf->base.pin_count > 0)
> -		ret = ttm_bo_mem_compat(placement, bo->resource,
> -					&new_flags) == true ? 0 : -EINVAL;
> +		ret = ttm_resource_compat(bo->resource, placement)
> +			? 0 : -EINVAL;
>  	else
>  		ret = ttm_bo_validate(bo, placement, &ctx);
>  
> @@ -136,7 +135,6 @@ int vmw_bo_pin_in_vram_or_gmr(struct vmw_private *dev_priv,
>  	struct ttm_operation_ctx ctx = {interruptible, false };
>  	struct ttm_buffer_object *bo = &buf->base;
>  	int ret;
> -	uint32_t new_flags;
>  
>  	vmw_execbuf_release_pinned_bo(dev_priv);
>  
> @@ -145,8 +143,8 @@ int vmw_bo_pin_in_vram_or_gmr(struct vmw_private *dev_priv,
>  		goto err;
>  
>  	if (buf->base.pin_count > 0) {
> -		ret = ttm_bo_mem_compat(&vmw_vram_gmr_placement, bo->resource,
> -					&new_flags) == true ? 0 : -EINVAL;
> +		ret = ttm_resource_compat(bo->resource, &vmw_vram_gmr_placement)
> +			? 0 : -EINVAL;
>  		goto out_unreserve;
>  	}
>  
> @@ -208,7 +206,6 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
>  	struct ttm_placement placement;
>  	struct ttm_place place;
>  	int ret = 0;
> -	uint32_t new_flags;
>  
>  	place = vmw_vram_placement.placement[0];
>  	place.lpfn = bo->resource->num_pages;
> @@ -236,8 +233,8 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
>  	}
>  
>  	if (buf->base.pin_count > 0)
> -		ret = ttm_bo_mem_compat(&placement, bo->resource,
> -					&new_flags) == true ? 0 : -EINVAL;
> +		ret = ttm_resource_compat(bo->resource, &placement)
> +			? 0 : -EINVAL;
>  	else
>  		ret = ttm_bo_validate(bo, &placement, &ctx);
>  
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index f681bbdbc698..76d7c33884da 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -264,18 +264,6 @@ static inline int ttm_bo_wait_ctx(struct ttm_buffer_object *bo, struct ttm_opera
>  	return ttm_bo_wait(bo, ctx->interruptible, ctx->no_wait_gpu);
>  }
>  
> -/**
> - * ttm_bo_mem_compat - Check if proposed placement is compatible with a bo
> - *
> - * @placement:  Return immediately if buffer is busy.
> - * @mem:  The struct ttm_resource indicating the region where the bo resides
> - * @new_flags: Describes compatible placement found
> - *
> - * Returns true if the placement is compatible
> - */
> -bool ttm_bo_mem_compat(struct ttm_placement *placement, struct ttm_resource *mem,
> -		       uint32_t *new_flags);
> -
>  /**
>   * ttm_bo_validate
>   *
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 140b6b9a8bbe..32c5edd9e8b5 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -40,6 +40,7 @@ struct ttm_resource_manager;
>  struct ttm_resource;
>  struct ttm_place;
>  struct ttm_buffer_object;
> +struct ttm_placement;
>  struct dma_buf_map;
>  struct io_mapping;
>  struct sg_table;
> @@ -266,6 +267,8 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
>  		       const struct ttm_place *place,
>  		       struct ttm_resource **res);
>  void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res);
> +bool ttm_resource_compat(struct ttm_resource *res,
> +			 struct ttm_placement *placement);
>  
>  void ttm_resource_manager_init(struct ttm_resource_manager *man,
>  			       unsigned long p_size);
> -- 
> 2.25.1
> 
