Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GM4LIk7Ad2m+kgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:28:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C9E8C896
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:28:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD2B10E470;
	Mon, 26 Jan 2026 19:28:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="sNTt0mSt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010011.outbound.protection.outlook.com [52.101.201.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 629FB10E470
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 19:28:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lh9uUMXaOV5bjNjlcL3/iOWxa2snLwkYPWZE3PBROekKB8q+Yi4wc5RTn0mgjz9G18MDfCdez003DQDcAIb7AAKSRdkSNJAECP//Gx2dM4lBtXz13s886JY16G6Rtb8pLyu1PnA5VH0vLQ8URnfGGSsCF52YlMeQ16LDsn37wItCpRXtdo+w9t3y5RG+f39W0FxB7RRgHChTi/U0aQ6DktFJmWKDpsmw8JQ2ZR/rp1lPWMeQTDCIze4CflgsLemESrdCZSMSIqAVIsW7IgwF5qUf0b8rrdT/NSx1xAHCPMGciHziYOl9RyFxZPhJJP600cRyGDNtPIhx+AIKA9PX8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOdbvLQbAiqRqFGMqm7pr+Z38uLzt1pKc5PPb8cs294=;
 b=Y+RdZqdNjI6ovV7M8aVyPJgOxJJcYyd7ACoU4upLsxEe/mB8D8fOGQXjQ8zcDG1kQm5fGqRLVCAgEsDbvG7yfM00i0Aj5U19TiluldutBLWKIJhQaKZjwB+icl0RKLs1gj/TcnYYBOjsZWpbMBLzSGe3JUrTaBhbHJYFNb17kDlZ1aG5UNZ6+aH/d0xXbvW3B0PWwfdcEuz4xYp9UBat2r3QbzUv5+SCY4orUXLibsgENmKJyHdrKhPRzVEnDNuCnuu/2k0zFJgoNshWrMKsSVJJv7v4BftLbzM9sWGEMPZOAy8cSRx/rkjZxVJ9FSfH/KBdoY+NpHNFgjx7DhM8Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOdbvLQbAiqRqFGMqm7pr+Z38uLzt1pKc5PPb8cs294=;
 b=sNTt0mStpjnidqD01iqV4nnbPsUu9luensW1iped+7X7xNfdjgLjhhw5PmQfqeufV1ZHamb51goqQRj41W8n3YHqckQkdi6VbUwZLJiV4X5xldFM+NxZj3IX/XLn+nPvJHN+tIwQoQgOLMbqLyr90/6LckDlHLDAEmH4GfO0WiY=
Received: from IA1P220CA0022.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::11)
 by CH2PR12MB4278.namprd12.prod.outlook.com (2603:10b6:610:ab::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 19:28:04 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:464:cafe::d6) by IA1P220CA0022.outlook.office365.com
 (2603:10b6:208:464::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 19:28:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 19:28:03 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 13:28:00 -0600
Received: from xsjdavidzha51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via
 Frontend Transport; Mon, 26 Jan 2026 13:27:59 -0600
From: David Zhang <yidong.zhang@amd.com>
To: <yidong.zhang@amd.com>, <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <sonal.santan@amd.com>,
 <mario.limonciello@amd.com>, <lizhi.hou@amd.com>
Subject: [PATCH V2 1/5] accel/amd_vpci: Add documentation for AMD Versal PCI
 accelerator management
Date: Mon, 26 Jan 2026 11:27:28 -0800
Message-ID: <20260126192732.1507084-2-yidong.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126192732.1507084-1-yidong.zhang@amd.com>
References: <yidong.zhang@amd.com>
 <20260126192732.1507084-1-yidong.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|CH2PR12MB4278:EE_
X-MS-Office365-Filtering-Correlation-Id: 593b6b33-721a-43a6-e9e5-08de5d110698
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pXf+KFqDDZ8Je0ESv2A3c0zWvVoZlDqumCn317ubWbF3OAL/V8wAlYTVEa3n?=
 =?us-ascii?Q?7F3gGE5n+3RCkZqit9HXI0BkBD7r0Tzw9fT2C58ZVvRAreXvyVovVDcKut0C?=
 =?us-ascii?Q?buy7sg0h9aYU55KlAYmXWtU1W8oj6hzE+yVY625F/2ZP0UV9YLnssO9A9gzM?=
 =?us-ascii?Q?E9UJio/5BvagFpif/lL+LxJ4+ZhspzuTL1ZoJQxDTlTb9pcsPBJv2e/3yLix?=
 =?us-ascii?Q?yzyaEhRSt27ptwxANEKDzlGJyAe4OWZQWNLjzv+SgZB6EUuUEZe5y/Dm/1Eb?=
 =?us-ascii?Q?08Xsuob5E1tg7aHbpkjqwmcaN61IInxs3wN+qNzJ8glxyff9lu1e6iKslZCd?=
 =?us-ascii?Q?Jj6HrGWab38EdkaCMTwkE/ArHTaYuDxumgOQt7Xs7OLtze9ZalSnHtWp2OYM?=
 =?us-ascii?Q?oysZtO6A+O4sevyOQRRLq1PzfdrbsyolK+kvVA6xjFaJJQRhhEcxo4pezySs?=
 =?us-ascii?Q?7iybo/15gnJHdndS6yIOyM6V69R51s5tq9DIhIJqKvVVew18L9TfLOp+vNAl?=
 =?us-ascii?Q?GfRySZ6q5IGW4AsWRaMKg146io+159DpabgF3BtR0jeEvXWy3SaG/n+nKoHK?=
 =?us-ascii?Q?gAJKNR/gh3Rov+G1Jii6uKQTa7caYl0Lrf8cFIkJ8N4/RCdPKtg6gVcapLi7?=
 =?us-ascii?Q?ghoZEyqf4ymV98B7a6hYl6GaY0GA85KlUaR125OsErdftH4vauJaLfqHCwt4?=
 =?us-ascii?Q?ij/1ari4Erl3sm8POZzNcsEN5Wd9rRPFaaclmmZF3/qP3GzVN5H1+Jd5vD5R?=
 =?us-ascii?Q?4Bxhg1YJbO930eFYl5EegrsayASaByOuiPIaU7Tps1eahYtYt/B0NtJYTpYK?=
 =?us-ascii?Q?JlNOB/QlSKwA9yUKsFjcTGuz0oPZyiT6zsf87dCSeagqNEamcFF/tSwMWS9i?=
 =?us-ascii?Q?7xMIQmcWWheNIRAe6b4HbC7c3r6P8oD5xYuSWHM6jfnHkPOu0S2Vthc5Jqer?=
 =?us-ascii?Q?0dKLmGUt3+nheGF07FGifeaI8H36KMX6oHq7kUSM7bX8v7MYjy5mrGM8zUvw?=
 =?us-ascii?Q?4m6xXvgrt2Vp6N4+T88iTBsw9fg9p5GWS0c3DiiSDEbIi4F3KXd/wGLSVYKb?=
 =?us-ascii?Q?RJanVhxEm8P3RXlsIwb+r4QNSG20qcawvIAWrXuEPKxacJJKvIWDnKhtPNfa?=
 =?us-ascii?Q?vGF41Q5fbypbK0Zx9l8fFLfo93inYlDGNSowDEqo9LqSiZhm5wuz/JSiqF57?=
 =?us-ascii?Q?sNTIPz6Ury+9luURoUpymk1QefZLwiktTzSUEVRfYmihgZsNYJ8rrbWRDapv?=
 =?us-ascii?Q?CMr11OZBfHF7tzSVvDsub9tp1XD+3iD7+74bBFAuXpIPmcashCjkHXsv+dIt?=
 =?us-ascii?Q?LAfgixfDMH6UwIyyKire+fqDJHTMwx72L1KzUFo9SMjMb8wfLM14sdeqmWU7?=
 =?us-ascii?Q?39DHvGImZYS5hogEBXJ42ZM10xPHomsZ65f90TnEEFm35+HvIyQHGPDBhQKo?=
 =?us-ascii?Q?L1WsGANyIPJ8XtLyzY+wCLW4/D5FqsJaAVNqdHGRBI3bAHAYdMfSQ0CqDAKa?=
 =?us-ascii?Q?PWQBw9kfxAWRCkVTrz4iYKejPdDFKhFJ+49YfVJozj4OxNTxu2m4g2HVljOI?=
 =?us-ascii?Q?pbeTEzNg7vrvvATr8uc+wOQ3q1QdU2enoP9WT4agNOs3QSQs2UTYlJESr5Mm?=
 =?us-ascii?Q?tefXflXduWGIMI6vZFSXW4H1hGbXfbYHlf1tNqBWUszKFpecacYnyetNCOXI?=
 =?us-ascii?Q?oq93XQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 19:28:03.9263 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 593b6b33-721a-43a6-e9e5-08de5d110698
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4278
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS(0.00)[m:yidong.zhang@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,m:lizhi.hou@amd.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[yidong.zhang@amd.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[atlassian.net:url];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yidong.zhang@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E0C9E8C896
X-Rspamd-Action: no action

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
index 000000000000..7638e9107ff6
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
+:Copyright: |copy| 2026 Advanced Micro Devices, Inc.
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

