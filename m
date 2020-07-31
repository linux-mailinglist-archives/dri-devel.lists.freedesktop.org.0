Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15046234819
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jul 2020 16:59:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE1596EADA;
	Fri, 31 Jul 2020 14:59:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700074.outbound.protection.outlook.com [40.107.70.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37416EADB
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jul 2020 14:59:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UNYttvwUcMIip2yR5E1gV4fbwxC1v/0A+UXrePgBmkxVfEItMwhYyXeVvrd4MeqhgRvbetV75mzx9p45gZsADkKX6rshobhlYpB6dRU+mEGNx1QLtHsBdOwlmE7eC9Mx3R977flFMCvhaZUNfF9fhpKsPCJzQsLH1eoJ8j1ZxCMSNEUylOMkqh7lAH+mpD2MuU5/x76RRvp+Fh4ddMmvlbjXoL8oSO8tX7hOEYWFDQo3XjOj2ZGNBWA6B4S3lPUrTwU46P7HVexBT8gRZ4kAz5UBvRM1+Y3VUm72gOVpyaeqgG1UK4vGJ9fgpc4dUzVxf4QbaFWbUdfBVSNzjoEgsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFDumJKoO0O7I5b00ZoiYIxAeU0aFGFhmcPHAmjMCeg=;
 b=MYgaBXLzAnuPjyubbCJvnRDqkCYuYK+JSn+2HooObwBRgUTe8pcrWfhQRsRdgXF2vegjgNW/mSYVRxbgoGQrfnqETSNstLpGI1xhGfIZOhVi1lbRTcVwhBqxRpw7Yzstwn5GB691m8MYSPkj+7n19ETms9tGyMtF91ppkpdbY6vue+h2OrXWeJJXtGn3HZaiS1blxxmiIJHgsMPUP0LEWhrxUTmIeLJuroof5clQGWEiFuANWrvwfPUQ4HDc1nR3sQYcNBOTPEaCHtBM7B2cZCcRkBXNrAHtYiWvLlfXCnG8p/4XQQgSaIqirEG4X0aGtIQMPmNZtMksWc5916r+hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pFDumJKoO0O7I5b00ZoiYIxAeU0aFGFhmcPHAmjMCeg=;
 b=e3V/BC3BRQDNBMuUHU5iQBwY27ef3j5EOtYqdIcF1YewtCziHzqWsH1Oa1hIM7jlelhqjyYq0KrVJ+/Kn31d9QHYuwjskhBKTEGphkhUHIQtCK/yOh/rx7LsyWnKknVor0jofbZFwQ2v2CcISbnKUwlezPCsVX2uSpJRIGLyRDM=
Authentication-Results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3998.namprd12.prod.outlook.com (2603:10b6:208:16d::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.16; Fri, 31 Jul
 2020 14:59:22 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::a16e:8812:b4c0:918d%6]) with mapi id 15.20.3239.020; Fri, 31 Jul 2020
 14:59:21 +0000
Subject: Re: [PATCH 49/49] drm/ttm: consolidate manager used apis into a set
 and get.
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20200731040520.3701599-1-airlied@gmail.com>
 <20200731040520.3701599-50-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <260649c2-daad-fa0f-6b7b-132087abec18@amd.com>
Date: Fri, 31 Jul 2020 16:59:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20200731040520.3701599-50-airlied@gmail.com>
Content-Language: en-US
X-ClientProxiedBy: AM4PR0202CA0004.eurprd02.prod.outlook.com
 (2603:10a6:200:89::14) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM4PR0202CA0004.eurprd02.prod.outlook.com (2603:10a6:200:89::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3239.17 via Frontend
 Transport; Fri, 31 Jul 2020 14:59:20 +0000
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 4fa212be-09d7-41e5-805a-08d835624eab
X-MS-TrafficTypeDiagnostic: MN2PR12MB3998:
X-Microsoft-Antispam-PRVS: <MN2PR12MB3998FA7E5E5EF3D9ECE210C4834E0@MN2PR12MB3998.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yrr3Zz8UV/hCRC3q+HMnn0SAdjkj/FePMDG+kekcpYflOV+XK01/8cZ9wtqa8yXlmmQNsQiEUlhA9nP8JNHZMQ9YnYriKHJOPUBa1Mtbn8O7cbl4MzxoPyfb79g1dakuK8D3TXAf/Mxp5aGiZd/9wIlcjBjHyhxqyODf3KcI96IxZevIRYD5bk77oZlVnz9z/TPQazcv0l4oFnwMqNWINcRUi/e9Qqd6fBJDgBLtyoUEcQyqF7OuuCyZiMRKen7FRRvT/uUPikHUhSuFOtON32Q2gz2ZxEtRMKCM9BpqkkkttEeSYwTPyO0jwJSGQ+OQRNVfYirFfVyUfeEU4Zh8LDp8dUY9uKyOEFU9NFT26K/ZbrEXmFb2ZAfGyrc2+TOf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(136003)(366004)(346002)(376002)(396003)(39860400002)(2906002)(31686004)(8936002)(6486002)(4326008)(6666004)(2616005)(8676002)(83380400001)(31696002)(16526019)(478600001)(186003)(36756003)(30864003)(66946007)(66476007)(66556008)(86362001)(52116002)(316002)(5660300002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 7JTsuHbWCDdDu8cdNqxiwzoNJwshQyfr2jlEdAX8Yob+Nbtw8xb19Tix6ihqqPe5js2H/nvH8mlvrDv+S4jdmcSh1Yyw1KwetqU/363IxfFcwG3eUI7MiocTdCj1qbH+Elt1TOYIwwnrrtVXNA42ldmcqQzJMf4l1dL/ctjtuOf07IT+IAC4R4mLPymUDkPzqXaH4tgJD86e8kvDIe6sESWtc10y0aTI2BjeaaWZwg/gOg6bFwszgobBcUJ1Ig7p8Ee2EovXF8ltLCauh9cCH4O1FSM8Dsc8VlFRuwQvT0Pj9AqRpZ2iqbX5LMgrQaX6GYWciTWFWLC/71XeR2N2hGLXJpHxWf83oZ2Qo0drr0YxlhUBqcMGajRIyz4T89xv50LNFAv2QXOONv50uRHdxyuhOU94OBZQ2n/eAbX0IDyNS+kRrrqESwmUWd53d8oaAsjje/pgnbC1jQI+4HvvJKGc5g5fzSJ5DTQiDvBOLpDEu/nrJdqOAcEWJux0OqxYUkN9uFdA6+pnsTM2BPXbc38SGuBSOCc5xjDnXJIiIx+fiAm+ANSQhPqzCD3OJbWF0tJiomjq41yLyL8QVwtFCujSxAiX22D5rWX3SjrWf5FDhqqOBanE4O7q+ZM+qrkRWwcmFS8Y7frhPVB6kUR3ECQHL4BnvLrx1IQgyHaELi4Ie9tEj2rzgtUuvALfVCXlO7/3rbUYjqJ78MEbNPLGiw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fa212be-09d7-41e5-805a-08d835624eab
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2020 14:59:21.7723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rdk8bpIjywb7BIw185IGpL9gWO5YGjmTUIle/PIdO6z/JNLAU5vypx3Z3lKkd8Um
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3998
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
> This is probably something we could consider removing, vmwgfx
> is the only user, and we might be able to faciliate it another way
>
> but for now just consolidate it all into accessors.

I always found the "use_type" wording confusing and this set_use() name 
even more confusing.

Why not call it "enabled"?

Christian.

>
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c   |  4 ++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |  4 ++--
>   drivers/gpu/drm/nouveau/nouveau_ttm.c         |  8 ++++----
>   drivers/gpu/drm/ttm/ttm_bo.c                  |  6 +++---
>   drivers/gpu/drm/ttm/ttm_bo_manager.c          |  4 ++--
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           | 14 +++++++-------
>   drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c |  4 ++--
>   drivers/gpu/drm/vmwgfx/vmwgfx_thp.c           |  4 ++--
>   include/drm/ttm/ttm_bo_driver.h               |  8 ++++----
>   9 files changed, 28 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index b4480ca30988..7e84aa2c0064 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -128,7 +128,7 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
>   	}
>   
>   	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_TT, &mgr->manager);
> -	ttm_bo_use_mm(man);
> +	ttm_mm_set_use(man, true);
>   	return 0;
>   }
>   
> @@ -146,7 +146,7 @@ void amdgpu_gtt_mgr_fini(struct amdgpu_device *adev)
>   	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
>   	int ret;
>   
> -	ttm_bo_disable_mm(man);
> +	ttm_mm_set_use(man, false);
>   
>   	ret = ttm_bo_force_list_clean(&adev->mman.bdev, man);
>   	if (ret)
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index f0e65a6fdf88..50949aa968fd 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -205,7 +205,7 @@ int amdgpu_vram_mgr_init(struct amdgpu_device *adev)
>   		DRM_ERROR("Failed to register sysfs\n");
>   
>   	ttm_set_driver_manager(&adev->mman.bdev, TTM_PL_VRAM, &mgr->manager);
> -	ttm_bo_use_mm(man);
> +	ttm_mm_set_use(man, true);
>   	return 0;
>   }
>   
> @@ -223,7 +223,7 @@ void amdgpu_vram_mgr_fini(struct amdgpu_device *adev)
>   	struct amdgpu_vram_mgr *mgr = to_vram_mgr(man);
>   	int ret;
>   
> -	ttm_bo_disable_mm(man);
> +	ttm_mm_set_use(man, false);
>   
>   	ret = ttm_bo_force_list_clean(&adev->mman.bdev, man);
>   	if (ret)
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index 89521d3ed9da..32ce930d1bd8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -176,7 +176,7 @@ nouveau_ttm_init_vram(struct nouveau_drm *drm)
>   		man->use_io_reserve_lru = true;
>   		ttm_bo_init_mm_base(man, drm->gem.vram_available >> PAGE_SHIFT);
>   		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, man);
> -		ttm_bo_use_mm(man);
> +		ttm_mm_set_use(man, true);
>   		return 0;
>   	} else {
>   		return ttm_bo_man_init(&drm->ttm.bdev, TTM_PL_VRAM,
> @@ -192,7 +192,7 @@ nouveau_ttm_fini_vram(struct nouveau_drm *drm)
>   	struct ttm_mem_type_manager *man = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
>   
>   	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA) {
> -		ttm_bo_disable_mm(man);
> +		ttm_mm_set_use(man, false);
>   		ttm_bo_force_list_clean(&drm->ttm.bdev, man);
>   		ttm_bo_man_cleanup(man);
>   		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_VRAM, NULL);
> @@ -237,7 +237,7 @@ nouveau_ttm_init_gtt(struct nouveau_drm *drm)
>   	man->use_tt = true;
>   	ttm_bo_init_mm_base(man, size_pages);
>   	ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, man);
> -	ttm_bo_use_mm(man);
> +	ttm_mm_set_use(man, true);
>   	return 0;
>   }
>   
> @@ -250,7 +250,7 @@ nouveau_ttm_fini_gtt(struct nouveau_drm *drm)
>   	    drm->agp.bridge)
>   		ttm_bo_man_takedown(&drm->ttm.bdev, TTM_PL_TT);
>   	else {
> -		ttm_bo_disable_mm(man);
> +		ttm_mm_set_use(man, false);
>   		ttm_bo_force_list_clean(&drm->ttm.bdev, man);
>   		ttm_bo_man_cleanup(man);
>   		ttm_set_driver_manager(&drm->ttm.bdev, TTM_PL_TT, NULL);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index bfc20cb27ed6..3bec6e4bc87d 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -996,7 +996,7 @@ static int ttm_bo_mem_placement(struct ttm_buffer_object *bo,
>   		return ret;
>   
>   	man = ttm_manager_type(bdev, mem_type);
> -	if (!man || !man->use_type)
> +	if (!man || !ttm_mm_used(man))
>   		return -EBUSY;
>   
>   	if (!ttm_bo_mt_compatible(man, mem_type, place, &cur_flags))
> @@ -1548,7 +1548,7 @@ int ttm_bo_device_release(struct ttm_bo_device *bdev)
>   	struct ttm_mem_type_manager *man;
>   
>   	man = ttm_manager_type(bdev, TTM_PL_SYSTEM);
> -	ttm_bo_disable_mm(man);
> +	ttm_mm_set_use(man, false);
>   
>   	mutex_lock(&ttm_global_mutex);
>   	list_del(&bdev->device_list);
> @@ -1585,7 +1585,7 @@ static void ttm_bo_init_sysman(struct ttm_bo_device *bdev)
>   	man->default_caching = TTM_PL_FLAG_CACHED;
>   
>   	ttm_bo_init_mm_base(man, 0);
> -	ttm_bo_use_mm(man);
> +	ttm_mm_set_use(man, true);
>   }
>   
>   int ttm_bo_device_init(struct ttm_bo_device *bdev,
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_manager.c b/drivers/gpu/drm/ttm/ttm_bo_manager.c
> index 6c6eedf84ca6..5ed4e4317789 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_manager.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_manager.c
> @@ -139,7 +139,7 @@ int ttm_bo_man_init(struct ttm_bo_device *bdev,
>   	spin_lock_init(&rman->lock);
>   
>   	ttm_set_driver_manager(bdev, type, &rman->manager);
> -	ttm_bo_use_mm(man);
> +	ttm_mm_set_use(man, true);
>   	return 0;
>   }
>   EXPORT_SYMBOL(ttm_bo_man_init);
> @@ -152,7 +152,7 @@ int ttm_bo_man_takedown(struct ttm_bo_device *bdev,
>   	struct drm_mm *mm = &rman->mm;
>   	int ret;
>   
> -	ttm_bo_disable_mm(man);
> +	ttm_mm_set_use(man, false);
>   
>   	ret = ttm_bo_force_list_clean(bdev, man);
>   	if (ret)
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> index 1849d913d521..9b9cc3b57a24 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.c
> @@ -630,7 +630,7 @@ static int vmw_init_vram_manager(struct vmw_private *dev_priv)
>   			      TTM_PL_FLAG_CACHED, TTM_PL_FLAG_CACHED,
>   			      false, dev_priv->vram_size >> PAGE_SHIFT);
>   #endif
> -	ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM)->use_type = false;
> +	ttm_mm_set_use(ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM), false);
>   	return ret;
>   }
>   
> @@ -1190,9 +1190,9 @@ static void __vmw_svga_enable(struct vmw_private *dev_priv)
>   	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
>   
>   	spin_lock(&dev_priv->svga_lock);
> -	if (!man->use_type) {
> +	if (!ttm_mm_used(man)) {
>   		vmw_write(dev_priv, SVGA_REG_ENABLE, SVGA_REG_ENABLE);
> -		man->use_type = true;
> +		ttm_mm_set_use(man, true);
>   	}
>   	spin_unlock(&dev_priv->svga_lock);
>   }
> @@ -1221,8 +1221,8 @@ static void __vmw_svga_disable(struct vmw_private *dev_priv)
>   	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, TTM_PL_VRAM);
>   
>   	spin_lock(&dev_priv->svga_lock);
> -	if (man->use_type) {
> -		man->use_type = false;
> +	if (ttm_mm_used(man)) {
> +		ttm_mm_set_use(man, false);
>   		vmw_write(dev_priv, SVGA_REG_ENABLE,
>   			  SVGA_REG_ENABLE_HIDE |
>   			  SVGA_REG_ENABLE_ENABLE);
> @@ -1255,8 +1255,8 @@ void vmw_svga_disable(struct vmw_private *dev_priv)
>   	vmw_kms_lost_device(dev_priv->dev);
>   	ttm_write_lock(&dev_priv->reservation_sem, false);
>   	spin_lock(&dev_priv->svga_lock);
> -	if (man->use_type) {
> -		man->use_type = false;
> +	if (ttm_mm_used(man)) {
> +		ttm_mm_set_use(man, false);
>   		spin_unlock(&dev_priv->svga_lock);
>   		if (ttm_bo_evict_mm(&dev_priv->bdev, TTM_PL_VRAM))
>   			DRM_ERROR("Failed evicting VRAM buffers.\n");
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> index 2b60957f7c4a..aff7767762ed 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gmrid_manager.c
> @@ -135,7 +135,7 @@ int vmw_gmrid_man_init(struct vmw_private *dev_priv, int type)
>   	}
>   
>   	ttm_set_driver_manager(&dev_priv->bdev, type, &gman->manager);
> -	ttm_bo_use_mm(man);
> +	ttm_mm_set_use(man, true);
>   	return 0;
>   }
>   
> @@ -144,7 +144,7 @@ void vmw_gmrid_man_takedown(struct vmw_private *dev_priv, int type)
>   	struct ttm_mem_type_manager *man = ttm_manager_type(&dev_priv->bdev, type);
>   	struct vmwgfx_gmrid_man *gman = to_gmrid_manager(man);
>   
> -	ttm_bo_disable_mm(man);
> +	ttm_mm_set_use(man, false);
>   
>   	ttm_bo_force_list_clean(&dev_priv->bdev, man);
>   
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> index d5a3eb709384..5a7b9b09785c 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_thp.c
> @@ -142,7 +142,7 @@ int vmw_thp_init(struct vmw_private *dev_priv)
>   	spin_lock_init(&rman->lock);
>   
>   	ttm_set_driver_manager(&dev_priv->bdev, TTM_PL_VRAM, &rman->manager);
> -	ttm_bo_use_mm(man);
> +	ttm_mm_set_use(man, true);
>   	return 0;
>   }
>   
> @@ -153,7 +153,7 @@ void vmw_thp_takedown(struct vmw_private *dev_priv)
>   	struct drm_mm *mm = &rman->mm;
>   	int ret;
>   
> -	ttm_bo_disable_mm(man);
> +	ttm_mm_set_use(man, false);
>   
>   	ret = ttm_bo_force_list_clean(&dev_priv->bdev, man);
>   	if (ret)
> diff --git a/include/drm/ttm/ttm_bo_driver.h b/include/drm/ttm/ttm_bo_driver.h
> index 702b3b056eda..6210acd5c651 100644
> --- a/include/drm/ttm/ttm_bo_driver.h
> +++ b/include/drm/ttm/ttm_bo_driver.h
> @@ -668,14 +668,14 @@ static inline void ttm_bo_unreserve(struct ttm_buffer_object *bo)
>   	dma_resv_unlock(bo->base.resv);
>   }
>   
> -static inline void ttm_bo_use_mm(struct ttm_mem_type_manager *man)
> +static inline void ttm_mm_set_use(struct ttm_mem_type_manager *man, bool use)
>   {
> -	man->use_type = true;
> +	man->use_type = use;
>   }
>   
> -static inline void ttm_bo_disable_mm(struct ttm_mem_type_manager *man)
> +static inline bool ttm_mm_used(struct ttm_mem_type_manager *man)
>   {
> -	man->use_type = false;
> +	return man->use_type;
>   }
>   
>   static inline void ttm_bo_man_cleanup(struct ttm_mem_type_manager *man)

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
