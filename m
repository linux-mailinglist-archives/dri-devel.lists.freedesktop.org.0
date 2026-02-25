Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KJhK9tNn2nNZwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:30:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02B419CB8D
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 20:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45C9910E11B;
	Wed, 25 Feb 2026 19:30:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CNpQUzh+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010043.outbound.protection.outlook.com [52.101.46.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E931D10E11B
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 19:30:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V/eeIuCLZZKSXcHW8rHn6TtAWHvlU916e7y2D+6LtyaJyuXTALY2FtgOvCtDaiViAd/FPZAzyqo0Y5fmDxs4ZeoS7krdwILk/Lpm4dz/89RG4WjFr8ehYcX6BufvqxLUQrMnH3WYAc1iz4444ekMkb2l3SDnQWLD4TCkBkfUhVYJth0gMqmk3ht40DvpWSxrAFgJeWZJ/Rc57F8GN0+q2MHiHbUjroFctOaC15e9ssUAbzpJMe4STBHO1RoO3xM6OcDBWl7PDhDqdiqxsuo4IvuVIMuTeuN9IOIe2yPMSqnIDbuEZDYHm/6vRaKkDhI3Hkv+QEm2R5aaGSKQoa2ZBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TavqAPMaYuYAtwnXMpBcCijoh3tVNzzZ7fX6f4n6ChY=;
 b=yovPwZ3vV5U4VvRux20O4agGsEmuRxAW0rKDPPyXC8xo+/3sD6ke+kU/9Ogvd5ILUhqXqD2TnvKYpytClO5By8Hhw5IPclCL+wrT8grCY17RxpZYPVArn4K5sZouv2nRht5ttp9SRCkbtuZEP4lx7L0Pm56hFBZ2975skuwGVul2fFu97sbHlbXzubUmF9I+vKyRnFYdzou62FrVWgQ0xH8BqcStpGWS2m65Ssl3ULhmHPI+UfZO3VCTsiXYsn2lxRFumVVJgUYVroFs3bBYTYGKx+axCI5d9FTF5pHAy8408BrKx3036escPN5Dtvk/a/CZGg8kEDxEflqrJwPANA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TavqAPMaYuYAtwnXMpBcCijoh3tVNzzZ7fX6f4n6ChY=;
 b=CNpQUzh+rvOj7ZG0+6gdtAOa9bf64tI+6Kwpmo3fMTEFTgdFazFPk/5uyFEK7ZtMJAKbHGD1C6PcI3/7F5YRl9QuonOc8IUMo9RB4vwIPENA4ABZ/yfTTl9Xu4xhwznfBc5y7UxFWkAa2he/6KVBYxfnc8bmak+eykd4j0eacxI=
Received: from CH0PR03CA0085.namprd03.prod.outlook.com (2603:10b6:610:cc::30)
 by DS0PR12MB6536.namprd12.prod.outlook.com (2603:10b6:8:d3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 19:30:25 +0000
Received: from CH2PEPF0000009D.namprd02.prod.outlook.com
 (2603:10b6:610:cc:cafe::c) by CH0PR03CA0085.outlook.office365.com
 (2603:10b6:610:cc::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.24 via Frontend Transport; Wed,
 25 Feb 2026 19:30:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CH2PEPF0000009D.mail.protection.outlook.com (10.167.244.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 19:30:25 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.17; Wed, 25 Feb
 2026 13:30:25 -0600
Received: from satlexmb07.amd.com (10.181.42.216) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 25 Feb
 2026 13:30:25 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 25 Feb 2026 13:30:24 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V1] accel/amdxdna: Use a different name for latest firmware
Date: Wed, 25 Feb 2026 11:30:22 -0800
Message-ID: <20260225193022.2707525-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009D:EE_|DS0PR12MB6536:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d15dae2-a19f-4dc1-51bf-08de74a45390
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: 6cxGKucyQ8ki8RdPA8D1QdWJqld2L4A/BSud7WwS559XqzGWg7GVci7CzD3sTFkP4nWfidODDuLRlXZfqJLxUiptIHV7vWx0Db1YDwauxSj5q5O6JiR5vTqGu9wh8uZdpKKtjzIFnaqRJByatfA3c5YveBAvOpM4IyxHZgvGkUuJ9XbQ54lTM4holmwtKAKkQye3Cvk80cQYwqJUXH03jC1Xu9rtCu39UEYIUwIXDc4fjsN1uoctn9fAVeX9iiTd+WkipHNW67xePSk+bMlarrV2ZQJeMmV9FCyYxpzBShnEDRpmfMJRuEJYufQ3s8ohV4M3xxxtFaEwXb00rBWTUgGg1sgyRC3m8mpNlCm2KcgcwDFQqFOd6fkEK7taoSgpJFHA9ldnX3zZVboxk5ewdPJ4rz/GCXTwIqr2HQ5rSJ9+q2pboEWgHHkXlxtuGIgCQmmLZZrQxqGtWjM7AnwSRNDyiHn1AA2Bk+ooWikUCmJxKz7eL/LRcBV+Zlj7m65sE3C71rrWecLDyO5lxOfkugF+K5Knlbtqs/DzBM+qmDA+pCV4cRsdfBOLpISxd+d2TVfFzL2w5jGmv2pDPGHjZh6lH/6IJPZTvaylg0byYu1fy5S1q8E3PHIlis41L1DyHWyieDmE0CbGydADtsjgX2njCMq7hmuLvasX+hsiHobymRSvhA7qJzchW35EiSPOk39iK6b0M2PPDr6CNDA8OBx4TzSp+zWNoxwf2tN4Z8U1M5uUnIKD71sdXffS2ByTVbmF314i0P73GWx35zr21Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: j06+3zAB8rYIPvcTEccL4ggWFmUwg4d88FUs0hmRxHaTFkuspr6N9f4jvo3dKQLJ1DStVGpJPVqxJfcprefhXAwbrXzvIT1yoQBQB66wTPgrgvFQJuvOWAYXUmzSliNmbmvTQ6d4JrW+/3HEPWxt5kag4Ef8weoPo3p/iJcdxVlWErEoCCNKzdZsQEDrLTlQkev/iC4cLY5o3i3j0sKTzDDBz1AQ4Ekeb+Sq+Rg/7W0S9R4zpla4ytwrVnxnuObXtrog6Whb1pIFhJo0UN0gIx+12r0PdSaL+lZ8ZT9rfuwsOq/hGEWXeHa6qtY8523tiemMeHyNWcsTd8X9sYLxHUnSnINAYr37TkCA6bkNGrmwsSjJcv11qPrYyu4/myFR0Xj09KPvg4n5dJqjP9SQ/c8VGB1P44lRdGVHgEM5unquzzMJoNEDn0uisq8GRkvL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 19:30:25.8081 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d15dae2-a19f-4dc1-51bf-08de74a45390
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000009D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6536
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	FORGED_SENDER(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[lizhi.hou@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: F02B419CB8D
X-Rspamd-Action: no action

Using legacy driver with latest firmware causes a power off issue.

Fix this by assigning a different filename (npu_7.sbin) to the latest
firmware. The driver attempts to load the latest firmware first and falls
back to the previous firmware version if loading fails.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/5009
Fixes: f1eac46fe5f7 ("accel/amdxdna: Update firmware version check for latest firmware")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_pci.c        | 21 +++++++++++++++++++--
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  4 +++-
 drivers/accel/amdxdna/npu1_regs.c       |  2 +-
 drivers/accel/amdxdna/npu4_regs.c       |  2 +-
 drivers/accel/amdxdna/npu5_regs.c       |  2 +-
 drivers/accel/amdxdna/npu6_regs.c       |  2 +-
 6 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 4b3e6bb97bd2..884e7702b674 100644
--- a/drivers/accel/amdxdna/aie2_pci.c
+++ b/drivers/accel/amdxdna/aie2_pci.c
@@ -32,6 +32,11 @@ static int aie2_max_col = XRS_MAX_COL;
 module_param(aie2_max_col, uint, 0600);
 MODULE_PARM_DESC(aie2_max_col, "Maximum column could be used");
 
+static char *npu_fw[] = {
+	"npu_7.sbin",
+	"npu.sbin"
+};
+
 /*
  * The management mailbox channel is allocated by firmware.
  * The related register and ring buffer information is on SRAM BAR.
@@ -489,6 +494,7 @@ static int aie2_init(struct amdxdna_dev *xdna)
 	struct psp_config psp_conf;
 	const struct firmware *fw;
 	unsigned long bars = 0;
+	char *fw_full_path;
 	int i, nvec, ret;
 
 	if (!hypervisor_is_type(X86_HYPER_NATIVE)) {
@@ -503,10 +509,21 @@ static int aie2_init(struct amdxdna_dev *xdna)
 	ndev->priv = xdna->dev_info->dev_priv;
 	ndev->xdna = xdna;
 
-	ret = request_firmware(&fw, ndev->priv->fw_path, &pdev->dev);
+	for (i = 0; i < ARRAY_SIZE(npu_fw); i++) {
+		fw_full_path = kasprintf(GFP_KERNEL, "%s%s", ndev->priv->fw_path,
+					 npu_fw[i]);
+		if (!fw_full_path)
+			return -ENOMEM;
+
+		ret = request_firmware(&fw, fw_full_path, &pdev->dev);
+		kfree(fw_full_path);
+		if (!ret)
+			break;
+	}
+
 	if (ret) {
 		XDNA_ERR(xdna, "failed to request_firmware %s, ret %d",
-			 ndev->priv->fw_path, ret);
+				 ndev->priv->fw_path, ret);
 		return ret;
 	}
 
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 4ada45d06fcf..d5c699e1afe4 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -22,7 +22,9 @@
 MODULE_FIRMWARE("amdnpu/1502_00/npu.sbin");
 MODULE_FIRMWARE("amdnpu/17f0_10/npu.sbin");
 MODULE_FIRMWARE("amdnpu/17f0_11/npu.sbin");
-MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
+MODULE_FIRMWARE("amdnpu/1502_00/npu_7.sbin");
+MODULE_FIRMWARE("amdnpu/17f0_10/npu_7.sbin");
+MODULE_FIRMWARE("amdnpu/17f0_11/npu_7.sbin");
 
 /*
  * 0.0: Initial version
diff --git a/drivers/accel/amdxdna/npu1_regs.c b/drivers/accel/amdxdna/npu1_regs.c
index 6f36a27b5a02..6e3d3ca69c04 100644
--- a/drivers/accel/amdxdna/npu1_regs.c
+++ b/drivers/accel/amdxdna/npu1_regs.c
@@ -72,7 +72,7 @@ static const struct aie2_fw_feature_tbl npu1_fw_feature_table[] = {
 };
 
 static const struct amdxdna_dev_priv npu1_dev_priv = {
-	.fw_path        = "amdnpu/1502_00/npu.sbin",
+	.fw_path        = "amdnpu/1502_00/",
 	.rt_config	= npu1_default_rt_cfg,
 	.dpm_clk_tbl	= npu1_dpm_clk_table,
 	.fw_feature_tbl = npu1_fw_feature_table,
diff --git a/drivers/accel/amdxdna/npu4_regs.c b/drivers/accel/amdxdna/npu4_regs.c
index a8d6f76dde5f..ce25eef5fc34 100644
--- a/drivers/accel/amdxdna/npu4_regs.c
+++ b/drivers/accel/amdxdna/npu4_regs.c
@@ -98,7 +98,7 @@ const struct aie2_fw_feature_tbl npu4_fw_feature_table[] = {
 };
 
 static const struct amdxdna_dev_priv npu4_dev_priv = {
-	.fw_path        = "amdnpu/17f0_10/npu.sbin",
+	.fw_path        = "amdnpu/17f0_10/",
 	.rt_config	= npu4_default_rt_cfg,
 	.dpm_clk_tbl	= npu4_dpm_clk_table,
 	.fw_feature_tbl = npu4_fw_feature_table,
diff --git a/drivers/accel/amdxdna/npu5_regs.c b/drivers/accel/amdxdna/npu5_regs.c
index c0a35cfd886c..c0ac5daf32ee 100644
--- a/drivers/accel/amdxdna/npu5_regs.c
+++ b/drivers/accel/amdxdna/npu5_regs.c
@@ -63,7 +63,7 @@
 #define NPU5_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
 
 static const struct amdxdna_dev_priv npu5_dev_priv = {
-	.fw_path        = "amdnpu/17f0_11/npu.sbin",
+	.fw_path        = "amdnpu/17f0_11/",
 	.rt_config	= npu4_default_rt_cfg,
 	.dpm_clk_tbl	= npu4_dpm_clk_table,
 	.fw_feature_tbl = npu4_fw_feature_table,
diff --git a/drivers/accel/amdxdna/npu6_regs.c b/drivers/accel/amdxdna/npu6_regs.c
index 1fb07df99186..ce591ed0d483 100644
--- a/drivers/accel/amdxdna/npu6_regs.c
+++ b/drivers/accel/amdxdna/npu6_regs.c
@@ -63,7 +63,7 @@
 #define NPU6_SRAM_BAR_BASE	MMNPU_APERTURE1_BASE
 
 static const struct amdxdna_dev_priv npu6_dev_priv = {
-	.fw_path        = "amdnpu/17f0_10/npu.sbin",
+	.fw_path        = "amdnpu/17f0_10/",
 	.rt_config	= npu4_default_rt_cfg,
 	.dpm_clk_tbl	= npu4_dpm_clk_table,
 	.fw_feature_tbl = npu4_fw_feature_table,
-- 
2.34.1

