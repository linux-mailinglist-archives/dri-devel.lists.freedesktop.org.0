Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C25BE9B6870
	for <lists+dri-devel@lfdr.de>; Wed, 30 Oct 2024 16:52:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D898610E7CB;
	Wed, 30 Oct 2024 15:52:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="qyNf/7Fp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2055.outbound.protection.outlook.com [40.107.220.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0282910E7CC
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Oct 2024 15:52:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NCH1nqiceQY8BrDTc53gAaLQ/R+uS4cZiJfwKg5Zp3bwmcy2MB3FWUXy1s3dLbpsdFCOnjfMP0osTiRGcijVLX0h/Xs6bjHm3prPuwWncTtcU2hhCHYq5RnVtaQpLEcgORBJtVaiGNFpUUhoRIPeRlp1E3ztoYQB7ftIxgqbZc7Ko+KyaN/VHwroiumwuvx29CulAsfRSRqKUYSD3Qp/aj9LkcAxy7Gt//ezJhDmK7018qQEXRupK8URpb3BQHWcKEpgx0IoVHFGO+ExIhSzRZbGKHlh1IanOChJzbzodbB+6oz6FJ9imNM+SIB/Exs9FsSJpa/VnlDCOJAvKhKhZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PVnTh90STkHLtxh4lH2Oi4lprjo/yzoCa+xelUlrY08=;
 b=F/46roOziTlPH+V8PC7fFdpec7VI5pfn9fhjJpwnqHMAtNJjwmNtpOV+sBSS4XMnn7wzhv3AVIrNUnNjyEEiJg7giZNH8tRID19ashAHxjVsiMkjZvaE5lG+n1Bg5XwMOKqQ53YqQmawtO0JoAKlrhc4hxC2xAfSTbdiwCp3VyVmpQ+l8s4y80kLsCXtHic7AwJ7LNbhppi4TyJQaGOKgD4i13oxsZ+xPq9RdHAUHCRmqrb6HBTNg0iIbliaWL7XYqQcOJpYvyJxMd1Q9I9r7IGKh25m+BARCnkPsoG4HDbBq9z7tDpIBlCBTGRwyoB52brdKYH5RgrLLORzd62K5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PVnTh90STkHLtxh4lH2Oi4lprjo/yzoCa+xelUlrY08=;
 b=qyNf/7FpMdLuywYUYc80c9nohVCVztAx9+PWw+Kx7oMSjkBlTn+iw9c2OycQYN7cZjAAAJV3FT1GBTl2qWCQbaCQJiYkQhM/4N3yPH9WRMiYYay4h0rbauFqMRcWMGEQR6M97LF/40VRVAO9I7q1qnr5pSAQXFXAzEWACAcp6FU=
Received: from MN2PR20CA0031.namprd20.prod.outlook.com (2603:10b6:208:e8::44)
 by CH3PR12MB8186.namprd12.prod.outlook.com (2603:10b6:610:129::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.23; Wed, 30 Oct
 2024 15:52:12 +0000
Received: from BN3PEPF0000B073.namprd04.prod.outlook.com
 (2603:10b6:208:e8:cafe::2b) by MN2PR20CA0031.outlook.office365.com
 (2603:10b6:208:e8::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20 via Frontend
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
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 30 Oct
 2024 10:52:05 -0500
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 30 Oct 2024 10:52:05 -0500
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V6 01/10] accel/amdxdna: Add documentation for AMD NPU
 accelerator driver
Date: Wed, 30 Oct 2024 08:51:38 -0700
Message-ID: <20241030155147.103908-2-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241030155147.103908-1-lizhi.hou@amd.com>
References: <20241030155147.103908-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B073:EE_|CH3PR12MB8186:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dc94b80-b496-4fb7-3ed2-08dcf8fad167
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+ViqoDqbHAqU/poqCAL0JlzeSHn/J0cO04cLl6p8tH3sLR0hoajponb6gvkm?=
 =?us-ascii?Q?cExveXuGxojhOIxATPqGSja0kzyvCDNtaSbloZ1sXSSWGRCwoIKq8OFAU4XW?=
 =?us-ascii?Q?w/4nUFTXZJsIlzw9UE8S/fGwl7CeRuJo7wnsKbP/9oRfhLnShInvlPk6/2jm?=
 =?us-ascii?Q?vy+fW38wuwWPXIPHwjDGNK9sXbSUVb8ywVvgZvYZVx2Z6m+GrOfM8hNAHryC?=
 =?us-ascii?Q?Ev6si9hAc2PvqccPSrxrTVgwQWw2GSy4sWic9uGfvxkn4RznxE2yFpMTlq5t?=
 =?us-ascii?Q?kDRB0LRr/zH2Ijk5gYVGLLkR5S0BiYrqZnt7gz0x7BmnnENYj6rUMdAG78qy?=
 =?us-ascii?Q?HXTlvqh9cWNDJ/+umqq71yJkoRuqLWpuLpT2dfswsfcIJNL7Q3EAPAet4HdR?=
 =?us-ascii?Q?+mwdaxsUbcA9k5wM1DXYnlQYFWEjDrSbmyJ7CtoVJcy9eoyLRj/SzjD0Vtqn?=
 =?us-ascii?Q?kBYOSHATbBJWO+xqPab68Wz5Ss6xapakRGtQM1+F0cRRdK1ZPL4iE2evHu38?=
 =?us-ascii?Q?vYATtWnJUWXIgJhEHPI93OE412F+DT5nn8gIiabYlO2OnadSfddWtCGbo3kG?=
 =?us-ascii?Q?5EAF+zpy5Xu/Guq/Eg6zcsOpuHu7zqul8xKRYM3LeujzyGXfyj6xSQP0i/am?=
 =?us-ascii?Q?WKZ4j2sO3R41XVT+RxlGRQOoTvADj1SQZZ6MZkajtmDZDaIK8FNWVi/XrPVA?=
 =?us-ascii?Q?RrX/dXT9vH9+aKI+zntQiLeZo3jUFnDHjIFIRLIl2/BI+6vldv4AxV3+yTE4?=
 =?us-ascii?Q?Lreac4lH6SaWdXU4Nhai5MDw3heg7K/SzAZZpCdYn/LqCnuljbH2kp7qFsP1?=
 =?us-ascii?Q?oZRY9OuHWXrPOKkOTJw6X72VksfEKGIyzgZnx2VX5fX2Y/n5awkl/CK7IHsm?=
 =?us-ascii?Q?wx/kFttISS60sDsvZYHrMK1WFCom8swMU+dQEV64QrHo5+fcV2/weu8FuuzU?=
 =?us-ascii?Q?17OQKJSjCotWlD8e9FLacCSSpM8gtQ5lIABiFSOM9YA7Wm7pN/hpnKWFf61e?=
 =?us-ascii?Q?vH83dVfKs/Zmtc4lUNR2pLB5x0DzmtQjlz8Rr/bshXNBEa2msaYXox2F0dmr?=
 =?us-ascii?Q?QyqihW7CLaE/n4kBijGb7JsxpglpXT31RJFeU7w4IU2qgWnjf9WglDKOrmb7?=
 =?us-ascii?Q?IK50X1b944G+/6sFLLuWDsWJmRVWZnArOxibGcq+kCcdlrVCIkb+i8YNKA8k?=
 =?us-ascii?Q?hWO7KumoFtBFr3IaFn5zuYNFMZTPOuR8yX0zXaHyl+saRcATJIGHRi9RF2Hq?=
 =?us-ascii?Q?Zv7I/V1nRv3jZfz9jOyZ7jjry8gi1OKsGqpPHSZJ0hT3To4a0jstgkqteSCN?=
 =?us-ascii?Q?xtmVDv+DeXLydZtLbi0wp4gAO9Ux7JSRXsQDLB3k37IcOpORBz9ZotupjBZA?=
 =?us-ascii?Q?t3tKmfk=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 15:52:11.7703 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc94b80-b496-4fb7-3ed2-08dcf8fad167
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B073.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8186
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

