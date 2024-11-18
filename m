Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C309D171C
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 18:30:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A9A10E534;
	Mon, 18 Nov 2024 17:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TtmhvM/B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1037110E270
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 17:30:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bhf5aiavybDYFbD+Z7FUsgpBAtplzm6MpUjCzSNMQTjbjtQEAiQLxx94bdAV/7giqL89rJ/oycxrM/zFcV5AtnInQj3Xq5JCIhECkNPDmMEGjKHocRx33x9MYf+WFLs0uV5KoAQmKKMtc16fFRYYM5Nd+Nz8YmYSdVC0QfggRtOLbuj1KZGW+wNTyGHdZMFfpjKVQZhqbl0WbucUDToiGAx7DvTGnKZ7kwmCQQpdeyd/VPBfIyYjflSRkLJ/w+7Jd+mDNJDNUmxMtVgIMdsKNfK9XkaaD7MdSGMb+yyhscQ7h5wIv2WQK0S+FGnhAxHF20DFOiaQTjpSowqga0x9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVnTh90STkHLtxh4lH2Oi4lprjo/yzoCa+xelUlrY08=;
 b=vZMsMxbbwJuGg04OvK+5MWgUE7MSlDmGQ3lT/5sNZ/4pfblYgIrCl3F8WMzPSgZJqz/i6bBbjrZqIzoA8V4XY/NLM2raFSSBGn1qEbrvardkj5Uu3JCpDtCtL1lEUfSferGNyf2MoborwzMrRfvz5j42pmE6pxgod4UoVr4xHf32be/ArILmxdLnhdzq0IbOQqtnuh+9OOjNGdyv2ON/LKzaEI2l0kZ2Sjw/ccWEeUIxzx10+JL6dKIkHXny48ZLJhH6kGNB02fbgrOT9LVRDtB+mMlLAyyp8ndLvLrLzoJItx0MtxuYahFoPhiVwKK3pvV6uS3FHjIJreNQl/8dHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVnTh90STkHLtxh4lH2Oi4lprjo/yzoCa+xelUlrY08=;
 b=TtmhvM/BlAf6xrNAOUtvrm7m5W+y+vdJAgk9lDioMBTJCQvwCyS4r+fYga3jm2jQZWBWVOdQl4lCH3zj226zVMVwdwbNmr+mejVU4EX4jRngibY33pJmGawXu+xoT9yHItaSTo7nPrS7Dda/pE3dAJQbk7G8lxxEM+gvVcgf9o8=
Received: from DS7P222CA0028.NAMP222.PROD.OUTLOOK.COM (2603:10b6:8:2e::21) by
 BY5PR12MB4178.namprd12.prod.outlook.com (2603:10b6:a03:20e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8158.23; Mon, 18 Nov 2024 17:29:57 +0000
Received: from DS1PEPF0001709C.namprd05.prod.outlook.com
 (2603:10b6:8:2e:cafe::2b) by DS7P222CA0028.outlook.office365.com
 (2603:10b6:8:2e::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend
 Transport; Mon, 18 Nov 2024 17:29:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.12) by
 DS1PEPF0001709C.mail.protection.outlook.com (10.167.18.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 18 Nov 2024 17:29:56 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 18 Nov
 2024 11:29:53 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 18 Nov 2024 11:29:53 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V11 01/10] accel/amdxdna: Add documentation for AMD NPU
 accelerator driver
Date: Mon, 18 Nov 2024 09:29:33 -0800
Message-ID: <20241118172942.2014541-2-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241118172942.2014541-1-lizhi.hou@amd.com>
References: <20241118172942.2014541-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709C:EE_|BY5PR12MB4178:EE_
X-MS-Office365-Filtering-Correlation-Id: bc4cc378-69bc-4dfa-97ce-08dd07f69ef4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FvXP0//NYvD1XOGq9XoaKS6aPOn73yB7fndCJhjGb2SbwpeSE2LjDwFQ+7FI?=
 =?us-ascii?Q?BJy+t/iTNCKzEP6d48y4ubERhOZBQCXdS7IHdjs7DMgMwoOPval5ii3oGL+o?=
 =?us-ascii?Q?GljLyoyZoFR3aGkjmT3SI6afGloVQszP6XaVhyV+nQ+1wVjxqrIb9P3Tpn+i?=
 =?us-ascii?Q?3hfaURyhCyZsIXS5dHEFfZFY+VmaKXgjczj/ug2ImaUBbiEO01m8gSCIGQag?=
 =?us-ascii?Q?wRMeL78Uf+ciHV55QFuucI94huMHsd4Iz3v4U5yN8ahwDvi6M8NT+F4fifJ+?=
 =?us-ascii?Q?zM3gm5lMVK4WWPz3yXadWF6BGsFKIz8YmWMZfxNuY0qze/kJ5dJRdjpXJeRQ?=
 =?us-ascii?Q?qY6tI+vgkq6cT2IgYw7CBf33ieZbiHdBTzDAngq2B5W6wdtIz534usLUrzMJ?=
 =?us-ascii?Q?D2wrbD8VsbrcchpnvGJCq+2CTqhVCS+J/+VwVMu05Xf617mHnamm8F5z6G+X?=
 =?us-ascii?Q?TOxM2ovKW76+IO2Z7TBJmtewQhmkxWe9l+6A83NRyoXLCQH/+KaCRYHZ5+Kj?=
 =?us-ascii?Q?yCknsF5XFcFP5jbWeVoEdXC3NUXRmX38QpXQmwlfVnDWGOHm15b7wq1QMqbM?=
 =?us-ascii?Q?da7TWBNzKG2EzlIamthAEblxDT7VkEOVtRpxqQHu0GPcNJSFa27aUNtiTfot?=
 =?us-ascii?Q?KBj2KcPUDHPrRDfx9pqxF71TEpeBG3fXR5ZU7pH4WLjNd1TsGphJykA1SW+E?=
 =?us-ascii?Q?FmeTUV5DU90318QB6wh9Lss+1gTmDtmYlzH5p7HSqJnD2a6pGDRsK0VqST+z?=
 =?us-ascii?Q?j/BecddvAfhyks8LsCwZLqw29+SVI06J9PC1v9EWVIaaH2oP6i4L4cB1Un98?=
 =?us-ascii?Q?IXEqmYdlq6YKM0jhNMDmXFGMNIAoVKI6yE1nWaTsiqEV9ntmdjm0qZGazevF?=
 =?us-ascii?Q?MIY82EWLxigwLJc3hYET+subFyzuaC9CH3yp6ifY/mWDrmTM3h8LjwfTi4Kl?=
 =?us-ascii?Q?dgnDwEe99Tkq0qSk7JPsnO87TeBZ0xzpjbVZwLBi9zeLgNkSjsErrR1WmLVT?=
 =?us-ascii?Q?jUf5a39w1+p++xJ6+lhoGq1omuhvMkMinuZ62UI45J+lU8lbzzHvPJ1KZUx3?=
 =?us-ascii?Q?iCG/j8nzDkVkgS8eCCPxLGP0iR4NbQNhFyuZ83glfLXNg68uCKDiKCLCsNFK?=
 =?us-ascii?Q?nRyorvEbFUKsrx0J0TEUf5gZ+NQws6s+bctqOKKwdgc7cbbw8F5J9hol8ryc?=
 =?us-ascii?Q?m78yNsjv7SgxHdcgF1ZZYV/fxxCCeREifwY9BgHpfFRQp0SWK2lrIZSD8FAW?=
 =?us-ascii?Q?sLOJLXVnNfoIibDA0dOPUV46gY3OjjtnhzOIvrWanUOazwkhTNeFyaT1SKvX?=
 =?us-ascii?Q?TKCZb8a5r3/9uJCSwbnUYOIbHWx2HGn4wwuwPkOj779pUevUKILkGtCFNCud?=
 =?us-ascii?Q?lteCs+g=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.12; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:atlvpn-bp.amd.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2024 17:29:56.5563 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4cc378-69bc-4dfa-97ce-08dd07f69ef4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.12];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709C.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4178
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

AMD NPU (Neural Processing Unit) is a multi-user AI inference accelerator
integrated into AMD client APU. NPU enables efficient execution of Machine
Learning applications like CNN, LLM, etc. NPU is based on AMD XDNA
Architecture. NPU is managed by amdxdna driver.

Co-developed-by: Sonal Santan <sonal.santan@amd.com>
Signed-off-by: Sonal Santan <sonal.santan@amd.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 Documentation/accel/amdxdna/amdnpu.rst | 281 +++++++++++++++++++++++++
 Documentation/accel/amdxdna/index.rst  |  11 +
 Documentation/accel/index.rst          |   1 +
 3 files changed, 293 insertions(+)
 create mode 100644 Documentation/accel/amdxdna/amdnpu.rst
 create mode 100644 Documentation/accel/amdxdna/index.rst

diff --git a/Documentation/accel/amdxdna/amdnpu.rst b/Documentation/accel/amdxdna/amdnpu.rst
new file mode 100644
index 000000000000..fbe0a7585345
--- /dev/null
+++ b/Documentation/accel/amdxdna/amdnpu.rst
@@ -0,0 +1,281 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+.. include:: <isonum.txt>
+
+=========
+ AMD NPU
+=========
+
+:Copyright: |copy| 2024 Advanced Micro Devices, Inc.
+:Author: Sonal Santan <sonal.santan@amd.com>
+
+Overview
+========
+
+AMD NPU (Neural Processing Unit) is a multi-user AI inference accelerator
+integrated into AMD client APU. NPU enables efficient execution of Machine
+Learning applications like CNN, LLM, etc. NPU is based on
+`AMD XDNA Architecture`_. NPU is managed by **amdxdna** driver.
+
+
+Hardware Description
+====================
+
+AMD NPU consists of the following hardware components:
+
+AMD XDNA Array
+--------------
+
+AMD XDNA Array comprises of 2D array of compute and memory tiles built with
+`AMD AI Engine Technology`_. Each column has 4 rows of compute tiles and 1
+row of memory tile. Each compute tile contains a VLIW processor with its own
+dedicated program and data memory. The memory tile acts as L2 memory. The 2D
+array can be partitioned at a column boundary creating a spatially isolated
+partition which can be bound to a workload context.
+
+Each column also has dedicated DMA engines to move data between host DDR and
+memory tile.
+
+AMD Phoenix and AMD Hawk Point client NPU have a 4x5 topology, i.e., 4 rows of
+compute tiles arranged into 5 columns. AMD Strix Point client APU have 4x8
+topology, i.e., 4 rows of compute tiles arranged into 8 columns.
+
+Shared L2 Memory
+----------------
+
+The single row of memory tiles create a pool of software managed on chip L2
+memory. DMA engines are used to move data between host DDR and memory tiles.
+AMD Phoenix and AMD Hawk Point NPUs have a total of 2560 KB of L2 memory.
+AMD Strix Point NPU has a total of 4096 KB of L2 memory.
+
+Microcontroller
+---------------
+
+A microcontroller runs NPU Firmware which is responsible for command processing,
+XDNA Array partition setup, XDNA Array configuration, workload context
+management and workload orchestration.
+
+NPU Firmware uses a dedicated instance of an isolated non-privileged context
+called ERT to service each workload context. ERT is also used to execute user
+provided ``ctrlcode`` associated with the workload context.
+
+NPU Firmware uses a single isolated privileged context called MERT to service
+management commands from the amdxdna driver.
+
+Mailboxes
+---------
+
+The microcontroller and amdxdna driver use a privileged channel for management
+tasks like setting up of contexts, telemetry, query, error handling, setting up
+user channel, etc. As mentioned before, privileged channel requests are
+serviced by MERT. The privileged channel is bound to a single mailbox.
+
+The microcontroller and amdxdna driver use a dedicated user channel per
+workload context. The user channel is primarily used for submitting work to
+the NPU. As mentioned before, a user channel requests are serviced by an
+instance of ERT. Each user channel is bound to its own dedicated mailbox.
+
+PCIe EP
+-------
+
+NPU is visible to the x86 host CPU as a PCIe device with multiple BARs and some
+MSI-X interrupt vectors. NPU uses a dedicated high bandwidth SoC level fabric
+for reading or writing into host memory. Each instance of ERT gets its own
+dedicated MSI-X interrupt. MERT gets a single instance of MSI-X interrupt.
+
+The number of PCIe BARs varies depending on the specific device. Based on their
+functions, PCIe BARs can generally be categorized into the following types.
+
+* PSP BAR: Expose the AMD PSP (Platform Security Processor) function
+* SMU BAR: Expose the AMD SMU (System Management Unit) function
+* SRAM BAR: Expose ring buffers for the mailbox
+* Mailbox BAR: Expose the mailbox control registers (head, tail and ISR
+  registers etc.)
+* Public Register BAR: Expose public registers
+
+On specific devices, the above-mentioned BAR type might be combined into a
+single physical PCIe BAR. Or a module might require two physical PCIe BARs to
+be fully functional. For example,
+
+* On AMD Phoenix device, PSP, SMU, Public Register BARs are on PCIe BAR index 0.
+* On AMD Strix Point device, Mailbox and Public Register BARs are on PCIe BAR
+  index 0. The PSP has some registers in PCIe BAR index 0 (Public Register BAR)
+  and PCIe BAR index 4 (PSP BAR).
+
+Process Isolation Hardware
+--------------------------
+
+As explained before, XDNA Array can be dynamically divided into isolated
+spatial partitions, each of which may have one or more columns. The spatial
+partition is setup by programming the column isolation registers by the
+microcontroller. Each spatial partition is associated with a PASID which is
+also programmed by the microcontroller. Hence multiple spatial partitions in
+the NPU can make concurrent host access protected by PASID.
+
+The NPU FW itself uses microcontroller MMU enforced isolated contexts for
+servicing user and privileged channel requests.
+
+
+Mixed Spatial and Temporal Scheduling
+=====================================
+
+AMD XDNA architecture supports mixed spatial and temporal (time sharing)
+scheduling of 2D array. This means that spatial partitions may be setup and
+torn down dynamically to accommodate various workloads. A *spatial* partition
+may be *exclusively* bound to one workload context while another partition may
+be *temporarily* bound to more than one workload contexts. The microcontroller
+updates the PASID for a temporarily shared partition to match the context that
+has been bound to the partition at any moment.
+
+Resource Solver
+---------------
+
+The Resource Solver component of the amdxdna driver manages the allocation
+of 2D array among various workloads. Every workload describes the number
+of columns required to run the NPU binary in its metadata. The Resource Solver
+component uses hints passed by the workload and its own heuristics to
+decide 2D array (re)partition strategy and mapping of workloads for spatial and
+temporal sharing of columns. The FW enforces the context-to-column(s) resource
+binding decisions made by the Resource Solver.
+
+AMD Phoenix and AMD Hawk Point client NPU can support 6 concurrent workload
+contexts. AMD Strix Point can support 16 concurrent workload contexts.
+
+
+Application Binaries
+====================
+
+A NPU application workload is comprised of two separate binaries which are
+generated by the NPU compiler.
+
+1. AMD XDNA Array overlay, which is used to configure a NPU spatial partition.
+   The overlay contains instructions for setting up the stream switch
+   configuration and ELF for the compute tiles. The overlay is loaded on the
+   spatial partition bound to the workload by the associated ERT instance.
+   Refer to the
+   `Versal Adaptive SoC AIE-ML Architecture Manual (AM020)`_ for more details.
+
+2. ``ctrlcode``, used for orchestrating the overlay loaded on the spatial
+   partition. ``ctrlcode`` is executed by the ERT running in protected mode on
+   the microcontroller in the context of the workload. ``ctrlcode`` is made up
+   of a sequence of opcodes named ``XAie_TxnOpcode``. Refer to the
+   `AI Engine Run Time`_ for more details.
+
+
+Special Host Buffers
+====================
+
+Per-context Instruction Buffer
+------------------------------
+
+Every workload context uses a host resident 64 MB buffer which is memory
+mapped into the ERT instance created to service the workload. The ``ctrlcode``
+used by the workload is copied into this special memory. This buffer is
+protected by PASID like all other input/output buffers used by that workload.
+Instruction buffer is also mapped into the user space of the workload.
+
+Global Privileged Buffer
+------------------------
+
+In addition, the driver also allocates a single buffer for maintenance tasks
+like recording errors from MERT. This global buffer uses the global IOMMU
+domain and is only accessible by MERT.
+
+
+High-level Use Flow
+===================
+
+Here are the steps to run a workload on AMD NPU:
+
+1.  Compile the workload into an overlay and a ``ctrlcode`` binary.
+2.  Userspace opens a context in the driver and provides the overlay.
+3.  The driver checks with the Resource Solver for provisioning a set of columns
+    for the workload.
+4.  The driver then asks MERT to create a context on the device with the desired
+    columns.
+5.  MERT then creates an instance of ERT. MERT also maps the Instruction Buffer
+    into ERT memory.
+6.  The userspace then copies the ``ctrlcode`` to the Instruction Buffer.
+7.  Userspace then creates a command buffer with pointers to input, output, and
+    instruction buffer; it then submits command buffer with the driver and goes
+    to sleep waiting for completion.
+8.  The driver sends the command over the Mailbox to ERT.
+9.  ERT *executes* the ``ctrlcode`` in the instruction buffer.
+10. Execution of the ``ctrlcode`` kicks off DMAs to and from the host DDR while
+    AMD XDNA Array is running.
+11. When ERT reaches end of ``ctrlcode``, it raises an MSI-X to send completion
+    signal to the driver which then wakes up the waiting workload.
+
+
+Boot Flow
+=========
+
+amdxdna driver uses PSP to securely load signed NPU FW and kick off the boot
+of the NPU microcontroller. amdxdna driver then waits for the alive signal in
+a special location on BAR 0. The NPU is switched off during SoC suspend and
+turned on after resume where the NPU FW is reloaded, and the handshake is
+performed again.
+
+
+Userspace components
+====================
+
+Compiler
+--------
+
+Peano is an LLVM based open-source compiler for AMD XDNA Array compute tile
+available at:
+https://github.com/Xilinx/llvm-aie
+
+The open-source IREE compiler supports graph compilation of ML models for AMD
+NPU and uses Peano underneath. It is available at:
+https://github.com/nod-ai/iree-amd-aie
+
+Usermode Driver (UMD)
+---------------------
+
+The open-source XRT runtime stack interfaces with amdxdna kernel driver. XRT
+can be found at:
+https://github.com/Xilinx/XRT
+
+The open-source XRT shim for NPU is can be found at:
+https://github.com/amd/xdna-driver
+
+
+DMA Operation
+=============
+
+DMA operation instructions are encoded in the ``ctrlcode`` as
+``XAIE_IO_BLOCKWRITE`` opcode. When ERT executes ``XAIE_IO_BLOCKWRITE``, DMA
+operations between host DDR and L2 memory are effected.
+
+
+Error Handling
+==============
+
+When MERT detects an error in AMD XDNA Array, it pauses execution for that
+workload context and sends an asynchronous message to the driver over the
+privileged channel. The driver then sends a buffer pointer to MERT to capture
+the register states for the partition bound to faulting workload context. The
+driver then decodes the error by reading the contents of the buffer pointer.
+
+
+Telemetry
+=========
+
+MERT can report various kinds of telemetry information like the following:
+
+* L1 interrupt counter
+* DMA counter
+* Deep Sleep counter
+* etc.
+
+
+References
+==========
+
+- `AMD XDNA Architecture <https://www.amd.com/en/technologies/xdna.html>`_
+- `AMD AI Engine Technology <https://www.xilinx.com/products/technology/ai-engine.html>`_
+- `Peano <https://github.com/Xilinx/llvm-aie>`_
+- `Versal Adaptive SoC AIE-ML Architecture Manual (AM020) <https://docs.amd.com/r/en-US/am020-versal-aie-ml>`_
+- `AI Engine Run Time <https://github.com/Xilinx/aie-rt/tree/release/main_aig>`_
diff --git a/Documentation/accel/amdxdna/index.rst b/Documentation/accel/amdxdna/index.rst
new file mode 100644
index 000000000000..38c16939f1fc
--- /dev/null
+++ b/Documentation/accel/amdxdna/index.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+=====================================
+ accel/amdxdna NPU driver
+=====================================
+
+The accel/amdxdna driver supports the AMD NPU (Neural Processing Unit).
+
+.. toctree::
+
+   amdnpu
diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
index e94a0160b6a0..bc85f26533d8 100644
--- a/Documentation/accel/index.rst
+++ b/Documentation/accel/index.rst
@@ -8,6 +8,7 @@ Compute Accelerators
    :maxdepth: 1
 
    introduction
+   amdxdna/index
    qaic/index
 
 .. only::  subproject and html
-- 
2.34.1

