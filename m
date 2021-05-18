Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 34DE5387BFA
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 17:07:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C18A6EB9D;
	Tue, 18 May 2021 15:07:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2063.outbound.protection.outlook.com [40.107.223.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E75D46EB9D
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 15:07:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WiIoNKoKEJq4t/UHNltzoEWcnNASqWa/iiTGZ6GXTeUcpZjTZkvRnhMsuTMtXxmUMNFBSHdIybIH4Ir5gx/bRb8M75K8TXUEXu/u0jSx0unbfIyfMD41Cvz+bV290iByINU1pYUJ5hMIXMLc2yO0/DSkCQA+2hGjcXG7FtvW2iyOSE6hnV58aY60ImIhOqkfXsZ4eYoVAWikQdR25+MhETL+LxZxI1MXlPPH1RkitkDJHTGr37NldOmmCS5wvVKW8e13N1I94Uob1QQOsTAIXs9aoMKZ8KE6eILJ9O5PpexX9h3ebfTZfHN4QhYztQgfRGm8BXriWHQDRvKUzbm4dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSrQ/pSdRi+oghyqdfDnxeMNfKXVvVZ2O2uTGoc+reg=;
 b=atW3dBKwNcWT6HQ+bRnTQY0zLz0zRia2G9I0gRHZLEnYJOzbPGwmNUTPYroJvj9pRHZ5GleqPQpgiNFET2gkg4qC8JK6jB8o5xQlMhcHNenR8T43QAMo9qtYNJ/7mlX8X8BzLJaAy1hwsXG12zBM9CV0UvEWd8I1KTfZZpFnLXi3ID2KmYm9/XSPoVyeGGjtxiKo8r99ZoPLM8Yfcd7vLF1Z0plwDGMQaqMA8S+ssugowb01eZqILE0u5PLDHlqE70jODTtdzcZC0/ux0MLhtO/jojDG35yYUbDz+MDTkwED7TTnSpKh6E+yw4cQt8hzndKjAnpovNnZGRtKUff1nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSrQ/pSdRi+oghyqdfDnxeMNfKXVvVZ2O2uTGoc+reg=;
 b=JQzc8u68xrAyIp+E9pIjvNUSE021iAjotQ5s1IBxvUvmJSQjbrdoCWedH0reiW9iBSK35tfj5w90pnEHpOk5QRdIsDNR7W5pN/WgdW3+1/VkM107sjPSa46svNJZPEGc2vCwJGb60FC2jaRIl1TdMgqI/412JiQCQPQvTQR0EMg=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4932.namprd12.prod.outlook.com (2603:10b6:208:1c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 15:07:46 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6d4d:4674:1cf6:8d34%6]) with mapi id 15.20.4129.032; Tue, 18 May 2021
 15:07:46 +0000
Subject: Re: [PATCH v2 13/15] drm/ttm: Add BO and offset arguments for
 vm_access and vm_fault ttm handlers.
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210518145543.1042429-1-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <9e465ab2-4272-4a41-2ebf-4b34d4724f77@amd.com>
Date: Tue, 18 May 2021 17:07:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210518145543.1042429-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:3b27:1830:9671:4cc9]
X-ClientProxiedBy: AM0PR05CA0095.eurprd05.prod.outlook.com
 (2603:10a6:208:136::35) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:3b27:1830:9671:4cc9]
 (2a02:908:1252:fb60:3b27:1830:9671:4cc9) by
 AM0PR05CA0095.eurprd05.prod.outlook.com (2603:10a6:208:136::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 15:07:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90f951a6-8f7d-48da-2052-08d91a0eb162
X-MS-TrafficTypeDiagnostic: BL0PR12MB4932:
X-Microsoft-Antispam-PRVS: <BL0PR12MB493254B8CA47C381EDC8D8A9832C9@BL0PR12MB4932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ig3oEm1cAsK452I03ETDKZYKTQT+YkXVHbLue7qzsgxrE0G/YGEAW20ptkmp7gOckrWI6uAgA96Lp8Ssu8rAEWrJAv+m4/X98FCuweOVp9rh1KWt5wf63Jqv4csbwx3JqL8RauMnXquMTTzcXA3as9yCo7b+bDcA23qmbAmAE5cS/vE1n8ncWl2NFIn97WSek5nVcXeSj68dIOI//BLqy8z7e6N2EEB3vaVxrQk90RTc/C0c1yS+EQqmUf7ATZ69SZLUvYp0Q+bZRVqdUzIdxbS7GcCieWM8PsIsmdYGmCZC4ZYymQHKrJjGkwWKmcsFoZLwNG0wUtg2LoyM9POGarhUzmx6pA300VNNIawPBUeBoe5ixCWNaLHPpLgNwuCl+3QAGg0BBLzT5hgFWDW8J+UrGPPhnH9eRle6kOt7y9vXfbU1jE1QI73wLf7CPFSaIRKRluqdzLl/23VMBNiqxgxlFIs1jsNASuHXkDtUIUo+J3txLxGRHxZxG3NoE9Rh/WEGdlpyls7Rt/uO+lA8+tgsVm33P2f80lnEMj5nwZsfRuORFGTBKvq0d+okHOpznktRKRhal7WPIDjFes2Yo88X+EYmQmmCVVZcw8hOsOWcVNLNAwFWuIfdNVMNnOd6jk37aZBooUkUByrgLtsOy17WKGhyl/fA3p5wMEcczxC8iH5eDt0xmTXAUMW7rsrp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(31696002)(66574015)(31686004)(86362001)(66946007)(52116002)(6666004)(83380400001)(478600001)(4326008)(2906002)(6486002)(8936002)(8676002)(316002)(54906003)(186003)(36756003)(2616005)(66476007)(5660300002)(6916009)(30864003)(66556008)(16526019)(38100700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bkRvMkJmQktGeGhLZlRCaW9TakFxcjg3RTRsM0lKdHlVbDlvQmp0UVQ0QzhY?=
 =?utf-8?B?SE1ISFFEbnpHeDdpUU9Ja2dxVHFjU3VmcDFwTzJTN0tMYktJUTJyMVQ3U2lq?=
 =?utf-8?B?ajl2NTByYnVlYmlzOWc0YmNlT3EzdjU3VFg1YmdIcjcxOU44SnBLL1NSSDlT?=
 =?utf-8?B?ZFNVZlh3K3pWcUlDYjR4K1A1RDRsWng5bktvQ0F0N1U2ZTRzQkpJVGpNbklD?=
 =?utf-8?B?OHh6N3NPVUluTmlhQ3Z4UE16MVlmMVg0VGNLSFdEVUNKWm9QN0tQOGFOMjRU?=
 =?utf-8?B?V0NoYmxHOWJJRStkMVkrYkRqT3RyN2tSeW52ZmRZd1cxWXA2SlNDU3ZPYWwy?=
 =?utf-8?B?aGpYdWp2YS9GN3RFZThSMnorYnNjMHQzcGVVSkhzcmE2a1Y2Y2hWa0YzUlJS?=
 =?utf-8?B?QTd1YmMvN3FXWjBWV294UU5ialNoaUl2RUd2SXdPQzZ4dnBBcTlkNFlqOU1Y?=
 =?utf-8?B?Q1ZnSllhS2lnWUFPUkkzYWh6a09ZQ0RXbUFmaVgwcGtxQ2NXMU9TSGppTnVv?=
 =?utf-8?B?aFhPd0RMNkpoMFVOWThjMmFVdklnTVQzQ2FUVTFZNUJSYm13NkRXVnZCY0Fu?=
 =?utf-8?B?bFBkR3R0dFVEWGkvTXU5Z2ZJdmc0N1JDSklrTUZLOTZ5Q1IyREZZV0tEUWN2?=
 =?utf-8?B?aHJyemNHMFBVZUlNVVJuaXV0QVlZeU01SWU0VmJpSkN4Zk5BVmRYR2dtL0wx?=
 =?utf-8?B?Qi9OZlB3cEM3U0tEaEdvR3M3czMreDlwN3drV0V3R2NUWmgxdCtVZzY3V2RH?=
 =?utf-8?B?WDFQaHJjdmdvMm1COFp4MlFPbEtvbWlhcVJQOVI5S09tMGxrMXZseEh3OGJQ?=
 =?utf-8?B?ajVVSmx6ODZNeHd5MTA2YTlUN2xPYzAwbHBWa2FiaHBGU29Jdno0cUpuZHV5?=
 =?utf-8?B?SHdEZjl1Wm9RMnFqWi9UbTJPUGRyTFNReW85UlBjcXFIY0FwVmlGZnQyeE1R?=
 =?utf-8?B?SE5CaWlKdVpNWGE3Y0V4TXY5SFdVRTVaR0hsQzkvblAvcFEwNEpKK09aUVcv?=
 =?utf-8?B?dGJmOEk5VW1xSHFtdjRGZ2NpVXk5ZWc3UUlDdmxxL0c2SkgwelVDa01DSG8x?=
 =?utf-8?B?T1gvZmhIRVpmZW1hajF0L0hZK2dxK212UVdBaDZBRU5mVXllb1hkTGlJcDBE?=
 =?utf-8?B?QnRPbHlkdFZoUmJMQUhLdllsYVZnSUlUSzgxbkxJdjJCUEVpckd6ZWNiK0p3?=
 =?utf-8?B?TE9yekxFNFdORmVrNjY4T2xOT3Y0WHZ2UmdJQ3dRakkzYnNhZk9Qa3J4Qmtx?=
 =?utf-8?B?SlRTaEpLSHBZaDMybHJTMGcxNHNJcFhJSkkreVZKMkxRRWx1dlZUcVAxUTBt?=
 =?utf-8?B?ckQxWEpaZ01wdENUMncrLzBsL05seGhXMjJDcEFGOVBkdlZXc3ZGeFV6SnlT?=
 =?utf-8?B?MkNkRVdWZCt6aDVTRTBGVHFpY2ZMbk5wT2ppeW5UNmJTaFhzTGdMM2VBZ3lH?=
 =?utf-8?B?S3hCNG8vbUE4aEFlSnpxUHRrYWl1end2NEJXYkQ5bWRTRFZqOHpRUVhsK2xj?=
 =?utf-8?B?ejZLcWdwUEc2eGhkZDhBYlpSSVBPZEh6SkhKc01OQmVSdEl5UGI5U3JqSzZr?=
 =?utf-8?B?YkNiWXNCT3h3dDluOGZpdXQvaWVsOWlWN0hFOTJhR2wwUkd4cXJ5U0tGSXps?=
 =?utf-8?B?bG83TjZBTjVOSC9wTTFXQ1NRZVgrUysyUTBHNWNnY0JMdFJnWHVubE9ZWGo0?=
 =?utf-8?B?bVV3aTFBOWFqcHJudDU5Q0VmZENzNFRFV21FU01rek8yTEJwaSt0cVBuUHFy?=
 =?utf-8?B?T3RJWDByZ3o5c1crcm9zU1ZyZmRQUWFEWllzZHZNRE1ycTFEaFZodmsrMGNn?=
 =?utf-8?B?YnFTQzZhMTJRN3gybnpkMXFLeDNxeTQ3Sm9uZ25JbExGNGZSYzhjS2VYM2lw?=
 =?utf-8?Q?PPubMGD+579ka?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90f951a6-8f7d-48da-2052-08d91a0eb162
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 15:07:46.1625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /I+eAd1Vczj5MFv9iAVezYZpWOZeC5iImqdbDX2WT1Ez6qkrPWsqw7pAg9Lq3TJ/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4932
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 18.05.21 um 16:55 schrieb Thomas Hellström:
> From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
> This allows other drivers that may not setup the vma in the same way
> to use the ttm bo helpers.

Uff can you please explain why exactly you need that?

Providing the BO is not much of a problem, but having the BO at 
different VMA offsets is really a no-go with TTM.

Christian.

>
> Also clarify the documentation a bit, especially related to VM_FAULT_RETRY.
>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  4 +-
>   drivers/gpu/drm/nouveau/nouveau_ttm.c      |  4 +-
>   drivers/gpu/drm/radeon/radeon_ttm.c        |  4 +-
>   drivers/gpu/drm/ttm/ttm_bo_vm.c            | 84 +++++++++++++---------
>   drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c |  8 ++-
>   include/drm/ttm/ttm_bo_api.h               |  9 ++-
>   6 files changed, 75 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index d5a9d7a88315..89dafe14f828 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1919,7 +1919,9 @@ static vm_fault_t amdgpu_ttm_fault(struct vm_fault *vmf)
>   	if (ret)
>   		goto unlock;
>   
> -	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> +	ret = ttm_bo_vm_fault_reserved(bo, vmf,
> +				       drm_vma_node_start(&bo->base.vma_node),
> +				       vmf->vma->vm_page_prot,
>   				       TTM_BO_VM_NUM_PREFAULT, 1);
>   	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
>   		return ret;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index b81ae90b8449..555fb6d8be8b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -144,7 +144,9 @@ static vm_fault_t nouveau_ttm_fault(struct vm_fault *vmf)
>   
>   	nouveau_bo_del_io_reserve_lru(bo);
>   	prot = vm_get_page_prot(vma->vm_flags);
> -	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
> +	ret = ttm_bo_vm_fault_reserved(bo, vmf,
> +				       drm_vma_node_start(&bo->base.vma_node),
> +				       prot, TTM_BO_VM_NUM_PREFAULT, 1);
>   	nouveau_bo_add_io_reserve_lru(bo);
>   	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
>   		return ret;
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 3361d11769a2..ba48a2acdef0 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -816,7 +816,9 @@ static vm_fault_t radeon_ttm_fault(struct vm_fault *vmf)
>   	if (ret)
>   		goto unlock_resv;
>   
> -	ret = ttm_bo_vm_fault_reserved(vmf, vmf->vma->vm_page_prot,
> +	ret = ttm_bo_vm_fault_reserved(bo, vmf,
> +				       drm_vma_node_start(&bo->base.vma_node),
> +				       vmf->vma->vm_page_prot,
>   				       TTM_BO_VM_NUM_PREFAULT, 1);
>   	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
>   		goto unlock_mclk;
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index b31b18058965..ed00ccf1376e 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -42,7 +42,7 @@
>   #include <linux/mem_encrypt.h>
>   
>   static vm_fault_t ttm_bo_vm_fault_idle(struct ttm_buffer_object *bo,
> -				struct vm_fault *vmf)
> +				       struct vm_fault *vmf)
>   {
>   	vm_fault_t ret = 0;
>   	int err = 0;
> @@ -122,7 +122,8 @@ static unsigned long ttm_bo_io_mem_pfn(struct ttm_buffer_object *bo,
>    * Return:
>    *    0 on success and the bo was reserved.
>    *    VM_FAULT_RETRY if blocking wait.
> - *    VM_FAULT_NOPAGE if blocking wait and retrying was not allowed.
> + *    VM_FAULT_NOPAGE if blocking wait and retrying was not allowed, or wait interrupted.
> + *    VM_FAULT_SIGBUS if wait on bo->moving failed for reason other than a signal.
>    */
>   vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>   			     struct vm_fault *vmf)
> @@ -254,7 +255,9 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault *vmf,
>   
>   /**
>    * ttm_bo_vm_fault_reserved - TTM fault helper
> + * @bo: The buffer object
>    * @vmf: The struct vm_fault given as argument to the fault callback
> + * @mmap_base: The base of the mmap, to which the @vmf fault is relative to.
>    * @prot: The page protection to be used for this memory area.
>    * @num_prefault: Maximum number of prefault pages. The caller may want to
>    * specify this based on madvice settings and the size of the GPU object
> @@ -265,19 +268,28 @@ static vm_fault_t ttm_bo_vm_insert_huge(struct vm_fault *vmf,
>    * memory backing the buffer object, and then returns a return code
>    * instructing the caller to retry the page access.
>    *
> + * This function ensures any pipelined wait is finished.
> + *
> + * WARNING:
> + * On VM_FAULT_RETRY, the bo will be unlocked by this function when
> + * #FAULT_FLAG_RETRY_NOWAIT is not set inside @vmf->flags. In this
> + * case, the caller should not unlock the @bo.
> + *
>    * Return:
> - *   VM_FAULT_NOPAGE on success or pending signal
> + *   0 on success.
> + *   VM_FAULT_NOPAGE on pending signal
>    *   VM_FAULT_SIGBUS on unspecified error
>    *   VM_FAULT_OOM on out-of-memory
> - *   VM_FAULT_RETRY if retryable wait
> + *   VM_FAULT_RETRY if retryable wait, see WARNING above.
>    */
> -vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
> +vm_fault_t ttm_bo_vm_fault_reserved(struct ttm_buffer_object *bo,
> +				    struct vm_fault *vmf,
> +				    unsigned long mmap_base,
>   				    pgprot_t prot,
>   				    pgoff_t num_prefault,
>   				    pgoff_t fault_page_size)
>   {
>   	struct vm_area_struct *vma = vmf->vma;
> -	struct ttm_buffer_object *bo = vma->vm_private_data;
>   	struct ttm_device *bdev = bo->bdev;
>   	unsigned long page_offset;
>   	unsigned long page_last;
> @@ -286,15 +298,11 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>   	struct page *page;
>   	int err;
>   	pgoff_t i;
> -	vm_fault_t ret = VM_FAULT_NOPAGE;
> +	vm_fault_t ret;
>   	unsigned long address = vmf->address;
>   
> -	/*
> -	 * Wait for buffer data in transit, due to a pipelined
> -	 * move.
> -	 */
>   	ret = ttm_bo_vm_fault_idle(bo, vmf);
> -	if (unlikely(ret != 0))
> +	if (ret)
>   		return ret;
>   
>   	err = ttm_mem_io_reserve(bdev, &bo->mem);
> @@ -302,9 +310,8 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>   		return VM_FAULT_SIGBUS;
>   
>   	page_offset = ((address - vma->vm_start) >> PAGE_SHIFT) +
> -		vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node);
> -	page_last = vma_pages(vma) + vma->vm_pgoff -
> -		drm_vma_node_start(&bo->base.vma_node);
> +		vma->vm_pgoff - mmap_base;
> +	page_last = vma_pages(vma) + vma->vm_pgoff - mmap_base;
>   
>   	if (unlikely(page_offset >= bo->mem.num_pages))
>   		return VM_FAULT_SIGBUS;
> @@ -344,8 +351,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
>   			} else if (unlikely(!page)) {
>   				break;
>   			}
> -			page->index = drm_vma_node_start(&bo->base.vma_node) +
> -				page_offset;
> +			page->index = mmap_base + page_offset;
>   			pfn = page_to_pfn(page);
>   		}
>   
> @@ -392,7 +398,10 @@ vm_fault_t ttm_bo_vm_fault(struct vm_fault *vmf)
>   		return ret;
>   
>   	prot = vma->vm_page_prot;
> -	ret = ttm_bo_vm_fault_reserved(vmf, prot, TTM_BO_VM_NUM_PREFAULT, 1);
> +	ret = ttm_bo_vm_fault_reserved(bo, vmf,
> +				       drm_vma_node_start(&bo->base.vma_node),
> +				       prot, TTM_BO_VM_NUM_PREFAULT, 1);
> +
>   	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
>   		return ret;
>   
> @@ -460,22 +469,16 @@ static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
>   	return len;
>   }
>   
> -int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> -		     void *buf, int len, int write)
> +int ttm_bo_vm_access_reserved(struct ttm_buffer_object *bo,
> +			      struct vm_area_struct *vma,
> +			      unsigned long offset,
> +			      void *buf, int len, int write)
>   {
> -	struct ttm_buffer_object *bo = vma->vm_private_data;
> -	unsigned long offset = (addr) - vma->vm_start +
> -		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
> -		 << PAGE_SHIFT);
>   	int ret;
>   
>   	if (len < 1 || (offset + len) >> PAGE_SHIFT > bo->mem.num_pages)
>   		return -EIO;
>   
> -	ret = ttm_bo_reserve(bo, true, false, NULL);
> -	if (ret)
> -		return ret;
> -
>   	switch (bo->mem.mem_type) {
>   	case TTM_PL_SYSTEM:
>   		if (unlikely(bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
> @@ -485,16 +488,33 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>   		}
>   		fallthrough;
>   	case TTM_PL_TT:
> -		ret = ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
> -		break;
> +		return ttm_bo_vm_access_kmap(bo, offset, buf, len, write);
>   	default:
>   		if (bo->bdev->funcs->access_memory)
> -			ret = bo->bdev->funcs->access_memory(
> +			return bo->bdev->funcs->access_memory(
>   				bo, offset, buf, len, write);
>   		else
> -			ret = -EIO;
> +			return -EIO;
>   	}
>   
> +	return ret;
> +}
> +EXPORT_SYMBOL(ttm_bo_vm_access_reserved);
> +
> +int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
> +		     void *buf, int len, int write)
> +{
> +	struct ttm_buffer_object *bo = vma->vm_private_data;
> +	unsigned long offset = (addr) - vma->vm_start +
> +		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
> +		 << PAGE_SHIFT);
> +	int ret;
> +
> +	ret = ttm_bo_reserve(bo, true, false, NULL);
> +	if (ret)
> +		return ret;
> +
> +	ret = ttm_bo_vm_access_reserved(bo, vma, offset, buf, len, write);
>   	ttm_bo_unreserve(bo);
>   
>   	return ret;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
> index 45c9c6a7f1d6..56ecace0cf5c 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_page_dirty.c
> @@ -477,7 +477,9 @@ vm_fault_t vmw_bo_vm_fault(struct vm_fault *vmf)
>   	else
>   		prot = vm_get_page_prot(vma->vm_flags);
>   
> -	ret = ttm_bo_vm_fault_reserved(vmf, prot, num_prefault, 1);
> +	ret = ttm_bo_vm_fault_reserved(bo, vmf,
> +				       drm_vma_node_start(&bo->base.vma_node),
> +				       prot, num_prefault, 1);
>   	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
>   		return ret;
>   
> @@ -546,7 +548,9 @@ vm_fault_t vmw_bo_vm_huge_fault(struct vm_fault *vmf,
>   		prot = vm_get_page_prot(vma->vm_flags);
>   	}
>   
> -	ret = ttm_bo_vm_fault_reserved(vmf, prot, 1, fault_page_size);
> +	ret = ttm_bo_vm_fault_reserved(bo, vmf,
> +				       drm_vma_node_start(&bo->base.vma_node),
> +				       prot, 1, fault_page_size);
>   	if (ret == VM_FAULT_RETRY && !(vmf->flags & FAULT_FLAG_RETRY_NOWAIT))
>   		return ret;
>   
> diff --git a/include/drm/ttm/ttm_bo_api.h b/include/drm/ttm/ttm_bo_api.h
> index 639521880c29..434f91f1fdbf 100644
> --- a/include/drm/ttm/ttm_bo_api.h
> +++ b/include/drm/ttm/ttm_bo_api.h
> @@ -605,7 +605,9 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>   vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>   			     struct vm_fault *vmf);
>   
> -vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,
> +vm_fault_t ttm_bo_vm_fault_reserved(struct ttm_buffer_object *bo,
> +				    struct vm_fault *vmf,
> +				    unsigned long mmap_base,
>   				    pgprot_t prot,
>   				    pgoff_t num_prefault,
>   				    pgoff_t fault_page_size);
> @@ -616,6 +618,11 @@ void ttm_bo_vm_open(struct vm_area_struct *vma);
>   
>   void ttm_bo_vm_close(struct vm_area_struct *vma);
>   
> +int ttm_bo_vm_access_reserved(struct ttm_buffer_object *bo,
> +			      struct vm_area_struct *vma,
> +			      unsigned long offset,
> +			      void *buf, int len, int write);
> +
>   int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>   		     void *buf, int len, int write);
>   bool ttm_bo_delayed_delete(struct ttm_device *bdev, bool remove_all);

