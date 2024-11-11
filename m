Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 210AF9C44C4
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 19:17:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4144310E303;
	Mon, 11 Nov 2024 18:17:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="A2nC8Om+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2078.outbound.protection.outlook.com [40.107.95.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4252310E303
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2024 18:17:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MoAFBZ/kRSSwdLjumWh2GPo4WHSRO1MOR4dPRw0F5Y69CNKS4FEy/qjhghVrWO9mxsmyg1Y/uuWqlqecmztdM4EhZzWLdOhPB+nf7Zl+PgBE3SaDqKVezNOXprLVdIbNaHid9Ef4YzOVBCYDVDgCgdA1AekFr/Ua0Tk6NhWdfS5yv5pHX9wxuJDjjse6Wgrt7IwafWkGOgPaETNr3Gs5lZX9P8luHJrgFvp9xcARegUjrV2vLO5JH950xqg6zkhyrugXs3yrEzjHACSUVXwJKDo1+6ET83UawHjnXLXTGM+FhYMBUPqS1AYJMXNnvz440Jta4bhMaSLK1rq9MaXz7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JtjZcu6ineQyt3fWft6BSRKa8KbLshC6psP3lqsVVkk=;
 b=BRT6pmQoWRQ0zwadMkiWMDg3yVVTaXWt5U70/CgsM1FjMvrT2WMNSYV6UqGkT1uCIqhPQRySs9nV1AXdkPOCrcBy0TCmYdy+6C6wxWGyMBx48dDCTmQYMOlJFJbRQm+5rT5OXxzVoVAm2K6iqo+7kRQPe3BFBUDdoKjCv9TH6E2wipZWmkVoiMkvyG5ZiPSReoOkxSoz0iDIeO3DCSWgtgq2SBkAHUMfamASng93/aGliAxQSzgD5071neVk2uUVbvTWI8eI3aqt2I55YytWk0xIW6nCSv9+tO6qywUcQ+26K8dF0GMvmvl3JCE59SB5PoEj9D6YdPeZ8cqKaqcfXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JtjZcu6ineQyt3fWft6BSRKa8KbLshC6psP3lqsVVkk=;
 b=A2nC8Om+XZsLv2H3SxmToxIJLO7UuuQFezaLin6lOIEFkNE9QNrlWrC9TSU54tURwloaQ51hU91J+kCT+2hlNVe6cqNS/xtJKnqQRF0ghfvUfsR2zm+iNtS/Xgmufv2w6yoWC+8sZLR43uATquRQKTJLKHq733qDxy/VlvzDMcM=
Received: from MN2PR03CA0005.namprd03.prod.outlook.com (2603:10b6:208:23a::10)
 by CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 18:17:14 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:208:23a:cafe::3f) by MN2PR03CA0005.outlook.office365.com
 (2603:10b6:208:23a::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Mon, 11 Nov 2024 18:17:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 11 Nov 2024 18:17:14 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 12:17:14 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 12:17:13 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 11 Nov 2024 12:17:13 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V9 00/10] AMD XDNA driver
Date: Mon, 11 Nov 2024 10:17:01 -0800
Message-ID: <20241111181711.662686-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|CH3PR12MB9194:EE_
X-MS-Office365-Filtering-Correlation-Id: a6906a85-caad-44b2-44e6-08dd027d118d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a85XSgqIcoPNiyYbO5bJiBgUhmGKC0brcFz3jGF5zTjir/WXV1CVSlLsiIs6?=
 =?us-ascii?Q?zmDvDnbc67q6vhb3+DRlB+xtRNoUq+OEwH6Z3AG3ZAMs7SrZgoTh3yoH2CU9?=
 =?us-ascii?Q?6n64M7NZc47TCEa902zkIZPWrY+IatNcDekpSWoZeaJ8BV5/ltSxz70GRDWl?=
 =?us-ascii?Q?1kSZxWF/kM8vGaeUYcvkUbH/4mdXRx9oHwCE5860aCw0AC3sSek12Z+ThEA5?=
 =?us-ascii?Q?r8Jc/mdgVqGLmE4HEZFmDkgMnxd72xLxwVpbXCXrE25rT/y0R7fWpp2sYtaG?=
 =?us-ascii?Q?m6HXQTvl6I2PRjz8Fedbp7T0oFMFnoAfQXkBCYEwxztkhN2l3h4xsXBG5Edo?=
 =?us-ascii?Q?9CHRKdnuflBzfF2IkRrb6tx+MC6IT23U26sfffZOiChs72yoE32KkNN/soKi?=
 =?us-ascii?Q?vYBDXahXgeYsfqdH8+/ykafE3AcQqpAkdKvErcdUBPiYpizF650UoPnzyqUU?=
 =?us-ascii?Q?k38HIam0pSR8TgFAoHY6Dxcj4C31b5uzmpF+7WkBl95kas6t2gHvWHnYZ/am?=
 =?us-ascii?Q?haNxEYnufTaqpP0ZaqMbOuWgPgpGIxNje9W4VDV1ZRRXOH/DR5ej+ZJizwb6?=
 =?us-ascii?Q?mzTB/NQmrLsuXTavRwvR763rBZ4yByJKtgNlYMtBbz9bxm+dAF8Wa1PKbLCP?=
 =?us-ascii?Q?veLyiXtfnvaNqllDJNlkEJrNWTpe7EHyirTZu2MltA2UedtwHiAEmVGDFj3r?=
 =?us-ascii?Q?PBpyLT8jeUlVlSwm0ndTSplEeEj8D2acYd6TApFWeZALpeLP/xMTbVMzDad9?=
 =?us-ascii?Q?NDhdcYZDo/Mbpkt+xrGLVQXe1yLeZHVoZnqBni9AocoY6pkBNv9d7pRDL2UL?=
 =?us-ascii?Q?FKH6fgKcTDh5h7KUcflkLdRxI8FaWAAPTnLYx+O1Xk97VttZMRKue01G8o2R?=
 =?us-ascii?Q?XOQuCZz2jVgGweh3z3svWKhukeXGzqNsp3r4DSKbrmw7OfNYMGvGFYYcnyS7?=
 =?us-ascii?Q?H7eo0oSebiysouiVLZbxiJC/ZxnvwIL5Vk4eSEa9D+PktCCORa6T4QJhfy2b?=
 =?us-ascii?Q?E0opRtvp1hmRQGX3T6bNUqcjHc9g3g/7rR7RWto2E4jjexUhfKM3QW/yj3FF?=
 =?us-ascii?Q?reBg439VUEwSUVlxsmAQp/Lb23yoINkcxVj/hVG+iNhiwcnEaTvan8knnzyE?=
 =?us-ascii?Q?VMDLLUyNjpqjOP47YZDZ11cW/18I4Gwf7X3ylPTMxFuPJdedWh12OttdIEcg?=
 =?us-ascii?Q?Sd2MxBxUOCnxLfKN+n+HpWgCL4MIAZzxN9xBcjWnBSZp/ydFc3uk6C2knpoW?=
 =?us-ascii?Q?imReJZ6esYleIwgO4ZwAWHqvX49cYFSjJcbtIXVUmNFiq96PQiPD9LSCi7k9?=
 =?us-ascii?Q?QZPxD5eiW5Kq0d2kqMZmHqVbSvvWYPqRxDjWmXVQ5admbAR9X15z8ZtYr7g2?=
 =?us-ascii?Q?HGvki/A=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 18:17:14.4491 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6906a85-caad-44b2-44e6-08dd027d118d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9194
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

