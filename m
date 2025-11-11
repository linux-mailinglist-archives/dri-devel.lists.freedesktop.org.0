Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C50C4A4DE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 02:16:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A54B10E49A;
	Tue, 11 Nov 2025 01:16:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="SrUegF8X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010042.outbound.protection.outlook.com
 [52.101.193.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C40510E49A
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Nov 2025 01:16:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QnGYUlyvAA6WNdZIQgaIFIuQDpoqF6Cof/0aNwIgjIFUyPSiwtFZRufevzgLFFHO5CiSZhYF2gBGVLOskfjeQBpTQ+p68JpMgMA77mWhLwwcbNVpyBnzOFTM7EHo9wesJs6mQgZ0gU2Wo4ECnoWqKvWgshEHS5h2LA8CH6UmJ3hmIpKEC6pvRPg+8/l7ovOx+71qLDlActCa4rHpNOGDxkXZanBLPHEnI7jOmLariCBVsV8FmcaXLhvsJGt/Lht3Odmd1JcsPn5+e7oixheZ2VIPSWqC6QwmwpyuE6+nDxIJ9XwVppVk92Y9iBM/41kBwdUacQ+e+O/keAWlxr3U3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BB4puUW99E2OaFp5D+o3nY9CxwokDIszycuVDV3r8s=;
 b=ApEmQPIa50ZjeA/JEmMDRDuF9I18DwTzEcP3GSPrvD9k1iX3a0wD+2/xc0sEOvayBYGz4YP9cOA1pPch6WSzURaE+aLmdea1reohMLikSokXN1hbSRgoWc7kcxqVDMng3wyTRT7YESmM603lclxfFKIwmX9LSv4sPdNmZ1nL+I3ZSLvnRsmR982C3TgApFYxG8seqiqQWamltm7tEfi54pW7P9MitaXHYvypwHl3nVvCIjX7T0T6Y9UfqQ0l7zGmILKErSHq6i7eAqXjMsnImm7JwL4mHcdoj4/ZdeadVF51QWQQ2DNtmYiNAdwK6RvOCeQo0Q9zUtihuwt6qFng2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BB4puUW99E2OaFp5D+o3nY9CxwokDIszycuVDV3r8s=;
 b=SrUegF8Xl47139ulyWrvDLrJue4d6LI/a6BoS0kc47/xyf0yadhVxOUZJrArs+rikKv6O9Bn8+G6UxTKTOSIFuqzDyFkhRJsflB3z5sP2SuqZ2uljyXlTxd0X3QSXZux709+eDZVCj8lOOX72r/et3dQPZlR84iY+EO7nIn9VzU=
Received: from SJ0PR03CA0284.namprd03.prod.outlook.com (2603:10b6:a03:39e::19)
 by IA1PR12MB6042.namprd12.prod.outlook.com (2603:10b6:208:3d6::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 01:16:28 +0000
Received: from CO1PEPF000044F5.namprd05.prod.outlook.com
 (2603:10b6:a03:39e:cafe::67) by SJ0PR03CA0284.outlook.office365.com
 (2603:10b6:a03:39e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Tue,
 11 Nov 2025 01:16:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CO1PEPF000044F5.mail.protection.outlook.com (10.167.241.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Tue, 11 Nov 2025 01:16:28 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 10 Nov
 2025 17:16:02 -0800
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 10 Nov
 2025 17:16:02 -0800
Received: from xsjdavidzha51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via
 Frontend Transport; Mon, 10 Nov 2025 17:16:01 -0800
From: David Zhang <yidong.zhang@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: David Zhang <yidong.zhang@amd.com>, <linux-kernel@vger.kernel.org>,
 <sonal.santan@amd.com>, <mario.limonciello@amd.com>, <lizhi.hou@amd.com>,
 Nishad Saraf <nishads@amd.com>
Subject: [PATCH V1 4/5] accel/amd_vpci: Add Remote Management (RM) queue
 service APIs
Date: Mon, 10 Nov 2025 17:15:49 -0800
Message-ID: <20251111011550.439157-5-yidong.zhang@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251111011550.439157-1-yidong.zhang@amd.com>
References: <20251111011550.439157-1-yidong.zhang@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F5:EE_|IA1PR12MB6042:EE_
X-MS-Office365-Filtering-Correlation-Id: f30db8da-451b-4c6c-bf93-08de20bff0d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sqIBuLt+a1SGgKbS7090mb5grvbgu+rZQzIkehKKi5m6m84EY/nyy7Kg5III?=
 =?us-ascii?Q?ifkxL5YpNm7Es3TwN6CvRbDnnN68DqUmGZsZ9m9HH7AaloyJm10VkLV4yWaH?=
 =?us-ascii?Q?mHAcYD7kKFlgSzK3LcLqsifHGzYf0Pg2ITU9P5qtdzSlA8/tp2MGb6ywNOJC?=
 =?us-ascii?Q?ia1fRvntg4h4LtgNmVLu2Nh3OYyQysDAUV05mPgoSS/g0ChydW3zn6SaR9LR?=
 =?us-ascii?Q?oRhhupuMlzDSzIdwvwvEn/4GwEDZeeFJIIcEdjMX5BCQFkhdxMlUI4LOnKl8?=
 =?us-ascii?Q?mroPpOfkIcwthgHpUtwA/qZ/qihH22+fnmSYNWA0jb4Ii1p+mqRe2bg4QGsb?=
 =?us-ascii?Q?Ef63pGYjICQLnhBfQTeKOTWg0+K1243gxUnyLGVe2jKMCSOPVL5Uc61D8MYm?=
 =?us-ascii?Q?cKhuKI4uJK8E3rbvG4hbPI5zTYor3ZKFUIn6PPhi0k8wzgnT+pp6IUDUE1ov?=
 =?us-ascii?Q?KgH6SHS2GrWf/7hw419DgoQqoxv0VQ2JsIb0OqYQpnK77rttyL6bsgfuBLCp?=
 =?us-ascii?Q?AROBs5DcaKBTCeTBnqi0QN9kPSjlKYZsfU7pSJcLFJ1anyLAp2ap13/lf/kq?=
 =?us-ascii?Q?dLS5P4Ln/j4LV+Io4iDjMEQtu2StLooKpzazyZhA8yLCcI7gw+4ddeBiJfIe?=
 =?us-ascii?Q?HioOJS3zoOCb9wOPBZ5ed/PaVe+IWmqixhaqV7fZ5IGclq26S5hK90mDLI/z?=
 =?us-ascii?Q?ViUFaIPFs5doFHctZKJ9BmqEyb8tRubWgvbC58E3Cn3MfGW8za9acAqKiCH5?=
 =?us-ascii?Q?yXSux7z8XwTMtC73O0/ZF3murf7GFbTlG8aaMENt4s4TOFV1C6xPwGKI7r2P?=
 =?us-ascii?Q?wWuy9HmeaU7mWpWBsvQAB68i7tLUMFDCYtj2mhAeTptny8qeBcYi7OxM+hVt?=
 =?us-ascii?Q?GH5C/JEamog3pTbuZ0MJ7pNOveUl7QVFKxSiRWFZQUp/SuG/pm+hH/Mqq4ls?=
 =?us-ascii?Q?oOJsU/2e6NmfC+UaeCSzPqpIkM3rrd1SXybwbWEH9Y7T0XfrmAm3LEg6rG9k?=
 =?us-ascii?Q?urjNreWWQB2r6P9X0qXCsUtLUS39EfXTaPl3t1vAV98UynSo9lsh3SCCP/JL?=
 =?us-ascii?Q?3p9z+XVF2JSv7ibXpEimSQlpMY4/SdQodfy5UUcGvbK+0h+I7tl8SwxSnrT8?=
 =?us-ascii?Q?Pw3hymRTGlurgrVomLgUvkV016g857HSMl5prFCoz7+kaDbuHz8qen9C0Md1?=
 =?us-ascii?Q?DSyImwyj9sskfWKWfY1ZwmSZKy0dJ9kysqSWL2eAFa729uWQaW6+IIL8vLl2?=
 =?us-ascii?Q?w+yuYaBR1k35xn7GzmVhllL2JnVgUwTsC6V+OaeCYM2YrUsxfUb8w3mN631N?=
 =?us-ascii?Q?cI80cMrpVRlxl1cMf2wvLi5jtU6GDszxh4src+8zqiSCPUN7f/MPLDjmSmUn?=
 =?us-ascii?Q?DRGHAHVZzrWZ/YVkEKi5ROdozvkLbOpbin/xjy+k7EdkMhnrprDjADFnmm6b?=
 =?us-ascii?Q?zPJtGznhxv0xP1qT1WiGqGBRaCxxYFKG2wbRJVSWw4cjlkGjPT71KOizyWa8?=
 =?us-ascii?Q?CRT7WVUoMEWRjzhB/nW2gQ24b+Kf6Hcnybh5a1FX46ns+RjK7hLQS8X8a1kh?=
 =?us-ascii?Q?+LyAfzw9/etuhN16I2s=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 01:16:28.3163 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f30db8da-451b-4c6c-bf93-08de20bff0d4
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6042
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
index 4172f7ac9bd1..426651739a19 100644
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
 
 	return ret;
 }
diff --git a/drivers/accel/amd_vpci/versal-pci-rm-queue.c b/drivers/accel/amd_vpci/versal-pci-rm-queue.c
index e67c506af752..623ec4472f17 100644
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
index 000000000000..e01f5c9e6562
--- /dev/null
+++ b/drivers/accel/amd_vpci/versal-pci-rm-service.c
@@ -0,0 +1,497 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for Versal PCIe device
+ *
+ * Copyright (C) 2025 Advanced Micro Devices, Inc. All rights reserved.
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
+			vdev_err(rdev->vdev, "%s", buffer);
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
+		vdev_err(vdev, "RM status %d is not ready", status);
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
index d2397a1a672c..57333bb1443c 100644
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
index 33f0ef881a33..89f3590137ce 100644
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

