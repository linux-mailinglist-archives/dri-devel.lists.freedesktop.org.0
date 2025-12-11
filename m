Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCD5CB6D54
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 18:58:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9AC510E859;
	Thu, 11 Dec 2025 17:58:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="AYJ2FMlp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013005.outbound.protection.outlook.com
 [40.93.196.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2C810E859
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 17:58:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AA6bKePi5QUQ2sL1Bq+Qztb5L9i1rO2iwDDFzt2ktjdb849dLa32w48vhUtKUIPfaaCDk4dtPzwZa5vGWr6uO702K3Utmnw8ILS9R8q7Tcb2RnRj9LnDNNzDU9rp/UuAb7OSfxuqcgxjutwHvc4h9Osctajt4nonX0C6Ju7TlX3j1YoPMpYWWHaztAO5P+xt13xLsMGtd38vLkmd59DiNpiW+QYb972G5a1baRlsj2nPztwz2l4X6punQA3/jXPPTQ1R6lxEsAMBigxX+Y4Gpt67+KWYr4dflas7s6PTWZuCUaoN70LgXQI9kiYRMwrGD93JxulMXWs9R60Ovcb8fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Nrx9Fj1jc4ylKMfgokiq0E+n14DdC3l0yR/p1FlTZU=;
 b=gzgoHuI1SmjIMp/28ijOrIAS3UvwTedyyfmLCrXTKasu7YZVXL4+ysVAHassOfDPelfFVm5fe3/t79fX8rUEEm1xPw2ws7qlsssCP9UHDAGdiSTnsrkwiQbXrK6ytRJ38fajq6m1Ssu1TU85wggARYuRM+GMHT7EH5UMVjxESifgE7wIZ38fHMQWy8onSdS4Z0PMlGVPETtMgYKo7iKq81pgWPNcxw5wSIWJCLoGbM0qqgkCzrd2PbxIElL67LQF3EhQXGQ3RHvsuPtyAkOSautVlesPr0RYTRskWEjaPagn/RPgpm1+3NvUmdVk56HGbxBBi6rG9ET+JSgvpdC6Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Nrx9Fj1jc4ylKMfgokiq0E+n14DdC3l0yR/p1FlTZU=;
 b=AYJ2FMlpHR+F1GRuZZrOQUs6dIAYhNMvbIGfDU8UJaGuA8ePb8HFTebgZF8u8KyeWmz+SYH/Ki8rYogtBgFdjkGqr/TGQuhCpyq3TcV8RbTJafEE3O5jqOp4PwgI+85s+1ImnAzUuPAv42ywAfivelHKcWEjk29mtKAH0lzISY0=
Received: from SJ0PR05CA0062.namprd05.prod.outlook.com (2603:10b6:a03:332::7)
 by BY5PR12MB4257.namprd12.prod.outlook.com (2603:10b6:a03:20f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 17:58:41 +0000
Received: from SJ1PEPF000023D1.namprd02.prod.outlook.com
 (2603:10b6:a03:332:cafe::72) by SJ0PR05CA0062.outlook.office365.com
 (2603:10b6:a03:332::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.5 via Frontend Transport; Thu,
 11 Dec 2025 17:58:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023D1.mail.protection.outlook.com (10.167.244.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 17:58:40 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Thu, 11 Dec
 2025 11:58:37 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 11 Dec
 2025 11:58:36 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 11 Dec 2025 09:58:36 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ilpo.jarvinen@linux.intel.com>, <hansg@kernel.org>, <ogabbay@kernel.org>, 
 <quic_jhugo@quicinc.com>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>,
 <platform-driver-x86@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Shyam-sundar.S-k@amd.com>, <VinitKumar.Shukla@amd.com>
Subject: [PATCH V2 2/2] accel/amdxdna: Add IOCTL to retrieve realtime NPU
 power estimate
Date: Thu, 11 Dec 2025 09:58:02 -0800
Message-ID: <20251211175802.1760860-3-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251211175802.1760860-1-lizhi.hou@amd.com>
References: <20251211175802.1760860-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D1:EE_|BY5PR12MB4257:EE_
X-MS-Office365-Filtering-Correlation-Id: a50778ae-26ff-4ee2-cd05-08de38deead9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Uy3bf8YzsXEr+z0Qv0IO0MtSa/uGvb+SmUSAXlbLil7s0PzVEo6YEQetLGb8?=
 =?us-ascii?Q?dj6ARJOG7MBBwvwUFiFXWY/J5Z06K9fO57uwncZqt2tii8IQFrK0D8ZpNOk+?=
 =?us-ascii?Q?YsRpK2J9TPPBlRr8qpymys0xi9NbK+IkId3bgXzwnFa5dpJ9SSi8MypLojOm?=
 =?us-ascii?Q?PjHALbHLD+RS7Rp5ZTIyMXgQM9ke91l00ku15uXqWMrhR1/IBDNElmctcBa/?=
 =?us-ascii?Q?NhYOJ4vPCXzOPo3rkTK9tbw+bjoZTxvmKpzkU16qN9Ukl9aT46TaJBoAYE/G?=
 =?us-ascii?Q?ysA0U73TYxshozNoi0gEMhM6n1aPtbSbrYCH2dteTzjrI+QMVvCecAiHK5up?=
 =?us-ascii?Q?51cszpuyxUhEh/e2SaMtHJBFJ/C7gQkeMnN28VDpHIHd5VTyKQ0EtNn7JbCV?=
 =?us-ascii?Q?/jfM2bm55i66A3A29XeehzCj740gs1mQ8h8CawumukL171ptG++onCOiuKl3?=
 =?us-ascii?Q?NQcEwXrxFoIQ79QKe/e7B0Yfys/Z0504zYTADIp0GRBdkKBdwLzOQLVMsY1R?=
 =?us-ascii?Q?AC67lzF2IbNqBhBGQIlRiHvpnk+D0OHqojTR2HFJPj+83nPpOuyU415fbypZ?=
 =?us-ascii?Q?TuTt8RqatWTjumoNmiVi6V/zPvf1QA+OVtLMuHEHJ2RU1OJDG0931OfcdOVb?=
 =?us-ascii?Q?N7mIhEuhBWUI9RI7LbZXRPwe9rUKmaqVgdhHFKLnArNYBLpbW/QoAOrOnWMX?=
 =?us-ascii?Q?6EV6UxQvTlvTi8H+8qiCE9kOndL9BRXFKctfv2w8iY0RCA7i2NrTeMwCGri4?=
 =?us-ascii?Q?zTOH8DlILvX96gw1TezhJ4V1JKKTQ/uQ4rzafiatYTMoXWspLEDAICPqrboU?=
 =?us-ascii?Q?EWpVI1qudDzYjDeN8j6NgqVQ4oEDzPs11Jkv4b8AVmgJSNYBwcUPco0WIQLK?=
 =?us-ascii?Q?KkYLaXe+y8PIefSk7+Hk3LgzecOBj0iJd/aLU8pJ2rU+CuWbswm0OzZtWxzC?=
 =?us-ascii?Q?R6WCmm5/ADWyzrbpqACqTX9qwMjAUBnMZUQwxPq8bd+npsMZjuvkxIGOJiXl?=
 =?us-ascii?Q?LvgC9otMlZOsq6l/zdPE1tv4lRsoCjL+i3mxpPR1BovMrWWn+28epcmZVOZO?=
 =?us-ascii?Q?yLkjvDB7IFKNu0YKFnCB7FBURm7vGtpJEOsS79w4KV+/ZVkzoQVhkUgpcDsU?=
 =?us-ascii?Q?5QXDwkqkh4of7lx8ljrtFDiZsuE6bfU6gpIqJeqret3pVMZy2ubnnYkAY60Y?=
 =?us-ascii?Q?FPjbsKwUHP2F8jgl8TS7BwrIqIjcbElOkUJgNa56iXuHtv2cdxRNG2aL5BrC?=
 =?us-ascii?Q?2R4pZGqQgGL7WtIUtcmOCRi3/r0iL909XiAy+38IAbJXU6vdvC3g7kfzpxNs?=
 =?us-ascii?Q?gG+0oFcQs0hoCUue3BNGE5YL970/MaA/kcwNEnKRE6W9diPnkrvGzXHaGMRj?=
 =?us-ascii?Q?szygl406DBn1uWXqiFCa8KrbaaD5nCCoEdgms4IFv+y57j7IBDPYKexFsNSb?=
 =?us-ascii?Q?+dgtgZriC/Fkki6t64ktEVVHYGrl/OYL35umynJAtYeyEZJs8hSovfbHcwy1?=
 =?us-ascii?Q?3/M3FEDw67SFRP2dx97N3floh/iUH0dop5KtHVeNhC3JCuC7AbIZC/75vX6Z?=
 =?us-ascii?Q?t7xxXVX5pNTJWBoeXCc=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 17:58:40.5891 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a50778ae-26ff-4ee2-cd05-08de38deead9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D1.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4257
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

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_pci.c        | 29 +++++++++++++++++++++++++
 drivers/accel/amdxdna/aie2_pci.h        | 18 +++++++++++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 ++-
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 81a8e4137bfd..4a2c7addcd79 100644
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
+	struct amdxdna_drm_query_sensor sensor = { 0 };
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
+	snprintf(sensor.label, sizeof(sensor.label), "Total Power");
+	snprintf(sensor.units, sizeof(sensor.units), "mW");
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
index c6b5cf4ae5c4..edf6f2e00dea 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -46,6 +46,24 @@
 	pci_resource_len(NDEV2PDEV(_ndev), (_ndev)->xdna->dev_info->mbox_bar); \
 })
 
+#if IS_ENABLED(CONFIG_AMD_PMF)
+#define AIE2_GET_PMF_NPU_DATA(field, val) \
+({ \
+	struct amd_pmf_npu_metrics _npu_metrics; \
+	int _ret; \
+	_ret = amd_pmf_get_npu_data(&_npu_metrics); \
+	val = _ret ? U32_MAX : _npu_metrics.field; \
+	(_ret); \
+})
+#else
+#define SENSOR_DEFAULT_npu_power	U32_MAX
+#define AIE2_GET_PMF_NPU_DATA(field, val) \
+({ \
+	val = SENSOR_DEFAULT_##field; \
+	(-EOPNOTSUPP); \
+})
+#endif
+
 enum aie2_smu_reg_idx {
 	SMU_CMD_REG = 0,
 	SMU_ARG_REG,
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 1973ab67721b..643ebd387074 100644
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

