Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B710A0008C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jan 2025 22:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E074610E7B9;
	Thu,  2 Jan 2025 21:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E0VGDdDT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D09110E26D
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jan 2025 21:23:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+HcfbjM+FVmNvnYfIK7cfrPONXb0tA5291IVnTzotCtW6VQ4BnNda5OSvld3oKaLa5XT8+LHV1aqQc7LQhP3nCrdWeuBnDumPbe25vPbPzgCZctWMwNONpP9pMWbs8fuq+bbEg+ejbwjLrzQqlxLJu80QZW7DvlTa5Ro4rdAdOkW6lVfrusnb09wsBd15KXJWF2RR8H552IqiWBqHv+w6Q2UauVE38qhFfC2EEoICJ4cNLV//kmHQ+n238JMA4//xhACMh1dokcvbnoxJHf+lKXpbwiR5NSCfYhnWIlm6TF8RAd8on8xv5/0Nlq8P6eVMtzd7kIL9U9kdwnKcCkVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKQpMgWDD5xFrvynctiEg3sGX7VEvARKP4lG6HAuzeo=;
 b=xaea7chL1bC1aCwNSC8w4TJutaoPSOhJuxjaH9w+2FKiuUhrwixWWUykSV6mte2VNRk/kq6NeeB3Lprtxaj3Oi0sKhZ1MAdNM8ZGt7O2Wg0QEBZuCdwJFplh7F+l1/Aba8/7zTtaTpuKMW6w5opXUCa8kKDXuhuvZUo7bVpULHY/qPhK6xmoEmpc3QSmZG/XhglyDGCrzVfNeu+j0Iv1jenoJnXsrHdeQELLvUG2mkghzTKOXHRJF3o+U0iHwt+qao1CvsHl7r9KFHPj3dp9tkTk3KtU7Mp15BlXIJ4/VjpirsqizTB+nw1c1W0Cs0Ojc/z3j6heeFyfWxJRc71A/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKQpMgWDD5xFrvynctiEg3sGX7VEvARKP4lG6HAuzeo=;
 b=E0VGDdDT8J484fpdOFPSyS7wu8W8jFnBqwvJU/a9z3Qk90ebVDyaDYi9irNyOB0DYaIek22uIOQ+GGfR/wk78CLGhhfL5TctjdwAn6LfJGGYFpPSr5NV0ESolAzLfz3nkQytIUCv9NcLMXcF+1pdOYCDhkBDEuk7C9qxG60u4+s=
Received: from CH2PR07CA0011.namprd07.prod.outlook.com (2603:10b6:610:20::24)
 by CY5PR12MB6576.namprd12.prod.outlook.com (2603:10b6:930:40::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.14; Thu, 2 Jan
 2025 21:22:54 +0000
Received: from CH1PEPF0000AD83.namprd04.prod.outlook.com
 (2603:10b6:610:20:cafe::37) by CH2PR07CA0011.outlook.office365.com
 (2603:10b6:610:20::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8293.16 via Frontend Transport; Thu,
 2 Jan 2025 21:22:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD83.mail.protection.outlook.com (10.167.244.85) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8314.11 via Frontend Transport; Thu, 2 Jan 2025 21:22:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 15:22:53 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 2 Jan
 2025 15:22:53 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 2 Jan 2025 15:22:52 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>, <mario.limonciello@amd.com>, kernel test robot
 <lkp@intel.com>
Subject: [PATCH V1 5/7] accel/amdxdna: Declare force_cmdlist as static
Date: Thu, 2 Jan 2025 13:22:42 -0800
Message-ID: <20250102212244.1586340-5-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250102212244.1586340-1-lizhi.hou@amd.com>
References: <20250102212244.1586340-1-lizhi.hou@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD83:EE_|CY5PR12MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: 672f8400-f829-42b0-97fd-08dd2b739ee0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cNohM2jlGNn5BOC79gHRMjpKyT2WmsJzBsQEcXpOKRtHIM+aqQbqYa28/uQu?=
 =?us-ascii?Q?HrfmtsxCC4OUsBhURBXWX+JhJC3Ol4JQSeLPacu5UGDwHydEvLjSIbkHi/ZX?=
 =?us-ascii?Q?Zfq36XQPLICv2qQ2RBdlzDW3oLqL41nBZRaQvDjDe0vIbMzkWcp7Dlb+vVer?=
 =?us-ascii?Q?uUFSpd36gYJtHZNhyZ5KvMQc6EpRJaPB2e6nZYpZSrYJx3QvXJb0AHmmfJMx?=
 =?us-ascii?Q?Ba55a/b06sJMfV1ATE5MuTo5Ub4Vf24lIspwzM8QCOEDW2cdDJNRZTax2uU/?=
 =?us-ascii?Q?CnqLrs9DEglq6K7/KbTvI8u3pPrFPMPhRA48snl4+K+X1phUy3m1FqMfyhoN?=
 =?us-ascii?Q?DWAaCkgd1nZAfXjon8DB9ciyWXVM3/8UHBvtteW/PGaI24fg+fZdDN0atk+A?=
 =?us-ascii?Q?oSCjlR75YtpAkS8B/HI7n+GPHaShDMCWXH35wcu6JVz1MvaahWIGilUXavy9?=
 =?us-ascii?Q?kx4YBaTynaCt19e9VbOGintLKbMmyGNRF05fSB/JsCqIaI1xFdZfmkn1eFcB?=
 =?us-ascii?Q?a5hb9lif+YuhRo2ExvpaBqCBsLEb7tz5Pn3NRwQ4/M70AVxDzCNQ4+y+PDwk?=
 =?us-ascii?Q?+D8edi2WxPWva9pC8kb8jNZCZgzrJzOwKofglJkRDILS3zapJhiKwO2eUr8K?=
 =?us-ascii?Q?dyo7xlaUrJ7F7Xx//XKM13ihY4iTeJ3AdtIbspXVCLyAZXbU8NIsuNWU0NPM?=
 =?us-ascii?Q?nalsds6bw1FryurBmPvM7EQKFbHoMhYmzsZuOZ+JUxfTiNhuDHhZFIT5O77g?=
 =?us-ascii?Q?YUeItUHVShBaW0Y4vP6H5ctj67m1ZE329KZyEw2wkr6zJdhRWsgef2cNOo7+?=
 =?us-ascii?Q?HEGYx3r1oYK/r20qWPxUXZ2sbUaeJasBCgF5suEagcAqTL5HgkwqXy+xSpZq?=
 =?us-ascii?Q?TQRzbM6aMJLxrmRYvJcbcGpS+bI1eEnRyhgxgCyFF0RhP3pHLulylS+Q1Du1?=
 =?us-ascii?Q?9PD+lC38eco8LuMVK/BkCafvGazmrNDujnSeqWShBCfSNE2o4PTNTStRnD+i?=
 =?us-ascii?Q?wBodkN5ejkgyZHb+NLW9ubCuOLhTrbSTQYljr5EI7FU4BFj/sM29pFoo/Gcm?=
 =?us-ascii?Q?dJO/sFhXXNdOFU6S7QDGqJf2G2jEh6JbdFbMbeAZODHnuHoq+pTI8f0qRBB/?=
 =?us-ascii?Q?a2+fqgeo9gsAaz/xx9KUa6tBJznKeDm5WFp3EzQIZ05I8usYCdybdpOkis7y?=
 =?us-ascii?Q?jqiHR/GVvRUtHqciW2tngiSby39TyiBmWFsMg4die3LvDielFUakVQVvKgj+?=
 =?us-ascii?Q?fgJPImYn8NIS9jxh5vU00xSXK1Z+/9QeYBdtRvbsj26+BJ8ZF+YS8EnZtIpy?=
 =?us-ascii?Q?mEGhio4Av+P1qp8WhMLZnAgQwCzGSsk825EgNxmqcRGn74uEnnv/pkk089Ub?=
 =?us-ascii?Q?qPFU57ZPiDm/nGY+LMA087OtYLGOTL84Xmg90IxluF1v7Dkka1VbKA7YOSEZ?=
 =?us-ascii?Q?swBisseNGe0W4lXLBD5Hx7rx4BTUR8gfmYYB/uh20Ll3bqhfVITpz9hUbwdm?=
 =?us-ascii?Q?qCzOJcmT6QIb6lA=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 21:22:54.2293 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 672f8400-f829-42b0-97fd-08dd2b739ee0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD83.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6576
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

Fix sparse warning:
  symbol 'force_cmdlist' was not declared. Should it be static?

Fixes: aac243092b70 ("accel/amdxdna: Add command execution")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412311448.GKQj7uPZ-lkp@intel.com/
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/aie2_ctx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 9facf45818f9..5f43db02b240 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -22,7 +22,7 @@
 #include "amdxdna_mailbox.h"
 #include "amdxdna_pci_drv.h"
 
-bool force_cmdlist;
+static bool force_cmdlist;
 module_param(force_cmdlist, bool, 0600);
 MODULE_PARM_DESC(force_cmdlist, "Force use command list (Default false)");
 
-- 
2.34.1

