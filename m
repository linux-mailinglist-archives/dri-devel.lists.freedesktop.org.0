Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E577B0A38B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 13:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D62410E981;
	Fri, 18 Jul 2025 11:52:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UUHQiPBw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2067.outbound.protection.outlook.com [40.107.237.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DC610E981;
 Fri, 18 Jul 2025 11:52:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oYNn9D7KBNTYkQKARg/sH248h/wExjQBWk4LziOpI+fnrjIski5q4a1rFtVHC7dtdqQAmlUpflLRzaOlVcds73BVWTu8Ro/pmWaCJf23b3v6/LZsu/Xfl1Cy49sAFawoaSdR0++mFU3L5gDzpq0WJ4lA53kykT5Ghc38EI4Am0gVRT/9n+Rd1UHKDgBT48+0eNfJsflGIsK5bkfYmv09AYrgOkE8EkEDSU0Ld/jEHPCbB2QQya7EAYmp6JsNqW1N7Z7qSdiOMRw/5VVCFZbMAWvSkDx8FUrAfYmp0cu5UcL9dCY4VGGeVqdEqwkcOXnBPIc8OWVQKDK/6yPk7H5mAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aeY0YjtQk0XN+EwTeMVPAGrPCbgbJRO7P4A79DmLon4=;
 b=J2lIflnmQVGKtP3+mDRb2bWMVuOBiERE1UQ236IIXwBQN2GJcYVauVP0ZgtJ7AxcLNYXHtx8kyjBoeEih9LLBi6oGF9EWtdi3J0VDirDTczxPAvNEi0fsjPGB13EcSQGmhmmhW+JoyB/gJp5U+h316jrvjjwiC1xTrElsSvShWNXxr6mJ4WX6GBHlljeeTEiJHjMxcfWTEDNJxewvUEL+VW5H9d76R41vmLriYTXoQNgWmpn5XhAa49VAVc+ITood152YlEFDkR8riya6iZx9H55goEwsPLo2d9ikHbnCMFpQWaML114wTu/ycc8FF5dyZQVk/xnxgaXVnr9o+YKMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aeY0YjtQk0XN+EwTeMVPAGrPCbgbJRO7P4A79DmLon4=;
 b=UUHQiPBw8TRYUqMCFNycktQ+YX/o7dQWvk/lEpLjp3EUQRl6DXq8azpmzMZZM9GtUXpNfrasvifD0bMD3G6sx/00C5BYQs96P7y+6oCEFCCtUzL9Ba8lOs3yVKAePJ/VmbVtGuOjqgaGF62dkawNpDMV3a1cmax4KmFhPNxq0tAzReLtNFJh+CP+oNrWIqwuuJ9LcEWCxOSqUIakK/6/Rp83UIZtmikkAN1+Y3hYZBpiOtJz+qVK19IOoNMN5u++NGzkF/xZvNB/BAbSXFJuEu4huqHAXM7MdUPK9cFY/MU7mHEuMbh/lsr9Sr1JyZr/4ryb+gP4WmGbNVXNPTE19Q==
Received: from SN7PR04CA0213.namprd04.prod.outlook.com (2603:10b6:806:127::8)
 by DS0PR12MB6414.namprd12.prod.outlook.com (2603:10b6:8:cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 11:52:28 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:127:cafe::3b) by SN7PR04CA0213.outlook.office365.com
 (2603:10b6:806:127::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.21 via Frontend Transport; Fri,
 18 Jul 2025 11:52:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 11:52:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 18 Jul
 2025 04:52:10 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 18 Jul
 2025 04:52:09 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Fri, 18
 Jul 2025 04:52:04 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>, Andrew Morton
 <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>
CC: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>, "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple
 <apopple@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, Michael Guralnik
 <michaelgur@nvidia.com>, Or Har-Toov <ohartoov@nvidia.com>, Daisuke Matsuda
 <dskmtsd@gmail.com>, Shay Drory <shayd@nvidia.com>, <linux-mm@kvack.org>,
 <linux-rdma@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>, "Yonatan
 Maman" <Ymaman@Nvidia.com>, Gal Shalom <GalShalom@Nvidia.com>
Subject: [PATCH v2 4/5] RDMA/mlx5: Enable P2P DMA with fallback mechanism
Date: Fri, 18 Jul 2025 14:51:11 +0300
Message-ID: <20250718115112.3881129-5-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250718115112.3881129-1-ymaman@nvidia.com>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|DS0PR12MB6414:EE_
X-MS-Office365-Filtering-Correlation-Id: eb9c1271-119a-4c9b-3cc4-08ddc5f191db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2agC+Gsb1evZt+81cf/klmWFxUbpgqEs/zxFxlZoEk+vKWfsmzxHwE/GY0BC?=
 =?us-ascii?Q?vHQphei2g6qNl3dmCn8UQZnjYqH6Rl2M09pdPIVw0bGtrr49sp4EHjUaubnL?=
 =?us-ascii?Q?oHIyM9VDWZIf7pyFbK737KpxySltRKtZsxLdJPOZRzGxaRVvJTnvQFJeMy12?=
 =?us-ascii?Q?F6Nc/KkQFBlGglfb+dFiV1NImMJQr522xFRhPJLYOk3Rx4hOTDUgau/8gWrz?=
 =?us-ascii?Q?Qyse1Jmk1OPkWSMdY78l72kZI/E4AZEHnnXAC2MBkTfJJWTYmoaha5xVUZ7b?=
 =?us-ascii?Q?TtzUF2k+50Gajb7x6BGuSqSaIyG4ULA9QEzueSmKhNuDWK+dezmadIusSs7Z?=
 =?us-ascii?Q?iuFfIyqmzZBy3vDVBRDBY+lt9MkHYJ+8goCqataTH5JFybiCZ2w5A+1hxfUE?=
 =?us-ascii?Q?FvZj6tboDzsZeBRo5NV3UJMWYAwKtNuNZeIRpwWOCs04/nHhb6QitE7Jr0sg?=
 =?us-ascii?Q?yjkOgjy99LJCAwiYr9KVU0aSYjDwMh1Vhd/sE4K+KtQfmRCYGNPp4VQniu51?=
 =?us-ascii?Q?uTp7hzoNLCvoeesmWiUnnk3G8ZPx6GOT1KvolWVrQShJKGg1DyacPl6/pyi/?=
 =?us-ascii?Q?EQNGL4E0RkESoWZjRLzquPqsPk2GYT5axoF0oW6uaUfBF984iUvXCDjLVoOD?=
 =?us-ascii?Q?7iVnfELCvWcpKykb80yC5c9AQUJLrnOfDhgaDtq7YirnzJYimm7TG78GjC/U?=
 =?us-ascii?Q?0vI7vXILteJ7dRmlPWMhXPMC3GfKTtkqTjHT86qZW9cM3ANXdj8KvZna4eiD?=
 =?us-ascii?Q?hOww11ka7ItDZAXAHV5EsrZV9wb34D46+ZjBEPU7cnO4FMBBgbkgyeQ+YXQR?=
 =?us-ascii?Q?5w7cpOZZME6BcjrcKkbbM5sRMnMdHtlb9nCEKdxD2ID3kF6XyCQVk4wjY88V?=
 =?us-ascii?Q?NjViu/PUVmXK7PLh0znJ3nJZ3S9Hq+ULpoVDGiR5B0CSe4rQ3Rb/FtGC5Bva?=
 =?us-ascii?Q?HHLkm/COf/IgjL8O63D1Lc0o2GTHtx9v3KI6n7ZwO63QefQ+rqhMhNySkfo3?=
 =?us-ascii?Q?YJFi90SEUhBUgE+PW64yUTnHnEOmMDubtDFzkzNpPzifp8tsyiKruKgQKyR/?=
 =?us-ascii?Q?Eyr7olwOhzLds75lvKerK5Ic0aDNioGkiY+ryQTHbDVfvOznVXUVeEfYdaie?=
 =?us-ascii?Q?iKNI0vCeyUEwsikwKomfPJ0JppKa7B7WNZ6uQTONL04FZl4kKjFYudiKK50P?=
 =?us-ascii?Q?nCFyzHP+OX/jfb7Mq1UsNIGR9uYsUdLfUMCUh9+lTIOL9fa5XhsFMTguHpZ9?=
 =?us-ascii?Q?SK7fU/yuHVKQGSsJLpW+jdvaE594TJCMG4gFK7WshXWXqIoP8q9IKghAS79H?=
 =?us-ascii?Q?J8OZZzciB6h/AOFSg05IS3MS2zGXwytTEwqjdCpG/+qOs2Quu6IOSOAJ9lmt?=
 =?us-ascii?Q?8OhHfMTD6EhH2hvDS5U937vEwrZEZ0IVdm55iT1DNUin0uXy1WNS6Yhxywbq?=
 =?us-ascii?Q?3+AF983B0d9ddYEv/n2XYquLYSSxLwr0u+2O69XGXkL3qpmbFJ0WsO37H+Ku?=
 =?us-ascii?Q?A+j5ftGH71yrsgx3pmV74zgAdn6NvMTk/4Nv?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 11:52:27.9834 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb9c1271-119a-4c9b-3cc4-08ddc5f191db
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6414
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

From: Yonatan Maman <Ymaman@Nvidia.com>

Add support for P2P for MLX5 NIC devices with automatic fallback to
standard DMA when P2P mapping fails.

The change introduces P2P DMA requests by default using the
HMM_PFN_ALLOW_P2P flag. If P2P mapping fails with -EFAULT error, the
operation is retried without the P2P flag, ensuring a fallback to
standard DMA flow (using host memory).

Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
---
 drivers/infiniband/hw/mlx5/odp.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/infiniband/hw/mlx5/odp.c b/drivers/infiniband/hw/mlx5/odp.c
index f6abd64f07f7..6a0171117f48 100644
--- a/drivers/infiniband/hw/mlx5/odp.c
+++ b/drivers/infiniband/hw/mlx5/odp.c
@@ -715,6 +715,10 @@ static int pagefault_real_mr(struct mlx5_ib_mr *mr, struct ib_umem_odp *odp,
 	if (odp->umem.writable && !downgrade)
 		access_mask |= HMM_PFN_WRITE;
 
+	/*
+	 * try fault with HMM_PFN_ALLOW_P2P flag
+	 */
+	access_mask |= HMM_PFN_ALLOW_P2P;
 	np = ib_umem_odp_map_dma_and_lock(odp, user_va, bcnt, access_mask, fault);
 	if (np < 0)
 		return np;
@@ -724,6 +728,18 @@ static int pagefault_real_mr(struct mlx5_ib_mr *mr, struct ib_umem_odp *odp,
 	 * ib_umem_odp_map_dma_and_lock already checks this.
 	 */
 	ret = mlx5r_umr_update_xlt(mr, start_idx, np, page_shift, xlt_flags);
+	if (ret == -EFAULT) {
+		/*
+		 * Indicate P2P Mapping Error, retry with no HMM_PFN_ALLOW_P2P
+		 */
+		mutex_unlock(&odp->umem_mutex);
+		access_mask &= ~(HMM_PFN_ALLOW_P2P);
+		np = ib_umem_odp_map_dma_and_lock(odp, user_va, bcnt, access_mask, fault);
+		if (np < 0)
+			return np;
+		ret = mlx5r_umr_update_xlt(mr, start_idx, np, page_shift, xlt_flags);
+	}
+
 	mutex_unlock(&odp->umem_mutex);
 
 	if (ret < 0) {
-- 
2.34.1

