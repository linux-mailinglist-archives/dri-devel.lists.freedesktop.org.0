Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A569E46EC
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 22:38:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 298E610E595;
	Wed,  4 Dec 2024 21:38:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="G57Zt1Tc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2072.outbound.protection.outlook.com [40.107.243.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0FEA10E595
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 21:38:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wRRfcvOsfc7Daz4wpWkSHulvCGy20P8YeA9YSD7J4C5R/hCfsLvGcEJfVaXQmaQyqiO2AK+iChxtRENaHvHSUoE+ZdxZSikkCL7fJcwrTUViiSWBpznwvp1VJdYArwV6ia2Ja9PuhQ7iiNMjpYrVXF7jqraaJo9f5Ao42Abcuc21pNJPZVQNZVXC+uOtpukrN0ka0PgjgkVEmHdL9RFgCT9/k2FgUXwvJHBOgjhM3FsCNUyqASl4GwkaJb0+jhtr3NTusjEJcQWWc4ojrY0Fw0EaYCsbF7CDt6NBznVKNwcT9nzZ+RI96dqbh8oz58LbEIzkmvmwHZ3FS01Beg/LWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IMDfuzZoJZ5qqlM+9BuSLD77N17Dv5gxsaPLck+SDws=;
 b=OzZPRTVCcQYNd7wet2g/CNlH+iP180rLhM7gx9qw5CpWlKm13JVQJWRmunffGmzOhzuas7BsbB0t+kJYA852PYCeHoOfBcD1waud9VXuHrfsrQzXMwPi/7ddQKFLzf3bPLmH9QbX2a5qBYKlM6/YDVQL1Z0o6mS/MvIODYUtTJ7qGC7duwynKSvXPuB5lr6se5w/h57aCgSk3qgj+GpWzxwXi/rNQdhy6PszNGvm3OyPD9sG0DBaB1A/XVFiu1//jFcTNPkdM2agAg9zNW2083PzO8dv0JLDDLFGiPNYK7lkL/CUhfSa7aDYByaA8BrbiCsTLmgOZuSwBm56iK706Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IMDfuzZoJZ5qqlM+9BuSLD77N17Dv5gxsaPLck+SDws=;
 b=G57Zt1TcR9ry48T3497uwp2nu8Jebcdyn6L2IppMnw4SUJ6ODzdljtCMQhA2r6UbHCckFTpmJxGvbuUoEYR65aiOBZOK2UgOaASu6myKrDlIrKPtvh+D1r2/TZRu7TWoYr3JBdVkjDrxcfQKW3/+Mm1iXL+ztmQxPifnlrWr6u0=
Received: from CH0PR03CA0259.namprd03.prod.outlook.com (2603:10b6:610:e5::24)
 by IA1PR12MB7494.namprd12.prod.outlook.com (2603:10b6:208:41a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Wed, 4 Dec
 2024 21:38:39 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::e5) by CH0PR03CA0259.outlook.office365.com
 (2603:10b6:610:e5::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.18 via Frontend Transport; Wed,
 4 Dec 2024 21:38:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Wed, 4 Dec 2024 21:38:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Dec
 2024 15:38:38 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 4 Dec 2024 15:38:38 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1 1/7] accel/amdxdna: Add device status for aie2 devices
Date: Wed, 4 Dec 2024 13:37:23 -0800
Message-ID: <20241204213729.3113941-2-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241204213729.3113941-1-lizhi.hou@amd.com>
References: <20241204213729.3113941-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|IA1PR12MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: 83cd3e5e-d99f-422b-767c-08dd14ac0457
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pB5DAJyMwoeMy3XhKiQ2dMhdQVHQm8AqTi4NDlMkK7oTDHjIwkmq6dFEzwtM?=
 =?us-ascii?Q?XfTJ/y8/XvKLEy/6+nQFjVHQG+o1RlKogeTHiteA59m6PYOjKMeZD6RX2fpB?=
 =?us-ascii?Q?7P7KL2Z8M96/JcJ7CzbzkCumOW3pMhSCVSaOW1A3EqopW/KG1v6FcVEyFhOx?=
 =?us-ascii?Q?Shb5ltluJAgiU9bKz5cUJhIxVOOwuTsitMsYf+HZuEqo7ScO+Mxjmb4xRH3v?=
 =?us-ascii?Q?kDwLntNzWt5UyCLXC2ZeS/OKow7WsVH+TFxHyWcunCh06Y2bABltUUIN8A/Z?=
 =?us-ascii?Q?gBGgfgjO7qVTQw2b8vJfHT/NgfmeEu+LW5rll89lu2wLlt+DhPDc8noV4t60?=
 =?us-ascii?Q?IAGGZWbqziGmUvk9JM69cxGkomtC42cUvWJMBepaSql5eC8aDZq4MCR4JoAN?=
 =?us-ascii?Q?UI6aZ6G9ySLndr5vtu7xM/FbTRoSBp9eQp2h+14yc7HJQbJumwRcotYWIk8Q?=
 =?us-ascii?Q?RNAs5KDo1b0gz6+E47oFoSFLOH4L/sv9NEDBIV+1WPlK2LnusY5M3MauKKVJ?=
 =?us-ascii?Q?nHy+CsETHHbKMdWxLQ8Eh+r75JWuRYAgBBYo/qJ4zQmXT7W9Qe21gZeO3bXB?=
 =?us-ascii?Q?5J/PYs5HbT5LjrJy4E5Oju+DpkrUeNNLL/QLJVixSYbbVLDLHFiJs3qx8ur2?=
 =?us-ascii?Q?TM0CF4E0DQ6G9pS14un/wZMcZY8cka8vqX6O39yGZx+K3w09IcdJUWtAVr73?=
 =?us-ascii?Q?a8eFfNMm5+0VOKniUBBEbUunDslRcMws9vPi08WHFuz/Xmxt9ENhbO4DKtf5?=
 =?us-ascii?Q?T7YSX2C4mWPbNzepTf26WU7Zjiu1qbReuNJ/dwAL9R1Qcm2c+SUoDCj2Y36Q?=
 =?us-ascii?Q?S3IqhP6Ejug5f4IDPJ0kUZKnSLynKkZLobzXhnb5jqzgQGqpYh4nU9mnfHtO?=
 =?us-ascii?Q?moo4eFJzk/ILNbRO9qE2Lz6xcKZRL8qpX7zMhAnoN8WLIZpK8eD1uhGlk70N?=
 =?us-ascii?Q?RP5UACJhZNKYnfCDWi44JnsKp/HbfyU9FKKnmjafdQnI+rEb5CXu8jW4Cy/p?=
 =?us-ascii?Q?WyeA1KFsFUSGI0GCkNoY/P1MBDcYrI8yZA+1Iap0iNu/DEwMrJsb3NhvE+SR?=
 =?us-ascii?Q?F9e1SBHS8qgcjiqpwKqagh2kbf6SmuaSkImZNB8sI7lAxNrAC3OnYM2kWq3V?=
 =?us-ascii?Q?j7VipGHnJdIQRDcyCcpNOF+F2BTl1xFAT7BWC6Rkw1Jehj77wrk/og6wfwrf?=
 =?us-ascii?Q?IJpM3H2vQe7XDTDo949Rf9ha7M35HYZwLx1Ix/HjGd9ElyzpzaMHaL708L/q?=
 =?us-ascii?Q?K1HjtX+pVaZQtOLFlfKlEhVMAC8NDl8zV/IQzrn10QFM39X1uSll6dGW9ZPG?=
 =?us-ascii?Q?GqGmEeY5t2iqh4T/68ZstASiLothLo6mfzYPPeGc557PbGc/RA7UBOcgWoTB?=
 =?us-ascii?Q?4+JrRkRfjJK1KSEFxAPQ4aUZKs/fKgukYcGCFSGvQD6RZpUYDClMkbX1yj0A?=
 =?us-ascii?Q?p/I+tymHeqDmHHjMa9lXtTl7rxkRmmeg?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2024 21:38:39.5468 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83cd3e5e-d99f-422b-767c-08dd14ac0457
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7494
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

Add device status to track if aie2_hw_start() or aie2_hw_stop() is
re-entered. In aie2_hw_stop(), call drmm_kfree to free mbox.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_pci.c        | 17 +++++++++++++++++
 drivers/accel/amdxdna/aie2_pci.h        |  7 +++++++
 drivers/accel/amdxdna/amdxdna_mailbox.c |  6 ------
 3 files changed, 24 insertions(+), 6 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 349ada697e48..19c76b2b204b 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -267,12 +267,22 @@ static void aie2_hw_stop(struct amdxdna_dev *xdna)
 	struct pci_dev *pdev = to_pci_dev(xdna->ddev.dev);
 	struct amdxdna_dev_hdl *ndev = xdna->dev_handle;
 
+	if (ndev->dev_status <= AIE2_DEV_INIT) {
+		XDNA_ERR(xdna, "device is already stopped");
+		return;
+	}
+
 	aie2_mgmt_fw_fini(ndev);
 	xdna_mailbox_stop_channel(ndev->mgmt_chann);
 	xdna_mailbox_destroy_channel(ndev->mgmt_chann);
+	ndev->mgmt_chann = NULL;
+	drmm_kfree(&xdna->ddev, ndev->mbox);
+	ndev->mbox = NULL;
 	aie2_psp_stop(ndev->psp_hdl);
 	aie2_smu_fini(ndev);
 	pci_disable_device(pdev);
+
+	ndev->dev_status = AIE2_DEV_INIT;
 }
 
 static int aie2_hw_start(struct amdxdna_dev *xdna)
@@ -283,6 +293,11 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
 	u32 xdna_mailbox_intr_reg;
 	int mgmt_mb_irq, ret;
 
+	if (ndev->dev_status >= AIE2_DEV_START) {
+		XDNA_INFO(xdna, "device is already started");
+		return 0;
+	}
+
 	ret = pci_enable_device(pdev);
 	if (ret) {
 		XDNA_ERR(xdna, "failed to enable device, ret %d", ret);
@@ -345,6 +360,8 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
 		goto destroy_mgmt_chann;
 	}
 
+	ndev->dev_status = AIE2_DEV_START;
+
 	return 0;
 
 destroy_mgmt_chann:
diff --git a/drivers/accel/amdxdna/aie2_pci.h b/drivers/accel/amdxdna/aie2_pci.h
index 6a2686255c9c..5d262ae5c9bb 100644
--- a/drivers/accel/amdxdna/aie2_pci.h
+++ b/drivers/accel/amdxdna/aie2_pci.h
@@ -149,6 +149,11 @@ struct amdxdna_hwctx_priv {
 	struct drm_syncobj		*syncobj;
 };
 
+enum aie2_dev_status {
+	AIE2_DEV_INIT,
+	AIE2_DEV_START,
+};
+
 struct amdxdna_dev_hdl {
 	struct amdxdna_dev		*xdna;
 	const struct amdxdna_dev_priv	*priv;
@@ -171,6 +176,8 @@ struct amdxdna_dev_hdl {
 	struct mailbox			*mbox;
 	struct mailbox_channel		*mgmt_chann;
 	struct async_events		*async_events;
+
+	u32				dev_status;
 };
 
 #define DEFINE_BAR_OFFSET(reg_name, bar, reg_addr) \
diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index 415d99abaaa3..eab79dbb8b25 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -530,9 +530,6 @@ xdna_mailbox_create_channel(struct mailbox *mb,
 
 int xdna_mailbox_destroy_channel(struct mailbox_channel *mb_chann)
 {
-	if (!mb_chann)
-		return 0;
-
 	MB_DBG(mb_chann, "IRQ disabled and RX work cancelled");
 	free_irq(mb_chann->msix_irq, mb_chann);
 	destroy_workqueue(mb_chann->work_q);
@@ -548,9 +545,6 @@ int xdna_mailbox_destroy_channel(struct mailbox_channel *mb_chann)
 
 void xdna_mailbox_stop_channel(struct mailbox_channel *mb_chann)
 {
-	if (!mb_chann)
-		return;
-
 	/* Disable an irq and wait. This might sleep. */
 	disable_irq(mb_chann->msix_irq);
 
-- 
2.34.1

