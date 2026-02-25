Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QN3yAwxgn2lRagQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 21:48:12 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC8F19D6DB
	for <lists+dri-devel@lfdr.de>; Wed, 25 Feb 2026 21:48:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3037D10E82E;
	Wed, 25 Feb 2026 20:48:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="MMGGu8Ng";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011071.outbound.protection.outlook.com [52.101.62.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AAF010E82E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Feb 2026 20:48:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n624WEEwYQNEI0WF4U1LFUiCkwlJu4R2Q5W/4ZV4ncycqniA0JzRM+//FRzpGtVmrLCdq11kuuWq7cDCmN3RBnhhnkJ/9Oq0TqtMBbi4hhomjlSt3jS33UlRQbaioJaVygx1+7IfvyRR5+5EQIzNUfD2La8DGIAmWD6umwwqnCNzKnyKbMfyegLqYLCnZLXzLauUnFFfLCYP4x7YHs8VUEd0jqcYHoVfCaKFVBq65gbkkR2a7kLd9oiQmf2/F4QsfkhTv9Pu9zhPxhut3Up3VRdlUsdxLsXwrzePoACUJcjiXzMQoBqftFHPjIgjs+LmftKHLtlCo4jzapXdGVEZMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJQB0qFxuBu8/ZyydF2xROvvawKFtrQHGapXTaCLrMQ=;
 b=WRlMWjdUqXZYW2FrBX4zRBwMKZNuJ+eoNoW6gq3mGjNKpDh56DPs5hu0SyhN/+2MSZT0FAqL0RZ5WlYI0uK+gNLUrIkoTBUTYFO8UryASpv3lOXqPobVauTlhT+JieDceXTJWEOLsWTkyG8iHr9Ifb6+8inILALnniWNvaS2VK8rz9ZLXBf/sD9qPjXJStpxRpSKmQlhwoKHblRsubx4o/pj19dTO0WATBPYGp5Z/8K0xy7OlpFhZct/FzDhYY0mj26prWoK5UDWtEseNfxm4W0yIWhQF1X9wNyq3klybG1y8hp0vDad/a8R5PB1AIjc81AsW/HXazqhXObRRg0QIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJQB0qFxuBu8/ZyydF2xROvvawKFtrQHGapXTaCLrMQ=;
 b=MMGGu8NgJiI+Un6rl/ZThSTcSxCtPknL1z0egq2US1BLNK0d8MEPedBpzcCONtBzu7EPetYf8px2xuzhIBUMTCiHYTdCsm45LNxLiZmEpT23C6or3aGHS07DbBVDgIaokuYiLMrjuCVqTXHulYIlftvHz7tWQxFQO5x1V+wmyoA=
Received: from CH2PR20CA0029.namprd20.prod.outlook.com (2603:10b6:610:58::39)
 by PH7PR12MB9076.namprd12.prod.outlook.com (2603:10b6:510:2f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Wed, 25 Feb
 2026 20:47:56 +0000
Received: from DS3PEPF000099DC.namprd04.prod.outlook.com
 (2603:10b6:610:58:cafe::b6) by CH2PR20CA0029.outlook.office365.com
 (2603:10b6:610:58::39) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.25 via Frontend Transport; Wed,
 25 Feb 2026 20:48:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS3PEPF000099DC.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Wed, 25 Feb 2026 20:47:55 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 25 Feb
 2026 14:47:54 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 25 Feb 2026 14:47:53 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <maciej.falkowski@linux.intel.com>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <max.zhen@amd.com>, <sonal.santan@amd.com>, <mario.limonciello@amd.com>
Subject: [PATCH V2] accel/amdxdna: Use a different name for latest firmware
Date: Wed, 25 Feb 2026 12:47:52 -0800
Message-ID: <20260225204752.2711734-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DC:EE_|PH7PR12MB9076:EE_
X-MS-Office365-Filtering-Correlation-Id: 87ee49fa-e847-44ff-b1de-08de74af272a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024|13003099007; 
X-Microsoft-Antispam-Message-Info: M/7Nsos0wrTF9zH8nfXQeXvhaQZiwmdLZWelluVZBiDy0pRC+57CnJTTldxT9e4Ebn+f0fDIae2MlyPT8yLsm9nUEonuCsG8nFrLDrird/Xs7l3XXwN1xSfQJhjME5XTMnSBJXAio3SXO70nhHqiDlaX76hV11X0GwQWYer4MxXp6JG6f7QR+Dz7I/uRVJZ7M/c6vdED2Dw7wfDUPNo+68rcRBynELEJdbiMpFyXiNl0LKgG5yqUjOxrm9qTNH3jLxVl+o8ObxtQkUPUWT5CdGqqUo97vy4nQS9DYfucS46sQ50ngGyEm4l8UFlgbk/gl7gpOMCc8zK/Xou2xO4wlA8z5qzdPr0sr09h5fmJwLm3A8lGu74ZWHa+eYM9slKVBnRCjXW5f9qKpLX2/Gz4Gd0SdeUJrsbHm0XQ2NWOnwt42m4g01UJkgVy2CttyDMtlYxf6BAwhwRv5DOKw3qUgVmglBEoZ5uHYcg5JJThyeghNZCBfj/Ui/M4zaS+o62zBeTMXptlkzawD0ZVALYC5TsKpYumIdgppa9MvvjwntwsqnczRA2TFSDrvCBJKW5zg3Qm2DlzmJsNudt+wZsADYJMTtUgLLtco1DINTT9ORAQiwSHI2P55f3Y79pyjDedtZ8FU57ZaZQ9B0+SrDedRtNplIUsbacXE4mizA8DVu4P40vEG+jeRDe9uWSmWCntQ1DycG0TwkihJZfXBEG26/k5IsV/C7VSdBlD8uQfnnTLjerNTgOV1qNIDOJpg+nemFtL3JDLWBVRQCT5y4+JQQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: U+i1dIFmuXpNn6HH6HcWiY9ClC16RAxiHS6AOWzRD+uLrr19dfCmDkeROk8k1jwcCp5pNQCbfxnBzVUAa4IYPSjrTnoyiB5zOrIXcQw5TtLnR3wMUhaJSl71RwduDmVAiOQa8+6O8H1Uhd98cwaLrE05Vc7iPdQ70Zfr/Sq61BNszpiP93aF12amstnodTxdHdWXFaQ1jmw+vOXl5DuW+mtqNvYVRuc3F8ohakMTfpzC1sKOgZrmC6t3z7oVD5uQ3X5HHNNuZBXHO4JhP4lnOj7A8t/VtYSnpjS63uaCKAw99rorCgwo9LaveEBD7yzS639GD9pqcmw6XPkl6TxcM7Q+zoSr2zC+93KKqQ0qM4b8Birv7g7kWChdJJhN5uFDLh/lw0QZ4eTQMWNwgNTVhlHEJKeJnerk6etE9blXHS0r0nvp1fH0N2JtOJr/25Ol
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2026 20:47:55.6539 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87ee49fa-e847-44ff-b1de-08de74af272a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099DC.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9076
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,gitlab.freedesktop.org:url];
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
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5CC8F19D6DB
X-Rspamd-Action: no action

Using legacy driver with latest firmware causes a power off issue.

Fix this by assigning a different filename (npu_7.sbin) to the latest
firmware. The driver attempts to load the latest firmware first and falls
back to the previous firmware version if loading fails.

Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/5009
Fixes: f1eac46fe5f7 ("accel/amdxdna: Update firmware version check for latest firmware")
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_pci.c        | 20 +++++++++++++++++++-
 drivers/accel/amdxdna/amdxdna_pci_drv.c |  3 +++
 drivers/accel/amdxdna/npu1_regs.c       |  2 +-
 drivers/accel/amdxdna/npu4_regs.c       |  2 +-
 drivers/accel/amdxdna/npu5_regs.c       |  2 +-
 drivers/accel/amdxdna/npu6_regs.c       |  2 +-
 6 files changed, 26 insertions(+), 5 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_pci.c b/drivers/accel/amdxdna/aie2_pci.c
index 4b3e6bb97bd2..85079b6fc5d9 100644
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
@@ -503,7 +509,19 @@ static int aie2_init(struct amdxdna_dev *xdna)
 	ndev->priv = xdna->dev_info->dev_priv;
 	ndev->xdna = xdna;
 
-	ret = request_firmware(&fw, ndev->priv->fw_path, &pdev->dev);
+	for (i = 0; i < ARRAY_SIZE(npu_fw); i++) {
+		fw_full_path = kasprintf(GFP_KERNEL, "%s%s", ndev->priv->fw_path, npu_fw[i]);
+		if (!fw_full_path)
+			return -ENOMEM;
+
+		ret = firmware_request_nowarn(&fw, fw_full_path, &pdev->dev);
+		kfree(fw_full_path);
+		if (!ret) {
+			XDNA_INFO(xdna, "Load firmware %s%s", ndev->priv->fw_path, npu_fw[i]);
+			break;
+		}
+	}
+
 	if (ret) {
 		XDNA_ERR(xdna, "failed to request_firmware %s, ret %d",
 			 ndev->priv->fw_path, ret);
diff --git a/drivers/accel/amdxdna/amdxdna_pci_drv.c b/drivers/accel/amdxdna/amdxdna_pci_drv.c
index 4ada45d06fcf..a4384593bdcc 100644
--- a/drivers/accel/amdxdna/amdxdna_pci_drv.c
+++ b/drivers/accel/amdxdna/amdxdna_pci_drv.c
@@ -23,6 +23,9 @@ MODULE_FIRMWARE("amdnpu/1502_00/npu.sbin");
 MODULE_FIRMWARE("amdnpu/17f0_10/npu.sbin");
 MODULE_FIRMWARE("amdnpu/17f0_11/npu.sbin");
 MODULE_FIRMWARE("amdnpu/17f0_20/npu.sbin");
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

