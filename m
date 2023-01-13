Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A5F66A651
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 23:58:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAD710E209;
	Fri, 13 Jan 2023 22:58:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CB410E205;
 Fri, 13 Jan 2023 22:58:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9YWE1V1J+6XCTOPUYr4Zj0pZeJD0z5A5cMCtoYzzAgyu3hUWPFo5WVDG9I+ffo6Z0ZaTVoz1hqWRsWPstwElLFpE9Y2EqpDsy89HAovvYCbQS20vDDrGj+KQeFCxvk2A7TDsAk/H2pkQfI+TBtrTihC70QPGvvxhj0ascpYdbMAK/7T7JAYDtOnUD9iVH9T4sD0+tnDoQG459hmG60oyAq4f6WQKPpzt16zksS2RoRxdC1Zg0bK/tUu7IeoB+6kpUl7AfNa/HYrdjBM6JAoSliYgUnrk7jXHjVFVXsUo/hpjd/gyP5WOPDDpGwWRVwFlDIfgDNhZLmuo1hUSUzFmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8wnZ4LeYU/yhD5hd8Ja/1D7GhhHlajtllgF/yEWP/Ks=;
 b=RHrhYsp7vM52QStCZJy9hzsVkqUAP/3LeyYTSWP/aBsNGT0t1t9G42q3XKyKMwwoUACh9hSLR55UJc0rRkVN36GsoSsHFKsximuw42XkkZK22uMRK9TTvJLcXsxJ1pngIrrEQmLx072EOjjOiQW8TRU0GaxYHHRMokVZLSruiGYNIqv8g7i8jY5Qk7nCGGXbmyv1SMEQusP/jMxgfn7ez+eIh0UB7VNX9WVIKdWUd+Lo1G8DU5YmNkzgoWt0p/+xjlQB/QfvWxDNZ0FEUHpwxFOnhSpPHlEi8tfS6KFaDzhmwUeiFdQeeV6s76MznNMV6e0KcridEi6aro8w8bTeLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8wnZ4LeYU/yhD5hd8Ja/1D7GhhHlajtllgF/yEWP/Ks=;
 b=PhWhkxmUcKBQjThKGGzIYhnSykQ5I/NTZ3JyFslvY/VDAv0COVYi0GIqcNoOwaxC5qJj2HaxGylUNq1Y5zx1+PD24z1GBkA0KPbgxwPSg/Ap3BdWVBAD/qV1pZBhepDXTKGAM0UamyhTkglf7xjisiLxYBcpV5ZlFkICBqTsZ/U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB2602.namprd12.prod.outlook.com (2603:10b6:5:4a::11) by
 SN7PR12MB7274.namprd12.prod.outlook.com (2603:10b6:806:2ad::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Fri, 13 Jan
 2023 22:58:09 +0000
Received: from DM6PR12MB2602.namprd12.prod.outlook.com
 ([fe80::7418:855f:c703:f78b]) by DM6PR12MB2602.namprd12.prod.outlook.com
 ([fe80::7418:855f:c703:f78b%4]) with mapi id 15.20.5986.018; Fri, 13 Jan 2023
 22:58:09 +0000
Message-ID: <513453ef-4632-9990-e5a6-bb97fffc4c11@amd.com>
Date: Fri, 13 Jan 2023 16:58:06 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [PATCH 6/6] drm/amdgpu: Do bo_va ref counting for KFD BOs
Content-Language: en-US
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230112013157.750568-1-Felix.Kuehling@amd.com>
 <20230112013157.750568-7-Felix.Kuehling@amd.com>
From: "Chen, Xiaogang" <xiaogang.chen@amd.com>
In-Reply-To: <20230112013157.750568-7-Felix.Kuehling@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH2PR07CA0025.namprd07.prod.outlook.com
 (2603:10b6:610:20::38) To DM6PR12MB2602.namprd12.prod.outlook.com
 (2603:10b6:5:4a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB2602:EE_|SN7PR12MB7274:EE_
X-MS-Office365-Filtering-Correlation-Id: 3699c463-8547-4fd3-75d2-08daf5b9a38a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hG0bb+tlwipMnYD6FRdpcLYEj6kyu64PDZiAorPTBhiu2JvVTnmdPteP3lV5fv0ifyCkT+HNilKmkKhM7JKdZEndtNk4j7fxdMT5n9s21UnEywXcMw9HilCz6ejdhy65LHwuYa95OoprALf62Z8T94x0zw+xpBeVGZ8VzItRIDkb3nd2CVxJcVFsnbO8f8FS8ILNFGgcRGs8pUJc9DBnRsWbAEaqXUQuZUJQD2A7VwgP2da4/wVpyyrKS57AhA5G7CS0IezIQ9RTTOW7wbSHlHa0vANj/LsAfaukofEN7ycBHlxr594ZzCUZiHDifOcrBakU+4nGRLnA4XB9rzNW7CICRxj3QB7xpNPaSHaeg+my4pawmbW5q5eHsLDig3JFqLLcwltMLzsDhHXVUzOciq4fx7o4evWveUesBHyZM4A+Y6KboC9j6/d90tzWn/5eqGZrb/a+SU9LHJhDjnbOid8PKicFcPSC6xXTRDo7xSMyZfav2dCG/D2Gj1fpdpNqX+UdI9IzfzOT4x4I9jGjunFSj/BHsy3+FMJOqMlvz3Z91lCDCZ4pTo3MF/4TqrxcWwhoZnKKMPMCM+j2lHIhPrGBEITAK9dhg/bA0Ruv97W9jDO8i0SVKvfJqJ0HGD2nqSvlVz4nmMcMFiEztcYalSKwLCuID3tPgJDKAFqAo+crbUcMXCDb1kGw2PVmGT1hPwv3Zd+VXADTBT099IDT56aDI9l9yubpDHY0PGjEBvw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB2602.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(346002)(366004)(376002)(396003)(451199015)(36756003)(86362001)(31696002)(8936002)(6486002)(5660300002)(4326008)(83380400001)(6506007)(26005)(478600001)(186003)(6512007)(2616005)(6666004)(53546011)(38100700002)(66946007)(66476007)(66556008)(8676002)(41300700001)(316002)(450100002)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZnZ5Z2xLZHZzemJwNEdJUTRJYXpxU3BNK0c2RW9wVkhqM1dMeDZ4RjlHcnI0?=
 =?utf-8?B?VXRTNzlBRTE0TVUxUGNaUHhieUN2M0NwTm9WazNQbVBhUm10bjE0eURnUXBa?=
 =?utf-8?B?YXVkdWsrTnZDNHlPZGZsV3c4SFJnN3l2QjFUQlo1QUFCSzdIa2VuVG44K29M?=
 =?utf-8?B?N05QaWtRU3NuOURINDlEYkFVWXhSeGxBVitXUUwwb3FTSm1oVUFtc1IraU4v?=
 =?utf-8?B?ekRUMDR4VHBuSGZRdHpIWldpcEV5ajJGVkxrRVVQQzFtRGJHd09yNDhINytl?=
 =?utf-8?B?MHRYYkkxazVVWTZGdjVvelVwWHJlL1BWSFhlQmpJRmg0K01TUUQ1RWRFb0pz?=
 =?utf-8?B?MGM2b3hOR3VhL0krSzljYWhteDRYY2Yxa0ZpdnhRb2twL1REZitibENTMXk1?=
 =?utf-8?B?Um5lejA4bG9kdWZJaU1CUlY0V3hQUUM0bTJmcnV4ZmdoWGhaZTZQeUlkNldX?=
 =?utf-8?B?YUhyVW9mS0t5NGZwcDRrcHlIaWdnU3MrQmtRVGlIUlFkNHhYSkQvYnJCN2ho?=
 =?utf-8?B?NjN2Qmw2ZFdvcTR1T214SUNKbTFwQ29FeUd6LzlMWVhxWHJkMFRMTlc4WFVT?=
 =?utf-8?B?elRRYkxFQWpBQkk4akRmcUZjdFNUZmpLQUJkaklGcnhlb2xLU3EzNExBYVpt?=
 =?utf-8?B?VVpyNHlVV25qNjlXNmJSemU4UzI5NE13aFZFaGNvcEhjd216a0lGUlQ4Z3JM?=
 =?utf-8?B?Z0pwaWZ5UTdkQ0JQNExoMnUvV242TWdNOUxOWmlWZTVNQ3o5YW9RQ3duSkZT?=
 =?utf-8?B?b2hIYlhFR2V1ZHhQTFA5eWJHSkYxZURDRW5COEdwWll3b2Z6RlZhZEVkaExY?=
 =?utf-8?B?LytaVWJoRFFMSFhJbzEwL21yaHhaS2RZVmV0WTFXTnpHVmN1SWRjVExQUDJz?=
 =?utf-8?B?QzNFdTB4MVBBMG1kV3kwekhna2N0U2hRUDhmVjlvcm9ybjZ0c3J5ZDk1elFT?=
 =?utf-8?B?ZFFyUjVIUVFIQmZHMkIrLythWStRY1BCMXROYjJwRzl0TnpGWS9xUVdNbi9I?=
 =?utf-8?B?TXlOTzRQMURSNEFGeVNlZXNCNHlZTURKdGZUZjJQLzBMYXZ3UVdHaE1MSXRQ?=
 =?utf-8?B?RVZwM28wa1Y3dGp4Q0dTaitSLzk4Nm1NcFlBZ0k0Yk9wbVREQWxSTTdrQm9M?=
 =?utf-8?B?K0doVUJvdjdzdDFKSjdxVmM4NEJxTzJyc2R2R0VVcmpDRGJmUVp6ZXpmUXhh?=
 =?utf-8?B?WmkwdnFPcElJUjhHUE41WjZTbDBiOVdNWnhTZmI0VHprc2dOUkZSTUxlTmhk?=
 =?utf-8?B?SnNwc3pHTjNMV1BIOFUxZyszbXRORzRJS1J0b21IeE13T1lPY0E3Z1VDTVgw?=
 =?utf-8?B?STd4RUgwQkFFb2VkZFJVQmQ5OEpSUlowMXMwWmN0Y25RTjJXNmlMazdWUEt5?=
 =?utf-8?B?eTFkVWYrdU9NY2N4UmduMy9UUkxKcnlMU3poQmtSZmVaaHZReFZrcVFFRnNX?=
 =?utf-8?B?aktwVjlLUkNtdGVRbkkyMEY2V1FraTVRak1iaGFyWGZDUEtnakJZTERIU1pW?=
 =?utf-8?B?WVVPNWJ0RjUyNlU3ZWtsVUY4YjdZQjhXTUpKVm4vNDNPOWh6NTVETXVrRFRy?=
 =?utf-8?B?YnhZSEVPZTFWVERYY0FZT25yblh5WHlncUNEODlqS2dQbCtPZU5RQmpmSWo1?=
 =?utf-8?B?V2Y3bGsyeTFvZUE4UlNwRHBZQk5adWpBaHV5U25HWmlocmllaFg4cnNmUWlC?=
 =?utf-8?B?a2hBUGlBNFFiL2lxYURmMUd1T3phalNqMjYvMWFpdlhob2QxVkFtN3pPcHpt?=
 =?utf-8?B?TU5aYm0xdHVCZnV6MU9NQTdTT2JXMTF2MVlRcU80NkdIZnlWRFR2TXlYaDRT?=
 =?utf-8?B?U29NdzVQb2JTOURaR0ZObElmemZ3TGI3cExXK25pWVYvUWtRdm0vb1M4U2xF?=
 =?utf-8?B?cFlRNDJDOWo3QVFxWlphZWhVR2tCUG1UWWs1a2tiL1JEWnQ1aTkxdjJRS08y?=
 =?utf-8?B?N2paZkRmSGpqSXQ4YzMya0thUytoQ3ZJQklsbTVCazZrVXZrUi9tc2xjNHZt?=
 =?utf-8?B?b3Z6VnA5ck5sbEpEYWp1SVNzYnhUNGFnR2pta283eGFZZU5YMWtTMWNWMEJ3?=
 =?utf-8?B?SVZ0WGZnNUUyYXNycDBVTGxPL21TWWVnRm1nTENFemhURU1pbkZFYVFVYldk?=
 =?utf-8?Q?0bwc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3699c463-8547-4fd3-75d2-08daf5b9a38a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB2602.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 22:58:08.9736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qb1X9fZbXjjhhup/KjqOnp/eqSbGebgYI1hk7u9zZPBqDKGtHoDP2ehBB5Bo4sIF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7274
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
> This is needed to correctly handle BOs imported into the GEM API, which
> would otherwise get added twice to the same VM.
>
> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>
> ---
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 28 +++++++++++++++----
>   1 file changed, 22 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index df08e84f01d7..8b5ba2e04a79 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -370,9 +370,17 @@ static int amdgpu_amdkfd_bo_validate_and_fence(struct amdgpu_bo *bo,
>   		return ret;
>   
>   	ret = amdgpu_amdkfd_bo_validate(bo, domain, true);
> -	if (!ret)
> -		dma_resv_add_fence(bo->tbo.base.resv, fence,
> -				   DMA_RESV_USAGE_BOOKKEEP);
> +	if (ret)
> +		goto unreserve_out;
> +
> +	ret = dma_resv_reserve_fences(bo->tbo.base.resv, 1);
> +	if (ret)
> +		goto unreserve_out;
> +
> +	dma_resv_add_fence(bo->tbo.base.resv, fence,
> +			   DMA_RESV_USAGE_BOOKKEEP);
> +
> +unreserve_out:
>   	amdgpu_bo_unreserve(bo);
>   
>   	return ret;
> @@ -785,6 +793,7 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
>   	uint64_t va = mem->va;
>   	struct kfd_mem_attachment *attachment[2] = {NULL, NULL};
>   	struct amdgpu_bo *bo[2] = {NULL, NULL};
> +	struct amdgpu_bo_va *bo_va;
>   	bool same_hive = false;
>   	int i, ret;
>   
> @@ -871,7 +880,12 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
>   			pr_debug("Unable to reserve BO during memory attach");
>   			goto unwind;
>   		}
> -		attachment[i]->bo_va = amdgpu_vm_bo_add(adev, vm, bo[i]);
> +		bo_va = amdgpu_vm_bo_find(vm, bo[i]);
> +		if (!bo_va)
> +			bo_va = amdgpu_vm_bo_add(adev, vm, bo[i]);
> +		else
> +			++bo_va->ref_count;
> +		attachment[i]->bo_va = bo_va;
>   		amdgpu_bo_unreserve(bo[i]);
>   		if (unlikely(!attachment[i]->bo_va)) {
>   			ret = -ENOMEM;
> @@ -895,7 +909,8 @@ static int kfd_mem_attach(struct amdgpu_device *adev, struct kgd_mem *mem,
>   			continue;
>   		if (attachment[i]->bo_va) {
>   			amdgpu_bo_reserve(bo[i], true);
> -			amdgpu_vm_bo_del(adev, attachment[i]->bo_va);
> +			if (--attachment[i]->bo_va->ref_count == 0)
> +				amdgpu_vm_bo_del(adev, attachment[i]->bo_va);
>   			amdgpu_bo_unreserve(bo[i]);
>   			list_del(&attachment[i]->list);
>   		}
> @@ -912,7 +927,8 @@ static void kfd_mem_detach(struct kfd_mem_attachment *attachment)
>   
>   	pr_debug("\t remove VA 0x%llx in entry %p\n",
>   			attachment->va, attachment);
> -	amdgpu_vm_bo_del(attachment->adev, attachment->bo_va);
> +	if (--attachment->bo_va->ref_count == 0)
> +		amdgpu_vm_bo_del(attachment->adev, attachment->bo_va);
>   	drm_gem_object_put(&bo->tbo.base);
>   	list_del(&attachment->list);
>   	kfree(attachment);
