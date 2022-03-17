Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9DC24DC0E3
	for <lists+dri-devel@lfdr.de>; Thu, 17 Mar 2022 09:21:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 186C010F01A;
	Thu, 17 Mar 2022 08:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam08on2048.outbound.protection.outlook.com [40.107.102.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DC6010F013;
 Thu, 17 Mar 2022 08:21:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2J1qvtN5ZOEQZxHdVUZSrmMOat7LHz4UUIhiBWTzXf5gg+HIrW9H7E0FIMDD7k9TOO966XgoXF0I67N90GSuMHnaEAC5nRHSbjqFuF4ES8AIkZh8i6qXNlvmhceaVF9ZBba6/hJbt8iz2ahd1vompjp2NXgEEpV+0RndYrCQLAOJLjPyQ+G4ERwnAXfgFlzp0gSqKQgCsib63E14gkz6QfcLkX0D4KZf4L1gSyrCarSYbZMljNYlopHYF8ZSdkAfwj4dtiNBnt2VMOPhSEJrQhbj5SgqFCyJMmNtecgU1WQu7AkPj/VOwrwe2th8B2FrgNPHXtPaLzI7qAEtwalpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1NX2nBcTvTFZQjXlTtCjkDrIvmeRTKxigb0dOy23uA=;
 b=Vpy2+Leqm0f8yA36iPQoS0eJcE1UVLKY35JlaVdBR5Ser9UDUetCY/qRSs1aUbkwkpfR5LzBKiErDUifaQAr1dsXzIPfBjK6AUxB2aMuc/dhsVXNyx1pj8/XlrVsGujgBpI3OF2FttZAkm0Y7fP7BchBP2NZQnScNvk6h9IEc+vToF/sUdQBwW14FI44m3K5VkZxb4dQralSXM/CVTVJ4ylQYaxpITW7fjWL3lEIuh4m41zh12lwW0EwgZCI1VmHEp5pmAGCTYHLbqtOphFSUB1gqfrjZvRMbknpRYvz6bd+BtCiun02v6pNzvcBn7g4ESSKG3B4X2lkwhxoF53mHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s1NX2nBcTvTFZQjXlTtCjkDrIvmeRTKxigb0dOy23uA=;
 b=P37TTq6ra3wVq8Af2Xx+jmvwUrXRyFp0AykJH0Q80e+kmGN3OIoy9avXkQLD8OT9Sk/22Jmjus7obnKiJKfZb0o2QD5gH3kY9bbp3NYcCjIpbDpHFhSP4n9W1+5K7APaGyL1Y7+CsJlgI03AT3TV2jOmR0gcqiPLcc5R8feb9yQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5339.namprd12.prod.outlook.com (2603:10b6:408:104::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.16; Thu, 17 Mar
 2022 08:21:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::404f:1fc8:9f4c:f185%6]) with mapi id 15.20.5081.015; Thu, 17 Mar 2022
 08:21:20 +0000
Message-ID: <5054ada1-9f2d-1297-5f37-0b05ec2ae37f@amd.com>
Date: Thu, 17 Mar 2022 09:21:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 1/4] drm/amdkfd: Improve amdgpu_vm_handle_moved
Content-Language: en-US
To: Felix Kuehling <Felix.Kuehling@amd.com>, amd-gfx@lists.freedesktop.org
References: <20220317002006.342457-1-Felix.Kuehling@amd.com>
 <20220317002006.342457-2-Felix.Kuehling@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220317002006.342457-2-Felix.Kuehling@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM5PR0601CA0083.eurprd06.prod.outlook.com
 (2603:10a6:206::48) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 892ad7f8-cab1-4e60-305b-08da07ef1da6
X-MS-TrafficTypeDiagnostic: BN9PR12MB5339:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB53397A58EFEDE7BF16BFB40F83129@BN9PR12MB5339.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: G+2bx6j9/DXYExt2360rHQVUHD5xF1HgJ+dnSqwkm4XncBJ0ERa8p2ifmzee0Drm7ij/F8ru8+0e5CnyNoV/M5Vz3gCBqmHHSWyqv6xFgOM7FHC6ygmioZaD1t0qi3HAwyu31DkF/d6Y5x6h5GD464vRRnXdrZL5P59jq22jASTqihWYW/HSuZbBI5v2e/LnvAhi4ob3XcxflowvUYcf9jGteyukfZPPnKQvqD9UHOoC+Sx3aoluN/StI4WRR0OUedBtj4e2FqTXePZKDCmwKsxhjbOy0nrcCYP0drI9liUxQOx420UERdDlzIh4kLgT/Uaat80wFd0/6XX/ZalvJDj7kfw1Uu60hS65wVnlQo0O0zS9NAfOSyqFfmUN4jgURiTEqaSdVlKQqDrYPVLoGL8BsqMid2zy/Xh+yGR2o/HAWm3/Bp1uYWFHEQfaw/VIJqVD9dau/7U6iT4pd7j4ORFJEhzje3h0jTtzdtbocPyxGaD4ZozKB4far1IK+q/o4Pwm+MYvuYKbXtapcHRTwbw4aj++kbTxLalL8hUOr/6kEA8ShEcft2WsKOIRwU6eznBAjk71nrKpe5Yeh4s5U0LslV6VsA2X1YlMudBim3BgY2zdcEiu4IiuhiJTUF1IAC9zZk/6P7aSpglqqwuQzO0tPQhKXVuOyzuTJCs6P0f98Y2RPgnR9VbU+0l9nQXN5yUMX0h/Qs48XY/rUrJnlccO1cOjmsQ5zPDj5NBuCrz62dm0KXPVszzJktvXC0vg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(6666004)(4326008)(36756003)(2906002)(5660300002)(508600001)(8936002)(66946007)(450100002)(66556008)(66476007)(6506007)(38100700002)(31686004)(86362001)(66574015)(26005)(31696002)(186003)(316002)(6512007)(2616005)(83380400001)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHY5YklEYlVYcUVRQnY4YkREQ0R0OFU4cXFuME5GNmlkVURBN2p6azdLTWpx?=
 =?utf-8?B?UmtYWmMvTmR1VzU3Sk9UL1JHMmoxRVlXUTdmZGdxZlIyUkowUVhvWThVVmZr?=
 =?utf-8?B?dXNXT0NETVJPTk1LUVVKVWo4Nmo5cjhxNGhwVzV3NUR6RjdxQzkxcVBtZ1R6?=
 =?utf-8?B?RGpSN28vV0hCQU8vYlR5TVNtMnlRZ0M3cTdBeEQ3Z0kwM2xHTzJ2L1ROOXFu?=
 =?utf-8?B?YUNZL3QzdHFGWTBjcEtRbTFvMjl6ckcwclhlT2FYRnJjcHNoT2Z1bVlMcHo1?=
 =?utf-8?B?VHVaWlQ4bEg3UVNCNFlRZU5xSjZVQ3FoTEFLVmxMM3AwbktjUmRRT3NyNjFp?=
 =?utf-8?B?cGtkS1lCaCtDWUljNHI2aTNEUzgyOUhNMVQ5a2VsbjB6eVZXQ2t1V2NGVFg2?=
 =?utf-8?B?MDZmRU1adkRwNzFxQXdGdjRDVU04Y3Q4K1pqRnMxbFpHSVBpYnFSaFY1cGJn?=
 =?utf-8?B?akVUT1I3NUoweWRwOSt0SmFsanhMSGh6Y3BxUWN3Z0dFUUVOQVlsNDhiWk5F?=
 =?utf-8?B?bzVLU0tRMGR2bVl3ZitEVGZld1U5elNMNWhNdk5tQTlTeWtvSHVjVitBMy9r?=
 =?utf-8?B?YzNtdTZJRGM3enVkTTBNM3ZZZEVyM242NW5Nc0hNYXE2anZqTm9pQzdNT3Vp?=
 =?utf-8?B?L05RbzEya241NGxnUGo0d213ekVhayswNm42a1c5WU5Wa3h4WURYbVNRN1Bl?=
 =?utf-8?B?b2w1bW1ia0hQdXp2aE9paWNROTN2M3Bob21lcml3WXNvWjEyd2xqcE96QllV?=
 =?utf-8?B?QjM0ckJDTEtiaTd3c2E3Sks3dU02cGFGdW5EbDBmd2FRZkExYmRHUXNNWjZN?=
 =?utf-8?B?elFCMy9IZFdqd2NVMnY3ZHJkL2FOZ3pSQitOSytRUXpGRTI3NS8xRjNreVBk?=
 =?utf-8?B?TWxhZXRYVEc0TUcxclJURHN0YmVWanFMd09ra1FaTnlGSVpzMnhaY2J5cHM2?=
 =?utf-8?B?YkdueUpnbUROQU03eEVwSUJIcXBaRTZUUmttaFFORVFYNVFRUEpZeGc3bnRz?=
 =?utf-8?B?YTZQc1JIOWJ0dHRNZ3BOOGVXOUtCR2lMd3NxUG5oUnA4RDJaNERpSlNtNUh6?=
 =?utf-8?B?WUFJNW1KK0VoYVgvb1NEY3RwMWI3d0UyQlZRdEQ2cnhzVkM5T3dBbDVyUlV3?=
 =?utf-8?B?Y3dFbTN3eUF2MFFUbGUrOTlzdktkRk10b2RTUUd6Yi8zQmc5RGlqRlVvTGxs?=
 =?utf-8?B?Y3BrbTBtOVY4TkhRQ3pFQW05WFhHM21DanppV2UyMEVPMzhpcnpibmRHckZP?=
 =?utf-8?B?VmdJMmdyWTFTU2lDWUJ4TDZGWjZaRzdvVnpodGlyUDlhNUQwQmdKTXF1TVBI?=
 =?utf-8?B?YU1BVWc3VjFVbnBRcHVkVXhCUENUTVNIRENrZzBnd2w0UTF4NnRNdTZpdDZD?=
 =?utf-8?B?NUJRL1l3Y0VESGRFQU5iZjBaVXJRZzZWallmOWlxeHl6azZyVTUxajRuRGZi?=
 =?utf-8?B?bWFQenpLeHNrNFVEdkV1dlZINGoyaVlVUUJrWHVrWTVYZ2NsUCtjYWxxQ3Rt?=
 =?utf-8?B?aWtnOFBoU0ZVRXF1UzE2WkxUOTA1ZStVN3FSb0JHOU9DMSs1anJYYVB5cG40?=
 =?utf-8?B?Nm9UTzZqVUs1enR4RGVHdzY5TEo5Y1BUZk14SzIrRlpmUll5NnZaRnkycEhB?=
 =?utf-8?B?S1VVc0E5K1lHdFFaZTFZTFd6R05IQTVjYnpjaUI0NFhLcGM4eXZpQ0ZydXBX?=
 =?utf-8?B?Z3Z6ajlCeGhSQW11eldkSHRsWUlhRHFPejBOKzF4Ums2M3VxWE9mVjMxY1Fy?=
 =?utf-8?B?TnNsR054cHRaY2N2TVgzd3VFRzVoLzRuSFdDZVh6S2lFZVdMc2RRU3dINTJk?=
 =?utf-8?B?eW40dys0UnRWNHREc0RwejM1b2M4eVp1RHBaakFRc29YUlBmTkFsbG9WNzlG?=
 =?utf-8?B?TEpyWFpub252SCtmemEvOXVIMzVkb1BCRWlkSlpUUSsycklMZzdkWGJKcEhQ?=
 =?utf-8?Q?AUMBk+XzrcPZ7HJiPHtavj+IkvoSRvkR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 892ad7f8-cab1-4e60-305b-08da07ef1da6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 08:21:20.3917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oCkYApTphqQw/vvofohz0UUZfT5xHhFm8/N+tOa+SDJAlp9FVRnXLdaRqku4xJas
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5339
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 17.03.22 um 01:20 schrieb Felix Kuehling:
> Let amdgpu_vm_handle_moved update all BO VA mappings of BOs reserved by
> the caller. This will be useful for handling extra BO VA mappings in
> KFD VMs that are managed through the render node API.

Yes, that change is on my TODO list for quite a while as well.

> TODO: This may also allow simplification of amdgpu_cs_vm_handling. See
> the TODO comment in the code.

No, that won't work just yet.

We need to change the TLB flush detection for that, but I'm already 
working on those as well.

> Signed-off-by: Felix Kuehling <Felix.Kuehling@amd.com>

Please update the TODO, with that done: Reviewed-by: Christian König 
<christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c      |  6 +++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c      | 18 +++++++++++++-----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h      |  3 ++-
>   4 files changed, 21 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index d162243d8e78..10941f0d8dde 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -826,6 +826,10 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>   			return r;
>   	}
>   
> +	/* TODO: Is this loop still needed, or could this be handled by
> +	 * amdgpu_vm_handle_moved, now that it can handle all BOs that are
> +	 * reserved under p->ticket?
> +	 */
>   	amdgpu_bo_list_for_each_entry(e, p->bo_list) {
>   		/* ignore duplicates */
>   		bo = ttm_to_amdgpu_bo(e->tv.bo);
> @@ -845,7 +849,7 @@ static int amdgpu_cs_vm_handling(struct amdgpu_cs_parser *p)
>   			return r;
>   	}
>   
> -	r = amdgpu_vm_handle_moved(adev, vm);
> +	r = amdgpu_vm_handle_moved(adev, vm, &p->ticket);
>   	if (r)
>   		return r;
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> index 579adfafe4d0..50805613c38c 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
> @@ -414,7 +414,7 @@ amdgpu_dma_buf_move_notify(struct dma_buf_attachment *attach)
>   
>   		r = amdgpu_vm_clear_freed(adev, vm, NULL);
>   		if (!r)
> -			r = amdgpu_vm_handle_moved(adev, vm);
> +			r = amdgpu_vm_handle_moved(adev, vm, ticket);
>   
>   		if (r && r != -EBUSY)
>   			DRM_ERROR("Failed to invalidate VM page tables (%d))\n",
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index fc4563cf2828..726b42c6d606 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2190,11 +2190,12 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
>    * PTs have to be reserved!
>    */
>   int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
> -			   struct amdgpu_vm *vm)
> +			   struct amdgpu_vm *vm,
> +			   struct ww_acquire_ctx *ticket)
>   {
>   	struct amdgpu_bo_va *bo_va, *tmp;
>   	struct dma_resv *resv;
> -	bool clear;
> +	bool clear, unlock;
>   	int r;
>   
>   	list_for_each_entry_safe(bo_va, tmp, &vm->moved, base.vm_status) {
> @@ -2212,17 +2213,24 @@ int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
>   		spin_unlock(&vm->invalidated_lock);
>   
>   		/* Try to reserve the BO to avoid clearing its ptes */
> -		if (!amdgpu_vm_debug && dma_resv_trylock(resv))
> +		if (!amdgpu_vm_debug && dma_resv_trylock(resv)) {
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
>   		r = amdgpu_vm_bo_update(adev, bo_va, clear, NULL);
>   		if (r)
>   			return r;
>   
> -		if (!clear)
> +		if (unlock)
>   			dma_resv_unlock(resv);
>   		spin_lock(&vm->invalidated_lock);
>   	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> index a40a6a993bb0..120a76aaae75 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h
> @@ -396,7 +396,8 @@ int amdgpu_vm_clear_freed(struct amdgpu_device *adev,
>   			  struct amdgpu_vm *vm,
>   			  struct dma_fence **fence);
>   int amdgpu_vm_handle_moved(struct amdgpu_device *adev,
> -			   struct amdgpu_vm *vm);
> +			   struct amdgpu_vm *vm,
> +			   struct ww_acquire_ctx *ticket);
>   int amdgpu_vm_bo_update_mapping(struct amdgpu_device *adev,
>   				struct amdgpu_device *bo_adev,
>   				struct amdgpu_vm *vm, bool immediate,

