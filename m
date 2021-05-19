Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5BA338853D
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 05:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8BA36ECD1;
	Wed, 19 May 2021 03:29:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2064.outbound.protection.outlook.com [40.107.243.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CB86ECD1;
 Wed, 19 May 2021 03:29:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrJOfO7hLM6iD09Vxosl+nPxnSTtNQziqrgjVfLDh5vkKBgDZ1JM63lVcjpiv4xZXtKr8af7YWQM5wGca0Bq/qE0fGyHz86n6YJywQbnWorPyZ3bJhYtk95znqm0yfaylJBRGPzbqIeof/DiYBjGu29Dp7GdfPAb72jhuOD4alUXWjDcqXCNQFOQCOnW+2ct3IKMF1GmYpXgSDrjTlrVxpar90s/Gur76v4UCb9SrFlLt3sOd70kLs2pjdwBSyVibeY1o+Kpu1Q0pCvFEtSYhVWgjcgc55Vpza2EOhU3hAsVpOonAtIHDLtKbUbZ2XXAtsQciWosusklvrKWlNIcaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDf/k2KMi1Uh+Jct7VOkEKJ/0oNNOt4kXbFaqZGO+88=;
 b=MWt9yzajOp4pVt+2j1S+xM4U0AVBbsQWN7hE3UnXDZLDxkqFVCq0/i79Vra6ZVFX5PlcBfRk7DlDgXEf1C7pjbp+WVpPWbwT2ECaaaT+6FZJp8eRPjG6e2mbDL90rjNUpCz7cQuNATnzIvKPBg2smRiMfL+rIAUM6O17ZN980T2rKDMWVAGnJOrvU/IAB1ymLzMR8HHc44mL7FK47f0G+ZQ+IXRIoyj6VCCdyiYb9o8HzsNPYve1JqR69QLDuG5Ey2LaasLWYQohLqrnRhLdnId3lddPtGEqjWnoBnlpz/IU67FgRz3hPS/lq6QjIi2QsyhoA/lUNqiz7Tyjk3Oh2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lDf/k2KMi1Uh+Jct7VOkEKJ/0oNNOt4kXbFaqZGO+88=;
 b=4KOBd5QtGAK0O4tuT0Hp8fIOCTJTEUSguEc8taTEXr0n8OFFZLTxdyfR7VSQinBEB8XrKSh1wPhDzjbzy583bOPFe002t3n8K8o4Rlt/MMz5d9hg7QV7r03SRcnOHJmUaNOKWnrKuER6oFA5mfG51YP+jrEDJZ3cCpJMKeEMHxY=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5129.namprd12.prod.outlook.com (2603:10b6:408:136::12)
 by BN9PR12MB5227.namprd12.prod.outlook.com (2603:10b6:408:100::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 03:29:09 +0000
Received: from BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd]) by BN9PR12MB5129.namprd12.prod.outlook.com
 ([fe80::3c78:e58b:fba7:b8dd%6]) with mapi id 15.20.4129.033; Wed, 19 May 2021
 03:29:09 +0000
Subject: Re: [RFC PATCH 1/2] drm/amdgpu: Fix memory corruption due to swapout
 and swapin
To: xinhui pan <xinhui.pan@amd.com>, amd-gfx@lists.freedesktop.org
References: <20210519022852.16766-1-xinhui.pan@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
Message-ID: <c7f28ef7-c0a1-ff76-2b48-4559a8e0e593@amd.com>
Date: Tue, 18 May 2021 23:29:07 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20210519022852.16766-1-xinhui.pan@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [165.204.55.251]
X-ClientProxiedBy: YT2PR01CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::26) To BN9PR12MB5129.namprd12.prod.outlook.com
 (2603:10b6:408:136::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.226.80] (165.204.55.251) by
 YT2PR01CA0021.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:38::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4108.30 via Frontend Transport; Wed, 19 May 2021 03:29:08 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f5ba8050-192e-49cc-cc2c-08d91a764348
X-MS-TrafficTypeDiagnostic: BN9PR12MB5227:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN9PR12MB5227B9190992E6C8C7ED82C5922B9@BN9PR12MB5227.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:663;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mMzWgPQP9EFy9uhC4OiSk9k4B+TC+r4GOkaQ6agOUBfRQRHnif+GEJzw+Ts34IkKE+AoPItwXW87PH8F1p+YwjjhgVhqyefxOIR4GxMYgP4FBIdEbRthXklTVKS3E2pmuT8XkReOAZPQRyDK9JBE2PYg/UTsaM8heQXZPItwOz6vSvFsZUWOh2O+UVzpn+uM25f9z6T0AZeWUJB5lLfd9HoczDkYkD4QwMTUogwNcJavmQPgIbVyZ+s7cee97LIlTOwbVk1RjM5baUqh2YK9O9rurkQGnFaX7lQiCJEDTIpWqAYHOy8vdcMSxmyTzEJbHJA+UmPiPRjBjR+HiTTSfDexbdhyVq7sk510GEMzZhmIDabwpmenBLCFOKpB9KjQmvcqQgff1+wm8Jui27NZhloGlt0EQcqcaI2bUeq4lBtahPPb7vwNoMcPnNIkJVQy2VKuuB1PwIdjpSoFVLTc65GS10V3d/fodnTPrmoS2dRIjmVOC7mmiU/Ndwtkz3ToaQc9QokD66OWyDc3g8dKmhOnauzCkvFAEB8AVjlXlgCNOcMXlDwbOzdGgQNQ+Z40HNCzd4Zej2ZEb2rcAG7oixIEQ1RVGdUXBbQNEbZ/4zDFiAO+s7JSmljydcqINAO49AuYlRyt9X5gsJ24iYoDeKaAXPIjM+80sU+wUt2Hb3jM6kA1XTQXQ9W1YQxwQbuuPt+VJbKl6NfIJxwaT5IiaON+Kl16fiPA0XPazBkCFZ0MgXum1Ib3rhxGNqTDAcKd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5129.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(4326008)(2616005)(66556008)(31686004)(5660300002)(83380400001)(956004)(66476007)(86362001)(66946007)(66574015)(52116002)(186003)(36756003)(16526019)(36916002)(8936002)(2906002)(26005)(38100700002)(53546011)(8676002)(6486002)(966005)(31696002)(478600001)(316002)(38350700002)(44832011)(16576012)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aTNyb0F1UWhscUszSkZDSmlXWGFWL0xYOE95aW1QNUQyMTJCMkRTeC9rTEdv?=
 =?utf-8?B?YVdiOG1tMmtJMk5lZ0hwWkVqTHVDalNyTS80NldTV2lnWEJWSjEzNVhzeS94?=
 =?utf-8?B?eWRNZlo2Q2RMcW03M1ZVWHl6dmR5WkpGRjJKSVdlTytmZ2psVklNN2VhNFZD?=
 =?utf-8?B?bXl2aDB6N1Q3ZE9yOGJBbUFiem5ONlB4MWh0bDZqZERNdi8yYkNJQUdGV3ls?=
 =?utf-8?B?KzIrRW9xVXBVK2t0T2ZFaWZsM1lEckJNUjFxV1dDampITWtmd29rUGNlbll1?=
 =?utf-8?B?RjJEM09UTTNoZDhsNWdROE95cm4xV1c0aW5acmZDd0pmUGFhRFk2WHZERE1i?=
 =?utf-8?B?ZkJES1F3S2xNa1BEc1hyTjFUcEJyQWhIYTdHS3ZhdUNRQ09rdnQ1NStPWmFk?=
 =?utf-8?B?UEowejFYblBqVklBTTVmenBNZG4wUUkxbzVFcWNFYXNUN3NxcGU5VFQwTFUw?=
 =?utf-8?B?TVpCN3hidTFyM2p4dlBkRHNmZmErNnVaL1NjTlV3WmMrZG8wbVgrUFZXRjRI?=
 =?utf-8?B?ejR0VHFGYXpzajdFTFZJa05JV0Zmc1FZV3czckRnYkM3N0tNYm93QTFiKy94?=
 =?utf-8?B?cHFNODlqeUtoK0h6RXc5N0YzZkZYbGlxcENEVGZlQ2FVbWFWZWdOOUhwQWVX?=
 =?utf-8?B?WWZjMnVGbFBta2VUTlgrc2gvbFVKaGxqL1JRaThrQWdqaEtxN3B6VmpHakE0?=
 =?utf-8?B?TEpyL3FBTkYzek53TzgrSWJOZlZoNTJIcDVETlI2Z2s0V1VzRkxvUkFNbENP?=
 =?utf-8?B?aDdDblR4aGdNTHdTdiswd21GTEd5eHJwYkVPaU1mVHYvVEdjSk1ta29CL1A5?=
 =?utf-8?B?aEE0VHZWSWxOV3ErY3QvV1gwbmZXS0FhV28vZjl4QkRwdUR5NndVQzZCamp2?=
 =?utf-8?B?WTJFcGxNcnQxM1JZWGFGaVJGVnN1NTc2THliQTJJVElYZS9rR29oMW8vYjRR?=
 =?utf-8?B?WG5jRlRCMFhkZGRqL1JQa2ZYU2RaQVZNRkx1bTdRZ3JBNkVYZ1plbGlZYjg1?=
 =?utf-8?B?WXhjVTkwU1ppRFQvRkFHUGtGbURmcWtGZzBZTnVCUWZha25QaXMvdXZ0UVdq?=
 =?utf-8?B?VHFxV0wwdkNKWm94WURZVy9KZ1hFajRsMHpaT0ZFWHgyeUdrVFBpQTV1aTZS?=
 =?utf-8?B?RUpRYnIxR1hFY3NCUmx6WUlVZ0Q1UW5wZ0MxWXFRYzF6QWEyK0ptMlBENGFp?=
 =?utf-8?B?VFRpSzlUNTJHaVdkVVAyRFczZVN2N0dKZml0SzF0UzF1MmdFangrNXJWT256?=
 =?utf-8?B?NGlqK1ViaUJUcENvODViUjF4SHBKNi90QWtVeWVDZ1ZRZkRYaVhrV3lpbFBC?=
 =?utf-8?B?MER6WDQ2azZtWlRVQkpUbGRXdDQxdXRpSHlWZHZrcGpDQW0wS2c1R3o5RC9w?=
 =?utf-8?B?ajFoNXptVHV2VzBhRjBhTHp5MlN3ZFVWN0lzb3c0NWExaWVEYzF5TmFrTGNx?=
 =?utf-8?B?aXNMWGVtTnE0ckExWm9JQTEwc3NHbUVzQTk0bWhtNWtDUWlWSDBBVEE5R2pS?=
 =?utf-8?B?RkpMZjIyZ2hWK1ZpWFBhdUVrWEo1RkNrRkZhR01ZQzNOdEQ4SUdFSW9PUTU2?=
 =?utf-8?B?cjk0V3l2M2h0NGgzeTBiRDhyU3VKa3lTNU4wR1YyL3FaMHJlNGVVa2pweFVh?=
 =?utf-8?B?QW5YcEwzWUVzbXZjL3krUWp1MFFXdkRzRGNJK0U2RnNIQVBrYUxtUS9ONURi?=
 =?utf-8?B?TGZPNXdGOWh3N0RlRGxwSi81N3NmSGFnaDFINE5oYjBPeVcrNWFDQ0o0S0Fv?=
 =?utf-8?Q?qEtGRIHav0VOrK64cODZT+HTC8CZsD9moeeGFfG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5ba8050-192e-49cc-cc2c-08d91a764348
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5129.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 03:29:08.8934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zqI5SYrunimSujT+obTMPWRHE3np3+uI2VEMKBH9kvDO2I361C30Is8/t/5HazDMoDzwK8oGYn/hajqYZrvsNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5227
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Swapping SG BOs makes no sense, because TTM doesn't own the pages of 
this type of BO.

Last I checked, userptr BOs (and other SG BOs) were protected from 
swapout by the fact that they would not be added to the swap-LRU. But it 
looks like Christian just removed the swap-LRU. I guess this broke that 
protection:

commit 2cb51d22d70b18eaf339abf9758bf0b7608da65c
Author: Christian König <christian.koenig@amd.com>
Date:   Tue Oct 6 16:30:09 2020 +0200

     drm/ttm: remove swap LRU v3

     Instead evict round robin from each devices SYSTEM and TT domain.

     v2: reorder num_pages access reported by Dan's script
     v3: fix rebase fallout, num_pages should be 32bit

     Signed-off-by: Christian König <christian.koenig@amd.com>
     Tested-by: Nirmoy Das <nirmoy.das@amd.com>
     Reviewed-by: Huang Rui <ray.huang@amd.com>
     Reviewed-by: Matthew Auld <matthew.auld@intel.com>
     Link: https://patchwork.freedesktop.org/patch/424009/

Regards,
   Felix


On 2021-05-18 10:28 p.m., xinhui pan wrote:
> cpu 1                                           cpu 2
> kfd alloc BO A(userptr)                         alloc BO B(GTT)
>      ->init -> validate				-> init -> validate -> populate
>      init_user_pages				  -> swapout BO A //hit ttm pages limit
> 	-> get_user_pages (fill up ttm->pages)
> 	 -> validate -> populate
>            -> swapin BO A // Now hit the BUG
>
> We know that get_user_pages may race with swapout on same BO.
> Threre are some issues I have met.
> 1) memory corruption.
> This is because we do a swap before memory is setup. ttm_tt_swapout()
> just create a swap_storage with its content being 0x0. So when we setup
> memory after the swapout. The following swapin makes the memory
> corrupted.
>
> 2) panic
> When swapout happes with get_user_pages, they touch ttm->pages without
> anylock. It causes memory corruption too. But I hit page fault mostly.
>
> Signed-off-by: xinhui pan <xinhui.pan@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c | 16 +++++++++++++++-
>   1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> index 928e8d57cd08..42460e4480f8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c
> @@ -835,6 +835,7 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
>   	struct amdkfd_process_info *process_info = mem->process_info;
>   	struct amdgpu_bo *bo = mem->bo;
>   	struct ttm_operation_ctx ctx = { true, false };
> +	struct page **pages;
>   	int ret = 0;
>   
>   	mutex_lock(&process_info->lock);
> @@ -852,7 +853,13 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
>   		goto out;
>   	}
>   
> -	ret = amdgpu_ttm_tt_get_user_pages(bo, bo->tbo.ttm->pages);
> +	pages = kvmalloc_array(bo->tbo.ttm->num_pages,
> +			sizeof(struct page *),
> +			GFP_KERNEL | __GFP_ZERO);
> +	if (!pages)
> +		goto unregister_out;
> +
> +	ret = amdgpu_ttm_tt_get_user_pages(bo, pages);
>   	if (ret) {
>   		pr_err("%s: Failed to get user pages: %d\n", __func__, ret);
>   		goto unregister_out;
> @@ -863,6 +870,12 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
>   		pr_err("%s: Failed to reserve BO\n", __func__);
>   		goto release_out;
>   	}
> +
> +	WARN_ON_ONCE(bo->tbo.ttm->page_flags & TTM_PAGE_FLAG_SWAPPED);
> +
> +	memcpy(bo->tbo.ttm->pages,
> +			pages,
> +			sizeof(struct page*) * bo->tbo.ttm->num_pages);
>   	amdgpu_bo_placement_from_domain(bo, mem->domain);
>   	ret = ttm_bo_validate(&bo->tbo, &bo->placement, &ctx);
>   	if (ret)
> @@ -872,6 +885,7 @@ static int init_user_pages(struct kgd_mem *mem, uint64_t user_addr)
>   release_out:
>   	amdgpu_ttm_tt_get_user_pages_done(bo->tbo.ttm);
>   unregister_out:
> +	kvfree(pages);
>   	if (ret)
>   		amdgpu_mn_unregister(bo);
>   out:
