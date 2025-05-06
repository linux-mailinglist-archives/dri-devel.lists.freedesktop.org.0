Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C54AAC97F
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 17:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88C8710E032;
	Tue,  6 May 2025 15:28:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3ViS0R0r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2083.outbound.protection.outlook.com [40.107.243.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A06010E032
 for <dri-devel@lists.freedesktop.org>; Tue,  6 May 2025 15:28:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zJAY8pGC+bJb2iqPNkQrK/e87GleGWaCu0oe7mXN7QBNY+zxIAIdFdJetJnK1ginnVfx4S07uNZqVQJ+Z/MGL6Ktmk2FFovyO+tlmrp18cx4bHl+rzZd3sEdWoVrEz17ztxW8TQ/nyAJVOlLiqeAELORLR7JaETNt4sgJzur/jAoLgkysTT2PcMWisCVZkEi7IN97x0F7K/HiKxvzOOI6H024P/Kk9JJIR4U3zinmNJur1QGeQqG+/lca5sCVn0PQY3eBZZ0zffH37QjGkdooa4xJCjXvjlG7T+G+E36qGRK/hRzPNw5VLDwaqSPmgVo2V1taU56/T4WxcJmRhKDNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDXBP7V9qt9ODM4ezPfUc3cEwBVKclch7/6IDjVMfNE=;
 b=b54j8c731D4SrcHwtzCeCgfojZMN9RXoY7V475kfLXZnWWZWFKx06bEI2C2ON+wgXwXRZcvGpBlAtVX0MLsA1/VOUfDdgIQsAf19XEUXH04U7TePKPkZhCvw5Na9f6fIEfHzm0QZIyfyEXdhMgSXb5HKZ7zHt9txmSZ3F8fgtOIdtT/aHvgHMTJqfPp72nEc3aL+HKcjdEeKo7sgroTdpb6h/QvpCjJt4qCC/b6s/sTrOglYWnyEZ3K8qOmIIdt9WK/k496PfGFNELlR+eabBqBNTxTO8FbUpyjln3WHvWnYevvafxXfFkknZz2CwAf3i8AiE87avBA8KN8/FTh5nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDXBP7V9qt9ODM4ezPfUc3cEwBVKclch7/6IDjVMfNE=;
 b=3ViS0R0r3X9xcCFxiIiueJdsgH/8vtcGhLxHvmcSUGXjhyLF/bH047BNXyFH+UnHaIa/5DSz1GUNnA2ufkKEFp7EN3nyE8QSVRiUz9VAScrQjvqEI4+8+Y3YYoTjt7+uH+l3yUvLEqMgE1FYrGtKCo4lKmb74HMlThiW4/4DJ/g=
Received: from BLAPR03CA0013.namprd03.prod.outlook.com (2603:10b6:208:32b::18)
 by SA5PPF0EB7D076B.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8c5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Tue, 6 May
 2025 15:28:39 +0000
Received: from BL02EPF0002992B.namprd02.prod.outlook.com
 (2603:10b6:208:32b:cafe::4a) by BLAPR03CA0013.outlook.office365.com
 (2603:10b6:208:32b::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Tue,
 6 May 2025 15:28:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF0002992B.mail.protection.outlook.com (10.167.249.56) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 15:28:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 May
 2025 10:28:38 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 6 May 2025 10:28:37 -0500
Message-ID: <351a1bba-0b2e-a4bf-f2f6-50b1810cda95@amd.com>
Date: Tue, 6 May 2025 08:28:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Improve buffer object logging
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <jeff.hugo@oss.qualcomm.com>, <stable@vger.kernel.org>
References: <20250506091303.262034-1-jacek.lawrynowicz@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20250506091303.262034-1-jacek.lawrynowicz@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0002992B:EE_|SA5PPF0EB7D076B:EE_
X-MS-Office365-Filtering-Correlation-Id: 47f70373-1010-4844-5a15-08dd8cb2acd5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TjJ6ekc3clNNVTd0Y3BicVdSMTg4ZDBMR3Y1TE1rZVZKM3E5bnZHRkl4N2Fr?=
 =?utf-8?B?VDl1bUtVRDZSUU1TSXlQQXc1TktLNkJBZ0t5V09OWnJOMVZkRzJLZWdUZ3o4?=
 =?utf-8?B?ckpKa1g1WWpXdHNDZDI0Kzh2QWFmVGYxamR4STBRRWdyRGVhQTdoWnp1RXRQ?=
 =?utf-8?B?dXlNcjdEWEZmY0FSc2RJU2ZaaFJWU1hVTTh5RDBJWGgxZU1ZaDhxWllWTWxF?=
 =?utf-8?B?WHJxYmcvRzV5a3F6RVhkeXg2NUl0SlVNTTc3bmc2Q3FITHJoNUtaRXFJenBw?=
 =?utf-8?B?U3IxQ3RDOXBIWHlXRkVIVzFiUXB6MFBuakpPRHdscUFwdjgwV1NOOGRGZHVp?=
 =?utf-8?B?TSs5R2xTdnlFSnpncEY2d2JxRzdCcGtlU2JFbVJZYXN6di9MK0lucS85T3Bj?=
 =?utf-8?B?bU9tZVhXMTVVVTFPN2JHSjJ2ekxyTlV6VFZVY2RMUzV1RVBDaVUza1NQNlFO?=
 =?utf-8?B?eXZDL1FLZ3NYeXZtUnBPTnlWcGRnWnVqblRzdDN4YzhGSDNqN05DbktpRG5w?=
 =?utf-8?B?TDQveE5wQStTNjlDTlhlUStrZ1ByakdnTlJTRnJRVUM2YWF6WEwvaWdmVWZq?=
 =?utf-8?B?NWQ0K3dzaTJHVGJ3OWRRaVdDWlk5L0EyRWw2Q0tSMEFwUUp0Zld2Mjc3S21Q?=
 =?utf-8?B?RzNWOW5NQU5oVEc1VWZKZHJxV21XaEZTTkZOanlTaFhjb2N5NEd4ME1GTHpY?=
 =?utf-8?B?L1l1UjJzZzh3U0htODhEU0hOSGhxVG9wV2NOK0pRMTI1dGNzQ1RPTXp6dWdX?=
 =?utf-8?B?cDNpTDRmYjlyWUhzb2hSMklLZGdKMlpISTAxbWRhS0NaMWVBYVB0S2pvMG9y?=
 =?utf-8?B?N0xNdmhKS1lhMThTQW12dVZlbVd2cnhKWUpaRE45TXorQmNYcEFvM2dDVWxu?=
 =?utf-8?B?RjR0YUV1Vk9JWnd3R3pmUGdQVnFTdXNKUktyVmRzZXZPODAwV0VKOURoVEpF?=
 =?utf-8?B?RnpyOTllRjRUNHVqQjVHNXAxZjlzVFJxNC9sT3hCSzRTcnFweDNxMFE1N0FV?=
 =?utf-8?B?bDdwU1Z6NkZ2alBnUEowaTRwZ1VaL0JudnF6REYvdER3SXJNRnR2cUJ0MExi?=
 =?utf-8?B?MWdCeUJFZ1NoSGxkVUpjRGpxdk9SWjFoQkg3cmNNVU1QbFJaQ3EwejNyNVpx?=
 =?utf-8?B?cml3UUwrV2JTcENPdjlPVzhHK2pVRXR6N3dtNzFTYjFEMDdkM1Z0SllJbTUr?=
 =?utf-8?B?bTZBZlQ4QWNsbjJROXpoZFl4Z0RyQ2tZL3Z0bTNPK294NVlCdEVuaTVKNzVT?=
 =?utf-8?B?UHVpQjljd094aW1MRzR3T1Z0ZXRFT2pqS2JwZUJYdTVaL0QvSDNxZDRPQjlU?=
 =?utf-8?B?SEdXQXVycHo4NVFYdzN1d0FjTVo1ZlZzOHRJT0V3bUxhR25pbExNWHZiRG9V?=
 =?utf-8?B?MUdybTluRFNwb3dES1MwNkNqa1VaQW9JT0dkUGVFY0dwVWV5R3lSYnB1cEQ5?=
 =?utf-8?B?ZE5NK2xMQVl2ZlhPUmRubHI3UWdWQXJuVDFmeHZFOG10OGRRWWVzZEc2aHgw?=
 =?utf-8?B?TDVRUVZxSEM1UEIyTkVUdGRRNXhmd3BpRzdlY1Y2VHU1RGRrVnR6cEJtVXBM?=
 =?utf-8?B?YU0wSzlWNU1KLzJFL004bkVIQmJITlppNENXK1RGYlpSeXdMYzc1ZG9Lc2ha?=
 =?utf-8?B?eWh2aUY4M05ta3J5YkFtU1RoVEN4WklpVFZ1Ly9HVnN5WWxHOXFOYjVlMFBN?=
 =?utf-8?B?SzA2bG9aZEFNWWd6RzBITlk3dXFDUEdZVlVhcWJ4S2V5NGsrdWk2M2F4LytO?=
 =?utf-8?B?NWoxbGtaVzl6U3FkOVIzVW1ZQmo5N2ZSanBoRXlTT3J3RnB0WmYzWFdWYWN3?=
 =?utf-8?B?YmRwbkxEN0E0dWg3TmlYS0VmRGxJdkpMNjkwK3F2b3F4aktJaGxQajkwRE1B?=
 =?utf-8?B?TFdoaytnenY5VTZadEZvRUZrNmp5eERuMjhSZEhNTitVTHREL1Zic05NWGR5?=
 =?utf-8?B?V29zbGJWR3Z1MXVxeTNLNU5JZXFoSGpTTnhzc0FQYXN3Y0lBKzlKYUxJVWVX?=
 =?utf-8?B?Rk1Rc1RUc2FYRDBrcmloNUlHdHVBV3BJVkQ3TVovOXJjc21KMzlLMkVUUmR2?=
 =?utf-8?Q?9jaiuo?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 15:28:38.7766 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 47f70373-1010-4844-5a15-08dd8cb2acd5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0002992B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF0EB7D076B
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

On 5/6/25 02:13, Jacek Lawrynowicz wrote:
> - Fix missing alloc log when drm_gem_handle_create() fails in
>    drm_vma_node_allow() and open callback is not called
> - Add ivpu_bo->ctx_id that enables to log the actual context
>    id instead of using 0 as default
> - Add couple WARNs and errors so we can catch more memory
>    corruption issues
>
> Fixes: 37dee2a2f433 ("accel/ivpu: Improve buffer object debug logs")
> Cc: <stable@vger.kernel.org> # v6.8+
> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_gem.c | 25 +++++++++++++++++--------
>   drivers/accel/ivpu/ivpu_gem.h |  1 +
>   2 files changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index e0d242d9f3e50..a76cbf4761f8c 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -28,7 +28,7 @@ static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo, con
>   {
>   	ivpu_dbg(vdev, BO,
>   		 "%6s: bo %8p vpu_addr %9llx size %8zu ctx %d has_pages %d dma_mapped %d mmu_mapped %d wc %d imported %d\n",
> -		 action, bo, bo->vpu_addr, ivpu_bo_size(bo), bo->ctx ? bo->ctx->id : 0,
> +		 action, bo, bo->vpu_addr, ivpu_bo_size(bo), bo->ctx_id,
>   		 (bool)bo->base.pages, (bool)bo->base.sgt, bo->mmu_mapped, bo->base.map_wc,
>   		 (bool)drm_gem_is_imported(&bo->base.base));
>   }
> @@ -94,8 +94,6 @@ ivpu_bo_alloc_vpu_addr(struct ivpu_bo *bo, struct ivpu_mmu_context *ctx,
>   		ivpu_err(vdev, "Failed to add BO to context %u: %d\n", ctx->id, ret);
>   	}
>   
> -	ivpu_dbg_bo(vdev, bo, "alloc");
> -
>   	mutex_unlock(&bo->lock);
>   
>   	drm_dev_exit(idx);
> @@ -215,7 +213,7 @@ struct drm_gem_object *ivpu_gem_prime_import(struct drm_device *dev,
>   	return ERR_PTR(ret);
>   }
>   
> -static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 flags)
> +static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 flags, u32 ctx_id)
>   {
>   	struct drm_gem_shmem_object *shmem;
>   	struct ivpu_bo *bo;
> @@ -233,6 +231,7 @@ static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 fla
>   		return ERR_CAST(shmem);
>   
>   	bo = to_ivpu_bo(&shmem->base);
> +	bo->ctx_id = ctx_id;
>   	bo->base.map_wc = flags & DRM_IVPU_BO_WC;
>   	bo->flags = flags;
>   
> @@ -240,6 +239,8 @@ static struct ivpu_bo *ivpu_bo_alloc(struct ivpu_device *vdev, u64 size, u32 fla
>   	list_add_tail(&bo->bo_list_node, &vdev->bo_list);
>   	mutex_unlock(&vdev->bo_list_lock);
>   
> +	ivpu_dbg_bo(vdev, bo, "alloc");
> +
>   	return bo;
>   }
>   
> @@ -278,8 +279,13 @@ static void ivpu_gem_bo_free(struct drm_gem_object *obj)
>   	mutex_unlock(&vdev->bo_list_lock);
>   
>   	drm_WARN_ON(&vdev->drm, !dma_resv_test_signaled(obj->resv, DMA_RESV_USAGE_READ));
> +	drm_WARN_ON(&vdev->drm, ivpu_bo_size(bo) == 0);
> +	drm_WARN_ON(&vdev->drm, bo->base.vaddr);
>   
>   	ivpu_bo_unbind_locked(bo);
> +	drm_WARN_ON(&vdev->drm, bo->mmu_mapped);
> +	drm_WARN_ON(&vdev->drm, bo->ctx);
> +
>   	mutex_destroy(&bo->lock);
>   
>   	drm_WARN_ON(obj->dev, refcount_read(&bo->base.pages_use_count) > 1);
> @@ -314,7 +320,7 @@ int ivpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
>   	if (size == 0)
>   		return -EINVAL;
>   
> -	bo = ivpu_bo_alloc(vdev, size, args->flags);
> +	bo = ivpu_bo_alloc(vdev, size, args->flags, file_priv->ctx.id);
>   	if (IS_ERR(bo)) {
>   		ivpu_err(vdev, "Failed to allocate BO: %pe (ctx %u size %llu flags 0x%x)",
>   			 bo, file_priv->ctx.id, args->size, args->flags);
> @@ -322,7 +328,10 @@ int ivpu_bo_create_ioctl(struct drm_device *dev, void *data, struct drm_file *fi
>   	}
>   
>   	ret = drm_gem_handle_create(file, &bo->base.base, &args->handle);
> -	if (!ret)
> +	if (ret)
> +		ivpu_err(vdev, "Failed to create handle for BO: %pe (ctx %u size %llu flags 0x%x)",
> +			 bo, file_priv->ctx.id, args->size, args->flags);
> +	else
>   		args->vpu_addr = bo->vpu_addr;
>   
>   	drm_gem_object_put(&bo->base.base);
> @@ -345,7 +354,7 @@ ivpu_bo_create(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
>   	drm_WARN_ON(&vdev->drm, !PAGE_ALIGNED(range->end));
>   	drm_WARN_ON(&vdev->drm, !PAGE_ALIGNED(size));
>   
> -	bo = ivpu_bo_alloc(vdev, size, flags);
> +	bo = ivpu_bo_alloc(vdev, size, flags, IVPU_GLOBAL_CONTEXT_MMU_SSID);
>   	if (IS_ERR(bo)) {
>   		ivpu_err(vdev, "Failed to allocate BO: %pe (vpu_addr 0x%llx size %llu flags 0x%x)",
>   			 bo, range->start, size, flags);
> @@ -452,7 +461,7 @@ static void ivpu_bo_print_info(struct ivpu_bo *bo, struct drm_printer *p)
>   	mutex_lock(&bo->lock);
>   
>   	drm_printf(p, "%-9p %-3u 0x%-12llx %-10lu 0x%-8x %-4u",
> -		   bo, bo->ctx ? bo->ctx->id : 0, bo->vpu_addr, bo->base.base.size,
> +		   bo, bo->ctx_id, bo->vpu_addr, bo->base.base.size,
>   		   bo->flags, kref_read(&bo->base.base.refcount));
>   
>   	if (bo->base.pages)
> diff --git a/drivers/accel/ivpu/ivpu_gem.h b/drivers/accel/ivpu/ivpu_gem.h
> index a222a9ec9d611..0c93118c85bd3 100644
> --- a/drivers/accel/ivpu/ivpu_gem.h
> +++ b/drivers/accel/ivpu/ivpu_gem.h
> @@ -21,6 +21,7 @@ struct ivpu_bo {
>   	u64 vpu_addr;
>   	u32 flags;
>   	u32 job_status; /* Valid only for command buffer */
> +	u32 ctx_id;
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>   	bool mmu_mapped;
>   };
>   
