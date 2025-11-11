Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A42C4A4BD
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053D710E480;
	Tue, 11 Nov 2025 01:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kB7LykuC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012035.outbound.protection.outlook.com [52.101.48.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9E410E49A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 01:16:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mvsFFwGOfS1XDmD4Njz2VWry3803WjHnStlKi03ISUPHq5miDe23mv0LUweKN9uACQNqWGflP2oPs6EvepHz6TQYb0KBmbXs7+TZnTBN3UGbYSY9LCvSrzhXa7QowJ68VVWoc+2woYXQq1kBr86qmiYzFjAEogaLLUPpJaF0f49slfiJIwo8IKDdntBTxhQA3+ALdppXR8JamHeQrEQxZi8DVhSxaWGDduxZl/as39nXIyzaTODdUptpFfFiZo8D3+m30zNO3/00NBD6/++YAebA8AwLHmfpWDoQ0Lis486RVcQpV4pJxQNQMKkLreAATRqUPngqzjPZHQ5Wj7LciA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zr6hpG6y4JvNEJdMtpiA7L4CY/gZJJSmRF/1NRe7Qi4=;
 b=jTW7yAfQUyYIXCJrMoZWJMoYV5en4C0rWCjnL5Yo+vABDcQtAAf3sauuckAWTAYQlyyK5W2DYaR3PDwIoOQRfW5M8Dh1teQahMWS1FOKQyIdU3P2zVBg2JGSot1kKMXufZmk1LwuCYz2o+3Y7ccbV5Wb4kpSkEnijTbd2Te2d1MM6Lw8XmSH8+hjGe+0y3TgbNjZgkweWNRm5PCM3KwkHmyD3F152VpLOzR0WRAZxXHB/Ee0TJVJbbQMuYaKF9bqe58g7ylaT77J5vGVh2Uv3bVrGxMgF+HijikLDGnEFdpit2A8glXBGe0RKk+LUkqKt/jRJlJvU/UwsFlYWXe5oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zr6hpG6y4JvNEJdMtpiA7L4CY/gZJJSmRF/1NRe7Qi4=;
 b=kB7LykuCvlLKzd3iLu046b5mIiq4Etpa/FYMfMwKLbbpzDqBPEbih0kL9y/2UyYm+1gehbWIKQKIOX3+xNi0IxEi3wFADU7LU59JhzMjv1hSeNVjD4nJ14bmvxbJIT5DBemd7/sqnZXSemqg7ZjNVuo7w54D/Uc1eTxhXL6kQG4=
Received: from BYAPR08CA0012.namprd08.prod.outlook.com (2603:10b6:a03:100::25)
 by MN2PR12MB4253.namprd12.prod.outlook.com (2603:10b6:208:1de::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:15:59 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:a03:100:cafe::2f) by BYAPR08CA0012.outlook.office365.com
 (2603:10b6:a03:100::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 01:15:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 01:15:58 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 10 Nov
 2025 17:15:58 -0800
Received: from xsjdavidzha51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via
 Frontend Transport; Mon, 10 Nov 2025 17:15:56 -0800
From: David Zhang <yidong.zhang@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: David Zhang <yidong.zhang@amd.com>, <linux-kernel@vger.kernel.org>,
 <sonal.santan@amd.com>, <mario.limonciello@amd.com>, <lizhi.hou@amd.com>
Subject: [PATCH V1 0/5] accel/amd_vpci: Add new driver for AMD Versal PCI
Date: Mon, 10 Nov 2025 17:15:45 -0800
Message-ID: <20251111011550.439157-1-yidong.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|MN2PR12MB4253:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f8fa25c-216d-455e-4e1f-08de20bfdf3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nngH+gbK31o3rGrp26bl4RGdgdf8ASD0/OjjYaK5dalvzMJq1AGVzEy8JDk1?=
 =?us-ascii?Q?Aui+A1qvgKSiW2SUJfJUd8Hbos9aH5bV0Oe7Vdl8JIhRye/icvImjh1WMli4?=
 =?us-ascii?Q?RW7A6+A3vI5APEN6pqt/G1mULn3uD9tsNtL1C0uS5R0Q3jluOu4tSsaiIA3e?=
 =?us-ascii?Q?rtaMb7x4JfULGWGFEaUNYlWJKUUz05WGRolBZxlcu3i+Yc5LONWEGRpA2krr?=
 =?us-ascii?Q?3Ts9ufSDxQ5MhlmxeZTlM5XZhlABVFJpCY7QOqPnA6ebJPIued5uCOp4Vq05?=
 =?us-ascii?Q?MbIoAJo6nbgw3MtUSvN3K6POtj2CHTQgUCAHqfCk2hDvZrlIrWNnS2dNMlow?=
 =?us-ascii?Q?Un8NnaUZpaismgI9Vuc8Yop5T4WiiprJHrjxixIIsQ1ey92RmV2RcQrNcxVo?=
 =?us-ascii?Q?FHftDbWbjtl9FMURGaePTHhtPchSCCWJt0PfwtpCec2tPh2FumfWa+FCn8KF?=
 =?us-ascii?Q?SsPzJUFoSg03CEuaX27hWoFx5iVW5YdTcrsm7WOcrZDWXumq8vUoPXNAs6uK?=
 =?us-ascii?Q?2N+JrnRDliKM5xek2rJKJ4r+fA0YJd0S2Ewc+uRtRBifa8GrkuO1QJ3M6MGl?=
 =?us-ascii?Q?UItdimwcLteo3oAsERmmeg8wJ+gDzHd5OVvBwJW9i9wUR5vEXY8cubnp2xMR?=
 =?us-ascii?Q?o0bv3cWahR0TZIMTZs/9cuasL4K7fTNsCp57Hy0TlQ0vv1GOuMQ6QsNCfn4a?=
 =?us-ascii?Q?fe+z1AHWkk94+zG5NOX16rITdml3XnDBP65i/bzaZks109LT4ir7NQQXxjE9?=
 =?us-ascii?Q?gB1RQeZdKhDVOXiaa2p1kXH7ez6gBrvnb3AlyGIB46PYtFQ2LcPlSUZupuH3?=
 =?us-ascii?Q?T5uFbqrYDcSCjSIuMrTqNCTogOCXdQhUbFsiQBT33/IeEzV7UFWmqAFQuHOj?=
 =?us-ascii?Q?MkwukJlglrVgegUERGQqRhhSEs/SUuk4Qf5uJOTjKPpett8FdDOatP5/c7ir?=
 =?us-ascii?Q?GNRiIp7A12I0MrDi6BFHY4MB9I0UtSedXXbyMAGbGw2WFDNDfFrp477bxc4X?=
 =?us-ascii?Q?sSFNIyYqGT8WfTWtdo0y6j3G8j08Gd2p59jpk8NiyAPk6S3ItPx1XiGB3W/3?=
 =?us-ascii?Q?bhyU3DhTRUDF4ikS/rf56rLtxwd8loAJDa8mG5Uy1u44yILqOL8vzgIIBKmP?=
 =?us-ascii?Q?x9Gwd8DtHPGYs+4l/1cwt3o1nCa7qxZE3EcPUK8P3dKXte9jynNZ9QCucwl1?=
 =?us-ascii?Q?KK9GtpH653W9Er78DgINV48EvJEh3Pf5dQMFQo131SKoOd9pyzzcJIxy+z93?=
 =?us-ascii?Q?fe41kv22FgMM8oxldX0PKmyzdw6KuWqgAnEyE9MaFj2AIxuVYu4LCFrFuPui?=
 =?us-ascii?Q?QVVETWPuy0jygbM5b5pHkDWaIK1eELftOtVDuRddTZZZamwzf0PUGHNu44zx?=
 =?us-ascii?Q?YtjuxJTZKD7haAOb8FjpaMmIQP4ffZMP3pFYy2zSg/d9XgeEfxfw81htQMQW?=
 =?us-ascii?Q?aHQWCemC1//rfBUDJol9yDLANtBiaR9Z4d00WMcr4HQgMhx/iawIh2nV0T75?=
 =?us-ascii?Q?mKs5P0gE+Sbcqqbk0sRx74ozQ/z9ykYEsDtL?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:15:58.8034 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f8fa25c-216d-455e-4e1f-08de20bfdf3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4253
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

This patchset introduces a new Linux Kernel Driver, *versal-pci*,  for AMD
Embedded+ platform.

The AMD Embedded+ platform integrates AMD Ryzen Embedded processors with
AMD Versal AI Edge adaptive SoCs on a single PCB [1]. The AMD Ryzen
Embedded processor is connected to the Versal AI Edge adaptive SoC via PCIe
enabling a tightly coupled heterogeneous compute platform. AMD Embedded+
platform is used for sensor fusion, AI inferencing, industrial networking,
control, and visualization.

AMD Versal PCI driver, versal-pci, is a host-side PCIe driver for AMD
Embedded+ platform running on AMD Ryzen Embedded processor.

The versal-pci driver is responsible for the management-plane operations
for the AMD Versal AI Edge adaptive SoC, including:

 - Loading accelerator firmware images
 - Reset and recovery
 - Health monitoring

The driver is licensed under GPL-2.0.

The firmwares are distributed as closed binaries. Please see [1] for more
information. Please see [2] for software architecture.

[1] https://www.amd.com/en/products/embedded/embedded-plus.html
[2] https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/3011838141/AMD+Embedded+Platforms

David Zhang (5):
  accel/amd_vpci: Add documentation for AMD Versal PCI accelerator
    management
  accel/amd_vpci: Add new driver for AMD Versal PCI accelerator
  accel/amd_vpci: Add Remote Management(RM) queue infrastructure
  accel/amd_vpci: Add Remote Management (RM) queue service APIs
  accel/amd_vpci: Add communication channel service

 Documentation/accel/amd_vpci/amd_vpci.rst     | 122 +++++
 Documentation/accel/amd_vpci/index.rst        |  11 +
 Documentation/accel/index.rst                 |   1 +
 MAINTAINERS                                   |   5 +
 drivers/accel/Kconfig                         |   1 +
 drivers/accel/Makefile                        |   3 +-
 drivers/accel/amd_vpci/Kconfig                |  15 +
 drivers/accel/amd_vpci/Makefile               |   9 +
 drivers/accel/amd_vpci/versal-pci-comm-chan.c | 295 +++++++++++
 drivers/accel/amd_vpci/versal-pci-comm-chan.h |  14 +
 drivers/accel/amd_vpci/versal-pci-main.c      | 394 ++++++++++++++
 drivers/accel/amd_vpci/versal-pci-rm-queue.c  | 314 +++++++++++
 drivers/accel/amd_vpci/versal-pci-rm-queue.h  |  21 +
 .../accel/amd_vpci/versal-pci-rm-service.c    | 497 ++++++++++++++++++
 .../accel/amd_vpci/versal-pci-rm-service.h    | 229 ++++++++
 drivers/accel/amd_vpci/versal-pci.h           |  70 +++
 16 files changed, 2000 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/accel/amd_vpci/amd_vpci.rst
 create mode 100644 Documentation/accel/amd_vpci/index.rst
 create mode 100644 drivers/accel/amd_vpci/Kconfig
 create mode 100644 drivers/accel/amd_vpci/Makefile
 create mode 100644 drivers/accel/amd_vpci/versal-pci-comm-chan.c
 create mode 100644 drivers/accel/amd_vpci/versal-pci-comm-chan.h
 create mode 100644 drivers/accel/amd_vpci/versal-pci-main.c
 create mode 100644 drivers/accel/amd_vpci/versal-pci-rm-queue.c
 create mode 100644 drivers/accel/amd_vpci/versal-pci-rm-queue.h
 create mode 100644 drivers/accel/amd_vpci/versal-pci-rm-service.c
 create mode 100644 drivers/accel/amd_vpci/versal-pci-rm-service.h
 create mode 100644 drivers/accel/amd_vpci/versal-pci.h

-- 
2.34.1

