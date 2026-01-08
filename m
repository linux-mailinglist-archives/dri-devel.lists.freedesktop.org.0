Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC712D02522
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 12:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5712F10E6EB;
	Thu,  8 Jan 2026 11:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RUD6+qc0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010044.outbound.protection.outlook.com [52.101.61.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC3C10E6EB
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 11:12:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGX+0xHNLkLIcewt4ER3SMJ5LIRQ4ld1maY443SDmrA4FiHq5Y31AM2oebBuucYIcohmxMMK9Pg1M0fEhsIX3ewLPmrue+rD2YGHqKnrgay1He/chm4qPDi92zVr1XQ/CdX/+keZVByG8BnnH2SaiXd+OiBm61T0ZIWWHVwmpdE7b4FvomW5hwqGSh5j/RwiP6f3jF7E/Ka4voJhNFI8Vr6okI3HubuucoFwXBGnUGsV1qbVWDRr2LLBt9XLkeUE6e8T6+MrLLRnIQR+UN9sMeQ/QRNUFd+8amJZGakzaniO7cVpeZH74h9/SvgaYLhu21fFKvt9ayC/cEhXLvlp/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQF0RcbT8HBaX/drFiGQ85wBDNXkSxP2t5Q7GqzDVhg=;
 b=dBowZDFG6gndDMZOvkjcpQsRj1dM/F6d43GbowVodX1gO6T5+JftwIMVFQ/QLPlw1jjQiuMKBkFEfy8XV9xfhUtcHz++6EpTUi/CiRajNUKx1+rkA517RhRiLQLm+k6+GQo3xB8luUNwOWhXwtm9IDvj3jadu37NVt2YW50unY7pJ2XyldcPJIS3LTSsH5QXmAtX7BnvhCo3hsFgHRmD9hSt7pV5XN3CWVFLF1CLs8edxb0J1WsYG76lAsxeI49uOI2wDDI0I3wb4kYwJ/UzIOKIvnTwv0d8cV4O66BCYat3jG1G/atpFyKPQKtYB1KPo5JYSyJADhEOl0Ki8O7Kcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQF0RcbT8HBaX/drFiGQ85wBDNXkSxP2t5Q7GqzDVhg=;
 b=RUD6+qc0vaANcoRMgsuuFR9RA46hSfR575KKoOxXl+rK4TEoKGLf9CRgLxDXWeIny/8rt68nG97KR4d2HL2QM1armTZjLLnPi/O+K3zlRaxIUl+4fE2b9QQcCpp1rzCfWaU6fjcZzrpQk4psHNwNeBrAus0CFXsZ+218LlEWU13rL8GPMaIK0v7zX6Ec0mRHV6K5zYwXqoVezGkKI4CwNuVtR+Cfu462GWPMQyZxvYsJx9RmY/8uZxd6sTntmtUk2greAEELMX+AQo/2RsBHnw/FUfN9uTDzDuPJwmVPBA014wlwozo6wBvTur4XhFLL5yzWwv4HiKgCc2bX7Mntqg==
Received: from BN9PR03CA0372.namprd03.prod.outlook.com (2603:10b6:408:f7::17)
 by SJ5PPFA5F0E981D.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::99d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 11:12:52 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:f7:cafe::41) by BN9PR03CA0372.outlook.office365.com
 (2603:10b6:408:f7::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Thu, 8
 Jan 2026 11:12:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 11:12:51 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 03:12:39 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 8 Jan 2026 03:12:39 -0800
Received: from c-237-150-60-063.mtl.labs.mlnx (10.127.8.10) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 8 Jan 2026 03:12:36 -0800
From: Edward Srouji <edwards@nvidia.com>
Subject: [PATCH rdma-next 0/2] RDMA: Add support for exporting dma-buf file
 descriptors
Date: Thu, 8 Jan 2026 13:11:13 +0200
Message-ID: <20260108-dmabuf-export-v1-0-6d47d46580d3@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANGQX2kC/x2MQQqDMBAAvyJ7dmEjpKT9inhQd2330EQ2KgHJ3
 xt6HJiZG7KYSoZXd4PJpVlTbOD6DtbPHN+Cyo1hoOFBjgLyd17ODaXsyQ4k9s9APjA7gdbsJpu
 W/28Eay5GKQdMtf4AxQBphWoAAAA=
X-Change-ID: 20260108-dmabuf-export-0d598058dd1e
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-rdma@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, Yishai Hadas <yishaih@nvidia.com>, "Edward
 Srouji" <edwards@nvidia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767870755; l=2739;
 i=edwards@nvidia.com; s=20251029; h=from:subject:message-id;
 bh=WId4KVIGPxWRW2HKmS70Opd/uu+qThVYHLI4EtQ6JlA=;
 b=RAg9dHioDbZudkFgmslrW68DqhtLIZYq1+ZewP+nRDPEZ98TbFBoJj3KaFT7FhkYCgO7XQsZk
 TvqZ52LgujEBjRZyDf3pfCMsgw72/z8WAzHk1kyksuwkrtv6p3suZG3
X-Developer-Key: i=edwards@nvidia.com; a=ed25519;
 pk=VME+d2WbMZT5AY+AolKh2XIdrnXWUwwzz/XLQ3jXgDM=
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|SJ5PPFA5F0E981D:EE_
X-MS-Office365-Filtering-Correlation-Id: 41e501a4-b8b4-49c7-88ba-08de4ea6dd2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3BRaE1OR0ZzNXFtTGVmRTdyMk1mUnNtMHlBbTBTdDIwM2ZYMWZ2cnk2QXFF?=
 =?utf-8?B?TmpxcFhNWk5PVHd0OHBjVXk3Umw0dEF6ME9HQVNaUWlwZVFrLzZzOTBOMXZw?=
 =?utf-8?B?OHhJdDdFQzR3MmNodHVSYUcyTmo5ZkMzc0RnM0srTUpkcm5ZZ280VnlQWWJq?=
 =?utf-8?B?enpwZHdjWUtDUWFjNTFybWk1SmdwWVpvV0tKYWJrMlZab056R1NKQXU5UWFv?=
 =?utf-8?B?NlkxMWtVK1ZMZHBmUzdxdEMyVXliSE9Uektab2tpVUtZeXY0UW5QMVlFT0Y4?=
 =?utf-8?B?WGlzdTdQUU5BQlJtWWI2d0hjL01CT3VXZG1nU0RqbHZUK0ZBeXRNNEsxa0g5?=
 =?utf-8?B?V0k5UE5RUUpodndsN1lYeCtFa0VmTERqamxacm9YZnd4R2NUTStTN05WS3V6?=
 =?utf-8?B?VHhvaGhFU0Y1MjhxTEplSXgxYmZzeWhGMUVadTFaOHFZbWwyejFJM2s5Vjdt?=
 =?utf-8?B?TURxMjdmK2swM2hTUUxhcUFENi9NaWpoY1pMUFcyQ3AzUUNwVHg2clNLbzhB?=
 =?utf-8?B?Um5iWGgwWmQ5aEtvQ2t1VFBWRjdRVFdZUno1Qlg0UGk4MmJ5R1lEeDNIbWlz?=
 =?utf-8?B?MG80QmJ2L3lmTDdITU03cEk1WjVIRmMyWWp0c3Z6bHRaMVI2eEJaUzdkcG9E?=
 =?utf-8?B?VzBUdnUyVVg5U2VGK2NxOVZIWlU1V1E4cGpaeitFdHRwT1o2VFFaaHZLa1hi?=
 =?utf-8?B?RDhxNnlWb2xDbkNNTGhEYUs5YmJnZGxzS3hObjVXeFFPc3hYWDNYOG45bUtU?=
 =?utf-8?B?ZjRnQlhleGsyYi9zcHFVRlk0TTdaNkloWmtlZEVkWVluK2I2aVhNV1M3SmNC?=
 =?utf-8?B?OEFNQlJudmxYMnVGNW1rODMzaWI2T0ZjYUF4ZXg5Vmg2VmRoWmVHOGhqQzdR?=
 =?utf-8?B?MlYxdjNsK05OVjRBRHZXRUEzUDFDaXdqNlhXb1NFaWI0MnhibWs2cXRzdWla?=
 =?utf-8?B?aTJzeThtcjF1YmpqZlluUE8rcllXSitZUGtLYUFJTkVSTFBVbnUvczNENjkz?=
 =?utf-8?B?R280ZjdBeUk5OHpUUU40ZWxSVGN3b2MvamJxNW1iK1FlQzl2ZFBOYUc0ODB3?=
 =?utf-8?B?UjlSTmdyNGtDS0RwRGRjQXhZMjRNcFZQSDJTSVJoenliN3IzbVlUQ1ZNR0pK?=
 =?utf-8?B?emNIb2diV2RPclpKR05IS2dsckRMaUxpalprZ3IvNjEwSE00ejZ1UjA4Z1c0?=
 =?utf-8?B?bG1OQjZiWGVOZnFhWVdOV1NZZWhUc2xsUmNPY3c1cFZNUnF4WnhnUERrellh?=
 =?utf-8?B?ZEQrWUZOQ3ZHSFp2S2JoaFZERStDaGdhbkxVNEpWY1JQbmJuYU9GcWFyYWYr?=
 =?utf-8?B?MG1UcWNtWnAybm1SYUdna3lVU1JNZ0FVajB6dVRqTUJSSHlvQ0ZNeEZIaSt3?=
 =?utf-8?B?Q013OUovNERUMzc5RTZ2Z2ZqcFdvM3JoQ0kvVEFGdVFVci9acGRZSHE0dkpz?=
 =?utf-8?B?b2psbGZLemJTYk9pMDAvSEUzTTdDS2FhNTc3Sy9jWlZDRnNnSXdBSE9sWExt?=
 =?utf-8?B?UVhaYS9XeWRrQnFmUndYdmFjWmJSN1N6UnNhZVZ3YWdXaThKUzdhdXRPT05V?=
 =?utf-8?B?ays3Z0xuL3kzTHJxdkxYZkRSamg5SXFaR214RGxpM0l2S09CZ05kWWt3N2h3?=
 =?utf-8?B?cHJrQjlvSmRZUjcveHd6L3FXTWVXZU0zOFRndmRMbXhoYnVDaG04djM3blhr?=
 =?utf-8?B?ZThHSWdOdnNpdjNBMUNMZ0hEQjBuZ2JLYVBVUWw1M0o5aklVVUJaTXRXdnFM?=
 =?utf-8?B?cFNsNmZIbmFwNm9Xd0x6ckhrVjNBNi96RFBGNTNsVytOcEN1bW1ET2drMTJY?=
 =?utf-8?B?SzZIRjBBYktnUUlxa1ZRdGZZampOZmo5bDQ2alUrZ0hGK1pNV1BWWEVVSERw?=
 =?utf-8?B?N21lMkZJZkpjR0NCMUJGemlVUXJzck9lZUlNelZsQk9xUFVFVFFlUlBYMGQ1?=
 =?utf-8?B?cHZLdE5FMEd1YXhsOGlNWlI4dHI2MTdOaGk4QmRPRjZpMHI1R3NJdHE5eWxZ?=
 =?utf-8?B?Vk1qVlN1Qk5OanUzVzNGZUVWMTdtaGdTcC9yVDd0bVlsUGNiek84NC9mcFdL?=
 =?utf-8?B?UkhNQXRaSmRUUS84M1hybTdpNHJpc1RtOHJEekhFVnFKVWE0Rm1aYVNYVkg2?=
 =?utf-8?Q?ndh8=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 11:12:51.3822 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 41e501a4-b8b4-49c7-88ba-08de4ea6dd2f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFA5F0E981D
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

This patch series introduces dma-buf export support for RDMA/InfiniBand
devices, enabling userspace applications to export RDMA PCI-backed
memory regions (such as device memory or mlx5 UAR pages) as dma-buf file
descriptors.

This allows PCI device memory to be shared with other kernel subsystems
(e.g., graphics or media) or between userspace processes, via the 
standard dma-buf interface, avoiding unnecessary copies and enabling
efficient peer-to-peer (P2P) DMA transfers. See [1] for background on
dma-buf.

As part of this series, we introduce a new uverbs object of type FD for 
dma-buf export, along with the corresponding APIs for allocation and 
teardown. This object encapsulates all attributes required to export a
dma-buf.

The implementation enforces P2P-only mappings and properly manages
resource lifecycle, including:
- Cleanup during driver removal or RDMA context destruction.
- Revocation via dma_buf_move_notify() when the underlying mmap entries
  are removed.
- Refactors common cleanup logic for reuse across FD uobject types.

The infrastructure is generic within uverbs, allowing individual drivers
to easily integrate and supply their vendor-specific implementation.

The mlx5 driver is the first consumer of this new API, providing:
- Initialization of PCI peer-to-peer DMA support.
- mlx5-specific implementations of the mmap_get_pfns and 
  pgoff_to_mmap_entry device operations required for dma-buf export.

[1] https://docs.kernel.org/driver-api/dma-buf.html

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Signed-off-by: Edward Srouji <edwards@nvidia.com>
---
Yishai Hadas (2):
      RDMA/uverbs: Add DMABUF object type and operations
      RDMA/mlx5: Implement DMABUF export ops

 drivers/infiniband/core/Makefile                  |   1 +
 drivers/infiniband/core/device.c                  |   2 +
 drivers/infiniband/core/ib_core_uverbs.c          |  19 +++
 drivers/infiniband/core/rdma_core.c               |  63 ++++----
 drivers/infiniband/core/rdma_core.h               |   1 +
 drivers/infiniband/core/uverbs.h                  |  10 ++
 drivers/infiniband/core/uverbs_std_types_dmabuf.c | 172 ++++++++++++++++++++++
 drivers/infiniband/core/uverbs_uapi.c             |   1 +
 drivers/infiniband/hw/mlx5/main.c                 |  72 +++++++++
 include/rdma/ib_verbs.h                           |   9 ++
 include/rdma/uverbs_types.h                       |   1 +
 include/uapi/rdma/ib_user_ioctl_cmds.h            |  10 ++
 12 files changed, 335 insertions(+), 26 deletions(-)
---
base-commit: 325e3b5431ddd27c5f93156b36838a351e3b2f72
change-id: 20260108-dmabuf-export-0d598058dd1e

Best regards,
-- 
Edward Srouji <edwards@nvidia.com>

