Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC6C0BDBD34
	for <lists+dri-devel@lfdr.de>; Wed, 15 Oct 2025 01:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F51C10E6AD;
	Tue, 14 Oct 2025 23:41:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="r/zecHu0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012042.outbound.protection.outlook.com [40.107.209.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA5410E6AD
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 23:41:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GrXPnyghPF8AA04WuKayK31iVjw85hhqosVKK0cSusnj6483szMEZp84HSDn0VZMyFQ73e+EV41gPlPhXlccUlFFDKOlgajCrTYDYM38h8V4MCEb07jRtC9ZRMb5WvLGpa2XJ53d37V9jqktDFotbFpO4vhBog9waUilo/Rzsmvbewswt4nai/Wb3WAXg6DKL7HaMHxg8VsX6QbgT3NYCun3KbhkRKzKm0t8E59eOTkC90aHXafmWvulIOtfCWrc9VHwJPKU/a0LLN/aA50cqX3S7t+j7JT+kPRpkScaXSvF0PuVNRwFw0TUTdn6k/Dzo5KMEuLVjD5HtVwjljiwKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZB+koTAhiRM4rmAUFiKiaPHLpwgF8wCj1bm+TIxx3Uk=;
 b=TLzBXRQDia1nyFiDsbw+H4YiA1h9Hh90Wt40a7x3HH9n/VDn+iJOq+xZLv8ghZsFyMLzujsoAafa1S1JXtOe4rHKs+2duEkrEJO/xkmgkzNbMgpeLkfK/OFiX2x+rRkYI94Ra7/7s8AJv4PJVFWbLJE58MOvK0FfvLiupgjUax5FhQ573DyYGIqSoZmgCyRaQNlAatfQIO2XdOtBQPzzIYOjl2iF/bhntvdurahmVc+HLmyKyb2f4+8E8enTxJSVTvv/Cl/Kg6ciZEC24ejBPIFE/aBHiIwIADygOtgCDGAeUt1E9gZIV/1UNptqkIXRwSMm+03al4EOMbIaviUc0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZB+koTAhiRM4rmAUFiKiaPHLpwgF8wCj1bm+TIxx3Uk=;
 b=r/zecHu0Za6wjZUq4v8k98nxftyzoy3f8+upkIhpPToC6d1KQBR/c5L3cE4ZBGCMMMJGyM6I7FeugtRI+EKe6uZArWNLoit0IYJkE7+t7+6ZJO6APYyEn8vPWAB6RbpiU/iKfZ3czEOLGOnf3iFwi2Q2wsoWo107IWM9EhS9ETQ=
Received: from CH0PR03CA0096.namprd03.prod.outlook.com (2603:10b6:610:cd::11)
 by SJ0PR12MB6712.namprd12.prod.outlook.com (2603:10b6:a03:44e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Tue, 14 Oct
 2025 23:41:23 +0000
Received: from CH1PEPF0000AD77.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::33) by CH0PR03CA0096.outlook.office365.com
 (2603:10b6:610:cd::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9203.13 via Frontend Transport; Tue,
 14 Oct 2025 23:41:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH1PEPF0000AD77.mail.protection.outlook.com (10.167.244.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Tue, 14 Oct 2025 23:41:23 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 14 Oct
 2025 16:41:22 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 14 Oct
 2025 16:41:22 -0700
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 14 Oct 2025 16:41:21 -0700
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <maciej.falkowski@linux.intel.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V2] accel/amdxdna: Support getting last hardware error
Date: Tue, 14 Oct 2025 16:41:19 -0700
Message-ID: <20251014234119.628453-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD77:EE_|SJ0PR12MB6712:EE_
X-MS-Office365-Filtering-Correlation-Id: cc7f5457-b9db-4ce6-c7b4-08de0b7b2f34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?3AxPB9pmf6hpUzhrI1cyDznITCRMt/gKwAobPFnZNgq4q1CscNVPRVpwR4n2?=
 =?us-ascii?Q?2xGM338BVWhPScacswIg2RsdrYZzB6Ty4X/1PQ+sHIgwXIWiupJ3yCt54ODp?=
 =?us-ascii?Q?6ECNfyMBD1KqK1ACEv0EoKCqhtfjCKsvcAa/qFxzCw77MKxaR+HUt8hwNSQg?=
 =?us-ascii?Q?aJcH7vXwIzhQDdThYwvVBlI42l74uF++eQAtR1KRMUu+E3tN6TH7aSpC8bww?=
 =?us-ascii?Q?WUIngCEV55RLs5Nc7gRbbhzi9ylJesrcT29PepolUzxrF07qBzpublg0JptD?=
 =?us-ascii?Q?xVe3bGBrfCZSsREETLfFMe2ZVITvce/R8/mWTUw4ZAYNFG08wk4pWdkPnitG?=
 =?us-ascii?Q?DWuJQlQfyxJquF/h9wxd11RSvgNaH7JfGWktt+xO5w/xDlZNYyLtNzdP8wP1?=
 =?us-ascii?Q?mM3swAqRsoF4YKBCq5cPD/0LvwcpfHjAiQcemqfv1fuh5ktIaukfqEmnhN5y?=
 =?us-ascii?Q?meo6F82kZCmtT7C8Iyj3lE5V6aN3h2QktR3FMKf8XcL3OZ+DJxT8MOFSAexe?=
 =?us-ascii?Q?cJIYtztszygaIA5ayh7M5cugCa12Qu5a/gE9XpbLo4WlAl4LAY4Hc4YvmljU?=
 =?us-ascii?Q?cdq+L5dhRr9gp0OEzd0UwVwDT9r4ME0jy84bPDvbAPuS9ApBYLTjkW0Qy+5E?=
 =?us-ascii?Q?dbYxZ+fZGM3FDn85O3JTbqq8WPW74v8j8vSoWlI+q4TUkigZHlh55y+UMeJ3?=
 =?us-ascii?Q?+X63HjcSNhYdWSHwvRiMp4E2iJz5gtMGxbCeqDDhB9HgVkD9Z1Y3p46pQoj6?=
 =?us-ascii?Q?wyL0LY16EF2p6a9StzFYEtQr4iZz3kgXcKPiMmhkoyNUKShDe/BG+HlmNSHm?=
 =?us-ascii?Q?srM3zE5tohJrEacRa682SulmgKidL5GW9RyR4YWv2okNEECkBICi/wEFIHgL?=
 =?us-ascii?Q?zXbF4rC/tz9QrO2tQE/HVWOVJ71etTJ4Fc+Hf+8M3nGR+KnWIgSiRmauuUjl?=
 =?us-ascii?Q?Qqp6teGWwKuH2riD9GQmWuTG9oetgRYXgOk0G1po9zr03XMVN5Wo10cVgz6k?=
 =?us-ascii?Q?gfqbg/Vem5GDo5TwTcty8h88UIhfhKgSYYf57uebo6nU4ZFb9QKaAyeQePaE?=
 =?us-ascii?Q?dxAoSctjGL2RNDnECiSY6vJD1wNvUT/70Ydb+aJO0DDCNdP1Xd3Gdi2eCJG0?=
 =?us-ascii?Q?U/rHEcVFMr0eQDKOkHSRZN1JG0gnj6mvgtSQk40qyJJ7q4vNogv8UwSyYGqW?=
 =?us-ascii?Q?/tQlW+FsNqEX8LcIMWB38SVN38yz1sOHlxUkgNP4vzW3NQgK16RaF0GRymTT?=
 =?us-ascii?Q?trQsPFk5TAcbdm8KTAKNbDU3dZCWv8rK5/8gPGpgPDh7NVgs6f8nX9mpFQ0W?=
 =?us-ascii?Q?EdR1HfMy7+O5jYwHoLaFWoK8kG7+NV22T0r5rGLwhFWf3YfPJm/kw1mdOf3m?=
 =?us-ascii?Q?mmZwwXJCLypnsrfbVAm+Rf7RBZyHNDFv5EpEZh4RnC+ln61ZK7L4wP2eaiO4?=
 =?us-ascii?Q?hLijBslUR+19mruHsBQt/onZ/K79VkQrJ2mdBIAxmKfhB0k/kWLIwqlhyNJF?=
 =?us-ascii?Q?gmoAeAnJ71tIuxc1pX0725CmD0KsP3I5ApKjz/GxiMrp4xrpkda6jUBVBYq0?=
 =?us-ascii?Q?365/3S/oS2L70tSBqIE=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2025 23:41:23.3536 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cc7f5457-b9db-4ce6-c7b4-08de0b7b2f34
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD77.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6712
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
 drivers/accel/amdxdna/aie2_error.c      | 95 ++++++++++++++++++++-----
 drivers/accel/amdxdna/aie2_pci.c        |  3 +
 drivers/accel/amdxdna/aie2_pci.h        |  5 +-
 drivers/accel/amdxdna/amdxdna_error.h   | 59 +++++++++++++++
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 +-
 include/uapi/drm/amdxdna_accel.h        | 13 ++++
 6 files changed, 159 insertions(+), 19 deletions(-)
 create mode 100644 drivers/accel/amdxdna/amdxdna_error.h

diff --git a/drivers/accel/amdxdna/aie2_error.c b/drivers/accel/amdxdna/aie2_error.c
index 5ee905632a39..d452008ec4f4 100644
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
@@ -143,6 +145,31 @@ static const struct aie_event_category aie_ml_shim_tile_event_cat[] = {
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
+static_assert(ARRAY_SIZE(aie_cat_err_num_map) == AIE_ERROR_UNKNOWN + 1);
+
+static const enum amdxdna_error_module aie_err_mod_map[] = {
+	[AIE_MEM_MOD] = AMDXDNA_ERROR_MODULE_AIE_MEMORY,
+	[AIE_CORE_MOD] = AMDXDNA_ERROR_MODULE_AIE_CORE,
+	[AIE_PL_MOD] = AMDXDNA_ERROR_MODULE_AIE_PL,
+	[AIE_UNKNOWN_MOD] = AMDXDNA_ERROR_MODULE_UNKNOWN,
+};
+
+static_assert(ARRAY_SIZE(aie_err_mod_map) == AIE_UNKNOWN_MOD + 1);
+
 static enum aie_error_category
 aie_get_error_category(u8 row, u8 event_id, enum aie_module_type mod_type)
 {
@@ -176,12 +203,40 @@ aie_get_error_category(u8 row, u8 event_id, enum aie_module_type mod_type)
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
@@ -264,29 +319,14 @@ static void aie2_error_worker(struct work_struct *err_work)
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
@@ -341,6 +381,10 @@ int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev)
 		e->size = ASYNC_BUF_SIZE;
 		e->resp.status = MAX_AIE2_STATUS_CODE;
 		INIT_WORK(&e->work, aie2_error_worker);
+
+		ret = aie2_error_event_send(e);
+		if (ret)
+			goto free_wq;
 	}
 
 	ndev->async_events = events;
@@ -349,6 +393,8 @@ int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev)
 		 events->event_cnt, events->size);
 	return 0;
 
+free_wq:
+	destroy_workqueue(events->wq);
 free_buf:
 	dma_free_noncoherent(xdna->ddev.dev, events->size, events->buf,
 			     events->addr, DMA_FROM_DEVICE);
@@ -356,3 +402,18 @@ int aie2_error_async_events_alloc(struct amdxdna_dev_hdl *ndev)
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

