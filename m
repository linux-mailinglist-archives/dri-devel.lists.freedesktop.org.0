Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D8ACBF4A0
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 18:49:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B5010E346;
	Mon, 15 Dec 2025 17:49:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="di8Lt/5g";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013020.outbound.protection.outlook.com
 [40.93.196.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9688510E49B
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 17:49:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cst6Ue5tdHmz4KQ6Dv+tpxfcX4bMAl6HvkdMmzpXerBXS+du4hCYmt3zIYMCZkD68E+bok3s/1dn3nUbk3gMERTy7CiJ/2a2J3BgGXC5VpjRvAXOKE0GtIa+D5XmjhX8KgkCYMg4+LC+MHNeKj8z8knGOlo/FIC/lfQDj+HEbt/N0DHoXSuf6zLNvffo/iT/pSy6iF+5ZX/qkms6o9r2MG6ZBabqOWfzeNUqNzNr6mEHEPLiqlsKQW1rr8C8lLHmqrcUcIhgxwKec2ZPGQxOZydWvpAbIGwvsnqtTPq9Slx1SZ7TXD6ZRzgtErtOskp5FX6gGTxaOvPqqump6fAq3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDacRcyfA+5Grmd5DDFTD7OP7GrCwwQNY+hDyrIvlOI=;
 b=E7PUcwYlsM+oq7DJIqlb0J4qBrD6X7rJd55Hre+E/9j9VG1ym31bodyijJwSLme1omkdB9zeTjO+fqEI27fNGT0+IbzLcihf4JAcjIAbLEPSbIN4MiFTEcayRu9WwFKL5azzvQw5qlbi5hSAiPoPV72bJV5/dPI/eq9hecqUKRKd8qDLUvcPzlgoYfWS4ZKov6z41mYFmXpV0CehIT1tqhT920N5K6T2GUCY/2K3sCVg/dgkkPZvh95VK5BXcsQT6DuK/bamPvefw62bisdl+3rEVTB9ztj11fbds06er4dJxyI8I0mTEwf4EHhb0P16VJqSGG9lf5zwjxFZ37i6JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDacRcyfA+5Grmd5DDFTD7OP7GrCwwQNY+hDyrIvlOI=;
 b=di8Lt/5gkw7C9SrGnWkisWHnpfMkK/jU3nfL9ZrUcxinoQZxYxacjV8VWZ1TFgiaDuut3p+FcvC0jCbHkYxCSELvbQ89kaD6a5gEjahBkpOydFPStn+dZdt70inMYPKYAEeq8Yk+uHeat3YKoTMq1x8WXKXKWnChYR5w8w2MRBA=
Received: from SJ0PR03CA0193.namprd03.prod.outlook.com (2603:10b6:a03:2ef::18)
 by DS0PR12MB9040.namprd12.prod.outlook.com (2603:10b6:8:f5::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 17:49:12 +0000
Received: from SJ1PEPF00002325.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef:cafe::b3) by SJ0PR03CA0193.outlook.office365.com
 (2603:10b6:a03:2ef::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.13 via Frontend Transport; Mon,
 15 Dec 2025 17:49:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF00002325.mail.protection.outlook.com (10.167.242.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Mon, 15 Dec 2025 17:49:12 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 15 Dec
 2025 11:49:11 -0600
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 15 Dec 2025 11:49:10 -0600
Message-ID: <f80b20ec-d3bb-a45a-2113-2b549cabb059@amd.com>
Date: Mon, 15 Dec 2025 09:49:10 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Validate scatter-gather size against buffer
 size
Content-Language: en-US
To: Karol Wachowski <karol.wachowski@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <oded.gabbay@gmail.com>, <jeff.hugo@oss.qualcomm.com>,
 <maciej.falkowski@linux.intel.com>, <andrzej.kacprowski@linux.intel.com>
References: <20251215070933.520377-1-karol.wachowski@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <20251215070933.520377-1-karol.wachowski@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002325:EE_|DS0PR12MB9040:EE_
X-MS-Office365-Filtering-Correlation-Id: e93e8c5d-56b3-4bcf-5ca2-08de3c024193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c29JK3hHc1V6VGFzQnJzZ3BVQ2t5YUIzWU10VVFyYUFPTjA2cG5zTXIrSzV6?=
 =?utf-8?B?STMvUTNZc2N4RnJRMlU1VGcxdWJNc21WR3F0NHRTNGtUd204UlF5Q1RrYkdY?=
 =?utf-8?B?elRaRlVYbWFBWTd1SituVUJHc3k4NXpLUUVhTk5CY3Z4YStTbEtRMWtrdGhU?=
 =?utf-8?B?Nlp5WE4wa0thS3JJQ09hcDlvYzBldjMvUWczVEFTaTJ4R1NOVWhNT3l2cWE4?=
 =?utf-8?B?Y1lFMGdkakxYYStjZjZZdC9UbzZ0ZUlBUytRSEhYR2ZSclNNK1NCdlR6Nnda?=
 =?utf-8?B?YTg1djhwSFd0SGNvOVRTREkvd3BZTkZlVUpQZWFMa1dsT2h5MFBUaWdrRzdm?=
 =?utf-8?B?TTBlRXhXMFFqL1dZZEUxT3BtaUNJc3N3UysyQmJtdDRXQkJlWVBUcFhvTlh3?=
 =?utf-8?B?QW0vcFpjMzVlWnlzMk1KYzQ4a2JhRTZwbVU0T1B4azYwTk5HL0xJVUNOVG5F?=
 =?utf-8?B?UDlWUHJMb0hBcmZ0RDdWdjNnUkkzTExTQTJieVJWcjZzaUlLWk9GV0UxbjBw?=
 =?utf-8?B?QkRwVkd3QnlQcW5tL28wNlVGK2NwQnU4RmJremlhcFhLUXUwVmR2NU5QQmx0?=
 =?utf-8?B?UXpLM3poZTNyMkEvMGxsSEhwdHREVUZzcVUvakd6QnZRcW4vTVRrcXIzSHZl?=
 =?utf-8?B?ODdXQk05NmZWYk9ITGdFWVRrNE1vcllaS3hzelcrNnlaYWd2dzM3dlBHbVZZ?=
 =?utf-8?B?TnhhYU5CcHRxVm8wTkpBMEZWNUtsV2o5UjBiTVQ3SmhCWjFyZzFYZWVaUlpV?=
 =?utf-8?B?dDRNUlpFZmZHeUdPd3VOZVlQU3hDbE9RdWptditkSHRmUG96Q25kQkxkR29a?=
 =?utf-8?B?emZWLzZQa0xvTzJoWWdRWFA5cVVRUGdjNnk1Z2cxSGJ2OWRoR0l0VmFGMmJh?=
 =?utf-8?B?MXZnclhmSTdwQVg5VTN0Z1pjRHdBai96WG9mVWxOSVZZaXhZSjRMUlNYWXFU?=
 =?utf-8?B?YXJZTjZRWTZSK1VWclNaVHZPeCtybktGL3BlbThhMTMwTnlST3MzTkdwTm9k?=
 =?utf-8?B?NS9kS0FSMW8rZElabUFyUTU1cTNBc084RVgvRHU3SlYvQkZrazNLc3hDRHJV?=
 =?utf-8?B?Z09vYlF1MEZ2L2pPN0NiV05jbGZ0emdGODVqSmhxU3FQcTdBZ0Z0Sng1VStR?=
 =?utf-8?B?OVdwMzNvNzRSdXlkWEg3ZmE1TGtTd3lGc3o5dUMzVld2V2gxdndaNmVBenhL?=
 =?utf-8?B?aE12SWowMGo5azk1bTY4WGN2K1Nvc0FUeG1MNE10QmpwRTZ1R0hqcXBVa3p2?=
 =?utf-8?B?WDZ1aUdISTY5R09iQTVjS0Q0aFYvallRWk5zYXIwRm1sSERsNCsrNW9kZHBj?=
 =?utf-8?B?ZVA1eWthekdjdTFjbVN1Q0Z6OEhYcUo1TllBdFZtNWMwb3hGTCsxMzlESWta?=
 =?utf-8?B?VXZkY1lDanhpdlRFK09qRG9SOC9OSmJHc3liWWROZHdXNnJhSlkvSnlDV3lp?=
 =?utf-8?B?RUl6S3lLWk9lQVV1c0JURDlvTytrRDdZYTFXNlhNczliK3B4KzluMXpRTGdL?=
 =?utf-8?B?Tml2TjFsbXNuQTlBSHI3NzlWSEg5eGxSMWV3b1RrcEFudGtuR0Z5dGcvbWlF?=
 =?utf-8?B?bWNDWEY2bUxEdXFsVjZYK3AwM2luNkhRSkRSQ0dvaWJyZHA1QzJwMmZFTURz?=
 =?utf-8?B?NWJWSGhObjdhdmJLODV2YzIrYklpTXUvSHAwZU51bTVEKzNFcWUvMGlvMmhm?=
 =?utf-8?B?Vk8wdElEQTlTSThkdUM3SmpaZnY3Y1BIQmcxVkZvUGFXV0pEcVV6dllrYUVw?=
 =?utf-8?B?TEtkU21yNm56SWlYVFFxeVJlajQ4enBDNUZtSTZ0VG1xMGc5WmpGYXBJNXRs?=
 =?utf-8?B?TjlnaUFsYmNTNG1sckpOODNZMTBHeFo3cWZmaXkyNWVwM3Q2cFlPdFY5UHdv?=
 =?utf-8?B?eTlSSk5CS3VIOWJmNEtJdk1XTGpRS0VBS0oxYjNFbFJWMVBuRklvTkJVcVFI?=
 =?utf-8?B?dUpObnBqV0lkbVcwcDJZT1l6YmJXVng1OFhxcjUyWUVyVlRtb0FsdVNLSFUr?=
 =?utf-8?B?UWYzbjVacDVBVjV6REV5eDNhMjJtRGJSMTNBRFdyVUhnWmR6TkR2S0FiZW9s?=
 =?utf-8?B?b3hFa0EzYVZ2Z0U2bktmU1FxVUJCQ3EyZ05tWWZ4WnlpUjFHeHRkOXJrdWpB?=
 =?utf-8?Q?aFog=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 17:49:12.0161 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e93e8c5d-56b3-4bcf-5ca2-08de3c024193
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002325.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB9040
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

Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>

On 12/14/25 23:09, Karol Wachowski wrote:
> Validate scatter-gather table size matches buffer object size before
> mapping. Break mapping early if the table exceeds buffer size to
> prevent overwriting existing mappings. Also validate the table is
> not smaller than buffer size to avoid unmapped regions that trigger
> MMU translation faults.
>
> Log error and fail mapping operation on size mismatch to prevent
> data corruption from mismatched host memory locations and NPU
> addresses. Unmap any partially mapped buffer on failure.
>
> Signed-off-by: Karol Wachowski <karol.wachowski@linux.intel.com>
> ---
>   drivers/accel/ivpu/ivpu_gem.c         |  2 +-
>   drivers/accel/ivpu/ivpu_mmu_context.c | 20 +++++++++++++++++---
>   drivers/accel/ivpu/ivpu_mmu_context.h |  5 +++--
>   3 files changed, 21 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
> index ece68f570b7e..98b9ce26962b 100644
> --- a/drivers/accel/ivpu/ivpu_gem.c
> +++ b/drivers/accel/ivpu/ivpu_gem.c
> @@ -95,7 +95,7 @@ int __must_check ivpu_bo_bind(struct ivpu_bo *bo)
>   
>   	if (!bo->mmu_mapped) {
>   		drm_WARN_ON(&vdev->drm, !bo->ctx);
> -		ret = ivpu_mmu_context_map_sgt(vdev, bo->ctx, bo->vpu_addr, sgt,
> +		ret = ivpu_mmu_context_map_sgt(vdev, bo->ctx, bo->vpu_addr, sgt, ivpu_bo_size(bo),
>   					       ivpu_bo_is_snooped(bo), ivpu_bo_is_read_only(bo));
>   		if (ret) {
>   			ivpu_err(vdev, "Failed to map BO in MMU: %d\n", ret);
> diff --git a/drivers/accel/ivpu/ivpu_mmu_context.c b/drivers/accel/ivpu/ivpu_mmu_context.c
> index 87ad593ef47d..c4014c83e727 100644
> --- a/drivers/accel/ivpu/ivpu_mmu_context.c
> +++ b/drivers/accel/ivpu/ivpu_mmu_context.c
> @@ -429,11 +429,12 @@ static void ivpu_mmu_context_unmap_pages(struct ivpu_mmu_context *ctx, u64 vpu_a
>   }
>   
>   int
> -ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
> -			 u64 vpu_addr, struct sg_table *sgt, bool llc_coherent, bool read_only)
> +ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx, u64 vpu_addr,
> +			 struct sg_table *sgt, size_t bo_size, bool llc_coherent, bool read_only)
>   {
>   	size_t start_vpu_addr = vpu_addr;
>   	struct scatterlist *sg;
> +	size_t sgt_size = 0;
>   	int ret;
>   	u64 prot;
>   	u64 i;
> @@ -462,12 +463,25 @@ ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
>   		ivpu_dbg(vdev, MMU_MAP, "Map ctx: %u dma_addr: 0x%llx vpu_addr: 0x%llx size: %lu\n",
>   			 ctx->id, dma_addr, vpu_addr, size);
>   
> +		if (sgt_size + size > bo_size) {
> +			ivpu_err(vdev, "Scatter-gather table size exceeds buffer object size\n");
> +			ret = -EINVAL;
> +			goto err_unmap_pages;
> +		}
> +
>   		ret = ivpu_mmu_context_map_pages(vdev, ctx, vpu_addr, dma_addr, size, prot);
>   		if (ret) {
>   			ivpu_err(vdev, "Failed to map context pages\n");
>   			goto err_unmap_pages;
>   		}
>   		vpu_addr += size;
> +		sgt_size += size;
> +	}
> +
> +	if (sgt_size < bo_size) {
> +		ivpu_err(vdev, "Scatter-gather table size too small to cover buffer object size\n");
> +		ret = -EINVAL;
> +		goto err_unmap_pages;
>   	}
>   
>   	if (!ctx->is_cd_valid) {
> @@ -493,7 +507,7 @@ ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
>   	return 0;
>   
>   err_unmap_pages:
> -	ivpu_mmu_context_unmap_pages(ctx, start_vpu_addr, vpu_addr - start_vpu_addr);
> +	ivpu_mmu_context_unmap_pages(ctx, start_vpu_addr, sgt_size);
>   	mutex_unlock(&ctx->lock);
>   	return ret;
>   }
> diff --git a/drivers/accel/ivpu/ivpu_mmu_context.h b/drivers/accel/ivpu/ivpu_mmu_context.h
> index 663a11a9db11..cc02e7bab04e 100644
> --- a/drivers/accel/ivpu/ivpu_mmu_context.h
> +++ b/drivers/accel/ivpu/ivpu_mmu_context.h
> @@ -41,8 +41,9 @@ int ivpu_mmu_context_insert_node(struct ivpu_mmu_context *ctx, const struct ivpu
>   				 u64 size, struct drm_mm_node *node);
>   void ivpu_mmu_context_remove_node(struct ivpu_mmu_context *ctx, struct drm_mm_node *node);
>   
> -int ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
> -			     u64 vpu_addr, struct sg_table *sgt, bool llc_coherent, bool read_only);
> +int
> +ivpu_mmu_context_map_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx, u64 vpu_addr,
> +			 struct sg_table *sgt, size_t bo_size, bool llc_coherent, bool read_only);
>   void ivpu_mmu_context_unmap_sgt(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
>   				u64 vpu_addr, struct sg_table *sgt);
>   int ivpu_mmu_context_set_pages_ro(struct ivpu_device *vdev, struct ivpu_mmu_context *ctx,
