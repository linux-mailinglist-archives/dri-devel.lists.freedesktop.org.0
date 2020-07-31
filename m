Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7042346EA
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 15:32:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B046EAB0;
	Fri, 31 Jul 2020 13:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2088.outbound.protection.outlook.com [40.107.243.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC4E46EAB0
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 13:32:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XogU3hxRcjI+lXL4vxVdWvSL0irxfIKiPYi7xMRtWE1uVDCOv2A3a8FL9NB8pezLylW1FwHN1IqX0X3ZbzJ0WzIMOpm2Xi0OaSS81XiKRA4yKzsc6LwRdX0YeVRxuEb0xTfkuswRIXIzmsTDM405vkLeBfVXpWGOSgNVZTC2nkUCHXlXWqs4AKRA1JyKCn0usqPkv5KNU5S98I8O1UIIeXg8Sn9isyKqkUwggphk4rkZhP8Vbw1iywq7Dtw5VHCc4p20LfMhs1B7b2oD4UQBWvlP5VG3b83/M8+sCWAK/2YI11uTGqlr3Rzxb7sNHEKll7Aegf3u0ZRolF2t5n9EpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xesSMv+ndlqQCdlBhppHTgHb5wQrybu1pVRco9II9nw=;
 b=RJeIqYMu3u6ltEhCIu705HcJfYLiXWK+lUkkXHn32mxzVmLOuh+UaGrazK08ubXC159fUeLj6T1umkiwgVe0eSgPXnRDmTAWaqwGKj12MGuGDaQPFTJUh8RyVpkX6UqO/V2OfmFUrcEXTGjEdFuw/FAWxuEYJXBcp4OYVGqlcKln6+HRq6TPjwvu+vU+BSkpLd8jEsZ1njwLZnC3l6BVAkoJTTvD8HnwZBT7LEim2+UxL31R6lmJXzMDAWd0hrMqQXYIQG0Y6cYwX8ZLbe660/uTYRBk3rvjWpvEHosB8uPxTGcYaLkxrAe75AwCR6Bcd7QDM/t84I/rooRTXqx+kw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xesSMv+ndlqQCdlBhppHTgHb5wQrybu1pVRco9II9nw=;
 b=xAP/g0wFkIhw3aFueSQmOlVCFirJA6iQQVxY1c1hJwU/pErvWcb2OR8yLvtgBn9gAYBwY+XvvykyjjwMi1BhCxQhhaog1w3qg1E0aHZvk0WLvXLGmofnLng0jleIlkZX3VC8KmDfeVNwBMrWC5vR6pyWBcN9PoesJ4P/O0JzLAw=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2356.namprd12.prod.outlook.com (2603:10b6:207:4d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17; Fri, 31 Jul
 2020 13:32:21 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 13:32:21 +0000
Subject: Re: [PATCH 39/49] drm/ttm: make ttm_bo_man_init/takedown take type +
 args
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-40-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ed4f79bc-d01e-bc78-77ef-5120ae70a64f@amd.com>
Date: Fri, 31 Jul 2020 15:32:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200731040520.3701599-40-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0202CA0002.eurprd02.prod.outlook.com
 (2603:10a6:200:89::12) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0202CA0002.eurprd02.prod.outlook.com (2603:10a6:200:89::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16 via Frontend
 Transport; Fri, 31 Jul 2020 13:32:20 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: cb37a627-f31c-442b-59b1-08d8355626eb
X-MS-TrafficTypeDiagnostic: BL0PR12MB2356:
X-Microsoft-Antispam-PRVS: <BL0PR12MB23568C4D3F1CFD8E065C1577834E0@BL0PR12MB2356.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:538;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: W26QNa6mn2SBNPThqV6vBq/VSWPA8xBPL430/cLKUvDReUgDn4t5OrWQSfYFCWk3q4p4OK4WKp8amH2jU7crZAoZy+VtdGCTfMO4Ed3P+GKDZTN4pY1oN+RUhe0T6Njnt3eJIEbb1IuJ8W47blx2cY/YFNN+JIUwQRzIKsU55cI+GVqCjZseX1pTbg7kecPhMX9+1ZzPYCXq5K5hBjDxEIICW7JuvCxgweNA/L4oZSUeoUtIe14VFQWyovPPw8yz9tLDHYpC9LiRJrglRHtTOoz+NhigyDBeU4yKMDTRHps4vaWoUA7LAWZF1RE9Wsl7yT0h8cb4CH4CZGfqw7YjYCGm6Wn63keuPFjBFNYY2NHH2msHSGCkQY6yFa39RBGY
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(346002)(376002)(396003)(136003)(39860400002)(5660300002)(86362001)(4326008)(30864003)(66946007)(31696002)(36756003)(66476007)(6486002)(8936002)(478600001)(8676002)(66556008)(2906002)(186003)(16526019)(6666004)(31686004)(83380400001)(316002)(2616005)(52116002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: c3GQryKQsrPVBpJdxC/m1NHEyHJi086jg/6X6QXQhn/Mnp16YDqox4eK0VVbizrT8pJx98VF0I03lq42X95kyxpqFNtV9egswPu2TdVsyX9fps6hQO1pU1C96C0m6TbPFoSDhXiNjrktqF85stLsHNFiCzz/zw6LLyquTKbAA9z7ZUGVSGG736kchjHg5x+GQMME4F5cctVRWKxkwQHdmSoHCfFBhYheeVGbhKSer2fULHVldHY7QDvBXbZ+8PWDxZJCionjygwwnRwuVsa86l30uJTL1Ur6PbAcPLL0zU53uitsaP2XDnSIXRqMSTKXz8rCWOGVgx2qdtWKK6BVrVnJv2+1dgvlUObQHe7LNiuQOqbPj3DtEVtIKlxuKFXqpd273U/wCq6Jxj/c09eYbQ5L+uaRktcYWJxW3lJhRe+Sbbu2+uXAZS9V4LnfNQVPwZN9liHz4iWswbLBwF/KONEu2ObBVV3V7NXw6oD8lM7hJotGbfmtxGTvVqooSeBSO1LUccAm8wRrEZtJ1nVcmX1Iw42gG+4sfMZwVOdtwH1CQqp/3BdNBQgHzzG8r2bk1uaFHahnjk2QhAObd29UKWH3qQCA4d9Gragz9U6ZNkCnR61x5/CNXufogJnp182dDvyxqqfm5K51YlLJp5Xd2ntIPh/meMbADcZMQP/C+7gMzhshfWfNLT6c7it3VXnKon+Fe3aF5lXW7/IUn+zXPw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb37a627-f31c-442b-59b1-08d8355626eb
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 13:32:21.2321 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dcTboj413UQCUcXmC9tXXW/JYphj5LlAUZ0gTK9Sh36P2Dk/QKYansiklW7SSzFu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2356
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
Cc: sroland@vmware.com, bskeggs@redhat.com, kraxel@redhat.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 31.07.20 um 06:05 schrieb Dave Airlie:
> From: Dave Airlie <airlied@redhat.com>
>
> This makes it easier to move these to a driver allocated system

No, sorry that looks like going into the wrong direction to me.

I already wanted to suggest to get rid of the size argument instead.

Christian.

>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 15 +++++------
>   drivers/gpu/drm/drm_gem_vram_helper.c   | 10 ++++----
>   drivers/gpu/drm/nouveau/nouveau_ttm.c   | 21 ++++++++++------
>   drivers/gpu/drm/qxl/qxl_ttm.c           | 12 +++------
>   drivers/gpu/drm/radeon/radeon_ttm.c     | 33 ++++++++++++-------------
>   drivers/gpu/drm/ttm/ttm_bo_manager.c    | 19 ++++++++++----
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     | 13 +++-------
>   include/drm/ttm/ttm_bo_driver.h         |  7 ++++--
>   8 files changed, 67 insertions(+), 63 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 4beec1c4e037..d4d81f808b01 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -67,12 +67,9 @@ static int amdgpu_ttm_init_on_chip(struct amdgpu_device *adev,
>   				    unsigned int type,
>   				    uint64_t size)
>   {
> -	struct ttm_mem_type_manager *man = ttm_manager_type(&adev->mman.bdev, type);
> -
> -	man->available_caching = TTM_PL_FLAG_UNCACHED;
> -	man->default_caching = TTM_PL_FLAG_UNCACHED;
> -
> -	return ttm_bo_man_init(&adev->mman.bdev, man, size >> PAGE_SHIFT);
> +	return ttm_bo_man_init(&adev->mman.bdev, type,
> +			       TTM_PL_FLAG_UNCACHED, TTM_PL_FLAG_UNCACHED,
> +			       false, size >> PAGE_SHIFT);
>   }
>   
>   /**
> @@ -2014,9 +2011,9 @@ void amdgpu_ttm_fini(struct amdgpu_device *adev)
>   
>   	amdgpu_vram_mgr_fini(adev);
>   	amdgpu_gtt_mgr_fini(adev);
> -	ttm_bo_man_takedown(&adev->mman.bdev, ttm_manager_type(&adev->mman.bdev, AMDGPU_PL_GDS));
> -	ttm_bo_man_takedown(&adev->mman.bdev, ttm_manager_type(&adev->mman.bdev, AMDGPU_PL_GWS));
> -	ttm_bo_man_takedown(&adev->mman.bdev, ttm_manager_type(&adev->mman.bdev, AMDGPU_PL_OA));
> +	ttm_bo_man_takedown(&adev->mman.bdev, AMDGPU_PL_GDS);
> +	ttm_bo_man_takedown(&adev->mman.bdev, AMDGPU_PL_GWS);
> +	ttm_bo_man_takedown(&adev->mman.bdev, AMDGPU_PL_OA);
>   	ttm_bo_device_release(&adev->mman.bdev);
>   	adev->mman.initialized = false;
>   	DRM_INFO("amdgpu: ttm finalized\n");
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index 08fbfa32540a..b98af8daa540 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -1103,7 +1103,6 @@ EXPORT_SYMBOL(drm_vram_mm_debugfs_init);
>   static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
>   			    uint64_t vram_base, size_t vram_size)
>   {
> -	struct ttm_mem_type_manager *man = ttm_manager_type(&vmm->bdev, TTM_PL_VRAM);
>   	int ret;
>   
>   	vmm->vram_base = vram_base;
> @@ -1116,9 +1115,10 @@ static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
>   	if (ret)
>   		return ret;
>   
> -	man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
> -	man->default_caching = TTM_PL_FLAG_WC;
> -	ret = ttm_bo_man_init(&vmm->bdev, man, vram_size >> PAGE_SHIFT);
> +	ret = ttm_bo_man_init(&vmm->bdev, TTM_PL_VRAM,
> +			      TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC,
> +			      TTM_PL_FLAG_WC, false,
> +			      vram_size >> PAGE_SHIFT);
>   	if (ret)
>   		return ret;
>   
> @@ -1127,7 +1127,7 @@ static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
>   
>   static void drm_vram_mm_cleanup(struct drm_vram_mm *vmm)
>   {
> -	ttm_bo_man_takedown(&vmm->bdev, ttm_manager_type(&vmm->bdev, TTM_PL_VRAM));
> +	ttm_bo_man_takedown(&vmm->bdev, TTM_PL_VRAM);
>   	ttm_bo_device_release(&vmm->bdev);
>   }
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index 1b9d9362132d..225f9af2eaa1 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -156,16 +156,17 @@ nouveau_ttm_init_host(struct nouveau_drm *drm, u8 kind)
>   static int
>   nouveau_ttm_init_vram(struct nouveau_drm *drm)
>   {
> -	struct ttm_mem_type_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
>   	struct nvif_mmu *mmu = &drm->client.mmu;
>   
> -	man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
> -	man->default_caching = TTM_PL_FLAG_WC;
> -
>   	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
> +		struct ttm_mem_type_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
> +
>   		/* Some BARs do not support being ioremapped WC */
>   		const u8 type = mmu->type[drm->ttm.type_vram].type;
>   
> +		man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
> +		man->default_caching = TTM_PL_FLAG_WC;
> +
>   		if (type & NVIF_MEM_UNCACHED) {
>   			man->available_caching = TTM_PL_FLAG_UNCACHED;
>   			man->default_caching = TTM_PL_FLAG_UNCACHED;
> @@ -178,7 +179,9 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
>   		ttm_bo_use_mm(man);
>   		return 0;
>   	} else {
> -		return ttm_bo_man_init(&drm->ttm.bdev, man,
> +		return ttm_bo_man_init(&drm->ttm.bdev, TTM_PL_VRAM,
> +				       TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC,
> +				       TTM_PL_FLAG_WC, false,
>   				       drm->gem.vram_available >> PAGE_SHIFT);
>   	}
>   }
> @@ -193,7 +196,7 @@ nouveau_ttm_fini_vram(struct nouveau_drm *drm)
>   		ttm_bo_force_list_clean(&drm->ttm.bdev, man);
>   		ttm_bo_man_cleanup(man);
>   	} else
> -		ttm_bo_man_takedown(&drm->ttm.bdev, man);
> +		ttm_bo_man_takedown(&drm->ttm.bdev, TTM_PL_VRAM);
>   }
>   
>   static int
> @@ -216,7 +219,9 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
>   	else if (!drm->agp.bridge)
>   		man->func = &nv04_gart_manager;
>   	else
> -		return ttm_bo_man_init(&drm->ttm.bdev, man,
> +		return ttm_bo_man_init(&drm->ttm.bdev, TTM_PL_TT,
> +				       TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC,
> +				       TTM_PL_FLAG_WC, true,
>   				       size_pages);
>   
>   	ttm_bo_init_mm_base(&drm->ttm.bdev, man,
> @@ -232,7 +237,7 @@ nouveau_ttm_fini_gtt(struct nouveau_drm *drm)
>   
>   	if (drm->client.device.info.family < NV_DEVICE_INFO_V0_TESLA &&
>   	    drm->agp.bridge)
> -		ttm_bo_man_takedown(&drm->ttm.bdev, man);
> +		ttm_bo_man_takedown(&drm->ttm.bdev, TTM_PL_TT);
>   	else {
>   		ttm_bo_disable_mm(man);
>   		ttm_bo_force_list_clean(&drm->ttm.bdev, man);
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index 9aea35a66e25..5b569415854e 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -219,12 +219,8 @@ static int qxl_ttm_init_mem_type(struct qxl_device *qdev,
>   				 unsigned int type,
>   				 uint64_t size)
>   {
> -	struct ttm_mem_type_manager *man = ttm_manager_type(&qdev->mman.bdev, type);
> -
> -	man->available_caching = TTM_PL_MASK_CACHING;
> -	man->default_caching = TTM_PL_FLAG_CACHED;
> -
> -	return ttm_bo_man_init(&qdev->mman.bdev, man, size);
> +	return ttm_bo_man_init(&qdev->mman.bdev, type, TTM_PL_MASK_CACHING,
> +			       TTM_PL_FLAG_CACHED, false, size);
>   }
>   
>   int qxl_ttm_init(struct qxl_device *qdev)
> @@ -266,8 +262,8 @@ int qxl_ttm_init(struct qxl_device *qdev)
>   
>   void qxl_ttm_fini(struct qxl_device *qdev)
>   {
> -	ttm_bo_man_takedown(&qdev->mman.bdev, ttm_manager_type(&qdev->mman.bdev, TTM_PL_VRAM));
> -	ttm_bo_man_takedown(&qdev->mman.bdev, ttm_manager_type(&qdev->mman.bdev, TTM_PL_PRIV));
> +	ttm_bo_man_takedown(&qdev->mman.bdev, TTM_PL_VRAM);
> +	ttm_bo_man_takedown(&qdev->mman.bdev, TTM_PL_PRIV);
>   	ttm_bo_device_release(&qdev->mman.bdev);
>   	DRM_INFO("qxl: ttm finalized\n");
>   }
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 3849d0e852bc..793031bb9bd2 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -68,36 +68,35 @@ struct radeon_device *radeon_get_rdev(struct ttm_bo_device *bdev)
>   
>   static int radeon_ttm_init_vram(struct radeon_device *rdev)
>   {
> -	struct ttm_mem_type_manager *man = ttm_manager_type(&rdev->mman.bdev, TTM_PL_VRAM);
> -
> -	man->available_caching = TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC;
> -	man->default_caching = TTM_PL_FLAG_WC;
> -
> -	return ttm_bo_man_init(&rdev->mman.bdev, man,
> +	return ttm_bo_man_init(&rdev->mman.bdev, TTM_PL_VRAM,
> +			       TTM_PL_FLAG_UNCACHED | TTM_PL_FLAG_WC,
> +			       TTM_PL_FLAG_WC, false,
>   			       rdev->mc.real_vram_size >> PAGE_SHIFT);
>   }
>   
>   static int radeon_ttm_init_gtt(struct radeon_device *rdev)
>   {
> -	struct ttm_mem_type_manager *man = ttm_manager_type(&rdev->mman.bdev, TTM_PL_TT);
> +	uint32_t available_caching, default_caching;
> +
> +	available_caching = TTM_PL_MASK_CACHING;
> +	default_caching = TTM_PL_FLAG_CACHED;
>   
> -	man->available_caching = TTM_PL_MASK_CACHING;
> -	man->default_caching = TTM_PL_FLAG_CACHED;
> -	man->use_tt = true;
>   #if IS_ENABLED(CONFIG_AGP)
>   	if (rdev->flags & RADEON_IS_AGP) {
>   		if (!rdev->ddev->agp) {
>   			DRM_ERROR("AGP is not enabled\n");
>   			return -EINVAL;
>   		}
> -		man->available_caching = TTM_PL_FLAG_UNCACHED |
> -					 TTM_PL_FLAG_WC;
> -		man->default_caching = TTM_PL_FLAG_WC;
> +		available_caching = TTM_PL_FLAG_UNCACHED |
> +			TTM_PL_FLAG_WC;
> +		default_caching = TTM_PL_FLAG_WC;
>   	}
>   #endif
>   
> -	return ttm_bo_man_init(&rdev->mman.bdev, man,
> -			      rdev->mc.gtt_size >> PAGE_SHIFT);
> +	return ttm_bo_man_init(&rdev->mman.bdev, TTM_PL_TT,
> +			       available_caching,
> +			       default_caching, true,
> +			       rdev->mc.gtt_size >> PAGE_SHIFT);
>   }
>   
>   static void radeon_evict_flags(struct ttm_buffer_object *bo,
> @@ -825,8 +824,8 @@ void radeon_ttm_fini(struct radeon_device *rdev)
>   		}
>   		radeon_bo_unref(&rdev->stolen_vga_memory);
>   	}
> -	ttm_bo_man_takedown(&rdev->mman.bdev, ttm_manager_type(&rdev->mman.bdev, TTM_PL_VRAM));
> -	ttm_bo_man_takedown(&rdev->mman.bdev, ttm_manager_type(&rdev->mman.bdev, TTM_PL_TT));
> +	ttm_bo_man_takedown(&rdev->mman.bdev, TTM_PL_VRAM);
> +	ttm_bo_man_takedown(&rdev->mman.bdev, TTM_PL_TT);
>   	ttm_bo_device_release(&rdev->mman.bdev);
>   	radeon_gart_fini(rdev);
>   	rdev->mman.initialized = false;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_manager.c b/drivers/gpu/drm/ttm/ttm_bo_manager.c
> index f60a9a5d429d..2f5fa44b6474 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_manager.c
> @@ -107,19 +107,27 @@ static void ttm_bo_man_put_node(struct ttm_mem_type_manager *man,
>   static const struct ttm_mem_type_manager_func ttm_bo_manager_func;
>   
>   int ttm_bo_man_init(struct ttm_bo_device *bdev,
> -		    struct ttm_mem_type_manager *man,
> +		    unsigned type,
> +		    uint32_t available_caching,
> +		    uint32_t default_caching,
> +		    bool use_tt,
>   		    unsigned long p_size)
>   {
> +	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, type);
>   	struct ttm_range_manager *rman;
>   
> -	man->func = &ttm_bo_manager_func;
> -
> -	ttm_bo_init_mm_base(bdev, man, p_size);
> +	man->available_caching = available_caching;
> +	man->default_caching = default_caching;
> +	man->use_tt = use_tt;
>   
>   	rman = kzalloc(sizeof(*rman), GFP_KERNEL);
>   	if (!rman)
>   		return -ENOMEM;
>   
> +	man->func = &ttm_bo_manager_func;
> +
> +	ttm_bo_init_mm_base(bdev, man, p_size);
> +
>   	drm_mm_init(&rman->mm, 0, p_size);
>   	spin_lock_init(&rman->lock);
>   	man->priv = rman;
> @@ -130,8 +138,9 @@ int ttm_bo_man_init(struct ttm_bo_device *bdev,
>   EXPORT_SYMBOL(ttm_bo_man_init);
>   
>   int ttm_bo_man_takedown(struct ttm_bo_device *bdev,
> -			struct ttm_mem_type_manager *man)
> +			unsigned type)
>   {
> +	struct ttm_mem_type_manager *man = ttm_manager_type(bdev, type);
>   	struct ttm_range_manager *rman = (struct ttm_range_manager *) man->priv;
>   	struct drm_mm *mm = &rman->mm;
>   	int ret;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index dff6990ff9ed..1849d913d521 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -626,13 +626,9 @@ static int vmw_init_vram_manager(struct vmw_private *dev_priv)
>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>   	ret = vmw_thp_init(dev_priv);
>   #else
> -	struct ttm_mem_type_manager *man = &dev_priv->bdev.man[TTM_PL_VRAM];
> -
> -	man->available_caching = TTM_PL_FLAG_CACHED;
> -	man->default_caching = TTM_PL_FLAG_CACHED;
> -
> -	ret = ttm_bo_man_init(&dev_priv->bdev, man,
> -			      dev_priv->vram_size >> PAGE_SHIFT);
> +	ret = ttm_bo_man_init(&dev_priv->bdev, TTM_PL_VRAM,
> +			      TTM_PL_FLAG_CACHED, TTM_PL_FLAG_CACHED,
> +			      false, dev_priv->vram_size >> PAGE_SHIFT);
>   #endif
>   	ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM)->use_type = false;
>   	return ret;
> @@ -643,8 +639,7 @@ static void vmw_takedown_vram_manager(struct vmw_private *dev_priv)
>   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>   	vmw_thp_takedown(dev_priv);
>   #else
> -	ttm_bo_man_takedown(&dev_priv->bdev,
> -			    ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM));
> +	ttm_bo_man_takedown(&dev_priv->bdev, TTM_PL_VRAM);
>   #endif
>   }
>   
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index 723171fd94da..6319d85d7270 100644
> --- a/include/drm/ttm/ttm_bo_driver.hA r
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -809,8 +809,11 @@ int ttm_bo_pipeline_gutting(struct ttm_buffer_object *bo);
>   pgprot_t ttm_io_prot(uint32_t caching_flags, pgprot_t tmp);
>   
>   int ttm_bo_man_init(struct ttm_bo_device *bdev,
> -		    struct ttm_mem_type_manager *man,
> +		    unsigned type,
> +		    uint32_t available_caching,
> +		    uint32_t default_caching,
> +		    bool use_tt,
>   		    unsigned long p_size);
>   int ttm_bo_man_takedown(struct ttm_bo_device *bdev,
> -			struct ttm_mem_type_manager *man);
> +			unsigned type);
>   #endif

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
