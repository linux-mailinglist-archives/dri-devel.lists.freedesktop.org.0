Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D280A9759EA
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 20:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6527410EA67;
	Wed, 11 Sep 2024 18:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TKc47l84";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2088.outbound.protection.outlook.com [40.107.92.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F71D10E1AD
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 18:06:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5vigRdtaucoi6+t8NlZX0yP5dRJpc3Yhb6/LuHkKhFYdwuZxv9ZOAILWBZhyGXRNde77KmZ+brOEfrSk7LGSNUbCznhGf2ZlWYJPSnC8JENUHCI5iFjr3b7MxNJSoBz9jXWMOEDtQi/vLxJAqlZR13aUmI+qTA7lM390HL14V0OBGRTwWxwNbmVD7DS49MgfVKr0y3h+43+CjJHKTTK2l4xqRSdu8nS6Xi395Xla7pfM+geBc1kjpljN4MSWhkQ9q8XETuUXTn4xYPSJorm6c+gy3bHvFgH+H5QG2rMQUJZ0D4BU45a1wzaKQf2foj925YsoYGSaSqLPqXrKfi/Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KF4V1wD8tzRl1HiF/bEb+0DvTGybf3ZahmRg1Mm7eXk=;
 b=iUHY2GADCuqqW/NVuG1Qib2nn8ltahCtO/l7Z+MF4LvT0JobjzFMPlp5Q1+4DMFtn+dx885mYBK5p3NuawpGxCtIvxqJBp/3wHi7NjER7bpEc6FJ9JS59Hb45uRvPSfhFwQAzIGDfwlTo9UoEjCf1jVXt7tnJzE3/u17la9pa4gOfUrneVVkVA218HAH92Bx/lmL9qv2ZtSSzJxOXuOfsISADcOMk9OP9Sq8F6GHiDVvYbAM79J2/TFh8g7AXy+urXdS8Q421RqsqxYwR1bmDgH0aXUfQfHDO/oTf4+vMGPe6BRzYa4eTjO1LxdLxIv989kUyHBgn7BnemwCVWGQMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KF4V1wD8tzRl1HiF/bEb+0DvTGybf3ZahmRg1Mm7eXk=;
 b=TKc47l84HrkYrpKvN0CiiSC2ewZOwEht1DAeqtxE4lBXPJaTIcbbHE+tI5hXWiKDLRheVWcBseopl/PioNd0zCjDWBlSZZ8OexTFJ5Sv/mp5Fn0hZGcrVumVvJAmAGIBPsQGq3i2foG8pCfdgws5DAUFLymLw7Dz5zltJDdrEzA=
Received: from SJ0PR03CA0145.namprd03.prod.outlook.com (2603:10b6:a03:33c::30)
 by SA1PR12MB7441.namprd12.prod.outlook.com (2603:10b6:806:2b9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 11 Sep
 2024 18:06:25 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:33c:cafe::85) by SJ0PR03CA0145.outlook.office365.com
 (2603:10b6:a03:33c::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.25 via Frontend
 Transport; Wed, 11 Sep 2024 18:06:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 18:06:25 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 13:06:20 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 13:06:20 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 11 Sep 2024 13:06:19 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V3 00/11] AMD XDNA driver
Date: Wed, 11 Sep 2024 11:05:53 -0700
Message-ID: <20240911180604.1834434-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|SA1PR12MB7441:EE_
X-MS-Office365-Filtering-Correlation-Id: c249026b-7ea3-4782-a332-08dcd28c737e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jNXB0byph9yzbvK2Az15EhyrVdQbIjDz/qGhxfK6qvGSaSuiKehX6TXDd3kM?=
 =?us-ascii?Q?U2u1zzH16EqafComD3YYSvKHu7iH4wJ/fRmEGaD54lUMgAmWTxYLgFC9PqTg?=
 =?us-ascii?Q?iW4FMwGUFqsRnytKFS+f9rmIfnSZEYkpZ3ghph1SPqhcmkL80DUIdqnOvTV1?=
 =?us-ascii?Q?uWskMIgiSPwpRH5MF9RzHsPNEsqiTsprHwEoszbNfzvYsu5jst1i+8i0jo1U?=
 =?us-ascii?Q?dEjNn0vkrDio2ZrYH5cLlD8ZzZBfI5ZwX1FQBDfEmUSRitG/+5+Ti0C4+Wvy?=
 =?us-ascii?Q?uaMqjvbYuFdNi8HSFAXiMM/wSgwGo9wAgX3l2QfYl1yv8hT6Im5XakHAvm91?=
 =?us-ascii?Q?jBytW9bhO81RTZg/37FZPnMXt0IjMK7NRmpyswW+HtS99Uete9XEh1RLoL3m?=
 =?us-ascii?Q?d8IWA1DGmVbPoRV/cfWWp7JFRtSfMC0UslF9GeI5Uu0XvW1sHsxEfpP4Af4k?=
 =?us-ascii?Q?mSD/G6y9qkpHHGPtJuzolAR3jUg8s1vQkbOGkXD1sT4Q//jvzP2XPRArkxTf?=
 =?us-ascii?Q?iZX8EL6+pWNEh+bALNDIJi/+2/MyrY6jS/jMHSCkO9vnyWTaihEFAFun3JDH?=
 =?us-ascii?Q?ASFk8pWcTcPjFy1zFs71ebRh0cQyiv5qq0BJtRSmfVUVRtQ4GePdfycpyhPs?=
 =?us-ascii?Q?IzIfUTPQRe23y5JMtfZ1CpGHS7JjmC42hM5m4Ow1W2LGNpaaSovzV84oabU7?=
 =?us-ascii?Q?LdwLxQxWuE0CyjFbbUvByXsoG3t4wDZPsxYoV6QNDPcuPMxyvQJtX5sld/Gu?=
 =?us-ascii?Q?jxqo7yjcBO1SEr6cR2DjmXxlsV0CpzeRGtOYDh5svfpTHPTNvQY6TWET+RK5?=
 =?us-ascii?Q?KbR/xo4KpNaYgfuicPGm50M7N5vnN7KD64/6FXoaRpX5ZcVX7zReWFvKZoEu?=
 =?us-ascii?Q?CeZGN8qC++niVrfG5Bn9vvK8AyoxZbENdOJJOrVTL9NevymbdOOmi5Op28y6?=
 =?us-ascii?Q?Fvf/oJvIduddDNxZLRFb8t31PLDYwvpKItzKPIxMCFi3zB2NWhx7PVE7ItOl?=
 =?us-ascii?Q?QiEdh3imDt3To/cY56/2fja8bBVoYKecmNQMOG8fmtuVX5prjDnDeSqrE0nb?=
 =?us-ascii?Q?qe4wEp3MthbmJCCS8XBdgJWPN35YAzoIQTssMnTKTC+xD6iQEMnxZs8XitWI?=
 =?us-ascii?Q?rg98SVBvxn4eVKOQWzHZuF7ZiRSKExExcPW6c2CNNhMtda6vX26UAXSR8Sur?=
 =?us-ascii?Q?evC4nrCK4CMbqZhXk3HU42jhAef2YCnZ5w4pM3GdJXyjKojW1YaQcftp9kyi?=
 =?us-ascii?Q?sYOvOogc27crC7Vq2VS8uwQfiSW+Q4iQmIw9gxi6Az975s459CCmXAwtBkxf?=
 =?us-ascii?Q?6yVU1vgKS54WbqbiLwYpi7QWi2iPOri8dMiYJnAy2IaXpkX4y9F36Hbq9sw2?=
 =?us-ascii?Q?cS7/Bn9hUUAx9Koce+Fo6s/H501cYhFS/n+DCx3Yoy3AFKO6hQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 18:06:25.2982 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c249026b-7ea3-4782-a332-08dcd28c737e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7441
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

Changes since v2:
- Add document amdnpu.rst
- Change AIE2_DEVM_SIZE to 64M due to firmware change
- Changes based on code review comments

Changes since v1:
- Remove some inline defines
- Minor changes based on code review comments

Lizhi Hou (11):
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
  accel/amdxdna: Add firmware debug buffer support

 Documentation/accel/amdxdna/amdnpu.rst        | 283 ++++++
 Documentation/accel/amdxdna/index.rst         |  11 +
 Documentation/accel/index.rst                 |   1 +
 MAINTAINERS                                   |  10 +
 drivers/accel/Kconfig                         |   1 +
 drivers/accel/Makefile                        |   1 +
 drivers/accel/amdxdna/Kconfig                 |  15 +
 drivers/accel/amdxdna/Makefile                |  21 +
 drivers/accel/amdxdna/TODO                    |   5 +
 drivers/accel/amdxdna/aie2_ctx.c              | 960 ++++++++++++++++++
 drivers/accel/amdxdna/aie2_error.c            | 357 +++++++
 drivers/accel/amdxdna/aie2_message.c          | 790 ++++++++++++++
 drivers/accel/amdxdna/aie2_msg_priv.h         | 370 +++++++
 drivers/accel/amdxdna/aie2_pci.c              | 766 ++++++++++++++
 drivers/accel/amdxdna/aie2_pci.h              | 251 +++++
 drivers/accel/amdxdna/aie2_psp.c              | 146 +++
 drivers/accel/amdxdna/aie2_smu.c              | 121 +++
 drivers/accel/amdxdna/aie2_solver.c           | 330 ++++++
 drivers/accel/amdxdna/aie2_solver.h           | 154 +++
 drivers/accel/amdxdna/amdxdna_ctx.c           | 608 +++++++++++
 drivers/accel/amdxdna/amdxdna_ctx.h           | 161 +++
 drivers/accel/amdxdna/amdxdna_gem.c           | 709 +++++++++++++
 drivers/accel/amdxdna/amdxdna_gem.h           |  69 ++
 drivers/accel/amdxdna/amdxdna_mailbox.c       | 575 +++++++++++
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
 include/uapi/drm/amdxdna_accel.h              | 461 +++++++++
 36 files changed, 8550 insertions(+)
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

