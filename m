Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 456A857B331
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jul 2022 10:45:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A852111AF8B;
	Wed, 20 Jul 2022 08:45:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA64F11AF66;
 Wed, 20 Jul 2022 08:45:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kXCKKmCVHWhHO7XMO7Gyn3cqslJl8+mJEYmbzS5k3308zPZ4jTvfE+rl+5ndiHMidnFM7Wkk5+jR9UrHJwd3FOOPzS5a8+V1uqQwLjKZOeEaPFFljT2cXysnlnh0+FQo00x/6DU4XgDcVgdw5Uig5aQL8YwLOf6RuU2TfJIrnn5UiuTlMSjPgAOMNe+w164F9BSP21LoNkmvHbCFC+QQ944+LA8R7fu89VPw/ecoDbt/QGb8vi5LVh5ID7Utu5Dgfx1KPhM3DUkKB2nvEal4ev7FQXzeg+i5Id7FO1XEiIeITtZpdpD9wBeW5FcVDTSUiSILUCwPUuptbwTnO2GVBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aVYgMU+62BXDhr8hR3aL8wCtzwiGNbLBjX5QG8b+x7I=;
 b=c0kap9qKYbqPm8lHZVfzqpuqqIIVTnqjNYVxi/l9L09pe6UQ31tbWbtB4vYN9QWeXgB60w1Nkt/fmnbqVITJRnaMyiI9mCEMSIbiqMSI+UuWfMPBK2r6wzDyzpbPGQXOMnIDBT1uSFy+O531OFT0MKyyTQYHggsnld1W/JT/jJkPSlm/Ly6UeoLYSyRaDeoDhBJWg2qRc8UT8gTEgt1zRhQu4TCOwfCxNoRpmQbRvhyKuKLPSXJQYjBfHUjVlv8K3CXeZ4ImG2Yu0jOtAGFH8E813D65E6INXk7JRUOARp8xR13sN8kLmeAm3qpOx3R9dHkelxVwrE/vrh2U/oHUfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aVYgMU+62BXDhr8hR3aL8wCtzwiGNbLBjX5QG8b+x7I=;
 b=Y1dOwSjvWcsdk5+G/0p3kqtWOZkEi1Qptno0pnnKebfruVq+8OrHBjdOjEUnS48o4y85n2XrfFvXnWv3jDlE3lLTmxAU1DdbopISXSQnt/eLGDw1fAeCRUb8XRzZpMPeQQz/oBeDO4U00C1q9Viixzq6VBv60k7Hq0gA6G2QWVo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN2PR12MB4607.namprd12.prod.outlook.com (2603:10b6:208:a1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.14; Wed, 20 Jul
 2022 08:44:58 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5458.018; Wed, 20 Jul 2022
 08:44:58 +0000
Message-ID: <51955f5f-bdb4-4774-4000-99855dd79176@amd.com>
Date: Wed, 20 Jul 2022 10:44:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/4] drm/ttm: Switch to using the new intersect callback
Content-Language: en-US
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org
References: <20220720073606.3885-1-Arunpravin.PaneerSelvam@amd.com>
 <20220720073606.3885-4-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220720073606.3885-4-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM6PR04CA0013.eurprd04.prod.outlook.com
 (2603:10a6:20b:92::26) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7274f9e1-a32f-4e51-4ba5-08da6a2c2057
X-MS-TrafficTypeDiagnostic: MN2PR12MB4607:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: D4Z0CUHIVdQQWHe35wNuIGUozIJa6wjf4QQx/Tg8v3Uhdfs6LgJqxRFUC5opqi7u76YyCvRMpzBvTWlk3VXOcuR3ycmKp76xfZa1T5aeuQc0LhWa3Ic66PvkCJ4I3qLtKUz5B/TEPHWbp428YcJ+DzHvU1AIyfkHOg5iKfpwyBfBVYQLs0wNLw0sqAm9kUNPYsUsgkED6/AlZu0j1aQz1u+jLJJDu5TIZPf26quHwqVO8BVdYncNdxZKKqiJQ/wtOkhDEvp79XA5NzmgH1pvTxQNjm/RFbuB+ggMD6wpqvh5D867lJo6AxlaBdWARLFKEPpnMUzxCE6KaqaSDQA3pTNvFzQKKLQjmZGdFy3IM4BVnRsncTe5F+thm/HSZo8YCJ5vCxQPnZs9DmkzIGVQF8aEIrAn3LCCE1Ow3udAMKR3cFcSAscFZIaLxOJvCMpSWyRb0NelVDpMg8kAsX8g+N42XJOX3rPYkJ0QNY58f9AzhpNq/J5KNTdycJtgJHiZ+6odYcVFihp6mLhEKquXPw0BgsuTfmeojNOymv0G7ewj3pBXSLV4Aa8gNVJcGpH0RnRefTB4doFFWZIu7jpWDVZTXswngxzOHKQvu4nYGmudq0emj96qfWAWD0s5inVEnxtMo+Z0LJnHfxXH9UQsRlE/WGlHfrS/mG2y/Hou10P5nEp7FrTjbX+UZvbCJJgX/AXyQAL5ZM6ArnKkdowboSdN52OJKXjvuCCJt18AirdIZ3C2q7CrGWttSNOsFcfjzhV2Bu07tD4ygfMffBAQ78KozjRFMlOwB4OXMoV+sRvOYk6ozFNVXvyY7aLbpy35II0Q0jndlXia3IxNoB8NdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(136003)(376002)(39860400002)(346002)(366004)(6512007)(2616005)(66476007)(5660300002)(86362001)(2906002)(478600001)(38100700002)(41300700001)(6666004)(6506007)(8936002)(31696002)(83380400001)(66574015)(186003)(4326008)(31686004)(8676002)(66946007)(36756003)(66556008)(316002)(6486002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnp5RWRUUGp0QWlrd0pIY1ZrR0dGTXFGaFRKdUwvUDdGeS9LNVNIUU01Ry91?=
 =?utf-8?B?bVF6ZjZ1aE5xL0tkSU5kQzV2L1RCQlA2Rng4eGJJRlhIWW1PUjJBWGVkd3M0?=
 =?utf-8?B?ZGU3bG4vdEU3d2Z2NU9xaSs5MG5vd0M4TjhXL2Q0YWpIbldHUFZnSXlUaUN4?=
 =?utf-8?B?dkxJa3dnWStybHU1c1pWN1Qvc3RjaC91RG52YTh1L1VTY0NXNzRVY3BJTEth?=
 =?utf-8?B?dnJKelpIMkF3N1U3T0pQS0FSbDNFUGZYeDlGa1hwK2IwbjVPTXZJODNISGxy?=
 =?utf-8?B?S2Y5eFFEZnU3ekpqMTFmbExmNTBXVThsdjFEWUdvYXBrNXRQeld0SEt0UXpM?=
 =?utf-8?B?eUdJTXN4am1aZ2JxQVJreVdjV0RUOGlPS203OXo2U2ppSmhlclVYbWZML2V1?=
 =?utf-8?B?RXRWdjJsRitMelZEc1FVT0hRQ3lJTmNPUnpPQzJ3Qk5SL2VGODlURllnQnNE?=
 =?utf-8?B?WW0vdkNYMFoybWIwUzNpRFE2T2hhZU9PMVpQaDZEZk9vTGFqOWVjWUZpaUpL?=
 =?utf-8?B?WGhEalNYUVcrSEFVdzRtWUZlUElEVUM0bUw4cTh6ZzRuRkY3ZDdFUThaYVhp?=
 =?utf-8?B?dEZyQi81cTZ5aGJBVU43TUpNZVVVSFF4cFVsem1LTmN0YVZEVXdBbDVXeWFa?=
 =?utf-8?B?M2NrMmJWQUZkZnd2MHNFSWNHNzBCZDRwUUdKNFpKd1BaTXFnVE42T0pLcTlv?=
 =?utf-8?B?VzJ0ZFhpZFVHTUdETjBqK0xVbjR1U1N1VEZwdjh5SzBTNEVYRW5RVWNUdHRk?=
 =?utf-8?B?d2tVVTlBUnVDbTR5anhveUNMN0w5dktsQ085U0NkZjdLQitzYlNEL3VXNW55?=
 =?utf-8?B?VXJvb1M5VkF3SDl1VnpXTlFsZWFVWGthZUxWNy93clpIVlN1QXl2dXJ5emtC?=
 =?utf-8?B?bk5NdlpVV0V3OHk5YzAyOUo5bG8xOUxLNmpwdHprVnlrNW1RUHlIZkE0ZzJB?=
 =?utf-8?B?bDZISENOVEZaVW92aFVqOTdBTisrU3JxL0FtNlB1ZDBZdW5JWlhIYUZ0MGhG?=
 =?utf-8?B?ZXR6dE9kV2xuTnZqRjRBd1pMMWtUWk1SUk9HZngyMDZ5YlgwSU9sY1IxSy9J?=
 =?utf-8?B?K1ZJc2NEYUhzUEtvR0dyS1NVTFFzdDZ6aTFJbTNvTjNRVVhjVUc4NjNqQUxr?=
 =?utf-8?B?YmpGcTVFZDl6UVJEYVJ4eTRRVklLb2N4QUVGSlhZajVQdnRBTkh5VjBYRmQ0?=
 =?utf-8?B?azlvbzlhSXlsUDhEVkJhRzdMSUc1ZWdpeGpRTVdDSXIyNjYyWXk1K0N6VXZI?=
 =?utf-8?B?dnQxVFVsL2RxY25uRjBYTXdtRG03LzFuVXhYcWcrTlFDZmNhREZETUJnc25H?=
 =?utf-8?B?YlpxY0VLM0hIazYza2RVZ2REbzV4MmN5TnN0QVYxays0YkV4N1AxUDlNUHd4?=
 =?utf-8?B?OW9jVFBPRmd5M0xsUFhPMy9IdHVRV3g3VlhSSzVkSElPUEk3ZWRYelpKL1Yx?=
 =?utf-8?B?bmJqTEw3SlpBNUdSa0pEZlNVUTI5Q29UUTY2UXh3MGlhSjZVVXd3dTgzSTVU?=
 =?utf-8?B?U3JKbG9iVGtic1BKcnd3ZW1jdy8xek0yTFk0aGQ5dWM5M3BMdUFzT0h4alJJ?=
 =?utf-8?B?RFRiWVZNb1dCNkl0VUFSa1g3U0VndENneGpnNnk5N28zS3ExV1JtaWtQTmZG?=
 =?utf-8?B?QXJ5RldITmk4TEY2SHNOaUkyOVZKVS9FMUR4U0FZY1pNYjZpSHV3WUdkUWVk?=
 =?utf-8?B?RVhzdzNIMkNpSThPUlVEbzF6ellITUIyN0JOcGR3S2xNbkRVWVFmU25hbHBt?=
 =?utf-8?B?b0RKdXcvK0NSZUR1MHJmdE1mOHAzN21YSmQ3RDZOZ3M5UURiTFI1WGNWNWhK?=
 =?utf-8?B?clJZVU1saTkwYStHTVRNYjd0emg0NXRzU01tcG84TlZVTGNyU0huYVcvZWdn?=
 =?utf-8?B?T0dYdnZLMnI5VUpITGw5UlJ0WTJnMXBBOWo2RkdUTEo2S3d0dXlWVkFwRzZL?=
 =?utf-8?B?aGxEaUwyN0dTeDlpNVI5Mi9UTmoyZmVicEtqRGJmY2RpOS9aQjE3WGVjaTh2?=
 =?utf-8?B?V2VLZVNnL1RqYnpScVVid1BBOHlFbmRJemlwMG1ZTUlSQzRYaXI0d0IvbVpR?=
 =?utf-8?B?UVhvN3k0NFVtS1N5ZWtFRDFhS2ZodysrZGR4akRzTklkbWxXc0FnSldZdlVy?=
 =?utf-8?B?cTIzcEZjUWJXVjJMM05KcE5xRUlSODdPVmdaK3pHQzF2TmdYQVh2bEJ3bG5G?=
 =?utf-8?Q?CMvPvPBvRbunP0+ywyK4yPb4DMKuOdQrkQG7+kTxvLdX?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7274f9e1-a32f-4e51-4ba5-08da6a2c2057
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2022 08:44:58.1918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P9Z8nVebA37O7f+CEi/iZVQwOtV6XEKiGpdPCwLCzd82hbkE5StFpkPAdwCTTF6d
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4607
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
Cc: alexander.deucher@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 20.07.22 um 09:36 schrieb Arunpravin Paneer Selvam:
> Use new intersect callback instead of having a generic
> placement range verification.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 45 +++++++------------------
>   drivers/gpu/drm/ttm/ttm_bo.c            |  9 +++--
>   drivers/gpu/drm/ttm/ttm_resource.c      |  5 +--
>   3 files changed, 20 insertions(+), 39 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 170935c294f5..7d25a10395c0 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -1328,11 +1328,12 @@ uint64_t amdgpu_ttm_tt_pte_flags(struct amdgpu_device *adev, struct ttm_tt *ttm,
>   static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>   					    const struct ttm_place *place)
>   {
> -	unsigned long num_pages = bo->resource->num_pages;
>   	struct dma_resv_iter resv_cursor;
> -	struct amdgpu_res_cursor cursor;
>   	struct dma_fence *f;
>   
> +	if (!amdgpu_bo_is_amdgpu_bo(bo))
> +		return ttm_bo_eviction_valuable(bo, place);
> +
>   	/* Swapout? */
>   	if (bo->resource->mem_type == TTM_PL_SYSTEM)
>   		return true;
> @@ -1351,40 +1352,20 @@ static bool amdgpu_ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>   			return false;
>   	}
>   
> -	switch (bo->resource->mem_type) {
> -	case AMDGPU_PL_PREEMPT:
> -		/* Preemptible BOs don't own system resources managed by the
> -		 * driver (pages, VRAM, GART space). They point to resources
> -		 * owned by someone else (e.g. pageable memory in user mode
> -		 * or a DMABuf). They are used in a preemptible context so we
> -		 * can guarantee no deadlocks and good QoS in case of MMU
> -		 * notifiers or DMABuf move notifiers from the resource owner.
> -		 */
> +	/* Preemptible BOs don't own system resources managed by the
> +	 * driver (pages, VRAM, GART space). They point to resources
> +	 * owned by someone else (e.g. pageable memory in user mode
> +	 * or a DMABuf). They are used in a preemptible context so we
> +	 * can guarantee no deadlocks and good QoS in case of MMU
> +	 * notifiers or DMABuf move notifiers from the resource owner.
> +	 */
> +	if (bo->resource->mem_type == AMDGPU_PL_PREEMPT)
>   		return false;
> -	case TTM_PL_TT:
> -		if (amdgpu_bo_is_amdgpu_bo(bo) &&
> -		    amdgpu_bo_encrypted(ttm_to_amdgpu_bo(bo)))
> -			return false;
> -		return true;
>   
> -	case TTM_PL_VRAM:
> -		/* Check each drm MM node individually */
> -		amdgpu_res_first(bo->resource, 0, (u64)num_pages << PAGE_SHIFT,
> -				 &cursor);
> -		while (cursor.remaining) {
> -			if (place->fpfn < PFN_DOWN(cursor.start + cursor.size)
> -			    && !(place->lpfn &&
> -				 place->lpfn <= PFN_DOWN(cursor.start)))
> -				return true;
> -
> -			amdgpu_res_next(&cursor, cursor.size);
> -		}
> +	if (bo->resource->mem_type == TTM_PL_TT &&
> +	    amdgpu_bo_encrypted(ttm_to_amdgpu_bo(bo)))
>   		return false;
>   
> -	default:
> -		break;
> -	}
> -
>   	return ttm_bo_eviction_valuable(bo, place);
>   }
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index c1bd006a5525..03409409e43e 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -518,6 +518,9 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>   bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>   			      const struct ttm_place *place)
>   {
> +	struct ttm_resource *res = bo->resource;
> +	struct ttm_device *bdev = bo->bdev;
> +
>   	dma_resv_assert_held(bo->base.resv);
>   	if (bo->resource->mem_type == TTM_PL_SYSTEM)
>   		return true;
> @@ -525,11 +528,7 @@ bool ttm_bo_eviction_valuable(struct ttm_buffer_object *bo,
>   	/* Don't evict this BO if it's outside of the
>   	 * requested placement range
>   	 */
> -	if (place->fpfn >= (bo->resource->start + bo->resource->num_pages) ||
> -	    (place->lpfn && place->lpfn <= bo->resource->start))
> -		return false;
> -
> -	return true;
> +	return ttm_resource_intersect(bdev, res, place, bo->base.size);
>   }
>   EXPORT_SYMBOL(ttm_bo_eviction_valuable);
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 84c21f92b422..ff3e9058943c 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -285,6 +285,8 @@ static bool ttm_resource_places_compat(struct ttm_resource *res,
>   				       const struct ttm_place *places,
>   				       unsigned num_placement)
>   {
> +	struct ttm_buffer_object *bo = res->bo;
> +	struct ttm_device *bdev = bo->bdev;
>   	unsigned i;
>   
>   	if (res->placement & TTM_PL_FLAG_TEMPORARY)
> @@ -293,8 +295,7 @@ static bool ttm_resource_places_compat(struct ttm_resource *res,
>   	for (i = 0; i < num_placement; i++) {
>   		const struct ttm_place *heap = &places[i];
>   
> -		if (res->start < heap->fpfn || (heap->lpfn &&
> -		    (res->start + res->num_pages) > heap->lpfn))
> +		if (!ttm_resource_intersect(bdev, res, heap, bo->base.size))

Thinking more about it that probably won't work like this.

Intersection doesn't mean the placement is compatible (e.g. it can be 
that we only partial intersect).

We need to add a separate callback for that I think.

Regards,
Christian.

>   			continue;
>   
>   		if ((res->mem_type == heap->mem_type) &&

