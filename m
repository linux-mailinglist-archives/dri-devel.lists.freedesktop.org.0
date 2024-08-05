Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6537D948086
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2024 19:40:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A51F110E148;
	Mon,  5 Aug 2024 17:40:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PM091Mp7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2077.outbound.protection.outlook.com [40.107.220.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DC3310E148
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2024 17:40:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SK3sPiT38sZu5+nX1HzigcMgdYBhQQmMnc46zVWSMt6J2nIJKnvltvRoAPmn7IdC8N7kOTge2T1OdsvZbhlIigb6rkKz/34TZecJjG1x+dB1dKWIZZJT3WeLAVpbuPHSo2qb1UCLlMMUCJlcDKWx3ryX1WfizyFLAmNtNIEM484FhXGC4CiCd1dETO535yCvIQxRvfdCEcGqzhfaHose0eY+jigL8dAUlvuXDkaJ5hlRkUlx5FH4YYTem5CYkIlIvU+FZHKjtWIDIA1+oTgSXiCIHDNq664BROlCH1nCQGqKtfjsHe38mAsqAWSA0UXeFCiq+OCdsnd+krVpkDMaVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZH7B+r51OODcOACpvQ3MuiNsmEcn+iVT8a8/Y2PVOQ=;
 b=LWK3jlb4q1gS4v3QbZs9Yh8mmM4xG8EHouniY1A3hjItnfV5EAzCF/qVgsC6KyOKdDBR0NF4rp/fV6fjcaeWixzhg3H8xCmxFi4TyvFIqtJk4CVhiZ6PeuauNqJcJYbZCsIFsML4OYUpz0/wFXFrFyBASlasClyl4XroCJX88RUmzyddTOEl7GdzwewQklsIQafUKqB4b9hWW20SSmaqWv7wmL8Hbm7oQNTOnk7IqH8rWQl/An9G4ZJa1PtP8P+SSG+S8Uy9OvHEJhzPMTPhkqLLSM0HSLQMM9ZJE1GQsRIDjfkbDWhBpPoasAvhJi59nI9ncY4/UleLsZZz9cHYyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZH7B+r51OODcOACpvQ3MuiNsmEcn+iVT8a8/Y2PVOQ=;
 b=PM091Mp7rnZ9gDk/j64wROo6pCKdpeG+RXsNXbNxIyas3QATlU+nJKfoTELW9EcNJjqbIXPhW17aMOySNmRZRLKNQ1pLcDLvSpJMI/BSGD8BzfXrwrfKOU1cWxiszMPm71cYauabZWr4MKLbhuWmoG8Dlm1527zDnkFtrTu2tzE=
Received: from CH2PR08CA0016.namprd08.prod.outlook.com (2603:10b6:610:5a::26)
 by MN0PR12MB6053.namprd12.prod.outlook.com (2603:10b6:208:3cf::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Mon, 5 Aug
 2024 17:40:21 +0000
Received: from CH1PEPF0000AD7B.namprd04.prod.outlook.com
 (2603:10b6:610:5a:cafe::fc) by CH2PR08CA0016.outlook.office365.com
 (2603:10b6:610:5a::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27 via Frontend
 Transport; Mon, 5 Aug 2024 17:40:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7B.mail.protection.outlook.com (10.167.244.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Mon, 5 Aug 2024 17:40:20 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 5 Aug
 2024 12:40:20 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 5 Aug 2024 12:40:19 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V2 00/10] AMD XDNA driver
Date: Mon, 5 Aug 2024 10:39:49 -0700
Message-ID: <20240805173959.3181199-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7B:EE_|MN0PR12MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: cb116432-6c9f-4cf4-b4bf-08dcb575adc0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Vz0hD12O0W5jnt5AcAjWF42dQIIexzGFVCeNhqPwIjQrMmgEshWKUb5xARO9?=
 =?us-ascii?Q?bk7zmFXH1o+byNqH76fusTaVng1jTM2y6d3yeimFoPLkjUHwk1OR9x2USYdR?=
 =?us-ascii?Q?TbipEEJnhHDOfx2hBzkkAedDAQ8Ad8jMl+dd9F+hlHrybSfKjwsErUfVtgt6?=
 =?us-ascii?Q?gP9o5MJ2/DMZ1m9qTpq1zMrFESKTVEKhvNTrEP1l5qnQxkaPyi3OQMPUq2f6?=
 =?us-ascii?Q?03WYBzG7UFG7+P7NrmGqPiDwliMNERTqRbT1PnHbZAKwT8opU7dq45JDjqML?=
 =?us-ascii?Q?9HgmSJm3V7sCFEnEaGKLOfQcyzdZwwCKjXPWgW34OSKPjPMfichM99tyqtpr?=
 =?us-ascii?Q?1BLpvvCjxqYhWwH2MSowDzT/7LfwbwCvn+Z/T6CG3oClW3S4hfVLj2sO65vm?=
 =?us-ascii?Q?ruzn04m/bFPJfqJ90C3cwMwvsSs9JIEYLUMw9wJmlBH7fESGL7tyTZBU2rO3?=
 =?us-ascii?Q?LIHbdQjg8M0bK5y4hmBQYBX6zC+m1oDiMcsBXdY2kPb2miDsS1Ra9IkVulY6?=
 =?us-ascii?Q?oOkn0xwCmSEIQD9IowQcqDVRepUSpeRg4uT3N21zzXTDQBNT4qbW8JP0gEPs?=
 =?us-ascii?Q?n0Ct/Uskv93AdbjJQMqWXEVCKedZyYeYVrNJqfKoFwRjQdA5smZ4fC3ATXOZ?=
 =?us-ascii?Q?MV5pcFI7nw5rFwc+E363xqvBcjEGAj95lLkE6SR8Wu0+5HEg9mTEpmvY86zX?=
 =?us-ascii?Q?retiTYx3cJTgTJf+iVIqVBarguf1E17NDG0DdQi98AWb5dWZ9qk8IIP9Y3kh?=
 =?us-ascii?Q?/FvB1EHg89e76F24hM0Lc1tjTFDhqXCQkvlNiXlGQU7XqKOsqZAgCnncBGhm?=
 =?us-ascii?Q?ErndAt+C5uQRKKQCdFdbEcYHm4LB31ll6XxsufdwQLAXmPvt/MCudMU8k7DZ?=
 =?us-ascii?Q?OfzK9N0XedrzuVh+RxnaCPIQjNQABv0/B5NZYOX7hwgTEj6vu5I5m6zBH0sm?=
 =?us-ascii?Q?zHvd9QPy2m+YriJ1gupMkpYvzrDczrHSTTitWewEfl57Nbl6WowRHWrwsPAj?=
 =?us-ascii?Q?9aHlq3fu21He8OL6QHNG3v3idh2IPPZBVlZ5+GZi8JU4PhChvNvGVBzyqeZ8?=
 =?us-ascii?Q?sEbqQqquT939dbr0lM5OmCbNCp24I/+nJxWDsw8PbqMpFGV1C2kXaAgo5Sl9?=
 =?us-ascii?Q?qTFeQGpCuvs8HN0EERUr6xonu0NuH5pkjFWzTeS7pJ73R4eZ0/h+x2XDBM7G?=
 =?us-ascii?Q?PIMXst1XJYLnKcZjsYdDjeVcDZEmXPAqtUE8tt1uzbxfxHyCsUOTQ2JUCh/7?=
 =?us-ascii?Q?lQRovEVXCAnsM7rwc4jp6eLqjy732XWWD5jWp2g8HeM04UocoASzOry/+wa/?=
 =?us-ascii?Q?yS0S6MNxgb9ShjzGq2z546CBY8QA5ddP5NviQK8rulapDUTo1Y5Aw4Rzw7Ph?=
 =?us-ascii?Q?TTgz300fMHhSsoj3Et533H3jby+py8GIRq2YX2+io2z3kaBM+A=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2024 17:40:20.9250 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cb116432-6c9f-4cf4-b4bf-08dcb575adc0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6053
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

Changes since v1:
- Remove some inline defines
- Minor changes based code review comments

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
 drivers/accel/amdxdna/aie2_ctx.c              | 949 ++++++++++++++++++
 drivers/accel/amdxdna/aie2_error.c            | 349 +++++++
 drivers/accel/amdxdna/aie2_message.c          | 775 ++++++++++++++
 drivers/accel/amdxdna/aie2_msg_priv.h         | 372 +++++++
 drivers/accel/amdxdna/aie2_pci.c              | 756 ++++++++++++++
 drivers/accel/amdxdna/aie2_pci.h              | 264 +++++
 drivers/accel/amdxdna/aie2_psp.c              | 137 +++
 drivers/accel/amdxdna/aie2_smu.c              | 112 +++
 drivers/accel/amdxdna/aie2_solver.c           | 329 ++++++
 drivers/accel/amdxdna/aie2_solver.h           | 156 +++
 drivers/accel/amdxdna/amdxdna_ctx.c           | 597 +++++++++++
 drivers/accel/amdxdna/amdxdna_ctx.h           | 165 +++
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
 35 files changed, 8178 insertions(+)
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

