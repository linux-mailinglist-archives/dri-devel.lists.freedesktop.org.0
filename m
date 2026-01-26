Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4Mj3GGLAd2m+kgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:28:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92CCB8C8B4
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E851310E472;
	Mon, 26 Jan 2026 19:28:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="QFJ8L9H4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010001.outbound.protection.outlook.com
 [52.101.193.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED87A10E472
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 19:28:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KCF4RJW9GbL3uQStPrY+AG6Ajoxsk5jA+ELO1Td7F0f7FTykyZKJGrriOfUGqsHtIeVcK1YkJmm4F4BGigZWUxUIVmqxNn7ylVmHdIyQazhv2IA2mw35FwEedqkVJuasxHAMmg33s954kQdMSqnL1OO7jMdU4t9CSJyRILYvaBYv37nOvlK3+jRNWvtPVKs1Yu7A1fl2jb+JAms34H1qKw7We/MLZvxDOBFN04Z66/ilMVDYSWG15xurOh21XJ8shIQ6obkMnjQlCReDjFKAtz4w0lo8uBVMTZkN/GVNCjXqX0G9HfjYcUkkqxh65xkBN5ySxHkpayYMAwkrUOLJQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5fA967fUS+fO8kOgdryHp8lUKMghn/I58/Tu1w0/TA0=;
 b=om/WcLhdDvSrsL7lvn3DUS7DOMO5lPk4iVUwYhhELiRI/fOOSr47fpFvHrGzXHelHqfFpD56P9+dKvnk+2KxzYnJ1qAJ+TkK6biwXXFrn6q2hMIe0/4r7XlQy9JTamJxRUcidTomvrHhY0e7XlUHxLXjhZyFa1rq8yrHlnthv7ZEbimVRMohMK2Z7slLDCG5t5SZ08245z9sLbD5bSPrKId/BmucETNKzC2LsMiPetJ9YZMib0ZtgL+jy5m4xfwfY1IgGXFNpYABnzKBEsmSJbsacXmva0UjoCj1GQ6blhXo9RrhgrTvdSpmGV+Gx8kenmfmqilFiP7ahQFU0RccoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5fA967fUS+fO8kOgdryHp8lUKMghn/I58/Tu1w0/TA0=;
 b=QFJ8L9H4mbCOtX+KcULjeTBmv8eehptZLiglYCwKcEDkeFWcnTQQiVMPn+Q5imspcOsMX9GtH4opkxULPaMSf2t5xafDaLUrsAIupUTSkXt3Yx48UcaPQG+hNztahmPsRNxBHmCSJ/7CsQE/2mgstTGdprsa5sGqnJokqNTuIqI=
Received: from MN0PR03CA0017.namprd03.prod.outlook.com (2603:10b6:208:52f::11)
 by CYXPR12MB9444.namprd12.prod.outlook.com (2603:10b6:930:d6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.15; Mon, 26 Jan
 2026 19:28:19 +0000
Received: from MN1PEPF0000F0E3.namprd04.prod.outlook.com
 (2603:10b6:208:52f:cafe::98) by MN0PR03CA0017.outlook.office365.com
 (2603:10b6:208:52f::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.16 via Frontend Transport; Mon,
 26 Jan 2026 19:28:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000F0E3.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 19:28:19 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 13:28:01 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 11:28:01 -0800
Received: from xsjdavidzha51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via
 Frontend Transport; Mon, 26 Jan 2026 13:28:00 -0600
From: David Zhang <yidong.zhang@amd.com>
To: <yidong.zhang@amd.com>, <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <sonal.santan@amd.com>,
 <mario.limonciello@amd.com>, <lizhi.hou@amd.com>, DMG Karthik
 <Karthik.DMG@amd.com>, Nishad Saraf <nishads@amd.com>
Subject: [PATCH V2 2/5] accel/amd_vpci: Add new driver for AMD Versal PCI
 accelerator
Date: Mon, 26 Jan 2026 11:27:29 -0800
Message-ID: <20260126192732.1507084-3-yidong.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126192732.1507084-1-yidong.zhang@amd.com>
References: <yidong.zhang@amd.com>
 <20260126192732.1507084-1-yidong.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E3:EE_|CYXPR12MB9444:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fde5bee-988d-4d2b-b7e4-08de5d110fd7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QB+ipiH5WwGQVQ+re+6Wm5hmZSjCbbWcCYxyTZVHYQHFpxVXkO2eQz95cSUx?=
 =?us-ascii?Q?FJ9y3Ln6VogoPjSeeJGd8oszfV5Zlc3Q3Cj6tuSJkoan1B/vLD9q2hI5nSs5?=
 =?us-ascii?Q?sdprJIr0A+qQg1WQP7m3mCkqL3yhoCBi63jhsz9SyYOuLNMdCo8VrLSh1ny/?=
 =?us-ascii?Q?1z1fuDAGjlHGEvffkQ1oEUzAxKg7S+ZyZH9TZkq1kamylqFeXBLyjJzNwgKm?=
 =?us-ascii?Q?UGwxkjSthrbjF5uUBNITDS2JOYNHBBwK8cfepjx1k6v58LrcmEIW+Qk8c6Ar?=
 =?us-ascii?Q?W4vctPSmthJrYD9/wBiUDdsyVo+koAFKTfETSc756rHuumpfXwTRxM1Ii61D?=
 =?us-ascii?Q?dAK2Bg/pYZ8BD0e9mauwSKdXUkZjF4MFlPpN5M0QhmLPVaKTBVLHDfUg+I7r?=
 =?us-ascii?Q?umYlIfRSbEiM7biq/Uo7EQvvGDZc6pE9Y2wQNJ7Xn3UHF4w5qZgQtVjfUKbp?=
 =?us-ascii?Q?UJBI8Moh8uOPKJxjNDcNZea0AeVH47b4RbIdA4e+l+kHRPWfYxkpOuVTwhR3?=
 =?us-ascii?Q?vhCgZupEJXd9WNUNA3m3RdevmYE8h3D3nx7b76ppErlYduJ2v3blP7bO5NM5?=
 =?us-ascii?Q?Rs4iA2tjHfw0JhPrWX+qjkbu1bGH33jEVXiRQKOpgDKrPEld3FDsZ2Yepzdg?=
 =?us-ascii?Q?OAm36uVX6SZ2njCzIB8138zt7gs8L+I4ed8nP1qrpx28BFOO+El0ezwAX3wH?=
 =?us-ascii?Q?6VCQy3kQGPIjbr4o2Qg3DoWwCWs2Hcm0W65KUb90dnAVRH+sBqvwOxozwMtm?=
 =?us-ascii?Q?srnmp9SGu/zZ5eDwUlBKyqM5J5PPJFRXDV7Fsj1PnwK9QV2B8f8CCvhaQ2Nt?=
 =?us-ascii?Q?CPySoWeFamTPbN4O0DLu9EpuAKmSkeXDGnHNRKmTnLiPZ6oy/zgzPclVybrG?=
 =?us-ascii?Q?5B+2vBKiWBzVjh6j3f88gVpe6054ffTZ0fJeYYJd01kNVLsInsOww96TxAGA?=
 =?us-ascii?Q?w91FhaIg9WddRWsaf/YvDOrGu+pQlpmBam4ngDcEnz41jYg7luAJ+R77VOSy?=
 =?us-ascii?Q?6k2alMWHCKd9pekvWsx77Kv4h74ObFV/OK0FXegl06Mf83SUPWHE7MVSWsvB?=
 =?us-ascii?Q?rH1YGraq1vf459sWk/Z4Yc5pWu0RYFsrPM2RjXnfhlf1iX0n6MUaWD5NbDAD?=
 =?us-ascii?Q?WMuDXlizr1FbNrpbChzpOF1vCcvShK9W61+zo6S7CzROU3JQvISInjIhvXmQ?=
 =?us-ascii?Q?YG+kvjsSobRfz5CpGMU/cZhduP2xKtKUT13l/IIfwJO6f6yJv3SK7kwRemMJ?=
 =?us-ascii?Q?VtbGm+EHSRH+RJ8nHfiaT0rbgYE0rAoiW2WQcbR+escKvGI5zqMhNoE386V6?=
 =?us-ascii?Q?nwv/NdQpb7Wga5ZsfFlgB6rw7jgWAolaok+cDZfPLBJGNnBEMAGV61OVHOJg?=
 =?us-ascii?Q?bawGn6kj1XPlVoAu0nJZa6Gm0zR9Dyx3MyzKlDcMnQt0KKR0akl8wtvDS5YZ?=
 =?us-ascii?Q?wmPBY2u2uh7W9u2HGXZKoFC2q+zmIhgU8GZD3qaUi6Mwae9Cj1Hp4Dl5HhO3?=
 =?us-ascii?Q?IhuDDISGFumZx+o8A7jdoZKvzSMkM8PriyV91WEaAO4GcSTYJz6MWCSUGFc9?=
 =?us-ascii?Q?iQr9EP3/jDZCjIV2eNY4z8STVPp8pyIp5/MX+sAzF4l94psCeRKKIdhk8xNG?=
 =?us-ascii?Q?Bhgi3v4WkXYvK1d66SBp7paUMDsygBCpSsEexoVlup5xYR/IFQtwiIVjhFhV?=
 =?us-ascii?Q?0TMZ1w=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 19:28:19.4352 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fde5bee-988d-4d2b-b7e4-08de5d110fd7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E3.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9444
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yidong.zhang@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,m:lizhi.hou@amd.com,m:Karthik.DMG@amd.com,m:nishads@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:email,amd.com:dkim,amd.com:mid];
	FORGED_SENDER(0.00)[yidong.zhang@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[yidong.zhang@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 92CCB8C8B4
X-Rspamd-Action: no action

This patch introduces a new PCI driver for AMD Versal-based accelerator
cards.

The driver provides basic module and PCI device initialization, based on
BAR resources used to establish a hardware queue-based ring buffer between
the PCIe host and the Versal Management Runtime (VMR) service running on
the embedded SoC. This interface enables firmware management and board
health monitoring.

Key features:
   - PCI probe and BAR resource initialization.
   - Integration with configfs for firmware management
   - Compatibility check using firmware-reported UUIDs

The base firmware image is expected under /lib/firmware/xilinx/<fw_name>
and can be programmed to the device through the configfs interface.
Firmware transfer is handled via a remote queue service (added in a later
patch).

Co-developed-by: DMG Karthik <Karthik.DMG@amd.com>
Signed-off-by: DMG Karthik <Karthik.DMG@amd.com>
Co-developed-by: Nishad Saraf <nishads@amd.com>
Signed-off-by: Nishad Saraf <nishads@amd.com>
Signed-off-by: David Zhang <yidong.zhang@amd.com>
---
 MAINTAINERS                              |   5 +
 drivers/accel/Kconfig                    |   1 +
 drivers/accel/Makefile                   |   3 +-
 drivers/accel/amd_vpci/Kconfig           |  15 ++
 drivers/accel/amd_vpci/Makefile          |   6 +
 drivers/accel/amd_vpci/versal-pci-main.c | 280 +++++++++++++++++++++++
 drivers/accel/amd_vpci/versal-pci.h      |  62 +++++
 7 files changed, 371 insertions(+), 1 deletion(-)
 create mode 100644 drivers/accel/amd_vpci/Kconfig
 create mode 100644 drivers/accel/amd_vpci/Makefile
 create mode 100644 drivers/accel/amd_vpci/versal-pci-main.c
 create mode 100644 drivers/accel/amd_vpci/versal-pci.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 6863d5fa07a1..8fb7276eb7c1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1271,6 +1271,11 @@ F:	drivers/spi/spi-amd-pci.c
 F:	drivers/spi/spi-amd.c
 F:	drivers/spi/spi-amd.h
 
+AMD VERSAL PCI DRIVER
+M:	Yidong Zhang <yidong.zhang@amd.com>
+S:	Supported
+F:	drivers/accel/amd_vpci/
+
 AMD XDNA DRIVER
 M:	Min Ma <mamin506@gmail.com>
 M:	Lizhi Hou <lizhi.hou@amd.com>
diff --git a/drivers/accel/Kconfig b/drivers/accel/Kconfig
index bdf48ccafcf2..f80998fdb3fc 100644
--- a/drivers/accel/Kconfig
+++ b/drivers/accel/Kconfig
@@ -25,6 +25,7 @@ menuconfig DRM_ACCEL
 	  and debugfs).
 
 source "drivers/accel/amdxdna/Kconfig"
+source "drivers/accel/amd_vpci/Kconfig"
 source "drivers/accel/ethosu/Kconfig"
 source "drivers/accel/habanalabs/Kconfig"
 source "drivers/accel/ivpu/Kconfig"
diff --git a/drivers/accel/Makefile b/drivers/accel/Makefile
index 1d3a7251b950..be62e08bbef1 100644
--- a/drivers/accel/Makefile
+++ b/drivers/accel/Makefile
@@ -1,8 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 obj-$(CONFIG_DRM_ACCEL_AMDXDNA)		+= amdxdna/
+obj-$(CONFIG_DRM_ACCEL_AMD_VPCI)	+= amd_vpci/
 obj-$(CONFIG_DRM_ACCEL_ARM_ETHOSU)	+= ethosu/
 obj-$(CONFIG_DRM_ACCEL_HABANALABS)	+= habanalabs/
 obj-$(CONFIG_DRM_ACCEL_IVPU)		+= ivpu/
 obj-$(CONFIG_DRM_ACCEL_QAIC)		+= qaic/
-obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
\ No newline at end of file
+obj-$(CONFIG_DRM_ACCEL_ROCKET)		+= rocket/
diff --git a/drivers/accel/amd_vpci/Kconfig b/drivers/accel/amd_vpci/Kconfig
new file mode 100644
index 000000000000..dcf83bf3d8e6
--- /dev/null
+++ b/drivers/accel/amd_vpci/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config DRM_ACCEL_AMD_VPCI
+	tristate "AMD Versal PCIe Management Driver"
+	depends on DRM_ACCEL
+	depends on PCI && HAS_IOMEM
+	select FW_LOADER
+	select CONFIGFS_FS
+	default m
+	help
+	  AMD Versal PCIe Management Driver provides management services,
+	  including download firmware, program bitstream, and communicate with
+	  the User function.
+
+	  If "M" is selected, the driver module will be versal-pci
diff --git a/drivers/accel/amd_vpci/Makefile b/drivers/accel/amd_vpci/Makefile
new file mode 100644
index 000000000000..03849875ad0b
--- /dev/null
+++ b/drivers/accel/amd_vpci/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+obj-$(CONFIG_DRM_ACCEL_AMD_VPCI) := versal-pci.o
+
+versal-pci-y := \
+	versal-pci-main.o
diff --git a/drivers/accel/amd_vpci/versal-pci-main.c b/drivers/accel/amd_vpci/versal-pci-main.c
new file mode 100644
index 000000000000..36f88d5aee95
--- /dev/null
+++ b/drivers/accel/amd_vpci/versal-pci-main.c
@@ -0,0 +1,280 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Versal PCIe device
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#include <linux/pci.h>
+
+#include "versal-pci.h"
+
+#define DRV_NAME			"amd-versal-pci"
+
+#define PCI_DEVICE_ID_V70PQ2		0x50B0
+#define PCI_DEVICE_ID_RAVE		0x5700
+#define VERSAL_XCLBIN_MAGIC_ID		"xclbin2"
+
+static inline u32 versal_pci_devid(struct versal_pci_device *vdev)
+{
+	return ((pci_domain_nr(vdev->pdev->bus) << 16) |
+		PCI_DEVID(vdev->pdev->bus->number, vdev->pdev->devfn));
+}
+
+static int versal_pci_load_shell(struct versal_pci_device *vdev, char *fw_name)
+{
+	const struct firmware *fw;
+	struct axlf *xsabin;
+	int ret;
+
+	strim(fw_name);
+
+	ret = request_firmware(&fw, fw_name, &vdev->pdev->dev);
+	if (ret) {
+		vdev_warn(vdev, "request xsabin fw %s failed %d", fw_name, ret);
+		return ret;
+	}
+
+	xsabin = (struct axlf *)fw->data;
+	if (memcmp(xsabin->magic, VERSAL_XCLBIN_MAGIC_ID, strlen(VERSAL_XCLBIN_MAGIC_ID))) {
+		vdev_err(vdev, "Invalid device firmware");
+		ret = -EINVAL;
+		goto release_firmware;
+	}
+
+	if (!fw->size ||
+	    fw->size != xsabin->header.length ||
+	    fw->size < sizeof(*xsabin) ||
+	    fw->size > SZ_1G) {
+		vdev_err(vdev, "Invalid device firmware size %zu", fw->size);
+		ret = -EINVAL;
+		goto release_firmware;
+	}
+
+	if (!uuid_equal(&vdev->intf_uuid, &xsabin->header.rom_uuid)) {
+		vdev_err(vdev, "base shell doesn't match uuid %pUb", &xsabin->header.rom_uuid);
+		ret = -EINVAL;
+		goto release_firmware;
+	}
+
+	/* TODO upload fw to card */
+	if (ret) {
+		vdev_err(vdev, "failed to load xsabin %s : %d", fw_name, ret);
+		goto release_firmware;
+	}
+
+	vdev_info(vdev, "Downloaded xsabin %pUb of size %lld Bytes",
+		  &xsabin->header.uuid, xsabin->header.length);
+
+release_firmware:
+	release_firmware(fw);
+
+	return ret;
+}
+
+static inline struct versal_pci_device *item_to_vdev(struct config_item *item)
+{
+	return container_of(to_configfs_subsystem(to_config_group(item)),
+			    struct versal_pci_device, cfs_subsys);
+}
+
+static ssize_t versal_pci_cfs_config_store(struct config_item *item,
+					   const char *page, size_t count)
+{
+	struct versal_pci_device *vdev = item_to_vdev(item);
+	u32 config;
+	int ret;
+
+	ret = kstrtou32(page, 0, &config);
+	if (ret)
+		return -EINVAL;
+
+	if (config)
+		ret = versal_pci_load_shell(vdev, vdev->fw.name);
+
+	if (ret)
+		return -EFAULT;
+
+	return count;
+}
+CONFIGFS_ATTR_WO(versal_pci_cfs_, config);
+
+static ssize_t versal_pci_cfs_image_show(struct config_item *item, char *page)
+{
+	struct versal_pci_device *vdev = item_to_vdev(item);
+
+	vdev_info(vdev, "fw name: %s", vdev->fw.name);
+
+	return 0;
+}
+
+static ssize_t versal_pci_cfs_image_store(struct config_item *item,
+					  const char *page, size_t count)
+{
+	struct versal_pci_device *vdev = item_to_vdev(item);
+
+	count = snprintf(vdev->fw.name, sizeof(vdev->fw.name), "%s", page);
+
+	vdev_info(vdev, "fw name: %s", vdev->fw.name);
+	return count;
+}
+CONFIGFS_ATTR(versal_pci_cfs_, image);
+
+static struct configfs_attribute *versal_pci_cfs_attrs[] = {
+	&versal_pci_cfs_attr_config,
+	&versal_pci_cfs_attr_image,
+	NULL,
+};
+
+static const struct config_item_type versal_pci_cfs_table = {
+	.ct_owner = THIS_MODULE,
+	.ct_attrs = versal_pci_cfs_attrs,
+};
+
+static int versal_pci_cfs_init(struct versal_pci_device *vdev)
+{
+	struct configfs_subsystem *subsys = &vdev->cfs_subsys;
+
+	snprintf(subsys->su_group.cg_item.ci_namebuf,
+		 sizeof(subsys->su_group.cg_item.ci_namebuf),
+		 "%s%x", DRV_NAME, versal_pci_devid(vdev));
+
+	subsys->su_group.cg_item.ci_type = &versal_pci_cfs_table;
+
+	config_group_init(&subsys->su_group);
+	return configfs_register_subsystem(subsys);
+}
+
+static void versal_pci_fw_fini(struct versal_pci_device *vdev)
+{
+	uuid_copy(&vdev->intf_uuid, &uuid_null);
+}
+
+static void versal_pci_cfs_fini(struct configfs_subsystem *subsys)
+{
+	configfs_unregister_subsystem(subsys);
+}
+
+static void versal_pci_device_teardown(struct versal_pci_device *vdev)
+{
+	versal_pci_cfs_fini(&vdev->cfs_subsys);
+	versal_pci_fw_fini(vdev);
+}
+
+static int versal_pci_uuid_parse(struct versal_pci_device *vdev, uuid_t *uuid)
+{
+	char str[UUID_STRING_LEN];
+	u8 i, j;
+	int len = strlen(vdev->fw_id);
+
+	/* parse uuid into a valid uuid string format */
+	for (i = 0, j = 0; i < len && i < sizeof(str); i++) {
+		str[j++] = vdev->fw_id[i];
+		if (j == 8 || j == 13 || j == 18 || j == 23)
+			str[j++] = '-';
+	}
+
+	if (uuid_parse(str, uuid)) {
+		vdev_warn(vdev, "Invalid fw_id format");
+		return -EINVAL;
+	}
+
+	vdev_info(vdev, "Interface uuid %pU", uuid);
+	return 0;
+}
+
+static int versal_pci_fw_init(struct versal_pci_device *vdev)
+{
+	int ret;
+
+	/* TODO request compatible fw_id from card */
+
+	ret = versal_pci_uuid_parse(vdev, &vdev->intf_uuid);
+
+	return ret;
+}
+
+static int versal_pci_device_setup(struct versal_pci_device *vdev)
+{
+	int ret;
+
+	ret = versal_pci_fw_init(vdev);
+	if (ret) {
+		vdev_err(vdev, "Failed to init fw, err %d", ret);
+		goto comm_chan_fini;
+	}
+
+	ret = versal_pci_cfs_init(vdev);
+	if (ret) {
+		vdev_err(vdev, "Failed to init configfs subsys, err %d", ret);
+		goto comm_chan_fini;
+	}
+
+	return 0;
+
+comm_chan_fini:
+	versal_pci_fw_fini(vdev);
+
+	return ret;
+}
+
+static void versal_pci_remove(struct pci_dev *pdev)
+{
+	struct versal_pci_device *vdev = pci_get_drvdata(pdev);
+
+	versal_pci_device_teardown(vdev);
+}
+
+static int versal_pci_probe(struct pci_dev *pdev, const struct pci_device_id *pdev_id)
+{
+	struct versal_pci_device *vdev;
+	int ret;
+
+	vdev = devm_kzalloc(&pdev->dev, sizeof(*vdev), GFP_KERNEL);
+	if (!vdev)
+		return -ENOMEM;
+
+	pci_set_drvdata(pdev, vdev);
+	vdev->pdev = pdev;
+
+	ret = pcim_enable_device(pdev);
+	if (ret) {
+		vdev_err(vdev, "Failed to enable device %d", ret);
+		return ret;
+	}
+
+	vdev->io_regs = pcim_iomap_region(vdev->pdev, MGMT_BAR, DRV_NAME);
+	if (IS_ERR(vdev->io_regs)) {
+		vdev_err(vdev, "Failed to map RM shared memory BAR%d", MGMT_BAR);
+		return PTR_ERR(vdev->io_regs);
+	}
+
+	ret = versal_pci_device_setup(vdev);
+	if (ret) {
+		vdev_err(vdev, "Failed to setup Versal device %d", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct pci_device_id versal_pci_ids[] = {
+	{ PCI_DEVICE(PCI_VENDOR_ID_XILINX, PCI_DEVICE_ID_V70PQ2), },
+	{ PCI_DEVICE(PCI_VENDOR_ID_XILINX, PCI_DEVICE_ID_RAVE), },
+	{ 0 }
+};
+
+MODULE_DEVICE_TABLE(pci, versal_pci_ids);
+
+static struct pci_driver versal_pci_driver = {
+	.name = DRV_NAME,
+	.id_table = versal_pci_ids,
+	.probe = versal_pci_probe,
+	.remove = versal_pci_remove,
+};
+
+module_pci_driver(versal_pci_driver);
+
+MODULE_DESCRIPTION("AMD Versal PCIe Management Driver");
+MODULE_AUTHOR("XRT Team <runtimeca39d@amd.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/accel/amd_vpci/versal-pci.h b/drivers/accel/amd_vpci/versal-pci.h
new file mode 100644
index 000000000000..890da1d6bcc9
--- /dev/null
+++ b/drivers/accel/amd_vpci/versal-pci.h
@@ -0,0 +1,62 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Driver for Versal PCIe device
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#ifndef __VERSAL_PCI_H
+#define __VERSAL_PCI_H
+
+#include <linux/configfs.h>
+#include <linux/firmware.h>
+
+#define MGMT_BAR		0
+
+#define vdev_info(vdev, fmt, args...)					\
+	dev_info(&(vdev)->pdev->dev, "%s: "fmt, __func__, ##args)
+
+#define vdev_warn(vdev, fmt, args...)					\
+	dev_warn(&(vdev)->pdev->dev, "%s: "fmt, __func__, ##args)
+
+#define vdev_err(vdev, fmt, args...)					\
+	dev_err(&(vdev)->pdev->dev, "%s: "fmt, __func__, ##args)
+
+#define vdev_dbg(vdev, fmt, args...)					\
+	dev_dbg(&(vdev)->pdev->dev, fmt, ##args)
+
+struct versal_pci_device;
+
+struct axlf_header {
+	__u64				length;
+	__u8				reserved1[24];
+	uuid_t				rom_uuid;
+	__u8				reserved2[64];
+	uuid_t				uuid;
+	__u8				reserved3[24];
+} __packed;
+
+struct axlf {
+	__u8				magic[8];
+	__u8				reserved[296];
+	struct axlf_header		header;
+} __packed;
+
+struct fw_info {
+	__u32				opcode;
+	char				name[128];
+};
+
+struct versal_pci_device {
+	struct pci_dev			*pdev;
+
+	struct fw_info			fw;
+
+	void __iomem			*io_regs;
+	uuid_t				intf_uuid;
+	__u8				fw_id[UUID_STRING_LEN + 1];
+
+	struct configfs_subsystem	cfs_subsys;
+};
+
+#endif	/* __VERSAL_PCI_H */
-- 
2.34.1

