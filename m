Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7219C7DCE5F
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 14:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C116E10E4DC;
	Tue, 31 Oct 2023 13:57:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CAA210E4DC;
 Tue, 31 Oct 2023 13:57:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfOslP1smJnJcm91cCywaLiPjq4RuitH+PnKK8FS4b+tkEwOGUUhkB5nlCi7cgveHTwk4axveSy3Cn+gGACG2ha/IUnYr0J++30opkJNoJVnE0MkVh7UZfwOR/0MC8n+Z16F4l4xlbJatnRiQEymuwpJ8foVkHGfcBg2q6/jVLqd0/Gmyy3njQITleQ0wRZbtYN63Cv0jeX0YKJG31+qzPpLvaq70lw8ADY9LkzG+6aYv8/F7iq5vf5ig0gavAaVMWmBzjHC11eDsAPAulykO5AfuMDEbCs4Nd49kfC2BvIvkHlI9gDWhwfeLSdOZ9+Kew+mA8uc50tMrW9MvEEvTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEPsHhWHkhQ+nSPX34Xk9suP7sbeXzctRqLopfg9/BY=;
 b=iFvGDQhGvb6ONM3CcOB9KA2iooyE1drl4Xn4svKu67bXb3bQGyqcwQfgApA3Nkf0Qasw7xSiQkMy5Jn64eJwqMOqnCoU8KZ2uGZYC8y0H2CIIWlXN30fETzBNzoUEWAxm7PzUPkkIRxIT8U+/O3atl6iS5EnnAAnAxmHgQUnuKi8+8E/vnNlL/G7m9/qS3wDvekaJ0ftH0IMEq/UDHxiDfGgp+PhTiKYlMRcOXsWDJ/xbyFHJaisgsQ01b1ijqVa0rN0h2oS/bpXHS7pEqygXcQZsQ5esh267gOyxXB2yRnFJeSfrJML65UwKSIMjH56XyzdUPZCzRG6wveezDqHpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEPsHhWHkhQ+nSPX34Xk9suP7sbeXzctRqLopfg9/BY=;
 b=aqcw8mN243MHv6TXMd7ZZXhTD2wEEz7mPgaRT/vul8s6X1L4culkmHdXay3BwHLDFr4lBvKbuGtIVuC8NS4cdAYTm+VMYxK0B+lpdh7uD4+aBkVeYpIhNZHSVf5st3cXQhXVUrruMpqYMLtRtdDwky7Jhlx/bzYoHPVSg9vCsXU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH0PR12MB7079.namprd12.prod.outlook.com (2603:10b6:510:21d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 13:57:07 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 13:57:06 +0000
Message-ID: <30bcd9b7-903d-435e-9318-346777a3fd55@amd.com>
Date: Tue, 31 Oct 2023 14:57:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] drm/amdgpu: Flush VM updates for split bindings
 eagerly.
Content-Language: en-US
To: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
 <20231031134059.171277-4-ishitatsuyuki@gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231031134059.171277-4-ishitatsuyuki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH0PR12MB7079:EE_
X-MS-Office365-Filtering-Correlation-Id: 485ee8c7-e638-4aa0-1e64-08dbda1944e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wpMjJn0EH4hrJN3eI+VwQWbS28p5YrUyx1hmWNch0P02ssXkREvcQPd8XnefgIEw3TVk8Zcwdw6E0ucsbiMO2jfUOdRrn8xOO89HguwI1aTRUxwzrRDGX69fsi/zkfdVbxxp0/tVwYhPMLrejTECHLG6BQYhBftGCtYwytZWn1h2G9HaHBrLcq96fLKfdasYuKLmzSenXi71EltGAUCWSzUQQVExBnJwVL0RElogoSchZWO4luD7nT1K2FP9h4NA7fBzhZzcqnDTdDpl3uud0JWiG5c05dyZYXuvPTi2ftmlBMQppNgqRl9HGSyy6o/cvUG1MK/QN498R9700pTPk1aRuO79Da7+owb6Nwujw5xfvoh9JbruHMMMhsMHsUxtQZ0i6YA2rYnOlVdm8L+tVWtAHJnz5kGuc+JP8mmmbAUhZlU7dlpafZRbsgbL2C20z3dLdjcGHA6hay8Dnj4mLPUYb8j1g1IqRvZXNvzVGOFuO/engCa7cAAgcPLuIgZ62+KhM89au5IMUB1IH4xy1Dd9E6u5x6tnlEaYnEGsOhiI0IgLNYp1X0xowEYArOG2ENd/i973MLWYdOkBpEZWoVcrKvio4d9WmilkO5uE9+P6NyvLYgKTI8Id5f8wctHOPXW9WSSBPli08vD5q99xCg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(366004)(136003)(396003)(39860400002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(2906002)(38100700002)(86362001)(8676002)(8936002)(5660300002)(36756003)(41300700001)(15650500001)(4326008)(31696002)(478600001)(6506007)(6512007)(66946007)(6486002)(66556008)(66476007)(316002)(2616005)(83380400001)(31686004)(26005)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmRyMjJpR2E0RWtjUU9ZWnQzNUpwSEVUbWRkRVdzWWxRUkxVR0RMSlV1OTQ0?=
 =?utf-8?B?WGlrRVJRdUlVdGdIMXdpeWczeEU1emVGUXc5Q3p2TnZUZHBIdGtyME1JZDFl?=
 =?utf-8?B?Um9EODF5bmpzNUFZQnZ3ZVl0RmV1UGlTa04wOVBaeWQrTUh1OUJuc0VKQUdL?=
 =?utf-8?B?WDlqVDI4eTlGRVNoazhkQmMwWXZrdS9pQ0MvQnhRWDE2SWtnVHJ0bmVTc0Zx?=
 =?utf-8?B?YVhHQ1R5akxCU2loT2F0QXJ1K2thRHAyN2VJZDd1NXBVNnByUWlKZUF5VHFw?=
 =?utf-8?B?eDlqUTRFNVc3UHE3ZVZyblpUdHVyNkVxN0VEaGFRZUxUenYrQVl0VURsZ0xk?=
 =?utf-8?B?Ui9HMzZ4dEhmRHJjREs1b3lWeXBjSHN2bUlFZFM2STNlNlhGZXovU0k3eE9w?=
 =?utf-8?B?UVAzcFRvVFE1SWNiZ3NWMEY2Y1VxZ2g2SEU0QUxXTWZzOWRtV0tRcnkwblRo?=
 =?utf-8?B?b0ZpcGQ0V2pTajVIRTcraEZwSk16Mk1PL2U3dnRwNmpSMjgzSWVXT0FiU3Vw?=
 =?utf-8?B?UkZNWm05NWV6RG9EVGNaV2JXKzJZY015MkpQODczSk5mR0ZSd0VQcU5LeTdK?=
 =?utf-8?B?OHVoNTBTUzlnckpaOEszUmJqM3BXUUJUNFhmVFh0QjlONHBkOUNzSDhxQmw3?=
 =?utf-8?B?YUpDRGFXNXozYmpqSmltNXhuYVdxTURYcXNhKzBjcVVhZmRvVW13QkZmUFN2?=
 =?utf-8?B?Q29naHRKNUJZTHYyR3VtVVlsaVlrWGJXK3Z1eEZsa1J0MWhISVBSQkMyWVQy?=
 =?utf-8?B?YmRGK0NWUjF2bVUyMGpUSU5ER0NwdFBJZk16dkZ1YVhUTllmaFpheVc4MkIv?=
 =?utf-8?B?cXlDempkTk9MSzJDZ0ZBWXBrNTY2UGMwR3Q4VnB2RVpHek5WOGZSUkxYSUVF?=
 =?utf-8?B?SUxUV05Gc1FramFHdVgzb29hMnFkSkRlRFFZREkxaVNibWwwMFJwOHA3cXJM?=
 =?utf-8?B?bE1oQXZKS3pHYzkyMHVJS0VETlhmemJoMWxhTE1aSVR0eFMrQXowVnBXQWxC?=
 =?utf-8?B?Mi9OWXZHV0gvZm96dXFQM0p2WXdTTkEzOXp6YUhSeEFVWVBCTldqZXRtaWRv?=
 =?utf-8?B?ZkMzODh3N3FQemYrdnh6Y01CZENzbUd5cjFsNWZhQk9zSjd1OEVUekh3WmVJ?=
 =?utf-8?B?Qm1VVU9JOXUrVDEzL3JYa3dGTkdRZHN5WjlsVGJYTUpZdWtJZmZuSGUybFd4?=
 =?utf-8?B?R2dJZEtuSUQwVWNYWm5RVHNqL3p1aTA3VEhzdmpVVHdUUVVENUdhUk5wdzNF?=
 =?utf-8?B?bXZJdDJBUWNEYjJTYWtOekpVU2RpQzVMT0d2VGxJcTNNUitRRmpCeElaSC9t?=
 =?utf-8?B?M250SFBVc2pLTXJyMnNtNlR4UE1rQjUwcitxMWg5RGh3eDkxMFdITGdMcDg2?=
 =?utf-8?B?NlhpZ1lhbGM4c0hrQktOUlgzdWMxeTF2UlZ4UWJWR1NQa2JacURtb1RWK3hr?=
 =?utf-8?B?ZkdGcUE4WGp2MFNZYkp1Z0d1bXdBVkUwbWVlZkd6QS9sdXhYU3VuR1VONDk4?=
 =?utf-8?B?Vjd5U3hzWnZabWhHOEU2MkNObjd3dmZEZXIyUmthMDQ5MDEyZ1lvblhzQVRN?=
 =?utf-8?B?ZU5OUjVwMDZ6dllJYW9hMkRITElpdXJuOVF1VEdEZ0tPNExRbWYyc2F1S2RC?=
 =?utf-8?B?UmtUaDcvZ1dvQTE1TjM4RE5GRkhBTFJnS0pWVDQxT0w2ZmdSeWJGWno5M041?=
 =?utf-8?B?WVpXQTR0L0hUL1FmTGVqNzYzZmJ3K001emROaGlYZHRETEFCb0EyY3ZSbXVV?=
 =?utf-8?B?cURoVk0wd1dqMFJmMmZicWlEMVU5SGUzQXJ3WFdWUkVTNnJPbFN5d1B4NjE3?=
 =?utf-8?B?ZUhBRm43bHRwODNFYVNaRHZ1b2hEbHNiR0t6RE1tSFlFenRlNkFKRW4rb2h0?=
 =?utf-8?B?VkFRNWsrVkdJU1diNFVvcWVUYW9Wamx0dnlMSGV2aVlZaHpodDZTd1M1RCt1?=
 =?utf-8?B?b2N5WFRrTXVlcGo5VWVDNWhBaUJCVnZnNk5MaXRJb21OOWdSby9mQTVSdkVM?=
 =?utf-8?B?dTg3dlAzREJ6NjV3a2JmTWZnclp4U2drdE9TSWVVcndiZGxrVGtORjEvNEVC?=
 =?utf-8?B?VjhrTnV4RWVhWlVLUTRrK1RhZDNra1RsMXdCZzJBazlmSDlSSmh3aURhandF?=
 =?utf-8?Q?M2tOg0drwXfbq8yHK4VmFWSxY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 485ee8c7-e638-4aa0-1e64-08dbda1944e0
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 13:57:06.8585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HdZOo4x49DV8jSURfk9UcySHTDhsT4Sg39RSQ4s84o4rU/yDXruIJecrVKneVMxP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7079
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

Am 31.10.23 um 14:40 schrieb Tatsuyuki Ishi:
> The current amdgpu_gem_va_update_vm only tries to perform updates for the
> BO specified in the GEM ioctl; however, when a binding is split, the
> adjacent bindings also need to be updated. Such updates currently ends up
> getting deferred until next submission which causes stalls.

Yeah, that is a necessity. The hardware simply doesn't support what you 
try to do here in all cases.

So this approach won't work in general.

Regards,
Christian.

>
> Introduce a new state "dirty", shared between per-VM BOs and traditional
> BOs, containing all BOs that have pending updates in `invalids`.
> amdgpu_gem_va_update_vm will now simply flush any pending updates for BOs
> in the dirty state.
>
> Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c | 18 ++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c  | 66 ++++++++++++++++++-------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h  |  3 ++
>   3 files changed, 63 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index a1b15d0d6c48..01d3a97248b0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -604,10 +604,9 @@ int amdgpu_gem_metadata_ioctl(struct drm_device *dev, void *data,
>    * vital here, so they are not reported back to userspace.
>    */
>   static void amdgpu_gem_va_update_vm(struct amdgpu_device *adev,
> -				    struct amdgpu_vm *vm,
> -				    struct amdgpu_bo_va *bo_va,
> -				    uint32_t operation)
> +				    struct amdgpu_vm *vm)
>   {
> +	struct amdgpu_bo_va *bo_va;
>   	int r;
>   
>   	if (!amdgpu_vm_ready(vm))
> @@ -617,12 +616,18 @@ static void amdgpu_gem_va_update_vm(struct amdgpu_device *adev,
>   	if (r)
>   		goto error;
>   
> -	if (operation == AMDGPU_VA_OP_MAP ||
> -	    operation == AMDGPU_VA_OP_REPLACE) {
> +	spin_lock(&vm->status_lock);
> +	while (!list_empty(&vm->dirty)) {
> +		bo_va = list_first_entry(&vm->dirty, struct amdgpu_bo_va,
> +					 base.vm_status);
> +		spin_unlock(&vm->status_lock);
> +
>   		r = amdgpu_vm_bo_update(adev, bo_va, false);
>   		if (r)
>   			goto error;
> +		spin_lock(&vm->status_lock);
>   	}
> +	spin_unlock(&vm->status_lock);
>   
>   	r = amdgpu_vm_update_pdes(adev, vm, false);
>   
> @@ -792,8 +797,7 @@ int amdgpu_gem_va_ioctl(struct drm_device *dev, void *data,
>   		break;
>   	}
>   	if (!r && !(args->flags & AMDGPU_VM_DELAY_UPDATE) && !amdgpu_vm_debug)
> -		amdgpu_gem_va_update_vm(adev, &fpriv->vm, bo_va,
> -					args->operation);
> +		amdgpu_gem_va_update_vm(adev, &fpriv->vm);
>   
>   error:
>   	drm_exec_fini(&exec);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index dd6f72e2a1d6..01d31891cd05 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -191,6 +191,21 @@ static void amdgpu_vm_bo_set_evicted(struct amdgpu_vm_bo_base *vm_bo, bool evict
>   	spin_unlock(&vm_bo->vm->status_lock);
>   }
>   
> +/**
> + * amdgpu_vm_bo_dirty - vm_bo is dirty
> + *
> + * @vm_bo: vm_bo which is dirty
> + *
> + * State for normal and per VM BOs that are not moved, but have new entries in
> + * bo_va->invalids.
> + */
> +static void amdgpu_vm_bo_dirty(struct amdgpu_vm_bo_base *vm_bo)
> +{
> +	spin_lock(&vm_bo->vm->status_lock);
> +	list_move(&vm_bo->vm_status, &vm_bo->vm->dirty);
> +	spin_unlock(&vm_bo->vm->status_lock);
> +}
> +
>   /**
>    * amdgpu_vm_bo_moved - vm_bo is moved
>    *
> @@ -1042,6 +1057,9 @@ void amdgpu_vm_get_memory(struct amdgpu_vm *vm,
>   	list_for_each_entry_safe(bo_va, tmp, &vm->evicted, base.eviction_status)
>   		amdgpu_vm_bo_get_memory(bo_va, stats);
>   
> +	list_for_each_entry_safe(bo_va, tmp, &vm->dirty, base.vm_status)
> +		amdgpu_vm_bo_get_memory(bo_va, stats);
> +
>   	list_for_each_entry_safe(bo_va, tmp, &vm->relocated, base.vm_status)
>   		amdgpu_vm_bo_get_memory(bo_va, stats);
>   
> @@ -1411,6 +1429,17 @@ int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
>   			dma_resv_unlock(resv);
>   		spin_lock(&vm->status_lock);
>   	}
> +
> +	while (!list_empty(&vm->dirty)) {
> +		bo_va = list_first_entry(&vm->dirty, struct amdgpu_bo_va,
> +					 base.vm_status);
> +		spin_unlock(&vm->status_lock);
> +
> +		r = amdgpu_vm_bo_update(adev, bo_va, false);
> +		if (r)
> +			return r;
> +		spin_lock(&vm->status_lock);
> +	}
>   	spin_unlock(&vm->status_lock);
>   
>   	return 0;
> @@ -1476,19 +1505,16 @@ static void amdgpu_vm_bo_insert_map(struct amdgpu_device *adev,
>   				    struct amdgpu_bo_va_mapping *mapping)
>   {
>   	struct amdgpu_vm *vm = bo_va->base.vm;
> -	struct amdgpu_bo *bo = bo_va->base.bo;
>   
>   	mapping->bo_va = bo_va;
>   	list_add(&mapping->list, &bo_va->invalids);
>   	amdgpu_vm_it_insert(mapping, &vm->va);
> +	if (!bo_va->base.moved)
> +		amdgpu_vm_bo_dirty(&bo_va->base);
>   
>   	if (mapping->flags & AMDGPU_PTE_PRT)
>   		amdgpu_vm_prt_get(adev);
>   
> -	if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
> -	    !bo_va->base.moved) {
> -		amdgpu_vm_bo_moved(&bo_va->base);
> -	}
>   	trace_amdgpu_vm_bo_map(bo_va, mapping);
>   }
>   
> @@ -1725,6 +1751,8 @@ int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
>   			before->flags = tmp->flags;
>   			before->bo_va = tmp->bo_va;
>   			list_add(&before->list, &tmp->bo_va->invalids);
> +			if (!tmp->bo_va->base.moved)
> +				amdgpu_vm_bo_dirty(&tmp->bo_va->base);
>   		}
>   
>   		/* Remember mapping split at the end */
> @@ -1736,6 +1764,8 @@ int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
>   			after->flags = tmp->flags;
>   			after->bo_va = tmp->bo_va;
>   			list_add(&after->list, &tmp->bo_va->invalids);
> +			if (!tmp->bo_va->base.moved)
> +				amdgpu_vm_bo_dirty(&tmp->bo_va->base);
>   		}
>   
>   		list_del(&tmp->list);
> @@ -1761,30 +1791,18 @@ int amdgpu_vm_bo_clear_mappings(struct amdgpu_device *adev,
>   
>   	/* Insert partial mapping before the range */
>   	if (!list_empty(&before->list)) {
> -		struct amdgpu_bo *bo = before->bo_va->base.bo;
> -
>   		amdgpu_vm_it_insert(before, &vm->va);
>   		if (before->flags & AMDGPU_PTE_PRT)
>   			amdgpu_vm_prt_get(adev);
> -
> -		if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
> -		    !before->bo_va->base.moved)
> -			amdgpu_vm_bo_moved(&before->bo_va->base);
>   	} else {
>   		kfree(before);
>   	}
>   
>   	/* Insert partial mapping after the range */
>   	if (!list_empty(&after->list)) {
> -		struct amdgpu_bo *bo = after->bo_va->base.bo;
> -
>   		amdgpu_vm_it_insert(after, &vm->va);
>   		if (after->flags & AMDGPU_PTE_PRT)
>   			amdgpu_vm_prt_get(adev);
> -
> -		if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv &&
> -		    !after->bo_va->base.moved)
> -			amdgpu_vm_bo_moved(&after->bo_va->base);
>   	} else {
>   		kfree(after);
>   	}
> @@ -2136,6 +2154,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm, int32_t xcp
>   	INIT_LIST_HEAD(&vm->evicted);
>   	INIT_LIST_HEAD(&vm->relocated);
>   	INIT_LIST_HEAD(&vm->moved);
> +	INIT_LIST_HEAD(&vm->dirty);
>   	INIT_LIST_HEAD(&vm->idle);
>   	INIT_LIST_HEAD(&vm->invalidated);
>   	spin_lock_init(&vm->status_lock);
> @@ -2648,11 +2667,13 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct seq_file *m)
>   {
>   	struct amdgpu_bo_va *bo_va, *tmp;
>   	u64 total_idle = 0;
> +	u64 total_dirty = 0;
>   	u64 total_relocated = 0;
>   	u64 total_moved = 0;
>   	u64 total_invalidated = 0;
>   	u64 total_done = 0;
>   	unsigned int total_idle_objs = 0;
> +	unsigned int total_dirty_objs = 0;
>   	unsigned int total_relocated_objs = 0;
>   	unsigned int total_moved_objs = 0;
>   	unsigned int total_invalidated_objs = 0;
> @@ -2669,6 +2690,15 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct seq_file *m)
>   	total_idle_objs = id;
>   	id = 0;
>   
> +	seq_puts(m, "\tDirty BOs:\n");
> +	list_for_each_entry_safe(bo_va, tmp, &vm->dirty, base.vm_status) {
> +		if (!bo_va->base.bo)
> +			continue;
> +		total_dirty += amdgpu_bo_print_info(id++, bo_va->base.bo, m);
> +	}
> +	total_dirty_objs = id;
> +	id = 0;
> +
>   	seq_puts(m, "\tRelocated BOs:\n");
>   	list_for_each_entry_safe(bo_va, tmp, &vm->relocated, base.vm_status) {
>   		if (!bo_va->base.bo)
> @@ -2707,6 +2737,8 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct seq_file *m)
>   
>   	seq_printf(m, "\tTotal idle size:        %12lld\tobjs:\t%d\n", total_idle,
>   		   total_idle_objs);
> +	seq_printf(m, "\tTotal dirty size:       %12lld\tobjs:\t%d\n", total_dirty,
> +		   total_dirty_objs);
>   	seq_printf(m, "\tTotal relocated size:   %12lld\tobjs:\t%d\n", total_relocated,
>   		   total_relocated_objs);
>   	seq_printf(m, "\tTotal moved size:       %12lld\tobjs:\t%d\n", total_moved,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index d9ab97eabda9..f91d4fcf80b8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -276,6 +276,9 @@ struct amdgpu_vm {
>   	/* per VM BOs moved, but not yet updated in the PT */
>   	struct list_head	moved;
>   
> +	/* normal and per VM BOs that are not moved, but have new PT entries */
> +	struct list_head	dirty;
> +
>   	/* All BOs of this VM not currently in the state machine */
>   	struct list_head	idle;
>   

