Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B2209B6864
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 16:52:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B96310E7C6;
	Wed, 30 Oct 2024 15:52:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E4RcdNnV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2053.outbound.protection.outlook.com [40.107.93.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2A5E10E7C6
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 15:52:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FRl9WqNo1gJdeXHVY/+xjiQUYrQNQriHBHA8lPQm/6vJOJbIOviyZil28eJnO0CsWXrFIJ3HJUTxsLq/hjoWY8Q2OcYKVMmeFUf/qpwYzTuB5STyWambwvN/jyjsXnhUeA99UdwiX4wyk5qGUTy12E3LXbOqV2dJ8EHubee3KZaas2q4JsyHTYdw2JppAvEUK2vxjbU5Wt6UwLHU1vEckmoxNRDXXiOp2u+dJPaESwWuCAECp7MssB00IdtXWNL5Xo0/Cq9kembl9XwMFIwNiiu/zsmn+WzTX5x6IfWMPkeHhlfbEFHnHt4EclKzdn90b3ygKWW6ZPryQnegq6hotQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DQqrnKzlSxmEBXUN/2T7qUTVtWwkcA5Ru8V8fFOyIw4=;
 b=id/6tpVRnws+zSfMwdvmKhsP+vdUBsjSFGXLalYaIAMJUXYEG7C6cVTnvwvA6iSDwoAU3eMAFRyLQhqR7vGr9v4AXB3UHC67ZFyWfa+8wqsshEShh4K771luaOk0SE2qRFsWIaruYdIPpIMCjYAxRnh+sP7qCK6ewGwZiv81gnk240yYokVLjHyNuvxadO95IELqYB/lQSCZpE+eTLAyXF8BtI0BH5ZmrMvCoc//PebFbSXyhIU09osJhYeg7x/zgtBCGMfY0w9Vb4iElujLG8ixu8pISh+F6kEstygmfwT7ePFsqUXJtw+2DSlbCDwQfr9YAmI5zWSK0byEqxOB9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DQqrnKzlSxmEBXUN/2T7qUTVtWwkcA5Ru8V8fFOyIw4=;
 b=E4RcdNnVLv9eQ7/LDEm98A2EAeT8teVR2a5N/p0Y0Ifqtti7WEMxq72Aul3R4Jw/IV8zL56FI/rcFneiHB+RzF9JuzD4fhvLgID9CeDofmy+dZP1XDqNIDGr+xtQIT6ibUt7OqqyoMWFM3dmv81nzbktASfCJwnXArYPCL3ONCA=
Received: from MN2PR20CA0032.namprd20.prod.outlook.com (2603:10b6:208:e8::45)
 by SA1PR12MB7176.namprd12.prod.outlook.com (2603:10b6:806:2bd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.29; Wed, 30 Oct
 2024 15:52:11 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:208:e8:cafe::a) by MN2PR20CA0032.outlook.office365.com
 (2603:10b6:208:e8::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.19 via Frontend
 Transport; Wed, 30 Oct 2024 15:52:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B073.mail.protection.outlook.com (10.167.243.118) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Wed, 30 Oct 2024 15:52:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Oct
 2024 10:52:05 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Oct
 2024 10:52:04 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 30 Oct 2024 10:52:04 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V6 00/10] AMD XDNA driver
Date: Wed, 30 Oct 2024 08:51:37 -0700
Message-ID: <20241030155147.103908-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|SA1PR12MB7176:EE_
X-MS-Office365-Filtering-Correlation-Id: 86ffb52e-2ca3-499b-3087-08dcf8fad0f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PwTEClSPk3sHZFZG6ZjBOk6lxSdIWOt2xalPQ0UW/JLthh5Wm64JMQ7LdjcF?=
 =?us-ascii?Q?8PLV2XAWSlrP+48i76J0JzXrUcVM47WWjFtqRdZzBcFtVCOSkRuKaYcArx45?=
 =?us-ascii?Q?ydD668qj9ps4D9zvtTzJKM0EiqMvlUll6Ko1/2bk0DijdZ3ZwTil+jKOoNGd?=
 =?us-ascii?Q?s30EyOYrj7CJpZOuUcI1COjMQGpNHUcdN/ZPJLg/g4aI1hgSJJI7vFh2NQoI?=
 =?us-ascii?Q?CXKh3BS6Gbd5mf/h4uP9EYuua2+q7xSe9iUgmZOkLcCIf3oFYB3DCFKRdrQ2?=
 =?us-ascii?Q?38RfREqo7DMZFuKx8DWG+X0k7nHlFg4Xld3qwJkxCXbLepGiQWLdkbwWjO1D?=
 =?us-ascii?Q?HX4zylBMDlYUsKGj6MBwffguxCQTT7CGqCAWMHb1tXkV3TZr6TT55U7DKWlS?=
 =?us-ascii?Q?51sH2ENLXRLVw21DCEVUpScdhmPMCMUbFelff0l+UyKE/s4siE+dKqRKWIW0?=
 =?us-ascii?Q?4VHDpCDtxJ1cxlzc7RKP3YtSNDJWIFLMpB9FvhXb+Gku2+YwgIIK+z4Siuis?=
 =?us-ascii?Q?I5j5wJcmT45Gqga/eDjx7Zh/2J0qS1A9y/V6ho0En14HcCT+y549znqxmJY7?=
 =?us-ascii?Q?hKtCt1BDRUEXD5ZDiimqbH7Qe6rKrcMy2A7CXLBeRqCfUamM8I3BLm+BxA6s?=
 =?us-ascii?Q?zm6M2Z4P753f6UAZLP6WxJ3T61+3aRhjz4ugVMyKVGb00z76RgvAGifmO9Uo?=
 =?us-ascii?Q?gQZfR1kMkZm3fmXgnOM4tbIRF5wFWeRYFxi40Cet8xQMeSILf1TAjPxbtfOO?=
 =?us-ascii?Q?AGP7zo2iRSECjrP875v4KQoVZ8V8EFXXQu7wqqWydsljnJEJeJEYFxVX/FC2?=
 =?us-ascii?Q?bymuNCmg/ucglxsg2jzFProRGe3NUd9OUJF2gDeRkf8lNRmfnA61v4jBhYp5?=
 =?us-ascii?Q?09i2Ohd8ByYGKH/9WHqF2s8swkuAYTFoB+eRm7sIULfQUv4cqG+uvUPKDq5n?=
 =?us-ascii?Q?tGQIAz3ySTBY2ju0RjlGPluWYHFlOMyntn2eALErmuFiDAAu2iSVHyihAZtN?=
 =?us-ascii?Q?gyFCzvJ0WSG5xe1KaIQaejor+V7BpxSl5wUbyL458qWprCNa/7dgBfeoEnn/?=
 =?us-ascii?Q?yTujvmKJNCKytGXgOY2T5hgFgPU1NnRXZT4efyC51NCGg4gYW1/CRTdvHqSG?=
 =?us-ascii?Q?CnY8nI4Sditqxw8iwUhAWTJpm/7IDAdhdR7Njlz0LwLHg2lTDx3GP+5kSF/r?=
 =?us-ascii?Q?ncOZ/2De8MXyjWMVji1s2vB5GJ6B9FrcATyz/UnANFKK5Mh1RsAhyRErqCwL?=
 =?us-ascii?Q?5bCqWBSqak+mW8FNRfKzl4+PNOg+fuMgqqkqHSjpH6vml1Ko6wIVegTqoVZl?=
 =?us-ascii?Q?eXIGrAm8wYt13ZECFvSkj8jLYgJ3NYUQJoly4fk2usnrNaefGQC4H8EqP5PU?=
 =?us-ascii?Q?ygLOmOA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 15:52:11.0359 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86ffb52e-2ca3-499b-3087-08dcf8fad0f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7176
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

Changes since v5:
- Remove wait_cmd ioctl and use syncobj instead
- Cleanup spelling errors
- Add dependencies in Kconfig

Changes since v4:
- Fix lockdep errors
- Use __u* structure for struct aie_error

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

 Documentation/accel/amdxdna/amdnpu.rst        | 281 +++++
 Documentation/accel/amdxdna/index.rst         |  11 +
 Documentation/accel/index.rst                 |   1 +
 MAINTAINERS                                   |  11 +
 drivers/accel/Kconfig                         |   1 +
 drivers/accel/Makefile                        |   1 +
 drivers/accel/amdxdna/Kconfig                 |  18 +
 drivers/accel/amdxdna/Makefile                |  21 +
 drivers/accel/amdxdna/TODO                    |   5 +
 drivers/accel/amdxdna/aie2_ctx.c              | 957 ++++++++++++++++++
 drivers/accel/amdxdna/aie2_error.c            | 360 +++++++
 drivers/accel/amdxdna/aie2_message.c          | 791 +++++++++++++++
 drivers/accel/amdxdna/aie2_msg_priv.h         | 370 +++++++
 drivers/accel/amdxdna/aie2_pci.c              | 761 ++++++++++++++
 drivers/accel/amdxdna/aie2_pci.h              | 255 +++++
 drivers/accel/amdxdna/aie2_psp.c              | 146 +++
 drivers/accel/amdxdna/aie2_smu.c              | 119 +++
 drivers/accel/amdxdna/aie2_solver.c           | 330 ++++++
 drivers/accel/amdxdna/aie2_solver.h           | 154 +++
 drivers/accel/amdxdna/amdxdna_ctx.c           | 563 +++++++++++
 drivers/accel/amdxdna/amdxdna_ctx.h           | 162 +++
 drivers/accel/amdxdna/amdxdna_gem.c           | 631 ++++++++++++
 drivers/accel/amdxdna/amdxdna_gem.h           |  66 ++
 drivers/accel/amdxdna/amdxdna_mailbox.c       | 576 +++++++++++
 drivers/accel/amdxdna/amdxdna_mailbox.h       | 124 +++
 .../accel/amdxdna/amdxdna_mailbox_helper.c    |  61 ++
 .../accel/amdxdna/amdxdna_mailbox_helper.h    |  42 +
 drivers/accel/amdxdna/amdxdna_pci_drv.c       | 402 ++++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.h       | 122 +++
 drivers/accel/amdxdna/amdxdna_sysfs.c         |  67 ++
 drivers/accel/amdxdna/npu1_regs.c             | 101 ++
 drivers/accel/amdxdna/npu2_regs.c             | 118 +++
 drivers/accel/amdxdna/npu4_regs.c             | 118 +++
 drivers/accel/amdxdna/npu5_regs.c             | 118 +++
 include/trace/events/amdxdna.h                | 101 ++
 include/uapi/drm/amdxdna_accel.h              | 436 ++++++++
 36 files changed, 8401 insertions(+)
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

