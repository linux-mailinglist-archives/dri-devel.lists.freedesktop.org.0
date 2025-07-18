Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55DC7B0A38F
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 13:52:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A488D10E988;
	Fri, 18 Jul 2025 11:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IS5d/OYq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2060.outbound.protection.outlook.com [40.107.92.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 140A310E987;
 Fri, 18 Jul 2025 11:52:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Nox+gIgjZsuhB0fzxHPAesEBZ7uhPb6tu91AQkCMabShuRym5RSdZDiJG2YZRTXkRhtcr26I0QYC2BrQ38rlf4ZehRlUDyVTWQmAjudVThN4MRHJMHrwpQKX18S3Tg+Q5BrwaXTReDLcxsehy3uNI26bqQD9mSeBQcG/dEy9kWcG9UTSc6J1teITW72Isx/s38ax/+UF/ePhyBHpIwSVCwOy0SENY2Lw6K7gQ9Q6HMvJNXlHzbna/U/m0I93jsZqAUcJibT7SHYWKHdjjDOdT8EUFoMJHp5K5koZ8pwsQm2N9FUHD0yXZ4Nw4ewMCKfwSrAN0FN9XiUCq4eSAUnfaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJK1Qb7GFsD9TqJmyw7UxdYE1kG7BmOSavNaiR/sUF8=;
 b=gyabsGvmd7wUFCWe0APkanV6fgkOzxWDNi4VYdtmtllXQu0jpmRishXglAiEMvmq6OK9Deej5KR0kIe90shGikMf7iZtAPXtsETz4jBnXB6Pxogb4xFa5q6UgtjzYujRVrQxgy79Uypxs+zWaayY5AAvx3arcDj5MQo/wf2aJwESg1AOjs+tf3tA1A+GO7smTy9oKivgTu4NyaoM4mOSvIVmYEjSf5BBiQPlf4eXDYUk8xSqhTlbCu2Q9RdPjjJRKkiiYh7e3SUsNKDwFD/EezCQBYYNXAzSNHiSQ7CVnANSKAZtoGM6aI5YOn4Cr4UopXvRCYkuj30U4ffcw9AlfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJK1Qb7GFsD9TqJmyw7UxdYE1kG7BmOSavNaiR/sUF8=;
 b=IS5d/OYqG2aGN022r/DgIHFr95rI4Y1bAEAhS3+ECeueLrPV37SEsbu6o0d53+Ed048lXardELw7brL/AMoYRhn8QnXk7ASF6JTzF/a2VOFZQtP16W5a1OKnQ8haGFP0oPjavtVnbk0Bii0amc5zuMXoVOGg64y3zzWvQE2hm3XRvy5wqGkzCwn0edt1TkOI9hOGoxvx4LuBEq4lUbA1celu8f8Nx8MCOQn9P0ysquV8JFyzGhCa89VLxs3+fBezdD+go3LKlLaYI3FP8Pxw+6HgBUo5rBLCFe616+kChRwGQGcLZBM35vzPtvq0KXunzHUJWhiydTMCr8keV2A6SA==
Received: from SA1P222CA0083.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:35e::21)
 by SJ0PR12MB7460.namprd12.prod.outlook.com (2603:10b6:a03:48d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.39; Fri, 18 Jul
 2025 11:52:35 +0000
Received: from SN1PEPF0002636C.namprd02.prod.outlook.com
 (2603:10b6:806:35e:cafe::f9) by SA1P222CA0083.outlook.office365.com
 (2603:10b6:806:35e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.23 via Frontend Transport; Fri,
 18 Jul 2025 11:52:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002636C.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8943.21 via Frontend Transport; Fri, 18 Jul 2025 11:52:35 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 18 Jul
 2025 04:52:17 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Fri, 18 Jul
 2025 04:52:17 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.1544.14 via Frontend Transport; Fri, 18
 Jul 2025 04:52:12 -0700
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
Subject: [PATCH v2 5/5] RDMA/mlx5: Enabling ATS for ODP memory
Date: Fri, 18 Jul 2025 14:51:12 +0300
Message-ID: <20250718115112.3881129-6-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250718115112.3881129-1-ymaman@nvidia.com>
References: <20250718115112.3881129-1-ymaman@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636C:EE_|SJ0PR12MB7460:EE_
X-MS-Office365-Filtering-Correlation-Id: e54f7cd4-055e-45db-d1cd-08ddc5f1962c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+biFyDegrfRiNf/HlXYPNvVGRtM54in/6aog1xbFCPJ0hdopYeztHIIyzDBh?=
 =?us-ascii?Q?5AQuoLYVDD35TnI8pgU4G/4QVxeD3o1HFac9sFVpT1nXfz3ujQpHoYW6b7Bn?=
 =?us-ascii?Q?a8LhiedPNhkBCVMCvfC15piZTScDUYrmZYj02pXYaUsUUIC5oe7nIBFHkTy2?=
 =?us-ascii?Q?PUc2Ro1in9C/SDvc669eZZLChsXuTtALDgjEiFoivIcjTQgyF9nTBzLgpHJy?=
 =?us-ascii?Q?SN1q86XlAWrD40/8N6P2IQxvd2dRYmohCQ3OjauHdVhgIdnxOCq8js4UVw1c?=
 =?us-ascii?Q?6+P3Ag4Z0x4r/dhqaGrT1OaBbxTfW8N/04Oh/JKQrCOqbryRLkP7tmneB99m?=
 =?us-ascii?Q?7k5zRoyRO8f9rMf9rNYFYyM1SvViHLb2HENEfQn1LVP2WXjDahgkYj/nVDU5?=
 =?us-ascii?Q?2S/CPD0Zjn2uu8Fz2zdgRPbaXU2QKnDYu6yZA/aGLbGLUiLf8R/64eea7rXA?=
 =?us-ascii?Q?WYGya6Wz+NmzZqSf3eKNAdjfAcFq0wFFJp6TXCHCJA4UjLS4VVijbJj1LyJU?=
 =?us-ascii?Q?D/wk/vZ9dr24eLZZKZRsGMd7jeGwLsKRW0KLflL1LPNM+S78lXVydj8hnZyE?=
 =?us-ascii?Q?BhgCttDfB1qm08Bty+P9KITwOsbwlVOlP0gH8m0Le1qtjOkhv3B1Co5dLykh?=
 =?us-ascii?Q?7rBSWB7O3rcKSIA2SFhO63o1h/4xILPJfithSN+2UMWBB4I0pdHzwW1Pz825?=
 =?us-ascii?Q?Bk0XYGX5ui/E0uEoAfeTrymen8SGPw8IhKdWPBLn/RF7JzV62snLBddz6qgu?=
 =?us-ascii?Q?B6PzME8F9dkdoaKsPWQBcn7p+9l2F2ak0pKfTm9HBH4mwax614R/fyKkIJhy?=
 =?us-ascii?Q?3nsK5/YQD9EBaQlItHvPlqdfKe+A7vWlQUB/+PrUdijV7ZxrKK62kzMsSuQM?=
 =?us-ascii?Q?fQxvPnbGEajT8yrKe6NTA8lLC10sECvDlZedW+xcgDynl9bPgVNgoq/E6BRY?=
 =?us-ascii?Q?9VHOvk1nF7F+zScGQWlAPJtZUq+tLnEYNmA4M64BOup6k0RKffcE6QSGjAL3?=
 =?us-ascii?Q?0Wj4h8v+Kvg5zn671xR6o+SKlTS+/mhL78aw5h+pJj6Tn1RTysZ/8vStZ2vu?=
 =?us-ascii?Q?GRhtJ3GK/9F97Xr3aHa9LJzkmFFr9algtnAItG80cyanmlpjRro4vQxqw8bX?=
 =?us-ascii?Q?/nYPlWfJjoR+sC1gMhkxlSkM4vm0aZMg2JeBXoNckwR1aCta7oKR2PwF0EWX?=
 =?us-ascii?Q?nMN3c7MEcWlQz4z6P5jbo3hJfOmAGZEMSL63mYJy/ru2j1bqQ9eLAGhWNHKV?=
 =?us-ascii?Q?ZwYSwGd7C85YGgKUMM3/OHBVEjow5QomeQjlwVy83DOGpv4yr8NG8NUwYn77?=
 =?us-ascii?Q?coQBTSNAe2av3kRDuyWt3BgV8RoPkqcDHotzalod4EaWSv72dLV15dmUVFZo?=
 =?us-ascii?Q?K6H7y2RcIie3Qrjug12a9rrEfiF1Q0PYtLvAmsuCprVaRh33xKK87I6IQiVf?=
 =?us-ascii?Q?n8Aw9Hsy81o6kltsqRU2eSRCqe8YVfd0GKpQ6JieAx2GY7+AUXdWA42T7HXf?=
 =?us-ascii?Q?I1nbp3zVELA3D1krEzivdFenn+rlhbAn4jv/?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 11:52:35.2142 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e54f7cd4-055e-45db-d1cd-08ddc5f1962c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7460
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

ATS (Address Translation Services) mainly utilized to optimize PCI
Peer-to-Peer transfers and prevent bus failures. This change employed
ATS usage for ODP memory, to optimize DMA P2P for ODP memory. (e.g DMA
P2P for private device pages - ODP memory).

Signed-off-by: Yonatan Maman <Ymaman@Nvidia.com>
Signed-off-by: Gal Shalom <GalShalom@Nvidia.com>
---
 drivers/infiniband/hw/mlx5/mlx5_ib.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/infiniband/hw/mlx5/mlx5_ib.h b/drivers/infiniband/hw/mlx5/mlx5_ib.h
index fde859d207ae..a7b7a565b7e8 100644
--- a/drivers/infiniband/hw/mlx5/mlx5_ib.h
+++ b/drivers/infiniband/hw/mlx5/mlx5_ib.h
@@ -1734,9 +1734,9 @@ static inline bool rt_supported(int ts_cap)
 static inline bool mlx5_umem_needs_ats(struct mlx5_ib_dev *dev,
 				       struct ib_umem *umem, int access_flags)
 {
-	if (!MLX5_CAP_GEN(dev->mdev, ats) || !umem->is_dmabuf)
-		return false;
-	return access_flags & IB_ACCESS_RELAXED_ORDERING;
+	if (MLX5_CAP_GEN(dev->mdev, ats) && (umem->is_dmabuf || umem->is_odp))
+		return access_flags & IB_ACCESS_RELAXED_ORDERING;
+	return false;
 }
 
 int set_roce_addr(struct mlx5_ib_dev *dev, u32 port_num,
-- 
2.34.1

