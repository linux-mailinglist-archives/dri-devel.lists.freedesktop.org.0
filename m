Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBK4GssgqWnh2QAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 07:20:59 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBDE920B701
	for <lists+dri-devel@lfdr.de>; Thu, 05 Mar 2026 07:20:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF4210EB18;
	Thu,  5 Mar 2026 06:20:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="u9jyR57H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010068.outbound.protection.outlook.com
 [52.101.193.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D23E10EB18
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Mar 2026 06:20:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w7lbVMJnbeyaARDGK+/hUYPq25F4e6xLrG3NYY9/RB84LMpIa9RiNNcEpQtuRQOSc0g+VR0jKw96heZYHCTrcMHYvGDcN/IUDANrcMe2pRDFyJ2EUWZCsq9P65nZ0fz2eOlTY9YDDZmcBWIvqwitjSU9NKpDUbjy7WGMmFoGbUKFcaOhBgHN/zTPJJNWwYjG3IGDf4ZTZ7ZNsq4v10egOIePQ1s+65mbEz7F4s54eBAcdIPCpVTj4iwk/PcHabhjRFEzw1hLGVj1Y1VKaZTztE3XKKTF7/ZeFjbaFDfsUv6QtCYBYDxNROyRD18J9LNYI3A8eoxz/q8b8rRYaRHFYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBoGAP4qapA3f7uOpqWn8kiZ7BsAZDoHO4+JuiBkkUQ=;
 b=fxax7WjGf4yQ18ZjTtDOYERdvNgnujKwsQZYq1Wbsg/ixC1ZL1bL3stM+mn/3doBlpX6Gr2zTI8xhBIBNENIC4u3y8AGRR0m71sXwZ/rSp2+4DfnEuDWDqBEM/vWRI5nmCOF91igjZVXqoCd1/FlEWRxiwUB1jSrcsakCnevI2LkqHWUjfC9t76CvkdDYJkw/3y8A/euNWZ47w8dTn+LKsW5kieZcbXoY+6M2o3eEDfncypYiNvBlW36JwPYfo30Uywye95rLYZd6RoaHPgs8FKAbEZ0Iu8K8G2aELjCUOwnwHBhXpwpeNaB+bHFCJqzz9h3yQi3QEr0UWsSsU9QrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBoGAP4qapA3f7uOpqWn8kiZ7BsAZDoHO4+JuiBkkUQ=;
 b=u9jyR57Hnmyxa189vRwe38CgwEq5NdQK1FZQi8ykWZgUXNuMgTz017BGRfP1TLKXOSV69ojAyIPjpsPB/iFgkZrJS+2CcvTgRS9qBtVBmTWD/LM/X6AOS4rtCwmkkGP31KoHrE+hUxhOCcI3AWyMtP7AA9y6I8Kgu7OnA9Cqoyk=
Received: from PH1PEPF000132F8.NAMP220.PROD.OUTLOOK.COM (2603:10b6:518:1::29)
 by CH3PR12MB9453.namprd12.prod.outlook.com (2603:10b6:610:1c9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 06:20:48 +0000
Received: from SJ1PEPF000023D4.namprd21.prod.outlook.com
 (2a01:111:f403:c902::13) by PH1PEPF000132F8.outlook.office365.com
 (2603:1036:903:47::3) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.23 via Frontend Transport; Thu,
 5 Mar 2026 06:20:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D4.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9700.0 via Frontend Transport; Thu, 5 Mar 2026 06:20:47 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Mar
 2026 00:20:47 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 5 Mar
 2026 00:20:46 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Thu, 5 Mar 2026 00:20:46 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Split mailbox channel create function
Date: Wed, 4 Mar 2026 22:20:41 -0800
Message-ID: <20260305062041.3954024-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D4:EE_|CH3PR12MB9453:EE_
X-MS-Office365-Filtering-Correlation-Id: ef9ed6d1-52d2-47a0-a3ab-08de7a7f574e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|376014|36860700016; 
X-Microsoft-Antispam-Message-Info: +gVUtIIr2kzGhgi0XRPAfL5USGLzQVz5fvoty+MYnFjQlrv9euSOtVHgu4bnKiGl8f2R5F6Abxf5uccsPX9wiDCx7YmkkAAY+R8tYSOFp+ttMF7MnjlhsFCpzd82hbnhPWUd/wFaqdT3aS9Y3SWZ+S2HhPwUSlGAQzr738peIEAr2xD0LESFZnusDJi+83kXNikT2EQd5PH3b0Jvj0Uw88vVJShKyI4e2XmkcgXvw1zQQdnY5w/rWdVdmniZgrP7V5WSvyQ1kKUxCYdSSaObDunazfmmQ2PaL1Dv/Vu1pNc1uc91PpP7Y1+P0Kyjqog+9gtILgV40NugsSrzD/a76wHe5/hMzSSt09AHE2VeJMWJivbbDttiV2VnNN/b3wJrkkC5AWVC/UNoKkXj7M9i16yF9kXGzus3t8QRAUUujr0M3wEsorGnJd9T2+IOFFmb9yDTAhIyj81AWcQZexbjhcKOjLoYyOdBHx8OPcPYGVhi8qzOdHP6WmzAofhOZYHgm/YHqAPjiGWwKyprEOh+QQPWpDCDOtFoXVrk9kURHlAkUpc6FE4PRyxR+JR0Woh42dNzNmBAX0dOllrcA7y9eRF+rXnl2lD+cdKayBSQ+q912XgCcxBWxjBpnfb+9lFI5O0KD9oPbbMmQTDkUgUlTGfwGJ4h4cDUFLjKwtIgtUbbtvlnQVe6pZVzyTHA44DJ8/voHWjhq/Tap2pwhESHF14LyoDwcH/Eqmo2zjkSMeDoKiDx0tUXsnqStArbo8lHHEMS3W8rGFemLFUkfHG6bQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: dpxC0Cth4bqJZLhURyo8nrX/cqEntxQUq+UTpuxY2ecQyaceR1eJdWFLir8PMhhcXGiviHqgnTN51PCVpzl7ZkrUZpkqxuGhXn0yNJVXwP8gluLhhK/tenyDGSADBx/zl6BFv3jw24qPKH9Y/Pfq3xSOi/st9qJPPMcdayrF/TIt70WaYsrSLXa9DW/kWNnJJ0IfaowdbkpiDz4Zez/rxuHEc09jWVGJ51TTrHBoMzQB402qVhGy4mxVC8kidWrqIz5C+tvgYS8ORdqLepg7D8kC7efQtWyFkBFXJJEB/6/IgLKbH1wBLve5dkf5LJVacASa0X/411Xjfaqeq4KyEGsHEB9AhGnm2iDBG/kLrfPGQNOTSDbNrlWyxTA2+EAVFOwuRdjUQLpLGSyl8t0CpGnzVE0fku9zyakkOoyuOcxnmbRkfIV57Ic7kcXltiVQ
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 06:20:47.6283 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef9ed6d1-52d2-47a0-a3ab-08de7a7f574e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023D4.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9453
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
X-Rspamd-Queue-Id: BBDE920B701
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
	FORGED_RECIPIENTS(0.00)[m:ogabbay@kernel.org,m:quic_jhugo@quicinc.com,m:maciej.falkowski@linux.intel.com,m:lizhi.hou@amd.com,m:linux-kernel@vger.kernel.org,m:max.zhen@amd.com,m:sonal.santan@amd.com,m:mario.limonciello@amd.com,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:dkim,amd.com:email,amd.com:mid,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Action: no action

The management channel used for firmware control command submission is
currently created after the firmware is started. If channel creation
fails (for example, due to memory allocation failure or workqueue
creation interruption), the firmware remains in a pending state and is
unable to receive any control commands.

To avoid leaving the firmware in this inconsistent state, split
xdna_mailbox_create_channel() into two separate functions so that
resource allocation can be completed before interacting with the
hardware.
  xdna_mailbox_alloc_channel()
    Allocates memory and initializes the workqueue. This can be called
    earlier, before interacting with the hardware.
  xdna_mailbox_start_channel()
    Performs the hardware interaction required to start the channel.

Rename xdna_mailbox_destroy_channel() to xdna_mailbox_free_channel().
Ensure that xdna_mailbox_stop_channel() and xdna_mailbox_free_channel()
properly unwind the corresponding start and allocation steps, respectively.

Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_message.c    | 17 +++--
 drivers/accel/amdxdna/aie2_pci.c        | 63 ++++++++++-------
 drivers/accel/amdxdna/amdxdna_mailbox.c | 91 ++++++++++++-------------
 drivers/accel/amdxdna/amdxdna_mailbox.h | 31 +++++----
 4 files changed, 112 insertions(+), 90 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_message.c b/drivers/accel/amdxdna/aie2_message.c
index 22e1a85a7ae0..ffcf3be79e23 100644
--- a/drivers/accel/amdxdna/aie2_message.c
+++ b/drivers/accel/amdxdna/aie2_message.c
@@ -293,13 +293,20 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
 	}
 
 	intr_reg = i2x.mb_head_ptr_reg + 4;
-	hwctx->priv->mbox_chann = xdna_mailbox_create_channel(ndev->mbox, &x2i, &i2x,
-							      intr_reg, ret);
+	hwctx->priv->mbox_chann = xdna_mailbox_alloc_channel(ndev->mbox);
 	if (!hwctx->priv->mbox_chann) {
 		XDNA_ERR(xdna, "Not able to create channel");
 		ret = -EINVAL;
 		goto del_ctx_req;
 	}
+
+	ret = xdna_mailbox_start_channel(hwctx->priv->mbox_chann, &x2i, &i2x,
+					 intr_reg, ret);
+	if (ret) {
+		XDNA_ERR(xdna, "Not able to create channel");
+		ret = -EINVAL;
+		goto free_channel;
+	}
 	ndev->hwctx_num++;
 
 	XDNA_DBG(xdna, "Mailbox channel irq: %d, msix_id: %d", ret, resp.msix_id);
@@ -307,6 +314,8 @@ int aie2_create_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwct
 
 	return 0;
 
+free_channel:
+	xdna_mailbox_free_channel(hwctx->priv->mbox_chann);
 del_ctx_req:
 	aie2_destroy_context_req(ndev, hwctx->fw_ctx_id);
 	return ret;
@@ -322,7 +331,7 @@ int aie2_destroy_context(struct amdxdna_dev_hdl *ndev, struct amdxdna_hwctx *hwc
 
 	xdna_mailbox_stop_channel(hwctx->priv->mbox_chann);
 	ret = aie2_destroy_context_req(ndev, hwctx->fw_ctx_id);
-	xdna_mailbox_destroy_channel(hwctx->priv->mbox_chann);
+	xdna_mailbox_free_channel(hwctx->priv->mbox_chann);
 	XDNA_DBG(xdna, "Destroyed fw ctx %d", hwctx->fw_ctx_id);
 	hwctx->priv->mbox_chann = NULL;
 	hwctx->fw_ctx_id = -1;
@@ -921,7 +930,7 @@ void aie2_destroy_mgmt_chann(struct amdxdna_dev_hdl *ndev)
 		return;
 
 	xdna_mailbox_stop_channel(ndev->mgmt_chann);
-	xdna_mailbox_destroy_channel(ndev->mgmt_chann);
+	xdna_mailbox_free_channel(ndev->mgmt_chann);
 	ndev->mgmt_chann = NULL;
 }
 
diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 977ce21eaf9f..4924a9da55b6 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -361,10 +361,29 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
 	}
 	pci_set_master(pdev);
 
+	mbox_res.ringbuf_base = ndev->sram_base;
+	mbox_res.ringbuf_size = pci_resource_len(pdev, xdna->dev_info->sram_bar);
+	mbox_res.mbox_base = ndev->mbox_base;
+	mbox_res.mbox_size = MBOX_SIZE(ndev);
+	mbox_res.name = "xdna_mailbox";
+	ndev->mbox = xdnam_mailbox_create(&xdna->ddev, &mbox_res);
+	if (!ndev->mbox) {
+		XDNA_ERR(xdna, "failed to create mailbox device");
+		ret = -ENODEV;
+		goto disable_dev;
+	}
+
+	ndev->mgmt_chann = xdna_mailbox_alloc_channel(ndev->mbox);
+	if (!ndev->mgmt_chann) {
+		XDNA_ERR(xdna, "failed to alloc channel");
+		ret = -ENODEV;
+		goto disable_dev;
+	}
+
 	ret = aie2_smu_init(ndev);
 	if (ret) {
 		XDNA_ERR(xdna, "failed to init smu, ret %d", ret);
-		goto disable_dev;
+		goto free_channel;
 	}
 
 	ret = aie2_psp_start(ndev->psp_hdl);
@@ -379,18 +398,6 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
 		goto stop_psp;
 	}
 
-	mbox_res.ringbuf_base = ndev->sram_base;
-	mbox_res.ringbuf_size = pci_resource_len(pdev, xdna->dev_info->sram_bar);
-	mbox_res.mbox_base = ndev->mbox_base;
-	mbox_res.mbox_size = MBOX_SIZE(ndev);
-	mbox_res.name = "xdna_mailbox";
-	ndev->mbox = xdnam_mailbox_create(&xdna->ddev, &mbox_res);
-	if (!ndev->mbox) {
-		XDNA_ERR(xdna, "failed to create mailbox device");
-		ret = -ENODEV;
-		goto stop_psp;
-	}
-
 	mgmt_mb_irq = pci_irq_vector(pdev, ndev->mgmt_chan_idx);
 	if (mgmt_mb_irq < 0) {
 		ret = mgmt_mb_irq;
@@ -399,13 +406,13 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
 	}
 
 	xdna_mailbox_intr_reg = ndev->mgmt_i2x.mb_head_ptr_reg + 4;
-	ndev->mgmt_chann = xdna_mailbox_create_channel(ndev->mbox,
-						       &ndev->mgmt_x2i,
-						       &ndev->mgmt_i2x,
-						       xdna_mailbox_intr_reg,
-						       mgmt_mb_irq);
-	if (!ndev->mgmt_chann) {
-		XDNA_ERR(xdna, "failed to create management mailbox channel");
+	ret = xdna_mailbox_start_channel(ndev->mgmt_chann,
+					 &ndev->mgmt_x2i,
+					 &ndev->mgmt_i2x,
+					 xdna_mailbox_intr_reg,
+					 mgmt_mb_irq);
+	if (ret) {
+		XDNA_ERR(xdna, "failed to start management mailbox channel");
 		ret = -EINVAL;
 		goto stop_psp;
 	}
@@ -413,37 +420,41 @@ static int aie2_hw_start(struct amdxdna_dev *xdna)
 	ret = aie2_mgmt_fw_init(ndev);
 	if (ret) {
 		XDNA_ERR(xdna, "initial mgmt firmware failed, ret %d", ret);
-		goto destroy_mgmt_chann;
+		goto stop_fw;
 	}
 
 	ret = aie2_pm_init(ndev);
 	if (ret) {
 		XDNA_ERR(xdna, "failed to init pm, ret %d", ret);
-		goto destroy_mgmt_chann;
+		goto stop_fw;
 	}
 
 	ret = aie2_mgmt_fw_query(ndev);
 	if (ret) {
 		XDNA_ERR(xdna, "failed to query fw, ret %d", ret);
-		goto destroy_mgmt_chann;
+		goto stop_fw;
 	}
 
 	ret = aie2_error_async_events_alloc(ndev);
 	if (ret) {
 		XDNA_ERR(xdna, "Allocate async events failed, ret %d", ret);
-		goto destroy_mgmt_chann;
+		goto stop_fw;
 	}
 
 	ndev->dev_status = AIE2_DEV_START;
 
 	return 0;
 
-destroy_mgmt_chann:
-	aie2_destroy_mgmt_chann(ndev);
+stop_fw:
+	aie2_suspend_fw(ndev);
+	xdna_mailbox_stop_channel(ndev->mgmt_chann);
 stop_psp:
 	aie2_psp_stop(ndev->psp_hdl);
 fini_smu:
 	aie2_smu_fini(ndev);
+free_channel:
+	xdna_mailbox_free_channel(ndev->mgmt_chann);
+	ndev->mgmt_chann = NULL;
 disable_dev:
 	pci_disable_device(pdev);
 
diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index 235a94047530..46d844a73a94 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -460,26 +460,49 @@ int xdna_mailbox_send_msg(struct mailbox_channel *mb_chann,
 	return ret;
 }
 
-struct mailbox_channel *
-xdna_mailbox_create_channel(struct mailbox *mb,
-			    const struct xdna_mailbox_chann_res *x2i,
-			    const struct xdna_mailbox_chann_res *i2x,
-			    u32 iohub_int_addr,
-			    int mb_irq)
+struct mailbox_channel *xdna_mailbox_alloc_channel(struct mailbox *mb)
 {
 	struct mailbox_channel *mb_chann;
-	int ret;
-
-	if (!is_power_of_2(x2i->rb_size) || !is_power_of_2(i2x->rb_size)) {
-		pr_err("Ring buf size must be power of 2");
-		return NULL;
-	}
 
 	mb_chann = kzalloc_obj(*mb_chann);
 	if (!mb_chann)
 		return NULL;
 
+	INIT_WORK(&mb_chann->rx_work, mailbox_rx_worker);
+	mb_chann->work_q = create_singlethread_workqueue(MAILBOX_NAME);
+	if (!mb_chann->work_q) {
+		MB_ERR(mb_chann, "Create workqueue failed");
+		goto free_chann;
+	}
 	mb_chann->mb = mb;
+
+	return mb_chann;
+
+free_chann:
+	kfree(mb_chann);
+	return NULL;
+}
+
+void xdna_mailbox_free_channel(struct mailbox_channel *mb_chann)
+{
+	destroy_workqueue(mb_chann->work_q);
+	kfree(mb_chann);
+}
+
+int
+xdna_mailbox_start_channel(struct mailbox_channel *mb_chann,
+			   const struct xdna_mailbox_chann_res *x2i,
+			   const struct xdna_mailbox_chann_res *i2x,
+			   u32 iohub_int_addr,
+			   int mb_irq)
+{
+	int ret;
+
+	if (!is_power_of_2(x2i->rb_size) || !is_power_of_2(i2x->rb_size)) {
+		pr_err("Ring buf size must be power of 2");
+		return -EINVAL;
+	}
+
 	mb_chann->msix_irq = mb_irq;
 	mb_chann->iohub_int_addr = iohub_int_addr;
 	memcpy(&mb_chann->res[CHAN_RES_X2I], x2i, sizeof(*x2i));
@@ -489,61 +512,37 @@ xdna_mailbox_create_channel(struct mailbox *mb,
 	mb_chann->x2i_tail = mailbox_get_tailptr(mb_chann, CHAN_RES_X2I);
 	mb_chann->i2x_head = mailbox_get_headptr(mb_chann, CHAN_RES_I2X);
 
-	INIT_WORK(&mb_chann->rx_work, mailbox_rx_worker);
-	mb_chann->work_q = create_singlethread_workqueue(MAILBOX_NAME);
-	if (!mb_chann->work_q) {
-		MB_ERR(mb_chann, "Create workqueue failed");
-		goto free_and_out;
-	}
-
 	/* Everything look good. Time to enable irq handler */
 	ret = request_irq(mb_irq, mailbox_irq_handler, 0, MAILBOX_NAME, mb_chann);
 	if (ret) {
 		MB_ERR(mb_chann, "Failed to request irq %d ret %d", mb_irq, ret);
-		goto destroy_wq;
+		return ret;
 	}
 
 	mb_chann->bad_state = false;
 	mailbox_reg_write(mb_chann, mb_chann->iohub_int_addr, 0);
 
-	MB_DBG(mb_chann, "Mailbox channel created (irq: %d)", mb_chann->msix_irq);
-	return mb_chann;
-
-destroy_wq:
-	destroy_workqueue(mb_chann->work_q);
-free_and_out:
-	kfree(mb_chann);
-	return NULL;
+	MB_DBG(mb_chann, "Mailbox channel started (irq: %d)", mb_chann->msix_irq);
+	return 0;
 }
 
-int xdna_mailbox_destroy_channel(struct mailbox_channel *mb_chann)
+void xdna_mailbox_stop_channel(struct mailbox_channel *mb_chann)
 {
 	struct mailbox_msg *mb_msg;
 	unsigned long msg_id;
 
-	MB_DBG(mb_chann, "IRQ disabled and RX work cancelled");
+	/* Disable an irq and wait. This might sleep. */
 	free_irq(mb_chann->msix_irq, mb_chann);
-	destroy_workqueue(mb_chann->work_q);
-	/* We can clean up and release resources */
 
+	/* Cancel RX work and wait for it to finish */
+	drain_workqueue(mb_chann->work_q);
+
+	/* We can clean up and release resources */
 	xa_for_each(&mb_chann->chan_xa, msg_id, mb_msg)
 		mailbox_release_msg(mb_chann, mb_msg);
-
 	xa_destroy(&mb_chann->chan_xa);
 
-	MB_DBG(mb_chann, "Mailbox channel destroyed, irq: %d", mb_chann->msix_irq);
-	kfree(mb_chann);
-	return 0;
-}
-
-void xdna_mailbox_stop_channel(struct mailbox_channel *mb_chann)
-{
-	/* Disable an irq and wait. This might sleep. */
-	disable_irq(mb_chann->msix_irq);
-
-	/* Cancel RX work and wait for it to finish */
-	cancel_work_sync(&mb_chann->rx_work);
-	MB_DBG(mb_chann, "IRQ disabled and RX work cancelled");
+	MB_DBG(mb_chann, "Mailbox channel stopped, irq: %d", mb_chann->msix_irq);
 }
 
 struct mailbox *xdnam_mailbox_create(struct drm_device *ddev,
diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.h b/drivers/accel/amdxdna/amdxdna_mailbox.h
index ea367f2fb738..8b1e00945da4 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.h
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.h
@@ -74,9 +74,16 @@ struct mailbox *xdnam_mailbox_create(struct drm_device *ddev,
 				     const struct xdna_mailbox_res *res);
 
 /*
- * xdna_mailbox_create_channel() -- Create a mailbox channel instance
+ * xdna_mailbox_alloc_channel() -- alloc a mailbox channel
  *
- * @mailbox: the handle return from xdna_mailbox_create()
+ * @mb: mailbox handle
+ */
+struct mailbox_channel *xdna_mailbox_alloc_channel(struct mailbox *mb);
+
+/*
+ * xdna_mailbox_start_channel() -- start a mailbox channel instance
+ *
+ * @mb_chann: the handle return from xdna_mailbox_alloc_channel()
  * @x2i: host to firmware mailbox resources
  * @i2x: firmware to host mailbox resources
  * @xdna_mailbox_intr_reg: register addr of MSI-X interrupt
@@ -84,28 +91,24 @@ struct mailbox *xdnam_mailbox_create(struct drm_device *ddev,
  *
  * Return: If success, return a handle of mailbox channel. Otherwise, return NULL.
  */
-struct mailbox_channel *
-xdna_mailbox_create_channel(struct mailbox *mailbox,
-			    const struct xdna_mailbox_chann_res *x2i,
-			    const struct xdna_mailbox_chann_res *i2x,
-			    u32 xdna_mailbox_intr_reg,
-			    int mb_irq);
+int
+xdna_mailbox_start_channel(struct mailbox_channel *mb_chann,
+			   const struct xdna_mailbox_chann_res *x2i,
+			   const struct xdna_mailbox_chann_res *i2x,
+			   u32 xdna_mailbox_intr_reg,
+			   int mb_irq);
 
 /*
- * xdna_mailbox_destroy_channel() -- destroy mailbox channel
+ * xdna_mailbox_free_channel() -- free mailbox channel
  *
  * @mailbox_chann: the handle return from xdna_mailbox_create_channel()
- *
- * Return: if success, return 0. otherwise return error code
  */
-int xdna_mailbox_destroy_channel(struct mailbox_channel *mailbox_chann);
+void xdna_mailbox_free_channel(struct mailbox_channel *mailbox_chann);
 
 /*
  * xdna_mailbox_stop_channel() -- stop mailbox channel
  *
  * @mailbox_chann: the handle return from xdna_mailbox_create_channel()
- *
- * Return: if success, return 0. otherwise return error code
  */
 void xdna_mailbox_stop_channel(struct mailbox_channel *mailbox_chann);
 
-- 
2.34.1

