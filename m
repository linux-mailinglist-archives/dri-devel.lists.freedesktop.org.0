Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6B9F9C61C1
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2024 20:48:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8E1B10E19A;
	Tue, 12 Nov 2024 19:48:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GJ4zAHZg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2058.outbound.protection.outlook.com [40.107.92.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19F0010E19A
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Nov 2024 19:48:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EIriCnJ4FEBXZrL+nKx4dtPqtHltSgHf3PZmqip9395c3kNJc+DzDfNmTp/YA46236C9QGA2vkqemQU2OM020DDeRgeNjrWJ9Ir97KLINggDUgxqRQ8hxit+e9Dooh0tHpXVSrgt1zCfixur8oVtmfgh3G91P4Jpkn7wOWexD6Z9BimohhVWawxjaXpgdJGP6rhICbYXP10jj6Qjlu2axOu+iUWft287Nmw/V0mfk5N8DFLEBM/QC0JYhfjXGLqIf/iwg40xkpm8NwgcMs6n6h6IMl8UjTTZuRV3LGdJJt4MRwVDs7WL6hEZaZMWtETZt1dyB76MfELGhWnX9vtpDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wHAUM4A8Kmvtv3HWtndZ+mhcU3+mNl6X6Z7e7d3SdyM=;
 b=Kv4R26WYqVj1emXpEWN9Nzhqx+N3ImDV35CGWTk5Y1gZVAXTpuEpwY+ha43PfVyYcpEpLoRv/rbiE6oSz1yiwBFwpb400dyNyoeDI4ikwnAmpZw2sCrYHL8Iqsvd97Du6ZGe+wNnumCuwaETOGH8stWnsVMU88+8P2YgIIkKAndTVxRtK2DWERWiRaSkkYFCy09Xx7RT9CrUrBGi71WFPxZCJm+y+vfyC7QFD8yg+CscptMSiGEZn7hhMz9iwAe+bzKBeC8ND7r1xwWUHrLrtSm5ZdxfwOOMKNUtZl5Zw/mgm9Dh8xP0zRQ87Zxjao+M9YUVBCEAvBeKADXYZDCCmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wHAUM4A8Kmvtv3HWtndZ+mhcU3+mNl6X6Z7e7d3SdyM=;
 b=GJ4zAHZgHlLnNZUKKlXTtiNzqDy28i8S/13uremEquwjHKKGkhA5Gooo19WLH6znaxtlyQeeSYR7WuENG3tww4JpL+M2J0wq7bUJ3Pdv6G7/2SB2cGv2vGbM1YI8BLIWY+D6VEi3NatJTICDX4U67GfgLVhp8afKXdAZshDVpos=
Received: from SJ0PR13CA0217.namprd13.prod.outlook.com (2603:10b6:a03:2c1::12)
 by PH8PR12MB7424.namprd12.prod.outlook.com (2603:10b6:510:228::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Tue, 12 Nov
 2024 19:48:02 +0000
Received: from CO1PEPF000066E6.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::b0) by SJ0PR13CA0217.outlook.office365.com
 (2603:10b6:a03:2c1::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.15 via Frontend
 Transport; Tue, 12 Nov 2024 19:48:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1PEPF000066E6.mail.protection.outlook.com (10.167.249.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Tue, 12 Nov 2024 19:48:01 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 13:48:01 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Nov
 2024 13:48:00 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 12 Nov 2024 13:48:00 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V10 00/10] AMD XDNA driver
Date: Tue, 12 Nov 2024 11:47:35 -0800
Message-ID: <20241112194745.854626-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000066E6:EE_|PH8PR12MB7424:EE_
X-MS-Office365-Filtering-Correlation-Id: 29d1cd01-1ae6-473d-3676-08dd0352eaf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qJzGMY74XCX3qdAnHsHX5DhLNeAtuIvls/oW5D7cJsJpd3kuuUcTSO2FGDot?=
 =?us-ascii?Q?Thf7WsJqqshlk8z9RAeB/qeEkCfI6FNvYtZVi/2cZU3kRxuAGKJUL/e1VCJg?=
 =?us-ascii?Q?rShdMgzvCSC/2nvb33VYV4gL+U1iRmcuCEUYrMKeqIv+7WwX6yLW8e0MzyST?=
 =?us-ascii?Q?+Jzt4vUmjs75oJv/lGR6VBL3as3EqS41u0y9Pr07t1mqgzZPi7/qJuoRmBgE?=
 =?us-ascii?Q?Xxz92fxMUwmEoCCeagEST6Pa5MsGiEux5nzH2RrfgAr9nhio+SwD+Qu0+HWr?=
 =?us-ascii?Q?plgmYezNvgkTYanKVx/0qWfG2SmH/keerToiS/5ViGmf7D5tD7O9235Gcc4B?=
 =?us-ascii?Q?ZvyP6sSlP10vw1Q9a/gs8V1Grw2hUgkjPMp4hxcESLbpV6lmC8Q7e7ncAdNR?=
 =?us-ascii?Q?Cntv008mSqNYHFq/XXHstEUM39fCz0EuEKHuAAoXuccVEJZtIQGnhgACrlRA?=
 =?us-ascii?Q?ZqVB7NxBVJC0ypoFrv+JqwUbVjQ/oh3XZtYvJFU8gFu5j5Axs7oOKjZG9DhT?=
 =?us-ascii?Q?5CqObK6Mw3My0iC3cozniKt1tRthM2QVbS11ldYZcGAXik9ra1f/eG48hBAu?=
 =?us-ascii?Q?suWgx8XlZSsbRS6IQ6uqIcd4wBivKIY/qw15SqqAMPtmCRmnWuP+eTU4Lxr/?=
 =?us-ascii?Q?kRuMrAqcfmPDmiC5POYJAc2/YNcY8/kl1xKbI1XIC9r4k997CRkFl7YwCopE?=
 =?us-ascii?Q?iro972udUSDuHyL6Djl8FiDyNtHbqo45Jaa+5nFD3COgmSLM09pAZSHFdT70?=
 =?us-ascii?Q?J3kUAcEmnKzar4LAyCzuks4Ib/4IloKwaKsjP4LQfGSL1ntup3m8gtn/JMUi?=
 =?us-ascii?Q?azP6bMIGAM4qMiHGH0G34TimcUGBgpVTu47WNSge7Dn5DPM3lq2j6nWlZMAd?=
 =?us-ascii?Q?b2ud0RdHRLNjcqZqwJhzCdERfBn4/hPGM57tRNZcRs9kfwIJLT6urcmGQE1/?=
 =?us-ascii?Q?pMdPAoOBd/tVOMW1pQ2v2EX82qL/87LWIcS8J5S9I5QX7q7YAIhvYFGaZgnF?=
 =?us-ascii?Q?8BQj0L5iHUrtXq43fjPFCR3hIPeYXsga2tAbq4zfp5vcwQMHO3xOeusoy0Zr?=
 =?us-ascii?Q?63Fv536+oFyYEb0loJmp85qYiy/wPWixFZ+PZSckWsKITaMRbdMfSAIkPDL2?=
 =?us-ascii?Q?JtnyyuJQ64Jb62YmJxDg6C1rmP3SanHuhncolztWUofR90pPs8NC/NTnw3zP?=
 =?us-ascii?Q?zxpNffZJssHhDJdwgZl5W8d0wKAEGlXinJTRsFyYONdJJUPjIIxW1kslQVYb?=
 =?us-ascii?Q?mrND6tyviTelHG7HpDjfpQC/oWZTeZyXVYS4hCpzEXBI/VGeGyWJyeMGztbH?=
 =?us-ascii?Q?BqYfeF5d+83bOIl7GOoSv7MV5os/7567Juk5cRPVSOgJVHySIXmEP8A+eQgk?=
 =?us-ascii?Q?DiSK32Q=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2024 19:48:01.9056 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29d1cd01-1ae6-473d-3676-08dd0352eaf5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000066E6.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7424
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

Changes since v9:
- Change notifier_lock to rw_semaphore

Changes since v8:
- Fix mis-merged line

Changes since v7:
- Prealloc dma fence chain before publishing dma-fence
- Install the job's finished fence in dma-resv rather than driver fence

Changes since v6:
- Revise command submission flow

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

 Documentation/accel/amdxdna/amdnpu.rst        | 281 ++++++
 Documentation/accel/amdxdna/index.rst         |  11 +
 Documentation/accel/index.rst                 |   1 +
 MAINTAINERS                                   |  11 +
 drivers/accel/Kconfig                         |   1 +
 drivers/accel/Makefile                        |   1 +
 drivers/accel/amdxdna/Kconfig                 |  18 +
 drivers/accel/amdxdna/Makefile                |  21 +
 drivers/accel/amdxdna/TODO                    |   5 +
 drivers/accel/amdxdna/aie2_ctx.c              | 900 ++++++++++++++++++
 drivers/accel/amdxdna/aie2_error.c            | 360 +++++++
 drivers/accel/amdxdna/aie2_message.c          | 791 +++++++++++++++
 drivers/accel/amdxdna/aie2_msg_priv.h         | 370 +++++++
 drivers/accel/amdxdna/aie2_pci.c              | 762 +++++++++++++++
 drivers/accel/amdxdna/aie2_pci.h              | 259 +++++
 drivers/accel/amdxdna/aie2_psp.c              | 146 +++
 drivers/accel/amdxdna/aie2_smu.c              | 119 +++
 drivers/accel/amdxdna/aie2_solver.c           | 330 +++++++
 drivers/accel/amdxdna/aie2_solver.h           | 154 +++
 drivers/accel/amdxdna/amdxdna_ctx.c           | 553 +++++++++++
 drivers/accel/amdxdna/amdxdna_ctx.h           | 162 ++++
 drivers/accel/amdxdna/amdxdna_gem.c           | 622 ++++++++++++
 drivers/accel/amdxdna/amdxdna_gem.h           |  65 ++
 drivers/accel/amdxdna/amdxdna_mailbox.c       | 576 +++++++++++
 drivers/accel/amdxdna/amdxdna_mailbox.h       | 124 +++
 .../accel/amdxdna/amdxdna_mailbox_helper.c    |  61 ++
 .../accel/amdxdna/amdxdna_mailbox_helper.h    |  42 +
 drivers/accel/amdxdna/amdxdna_pci_drv.c       | 409 ++++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.h       | 123 +++
 drivers/accel/amdxdna/amdxdna_sysfs.c         |  67 ++
 drivers/accel/amdxdna/npu1_regs.c             | 101 ++
 drivers/accel/amdxdna/npu2_regs.c             | 118 +++
 drivers/accel/amdxdna/npu4_regs.c             | 118 +++
 drivers/accel/amdxdna/npu5_regs.c             | 118 +++
 include/trace/events/amdxdna.h                | 101 ++
 include/uapi/drm/amdxdna_accel.h              | 436 +++++++++
 36 files changed, 8337 insertions(+)
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

