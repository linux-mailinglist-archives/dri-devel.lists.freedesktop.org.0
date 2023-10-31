Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8072B7DCE4B
	for <lists+dri-devel@lfdr.de>; Tue, 31 Oct 2023 14:55:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F46210E4D9;
	Tue, 31 Oct 2023 13:55:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20606.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::606])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AA9E10E4D8;
 Tue, 31 Oct 2023 13:55:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ok66LfXvXU0hpuFTMax3K2UwfWCU/wr2ezigdN/LiQSO7Nf2/iph4ErSWA7FkaEqC6On0P+g32PT+FZo3csESEuhoaXIkF4EBBxFca/7tWE4BDqBlsOIo5ibWTX1W261QV09Jqv60S2r92wPyEz4TbuwFkEvtewQJsqmoBMOMhAOURoyoLWtB0I/ut2BESIApOCi7ecYL95zlTun7Pie6dwfGlM2Ar/5duSplJNWGp7Otx+QRHpUlcWSlBJNy+Mw+lRncGL0Z2UDVamgMoGaCCTQie+Y19M2Jsvta3HFuFWeX6S4i5u1GWgtywjZXk+ulATkN/Q5b19i/xUEJ7tqhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O14BkS6Ok4T2M29hjJHZg2CVc/Mp47ay2BC2T/guoWc=;
 b=lj8HACPlVLGs2jiKx3moTeDpwzJdWQA4OKS3cOFb3hij8rUB126OR04BYwWpTglD0fI/sOl+9YfVbOH50Td7n+6B1Cjnes4gx/U6ddyQ+tGepetdmKu02TZVVNfZSRybt0LOq8tcFs2PQLQTw9uHSKDKZ0KGQT1FNhq1LAUQSl1zgaNmdFodJ7UVccF4Neyk4EH1o2sNRRg6zor7kKyfmk6wd92EOC1KD2L6bdbmxGTzvDIYvFU9+aISDJpb4KPS/aPy0F659On1itgLRiCyG5+F/xbSXYJayaNAMpOLxaw/X4bOeDlzAqqvF7IUESBi7mDRA90Mkksevv87sDR37g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O14BkS6Ok4T2M29hjJHZg2CVc/Mp47ay2BC2T/guoWc=;
 b=NUY0OcO9BZwxRZuq+00G8el0Jk0OMZI0gNxGCCFLHWfDJudBWO9rz/PE7fFlao0VP+cGOOsTLUQy/Y4dXGGbwKF+Wo3176HaZV346d7ubeqgoZW/mo97olmD79KqCrlgdwr7V4MIMpRA9g0JWW8SpgE0LZ0RnpTcXbkKzwQ3zT8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by SJ2PR12MB7963.namprd12.prod.outlook.com (2603:10b6:a03:4c1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Tue, 31 Oct
 2023 13:55:40 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::ca80:8f1c:c11:ded3%6]) with mapi id 15.20.6933.029; Tue, 31 Oct 2023
 13:55:40 +0000
Message-ID: <e2349c50-5d15-4e76-b63a-904abc4f6802@amd.com>
Date: Tue, 31 Oct 2023 14:55:36 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/amdgpu: Separate eviction from VM status.
Content-Language: en-US
To: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20231031134059.171277-1-ishitatsuyuki@gmail.com>
 <20231031134059.171277-3-ishitatsuyuki@gmail.com>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20231031134059.171277-3-ishitatsuyuki@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0166.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::9) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|SJ2PR12MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: 907d35ff-abd5-401f-1bfe-08dbda191169
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BsvYO5KMHgvI0PW3XQYL3gwa4ZvQ1GjIHFEiLWxVrQqY6dkPf0bbS9OwFjY69p7nFngGzIxzoAVaINKj08Ua1X7WZeZl8yu5ssu/okKgie4lXKEMP43AQ2tFMGIGfqOu8KKm47XNWti81P8bl2wnbuqmrZ2p9Fj09tW6ltopOnj3o96hcp4JloEawNHPh9HoYVoMg+8z4QFqozDO7N+q3XPGEVRA0w9DqbmeUoV8M5T8CZjcqQDPBp7GaqP8CeANE9+yc8s/2y0B6Q2GWXxl0t3CeDXdR9Esf1VP+qF7+vZj54pyaJalpBFPmE7WvFuSQcgXGKzxBIrSlXbiE9iCnkQg9y9yyMSXaJX/DiL93rYOD/rGIKElT7BcI5QxrEzGZsduHv+D2sjpw0x7/AU1LhfUdBTFlQXdGL7CK88c/9aDrTv2R0v9MAuuMTzW9SHdBMTwsEWKA+/vM/4mRK0tc7UEO18siB3WH11Benr1UZYNuwGLgswokQxF/E3rPaZT/N6W4JlezOt2mk9BPG5FwVBS81FYYanirLeU+Y+3ATazBHQLGDtXyNtsSFXpetqS5KaYfi4/5yblwCvj3s2uWG4d5X4n6/QW8yT1pkJ2oVZg5l3Bwutva4bA1VeMjKBDGEuARtM7JfVtipebiQBs6Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(6506007)(6666004)(6512007)(6486002)(478600001)(83380400001)(26005)(2616005)(2906002)(5660300002)(66946007)(66556008)(41300700001)(66476007)(8936002)(8676002)(4326008)(316002)(86362001)(31696002)(36756003)(38100700002)(31686004)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFVHNWpkZ2VtRHJlSTc5VUE2WitWdUR3bnJJbUgzT25RcXZsUExiRHNzRTJi?=
 =?utf-8?B?Tk54SjZNWGdpZmNFV1piSU1iaitTOVNPYzFhbjducllSNjB6c3R1SGx2cGlu?=
 =?utf-8?B?WWRZU3FDWU50bUlyaGpGVERreGNZUktiOUZmZ1o1ek5pWm9uMk85Nnlodk1Q?=
 =?utf-8?B?emhDbTh3Qy9RbWFzR0xidXNoM3U3Q3pjYjNPVUxmWFArUzRVNXFFd1lVb1dQ?=
 =?utf-8?B?MThKeGIyR1pNOUJZbUUvUjYybHhWMTYrWDNWN1NwK1BBY29KMlBsejlMdEJl?=
 =?utf-8?B?L090VFZTZUNBaG5uZExaTzRjeWdtRHNWa2dDbFNYbDNSeVNHcktxR0FBN25y?=
 =?utf-8?B?Z3luMFAvWE9ncFU1QUcwMlRLNDJySEZHLzZZemQraHladVZaMEZEUForOWQ1?=
 =?utf-8?B?N0VBblFCZ3pmWVFQQW1GSzE4YlZTczV5NDBIeWdkenNXeWE4MzNPZi9iUUFT?=
 =?utf-8?B?L2VJcWFBV09ZamJmVG5lQTZYUFZDRkFET2QreTR4MHYwVWo3WVhVbktWeFAy?=
 =?utf-8?B?Q01ib1Q1OVk2cnJ2dWMzbWtCVFd3UG9TYTV1NkxYRXNQaXAzUStyT1VFZENo?=
 =?utf-8?B?akFWSXFCU3dmeWRpZ1Q5bVlxSm9OL2pLNmxSdlV0WkRJN1k1K1U1ZVpXZUhI?=
 =?utf-8?B?K2RhZVRTbzBiVERlanZ0blViSHpUamZUS3g4TGxzQzBLSE1ZRG9TWkxsVFNU?=
 =?utf-8?B?Z1lhbFltTDBVQ2dkbkRIWVB2Y1ovS2FiUG1jemJMTDBXWERxemRXbzVoSFZ3?=
 =?utf-8?B?WGNrT2dKeHdMdFdhL0lIWDBkOG9JSUFDck9mU3daMGw2NFZFMDIxVnFJTVFS?=
 =?utf-8?B?T1lQSjZvVnp1WE80cWt5SzV6VCtMTmcxM2VEbVRYRUR2K1ZycHVrc1pMZW1J?=
 =?utf-8?B?SFcwem5VSU93MnZIclE5RjFDYU4wOCtRTDhGNHdZdGxqTHc1eHRwMVVROWlI?=
 =?utf-8?B?eTNId0haWlhZM0JZT3R2bkxaY0hnNjNrNDd4NDh2Z09ybTVJRGVLc0dvdHVJ?=
 =?utf-8?B?cUJvQXdBUnQ5ZzZsR0VnZERTdHNvL2phU3FqajBKK09ac3FsZWFoV1A5bWZr?=
 =?utf-8?B?c0NZVDErRkVJQi9DS0RDemRIcXd2LzZTVWM4UjcwUlF4Y3QwaW1TQ1Nod0lr?=
 =?utf-8?B?cTloWXVMcEhlN28xcTVKWmJoWFhpYjNKUU9raGZjcG56cnRZdW56bzR2YjZI?=
 =?utf-8?B?b25PdVE5YnBFVGcvL2p1THVoTUJEamdubjF3NjFtanBKRnc1bHZNb0U0ekdC?=
 =?utf-8?B?RkZncjQzYUdGSHA2UWFwbFQ3VDNUemJJb0xGWVdteTM5MEZ0NjlwWW56Y2VV?=
 =?utf-8?B?dzlQKzVJMG5KS2pSZTdtS2NCZXBtZ1ZBVkdzVjE2U1N2VVU1RUZMdGNEbGxs?=
 =?utf-8?B?Lzl4dmlwN1QxZk83RDJ3VXBJMHY2cHBNTnlDaHZWNTJXdVlTREZDS3U3NDUv?=
 =?utf-8?B?L0V0ekh1Z0FaUEFnMEVpcVZKdjlVM3E0aithZTZPbHpxYWRjczlKUS83NXlP?=
 =?utf-8?B?SXhDeEVsTVBsK1kzc0Y4UXg3aTFOZUw5cWV0QXVIVm8ySTloMXI1L2dyaUN6?=
 =?utf-8?B?akFXZDQ1VlpibHNlUDZpRWN0dnBPZlpwTnQyclFFaTNPNnRJUVQ1TUl4c0RB?=
 =?utf-8?B?Qm1LNFIyNEF6WFJpM1VTcUg4bEU1dmZ1ek1tZzZSNmxCZ2xRWGtzZHQwSXg5?=
 =?utf-8?B?TnlxUFZvUTV2dEFwTm5ONzB1aFh0VC9KcklmMC9JNTNGSWkyTFgrWUpVODZj?=
 =?utf-8?B?VjB6YkJaSVlnYTBqOFdwMUNvSmc1QS96b1FyU0xGdkJ6NStVSVRXMm41eTk2?=
 =?utf-8?B?Q2gybDRjUDFEbDlibTByNjFYaG5VeEU4Sy84NnE1RTVUSFRIdmMyWW1JUXg1?=
 =?utf-8?B?T3dSbm82NUpXZ2FUU0NDOXFSY0ozblpwVy9MUmp6eTJ3a2UrM0N4SmM2MWtn?=
 =?utf-8?B?TmU5TGpTTTlHbzJYZ2IyQlpsK1pwbG9EM01mRHNVRkJUMGxPRm9jMEQrNXhF?=
 =?utf-8?B?aG9JTXdMWlFEN1E3MmluWlFsY2p0S251bEIrTDlpWDhpYjYwY2xmMDF6YzlV?=
 =?utf-8?B?UCthdk1NUFZuL3FuT0FEZFVKRzA0ekpHc3FPVVZOR3dtL1FCNXNYWGhFRUVZ?=
 =?utf-8?Q?RthEKbs5syB8mTtMpHCZ1pTgj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 907d35ff-abd5-401f-1bfe-08dbda191169
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2023 13:55:40.6375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0jxLv+eYgHTqrpdtfEL7AjGMHugZAdaO7jundM+jb6+VcuWtEGCx1FNx149EiEsa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7963
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
> In short, eviction never really belonged to the vm_status state machine.

I strongly disagree to that.

> Even when evicted, the BO could belong to either the moved or done state.
> The "evicted" state needed to handle both cases, causing greater confusion.
>
> Additionally, there were inconsistencies in the definition of an evicted
> BO. Some places are based on the `evict` parameter passed from the TTM move
> callback, while the others were updated based on whether the BO got its
> optimal placement. The second is more accurate for our use case. With this
> refactor, the evicted state is solely determined by the second rule.

That strongly sounds like you don't understand what the evicted state it 
good for.

The evicted state is for page directories, page tables and per VM BOs 
which needs to move around before doing the next CS.

Please further explain what you try to do here.

Regards,
Christian.

>
> Signed-off-by: Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c    | 67 +++++++++--------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h    |  1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c |  1 +
>   3 files changed, 29 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 7b9762f1cddd..dd6f72e2a1d6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -174,19 +174,23 @@ int amdgpu_vm_set_pasid(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>    * State for PDs/PTs and per VM BOs which are not at the location they should
>    * be.
>    */
> -static void amdgpu_vm_bo_evicted(struct amdgpu_vm_bo_base *vm_bo)
> +static void amdgpu_vm_bo_set_evicted(struct amdgpu_vm_bo_base *vm_bo, bool evicted)
>   {
>   	struct amdgpu_vm *vm = vm_bo->vm;
>   	struct amdgpu_bo *bo = vm_bo->bo;
>   
> -	vm_bo->moved = true;
>   	spin_lock(&vm_bo->vm->status_lock);
> -	if (bo->tbo.type == ttm_bo_type_kernel)
> -		list_move(&vm_bo->vm_status, &vm->evicted);
> -	else
> -		list_move_tail(&vm_bo->vm_status, &vm->evicted);
> +	if (evicted && bo->tbo.base.resv == vm->root.bo->tbo.base.resv) {
> +		if (bo->tbo.type == ttm_bo_type_kernel)
> +			list_move(&vm_bo->eviction_status, &vm->evicted);
> +		else
> +			list_move_tail(&vm_bo->eviction_status, &vm->evicted);
> +	} else {
> +		list_del_init(&vm_bo->eviction_status);
> +	}
>   	spin_unlock(&vm_bo->vm->status_lock);
>   }
> +
>   /**
>    * amdgpu_vm_bo_moved - vm_bo is moved
>    *
> @@ -310,6 +314,7 @@ void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
>   	base->bo = bo;
>   	base->next = NULL;
>   	INIT_LIST_HEAD(&base->vm_status);
> +	INIT_LIST_HEAD(&base->eviction_status);
>   
>   	if (!bo)
>   		return;
> @@ -336,7 +341,7 @@ void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
>   	 * is currently evicted. add the bo to the evicted list to make sure it
>   	 * is validated on next vm use to avoid fault.
>   	 * */
> -	amdgpu_vm_bo_evicted(base);
> +	amdgpu_vm_bo_set_evicted(base, true);
>   }
>   
>   /**
> @@ -460,7 +465,7 @@ int amdgpu_vm_validate_pt_bos(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   	while (!list_empty(&vm->evicted)) {
>   		bo_base = list_first_entry(&vm->evicted,
>   					   struct amdgpu_vm_bo_base,
> -					   vm_status);
> +					   eviction_status);
>   		spin_unlock(&vm->status_lock);
>   
>   		bo = bo_base->bo;
> @@ -1034,7 +1039,7 @@ void amdgpu_vm_get_memory(struct amdgpu_vm *vm,
>   	list_for_each_entry_safe(bo_va, tmp, &vm->idle, base.vm_status)
>   		amdgpu_vm_bo_get_memory(bo_va, stats);
>   
> -	list_for_each_entry_safe(bo_va, tmp, &vm->evicted, base.vm_status)
> +	list_for_each_entry_safe(bo_va, tmp, &vm->evicted, base.eviction_status)
>   		amdgpu_vm_bo_get_memory(bo_va, stats);
>   
>   	list_for_each_entry_safe(bo_va, tmp, &vm->relocated, base.vm_status)
> @@ -1153,21 +1158,10 @@ int amdgpu_vm_bo_update(struct amdgpu_device *adev, struct amdgpu_bo_va *bo_va,
>   			return r;
>   	}
>   
> -	/* If the BO is not in its preferred location add it back to
> -	 * the evicted list so that it gets validated again on the
> -	 * next command submission.
> -	 */
> -	if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv) {
> -		uint32_t mem_type = bo->tbo.resource->mem_type;
> -
> -		if (!(bo->preferred_domains &
> -		      amdgpu_mem_type_to_domain(mem_type)))
> -			amdgpu_vm_bo_evicted(&bo_va->base);
> -		else
> -			amdgpu_vm_bo_idle(&bo_va->base);
> -	} else {
> +	if (bo && bo->tbo.base.resv == vm->root.bo->tbo.base.resv)
> +		amdgpu_vm_bo_idle(&bo_va->base);
> +	else
>   		amdgpu_vm_bo_done(&bo_va->base);
> -	}
>   
>   	list_splice_init(&bo_va->invalids, &bo_va->valids);
>   	bo_va->cleared = clear;
> @@ -1883,6 +1877,7 @@ void amdgpu_vm_bo_del(struct amdgpu_device *adev,
>   
>   	spin_lock(&vm->status_lock);
>   	list_del(&bo_va->base.vm_status);
> +	list_del(&bo_va->base.eviction_status);
>   	spin_unlock(&vm->status_lock);
>   
>   	list_for_each_entry_safe(mapping, next, &bo_va->valids, list) {
> @@ -1959,13 +1954,18 @@ void amdgpu_vm_bo_invalidate(struct amdgpu_device *adev,
>   	if (bo->parent && (amdgpu_bo_shadowed(bo->parent) == bo))
>   		bo = bo->parent;
>   
> +	/* If the BO is not in its preferred location add it back to
> +	 * the evicted list so that it gets validated again on the
> +	 * next command submission.
> +	 */
> +	uint32_t mem_type = bo->tbo.resource->mem_type;
> +	bool suboptimal = !(bo->preferred_domains &
> +			 amdgpu_mem_type_to_domain(mem_type));
> +
>   	for (bo_base = bo->vm_bo; bo_base; bo_base = bo_base->next) {
>   		struct amdgpu_vm *vm = bo_base->vm;
>   
> -		if (evicted && bo->tbo.base.resv == vm->root.bo->tbo.base.resv) {
> -			amdgpu_vm_bo_evicted(bo_base);
> -			continue;
> -		}
> +		amdgpu_vm_bo_set_evicted(bo_base, suboptimal);
>   
>   		if (bo_base->moved)
>   			continue;
> @@ -2648,13 +2648,11 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct seq_file *m)
>   {
>   	struct amdgpu_bo_va *bo_va, *tmp;
>   	u64 total_idle = 0;
> -	u64 total_evicted = 0;
>   	u64 total_relocated = 0;
>   	u64 total_moved = 0;
>   	u64 total_invalidated = 0;
>   	u64 total_done = 0;
>   	unsigned int total_idle_objs = 0;
> -	unsigned int total_evicted_objs = 0;
>   	unsigned int total_relocated_objs = 0;
>   	unsigned int total_moved_objs = 0;
>   	unsigned int total_invalidated_objs = 0;
> @@ -2671,15 +2669,6 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct seq_file *m)
>   	total_idle_objs = id;
>   	id = 0;
>   
> -	seq_puts(m, "\tEvicted BOs:\n");
> -	list_for_each_entry_safe(bo_va, tmp, &vm->evicted, base.vm_status) {
> -		if (!bo_va->base.bo)
> -			continue;
> -		total_evicted += amdgpu_bo_print_info(id++, bo_va->base.bo, m);
> -	}
> -	total_evicted_objs = id;
> -	id = 0;
> -
>   	seq_puts(m, "\tRelocated BOs:\n");
>   	list_for_each_entry_safe(bo_va, tmp, &vm->relocated, base.vm_status) {
>   		if (!bo_va->base.bo)
> @@ -2718,8 +2707,6 @@ void amdgpu_debugfs_vm_bo_info(struct amdgpu_vm *vm, struct seq_file *m)
>   
>   	seq_printf(m, "\tTotal idle size:        %12lld\tobjs:\t%d\n", total_idle,
>   		   total_idle_objs);
> -	seq_printf(m, "\tTotal evicted size:     %12lld\tobjs:\t%d\n", total_evicted,
> -		   total_evicted_objs);
>   	seq_printf(m, "\tTotal relocated size:   %12lld\tobjs:\t%d\n", total_relocated,
>   		   total_relocated_objs);
>   	seq_printf(m, "\tTotal moved size:       %12lld\tobjs:\t%d\n", total_moved,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index 204ab13184ed..d9ab97eabda9 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -156,6 +156,7 @@ struct amdgpu_vm_bo_base {
>   
>   	/* protected by spinlock */
>   	struct list_head		vm_status;
> +	struct list_head		eviction_status;
>   
>   	/* protected by the BO being reserved */
>   	bool				moved;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> index 96d601e209b8..f78f4040f466 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c
> @@ -652,6 +652,7 @@ static void amdgpu_vm_pt_free(struct amdgpu_vm_bo_base *entry)
>   
>   	spin_lock(&entry->vm->status_lock);
>   	list_del(&entry->vm_status);
> +	list_del(&entry->eviction_status);
>   	spin_unlock(&entry->vm->status_lock);
>   	amdgpu_bo_unref(&entry->bo);
>   }

