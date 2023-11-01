Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21F957DE50F
	for <lists+dri-devel@lfdr.de>; Wed,  1 Nov 2023 18:10:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB4B510E74C;
	Wed,  1 Nov 2023 17:10:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2061.outbound.protection.outlook.com [40.107.101.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB42110E74C;
 Wed,  1 Nov 2023 17:10:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n8FAkOXSgpzUnNZtq8qblErqnqeBjW8jW/T0lGbNkkz0ldbU2FFvUkgqVdQUs/dneL3XmYNwiozKiPMyxmZQODixINPCJCfui00iBLxEq2E5gK5tDFF7RqvM2F+dUGv6QlXLg6y7Qpnk1EsCwVXvaJC77zIZfx3umFyW5qsBqQ+b7Lzm+NBopb++I3TCe3vm1ROh8SNIJXlk5ziANnAX1E5gyhPCrwZ8fM+rfB3wHpB2L5wvp7atErZKL29jOxAZoQ03kULXse1CL3Nt524lASc1Rbd1/jr5r4s0Hjkjl0wXV81he6MTqcJVEAjqa4n7RVmGAm5qQzZ2Cm3EnoErvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KLyAD28PcbADMbRMBrgnIeLrqglSs/jTjLFInbxY9UA=;
 b=QPoYeL5kvumcDoGQS8LqoTTdrz0E1MIXPZpoEgyghs12lt1QtUa9J2mx1WuxFI0ZUr9gp7ZzOvEehRGFTSeW0OWC1bIgt1SVyNfAMnssb3O+qUXh1wQRTjUln30juj8Ph0W+Dc2qYswtpc6XfWwlVWiN2uq6C7Tw4+RgS28Tn2Q8oYrKQb0NTzCAPL83M846Ew3nOjmNUnl36XhzLUgoXN46ArTMkr/y9t8PEaKz35yOGh3SJbZO825ttvHm8JvxDK9vKImOTQhxPyuQvO1/2uA19WSk2i5HziZcQ0fiLj/kdmnlNAvQ+Rm+WmVV1QthJGuMXOSn2/n7LwmQDqotdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KLyAD28PcbADMbRMBrgnIeLrqglSs/jTjLFInbxY9UA=;
 b=5qWQGiwyHMe6GhZN2rhffmNvwzIwfzbvA3XB6SUQUSRfSWcvpYZpyYVl2EXjrH2k9Sw/hJitZG63NWelMrXOMGYhxehQ48amgisI7KyAJ0uKSWewTEH+0sqpG+Ov+M3499gPrazzHWsbEybXUxuAlf+B5WzaBTG9uLZ7B4a68BA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BY5PR12MB4853.namprd12.prod.outlook.com (2603:10b6:a03:1da::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.19; Wed, 1 Nov
 2023 17:10:01 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::19c3:4a94:9ddf:35aa]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::19c3:4a94:9ddf:35aa%3]) with mapi id 15.20.6954.019; Wed, 1 Nov 2023
 17:10:01 +0000
Message-ID: <5238cb22-81b3-4051-8ccb-2238f9cb215c@amd.com>
Date: Wed, 1 Nov 2023 13:09:58 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] drm/amdkfd: Improve amdgpu_vm_handle_moved
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20231017211337.1593869-1-Felix.Kuehling@amd.com>
 <20231017211337.1593869-4-Felix.Kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20231017211337.1593869-4-Felix.Kuehling@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0130.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::33) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|BY5PR12MB4853:EE_
X-MS-Office365-Filtering-Correlation-Id: cf7eab0f-3fcb-4728-f89c-08dbdafd61e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 47iMLgVqOlh+7+rwJL99KOYqNPrPfPNu3zlCJgWob4uzpfJhKdxFyKn4VxN+gFkpF4KIhe48HIZ7loViDBuMdMoge0o6kn9yz75YrtHhdp4tOMA/43N+ZgjmuCbnZogo5lrzQEfbnBFjcki2kN49/IuGUuO8kbj6gqYJGAn4w6Rog1OBQPJ0OU+Q+d4YekZSmA3wdbWztls2RSOPEdEfOEVmImNsUJfBr2q1dCNoMLqzRLUdHZSrHb3SLLw2Xo/pVmL3ys6dyMqOVBq+a87j75ezviMDL5PoAI3ljj0vu3HgFLv/t1n77SbbdaZ6nkZrp5mT5uatJ7dP8WKyeWXagm4bcVCYX9Uvrv/HfujmAtgcvErubnI6Svw+xpyLb9/bW5qNcW6rNPR95TxxO9ZXcSRJhFLZtZilJhSvZz36tqPGoj+mRXkOTBfxqIdyp1FQBjOSyzgbk2e4UuvfCTsDatRGY+GEC1+iCkxGlfMNJNNHVaaANxZkM7j9DfjcfGXH+eoMSNQc9w0FM4QSJN0WNcY9B8O08yEheSMERVqFPEqxKytQQ/lAy4rgpsZb1HiP7dYhT0IkjQt/BMB9A6N5J/B3ZVNlw3uK1G8bjBBdkuNaAcnMmmCEsDGwjUkI4jzIb6IEk2CMPTk8NAfsD6HkMw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(376002)(39860400002)(346002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(8676002)(8936002)(4326008)(44832011)(316002)(31686004)(478600001)(41300700001)(4001150100001)(6486002)(6666004)(6512007)(26005)(36916002)(2616005)(450100002)(2906002)(83380400001)(66574015)(38100700002)(53546011)(66556008)(66476007)(66946007)(5660300002)(86362001)(36756003)(31696002)(6506007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cnRUUHlqVTBTOEZTTXEyL1VtNUZGQ29SMkJOS1A1SCtlYmxHdTkzNXZ3RCtv?=
 =?utf-8?B?ckIyR21iaXRVT0hzZWcxL01mSXlUcFB2UGFvSDk4NUtRM0NBTC9NaXVJaVhE?=
 =?utf-8?B?MDZtUFAxR2t0Vi9QZkw5ZWFqSHNTOXNFWDF6TEMvNi9NWldnT1NLbDgrVGg3?=
 =?utf-8?B?dkpQUW1MRkROSkVISm9EMllkckdqN3kvckMrZGVDSE02cjhHZDlPYzM4Wkh0?=
 =?utf-8?B?QnowbjM1Y1pLNnJyUGJtWkdmbGdNM1I2N2RUNDM1SFpmUy9Ocm1pR2dsbHBh?=
 =?utf-8?B?THlLaXB6U0VBZHdSZDRRaDJkTjJ0Yjcxc1QvaEVqNlhxNkUwMEZuMzR4UVJE?=
 =?utf-8?B?T212azN5M3pQM3U5VjFVVGpocFRtOGdjT0tiVFRLODlQc280dUQzckxDbFdt?=
 =?utf-8?B?TkFNQWpBR09MbUNSbWVIYWVpUVZQYjBLVWhRbWNyQmpaalJKYkVNWXVlNEFE?=
 =?utf-8?B?dGF2aW5LZGIwYjB0Zy9hNnc1Vm1peDZIek8wUWR2TXU1bkNLV1BGWTZZalAw?=
 =?utf-8?B?WWw3QjhnVk5HMXphVnFjR0tqZDdJN3R3eUlCR1VaUjdEU0s5N0tnYkNHbFhT?=
 =?utf-8?B?SThFL01jVklXU1F2UDNCR21IUkx2T2w3eW1YbkFZb3FOOVVGRE1xc1NIVGdv?=
 =?utf-8?B?UWYrWkVsemxnN3BWS29seGk0Y1N6QXB4elQyTDlsOFE2eWE5MVFWeFJZcGdM?=
 =?utf-8?B?eW1oN1FCLzhoZHNhSG03VHhmdnNPalFLWDlBUUZ2eHRTR1padUFSMmx5TExj?=
 =?utf-8?B?ekNQN0UrUHJTa20wL29EN1ZOSGRVZzBMWm9SenpYMUE1R3VNVkVJdTNHSzZy?=
 =?utf-8?B?MkNYV205cVRsVTMvWm1CUVdjM2prV2JmTklTZTZEY09jazZQUTZyb2FiZmE2?=
 =?utf-8?B?NEYvS1kwcFMvNmZpclhIcHhJTENSekkwZjZnSVBlSHdUVnYzaHN5eTh3ZTBO?=
 =?utf-8?B?UHBhUURKUkh4RjZ0ZDI4NXJyazZ1WFFzTktaYmJDcnZBbVdsaTVCSkFrSG83?=
 =?utf-8?B?RVdNajFGODlFN2VoWHJ2TkFlemUvMXFkR3FlbmVNS0ZidjRTY0ErZXJUd3Bv?=
 =?utf-8?B?bnc0S2VJNmhUYnRJSk4yTTN0dklLcHR0V3JUdDdodFRxY1g2YjkzU2t2V2Ex?=
 =?utf-8?B?OFIwTldIdDRhK3JaT2RVS2w2dlMzb0plYnlDQ2QzQ1VGNWU5ZjZwMGZZaW5G?=
 =?utf-8?B?UUxtR1hvRksyN3o2UEFCUGZuOTJXdkxDRytwRjdCWnl3ZUkzZFppTXJlYXJQ?=
 =?utf-8?B?SUpMZHp3Q1dhY3hYdC84Nm14anJrWWRYb2hCZElMdkhUbFFPVHNYdFJKSWJt?=
 =?utf-8?B?RjFvUzgrMTE4Ky95QWJJd2hHYkd6OFVDRXh4WWVFMC9KY0R3QllHYmtYaDRH?=
 =?utf-8?B?bGtQRmp0SE80RTc0a3R0YStHWGtpTmxVRzJUKzFBeUc5TVZBMGxFZitoNDdo?=
 =?utf-8?B?aFgySE5iaHJHb0hNQ3Jxa0dHS1IwQ3BjTHI0Z2w4dzZxeWpVT1VzWWx2RHQ5?=
 =?utf-8?B?ZHRzaDdoV0RCRXNXOWZOT0MrVmxWdE5hamVsQVFGYnlZQ2RONDYwQzlpeXhN?=
 =?utf-8?B?Wk1mU3IzRXhoeUU5cC92MXJKdGszZWVieXgyZDZ0MGxjWFo4Q2lGRVlNcS84?=
 =?utf-8?B?NUR0NUJYZTh2Y0VOajlZM3IwbFBMZHcvKzE5bWJnTHZ0ZGN4aEFiZmRXSEE0?=
 =?utf-8?B?QUNaWkgzTkZXSnVaRjhrWnZ0NDRwNzlTVmxLVlFBMkdSMG41QUlMMlVzc2p6?=
 =?utf-8?B?UmhKZitiYy9XQSs1UE5PQVNObjFVTU5jL0MyRGwyWHNTVVlrL1VwclcvWWZN?=
 =?utf-8?B?dWI5TWRQYnVJQm1rVkZMbllzalFJbGFVNjRtMzc5OFFOYjNuOCtNZWxXdzkw?=
 =?utf-8?B?RlBJczNGY2M3YWNqbmlpUGxtMkZVMXJYSnZDNzhsMjBEajQ4WDFaS1kwbTQr?=
 =?utf-8?B?RTRxMTREYy9CaHlBS05aNWhxQVFYTDBOMm1uR05JdUh6MllpbkNCRDAzSHpm?=
 =?utf-8?B?Nmd4Mk1XaUVFQnh0YWpEVGUxbFcxc3ZNTmN0QXBXWjdudlAwbGtOaW9MS3Q0?=
 =?utf-8?B?VlE2dmxxQVhKVlBVL24xVUJQYWV0NFZMZUcvNGdjQVJKdG5NeTJwaWdIdU83?=
 =?utf-8?Q?+NZAPP1mZb9eY2BGP9BpZXLN8?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf7eab0f-3fcb-4728-f89c-08dbdafd61e4
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Nov 2023 17:10:00.9666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PzouT6+xBV0UxiGUXLJjtyuHxmUImda2e5lFhvut7jPQsbbxR3keCqqDSAO19Lmls52FTfATJmRCtIOPYZJXPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4853
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
Cc: Xiaogang.Chen@amd.com, Ramesh.Errabolu@amd.com,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-10-17 17:13, Felix Kuehling wrote:
> Let amdgpu_vm_handle_moved update all BO VA mappings of BOs reserved by
> the caller. This will be useful for handling extra BO VA mappings in
> KFD VMs that are managed through the render node API.
>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> Reviewed-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      | 22 +--------------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 19 +++++++++++++-----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  3 ++-
>   4 files changed, 18 insertions(+), 28 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index 74769afaa33d..c8f2907ebd6f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -1113,7 +1113,6 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>   	struct amdgpu_vm *vm = &fpriv->vm;
>   	struct amdgpu_bo_list_entry *e;
>   	struct amdgpu_bo_va *bo_va;
> -	struct amdgpu_bo *bo;
>   	unsigned int i;
>   	int r;
>   
> @@ -1141,26 +1140,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>   			return r;
>   	}
>   
> -	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> -		/* ignore duplicates */
> -		bo = ttm_to_amdgpu_bo(e->tv.bo);
> -		if (!bo)
> -			continue;
> -
> -		bo_va = e->bo_va;
> -		if (bo_va == NULL)
> -			continue;
> -
> -		r = amdgpu_vm_bo_update(adev, bo_va, false);
> -		if (r)
> -			return r;
> -
> -		r = amdgpu_sync_fence(&p->sync, bo_va->last_pt_update);
> -		if (r)
> -			return r;
> -	}

FYI, removing this loop seemed to cause PSDB failures, mostly in RADV 
tests. It may have been a glitch in the infrastructure, but the failures 
were consistent on the three subsequent patches, too. Restoring this 
loop seems to make the tests pass, so I'll do that for now. I don't have 
time to debug CS with RADV, and this change is not needed for my ROCm work.

Regards,
   Felix


> -
> -	r = amdgpu_vm_handle_moved(adev, vm);
> +	r = amdgpu_vm_handle_moved(adev, vm, &p->ticket);
>   	if (r)
>   		return r;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index b5e28fa3f414..e7e87a3b2601 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -409,7 +409,7 @@ amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
>   		if (!r)
>   			r = amdgpu_vm_clear_freed(adev, vm, NULL);
>   		if (!r)
> -			r = amdgpu_vm_handle_moved(adev, vm);
> +			r = amdgpu_vm_handle_moved(adev, vm, ticket);
>   
>   		if (r && r != -EBUSY)
>   			DRM_ERROR("Failed to invalidate VM page tables (%d))\n",
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index d72daf15662f..c586d0e93d75 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -1285,6 +1285,7 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
>    *
>    * @adev: amdgpu_device pointer
>    * @vm: requested vm
> + * @ticket: optional reservation ticket used to reserve the VM
>    *
>    * Make sure all BOs which are moved are updated in the PTs.
>    *
> @@ -1294,11 +1295,12 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
>    * PTs have to be reserved!
>    */
>   int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
> -			   struct amdgpu_vm *vm)
> +			   struct amdgpu_vm *vm,
> +			   struct ww_acquire_ctx *ticket)
>   {
>   	struct amdgpu_bo_va *bo_va;
>   	struct dma_resv *resv;
> -	bool clear;
> +	bool clear, unlock;
>   	int r;
>   
>   	spin_lock(&vm->status_lock);
> @@ -1321,17 +1323,24 @@ int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
>   		spin_unlock(&vm->status_lock);
>   
>   		/* Try to reserve the BO to avoid clearing its ptes */
> -		if (!adev->debug_vm && dma_resv_trylock(resv))
> +		if (!adev->debug_vm && dma_resv_trylock(resv)) {
>   			clear = false;
> +			unlock = true;
> +		/* The caller is already holding the reservation lock */
> +		} else if (ticket && dma_resv_locking_ctx(resv) == ticket) {
> +			clear = false;
> +			unlock = false;
>   		/* Somebody else is using the BO right now */
> -		else
> +		} else {
>   			clear = true;
> +			unlock = false;
> +		}
>   
>   		r = amdgpu_vm_bo_update(adev, bo_va, clear);
>   		if (r)
>   			return r;
>   
> -		if (!clear)
> +		if (unlock)
>   			dma_resv_unlock(resv);
>   		spin_lock(&vm->status_lock);
>   	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index 6e71978db13f..ebcc75132b74 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -432,7 +432,8 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
>   			  struct amdgpu_vm *vm,
>   			  struct dma_fence **fence);
>   int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
> -			   struct amdgpu_vm *vm);
> +			   struct amdgpu_vm *vm,
> +			   struct ww_acquire_ctx *ticket);
>   void amdgpu_vm_bo_base_init(struct amdgpu_vm_bo_base *base,
>   			    struct amdgpu_vm *vm, struct amdgpu_bo *bo);
>   int amdgpu_vm_update_range(struct amdgpu_device *adev, struct amdgpu_vm *vm,
