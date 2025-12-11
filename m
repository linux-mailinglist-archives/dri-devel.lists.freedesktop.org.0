Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE670CB4B28
	for <lists+dri-devel@lfdr.de>; Thu, 11 Dec 2025 05:57:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D6AC10E03D;
	Thu, 11 Dec 2025 04:56:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="g91MAGJI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010066.outbound.protection.outlook.com [52.101.56.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B3E810E03D
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Dec 2025 04:56:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bgVYoj5ne2AF/k1jV7HvJiMiIhLf9hBwAZqRjB26nuZQ2q63u1wfXJMPThtuekZf4dYPLwxfpJjzpMNL1uFHxIbLh5rbiflTOWgySBNYK0fMQesfFObBa3uw0WDbhjzKA3q98dH8l6BZ/ymq84ZG1V+7H1xSv/Mn6u1tmrJEl5qON6UkT1X3PG2mN8zc71/Lrf7hdImE06RImE2ov4uhfWNglM6X60qfAq7VjMRTK0gEk1NeM3Bpu0LxPBaLxgBQMFGSbzPB1rCmLFEJW7L+U9i5FtxC/u0aIw3fvj/ZAFLx39fiDAe1ibKbIvPcHf6Kxd/c+A2lJVUrz6cktV+Arg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nZHVZe72232Y1PRNd3+8QLU6xORWqe/gnpozxEdol+A=;
 b=ZOxuxU9vnbAK4c1JUOeD46/VXRWEgFGOwfl4C3mZUUCjkoruXHfpBdizOcF7mxBqeLZApsckXmHIdzbP75t+XGkju2n0+lr7DEZ7j6AO+xpLSB+jq344VlPbfOfW82gVgdmSlkvv8QTNTP+5Y+nLKhQqX7xZ5Iuz3gJwHU50jMTIiiKgqbluWO0FZNy7fq87jXSqB0109IFp5OCotSVZmdwAeRZoUxvJ6AmGXoNEOIie68SZus1QDnYhrmSdxUnrdTqPGvMXkH4z0DZEcK5AztsHfoUQ8fkm7R3nIjPCAx1dRYDTEn6Xq42kZ3yJYNgjbK1cufSIoD2uyOiCTqIbBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nZHVZe72232Y1PRNd3+8QLU6xORWqe/gnpozxEdol+A=;
 b=g91MAGJITQ8FxRvrAqEKKU/F3+yUKxOtDRqzQ1D+8JR2+OgLQXL5KyQvVUB8JGT+3Z5ogsKMY/n3Je4007PiNGmbMt+eB8RBrZYWcRYABWcCUtK5ULpy5YF8Lg0niKlT2LWp46sLwYaBrd9MVLo74p3d+j55Uqjta8jP3cAjA3Y=
Received: from CH0PR03CA0334.namprd03.prod.outlook.com (2603:10b6:610:11a::25)
 by CH1PPF711010B62.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::614) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Thu, 11 Dec
 2025 04:56:50 +0000
Received: from CH3PEPF0000000D.namprd04.prod.outlook.com
 (2603:10b6:610:11a:cafe::2c) by CH0PR03CA0334.outlook.office365.com
 (2603:10b6:610:11a::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.15 via Frontend Transport; Thu,
 11 Dec 2025 04:56:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH3PEPF0000000D.mail.protection.outlook.com (10.167.244.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Thu, 11 Dec 2025 04:56:50 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Dec
 2025 22:56:50 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 10 Dec
 2025 20:56:50 -0800
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 10 Dec 2025 20:56:49 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Fix potential NULL pointer dereference in
 context cleanup
Date: Wed, 10 Dec 2025 20:56:47 -0800
Message-ID: <20251211045647.1725300-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000D:EE_|CH1PPF711010B62:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f88e66b-d5c2-448a-916a-08de3871b256
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LTm4TyKdLoZWSK4JsA64r0ttpOBCPgQl1LAme9Kw0ShLZZ9IcmhCmMfzrCZg?=
 =?us-ascii?Q?7LjucmDit8jdshPKu7zDwBPZbn1yiSLMLLeXniV/RGbus4Wfdc37dF9uMJdP?=
 =?us-ascii?Q?xytMwSBTQFNYIX0XfrIDyc0MUnfiOSWcc0vdSU0oLM3X81FFYT3AaRhJaSYe?=
 =?us-ascii?Q?SYNj+8XLGQq40yx1CBAUxunLLvTjzlVSyTbl7L4l267AE1x2djk97KK6cdXr?=
 =?us-ascii?Q?SJTkfcj8ACFcl1K2wIJFguiBHzusbvM5zi6IeUng1ktI9z2Mh71t66AfK0Mu?=
 =?us-ascii?Q?nm0I2Gtsiz3OdndSkt5Lm7ng5VcsvMEpnyfXenEQgbtVC+j4vh8a+GpDNKTR?=
 =?us-ascii?Q?MKhjW8BuigNSj5Xxh8N7qlHAmLcbszHNVy0CM4cqwM992rg3YUIGvZwNnhRb?=
 =?us-ascii?Q?2X4G9xRMX4IKYmMcC0PbBPiLyAohcLzZAOawwk2OdDOyg8NTy5TvJdKkUO3g?=
 =?us-ascii?Q?ls4Kpry8mrDLFznYANn7/ICv7SeoIKvi+gnoXEBh6avDbuyqz/td6UaLW4XR?=
 =?us-ascii?Q?vPwSq6aWrBa4zB4Ty0fnVAt+i9py8JNGVWam+EPaETUlWDiBYgSn8qjLvhWc?=
 =?us-ascii?Q?8K7AfTvFHHLuRM+YoEw1xdaeUoB3hFn+aL4kO9KFhGyGcs9GB49jwwNvXBPj?=
 =?us-ascii?Q?UhBOQ1hmK13vuxTLOPsohhKUfzgypuE8r/tl5+0Omy1RKR2brxWDTikoQ8cL?=
 =?us-ascii?Q?8HjPGbnQMzfH9uBH8AFLpISR5aoxczHcNiVXSqaNdAzoKnKNYrLOVXU0kU7Y?=
 =?us-ascii?Q?Yaw7htw8dIoVE7RaoFwDRrzMdp83GlWD/6KFsoDj5n6MD65gMDGQuAV+Kgvi?=
 =?us-ascii?Q?gY9MaxwNzvy+i4KVobxZRTVpIiVjMiKFb+vz2a3OAZHWfyUwSiK4RZBTKZUR?=
 =?us-ascii?Q?llSt0Nh4mz8IJmvmmTL4Q5bGjuw+bHIpOMFGt84yiIH+ng8tZ3t+Xn4HdxzX?=
 =?us-ascii?Q?h48x2posrBCT/k4TEAGfXRmbz7qv50xYxrNP6qBiDWw3+D89+Ie5O4QrRIDB?=
 =?us-ascii?Q?0xSMxQM+UB3ozS1W9jXjyVZMkrlxCO5VdaUuWTS0as9OX9vk/3nksDg4gMPR?=
 =?us-ascii?Q?hsy+BkphpTCwm/LIm+m8fYmNKE3b2N+OCmcuaYdXo+EERp2ALp7WrIjVq/JJ?=
 =?us-ascii?Q?TH9RhJgqT9ahN/hBVByRq2GSBcJhNKCSfkAtzhYR4Cz+m58/nCy4YxBJAscA?=
 =?us-ascii?Q?6EZ+1SwzjLC4mHZFQktqVviA7TVsieWsL0PVmVVVp0t/HKEtXYaQWVYBcNIZ?=
 =?us-ascii?Q?Eu33GVc43vcic/I5gN+LES0U7JvtZ+b3MrwIsbgbC0075Qe5um0qS7zpXluC?=
 =?us-ascii?Q?FkuKaO8XXJFkszm3A5mLCejE5NVp7rTVCcUgphRzRYhR3cvQV5pciFxCoehc?=
 =?us-ascii?Q?x45kg4EliBTd4DM/Zg2AVgr2ysNXCtZqH/zOpLdMsId5QbqS8/zHvk5EKRB/?=
 =?us-ascii?Q?NNjm2LDb36VkJi4WoYbJlKscG6/Ue/uIcMLyaj4wDBUMW0UkLMDKNfIM+vrS?=
 =?us-ascii?Q?XwaO3zr13WO7uvVugXJTbRu+xjRxrXrljImjsh9rqo8gQ1RfwWtCM34D3MKF?=
 =?us-ascii?Q?zz2cPiFuOhO+pTL4jiU=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 04:56:50.7145 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f88e66b-d5c2-448a-916a-08de3871b256
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH3PEPF0000000D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF711010B62
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

aie_destroy_context() is invoked during error handling in
aie2_create_context(). However, aie_destroy_context() assumes that the
context's mailbox channel pointer is non-NULL. If mailbox channel
creation fails, the pointer remains NULL and calling aie_destroy_context()
can lead to a NULL pointer dereference.

In aie2_create_context(), replace aie_destroy_context() with a function
which request firmware to remove the context created previously.

Fixes: be462c97b7df ("accel/amdxdna: Add hardware context")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_message.c | 52 +++++++++++++++-------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 03b75757a6e6..980aef9dc51a 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -192,6 +192,19 @@ int aie2_query_firmware_version(struct amdxdna_dev_hdl *ndev,
 	return 0;
 }
 
+static int aie2_destroy_context_req(struct amdxdna_dev_hdl *ndev, u32 id)
+{
+	DECLARE_AIE2_MSG(destroy_ctx, MSG_OP_DESTROY_CONTEXT);
+	struct amdxdna_dev *xdna = ndev->xdna;
+	int ret;
+
+	req.context_id = id;
+	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
+	if (ret)
+		XDNA_WARN(xdna, "Destroy context failed, ret %d", ret);
+
+	return ret;
+}
 int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx)
 {
 	DECLARE_AIE2_MSG(create_ctx, MSG_OP_CREATE_CONTEXT);
@@ -214,13 +227,16 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
 		return ret;
 
 	hwctx->fw_ctx_id = resp.context_id;
-	WARN_ONCE(hwctx->fw_ctx_id == -1, "Unexpected context id");
+	if (hwctx->fw_ctx_id == -1) {
+		WARN_ON_ONCE("Unexpected context id");
+		return -EINVAL;
+	}
 
 	if (ndev->force_preempt_enabled) {
 		ret = aie2_runtime_cfg(ndev, AIE2_RT_CFG_FORCE_PREEMPT, &hwctx->fw_ctx_id);
 		if (ret) {
 			XDNA_ERR(xdna, "failed to enable force preempt %d", ret);
-			return ret;
+			goto del_ctx_req;
 		}
 	}
 
@@ -237,51 +253,39 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
 
 	ret = pci_irq_vector(to_pci_dev(xdna->ddev.dev), resp.msix_id);
 	if (ret == -EINVAL) {
-		XDNA_ERR(xdna, "not able to create channel");
-		goto out_destroy_context;
+		XDNA_ERR(xdna, "Alloc IRQ failed %d", ret);
+		goto del_ctx_req;
 	}
 
 	intr_reg = i2x.mb_head_ptr_reg + 4;
 	hwctx->priv->mbox_chann = xdna_mailbox_create_channel(ndev->mbox, &x2i, &i2x,
 							      intr_reg, ret);
 	if (!hwctx->priv->mbox_chann) {
-		XDNA_ERR(xdna, "not able to create channel");
+		XDNA_ERR(xdna, "Not able to create channel");
 		ret = -EINVAL;
-		goto out_destroy_context;
+		goto del_ctx_req;
 	}
 	ndev->hwctx_num++;
 
-	XDNA_DBG(xdna, "%s mailbox channel irq: %d, msix_id: %d",
-		 hwctx->name, ret, resp.msix_id);
-	XDNA_DBG(xdna, "%s created fw ctx %d pasid %d", hwctx->name,
-		 hwctx->fw_ctx_id, hwctx->client->pasid);
+	XDNA_DBG(xdna, "Mailbox channel irq: %d, msix_id: %d", ret, resp.msix_id);
+	XDNA_DBG(xdna, "Created fw ctx %d pasid %d", hwctx->fw_ctx_id, hwctx->client->pasid);
 
 	return 0;
 
-out_destroy_context:
-	aie2_destroy_context(ndev, hwctx);
+del_ctx_req:
+	aie2_destroy_context_req(ndev, hwctx->fw_ctx_id);
 	return ret;
 }
 
 int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwctx)
 {
-	DECLARE_AIE2_MSG(destroy_ctx, MSG_OP_DESTROY_CONTEXT);
 	struct amdxdna_dev *xdna = ndev->xdna;
 	int ret;
 
-	if (hwctx->fw_ctx_id == -1)
-		return 0;
-
 	xdna_mailbox_stop_channel(hwctx->priv->mbox_chann);
-
-	req.context_id = hwctx->fw_ctx_id;
-	ret = aie2_send_mgmt_msg_wait(ndev, &msg);
-	if (ret)
-		XDNA_WARN(xdna, "%s destroy context failed, ret %d", hwctx->name, ret);
-
+	ret = aie2_destroy_context_req(ndev, hwctx->fw_ctx_id);
 	xdna_mailbox_destroy_channel(hwctx->priv->mbox_chann);
-	XDNA_DBG(xdna, "%s destroyed fw ctx %d", hwctx->name,
-		 hwctx->fw_ctx_id);
+	XDNA_DBG(xdna, "Destroyed fw ctx %d", hwctx->fw_ctx_id);
 	hwctx->priv->mbox_chann = NULL;
 	hwctx->fw_ctx_id = -1;
 	ndev->hwctx_num--;
-- 
2.34.1

