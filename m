Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA57999AF24
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 01:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B282A10EB39;
	Fri, 11 Oct 2024 23:13:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Qq5J/75a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2046.outbound.protection.outlook.com [40.107.223.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9C610EB39
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 23:13:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yj/Wkrvaar9Rqq992FgIy9HcOxJjoCwEIjMQtRnadJdMiSDQtMGKIjLHrAZ49mRscdOgkhIC1bNqQdaDpsh3/qQtdMre2DDa1pD9oGqI7t5z6fadfbJ5u9zHNk4t1lvp5WT2hB7f1N8KpKEWGh3ZrRriGmcswlmhDNJf6+oBGiZGexwPBa5QKhGqjIhToS2e2Trn9pvXZ8OAxQeNK3Y/OFqHKAYsjINeiycpEetnjkkIbVwJvReq1+AElhJ4REX3FfhToNVl9MYBf6eHy5WSKEFTTPEQw4kTO9ULF3wqU2U9iHEcruaXNU7J0ET0FWabIC9FbbMGrkoV/BjYgJvNUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WrJvLE5A5wCduRGwGKfeyuS7O+uxulxmRFWEFYO37Dc=;
 b=frBE/mwgO0qDBLiFr3rj4j91GMxk7hUY7SRaYELdspmROG6RocMLAE3EUhF8yLc8+qzvegXEjssbnzbCKDXvkEdy8CYwa6PfdrrhxssHi4OsDdlk4748WvENm6VU8SS+OuIQ80bpwLjnY9sgjQ3K1EtMAcgmFqepz6VIGFhgQryoDf54c+fGWLKgRJShcJgGhJx4Hunh778nPu9SmssqFtO+JJaCEWjkdxx2EDsAz1aDLJMRomoZLJApRubZJ/h0iZ+ASxliN+Lxl1INjxsXMmeNtMt3BVq/mPIWGt4gv4V1W+fRFqEUf7m5ylsi+BFu6LJ2RYQaDhfOZCnEEK14vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WrJvLE5A5wCduRGwGKfeyuS7O+uxulxmRFWEFYO37Dc=;
 b=Qq5J/75au/5Z4OADAnE5zluOc+Ry6GA36aq6z7/YLgcvcK9Tif5qnGwMslkAbH+ANANRrUmPwFXbMNp8bXlU2Z6P3PD8Gyp1Jt8le+a2Fbx1WGMdQ/uSeTIxwuOuft+jbKGwYlN3SL1Z+cYaT/Di9XKenlk3I33y8F2GvT0fetA=
Received: from MW4PR03CA0209.namprd03.prod.outlook.com (2603:10b6:303:b8::34)
 by LV8PR12MB9156.namprd12.prod.outlook.com (2603:10b6:408:181::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 23:12:57 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:303:b8:cafe::88) by MW4PR03CA0209.outlook.office365.com
 (2603:10b6:303:b8::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Fri, 11 Oct 2024 23:12:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.1 via Frontend Transport; Fri, 11 Oct 2024 23:12:56 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 18:12:55 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 18:12:55 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 11 Oct 2024 18:12:54 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V4 00/10] AMD XDNA driver
Date: Fri, 11 Oct 2024 16:12:34 -0700
Message-ID: <20241011231244.3182625-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|LV8PR12MB9156:EE_
X-MS-Office365-Filtering-Correlation-Id: 1564e38f-d204-497c-2687-08dcea4a3dac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?USbzLQ4GnoUBFnFx4GkVmwMB13QYkpyGYzNTHZncDrcK4QfAVYmhsqCq3N38?=
 =?us-ascii?Q?Pv7FnguXmASbBKtlGb6X1unjWXYXve56l9MgzXr5AHcvhsUIjTZsdKIIHIMX?=
 =?us-ascii?Q?Ed+ALv9lKggaliuxLO6nKPCo6xHSGj7Cm45w/6pN4X2rbFZx2OGDnSF0AYAB?=
 =?us-ascii?Q?i7zfZHCDtPSKddh0krXF8XmEK4nGaFYAXZmsLINcizu8SmsV64r8BV4RW6+o?=
 =?us-ascii?Q?q0Ns6f7xbgy6AERCiMshA0WjxbzF3m+lD1igtF5OH1mVIwOUD+SZ9tqq56/J?=
 =?us-ascii?Q?S+oV72h2RB4zcSfXOWwjbuvNdquxATQu8KsA+sTtZZZTvNSnjayhoKhOuqZs?=
 =?us-ascii?Q?DlXFa6e5kp7qw48UTOY/8+S4e3MKtyE8ohfsekQxVsgnFCPSVt9XQwCR3xY1?=
 =?us-ascii?Q?qlFxoCf8VHN1mBcBSqZBDLNW4W4B0VIQEOL2c+5JpN3mywfptb1f/D38Pl1a?=
 =?us-ascii?Q?43dHI3d024Fy1J7o9fzRL1rH2FTbVDoX2vFLvUV/W3evzQufYx4Z2UchlKWw?=
 =?us-ascii?Q?m/n7dtCIIz60ACShjeCX0IbZ4bB/NAgVJNkT7357Hn4Uy94+h3v7bOauEWxH?=
 =?us-ascii?Q?KBXYk5mdkDLxmvE+FzUL768GfirDgOiU5gj1W+4oCDKGyctYXAmwkxiD8vzh?=
 =?us-ascii?Q?zrdm1YSuDKBU4BxIjGZv3Co6b4Ptvu5OjAffFLqPcEZ5tlSVxeJQhFkykZqW?=
 =?us-ascii?Q?XdeO4ddKSlTs2EC2UKYMTvK7paIFp84btAWNswIAoUlibcGey2oHE2QVudEp?=
 =?us-ascii?Q?05FUi3CPjpw2kfCPzgstBdFGm2QyWtgQvYUxqQxxxaJAyGvp7AZwsjhA/MUi?=
 =?us-ascii?Q?d3wSgKvQx3zWEU92xKUSpHl7FWRM/7deIC2/Gm9N//0Bm0qw8VsGw49w7Kf2?=
 =?us-ascii?Q?aZdIxsDy72SUWbIYEd2QBhkTcDk4y1ttPHxVMDyHMH9MnFBO1yuEq5I8evSP?=
 =?us-ascii?Q?MZS1tf31m+NwmUV3CEgdi8z5QhQE1EjJn+JX4KJKHi9Qk60vXwiSs7J9ceTG?=
 =?us-ascii?Q?iTU20DQztRHlX6wBTYzOwOMS5H5WhXMGv4C08gsP4diGYzqcgS+I2yC31rjg?=
 =?us-ascii?Q?r9k/vYvkeQS7Wt0YIyHf5kr5ML78JrjwRJyV1yxa8/tJxIgpbLJ6XnBwl6va?=
 =?us-ascii?Q?QCHFr1RqJ+XbE4LjhflbRkxkUu/Ula9GsLruQyV3/P5UW1zSyx33Do63X9sn?=
 =?us-ascii?Q?oV1lfgZVtlr30LDhIavMbrqcn6rZVrYYWo8pCUaEB6xq0uMPb3abc+rBq/G1?=
 =?us-ascii?Q?AGDyKFts1wRC5WxDoHFjbixOuLzpe3dtK2utCrHDGT/WUbr9M4Jmg/pnidCY?=
 =?us-ascii?Q?3pw=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 23:12:56.1220 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1564e38f-d204-497c-2687-08dcea4a3dac
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9156
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

This patchset introduces a new Linux Kernel Driver, amdxdna for AMD NPUs.
The driver is based on Linux accel subsystem.

NPU (Neural Processing Unit) is an AI inference accelerator integrated
into AMD client CPUs. NPU enables efficient execution of Machine Learning
applications like CNNs, LLMs, etc.  NPU is based on AMD XDNA
architecture [1].

AMD NPU consists of the following components:

  - Tiled array of AMD AI Engine processors.
  - Micro Controller which runs the NPU Firmware responsible for
    command processing, AIE array configuration, and execution management.
  - PCI EP for host control of the NPU device.
  - Interconnect for connecting the NPU components together.
  - SRAM for use by the NPU Firmware.
  - Address translation hardware for protected host memory access by the
    NPU.

NPU supports multiple concurrent fully isolated contexts. Concurrent
contexts may be bound to AI Engine array spatially and or temporarily.

The driver is licensed under GPL-2.0 except for UAPI header which is
licensed GPL-2.0 WITH Linux-syscall-note.

User mode driver stack consists of XRT [2] and AMD AIE Plugin for IREE [3].

The firmware for the NPU is distributed as a closed source binary, and has
already been pushed to the DRM firmware repository [4].

[1] https://www.amd.com/en/technologies/xdna.html
[2] https://github.com/Xilinx/XRT
[3] https://github.com/nod-ai/iree-amd-aie
[4] https://gitlab.freedesktop.org/drm/firmware/-/tree/amd-ipu-staging/amdnpu

Changes since v3:
- Remove debug BO patch
- Changes based on code review comments

Changes since v2:
- Add document amdnpu.rst
- Change AIE2_DEVM_SIZE to 64M due to firmware change
- Changes based on code review comments

Changes since v1:
- Remove some inline defines
- Minor changes based on code review comments

Lizhi Hou (10):
  accel/amdxdna: Add documentation for AMD NPU accelerator driver
  accel/amdxdna: Add a new driver for AMD AI Engine
  accel/amdxdna: Support hardware mailbox
  accel/amdxdna: Add hardware resource solver
  accel/amdxdna: Add hardware context
  accel/amdxdna: Add GEM buffer object management
  accel/amdxdna: Add command execution
  accel/amdxdna: Add suspend and resume
  accel/amdxdna: Add error handling
  accel/amdxdna: Add query functions

 Documentation/accel/amdxdna/amdnpu.rst        | 281 ++++++
 Documentation/accel/amdxdna/index.rst         |  11 +
 Documentation/accel/index.rst                 |   1 +
 MAINTAINERS                                   |  10 +
 drivers/accel/Kconfig                         |   1 +
 drivers/accel/Makefile                        |   1 +
 drivers/accel/amdxdna/Kconfig                 |  15 +
 drivers/accel/amdxdna/Makefile                |  21 +
 drivers/accel/amdxdna/TODO                    |   5 +
 drivers/accel/amdxdna/aie2_ctx.c              | 917 ++++++++++++++++++
 drivers/accel/amdxdna/aie2_error.c            | 356 +++++++
 drivers/accel/amdxdna/aie2_message.c          | 790 +++++++++++++++
 drivers/accel/amdxdna/aie2_msg_priv.h         | 370 +++++++
 drivers/accel/amdxdna/aie2_pci.c              | 766 +++++++++++++++
 drivers/accel/amdxdna/aie2_pci.h              | 255 +++++
 drivers/accel/amdxdna/aie2_psp.c              | 145 +++
 drivers/accel/amdxdna/aie2_smu.c              | 119 +++
 drivers/accel/amdxdna/aie2_solver.c           | 330 +++++++
 drivers/accel/amdxdna/aie2_solver.h           | 154 +++
 drivers/accel/amdxdna/amdxdna_ctx.c           | 607 ++++++++++++
 drivers/accel/amdxdna/amdxdna_ctx.h           | 160 +++
 drivers/accel/amdxdna/amdxdna_gem.c           | 628 ++++++++++++
 drivers/accel/amdxdna/amdxdna_gem.h           |  65 ++
 drivers/accel/amdxdna/amdxdna_mailbox.c       | 575 +++++++++++
 drivers/accel/amdxdna/amdxdna_mailbox.h       | 124 +++
 .../accel/amdxdna/amdxdna_mailbox_helper.c    |  61 ++
 .../accel/amdxdna/amdxdna_mailbox_helper.h    |  42 +
 drivers/accel/amdxdna/amdxdna_pci_drv.c       | 401 ++++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.h       | 123 +++
 drivers/accel/amdxdna/amdxdna_sysfs.c         |  67 ++
 drivers/accel/amdxdna/npu1_regs.c             | 101 ++
 drivers/accel/amdxdna/npu2_regs.c             | 118 +++
 drivers/accel/amdxdna/npu4_regs.c             | 118 +++
 drivers/accel/amdxdna/npu5_regs.c             | 118 +++
 include/trace/events/amdxdna.h                | 101 ++
 include/uapi/drm/amdxdna_accel.h              | 457 +++++++++
 36 files changed, 8414 insertions(+)
 create mode 100644 Documentation/accel/amdxdna/amdnpu.rst
 create mode 100644 Documentation/accel/amdxdna/index.rst
 create mode 100644 drivers/accel/amdxdna/Kconfig
 create mode 100644 drivers/accel/amdxdna/Makefile
 create mode 100644 drivers/accel/amdxdna/TODO
 create mode 100644 drivers/accel/amdxdna/aie2_ctx.c
 create mode 100644 drivers/accel/amdxdna/aie2_error.c
 create mode 100644 drivers/accel/amdxdna/aie2_message.c
 create mode 100644 drivers/accel/amdxdna/aie2_msg_priv.h
 create mode 100644 drivers/accel/amdxdna/aie2_pci.c
 create mode 100644 drivers/accel/amdxdna/aie2_pci.h
 create mode 100644 drivers/accel/amdxdna/aie2_psp.c
 create mode 100644 drivers/accel/amdxdna/aie2_smu.c
 create mode 100644 drivers/accel/amdxdna/aie2_solver.c
 create mode 100644 drivers/accel/amdxdna/aie2_solver.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_ctx.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_ctx.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_gem.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_gem.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox_helper.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_mailbox_helper.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_pci_drv.h
 create mode 100644 drivers/accel/amdxdna/amdxdna_sysfs.c
 create mode 100644 drivers/accel/amdxdna/npu1_regs.c
 create mode 100644 drivers/accel/amdxdna/npu2_regs.c
 create mode 100644 drivers/accel/amdxdna/npu4_regs.c
 create mode 100644 drivers/accel/amdxdna/npu5_regs.c
 create mode 100644 include/trace/events/amdxdna.h
 create mode 100644 include/uapi/drm/amdxdna_accel.h

-- 
2.34.1

