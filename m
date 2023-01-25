Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3713067B461
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jan 2023 15:27:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D854410E7CC;
	Wed, 25 Jan 2023 14:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D330410E7CC;
 Wed, 25 Jan 2023 14:27:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fOzTFt6DDKkYmSq5dwCRYforWEmaIfpvN8NOweGKvBsaTVm9VupgCIbWt9So3YjzFnf4FZFaCSFJOwQmAZ6ElD5Y9iCk0J5MqbLuskQRCBGvfJv1dOD3RZp+wj0q2gzjdQk98MKNP7xDT+doUHcqsMhSMm0xvtxcHgVKAAJU+aI5mGvdo94TflzGjehIWjCb7oylHiGIUsva6iv9zCZfyizIyYfaBODDMxislJrH4+JsHkAfjW1k8IAdPPGCEbb4/n1kCF0i7UNmS0qBQcUQRRFn0yJihz+whyeegOuylBsrncw6p7JTySaDXTguxNfojmdETj6QBhLyYqAJpWBLTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79sCuasRMR29BKJICf4NlExmiwCdU6JaTXgGfKoJq8U=;
 b=cPApdgFIhhijTS+RjyxH5AzMJGmCZUWWPerlPfZ8sVSUaI/fsHFqtXhNkxhCcdTWQ5tOElzyFKSlJzDBt3y8EHeLuDlR5wTPXBaJaC/cf8gePF1DimChyTLJlsA2IaPmLK5JBjoe/uMQ0F0XH+rP1InmSn7aph2kLgN8zDApdlLK/WFi9jJzv22/J1L2eiBX4kUKnS9p/nc7F8Dc2AxZwpPgtkl5kkKAaku9UICf/TsweIaK0B8A2eSGubePrg1AjnsKFBA0MmaQ0VjUHMM1L5Fkr23WyYVBw++ik1uBvimyhajdqhm+FBoJe6Xt2y93/toSRKWpAXGhJWoypcbHmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79sCuasRMR29BKJICf4NlExmiwCdU6JaTXgGfKoJq8U=;
 b=mwE+S1jrkTI5XMLy6Lkb+ZJLzqkHm6VjsxgGIhL338L6PcCXimhn+7Z2lrDjp0W3oZazLZ6AFxEcD/+b/ZecChaHpnySTfybBXibJ6HubRm48fAreUPEJYDWF8RSLRBd217cM9F1lyYngqagNmbFwh/i1uo/Wf8m2HUtW8pGfB0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5083.namprd12.prod.outlook.com (2603:10b6:408:134::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21; Wed, 25 Jan
 2023 14:27:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6043.017; Wed, 25 Jan 2023
 14:27:20 +0000
Message-ID: <be4e1651-38aa-56f4-5427-a04206086e8a@amd.com>
Date: Wed, 25 Jan 2023 15:27:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 1/4] drm/amdgpu: Use cursor start instead of ttm
 resource start
Content-Language: en-US
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20230125142415.18546-1-Amaranath.Somalapuram@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230125142415.18546-1-Amaranath.Somalapuram@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0055.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|BN9PR12MB5083:EE_
X-MS-Office365-Filtering-Correlation-Id: 4572942c-e046-4ada-e50c-08dafee044aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L/QM2KlzYdOvqHk9/v36qQySFPbCKCXqzpkA1kK83rpQaAHxiNrfB10DBMmLlZTgGYQJPV/0L0yo8/end4aY7IkmV++R5Xe3D6Ws67jIMh7MEqOt0tSkGEYpa2H97ZLlvVNR+M9Vm12VnRFt7/QszyxGEtuqEqQjlGhjtffEPwfwidiFQg5Nn7os6I9sXf4/JQkJ7q8pGV/NqyVfgWs5uLnP1v+izJGUHM+D7sVjEmMzDjwsWEtkwTMtBvTiNxiOtuapdu4yIhHgXfo/7b4qNX+SouCGcxYU5U+pzUNUGNSOu+cQWhfI6FnZr76ItdMU6B6txS+FTUuoQcoVA/+aEaVzNOdIOoUQSn3lsB8XD/Cc8wwTzezWL7T8Jh9F2jHV14kGNeYcpctTtRPuWXq11F1QlasY+26CllhmzgctOxLwzM3c0BAr5C2MpyI40dLSypzxF/oHsSH9cF63CByekMzXOEQKnmHbBUTwLczbmpbi7FI850Tr0wq+yqo5eXoUI+OGRQOcOEnLRP+6koGpzAntAPN3Bli+AFK/D3Yx/ZhD1+wI2tz/2HghU3vmbYidWSAAAd8FJlAD7GQMQ9oy1ZMql44gRn2PoP6LSiyIA+b+M/F/dlJKICRwa6RJGqMMd/GxktrvvaOyZVn5ji8YFLYlD0wgp1AODFdOipBODCStnSSPYhhI5Hn2eM6ve2t9TZZ1Hkqa69mc3Qe9gv/QeNfJz4keF2HCJPiy00eAORQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(136003)(366004)(396003)(346002)(451199018)(36756003)(2616005)(41300700001)(8936002)(38100700002)(2906002)(5660300002)(83380400001)(6506007)(6486002)(86362001)(186003)(6512007)(478600001)(6666004)(31686004)(31696002)(450100002)(66946007)(66556008)(66476007)(8676002)(4326008)(316002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cUkwVnNFcEZUZGRWRjFFbFNNajRSMWQwWUN3dVRXOEpXdkNoUklKN0ozUWQ2?=
 =?utf-8?B?QTZTMjl0Uk8zSEN6ZUdkSXZBVUpIelFseDYybS8yNUhxVm1sYkxTUnEvUkll?=
 =?utf-8?B?Q2hIRDhpVmd2YzZSZDRCUVF6dzJaRFB4RTg4UERjYktEeVRkSlA1MDZJczFt?=
 =?utf-8?B?K3RFa1VQZ2wzTk5GeHVjUU1IMElNa1pBT0JtN2Y5SjJZUkthU0VQVW5nR0Nh?=
 =?utf-8?B?Y0RWYzN3Zm15TDhKcVRlS0VGY1VnQktCK0pYeVRlRzZ5VUg4N2hMUGhiWjJR?=
 =?utf-8?B?RDBlRFQyUEYrSEVwemdvT2tlOTVuWk80dHJ5YWhLc2JDS25nQ2hsZmhLVU9u?=
 =?utf-8?B?TW9CZkVpdjJyM1U2TlgrSVU1c1dZaTRSeUtycC82azBKdEpTWW9NYVN1VCtH?=
 =?utf-8?B?MEdWNXFRVnFMNjNhOEZZUFNubFZqbUVrRU1PR29HWmozU2ErT0pKelZSUHFk?=
 =?utf-8?B?T3BNS2lRMHlPMXpCTmMrUUtEZG04eTlqa3Z4UHZkWXBRNk5peW5veGFuZHFp?=
 =?utf-8?B?bkYrWGdPcHBZN05CelZDdHNaMFQ1SlVFNkdNNm8zb0dUVEMrS2hMRkhxUUZS?=
 =?utf-8?B?RlZ4c2g0dWRWRzVvNHBuZm9KTDlQWUVCWXVPS1RXdHYwRlBTZHpSdkF4S05B?=
 =?utf-8?B?VjVSbDdTUW5hWWViMERzTWZxZ3BGcWJFVXFDS3FjdUYreU9ISk94UFZYcHpz?=
 =?utf-8?B?VTh0UmxzSTFDU0ZjUWxjeWl5Y2U1dnFQQ25aMjRIUU1oSG52NEdGVFFqK3lQ?=
 =?utf-8?B?c1hBVGU5d1FOWTRNak1rcFF5Snc1bktaZDlPOHNwRUd2QUhCZ1dYaENzcktm?=
 =?utf-8?B?SGNkQ2oyTHZZNE9XMlU3QmJrR0k1Zi9Ub1hpdHBwU1RMSFVFbmkrbGk2Mkhu?=
 =?utf-8?B?NCtIMUFSS3kxYTdOTXVSR0ZYaHcyNDdueW54MkhuUnV0ZHQrT2Q0ZWFHR21t?=
 =?utf-8?B?SFhPaU5ZdCtkckRTeVFXSWlOOENKYzYvRzJKTUduV2NOUFUxbUtLTkR2UmE0?=
 =?utf-8?B?Y0RsSmhQVGx5d0hJNVNNWWhyTmNnT1VLSUhWaHQ5RjAzdDlOQnlwcmhVcFZi?=
 =?utf-8?B?MFkvTnFTamdqSzZ0N3pDZStESGdQWW93aXpxS21DNXlWSWpDdHhraFd5Zzhp?=
 =?utf-8?B?Rm1Tb2c3bWxEb09OTkZOUFYzUnFpY2loME9BTm9IK0xDTkJrRC9wRi9ibnVD?=
 =?utf-8?B?cFNSQng4U2xUenZOck5Gck80UlI2VUdjQlBzc3M0VyswNzFVR05tTVNiL0Nu?=
 =?utf-8?B?bnVvdTRIWXorKyt1bk9KMEN5bzNiWWg0SnZCa240Q1FxRDVkdHZyVFRHOUFP?=
 =?utf-8?B?L0RWOXRuZHNGOG8wWkZhZDl6QTI3TllLblZKKzJTUGliZ2xyc1ZuOFVPYW5n?=
 =?utf-8?B?Z0VxNDdHUW9YczNBeCtROFF0MnE4Zm9CYTh1SlFreTl1Tkh2aC9BYWxvVjRM?=
 =?utf-8?B?MU5MOWJEUjBSTFJSZGJBbFFFTDk4Sml1V3BCUVcydmVmNWRFZ3owSjNrSGFQ?=
 =?utf-8?B?bDlMSTJ0UHZUQ1RLTlJlZ1Rtc1VPZlhLZGJiYzFQRE9NeW82ZmJKMXh5Y0dO?=
 =?utf-8?B?ZFZrSmZ3Q1RJUDdGY0JkVDRleGZRZkJnUHNrd0pyc3VWM0NlMWF6M0RwYnFa?=
 =?utf-8?B?d2JmUFBtNTU5UmFTT1RoSHl2cFdoc2dMcW05MW9MU3lhT3RlVEt5U1U5V2cw?=
 =?utf-8?B?STFTdlU5RnZNeXZpbEs5MSt0Vkw1WGowYTNTSExIM3hvdUtJeUUzcTBlb3dW?=
 =?utf-8?B?ZEVvZWpmS1ltM2lZTTFHa2RHek4raHZZSjZESG1rdHkvOUtWUTJmcnVaVlV6?=
 =?utf-8?B?VkJVcUpxRFQ3b08rSDB5WXVZa3ViRlIwa1BxQjd5YWUxU1QwdlNLMGVqbzRM?=
 =?utf-8?B?V3lYb3FzNVFvSVpKa0wrd3h6bGgzTUUvNXYzc3lxUEhhcHFBV3BtR3UzcjJK?=
 =?utf-8?B?TEhzVFZjOE8rT2FVMXoxSkhMVlhPNThCLzNsQjRleTBFWkllT3M2YTgyVjhp?=
 =?utf-8?B?QlgyeDU0WXBxcnJSWTl4NDhycGQwY2NmcmJXc0FGK2U4a0h3ajRPVVdwV1Rk?=
 =?utf-8?B?RUdVb0Yvb3laTXhHKzYxVGlzNENzOVdpbmFKM0RBZ0RtYkVkanhtNXY1ay9v?=
 =?utf-8?B?Y2dPRDF0N1BDUStiUmxvU2k4eTRDU0dvdHl6T3dxMm1kcE9NWHR3TWtKb2xV?=
 =?utf-8?Q?VjMevMWbfbHQH6bAfmDGx7bA5mQpbq4aOH7Wy/MyDyVh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4572942c-e046-4ada-e50c-08dafee044aa
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 14:27:20.6713 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEsrc0m75GhU/UPy+4hG3vH28Q1GwWu5aLdyBPkLFIhj5KKf0UthiY89GuUtdlXC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5083
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
Cc: alexander.deucher@amd.com, arunpravin.paneerselvam@amd.com,
 arvind.yadav@amd.com, shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 25.01.23 um 15:24 schrieb Somalapuram Amaranath:
> cleanup PAGE_SHIFT operation and replacing
> ttm_resource resource->start with cursor start
> using amdgpu_res_first API.
> v1 -> v2: reorder patch sequence
> v2 -> v3: addressing review comment v2
>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  4 +++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 10 +++++++---
>   2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 25a68d8888e0..2a74039c82eb 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1491,9 +1491,11 @@ u64 amdgpu_bo_gpu_offset(struct amdgpu_bo *bo)
>   u64 amdgpu_bo_gpu_offset_no_check(struct amdgpu_bo *bo)
>   {
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> +	struct amdgpu_res_cursor cursor;
>   	uint64_t offset;
>   
> -	offset = (bo->tbo.resource->start << PAGE_SHIFT) +
> +	amdgpu_res_first(bo->tbo.resource, 0, bo->tbo.resource->size, &cursor);
> +	offset = cursor.start +
>   		 amdgpu_ttm_domain_start(adev, bo->tbo.resource->mem_type);
>   
>   	return amdgpu_gmc_sign_extend(offset);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index c5ef7f7bdc15..ffe6a1ab7f9a 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -849,6 +849,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
>   {
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
>   	struct amdgpu_ttm_tt *gtt = ttm_to_amdgpu_ttm_tt(ttm);
> +	struct amdgpu_res_cursor cursor;
>   	uint64_t flags;
>   	int r;
>   
> @@ -896,7 +897,8 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
>   	flags = amdgpu_ttm_tt_pte_flags(adev, ttm, bo_mem);
>   
>   	/* bind pages into GART page tables */
> -	gtt->offset = (u64)bo_mem->start << PAGE_SHIFT;
> +	amdgpu_res_first(bo_mem, 0, bo_mem->size, &cursor);
> +	gtt->offset = cursor.start;
>   	amdgpu_gart_bind(adev, gtt->offset, ttm->num_pages,
>   			 gtt->ttm.dma_address, flags);
>   	gtt->bound = true;
> @@ -916,6 +918,7 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
>   	struct ttm_operation_ctx ctx = { false, false };
>   	struct amdgpu_ttm_tt *gtt = ttm_to_amdgpu_ttm_tt(bo->ttm);
> +	struct amdgpu_res_cursor cursor;
>   	struct ttm_placement placement;
>   	struct ttm_place placements;
>   	struct ttm_resource *tmp;
> @@ -927,7 +930,7 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
>   
>   	addr = amdgpu_gmc_agp_addr(bo);
>   	if (addr != AMDGPU_BO_INVALID_OFFSET) {
> -		bo->resource->start = addr >> PAGE_SHIFT;
> +		bo->resource->start = addr;

This here need to be moved to another patch as well. Sorry I've missed 
this in the last review round.

Christian.

>   		return 0;
>   	}
>   
> @@ -949,7 +952,8 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
>   	flags = amdgpu_ttm_tt_pte_flags(adev, bo->ttm, tmp);
>   
>   	/* Bind pages */
> -	gtt->offset = (u64)tmp->start << PAGE_SHIFT;
> +	amdgpu_res_first(tmp, 0, tmp->size, &cursor);
> +	gtt->offset = cursor.start;
>   	amdgpu_ttm_gart_bind(adev, bo, flags);
>   	amdgpu_gart_invalidate_tlb(adev);
>   	ttm_resource_free(bo, &bo->resource);

