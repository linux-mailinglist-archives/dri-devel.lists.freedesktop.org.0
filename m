Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D2CC4A4C0
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:16:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E39910E4A6;
	Tue, 11 Nov 2025 01:16:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2nLYwIrB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013010.outbound.protection.outlook.com
 [40.93.196.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC00110E4A6
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 01:16:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WqpPQtW+lLlsEgJLYc3rMOxhDtzmVBLVdK5E3EfNHga5P9TViqbOy8KZyd+bEu0X/zG3U3orpSs/uzDnRevZq4AD4LJV39XK7h2rQfYHBTorl5TakFltiWK77jw6Tuw9mF6NAcvl8wgEzGdGoURSvcvC9+KcvqVMsThAvgcMM58pDrusxkwnGEAS10ovesw91FIXE2KBvZbSbX+8ybA72TPIZTPLosMwPw9n7BsNiz8QmbIHBV0If8qh5PQIwpMBgJSHGnz/lCu8MFgUNrG1Y2e7G0U/8o82j6Z+47b3A4pq+4bwoI6Ah38cnRzD1xQrjIK74EzrXoHvRp15FsP90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W5pBVF6lgO4w7ZtwBsoT/FdwB/PRFFDFqwtz455QQ+o=;
 b=Tu61W6AAxBPAQezrrUK8+EyriihtSvRQjTfzL0tLsp3jFJoIAKx8q9PRK9c82xAmyl7sWDyXkIDs7CW/4BiQYVUvdGMUwkA2DoicVpmSeykG9N9BAsf6Zk0yFTi9+wrJo6V6MaMddqnJCwXjrh3PuOQ3FlYQUApOh+3S9i1tv1vqYXSTL/jeVi9uyTO1/+q/63DLfpgunt9lrpYV2NlWKmw3a+pUCyn8u4dNJdZIZGaJUvmH/mb2AzRiny84oprrkRnRyNTq8okZlz7SdhWsp0RuCaYe0PZWmleiPXMMf8gT0U8A8SEAjhBmKnnEWFDZY5Su42HYb3gRTD3Bs/96rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W5pBVF6lgO4w7ZtwBsoT/FdwB/PRFFDFqwtz455QQ+o=;
 b=2nLYwIrB9KXoPeZPJyzm85Umzru5kX7lbGMzb1D8sUi1FqJieZHdKW7gyApEdk0pw7N2tDMnMd5+BOnALQTjpxwBpW8680cPTHj6sAWrz8kJ6KpweMZB50WX7QAIPcNumvu19O9qe/Yqzyoqls3zkS1xZr+eVmO3gvPZht4r6Tc=
Received: from BYAPR08CA0004.namprd08.prod.outlook.com (2603:10b6:a03:100::17)
 by PH8PR12MB7446.namprd12.prod.outlook.com (2603:10b6:510:216::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.13; Tue, 11 Nov
 2025 01:16:02 +0000
Received: from CO1PEPF000044F3.namprd05.prod.outlook.com
 (2603:10b6:a03:100:cafe::27) by BYAPR08CA0004.outlook.office365.com
 (2603:10b6:a03:100::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 01:16:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000044F3.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 01:16:01 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 10 Nov
 2025 17:15:58 -0800
Received: from xsjdavidzha51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via
 Frontend Transport; Mon, 10 Nov 2025 17:15:58 -0800
From: David Zhang <yidong.zhang@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: David Zhang <yidong.zhang@amd.com>, <linux-kernel@vger.kernel.org>,
 <sonal.santan@amd.com>, <mario.limonciello@amd.com>, <lizhi.hou@amd.com>
Subject: [PATCH V1 1/5] accel/amd_vpci: Add documentation for AMD Versal PCI
 accelerator management
Date: Mon, 10 Nov 2025 17:15:46 -0800
Message-ID: <20251111011550.439157-2-yidong.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111011550.439157-1-yidong.zhang@amd.com>
References: <20251111011550.439157-1-yidong.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F3:EE_|PH8PR12MB7446:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af536d6-61bc-4cad-a42d-08de20bfe0f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3WDnSQVtZQWAmwjjfeQ2UAfOkqIUZD6NUDj4AX2BtkkFH4GZluF6RSB5EWX7?=
 =?us-ascii?Q?Gfqhk/gK7wdVLDaUx/WIXZVbY4SkEMUgqZ77V7hxA0dasMAY66KbUJvBsrXT?=
 =?us-ascii?Q?MlHCLegBPpDjdlOb4HdONDN7/g3pqS42wQo9P2Ucq2LnycyvMMcrhSZWEHsh?=
 =?us-ascii?Q?WTLCKNS+3nRrOa5+00ZUOYXLDEy6k4Mgw4K+aXTTn7CZ7qtJTUYjM/kNFB0I?=
 =?us-ascii?Q?/3kAcTQQv08k88yUtQGN+DnGmejHe5RK++i0UQhGcAG3CpXhp+eRnXUWo7nV?=
 =?us-ascii?Q?e5zVa3ji4PO7LYp9oShWOpk2aTiUWPK+lOf8vql6y5If1bNelFy8gmhefSIt?=
 =?us-ascii?Q?+iJcd48L8rY2F41AOG5akrENaTGFM09j9/e5rsomyFkWUMzdxS9qZk0FA+xy?=
 =?us-ascii?Q?C1DdfLQbtFbNocYFIrbHxES6thpJ+j4pSP6U/vxWLJTD1pRIwcqdS72zpKYe?=
 =?us-ascii?Q?OX+jorS6jxeMb/Iv+O4d8QaK2HMsTt4AgUE8tyjylXktGJQSRQIYVZPiB6jz?=
 =?us-ascii?Q?fjaN8qD0AY/7DjacY9fI4V2yAFw1GtlFXYYmTDFhaJPyq9pjXc2ae9PK3T0J?=
 =?us-ascii?Q?0rBi6kNcwwPy1ov8joxU+v/bzwlVe9P6hj0MQvLFW/Ka8gsyIxk6xwZn9Z4I?=
 =?us-ascii?Q?g1GgrhLdw2aHPfp0ujdF09msOZ22G4iBrzvVNaHYAWtuuL9Q5SVNFik2O8Nf?=
 =?us-ascii?Q?1EYCSGLUXCrrFkJY9qhbo8Xgy4ajGyGSLn5ICWxxFxTEhw6bk108lpbJ8jLJ?=
 =?us-ascii?Q?81grR7sGE1fK2p77Ac75bRQ6n8yZOzlXGIfCqDI78LYuZ+AYHr1mOwNJI4rS?=
 =?us-ascii?Q?DXBaAiFyJDg5Te6K1ln8FNxly12es//whokcPvHWjTlzeijdHDYYpSNjh5JD?=
 =?us-ascii?Q?3FQpdwDqpN1i9eN0h5QFco15yBelWVl4WJPjb1mb4xCROXkvkvx0xskOxglg?=
 =?us-ascii?Q?LEdo/gPdBrquhbBCFUVwwiiCY6/ZBo/uZ12v6G1JcHcxj3RggmsHXC8oK5Yx?=
 =?us-ascii?Q?Eu9RveoxRWu7xZSyh/SyfUEM781gI/QuX8QDGM2fxV/lKqGtvawFUo2PjiSC?=
 =?us-ascii?Q?Y7o3N+P7+en5djm5dGe8WqWkcV1SYSWIx1EVv1Nb86BjvQzsaUhZSlF9jlif?=
 =?us-ascii?Q?/rYEmo54fgyjpHlV1amKvg71Ncq+Lz9ftTLX2xih5nx74P3Ivi4PVSI9hvO1?=
 =?us-ascii?Q?CVZkEiQxB2N0ZZrVI56yCX5vEU81KsNvUavx+TWPNAi5dKKqrSQjqqLfdls2?=
 =?us-ascii?Q?DKkRSsg8r8tSGhZVXmZPaR1JURiihRbpk5tVj2AK99WCO0bwLyfw4VnRGlNO?=
 =?us-ascii?Q?DRtKYzIFigF2rLh66lAjJ/trtkwejuNy+ukA/RVyuZjpiBHMxLUFbhrBjZ+i?=
 =?us-ascii?Q?4L28g5lPX7Wn3g74ZgVynEWMZJGYcbcC5yMLJSkmOou6qQmRmfKxF7Z2wMpL?=
 =?us-ascii?Q?ULY7j3MLRWx36SDR0rSDWTe3gAXh4ThbadABsQoeziZXrlYkEbCzm2p8DIS9?=
 =?us-ascii?Q?lZhzagJQETAOVBdo4bBqcHcVyHVHTHYuI5HZ?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:16:01.6819 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af536d6-61bc-4cad-a42d-08de20bfe0f4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7446
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

This patch introduces documentation for the AMD Versal PCI accelerator
management driver. The driver runs on the host and manages the AMD Versal
AI Edge SoC on the AMD Embedded+ platform. It handles management-plane
operations including firmware image loading, reset, and health monitoring.
This documentation also describes the firmware interface (VMR) and overall
platform architecture.

Co-developed-by: Sonal Santan <sonal.santan@amd.com>
Signed-off-by: Sonal Santan <sonal.santan@amd.com>
Signed-off-by: David Zhang <yidong.zhang@amd.com>
---
 Documentation/accel/amd_vpci/amd_vpci.rst | 122 ++++++++++++++++++++++
 Documentation/accel/amd_vpci/index.rst    |  11 ++
 Documentation/accel/index.rst             |   1 +
 3 files changed, 134 insertions(+)
 create mode 100644 Documentation/accel/amd_vpci/amd_vpci.rst
 create mode 100644 Documentation/accel/amd_vpci/index.rst

diff --git a/Documentation/accel/amd_vpci/amd_vpci.rst b/Documentation/accel/amd_vpci/amd_vpci.rst
new file mode 100644
index 000000000000..9159b89fa0b5
--- /dev/null
+++ b/Documentation/accel/amd_vpci/amd_vpci.rst
@@ -0,0 +1,122 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+.. include:: <isonum.txt>
+
+===============
+ AMD Versal PCI
+===============
+
+:Copyright: |copy| 2025 Advanced Micro Devices, Inc.
+:Authors: - Sonal Santan <sonal.santan@amd.com>
+	  - Yidong (David) Zhang <yidong.zhang@amd.com>
+
+Overview
+========
+
+The AMD Embedded+ platform integrates AMD Ryzen Embedded processors with
+AMD Versal AI Edge adaptive System-on-Chip (SoC) on a single PCB. The AMD
+Ryzen Embedded processor is connected to the Versal AI Edge adaptive SoC
+via PCIe enabling a tightly coupled heterogeneous compute platform. AMD
+Embedded+ platform is commonly used for sensor fusion, AI inferencing,
+industrial networking, control, and visualization.
+
+AMD Versal PCI driver, versal-pci, is a host-side PCIe driver for AMD
+Embedded+ platform running on AMD Ryzen Embedded processor. The versal-pci
+driver is responsible for the **management-plane** operations for the AMD
+Versal AI Edge adaptive SoC, including:
+
+* Loading accelerator firmware images
+* Reset and recovery
+* Health monitoring
+
+Please note that the versal-pci driver does *not* participate in workload
+execution.
+
+Hardware Description
+====================
+
+AMD Versal AI SoCs boot from a dedicated flash device and presents two
+PCIe physical functions to the AMD Ryzen Embedded processor which acts as
+PCIe host.
+
+* Physical function 0 (PF0) is used for the management-plane to interact
+  with versal-pci driver.
+* Physical function 1 (PF1) is used for the execution-plane. In some cases
+  PF1 can be attached to a VM.
+
+Versal Management Runtime (VMR) Firmware
+----------------------------------------
+
+AMD Versal AI SoC runs Versal Management Runtime (VMR) firmware on a
+microcontroller. VMR is responsible for:
+
+* Low-level management of the AMD Versal AI SoC.
+* Loading accelerator images into a dedicated partition on the AMD Versal
+  AI SoC.
+
+The VMR communicates with the versal-pci driver via:
+
+* A command queue mapped to PCIe PF0 BAR.
+* A shared memory region in the PCIe PF0 BAR.
+
+Accelerator Image
+-----------------
+
+An AMD Embedded+ platform may store multiple *accelerator images*, each
+identified by a UUID in a secure location on the AMD Ryzen host file
+system. Each image enables a specific application like sensor fusion, AI
+inferencing, etc. A chosen accelerator image is sent to the VMR by the
+versal-pci driver. Once loaded, the accelerator image running in the
+dedicated partition of AMD Versal AI SoC interfaces with the AMD Ryzen host
+via PCIe PF1.
+
+Accelerator Image Loading Workflow
+----------------------------------
+
+1. A user application requests an image load by sending the UUID of the
+   desired image to the user driver attached to PF1.
+2. The user driver forwards the UUID to the versal-pci driver via a mailbox
+   channel which connects PF1 to PF0.
+3. The versal-pci driver on PF0 receives the UUID via the mailbox channel.
+4. The versal-pci driver on PF0 then requests the accelerator image change
+   by sending a message to the VMR.
+5. The versal-pci driver copies the accelerator image to the shared memory
+   region on the PF0 PCIe BAR. It then sends a message to the VMR via the
+   command queue.
+6. Upon receiving the request from versal-pci, the VMR programs dedicated
+   hardware in the AMD Versal AI SoC to perform image loading.
+7. The image is loaded over the dedicated partition which then starts
+   running.  The VMR sends success response to the versal-pci driver.
+8. The versal-pci driver then responds to the user PF driver over the
+   communication channel.
+9. The versal-pci driver begins monitoring the health of the AMD Versal
+   SoC.
+
+
+The Driver Architecture
+=======================
+
+.. code-block:: bash
+
+                          +------------+
+                          |            |
+                          |     VM     |
+       +------------+     |            |
+       | versal-pci |     |            |
+   +---+----o-------+-----+-----o------+-----+
+   |        |       Linux       |            |  AMD Ryzen Host
+   +--------|-------------------|------------+
+           PF0                 PF1
+            |                   |
+   +--------v--------+----------v------------+
+   |                 .                       |
+   |       VMR       .   Accelerator Image   | AMD Versal AI SoC
+   |                 .                       |
+   +-----------------+-----------------------+
+
+
+References
+==========
+
+* `AMD Embedded Plus <https://www.amd.com/en/products/embedded/embedded-plus.html>`_
+* `AMD Embedded Platform Architecture <https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/3011838141/AMD+Embedded+Platforms>`_
diff --git a/Documentation/accel/amd_vpci/index.rst b/Documentation/accel/amd_vpci/index.rst
new file mode 100644
index 000000000000..3ed4ab9e1332
--- /dev/null
+++ b/Documentation/accel/amd_vpci/index.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+===========================================
+ accel/amd_vpci Versal Embedded Plus driver
+===========================================
+
+The accel/amd_vpci driver supports the AMD Versal Embedded Plus accelerator
+
+.. toctree::
+
+   amd_vpci
diff --git a/Documentation/accel/index.rst b/Documentation/accel/index.rst
index d8fa332d60a8..30fed42e1686 100644
--- a/Documentation/accel/index.rst
+++ b/Documentation/accel/index.rst
@@ -9,6 +9,7 @@ Compute Accelerators
 
    introduction
    amdxdna/index
+   amd_vpci/index
    qaic/index
    rocket/index
 
-- 
2.34.1

