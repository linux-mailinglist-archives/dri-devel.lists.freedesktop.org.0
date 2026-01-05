Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A43ACF5005
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 18:30:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9586F10E3D5;
	Mon,  5 Jan 2026 17:30:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="fPSA72U2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011034.outbound.protection.outlook.com [52.101.62.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416DD10E2D5
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 17:30:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JYeN2Ycw2M5oc4m2sxgUo3UhPuERu8TT8fNFo6MSwuB3NLs3q4Rz4YWyXDHffl9BQ9X52cN9ytCxrTcI64A3awkflVyZDkq22hKkpineS4R8contV9S8O1vav9T+GlzmwWGpLYr+fjO4AfZa/k/b9IRYwNsmQEQsZ5isbyTDZeMapFjg7v+S5Ye1rOxDf7gSZki52a2ZBT5X1tTLoeyc/NkfcYZhLTY2F/FVp7k6C1/ZJVLIjxguSfKTn4oHFYCHxH15CEPT9a98ppo+LBILJgGcVzqXKKQn+jaF8DP/A6tdrpkzoOU4342p2AGa1P/CEJoKlVfAqdy64y3lkuSGPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CeKbXscoyOKJY4pSNOMSKDZR8whD3MzQEcp0DuFtYg=;
 b=WDNkHaaEqgDonAcaooWyDHK3XyEcy5SWqGs10AZqIGVPmraBhQqJ8yQAoa6AxPvmfGekLCFJwweYHfydc1BDlMuyisdB9Cw6U+8KGjyj6QSg8lxyDAEgy6ikhBhB/tZK9/qzkxImcD8iFzgWWejuxiE8PA+haozQrCh1IMk8bzcYtrEN2NcoQ2PGm7Mt5kB+mUkyyBEZZ4mPPvGOYziR2FPb1jz0t9vjcdvihcxL9h1QMcVtKLykn60rTPPoNWlXNHxQyInvkudnTWyvS3Eviv4ZXpBBBJARjIi0dq/pMHIDd143KqCbrLU04LlrtpLtiIqNagbiUUfkHFmC/IW0Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CeKbXscoyOKJY4pSNOMSKDZR8whD3MzQEcp0DuFtYg=;
 b=fPSA72U2za7Kodo9Rk/ktkOLxdmMqRAxK6+N0WHMny2lsg3keS/Hn0/NyJo05e4JwMvErpIZJRW7gT+EPj/3Re8bPmtMTeezCS+XqJQ536Vo2AgaA/HrNct4DO23XYUU7cPVsrA4pe9udnBtPwps5TwUfE/tGODan+Z5eVjeclo=
Received: from MW4PR04CA0131.namprd04.prod.outlook.com (2603:10b6:303:84::16)
 by PH7PR12MB6834.namprd12.prod.outlook.com (2603:10b6:510:1b4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Mon, 5 Jan
 2026 17:30:18 +0000
Received: from CO1PEPF000044FA.namprd21.prod.outlook.com
 (2603:10b6:303:84:cafe::53) by MW4PR04CA0131.outlook.office365.com
 (2603:10b6:303:84::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Mon, 5
 Jan 2026 17:30:16 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CO1PEPF000044FA.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.0 via Frontend Transport; Mon, 5 Jan 2026 17:30:17 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 5 Jan
 2026 11:30:09 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 5 Jan 2026 09:30:08 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <ilpo.jarvinen@linux.intel.com>,
 <hansg@kernel.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <mario.limonciello@amd.com>, <platform-driver-x86@vger.kernel.org>,
 <Shyam-sundar.S-k@amd.com>, <VinitKumar.Shukla@amd.com>, Mario Limonciello
 <superm1@kernel.org>
Subject: [PATCH V3 2/2] accel/amdxdna: Add IOCTL to retrieve realtime NPU
 power estimate
Date: Mon, 5 Jan 2026 09:29:56 -0800
Message-ID: <20260105172956.3732123-3-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105172956.3732123-1-lizhi.hou@amd.com>
References: <20260105172956.3732123-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044FA:EE_|PH7PR12MB6834:EE_
X-MS-Office365-Filtering-Correlation-Id: d15906cd-b725-4b1f-090e-08de4c80184a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gRGCxTsYtvhXZs22MkeUti8IX8znkxoLEcD8+5GjCWGKi8QNLVW55NtCxJJa?=
 =?us-ascii?Q?45tt/QVDpY2RiQy00NhJdbgrfV+DiNXtbjKtwC2C4CYEtlBhV8jmcB7tcVrv?=
 =?us-ascii?Q?0TebKijUvhqUp0fMZ3zMpcTblBsyJohNQQgAx0i3OIxE0+8Z5ueUdPkUXLxw?=
 =?us-ascii?Q?q9qsXNQEh2BGvM4yl4hsbOYhtY59WfxpII4ufnFYBZT66Sxi8JOx3M++8W7a?=
 =?us-ascii?Q?uRTPLXflC6J3vftxvP+LybBsX+GGQuQxtz2tIw9cEPngfD0CkXZAZ6kyk0nh?=
 =?us-ascii?Q?uqlJm5X2kgIryKvvOg6jl43Kg77DC0ZpJLND6MI+qG9ZD0j1gOsqgfOPq01A?=
 =?us-ascii?Q?k828/IGIkzRzcCOcskbsnZjrw3xUOSuu0gOJVgmpC+E01mEQNC1RkZwsGGKG?=
 =?us-ascii?Q?k/5/IMeuXAfYMDZrIbL1xAYb0cSqHWyibtyeZ8HU46i4PyFCQuOyM9lXEBYf?=
 =?us-ascii?Q?lqIf6swig67yuKe6uJRUDnnwm3iJEQCXacjOCYUxVgcAcihJIa0blE2hzBcL?=
 =?us-ascii?Q?599XNgihJoAgHDPpmDv+xrx0x+ZxLNKpTmONKtlVOGRjQGzS1deMv2kncPtR?=
 =?us-ascii?Q?5bUe3oXl60n6RMMxV/DSaCVtDgtVpkcnbtvPsfGiUUOjdnHuFYZxhYfr1ncF?=
 =?us-ascii?Q?C1cholxJWAuE9Wn69bKRPujcBvQ9jbKGoyC/pVCd5L2oHNE4WZ1Fl6gGLZc5?=
 =?us-ascii?Q?v9NmTQQIbA74v9W2q1DfHUnzHVFy6aWnNdu/q6dX9k3/KUvVIOMlPQmNPNJa?=
 =?us-ascii?Q?o8BZ2ttCG1h93Kh3cqG8NT4G9erKbcEv+ada5XSnsQoy/PxaKGaA4+jBRiwC?=
 =?us-ascii?Q?B6hyeGdlVMRkx9be8mYq1dRALy1NvsNvKnwRIgdKgvN6wjTwbRaOnOE3aCbj?=
 =?us-ascii?Q?SAJelETV9P2JpYYb4oRQPF13CEbazjwHNc9UxRpqFJCEMlsx9YQOZbOrGiz5?=
 =?us-ascii?Q?/AD00aiOZTbiuHKMlXWakD/OOd0ph6UbAWMIKSUVNh1Xbhs6tgEgJgmgg3Iu?=
 =?us-ascii?Q?G2PZDrCVfa0Iiqz3ogL9zV92DYma8swA3yurZmMU4+PEcTzFOZp6VgK/8b0e?=
 =?us-ascii?Q?8JFtOPkCHBvgKs/Xa9g8pp13Ua/RODlO9CNGhD8KRKMudl8IZhfSREfeLUaC?=
 =?us-ascii?Q?8bBOZ/L6adN92t0x3n0MpLq+2f3Fr+8pVS60qAvSMvsC8QOpdmwLKUwj+vKf?=
 =?us-ascii?Q?/rVpcPu11zp2ExQ2kGB8jXsdnjCAGcqYrBQm9tzM8jWhaoiEjB4rqNDKnq+X?=
 =?us-ascii?Q?9yWAmri+0BcbT1N8MqHXbdHXMYSoRzWR6/cO1Nxl9oCKsHbmiKAX0YX6bSrU?=
 =?us-ascii?Q?kobNaVf3OKe7+WM2mHrfdspSXv2TmxfPgPotwLaMot8DXg8tiL8vcRjKYCTp?=
 =?us-ascii?Q?bSeG18PFsRoU9oeGDDTC3vvMjbGbAxhtjnZSVddtwzHmkbCBeCHhpsS8SukU?=
 =?us-ascii?Q?nXxyQPoX/7aBQUBLDy+NchfQ6Gw8KyCWxtG0U2YaCvlpfL1E7hEXvVNvaKX1?=
 =?us-ascii?Q?mS87S40GT52ZNkP5hPuNicMRTORE8BoxRZkIDYiIlFhpQ5nx7YUeskcBS6Rt?=
 =?us-ascii?Q?du52OOB3LZxBhxzX0rM=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2026 17:30:17.9455 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d15906cd-b725-4b1f-090e-08de4c80184a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044FA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6834
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

The AMD PMF driver provides an interface to obtain realtime power
estimates for the NPU. Expose this information to userspace through a
new DRM_IOCTL_AMDXDNA_GET_INFO parameter, allowing applications to query
the current NPU power level.

Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_pci.c        | 29 +++++++++++++++++++++++++
 drivers/accel/amdxdna/aie2_pci.h        | 20 +++++++++++++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 ++-
 3 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 81a8e4137bfd..55fbc8f0f455 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -10,6 +10,7 @@
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 #include <drm/gpu_scheduler.h>
+#include <linux/amd-pmf-io.h>
 #include <linux/cleanup.h>
 #include <linux/errno.h>
 #include <linux/firmware.h>
@@ -777,6 +778,31 @@ static int aie2_get_clock_metadata(struct amdxdna_client *client,
 	return ret;
 }
 
+static int aie2_get_sensors(struct amdxdna_client *client,
+			    struct amdxdna_drm_get_info *args)
+{
+	struct amdxdna_drm_query_sensor sensor = {};
+	int ret;
+
+	if (args->buffer_size < sizeof(sensor))
+		return -EINVAL;
+
+	ret = AIE2_GET_PMF_NPU_DATA(npu_power, sensor.input);
+	if (ret)
+		return ret;
+	sensor.type = AMDXDNA_SENSOR_TYPE_POWER;
+	sensor.unitm = -3;
+	scnprintf(sensor.label, sizeof(sensor.label), "Total Power");
+	scnprintf(sensor.units, sizeof(sensor.units), "mW");
+
+	if (copy_to_user(u64_to_user_ptr(args->buffer), &sensor, sizeof(sensor)))
+		return -EFAULT;
+
+	args->buffer_size = sizeof(sensor);
+
+	return 0;
+}
+
 static int aie2_hwctx_status_cb(struct amdxdna_hwctx *hwctx, void *arg)
 {
 	struct amdxdna_drm_hwctx_entry *tmp __free(kfree) = NULL;
@@ -980,6 +1006,9 @@ static int aie2_get_info(struct amdxdna_client *client, struct amdxdna_drm_get_i
 	case DRM_AMDXDNA_QUERY_CLOCK_METADATA:
 		ret = aie2_get_clock_metadata(client, args);
 		break;
+	case DRM_AMDXDNA_QUERY_SENSORS:
+		ret = aie2_get_sensors(client, args);
+		break;
 	case DRM_AMDXDNA_QUERY_HW_CONTEXTS:
 		ret = aie2_get_hwctx_status(client, args);
 		break;
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index a929fa98a121..08122c249009 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -7,6 +7,7 @@
 #define _AIE2_PCI_H_
 
 #include <drm/amdxdna_accel.h>
+#include <linux/limits.h>
 #include <linux/semaphore.h>
 
 #include "amdxdna_mailbox.h"
@@ -46,6 +47,25 @@
 	pci_resource_len(NDEV2PDEV(_ndev), (_ndev)->xdna->dev_info->mbox_bar); \
 })
 
+#if IS_ENABLED(CONFIG_AMD_PMF)
+#define AIE2_GET_PMF_NPU_DATA(field, val)				\
+({									\
+	struct amd_pmf_npu_metrics _npu_metrics;			\
+	int _ret;							\
+									\
+	_ret = amd_pmf_get_npu_data(&_npu_metrics);			\
+	val = _ret ? U32_MAX : _npu_metrics.field;			\
+	(_ret);								\
+})
+#else
+#define SENSOR_DEFAULT_npu_power	U32_MAX
+#define AIE2_GET_PMF_NPU_DATA(field, val)				\
+({									\
+	val = SENSOR_DEFAULT_##field;					\
+	(-EOPNOTSUPP);							\
+})
+#endif
+
 enum aie2_smu_reg_idx {
 	SMU_CMD_REG = 0,
 	SMU_ARG_REG,
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 7d59764d7869..053f72a31a5f 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -32,9 +32,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
  * 0.4: Support getting resource information
  * 0.5: Support getting telemetry data
  * 0.6: Support preemption
+ * 0.7: Support getting power data
  */
 #define AMDXDNA_DRIVER_MAJOR		0
-#define AMDXDNA_DRIVER_MINOR		6
+#define AMDXDNA_DRIVER_MINOR		7
 
 /*
  * Bind the driver base on (vendor_id, device_id) pair and later use the
-- 
2.34.1

