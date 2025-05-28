Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE5BAC6FF6
	for <lists+dri-devel@lfdr.de>; Wed, 28 May 2025 19:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D04C10E08B;
	Wed, 28 May 2025 17:51:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FTAptVQL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2052.outbound.protection.outlook.com [40.107.95.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3130810E08B
 for <dri-devel@lists.freedesktop.org>; Wed, 28 May 2025 17:51:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FV21wbuiGXQGEKlWR4PY9JqcW4ckgwEq0f89Fi261ZWEYvatwLhAkE8gzN8p+FYBDEiNdNrA5XQBysqx1v7oagX/l8Ohc8uKTT7KVhepfu65Yj6fGzr2gCP/iCOYoF8SRPYeJBG6EjqUXdepNRhlpudHKW75Ll6LFS4w6FHqvqx4K6Ca/EC2daJfeohFHXJfKKCnBm6q1kmP0NVtPeZtdciRNGYa/8onEK+r2m/tpb8l6YcuAcYcHmOWo0f7ezwdHWYTxknENtRKELggTZnE5qU5iOM8+mG+Iqd3lnO4IJyy9jecFh9kZvrPPCmYv1xaNB3mDqSA6Zys0M+ttnpueA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VfzyGlIZ3hSCViDHKXrPJyLAEwxTx98hYvSFrX+DqYc=;
 b=EMLLf5jc5pKeLNs+85nJF8bQP2plRRcR0nvl2TOJLS/oiR4RUPLQFe5oT9J+cPM68JxVm2dyyCVbFpxNJ/Pq0wOZPgrVPc8WD6wc6ZEsK9ZDwdxXU0QRBsePzRdc6cvmxPL4TaTyf8sakGyS10uGmg/rlGTvT4P744YrWEmmqcH1tKqBmKXeGWxX8EjphOve96hNqDYxF3batX0XyzaKeLn3pO83K1Vouu3e1qeIVBb8O6G4JI/RH1LoYsdb+hhpDU1I1XvxPSBXSbe4rw9KX6/w0Ag3uCe3i6P2uTp+odPWfa7E6XHmuXGr3RXw13/FuDdms/dJAS7hQw+Q4yT+3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VfzyGlIZ3hSCViDHKXrPJyLAEwxTx98hYvSFrX+DqYc=;
 b=FTAptVQLAX5kjLYemNFIygVJIGR96hn+2+nj012HRJhWTQDeAhC2S719J5qoCO87p2494MtDGRt7UFmNdVejmci42jIznTxd0P2V+SqPrcN1xPgsDUcnVy5NTK+OkWKS/COP2ozSMAGq0Zn0IMecC7ZCWuWA2TCiGqbOtQK2oI8=
Received: from SA1PR02CA0013.namprd02.prod.outlook.com (2603:10b6:806:2cf::11)
 by IA0PR12MB8746.namprd12.prod.outlook.com (2603:10b6:208:490::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Wed, 28 May
 2025 17:50:52 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:806:2cf:cafe::67) by SA1PR02CA0013.outlook.office365.com
 (2603:10b6:806:2cf::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.19 via Frontend Transport; Wed,
 28 May 2025 17:50:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Wed, 28 May 2025 17:50:51 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 28 May
 2025 12:50:51 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 28 May 2025 12:50:50 -0500
Message-ID: <26b8a17e-500d-d89d-de9f-c17108a6831d@amd.com>
Date: Wed, 28 May 2025 10:50:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Use dma_resv_lock() instead of a custom mutex
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <jeff.hugo@oss.qualcomm.com>, <stable@vger.kernel.org>
References: <20250528154325.500684-1-jacek.lawrynowicz@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250528154325.500684-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|IA0PR12MB8746:EE_
X-MS-Office365-Filtering-Correlation-Id: 17dfe04c-9fe1-48d4-7567-08dd9e102fde
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cHdKMmpNOWRoaytvUjQyNWE0UnNrSHpDK3h1UTZhcERTbTM2bTFuRnVkTEU1?=
 =?utf-8?B?cVVOZ2tCVDZuQXM5a3lJTStqdDdKTkUxSTk5RmFWWHZUWlZrQ1JJalFTQzF4?=
 =?utf-8?B?TFFiN1JYS1NVaDFiZWw4b2tzVnB2Z1k2eW9jTVhDVlYvMzBuTlNhaXJ6YlF0?=
 =?utf-8?B?R1FudXpUWEpvNVZNcFd6QmNabDlaVE94ckswUDE3aEFsbmdDSUswbzZhZHl2?=
 =?utf-8?B?cmYrSW9MYlBhenZkVXovM3duR2xKMjdvRGk0OXhyM1RFVVB2WXA0MzcyNHdp?=
 =?utf-8?B?NlJrSy9IQnpBZzA2dGhXUVhVSll3T2w2NUVEaThCZWlaQVltaUJEeXpQZTBk?=
 =?utf-8?B?M2RyazFybkRLc0Y2WXVrZk1BcCsrUWpDWGg1ajQ0alZnMU5Da0JnQ1ZiRmt6?=
 =?utf-8?B?cDQ2dkkrWTBSZmVMYnFtQW50cjQrNEtxU2ZxaW40d0JiTGFYUXYydmdDZllM?=
 =?utf-8?B?Q3g4R0xGQjU4R1JZVDB4ZEZwR1dWc3pJOWt4NzNKVXlQTG1Pb2VEUWJTM0Jk?=
 =?utf-8?B?c0M5Ky9nbEFRWGpXdnhPdmhiT243VVQwVGVSVEFGTWxEeVh2YUhlakhic05k?=
 =?utf-8?B?SFJZMmM4bVhESHR2anNWOEN1ZE9qSStaTVR2MXdKUm1Ra2dpUGFCSDdZZzJp?=
 =?utf-8?B?WUgvUjNTdVkzWktjeEtIRnR2Skl4V1JZSGNVdktGRGJ1QmM5OUpEM095WmhD?=
 =?utf-8?B?R3UzWXV2QldTVjltVVVJdEhVYUFEYWV0S0RXdlhnYnZWcmxqazdtYWFpSVMy?=
 =?utf-8?B?ZHNSQ1R5TktFbnN6K04wYksvTmVSdFhHM0NTa0Jid0YrK0RhUVlPbmtjTUFm?=
 =?utf-8?B?dFhRUi9LMElEcytzNGFpODd1WDBxNnhyRm5wM0IwZndHbCtEWlh5dE1hRk1t?=
 =?utf-8?B?OFViN09vQ0N0anYwT1RCeDFjUUVYL3ZQc1pyOG8zdXlZZzVwMkNDSHVTeTA5?=
 =?utf-8?B?TXFWaUVSeDA0WUxCdUFkRnZ4K0NiWjczMXNDby9Lc1p6ekQrWkJuUEhxYnpW?=
 =?utf-8?B?eEtEbXZ0eTZCZDNlZnBLN2RzR1lzNFg5NkU2UnJURGs5d05yZmIwWHUraHYy?=
 =?utf-8?B?ZEtUNVlFd3N2d1R3MmQwZGVKenN1bFhKS3FyMG0yWHo5VHVNamFqU3RJOEdV?=
 =?utf-8?B?cnlJOW9pLzBOL0RKenR1M0lFQk5ZR1N5VUR1TkVUQzM3QzFqdWppN3JETHhl?=
 =?utf-8?B?cHZiOWVqeGhvN1lseG5hMjZpamVHMTZEa2Qyd1M1RFlmUkpBM2FCUFFlcjBT?=
 =?utf-8?B?a0l6Rjl2R1JVbWM0cGFhTmx6dHp1WDI4MWFiS210Ni9PRVM5NHdKb0d6Nita?=
 =?utf-8?B?UEdTbFJtZnNoVFY2eXBmenU2OE5iZ3luUElCd1Uvc2tia3BTV0xHOVBzcGg3?=
 =?utf-8?B?SUJVWmRDODNVb1JKY3d6TXBHakxzTzNKOXQzMzB5YlgyRHRkRzV4cGt5SzRK?=
 =?utf-8?B?RXBHU3hRY3VUem1mUVQ5bWdQTkFrVWRsOWQzWWNJRjZWdGRyR1dpenNNd3lh?=
 =?utf-8?B?UEZEeXBFNHZvRmhEVFlwNDNSY2orQXZGVGRPUFdIRkhQZ3FYQmFRTjY5SW9n?=
 =?utf-8?B?M1d3ZXd2MGZVQVNXKzhSNnNFdWZWSVltNGtGbU1HUFZFVGY3K1EwWXg2R0x0?=
 =?utf-8?B?YVEwRnp4Q25yNjhpZDVUV0lDVFpyQXg4VnQvQi9EWktSdzAweDZMY1l6YTM0?=
 =?utf-8?B?ZTV4K1FoOUgyK2lYUGMxTUxDZjJMVE9WUnQzUWFDVU5peHY1a0lDUjR3M1Fx?=
 =?utf-8?B?bW9LY0FsVG5sc25Ja2lnTDRBOGRiVVZ4UUFaaXJDSHQyaGUrZkh2Z0Q5QWpo?=
 =?utf-8?B?dXBlMitnb09BLzQ4a2hiMmZia1JmZlgrcEJpck9xSEFKV0ZTM3NkWkh4SWRu?=
 =?utf-8?B?RmpxWDUwc0VsYTFLVmxIVldHQUl5N1lGZEpFRHZvbU5JS2hieUJYS21ieDRU?=
 =?utf-8?B?QkVnQm1RNk1IL1M4Z3ExbEdvYjJDUjhCdTJMaUozQnhWMDJRUHRPaFYvd3E1?=
 =?utf-8?B?M3d0VjcvRWVmcWlkbTV5L0M4TDFCY1E3ejE5MlIzVFdISXZsOTBJL2FkaGd5?=
 =?utf-8?Q?D/lVYR?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2025 17:50:51.5526 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17dfe04c-9fe1-48d4-7567-08dd9e102fde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8746
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


On 5/28/25 08:43, Jacek Lawrynowicz wrote:
> This fixes a potential race conditions in:
>   - ivpu_bo_unbind_locked() where we modified the shmem->sgt without
>     holding the dma_resv_lock().
>   - ivpu_bo_print_info() where we read the shmem->pages without
>     holding the dma_resv_lock().
>
> Using dma_resv_lock() also protects against future syncronisation
> issues that may arise when accessing drm_gem_shmem_object or
> drm_gem_object members.
>
> Fixes: 42328003ecb6 ("accel/ivpu: Refactor BO creation functions")
> Cc: <stable@vger.kernel.org> # v6.9+
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_gem.c | 63 +++++++++++++++++++----------------
>   drivers/accel/ivpu/ivpu_gem.h |  1 -
>   2 files changed, 34 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index c193a80241f5f..5908268ca45e9 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -33,6 +33,16 @@ static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo, con
>   		 (bool)bo->base.base.import_attach);
>   }
>   
> +static inline int ivpu_bo_lock(struct ivpu_bo *bo)
> +{
> +	return dma_resv_lock(bo->base.base.resv, NULL);
> +}
> +
> +static inline void ivpu_bo_unlock(struct ivpu_bo *bo)
> +{
> +	dma_resv_unlock(bo->base.base.resv);
> +}
> +
>   /*
>    * ivpu_bo_pin() - pin the backing physical pages and map them to VPU.
>    *
> @@ -43,22 +53,22 @@ static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo, con
>   int __must_check ivpu_bo_pin(struct ivpu_bo *bo)
>   {
>   	struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
> +	struct sg_table *sgt;
>   	int ret = 0;
>   
> -	mutex_lock(&bo->lock);
> -
>   	ivpu_dbg_bo(vdev, bo, "pin");
> -	drm_WARN_ON(&vdev->drm, !bo->ctx);
>   
> -	if (!bo->mmu_mapped) {
> -		struct sg_table *sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
> +	sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
> +	if (IS_ERR(sgt)) {
> +		ret = PTR_ERR(sgt);
> +		ivpu_err(vdev, "Failed to map BO in IOMMU: %d\n", ret);
> +		return ret;
> +	}
>   
> -		if (IS_ERR(sgt)) {
> -			ret = PTR_ERR(sgt);
> -			ivpu_err(vdev, "Failed to map BO in IOMMU: %d\n", ret);
> -			goto unlock;
> -		}
> +	ivpu_bo_lock(bo);
>   
> +	if (!bo->mmu_mapped) {
> +		drm_WARN_ON(&vdev->drm, !bo->ctx);
>   		ret = ivpu_mmu_context_map_sgt(vdev, bo->ctx, bo->vpu_addr, sgt,
>   					       ivpu_bo_is_snooped(bo));
>   		if (ret) {
> @@ -69,7 +79,7 @@ int __must_check ivpu_bo_pin(struct ivpu_bo *bo)
>   	}
>   
>   unlock:
> -	mutex_unlock(&bo->lock);
> +	ivpu_bo_unlock(bo);
>   
>   	return ret;
>   }
> @@ -84,7 +94,7 @@ ivpu_bo_alloc_vpu_addr(struct ivpu_bo *bo, struct ivpu_mmu_context *ctx,
>   	if (!drm_dev_enter(&vdev->drm, &idx))
>   		return -ENODEV;
>   
> -	mutex_lock(&bo->lock);
> +	ivpu_bo_lock(bo);
>   
>   	ret = ivpu_mmu_context_insert_node(ctx, range, ivpu_bo_size(bo), &bo->mm_node);
>   	if (!ret) {
> @@ -94,7 +104,7 @@ ivpu_bo_alloc_vpu_addr(struct ivpu_bo *bo, struct ivpu_mmu_context *ctx,
>   		ivpu_err(vdev, "Failed to add BO to context %u: %d\n", ctx->id, ret);
>   	}
>   
> -	mutex_unlock(&bo->lock);
> +	ivpu_bo_unlock(bo);
>   
>   	drm_dev_exit(idx);
>   
> @@ -105,7 +115,7 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
>   {
>   	struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
>   
> -	lockdep_assert(lockdep_is_held(&bo->lock) || !kref_read(&bo->base.base.refcount));
> +	lockdep_assert(dma_resv_held(bo->base.base.resv) || !kref_read(&bo->base.base.refcount));
>   
>   	if (bo->mmu_mapped) {
>   		drm_WARN_ON(&vdev->drm, !bo->ctx);
> @@ -123,14 +133,12 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
>   	if (bo->base.base.import_attach)
>   		return;
>   
> -	dma_resv_lock(bo->base.base.resv, NULL);
>   	if (bo->base.sgt) {
>   		dma_unmap_sgtable(vdev->drm.dev, bo->base.sgt, DMA_BIDIRECTIONAL, 0);
>   		sg_free_table(bo->base.sgt);
>   		kfree(bo->base.sgt);
>   		bo->base.sgt = NULL;

Maybe not directly modify sgt but use drm_gem_shmem_purge()?

Will it potentially memleak without calling drm_gem_shmem_put_pages()? 
(if the bo is mmap, vmap etc)


Thanks,

Lizhi

>   	}
> -	dma_resv_unlock(bo->base.base.resv);
>   }
>   
>   void ivpu_bo_unbind_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx)
> @@ -142,12 +150,12 @@ void ivpu_bo_unbind_all_bos_from_context(struct ivpu_device *vdev, struct ivpu_m
>   
>   	mutex_lock(&vdev->bo_list_lock);
>   	list_for_each_entry(bo, &vdev->bo_list, bo_list_node) {
> -		mutex_lock(&bo->lock);
> +		ivpu_bo_lock(bo);
>   		if (bo->ctx == ctx) {
>   			ivpu_dbg_bo(vdev, bo, "unbind");
>   			ivpu_bo_unbind_locked(bo);
>   		}
> -		mutex_unlock(&bo->lock);
> +		ivpu_bo_unlock(bo);
>   	}
>   	mutex_unlock(&vdev->bo_list_lock);
>   }
> @@ -167,7 +175,6 @@ struct drm_gem_object *ivpu_gem_create_object(struct drm_device *dev, size_t siz
>   	bo->base.pages_mark_dirty_on_put = true; /* VPU can dirty a BO anytime */
>   
>   	INIT_LIST_HEAD(&bo->bo_list_node);
> -	mutex_init(&bo->lock);
>   
>   	return &bo->base.base;
>   }
> @@ -286,8 +293,6 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
>   	drm_WARN_ON(&vdev->drm, bo->mmu_mapped);
>   	drm_WARN_ON(&vdev->drm, bo->ctx);
>   
> -	mutex_destroy(&bo->lock);
> -
>   	drm_WARN_ON(obj->dev, bo->base.pages_use_count > 1);
>   	drm_gem_shmem_free(&bo->base);
>   }
> @@ -370,9 +375,9 @@ ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
>   		goto err_put;
>   
>   	if (flags & DRM_IVPU_BO_MAPPABLE) {
> -		dma_resv_lock(bo->base.base.resv, NULL);
> +		ivpu_bo_lock(bo);
>   		ret = drm_gem_shmem_vmap(&bo->base, &map);
> -		dma_resv_unlock(bo->base.base.resv);
> +		ivpu_bo_unlock(bo);
>   
>   		if (ret)
>   			goto err_put;
> @@ -395,9 +400,9 @@ void ivpu_bo_free(struct ivpu_bo *bo)
>   	struct iosys_map map = IOSYS_MAP_INIT_VADDR(bo->base.vaddr);
>   
>   	if (bo->flags & DRM_IVPU_BO_MAPPABLE) {
> -		dma_resv_lock(bo->base.base.resv, NULL);
> +		ivpu_bo_lock(bo);
>   		drm_gem_shmem_vunmap(&bo->base, &map);
> -		dma_resv_unlock(bo->base.base.resv);
> +		ivpu_bo_unlock(bo);
>   	}
>   
>   	drm_gem_object_put(&bo->base.base);
> @@ -416,12 +421,12 @@ int ivpu_bo_info_ioctl(struct drm_device *dev, void *data, struct drm_file *file
>   
>   	bo = to_ivpu_bo(obj);
>   
> -	mutex_lock(&bo->lock);
> +	ivpu_bo_lock(bo);
>   	args->flags = bo->flags;
>   	args->mmap_offset = drm_vma_node_offset_addr(&obj->vma_node);
>   	args->vpu_addr = bo->vpu_addr;
>   	args->size = obj->size;
> -	mutex_unlock(&bo->lock);
> +	ivpu_bo_unlock(bo);
>   
>   	drm_gem_object_put(obj);
>   	return ret;
> @@ -458,7 +463,7 @@ int ivpu_bo_wait_ioctl(struct drm_device *dev, void *data, struct drm_file *file
>   
>   static void ivpu_bo_print_info(struct ivpu_bo *bo, struct drm_printer *p)
>   {
> -	mutex_lock(&bo->lock);
> +	ivpu_bo_lock(bo);
>   
>   	drm_printf(p, "%-9p %-3u 0x%-12llx %-10lu 0x%-8x %-4u",
>   		   bo, bo->ctx_id, bo->vpu_addr, bo->base.base.size,
> @@ -475,7 +480,7 @@ static void ivpu_bo_print_info(struct ivpu_bo *bo, struct drm_printer *p)
>   
>   	drm_printf(p, "\n");
>   
> -	mutex_unlock(&bo->lock);
> +	ivpu_bo_unlock(bo);
>   }
>   
>   void ivpu_bo_list(struct drm_device *dev, struct drm_printer *p)
> diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
> index 0c93118c85bd3..aa8ff14f7aae1 100644
> --- a/drivers/accel/ivpu/ivpu_gem.h
> +++ b/drivers/accel/ivpu/ivpu_gem.h
> @@ -17,7 +17,6 @@ struct ivpu_bo {
>   	struct list_head bo_list_node;
>   	struct drm_mm_node mm_node;
>   
> -	struct mutex lock; /* Protects: ctx, mmu_mapped, vpu_addr */
>   	u64 vpu_addr;
>   	u32 flags;
>   	u32 job_status; /* Valid only for command buffer */
