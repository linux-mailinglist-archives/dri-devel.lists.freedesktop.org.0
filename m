Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 537EEA447F3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 18:26:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2B9D10E772;
	Tue, 25 Feb 2025 17:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bDAvNgol";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2061.outbound.protection.outlook.com [40.107.102.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19C0A10E772
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 17:26:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X1x3kYC+iO0AowKPrZ2XWnC2VFJJAUmk55W1JXEg6e3nELVqUT0ClwLDAE2rR7Ca92VvYqtnum3HEXUnhcWQN2piFvtGJ9GaI7m97ZOcnw4fx+E1kTDodVgr2Uzf0utENH7lXFVWG7BeRlDnge8iEZ0D/wk7XfqHP+MKail4E5uBfKuKA6o9RemjjWh6LCnUc9dCORP2+dfAyg/XBHDNxgTNdg1xEMBMTOzwuHxTqTnbjEZjSiCj3gv8YNGwJIJ33MB/TqpPw1WHDqOqy1ezZi6tnrvSyTorjfYvO31rHFr3Jax670PcSECsSECYDff5h1XXK3xWweG55vqMRGkztw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQeLq7D5UZilvDr63oAW97PuFONu/IvAO5cBkruO9Jw=;
 b=vzamiZGIg6Dn5iGUer2ImZz4Jv3wOPStm5LrDx/OiQsDMewOniyvtFJE6/V60CobABv/PWVOqYy/7Llrwa8TwUwo+MxQlGUeQmAL4WJA3My0USlMHA13adZRtertFZN0bGsAoEnZI2f64NTM0KTSIUtQFH98EXwKwpf+B+zd6NCrQJEr6sgl1tRbfagiPr/GhxBPelqBzQoY76ckM+Kbs8e+vfAMVwMumPztBjNf8lNp5Mj2GbEm2djAxxMczPAGAVx3l7kaFaqXa7zvON+vRnNlVsLU4C9vQvE6+T1bwFRZk64eeQ/RwG9xaD0ySuQiO22FCm3mpz0Vj0ymRv3XZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQeLq7D5UZilvDr63oAW97PuFONu/IvAO5cBkruO9Jw=;
 b=bDAvNgolrenQfDNLbHycVkImtTp69Ktuy/B/1C5efL51ObbcOsI27Y9b/2xSkcmJhnNpNKWntssaCCb1nBuvFzPYxSqIKRwBBDy59ZpxSEKVddiPibmyZpoT5sT55NWtBh3iwZKwtETeofDbPMtHO2u2IvSydenH1+lZ7zdz0xQ=
Received: from MN2PR20CA0066.namprd20.prod.outlook.com (2603:10b6:208:235::35)
 by IA1PR12MB8288.namprd12.prod.outlook.com (2603:10b6:208:3fe::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Tue, 25 Feb
 2025 17:26:29 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:208:235:cafe::df) by MN2PR20CA0066.outlook.office365.com
 (2603:10b6:208:235::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.18 via Frontend Transport; Tue,
 25 Feb 2025 17:26:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Tue, 25 Feb 2025 17:26:29 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 25 Feb
 2025 11:26:28 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 25 Feb 2025 11:26:28 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <Mario.Limonciello@amd.com>, <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH] accel/amdxdna: Check interrupt register before
 mailbox_rx_worker exits
Date: Tue, 25 Feb 2025 09:26:16 -0800
Message-ID: <20250225172616.3804796-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|IA1PR12MB8288:EE_
X-MS-Office365-Filtering-Correlation-Id: 7606ca6d-5418-4f0f-6784-08dd55c18a3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Kdxy5XNnXOfMcwO8fJqJhwd/oNelGvR7fJfwL8WQVjUNie2wD9QXXLPBjMkN?=
 =?us-ascii?Q?iE5gihK/1z3RnE0xvZr5u6yFLn+ojbap8X4dJdU2eh5d5zDuuNhUJ2kN9MWE?=
 =?us-ascii?Q?vwy6D/DMzk4XE/ekp7G5cxDMrGtxb/dxUDMeIrKhiMynNhHcnMqN+0Few5as?=
 =?us-ascii?Q?JxjrP7fHetofalFFzNoCv7swGNKkFozgPZNgaCio01M95Ib3j5Xm6XP6fkgc?=
 =?us-ascii?Q?L2PWwRLpq3cEQ+V9aALOui5n8GAgZXV2Qmw9Fwcx7KMJD4yCo9gn6NHtUtms?=
 =?us-ascii?Q?V0GOY//T+O9eCaJ4wdrZsSaHeYIKh2kGcEpdj7EKL1XqZUsHpZ/wslToYfbd?=
 =?us-ascii?Q?LWJwp4BaZV5tr37UQU86D1r3e8DQMprvcLK/qmN8gCJP0nBX1/W5XXLagNtX?=
 =?us-ascii?Q?9C6bDBYOzAWmDwyDKy0zLqKehmp3FRF7ZMcwVfNivT4LqHMHFm+ZqvqYF1Wf?=
 =?us-ascii?Q?wDwYevTN3jMsElGnVbqs5WztYGuEf+KPrIPtylONI7UiMf+QXkIQg65cQDhI?=
 =?us-ascii?Q?08LpbhTCoc1kZ6G+vS558d5/2MbSdDiYNwH5xESjyx1K81aL0ThFItLCpDO1?=
 =?us-ascii?Q?P0FqJ/zRyMHpPx/bo4BeJPfVJMBZcXJ0OlitsJpUZBAmyVMsRJMi1gGVkex0?=
 =?us-ascii?Q?P1XUohYfuN7t2dzWXYzAhum/yn/0RI1geNqdzDfWOYb7dmotpXQXdVcZtMdY?=
 =?us-ascii?Q?cN12K0uUw94a3IyFxP+Kkal/1r1op7zv0stjO6J9udAg9fFPzUdRiahFiASo?=
 =?us-ascii?Q?kD6qEkwsYBL45PbW+frfO5eV554FJ1afvEra75Oil5ecD4GOUJpIrpsAes42?=
 =?us-ascii?Q?OdG/5TNwmEoBcKRKE1a7jPLpcrGZxw3kF0JQmwN7IxBOUKFgM6OcBD4kuVUR?=
 =?us-ascii?Q?im/NDiM08WBJyTv36pKdhGLKHe0yMV3JtjaPueU2e7CN0dF8FlyEGNAyIm8H?=
 =?us-ascii?Q?5yoyLg2nUt4w6DDFHoRM9vZyREexfOZNuRCujLOAij7JwCk8ocyPlL0N2nzY?=
 =?us-ascii?Q?wbcgSwaB0Pr34wTmfnYkndBjbfeY5F/k4ZTzHjat0t+rtenc9TcNPRA2hUEV?=
 =?us-ascii?Q?sJg53/Q1h7NvuvXIynnDfXSpbSJI5JjoPObOMoQ674JXlim9uVZ5k8Z4XuYL?=
 =?us-ascii?Q?BRnVao9xG4IJkZkmIaDEyqHijkluomLqiG0zN1Hh2VWdRRQaHlTOhzBY/ZMZ?=
 =?us-ascii?Q?9V7+XTc2vtqP93uWwFEqbF5Mx86cEs9eoJ7aodnGzDQXNh8+kD/rp+zTEHwC?=
 =?us-ascii?Q?rnAWyCtsmgCgrAACpdpjip6Y/BnylJBPzhyt5AGYPbpmmSqdghrcqIfPM6l7?=
 =?us-ascii?Q?ivGa2amUSdHMsbGz08bGu3FCc7R79Gnsp/3sBXbfz+i4bhC0avIK44JiDL2g?=
 =?us-ascii?Q?7GH1PDuOS6PgiAmTGMYVc03ZRznNLyZ9wH0E2s0hUiKdg7S/NnLhe9pAmp0a?=
 =?us-ascii?Q?3pPw+gLNAslCdThMLP1dm/7/LrXWwDJu0w2TOTamToytiLseggK3/Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2025 17:26:29.2404 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7606ca6d-5418-4f0f-6784-08dd55c18a3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8288
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

There is a timeout failure been found during stress tests. If the firmware
generates a mailbox response right after driver clears the mailbox channel
interrupt register, the hardware will not generate an interrupt for the
response. This causes the unexpected mailbox command timeout.

To handle this failure, driver checks the interrupt register before
exiting mailbox_rx_worker(). If there is a new response, driver goes back
to process it.

Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
---
 drivers/accel/amdxdna/amdxdna_mailbox.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index de7bf0fb4594..efe6cbc44d14 100644
--- a/drivers/accel/amdxdna/amdxdna_mailbox.c
+++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
@@ -348,8 +348,6 @@ static irqreturn_t mailbox_irq_handler(int irq, void *p)
 	trace_mbox_irq_handle(MAILBOX_NAME, irq);
 	/* Schedule a rx_work to call the callback functions */
 	queue_work(mb_chann->work_q, &mb_chann->rx_work);
-	/* Clear IOHUB register */
-	mailbox_reg_write(mb_chann, mb_chann->iohub_int_addr, 0);
 
 	return IRQ_HANDLED;
 }
@@ -357,6 +355,7 @@ static irqreturn_t mailbox_irq_handler(int irq, void *p)
 static void mailbox_rx_worker(struct work_struct *rx_work)
 {
 	struct mailbox_channel *mb_chann;
+	u32 iohub;
 	int ret;
 
 	mb_chann = container_of(rx_work, struct mailbox_channel, rx_work);
@@ -366,6 +365,9 @@ static void mailbox_rx_worker(struct work_struct *rx_work)
 		return;
 	}
 
+again:
+	mailbox_reg_write(mb_chann, mb_chann->iohub_int_addr, 0);
+
 	while (1) {
 		/*
 		 * If return is 0, keep consuming next message, until there is
@@ -380,9 +382,19 @@ static void mailbox_rx_worker(struct work_struct *rx_work)
 			MB_ERR(mb_chann, "Unexpected ret %d, disable irq", ret);
 			WRITE_ONCE(mb_chann->bad_state, true);
 			disable_irq(mb_chann->msix_irq);
-			break;
+			return;
 		}
 	}
+
+	/*
+	 * The hardware will not generate interrupt if firmware creates a new
+	 * response right after driver clears interrupt register. Check
+	 * the interrupt register to make sure there is not any new response
+	 * before exiting.
+	 */
+	iohub = mailbox_reg_read(mb_chann, mb_chann->iohub_int_addr);
+	if (iohub)
+		goto again;
 }
 
 int xdna_mailbox_send_msg(struct mailbox_channel *mb_chann,
-- 
2.34.1

