Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2B099AF25
	for <lists+dri-devel@lfdr.de>; Sat, 12 Oct 2024 01:13:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F5410EB3B;
	Fri, 11 Oct 2024 23:13:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ZSSNJGT/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2066.outbound.protection.outlook.com [40.107.244.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C08D10EB3B
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Oct 2024 23:13:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgKRVvSzRHZ7dD2WLNZDbwiKq82EB6DB/eXFkalm4QfvUN5ETu0MTA8Ne2gGzK4xeaAQweifDgIGWlLenELBcNgu/hZ1GAUh20ncbH3QfH+x0Sp12HaU8dIIbtdwVQ8MyGvQR4e1GjmRnaNn1VlbgWwBfiYbYfskYUNsdJWb2+6bZUgVUsb8lTw7McHB76p+NezLx1Cun7y6awtQCpvK0EK5dsoMyNpIBIv3kSOjAilNsfdJiKkgqNa36kEML+XfiAwCS6PxVrr8gRXXrA+ySH8juiKGLUm/qgxSl9FWvKfTMtYy9xhMELsWPO8Ph6CYZo6I+NKR0oLL6edVyPPgMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1uWLwjqXCbH3oziR8h9ByRPoENuO3dcjtLDSWmcJ0SM=;
 b=HNqfj/g50Tq3Y3LeC1GqybDP5v42kXztPVXMqkbKs5ZRn+ASejp0onkEKkimslKDXXlgnbk+zWXJgFWn6SoFFFEd1F4vPoEpLygfj3xREbfyX7/vhpMsad/Osr55oubeJyLxgYxLeQYT6BrKIUKs/Sm3gRn0y29j0nuFeZBcJoC383lK6fIOPA4M2RJhbvyAS4D2KbBtDX7PSTci0+6oxXZVGfl9qUicVJbLDWpcD3uWPdIG0Cd58B+xe+lM7c6maqs6SM4+h2fTDZ4DCZoETzf8TpTjvTN29NlX3LAlXy5JUNIO9Hvz8Q9TvwM9H2Ausvmc1hyEbGnYKi69KzMc4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1uWLwjqXCbH3oziR8h9ByRPoENuO3dcjtLDSWmcJ0SM=;
 b=ZSSNJGT/M+1Ug2yG5NCKTqsamJl9naseb6mMHrpBvUA5jlon8qZ9tY2IR+U+gAdXjWSvC3mvVmnSbWE7UbPKDyNzq2N9Z2Y4t9CTQR/TJxJ+df0BkGNoarxbXOzdOg3MaHOvMv8QKNsCQXa9ayqSJAI8bUrTlBfKIXQv5dOfcP0=
Received: from MW4PR03CA0185.namprd03.prod.outlook.com (2603:10b6:303:b8::10)
 by SA3PR12MB9197.namprd12.prod.outlook.com (2603:10b6:806:39e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Fri, 11 Oct
 2024 23:12:57 +0000
Received: from CO1PEPF000044FC.namprd21.prod.outlook.com
 (2603:10b6:303:b8:cafe::75) by MW4PR03CA0185.outlook.office365.com
 (2603:10b6:303:b8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.20 via Frontend
 Transport; Fri, 11 Oct 2024 23:12:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044FC.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8093.1 via Frontend Transport; Fri, 11 Oct 2024 23:12:57 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 18:12:56 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Oct
 2024 18:12:55 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 11 Oct 2024 18:12:55 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V4 01/10] accel/amdxdna: Add documentation for AMD NPU
 accelerator driver
Date: Fri, 11 Oct 2024 16:12:35 -0700
Message-ID: <20241011231244.3182625-2-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241011231244.3182625-1-lizhi.hou@amd.com>
References: <20241011231244.3182625-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FC:EE_|SA3PR12MB9197:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d204f38-9aa9-4037-932d-08dcea4a3e7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PB2/qdejIqK89fGgt0P14RwE8e0qFaUz4mZaWYqmjRtJk3IAQvdrgIFGXUyN?=
 =?us-ascii?Q?En82Ec/CfY8PAfgybowo/4SXw+l8IX8CdN/0DYzO1kDBsww7ixlyhmqySYPR?=
 =?us-ascii?Q?HmJUCwTnicEpgn4wdZKuVTTeRok3mbF/ZGyIZ5Lb36aQS1T0c/cYlW9J0KqJ?=
 =?us-ascii?Q?7ZDN5uFkFG+KEmfs9nHZMV/+4X15EgBKMMJ7p9sB9wH93NcFB6wUoYSE4pDV?=
 =?us-ascii?Q?z04e/wkYnLdpx13n56NHiwYjfx6Gglw6vhjF2OlrdefX7brdhuzLobfGP47i?=
 =?us-ascii?Q?UDr8O9VAFt7/ewQSvjUb2wGm/8/kzdi1D/Swc3jxHG2rztn7Dr+6RcE1I9d3?=
 =?us-ascii?Q?6y9TlcSqdE9s/Q8nSVGy4Xnx5rCVOo//t1NCq1dgUl2ze8EKNUiLTUUeI3xN?=
 =?us-ascii?Q?y1q+DnktvpjQTmVDMTk78QxCeDU1nV5U0NY0HBYqxRNB12XVsmI6ZBRhaulu?=
 =?us-ascii?Q?xfbxQdIX0BxX6RA9w3TYbaRC+eAN6aoH2oIFx726Tj4BfXD4SFJ+80Dlj4Wq?=
 =?us-ascii?Q?j9OtOkfIwqnsL7jtfg97jje+PE9iU8G7J450CbR4xMDD/YpN2DjwADeQhoty?=
 =?us-ascii?Q?244+8o6VVgOm1SQjz1n75jfh2lKqrtLTm6kV4DoD3TDNeV9vV7aDWcMKOhmn?=
 =?us-ascii?Q?1fHioJ/a3xVYxBf5vHgGSHWiK27JO+boxTWee71PfdPy03CWsss1Zg3KvDxU?=
 =?us-ascii?Q?gwj3hkv2QCX84iwOsnd9V2muPvRgkYmyhw3SHfmuNktU9Xl9047kr+uUq+Li?=
 =?us-ascii?Q?tJxbHOe+RJ7TWt59A7aha6VHCZwQ5SvlyqfMkBPRMn1jpsjbuul/nDZGKrdS?=
 =?us-ascii?Q?roY6CPTXAIRO64Y0IXkGApiqmZk8jNeM2xNjN918Cm3PqTAo43l2tcAquinI?=
 =?us-ascii?Q?+jX3KpbwPZPW22+4i8hyzglmYCPk9iz67MctnHJvVv4saUcz34zYqy56N3He?=
 =?us-ascii?Q?fiMHuvrxmRM/OdeMnQTj6Y5QSk4ib9yfS+GIiT/SQTCbYbO2w8OQ+9/12fEy?=
 =?us-ascii?Q?9395wF1tQS6qeki6IBC7nvTYkNYDk8V0gc8aFQIlo43B1aQbTjcLDE83GqoH?=
 =?us-ascii?Q?xhgQzOco+KWWXQj9oyw8vBWIHJmvKLr3cXlu1MF6e94bNIaPhROGD4pK8jRn?=
 =?us-ascii?Q?orl+FnVZwyfANfdzHKZXwH5Czqn5sNJMlaVsuosAL5LvttIBiKcFyVzA/+3m?=
 =?us-ascii?Q?nMTSCV5Gr9TSrZ5RQZA5Jio4ECXBBZl5TDX7Afo6ooTaFEICLDKxm8smcGwk?=
 =?us-ascii?Q?CvMRLJzi1sB2I0447EHzKdj5VbqpPIVbUwVUzzIKzX373cu9QT+awm3zWrGX?=
 =?us-ascii?Q?dYhBaUEyZRo8Rt2VEHhk3S6DRtwjtp0IA0oVRxIB9mGkCzSEdVk0enFCPQar?=
 =?us-ascii?Q?32jP/p4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2024 23:12:57.4814 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d204f38-9aa9-4037-932d-08dcea4a3e7b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FC.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9197
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

