Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D66C7D07C76
	for <lists+dri-devel@lfdr.de>; Fri, 09 Jan 2026 09:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 101E510E80B;
	Fri,  9 Jan 2026 08:24:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.b="ILc7fmsU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazhn15011021.outbound.protection.outlook.com [52.102.137.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9838710E173
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jan 2026 06:13:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PvuePYXr1ucr4TX6S0JjUXYB5divYl92To2TfvPHFoFCCPO8Pxs5ingMMrECFg6YFBgC3W/vZKPuESoJeVwRG20JIrtdKWlTEkcPs+LabksbRGusMG61M4/b4wqMFXOtGcAzgWUpOBAt7IDkIeVAIxydDa/7c11MvXuWMR3uetcggdUVDZQ0XB6D1Ctcs0haj4tYkO/B0p1yNaYAZxSMQAhExsJpCgStT839Ngd1OUWAevZRYEHVuBroAH0LXaPpOrhMgmiWobaPiPNc+tcsQG54FBen8P900ajCRqaFCq47E3RyLyHBGFLzwgncXgeC1vczjGwFI/CIFVwAZjjtaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nT/8EYaFZ1zz7FQBtUVz1qxpYuLF35UT6/AK5QpSfI=;
 b=Atri9M3pxlB9/MIAZ1ki4F0fIRAGBomvfyJcW0Yxzu796JYCJkbLE4Uh4KjQjcLHRejsrsbe8SzDKsBNl5rr2t9kgMxCIwRji1ln8PpHgh1jtjBy+ZY59SDsQDtgifYapWU4NF80SmsceOwfSJikpsvjTB2ewP0/yF5xbf2GFsZ8CEQoO0aVhqbBqleFU9TxI7jQ3qCw5UqXZn/eSmkkPEQOTAl0MNSMA0ykMgzx/bF36JUfgLd8nb34OfQsLdfJ87MiR4WC8lK5vGm5UuaruSs17x7ULRD/icZIAp72hjmdL8WOiAbjZd8GZJGmMRfYU7ul7kF/yPpAsxdP6OMVPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.194) smtp.rcpttodomain=pengutronix.de smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nT/8EYaFZ1zz7FQBtUVz1qxpYuLF35UT6/AK5QpSfI=;
 b=ILc7fmsUTfyOpOaHjEVK6fmRIxm2hdG4M63AIrwh0r5YGGkHqfYfHvtvd3s5COEztFUiaLlLqX6xfLXyyDq1y51dRsagREGKBqxSDWxWtvLS7X5FunfGHQpsC2zUI8cJH+mvwQJCCbKzcjTLLjwy7R2MQTytk8yqLElLay3895k=
Received: from DS7PR03CA0190.namprd03.prod.outlook.com (2603:10b6:5:3b6::15)
 by MN6PR10MB8142.namprd10.prod.outlook.com (2603:10b6:208:4fd::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.4; Fri, 9 Jan
 2026 06:13:10 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:5:3b6:cafe::1f) by DS7PR03CA0190.outlook.office365.com
 (2603:10b6:5:3b6::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Fri, 9
 Jan 2026 06:13:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none; dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.194; helo=flwvzet200.ext.ti.com; pr=C
Received: from flwvzet200.ext.ti.com (198.47.21.194) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 06:13:08 +0000
Received: from DFLE212.ent.ti.com (10.64.6.70) by flwvzet200.ext.ti.com
 (10.248.192.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 00:12:35 -0600
Received: from DFLE210.ent.ti.com (10.64.6.68) by DFLE212.ent.ti.com
 (10.64.6.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 9 Jan
 2026 00:12:35 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE210.ent.ti.com
 (10.64.6.68) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Fri, 9 Jan 2026 00:12:35 -0600
Received: from uda0543015.dhcp.ti.com (uda0543015.dhcp.ti.com [10.24.69.9])
 by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6096CTED3761468;
 Fri, 9 Jan 2026 00:12:29 -0600
From: Abhash Kumar Jha <a-kumar2@ti.com>
To: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>,
 <rfoss@kernel.org>, <mripard@kernel.org>, <tzimmermann@suse.de>,
 <airlied@gmail.com>, <simona@ffwll.ch>, <devarsht@ti.com>, <u-kumar1@ti.com>
CC: <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <s-jain1@ti.com>, <p-mantena@ti.com>,
 <aradhya.bhatia@linux.dev>, <tomi.valkeinen@ideasonboard.com>,
 <p.zabel@pengutronix.de>
Subject: [PATCH] cdns-dsi: Split pm_ops into runtime_pm and system_sleep ops
Date: Fri, 9 Jan 2026 11:33:12 +0530
Message-ID: <20260109060312.2853133-1-a-kumar2@ti.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|MN6PR10MB8142:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a47b04d-075a-4aaf-8ced-08de4f4628ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|34020700016|36860700013|82310400026|1800799024|376014|7416014|12100799066;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8Dk++1LANxKWPMHD18leFxPEbPi/dmil6Kmvsu3phA+G7IFKqylfiO6DBZfF?=
 =?us-ascii?Q?xTJlEwtGVKaBNFQJlnsNzkgXjbh6fBPmQN+YUOM1Ew/iG5BahxzZ+pOyjd+e?=
 =?us-ascii?Q?L89kUHMB9GKdriE9N+t5JhgVNDvd+yQ07wPdQVLrOwWnCpHrwt7avycYQtt8?=
 =?us-ascii?Q?yKtUtHZLNyvHDqUrtRAvV/3FUO7jTCntUN0FdLSJqYNYfPg5IhsTQhOJblEz?=
 =?us-ascii?Q?h9iJ3Glcq/om0xs0iBfCRcalW7WJ9GqtWaErLvAFFMfzvP/p7m1eZRBJWE0a?=
 =?us-ascii?Q?RY3Jy4zFRVoQBNHgnmSLhaWLjr+9dB7Ua9Oo9i+D7iSK8p+TYk0D0d9oZi4G?=
 =?us-ascii?Q?TCS512Lf0YMuWXo5Op8PY9Q5XuJ+H+PAoMX4Kw+J9dSCIzo/Yo3xZKUA0ga5?=
 =?us-ascii?Q?4t4dUbSSHjauR2nK93qh+rXkTmeW77uRsQrLRm6+g0Pw0L9b+8X8kxogX/Qr?=
 =?us-ascii?Q?4UYGhws9PCEWtrdCKn1OQpG3Y099TvuPRFkm4Rmqe4HG7o9qUqqoHJkfQr4p?=
 =?us-ascii?Q?ZWIkQZJ+nJzofUMa8qtMosIHOeiZ6S6jkd5+d0M8HbBcP14k5glafa0M/ORo?=
 =?us-ascii?Q?cnowOSXYhbneutkp87XyZt4k8RuoxW5DPtBDHdjosd0SafcAPECTtTvMohCr?=
 =?us-ascii?Q?IbCWK7VbbZJdCbO4E1I0qD/FtQoBjn/GSdPLzyhknrLwBAW9oDZtlDNn5/rf?=
 =?us-ascii?Q?6uL770VLqZb6R1lmmMOaHe++vtS6lP1bHn+or0a6bVKpD0nJ+eXpfof728HV?=
 =?us-ascii?Q?pxk4S2kcE9Ze1GLJ8K6glmeG8zZSYkea9JCq7VrPWVYChMCYMIMnYqx9gYbR?=
 =?us-ascii?Q?WfG8lSuIBb69HcGz9AnuSggSW0bGKaRpiB0zdyZ4xeO68i2dofu+Psw2T4lF?=
 =?us-ascii?Q?QT4xeGNXdjc5GlqH8Mmm3mMZ/X0y/XyYb/j3AUJ1rr80aytjpDGWDMxu6iMJ?=
 =?us-ascii?Q?G03bbWpmxtDWFILX0jZDe9Q5qJkTXFj6nW17hevOp3YEVUURnVCYd/TcxHef?=
 =?us-ascii?Q?qPQHGabMi+4jccphiWBxPBRsbqnYUzVm19jDY/bMEnXOP+Ub+p5ZuESLPOgV?=
 =?us-ascii?Q?TpskmjyKYkXaFUDKtFbfEY+R9bsbD7wuxFyKAmoXqGdN1RuIFRnVFei+XMXG?=
 =?us-ascii?Q?ATi+NMjiA9oWNIfGVJ43lm43ne3OCiX2jjL49yGRkXff86JBZ+sdn+1GnJSr?=
 =?us-ascii?Q?W4WTDzfglrhLZBR8dN6L0m4M+Q7K7Z5rU0gKa2DSn2dw8U02v1WBhlOu287H?=
 =?us-ascii?Q?P9AhodCxhHcYEI8LIcJGiEumVdQDmNfqjRdOVlBH0YIRw0bc8gn7BB1yonxd?=
 =?us-ascii?Q?fHCGdqA4IkMTWxbuDRXkf+lQdPnpEKMx/pbgDoeEEGlibh7rUPwwJEV2C2VY?=
 =?us-ascii?Q?GqQoqngf7Qxp3mg5FSp1/lCw1q4Q2AvsTRGC1/pcGC/STj+JMFea4jhxmBoA?=
 =?us-ascii?Q?V8rstYHyj2D39QMInJ1eQn5HOeRelhXmqjsvdGF6FTktF+z3vqRAI0kWVgfg?=
 =?us-ascii?Q?a8Loja55ZrwZjzek1XAVdHziFNfKSC8wkYOgs6IMUPyLWPDNokjsnWdJBBZM?=
 =?us-ascii?Q?075i9AfW4huXy9Ji5ww=3D?=
X-Forefront-Antispam-Report: CIP:198.47.21.194; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:flwvzet200.ext.ti.com; PTR:ErrorRetry; CAT:NONE;
 SFS:(13230040)(34020700016)(36860700013)(82310400026)(1800799024)(376014)(7416014)(12100799066);
 DIR:OUT; SFP:1501; 
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 06:13:08.5498 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a47b04d-075a-4aaf-8ced-08de4f4628ea
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7; Ip=[198.47.21.194];
 Helo=[flwvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB8142
X-Mailman-Approved-At: Fri, 09 Jan 2026 08:24:24 +0000
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

Use pm_runtime_force_suspend/resume in system_sleep pm callbacks to let
runtime-pm take care of the coordination between system suspend and
itself. This ensures that they do not interfere with each other.

Signed-off-by: Abhash Kumar Jha <a-kumar2@ti.com>
---
 .../gpu/drm/bridge/cadence/cdns-dsi-core.c    | 32 +++++++++++++------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
index 09b289f0fcbf..25eaf0192013 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-dsi-core.c
@@ -1230,7 +1230,18 @@ static const struct mipi_dsi_host_ops cdns_dsi_ops = {
 	.transfer = cdns_dsi_transfer,
 };
 
-static int __maybe_unused cdns_dsi_resume(struct device *dev)
+static int cdns_dsi_runtime_suspend(struct device *dev)
+{
+	struct cdns_dsi *dsi = dev_get_drvdata(dev);
+
+	clk_disable_unprepare(dsi->dsi_sys_clk);
+	clk_disable_unprepare(dsi->dsi_p_clk);
+	reset_control_assert(dsi->dsi_p_rst);
+
+	return 0;
+}
+
+static int cdns_dsi_runtime_resume(struct device *dev)
 {
 	struct cdns_dsi *dsi = dev_get_drvdata(dev);
 
@@ -1241,18 +1252,21 @@ static int __maybe_unused cdns_dsi_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused cdns_dsi_suspend(struct device *dev)
+static int cdns_dsi_suspend(struct device *dev)
 {
-	struct cdns_dsi *dsi = dev_get_drvdata(dev);
+	return pm_runtime_force_suspend(dev);
+}
 
-	clk_disable_unprepare(dsi->dsi_sys_clk);
-	clk_disable_unprepare(dsi->dsi_p_clk);
-	reset_control_assert(dsi->dsi_p_rst);
-	return 0;
+static int cdns_dsi_resume(struct device *dev)
+{
+	return pm_runtime_force_resume(dev);
 }
 
-static UNIVERSAL_DEV_PM_OPS(cdns_dsi_pm_ops, cdns_dsi_suspend, cdns_dsi_resume,
-			    NULL);
+static const struct dev_pm_ops cdns_dsi_pm_ops = {
+	SET_RUNTIME_PM_OPS(cdns_dsi_runtime_suspend,
+			cdns_dsi_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(cdns_dsi_suspend, cdns_dsi_resume)
+};
 
 static int cdns_dsi_drm_probe(struct platform_device *pdev)
 {
-- 
2.34.1

