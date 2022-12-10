Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EC4648D50
	for <lists+dri-devel@lfdr.de>; Sat, 10 Dec 2022 07:15:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D109C10E09C;
	Sat, 10 Dec 2022 06:15:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2058.outbound.protection.outlook.com [40.107.223.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEB1510E09B;
 Sat, 10 Dec 2022 06:15:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtglVTHkX5arf1YTPtmLoiqX3HERCeBXwWjbYxur7Fmtm5bIBX93RlRnJpVmeYlay7BbV4cJR/I8wlq416G1XxeW3gn7xLm3z4aENe/uQdXtpijt2bW/VHY/YATI52JfBA7aA5f5GIkkYB5O4Hm68iZbiKtDyICuM+FYGHAcZuLnbGUWDj9T8Um78MzBLOzgxGAedKtxdVjaIEPsFOQS6M+K1Q8SEGgSw7cbdq0K3Emd6NxZTyK/idIQctIpLmbdbbelrsp+rMvbbt2xrENX4fxB2UmW0F93/yTSdqTvshjryirLN6hpFlnoDK//7e/OXFy7tNUQNgbhAryiHW5vEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h07vdaGr6Rds7U0Z4nUL2e0T6wTIrfse5dJY0sjJK4Q=;
 b=KSCcJY1Eb/X5qeQDJZk/5PR2blpxL85nxAPPYyJQt5KwQOEcmfOUT4QJ7Gj3NTK0iOW3VvsaCB9GtHE4O9P7i/KmWvxJjzHlVIvVTavwZJTvTBk7nfNN9PAYIWxnFqFA+OEQV8Cqx0txWYXNChYWL8upzEnVstaPofnzFGszEutHCEalbeclUuGhojViAdTZAijy0r0mN5JAOTVjAoeGtqGX0iPKMdxUoDjG7mBlTy7wczxwj2lI/PioorIw68XJEBYrYSk4jlQlTj/aCoDBpLCIWIEmsE3kdH95HvDDSXPTUITJLprKxvG3ZTIynLGs2t8gFQyENcyDzYUHZD/gGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h07vdaGr6Rds7U0Z4nUL2e0T6wTIrfse5dJY0sjJK4Q=;
 b=ztXndxusY7uYZs+I13CyuVWPgqzq36CkKv1EBqitc2Ke9czjcMMA/qS4eRfD4zDQd8WtQFbI4yWaHGYS5NJ/5y4XajVpRdDQ9lT0eqm0G9+WkGc/RXlv9+WfN7VdSLCudldNiD7tKDOEM9Mz1sNjCuEu/DkTVICF/tcHjTlsM5A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by CY8PR12MB7515.namprd12.prod.outlook.com (2603:10b6:930:93::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Sat, 10 Dec
 2022 06:15:33 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::5d8:f3f2:d940:5350]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::5d8:f3f2:d940:5350%3]) with mapi id 15.20.5880.019; Sat, 10 Dec 2022
 06:15:29 +0000
Message-ID: <5ad09c47-1f50-07ce-7b8b-f8e4195f2256@amd.com>
Date: Sat, 10 Dec 2022 01:15:26 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/9] drm/amdgpu: generally allow over-commit during BO
 allocation
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20221125102137.1801-1-christian.koenig@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20221125102137.1801-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0148.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::33) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|CY8PR12MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: edde0b68-6e43-4050-de7f-08dada75eeed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wbzTXcTT5owMsaJtRJpNldivtZAQlYa1aNZWI1EZFezZYxefHNrHovgaw4GBLPa27rdZoXdfFqEMt9wcB0spko+8dL5bf/UHI0aijb/SC7Y5h5YUA0NXlervLzg7h2/GAC5aYPV4NdnOcM04VW2pR3eRVR7+0DbL6sv+xLmzHhS2aT/1TOqQL9PfYns+qHrHizbTSjmG1tLSE5y+bG3XjfxrYEvriP682TYOZbgqiIx+JE1DpDH2lVN4fvE978kH17vbvXcILqyRzhM/xIxoIeAOQaUH+27Zu4RlABGvIb2IPLrS+UBVt8rVp2RoLcF+Rj+BnANhCtm5D0dFttvP7rGF+vIAZMJ7i1qXxOHE3EKKom2DeYphxlZ0EWAX1bLuNZxSi68GecnJdlG/vkv3YCfmRoS6R4YN9Y9WWWTZFSNAMgignzB2fJIPZ+4WZ+9cXRNzQGzGcYTRoSMa/rRqZPNXAfDemBk7AT/+pnWIPvB4uWjvrBjyfdmLnHguO460QavtailZGRyeOKrvojHOoTAhgBZdrilu9oUwIcBa3p3LYrfGr+zbQbGrBnpHIuzopKPbYGPCwSI7i05JF44p7lkEg1kDiMdceDbW5Z19S8Y43tqLrmok6vAHnb1W554dEl+dqWm2tyI5iHe8zfjKNRXS4+h596xC8RzRjVt77FLiQVckk0RuQFmiCfdJ9+ZVi60HxHqW2akqnlA/PMO9bjoyFo8qcrFs1NvNADp0DcI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(366004)(451199015)(36916002)(6486002)(478600001)(8936002)(41300700001)(5660300002)(44832011)(66946007)(8676002)(4001150100001)(66476007)(36756003)(66556008)(2906002)(31696002)(86362001)(316002)(110136005)(66574015)(2616005)(31686004)(186003)(83380400001)(6666004)(6506007)(6512007)(53546011)(38100700002)(26005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MllFVGQyd1JKb0hBdE12RXc2TU1lc1UxckIwQ0hWbitmTDBxVW5zaGpFc2x5?=
 =?utf-8?B?RlltWThpS1dlSW9KY2lnSWRvUmI3YXpFZ3N5OTBhRjU2eGJUcjdQQUthb2Np?=
 =?utf-8?B?RDhCUzF0c0FXNWhNN3U5L0QyTkxLd1ZPbWpCQTg4VXgwT1NqVU1WandTYnZ2?=
 =?utf-8?B?aFhpYUVIRUphTHUzOXVpWTVua1cvVEV2RkUyek8xWFE4SUlEeGliaS8zYllh?=
 =?utf-8?B?dk5VbVh2OTRpTWJYNW9RS2RCRUNhQlZjWTRydWZtZm1yajQra1dYYjRhTEV0?=
 =?utf-8?B?NjQzWnljSDJtVWx1OEFGT29tT09QU2IvaXB5ZVJvWDg5d0w3ZmpkNkRiaVF4?=
 =?utf-8?B?eDNFWU9teDZackZZVjVVN1JFdmhwWGYzRWY4YllmN0JnWVpxbVNrQWxOMHZk?=
 =?utf-8?B?WitER1dFeUdRdmhLUU9PRFc2SHJKeHV4TXNTZDBMNjNxTW82U3AxRjI3dzBq?=
 =?utf-8?B?WG1ZMVhhWDFaUVA1WTRuQ1NUcDdmTGo0bytVMFlxVFE0SzZORFU3cG5oNjg3?=
 =?utf-8?B?NXVjNXBqT1N3WnNjNHpwbGU2OWFMUFJxVlVXNlBrcVZZNWcrclV5MFNaYWln?=
 =?utf-8?B?Q1BuNVVmRnV6RnRSY1RkU0VkNnlSejZpdU5adUxrTjUreTRyZVI5OVhPaXJ2?=
 =?utf-8?B?OHRuWmJVV0hpL1lLR1NxRHo0bUZmUEJFc3FrWDN2WDlaVWtpVnZVRE5iYW9i?=
 =?utf-8?B?aXlhVXpjcmNHL3Y0dUJkUXpxUFFud08wUkhWQitMZnhDN2xwamNsZitqNWNZ?=
 =?utf-8?B?VndMNlhHWHlxeENtck01KzUySG9BREdSYXRXbDlEUnVuNHVrdDc1YXVrMDdr?=
 =?utf-8?B?RSt2Z1Q2QitqUC9HS0JiN29VVnhKeXBWZE9rdzFFOGk1c0R1RThnWHNUV3ZC?=
 =?utf-8?B?UDZpQ3EwUEs2cVZPY1N4bWp0US9iVE82TG15cXI1aHdjWE0zWFhQTy84K3NZ?=
 =?utf-8?B?cm1vN0lacFRBWjhxcithQ3pyTkhORmgraG1jZm1MNnpFeEg1LzJxbXd1T3FK?=
 =?utf-8?B?WllFcngya0N2V0tSM0JnS0N6VS82YzBTZk83M3prY3YwSCtPVWdBZUJGd2dm?=
 =?utf-8?B?KytaanI0UTNKU1paUVNYMHBzdW8rSFI2cEVkelQ0M0hmdXpkb09Va1p6Ukhl?=
 =?utf-8?B?YW9vVUZNM0lpcklLLzRSZTBlVmRNOE1TcXB0bk9QNDZZNVd4N0FXR2dCSDF5?=
 =?utf-8?B?Y3dHdC9SaytORUdhODY3L016WjJhYjdWdW91K1hvT0hQNVRnanNaLzB1WFRB?=
 =?utf-8?B?TThaTW03bVdyR0NjUUlFTHRuTm1MY0p0WnNkWDVZM0h2akV1TFJ4bFRxc3Z1?=
 =?utf-8?B?b0lJM2UvNitHODY5M21VVXRYelhUVnlWREZTTEhYZCtqWGlIMTJXZXoySlg5?=
 =?utf-8?B?ZDJPeTYyZ3BOWGkvRGJLbm1qcWFla2lORGxseWxReU10S1BvSVFYQVA4U2pM?=
 =?utf-8?B?ajhjQUdURG93OVJwM29CWFNLSy9tdGhpMnBJQ3FibXMwZDJJelB5ZitGWVpO?=
 =?utf-8?B?WDd1R2FVSXMvaHlyQ0RFakRoTGIrV2VLUzRTT2F0NFJRbXJzYUQ3bzVBUHdn?=
 =?utf-8?B?ME9iVGlsYjFoc1hVR09lUmNjNXVIaC9hNFBzVVNpM1lGcnRqMnV6TWJtb2R5?=
 =?utf-8?B?NFVSMGI3YWxTclpUczNiNnpRdEV5Mlc2RDNBelRhRFhuaDdGWGFxeTB2eTRB?=
 =?utf-8?B?bkU1ampCSitDVGZOUjN0eHhkVkdyQ09LelZQcTVpdXNXcSszN2pHcjlCY0RP?=
 =?utf-8?B?M2g4M0h3blB2WTVBSjVTS3BhTndKQkhBd1JKOWtuenRPUForUnpvNHdEQ2Z0?=
 =?utf-8?B?V1FTeGRONU4vT2drWHNuZzNOdjh6L1g0cVNNYmVoaWdHbDQxUHNKUHFwcGpm?=
 =?utf-8?B?UUZ0SHNFQXE3WGFpSmxTKzVkc2hyREkra1d3cGd5cXNKaTFQV3dtM1kyaHV4?=
 =?utf-8?B?bjlxd0FCSkVreHF0MnRGQmVMYzNzZWdCc253MExYT2ZEam9pcHFCTHR6WENC?=
 =?utf-8?B?YmkxcURuNm51ZmF5V3d6bko0NEJTK0pJNjJDS0FUd3ZpZWkzM2JYK0p0U2J5?=
 =?utf-8?B?VUJ4RUdUT0s1YUdaYXl4NFJVS05mZ3hFMVB6WHk2UEdpWlVrd2R2QjlSalV5?=
 =?utf-8?Q?TOOeGB7FSRmU7bMOLgM4gpxbe?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: edde0b68-6e43-4050-de7f-08dada75eeed
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2022 06:15:29.2358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H3Ty9NaUYRyKSbXp0bBcNfBpVot0/rY4dS+y9vhdvDmtSjX6tcoV3GdaXPmqGPv7fkMqy1Yr5PEmymY7DbKDkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7515
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

On 2022-11-25 05:21, Christian König wrote:
> We already fallback to a dummy BO with no backing store when we
> allocate GDS,GWS and OA resources and to GTT when we allocate VRAM.
>
> Drop all those workarounds and generalize this for GTT as well. This
> fixes ENOMEM issues with runaway applications which try to allocate/free
> GTT in a loop and are otherwise only limited by the CPU speed.
>
> The CS will wait for the cleanup of freed up BOs to satisfy the
> various domain specific limits and so effectively throttle those
> buggy applications down to a sane allocation behavior again.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>

This patch causes some regressions in KFDTest. KFDMemoryTest.MMBench 
sees a huge VRAM allocation slow-down. And 
KFDMemoryTest.LargestVramBufferTest can only allocate half the available 
memory.

This seems to be caused by initially validating VRAM BOs in the CPU 
domain, which allocates a ttm_tt. A subsequent validation in the VRAM 
domain involves a copy from GTT to VRAM.

After that, freeing of BOs can get delayed by the ghost object of a 
previous migration, which delays calling release notifiers and causes 
problems for KFDs available memory accounting.

I experimented with a workaround that validates BOs immediately after 
allocation, but that only moves around the delays and doesn't solve the 
problem. During those experiments I may also have stumbled over a bug in 
ttm_buffer_object_transfer: It calls ttm_bo_set_bulk_move before 
initializing and locking fbo->base.base._resv. This results in a flood 
of warnings because ttm_bo_set_bulk_move expects the reservation to be 
locked.

Right now I'd like to remove the bp.domain = initial_domain | 
AMDGPU_GEM_DOMAIN_CPU change in amdgpu_gem_object_create to fix this.

Regards,
   Felix


> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    | 16 +++-------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  6 +-----
>   2 files changed, 4 insertions(+), 18 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index a0780a4e3e61..62e98f1ad770 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -113,7 +113,7 @@ int amdgpu_gem_object_create(struct amdgpu_device *adev, unsigned long size,
>   	bp.resv = resv;
>   	bp.preferred_domain = initial_domain;
>   	bp.flags = flags;
> -	bp.domain = initial_domain;
> +	bp.domain = initial_domain | AMDGPU_GEM_DOMAIN_CPU;
>   	bp.bo_ptr_size = sizeof(struct amdgpu_bo);
>   
>   	r = amdgpu_bo_create_user(adev, &bp, &ubo);
> @@ -332,20 +332,10 @@ int amdgpu_gem_create_ioctl(struct drm_device *dev, void *data,
>   	}
>   
>   	initial_domain = (u32)(0xffffffff & args->in.domains);
> -retry:
>   	r = amdgpu_gem_object_create(adev, size, args->in.alignment,
> -				     initial_domain,
> -				     flags, ttm_bo_type_device, resv, &gobj);
> +				     initial_domain, flags, ttm_bo_type_device,
> +				     resv, &gobj);
>   	if (r && r != -ERESTARTSYS) {
> -		if (flags & AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED) {
> -			flags &= ~AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED;
> -			goto retry;
> -		}
> -
> -		if (initial_domain == AMDGPU_GEM_DOMAIN_VRAM) {
> -			initial_domain |= AMDGPU_GEM_DOMAIN_GTT;
> -			goto retry;
> -		}
>   		DRM_DEBUG("Failed to allocate GEM object (%llu, %d, %llu, %d)\n",
>   				size, initial_domain, args->in.alignment, r);
>   	}
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index 974e85d8b6cc..919bbea2e3ac 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -581,11 +581,7 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>   		bo->flags |= AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE;
>   
>   	bo->tbo.bdev = &adev->mman.bdev;
> -	if (bp->domain & (AMDGPU_GEM_DOMAIN_GWS | AMDGPU_GEM_DOMAIN_OA |
> -			  AMDGPU_GEM_DOMAIN_GDS))
> -		amdgpu_bo_placement_from_domain(bo, AMDGPU_GEM_DOMAIN_CPU);
> -	else
> -		amdgpu_bo_placement_from_domain(bo, bp->domain);
> +	amdgpu_bo_placement_from_domain(bo, bp->domain);
>   	if (bp->type == ttm_bo_type_kernel)
>   		bo->tbo.priority = 1;
>   
