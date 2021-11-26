Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A844645E846
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 08:10:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0471A6E925;
	Fri, 26 Nov 2021 07:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2085.outbound.protection.outlook.com [40.107.92.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DA3A6E925
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 07:10:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dL7scmjB5iOadK+jKfnw01NHthcn5b5WH+M+p/G8SJl/HVhw+rRQTk6he9u9NOgDRVnTk1FM1vUhkoXHMArlNFgW7Vx1CILwc2W/4PIm7DAyOp1OE/RJoOEfKj4D562UbX3TmuvVoxi/ePVPz6VDASLxomTszm/xvjmaeDmrKe4mnUyPNWgPGW7GrzV3B9Z/NfNS9ki6deqF0D5VyGtulGa2o0x2F8UcG94OPkuAE+p49oPjymspZFH/0lrsfylHBw1q9yG7plxA3iFlekckwXGpwrjmNjW/SYmgDSzZyFcoOp70G1n+1IL6M+YjaaMNAwetild6f74WbfCT/brm6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VLo3qzYDRGVTivu7BxwWvAgPyvbQlykzEdls+olNB6o=;
 b=Sj98M7zjNzHa9ITyBZG2hgmRZuYD0A4qJyRcMClaw3HHl6qQX1jn6rJSa7AoimZ68aLzAwy7t6LOhVuPT35UfzQ47FlGuuRhUjVi5ZPFJyFpzCA8l0gZ01UvpkZWFzKuVzlSrpLOqCqMAX2Ku7g6DMAVgh22QeBaE1aP0PmB7IONIl3FjwVGffZA2BdDy4ps23RlkXWSBTqwzmS7XZ7Q1V6C9r9oeflim+oeu6OvSl0qw9SPqyDROp3sYxioaTINSflSzFWOxGZon70cWD2BkpO/MOTIBpf0WTowyrNvtAgePip+q6WB2NW8YeVhlPah1o8D5e1n/o4mssQ9W5gTmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VLo3qzYDRGVTivu7BxwWvAgPyvbQlykzEdls+olNB6o=;
 b=RtatiQGf432kqay2NNNX2olJEYnziDevAtmiwJAf0Rzj5sy8plJqXYKr9hFsy31wew7LF4bC6OXhZPPsMTylmVzq9nucSS0wuFN1dyYr9Yq5QJPvAI27DMc4EGEAbP3wQUyML06bkFAQiZ29oS1hNbAZj7VUm1CsrxRNy7MYYyo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4918.namprd12.prod.outlook.com (2603:10b6:a03:1df::22)
 by BYAPR12MB3093.namprd12.prod.outlook.com (2603:10b6:a03:dc::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20; Fri, 26 Nov
 2021 07:10:33 +0000
Received: from BY5PR12MB4918.namprd12.prod.outlook.com
 ([fe80::d519:1ea0:33a6:8193]) by BY5PR12MB4918.namprd12.prod.outlook.com
 ([fe80::d519:1ea0:33a6:8193%6]) with mapi id 15.20.4713.027; Fri, 26 Nov 2021
 07:10:33 +0000
Date: Fri, 26 Nov 2021 15:10:03 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 03/12] drm/ttm: add a weak BO reference to the resource v3
Message-ID: <YaCIS/t/b/RxQjgz@amd.com>
References: <20211124124430.20859-1-christian.koenig@amd.com>
 <20211124124430.20859-4-christian.koenig@amd.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211124124430.20859-4-christian.koenig@amd.com>
X-ClientProxiedBy: SGBP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::13)
 To BY5PR12MB4918.namprd12.prod.outlook.com
 (2603:10b6:a03:1df::22)
MIME-Version: 1.0
Received: from amd.com (165.204.134.251) by
 SGBP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4734.23 via Frontend Transport; Fri, 26 Nov 2021 07:10:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 399d46c1-e3b3-4b8c-5936-08d9b0abd656
X-MS-TrafficTypeDiagnostic: BYAPR12MB3093:
X-Microsoft-Antispam-PRVS: <BYAPR12MB309393204ECF309A4E23AAAFEC639@BYAPR12MB3093.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sR7TSYKqKRRQC8Sz3/iuVKQopNqDKw/Hi2Rw1I0930QI5lF1TD/korkGAaS3/cKdx9pdorRsaH27Bcf8Gv06xlEPhH+eSmgf+gd0+B3ILoeLhbGZ7Ebt3n7dYbQxVXlkTSx+NjgFJc62LPW51ymDbDeUClo5MPq5U01AX++UdLyX90luN2dhk9jdytonDW9zmMefPKKT2xG4+0v39hJtr46N9iM/Y0kKe4UdXbF+EVFRqBz8hjtmSQ2oMGj+MrohJgYLiR0yllSZDui0C3/X3Xd/T5SLaiLAvZ+KvaJ8hmfdeEpsR6Vvqyppx2lRXv1QyzdcbvozSq8vNLzl6Fpy8zYjI/Y3rhMELP1xFdVMqDHfS9BV9DjRNniYSIcGBsk+sPScy43zkd4oG7sbJGR0nTA4puFee9J1CfUWpEsZszYHy6Ys/i4DBVfaz832WJxOVhtfPr+lfAftFdnUdZz8d/nLyWVxLIClyB08XPPtsySpGRw5SARysIdtEi7WD4TbhhTOvBKjAIP2cfmMlh/NWTli0SKn9UXNe3yemU1GL/89uifuWwQp5gQ1zBJRfYW2uV3bj7yQ0ZDZsd+77WhDac5nq2offUbEUdD4BkBolQv3VY96Hil1OD3T0B7RMDemCBW+uPffjFMbs/Kgr9Yq3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4918.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(5660300002)(55016003)(66476007)(36756003)(66946007)(66556008)(83380400001)(316002)(8886007)(4326008)(86362001)(6666004)(6916009)(26005)(8676002)(956004)(186003)(8936002)(2616005)(2906002)(66574015)(508600001)(54906003)(7696005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?HO79BvS5awCX8CQMB05LdemEW/KE94MHS6qVwhQcAXIJZbG6svq4zqCcDS?=
 =?iso-8859-1?Q?Y3i4VBG3fXy6q4hNrFKK1u0uvgXfgU4Fl8q2Q7b3BqVLCPrS3CQnbl8EfJ?=
 =?iso-8859-1?Q?KYr+C+SoPO3q4gIw4BeTAdM6g40ULys+XITMCO+BdpdHbqpo4CT8KeynbE?=
 =?iso-8859-1?Q?9KP9RWn/xoxDEQL38fyPkUzJY+ajKwNXX0IWSud0XS2z34h45xRBM0q26p?=
 =?iso-8859-1?Q?UxFnaPQe0+/1FShOu4ggaGzeu7uAK3vy9SG94OqeieLoCyrXjUiIshKaO7?=
 =?iso-8859-1?Q?quk3y94zvcFn07LAYPbM4KGhN3ZXnRGBA5xIyOVh4c+HEodvhQP6Yes19T?=
 =?iso-8859-1?Q?Yj7U0340FfAOIKUHgZcUahz0FQqAHOo2t/vsbqLQsz1bu+YeCuU9dZq8ME?=
 =?iso-8859-1?Q?Q34YMKwPiVaFs6t8qUEtTRZjZJ8vDlDn8+uF3a/KTeVHludZ61O5NyZ6dP?=
 =?iso-8859-1?Q?8RY9LtcqHZheOb2XAolA/r8Fr/xWaqjrt3QLKsi5ItrTxgn4e+BSqPpTIV?=
 =?iso-8859-1?Q?hpXvilmOJtDGSQR9vgQpq6wdUN1Jgkah0SXCLJLXc683XpMSMad/2rUXB0?=
 =?iso-8859-1?Q?Jrx2xs2gBWzTodnQ1wv5GugBwlNMH2yy4OXMR936eGu1pD1aKIhuojDf30?=
 =?iso-8859-1?Q?bpBfu1OcUjXrkByovmK5Y4IjKXRe60uQ+zAZ4TFJDOGYvkjzWkJ+4ptX3I?=
 =?iso-8859-1?Q?3rvrulHWYBKKdCRoOR2/OhNbkGAv1I945+LGJqXBaHpc3CXhXgS/N54MHk?=
 =?iso-8859-1?Q?klfG7qxLuP6AV1+K/4fJ7iSmA3cjQb0E+TH/DZj2zEqCvBE6q7hTMPA2Ak?=
 =?iso-8859-1?Q?FXduUIZBQS7S43PucXqzevLoW59bsAFCbdQxVk1gPFiHOxXv8h88ivay4g?=
 =?iso-8859-1?Q?16NGj8E17vLxKrzZpwVESPtIGR8qpy0/ZnHpYIWR1p8OfYDFjPFKBtKdrn?=
 =?iso-8859-1?Q?qKbIP4vmsaIeWPAf2gMoEjNkpMJAM5U987yKr76Saq0bY7JSEOZ9QW7h/X?=
 =?iso-8859-1?Q?aLI2nrxXF/W1EWD8hlb7XeDIY4i9Fx8UPC7/2uWd2Qr/kD+3EACYbt4GIC?=
 =?iso-8859-1?Q?YAtg7EcYqyeLCp+vm0VzZrFRT4KvnaO85voppg65WE8r4D5koDoMEsSuW5?=
 =?iso-8859-1?Q?d+CZD+C+yphcqRY/GXav/zqup4HnnMRmKdX2rlVA2Lo7M+ckOSzBScqDXU?=
 =?iso-8859-1?Q?h/iqgEcmaS8mirmgqoj+VK+x2dohD5NQHcQ3TNGKv9PEVJx6CNUVEvTXgt?=
 =?iso-8859-1?Q?+lmO/7NBHZrJ9WqUetMvJfJ3znPam4Qy7EXUY0ARktPVhlBHo34meVYHSi?=
 =?iso-8859-1?Q?ZwXfZhzlu3FzVYSKNBlmjgDAPl/KvgiuQtCjepIxWFxqZT3hBp57AsJwYf?=
 =?iso-8859-1?Q?UuY+/qpzUP5HnKmeX6kCb74Gb7S6cw8nemBq7PeCp3qY4ICJNWGY8IpE31?=
 =?iso-8859-1?Q?m3IFszR1FHSQB3VkT7iKEAze5+TV67PEPmfMpH+aXQpQpXH9ddYdhDK5rd?=
 =?iso-8859-1?Q?o5n+ksqEHrigU0NjhCtDbEqkwAKN8sw3H50nQrTsQkoPrgcWLBvGLMh6Yt?=
 =?iso-8859-1?Q?DuuiEqkEpCvdDomJ/8IVFo7F6TyaHQNAyyexFjD4v3u5uw/CIht2PMd66a?=
 =?iso-8859-1?Q?3IfKYCFDbYrVTxgwEMplCO/UO5Z6+p11Sd35vEJdYqRgQ2vEZBdEETAFaL?=
 =?iso-8859-1?Q?dSAdAwFWRX9w9L2k33g=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 399d46c1-e3b3-4b8c-5936-08d9b0abd656
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4918.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 07:10:33.6115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lMVaFBPbhunuBguWlZZ4FoFn+7lXxywWlbtRykFCk1krA4AkgCnwsy1F09utiwdCPHzvXwTys8QpFvdxu1nmaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3093
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
Cc: "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 24, 2021 at 08:44:21PM +0800, Christian König wrote:
> Keep track for which BO a resource was allocated.
> This is necessary to move the LRU handling into the resources.
> 
> A bit problematic is i915 since it tries to use the resource
> interface without a BO which is illegal from the conceptional
> point of view.
> 
> v2: Document that this is a weak reference and add a workaround for i915
> v3: further document that this is protected by ttm_device::lru_lock and
>     clarify the i915 workaround
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/ttm/ttm_bo_util.c  | 7 +++++--
>  drivers/gpu/drm/ttm/ttm_resource.c | 9 +++++++++
>  include/drm/ttm/ttm_resource.h     | 4 ++++
>  3 files changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 95de2691ee7c..a2e3a9626198 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -237,6 +237,11 @@ static int ttm_buffer_object_transfer(struct ttm_buffer_object *bo,
>  	if (bo->type != ttm_bo_type_sg)
>  		fbo->base.base.resv = &fbo->base.base._resv;
>  
> +	if (fbo->base.resource) {
> +		ttm_resource_set_bo(fbo->base.resource, &fbo->base);
> +		bo->resource = NULL;
> +	}
> +
>  	dma_resv_init(&fbo->base.base._resv);
>  	fbo->base.base.dev = NULL;
>  	ret = dma_resv_trylock(&fbo->base.base._resv);
> @@ -512,7 +517,6 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
>  		ghost_obj->ttm = NULL;
>  	else
>  		bo->ttm = NULL;
> -	bo->resource = NULL;
>  
>  	dma_resv_unlock(&ghost_obj->base._resv);
>  	ttm_bo_put(ghost_obj);
> @@ -637,7 +641,6 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo)
>  	dma_resv_unlock(&ghost->base._resv);
>  	ttm_bo_put(ghost);
>  	bo->ttm = ttm;
> -	bo->resource = NULL;
>  	ttm_bo_assign_mem(bo, sys_res);
>  	return 0;
>  
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 41e7bf195168..7fdd58b53c61 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -41,6 +41,7 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>  	res->bus.offset = 0;
>  	res->bus.is_iomem = false;
>  	res->bus.caching = ttm_cached;
> +	res->bo = bo;
>  }
>  EXPORT_SYMBOL(ttm_resource_init);
>  
> @@ -122,6 +123,14 @@ bool ttm_resource_compat(struct ttm_resource *res,
>  }
>  EXPORT_SYMBOL(ttm_resource_compat);
>  
> +void ttm_resource_set_bo(struct ttm_resource *res,

How about rename it as ttm_resource_set_bo_with_lru_locked?

It's just a minor suggestion.

Acked-by: Huang Rui <ray.huang@amd.com>

> +			 struct ttm_buffer_object *bo)
> +{
> +	spin_lock(&bo->bdev->lru_lock);
> +	res->bo = bo;
> +	spin_unlock(&bo->bdev->lru_lock);
> +}
> +
>  /**
>   * ttm_resource_manager_init
>   *
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 6bf37383002b..69eea9d6399b 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -161,6 +161,7 @@ struct ttm_bus_placement {
>   * @mem_type: Resource type of the allocation.
>   * @placement: Placement flags.
>   * @bus: Placement on io bus accessible to the CPU
> + * @bo: weak reference to the BO, protected by ttm_device::lru_lock
>   *
>   * Structure indicating the placement and space resources used by a
>   * buffer object.
> @@ -171,6 +172,7 @@ struct ttm_resource {
>  	uint32_t mem_type;
>  	uint32_t placement;
>  	struct ttm_bus_placement bus;
> +	struct ttm_buffer_object *bo;
>  };
>  
>  /**
> @@ -271,6 +273,8 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
>  void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res);
>  bool ttm_resource_compat(struct ttm_resource *res,
>  			 struct ttm_placement *placement);
> +void ttm_resource_set_bo(struct ttm_resource *res,
> +			 struct ttm_buffer_object *bo);
>  
>  void ttm_resource_manager_init(struct ttm_resource_manager *man,
>  			       struct ttm_device *bdev,
> -- 
> 2.25.1
> 
