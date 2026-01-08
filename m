Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2E8DD02525
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 12:13:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64EEB10E6F0;
	Thu,  8 Jan 2026 11:13:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="t4+Rcl5A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010064.outbound.protection.outlook.com [52.101.201.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1419E10E6EF
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jan 2026 11:13:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V37XfbsKBCGIH2wAJXWmQyBuoXQYn5SYMSTS1TjKSW/aoRFn3bRPygWWKRZTwT4Rg1KoDbcYcLEczX8sSd/OwjTZATlp+uGPbxPWxkhJTS6IfM4Mwhlw0b3CY82NC/ZF1mTS4/KYdmrLXmVEBZCWmX66LlGvABcBSADHULsNpYAg6v1odOLQE7YWRdHYVvlW7nEA1376f3vEaJRNRlDKDEh5P8kh4Ei7HkjWEEcLlv5Cd0wJJp19iyAoZmPdK0lNWZaZG/8v9d3DBog/8CofHjl9Qqs4YxY6mIURxoqF9Bhkzm+RQhnkcuBb1P6GVXTJjcTnsV18TFetadcpr/57vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=guS7C01Ay+Xs+AgEP27k0Jhy1BJtayG/9UZW9q2z5Lk=;
 b=lP460CK/m2eabWW2/zV7rQPzlbWmBBP4qV35UIR+g23hs0ZIzPlCT6x+0MAA00pnCP5pkpnpAZ1QH06G+OlSrXcaL4DsuGFOzezyCZHtn/tFtPGdySFvhUamXJ3vRDgEjRP1AnM+oaFQMZ1l1npMQ1Bft6EH0dmlysrKTBAK5FATXwWl5c8rXpG6iQw2JDTfgm9PFLzJVGAF3WKL1i4c8ChDeWDLczdX7NalVImf+c+720QZMzEk41eTrmd3Rgy1BBE8ZHdNZf5LH5kzVNUXJuN968AIkW6m2zwEA6PvNSNctU3Fh3Yh1BdbvdoriCAj7DngVACADHrE4QHzQZXfyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=amd.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=guS7C01Ay+Xs+AgEP27k0Jhy1BJtayG/9UZW9q2z5Lk=;
 b=t4+Rcl5AqnDM9sbfc+viBlHsiAXOApGtFL88J9EQyHYMX4Wd2sdyjd18a7eRq4EXWdpKGm+qXwXjIGrKFHuudAaduX5kLo0u3QAGr43cmJvF4Uj84dQog07BufDXIbOASXUj67hHG5vkb73rxxcAe8LNtWzBI0eBGE6e5Qi1mn9AR3J6NqnhEZfwV+jh0B6JI+7zDw554UEydEDm5kSfLxb1Do2XLsVIHZnvUa1P3rQ2cFLvFfbzyjy28PC2cwJjmVxjUa/gpKH+/3C8wkP4DKS7av6fWD1yljoCsKkU1j6OPnQsJL+5arTjyU2L602lj6STkdcx2XaleDWYnN9n4Q==
Received: from BN9PR03CA0270.namprd03.prod.outlook.com (2603:10b6:408:ff::35)
 by LV2PR12MB5966.namprd12.prod.outlook.com (2603:10b6:408:171::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Thu, 8 Jan
 2026 11:12:58 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:ff:cafe::d7) by BN9PR03CA0270.outlook.office365.com
 (2603:10b6:408:ff::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Thu, 8
 Jan 2026 11:12:54 +0000
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
 15.20.9520.1 via Frontend Transport; Thu, 8 Jan 2026 11:12:58 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 8 Jan
 2026 03:12:43 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Thu, 8 Jan 2026 03:12:42 -0800
Received: from c-237-150-60-063.mtl.labs.mlnx (10.127.8.10) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 8 Jan 2026 03:12:39 -0800
From: Edward Srouji <edwards@nvidia.com>
Date: Thu, 8 Jan 2026 13:11:14 +0200
Subject: [PATCH rdma-next 1/2] RDMA/uverbs: Add DMABUF object type and
 operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20260108-dmabuf-export-v1-1-6d47d46580d3@nvidia.com>
References: <20260108-dmabuf-export-v1-0-6d47d46580d3@nvidia.com>
In-Reply-To: <20260108-dmabuf-export-v1-0-6d47d46580d3@nvidia.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
CC: <linux-kernel@vger.kernel.org>, <linux-rdma@vger.kernel.org>,
 <linux-media@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>, Yishai Hadas <yishaih@nvidia.com>, "Edward
 Srouji" <edwards@nvidia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767870755; l=19062;
 i=edwards@nvidia.com; s=20251029; h=from:subject:message-id;
 bh=y7C0RympZd0YVOoCvPw24r7ZlT/X5iPru/hGz4vcO90=;
 b=Lfg07enw0vLjtj6oyvOsyJFGC8P/HhfOKaWcJg1bYYHPVpvxy77X3o0+GJkdj9reg3mY55njN
 pH0eQ5v1InsCNS5YSVj1pdDsesXutpq9Cmu8mDja/QVH/iALurTFxtk
X-Developer-Key: i=edwards@nvidia.com; a=ed25519;
 pk=VME+d2WbMZT5AY+AolKh2XIdrnXWUwwzz/XLQ3jXgDM=
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|LV2PR12MB5966:EE_
X-MS-Office365-Filtering-Correlation-Id: 55e41517-3e68-4a3d-c3e9-08de4ea6e15a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXRuOFY4b2VpV1VGSWFFMVR2cEdRc1Y1emo2ckVlTkNKclRKVWE0ODZCSW1W?=
 =?utf-8?B?ZVJTbjJWRUJGbjFtLzd1cERzWWhXNk54QkgyRFpFY2FHR0dQZWtTWWhucUw0?=
 =?utf-8?B?NWhCblRUWUdEbVdML0N6YS9oN1VacVhleTR1NGpTR0FzUUU0Z2YvRmpNWEVI?=
 =?utf-8?B?WmVzSU01SzMzeXB6cHJZaGk5Yk1hZXp0ZkZ5Qk1LUzN0MStiZW1PeXF1V1FH?=
 =?utf-8?B?TGc0Qm9ITmY1eFBuVVpXMUpmV0RBeE5zSWY2bUVFZWljWEE2cDFxOWptUkZz?=
 =?utf-8?B?RDNTR1QxQmhwUVVabnI5ZmJvOEh6TXM0NDRYU0crSUdNVURscFBFamo0bERB?=
 =?utf-8?B?cEY4NkFwTEdsRlkwckR6a1RNeE5Ga2hoWVFjT0NnL09tcVhERHRIUmE5WUdq?=
 =?utf-8?B?Q1hPNjN0UWYzcFpaMEI4dStObG9sM1F4WGo0NHdpaTlub1VSUzEvY1dqc0ZG?=
 =?utf-8?B?bitqWGdPMnRrWFZFTVhDRU5XNXh5SDIzY1hUQjZ5anE2U2JQVTNBWFV2SlUw?=
 =?utf-8?B?ekQxdkdFSE9leitKaXozdm1ONUFPYzZKdjZJSjZNaCtWaTlTejZWQ1JFSm42?=
 =?utf-8?B?QnFTTHRrS3FETW1TVU1SYldrNk55eHBxaDAyT2FmRnZQNkQ0dEhpTTNIY3pw?=
 =?utf-8?B?ems0dStZVzZLSTk2eU9ZR05YMmQzNThjdUkzUDZVWTFFbGE2bUVMZS9oNkRy?=
 =?utf-8?B?OFdtYVREWVJQc2IvZkViVFNqVGhESys5dUVBbVpnMXZNaytTeDdKOHpKcTl6?=
 =?utf-8?B?MkVqNjVyaDUzdTVRN3NnTjFBaU9IcTlGQnltUnhnODVjUGdaZzlMNlYrZW8x?=
 =?utf-8?B?MmN2Tmw4c3B3MnZGWTBpZjlZN2RaK0NrM3VOSFlBcWVIT0hqM1pLdXJyRVlw?=
 =?utf-8?B?UDRqcjhtb2I4bjlXSHdBYWNYK1Ntb1FjYStFejdWUlp2VHk0NDBwNEYwRW9y?=
 =?utf-8?B?dFQ5S2tlRE9GeDI3QlZNbk5HaWprN0R1bVhQNmVMY3lVUHF4NUlma00xRzU2?=
 =?utf-8?B?M01MTDhrYTI2dXpHUzNBMExVOW9RNUlZVzhWQ1d3bVVKaEdsb1dreHhpY0hO?=
 =?utf-8?B?MDBTRUNwSHZxd2pWWldEK3NnZERLZ1RJWUxselcrU0dpWFpQdnF3SjI5OTho?=
 =?utf-8?B?eGU5VDk2WUllK3hCeEVQZ2xHM05UK1IvTmFxbnJZQnhLcUd4NXd5QkRXdGZq?=
 =?utf-8?B?NVhsc0RjQm1VOUZmckJWNE9XT29UMTNsT2tneHhmS1RyQVloMnJtTkxQRk0y?=
 =?utf-8?B?UlZuTjlabUlLUDZPZ0x0bGg4Sm1TTHZlRVVOV0o5TFpqSWR1Q1NKaHpSTUhP?=
 =?utf-8?B?Q0J5cHpwczNYakVnditxOFliWWtjREJ0Vy9OTHlrRlMrbEZjYWwrdzdNWUw2?=
 =?utf-8?B?Y3lpSDZudFp2UVBMd3FtVW5NUS93QlI5NzVtRSs5VGZuTUJpWFc5Lzd1TzBS?=
 =?utf-8?B?R0UzdVdrWU16SjZpTkZaYzVSN1lnR3VuWEFFUFJlL1VRaTRxZmZIVi9NWlEx?=
 =?utf-8?B?STlwWUZMMXpwR0ZyN0h4ZGluZE9UemRpMEduZFI2QkRoRlV6U1l2Q1VyTE8z?=
 =?utf-8?B?VlhHMUM4aEVhSmJSQU5EK295RmVOYThoZ1hHK2pPUU9HMGppZlZjaGRoZzkx?=
 =?utf-8?B?R2xhMUF0Z0VId3dQTE8rQjlPY3hBSEZBaVNESjNuOW4yMkI0NEFSNFdTSXB2?=
 =?utf-8?B?bDFnK0JLUUlpMC9QQzlqaDhjdFA1Vk90YjQ4YW55bVZOWlZZblBIRWlDVzlk?=
 =?utf-8?B?dngrUDhjeEJ3MEhzdmlsM1FFTnJpSklqdFhWbGJ1bTRvV2dkdHQ1UGtrVnJx?=
 =?utf-8?B?Nmk1U0NBNGk5QUNjWUNKUnYwWTRPREg3eUJQcCs0UHRUTk5zcTJBNXJPd1Nl?=
 =?utf-8?B?cmFpcGQ4UkF4c3hMMWlzQldjUjNja1lYNnNESzhHWXRlb21DVHBDZFFkTXgz?=
 =?utf-8?B?RFI5bmJLL0J3NjJNZmZ1eEt5bDJFMldjR0FwWVRUdm9MOGxJbmdhNGQ2cVNV?=
 =?utf-8?B?TnAvNnZrRjluM013ME5sbUVBamM1eTNFaWRIZThtTzlyOUZEYmtlOWJ2MWhM?=
 =?utf-8?B?SXU1bWZOQk1aMGRHWFNmTTAvVHNqUFZSU1RWQkFFR29wKzhIRkhNbjVlSHZa?=
 =?utf-8?Q?hP5I=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 11:12:58.3641 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e41517-3e68-4a3d-c3e9-08de4ea6e15a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5966
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

From: Yishai Hadas <yishaih@nvidia.com>

Expose DMABUF functionality to userspace through the uverbs interface,
enabling InfiniBand/RDMA devices to export PCI based memory regions
(e.g. device memory) as DMABUF file descriptors. This allows
zero-copy sharing of RDMA memory with other subsystems that support the
dma-buf framework.

A new UVERBS_OBJECT_DMABUF object type and allocation method were
introduced.

During allocation, uverbs invokes the driver to supply the
rdma_user_mmap_entry associated with the given page offset (pgoff).

Based on the returned rdma_user_mmap_entry, uverbs requests the driver
to provide the corresponding physical-memory details as well as the
driver’s PCI provider information.

Using this information, dma_buf_export() is called; if it succeeds,
uobj->object is set to the underlying file pointer returned by the
dma-buf framework.

The file descriptor number follows the standard uverbs allocation flow,
but the file pointer comes from the dma-buf subsystem, including its own
fops and private data.

Because of this, alloc_begin_fd_uobject() must handle cases where
fd_type->fops is NULL, and both alloc_commit_fd_uobject() and
alloc_abort_fd_uobject() must account for whether filp->private_data
exists, since it is only populated after a successful dma_buf_export().

When an mmap entry is removed, uverbs iterates over its associated
DMABUFs, marks them as revoked, and calls dma_buf_move_notify() so that
their importers are notified.

The same procedure applies during the disassociate flow; final cleanup
occurs when the application closes the file.

Signed-off-by: Yishai Hadas <yishaih@nvidia.com>
Signed-off-by: Edward Srouji <edwards@nvidia.com>
---
 drivers/infiniband/core/Makefile                  |   1 +
 drivers/infiniband/core/device.c                  |   2 +
 drivers/infiniband/core/ib_core_uverbs.c          |  19 +++
 drivers/infiniband/core/rdma_core.c               |  63 ++++----
 drivers/infiniband/core/rdma_core.h               |   1 +
 drivers/infiniband/core/uverbs.h                  |  10 ++
 drivers/infiniband/core/uverbs_std_types_dmabuf.c | 172 ++++++++++++++++++++++
 drivers/infiniband/core/uverbs_uapi.c             |   1 +
 include/rdma/ib_verbs.h                           |   9 ++
 include/rdma/uverbs_types.h                       |   1 +
 include/uapi/rdma/ib_user_ioctl_cmds.h            |  10 ++
 11 files changed, 263 insertions(+), 26 deletions(-)

diff --git a/drivers/infiniband/core/Makefile b/drivers/infiniband/core/Makefile
index f483e0c12444..a2a7a9d2e0d3 100644
--- a/drivers/infiniband/core/Makefile
+++ b/drivers/infiniband/core/Makefile
@@ -33,6 +33,7 @@ ib_umad-y :=			user_mad.o
 ib_uverbs-y :=			uverbs_main.o uverbs_cmd.o uverbs_marshall.o \
 				rdma_core.o uverbs_std_types.o uverbs_ioctl.o \
 				uverbs_std_types_cq.o \
+				uverbs_std_types_dmabuf.o \
 				uverbs_std_types_dmah.o \
 				uverbs_std_types_flow_action.o uverbs_std_types_dm.o \
 				uverbs_std_types_mr.o uverbs_std_types_counters.o \
diff --git a/drivers/infiniband/core/device.c b/drivers/infiniband/core/device.c
index 4e09f6e0995e..416242b9c158 100644
--- a/drivers/infiniband/core/device.c
+++ b/drivers/infiniband/core/device.c
@@ -2765,6 +2765,7 @@ void ib_set_device_ops(struct ib_device *dev, const struct ib_device_ops *ops)
 	SET_DEVICE_OP(dev_ops, map_mr_sg);
 	SET_DEVICE_OP(dev_ops, map_mr_sg_pi);
 	SET_DEVICE_OP(dev_ops, mmap);
+	SET_DEVICE_OP(dev_ops, mmap_get_pfns);
 	SET_DEVICE_OP(dev_ops, mmap_free);
 	SET_DEVICE_OP(dev_ops, modify_ah);
 	SET_DEVICE_OP(dev_ops, modify_cq);
@@ -2775,6 +2776,7 @@ void ib_set_device_ops(struct ib_device *dev, const struct ib_device_ops *ops)
 	SET_DEVICE_OP(dev_ops, modify_srq);
 	SET_DEVICE_OP(dev_ops, modify_wq);
 	SET_DEVICE_OP(dev_ops, peek_cq);
+	SET_DEVICE_OP(dev_ops, pgoff_to_mmap_entry);
 	SET_DEVICE_OP(dev_ops, pre_destroy_cq);
 	SET_DEVICE_OP(dev_ops, poll_cq);
 	SET_DEVICE_OP(dev_ops, port_groups);
diff --git a/drivers/infiniband/core/ib_core_uverbs.c b/drivers/infiniband/core/ib_core_uverbs.c
index b51bd7087a88..1ff53b8a0e89 100644
--- a/drivers/infiniband/core/ib_core_uverbs.c
+++ b/drivers/infiniband/core/ib_core_uverbs.c
@@ -5,9 +5,13 @@
  * Copyright 2019 Marvell. All rights reserved.
  */
 #include <linux/xarray.h>
+#include <linux/dma-buf.h>
+#include <linux/dma-resv.h>
 #include "uverbs.h"
 #include "core_priv.h"
 
+MODULE_IMPORT_NS("DMA_BUF");
+
 /**
  * rdma_umap_priv_init() - Initialize the private data of a vma
  *
@@ -229,12 +233,24 @@ EXPORT_SYMBOL(rdma_user_mmap_entry_put);
  */
 void rdma_user_mmap_entry_remove(struct rdma_user_mmap_entry *entry)
 {
+	struct ib_uverbs_dmabuf_file *uverbs_dmabuf, *tmp;
+
 	if (!entry)
 		return;
 
+	mutex_lock(&entry->dmabufs_lock);
 	xa_lock(&entry->ucontext->mmap_xa);
 	entry->driver_removed = true;
 	xa_unlock(&entry->ucontext->mmap_xa);
+	list_for_each_entry_safe(uverbs_dmabuf, tmp, &entry->dmabufs, dmabufs_elm) {
+		dma_resv_lock(uverbs_dmabuf->dmabuf->resv, NULL);
+		list_del(&uverbs_dmabuf->dmabufs_elm);
+		uverbs_dmabuf->revoked = true;
+		dma_buf_move_notify(uverbs_dmabuf->dmabuf);
+		dma_resv_unlock(uverbs_dmabuf->dmabuf->resv);
+	}
+	mutex_unlock(&entry->dmabufs_lock);
+
 	kref_put(&entry->ref, rdma_user_mmap_entry_free);
 }
 EXPORT_SYMBOL(rdma_user_mmap_entry_remove);
@@ -274,6 +290,9 @@ int rdma_user_mmap_entry_insert_range(struct ib_ucontext *ucontext,
 		return -EINVAL;
 
 	kref_init(&entry->ref);
+	INIT_LIST_HEAD(&entry->dmabufs);
+	mutex_init(&entry->dmabufs_lock);
+
 	entry->ucontext = ucontext;
 
 	/*
diff --git a/drivers/infiniband/core/rdma_core.c b/drivers/infiniband/core/rdma_core.c
index 18918f463361..3e0a8b9cd288 100644
--- a/drivers/infiniband/core/rdma_core.c
+++ b/drivers/infiniband/core/rdma_core.c
@@ -465,7 +465,7 @@ alloc_begin_fd_uobject(const struct uverbs_api_object *obj,
 
 	fd_type =
 		container_of(obj->type_attrs, struct uverbs_obj_fd_type, type);
-	if (WARN_ON(fd_type->fops->release != &uverbs_uobject_fd_release &&
+	if (WARN_ON(fd_type->fops && fd_type->fops->release != &uverbs_uobject_fd_release &&
 		    fd_type->fops->release != &uverbs_async_event_release)) {
 		ret = ERR_PTR(-EINVAL);
 		goto err_fd;
@@ -477,14 +477,16 @@ alloc_begin_fd_uobject(const struct uverbs_api_object *obj,
 		goto err_fd;
 	}
 
-	/* Note that uverbs_uobject_fd_release() is called during abort */
-	filp = anon_inode_getfile(fd_type->name, fd_type->fops, NULL,
-				  fd_type->flags);
-	if (IS_ERR(filp)) {
-		ret = ERR_CAST(filp);
-		goto err_getfile;
+	if (fd_type->fops) {
+		/* Note that uverbs_uobject_fd_release() is called during abort */
+		filp = anon_inode_getfile(fd_type->name, fd_type->fops, NULL,
+					  fd_type->flags);
+		if (IS_ERR(filp)) {
+			ret = ERR_CAST(filp);
+			goto err_getfile;
+		}
+		uobj->object = filp;
 	}
-	uobj->object = filp;
 
 	uobj->id = new_fd;
 	return uobj;
@@ -561,7 +563,9 @@ static void alloc_abort_fd_uobject(struct ib_uobject *uobj)
 {
 	struct file *filp = uobj->object;
 
-	fput(filp);
+	if (filp)
+		fput(filp);
+
 	put_unused_fd(uobj->id);
 }
 
@@ -628,11 +632,14 @@ static void alloc_commit_fd_uobject(struct ib_uobject *uobj)
 	/* This shouldn't be used anymore. Use the file object instead */
 	uobj->id = 0;
 
-	/*
-	 * NOTE: Once we install the file we loose ownership of our kref on
-	 * uobj. It will be put by uverbs_uobject_fd_release()
-	 */
-	filp->private_data = uobj;
+	if (!filp->private_data) {
+		/*
+		 * NOTE: Once we install the file we loose ownership of our kref on
+		 * uobj. It will be put by uverbs_uobject_fd_release()
+		 */
+		filp->private_data = uobj;
+	}
+
 	fd_install(fd, filp);
 }
 
@@ -802,21 +809,10 @@ const struct uverbs_obj_type_class uverbs_idr_class = {
 };
 EXPORT_SYMBOL(uverbs_idr_class);
 
-/*
- * Users of UVERBS_TYPE_ALLOC_FD should set this function as the struct
- * file_operations release method.
- */
-int uverbs_uobject_fd_release(struct inode *inode, struct file *filp)
+int uverbs_uobject_release(struct ib_uobject *uobj)
 {
 	struct ib_uverbs_file *ufile;
-	struct ib_uobject *uobj;
 
-	/*
-	 * This can only happen if the fput came from alloc_abort_fd_uobject()
-	 */
-	if (!filp->private_data)
-		return 0;
-	uobj = filp->private_data;
 	ufile = uobj->ufile;
 
 	if (down_read_trylock(&ufile->hw_destroy_rwsem)) {
@@ -843,6 +839,21 @@ int uverbs_uobject_fd_release(struct inode *inode, struct file *filp)
 	uverbs_uobject_put(uobj);
 	return 0;
 }
+
+/*
+ * Users of UVERBS_TYPE_ALLOC_FD should set this function as the struct
+ * file_operations release method.
+ */
+int uverbs_uobject_fd_release(struct inode *inode, struct file *filp)
+{
+	/*
+	 * This can only happen if the fput came from alloc_abort_fd_uobject()
+	 */
+	if (!filp->private_data)
+		return 0;
+
+	return uverbs_uobject_release(filp->private_data);
+}
 EXPORT_SYMBOL(uverbs_uobject_fd_release);
 
 /*
diff --git a/drivers/infiniband/core/rdma_core.h b/drivers/infiniband/core/rdma_core.h
index a59b087611cb..55f1e3558856 100644
--- a/drivers/infiniband/core/rdma_core.h
+++ b/drivers/infiniband/core/rdma_core.h
@@ -156,6 +156,7 @@ extern const struct uapi_definition uverbs_def_obj_counters[];
 extern const struct uapi_definition uverbs_def_obj_cq[];
 extern const struct uapi_definition uverbs_def_obj_device[];
 extern const struct uapi_definition uverbs_def_obj_dm[];
+extern const struct uapi_definition uverbs_def_obj_dmabuf[];
 extern const struct uapi_definition uverbs_def_obj_dmah[];
 extern const struct uapi_definition uverbs_def_obj_flow_action[];
 extern const struct uapi_definition uverbs_def_obj_intf[];
diff --git a/drivers/infiniband/core/uverbs.h b/drivers/infiniband/core/uverbs.h
index 797e2fcc8072..66287e8e7ad7 100644
--- a/drivers/infiniband/core/uverbs.h
+++ b/drivers/infiniband/core/uverbs.h
@@ -133,6 +133,16 @@ struct ib_uverbs_completion_event_file {
 	struct ib_uverbs_event_queue		ev_queue;
 };
 
+struct ib_uverbs_dmabuf_file {
+	struct ib_uobject uobj;
+	struct dma_buf *dmabuf;
+	struct list_head dmabufs_elm;
+	struct rdma_user_mmap_entry *mmap_entry;
+	struct dma_buf_phys_vec phys_vec;
+	struct p2pdma_provider *provider;
+	u8 revoked :1;
+};
+
 struct ib_uverbs_event {
 	union {
 		struct ib_uverbs_async_event_desc	async;
diff --git a/drivers/infiniband/core/uverbs_std_types_dmabuf.c b/drivers/infiniband/core/uverbs_std_types_dmabuf.c
new file mode 100644
index 000000000000..ef5484022e77
--- /dev/null
+++ b/drivers/infiniband/core/uverbs_std_types_dmabuf.c
@@ -0,0 +1,172 @@
+// SPDX-License-Identifier: GPL-2.0 OR Linux-OpenIB
+/*
+ * Copyright (c) 2025, NVIDIA CORPORATION & AFFILIATES. All rights reserved
+ */
+
+#include <linux/dma-buf-mapping.h>
+#include <linux/pci-p2pdma.h>
+#include <linux/dma-resv.h>
+#include <rdma/uverbs_std_types.h>
+#include "rdma_core.h"
+#include "uverbs.h"
+
+static int uverbs_dmabuf_attach(struct dma_buf *dmabuf,
+				struct dma_buf_attachment *attachment)
+{
+	struct ib_uverbs_dmabuf_file *priv = dmabuf->priv;
+
+	if (!attachment->peer2peer)
+		return -EOPNOTSUPP;
+
+	if (priv->revoked)
+		return -ENODEV;
+
+	return 0;
+}
+
+static struct sg_table *
+uverbs_dmabuf_map(struct dma_buf_attachment *attachment,
+		  enum dma_data_direction dir)
+{
+	struct ib_uverbs_dmabuf_file *priv = attachment->dmabuf->priv;
+
+	dma_resv_assert_held(priv->dmabuf->resv);
+
+	if (priv->revoked)
+		return ERR_PTR(-ENODEV);
+
+	return dma_buf_phys_vec_to_sgt(attachment, priv->provider,
+				       &priv->phys_vec, 1, priv->phys_vec.len,
+				       dir);
+}
+
+static void uverbs_dmabuf_unmap(struct dma_buf_attachment *attachment,
+				struct sg_table *sgt,
+				enum dma_data_direction dir)
+{
+	dma_buf_free_sgt(attachment, sgt, dir);
+}
+
+static void uverbs_dmabuf_release(struct dma_buf *dmabuf)
+{
+	struct ib_uverbs_dmabuf_file *priv = dmabuf->priv;
+
+	/*
+	 * This can only happen if the fput came from alloc_abort_fd_uobject()
+	 */
+	if (!priv->uobj.context)
+		return;
+
+	uverbs_uobject_release(&priv->uobj);
+}
+
+static const struct dma_buf_ops uverbs_dmabuf_ops = {
+	.attach = uverbs_dmabuf_attach,
+	.map_dma_buf = uverbs_dmabuf_map,
+	.unmap_dma_buf = uverbs_dmabuf_unmap,
+	.release = uverbs_dmabuf_release,
+};
+
+static int UVERBS_HANDLER(UVERBS_METHOD_DMABUF_ALLOC)(
+	struct uverbs_attr_bundle *attrs)
+{
+	struct ib_uobject *uobj =
+		uverbs_attr_get(attrs, UVERBS_ATTR_ALLOC_DMABUF_HANDLE)
+			->obj_attr.uobject;
+	struct ib_uverbs_dmabuf_file *uverbs_dmabuf =
+		container_of(uobj, struct ib_uverbs_dmabuf_file, uobj);
+	struct ib_device *ib_dev = attrs->context->device;
+	struct rdma_user_mmap_entry *mmap_entry;
+	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
+	off_t pg_off;
+	int ret;
+
+	ret = uverbs_get_const(&pg_off, attrs, UVERBS_ATTR_ALLOC_DMABUF_PGOFF);
+	if (ret)
+		return ret;
+
+	mmap_entry = ib_dev->ops.pgoff_to_mmap_entry(attrs->context, pg_off);
+	if (!mmap_entry)
+		return -EINVAL;
+
+	ret = ib_dev->ops.mmap_get_pfns(mmap_entry, &uverbs_dmabuf->phys_vec,
+					&uverbs_dmabuf->provider);
+	if (ret)
+		goto err;
+
+	exp_info.ops = &uverbs_dmabuf_ops;
+	exp_info.size = uverbs_dmabuf->phys_vec.len;
+	exp_info.flags = O_CLOEXEC;
+	exp_info.priv = uverbs_dmabuf;
+
+	uverbs_dmabuf->dmabuf = dma_buf_export(&exp_info);
+	if (IS_ERR(uverbs_dmabuf->dmabuf)) {
+		ret = PTR_ERR(uverbs_dmabuf->dmabuf);
+		goto err;
+	}
+
+	INIT_LIST_HEAD(&uverbs_dmabuf->dmabufs_elm);
+	mutex_lock(&mmap_entry->dmabufs_lock);
+	if (mmap_entry->driver_removed)
+		ret = -EIO;
+	else
+		list_add_tail(&uverbs_dmabuf->dmabufs_elm, &mmap_entry->dmabufs);
+	mutex_unlock(&mmap_entry->dmabufs_lock);
+	if (ret)
+		goto err_revoked;
+
+	uobj->object = uverbs_dmabuf->dmabuf->file;
+	uverbs_dmabuf->mmap_entry = mmap_entry;
+	uverbs_finalize_uobj_create(attrs, UVERBS_ATTR_ALLOC_DMABUF_HANDLE);
+	return 0;
+
+err_revoked:
+	dma_buf_put(uverbs_dmabuf->dmabuf);
+err:
+	rdma_user_mmap_entry_put(mmap_entry);
+	return ret;
+}
+
+DECLARE_UVERBS_NAMED_METHOD(
+	UVERBS_METHOD_DMABUF_ALLOC,
+	UVERBS_ATTR_FD(UVERBS_ATTR_ALLOC_DMABUF_HANDLE,
+		       UVERBS_OBJECT_DMABUF,
+		       UVERBS_ACCESS_NEW,
+		       UA_MANDATORY),
+	UVERBS_ATTR_PTR_IN(UVERBS_ATTR_ALLOC_DMABUF_PGOFF,
+			   UVERBS_ATTR_TYPE(u64),
+			   UA_MANDATORY));
+
+static void uverbs_dmabuf_fd_destroy_uobj(struct ib_uobject *uobj,
+					  enum rdma_remove_reason why)
+{
+	struct ib_uverbs_dmabuf_file *uverbs_dmabuf =
+		container_of(uobj, struct ib_uverbs_dmabuf_file, uobj);
+
+	mutex_lock(&uverbs_dmabuf->mmap_entry->dmabufs_lock);
+	dma_resv_lock(uverbs_dmabuf->dmabuf->resv, NULL);
+	if (!uverbs_dmabuf->revoked) {
+		uverbs_dmabuf->revoked = true;
+		list_del(&uverbs_dmabuf->dmabufs_elm);
+		dma_buf_move_notify(uverbs_dmabuf->dmabuf);
+	}
+	dma_resv_unlock(uverbs_dmabuf->dmabuf->resv);
+	mutex_unlock(&uverbs_dmabuf->mmap_entry->dmabufs_lock);
+
+	/* Matches the get done as part of pgoff_to_mmap_entry() */
+	rdma_user_mmap_entry_put(uverbs_dmabuf->mmap_entry);
+};
+
+DECLARE_UVERBS_NAMED_OBJECT(
+	UVERBS_OBJECT_DMABUF,
+	UVERBS_TYPE_ALLOC_FD(sizeof(struct ib_uverbs_dmabuf_file),
+			     uverbs_dmabuf_fd_destroy_uobj,
+			     NULL, NULL, O_RDONLY),
+			     &UVERBS_METHOD(UVERBS_METHOD_DMABUF_ALLOC));
+
+const struct uapi_definition uverbs_def_obj_dmabuf[] = {
+	UAPI_DEF_CHAIN_OBJ_TREE_NAMED(UVERBS_OBJECT_DMABUF),
+				      UAPI_DEF_OBJ_NEEDS_FN(mmap_get_pfns),
+				      UAPI_DEF_OBJ_NEEDS_FN(pgoff_to_mmap_entry),
+	{}
+};
diff --git a/drivers/infiniband/core/uverbs_uapi.c b/drivers/infiniband/core/uverbs_uapi.c
index e00ea63175bd..38d0bbbee796 100644
--- a/drivers/infiniband/core/uverbs_uapi.c
+++ b/drivers/infiniband/core/uverbs_uapi.c
@@ -631,6 +631,7 @@ static const struct uapi_definition uverbs_core_api[] = {
 	UAPI_DEF_CHAIN(uverbs_def_obj_cq),
 	UAPI_DEF_CHAIN(uverbs_def_obj_device),
 	UAPI_DEF_CHAIN(uverbs_def_obj_dm),
+	UAPI_DEF_CHAIN(uverbs_def_obj_dmabuf),
 	UAPI_DEF_CHAIN(uverbs_def_obj_dmah),
 	UAPI_DEF_CHAIN(uverbs_def_obj_flow_action),
 	UAPI_DEF_CHAIN(uverbs_def_obj_intf),
diff --git a/include/rdma/ib_verbs.h b/include/rdma/ib_verbs.h
index 6c372a37c482..5be67013c8ae 100644
--- a/include/rdma/ib_verbs.h
+++ b/include/rdma/ib_verbs.h
@@ -43,6 +43,7 @@
 #include <uapi/rdma/rdma_user_ioctl.h>
 #include <uapi/rdma/ib_user_ioctl_verbs.h>
 #include <linux/pci-tph.h>
+#include <linux/dma-buf.h>
 
 #define IB_FW_VERSION_NAME_MAX	ETHTOOL_FWVERS_LEN
 
@@ -2363,6 +2364,9 @@ struct rdma_user_mmap_entry {
 	unsigned long start_pgoff;
 	size_t npages;
 	bool driver_removed;
+	/* protects access to dmabufs */
+	struct mutex dmabufs_lock;
+	struct list_head dmabufs;
 };
 
 /* Return the offset (in bytes) the user should pass to libc's mmap() */
@@ -2500,6 +2504,11 @@ struct ib_device_ops {
 	 * Therefore needs to be implemented by the driver in mmap_free.
 	 */
 	void (*mmap_free)(struct rdma_user_mmap_entry *entry);
+	int (*mmap_get_pfns)(struct rdma_user_mmap_entry *entry,
+			     struct dma_buf_phys_vec *phys_vec,
+			     struct p2pdma_provider **provider);
+	struct rdma_user_mmap_entry *(*pgoff_to_mmap_entry)(struct ib_ucontext *ucontext,
+							    off_t pg_off);
 	void (*disassociate_ucontext)(struct ib_ucontext *ibcontext);
 	int (*alloc_pd)(struct ib_pd *pd, struct ib_udata *udata);
 	int (*dealloc_pd)(struct ib_pd *pd, struct ib_udata *udata);
diff --git a/include/rdma/uverbs_types.h b/include/rdma/uverbs_types.h
index 26ba919ac245..6a253b7dc5ea 100644
--- a/include/rdma/uverbs_types.h
+++ b/include/rdma/uverbs_types.h
@@ -186,6 +186,7 @@ struct ib_uverbs_file {
 extern const struct uverbs_obj_type_class uverbs_idr_class;
 extern const struct uverbs_obj_type_class uverbs_fd_class;
 int uverbs_uobject_fd_release(struct inode *inode, struct file *filp);
+int uverbs_uobject_release(struct ib_uobject *uobj);
 
 #define UVERBS_BUILD_BUG_ON(cond) (sizeof(char[1 - 2 * !!(cond)]) -	\
 				   sizeof(char))
diff --git a/include/uapi/rdma/ib_user_ioctl_cmds.h b/include/uapi/rdma/ib_user_ioctl_cmds.h
index 35da4026f452..72041c1b0ea5 100644
--- a/include/uapi/rdma/ib_user_ioctl_cmds.h
+++ b/include/uapi/rdma/ib_user_ioctl_cmds.h
@@ -56,6 +56,7 @@ enum uverbs_default_objects {
 	UVERBS_OBJECT_COUNTERS,
 	UVERBS_OBJECT_ASYNC_EVENT,
 	UVERBS_OBJECT_DMAH,
+	UVERBS_OBJECT_DMABUF,
 };
 
 enum {
@@ -263,6 +264,15 @@ enum uverbs_methods_dmah {
 	UVERBS_METHOD_DMAH_FREE,
 };
 
+enum uverbs_attrs_alloc_dmabuf_cmd_attr_ids {
+	UVERBS_ATTR_ALLOC_DMABUF_HANDLE,
+	UVERBS_ATTR_ALLOC_DMABUF_PGOFF,
+};
+
+enum uverbs_methods_dmabuf {
+	UVERBS_METHOD_DMABUF_ALLOC,
+};
+
 enum uverbs_attrs_reg_dm_mr_cmd_attr_ids {
 	UVERBS_ATTR_REG_DM_MR_HANDLE,
 	UVERBS_ATTR_REG_DM_MR_OFFSET,

-- 
2.49.0

