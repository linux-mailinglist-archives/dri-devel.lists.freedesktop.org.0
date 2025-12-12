Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBB5CB9919
	for <lists+dri-devel@lfdr.de>; Fri, 12 Dec 2025 19:32:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1BCB10E935;
	Fri, 12 Dec 2025 18:32:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="HO466wSk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012058.outbound.protection.outlook.com [52.101.53.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 807C210E930
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Dec 2025 18:32:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ib2xvCObhQzx1jSINbdT1pnR9QrbM0qmHm1Krc+qGn+cmq6tQyV2cgDg5+A/Qzg20UDjgfNGejNxg2qI6tfYa2lw7K3tDZAOWKz5tppUGzyC8Nxqk0OAjeiU3nSD4l/Oc3A3dzI8jMApkmXPYm0Za+L3iRnkVnfTJx6X0rS9qXpgBExfqLekXovs2F5Go2vvyTtnCz5RpdlMK1DV+DxeXUIDYqnKQgx+I91ILKNkhZyVExk8ve/IHl2uweZZvqROMY3vNW3nLQc8xmNvyVqvAgzbPe0rfLYiUvNKRNRZnX3kNbHaVGBLwDe6d17sy/O5xwDzjMfrT0hDXroEK9v8ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=810kDFXraR+I+JdrLI4F3vM/B6OrfndBaFc0O29X4tw=;
 b=JTJkeNUc2ZIx7tkMKbcCoBmYbs1t01d+5qh19fyIZoNG5hUX7Qhqcxu7Zgn/I3+bgOu8QGWdfOQWMbQ609Wyz3f+PQ8IRqgBkYvvrsClrGSRLjbFzFamVh4uvcpO1KAIrrR5Cp4rMNaaRoDGMuVZDFPqEXRHOq+GrZOQ3Fw6tXgTYlhXRqfbMikbS6Nb1xG0brreU2RUrXZAGcAHtkEAQ7UcbD64BEyJOk4J3h5m54uFBKZOco26ptm6LFW6Ar4AFlDICwhR/cU1dk+bZyC3LaqvuPB0pgwK3MOSB6Q3WaQQxb4m4/qCTMvmmQeiFbp1+2dUjtIeWKfwnPfKNl164w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=810kDFXraR+I+JdrLI4F3vM/B6OrfndBaFc0O29X4tw=;
 b=HO466wSkLahT6agLU3UxvBF2r2ZsbRtEd1momm7fTm8e2U3+eKowF0xlpTMEqUXc2oWtN4vnJpRcy/8S4QtyZnVka4Dg4RJdR7unbahljfwBUzm5RSGcoI1FjQ1g8K8T6zu0glyP4j+TDrOlsmIny0rTT4Yeqc5zxyInJkgFkJs=
Received: from PH8P220CA0029.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:348::13)
 by DS7PR12MB5983.namprd12.prod.outlook.com (2603:10b6:8:7e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Fri, 12 Dec
 2025 18:32:47 +0000
Received: from CY4PEPF0000EDD2.namprd03.prod.outlook.com
 (2603:10b6:510:348:cafe::2e) by PH8P220CA0029.outlook.office365.com
 (2603:10b6:510:348::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.11 via Frontend Transport; Fri,
 12 Dec 2025 18:32:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000EDD2.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 18:32:46 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 12 Dec
 2025 12:32:46 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Fri, 12 Dec 2025 10:32:44 -0800
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V2] accel/amdxdna: Fix potential NULL pointer dereference in
 context cleanup
Date: Fri, 12 Dec 2025 10:32:44 -0800
Message-ID: <20251212183244.1826318-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD2:EE_|DS7PR12MB5983:EE_
X-MS-Office365-Filtering-Correlation-Id: 56941ebf-aa8f-4987-dfc4-08de39acd8be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Hxb14s2r9khdSBuD+Cq6geB/AUusj9zQYVf5hOBXC3ZkBjVFmnXiQ6h7XgZM?=
 =?us-ascii?Q?Yh0GAgeDBMBVoOsl3vLBK29rmYrL7B++boZtTB6tUNZ+vZ1mgcWqWDFJ9ArJ?=
 =?us-ascii?Q?VFpkSflHNt7d2a+udfHEHYkXelcS0u/IR0JhXbBZFNceFoesr5hoUl4FSDz4?=
 =?us-ascii?Q?fSKEGaxU4QIiSd/F0xOTZGMPi0m67Yt5pZngRmKaAGEw07nDyQjGgwS3+RL0?=
 =?us-ascii?Q?l+ttiXoR4x5FekmgdQoOjGRwvVIHIkFeXMIj7T4iDRPnPCWZNclOKUPngLyK?=
 =?us-ascii?Q?iF94K5H+VD4/1erKjSYNM2c0j2KSCVQHVZSOLSZbU+4lQZBRq2hiNsfDNp5W?=
 =?us-ascii?Q?ACWMTBxxEEduFSAKwofc8nbpvyc+v3NOZEw9fzZHHwnSB+uiVw+akVYXdFMI?=
 =?us-ascii?Q?Q+v3lGg4YnSO3CzFT6mixL9Td901fB2LVqil+qVhd/LNsqlSjF2ft/jiujy+?=
 =?us-ascii?Q?vSfqkvK2hludNqJiFQMAhk/u8gzli1tdTnSG9GcIwb7ayTRzhdju05gvDZDs?=
 =?us-ascii?Q?veml5v9Slp/TaQE65esERcjWOwU4ZgllaDoJajBE3XpTp72ntpCMNjwORJzi?=
 =?us-ascii?Q?ukFMnsToZs2rzl4zlEppMKtEp/Ad+U/oBRSSWiIGhunR1G+1ClX6rNpkaJBS?=
 =?us-ascii?Q?f8MLQjJJqevF4RUEP6vgs4nMOOJQ/tnSNhrU3HHX4NKV7T+a18G5kgQdYRlt?=
 =?us-ascii?Q?v11YL8iugWy4SWYX38aKzFkQMZ2fQIrSHqVGr8CMdT0k0vzWnJXrkv3F6R6x?=
 =?us-ascii?Q?l5wma6qxOfzX/xHXcQO5Q1TV+8L4VqZjiZSliHGi9zf8wW0+HZHU2vO0oB1Q?=
 =?us-ascii?Q?aVEf2Pr7NxJWKbuZp4i6b2cO9L62vXTyv7sGMM7aZhTdLwPQ90AWtMS7goEo?=
 =?us-ascii?Q?/v/UMwXJ0ACv3VgsCVlUfKC+nwvOgIFED4PL0+zKeASYr/dlWUskWfTLWADH?=
 =?us-ascii?Q?VnSTeuPATg9eZsKO1pc43MBqwRwImYDv3BJhume6RwQzEyd4gtzLLl9Zpn7/?=
 =?us-ascii?Q?E2S37bWIs+CGMFQg/lXu4kv+9kRbzY3em2XlvHiRlSAOLi4rWzuE5nJyAGcT?=
 =?us-ascii?Q?cyNsZTs5YObumNuHNy0QQwrTU22rhcp+KoMLO6bj8Co7ccfJYXP6mJlbGPdN?=
 =?us-ascii?Q?o8RPH46YBjqP7qRFzYhop8lYCRhdUXcoExNT/69x0okQ5UtyLR6te8ml+6AR?=
 =?us-ascii?Q?LwWGuQhVH6V/VJ+S4hSLkHOfCE7hfCYps+w4sxdm+ebVaqCylHY6Fi4rUsBU?=
 =?us-ascii?Q?UD9nB9nGCKuFCWMEKLdGaXy1OeEwXHmkuzK59LRl/rVxUIVfCbogORkLFggg?=
 =?us-ascii?Q?trLh1AzpskeT/TdHJjkcK58YIGeqGwJ/bjZnVJIB4sP0iqeQQF7VI6/xSM59?=
 =?us-ascii?Q?ylSu6+bvkgcyHTK2v5C/NHPOeza2q3bP4mWnQpcoFAhFevtpqTFWuVzRa1Zx?=
 =?us-ascii?Q?aNuxmjoFXMLFjlRlRT2uX3VRG82k/P95hij2XuA/37SUstJT3xWpqPZ6dAVz?=
 =?us-ascii?Q?mfqIvSBOukqWX2r4LOKAvei9z1Bo4Mp4RRLixH30lnrJrMN+S20adQ6R267M?=
 =?us-ascii?Q?pdUA+rYjA1a1QBz0E+c=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 18:32:46.5847 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56941ebf-aa8f-4987-dfc4-08de39acd8be
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5983
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
 drivers/accel/amdxdna/aie2_message.c | 50 +++++++++++++++-------------
 1 file changed, 26 insertions(+), 24 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 03b75757a6e6..9ec973028221 100644
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
@@ -214,13 +227,14 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
 		return ret;
 
 	hwctx->fw_ctx_id = resp.context_id;
-	WARN_ONCE(hwctx->fw_ctx_id == -1, "Unexpected context id");
+	if (WARN_ON_ONCE(hwctx->fw_ctx_id == -1))
+		return -EINVAL;
 
 	if (ndev->force_preempt_enabled) {
 		ret = aie2_runtime_cfg(ndev, AIE2_RT_CFG_FORCE_PREEMPT, &hwctx->fw_ctx_id);
 		if (ret) {
 			XDNA_ERR(xdna, "failed to enable force preempt %d", ret);
-			return ret;
+			goto del_ctx_req;
 		}
 	}
 
@@ -237,51 +251,39 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
 
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

