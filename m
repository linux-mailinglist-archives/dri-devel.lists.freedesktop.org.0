Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEC2C360861
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 13:38:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A776EA43;
	Thu, 15 Apr 2021 11:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760047.outbound.protection.outlook.com [40.107.76.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70D0C6EA42;
 Thu, 15 Apr 2021 11:38:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGX1DoCVJWKBmT2nznE3WYaluvGFxjpEbjuv+3IlaTX7cmFw+kI1oZdOxEEi1PsXfeOTc/GhrUd1pEWoKjURYzMO9J8Yj0TRSmX1ZOYNgXoBMG+dvhBMxBEM5yHai1VDqcj52a2RqQwardCMPYPTiZ2wKu1SdVrtenSjLStjEIRk3lqVVM0a2BGlvTx837Ya0RgDxoY8xmEDZl32/dBeBSa93cPVk1hygshdLomvjXs1G3spfthjJKrywlkHsQdTugmIPgkg5QX3KZh4ia3bk4xuYqhCtiHlS7a5A03aJGKbhaOiTP/09xvZhB7SHaLABBy/ekr8hYVET/2yer6G3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBEnKbdcuBw9he11Fj/YxAsbVwhtDxaiuETw9QBjIW8=;
 b=LavT6WbIVNHQ5hhh7K4RIsJgyf8XYSboFEskbSQUFT0GNEckcZg+T+TX7vI0E76r3yWFCLB31/ML/k6/OeeexZVBV3ao3OeoztMu8cL7uy5vcawzDV9ghzFXHRcvfvGuVmE6wAmFxwdgs4wRqZ4fnQlvlL9S7KU1ElcyE3xt1cvF526Z/IfpERVtFl7RTS4BX64rSSsTDwoDqWxFnFXrKIhkEMKF8oTkAsncPhELR+Nuv2ICgOT+ImchRQnHaNknw/fm7VaM0n1ByZPz2PLqQJe1/dPPDVZ3FvRUcFyRUqCoLuGcG6js1fusY3OjG/yx0K0VPqb5h7OAWteRv5xtSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RBEnKbdcuBw9he11Fj/YxAsbVwhtDxaiuETw9QBjIW8=;
 b=P/BooAIilvuQFIZH4ye9xY6RW5SC2fc/mCUTBeN8SZUWgXZBPuU3YMW/L5ro8IoTzPq91j9oj3mCJ/6clx0k/xgung0Ufc/Ob6yQU7LyaUGyQHIcDCoQ7FQ5MRJ2QD0yKk3t66Ciln7GRzNPBslzRII9NUf/aM+1qTztY+/I05s=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4782.namprd12.prod.outlook.com (2603:10b6:208:a3::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.22; Thu, 15 Apr
 2021 11:38:34 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4020.025; Thu, 15 Apr 2021
 11:38:34 +0000
Subject: Re: [PATCH v2 2/7] drm/amdgpu: Implement mmap as GEM object function
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, bskeggs@redhat.com, ray.huang@amd.com,
 linux-graphics-maintainer@vmware.com, sroland@vmware.com, zackr@vmware.com,
 shashank.sharma@amd.com, sam@ravnborg.org, emil.velikov@collabora.com,
 Felix.Kuehling@amd.com, nirmoy.das@amd.com
References: <20210415101740.21847-1-tzimmermann@suse.de>
 <20210415101740.21847-3-tzimmermann@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <a62230ca-a800-20b9-01bb-c74dd19ef412@amd.com>
Date: Thu, 15 Apr 2021 13:38:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210415101740.21847-3-tzimmermann@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:7291:d81e:8eb2:63ca]
X-ClientProxiedBy: PR0P264CA0284.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1::32) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:7291:d81e:8eb2:63ca]
 (2a02:908:1252:fb60:7291:d81e:8eb2:63ca) by
 PR0P264CA0284.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1::32) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 11:38:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c2a5de4-5aa3-477c-5ed9-08d90002fff2
X-MS-TrafficTypeDiagnostic: MN2PR12MB4782:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4782F6F12CCF3B5189726D68834D9@MN2PR12MB4782.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kBMRcyngrnTxQA8bkngT+X4Bd1E0LC/8ODMebsuPpFHjOb+oA9GQz6f2hY+rkHcrENLbwIOhUfMsz1+qL+8Tj3tSy6ATKzPvFAH91g0CTDZxcOdKWV+v9SFraPXjPDz9q5JNeUhwtGrLSm9+/Mtlx4vM64KWqg4zIIoWYO3mX0VsUVmvaDjLbdRUUBA6SB+9vn3KcqHD6+53P0qtfYOuiNb4huvg41XbbxFNqcyyfTHyz76aJ7l/DEhYUjXCTRfFUhBR/wmUfIgEd9XNpkzp16aaXGBQEBVfHQeoOJloWGobdgiEc3mDNAe8UlBl6RwjQ7iHWX8rhYRnmQpk3xJMGRjxrf+Dd9rfbrr9mJ9L2lorYsl/ljrUSwxBfFxTI/ZStZ6a0M05xPv2WlluRlYxWbW03JvIItNw7MPNIyQRI+8I3YgO5GxvIV1SC36fgkOgrTdeUjRkmLSysjhQYbZqDNmjXo2LGrtL6TCepCBYLc6ZFZCIHk57MONQwzU7ISKgzdxi0/DJVDRXU2AeiESL2tAX9C+GuRYwYlHyZ3ruodlZiGtVzbuXP4smtlgBwv6w5RldXVIJKoK4B3JuvWRCmcDOsJIXApigncPFu/rDyalFF+EpE3btpGgR+3K/8Y5GgxiPgmjIKoiHczBpP0CntkjUm3W1zTh1qJ8TEeVpLED7cP6PtMj9pZc/pX6RG56kDczNfkiuDBuCBnObh/wTuQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(39860400002)(396003)(366004)(376002)(83380400001)(31686004)(86362001)(4326008)(2906002)(2616005)(7416002)(5660300002)(52116002)(8936002)(921005)(6666004)(8676002)(31696002)(6636002)(66946007)(38100700002)(6486002)(316002)(66476007)(66556008)(478600001)(36756003)(186003)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Qm1YdmpnM3QvdXJnanVsZzMwWUVSU0JTMDVIRzZZYWp0RE1BRDkrdDFGT3BV?=
 =?utf-8?B?a04vTjdGeEhWa1N6N0kxdUY3YWF6ZGNUWkZnczVlWDIya1ZHOUtsTnFBOGM5?=
 =?utf-8?B?NTVrWXMxRGN5K0xmTTRPSU9oVjFGTTc0OGRvWHZhNmZtdm5sRDFpRDFQVi9U?=
 =?utf-8?B?NDkrcStibUREK2VuZWdFa0FwbHVuK0VqLzdnQnk5YnprOEV0dzdZKzVmbCsz?=
 =?utf-8?B?dWhXVFdXZjVTRndhQkFFMGVNc2Z4dlNFU01TYmYybGFlb01GL29HU3NqdWNP?=
 =?utf-8?B?RmVXelBCalpwQjRvWGZESzVsUFR5Q3VyU3JleThoVFRjb3Vxd1pvc25uNXpq?=
 =?utf-8?B?SzlZMXBqRjNiSVB0RXYxWFlhUklXaERnQ29QNDBocWhEWEtucm9uU3RwdmRy?=
 =?utf-8?B?V2c0VXA0TkdDUE9Zc1pSMXgraVBlUUJPZE80aVhQbzJNLzQvLzgwejl5QUJ1?=
 =?utf-8?B?dGpxbWtFWDNYYzgxTTlweE1BWjRTbG1IUWFpa0JMVzd4ZVF5NStVa2NuNnBo?=
 =?utf-8?B?SnJ2cWNxSlJvVENGdWVPbksrYk5yRllPNEVNVlprZjBVWjlzaXJFS0NjUENt?=
 =?utf-8?B?SEVHR3ZkNm5adkMrL2tyTVlDUzh4MXpoL1hESWtHVmloZ0lDaWVUTmxYK2o4?=
 =?utf-8?B?ellQQkJodTY5Nk1rVFc1ZHdRTEdYM0ZOS2RqOVExV3NKTTdONVVWMWhLOEhB?=
 =?utf-8?B?TVpmYTBwNkxaOWJ6YW1PMzMrSktnNHZrNDUwcTdnV2wxcGtoTzEvM0l6UVFR?=
 =?utf-8?B?c1Q5NFY1MzVMTFFBcGF6aDJzVlNBUURZczFLMks3QVpIWUExci9tUENMemV1?=
 =?utf-8?B?bElKdk1SZUFVMnV2b3AyTEFuTnFIU0pRaU40bHpLTzJRUGhRd0VJUy83UHhZ?=
 =?utf-8?B?aEdjYWVFMXJVTVFYWnFJdWxDUDIxOGFYQXZKczVaMmNZOStQUEZobEVrVnFV?=
 =?utf-8?B?Wi9QalQyakpzRjBSWEkyRVFqSTVhbEN1bUpHYlcxTFBER0QzOStidGJTVzB2?=
 =?utf-8?B?RWx0aGgxWEVvUm9kVlYzY1BiWE5mT3dDcTkrdGJiUDNsQ1lYbmFwQURCK0Ey?=
 =?utf-8?B?T2kycmV1RE5VL3R6TUdIemtxZHY1V2YzQXJuMzdQcURuVDMxMnBjYW56MVhJ?=
 =?utf-8?B?Ui9IdG5KdXVGUUxvRkpsalJKREJrZzVoMWppMUVoM0ZYakV4MnBMV3RpYnpV?=
 =?utf-8?B?bTNvWWpBajUzTTI5UWpiRi8zMjdhSmV2OFk4K0xaREdYSk1teWJLeDMwSGJy?=
 =?utf-8?B?cDJwbUJTcy95RmpOdUFzUTA5NFVjdVlRRDFTa202enJ3MEpqNXhrU3U0K1Nw?=
 =?utf-8?B?RWxqUVVPMFpuT0l5ejJ6ZFVubVo4Z2tqeGdjOTdqUlJHYjl4THl5clV4R1dX?=
 =?utf-8?B?M2YwY0VBWURubEU4Wjd2TDQyeW1kd0tpallJTERPUzFwNXpDYUQvWDJad0tU?=
 =?utf-8?B?WW91NnJIQVlZdFcwSUFmYThqRW8vOUtDbmU5VGJjNjh4T2h6clE5aTRRV1Rn?=
 =?utf-8?B?WFVyV2FVV0YxTTg2S0o1NkZoSFJnMzNoNE45YzIwcGNjK1lEaGFiZVY2WFpQ?=
 =?utf-8?B?Y1laSUFjZWVvWnlranpSNVlqT1hSbE0zS1ltcWE1RkRCTkJBVGpsTVZCYmFu?=
 =?utf-8?B?UjdaK2hEaW9wb0RxbmRYVSt1Y3VjSmNJYmw3NVR6RkFaUkg2WllTZDNuUUVB?=
 =?utf-8?B?MlcrQ1dOYUdhSmZabmxkMWxWMFc5N1JjalJjd1JRcWZVc3p2TFlIVk8vT0lX?=
 =?utf-8?B?eVN2eGcwSW90NnZFNVRZcngyVkhTdjlwOVpzcnNRQzl3dWoxR0ZhY2RWYWtU?=
 =?utf-8?B?YXdwNzBEYU9NNzl4OGkzMmF6SFdibDV5bFVXdC82WnRPaWlBK0k3MGE3TnJR?=
 =?utf-8?Q?7qYLId2VOBmP3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2a5de4-5aa3-477c-5ed9-08d90002fff2
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 11:38:34.1799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GIFmNYAoKpOyAloP1s+VdT5Gkz9xLkoQbrrXL52nJWdCBc6yxVw11ZNg+PBT5Dgk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4782
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
Cc: nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 15.04.21 um 12:17 schrieb Thomas Zimmermann:
> Moving the driver-specific mmap code into a GEM object function allows
> for using DRM helpers for various mmap callbacks.
>
> This change resolves several inconsistencies between regular mmap and
> prime-based mmap. The vm_ops field in vma is now set for all mmap'ed
> areas. Previously it way only set for regular mmap calls, prime-based
> mmap used TTM's default vm_ops. The function amdgpu_verify_access() is
> no longer being called and therefore removed by this patch.
>
> As a side effect, amdgpu_ttm_vm_ops and amdgpu_ttm_fault() are now
> implemented in amdgpu's GEM code.
>
> v2:
> 	* rename amdgpu_ttm_vm_ops and amdgpu_ttm_fault() to
> 	  amdgpu_gem_vm_ops and amdgpu_gem_fault() (Christian)
> 	* the check for kfd_bo has meanwhile been removed
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

[SNIP]
> +static int amdgpu_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
> +{

Mhm, just double checking this function is now a core GEM function and 
not prime specific?

If yes maybe drop the _prime part.

> +	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
> +	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> +	unsigned long asize = amdgpu_bo_size(bo);
> +
> +	if (!vma->vm_file)
> +		return -ENODEV;
> +
> +	if (!adev)
> +		return -ENODEV;
> +
> +	/* Check for valid size. */
> +	if (asize < vma->vm_end - vma->vm_start)
> +		return -EINVAL;

Shouldn't we have that check in the common code?

Apart from that looks good to me.

Christian.

> +
> +	if (amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) ||
> +	    (bo->flags & AMDGPU_GEM_CREATE_NO_CPU_ACCESS)) {
> +		return -EPERM;
> +	}
> +
> +	return drm_gem_ttm_mmap(obj, vma);
> +}
> +
>   static const struct drm_gem_object_funcs amdgpu_gem_object_funcs = {
>   	.free = amdgpu_gem_object_free,
>   	.open = amdgpu_gem_object_open,
> @@ -212,6 +266,8 @@ static const struct drm_gem_object_funcs amdgpu_gem_object_funcs = {
>   	.export = amdgpu_gem_prime_export,
>   	.vmap = drm_gem_ttm_vmap,
>   	.vunmap = drm_gem_ttm_vunmap,
> +	.mmap = amdgpu_gem_prime_mmap,
> +	.vm_ops = &amdgpu_gem_vm_ops,
>   };
>   
>   /*
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 1485f33c3cc7..d4083c19402b 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -152,25 +152,6 @@ static void amdgpu_evict_flags(struct ttm_buffer_object *bo,
>   	*placement = abo->placement;
>   }
>   
> -/**
> - * amdgpu_verify_access - Verify access for a mmap call
> - *
> - * @bo:	The buffer object to map
> - * @filp: The file pointer from the process performing the mmap
> - *
> - * This is called by ttm_bo_mmap() to verify whether a process
> - * has the right to mmap a BO to their process space.
> - */
> -static int amdgpu_verify_access(struct ttm_buffer_object *bo, struct file *filp)
> -{
> -	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
> -
> -	if (amdgpu_ttm_tt_get_usermm(bo->ttm))
> -		return -EPERM;
> -	return drm_vma_node_verify_access(&abo->tbo.base.vma_node,
> -					  filp->private_data);
> -}
> -
>   /**
>    * amdgpu_ttm_map_buffer - Map memory into the GART windows
>    * @bo: buffer object to map
> @@ -1522,7 +1503,6 @@ static struct ttm_device_funcs amdgpu_bo_driver = {
>   	.eviction_valuable = amdgpu_ttm_bo_eviction_valuable,
>   	.evict_flags = &amdgpu_evict_flags,
>   	.move = &amdgpu_bo_move,
> -	.verify_access = &amdgpu_verify_access,
>   	.delete_mem_notify = &amdgpu_bo_delete_mem_notify,
>   	.release_notify = &amdgpu_bo_release_notify,
>   	.io_mem_reserve = &amdgpu_ttm_io_mem_reserve,
> @@ -1897,50 +1877,6 @@ void amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>   	adev->mman.buffer_funcs_enabled = enable;
>   }
>   
> -static vm_fault_t amdgpu_ttm_fault(struct vm_fault *vmf)
> -{
> -	struct ttm_buffer_object *bo = vmf->vma->vm_private_data;
> -	vm_fault_t ret;
> -
> -	ret = ttm_bo_vm_reserve(bo, vmf);
> -	if (ret)
> -		return ret;
> -
> -	ret = amdgpu_bo_fault_reserve_notify(bo);
> -	if (ret)
> -		goto unlock;
> -
> -	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> -				       TTM_BO_VM_NUM_PREFAULT, 1);
> -	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
> -		return ret;
> -
> -unlock:
> -	dma_resv_unlock(bo->base.resv);
> -	return ret;
> -}
> -
> -static const struct vm_operations_struct amdgpu_ttm_vm_ops = {
> -	.fault = amdgpu_ttm_fault,
> -	.open = ttm_bo_vm_open,
> -	.close = ttm_bo_vm_close,
> -	.access = ttm_bo_vm_access
> -};
> -
> -int amdgpu_mmap(struct file *filp, struct vm_area_struct *vma)
> -{
> -	struct drm_file *file_priv = filp->private_data;
> -	struct amdgpu_device *adev = drm_to_adev(file_priv->minor->dev);
> -	int r;
> -
> -	r = ttm_bo_mmap(filp, vma, &adev->mman.bdev);
> -	if (unlikely(r != 0))
> -		return r;
> -
> -	vma->vm_ops = &amdgpu_ttm_vm_ops;
> -	return 0;
> -}
> -
>   int amdgpu_copy_buffer(struct amdgpu_ring *ring, uint64_t src_offset,
>   		       uint64_t dst_offset, uint32_t byte_count,
>   		       struct dma_resv *resv,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index dec0db8b0b13..6e51faad7371 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -146,7 +146,6 @@ int amdgpu_fill_buffer(struct amdgpu_bo *bo,
>   			struct dma_resv *resv,
>   			struct dma_fence **fence);
>   
> -int amdgpu_mmap(struct file *filp, struct vm_area_struct *vma);
>   int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo);
>   int amdgpu_ttm_recover_gart(struct ttm_buffer_object *tbo);
>   uint64_t amdgpu_ttm_domain_start(struct amdgpu_device *adev, uint32_t type);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
