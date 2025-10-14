Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B53BDABA6
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 19:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 662B510E668;
	Tue, 14 Oct 2025 17:01:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="M6PahAl/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010018.outbound.protection.outlook.com
 [52.101.193.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E83AB10E668
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 17:01:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZL5kXfvrODxuoBGWbvME6Im9zXSttvJdF9DBAfWxrz7bVfxykipnagZK4JDvX63eeSz/ShkLvZ/MB4yY1eW0JxUoLX2HqXHT6j2j8bj87Xmj2mKMjvuE5kidENZ8C4WatQwFi5CODeTll4dp/vsYPsL8FMrusRZFzljcBzqGSOc773EP42q7OiBUKXhTm5CD80h77WTYvq7Qw2WYNf+6A+LCCAdd8CXffjwXx+P4+JyC+2sbC6iqc+DRlH3Tg7MEZGFXxpkydIjuWgbmAPXQkXQoS74JkBUXmvkss5ys7WupwTHnR2o9t33Za4t+590osdQ9wLk7lv6zq1w2oCjM4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8KH7eLeZyB3+CZbNT8mOscxZ5dGoNgmqW07Gg+4WyyE=;
 b=RtqtsPhCy9mzgAQa5faHtj3yXArXuNY2BP5xo8//GtP0HWvrC48pVV5evkHIBHac8J+mTkUgKvhA/t3tvKGic4fUCZZEu/GFgjfOmkJSJ8LqN5vxAkaSVqoHnABorCu9BhPimWyDCPMHSDQCSBXNrc6yoMHCym0xa0+LbX12w6YsiYCm34OnKDL2Bj3ki3hVHBMWYFGt9dDgb4V/JEC0THuPoICKao2Bml36URHzB6NL39T1jPfnwvVi2pIbkIJRfLDIM/jF3jqoMezFqLkRleP9j47L8C75qb1z8RuShA8WNdwgDfuM3k8MSLFO2f/Ez/c62AJd4mgjXbt685v9Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8KH7eLeZyB3+CZbNT8mOscxZ5dGoNgmqW07Gg+4WyyE=;
 b=M6PahAl/A8TAbpFyjaf9h65GwTDYxE0Ffh/R9Gj1/o2X0Bj6WNPAc4JUR1XQePo8xouuzil4yKTieozZVwuHacGWjRS4mdrMvnSGZ0kZMfYkrb2io0DDzw28wFUPYeRmRBOEROX/Kgw4zxitd1ZhiikPM1x40r6FLSFnQPBAcrs=
Received: from BY3PR05CA0019.namprd05.prod.outlook.com (2603:10b6:a03:254::24)
 by DM6PR12MB4251.namprd12.prod.outlook.com (2603:10b6:5:21e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Tue, 14 Oct
 2025 17:01:38 +0000
Received: from SJ1PEPF000023D0.namprd02.prod.outlook.com
 (2603:10b6:a03:254:cafe::8e) by BY3PR05CA0019.outlook.office365.com
 (2603:10b6:a03:254::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Tue,
 14 Oct 2025 17:01:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023D0.mail.protection.outlook.com (10.167.244.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 17:01:38 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 14 Oct
 2025 10:01:37 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 14 Oct
 2025 10:01:37 -0700
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 14 Oct 2025 10:01:36 -0700
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Support getting last hardware error
Date: Tue, 14 Oct 2025 10:01:30 -0700
Message-ID: <20251014170130.601390-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D0:EE_|DM6PR12MB4251:EE_
X-MS-Office365-Filtering-Correlation-Id: ba01bea5-a396-4847-3396-08de0b4356f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xMdxesgWrxKCZxhCG7la1xWC2XAOnU2pJotYwRS5w8iFsrL6AE0TFXRqIu4e?=
 =?us-ascii?Q?wnqYBPoO9Mi45mscxkZsjrYvVWHEOJU2qi1PpsnKwaOkPRbCJNB7wMQPB7Fx?=
 =?us-ascii?Q?YW1k729BrPvjNSw6Xl7VVfnQV2vC6OY0J8aRTSWZfgXaapuA19nQsKqCypUX?=
 =?us-ascii?Q?4ppugY7vefilTZCF+fuXzKHnxlYzgGwh62xvecBtNrFTYNi9GURE9UqdW2xf?=
 =?us-ascii?Q?f5oEX4/FtWhedBCFj+bmlVoEGRNUL6A0HGyBfZr+GwvulW13ancymBKAlUZ9?=
 =?us-ascii?Q?eF8SI/3lxityC3GrRj7IF8v5lpRnQctJDNsOW6djKw9rW34w5iEwo4RNyhu0?=
 =?us-ascii?Q?gs/R8ss5tNBFz6LZMw/TqbeMd4zinjz/rSOUxsA5+vfTQRhfWxVpucJazyqN?=
 =?us-ascii?Q?qGQ46MNA08DbjkKqHvRjFFQrL8oozYDGML/4t7QDvtdN1Olclahv6wjWsh38?=
 =?us-ascii?Q?+03jPx/gKqzrwVfQRVcJXEZdbv39rhLf9xV223He92ls6XduNS31QRUEnj8l?=
 =?us-ascii?Q?7xo5zv87gYVd3KtQWs18jRdcAFOJq7yyruiIpwI9WJtzU8oms2bSaw3OcI4/?=
 =?us-ascii?Q?5QXNNja4n/9PyHNgzoMDNZYEZRFE9jz8GW0tIyrhsHTXFBou/zi8ru8wbSrC?=
 =?us-ascii?Q?iihq7gB8WpAYbYg+UtCxIyGtxg1aMC5oaDOmG1tvn2yNdwTJEVfpE8mZ6Gm4?=
 =?us-ascii?Q?TSEQnz7kNHqeRUAQa4mJBwx7EOSOnejrQEl7WAchk6l0jo8WF0yCgesX1Kpv?=
 =?us-ascii?Q?mlJv5ESAUDRL2dic10VEUcIt+9Fzy62qXDbi+QKVMkLr6dmHQhzCEKjUJ4BP?=
 =?us-ascii?Q?79HOrJ4a/utdaydAsDqHENbh7RXNV5nm/PrXod9t7914+Y5IqwTGrrFAXmnI?=
 =?us-ascii?Q?AhWFPjAFlZpvA8vmbBtD/wnqYCskkshMtRMVio2ijHdr210BfbsLQe2pMX0n?=
 =?us-ascii?Q?kso9IOtQbGa8Iu3sCZATWGPCoanpc/vU+9ohm6ZD2x8JANDS670epGx2UI6m?=
 =?us-ascii?Q?Ckon/YwEzdUc8yDOmX681jPrMpWCdl3vX8GKl4yyhS9QETSdr8b4FlsmJuKs?=
 =?us-ascii?Q?/wepxEx8TO7HoFR/iyVOLnEC90QCw0Ky9xgPdAd2OS4plP8jLWYtpWyp7qP+?=
 =?us-ascii?Q?tfCz5rcI5aPeTRURNxaHSAjszKuP26PWEFw8hbzetMgO1/V5BPtHTGUs6mwv?=
 =?us-ascii?Q?7ESu4l4D61WinRd67wvDQ37KhvYVjj+VUpFs02uFlBF1np8vPEo2G+Pao1WN?=
 =?us-ascii?Q?N+O1/vVRxvk+m8o3J6vMtwETJ0gYGv7v3JibJP3iGUAJMD5TtqBoGHQ4xctF?=
 =?us-ascii?Q?cU4wWtM4ny6q8HS/YbHbsLbvULCj8sgt550N+YW3BwdBEqGv0EdOdI+TwwiN?=
 =?us-ascii?Q?FKGKvzW08lVHPS/22WdK4JlE1zZPUJLyjahhumvrJ7DX9hDeUG7Pp55yl3pb?=
 =?us-ascii?Q?9s5pAIhRwsvAxjJv1q7hw/3fojpKRNMOihvRnKltRfRNn3ZZ2++K+87vs7iI?=
 =?us-ascii?Q?g0njzmLKZoFQPZh/cOp8Jv8z1+f8W0ulHkAWXWiHRI15FGe80+mf8s9LGv87?=
 =?us-ascii?Q?pUok03IpM0I93vbaaTA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 17:01:38.1242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba01bea5-a396-4847-3396-08de0b4356f3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4251
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

Add new parameter DRM_AMDXDNA_HW_LAST_ASYNC_ERR to get array IOCTL. When
hardware reports an error, the driver save the error information and
timestamp. This new get array parameter retrieves the last error.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_error.c      | 91 ++++++++++++++++++++-----
 drivers/accel/amdxdna/aie2_pci.c        |  3 +
 drivers/accel/amdxdna/aie2_pci.h        |  5 +-
 drivers/accel/amdxdna/amdxdna_error.h   | 59 ++++++++++++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 +-
 include/uapi/drm/amdxdna_accel.h        | 13 ++++
 6 files changed, 155 insertions(+), 19 deletions(-)
 create mode 100644 drivers/accel/amdxdna/amdxdna_error.h

diff --git a/drivers/accel/amdxdna/aie2_error.c b/drivers/accel/amdxdna/aie2_error.c
index 5ee905632a39..976f5f0ea308 100644
--- a/drivers/accel/amdxdna/aie2_error.c
+++ b/drivers/accel/amdxdna/aie2_error.c
@@ -13,6 +13,7 @@
 
 #include "aie2_msg_priv.h"
 #include "aie2_pci.h"
+#include "amdxdna_error.h"
 #include "amdxdna_mailbox.h"
 #include "amdxdna_pci_drv.h"
 
@@ -46,6 +47,7 @@ enum aie_module_type {
 	AIE_MEM_MOD = 0,
 	AIE_CORE_MOD,
 	AIE_PL_MOD,
+	AIE_UNKNOWN_MOD,
 };
 
 enum aie_error_category {
@@ -143,6 +145,27 @@ static const struct aie_event_category aie_ml_shim_tile_event_cat[] = {
 	EVENT_CATEGORY(74U, AIE_ERROR_LOCK),
 };
 
+static const enum amdxdna_error_num aie_cat_err_num_map[] = {
+	[AIE_ERROR_SATURATION] = AMDXDNA_ERROR_NUM_AIE_SATURATION,
+	[AIE_ERROR_FP] = AMDXDNA_ERROR_NUM_AIE_FP,
+	[AIE_ERROR_STREAM] = AMDXDNA_ERROR_NUM_AIE_STREAM,
+	[AIE_ERROR_ACCESS] = AMDXDNA_ERROR_NUM_AIE_ACCESS,
+	[AIE_ERROR_BUS] = AMDXDNA_ERROR_NUM_AIE_BUS,
+	[AIE_ERROR_INSTRUCTION] = AMDXDNA_ERROR_NUM_AIE_INSTRUCTION,
+	[AIE_ERROR_ECC] = AMDXDNA_ERROR_NUM_AIE_ECC,
+	[AIE_ERROR_LOCK] = AMDXDNA_ERROR_NUM_AIE_LOCK,
+	[AIE_ERROR_DMA] = AMDXDNA_ERROR_NUM_AIE_DMA,
+	[AIE_ERROR_MEM_PARITY] = AMDXDNA_ERROR_NUM_AIE_MEM_PARITY,
+	[AIE_ERROR_UNKNOWN] = AMDXDNA_ERROR_NUM_UNKNOWN,
+};
+
+static const enum amdxdna_error_module aie_err_mod_map[] = {
+	[AIE_MEM_MOD] = AMDXDNA_ERROR_MODULE_AIE_MEMORY,
+	[AIE_CORE_MOD] = AMDXDNA_ERROR_MODULE_AIE_CORE,
+	[AIE_PL_MOD] = AMDXDNA_ERROR_MODULE_AIE_PL,
+	[AIE_UNKNOWN_MOD] = AMDXDNA_ERROR_MODULE_UNKNOWN,
+};
+
 static enum aie_error_category
 aie_get_error_category(u8 row, u8 event_id, enum aie_module_type mod_type)
 {
@@ -176,12 +199,40 @@ aie_get_error_category(u8 row, u8 event_id, enum aie_module_type mod_type)
 		if (event_id != lut[i].event_id)
 			continue;
 
+		if (lut[i].category > AIE_ERROR_UNKNOWN)
+			return AIE_ERROR_UNKNOWN;
+
 		return lut[i].category;
 	}
 
 	return AIE_ERROR_UNKNOWN;
 }
 
+static void aie2_update_last_async_error(struct amdxdna_dev_hdl *ndev, void *err_info, u32 num_err)
+{
+	struct aie_error *errs = err_info;
+	enum amdxdna_error_module err_mod;
+	enum aie_error_category aie_err;
+	enum amdxdna_error_num err_num;
+	struct aie_error *last_err;
+
+	last_err = &errs[num_err - 1];
+	if (last_err->mod_type >= AIE_UNKNOWN_MOD) {
+		err_num = aie_cat_err_num_map[AIE_ERROR_UNKNOWN];
+		err_mod = aie_err_mod_map[AIE_UNKNOWN_MOD];
+	} else {
+		aie_err = aie_get_error_category(last_err->row,
+						 last_err->event_id,
+						 last_err->mod_type);
+		err_num = aie_cat_err_num_map[aie_err];
+		err_mod = aie_err_mod_map[last_err->mod_type];
+	}
+
+	ndev->last_async_err.err_code = AMDXDNA_ERROR_ENCODE(err_num, err_mod);
+	ndev->last_async_err.ts_us = ktime_to_us(ktime_get_real());
+	ndev->last_async_err.ex_err_code = AMDXDNA_EXTRA_ERR_ENCODE(last_err->row, last_err->col);
+}
+
 static u32 aie2_error_backtrack(struct amdxdna_dev_hdl *ndev, void *err_info, u32 num_err)
 {
 	struct aie_error *errs = err_info;
@@ -264,29 +315,14 @@ static void aie2_error_worker(struct work_struct *err_work)
 	}
 
 	mutex_lock(&xdna->dev_lock);
+	aie2_update_last_async_error(e->ndev, info->payload, info->err_cnt);
+
 	/* Re-sent this event to firmware */
 	if (aie2_error_event_send(e))
 		XDNA_WARN(xdna, "Unable to register async event");
 	mutex_unlock(&xdna->dev_lock);
 }
 
-int aie2_error_async_events_send(struct amdxdna_dev_hdl *ndev)
-{
-	struct amdxdna_dev *xdna = ndev->xdna;
-	struct async_event *e;
-	int i, ret;
-
-	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
-	for (i = 0; i < ndev->async_events->event_cnt; i++) {
-		e = &ndev->async_events->event[i];
-		ret = aie2_error_event_send(e);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 void aie2_error_async_events_free(struct amdxdna_dev_hdl *ndev)
 {
 	struct amdxdna_dev *xdna = ndev->xdna;
@@ -341,6 +377,10 @@ int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev)
 		e->size = ASYNC_BUF_SIZE;
 		e->resp.status = MAX_AIE2_STATUS_CODE;
 		INIT_WORK(&e->work, aie2_error_worker);
+
+		ret = aie2_error_event_send(e);
+		if (ret)
+			goto free_wq;
 	}
 
 	ndev->async_events = events;
@@ -349,6 +389,8 @@ int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev)
 		 events->event_cnt, events->size);
 	return 0;
 
+free_wq:
+	destroy_workqueue(events->wq);
 free_buf:
 	dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
 			     events->addr, DMA_FROM_DEVICE);
@@ -356,3 +398,18 @@ int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev)
 	kfree(events);
 	return ret;
 }
+
+int aie2_get_array_async_error(struct amdxdna_dev_hdl *ndev, struct amdxdna_drm_get_array *args)
+{
+	struct amdxdna_dev *xdna = ndev->xdna;
+
+	drm_WARN_ON(&xdna->ddev, !mutex_is_locked(&xdna->dev_lock));
+
+	args->num_element = 1;
+	args->element_size = sizeof(ndev->last_async_err);
+	if (copy_to_user(u64_to_user_ptr(args->buffer),
+			 &ndev->last_async_err, args->element_size))
+		return -EFAULT;
+
+	return 0;
+}
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 8a66f276100e..cfca4e456b61 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -924,6 +924,9 @@ static int aie2_get_array(struct amdxdna_client *client,
 	case DRM_AMDXDNA_HW_CONTEXT_ALL:
 		ret = aie2_query_ctx_status_array(client, args);
 		break;
+	case DRM_AMDXDNA_HW_LAST_ASYNC_ERR:
+		ret = aie2_get_array_async_error(xdna->dev_handle, args);
+		break;
 	default:
 		XDNA_ERR(xdna, "Not supported request parameter %u", args->param);
 		ret = -EOPNOTSUPP;
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index 289a23ecd5f1..34bc35479f42 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -190,6 +190,8 @@ struct amdxdna_dev_hdl {
 
 	enum aie2_dev_status		dev_status;
 	u32				hwctx_num;
+
+	struct amdxdna_async_error	last_async_err;
 };
 
 #define DEFINE_BAR_OFFSET(reg_name, bar, reg_addr) \
@@ -253,8 +255,9 @@ void aie2_psp_stop(struct psp_device *psp);
 /* aie2_error.c */
 int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev);
 void aie2_error_async_events_free(struct amdxdna_dev_hdl *ndev);
-int aie2_error_async_events_send(struct amdxdna_dev_hdl *ndev);
 int aie2_error_async_msg_thread(void *data);
+int aie2_get_array_async_error(struct amdxdna_dev_hdl *ndev,
+			       struct amdxdna_drm_get_array *args);
 
 /* aie2_message.c */
 int aie2_suspend_fw(struct amdxdna_dev_hdl *ndev);
diff --git a/drivers/accel/amdxdna/amdxdna_error.h b/drivers/accel/amdxdna/amdxdna_error.h
new file mode 100644
index 000000000000..c51de86ec12b
--- /dev/null
+++ b/drivers/accel/amdxdna/amdxdna_error.h
@@ -0,0 +1,59 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2025, Advanced Micro Devices, Inc.
+ */
+
+#ifndef _AMDXDNA_ERROR_H_
+#define _AMDXDNA_ERROR_H_
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+
+#define AMDXDNA_ERR_DRV_AIE		4
+#define AMDXDNA_ERR_SEV_CRITICAL	3
+#define AMDXDNA_ERR_CLASS_AIE		2
+
+#define AMDXDNA_ERR_NUM_MASK		GENMASK_U64(15, 0)
+#define AMDXDNA_ERR_DRV_MASK		GENMASK_U64(23, 16)
+#define AMDXDNA_ERR_SEV_MASK		GENMASK_U64(31, 24)
+#define AMDXDNA_ERR_MOD_MASK		GENMASK_U64(39, 32)
+#define AMDXDNA_ERR_CLASS_MASK		GENMASK_U64(47, 40)
+
+enum amdxdna_error_num {
+	AMDXDNA_ERROR_NUM_AIE_SATURATION = 3,
+	AMDXDNA_ERROR_NUM_AIE_FP,
+	AMDXDNA_ERROR_NUM_AIE_STREAM,
+	AMDXDNA_ERROR_NUM_AIE_ACCESS,
+	AMDXDNA_ERROR_NUM_AIE_BUS,
+	AMDXDNA_ERROR_NUM_AIE_INSTRUCTION,
+	AMDXDNA_ERROR_NUM_AIE_ECC,
+	AMDXDNA_ERROR_NUM_AIE_LOCK,
+	AMDXDNA_ERROR_NUM_AIE_DMA,
+	AMDXDNA_ERROR_NUM_AIE_MEM_PARITY,
+	AMDXDNA_ERROR_NUM_UNKNOWN = 15,
+};
+
+enum amdxdna_error_module {
+	AMDXDNA_ERROR_MODULE_AIE_CORE = 3,
+	AMDXDNA_ERROR_MODULE_AIE_MEMORY,
+	AMDXDNA_ERROR_MODULE_AIE_SHIM,
+	AMDXDNA_ERROR_MODULE_AIE_NOC,
+	AMDXDNA_ERROR_MODULE_AIE_PL,
+	AMDXDNA_ERROR_MODULE_UNKNOWN = 8,
+};
+
+#define AMDXDNA_ERROR_ENCODE(err_num, err_mod)				\
+	(FIELD_PREP(AMDXDNA_ERR_NUM_MASK, err_num) |			\
+	 FIELD_PREP_CONST(AMDXDNA_ERR_DRV_MASK, AMDXDNA_ERR_DRV_AIE) |	\
+	 FIELD_PREP_CONST(AMDXDNA_ERR_SEV_MASK, AMDXDNA_ERR_SEV_CRITICAL) | \
+	 FIELD_PREP(AMDXDNA_ERR_MOD_MASK, err_mod) |			\
+	 FIELD_PREP_CONST(AMDXDNA_ERR_CLASS_MASK, AMDXDNA_ERR_CLASS_AIE))
+
+#define AMDXDNA_EXTRA_ERR_COL_MASK	GENMASK_U64(7, 0)
+#define AMDXDNA_EXTRA_ERR_ROW_MASK	GENMASK_U64(15, 8)
+
+#define AMDXDNA_EXTRA_ERR_ENCODE(row, col)				\
+	(FIELD_PREP(AMDXDNA_EXTRA_ERR_COL_MASK, col) |			\
+	 FIELD_PREP(AMDXDNA_EXTRA_ERR_ROW_MASK, row))
+
+#endif /* _AMDXDNA_ERROR_H_ */
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index aa04452310e5..696fdac8ad3c 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -27,9 +27,10 @@ MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
 /*
  * 0.0: Initial version
  * 0.1: Support getting all hardware contexts by DRM_IOCTL_AMDXDNA_GET_ARRAY
+ * 0.2: Support getting last error hardware error
  */
 #define AMDXDNA_DRIVER_MAJOR		0
-#define AMDXDNA_DRIVER_MINOR		1
+#define AMDXDNA_DRIVER_MINOR		2
 
 /*
  * Bind the driver base on (vendor_id, device_id) pair and later use the
diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
index a1fb9785db77..c7eec9ceb2ae 100644
--- a/include/uapi/drm/amdxdna_accel.h
+++ b/include/uapi/drm/amdxdna_accel.h
@@ -523,7 +523,20 @@ struct amdxdna_drm_hwctx_entry {
 	__u32 pad;
 };
 
+/**
+ * struct amdxdna_async_error - XDNA async error structure
+ */
+struct amdxdna_async_error {
+	/** @err_code: Error code. */
+	__u64 err_code;
+	/** @ts_us: Timestamp. */
+	__u64 ts_us;
+	/** @ex_err_code: Extra error code */
+	__u64 ex_err_code;
+};
+
 #define DRM_AMDXDNA_HW_CONTEXT_ALL	0
+#define DRM_AMDXDNA_HW_LAST_ASYNC_ERR	2
 
 /**
  * struct amdxdna_drm_get_array - Get information array.
-- 
2.34.1

