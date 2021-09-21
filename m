Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FC741328E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 13:30:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC5F6E95C;
	Tue, 21 Sep 2021 11:30:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2063.outbound.protection.outlook.com [40.107.237.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 158D36E950;
 Tue, 21 Sep 2021 11:30:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cxEzECTU/nxgqFX8zBmlZnb6DLiBxy1R+7Jho+WLACvRR4qnJ0OWSDOnIitCDwdXawS6e3Q2/S0kHhAajbPEeLYQyWff58QGsrboQ3F5KPKFUYrDjYR6EQn+u1w7eGGNynsnFwFgsYOhYcTYQupQDmUQBQpns73n4FLubI2sIbgkuvfAXOcJ2ADGsLZgjY7OOJV74XC1f+1iXyd+RRoX1gmzkcYs38MC+CBsaVfdGZWo/MD98N4IY++e90WpaSX6XCUfsS73BUl9cHa8BQbdkViu1dw9xXkDMOrOrXQFg/9IwZXpFpPGYRDh6Uohb3VYs/jI2feMMvQ3Vr98kbBoww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=brIvloKsg96HRJTluGKPqVHuNU23Qf/YwESewuu6wJo=;
 b=iomtQNRXMyg9gakcQZSAL6JHzyFyly4gWEOZXpejiUSZKQv3Db7bS9YhjLuBWTWQqkvLpI0PeBsT/IlhShpC96bEdm/g+/jf/DFZTjfhy89Fk5hfMoeTX3RKag/psvZb0ZS6FP1HrjwCUrZ9QYJ/W/ukihauNSfYE96aCHteyFE4VPPEJ7x622eNpl/A/P1avCxHE23D5rUO25ws7OU9zoZyNCKu2naAWzOmRquXdcPM3kQw+gqfpoP0gVupbCFvVG0C/l/nfHHgIsO0ps1oKxy1KsHSeblVIkpG5CtET2sZA2HLAgTMZZVFVMN5w4SJp2YGv2zoYkjh66JXsfuMdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brIvloKsg96HRJTluGKPqVHuNU23Qf/YwESewuu6wJo=;
 b=MIXm+qna1MjNndc8OTWMc0NrUYbG5A2+eEwSeMavog+JnQLRJCAsU4/amyXKL9E3XjdfkwBdZ+wyW7Lgo5vYeaCZ3eWRJKkBVQR/me1EzliNjcwbfYn8Bd2AsG0049UQHV2J5GEJ9FNwTdsUv2mSTeVFQK6FXD4LojLOCynzcQ0=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4390.namprd12.prod.outlook.com (2603:10b6:208:26e::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Tue, 21 Sep
 2021 11:30:45 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4523.018; Tue, 21 Sep 2021
 11:30:45 +0000
Subject: Re: [PATCH v4 05/14] drm/ttm: s/FLAG_SG/FLAG_EXTERNAL/
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20210921110121.3783395-1-matthew.auld@intel.com>
 <20210921110121.3783395-5-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <39c95cb7-9e63-83a9-5da2-c07845827b39@amd.com>
Date: Tue, 21 Sep 2021 13:30:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210921110121.3783395-5-matthew.auld@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR3P251CA0003.EURP251.PROD.OUTLOOK.COM
 (2603:10a6:102:b5::6) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:8582:d9f8:1318:9d2b]
 (2a02:908:1252:fb60:8582:d9f8:1318:9d2b) by
 PR3P251CA0003.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16 via Frontend Transport; Tue, 21 Sep 2021 11:30:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 189d5b55-3466-4f7a-dd0b-08d97cf340ab
X-MS-TrafficTypeDiagnostic: MN2PR12MB4390:
X-Microsoft-Antispam-PRVS: <MN2PR12MB439010010509EF727901D6F683A19@MN2PR12MB4390.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +HX86Ya29/O380urpYi4AvoojaD+6iuJ4uCk1xGUVzKu6rseBsdVbt+N8hFCyssGC81WmhDvdWlm3jlHCZ/TtrRSUEZ+MibdVOxb4Tni7Miyrp1IevnrlVT2eLOoBXlHeha/I63WgfxgQ9GMb4oHZbhNuoXUKoJr83+TxWfX//gBvFO62Zyn3RC7L7Exga2PYT8xLTVm2GAsSWTEsuqtDth5MPsIwCd79y5sn+vb4SHiB6uvpCyp3NG4xpSzuCgtQEaarge9tsIdqPeGBANrA9BKHDLTWEB1jFBPYAC1gwyDxFl95v2Uxu8+/yg1JsxS6/Fvh/2BrAuGB3V+ZlZmFO6CppV49mkHKUnixG7oPKDhsDyjMPpx+wXZaq0OQBNlsQiOhcYpF2L0zWpQ6aUTylMuwKtfhm+C/wkqqm0mzLCF8x2LwCUjW3Z5D6/jWa7PPnhGsx5W9zHj395k35bGjXdgUEU9Gzv6Nj9GNQ6d7d6DStnCh1JSbnwjF6inli/2hWjJzQai56NmVQY5viPdw8sOxVMd2Mz0KJNrh+CWfLcYt5hhwlKkkE4KX8Vk0WSFiSbprMQPPMUjKrFPPsG8ukhqJvVxQ5i16dl9BAV8Qbc42G+ccb24XJJ9n9O2p8ZbngdqW9E7N3zBP6Y55f1eUqM+Pcdz8cQlcwmPjcXBVl7Y3HkUI6t7EDQjESvpMp7wtd7KwRZ2AIL2Yu38YxkN/YPO75w33WbUX/nFgy/A/so=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(4326008)(31696002)(8936002)(31686004)(30864003)(316002)(36756003)(83380400001)(86362001)(8676002)(6486002)(2906002)(66946007)(2616005)(6666004)(66476007)(66556008)(5660300002)(38100700002)(66574015)(508600001)(186003)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MzFWTW9BdEJydk9iWXYrT21uYzJGWU5WOXhXamdKTFlad0tmSlZtNStGSVdk?=
 =?utf-8?B?bGgvN2FnbFlzZXM0UU4wNXNjblVUcVdsODFYYlUwajBIeFdCTU1ITy9rdi9Q?=
 =?utf-8?B?TXlqM1JJT1BkOHpFZzRDTmY1MWpoSGpDUmZ3UUhqdDMwTWpPTXQ2aHUrNDVM?=
 =?utf-8?B?R3JwZ05pTkI3OU9ac2p1cVJ2aEx4SkFnMS9SMUVsNGhGTWFSVVBtdnU0NWNN?=
 =?utf-8?B?TGx1bk01WHlXN1hRbEs3Ly9UMnF2c0pUWUZ3Y2Flc0ErZVp5ZnFoZUllZVlB?=
 =?utf-8?B?VTJ3Y3JGN0NCVlNHODhoMi9xR0Fwc29yQzZsdXBvQWRMVFh4QzFhYmg3UUxl?=
 =?utf-8?B?eXdsNTFzbitId1k0SnVoVGdZV1NwdDF5ZVRmVGR4d0pmeUhDSWNoem1ZZ2xR?=
 =?utf-8?B?dFFjNnhHVVRNdGJGaUhyTFV0NmgzK2dlcjdTMnpVTXR5OUZOSGw1Vyt2VzJu?=
 =?utf-8?B?eUZqdWJWMGo3VUl4OENmVXZxNzV0MHhzYllSTXR6TUprbUtFNWcvMnlIWmRz?=
 =?utf-8?B?T3I2VHVIc1htcXYzdFp2b2JRTE9KUk1CR2pjT0VwT3l1RmdQdTdycU9FQ0VQ?=
 =?utf-8?B?azJrN1dES1MrMTBPaVR1Q0YrRWlSYUxTeTlrQmhkby85Mnp6N3Q3ZVFaY1c2?=
 =?utf-8?B?dUVLOU1USS81ZEoyRzFKNVJ1emVMbHpuejYrT0I5SjluRVNvUXBPVEtlcXJS?=
 =?utf-8?B?U2RqRE9xSEUrK3hLNmVmL2hCUWwyU0tQdzJxaVZ2REZWT29jajZORDVwK1Fp?=
 =?utf-8?B?UFVHdTZ3dVNBMG9OekU3UGQzNG5OTE9zRlVFeGRhbC8vajk3dnRRcTZDTmZv?=
 =?utf-8?B?K3dxaU8yYTM1NkRiM04rcUluaDliUFVEOEQvZXhhZzVCWTc4RUswU2VpTmxm?=
 =?utf-8?B?L2pPOFpPVjVJY2FxeWdJd1ZtdlYrY3JVR0VYeFhVTzRCUURYa25mTTZXaXJz?=
 =?utf-8?B?TGptT3dMaStUL3hTNno4Q3lnS3Bod3M2T1dOd2dpNlBMeEllTHROL2VBLzdH?=
 =?utf-8?B?U3ZkSkYyWS9GZjVDUE5xMW5RMDBtbG9ML3RRb213eUJxdVdWVHF2eDJBSXkw?=
 =?utf-8?B?bDRiaUR1OG1kMzVYR1VMZUJaVFp6a21UOGozYkJRQmFQYU1uZTM2cm5Od2lV?=
 =?utf-8?B?UlhBbHJwcE9HbkVQRDcrTUZkN1RqMWNndHh1Nms3K2hsWXo0ZFV3eEZIeDZO?=
 =?utf-8?B?TEdITlZHSW00V3RKL0ZuSnNoTHVnbG5LaERsT1QzaFkrczAvbjJ1WUM3d3dX?=
 =?utf-8?B?TmJqY0FJRVZXVnRoSXVtWDJnbTgrVG5IQURXQUthVi9adnhXbXpScDBBQlZq?=
 =?utf-8?B?eVNlVlRGUnVRdHdTYzdCd01JVEhTdmgyQmE2Nk9VMmtWNENSSFdGVGFPbGlQ?=
 =?utf-8?B?c0ZBT3BVc0N5YU5ITU9YN1B6MHVVWXZtMEZlL21HRXdqcGc5Ulh2c2ZxNUx1?=
 =?utf-8?B?OVJhVkE5emJvZ0xjQlNUT2xtYVhWNXlNM0QrSzVCZ0ErRlg3T2lYRTgrbXBr?=
 =?utf-8?B?NHU3d2hiWWp2M1RGSlJMdm04K001SE83TzlYc1ZwYjllcy9YVm1YZmE5MVEx?=
 =?utf-8?B?dUxrelNobjdGOUdOLzNHU0ZsaUpZUVZZMUE0RzNRZVJLREc0SnhNQ1dueEhM?=
 =?utf-8?B?RlJGQlBxT1FlQlBabVpvOXpBV3ZnVktPaCsrWVFKNmVwZFloa2FWeDFwYklN?=
 =?utf-8?B?L01WN1NjSXc2b1ZjODUySWFHZlpwckRhRG4rVHE3UGhoVXl4VmRyT0xocCtn?=
 =?utf-8?B?V1ZnekpneE5iMk9JVFF2T2MrRFdUUGxzd3o3K2lwMnZLakcwdGxmTHVRUFd4?=
 =?utf-8?B?L1hvQlBvcXJ5am5BNFI5NmxlWFJNVnNtcTlCd0tyUTBqV0RUejNNUW9UL3Nq?=
 =?utf-8?Q?bygkP+2q3W1e/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 189d5b55-3466-4f7a-dd0b-08d97cf340ab
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 11:30:45.5377 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hPIQFCoiW2nYqh9yZJhGFbCwJe3Vd70+zTp7FCtYxgYP8RNcD35IwKi4yIKbcNlR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4390
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

Am 21.09.21 um 13:01 schrieb Matthew Auld:
> It covers more than just ttm_bo_type_sg usage, like with say dma-buf,
> since one other user is userptr in amdgpu, and in the future we might
> have some more. Hence EXTERNAL is likely a more suitable name.
>
> v2(Christian):
>    - Rename these to TTM_TT_FLAGS_*
>    - Fix up all the holes in the flag values
>
> Suggested-by: Christian König <christian.koenig@amd.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Christian König <christian.koenig@amd.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 10 +++++-----
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c |  6 +++---
>   drivers/gpu/drm/nouveau/nouveau_bo.c    |  4 ++--
>   drivers/gpu/drm/radeon/radeon_ttm.c     |  8 ++++----
>   drivers/gpu/drm/ttm/ttm_bo.c            |  4 ++--
>   drivers/gpu/drm/ttm/ttm_bo_util.c       |  4 ++--
>   drivers/gpu/drm/ttm/ttm_bo_vm.c         |  2 +-
>   drivers/gpu/drm/ttm/ttm_pool.c          |  2 +-
>   drivers/gpu/drm/ttm/ttm_tt.c            | 24 ++++++++++++------------
>   include/drm/ttm/ttm_device.h            |  2 +-
>   include/drm/ttm/ttm_tt.h                | 18 +++++++++---------
>   11 files changed, 42 insertions(+), 42 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 438377a89aa3..0cf94421665f 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -894,7 +894,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
>   			DRM_ERROR("failed to pin userptr\n");
>   			return r;
>   		}
> -	} else if (ttm->page_flags & TTM_PAGE_FLAG_SG) {
> +	} else if (ttm->page_flags & TTM_TT_FLAG_EXTERNAL) {
>   		if (!ttm->sg) {
>   			struct dma_buf_attachment *attach;
>   			struct sg_table *sgt;
> @@ -1130,7 +1130,7 @@ static int amdgpu_ttm_tt_populate(struct ttm_device *bdev,
>   		return 0;
>   	}
>   
> -	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
> +	if (ttm->page_flags & TTM_TT_FLAG_EXTERNAL)
>   		return 0;
>   
>   	ret = ttm_pool_alloc(&adev->mman.bdev.pool, ttm, ctx);
> @@ -1165,7 +1165,7 @@ static void amdgpu_ttm_tt_unpopulate(struct ttm_device *bdev,
>   		return;
>   	}
>   
> -	if (ttm->page_flags & TTM_PAGE_FLAG_SG)
> +	if (ttm->page_flags & TTM_TT_FLAG_EXTERNAL)
>   		return;
>   
>   	for (i = 0; i < ttm->num_pages; ++i)
> @@ -1198,8 +1198,8 @@ int amdgpu_ttm_tt_set_userptr(struct ttm_buffer_object *bo,
>   			return -ENOMEM;
>   	}
>   
> -	/* Set TTM_PAGE_FLAG_SG before populate but after create. */
> -	bo->ttm->page_flags |= TTM_PAGE_FLAG_SG;
> +	/* Set TTM_TT_FLAG_EXTERNAL before populate but after create. */
> +	bo->ttm->page_flags |= TTM_TT_FLAG_EXTERNAL;
>   
>   	gtt = (void *)bo->ttm;
>   	gtt->userptr = addr;
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 2f672f06b169..fd5b925b27c5 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -182,7 +182,7 @@ static struct ttm_tt *i915_ttm_tt_create(struct ttm_buffer_object *bo,
>   
>   	if (obj->flags & I915_BO_ALLOC_CPU_CLEAR &&
>   	    man->use_tt)
> -		page_flags |= TTM_PAGE_FLAG_ZERO_ALLOC;
> +		page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
>   
>   	ret = ttm_tt_init(&i915_tt->ttm, bo, page_flags,
>   			  i915_ttm_select_tt_caching(obj));
> @@ -546,7 +546,7 @@ static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
>   	}
>   
>   	/* Populate ttm with pages if needed. Typically system memory. */
> -	if (ttm && (dst_man->use_tt || (ttm->page_flags & TTM_PAGE_FLAG_SWAPPED))) {
> +	if (ttm && (dst_man->use_tt || (ttm->page_flags & TTM_TT_FLAG_SWAPPED))) {
>   		ret = ttm_tt_populate(bo->bdev, ttm, ctx);
>   		if (ret)
>   			return ret;
> @@ -557,7 +557,7 @@ static int i915_ttm_move(struct ttm_buffer_object *bo, bool evict,
>   		return PTR_ERR(dst_st);
>   
>   	clear = !cpu_maps_iomem(bo->resource) && (!ttm || !ttm_tt_is_populated(ttm));
> -	if (!(clear && ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC)))
> +	if (!(clear && ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC)))
>   		__i915_ttm_move(bo, clear, dst_mem, dst_st);
>   
>   	ttm_bo_move_sync_cleanup(bo, dst_mem);
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index d3b21d318b42..12b107acb6ee 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -1250,7 +1250,7 @@ nouveau_ttm_tt_populate(struct ttm_device *bdev,
>   	struct ttm_tt *ttm_dma = (void *)ttm;
>   	struct nouveau_drm *drm;
>   	struct device *dev;
> -	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
> +	bool slave = !!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL);
>   
>   	if (ttm_tt_is_populated(ttm))
>   		return 0;
> @@ -1273,7 +1273,7 @@ nouveau_ttm_tt_unpopulate(struct ttm_device *bdev,
>   {
>   	struct nouveau_drm *drm;
>   	struct device *dev;
> -	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
> +	bool slave = !!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL);
>   
>   	if (slave)
>   		return;
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 7793249bc549..11b21d605584 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -545,14 +545,14 @@ static int radeon_ttm_tt_populate(struct ttm_device *bdev,
>   {
>   	struct radeon_device *rdev = radeon_get_rdev(bdev);
>   	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(rdev, ttm);
> -	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
> +	bool slave = !!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL);
>   
>   	if (gtt && gtt->userptr) {
>   		ttm->sg = kzalloc(sizeof(struct sg_table), GFP_KERNEL);
>   		if (!ttm->sg)
>   			return -ENOMEM;
>   
> -		ttm->page_flags |= TTM_PAGE_FLAG_SG;
> +		ttm->page_flags |= TTM_TT_FLAG_EXTERNAL;
>   		return 0;
>   	}
>   
> @@ -569,13 +569,13 @@ static void radeon_ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm
>   {
>   	struct radeon_device *rdev = radeon_get_rdev(bdev);
>   	struct radeon_ttm_tt *gtt = radeon_ttm_tt_to_gtt(rdev, ttm);
> -	bool slave = !!(ttm->page_flags & TTM_PAGE_FLAG_SG);
> +	bool slave = !!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL);
>   
>   	radeon_ttm_tt_unbind(bdev, ttm);
>   
>   	if (gtt && gtt->userptr) {
>   		kfree(ttm->sg);
> -		ttm->page_flags &= ~TTM_PAGE_FLAG_SG;
> +		ttm->page_flags &= ~TTM_TT_FLAG_EXTERNAL;
>   		return;
>   	}
>   
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 3b22c0013dbf..d62b2013c367 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -1115,8 +1115,8 @@ int ttm_bo_swapout(struct ttm_buffer_object *bo, struct ttm_operation_ctx *ctx,
>   		return -EBUSY;
>   
>   	if (!bo->ttm || !ttm_tt_is_populated(bo->ttm) ||
> -	    bo->ttm->page_flags & TTM_PAGE_FLAG_SG ||
> -	    bo->ttm->page_flags & TTM_PAGE_FLAG_SWAPPED ||
> +	    bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL ||
> +	    bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED ||
>   	    !ttm_bo_get_unless_zero(bo)) {
>   		if (locked)
>   			dma_resv_unlock(bo->base.resv);
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index c893c3db2623..a342d701c91c 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -147,7 +147,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>   	bool clear;
>   	int ret = 0;
>   
> -	if (ttm && ((ttm->page_flags & TTM_PAGE_FLAG_SWAPPED) ||
> +	if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
>   		    dst_man->use_tt)) {
>   		ret = ttm_tt_populate(bdev, ttm, ctx);
>   		if (ret)
> @@ -169,7 +169,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object *bo,
>   	}
>   
>   	clear = src_iter->ops->maps_tt && (!ttm || !ttm_tt_is_populated(ttm));
> -	if (!(clear && ttm && !(ttm->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC)))
> +	if (!(clear && ttm && !(ttm->page_flags & TTM_TT_FLAG_ZERO_ALLOC)))
>   		ttm_move_memcpy(clear, dst_mem->num_pages, dst_iter, src_iter);
>   
>   	if (!src_iter->ops->maps_tt)
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> index 9a2119fe4bdd..950f4f132802 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
> @@ -162,7 +162,7 @@ vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>   	 * Refuse to fault imported pages. This should be handled
>   	 * (if at all) by redirecting mmap to the exporter.
>   	 */
> -	if (bo->ttm && (bo->ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> +	if (bo->ttm && (bo->ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
>   		dma_resv_unlock(bo->base.resv);
>   		return VM_FAULT_SIGBUS;
>   	}
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index c961a788b519..1bba0a0ed3f9 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -371,7 +371,7 @@ int ttm_pool_alloc(struct ttm_pool *pool, struct ttm_tt *tt,
>   	WARN_ON(!num_pages || ttm_tt_is_populated(tt));
>   	WARN_ON(dma_addr && !pool->dev);
>   
> -	if (tt->page_flags & TTM_PAGE_FLAG_ZERO_ALLOC)
> +	if (tt->page_flags & TTM_TT_FLAG_ZERO_ALLOC)
>   		gfp_flags |= __GFP_ZERO;
>   
>   	if (ctx->gfp_retry_mayfail)
> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
> index 980ecb079b2c..86f31fde6e35 100644
> --- a/drivers/gpu/drm/ttm/ttm_tt.c
> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
> @@ -68,12 +68,12 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc)
>   	switch (bo->type) {
>   	case ttm_bo_type_device:
>   		if (zero_alloc)
> -			page_flags |= TTM_PAGE_FLAG_ZERO_ALLOC;
> +			page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
>   		break;
>   	case ttm_bo_type_kernel:
>   		break;
>   	case ttm_bo_type_sg:
> -		page_flags |= TTM_PAGE_FLAG_SG;
> +		page_flags |= TTM_TT_FLAG_EXTERNAL;
>   		break;
>   	default:
>   		pr_err("Illegal buffer object type\n");
> @@ -156,7 +156,7 @@ EXPORT_SYMBOL(ttm_tt_init);
>   
>   void ttm_tt_fini(struct ttm_tt *ttm)
>   {
> -	WARN_ON(ttm->page_flags & TTM_PAGE_FLAG_PRIV_POPULATED);
> +	WARN_ON(ttm->page_flags & TTM_TT_FLAG_PRIV_POPULATED);
>   
>   	if (ttm->swap_storage)
>   		fput(ttm->swap_storage);
> @@ -178,7 +178,7 @@ int ttm_sg_tt_init(struct ttm_tt *ttm, struct ttm_buffer_object *bo,
>   
>   	ttm_tt_init_fields(ttm, bo, page_flags, caching);
>   
> -	if (page_flags & TTM_PAGE_FLAG_SG)
> +	if (page_flags & TTM_TT_FLAG_EXTERNAL)
>   		ret = ttm_sg_tt_alloc_page_directory(ttm);
>   	else
>   		ret = ttm_dma_tt_alloc_page_directory(ttm);
> @@ -224,7 +224,7 @@ int ttm_tt_swapin(struct ttm_tt *ttm)
>   
>   	fput(swap_storage);
>   	ttm->swap_storage = NULL;
> -	ttm->page_flags &= ~TTM_PAGE_FLAG_SWAPPED;
> +	ttm->page_flags &= ~TTM_TT_FLAG_SWAPPED;
>   
>   	return 0;
>   
> @@ -279,7 +279,7 @@ int ttm_tt_swapout(struct ttm_device *bdev, struct ttm_tt *ttm,
>   
>   	ttm_tt_unpopulate(bdev, ttm);
>   	ttm->swap_storage = swap_storage;
> -	ttm->page_flags |= TTM_PAGE_FLAG_SWAPPED;
> +	ttm->page_flags |= TTM_TT_FLAG_SWAPPED;
>   
>   	return ttm->num_pages;
>   
> @@ -300,7 +300,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   	if (ttm_tt_is_populated(ttm))
>   		return 0;
>   
> -	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> +	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
>   		atomic_long_add(ttm->num_pages, &ttm_pages_allocated);
>   		if (bdev->pool.use_dma32)
>   			atomic_long_add(ttm->num_pages,
> @@ -325,8 +325,8 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   	if (ret)
>   		goto error;
>   
> -	ttm->page_flags |= TTM_PAGE_FLAG_PRIV_POPULATED;
> -	if (unlikely(ttm->page_flags & TTM_PAGE_FLAG_SWAPPED)) {
> +	ttm->page_flags |= TTM_TT_FLAG_PRIV_POPULATED;
> +	if (unlikely(ttm->page_flags & TTM_TT_FLAG_SWAPPED)) {
>   		ret = ttm_tt_swapin(ttm);
>   		if (unlikely(ret != 0)) {
>   			ttm_tt_unpopulate(bdev, ttm);
> @@ -337,7 +337,7 @@ int ttm_tt_populate(struct ttm_device *bdev,
>   	return 0;
>   
>   error:
> -	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> +	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
>   		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>   		if (bdev->pool.use_dma32)
>   			atomic_long_sub(ttm->num_pages,
> @@ -357,14 +357,14 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm)
>   	else
>   		ttm_pool_free(&bdev->pool, ttm);
>   
> -	if (!(ttm->page_flags & TTM_PAGE_FLAG_SG)) {
> +	if (!(ttm->page_flags & TTM_TT_FLAG_EXTERNAL)) {
>   		atomic_long_sub(ttm->num_pages, &ttm_pages_allocated);
>   		if (bdev->pool.use_dma32)
>   			atomic_long_sub(ttm->num_pages,
>   					&ttm_dma32_pages_allocated);
>   	}
>   
> -	ttm->page_flags &= ~TTM_PAGE_FLAG_PRIV_POPULATED;
> +	ttm->page_flags &= ~TTM_TT_FLAG_PRIV_POPULATED;
>   }
>   
>   #ifdef CONFIG_DEBUG_FS
> diff --git a/include/drm/ttm/ttm_device.h b/include/drm/ttm/ttm_device.h
> index cbe03d45e883..0a4ddec78d8f 100644
> --- a/include/drm/ttm/ttm_device.h
> +++ b/include/drm/ttm/ttm_device.h
> @@ -65,7 +65,7 @@ struct ttm_device_funcs {
>   	 * ttm_tt_create
>   	 *
>   	 * @bo: The buffer object to create the ttm for.
> -	 * @page_flags: Page flags as identified by TTM_PAGE_FLAG_XX flags.
> +	 * @page_flags: Page flags as identified by TTM_TT_FLAG_XX flags.
>   	 *
>   	 * Create a struct ttm_tt to back data with system memory pages.
>   	 * No pages are actually allocated.
> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
> index 842ce756213c..b023cd58ff38 100644
> --- a/include/drm/ttm/ttm_tt.h
> +++ b/include/drm/ttm/ttm_tt.h
> @@ -38,17 +38,17 @@ struct ttm_resource;
>   struct ttm_buffer_object;
>   struct ttm_operation_ctx;
>   
> -#define TTM_PAGE_FLAG_SWAPPED         (1 << 4)
> -#define TTM_PAGE_FLAG_ZERO_ALLOC      (1 << 6)
> -#define TTM_PAGE_FLAG_SG              (1 << 8)
> +#define TTM_TT_FLAG_SWAPPED	(1 << 0)
> +#define TTM_TT_FLAG_ZERO_ALLOC	(1 << 1)
> +#define TTM_TT_FLAG_EXTERNAL	(1 << 2)
>   
> -#define TTM_PAGE_FLAG_PRIV_POPULATED  (1 << 31)
> +#define TTM_TT_FLAG_PRIV_POPULATED  (1 << 31)
>   
>   /**
>    * struct ttm_tt
>    *
>    * @pages: Array of pages backing the data.
> - * @page_flags: see TTM_PAGE_FLAG_*
> + * @page_flags: see TTM_TT_FLAG_*
>    * @num_pages: Number of pages in the page array.
>    * @sg: for SG objects via dma-buf
>    * @dma_address: The DMA (bus) addresses of the pages
> @@ -84,7 +84,7 @@ struct ttm_kmap_iter_tt {
>   
>   static inline bool ttm_tt_is_populated(struct ttm_tt *tt)
>   {
> -	return tt->page_flags & TTM_PAGE_FLAG_PRIV_POPULATED;
> +	return tt->page_flags & TTM_TT_FLAG_PRIV_POPULATED;
>   }
>   
>   /**
> @@ -103,7 +103,7 @@ int ttm_tt_create(struct ttm_buffer_object *bo, bool zero_alloc);
>    *
>    * @ttm: The struct ttm_tt.
>    * @bo: The buffer object we create the ttm for.
> - * @page_flags: Page flags as identified by TTM_PAGE_FLAG_XX flags.
> + * @page_flags: Page flags as identified by TTM_TT_FLAG_XX flags.
>    * @caching: the desired caching state of the pages
>    *
>    * Create a struct ttm_tt to back data with system memory pages.
> @@ -178,7 +178,7 @@ void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt *ttm);
>    */
>   static inline void ttm_tt_mark_for_clear(struct ttm_tt *ttm)
>   {
> -	ttm->page_flags |= TTM_PAGE_FLAG_ZERO_ALLOC;
> +	ttm->page_flags |= TTM_TT_FLAG_ZERO_ALLOC;
>   }
>   
>   void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages);
> @@ -194,7 +194,7 @@ struct ttm_kmap_iter *ttm_kmap_iter_tt_init(struct ttm_kmap_iter_tt *iter_tt,
>    *
>    * @bo: Buffer object we allocate the ttm for.
>    * @bridge: The agp bridge this device is sitting on.
> - * @page_flags: Page flags as identified by TTM_PAGE_FLAG_XX flags.
> + * @page_flags: Page flags as identified by TTM_TT_FLAG_XX flags.
>    *
>    *
>    * Create a TTM backend that uses the indicated AGP bridge as an aperture

