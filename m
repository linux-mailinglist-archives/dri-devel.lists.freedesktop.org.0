Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B853145E817
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 07:52:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEE6E6E80B;
	Fri, 26 Nov 2021 06:52:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2062.outbound.protection.outlook.com [40.107.101.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5FBD6E80B
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 06:52:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nrgetxc4zn1Q2wJ/2HZNobpbYCQnTLp1xsBbdktdlK84pJgsv/Derwcw22/ysuCeOy2Ldi9KpuniHM7QDsu4M2zLnvIW423zk5ugM5Y4LCs9sXy8ZTmeg5r6xMQiCfsFZ11cw48HPtAU5qNjv8LVJbKCecs0uC6x7iwwoz3Nrd/mR5d+L87Gjln2fNmp9Y3YYZAbAGWnoWwg2/TEpB5mrPKf2e6k8IC5XhCY31+R/EYAZkViozX+IdtKXkKbICYJLP3QksIRuy3V4b+KEI3pwbllA1XJXs9TB/qact9VmP1EeUxLnaGYaG/5GnEbEMMJWPgQF0ZfdCNgAoUZdcmciQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UYDJ32MKSbSNw+pVGcAU6JiI28XWIKiyLBWr+f876zI=;
 b=fGaxeKF21ttNCXS57BfufymFbsA4lywG7J2VaUZ5fEYqI/qHsobtWscDXYpGYwetyedCauAt+v5eTiMbQPfRiKbvEREcKjrDBH1GrhUeGF/zRxkxhhyUmYtSyNGgsMV3wfE3ZEZ1AKFkhx/fzrM6/tJxvKkm4X1VH2QQvKOnvsNkOsJcVUXuGNYhewV/b3yjra5j9DoD75tPrfGT09DaJA6ccxyPnF5EjlMA90mQ6VQiL8AIqvxyzfgWFBshuYo6sDvBfhNCVYnbYMz9w8vIKY/sYfmdDka0IwDoJk/mRBhUnel3qeEbmc+38XS7DoyDL/MoSHAby3deLFaNO6ZGzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UYDJ32MKSbSNw+pVGcAU6JiI28XWIKiyLBWr+f876zI=;
 b=IPxD4kCYKOHyTVTSd37ehyWP/jST1+E3cdVvPvBaW6z1Pgyt/VfcP0rcGGKHhXaT69z+pBJ0zYzGrmYwP2VqUr13gFKVF3PgiLODPFz6P0KdZJP/KkPlA5XvEZGVq7FJ8oCSjxsRoI0PSoIHp4vWl04gfUaI9gSEasDar/LAmbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BY5PR12MB4918.namprd12.prod.outlook.com (2603:10b6:a03:1df::22)
 by BY5PR12MB3924.namprd12.prod.outlook.com (2603:10b6:a03:1af::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.19; Fri, 26 Nov
 2021 06:52:25 +0000
Received: from BY5PR12MB4918.namprd12.prod.outlook.com
 ([fe80::d519:1ea0:33a6:8193]) by BY5PR12MB4918.namprd12.prod.outlook.com
 ([fe80::d519:1ea0:33a6:8193%6]) with mapi id 15.20.4713.027; Fri, 26 Nov 2021
 06:52:25 +0000
Date: Fri, 26 Nov 2021 14:52:06 +0800
From: Huang Rui <ray.huang@amd.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH 02/12] drm/ttm: add back a reference to the bdev to the
 res manager
Message-ID: <YaCEFo6rzjn3I/B4@amd.com>
References: <20211124124430.20859-1-christian.koenig@amd.com>
 <20211124124430.20859-3-christian.koenig@amd.com>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211124124430.20859-3-christian.koenig@amd.com>
X-ClientProxiedBy: HK2PR0401CA0007.apcprd04.prod.outlook.com
 (2603:1096:202:2::17) To BY5PR12MB4918.namprd12.prod.outlook.com
 (2603:10b6:a03:1df::22)
MIME-Version: 1.0
Received: from amd.com (165.204.134.251) by
 HK2PR0401CA0007.apcprd04.prod.outlook.com (2603:1096:202:2::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Fri, 26 Nov 2021 06:52:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ff3eb8aa-e00e-4863-94d7-08d9b0a94e19
X-MS-TrafficTypeDiagnostic: BY5PR12MB3924:
X-Microsoft-Antispam-PRVS: <BY5PR12MB392414A0B14D9B9935912CA7EC639@BY5PR12MB3924.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3383;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6p3JxMC9V9xH/zF2jm+MXiuZS6c3riBXueaj6Kyh6rS13orRuXNcMStkHWtSOWkiwamFJGDhxWE+yIkAvEijdeXdgku7Md4P3hYc6fWh1VWHXtS2KMOlihQhdHlY2EPVCW2rb57NpMNNBa5zLTinWtBYF6k2Kx3cB0GRj615uW8FSzBe5MQwll+CFaJih+sxW9p4eUOQc+tLLtb5ZjG4xWqCNyPW4icCJDh+FTBD+SRSm3QT3IvuBkJ4yVVMCGRo6JSoeVWo5zu6/dH+/iwg9qtI5SeyRQA39qh07AQ8ddbNFfhknST2+JjuAJSm6kOQp5qRywtZqkMxE7g7bymPww6rbXOb6AgItny60OyXKOKIjZLbZS/8tOOaOty6CneUScJa4IDKbi3cqjoVtGTHgp9dZfUH8rXek/NWkeLSbuG8o86q/lXjPfPRtXRUTmE6ksUhBSVwA4dgYElKeexhm9/qMcY6HKa+UijI8aBNWT22J/F4Bz00yp8aokXt9laKJSqnJ2MAW//JbmIND8lJ78Qy6w7SvOYlzdi/hddjesXFsLZstUuNLNP+BIxVJDI6PAw8sYf2A3EoPnq4m/eumabxC9vc/APcPMUVtITfNE/ubjGzOsIA7Mo0G1991BZR0w+gdoiJjP5LI8wf4firtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4918.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(55016003)(66556008)(66476007)(86362001)(6666004)(26005)(36756003)(2906002)(38100700002)(8676002)(6916009)(83380400001)(66574015)(2616005)(316002)(956004)(186003)(4326008)(8936002)(66946007)(54906003)(8886007)(7696005)(508600001)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?szJ5ltPI3CHIfl+c86oqxRpDVRAZtL30Oy/kuC8uwvhUrT1lc0haoZ1hls?=
 =?iso-8859-1?Q?uUDlue8vLjywU7iA6LsMzbuEtkmOxXHKAfJbpsYz9ogujZo94yw79o0oEv?=
 =?iso-8859-1?Q?seHRd56ltIzx0+Uld1cdnlWjI67MRT4sHcmpf2PjioODoJDj1a8jSt1oUl?=
 =?iso-8859-1?Q?iDnQafX4Z8z/T3PStCxZQvIOjCnJTMACM9XBL18vXpwloOxrW8zxJ1SLho?=
 =?iso-8859-1?Q?5oPLddF+kbOU5s4KavmQpZTtpc97olm8GIqze73AeKrRe22e++n61FcCwH?=
 =?iso-8859-1?Q?tYdEv688AgK9v9puwvIppgOskpzb7w6eH+6sRxB1Ow6zBaozqVzFehjYUx?=
 =?iso-8859-1?Q?1fgOi0g4XaHmjsb4szP1UmnWANTf6jNQX2Bp5Puc/1oHODi1Hq0rPgTL76?=
 =?iso-8859-1?Q?euy2U0PqYnPje5kVvVwMNi8CaIP7YVP7EcrnMHYgkRLp38ZkDtYvhYtTzm?=
 =?iso-8859-1?Q?OyO91iCxLXEIjwXwBc6pkq05LWkcnLEmStfqjgfZ8RTjOmR0MV91QXMno4?=
 =?iso-8859-1?Q?cYa/3B1eq4ZMSju/jlVx7K8lK0wcVu/CLou4HH+b4FteQKvBgE4WjrQQQe?=
 =?iso-8859-1?Q?+PytBUdA2/XkXMEKOGNq4QAgWUmynX6bmjWieEPFb6fUdFl1Z0Ke+vGgc2?=
 =?iso-8859-1?Q?Oz7+OwcD9YHNpAB7g1GwmJSwgjwbT/rKBg/0zMxCKLFPcBr6oJRSPPuW9l?=
 =?iso-8859-1?Q?ivqXD5Yk6Q9C4uipaFiAO2skggSs1AaDB7KHTdalPhr9eK2GxJ7MfNz0Jf?=
 =?iso-8859-1?Q?si7n4qugs1qViSYclTfNbGqdvcrDYW+crfIo2X/t+dHEbGj/Fa2HWwmffB?=
 =?iso-8859-1?Q?lRSk1b7fpB7FbAcdV+5/Nb3jS3+961XoG6sekh+knRF/qbTWW301iACW0H?=
 =?iso-8859-1?Q?kzXaZqN5J7dZxyjQ4Hvqus0Qy1jOCraQnibi8IN4W8kNVIE3IjAr6g+PYD?=
 =?iso-8859-1?Q?IjEN7+sbnZN1ti7cXQHILBFunEkgntTpnDXwXxY9dXuuDcNM8ZEElYSlBs?=
 =?iso-8859-1?Q?KrcBgZPCtixESp7hw/vlkAFGvWEvrDwHVN3FTNxq+6vL3tqxitoooAcddI?=
 =?iso-8859-1?Q?MWQSCrCA5Z4oqkx9ps9CZq/NCfHTx1ZNcuGvaC89Akj/p3nIcvXU5C0mvh?=
 =?iso-8859-1?Q?z9KjN43l4hFOHUqHWVz8hKtlVwkaCYdGT8oCRnPlQdRAEbX1inLX3AMXxb?=
 =?iso-8859-1?Q?KKjlXXqQHyYDGdDxDckQh4kK5Mztor2mc2ovSssNS3MOuct8ZDeqYNp2a7?=
 =?iso-8859-1?Q?TuvSuuFiafxsezdrnWMIX11mCr+xPSn4wHI09JtbkzdxvPLV7ha/kikPpT?=
 =?iso-8859-1?Q?xJ/ECb23tbdG3Q54SJMo4tQMUbR7BqofOJH4ZDBAuZm62NFrMLtLHVfWI7?=
 =?iso-8859-1?Q?rzoF2BM4lUaYmwRqAFxJDaUJr6NJPrZdho5gU9sYfblIsew/aa3ijAK/dH?=
 =?iso-8859-1?Q?XPCOeYMqv/Ij4YZ/Vdm7skib3QRyZGLFMdL1UcjO+3dASiYEg+i7Afok/K?=
 =?iso-8859-1?Q?KWM+k9ae5FgfbNYq3xDM1DlX+Ba1MF8+X5HNWtj5Lxf5TeY6tpuI439x9z?=
 =?iso-8859-1?Q?HAxYc1ebu6tyiy0TAWxFGDo++B7yuflhjdEB/o1wcCBX59zDaN/ROSUsqe?=
 =?iso-8859-1?Q?s0lM1c5/cCsZaMLYxvcwPkl0+k8pnG2/rISMofl2f05gS3GUB7xLkRhana?=
 =?iso-8859-1?Q?HNeyAIW643tMUcY204M=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff3eb8aa-e00e-4863-94d7-08d9b0a94e19
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4918.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2021 06:52:25.8156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5GiOA0ZXmKsA+JwtGqRan1BzwOgMRRb2DMRm7TSIY7VrcIuw/RzjRBXG57gy3jsBQAI2x1uhx8Jjs9lUbHo7vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB3924
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

On Wed, Nov 24, 2021 at 08:44:20PM +0800, Christian König wrote:
> It is simply a lot cleaner to have this around instead of adding
> the device throughout the call chain.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>

Reviewed-by: Huang Rui <ray.huang@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c     |  3 ++-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c |  2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c    |  3 ++-
>  drivers/gpu/drm/i915/i915_ttm_buddy_manager.c   |  2 +-
>  drivers/gpu/drm/nouveau/nouveau_ttm.c           |  4 ++--
>  drivers/gpu/drm/ttm/ttm_range_manager.c         |  2 +-
>  drivers/gpu/drm/ttm/ttm_resource.c              |  3 +++
>  drivers/gpu/drm/ttm/ttm_sys_manager.c           |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c   |  2 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_thp.c             |  2 +-
>  include/drm/ttm/ttm_resource.h                  | 16 +++++++++-------
>  11 files changed, 24 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index ea5470c8c921..9e7685a4878c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -293,7 +293,8 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
>  	man->use_tt = true;
>  	man->func = &amdgpu_gtt_mgr_func;
>  
> -	ttm_resource_manager_init(man, gtt_size >> PAGE_SHIFT);
> +	ttm_resource_manager_init(man, &adev->mman.bdev,
> +				  gtt_size >> PAGE_SHIFT);
>  
>  	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
>  	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> index ffddec08e931..6f7189d32f0a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_preempt_mgr.c
> @@ -153,7 +153,7 @@ int amdgpu_preempt_mgr_init(struct amdgpu_device *adev)
>  	man->use_tt = true;
>  	man->func = &amdgpu_preempt_mgr_func;
>  
> -	ttm_resource_manager_init(man, (1 << 30));
> +	ttm_resource_manager_init(man, &adev->mman.bdev, (1 << 30));
>  
>  	atomic64_set(&mgr->used, 0);
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index 55d68408951d..ddd0b6d74070 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -699,7 +699,8 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
>  	struct amdgpu_vram_mgr *mgr = &adev->mman.vram_mgr;
>  	struct ttm_resource_manager *man = &mgr->manager;
>  
> -	ttm_resource_manager_init(man, adev->gmc.real_vram_size >> PAGE_SHIFT);
> +	ttm_resource_manager_init(man, &adev->mman.bdev,
> +				  adev->gmc.real_vram_size >> PAGE_SHIFT);
>  
>  	man->func = &amdgpu_vram_mgr_func;
>  
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index ca3ca1f7f850..ef535e04a88a 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -203,7 +203,7 @@ int i915_ttm_buddy_man_init(struct ttm_device *bdev,
>  	man = &bman->manager;
>  	man->use_tt = use_tt;
>  	man->func = &i915_ttm_buddy_manager_func;
> -	ttm_resource_manager_init(man, bman->mm.size >> PAGE_SHIFT);
> +	ttm_resource_manager_init(man, bdev, bman->mm.size >> PAGE_SHIFT);
>  
>  	ttm_resource_manager_set_used(man, true);
>  	ttm_set_driver_manager(bdev, type, man);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index 91ef33f8f22c..85f1f5a0fe5d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -164,7 +164,7 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
>  
>  		man->func = &nouveau_vram_manager;
>  
> -		ttm_resource_manager_init(man,
> +		ttm_resource_manager_init(man, &drm->ttm.bdev,
>  					  drm->gem.vram_available >> PAGE_SHIFT);
>  		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, man);
>  		ttm_resource_manager_set_used(man, true);
> @@ -211,7 +211,7 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
>  
>  	man->func = func;
>  	man->use_tt = true;
> -	ttm_resource_manager_init(man, size_pages);
> +	ttm_resource_manager_init(man, &drm->ttm.bdev, size_pages);
>  	ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, man);
>  	ttm_resource_manager_set_used(man, true);
>  	return 0;
> diff --git a/drivers/gpu/drm/ttm/ttm_range_manager.c b/drivers/gpu/drm/ttm/ttm_range_manager.c
> index 25fcf0d63c2d..062dabe6a10e 100644
> --- a/drivers/gpu/drm/ttm/ttm_range_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_range_manager.c
> @@ -156,7 +156,7 @@ int ttm_range_man_init_nocheck(struct ttm_device *bdev,
>  
>  	man->func = &ttm_range_manager_func;
>  
> -	ttm_resource_manager_init(man, p_size);
> +	ttm_resource_manager_init(man, bdev, p_size);
>  
>  	drm_mm_init(&rman->mm, 0, p_size);
>  	spin_lock_init(&rman->lock);
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 89bcfe22a0ca..41e7bf195168 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -126,16 +126,19 @@ EXPORT_SYMBOL(ttm_resource_compat);
>   * ttm_resource_manager_init
>   *
>   * @man: memory manager object to init
> + * @bdev: ttm device this manager belongs to
>   * @p_size: size managed area in pages.
>   *
>   * Initialise core parts of a manager object.
>   */
>  void ttm_resource_manager_init(struct ttm_resource_manager *man,
> +			       struct ttm_device *bdev,
>  			       unsigned long p_size)
>  {
>  	unsigned i;
>  
>  	spin_lock_init(&man->move_lock);
> +	man->bdev = bdev;
>  	man->size = p_size;
>  
>  	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
> diff --git a/drivers/gpu/drm/ttm/ttm_sys_manager.c b/drivers/gpu/drm/ttm/ttm_sys_manager.c
> index 135394dcca95..2ced169513cb 100644
> --- a/drivers/gpu/drm/ttm/ttm_sys_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_sys_manager.c
> @@ -43,7 +43,7 @@ void ttm_sys_man_init(struct ttm_device *bdev)
>  	man->use_tt = true;
>  	man->func = &ttm_sys_manager_func;
>  
> -	ttm_resource_manager_init(man, 0);
> +	ttm_resource_manager_init(man, bdev, 0);
>  	ttm_set_driver_manager(bdev, TTM_PL_SYSTEM, man);
>  	ttm_resource_manager_set_used(man, true);
>  }
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> index bfd686bb8d19..4fe4eeb95bf3 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> @@ -150,7 +150,7 @@ int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
>  	man->func = &vmw_gmrid_manager_func;
>  	/* TODO: This is most likely not correct */
>  	man->use_tt = true;
> -	ttm_resource_manager_init(man, 0);
> +	ttm_resource_manager_init(man, &dev_priv->bdev, 0);
>  	spin_lock_init(&gman->lock);
>  	gman->used_gmr_pages = 0;
>  	ida_init(&gman->gmr_ida);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> index 4fcbd94ccc11..b8cd89cd624c 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> @@ -135,7 +135,7 @@ int vmw_thp_init(struct vmw_private *dev_priv)
>  	if (!rman)
>  		return -ENOMEM;
>  
> -	ttm_resource_manager_init(&rman->manager,
> +	ttm_resource_manager_init(&rman->manager, &dev_priv->bdev,
>  				  dev_priv->vram_size >> PAGE_SHIFT);
>  
>  	rman->manager.func = &vmw_thp_func;
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index df1f06b7b504..6bf37383002b 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -105,11 +105,11 @@ struct ttm_resource_manager_func {
>   * @use_type: The memory type is enabled.
>   * @use_tt: If a TT object should be used for the backing store.
>   * @size: Size of the managed region.
> + * @bdev: ttm device this manager belongs to
>   * @func: structure pointer implementing the range manager. See above
>   * @move_lock: lock for move fence
> - * static information. bdev::driver::io_mem_free is never used.
> - * @lru: The lru list for this memory type.
>   * @move: The fence of the last pipelined move operation.
> + * @lru: The lru list for this memory type.
>   *
>   * This structure is used to identify and manage memory types for a device.
>   */
> @@ -119,20 +119,21 @@ struct ttm_resource_manager {
>  	 */
>  	bool use_type;
>  	bool use_tt;
> +	struct ttm_device *bdev;
>  	uint64_t size;
>  	const struct ttm_resource_manager_func *func;
>  	spinlock_t move_lock;
>  
>  	/*
> -	 * Protected by the global->lru_lock.
> +	 * Protected by @move_lock.
>  	 */
> -
> -	struct list_head lru[TTM_MAX_BO_PRIORITY];
> +	struct dma_fence *move;
>  
>  	/*
> -	 * Protected by @move_lock.
> +	 * Protected by the global->lru_lock.
>  	 */
> -	struct dma_fence *move;
> +
> +	struct list_head lru[TTM_MAX_BO_PRIORITY];
>  };
>  
>  /**
> @@ -272,6 +273,7 @@ bool ttm_resource_compat(struct ttm_resource *res,
>  			 struct ttm_placement *placement);
>  
>  void ttm_resource_manager_init(struct ttm_resource_manager *man,
> +			       struct ttm_device *bdev,
>  			       unsigned long p_size);
>  
>  int ttm_resource_manager_evict_all(struct ttm_device *bdev,
> -- 
> 2.25.1
> 
