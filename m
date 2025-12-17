Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84413CC95E7
	for <lists+dri-devel@lfdr.de>; Wed, 17 Dec 2025 20:12:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E351910E05C;
	Wed, 17 Dec 2025 19:11:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YHp+g19j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011068.outbound.protection.outlook.com [52.101.62.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E12810E05C
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Dec 2025 19:11:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WgaituBJPZJruB4+s9f+p97RVRCbsU3B+cKioOIYITORV2U47JYNqWMB4dSi6wgUSvcC0UzggUwIxY8r6du6t96P8EfleYg6PB8Xa3Vfw8MmxSbEPnZNy9qV7B69hWlDX+EkFDTlvtJoOZsrxkF+MVs7rr2oexSunwA2k8+3TUeFgl+ZCPpVGjuq9ekTqNHtfcrwJUrtggdj7/KJVzJbpEuC8U2Y2pG9Dr4KIwKK8RTfFuSGbMH6N5Ly7aBFIgVoaLQaGrIe3MpIptledEGj9KBcp1P0CHzPB6BtxKedsDDzfNTf6WO1RGpjw7A8ZRHDaYwHdOGHDOCK/aXe00s+qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsBSuWbMzVOo8AWtt/PpLOK6EwiUUmjKMPQ6F+TjB60=;
 b=Bd3ANq2lSsC/3YtPxvjOqnGyopptY8fCizC+nQDdGLxLaus5RXRm0nnpYCdhbsjZbtT4nuSocLg/FjC4XsI+JSProG1Xnu2My/XmSsM+Bu2n5yLZMb7FUio2YlZI+UyzRM//mQdDSQPeGPTeb2Grvvo/tQzHuu8BMQX4/pJB8QE99CnEiM+s+bEsvXbkHg6T37WiVgJeTf3hKCaeF5ZtdJecMoHHi/ZPzwaVFLlfJwyZTZc2qSA31Xkl5qdzoAKjePFW3HoGQV1SMBZ6dOE1L+i8rwURixtXloTQVcmAPk3cmzw2vP9Ttm+3Csu35+NmTN9zOvDslCdaMv5554eeYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsBSuWbMzVOo8AWtt/PpLOK6EwiUUmjKMPQ6F+TjB60=;
 b=YHp+g19jNfx6+0bCcbgX1vNJsuhS66+1NTAOjgdAHXfowEibhrS1jCRwDwJA3G7BqC094srXJVGztMsSyHj4SMEwZGLL3m8vgR6kNQqx/4SZF3pvsXab55Y9BHktulTrSgw4SriOlFWtyINEoUrE0i7Kzslg4WlEq/U5eNqV3zk=
Received: from CH0PR13CA0036.namprd13.prod.outlook.com (2603:10b6:610:b2::11)
 by MN2PR12MB4095.namprd12.prod.outlook.com (2603:10b6:208:1d1::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Wed, 17 Dec
 2025 19:11:53 +0000
Received: from CH1PEPF0000A34B.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::ec) by CH0PR13CA0036.outlook.office365.com
 (2603:10b6:610:b2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.6 via Frontend Transport; Wed,
 17 Dec 2025 19:11:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 CH1PEPF0000A34B.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Wed, 17 Dec 2025 19:11:52 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 17 Dec
 2025 13:11:52 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 17 Dec
 2025 13:11:51 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 17 Dec 2025 13:11:51 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V2] accel/amdxdna: Enable temporal sharing only mode
Date: Wed, 17 Dec 2025 11:11:50 -0800
Message-ID: <20251217191150.2145937-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34B:EE_|MN2PR12MB4095:EE_
X-MS-Office365-Filtering-Correlation-Id: 846d60f1-d23b-45b1-0adc-08de3da0231a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z9PEj2vpSmmNeFihFVrdmN/LRayux/ewDUuGfEe4nfqgM3wiuWSCDfHnZXVS?=
 =?us-ascii?Q?05rVVOhrLxJdqhEIALlUWENPP2yVc5/qHY9OVCKtO9HJRDL3VHJ0JrAMGM04?=
 =?us-ascii?Q?hkvZy7qf8CtQ7heK7oXCRhS0cX3nAb64kEedrhV1NClpu8DtZDL1+K7glTa/?=
 =?us-ascii?Q?hh5zcXnZb99rCZJwY8nMexrkHVon1zZ4jr+U07jVx/OJ9TprHc8J4LiwxvPW?=
 =?us-ascii?Q?203DunPjBE4f5+LvwEMktGdo+3/aiko1tvohR7QcYPffxrD14Ju5SZBnsd2e?=
 =?us-ascii?Q?PzAR56Ko57yjsqyYYNyPo6fEzbmRvORRkHJ7Si297C1Xn+602qhJXijLX4aF?=
 =?us-ascii?Q?ITbMjo76X89uq6OF91nTMFFqzX1RphIrkde7Pklw/n8TdQBiiymv7XxxXOV5?=
 =?us-ascii?Q?F+Mn4vTYZumChvWxxwHW3wni96TRqlNOnc7IfH9+dAkC0rhEKFvGdu79hjNQ?=
 =?us-ascii?Q?8tb7pLoPN1hVQ5sakUkEoIsqrYUGs0EFYJsrt6+cS+NGnv4BQFxuzywr0UuT?=
 =?us-ascii?Q?u6wtLD4hOOrv4KG7Enr+z7HqpWdT66+ScI3yunv1HS5pNPy8yGusojRcl3Ps?=
 =?us-ascii?Q?sfMXjsR9fatDlL78fOsPyly920J4+vJ7U7YWZ87wxcrdV827PHVrsBbftMXZ?=
 =?us-ascii?Q?E0jE3cPOFEnYOwgWs2YMl4WVxYzdA5Dk568E/5r1Nojuiu7VUpZVqcsNrI8V?=
 =?us-ascii?Q?ENuPD2XHpOt/AOFlaReQSeR54riOpGakeFVnxyNi+BoWCi8ggfqihIU+Zk5o?=
 =?us-ascii?Q?WNf8+zmgJyNlEC99tNHAIgGhvPZgohgJkbFzEZiHP+hpiny8OlzWICeqfbCg?=
 =?us-ascii?Q?YWywVNrDL0E0dRR9ub4aGdF1wm6Uq27S0c0stQS1/OmHODV2O/6QrO75+F+5?=
 =?us-ascii?Q?qSub4faN2/FeW0FDHZ4bMkE8DsW9DXV0uOefrsTXKtf5QtbfsnY7rgggSEPY?=
 =?us-ascii?Q?OKmmheDGPXfIi843F+RUmGNj6ZAXss2f4qznycjm7shuvl+7THZFNb0arTp/?=
 =?us-ascii?Q?HfTT5Ju++7PuA3ziKwUaBu6WBLtIlDDKphWZ4X/wieGIcTI9f2YKMRZ7miD/?=
 =?us-ascii?Q?xijAxyv/cwp0Lq4pRouvZ+qjobqq5zeoiGbmLG1KH7EKTcR72gOdV2GsekI/?=
 =?us-ascii?Q?qAueqisbSLqs5Yd5y1VrTce9p+8otacKZ5ezh1RzDG13jpW8DKVvJ1mLoT/k?=
 =?us-ascii?Q?bC1ZQ4zEid3+4Hvaq5QMiRpO7k+TeHfrDCgSTmQQZFmPn7HGEmI1QUw24UFb?=
 =?us-ascii?Q?37P0l5MttuOuC0VSpM2RpqARVrN+Sx3bKyQ0gNQi8vM3DArIJoQfOarsPOGs?=
 =?us-ascii?Q?4O9ahHlV//PcJupiG2X81bFuz47QHv2fll4e0PLb2sw3n0rBHHxGcRpo+EKv?=
 =?us-ascii?Q?Xsfa8iTxbAEpNNoH8iiT4bfh8IWePm1+W1jhkRuCVaozTymjrdrzGQioPlIj?=
 =?us-ascii?Q?0Eyi5wr3EyjBhmV1H37X9kNvOUEB2OJIMYCpbobDs1TOya/gqjxdRQiS5SAB?=
 =?us-ascii?Q?j2w7JOKMgmi9rG7TIVEl7PtksdQP3LRhjMs2TVwMbuvC2TVmA8+780Ro6PV5?=
 =?us-ascii?Q?iLovTBgUQ+1XR4J7IVI=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 19:11:52.5623 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 846d60f1-d23b-45b1-0adc-08de3da0231a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A34B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4095
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

Newer firmware versions prefer temporal sharing only mode. In this mode,
the driver no longer needs to manage AIE array column allocation. Instead,
a new field, num_unused_col, is added to the hardware context creation
request to specify how many columns will not be used by this hardware
context.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c      | 18 +++++++++++++++---
 drivers/accel/amdxdna/aie2_message.c  |  1 +
 drivers/accel/amdxdna/aie2_msg_priv.h |  3 ++-
 drivers/accel/amdxdna/aie2_pci.h      |  1 +
 drivers/accel/amdxdna/amdxdna_ctx.h   |  1 +
 drivers/accel/amdxdna/npu4_regs.c     |  1 +
 6 files changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 42d876a427c5..f99233041397 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -468,6 +468,12 @@ static int aie2_alloc_resource(struct amdxdna_hwctx *hwctx)
 	struct alloc_requests *xrs_req;
 	int ret;
 
+	if (AIE2_FEATURE_ON(xdna->dev_handle, AIE2_TEMPORAL_ONLY)) {
+		hwctx->num_unused_col = xdna->dev_handle->total_col - hwctx->num_col;
+		hwctx->num_col = xdna->dev_handle->total_col;
+		return aie2_create_context(xdna->dev_handle, hwctx);
+	}
+
 	xrs_req = kzalloc(sizeof(*xrs_req), GFP_KERNEL);
 	if (!xrs_req)
 		return -ENOMEM;
@@ -499,9 +505,15 @@ static void aie2_release_resource(struct amdxdna_hwctx *hwctx)
 	struct amdxdna_dev *xdna = hwctx->client->xdna;
 	int ret;
 
-	ret = xrs_release_resource(xdna->xrs_hdl, (uintptr_t)hwctx);
-	if (ret)
-		XDNA_ERR(xdna, "Release AIE resource failed, ret %d", ret);
+	if (AIE2_FEATURE_ON(xdna->dev_handle, AIE2_TEMPORAL_ONLY)) {
+		ret = aie2_destroy_context(xdna->dev_handle, hwctx);
+		if (ret)
+			XDNA_ERR(xdna, "Destroy  temporal only context failed, ret %d", ret);
+	} else {
+		ret = xrs_release_resource(xdna->xrs_hdl, (uintptr_t)hwctx);
+		if (ret)
+			XDNA_ERR(xdna, "Release AIE resource failed, ret %d", ret);
+	}
 }
 
 static int aie2_ctx_syncobj_create(struct amdxdna_hwctx *hwctx)
diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 9ec973028221..e77a353cadc5 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -218,6 +218,7 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
 	req.aie_type = 1;
 	req.start_col = hwctx->start_col;
 	req.num_col = hwctx->num_col;
+	req.num_unused_col = hwctx->num_unused_col;
 	req.num_cq_pairs_requested = 1;
 	req.pasid = hwctx->client->pasid;
 	req.context_priority = 2;
diff --git a/drivers/accel/amdxdna/aie2_msg_priv.h b/drivers/accel/amdxdna/aie2_msg_priv.h
index 1c957a6298d3..cc912b7899ce 100644
--- a/drivers/accel/amdxdna/aie2_msg_priv.h
+++ b/drivers/accel/amdxdna/aie2_msg_priv.h
@@ -112,7 +112,8 @@ struct create_ctx_req {
 	__u32	aie_type;
 	__u8	start_col;
 	__u8	num_col;
-	__u16	reserved;
+	__u8    num_unused_col;
+	__u8	reserved;
 	__u8	num_cq_pairs_requested;
 	__u8	reserved1;
 	__u16	pasid;
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index c6b5cf4ae5c4..a929fa98a121 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -232,6 +232,7 @@ struct aie2_hw_ops {
 enum aie2_fw_feature {
 	AIE2_NPU_COMMAND,
 	AIE2_PREEMPT,
+	AIE2_TEMPORAL_ONLY,
 	AIE2_FEATURE_MAX
 };
 
diff --git a/drivers/accel/amdxdna/amdxdna_ctx.h b/drivers/accel/amdxdna/amdxdna_ctx.h
index b6151244d64f..b29449a92f60 100644
--- a/drivers/accel/amdxdna/amdxdna_ctx.h
+++ b/drivers/accel/amdxdna/amdxdna_ctx.h
@@ -98,6 +98,7 @@ struct amdxdna_hwctx {
 	u32				*col_list;
 	u32				start_col;
 	u32				num_col;
+	u32				num_unused_col;
 #define HWCTX_STAT_INIT  0
 #define HWCTX_STAT_READY 1
 #define HWCTX_STAT_STOP  2
diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
index 4ca21db70478..a62234fd266d 100644
--- a/drivers/accel/amdxdna/npu4_regs.c
+++ b/drivers/accel/amdxdna/npu4_regs.c
@@ -90,6 +90,7 @@ const struct dpm_clk_freq npu4_dpm_clk_table[] = {
 const struct aie2_fw_feature_tbl npu4_fw_feature_table[] = {
 	{ .feature = AIE2_NPU_COMMAND, .min_minor = 15 },
 	{ .feature = AIE2_PREEMPT, .min_minor = 12 },
+	{ .feature = AIE2_TEMPORAL_ONLY, .min_minor = 12 },
 	{ 0 }
 };
 
-- 
2.34.1

