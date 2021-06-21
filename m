Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F14453AE37E
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 08:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9893B89A4B;
	Mon, 21 Jun 2021 06:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2041.outbound.protection.outlook.com [40.107.237.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3E089A35;
 Mon, 21 Jun 2021 06:46:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJG8A5095IHWmz/z58wqvudMNKtve3UgMz3Eur1gtNuW+LWJADJcdlr/tyffF9ozZO6Shr2N5blcUMZgJ/GIITIgbk5JIwKjCR99e8O8eSBnruZSZksF2/nlHmNN2VpOc3TYBTphVcAtgM9WlEPynYeT/UiFtHzDIst42s+Lk3VczPC4Ntv6JByKjFR8Dq6XewSoXieN6lAQkZ4QQeqxL6qRmE+WAnL6we8JInw0e65bcNJOLJpeKlpwTwaT1hwzYOqxm7pGRZcFBFKS7NLEHLSDKBURCA+X5CHaUwIdaR0uiWMuCh/nHpufNaqFmjzwBk9uCnHeKV7tF7GE/EAoMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pM/Vq3BqE2WR06qATycvAPuDJjMEI/6XiFd0xhvJEN4=;
 b=EaVF9oDYEQ+VBExejXXffn9tgm+gZ2YPw9cqZ6tbxSmfKPR3jK1aRwzLdfjxPuKp1fmFHPUejEUfKplL03ZOY5RW+XKS/2qo4sTALRGHfj+4/TxxJaRHNNtS4FaZ2aRaX96CoPiDziQ7UFedN/33mIEnZCS2NjBUcTQ43riwQw1b47if3Sd2Nvffwg5ajGIC15S6xXpu6LE7O7/+TyzphlWOt9ImuHARJ6e2VJl880hLVsqY7kFOtH8li130DzbhJ+sy4krXXq7Btg072N0tAKbe1efQIwSS19XneYwol4Pf2TFpWK7Yp5dk1aJ3Q2Bc5tuIQwL3a0FeDD5fHnnsAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pM/Vq3BqE2WR06qATycvAPuDJjMEI/6XiFd0xhvJEN4=;
 b=JXSX1U9HY5H/xa6uMNjFALoPA2Dpr3Jg7BMWxcP9tNW78scE1ovA0nAKqzxLsERNVi3hYOZKtfFLt0FsKh31N5H5lXXlgRj4POU+ue1gdUuILDR12g1QLpmYyVMMTJrQM1sW2lXJT2TbPFt56m74N0VMF0rav/cSGFp4J1anKRU=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4317.namprd12.prod.outlook.com (2603:10b6:208:1d0::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.15; Mon, 21 Jun
 2021 06:46:53 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::6c9e:1e08:7617:f756%5]) with mapi id 15.20.4242.023; Mon, 21 Jun 2021
 06:46:53 +0000
Subject: Re: [PATCH] drm/radeon: Fix NULL dereference when updating memory
 stats
To: Mikel Rychliski <mikel@mikelr.com>,
 Alex Deucher <alexander.deucher@amd.com>, "Pan, Xinhui"
 <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20210621005950.24734-1-mikel@mikelr.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <c2c98c22-fc0d-5a9a-a6ad-be16f64aedb9@amd.com>
Date: Mon, 21 Jun 2021 08:46:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210621005950.24734-1-mikel@mikelr.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:aae5:6e05:c:d69]
X-ClientProxiedBy: FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::16) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:aae5:6e05:c:d69]
 (2a02:908:1252:fb60:aae5:6e05:c:d69) by
 FR0P281CA0061.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:49::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.10 via Frontend Transport; Mon, 21 Jun 2021 06:46:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51a844a3-dfb1-4b06-2c97-08d934805ae0
X-MS-TrafficTypeDiagnostic: MN2PR12MB4317:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4317004381DFE9239091F1AC830A9@MN2PR12MB4317.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:298;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: brNjNL25EUt9J/UjttFGjJn6T8nVtLoP6mATYdF+7BcoppHJClQ+LoshS4cIRI37Lb5uI+/6sXasl7/FLBMcwf6UBMHGTv2/z2fVY042OOi2nam1ddfi4J4o282HwDbHje/uVb1MCBD8NSjs+hIHbeoGJ7TDK4b+N/w14COKsTQQHqqn+sUY494TyhZLmjnjhg9Ejid9+sm3wjbn5OlEZWrl+2kvP8QL8o55rqVp3RuNX2t58rJEy3x/cdzQ1er9TRfzuFh5+9t9VyKxVYcOGOtI7B2DfshIE3jy+EzhEKUs8jGVvbaz81p22NBMbEeZB8Y1fWt2p6vrq42QoCupH5/5xMQnCgghz9EBe0c5ki/bsBqHSd2Fv788Hej+yo4/AD28E1XQVTV5qQMuo0qlFj7kkhmr4G5SVI61yB7MqMrF57P8/5Ddqae4rJd9InPsq4LeJTjvfpFBF7jm58xeMdIOAj8bw0hCdjuc+LbGsHY0XcjeoYAeM/TZV0XAdWM4VYMWz02i2fYkbn5nrRO2NAcRnc4dRS3Az8AlddzVnVECz/YBl7JGAXwdTag4IbK6h/SXnKm6y8BxOV7EArRR9PorzGYtIOOMz1m6rstK+P8+v6fL5sGDcSK+3dMVgXDgnIsfikuH3lQusaVJ9IX0N0lqk2+5gwgLDBdAQbvPxXUiTQoPWxalKWg7LubVYx5+q5rMbhBhTqA83SIVCb96iw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(66556008)(66476007)(6666004)(66946007)(5660300002)(36756003)(186003)(2906002)(8676002)(8936002)(38100700002)(16526019)(31696002)(2616005)(31686004)(6486002)(86362001)(316002)(921005)(110136005)(478600001)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VHRMNzhzUHBVbzdpd2M4T1pSRU1GSGJVZTRtMDFqYnJKZTRNQnBoVUhaTnV4?=
 =?utf-8?B?VEpmL2RZWHRkQmpGVW10c1psTy9FUjNwdm5FcjRjUjZtSGVMSC9XREc5WC9y?=
 =?utf-8?B?dGJGNVJMSldaZmk5N3ZCU0t6NG5aT0xpckQxdkRVQ041WkFyWkw4c1Y3RUNt?=
 =?utf-8?B?MGlnV1RqUkRJS3lyajdjRVJDMWtiMHJGNXBnd2dpUmZXTUpMQTFLYmdzdGNC?=
 =?utf-8?B?cFJ0eHhCTXdHbk05a2tid0tkZ21ZUlBTdzh0b3pLL0dGZ282Vi9KKzYrQ3dv?=
 =?utf-8?B?M1dhWHhzdUZhQjlIcVhtM1NwL0VINktvbWVsb2hqYTFDaktUbWJXWjk5QjNF?=
 =?utf-8?B?UWQvZVpqMWlzYjBqOElBQXcrdUdicC9QSzNFSU5RbHVncGVvZ1ZQTDNQQjRp?=
 =?utf-8?B?aHBPOTVPcDJ0dkJCalQvOC8vRTV1cWxibkw4UGF5UGFqYjNTY09DR0ZwNjZT?=
 =?utf-8?B?VlQ0UVl0ZW90eWtuZ1dhV0NwNE1MRkZlMGFlaGtLQnpKR2s5Y3Zxazl6dlIr?=
 =?utf-8?B?QmsyYi9JZGtRS2RUcVUvTHR0YVowSE1KdU9DVG9hOXY4NktnMW8xRVloQ0Q2?=
 =?utf-8?B?NVM5a1lwanNjazlUbTdDYm83ajVlYU9EUGZIT1NVenpUb1dUUUM4ZDZTRWM2?=
 =?utf-8?B?YTFBekRsQTd3R3AyS2tWVE01MmFBTHNqUVhrM3daZlY2SCtQWFhNUDRoNFor?=
 =?utf-8?B?VmRxSlNzMWlUa1dZZUdqajJUbGF4TGc1bmxUK0hZTTVyNk9YZzNKd3RZNnlt?=
 =?utf-8?B?Y3huOU95OU52Rkc4dnd5U3l6YzhSQmxBTEJLTy9Qd1FUNGdTeXQyMldoS0JG?=
 =?utf-8?B?clM0VXYwVmE0cWZIYnRxbWNvZlloK042azJ6TFdBZkI5MkV4aGZnMjUyQVdk?=
 =?utf-8?B?R3Z2ME1yZ3F3dmdTZmFqY1Z1a1NYK0RVRUQzSGFFRGZyN3lVRUNzSEdnWDd1?=
 =?utf-8?B?ZXR0TUJudmJWVzlVeU1ZSEkwdDcxSEtnQ0ErSVR5SFNoOWRLUEtrVVJwQVNR?=
 =?utf-8?B?MGFaV2hEY1p2UFY5bldxdTdGQk9GZHVHT1g4QzVLWEpraFdyZUI2RllFRUhI?=
 =?utf-8?B?QjNXK25nbG9JRmNFdmRBeTcrRVpHMm9LWFdZSUFKV29MSUhlWmR0UVp1MU1j?=
 =?utf-8?B?a2ZWMVhOZmZQcWExN3hvZ3piY2w3Y1hqSnFRa3N3N1ZzNm5sQ2wwa0JudlpK?=
 =?utf-8?B?bXk2aUJ2blo3aTdwMjR2Y1R0cDF0MGlFMkcrQlRPbG1uN0VVZ2J4WmZvT1ls?=
 =?utf-8?B?MDFrdGtZcDE2bUZ0QkJIc2VnaWU3U0g0b0FkLzNueWVqYTZxT0xjdXNiTk9N?=
 =?utf-8?B?Ny9abmljRGZ5KzRSY3VGTTNjN3NzL2NtY0lISUQwVUhQL1MzVE9jQTdjcVg3?=
 =?utf-8?B?TEk5c3IwWjkxaEdzSUlDTXF3T0xHZHJPOEJXSnMzQTd2cnl2dXF4OWd3VjY2?=
 =?utf-8?B?Q3lvN3B5SDlUaDRXVzM4aUhPWUpPdmJtaU5rckVTNElpVkdsTk1zSGI1Z3M3?=
 =?utf-8?B?ZTJxMi9CWXQzRlllWnVoQkU5RTAraER3enJVK2luZzJHdWUvYTlLZWVyUXN4?=
 =?utf-8?B?WXcwdTVBUk1aY3hKUitlNFpXZXVvTWtRd3ZkZVNqcjlkYUg3R3Bldm0yaWk2?=
 =?utf-8?B?NUN0M2ZaazBTb0J5VVpyZnA5cWo2OVFYbHlHT1YxUm4xTytUZEhYdjlNMUI1?=
 =?utf-8?B?OWRSVGhINkdFREFJZlBLVmNzT1VZb255OXNiM3lYSm5iUXdSWmNhakMybldN?=
 =?utf-8?B?Uk9tb0dWcFN2TXdycTFucjdwV3BtWlpYczJHY2pQcEw4N1FuWC8xOVpTY29k?=
 =?utf-8?B?ZnlLRHppNGFIbGRTekViMVZ1dWxsazJYWGdhNXBxU3J3MjB2V2ZwQ2VOcjNF?=
 =?utf-8?Q?FpFvdD9oZbZuT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a844a3-dfb1-4b06-2c97-08d934805ae0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2021 06:46:53.7063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FjfNF9q+j8PfnDTYKHVn+5jn1ZUxjoAZFZqyDkCb556842yfKO5ujlBHJEvQHPho
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4317
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



Am 21.06.21 um 02:59 schrieb Mikel Rychliski:
> radeon_ttm_bo_destroy() is attempting to access the resource object to
> update memory counters. However, the resource object is already freed when
> ttm calls this function via the destroy callback. This causes an oops when
> a bo is freed:
>
> 	BUG: kernel NULL pointer dereference, address: 0000000000000010
> 	RIP: 0010:radeon_ttm_bo_destroy+0x2c/0x100 [radeon]
> 	Call Trace:
> 	 radeon_bo_unref+0x1a/0x30 [radeon]
> 	 radeon_gem_object_free+0x33/0x50 [radeon]
> 	 drm_gem_object_release_handle+0x69/0x70 [drm]
> 	 drm_gem_handle_delete+0x62/0xa0 [drm]
> 	 ? drm_mode_destroy_dumb+0x40/0x40 [drm]
> 	 drm_ioctl_kernel+0xb2/0xf0 [drm]
> 	 drm_ioctl+0x30a/0x3c0 [drm]
> 	 ? drm_mode_destroy_dumb+0x40/0x40 [drm]
> 	 radeon_drm_ioctl+0x49/0x80 [radeon]
> 	 __x64_sys_ioctl+0x8e/0xd0
>
> Avoid the issue by updating the counters in the delete_mem_notify callback
> instead. Also, fix memory statistic updating in radeon_bo_move() to
> identify the source type correctly. The source type needs to be saved
> before the move, because the moved from object may be altered by the move.
>
> Fixes: bfa3357ef9ab ("drm/ttm: allocate resource object instead of embedding it v2")
> Signed-off-by: Mikel Rychliski <mikel@mikelr.com>
> ---
>   drivers/gpu/drm/radeon/radeon_object.c | 23 +++--------------------
>   drivers/gpu/drm/radeon/radeon_object.h |  7 ++++---
>   drivers/gpu/drm/radeon/radeon_ttm.c    | 20 +++++++++++++++++---
>   3 files changed, 24 insertions(+), 26 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
> index bfaaa3c969a3..ea34c0661710 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -49,8 +49,8 @@ static void radeon_bo_clear_surface_reg(struct radeon_bo *bo);
>    * function are calling it.
>    */
>   
> -static void radeon_update_memory_usage(struct radeon_bo *bo,
> -				       unsigned mem_type, int sign)
> +void radeon_update_memory_usage(struct radeon_bo *bo,
> +				unsigned int mem_type, int sign)
>   {
>   	struct radeon_device *rdev = bo->rdev;
>   
> @@ -76,8 +76,6 @@ static void radeon_ttm_bo_destroy(struct ttm_buffer_object *tbo)
>   
>   	bo = container_of(tbo, struct radeon_bo, tbo);
>   
> -	radeon_update_memory_usage(bo, bo->tbo.resource->mem_type, -1);
> -
>   	mutex_lock(&bo->rdev->gem.mutex);
>   	list_del_init(&bo->list);
>   	mutex_unlock(&bo->rdev->gem.mutex);
> @@ -726,25 +724,10 @@ int radeon_bo_check_tiling(struct radeon_bo *bo, bool has_moved,
>   	return radeon_bo_get_surface_reg(bo);
>   }
>   
> -void radeon_bo_move_notify(struct ttm_buffer_object *bo,
> -			   bool evict,
> -			   struct ttm_resource *new_mem)
> +void radeon_bo_move_notify(struct radeon_bo *rbo)
>   {
> -	struct radeon_bo *rbo;
> -
> -	if (!radeon_ttm_bo_is_radeon_bo(bo))
> -		return;
> -
> -	rbo = container_of(bo, struct radeon_bo, tbo);
>   	radeon_bo_check_tiling(rbo, 0, 1);
>   	radeon_vm_bo_invalidate(rbo->rdev, rbo);
> -
> -	/* update statistics */
> -	if (!new_mem)
> -		return;
> -
> -	radeon_update_memory_usage(rbo, bo->resource->mem_type, -1);
> -	radeon_update_memory_usage(rbo, new_mem->mem_type, 1);
>   }
>   
>   vm_fault_t radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
> diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
> index 1739c6a142cd..f97a17cce28b 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.h
> +++ b/drivers/gpu/drm/radeon/radeon_object.h
> @@ -133,6 +133,9 @@ static inline u64 radeon_bo_mmap_offset(struct radeon_bo *bo)
>   	return drm_vma_node_offset_addr(&bo->tbo.base.vma_node);
>   }
>   
> +extern void radeon_update_memory_usage(struct radeon_bo *bo,
> +				       unsigned int mem_type, int sign);
> +
>   extern int radeon_bo_create(struct radeon_device *rdev,
>   			    unsigned long size, int byte_align,
>   			    bool kernel, u32 domain, u32 flags,
> @@ -160,9 +163,7 @@ extern void radeon_bo_get_tiling_flags(struct radeon_bo *bo,
>   				u32 *tiling_flags, u32 *pitch);
>   extern int radeon_bo_check_tiling(struct radeon_bo *bo, bool has_moved,
>   				bool force_drop);
> -extern void radeon_bo_move_notify(struct ttm_buffer_object *bo,
> -				  bool evict,
> -				  struct ttm_resource *new_mem);
> +extern void radeon_bo_move_notify(struct radeon_bo *rbo);
>   extern vm_fault_t radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo);
>   extern int radeon_bo_get_surface_reg(struct radeon_bo *bo);
>   extern void radeon_bo_fence(struct radeon_bo *bo, struct radeon_fence *fence,
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index ad2a5a791bba..c318a80853e5 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -199,7 +199,7 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
>   	struct ttm_resource *old_mem = bo->resource;
>   	struct radeon_device *rdev;
>   	struct radeon_bo *rbo;
> -	int r;
> +	int r, old_type;
>   
>   	if (new_mem->mem_type == TTM_PL_TT) {
>   		r = radeon_ttm_tt_bind(bo->bdev, bo->ttm, new_mem);
> @@ -216,6 +216,9 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
>   	if (WARN_ON_ONCE(rbo->tbo.pin_count > 0))
>   		return -EINVAL;
>   
> +	/* Save old type for statistics update */
> +	old_type = old_mem->mem_type;
> +
>   	rdev = radeon_get_rdev(bo->bdev);
>   	if (old_mem->mem_type == TTM_PL_SYSTEM && bo->ttm == NULL) {
>   		ttm_bo_move_null(bo, new_mem);
> @@ -261,7 +264,9 @@ static int radeon_bo_move(struct ttm_buffer_object *bo, bool evict,
>   out:
>   	/* update statistics */
>   	atomic64_add(bo->base.size, &rdev->num_bytes_moved);
> -	radeon_bo_move_notify(bo, evict, new_mem);
> +	radeon_update_memory_usage(rbo, old_type, -1);
> +	radeon_update_memory_usage(rbo, new_mem->mem_type, 1);
> +	radeon_bo_move_notify(rbo);
>   	return 0;
>   }
>   
> @@ -682,7 +687,16 @@ bool radeon_ttm_tt_is_readonly(struct radeon_device *rdev,
>   static void
>   radeon_bo_delete_mem_notify(struct ttm_buffer_object *bo)
>   {
> -	radeon_bo_move_notify(bo, false, NULL);
> +	struct radeon_bo *rbo;
> +
> +	if (!radeon_ttm_bo_is_radeon_bo(bo))
> +		return;

That won't work. The radeon_update_memory_usage() must be called even 
when this is a ghost object.

Christian.

> +
> +	rbo = container_of(bo, struct radeon_bo, tbo);
> +
> +	if (bo->resource)
> +		radeon_update_memory_usage(rbo, bo->resource->mem_type, -1);
> +	radeon_bo_move_notify(rbo);
>   }
>   
>   static struct ttm_device_funcs radeon_bo_driver = {

