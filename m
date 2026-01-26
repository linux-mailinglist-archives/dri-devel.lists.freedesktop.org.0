Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKnRMWnAd2m+kgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:28:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ADC58C8D3
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 20:28:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89BFA10E474;
	Mon, 26 Jan 2026 19:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="NmjRpFWo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010059.outbound.protection.outlook.com [52.101.56.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C45F10E474
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 19:28:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ag0WQDxyrKSPD1y1j0nwdpsa/AnlT6J8+0ByJg51IuLl5pwDkiQwt2dbs8PBsc+9oNYT2F9Mz8s6I1AC1MG8CyP46hSEF9P3SnWWkx+UBCIYlRp6Y6/d+StTWgbRStpLAzPzXnD3s9MUWDJGcA9PdguwHL1YjCYiZrLe0R+LxWJhrZfxKoDZzYM5ABrLiqKmxcFnOntwK2hluY9MZ/mLuZdArJZtonEVbFgMzDzapr5KbQ5Bt8mHE0Rij9Vuo/KDs2BXOGCcf2K0XvmYScKhd/jhSoyUHYNA9SY9xS9dJDSux7xRnXIEACBS0e54hNoGFbnLzg3TTgcUy1dv6IPH1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3VJPLQUi7csC26ppEbottIPkqMXLTl8vNpmKiOK3pYk=;
 b=eLZWalCiMwejw21xF1FwwYpbgbY5s6KcJjeJi0X3IzTRZVdHh2QAuapl/PVrwADUGdOtueKJk4TM/HXRwvXgPYnEBhutoTAYLFNHOiuaRtdB+xiVAg92peCt2GulvoROnv7xy67y8vAk6SZOcuG/eSVWDEl4Rwq7MLoCVzDEaOEISrFes28Q7NrJogQX9E2SKONxSvdZRKWowDkchte+AEIOjLraJA8KaS+6kxQss+MHfqd1PvcYDbN8lz+A0FM+zLjkvGRZ7R078BOHAUVgrb5kSD8J8Zehk6NLpljwjyqt6yDFY/9hFGyfCcRTgKC0JtoTe6K0B50CeOFjw5Wvew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3VJPLQUi7csC26ppEbottIPkqMXLTl8vNpmKiOK3pYk=;
 b=NmjRpFWoAqlkQvm7iLh4aSDqmT7XjGQoXxAAVJkLm+JLPy5Bq03TJLLvpzv7pDVu28R+E+XWqAmr5cT60vGQgbMdzWB1poCp5XL/o4cu+Wfh6IBTGZ3JVnacCcUHfMMi5/FM9ZePa6Jpn7vwqfMyPrlO5/qex+k/9vtrvWtAnzM=
Received: from BL1PR13CA0168.namprd13.prod.outlook.com (2603:10b6:208:2bd::23)
 by SA3PR12MB9160.namprd12.prod.outlook.com (2603:10b6:806:399::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 26 Jan
 2026 19:28:22 +0000
Received: from MN1PEPF0000F0E1.namprd04.prod.outlook.com
 (2603:10b6:208:2bd:cafe::e9) by BL1PR13CA0168.outlook.office365.com
 (2603:10b6:208:2bd::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.7 via Frontend Transport; Mon,
 26 Jan 2026 19:28:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 MN1PEPF0000F0E1.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Mon, 26 Jan 2026 19:28:21 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 26 Jan
 2026 13:28:02 -0600
Received: from xsjdavidzha51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via
 Frontend Transport; Mon, 26 Jan 2026 13:28:02 -0600
From: David Zhang <yidong.zhang@amd.com>
To: <yidong.zhang@amd.com>, <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <sonal.santan@amd.com>,
 <mario.limonciello@amd.com>, <lizhi.hou@amd.com>, Nishad Saraf
 <nishads@amd.com>
Subject: [PATCH V2 4/5] accel/amd_vpci: Add Remote Management (RM) queue
 service APIs
Date: Mon, 26 Jan 2026 11:27:31 -0800
Message-ID: <20260126192732.1507084-5-yidong.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260126192732.1507084-1-yidong.zhang@amd.com>
References: <yidong.zhang@amd.com>
 <20260126192732.1507084-1-yidong.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E1:EE_|SA3PR12MB9160:EE_
X-MS-Office365-Filtering-Correlation-Id: ff7e5a65-c82c-4c76-e62f-08de5d1110ee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PA47OLVZdk430wVxk9kh8Ub2aXPW80TlWHgUDo6iyIL0n71jDH1Wi2YzUYSj?=
 =?us-ascii?Q?tgQZLAaCFT6jK0d8f7GaqQJ72KG4D/hGvvF5E75XG0uSaQNiMlWMfcoi5Hhp?=
 =?us-ascii?Q?90SlKAxl6Px9XCTDEY+3gdWaYgEI9nctYz765DYDmGa63N+Kc3jnNtvSXJks?=
 =?us-ascii?Q?K6oblROul8qBZHKDRp2lw2DRPdWjnC+kOVXCPjG4YYnI6BVNdNlHqfqVnUgA?=
 =?us-ascii?Q?o3T5dVn1azSmj/TvzeqtcRmhQNt5koG+odS+ha1K1Pug0K7g3vZGOXpOwUFr?=
 =?us-ascii?Q?0S7xvHJaST8aBSjr8oakZZvLKEqBjY4QfgVJG30iHKOmKObW1ltPHb0qoixx?=
 =?us-ascii?Q?Ls0XBpU0EAUHjK/Y0i+I2FD2nF5CfqlDNhYdzPTC+AcgS6nxzalGyEsE2NoT?=
 =?us-ascii?Q?utpnS9b7NzKoFwyG8cYCZgXt5P+MewExoQFwURERA7ulC1uJ3scesr3R8qRl?=
 =?us-ascii?Q?hp1dAS/wWyyGMyHIBWtMkrBDgohidEpqjepqPBxR2GHpRgKFbYS8LgeLtR0+?=
 =?us-ascii?Q?HDlwIuT/pfHNm2TYtYZwnXN1KhsXwy75UrckJ39DuCyLZba5Vh4wXFmWTKbW?=
 =?us-ascii?Q?YCpbERSCZGVrTaaSsfAWMqsRj2fw6w08IALf2h9uTcGPuJ6qwfMgGREQ1oVT?=
 =?us-ascii?Q?Hyds8EYq9hFbKncJjWoHifiCx4OJ8d+suRLa/HNYO4wZAlqLQtyAWFlCMc6T?=
 =?us-ascii?Q?73CHzuMfbkwuhLE2JH/zr1GUC7a/Um9NX3FOcNJQTjOSVoPc274AKlWIhCRF?=
 =?us-ascii?Q?lOrUNd55WinP2yzQPV75/63vtPN+JVZ78aUH+EKw1DTq9WZ4QbfAyzTD2EkA?=
 =?us-ascii?Q?YOSPoYGYdA41rArDr4JulYTtzcAM/LEojO19bWwXMzm+coraRZ1mdOH6Xvbz?=
 =?us-ascii?Q?1i8braBLeOuk2KDtAsmriuQDemPYMs8OnYi+JEAJ512dER7MUiqlIYsfm1C6?=
 =?us-ascii?Q?sl+RRJVYzEMlUPrB60i1pmIpaTyCoCUoZauMSktMjh41xCU8Rw9/Lh2YKddR?=
 =?us-ascii?Q?fiXr/bkrinqVQqcMdPSVQMRL8cZCZAd4aWPSlEyYE6E+irG6DQXF/7Fzhy+Q?=
 =?us-ascii?Q?Imd0caxo6MqwyMa7CSexVf6GZMApsDKouDlSgD0hmJJw+DKjPMkXymEQ0xMF?=
 =?us-ascii?Q?PNa4LP4lmIlJWzm94flqziuCnoAURkDKtbUFTccWfDuCLbnhlqlUtpe+gfPE?=
 =?us-ascii?Q?A0l+mi9w+lKS8Tvdfd7JedPNyp8XYLGEPXHKT44ANp3Uy2c5vnrLMVIsPvtN?=
 =?us-ascii?Q?6IPGOTrcywGJlq5gxGPoNPD/TJ/Tpj8ohw8cmFxS3OjCPgFlHPwRMxEirI38?=
 =?us-ascii?Q?eF1/XNUc3l677F26TIZGA2krOOLEy21ss9Yebzf4pWkFbnviBcRpTdL6he8o?=
 =?us-ascii?Q?fmbf//TAOe8/iyo84PmPn0F66NMANh2uzp761wqLNSwyfR9HkqeunZ0+Q7bw?=
 =?us-ascii?Q?PlZzoHuwmkwa1PtQcsOW4hQdDi2CHqNdNku1X12tCKzI7/Fw7H80O3sIhs5/?=
 =?us-ascii?Q?LZqrzuKCjrJGMiwZ1Zgs+2kyejMf29nylbZzfupp6H3kEj0mHHlA0cQYUYKk?=
 =?us-ascii?Q?FYeehAruqf4eSQ0RsZMZPTqcxjdMJ5V8ErC4Ip3C6shwdT2fV3uaG3R/6XV8?=
 =?us-ascii?Q?aAhJbruXnUGBThiXm2/cWfTy72ptuGU7xAwKDezNBJXS/mM1e+nQEfKAJJSK?=
 =?us-ascii?Q?cwf1ng=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 19:28:21.2750 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff7e5a65-c82c-4c76-e62f-08de5d1110ee
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9160
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
	FORGED_RECIPIENTS(0.00)[m:yidong.zhang@amd.com,m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:linux-kernel@vger.kernel.org,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,m:lizhi.hou@amd.com,m:nishads@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:dkim,amd.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
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
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4ADC58C8D3
X-Rspamd-Action: no action

This patch introduces a set of APIs for allowing the PCIe driver submit
commands, transfer binary payloads and retrieve firmware metadata.

Key features:
- RM queue command APIs:
  - create and destroy RM queue commands
  - Initialized command data payloads
  - Send and poll for command completion
- Service-level operations:
  - Retrieve firmware ID
  - Program accelerator and APU firmware images
  - Periodic health monitoring

Co-developed-by: Nishad Saraf <nishads@amd.com>
Signed-off-by: Nishad Saraf <nishads@amd.com>
Signed-off-by: David Zhang <yidong.zhang@amd.com>
---
 drivers/accel/amd_vpci/Makefile               |   3 +-
 drivers/accel/amd_vpci/versal-pci-main.c      |  43 +-
 drivers/accel/amd_vpci/versal-pci-rm-queue.c  |  14 +-
 .../accel/amd_vpci/versal-pci-rm-service.c    | 497 ++++++++++++++++++
 .../accel/amd_vpci/versal-pci-rm-service.h    |  20 +
 drivers/accel/amd_vpci/versal-pci.h           |   1 +
 6 files changed, 567 insertions(+), 11 deletions(-)
 create mode 100644 drivers/accel/amd_vpci/versal-pci-rm-service.c

diff --git a/drivers/accel/amd_vpci/Makefile b/drivers/accel/amd_vpci/Makefile
index 9e4e56ac2dee..bacd305783dd 100644
--- a/drivers/accel/amd_vpci/Makefile
+++ b/drivers/accel/amd_vpci/Makefile
@@ -4,4 +4,5 @@ obj-$(CONFIG_DRM_ACCEL_AMD_VPCI) := versal-pci.o
 
 versal-pci-y := \
 	versal-pci-main.o \
-	versal-pci-rm-queue.o
+	versal-pci-rm-queue.o \
+	versal-pci-rm-service.o
diff --git a/drivers/accel/amd_vpci/versal-pci-main.c b/drivers/accel/amd_vpci/versal-pci-main.c
index 36f88d5aee95..f8d32f9c0e0c 100644
--- a/drivers/accel/amd_vpci/versal-pci-main.c
+++ b/drivers/accel/amd_vpci/versal-pci-main.c
@@ -8,6 +8,8 @@
 #include <linux/pci.h>
 
 #include "versal-pci.h"
+#include "versal-pci-rm-service.h"
+#include "versal-pci-rm-queue.h"
 
 #define DRV_NAME			"amd-versal-pci"
 
@@ -21,6 +23,29 @@ static inline u32 versal_pci_devid(struct versal_pci_device *vdev)
 		PCI_DEVID(vdev->pdev->bus->number, vdev->pdev->devfn));
 }
 
+static int versal_pci_upload_fw(struct versal_pci_device *vdev,
+				enum rm_queue_opcode opcode,
+				const char *data,
+				size_t size)
+{
+	struct rm_cmd *cmd;
+	int ret;
+
+	ret = rm_queue_create_cmd(vdev->rdev, opcode, &cmd);
+	if (ret)
+		return ret;
+
+	ret = rm_queue_data_init(cmd, data, size);
+	if (ret)
+		goto done;
+
+	ret = rm_queue_send_cmd(cmd, RM_CMD_WAIT_DOWNLOAD_TIMEOUT);
+
+done:
+	rm_queue_destroy_cmd(cmd);
+	return ret;
+}
+
 static int versal_pci_load_shell(struct versal_pci_device *vdev, char *fw_name)
 {
 	const struct firmware *fw;
@@ -57,7 +82,8 @@ static int versal_pci_load_shell(struct versal_pci_device *vdev, char *fw_name)
 		goto release_firmware;
 	}
 
-	/* TODO upload fw to card */
+	ret = versal_pci_upload_fw(vdev, RM_QUEUE_OP_LOAD_FW,
+				   (char *)xsabin, xsabin->header.length);
 	if (ret) {
 		vdev_err(vdev, "failed to load xsabin %s : %d", fw_name, ret);
 		goto release_firmware;
@@ -159,6 +185,7 @@ static void versal_pci_device_teardown(struct versal_pci_device *vdev)
 {
 	versal_pci_cfs_fini(&vdev->cfs_subsys);
 	versal_pci_fw_fini(vdev);
+	versal_pci_rm_fini(vdev->rdev);
 }
 
 static int versal_pci_uuid_parse(struct versal_pci_device *vdev, uuid_t *uuid)
@@ -187,7 +214,11 @@ static int versal_pci_fw_init(struct versal_pci_device *vdev)
 {
 	int ret;
 
-	/* TODO request compatible fw_id from card */
+	ret = rm_queue_get_fw_id(vdev->rdev);
+	if (ret) {
+		vdev_warn(vdev, "Failed to get fw_id");
+		return -EINVAL;
+	}
 
 	ret = versal_pci_uuid_parse(vdev, &vdev->intf_uuid);
 
@@ -198,6 +229,13 @@ static int versal_pci_device_setup(struct versal_pci_device *vdev)
 {
 	int ret;
 
+	vdev->rdev = versal_pci_rm_init(vdev);
+	if (IS_ERR(vdev->rdev)) {
+		ret = PTR_ERR(vdev->rdev);
+		vdev_err(vdev, "Failed to init remote queue, err %d", ret);
+		return ret;
+	}
+
 	ret = versal_pci_fw_init(vdev);
 	if (ret) {
 		vdev_err(vdev, "Failed to init fw, err %d", ret);
@@ -213,6 +251,7 @@ static int versal_pci_device_setup(struct versal_pci_device *vdev)
 	return 0;
 
 comm_chan_fini:
+	versal_pci_rm_fini(vdev->rdev);
 	versal_pci_fw_fini(vdev);
 
 	return ret;
diff --git a/drivers/accel/amd_vpci/versal-pci-rm-queue.c b/drivers/accel/amd_vpci/versal-pci-rm-queue.c
index eeda07065487..97e5911f18ed 100644
--- a/drivers/accel/amd_vpci/versal-pci-rm-queue.c
+++ b/drivers/accel/amd_vpci/versal-pci-rm-queue.c
@@ -23,37 +23,35 @@ static inline struct rm_device *to_rdev_msg_timer(struct timer_list *t)
 
 static inline u32 rm_io_read(struct rm_device *rdev, u32 offset)
 {
-	/* TODO */
-	return 0;
+	return rm_reg_read(rdev, RM_PCI_IO_BAR_OFF + offset);
 }
 
 static inline int rm_io_write(struct rm_device *rdev, u32 offset, u32 value)
 {
-	/* TODO */
+	rm_reg_write(rdev, RM_PCI_IO_BAR_OFF + offset, value);
 	return 0;
 }
 
 static inline u32 rm_queue_read(struct rm_device *rdev, u32 offset)
 {
-	/* TODO */
-	return 0;
+	return rm_reg_read(rdev, RM_PCI_SHMEM_BAR_OFF + rdev->queue_base + offset);
 }
 
 static inline void rm_queue_write(struct rm_device *rdev, u32 offset, u32 value)
 {
-	/* TODO */
+	rm_reg_write(rdev, RM_PCI_SHMEM_BAR_OFF + rdev->queue_base + offset, value);
 }
 
 static inline void rm_queue_bulk_read(struct rm_device *rdev, u32 offset,
 				      u32 *value, u32 size)
 {
-	/* TODO */
+	rm_bulk_reg_read(rdev, RM_PCI_SHMEM_BAR_OFF + rdev->queue_base + offset, value, size);
 }
 
 static inline void rm_queue_bulk_write(struct rm_device *rdev, u32 offset,
 				       u32 *value, u32 size)
 {
-	/* TODO */
+	rm_bulk_reg_write(rdev, RM_PCI_SHMEM_BAR_OFF + rdev->queue_base + offset, value, size);
 }
 
 static inline u32 rm_queue_get_cidx(struct rm_device *rdev, enum rm_queue_type type)
diff --git a/drivers/accel/amd_vpci/versal-pci-rm-service.c b/drivers/accel/amd_vpci/versal-pci-rm-service.c
new file mode 100644
index 000000000000..974e5ed3a80e
--- /dev/null
+++ b/drivers/accel/amd_vpci/versal-pci-rm-service.c
@@ -0,0 +1,497 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Versal PCIe device
+ *
+ * Copyright (C) 2026 Advanced Micro Devices, Inc. All rights reserved.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/pci.h>
+#include <linux/vmalloc.h>
+
+#include "versal-pci.h"
+#include "versal-pci-rm-service.h"
+#include "versal-pci-rm-queue.h"
+
+static DEFINE_IDA(rm_cmd_ids);
+
+static void rm_uninstall_health_monitor(struct rm_device *rdev);
+
+static inline struct rm_device *to_rdev_health_monitor(struct work_struct *w)
+{
+	return container_of(w, struct rm_device, health_monitor);
+}
+
+static inline struct rm_device *to_rdev_health_timer(struct timer_list *t)
+{
+	return container_of(t, struct rm_device, health_timer);
+}
+
+u32 rm_reg_read(struct rm_device *rdev, u32 offset)
+{
+	return readl(rdev->vdev->io_regs + offset);
+}
+
+void rm_reg_write(struct rm_device *rdev, u32 offset, const u32 value)
+{
+	writel(value, rdev->vdev->io_regs + offset);
+}
+
+void rm_bulk_reg_read(struct rm_device *rdev, u32 offset, u32 *value, size_t size)
+{
+	void __iomem *src = rdev->vdev->io_regs + offset;
+	void *dst = (void *)value;
+
+	memcpy_fromio(dst, src, size);
+	/* Barrier after reading data from device */
+	rmb();
+}
+
+void rm_bulk_reg_write(struct rm_device *rdev, u32 offset, const void *value, size_t size)
+{
+	void __iomem *dst = rdev->vdev->io_regs + offset;
+
+	memcpy_toio(dst, value, size);
+	/* Barrier after writing data to device */
+	wmb();
+}
+
+static inline u32 rm_shmem_read(struct rm_device *rdev, u32 offset)
+{
+	return rm_reg_read(rdev, RM_PCI_SHMEM_BAR_OFF + offset);
+}
+
+static inline void rm_shmem_bulk_read(struct rm_device *rdev, u32 offset,
+				      u32 *value, u32 size)
+{
+	rm_bulk_reg_read(rdev, RM_PCI_SHMEM_BAR_OFF + offset, value, size);
+}
+
+static inline void rm_shmem_bulk_write(struct rm_device *rdev, u32 offset,
+				       const void *value, u32 size)
+{
+	rm_bulk_reg_write(rdev, RM_PCI_SHMEM_BAR_OFF + offset, value, size);
+}
+
+void rm_queue_destroy_cmd(struct rm_cmd *cmd)
+{
+	ida_free(&rm_cmd_ids, cmd->sq_msg.hdr.id);
+	kfree(cmd);
+}
+
+static int rm_queue_copy_response(struct rm_cmd *cmd, void *buffer, ssize_t len)
+{
+	struct rm_cmd_cq_log_page *result = &cmd->cq_msg.data.page;
+	u64 off = cmd->sq_msg.data.page.address;
+
+	if (!result->len || len < result->len) {
+		vdev_err(cmd->rdev->vdev, "Invalid response or buffer size");
+		return -EINVAL;
+	}
+
+	rm_shmem_bulk_read(cmd->rdev, off, (u32 *)buffer, result->len);
+	return 0;
+}
+
+static void rm_queue_payload_fini(struct rm_cmd *cmd)
+{
+	up(&cmd->rdev->cq.data_lock);
+}
+
+static int rm_queue_payload_init(struct rm_cmd *cmd,
+				 enum rm_cmd_log_page_type type)
+{
+	struct rm_device *rdev = cmd->rdev;
+	int ret;
+
+	ret = down_interruptible(&rdev->cq.data_lock);
+	if (ret)
+		return ret;
+
+	cmd->sq_msg.data.page.address = rdev->cq.data_offset;
+	cmd->sq_msg.data.page.size = rdev->cq.data_size;
+	cmd->sq_msg.data.page.reserved1 = 0;
+	cmd->sq_msg.data.page.type = FIELD_PREP(RM_CMD_LOG_PAGE_TYPE_MASK,
+						type);
+	return 0;
+}
+
+void rm_queue_data_fini(struct rm_cmd *cmd)
+{
+	up(&cmd->rdev->sq.data_lock);
+}
+
+int rm_queue_data_init(struct rm_cmd *cmd, const char *buffer, ssize_t size)
+{
+	struct rm_device *rdev = cmd->rdev;
+	int ret;
+
+	if (!size || size > rdev->sq.data_size) {
+		vdev_err(rdev->vdev, "Unsupported file size");
+		return -ENOMEM;
+	}
+
+	ret = down_interruptible(&rdev->sq.data_lock);
+	if (ret)
+		return ret;
+
+	rm_shmem_bulk_write(cmd->rdev, rdev->sq.data_offset, buffer, size);
+
+	cmd->sq_msg.data.bin.address = rdev->sq.data_offset;
+	cmd->sq_msg.data.bin.size = size;
+	return 0;
+}
+
+int rm_queue_create_cmd(struct rm_device *rdev, enum rm_queue_opcode opcode,
+			struct rm_cmd **cmd_ptr)
+{
+	struct rm_cmd *cmd = NULL;
+	int ret, id;
+	u16 size;
+
+	if (rdev->firewall_tripped)
+		return -ENODEV;
+
+	cmd = kzalloc(sizeof(*cmd), GFP_KERNEL);
+	if (!cmd)
+		return -ENOMEM;
+	cmd->rdev = rdev;
+
+	switch (opcode) {
+	case RM_QUEUE_OP_LOAD_XCLBIN:
+		fallthrough;
+	case RM_QUEUE_OP_LOAD_FW:
+		fallthrough;
+	case RM_QUEUE_OP_LOAD_APU_FW:
+		size = sizeof(struct rm_cmd_sq_bin);
+		break;
+	case RM_QUEUE_OP_GET_LOG_PAGE:
+		size = sizeof(struct rm_cmd_sq_log_page);
+		break;
+	case RM_QUEUE_OP_IDENTIFY:
+		size = 0;
+		break;
+	case RM_QUEUE_OP_VMR_CONTROL:
+		size = sizeof(struct rm_cmd_sq_ctrl);
+		break;
+	default:
+		vdev_err(rdev->vdev, "Invalid cmd opcode %d", opcode);
+		ret = -EINVAL;
+		goto error;
+	}
+
+	cmd->opcode = opcode;
+	cmd->sq_msg.hdr.opcode = FIELD_PREP(RM_CMD_SQ_HDR_OPS_MSK, opcode);
+	cmd->sq_msg.hdr.msg_size = FIELD_PREP(RM_CMD_SQ_HDR_SIZE_MSK, size);
+
+	id = ida_alloc_range(&rm_cmd_ids, RM_CMD_ID_MIN, RM_CMD_ID_MAX, GFP_KERNEL);
+	if (id < 0) {
+		vdev_err(rdev->vdev, "Failed to alloc cmd ID: %d", id);
+		ret = id;
+		goto error;
+	}
+	cmd->sq_msg.hdr.id = id;
+
+	init_completion(&cmd->executed);
+
+	*cmd_ptr = cmd;
+	return 0;
+error:
+	kfree(cmd);
+	return ret;
+}
+
+static int rm_queue_verify(struct rm_device *rdev)
+{
+	struct versal_pci_device *vdev = rdev->vdev;
+	struct rm_cmd_cq_identify *result;
+	struct rm_cmd *cmd;
+	u32 major, minor;
+	int ret;
+
+	ret = rm_queue_create_cmd(rdev, RM_QUEUE_OP_IDENTIFY, &cmd);
+	if (ret)
+		return ret;
+
+	ret = rm_queue_send_cmd(cmd, RM_CMD_WAIT_CONFIG_TIMEOUT);
+	if (ret)
+		goto error;
+
+	result = &cmd->cq_msg.data.identify;
+	major = result->major;
+	minor = result->minor;
+	vdev_dbg(vdev, "VMR version %d.%d", major, minor);
+	if (!major) {
+		vdev_err(vdev, "VMR version is unsupported");
+		ret = -EOPNOTSUPP;
+	}
+
+error:
+	rm_queue_destroy_cmd(cmd);
+	return ret;
+}
+
+static int rm_check_apu_status(struct rm_device *rdev, bool *status)
+{
+	struct rm_cmd_cq_control *result;
+	struct rm_cmd *cmd;
+	int ret;
+
+	ret = rm_queue_create_cmd(rdev, RM_QUEUE_OP_VMR_CONTROL, &cmd);
+	if (ret)
+		return ret;
+
+	ret = rm_queue_send_cmd(cmd, RM_CMD_WAIT_CONFIG_TIMEOUT);
+	if (ret)
+		goto error;
+
+	result = &cmd->cq_msg.data.ctrl;
+	*status = FIELD_GET(RM_CMD_VMR_CONTROL_PS_MASK, result->status);
+
+	rm_queue_destroy_cmd(cmd);
+	return 0;
+
+error:
+	rm_queue_destroy_cmd(cmd);
+	return ret;
+}
+
+static int rm_download_apu_fw(struct rm_device *rdev, char *data, ssize_t size)
+{
+	struct rm_cmd *cmd;
+	int ret;
+
+	ret = rm_queue_create_cmd(rdev, RM_QUEUE_OP_LOAD_APU_FW, &cmd);
+	if (ret)
+		return ret;
+
+	ret = rm_queue_data_init(cmd, data, size);
+	if (ret)
+		goto destroy_cmd;
+
+	ret = rm_queue_send_cmd(cmd, RM_CMD_WAIT_DOWNLOAD_TIMEOUT);
+
+destroy_cmd:
+	rm_queue_destroy_cmd(cmd);
+	return ret;
+}
+
+int rm_queue_boot_apu(struct rm_device *rdev)
+{
+	char *bin = "xilinx/xrt-versal-apu.xsabin";
+	const struct firmware *fw = NULL;
+	bool status;
+	int ret;
+
+	ret = rm_check_apu_status(rdev, &status);
+	if (ret) {
+		vdev_err(rdev->vdev, "Failed to get APU status");
+		return ret;
+	}
+
+	if (status) {
+		vdev_dbg(rdev->vdev, "APU online. Skipping APU firmware download");
+		return 0;
+	}
+
+	ret = request_firmware(&fw, bin, &rdev->vdev->pdev->dev);
+	if (ret) {
+		vdev_warn(rdev->vdev, "Request APU firmware %s failed %d", bin, ret);
+		return ret;
+	}
+
+	vdev_dbg(rdev->vdev, "Starting... APU firmware download");
+	ret = rm_download_apu_fw(rdev, (char *)fw->data, fw->size);
+	vdev_dbg(rdev->vdev, "Finished... APU firmware download %d", ret);
+
+	if (ret)
+		vdev_err(rdev->vdev, "Failed to download APU firmware, ret:%d", ret);
+
+	release_firmware(fw);
+
+	return ret;
+}
+
+static void rm_check_health(struct work_struct *w)
+{
+	struct rm_device *rdev = to_rdev_health_monitor(w);
+	u32 max_len = PAGE_SIZE;
+	struct rm_cmd *cmd;
+	int ret;
+
+	ret = rm_queue_create_cmd(rdev, RM_QUEUE_OP_GET_LOG_PAGE, &cmd);
+	if (ret)
+		return;
+
+	ret = rm_queue_payload_init(cmd, RM_CMD_LOG_PAGE_AXI_TRIP_STATUS);
+	if (ret)
+		goto destroy_cmd;
+
+	ret = rm_queue_send_cmd(cmd, RM_CMD_WAIT_CONFIG_TIMEOUT);
+	if (ret == -ETIME || ret == -EINVAL)
+		goto payload_fini;
+
+	if (ret) {
+		u32 log_len = cmd->cq_msg.data.page.len;
+
+		if (log_len > max_len) {
+			vdev_warn(rdev->vdev, "msg size %d is greater than requested %d",
+				  log_len, max_len);
+			log_len = max_len;
+		}
+
+		if (log_len) {
+			char *buffer = vzalloc(log_len);
+
+			if (!buffer)
+				goto payload_fini;
+
+			ret = rm_queue_copy_response(cmd, buffer, log_len);
+			if (ret) {
+				vfree(buffer);
+				goto payload_fini;
+			}
+
+			vdev_warn(rdev->vdev, "%s", buffer);
+			vfree(buffer);
+
+		} else {
+			vdev_err(rdev->vdev, "firewall check ret%d", ret);
+		}
+
+		rdev->firewall_tripped = 1;
+	}
+
+payload_fini:
+	rm_queue_payload_fini(cmd);
+destroy_cmd:
+	rm_queue_destroy_cmd(cmd);
+
+	vdev_dbg(rdev->vdev, "check result: %d", ret);
+}
+
+static void rm_sched_health_check(struct timer_list *t)
+{
+	struct rm_device *rdev = to_rdev_health_timer(t);
+
+	if (rdev->firewall_tripped) {
+		vdev_err(rdev->vdev, "Firewall tripped, health check paused. Please reset card");
+		return;
+	}
+	/* Schedule a work in the general workqueue */
+	schedule_work(&rdev->health_monitor);
+	/* Periodic timer */
+	mod_timer(&rdev->health_timer, jiffies + RM_HEALTH_CHECK_TIMER);
+}
+
+static void rm_uninstall_health_monitor(struct rm_device *rdev)
+{
+	timer_delete_sync(&rdev->health_timer);
+	cancel_work_sync(&rdev->health_monitor);
+}
+
+static void rm_install_health_monitor(struct rm_device *rdev)
+{
+	INIT_WORK(&rdev->health_monitor, &rm_check_health);
+	timer_setup(&rdev->health_timer, &rm_sched_health_check, 0);
+	mod_timer(&rdev->health_timer, jiffies + RM_HEALTH_CHECK_TIMER);
+}
+
+void versal_pci_rm_fini(struct rm_device *rdev)
+{
+	rm_uninstall_health_monitor(rdev);
+	rm_queue_fini(rdev);
+}
+
+struct rm_device *versal_pci_rm_init(struct versal_pci_device *vdev)
+{
+	struct rm_header *header;
+	struct rm_device *rdev;
+	u32 status;
+	int ret;
+
+	rdev = devm_kzalloc(&vdev->pdev->dev, sizeof(*rdev), GFP_KERNEL);
+	if (!rdev)
+		return ERR_PTR(-ENOMEM);
+
+	rdev->vdev = vdev;
+	header = &rdev->rm_metadata;
+
+	rm_shmem_bulk_read(rdev, RM_HDR_OFF, (u32 *)header, sizeof(*header));
+	if (header->magic != RM_HDR_MAGIC_NUM) {
+		vdev_err(vdev, "Invalid RM header 0x%x", header->magic);
+		ret = -ENODEV;
+		goto err;
+	}
+
+	status = rm_shmem_read(rdev, header->status_off);
+	if (!status) {
+		vdev_err(vdev, "RM status is not ready");
+		ret = -ENODEV;
+		goto err;
+	}
+
+	rdev->queue_buffer_size = header->data_end - header->data_start + 1;
+	rdev->queue_buffer_start = header->data_start;
+	rdev->queue_base = header->queue_base;
+
+	ret = rm_queue_init(rdev);
+	if (ret) {
+		vdev_err(vdev, "Failed to init cmd queue, ret %d", ret);
+		ret = -ENODEV;
+		goto err;
+	}
+
+	ret = rm_queue_verify(rdev);
+	if (ret) {
+		vdev_err(vdev, "Failed to verify cmd queue, ret %d", ret);
+		ret = -ENODEV;
+		goto queue_fini;
+	}
+
+	ret = rm_queue_boot_apu(rdev);
+	if (ret) {
+		vdev_err(vdev, "Failed to bringup APU, ret %d", ret);
+		ret = -ENODEV;
+		goto queue_fini;
+	}
+
+	rm_install_health_monitor(rdev);
+
+	return rdev;
+queue_fini:
+	rm_queue_fini(rdev);
+err:
+	return ERR_PTR(ret);
+}
+
+int rm_queue_get_fw_id(struct rm_device *rdev)
+{
+	struct rm_cmd *cmd;
+	int ret;
+
+	ret = rm_queue_create_cmd(rdev, RM_QUEUE_OP_GET_LOG_PAGE, &cmd);
+	if (ret)
+		return ret;
+
+	ret = rm_queue_payload_init(cmd, RM_CMD_LOG_PAGE_FW_ID);
+	if (ret)
+		goto destroy_cmd;
+
+	ret = rm_queue_send_cmd(cmd, RM_CMD_WAIT_CONFIG_TIMEOUT);
+	if (ret)
+		goto payload_fini;
+
+	ret = rm_queue_copy_response(cmd, rdev->vdev->fw_id, sizeof(rdev->vdev->fw_id));
+	if (ret)
+		goto payload_fini;
+
+	vdev_info(rdev->vdev, "fw_id %s", rdev->vdev->fw_id);
+
+payload_fini:
+	rm_queue_payload_fini(cmd);
+destroy_cmd:
+	rm_queue_destroy_cmd(cmd);
+
+	return ret;
+}
diff --git a/drivers/accel/amd_vpci/versal-pci-rm-service.h b/drivers/accel/amd_vpci/versal-pci-rm-service.h
index a16198944e17..487c7ae2a4bc 100644
--- a/drivers/accel/amd_vpci/versal-pci-rm-service.h
+++ b/drivers/accel/amd_vpci/versal-pci-rm-service.h
@@ -206,4 +206,24 @@ struct rm_device {
 	__u32			firewall_tripped;
 };
 
+/* rm service init api */
+struct rm_device *versal_pci_rm_init(struct versal_pci_device *vdev);
+void versal_pci_rm_fini(struct rm_device *rdev);
+
+/* rm services APIs */
+int rm_queue_create_cmd(struct rm_device *rdev, enum rm_queue_opcode opcode,
+			struct rm_cmd **cmd_ptr);
+void rm_queue_destroy_cmd(struct rm_cmd *cmd);
+
+int rm_queue_data_init(struct rm_cmd *cmd, const char *buffer, ssize_t size);
+void rm_queue_data_fini(struct rm_cmd *cmd);
+int rm_queue_get_fw_id(struct rm_device *rdev);
+int rm_queue_boot_apu(struct rm_device *rdev);
+
+/* rm bar register operation APIs */
+u32 rm_reg_read(struct rm_device *rdev, u32 offset);
+void rm_reg_write(struct rm_device *rdev, u32 offset, const u32 value);
+void rm_bulk_reg_read(struct rm_device *rdev, u32 offset, u32 *value, size_t size);
+void rm_bulk_reg_write(struct rm_device *rdev, u32 offset, const void *value, size_t size);
+
 #endif	/* __RM_SERVICE_H */
diff --git a/drivers/accel/amd_vpci/versal-pci.h b/drivers/accel/amd_vpci/versal-pci.h
index be69dda8da73..092cac6afa26 100644
--- a/drivers/accel/amd_vpci/versal-pci.h
+++ b/drivers/accel/amd_vpci/versal-pci.h
@@ -51,6 +51,7 @@ struct fw_info {
 struct versal_pci_device {
 	struct pci_dev			*pdev;
 
+	struct rm_device		*rdev;
 	struct fw_info			fw;
 
 	void __iomem			*io_regs;
-- 
2.34.1

