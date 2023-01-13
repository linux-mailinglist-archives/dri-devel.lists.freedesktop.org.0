Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E271766902E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 09:12:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6CE410E9C0;
	Fri, 13 Jan 2023 08:12:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2083.outbound.protection.outlook.com [40.107.93.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B4610E20B;
 Fri, 13 Jan 2023 08:12:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mgrkUvTvhK1yA2TOifaOKfs6NrkX4QOjBsoN/jGZh7N26/KpbYEMpmcVWkK3MmchYaI153zZo3BkiH7f3PLFQk+nGPICDmOytM0dpsnHAGEyW+RN6G9UX/aHYsFUCHOcI4PqpQ3m16TjUzeuxQMO/kjAQzRcK6mbpqCOlSh7yx5EJUtqEParxLWV8RIFERKtaszGZ6lwQW5FFv9ehydZ8yI8EL0LCrGmvOPdsqKKz7Fd1WsfoW0G/DLTptKBmWL0NIDkySdG7aGXfzfav1zjlTYxpeJldX04HD00mIrCtPV9b1TCStn0gyFvA1uQtS82ccd9cxmoJKffPsI0s41VjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiNAnOYg2syvi/Z7TQVtm4WifUbW6hD1zuwIYtFuUSs=;
 b=KLbhl3/vuRPaStxmVRrrmOgWIkh0uBOZ6Ch3KLXAtHcrtNeR1g0M2ZTqV51z4SAnX+b3Yf2CCuMcdLfRS68iN8huASWNl0tVBt3lq0QKqSlHi8x7iGla87/v2cnWnFGRi7xBGdTOBLFqv9O0xH/INPtOzusBezVOsAbvtLUmz3CzAePV8SH49LN5Lh6uRTXUIcp/5Q7MC7mDsItnY2tgt+1SXaAFUQdzfHE0RcrnhYez4yYpX/qb2aVlqo7/tUtWck0LKFNLEQp8buXugna0sajk3hu0PQpNUJxCWzou+wT26xQWztui44mTZ8kwGwUMNXtj6AdKaW35vxZVrQjoxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiNAnOYg2syvi/Z7TQVtm4WifUbW6hD1zuwIYtFuUSs=;
 b=msGTnN2PbwrC1M4gVZZYFhFeDJfo4s+XzHzA91gLeb7OmoSMm/jTgG1b8InDJ+dJuZLX4j5IDy3zaOleNSoJNBHlfnJezjcCpiDA9uhFaWGzI41Ko9Da37HffYi4Hdb0b1DeMnnYodycmc/r4rMpyJDipsOhct0n0IKyUmFvuGA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2602.namprd12.prod.outlook.com (2603:10b6:5:4a::11) by
 IA0PR12MB8088.namprd12.prod.outlook.com (2603:10b6:208:409::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18; Fri, 13 Jan 2023 08:12:05 +0000
Received: from DM6PR12MB2602.namprd12.prod.outlook.com
 ([fe80::7418:855f:c703:f78b]) by DM6PR12MB2602.namprd12.prod.outlook.com
 ([fe80::7418:855f:c703:f78b%4]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 08:12:05 +0000
Message-ID: <c113dc3c-1dbc-372b-7c81-64418ff22cc4@amd.com>
Date: Fri, 13 Jan 2023 02:12:01 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 4/6] drm/amdgpu: Attach eviction fence on alloc
Content-Language: en-US
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
 <20230112013157.750568-5-Felix.Kuehling@amd.com>
From: "Chen, Xiaogang" <xiaogang.chen@amd.com>
In-Reply-To: <20230112013157.750568-5-Felix.Kuehling@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR20CA0016.namprd20.prod.outlook.com
 (2603:10b6:610:58::26) To DM6PR12MB2602.namprd12.prod.outlook.com
 (2603:10b6:5:4a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2602:EE_|IA0PR12MB8088:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e63c0a8-5f4e-409b-c1d4-08daf53ddb43
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: L/QRAL2VY6fTzDrKOz0RIxXDuaOvJTbgkZ40MeBULgEbnZlz5CMDCNka3oQ8XrvOxXyV5EWIYAQEOzGV6KwiejKN2JVd7oSRk+IZJFyO0loZGwhG0obdF7Pu5NrDg0FLnoQxEwJP4l5p4bLxXxFiRdfHjjcXj58I9aWRRSJ2RJBH5H38x7gKVcmFFMrkPr0Fn3grNcGYWe4GJE/u+K7NTscReUBjGobu/kV/P+y01YRMT3Eoa1sRpkqIkjXnyY3ZIZRNs93kDUdF+fklHufZuQYDCGAep11TJMHdChdWbpmvHxuklvQpNwm5dlXkcVedUs8Rqn1/yJAfHRfFfO/PuRA6MqEwl+1hrhk6p/5I0mXmSSQF2SnfW/jj8KELaqBtIA6im9/nKd27z/RuA28JdhnJgCrVGuRZhL/WGkSZSADD/MmjmB3YvaFKBmlDQKCOhv5sheaSex9016j8BpgwqTw+X6M6plyA7RzKPxve7vbB+4t7bAmYQ5qC5FSIwQ2oBkkZJgutbT/8u4yrRxVimX/FXUIOymeEwYDj4VLBKtqNscYtBybFejVfoIRH0itIA9Gq5LEWd5KTSHjZVdZbyg09Bwg8Hpb65OibzpqNYYRxlFqzQMNPWALmR6jt/jUW+I0wEA/0aC7YXFY50z/8zcmM4BcTI4/rM5XODO4eH/QAHYo/Aw/5zntoi3Xr8rCZhSt/tpTN8EOJtMwUtyPJUdEtOhwzv0aMv8S/ViNevTs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2602.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199015)(38100700002)(86362001)(8676002)(31696002)(66476007)(41300700001)(83380400001)(66946007)(450100002)(66556008)(4326008)(478600001)(2906002)(53546011)(8936002)(316002)(5660300002)(2616005)(6512007)(6486002)(26005)(6506007)(186003)(6666004)(31686004)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UzNETnJ4LzlxS2dZZW5ueFE5aU1XaytuZFJSNFR5WUJDWXRpaDhOMFZZWUZZ?=
 =?utf-8?B?enV5ZGpTL09JNks0T2NxaHpIWDRNY3V2UUJGcWcvbHdadG10QUhEbXBOd2R4?=
 =?utf-8?B?bTBsN3JaYXR0VUVmcjBjME1XanFXTGhmdmlJdXZ1eDdjTjVBSGN4VUR1VDVS?=
 =?utf-8?B?KzA5dzZZVlkycys0clplMkZLd21CaFkraWYybjFxRldlVlVoZTBaUkU1OVdw?=
 =?utf-8?B?dUhWcWw3VnN3VU15d3FmUXIwNnhhaHNDMUtIZjJmbWRlN0JkNVRrdlRYSmJ3?=
 =?utf-8?B?dFd3TUtVRktweWwvMGphdGVRc0dXM0ZRYzFkT202VWhFUE9vbm1HejNqTEJX?=
 =?utf-8?B?akgrS293Tk1Cd1dnbG1XV2ZvVnM4emxrVjFEUnd1ZUFmejJXQjhZOHVucEt2?=
 =?utf-8?B?QzBPNCtNQXJXN2hFT1A0OTJha1RBamVTMHRpN2VnSTFkcnFsTHRxT3lEWk9x?=
 =?utf-8?B?cmFoQjEwdjZxU2l1SG1tTzhZczZVYXgzMWd5MURKNTZTUkRRSVZibWNSY2VR?=
 =?utf-8?B?NUllbUthcE1sMW9IM0JZT28rOWRjeTF1SVc1eExLWkhKVFJ0dUNiN1pDanY5?=
 =?utf-8?B?a2lpdzNmVWxyS3BPenNPcnNkYXVQN3FQOGRKK004RU1JVTNmQzZFQjgyNEdJ?=
 =?utf-8?B?S2dvYzUzRy9LSnJZd0poQTRpTWZ5bXNkOEtCN1NLaldrbVoraDJzdHIvcUgz?=
 =?utf-8?B?ZVNTY0VjTnpGOGdVOS8rQ0tjRDZJVGJ1QU93Mkp0OUhsZzl6czdLMStRVzhw?=
 =?utf-8?B?NWZYQ2dmK1p3a2F1dDR4bWhpQXA1UnZqUjk2MXEvY2oyNjR5ZG9zdXZFMGM5?=
 =?utf-8?B?NnRwR0VsVjNMaFR5akNXU2lDSmtSdGptUUt6THAzckdabyt1STlGamhReEgv?=
 =?utf-8?B?bVcyZGsvK1dCUmloT294Q2lJSUh4dWgzREVVSGM3dllaWlhhY0ZRcXdYQTdH?=
 =?utf-8?B?cG55dW5XWDhJOW1yVE1rKzFQYUpXcC9lUnFUTjIzSXc2ZVIxdkFjbFFadU0y?=
 =?utf-8?B?ZUFLSCtCQklWL1c4b1lmV2dLUktVT2t1Tjl4Vm5YUnRuZnFURGRNQ0V5WVdI?=
 =?utf-8?B?ZnFwb2JseFUyUzdxWGdERVdXWExRZWJsT3d1aENoSG5mZHBMa011OHdXZXJL?=
 =?utf-8?B?OXFLM2RDbEUxdG54eWhXdGVOTlZ3SSs0ZDZFaUM3OTlWTVdxRHFIUW5OemlH?=
 =?utf-8?B?czk2KzJkVWZEYitDS0NMbjcvam5BcEZNMXNTcUZDcWhKellsWHNqSFFTTDk4?=
 =?utf-8?B?MkFXWXpWVlhOeERadUVMaXBEZVdPSW5iQ2hoeDRWOTNXWE9ORWlpRHFrZHo3?=
 =?utf-8?B?OWwrSFpyYmZlTWwvNkltYXZqYmJOYndiYzRuS25Sbk41Q2did2pEcWp5OHNS?=
 =?utf-8?B?UVRkTVhGQzdGckJuQ3FEclhwd1FyNFRUODhsR0k4QTFhV0wvMUZUZVh0QUVl?=
 =?utf-8?B?bnpxb2w1TGdRYUNwaDVvUTVBb3hITWF0cU9xR2dUYUdPWlV0YWZxS01BNjdC?=
 =?utf-8?B?bVlHRDhCNXdYaFVwb1VCZ0Vzd3NZNzBBREN2UG43SEVPQVYyeFkvd20vc2Rn?=
 =?utf-8?B?YVRvRWZDQ1VES3RhODAralB5MVZJNTBBWmd0cWtBYkxMdkJJNjgrbUR0aHRu?=
 =?utf-8?B?bmRCWlEwcE9zSVFCSEtJbWxJY3ZPbjlQZVkxQmRBdk9leHFNYTJCUzRMYUZR?=
 =?utf-8?B?K2haTVd0cnI3MGNzamZLSFNiS2FNSmR6ejFTdmZrVTFTTmxBeFNzcGJBV2Yr?=
 =?utf-8?B?OHdhWmNZUDlkK1c5NmlQd01EdE9YVkNTODlyaElmdXZIY1hzRkRRUFNFVS8r?=
 =?utf-8?B?dDh6V21yN3lUcUFxdVcxMTB4Q2dDNFFMTjZzUWV4RHRNUDR5MnF0VWVHb2xn?=
 =?utf-8?B?dDNaZ3gvdHBIZ0tTVmpnWDNIdjBUWU5IaHVRN0dpeW1sY3pHNVBiZXNnSDZy?=
 =?utf-8?B?aEs5bTNNeWp5dVZqeTNjTVJQUkxMdjBPVHJzS3dsRFZNZW9ReWxja1drWjky?=
 =?utf-8?B?WTl0QTJtZGJ6UkJvTXZZOGhQYldyUEtUeHNjRERkdEVkOTIwTCswWmFVbEo1?=
 =?utf-8?B?ZjR1TVBTTHUwVHJtbXFKVEZEMThibWlxbTlzaVM5Y21MK2JUNklxM205Tmg3?=
 =?utf-8?Q?d2qI=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e63c0a8-5f4e-409b-c1d4-08daf53ddb43
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2602.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 08:12:04.9307 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FW42Iwwf+o4ERuQBVep3J+Qa8ShCRCE/nUrnoUa7z2hmfl/0fgVqT4n5yyfahjRI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8088
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
Cc: christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Reviewed-by: Xiaogang Chen <Xiaoganng.Chen@amd.com>

Regards

Xiaogang

On 1/11/2023 7:31 PM, Felix Kuehling wrote:
> Instead of attaching the eviction fence when a KFD BO is first mapped,
> attach it when it is allocated or imported. This in preparation to allow
> KFD BOs to be mapped using the render node API.
>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 63 ++++++++++---------
>   1 file changed, 32 insertions(+), 31 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 5645103beed0..79213f476493 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -360,6 +360,24 @@ static int amdgpu_amdkfd_bo_validate(struct amdgpu_bo *bo, uint32_t domain,
>   	return ret;
>   }
>   
> +static int amdgpu_amdkfd_bo_validate_and_fence(struct amdgpu_bo *bo,
> +					       uint32_t domain,
> +					       struct dma_fence *fence)
> +{
> +	int ret = amdgpu_bo_reserve(bo, false);
> +
> +	if (ret)
> +		return ret;
> +
> +	ret = amdgpu_amdkfd_bo_validate(bo, domain, true);
> +	if (!ret)
> +		dma_resv_add_fence(bo->tbo.base.resv, fence,
> +				   DMA_RESV_USAGE_BOOKKEEP);
> +	amdgpu_bo_unreserve(bo);
> +
> +	return ret;
> +}
> +
>   static int amdgpu_amdkfd_validate_vm_bo(void *_unused, struct amdgpu_bo *bo)
>   {
>   	return amdgpu_amdkfd_bo_validate(bo, bo->allowed_domains, false);
> @@ -1720,6 +1738,11 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
>   		}
>   		bo->allowed_domains = AMDGPU_GEM_DOMAIN_GTT;
>   		bo->preferred_domains = AMDGPU_GEM_DOMAIN_GTT;
> +	} else {
> +		ret = amdgpu_amdkfd_bo_validate_and_fence(bo, domain,
> +				&avm->process_info->eviction_fence->base);
> +		if (ret)
> +			goto err_validate_bo;
>   	}
>   
>   	if (offset)
> @@ -1729,6 +1752,7 @@ int amdgpu_amdkfd_gpuvm_alloc_memory_of_gpu(
>   
>   allocate_init_user_pages_failed:
>   err_pin_bo:
> +err_validate_bo:
>   	remove_kgd_mem_from_kfd_bo_list(*mem, avm->process_info);
>   	drm_vma_node_revoke(&gobj->vma_node, drm_priv);
>   err_node_allow:
> @@ -1804,10 +1828,6 @@ int amdgpu_amdkfd_gpuvm_free_memory_of_gpu(
>   	if (unlikely(ret))
>   		return ret;
>   
> -	/* The eviction fence should be removed by the last unmap.
> -	 * TODO: Log an error condition if the bo still has the eviction fence
> -	 * attached
> -	 */
>   	amdgpu_amdkfd_remove_eviction_fence(mem->bo,
>   					process_info->eviction_fence);
>   	pr_debug("Release VA 0x%llx - 0x%llx\n", mem->va,
> @@ -1931,19 +1951,6 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
>   	if (unlikely(ret))
>   		goto out_unreserve;
>   
> -	if (mem->mapped_to_gpu_memory == 0 &&
> -	    !amdgpu_ttm_tt_get_usermm(bo->tbo.ttm)) {
> -		/* Validate BO only once. The eviction fence gets added to BO
> -		 * the first time it is mapped. Validate will wait for all
> -		 * background evictions to complete.
> -		 */
> -		ret = amdgpu_amdkfd_bo_validate(bo, domain, true);
> -		if (ret) {
> -			pr_debug("Validate failed\n");
> -			goto out_unreserve;
> -		}
> -	}
> -
>   	list_for_each_entry(entry, &mem->attachments, list) {
>   		if (entry->bo_va->base.vm != avm || entry->is_mapped)
>   			continue;
> @@ -1970,10 +1977,6 @@ int amdgpu_amdkfd_gpuvm_map_memory_to_gpu(
>   			 mem->mapped_to_gpu_memory);
>   	}
>   
> -	if (!amdgpu_ttm_tt_get_usermm(bo->tbo.ttm) && !bo->tbo.pin_count)
> -		dma_resv_add_fence(bo->tbo.base.resv,
> -				   &avm->process_info->eviction_fence->base,
> -				   DMA_RESV_USAGE_BOOKKEEP);
>   	ret = unreserve_bo_and_vms(&ctx, false, false);
>   
>   	goto out;
> @@ -1990,7 +1993,6 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
>   		struct amdgpu_device *adev, struct kgd_mem *mem, void *drm_priv)
>   {
>   	struct amdgpu_vm *avm = drm_priv_to_vm(drm_priv);
> -	struct amdkfd_process_info *process_info = avm->process_info;
>   	unsigned long bo_size = mem->bo->tbo.base.size;
>   	struct kfd_mem_attachment *entry;
>   	struct bo_vm_reservation_context ctx;
> @@ -2031,15 +2033,6 @@ int amdgpu_amdkfd_gpuvm_unmap_memory_from_gpu(
>   			 mem->mapped_to_gpu_memory);
>   	}
>   
> -	/* If BO is unmapped from all VMs, unfence it. It can be evicted if
> -	 * required.
> -	 */
> -	if (mem->mapped_to_gpu_memory == 0 &&
> -	    !amdgpu_ttm_tt_get_usermm(mem->bo->tbo.ttm) &&
> -	    !mem->bo->tbo.pin_count)
> -		amdgpu_amdkfd_remove_eviction_fence(mem->bo,
> -						process_info->eviction_fence);
> -
>   unreserve_out:
>   	unreserve_bo_and_vms(&ctx, false, false);
>   out:
> @@ -2266,8 +2259,16 @@ int amdgpu_amdkfd_gpuvm_import_dmabuf(struct amdgpu_device *adev,
>   	amdgpu_sync_create(&(*mem)->sync);
>   	(*mem)->is_imported = true;
>   
> +	ret = amdgpu_amdkfd_bo_validate_and_fence(bo, (*mem)->domain,
> +				&avm->process_info->eviction_fence->base);
> +	if (ret)
> +		goto err_remove_mem;
> +
>   	return 0;
>   
> +err_remove_mem:
> +	remove_kgd_mem_from_kfd_bo_list(*mem, avm->process_info);
> +	drm_vma_node_revoke(&obj->vma_node, drm_priv);
>   err_free_mem:
>   	kfree(*mem);
>   err_put_obj:
