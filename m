Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC1B4937BDA
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jul 2024 19:51:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D58610E044;
	Fri, 19 Jul 2024 17:51:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="alqjd+wH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B6FD10E044
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jul 2024 17:51:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1MAk/w912yc9qyqXC2DlEVtPj3ArN36yLj/QbaY5nJOgnZTNcAtmc13c0RUwQHh0ezgUeJl3E5aRsy8+/MwCSOtwNh4olJo9Syk6IWQO3HfrzGJBnGE77d0v0y8cQlK8W/2igOeNTFJWnRb9AdxIceMwX33z1kp1HFX6/MdLUQax/0oGIzjj6O8TyyYUa0jG9mXZPQk2alKcuSh1QbCtTPCW+6t6YBWNR8JweWeungVKukpYFx1pjTtJJ0YoHk3X4ngVWkzPNlOoCO+7nhoCT2r0kVEiJuQ3tTNYoojsQL5ykH+U/57dbrm6L3LixWmEyO0oSrB+Ldygkgj8FqaKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AdiOR/0XEEHRLwQ4v6yPUGeVpTxLr19swanHcZoebCw=;
 b=Hg+K0UlorNPElQgEQti3nUbtIwgzBbNfkUXf7uOTNKUSLUtFQuyO94/IpeP1cfa3xqa0wTAHda1vp7oZ9p6pYHaPRxb7oI/4EmRtveQldocS8IevLvCq6OCb1HzTUJ+6BNj7i+BeyqzCBHlUeRlRNwrl3K6UroATHEbaE0jnp9fH2CG3cps1VtMNIcQZrvuwsJXmry3LUsKIOmCoTM/N7opTiWYMpdFEwK37tPGRTZddokK0cKt9ErQteHqA40abe3M0VfEOn3Yxs3sS9DOFqufBR+nWd+x7DwyrdBM5EBMlLm06+OOsd4JNBSwbKkHj9fSp4o2YendQs/kzp5LIFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AdiOR/0XEEHRLwQ4v6yPUGeVpTxLr19swanHcZoebCw=;
 b=alqjd+wHsJCoeCcNcUiryp6iQC7ONduoWuXPjBXaisLKdTV7TinN3R7v5jOjB5QK1oP2qj18xAe4SACiCTql5J6PUdoBc97l4oejcqLbWvJggt0P0WnXVLH/ryC1VPrVqMPsiNb1Sr/ZChPIqzJklcbztm7pDoFyA9f3E/Wd+1I=
Received: from BY5PR04CA0010.namprd04.prod.outlook.com (2603:10b6:a03:1d0::20)
 by DM4PR12MB5937.namprd12.prod.outlook.com (2603:10b6:8:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16; Fri, 19 Jul
 2024 17:51:22 +0000
Received: from SJ1PEPF000023D5.namprd21.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::53) by BY5PR04CA0010.outlook.office365.com
 (2603:10b6:a03:1d0::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29 via Frontend
 Transport; Fri, 19 Jul 2024 17:51:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023D5.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.5 via Frontend Transport; Fri, 19 Jul 2024 17:51:22 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 19 Jul
 2024 12:51:21 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 19 Jul 2024 12:51:20 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>
Subject: [PATCH V1 00/10] AMD XDNA driver
Date: Fri, 19 Jul 2024 10:51:18 -0700
Message-ID: <20240719175128.2257677-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D5:EE_|DM4PR12MB5937:EE_
X-MS-Office365-Filtering-Correlation-Id: da538a3c-ff35-4abf-5f3d-08dca81b66e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YKYxCJhzAfeQhHkBTh4bU47nghpQZgZawNjYS6f5AgKs4eJvjHdVR0wtVZkt?=
 =?us-ascii?Q?hhvG52G0JSw/2jzbxvgcMLstHQGM4TFPTJDT9xkmFt1zwoE44mGcfj6OtY5j?=
 =?us-ascii?Q?j9Lfp7NyjkpWRgORDfi/zKDkQyd/3s9K6j2XyU6O9Vvzjvx7jHJV4byiiujH?=
 =?us-ascii?Q?r599P1RH2lqiUv0Dhm/BcAMGP+kiRVRam8+p59+w87y4qMEP3XgZ1AGs9tc8?=
 =?us-ascii?Q?pZDpSPrX53lc0ig1JFFfnuD7uZShjYp74zPwRBWS4q1WXSwH+CE6S4LqtlXq?=
 =?us-ascii?Q?ogf14P7jtWi0JHeFtIDIXXVCmErLIm9iVsLMoxRFthK5tZzS5g7YAbdA7kxH?=
 =?us-ascii?Q?ZTCkm/Wvq/5hSbWPNsSvsYlaMwO5CYVUS9dZ9cEKpU9CM8/05DwV8n+mAbif?=
 =?us-ascii?Q?XXjcBibzsxujrxFEoucuUJxVcY1fHd7DVKe+LD2SEcsCh9l5rWmaTDwXIy+5?=
 =?us-ascii?Q?qYjzvrqYjpktqMtosfEzXJzEAw3XxvGFLaF+eV8Cg2ESSlvhpCHPo8oyRIG5?=
 =?us-ascii?Q?Cn7XY05K/DKxuRI6VSjuOj7APtbuP9advAUcrW8ljrpkr8WxWrycBTDDQ/x7?=
 =?us-ascii?Q?JrgFKB1VPmR75zIEs6m0aXmSvbI0W+fnKqxCZ2rK59+BfuklliPD1Qlyux2+?=
 =?us-ascii?Q?5Xd1yQ1Bll1RYHBSYCJQ1PweU5kom5IOcCMHoJXRdHKJzrCAilLZBApN6ZU9?=
 =?us-ascii?Q?sVtikaUJU1QegwMXOHLcAAdcOem4D0kjHWLreqNG5B6Jn028toadUz1hV4b/?=
 =?us-ascii?Q?5s7pGkqcXcPWKlEXzRsmOKHf/Cm5IDefhEWOHal+4CaieF253uApdh71QOlQ?=
 =?us-ascii?Q?9NQNe5+wtn/G4n1gRVxmRIjW/Dh3Fh0xXphTQXucANefaI6nB6RWxSVhQWRN?=
 =?us-ascii?Q?IIzJMdLJAM98vRPju66nnLO6yobyTdKjBPjJVR6tDXtURalndV1C2fzs2VVj?=
 =?us-ascii?Q?ZZV1OLqap6c8fxN/U4LshDktCGA5blWNPpedilxvTVWeo1/2bck5kUQw9/P1?=
 =?us-ascii?Q?e8Xk2WGV3bAHyp3k1d2TwdDyzvHBBvEv4puMDZypy06upQ99xP/ExRWJVgwJ?=
 =?us-ascii?Q?H0xs+Avctu4Ak4fbXR5Qq5fkYf9AVnaMLVdt8hnDMQg6dYGF5SpgNsfWI1+e?=
 =?us-ascii?Q?br7i4o4g52MeIr4DCvtj3umj3Z6r5op0d/Yp6za8m7C/ubYYpxTXlzmJyBJe?=
 =?us-ascii?Q?BRI5zuHptgAIaklNbtjEivtflaAh4evLydUH1KQgnVHRqT8KfvVqhJINpP4R?=
 =?us-ascii?Q?2KztQYgkiwYwCKserPGHTObejfOQP1CV4XHQysh8bVHog0GN2tb8RU44SXL2?=
 =?us-ascii?Q?lniy8VQwPGHhfvv5dZ1eMYsRPVYdCKiRuXibC1Usvp6c50aLknDd2/u0B8P7?=
 =?us-ascii?Q?qWU3wVHUns0i9YFL4E/QCUnOxTjktxmqmoMcYwiYhmbmTKsogw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2024 17:51:22.2031 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: da538a3c-ff35-4abf-5f3d-08dca81b66e4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D5.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5937
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

Lizhi Hou (10):
  accel/amdxdna: Add a new driver for AMD AI Engine
  accel/amdxdna: Support hardware mailbox
  accel/amdxdna: Add hardware resource solver
  accel/amdxdna: Add hardware context
  accel/amdxdna: Add GEM buffer object management
  accel/amdxdna: Add command execution
  accel/amdxdna: Add suspend and resume
  accel/amdxdna: Add error handling
  accel/amdxdna: Add query functions
  accel/amdxdna: Add firmware debug buffer support

 MAINTAINERS                                   |   9 +
 drivers/accel/Kconfig                         |   1 +
 drivers/accel/Makefile                        |   1 +
 drivers/accel/amdxdna/Kconfig                 |  15 +
 drivers/accel/amdxdna/Makefile                |  22 +
 drivers/accel/amdxdna/TODO                    |   4 +
 drivers/accel/amdxdna/aie2_ctx.c              | 946 ++++++++++++++++++
 drivers/accel/amdxdna/aie2_error.c            | 349 +++++++
 drivers/accel/amdxdna/aie2_message.c          | 775 ++++++++++++++
 drivers/accel/amdxdna/aie2_msg_priv.h         | 372 +++++++
 drivers/accel/amdxdna/aie2_pci.c              | 756 ++++++++++++++
 drivers/accel/amdxdna/aie2_pci.h              | 264 +++++
 drivers/accel/amdxdna/aie2_psp.c              | 137 +++
 drivers/accel/amdxdna/aie2_smu.c              | 112 +++
 drivers/accel/amdxdna/aie2_solver.c           | 329 ++++++
 drivers/accel/amdxdna/aie2_solver.h           | 156 +++
 drivers/accel/amdxdna/amdxdna_ctx.c           | 557 +++++++++++
 drivers/accel/amdxdna/amdxdna_ctx.h           | 207 ++++
 drivers/accel/amdxdna/amdxdna_drm.c           | 172 ++++
 drivers/accel/amdxdna/amdxdna_drm.h           | 114 +++
 drivers/accel/amdxdna/amdxdna_gem.c           | 700 +++++++++++++
 drivers/accel/amdxdna/amdxdna_gem.h           |  73 ++
 drivers/accel/amdxdna/amdxdna_mailbox.c       | 582 +++++++++++
 drivers/accel/amdxdna/amdxdna_mailbox.h       | 124 +++
 .../accel/amdxdna/amdxdna_mailbox_helper.c    |  50 +
 .../accel/amdxdna/amdxdna_mailbox_helper.h    |  43 +
 drivers/accel/amdxdna/amdxdna_pci_drv.c       | 234 +++++
 drivers/accel/amdxdna/amdxdna_pci_drv.h       |  31 +
 drivers/accel/amdxdna/amdxdna_sysfs.c         |  58 ++
 drivers/accel/amdxdna/npu1_regs.c             |  94 ++
 drivers/accel/amdxdna/npu2_regs.c             | 111 ++
 drivers/accel/amdxdna/npu4_regs.c             | 111 ++
 drivers/accel/amdxdna/npu5_regs.c             | 111 ++
 include/trace/events/amdxdna.h                | 101 ++
 include/uapi/drm/amdxdna_accel.h              | 456 +++++++++
 35 files changed, 8177 insertions(+)
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
 create mode 100644 drivers/accel/amdxdna/amdxdna_drm.c
 create mode 100644 drivers/accel/amdxdna/amdxdna_drm.h
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

