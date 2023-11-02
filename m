Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 256587DF2E5
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 13:53:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A3410E874;
	Thu,  2 Nov 2023 12:53:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 491D310E870;
 Thu,  2 Nov 2023 12:53:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Td8S9YmAWKWNM/43zSlmjU+b51Py1+qpNDxKSjnk/9EIk7EB0am79LgGB7qOY0wuUs51GtGXgY5WKA9hV8Ng6Ck4bs+QCkrOulz5JHXt/nNC3i7oD1jxXrC4kXzm+CbST9mEOxztbmG0a6Z+D2PHiJOylE6nogUv/wtl5/Vj9yRrBPhs48PZxYqBeg4T3fOEHHQCTdip96QUoQfNvEe7dM4dmMGzLHkCmnydtehD4ezQZjRW4Paxy2WLVoYgJgxPVGfnhIgX/VTAexmjYgNM9B/l6JYvG3Or+ro/w0GFKk+wEn03tO74GvyhWNrv67x4F5GmlvatNyeEeHjb5Cqz0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BlvHxApGxjC/9VSUTgnUGJTwq5fYrGKrCSgcU/GrBpE=;
 b=JuGWGdU55t7UtLZ75JXrqU7SdtsvCdheGR3yEZD89AGQ1FYN62Pa5tEgXq8vh51jrdxKW3EVyWgNGu/41fv1ayjj4vUPOS5ikKy2IEdP89OF7w0JOMGaDeGDTeOfgqmgckd6QDF2XW7pJzQjU8S6sft9tJslnstkoS1XFccjFjOuXFQIakvVHrSoqfXks88Tv4SMtK64V0mAH0+LKeuB/6yRIlRGN5+CGjf1EOaLWc491y/4c6ZxJ+Tw9hfsVxe2fZp4Sg+/S1+yX202uK9NRQRXJisDFGx0sOzJTyevkb8DA0awQagMyggMW2Yd4JRSzyclfFbJ2rjQQtot4D4NzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlvHxApGxjC/9VSUTgnUGJTwq5fYrGKrCSgcU/GrBpE=;
 b=bqTIrH8HjmgXbwjnQ2BlQS/ma8kcEqMV8XBL0UJCaRWGGxkZ0nsa9St0//WEFQAg0XtcgWpifPpW8jGW2yKh53uywRedznuG7tsLzCiONhfldCoJkChze7v676VAT6y4OCaNl8rBtq2O7OA3FHRZ+qbuAPvXaeiSgIKbZHXFplE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SA0PR12MB4480.namprd12.prod.outlook.com (2603:10b6:806:99::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.21; Thu, 2 Nov
 2023 12:53:07 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6933.029; Thu, 2 Nov 2023
 12:53:07 +0000
Message-ID: <06ea9503-d2aa-43fc-9cd9-56d062e27ed6@amd.com>
Date: Thu, 2 Nov 2023 13:53:02 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 02/11] drm: move lru_lock from ttm_device to drm_device
Content-Language: en-US
To: Oak Zeng <oak.zeng@intel.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20231102043306.2931989-1-oak.zeng@intel.com>
 <20231102043306.2931989-3-oak.zeng@intel.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231102043306.2931989-3-oak.zeng@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0132.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SA0PR12MB4480:EE_
X-MS-Office365-Filtering-Correlation-Id: 904e4ac4-01b0-455c-40cb-08dbdba2a8dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: svMZMew29EkrbBfx2C7SYLiVSV6w+XIW60bABnNqkrw2uE7Er5P/H1XT4Q3MA01m1NGgSB2o1qXmBKU+UdDJZsvYXjrQYFXaPmeN/MDaXMzeHeXCjpKkG9xQmrXtmaM/QZcN0Zt3jSt2f6f/UOJBG+08vrhw2MZas+cmuv7OIwmxPzQ/s4gvltUIRUinQaLlBj4cUls7vjix7tzXcNGU9koofKwXzN0ptboU0k9WNSHdfniwl5pQZs1HFpwVcwg1V1cObX8zfQpc1ELxoVZBsTD9fv5Cojwf4llDzoV9PZVbD1VcFRZ5ttulGw3t8yF7BfDHJRbQLq395RflzsJc40uMdUQmHqw5ZI1llM2OFGv8OjWo+gpOzDtmAtIisrp4iIKUv85KMPX4Du55JohdHj3ZD2jhlMh3Zucbw1w83hcseaZsB9+6c6cgG6WWQ8SyhfwVpjB9qPe75y8M/BsntNFxSlrAX75BPWsPw+qg7h3mmCgV+gFOzzXHV6jJqsl0LuEM7+oft38hLzqzEtUx5xPekplKsDxsYOyjOWpbPNEMeoomAm8Bt3DXDoral6v29TtccbgLRc5c3dKnsiIIszQtsXQgRk7xCowOrvSdKEAtIQ94oMf0lRNQ2TnD2/rAzhxv2k6Y/F95eMhsCM97xQDm7HX3xbgIl4oe9BwnV9xEPnEhXeG/0gxmXGEHKMB5ZAk6SOV/7dzzLMSYIFcRzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(346002)(376002)(396003)(366004)(39860400002)(136003)(230922051799003)(186009)(64100799003)(1800799009)(451199024)(2616005)(6512007)(26005)(478600001)(6486002)(5660300002)(36756003)(8676002)(8936002)(4326008)(31696002)(30864003)(2906002)(86362001)(41300700001)(66476007)(66556008)(316002)(66946007)(6666004)(6506007)(31686004)(38100700002)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S25PSXFzdXo3dWVCL2pHQnlmbWRuSVlBaEhINnk4Tjc1VDdjZENPOG9JR3pR?=
 =?utf-8?B?NkVjV3BYZXl6b3kxM3JqR0h2VkI5aElZdU5semRiR3ZvcHd4UkRmbFJoRGVq?=
 =?utf-8?B?UFRxSXV4dXJNeG5JcGFGVmpvNFljOVNQVmpaMHNnbTgyZEI1ZmtKUEpycDBk?=
 =?utf-8?B?UWRpbmNnbnZqWExtTkhNRE5Hd0JHVG05UmlUVU9YQUJPOHFSSkRoZHM1ZUlN?=
 =?utf-8?B?TTBXRXMxV1JaZE5ocjBCbjlSZ3BWay93TUMwTTJ4QmZqMUI5dk1lbENrL2xj?=
 =?utf-8?B?bkhvalRsNE1URmp0VXFRVnczRVN5UFNXOC9ob09hVDE5K1BDWXdrYndncS84?=
 =?utf-8?B?N1l0Uktsc3RNQVF4NzBaMGJYTnAzejgzVXRWaDA1YjVFUjViRVhCaXZjVkEr?=
 =?utf-8?B?SlFJSHJnN1hCK3l3aG1iK3V1MzJBdC91TWhOV2dHeUcrRWlaTTZpY2RWOS9I?=
 =?utf-8?B?WCtZeUxFNDluNjZKRlFIcTFnR2ZmaHMxdENsNzAydnJGSzBOM2wzdHNhb0dx?=
 =?utf-8?B?VnNLZjhDSkIrSVZtTG0xeU5jZWF4QWd1anJuNlFLL2JTKzZ5M2ZpZEpOV3kz?=
 =?utf-8?B?Y3laLzc1azBrWUlmYkpqRmFkbE50eEJudzRJZnB2VmNDZ1hXQkFqRkZjV2lp?=
 =?utf-8?B?Z3IvQktleHpqcVI1VHlRODd5N2Q3MmNjem1haXNIR25zcFFnc2NKZHFQZHh0?=
 =?utf-8?B?OHdHMTdQaUlieDFsVThlSWhQU3h1RGdWdlFDSE54em1TR1krQVVpcVF5NnJF?=
 =?utf-8?B?RHo5TWZnMm1LV3pOT0h4UHNpaUNTVkpzOUZuZ3dUM05Md211VXNYUVdFZUxJ?=
 =?utf-8?B?Si9jbDJQUkl6K0czeXVqVEUvaWl1LzMvVDh0RGlqS2hKVmZwNDdXU2JpeFA3?=
 =?utf-8?B?MGhjWkpPU3NYV1BqTGdPWVZuNTlaejE2TG13T2xQYTJFbEhscjBBTVVVMksz?=
 =?utf-8?B?SXEyYkVUdHFBMFdvWUF0bm1iZDRGQW9SeXhVb095ck0xUUZxa08yYjBVdDRz?=
 =?utf-8?B?N2VoTGxnYTE0bXMxcTVXVVNMUWpHRFFOcnhBZHdOR2Z2VjhqeTZ4MDNxMXN0?=
 =?utf-8?B?bW13TkUxVzRHOC9BbHpVWkF6U1pWSUd4Zk02a21ORVY2VEF6T2JrOTJSNm5X?=
 =?utf-8?B?bkQvaEVHTko5dXNMMFdiR0g3TW1rMnQ3dVZJNFZaeWZTZG9aK3ZiT0UraUZZ?=
 =?utf-8?B?S2Y4eXpVaDFoYVorVHR6T0ZyZ291WlE3WmpacnQ3dHVpUEF3YzJqbVpTdHVD?=
 =?utf-8?B?UGNKdEhCMEtpV0tsZDhJd21xSkE2dWg0b0JNSlBnSTFBUWVyNUpWRkZBQVcv?=
 =?utf-8?B?aVpESENTV1NLQWxGMXBpWncrZjAvWmk0WGRQbU9OZTc0Ym9zQkVKMWtEZlNh?=
 =?utf-8?B?b0c4NVRXNllGZ1BKNzdhQlIrUGZxMU5xbUZYZHFVb0tQclY4bHI4R3hrVURS?=
 =?utf-8?B?NWpTT3ljaURDT0lmUE5QVUhaR3ZGSjR0NnZqZWtOUXl3RGordTVhMVIvQ1k2?=
 =?utf-8?B?S2ZjRUFnUFhBTU5raWdOWFVsbEs4bHR4RkZMaTB1SkhaQjIvMHQrOSttaWY1?=
 =?utf-8?B?VjBCWTliaEF4UCtqMmIwSTQyOVpPc3FheHRCZjdnMGVqWTBBY1pBcCtnUVQx?=
 =?utf-8?B?SjBqZ0RxbVZ3ZmZmUGdYWmgrZ0dIbU04RFRKZndWWTk3bGM1Wm1iZzRiRnpB?=
 =?utf-8?B?RnVaTjk1Q3ZDYWxsREZQcnhkbHJVOWJpUW0rU0JJUzc2d2gxM01wV09qNk1s?=
 =?utf-8?B?UWZ5WFgyMDZmTlVLK3FER3htdHhnOU0xdWJ2TlFaMzdEMGdNUHUxOWNZQi8w?=
 =?utf-8?B?VzRlWWZTQUtOWWVPUFRXMFBFZm5meUhTSkQvOHNFYUozaU1EZXlmUUZhdVda?=
 =?utf-8?B?Y2pRSS9zOGh6MVBhUms4RVBHODVjRTFPRUZzbHp0cWFoT3g2MjM5bHZJRGRV?=
 =?utf-8?B?QlpLY3JoNkd3UExvMmpvU2pqaEhmNGRLWEY1RDA1dXEreDhWVlRBS1VIaWV0?=
 =?utf-8?B?MUR0YlhzUk84S25OKzNMcTNMbks2clpEeFZsaU5ncE16THRTS3BxNlBoVWNx?=
 =?utf-8?B?aVg4VTdpenlLbXlpRWMyRk5yMU14ZHI2RzdTOFNDVUpVNmxHcU91TVI3UTJH?=
 =?utf-8?Q?DRjY=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 904e4ac4-01b0-455c-40cb-08dbdba2a8dd
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2023 12:53:06.9635 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N1Qk1VYPwmxM2gGabLUwB4w0N6eNED5SSLH7BHEC6t2NjHWpH5z8w+UN9ey0k361
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4480
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
Cc: Thomas.Hellstrom@linux.intel.com, felix.kuehling@amd.com,
 brian.welty@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 02.11.23 um 05:32 schrieb Oak Zeng:
> In the coming patches, we will share the lru list b/t
> ttm bo based memory allocator and hmm/svm based memory
> allocator. Thus lru_lock (which is used mainly to protect
> the lru list) is moved from struct ttm_device to struct
> drm_device, so this lock can be shared b/t those two
> memory allocators.
>
> To minimize code change, struct ttm_device still hold
> a weak reference of lru_lock, so ttm layer can still
> reference to this lock easily.

I would rather like to see drm_device to become the base class of 
ttm_device.

Similar to how drm_gem_object is the base class of ttm_buffer_object.

That is probably a bit more work, but would also eliminate some of the 
duplicate house keeping we currently have (e.g. bdev pointer in 
ttm_buffer_object etc...).

Moving then stuff from the ttm_device into the drm_device becomes trivial.

Regards,
Christian.

>
> Signed-off-by: Oak Zeng <oak.zeng@intel.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c       |  4 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c |  4 +-
>   drivers/gpu/drm/drm_drv.c                    |  1 +
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c      |  4 +-
>   drivers/gpu/drm/ttm/ttm_bo.c                 | 40 +++++++++----------
>   drivers/gpu/drm/ttm/ttm_device.c             | 18 ++++-----
>   drivers/gpu/drm/ttm/ttm_resource.c           | 42 ++++++++++----------
>   drivers/gpu/drm/xe/xe_bo.c                   |  4 +-
>   drivers/gpu/drm/xe/xe_exec.c                 |  4 +-
>   drivers/gpu/drm/xe/xe_vm.c                   |  4 +-
>   include/drm/drm_device.h                     |  5 +++
>   include/drm/ttm/ttm_bo.h                     |  4 +-
>   include/drm/ttm/ttm_device.h                 |  4 +-
>   13 files changed, 72 insertions(+), 66 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index f5daadcec865..747bcad86d5d 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -368,9 +368,9 @@ int amdgpu_vm_lock_pd(struct amdgpu_vm *vm, struct drm_exec *exec,
>   void amdgpu_vm_move_to_lru_tail(struct amdgpu_device *adev,
>   				struct amdgpu_vm *vm)
>   {
> -	spin_lock(&adev->mman.bdev.lru_lock);
> +	spin_lock(adev->mman.bdev.lru_lock);
>   	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> -	spin_unlock(&adev->mman.bdev.lru_lock);
> +	spin_unlock(adev->mman.bdev.lru_lock);
>   }
>   
>   /* Create scheduler entities for page table updates */
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> index c7085a747b03..b83e1741905e 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c
> @@ -290,9 +290,9 @@ static void amdgpu_vram_mgr_do_reserve(struct ttm_resource_manager *man)
>   
>   		vis_usage = amdgpu_vram_mgr_vis_size(adev, block);
>   		atomic64_add(vis_usage, &mgr->vis_usage);
> -		spin_lock(&man->bdev->lru_lock);
> +		spin_lock(man->bdev->lru_lock);
>   		man->usage += rsv->size;
> -		spin_unlock(&man->bdev->lru_lock);
> +		spin_unlock(man->bdev->lru_lock);
>   		list_move(&rsv->blocks, &mgr->reserved_pages);
>   	}
>   }
> diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> index 3eda026ffac6..1943c38815aa 100644
> --- a/drivers/gpu/drm/drm_drv.c
> +++ b/drivers/gpu/drm/drm_drv.c
> @@ -623,6 +623,7 @@ static int drm_dev_init(struct drm_device *dev,
>   
>   	INIT_LIST_HEAD(&dev->managed.resources);
>   	spin_lock_init(&dev->managed.lock);
> +	spin_lock_init(&dev->lru_lock);
>   
>   	/* no per-device feature limits by default */
>   	dev->driver_features = ~0u;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 9227f8146a58..c46f54f83f54 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -984,7 +984,7 @@ void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
>   	/*
>   	 * Put on the correct LRU list depending on the MADV status
>   	 */
> -	spin_lock(&bo->bdev->lru_lock);
> +	spin_lock(bo->bdev->lru_lock);
>   	if (shrinkable) {
>   		/* Try to keep shmem_tt from being considered for shrinking. */
>   		bo->priority = TTM_MAX_BO_PRIORITY - 1;
> @@ -1013,7 +1013,7 @@ void i915_ttm_adjust_lru(struct drm_i915_gem_object *obj)
>   	}
>   
>   	ttm_bo_move_to_lru_tail(bo);
> -	spin_unlock(&bo->bdev->lru_lock);
> +	spin_unlock(bo->bdev->lru_lock);
>   }
>   
>   /*
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index e58b7e249816..26e0555bad0c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -68,7 +68,7 @@ static void ttm_bo_mem_space_debug(struct ttm_buffer_object *bo,
>    * @bo: The buffer object.
>    *
>    * Move this BO to the tail of all lru lists used to lookup and reserve an
> - * object. This function must be called with struct ttm_global::lru_lock
> + * object. This function must be called with struct drm_device::lru_lock
>    * held, and is used to make a BO less likely to be considered for eviction.
>    */
>   void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo)
> @@ -102,13 +102,13 @@ void ttm_bo_set_bulk_move(struct ttm_buffer_object *bo,
>   	if (bo->bulk_move == bulk)
>   		return;
>   
> -	spin_lock(&bo->bdev->lru_lock);
> +	spin_lock(bo->bdev->lru_lock);
>   	if (bo->resource)
>   		ttm_resource_del_bulk_move(bo->resource, bo);
>   	bo->bulk_move = bulk;
>   	if (bo->resource)
>   		ttm_resource_add_bulk_move(bo->resource, bo);
> -	spin_unlock(&bo->bdev->lru_lock);
> +	spin_unlock(bo->bdev->lru_lock);
>   }
>   EXPORT_SYMBOL(ttm_bo_set_bulk_move);
>   
> @@ -202,9 +202,9 @@ static int ttm_bo_individualize_resv(struct ttm_buffer_object *bo)
>   		 * reference it any more. The only tricky case is the trylock on
>   		 * the resv object while holding the lru_lock.
>   		 */
> -		spin_lock(&bo->bdev->lru_lock);
> +		spin_lock(bo->bdev->lru_lock);
>   		bo->base.resv = &bo->base._resv;
> -		spin_unlock(&bo->bdev->lru_lock);
> +		spin_unlock(bo->bdev->lru_lock);
>   	}
>   
>   	return r;
> @@ -255,7 +255,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
>   
>   		if (unlock_resv)
>   			dma_resv_unlock(bo->base.resv);
> -		spin_unlock(&bo->bdev->lru_lock);
> +		spin_unlock(bo->bdev->lru_lock);
>   
>   		lret = dma_resv_wait_timeout(resv, DMA_RESV_USAGE_BOOKKEEP,
>   					     interruptible,
> @@ -266,7 +266,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
>   		else if (lret == 0)
>   			return -EBUSY;
>   
> -		spin_lock(&bo->bdev->lru_lock);
> +		spin_lock(bo->bdev->lru_lock);
>   		if (unlock_resv && !dma_resv_trylock(bo->base.resv)) {
>   			/*
>   			 * We raced, and lost, someone else holds the reservation now,
> @@ -276,7 +276,7 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
>   			 * delayed destruction would succeed, so just return success
>   			 * here.
>   			 */
> -			spin_unlock(&bo->bdev->lru_lock);
> +			spin_unlock(bo->bdev->lru_lock);
>   			return 0;
>   		}
>   		ret = 0;
> @@ -285,11 +285,11 @@ static int ttm_bo_cleanup_refs(struct ttm_buffer_object *bo,
>   	if (ret) {
>   		if (unlock_resv)
>   			dma_resv_unlock(bo->base.resv);
> -		spin_unlock(&bo->bdev->lru_lock);
> +		spin_unlock(bo->bdev->lru_lock);
>   		return ret;
>   	}
>   
> -	spin_unlock(&bo->bdev->lru_lock);
> +	spin_unlock(bo->bdev->lru_lock);
>   	ttm_bo_cleanup_memtype_use(bo);
>   
>   	if (unlock_resv)
> @@ -351,7 +351,7 @@ static void ttm_bo_release(struct kref *kref)
>   			ttm_bo_flush_all_fences(bo);
>   			bo->deleted = true;
>   
> -			spin_lock(&bo->bdev->lru_lock);
> +			spin_lock(bo->bdev->lru_lock);
>   
>   			/*
>   			 * Make pinned bos immediately available to
> @@ -367,7 +367,7 @@ static void ttm_bo_release(struct kref *kref)
>   			}
>   
>   			kref_init(&bo->kref);
> -			spin_unlock(&bo->bdev->lru_lock);
> +			spin_unlock(bo->bdev->lru_lock);
>   
>   			INIT_WORK(&bo->delayed_delete, ttm_bo_delayed_delete);
>   			queue_work(bdev->wq, &bo->delayed_delete);
> @@ -598,7 +598,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>   	bool locked = false;
>   	int ret;
>   
> -	spin_lock(&bdev->lru_lock);
> +	spin_lock(bdev->lru_lock);
>   	ttm_resource_manager_for_each_res(man, &cursor, res) {
>   		bool busy;
>   
> @@ -621,7 +621,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>   	if (!bo) {
>   		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
>   			busy_bo = NULL;
> -		spin_unlock(&bdev->lru_lock);
> +		spin_unlock(bdev->lru_lock);
>   		ret = ttm_mem_evict_wait_busy(busy_bo, ctx, ticket);
>   		if (busy_bo)
>   			ttm_bo_put(busy_bo);
> @@ -635,7 +635,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>   		return ret;
>   	}
>   
> -	spin_unlock(&bdev->lru_lock);
> +	spin_unlock(bdev->lru_lock);
>   
>   	ret = ttm_bo_evict(bo, ctx);
>   	if (locked)
> @@ -658,11 +658,11 @@ void ttm_bo_pin(struct ttm_buffer_object *bo)
>   {
>   	dma_resv_assert_held(bo->base.resv);
>   	WARN_ON_ONCE(!kref_read(&bo->kref));
> -	spin_lock(&bo->bdev->lru_lock);
> +	spin_lock(bo->bdev->lru_lock);
>   	if (bo->resource)
>   		ttm_resource_del_bulk_move(bo->resource, bo);
>   	++bo->pin_count;
> -	spin_unlock(&bo->bdev->lru_lock);
> +	spin_unlock(bo->bdev->lru_lock);
>   }
>   EXPORT_SYMBOL(ttm_bo_pin);
>   
> @@ -679,11 +679,11 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo)
>   	if (WARN_ON_ONCE(!bo->pin_count))
>   		return;
>   
> -	spin_lock(&bo->bdev->lru_lock);
> +	spin_lock(bo->bdev->lru_lock);
>   	--bo->pin_count;
>   	if (bo->resource)
>   		ttm_resource_add_bulk_move(bo->resource, bo);
> -	spin_unlock(&bo->bdev->lru_lock);
> +	spin_unlock(bo->bdev->lru_lock);
>   }
>   EXPORT_SYMBOL(ttm_bo_unpin);
>   
> @@ -1156,7 +1156,7 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>   	}
>   
>   	/* TODO: Cleanup the locking */
> -	spin_unlock(&bo->bdev->lru_lock);
> +	spin_unlock(bo->bdev->lru_lock);
>   
>   	/*
>   	 * Move to system cached
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index 12014788b595..d18eca86ebd6 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -147,7 +147,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   	unsigned i;
>   	int ret;
>   
> -	spin_lock(&bdev->lru_lock);
> +	spin_lock(bdev->lru_lock);
>   	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
>   		man = ttm_manager_type(bdev, i);
>   		if (!man || !man->use_tt)
> @@ -169,7 +169,7 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   				return ret;
>   		}
>   	}
> -	spin_unlock(&bdev->lru_lock);
> +	spin_unlock(bdev->lru_lock);
>   	return 0;
>   }
>   EXPORT_SYMBOL(ttm_device_swapout);
> @@ -217,7 +217,7 @@ int ttm_device_init(struct ttm_device *bdev, const struct ttm_device_funcs *func
>   				use_dma_alloc, use_dma32);
>   
>   	bdev->vma_manager = vma_manager;
> -	spin_lock_init(&bdev->lru_lock);
> +	bdev->lru_lock = &drm->lru_lock;
>   	INIT_LIST_HEAD(&bdev->pinned);
>   	bdev->dev_mapping = mapping;
>   	mutex_lock(&ttm_global_mutex);
> @@ -244,11 +244,11 @@ void ttm_device_fini(struct ttm_device *bdev)
>   	drain_workqueue(bdev->wq);
>   	destroy_workqueue(bdev->wq);
>   
> -	spin_lock(&bdev->lru_lock);
> +	spin_lock(bdev->lru_lock);
>   	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i)
>   		if (list_empty(&man->lru[0]))
>   			pr_debug("Swap list %d was clean\n", i);
> -	spin_unlock(&bdev->lru_lock);
> +	spin_unlock(bdev->lru_lock);
>   
>   	ttm_pool_fini(&bdev->pool);
>   	ttm_global_release();
> @@ -260,7 +260,7 @@ static void ttm_device_clear_lru_dma_mappings(struct ttm_device *bdev,
>   {
>   	struct ttm_resource *res;
>   
> -	spin_lock(&bdev->lru_lock);
> +	spin_lock(bdev->lru_lock);
>   	while ((res = list_first_entry_or_null(list, typeof(*res), lru))) {
>   		struct ttm_buffer_object *bo = res->bo;
>   
> @@ -269,15 +269,15 @@ static void ttm_device_clear_lru_dma_mappings(struct ttm_device *bdev,
>   			continue;
>   
>   		list_del_init(&res->lru);
> -		spin_unlock(&bdev->lru_lock);
> +		spin_unlock(bdev->lru_lock);
>   
>   		if (bo->ttm)
>   			ttm_tt_unpopulate(bo->bdev, bo->ttm);
>   
>   		ttm_bo_put(bo);
> -		spin_lock(&bdev->lru_lock);
> +		spin_lock(bdev->lru_lock);
>   	}
> -	spin_unlock(&bdev->lru_lock);
> +	spin_unlock(bdev->lru_lock);
>   }
>   
>   void ttm_device_clear_dma_mappings(struct ttm_device *bdev)
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 46ff9c75bb12..6ada77f51fba 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -48,7 +48,7 @@ EXPORT_SYMBOL(ttm_lru_bulk_move_init);
>    * @bulk: bulk move structure
>    *
>    * Bulk move BOs to the LRU tail, only valid to use when driver makes sure that
> - * resource order never changes. Should be called with &ttm_device.lru_lock held.
> + * resource order never changes. Should be called with &drm_device.lru_lock held.
>    */
>   void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
>   {
> @@ -62,7 +62,7 @@ void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
>   			if (!pos->first)
>   				continue;
>   
> -			lockdep_assert_held(&pos->first->bo->bdev->lru_lock);
> +			lockdep_assert_held(pos->first->bo->bdev->lru_lock);
>   			dma_resv_assert_held(pos->first->bo->base.resv);
>   			dma_resv_assert_held(pos->last->bo->base.resv);
>   
> @@ -148,7 +148,7 @@ void ttm_resource_move_to_lru_tail(struct ttm_resource *res)
>   	struct ttm_buffer_object *bo = res->bo;
>   	struct ttm_device *bdev = bo->bdev;
>   
> -	lockdep_assert_held(&bo->bdev->lru_lock);
> +	lockdep_assert_held(bo->bdev->lru_lock);
>   
>   	if (bo->pin_count) {
>   		list_move_tail(&res->lru, &bdev->pinned);
> @@ -191,13 +191,13 @@ void ttm_resource_init(struct ttm_buffer_object *bo,
>   	res->bo = bo;
>   
>   	man = ttm_manager_type(bo->bdev, place->mem_type);
> -	spin_lock(&bo->bdev->lru_lock);
> +	spin_lock(bo->bdev->lru_lock);
>   	if (bo->pin_count)
>   		list_add_tail(&res->lru, &bo->bdev->pinned);
>   	else
>   		list_add_tail(&res->lru, &man->lru[bo->priority]);
>   	man->usage += res->size;
> -	spin_unlock(&bo->bdev->lru_lock);
> +	spin_unlock(bo->bdev->lru_lock);
>   }
>   EXPORT_SYMBOL(ttm_resource_init);
>   
> @@ -216,10 +216,10 @@ void ttm_resource_fini(struct ttm_resource_manager *man,
>   {
>   	struct ttm_device *bdev = man->bdev;
>   
> -	spin_lock(&bdev->lru_lock);
> +	spin_lock(bdev->lru_lock);
>   	list_del_init(&res->lru);
>   	man->usage -= res->size;
> -	spin_unlock(&bdev->lru_lock);
> +	spin_unlock(bdev->lru_lock);
>   }
>   EXPORT_SYMBOL(ttm_resource_fini);
>   
> @@ -235,9 +235,9 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
>   	if (ret)
>   		return ret;
>   
> -	spin_lock(&bo->bdev->lru_lock);
> +	spin_lock(bo->bdev->lru_lock);
>   	ttm_resource_add_bulk_move(*res_ptr, bo);
> -	spin_unlock(&bo->bdev->lru_lock);
> +	spin_unlock(bo->bdev->lru_lock);
>   	return 0;
>   }
>   
> @@ -248,9 +248,9 @@ void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
>   	if (!*res)
>   		return;
>   
> -	spin_lock(&bo->bdev->lru_lock);
> +	spin_lock(bo->bdev->lru_lock);
>   	ttm_resource_del_bulk_move(*res, bo);
> -	spin_unlock(&bo->bdev->lru_lock);
> +	spin_unlock(bo->bdev->lru_lock);
>   	man = ttm_manager_type(bo->bdev, (*res)->mem_type);
>   	man->func->free(man, *res);
>   	*res = NULL;
> @@ -368,9 +368,9 @@ bool ttm_resource_compat(struct ttm_resource *res,
>   void ttm_resource_set_bo(struct ttm_resource *res,
>   			 struct ttm_buffer_object *bo)
>   {
> -	spin_lock(&bo->bdev->lru_lock);
> +	spin_lock(bo->bdev->lru_lock);
>   	res->bo = bo;
> -	spin_unlock(&bo->bdev->lru_lock);
> +	spin_unlock(bo->bdev->lru_lock);
>   }
>   
>   /**
> @@ -424,18 +424,18 @@ int ttm_resource_manager_evict_all(struct ttm_device *bdev,
>   	 * Can't use standard list traversal since we're unlocking.
>   	 */
>   
> -	spin_lock(&bdev->lru_lock);
> +	spin_lock(bdev->lru_lock);
>   	for (i = 0; i < TTM_MAX_BO_PRIORITY; ++i) {
>   		while (!list_empty(&man->lru[i])) {
> -			spin_unlock(&bdev->lru_lock);
> +			spin_unlock(bdev->lru_lock);
>   			ret = ttm_mem_evict_first(bdev, man, NULL, &ctx,
>   						  NULL);
>   			if (ret)
>   				return ret;
> -			spin_lock(&bdev->lru_lock);
> +			spin_lock(bdev->lru_lock);
>   		}
>   	}
> -	spin_unlock(&bdev->lru_lock);
> +	spin_unlock(bdev->lru_lock);
>   
>   	spin_lock(&man->move_lock);
>   	fence = dma_fence_get(man->move);
> @@ -463,9 +463,9 @@ uint64_t ttm_resource_manager_usage(struct ttm_resource_manager *man)
>   {
>   	uint64_t usage;
>   
> -	spin_lock(&man->bdev->lru_lock);
> +	spin_lock(man->bdev->lru_lock);
>   	usage = man->usage;
> -	spin_unlock(&man->bdev->lru_lock);
> +	spin_unlock(man->bdev->lru_lock);
>   	return usage;
>   }
>   EXPORT_SYMBOL(ttm_resource_manager_usage);
> @@ -502,7 +502,7 @@ ttm_resource_manager_first(struct ttm_resource_manager *man,
>   {
>   	struct ttm_resource *res;
>   
> -	lockdep_assert_held(&man->bdev->lru_lock);
> +	lockdep_assert_held(man->bdev->lru_lock);
>   
>   	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
>   	     ++cursor->priority)
> @@ -526,7 +526,7 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
>   			  struct ttm_resource_cursor *cursor,
>   			  struct ttm_resource *res)
>   {
> -	lockdep_assert_held(&man->bdev->lru_lock);
> +	lockdep_assert_held(man->bdev->lru_lock);
>   
>   	list_for_each_entry_continue(res, &man->lru[cursor->priority], lru)
>   		return res;
> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> index 25fdc04627ca..827f798cccc0 100644
> --- a/drivers/gpu/drm/xe/xe_bo.c
> +++ b/drivers/gpu/drm/xe/xe_bo.c
> @@ -946,9 +946,9 @@ static bool xe_ttm_bo_lock_in_destructor(struct ttm_buffer_object *ttm_bo)
>   	 * the ttm_bo refcount is zero at this point. So trylocking *should*
>   	 * always succeed here, as long as we hold the lru lock.
>   	 */
> -	spin_lock(&ttm_bo->bdev->lru_lock);
> +	spin_lock(ttm_bo->bdev->lru_lock);
>   	locked = dma_resv_trylock(ttm_bo->base.resv);
> -	spin_unlock(&ttm_bo->bdev->lru_lock);
> +	spin_unlock(ttm_bo->bdev->lru_lock);
>   	XE_WARN_ON(!locked);
>   
>   	return locked;
> diff --git a/drivers/gpu/drm/xe/xe_exec.c b/drivers/gpu/drm/xe/xe_exec.c
> index 890fadb0a93e..dafebdfb2368 100644
> --- a/drivers/gpu/drm/xe/xe_exec.c
> +++ b/drivers/gpu/drm/xe/xe_exec.c
> @@ -370,9 +370,9 @@ int xe_exec_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
>   	xe_vm_reactivate_rebind(vm);
>   
>   	if (!err && !xe_vm_no_dma_fences(vm)) {
> -		spin_lock(&xe->ttm.lru_lock);
> +		spin_lock(xe->ttm.lru_lock);
>   		ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> -		spin_unlock(&xe->ttm.lru_lock);
> +		spin_unlock(xe->ttm.lru_lock);
>   	}
>   
>   err_repin:
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index a6a0f17fec1d..44e038276d41 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -651,9 +651,9 @@ static void preempt_rebind_work_func(struct work_struct *w)
>   
>   #undef retry_required
>   
> -	spin_lock(&vm->xe->ttm.lru_lock);
> +	spin_lock(vm->xe->ttm.lru_lock);
>   	ttm_lru_bulk_move_tail(&vm->lru_bulk_move);
> -	spin_unlock(&vm->xe->ttm.lru_lock);
> +	spin_unlock(vm->xe->ttm.lru_lock);
>   
>   	/* Point of no return. */
>   	arm_preempt_fences(vm, &preempt_fences);
> diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
> index 7cf4afae2e79..d0b5f42786be 100644
> --- a/include/drm/drm_device.h
> +++ b/include/drm/drm_device.h
> @@ -326,6 +326,11 @@ struct drm_device {
>   	 */
>   	struct list_head debugfs_list;
>   
> +	/**
> +	 * @lru_lock: Protection for the per manager LRU and destroy lists.
> +	 */
> +	spinlock_t lru_lock;
> +
>   	/* Everything below here is for legacy driver, never use! */
>   	/* private: */
>   #if IS_ENABLED(CONFIG_DRM_LEGACY)
> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
> index 0223a41a64b2..49f32df32204 100644
> --- a/include/drm/ttm/ttm_bo.h
> +++ b/include/drm/ttm/ttm_bo.h
> @@ -290,9 +290,9 @@ void ttm_bo_move_to_lru_tail(struct ttm_buffer_object *bo);
>   static inline void
>   ttm_bo_move_to_lru_tail_unlocked(struct ttm_buffer_object *bo)
>   {
> -	spin_lock(&bo->bdev->lru_lock);
> +	spin_lock(bo->bdev->lru_lock);
>   	ttm_bo_move_to_lru_tail(bo);
> -	spin_unlock(&bo->bdev->lru_lock);
> +	spin_unlock(bo->bdev->lru_lock);
>   }
>   
>   static inline void ttm_bo_assign_mem(struct ttm_buffer_object *bo,
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index bab868d55383..4d29e96bd892 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -248,9 +248,9 @@ struct ttm_device {
>   	struct ttm_pool pool;
>   
>   	/**
> -	 * @lru_lock: Protection for the per manager LRU and ddestroy lists.
> +	 * @lru_lock: Weak reference to drm_device::lru_lock.
>   	 */
> -	spinlock_t lru_lock;
> +	spinlock_t *lru_lock;
>   
>   	/**
>   	 * @pinned: Buffer objects which are pinned and so not on any LRU list.

