Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8E69A6F3B
	for <lists+dri-devel@lfdr.de>; Mon, 21 Oct 2024 18:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A15C710E554;
	Mon, 21 Oct 2024 16:20:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sJ96oABu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2080.outbound.protection.outlook.com [40.107.237.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96EB10E03D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Oct 2024 16:19:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vu2l0WU/sHzFsH9hgot9FGzpCTQAlt3/Q9ZbQvP2XqjO2jyMWw0YckZTcVgyyuYfI3A0udDL58ydKHuiH7CRrsb1NXTePsxlsGcwbX4GPZnNHy2tmhDM7DzdHk7fnGicyYG5dDTf9DlObKUUTur4WAqFg3MDZ5JNcpwv89+lqSZWnh1BlkDgj68uS7aW5CYFWrNdSWYTaF8W4nAkAGqlMfVviDAKr+o8lvPNcthX1h0rO1SsSTdaskrDCCVYbMkWofhmmzH94Ry2VO2nx373uZ06/VXhnjbhFsw0O2y3FIZyQtHRLQRmz8KTVggBNYsQQIkutKEATvzhwTc3KnbZQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RND1E0GCv9DKDEFKbEmSCcWbUb1c71yh3gboxhrTkKQ=;
 b=I6lV5NQYnkKgRikVKecjuA3WX4WMIDhMGIvHvoOtPqzNQpOo8RzuaMxey8XHO/7eJRSYey8qMa5UEkjzFKChBrvF/iy7zkDCGOUQEP8+mAc2G61DpU27Hl7iWMe8Elrrysn1UMMmp8+iek3i/0WxXpSDMAI51HhF6tt0Bla6JsD/yHQIClfWNaAfRWHfH+CYdBk8KUtoIAlCmC3Fsk808r8sIs7HsRGJBq5fTqiOXDS3WbW5aZonwdh3CoFmJACr/20G4bSmLQn9AKE7E6qj0r9VyUhFKgPG3MUYMj3Tg05x5JyyMdoc3GXIYAYMAM2UOgRqe14CzamOMLWkDZndww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RND1E0GCv9DKDEFKbEmSCcWbUb1c71yh3gboxhrTkKQ=;
 b=sJ96oABuLE4zmuI4rIMSsyhNAxtxcsxWJpLFMiRYW4THtf3lRSgEX57lsTds0VMZ/t0NzX69jVZULc9HBMp05SgcEeFIZLKsvOWzZHL6yzapqy47p3gZnDDyXiOfdcPAVySlosONLj7CW0vNmkSD7tr8jPDGB3nG3TVX96DT6kY=
Received: from MW4PR03CA0104.namprd03.prod.outlook.com (2603:10b6:303:b7::19)
 by PH7PR12MB5950.namprd12.prod.outlook.com (2603:10b6:510:1d9::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Mon, 21 Oct
 2024 16:19:54 +0000
Received: from SJ1PEPF00001CE2.namprd05.prod.outlook.com
 (2603:10b6:303:b7:cafe::40) by MW4PR03CA0104.outlook.office365.com
 (2603:10b6:303:b7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26 via Frontend
 Transport; Mon, 21 Oct 2024 16:19:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE2.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.14 via Frontend Transport; Mon, 21 Oct 2024 16:19:54 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 21 Oct
 2024 11:19:48 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 21 Oct 2024 11:19:48 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V5 00/10] AMD XDNA driver
Date: Mon, 21 Oct 2024 09:19:21 -0700
Message-ID: <20241021161931.3701754-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE2:EE_|PH7PR12MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: 59ff6fde-dce5-48fc-885a-08dcf1ec3296
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wMSevMJTMdXeySOrXTdxZy5Soc+Y+B3/RzqTgkXigTBn9ihEvZr5RIEKnzvd?=
 =?us-ascii?Q?xV+RxUt/MjLWCgjFb2W0NH2H+HLfl2Z+c2wjeQewIlo5sChNUw2YVjMQiukq?=
 =?us-ascii?Q?XdmV0tU8hy5k/BX5YEQvwMJaU1GaCsf71LPLt3ToDcqucvYc+qdssjAq5it3?=
 =?us-ascii?Q?WPAJbhnx1KQmL3EyH65nsSmt3us/gDPaziHFNup38aYMKMVB2QcfSk4TmHaO?=
 =?us-ascii?Q?fv7iHk9UAeH4DORrNo1SSbUdTD9A5quJoqno7EJpTdl6UfVM/wknFqWOSE3Y?=
 =?us-ascii?Q?ez8gSYE6XOSYoPGp+6m+uidC8i+qebLBiknVFcUgaQg3titwT1pqZDt8mE08?=
 =?us-ascii?Q?p0b5zY9fC8MKn27EQ74dALS0jw7Kfk9Pfs3FydawlbT+QkmkIRwosx2kHVQS?=
 =?us-ascii?Q?ivQfSgO08hfd7/E1aPYY+K8oYjjUKk/8/zS+3tSi36rLDHGoy3jRuTM5YXsN?=
 =?us-ascii?Q?BxksOOSfpS5N0DL73cmEBzvdLCtMbyzv+KK4chpT8JwjRB1JEAjlwbSo8KeS?=
 =?us-ascii?Q?h9tde71wNYcj5DCUOYRLsYpdMMCUOBjCVFv3KWUB1lTqFkLYXjjOZI42Xp7p?=
 =?us-ascii?Q?XpefF+SWG/Bnv6/qFfR86xXIYnrt7AaVJWHRWICgQdHo4TDgsR0CI3mYB/HI?=
 =?us-ascii?Q?f+TpgVeVMrodAM+qPVdh4W4qCmAODZ5HYJuzN8gIe2Qw1yWkNtlk61aDcFue?=
 =?us-ascii?Q?Br8ZOUfZYaWynBxwKQsXcrW+PAZKnW6UoXAknHux/Wla9ZHunGPH40o+1Qez?=
 =?us-ascii?Q?Tzo1NXMtZuE0T6H9qSiSdeLaWB1dimu17KKK89OdFB+4lWStzQfeJ6X9z5kX?=
 =?us-ascii?Q?gSvfzlG7NqjPV5kYe7hYEuxfoLeyoPx8n/f4nKGdS3+D9wi2HzN1E45Dhl2U?=
 =?us-ascii?Q?s2SvsOqT6XHI4/MdWf43SQ1qM9OtA06Hr27XzLyEnmwHlyVHRaerHJ6TwkZK?=
 =?us-ascii?Q?9d7fkiynYPQRKId9aEMu6akvB2ZtGhtuEoIfPBFpx0ifBuhZNGEBQYivZqKe?=
 =?us-ascii?Q?QnOySJL13xXT8CCG05CHAkig0ondzQh99WpK5aQc808bKsvnNz2QRqU8boyp?=
 =?us-ascii?Q?umolpTfR0iu3MS+uq/2Nw36SL7Lk8Kipg9Dg4n5NjIORybIkfSPXZxPnnxBP?=
 =?us-ascii?Q?b9FYrWKej4on89KKWzua9zgwq613J9afmao45NS8mcjztaR+X0R5xEpz+Bgp?=
 =?us-ascii?Q?TbXVPcOQpn1vIKOiFOSsRn6i++x5fb/bIE0NmNYRAyo4R7HJy4PevJgb+O/J?=
 =?us-ascii?Q?4eHbJsjaFWGkWNqflI7293KeXMEzzKpk5BwJOws3tve+mgGY637zhH/GeEx+?=
 =?us-ascii?Q?5d3eK+d+X5URwM1OU2kk2PAJniMUV1+QBc1VXl14ZC3HAXYZ8pYjhFG4wxMZ?=
 =?us-ascii?Q?NYb9fpo=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 16:19:54.1507 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 59ff6fde-dce5-48fc-885a-08dcf1ec3296
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00001CE2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5950
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
 MAINTAINERS                                   |  10 +
 drivers/accel/Kconfig                         |   1 +
 drivers/accel/Makefile                        |   1 +
 drivers/accel/amdxdna/Kconfig                 |  15 +
 drivers/accel/amdxdna/Makefile                |  21 +
 drivers/accel/amdxdna/TODO                    |   5 +
 drivers/accel/amdxdna/aie2_ctx.c              | 919 ++++++++++++++++++
 drivers/accel/amdxdna/aie2_error.c            | 360 +++++++
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
 drivers/accel/amdxdna/amdxdna_gem.c           | 631 ++++++++++++
 drivers/accel/amdxdna/amdxdna_gem.h           |  66 ++
 drivers/accel/amdxdna/amdxdna_mailbox.c       | 575 +++++++++++
 drivers/accel/amdxdna/amdxdna_mailbox.h       | 124 +++
 .../accel/amdxdna/amdxdna_mailbox_helper.c    |  61 ++
 .../accel/amdxdna/amdxdna_mailbox_helper.h    |  42 +
 drivers/accel/amdxdna/amdxdna_pci_drv.c       | 402 ++++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.h       | 123 +++
 drivers/accel/amdxdna/amdxdna_sysfs.c         |  67 ++
 drivers/accel/amdxdna/npu1_regs.c             | 101 ++
 drivers/accel/amdxdna/npu2_regs.c             | 118 +++
 drivers/accel/amdxdna/npu4_regs.c             | 118 +++
 drivers/accel/amdxdna/npu5_regs.c             | 118 +++
 include/trace/events/amdxdna.h                | 101 ++
 include/uapi/drm/amdxdna_accel.h              | 457 +++++++++
 36 files changed, 8425 insertions(+)
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

