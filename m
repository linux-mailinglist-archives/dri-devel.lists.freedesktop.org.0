Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YBsdNUrAd2m+kgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:28:10 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 419708C88F
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:28:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A84B10E46F;
	Mon, 26 Jan 2026 19:28:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="GxeZt5pp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012042.outbound.protection.outlook.com [52.101.53.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAF210E46F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 19:28:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TFo2OFlxaRbbo1GAGvCHfh0FLSajwd5MeDqaLeolcU/2Cj0T/eglWrCUz6oN8ZGgiqr2Wxtcq3tkvElOB7FKFf5+en1tFgETWKrHWaibrobvqYPhMJFsPX9oSLW07518ZSR5F0QTk4qI7HNorlT9jk6Tlw3uaJXYKwVurubPLAZYbf67BfSuen6a3ffcc4DYIjQMF/slaJrQSa74My1NCAEYRdEeb4lnFiH7OQ4AVaF4JKoVEFrRyDVsUHEELZOJbE09Dha6kqlns8iuc7CUwIw5aJVudaeFbE1PTMN5bx8FMzX4iWcHsSqGZJ5COD6NDhmlMENxeOhaEjCdgQEs7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQEYlidCtI1wVTcHd1WyDKumG9s53wzp8cbnh8COyI8=;
 b=E3IxtWxx2Qcw5S7PBnrpQJrrltwa2CdIuyPIjpT1olE6Xt94DsdqjXby5EVjJRrXzm/m5tG3ITsKzZq03u4HqwkundJydgbYii9qk2YHX764k/CApm3Qw+i85OZ1zyADrZ8Ann5qzyF6J5L39KlNqI03R/n/O4OaRQYsDWBd41WH26reWs1dhbe2CeKlhEjv2DjccS/4ZQ97fISZlmr9VtgrGMNf/hJDe5qppm7X1xnqXBsZqiulRJcV0z81904uFFIJYbQGdSCYNgyPJQdzNWslOnOZsw2NOhVmfGajPI7MQ75gykNrWhYy2RGyBYMUnWVSjxoHxAe3OQBOiqVNCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iQEYlidCtI1wVTcHd1WyDKumG9s53wzp8cbnh8COyI8=;
 b=GxeZt5ppdTxSzpAFmjk5SYCGng92FzhwSlpMHuIfwJ1GIMrjb0lmt5AWFbTfYeHwow+/I3tW4LRPvcw5JhID54weN1wLWg5OKGDFIFlqBk3J5OP2Q8ZbTr0xnK1NkoGZJra/+O78qs58AAlNQ9ayWDdG8BICxXh1aT97F6jEMS8=
Received: from IA1P220CA0015.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::15)
 by LV5PR12MB9755.namprd12.prod.outlook.com (2603:10b6:408:307::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 19:28:02 +0000
Received: from MN1PEPF0000F0DF.namprd04.prod.outlook.com
 (2603:10b6:208:464:cafe::5b) by IA1P220CA0015.outlook.office365.com
 (2603:10b6:208:464::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 19:28:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000F0DF.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 19:28:00 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 13:27:59 -0600
Received: from xsjdavidzha51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via
 Frontend Transport; Mon, 26 Jan 2026 13:27:58 -0600
From: David Zhang <yidong.zhang@amd.com>
To: <yidong.zhang@amd.com>, <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <sonal.santan@amd.com>,
 <mario.limonciello@amd.com>, <lizhi.hou@amd.com>
Subject: [PATCH V2 0/5] accel/amd_vpci: Add new driver for AMD Versal PCI
Date: Mon, 26 Jan 2026 11:27:27 -0800
Message-ID: <20260126192732.1507084-1-yidong.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <yidong.zhang@amd.com>
References: <yidong.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DF:EE_|LV5PR12MB9755:EE_
X-MS-Office365-Filtering-Correlation-Id: 75c570f1-71e8-4a3e-ea80-08de5d1104a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/pTSHlKFqjiExi0aUGyEWen49nEzOyOaWEmutNW9OZ4ePlTOGh/cfnsQ9gDg?=
 =?us-ascii?Q?lNC6KmQQNMKbbzFKAhxkcInfA8QB+AcLpCxXCr4e9zt6rVc9BMTgXlENjrTj?=
 =?us-ascii?Q?qcmqs0uIEDR8xKT3Wid0q5jXp3xNz8N7+CwASTUwxGges1/oHZQ4CFgwJhg8?=
 =?us-ascii?Q?7mCiJSggHKWI0j7Z42OEnaLfIbu7wvhgrp8HO9eWF7u11QNGBTFo7aI3ltEd?=
 =?us-ascii?Q?/P3CGB7SBsc8+kpJkaYAL1HCfzcXtRDh7UOzIwV6SbUtn8Gut/iZWJolUl7p?=
 =?us-ascii?Q?JWFx96c9qyi/NfaVmFB2KhPO33/wanN3vZqxp//HkAsVlvCHdxOxc4d6hshr?=
 =?us-ascii?Q?Ewnq6G9JOSohqYwjGJtPlX6rV0gB2mDhFLdVVQ9xDQoGRErxXDywUt1BD9YV?=
 =?us-ascii?Q?qekS2+y0U+7sdJoL4TBFLSD5vCk+eidILYdnQqdm7Q5Pk2mxUFykOXrULLhB?=
 =?us-ascii?Q?hLKmSwC54Sijn8Z8RFUotBwhk9I98E05Vg1l4s7z+zywxNZUavgwn2zDu928?=
 =?us-ascii?Q?8rnsPPWl4B/gtoLdXmpBWTn7MUtExKWynYg7XyVb2qzp0rADfiJRmPCOD3xv?=
 =?us-ascii?Q?NTWFbs7oMqI0Lo79NUFFPzpGcKtqnpI3Dg+6bSH02UMdYjTbpInxftNFDKGn?=
 =?us-ascii?Q?V2qoVGuJjUDTnsphOqqTNMFDFlyauHLJDs0uYCYzEW6ixx7uovO1sTOsw7yU?=
 =?us-ascii?Q?UxpEtExBGOawd8V/bS6bjr5sRmVYCQS/5ZnKqnGHcjPdj4hcg35C7Nchdn2T?=
 =?us-ascii?Q?1NscmheamK5CVoqrLKH3DKkaZR3vDmtgCPPbx5Tato2cZPNFbKwcNmupPYkO?=
 =?us-ascii?Q?tnHzDQv1C68MVMUUBS0hfLZdtQGDPY2geOQ+2a7ZnuqqdW+pnFpgxLDcTb7Y?=
 =?us-ascii?Q?Pot7RHQk8zo5UsCdRufLWEhkSRR5LGGTTN/35IfoHQj7LOgqkF4tVCwrWD3i?=
 =?us-ascii?Q?CIp5mgg/CHZGzHOd1bwkR8MrjWeBYzPlsf656AiHixzRtPh6fbQOUnCXtmPr?=
 =?us-ascii?Q?vcdS5ZFahoZaTLkr8OJ2Ct3KyvmU0lxtwohfnHNUsR9wM67V7qnXys1NTIEf?=
 =?us-ascii?Q?r3kgjwbrtiQChBDXbPfA33Db5uOTK5RVW5UmSLwFqFzp1yINd2fZbrkkdwt0?=
 =?us-ascii?Q?KuQ34H1jJUfDlqhAvNuDjQGBDbSnC7RB6uprAzF6mVtFJvo1Jg/ih+l/JzsI?=
 =?us-ascii?Q?RoVX9chC947HOeq97e2Tv8Vhham63anrNJBzqcJcl8bkYd/7pDSZWgvriGeR?=
 =?us-ascii?Q?l+IbdlDWQvFpujm1Va1QG0XcIwxCYFdleOH7cBW82V7iwi0KjrJA2jR3LMZM?=
 =?us-ascii?Q?GwyMsmWG+DuQpdqyGWnj0jgok5h00Xnd2/TtAVX0uTAg8FqNI2GkhLC+ZMb5?=
 =?us-ascii?Q?WomN9gvPmSKCoW8OWgQFgYzbQ1EHAlS/8fXGi76fzBWQPjotpz4nWY2hzUwB?=
 =?us-ascii?Q?RrNdF2/VP0yOzYWZOQf+UaWY5cBKsGIu5wUHN4lh4umKsLFSHT3sWxAZPop0?=
 =?us-ascii?Q?vbooYOJcjDilHaTKnVefQkqXjuPeGFbr/ues5NHDx0eNbnlbf7QR7PyDn4vC?=
 =?us-ascii?Q?s6YQxgp0MV6TbnOnBS+iEdWg1lvrY0UV0pgO5XpHuLJdiUkDR93eWPZKBiNt?=
 =?us-ascii?Q?+Z0RtfBXMPioXgLu3A03X/E=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 19:28:00.6561 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c570f1-71e8-4a3e-ea80-08de5d1104a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0DF.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9755
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
X-Rspamd-Queue-Id: 419708C88F
X-Rspamd-Action: no action

This patchset introduces a new Linux Kernel Driver, *versal-pci*,  for AMD
Embedded+ platform.

The AMD Embedded+ platform integrates AMD Ryzen Embedded processors with
AMD Versal AI Edge adaptive SoCs on a single PCB [1]. The AMD Ryzen
Embedded processor is connected to the Versal AI Edge adaptive SoC via PCIe
enabling a tightly coupled heterogeneous compute platform. AMD Embedded+
platform is used for sensor fusion, AI inferencing, industrial networking,
control, and visualization.

AMD Versal PCI driver, versal-pci, is a host-side PCIe driver for AMD
Embedded+ platform running on AMD Ryzen Embedded processor.

The versal-pci driver is responsible for the management-plane operations
for the AMD Versal AI Edge adaptive SoC, including:

 - Loading accelerator firmware images
 - Reset and recovery
 - Health monitoring

The driver is licensed under GPL-2.0.

The firmwares are distributed as closed binaries. Please see [1] for more
information. Please see [2] for software architecture.

[1] https://www.amd.com/en/products/embedded/embedded-plus.html
[2] https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/3011838141/AMD+Embedded+Platforms

David Zhang (5):
  accel/amd_vpci: Add documentation for AMD Versal PCI accelerator
    management
  accel/amd_vpci: Add new driver for AMD Versal PCI accelerator
  accel/amd_vpci: Add Remote Management(RM) queue infrastructure
  accel/amd_vpci: Add Remote Management (RM) queue service APIs
  accel/amd_vpci: Add communication channel service

 Documentation/accel/amd_vpci/amd_vpci.rst     | 122 +++++
 Documentation/accel/amd_vpci/index.rst        |  11 +
 Documentation/accel/index.rst                 |   1 +
 MAINTAINERS                                   |   5 +
 drivers/accel/Kconfig                         |   1 +
 drivers/accel/Makefile                        |   3 +-
 drivers/accel/amd_vpci/Kconfig                |  15 +
 drivers/accel/amd_vpci/Makefile               |   9 +
 drivers/accel/amd_vpci/versal-pci-comm-chan.c | 295 +++++++++++
 drivers/accel/amd_vpci/versal-pci-comm-chan.h |  14 +
 drivers/accel/amd_vpci/versal-pci-main.c      | 395 ++++++++++++++
 drivers/accel/amd_vpci/versal-pci-rm-queue.c  | 314 +++++++++++
 drivers/accel/amd_vpci/versal-pci-rm-queue.h  |  21 +
 .../accel/amd_vpci/versal-pci-rm-service.c    | 497 ++++++++++++++++++
 .../accel/amd_vpci/versal-pci-rm-service.h    | 229 ++++++++
 drivers/accel/amd_vpci/versal-pci.h           |  70 +++
 16 files changed, 2001 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/accel/amd_vpci/amd_vpci.rst
 create mode 100644 Documentation/accel/amd_vpci/index.rst
 create mode 100644 drivers/accel/amd_vpci/Kconfig
 create mode 100644 drivers/accel/amd_vpci/Makefile
 create mode 100644 drivers/accel/amd_vpci/versal-pci-comm-chan.c
 create mode 100644 drivers/accel/amd_vpci/versal-pci-comm-chan.h
 create mode 100644 drivers/accel/amd_vpci/versal-pci-main.c
 create mode 100644 drivers/accel/amd_vpci/versal-pci-rm-queue.c
 create mode 100644 drivers/accel/amd_vpci/versal-pci-rm-queue.h
 create mode 100644 drivers/accel/amd_vpci/versal-pci-rm-service.c
 create mode 100644 drivers/accel/amd_vpci/versal-pci-rm-service.h
 create mode 100644 drivers/accel/amd_vpci/versal-pci.h

-- 
2.34.1

