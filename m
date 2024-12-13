Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E6019F1259
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 17:39:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87FFF10F08B;
	Fri, 13 Dec 2024 16:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4jqqi6Sl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2413::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406CD10F08B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 16:39:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KErItg46EjZfg5Zah3+JSIVJGLIs5OCGZMAmLMOmz/AyA9YQWaVNGiG3/YojAHOPSNvJJjLjeUzGniwpvN6y/FEXZELOUI6YRpe2TRsFhGqtAN5LixENvnbjwiQJYq4XqT4aBShd3KJSiqlQX3/FIcjTFOp4nKrbpObjVCSL8+Gg3ukVlZWaIxcRB9utNgVmv5yz0ohfFaZ1Jv7aslC5Uj3zpeeP7ajnoemn8tvEtCbraZggHqMWFVKWN/uAyQYbdzWIUlZdY/FK1QgXsLENhVo/l/Nam3ZfCOe/RFFbAalTQnPj/E1soceXwKAcFa/NDPjlBzmge6xpr643Bwkq3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjf5p5IqPXHuPD58oCeTVfbBrt31G+lLCDYKbIQjM8E=;
 b=qniUCYABaLybs48H5pqv5c3mDAU4Cmy8AigBNSB3swILW3iDApQgWo0BbAOpugykLR1X9wH1f4/XJsQi8GHaxLs+7ypCaYDt5NncYDeCtpHsOSKTvjiL43yXATCPyyHVBfx9HulXEGUzYdstnxT+heozQUWwbPGQhA/K+iaqoNATonezg2XvbIbrGTZKnqFTdm9hIfw47pJ32ys0FhcTb7+Pc2e9ifUaM1LT18OZG4JznYo4ApdXLaGG4AYpSwGvNcNmHMOeK6uKkXjMqhiKpYQSkor+CoERVO42xI7cj5QPapvAuXanPX0A5izcRwENyX1BZp0t78LbeGWS7oID2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjf5p5IqPXHuPD58oCeTVfbBrt31G+lLCDYKbIQjM8E=;
 b=4jqqi6SlLR5aByzKEXt940AbkMCc+zSuA5FwjS8luSP+CgiJDbwO9znq5MUsZUMxUuY2PjasmMD8wA5qOI9g9X8VoAJDZJ/WiZXRE32cqU0yStjsxJwSDdKw/unPCeH+BnehXJMxa+lVjcVCEEzGfSLrIE8S+mTbrHNLQlS39W0=
Received: from BN9P222CA0002.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::7)
 by DS0PR12MB8765.namprd12.prod.outlook.com (2603:10b6:8:14e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Fri, 13 Dec
 2024 16:39:02 +0000
Received: from BN3PEPF0000B373.namprd21.prod.outlook.com
 (2603:10b6:408:10c:cafe::ba) by BN9P222CA0002.outlook.office365.com
 (2603:10b6:408:10c::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.16 via Frontend Transport; Fri,
 13 Dec 2024 16:39:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B373.mail.protection.outlook.com (10.167.243.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8272.0 via Frontend Transport; Fri, 13 Dec 2024 16:39:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 13 Dec
 2024 10:39:00 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 13 Dec 2024 10:38:59 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>, <mike@fireburn.co.uk>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>, <mario.limonciello@amd.com>,
 Lizhi Hou <lizhi.hou@amd.com>
Subject: [PATCH] accel/amdxdna: Add include interrupt.h to amdxdna_mailbox.c
Date: Fri, 13 Dec 2024 08:38:56 -0800
Message-ID: <20241213163856.1472207-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B373:EE_|DS0PR12MB8765:EE_
X-MS-Office365-Filtering-Correlation-Id: 77197433-1006-4f2f-b4d2-08dd1b94a5f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aG3lOetgROxkU191DcFu75E+jGvjTAllBCz/1NMgTBZuxWlBLXu2FftYLLSu?=
 =?us-ascii?Q?sQxjfGznMLCNzqSf7t0cKYgbdce7G6h7wGRfMkJZoTCkRafLFXOJHgK+/sME?=
 =?us-ascii?Q?oXhu2ZtYS318Hx0jLagkYxaJ/Y0vmgc/MOR5LazCmaz5t/UxG5ydscnC8lag?=
 =?us-ascii?Q?OPrZBaYfc08N67ApPboAaVMeXZodOY8S4lfF31jj3BxAIiCI6/Ddfe6tlbBn?=
 =?us-ascii?Q?G2mak4qGxv62NGo3AdAgSWzfbi3ozNssFLKSo24m5DRfBI4YA0fOcopxreW1?=
 =?us-ascii?Q?/VV6kejgJbpzPeApX0jBnWD4cOYqJ4urYYAZW6XiN6KGZTETfG/S6TdYBWvn?=
 =?us-ascii?Q?ZkfpSlHQAR1JYv4tIUyVCSwc5m7ze06jahxjFOIn5VSOH0tCrlC/IWlyq1Yl?=
 =?us-ascii?Q?/znFQHpwKpPdyWXPpOSIoHda12lqDAufQcNIvbCi8LR47DmLAdoLLviWS/N/?=
 =?us-ascii?Q?x51b/YjkWXT7IAAKZCz6psQmJlusX/pjP3J5y/CZQ9XHmQI7q/7m5YxvQJl0?=
 =?us-ascii?Q?5u+QiBZhDKuQcA5gFRPUSCUMEfj0wKJeQmowGx8H1roXAIVCUZka3E7OZwFe?=
 =?us-ascii?Q?l1adJEmDuv9Vs+TjQccdFqFTKo7FAMbT8/j1HQu+laKlLU+N9ClRrjgMJ5y2?=
 =?us-ascii?Q?wVLSuYa/ywiMCStSchuHVX0oWratabpTTzMq4QKbROLD5X3me1sufi/AXEpp?=
 =?us-ascii?Q?WkRMNeiKbpQQxwWJcINEMDmV255aEh6DmM86GGqkmalFfxq6wPESLxINGkbc?=
 =?us-ascii?Q?OTjeKoVBd95sLhh1Z9gjNhBBIm/q9L22GVVODn6X+y/xLRmYcMwgMAC0qjKk?=
 =?us-ascii?Q?ikBbj7tkPU7Mx29aVavvgYjy4q36tBTP4K2bVaIH5wAj1D58HE/f5GF1rhEE?=
 =?us-ascii?Q?T9RjZBv70Zem+8Tt0lSfeoLqYoEgZ5ysJb5WqDbg+HuPxjeu16SNUqy60vMR?=
 =?us-ascii?Q?kExgoWjxX8ZQfgkYglCcm3i8Jq8iNNyxK2lL25Sg+mJNNZ8rPSDg3gl77Zmb?=
 =?us-ascii?Q?gfsPzIsIdQjNj1Hxhb4AhcsMhmP06SQFyWIxMnOmKfCrfTGU5Z0buTzc5SrF?=
 =?us-ascii?Q?6RPDizO4Psb8AB/xb/iHfezC16VaByXvBCb673cxHEuxTbb47LoLZQ5JjDXw?=
 =?us-ascii?Q?Uz0gTWJd/RF4We2EVcEF++BI5kM9Hh7rxtln+c+StzZCaj0WUKPqCaJGQxgG?=
 =?us-ascii?Q?2x+uv6VIA78EbBKf34Y2FTpI1jTmlQclbcNo+tQ9QhzILGyps7r5fBBLhffp?=
 =?us-ascii?Q?WIMf8rHktkDbyk3gdYw+Fy9PKPlbs6gXQYbsPGPHJaocwfrBcBovBxJpgPzI?=
 =?us-ascii?Q?jufxHYO/jS0LvWsaVw6cMRCqfxXjVcSsp4A8Ek50OXky6EAQGQW7KyvURKdU?=
 =?us-ascii?Q?OIHSCQLhu4wcrmJCXPbEHIvFsryx3Wq94cqXj5gPg4IgNs7DJ+RtZyI6/MME?=
 =?us-ascii?Q?HOpV+MXV8KNVwz2EX2yqnA+cWE4/AuUhRvw0PNUnJhpoh3UXpZqMkgdqRGAY?=
 =?us-ascii?Q?rbnAZ7yopapQ9n4=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 16:39:00.9503 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77197433-1006-4f2f-b4d2-08dd1b94a5f8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B373.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8765
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

From: Mike Lothian <mike@fireburn.co.uk>

For amdxdna_mailbox.c, linux/interrupt.h is indirectly included by
trace/events/amdxdna.h. So if TRACING is disabled, driver compiling will
fail.

Fixes: b87f920b9344 ("accel/amdxdna: Support hardware mailbox")
Reported-by: Mike Lothian <mike@fireburn.co.uk>
Closes: https://lore.kernel.org/dri-devel/CAHbf0-E+Z2O7rW-x+-EKNQ-nLbf=_ohaNzXxE7WD2cj9kFJERQ@mail.gmail.com/
Signed-off-by: Mike Lothian <mike@fireburn.co.uk>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Reviewed-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/amdxdna_mailbox.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index fe684f463b94..79b9801935e7 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -6,6 +6,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_managed.h>
 #include <linux/bitfield.h>
+#include <linux/interrupt.h>
 #include <linux/iopoll.h>
 
 #define CREATE_TRACE_POINTS
-- 
2.34.1

