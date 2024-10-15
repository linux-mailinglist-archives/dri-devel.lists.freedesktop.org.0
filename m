Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6088999F7B4
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2024 22:00:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66CBB10E5FE;
	Tue, 15 Oct 2024 20:00:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hyqXcJmb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2063.outbound.protection.outlook.com [40.107.102.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3476410E598;
 Tue, 15 Oct 2024 15:24:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2evHHOJ26ThGW8sUtyaCQegNc1PJd6s/dYQ/w+XwPV6GZKYGrcApa+QfgLzVUiZrEKzBoOqUbiAuAePOrH2rXkw5L3L1YioNNL+TH1EhynHkchXUS7p0w7/LYfGZfrNBzRJcDpaP+cp49kVeJx9bh1hpEZ0gNAorLAVfzasolkuV3uiWx+BbeuTel1mpJW63+dVK+INFczqDCJijxiuN9EcjiKnntZqUMv4R5/e+X5TuvwF0fh8MoQ0Rx6gH+Ou7k9R1o7hn3F4T2lN8RvEe+WTzJfhQAi5UhekPqjwJh1t8TKNmQNrx+UxHTenWbdK0qLcvWHp4ae92BYa7o2rlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wE5tQ0PgpoSdnn+RUVbHJmE1TQA5QsSTlbYjB79bN/4=;
 b=QtddrZIwFCcRt0e/Bfp8KgmP5cDjCq3Ph+6C4NGukTkJxFuRq1+qe22OQcI4kPvP2M7YbxSenolOPWZnhSSZiujKrdXYS0LL4r/2hcQ7JXViKcBD07NyX8M7HI4SLbqNzybLobZkO33jqFEfsOiyMVzgbpNHAUPkdf9tHMsKY1CTbA2FQjLC+vqZ+fzNaUI0POM4V4mpKMyrQxYQGaOg8g8uHmBU9aUsbIsqVP4/7FQ1Sb/0IFa7VxNqXWgCydBRxay5mXWTdMjfiDIRNdhQBa3Lh1f7J4rvbFK2d2hQxra3g6MC8EvnwhSeUKnmW4Sw1ml3u+v8o23ZUri2ulN7Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wE5tQ0PgpoSdnn+RUVbHJmE1TQA5QsSTlbYjB79bN/4=;
 b=hyqXcJmbMfvgLNAaVqlQ4p50SxUNqZzgpcPTFh3xidmRQUx7BdoUnfT/GQuk0/oqWxvh3yYu+3iaKh15FcYAmrhLi5rFFl5XWwcEFTrIKw/xKARQhkF9xEmpyWX6NKljSWCQmTz7QepwC+9Yu/YayOhiQH4waNb2sLQi6bBGAbtRZstoYNpO2AWUAjkn+2fVnbKNS16kb6jZsCqF9Iz196V0XmGUn9Pwn2XWOP/jp6XjD1Jno+Y4i4NG2/C+fa6/n9dE5pj0wfCb4uKkXkd5k7hxf384LltRN529+jcwtlGRXDQ/A+FKm8ZSRYYYSiCJuzL7BhBJQxegNYIJ/FQfWQ==
Received: from CH0P220CA0028.NAMP220.PROD.OUTLOOK.COM (2603:10b6:610:ef::7) by
 CH2PR12MB4294.namprd12.prod.outlook.com (2603:10b6:610:a9::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.27; Tue, 15 Oct 2024 15:24:07 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:ef:cafe::be) by CH0P220CA0028.outlook.office365.com
 (2603:10b6:610:ef::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27 via Frontend
 Transport; Tue, 15 Oct 2024 15:24:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8069.17 via Frontend Transport; Tue, 15 Oct 2024 15:24:07 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 15 Oct
 2024 08:23:56 -0700
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Tue, 15 Oct 2024 08:23:56 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.1544.4 via Frontend Transport;
 Tue, 15 Oct 2024 08:23:52 -0700
From: Yonatan Maman <ymaman@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-rdma@vger.kernel.org>, <linux-mm@kvack.org>, <herbst@redhat.com>,
 <lyude@redhat.com>, <dakr@redhat.com>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <jgg@ziepe.ca>, <leon@kernel.org>, <jglisse@redhat.com>,
 <akpm@linux-foundation.org>, <dri-devel@lists.freedesktop.org>,
 <apopple@nvidia.com>, <bskeggs@nvidia.com>
CC: Yonatan Maman <Ymaman@Nvidia.com>
Subject: [PATCH v1 0/4] GPU Direct RDMA (P2P DMA) for Device Private Pages
Date: Tue, 15 Oct 2024 18:23:44 +0300
Message-ID: <20241015152348.3055360-1-ymaman@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|CH2PR12MB4294:EE_
X-MS-Office365-Filtering-Correlation-Id: 02c3d9b1-ad89-47dd-abb5-08dced2d694b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|7416014|1800799024|376014|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H1voHeiAKH2orGQxiONk1KWZ2YdElyHQMkT1nfw3A1sz5iGZNh8E4f9YIyB3?=
 =?us-ascii?Q?C/Wu+CfxKn8GUbR/TgmqFXG2wS4yT1t+iAyw9WJMVPJ9IouTs8DmPKgcVB90?=
 =?us-ascii?Q?m4PsbLV1QkAKjXFRL1Mm1Ak4PMA2FKoXc3Mx5hqh44HuqfprMHsQF7LaeSkb?=
 =?us-ascii?Q?hG5s7zZbuCn/niMC19dbzCkBt7zv43MdJFcCrN21ww9rWEmO7eT72mFX2XEm?=
 =?us-ascii?Q?ATcv6R4wh2/wVZ61jzJ5J63ju/ZCbfefzOjJTc7uitYy3xEIwW/4PF4ljgY4?=
 =?us-ascii?Q?M2mtApRKXtQJsLNaSXjanX6/NAxKnx5DycDFD2zOOHkLEDcb/pIKRpZjsoaz?=
 =?us-ascii?Q?j893fNM4lDrJ68KEsa6H6GbgfBRwZ8hy33IVImFJx1QWBG3iAiZpoHyq24kZ?=
 =?us-ascii?Q?Hr0ickaXnp8k2VzhkczoWArwFLI2ZbGxSn7GKmnqD4BN+Jgk7rKszrBcjcv6?=
 =?us-ascii?Q?ku8czYLwu1q8HgcNQ5Z/eyXobelSSXhGXMQdYAbsR1W4/GThKRyUVYsPpxzr?=
 =?us-ascii?Q?TPkF55FKzp3xCe6SVjvOTfDU2BXEmRrFDuZiWtefDg0Up8xK6Aeb44ouys63?=
 =?us-ascii?Q?gpPaFSLVPo+zjKc1fPQj7kTp15uAzlFlO/ejC+vu4zXjzi1nn0ztYn7XPF+e?=
 =?us-ascii?Q?2QE6erKaTMw11TrG6WQobBHMyD60zAeILRmehCXGoTrWaRWwXfPahXIgZmvb?=
 =?us-ascii?Q?8alGG21fSvbv7f5E+MYKVLevXuJmxRF04Mq2EnoR2YwY/X7nsjHpoOhDnELv?=
 =?us-ascii?Q?okiDmW89t9KSHULLW//ayTdhA/whA9mcPhgn0k7aLmYGuVLGUwSJHz9RcNdA?=
 =?us-ascii?Q?GZtZ0VGnSdLnZU6+BgBn1i8EGkETI2SzO0IpAnmZJDy4SDzRmuoyiTHoZ6Ot?=
 =?us-ascii?Q?mnEDPuRLRkJBQ0+NggOAhTS6Ffe0r/48ObEyNy4XGVfMcYtE6ypqWK40ENjl?=
 =?us-ascii?Q?SfnpRyqK5kKS4dkNGzbzV2BH14FWaRmZ1tBLlL787Bmfjy2+9MH2HwgXgpn3?=
 =?us-ascii?Q?Jfwupw0nX2Jmh1Opjpo3QOLmPNhOZ/89Fuujyj1oDM7Lbgd/XRnApO2NeX16?=
 =?us-ascii?Q?r/aEQVlCmzbrvGtmxK0pVFTFrncWJeLFtXnFDT6CsfjUkqridhNPLP69mF2p?=
 =?us-ascii?Q?H5pf1H2GzEWxX5tT7mGcnD2aYrYh5geara0C5rKBdKJPAcjTC4AB/Q+M5u5m?=
 =?us-ascii?Q?xb5URZtMpYHdvLRJhXBTlDdnuJ7m8yCwsN2CRdMM6J2rlV9c1heS5vm/3Lfc?=
 =?us-ascii?Q?WiN8voIH+0JSp+H/XG0nnL8xI5zViUbbQmqvLM4jvP17UnrHDjqqOSBWzWKm?=
 =?us-ascii?Q?CdNsbyzrvOL9u9WOm1fJqv487TOqSkttgKIRiyjC6JatCg6+an9d7nNqmLao?=
 =?us-ascii?Q?hOdKJhR7LgYB6oYkBu+R+5pwd3iG?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(7416014)(1800799024)(376014)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 15:24:07.4239 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02c3d9b1-ad89-47dd-abb5-08dced2d694b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4294
X-Mailman-Approved-At: Tue, 15 Oct 2024 20:00:36 +0000
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

This patch series aims to enable Peer-to-Peer (P2P) DMA access in
GPU-centric applications that utilize RDMA and private device pages. This
enhancement is crucial for minimizing data transfer overhead by allowing
the GPU to directly expose device private page data to devices such as
NICs, eliminating the need to traverse system RAM, which is the native
method for exposing device private page data.

To fully support Peer-to-Peer for device private pages, the following
changes are proposed:

`Memory Management (MM)`
 * Leverage struct pagemap_ops to support P2P page operations: This
modification ensures that the GPU can directly map device private pages
for P2P DMA.
 * Utilize hmm_range_fault to support P2P connections for device private
pages (instead of Page fault)

`IB Drivers`
Add TRY_P2P_REQ flag for the hmm_range_fault call: This flag indicates the
need for P2P mapping, enabling IB drivers to efficiently handle P2P DMA
requests.

`Nouveau driver`
Add support for the Nouveau p2p_page callback function: This update
integrates P2P DMA support into the Nouveau driver, allowing it to handle
P2P page operations seamlessly.

`MLX5 Driver`
Optimize PCI Peer-to-Peer for private device pages, by enabling Address
Translation service(ATS) for ODP memory.

Yonatan Maman (4):
  mm/hmm: HMM API for P2P DMA to device zone pages
  nouveau/dmem: HMM P2P DMA for private dev pages
  IB/core: P2P DMA for device private pages
  RDMA/mlx5: Enabling ATS for ODP memory

 drivers/gpu/drm/nouveau/nouveau_dmem.c | 117 ++++++++++++++++++++++++-
 drivers/infiniband/core/umem_odp.c     |   2 +-
 drivers/infiniband/hw/mlx5/mlx5_ib.h   |   6 +-
 include/linux/hmm.h                    |   2 +
 include/linux/memremap.h               |   7 ++
 mm/hmm.c                               |  28 ++++++
 6 files changed, 156 insertions(+), 6 deletions(-)

-- 
2.34.1

