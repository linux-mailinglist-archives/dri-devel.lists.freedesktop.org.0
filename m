Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gO3YJ68XemlS2QEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 15:05:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 942D7A2768
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jan 2026 15:05:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E222410E2B6;
	Wed, 28 Jan 2026 14:05:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oU6xbeEq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012059.outbound.protection.outlook.com
 [40.107.200.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65EBC10E2B6;
 Wed, 28 Jan 2026 14:05:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y8a4r5ne5kBFQFtnRQAds4j/5ADTuigCIRAHKeaCcLH2b+ibF1LuIZF0qt8PaXhJds3zCQh37gg3ToOpDBl8Ygnz087KXE//bT/MFPZsGrAM7r1CIASuZ1TJiye5IYT//+6uijn0w+jYlBXBPBL8CkM6R2y6VOSX16rPin+E6Q+gH++JTEwN8OkOO9Vc0Mg/VAB4WdjPASqvO2Bn4lfMHPI3Y9b6UpX/+d8fmKeaAM9nTMBn42dmLY4RKkW3MFtnuyRNWX18zbWunxspEJdwzNqwp+1s2yCOXxSg2gt+4FvpEov0DaaM1jxhvlur6lIypb+GF2mgD6I2/oVX3ooLng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NuWeP+ogy0j18Jd3L1j1zkRz7/yOk7vhjLBZXR4LkuA=;
 b=Ia0baoCZxuwIlcE7MqeMVKwsdPHIvu1366/cilVDhadoti2MzYSbw2DzmAX/Vh6OnDLM+gm0tdXZ5kQl5Y0NWJpnIemb5KDAFcad5kGtA5g/iarT0CQl/QLZ/4XKOw6LwS/U3Pvmrq0o3Tcllu1kU10YegE6W1rsIivsmgXVaW4dotancwPIalzAfytgZ1DbFhb8oP83Ugjk5CkXLH+wO6NE6gamtSYFKikupZwpNZmmi7i//7Pnzgec/PSGpfTozit8peNYvC9VRpW0bDnHF44PEidaLSMaQh7kHRaGwKEmOHNMJaAJTZiO6T0VszycrTbHZalx5KY9yJgkHpwGEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NuWeP+ogy0j18Jd3L1j1zkRz7/yOk7vhjLBZXR4LkuA=;
 b=oU6xbeEqy49NVHkd5hPZo9L3VtvLN3O5R7urMt8b+94FjYme3Hmey4vamU2uT6q0GuTf2igx2IB5+I8wyPMm21RNbQrV32BqPshbBStaqr2BH5XM4y0YTNB14FpUcoozjXsr8LK0OC2BY4/Q6UGOWwZqJOOUcKqMnlUKCG6fAgDbvp7UKO/KES8V2b5QA1dcWwCwZb6tBc27tdC2RqWYUyskhNIImpaGb686DD8DzhBjkdSmOtSWAHOpZWivdy3cL7qBfwiHEOKaUG2wJYTX4AWHcpiExfxPFchYfHJQHr4cJM9aw18hiNfcQ68x6Z6bc8NiVerPFudl0rZEx2Iz4w==
Received: from BN9PR03CA0099.namprd03.prod.outlook.com (2603:10b6:408:fd::14)
 by SJ5PPF09E5F035B.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::988) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Wed, 28 Jan
 2026 14:04:54 +0000
Received: from BN1PEPF0000468E.namprd05.prod.outlook.com
 (2603:10b6:408:fd:cafe::7c) by BN9PR03CA0099.outlook.office365.com
 (2603:10b6:408:fd::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Wed,
 28 Jan 2026 14:04:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF0000468E.mail.protection.outlook.com (10.167.243.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Wed, 28 Jan 2026 14:04:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 06:04:25 -0800
Received: from localhost (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 28 Jan
 2026 06:04:24 -0800
Date: Wed, 28 Jan 2026 16:04:22 +0200
From: Leon Romanovsky <leonro@nvidia.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <francois.dugast@intel.com>, <thomas.hellstrom@linux.intel.com>,
 <himal.prasad.ghimiray@intel.com>, <jgg@ziepe.ca>
Subject: Re: [RFC PATCH v3 02/11] drm/gpusvm: Use dma-map IOVA alloc, link,
 and sync API in GPU SVM
Message-ID: <20260128140422.GF40916@unreal>
References: <20260128004841.2436896-1-matthew.brost@intel.com>
 <20260128004841.2436896-3-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260128004841.2436896-3-matthew.brost@intel.com>
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468E:EE_|SJ5PPF09E5F035B:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c36072-5d36-4da2-e4ed-08de5e7631e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3q+IloRHkFdbSWikOll1VUdEOSEhXMJlF3EEUHsYWpmLJ83JFdjcR7jZaQya?=
 =?us-ascii?Q?9p/00qukHWREZH9YbFyfUta3sNr6pg0x0NOCY2QiOFDnt9NXAT2L/ZPSnnZ3?=
 =?us-ascii?Q?N9Zsq4w6FHTS+4SbZxIgVtOC9mDZ0GYh6flHggZDmsFmUPk0pBOy15Uv9IPg?=
 =?us-ascii?Q?6angb2N7CvpM7dTOLhbS8lWtQSL9OR9Ln1X7AmIiNyIRDdIaRL22JTt1lacD?=
 =?us-ascii?Q?4fPbLyrVPJVL7OHM57lPew0ncHTRrZ8krUL/ULA1obpogfYJMXDnqLvC6EER?=
 =?us-ascii?Q?gcAy2pQlkS/SvGBK6tzkThkZOTCoYRMUOBM/BYzy3VMcBaygTRYFRBap+rcH?=
 =?us-ascii?Q?DpueLycr+iNWSEUbckTDPpxuJG0rOZE+gHtHmGOD1f1o1r0VPs8XPGpZstaf?=
 =?us-ascii?Q?kLhFn5FSLc/SNTMc+5S14XAfx4750VaYNIe5HdbaQ0sVQJzUr16KU/uPjgzW?=
 =?us-ascii?Q?H6/gdJAq3e1M4DBynIuAL8N1vyT7TxX4FANPw8PbLwErCL6P0GsVy9FVMKk8?=
 =?us-ascii?Q?1rX6VbSlSGox8FwPZI/rz63hlsbU4yewZzJwf2eZs6EFat0LFiEmVlnf8tIU?=
 =?us-ascii?Q?MAhPYw0C5uw4XHFlwo8nY6rHwtIGYf1ExVji0OEyd6TxbQl/MU0ee58N20bG?=
 =?us-ascii?Q?m3FyZUEDMlqNVKQ63ROZTPKTOWxZdfLH5lpITU7YH+xzMUvJ8uEDVhQU6Xqi?=
 =?us-ascii?Q?NKZa2Q8S8XjGhCSd14ETvNhFt7pTFtWX2HDxWHW111lWR+U8k/2e6kv2KpNL?=
 =?us-ascii?Q?qvNg169TIXllSDmffZtVlf+ltZqKysnY4hSKD4nOiIzGHTNI+D9uP7eFwbpP?=
 =?us-ascii?Q?+XfmeXmW38qWRtYXLT0GmCNkVw+MVlEFI9tIQNNpvLEK5OjweLrzucf1zrcA?=
 =?us-ascii?Q?g4xQT4XW72L0/E/56keSZVYVa74vnvsxy8CoKwYWuWp/vNurJ4yf3/1cJyPu?=
 =?us-ascii?Q?IuavssCYo401vYn3G9IR9mCnBJ5knUksT6P9PkwWCZeWCmtboiNmfxEkfCFa?=
 =?us-ascii?Q?+w3/i2q2ByUN9TIJQoWYA62rGPlZL6LuYopVNjgH0kQMsT+wWZDvIcbOs+9X?=
 =?us-ascii?Q?gCUb+khltSLIsKgaa/MgtWbu6ZK85S2dnZ9TSxwqylOt93gz9bVa+NsjmMip?=
 =?us-ascii?Q?PK2AfL0w+cpod88umEtI/x4lUmjb3YibyNJiSGurShNe8aje8XrGpjjzvz99?=
 =?us-ascii?Q?+NVSH2MAXN3PhFdoRxzYVS0reUt95elnIwRvsbNu1gOtasG22I5dHS9k7Omb?=
 =?us-ascii?Q?mZTZoaCqcVcToEWjuqWc9Fl3RiLcbV2wVCFSEA6s3BU8N1c4rEGYjC16L+yj?=
 =?us-ascii?Q?/Vx9B93aqGB5ViFAlLZKZA1yhHQ8sHKJs0FrD71GJLXhX5raUJbkLfbWO0Ih?=
 =?us-ascii?Q?UniUFBrvRJb1FKSCM03VB+hBx61nyvQ5cQL9NzWww5V8fxqCuJLVZxN9jyVt?=
 =?us-ascii?Q?gkxkYs3MRxYMG14fies0bkkAM8yMCyxW937OLjMRJ6CbZx5ViLwKcvdkkWht?=
 =?us-ascii?Q?awccXYwSaZvTxxggGRdpcg/LM+I992Yo59UqIutSHSKyEUavfEgkBSChgq8i?=
 =?us-ascii?Q?dxwHZevI+5KQq+g4/PRpwYSguEg08guV1fSM8tc+G80AQCvYrJYxGDw3d8f8?=
 =?us-ascii?Q?csNMHW24IUykDBUjpWYLBIGsfuD/nWfep1qCAqxpl1/G1DgsOf7kYAsODFo2?=
 =?us-ascii?Q?eMLQSQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 14:04:46.7324 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c36072-5d36-4da2-e4ed-08de5e7631e2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF0000468E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF09E5F035B
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_XOIP(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[leonro@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 942D7A2768
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 04:48:32PM -0800, Matthew Brost wrote:
> The dma-map IOVA alloc, link, and sync APIs perform significantly better
> than dma-map / dma-unmap, as they avoid costly IOMMU synchronizations.
> This difference is especially noticeable when mapping a 2MB region in
> 4KB pages.
> 
> Use the IOVA alloc, link, and sync APIs for GPU SVM, which create DMA
> mappings between the CPU and GPU.
> 
> v3:
>  - Always link IOVA in mixed mappings
>  - Sync IOVA

The same comment as before.

> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> ---
>  drivers/gpu/drm/drm_gpusvm.c | 87 ++++++++++++++++++++++++++++--------
>  include/drm/drm_gpusvm.h     |  3 ++
>  2 files changed, 71 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> index 585d913d3d19..084e78fa0f32 100644
> --- a/drivers/gpu/drm/drm_gpusvm.c
> +++ b/drivers/gpu/drm/drm_gpusvm.c
> @@ -1139,19 +1139,26 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
>  		struct drm_gpusvm_pages_flags flags = {
>  			.__flags = svm_pages->flags.__flags,
>  		};
> +		struct dma_iova_state __state = {};

Why don't you use svm_pages->state directly?

>  
> -		for (i = 0, j = 0; i < npages; j++) {
> -			struct drm_pagemap_addr *addr = &svm_pages->dma_addr[j];
> -
> -			if (addr->proto == DRM_INTERCONNECT_SYSTEM)
> -				dma_unmap_page(dev,
> -					       addr->addr,
> -					       PAGE_SIZE << addr->order,
> -					       addr->dir);
> -			else if (dpagemap && dpagemap->ops->device_unmap)
> -				dpagemap->ops->device_unmap(dpagemap,
> -							    dev, *addr);
> -			i += 1 << addr->order;
> +		if (dma_use_iova(&svm_pages->state)) {
> +			dma_iova_destroy(dev, &svm_pages->state,
> +					 npages * PAGE_SIZE,
> +					 svm_pages->dma_addr[0].dir, 0);
> +		} else {
> +			for (i = 0, j = 0; i < npages; j++) {
> +				struct drm_pagemap_addr *addr = &svm_pages->dma_addr[j];
> +
> +				if (addr->proto == DRM_INTERCONNECT_SYSTEM)
> +					dma_unmap_page(dev,
> +						       addr->addr,
> +						       PAGE_SIZE << addr->order,
> +						       addr->dir);
> +				else if (dpagemap && dpagemap->ops->device_unmap)
> +					dpagemap->ops->device_unmap(dpagemap,
> +								    dev, *addr);
> +				i += 1 << addr->order;
> +			}
>  		}
>  
>  		/* WRITE_ONCE pairs with READ_ONCE for opportunistic checks */
> @@ -1161,6 +1168,7 @@ static void __drm_gpusvm_unmap_pages(struct drm_gpusvm *gpusvm,
>  
>  		drm_pagemap_put(svm_pages->dpagemap);
>  		svm_pages->dpagemap = NULL;
> +		svm_pages->state = __state;
>  	}
>  }
>  
> @@ -1402,12 +1410,14 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
>  	unsigned long num_dma_mapped;
>  	unsigned int order = 0;
>  	unsigned long *pfns;
> +	phys_addr_t last_phys;
>  	int err = 0;
>  	struct dev_pagemap *pagemap;
>  	struct drm_pagemap *dpagemap;
>  	struct drm_gpusvm_pages_flags flags;
>  	enum dma_data_direction dma_dir = ctx->read_only ? DMA_TO_DEVICE :
>  							   DMA_BIDIRECTIONAL;
> +	struct dma_iova_state *state = &svm_pages->state;
>  
>  retry:
>  	if (time_after(jiffies, timeout))
> @@ -1496,6 +1506,17 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
>  				err = -EOPNOTSUPP;
>  				goto err_unmap;
>  			}
> +
> +			if (dma_use_iova(state)) {
> +				err = dma_iova_link(gpusvm->drm->dev, state,
> +						    last_phys,
> +						    i * PAGE_SIZE,
> +						    PAGE_SIZE << order,
> +						    dma_dir, 0);
> +				if (err)
> +					goto err_unmap;
> +			}
> +
>  			zdd = __zdd;
>  			if (pagemap != page_pgmap(page)) {
>  				if (i > 0) {
> @@ -1539,13 +1560,34 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
>  				goto err_unmap;
>  			}
>  
> -			addr = dma_map_page(gpusvm->drm->dev,
> -					    page, 0,
> -					    PAGE_SIZE << order,
> -					    dma_dir);
> -			if (dma_mapping_error(gpusvm->drm->dev, addr)) {
> -				err = -EFAULT;
> -				goto err_unmap;
> +			if (!i)
> +				dma_iova_try_alloc(gpusvm->drm->dev, state,
> +						   npages * PAGE_SIZE >=
> +						   HPAGE_PMD_SIZE ?
> +						   HPAGE_PMD_SIZE : 0,
> +						   npages * PAGE_SIZE);
> +
> +			if (dma_use_iova(state)) {
> +				last_phys = page_to_phys(page);

hmm_pfn_to_phys().

> +
> +				err = dma_iova_link(gpusvm->drm->dev, state,
> +						    page_to_phys(page),

you have last_phys here.

> +						    i * PAGE_SIZE,
> +						    PAGE_SIZE << order,
> +						    dma_dir, 0);
> +				if (err)
> +					goto err_unmap;
> +

Thanks
