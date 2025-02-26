Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1524CA46665
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 17:18:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13EDC10E954;
	Wed, 26 Feb 2025 16:18:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vFS/ao43";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCAA610E954
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2025 16:18:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d2DSgFtZWVeoRzrDjgM1TmT3g7uwQi5g3yGbuYnWXA1mVjWv3fgvcGupBFbKwWeWpg0cI8T1j0ERgdWV2nVWNFIIDS5375unmoufbl8uZ+qAnCCw0GjvAfuoBsi44gu2MN/hlKEbhP/FT24f7roTDBGjkhr6xxH29imt6Z+Pam2o3RnUAMiF+O3z62OOVaRHPXDfBDOKxDlJ9Pq7PCXNVPi2UFBv3D4RFMjMNmN9QxBOwXH0iuB0r6tuSlUgfQYOrL9Dn3/OaZ8bFqMejZ+WK5eOJMeILpc2ND34UMG6xGXteUz5Tq8kDtGGsYSFNCrNCs4oenEyzeAljGw3mVlEQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vPhSzFnpa/2E3L78eVlox8lYx83YZDcAWI4SG1xpzJc=;
 b=m+b1gtIpd6ofNAfDF8niOxbU4/G7R6p47esNR6slCV0geQoSRL4wDk66Sfz7X9n3DgjY7vynllcsPzR9gXi75QSZ/iHn5dUS/dkJ9L//c1bZFObORETooH2KuxH52vvriSO+cRwC+fPHX3gru5kTUK/f0EKHL0PxlLAfDmBsl1fLrlpLdjwAR4nXMx8pqQbyPhgj/aT3gfRGVRg6nWEYpR7CAKUrjD7ftaEj+BP6yGVmTRpcxv7lqZ11PFnfkkasqnzAWqf4nv0Z4cOcVdUBu9IvObbWT2UOuYH7ntV3phpFMJcPqk+KAxuDg2FY05Iq0kZbr98SQMdPNs5JDLs0bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vPhSzFnpa/2E3L78eVlox8lYx83YZDcAWI4SG1xpzJc=;
 b=vFS/ao43UF1dBXpPNDiPxuMOJBaYPYgASW8iBNnib3LEEkFHNDN/XuW6KXKyW2P19yDtgGPJLoaK7xaIrRhR4Yvfy8rLc+2UhnGAWoM1KA9QPY0NT/oUPFRfq5qLQcz3crvnizm9q1QL1emuARugzMcK66mzKKWWr54XYwcZlFc=
Received: from SJ0PR13CA0198.namprd13.prod.outlook.com (2603:10b6:a03:2c3::23)
 by MN0PR12MB5907.namprd12.prod.outlook.com (2603:10b6:208:37b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Wed, 26 Feb
 2025 16:18:14 +0000
Received: from MWH0EPF000971E7.namprd02.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::f3) by SJ0PR13CA0198.outlook.office365.com
 (2603:10b6:a03:2c3::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.16 via Frontend Transport; Wed,
 26 Feb 2025 16:18:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000971E7.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Wed, 26 Feb 2025 16:18:13 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 10:18:12 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 26 Feb
 2025 10:18:12 -0600
Received: from xsjlizhih51.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 26 Feb 2025 10:18:12 -0600
From: Lizhi Hou <lizhi.hou@amd.com>
To: <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <Mario.Limonciello@amd.com>, <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: Lizhi Hou <lizhi.hou@amd.com>, <linux-kernel@vger.kernel.org>,
 <min.ma@amd.com>, <max.zhen@amd.com>, <sonal.santan@amd.com>,
 <king.tam@amd.com>
Subject: [PATCH V2] accel/amdxdna: Check interrupt register before
 mailbox_rx_worker exits
Date: Wed, 26 Feb 2025 08:18:10 -0800
Message-ID: <20250226161810.4188334-1-lizhi.hou@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E7:EE_|MN0PR12MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e3c5dbe-77c3-4df2-da56-08dd56812b9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t2c2Sb4siHSdkagrQTxi6h3oAG9y11ZV/QYQoiAG74kym3Ty72D7bQ4J+XOo?=
 =?us-ascii?Q?6ZXNT+hufh76smXuFbcl9OzU5e1dqGRy8nhtqcDKbvZ9hKmtHmaYNbBWZ6Fy?=
 =?us-ascii?Q?CZgNI5cdW9kf8Cp78bNCQP6r0LUrqq2QQd8dC4GJQDt7PypWV2EkpKYXyKKk?=
 =?us-ascii?Q?ADxemtHoyUw0uKLMLi/0vCNVXsUoGeqC72kSKOIFMFMLs7yybZImOEta6jei?=
 =?us-ascii?Q?+nhhvTHOTCK5oE0ddcqsPFE90NOcDpB9MziqgQmwcHD38x6/dgZV//2e8WUZ?=
 =?us-ascii?Q?7dIjYXcBFi6pw/G+1/UpPVBrqARYa8tWUVZC1JsVIrGAajNTEbtlCNrWuCr+?=
 =?us-ascii?Q?qzp5QXboCd9tTZjZKdYAw+M+ZKMnQ/QPDZkZokqjVudNHS4oNMTJC1RqFWLm?=
 =?us-ascii?Q?+6/nVqWC6FFshac3WQjhtB5LGvugDR8eXQHC7+0kJhbfM8nMvyLyP8QfcvPy?=
 =?us-ascii?Q?VS1z8U/pwjiuKdlxPY9aVoEvZ09UI79ejx7G8f/owgW+VJFCjzLY/yLTRFpz?=
 =?us-ascii?Q?kKvIbFSvZzA9/yQNlmHz4u6LumwTBjN3rtjy7LxYoSwFs+DRU6+gvIsCItmK?=
 =?us-ascii?Q?/cpxWqhsoDLs3ayYTZ7x4kNs2FlVFHjZbjMj2SdCorD+7xhgCtKT2A0V7XFC?=
 =?us-ascii?Q?o4n7BFZyQECakECh/LRCZiXNJp/+vvxWVscknuByP547+BPY/IMbvXGS4RIq?=
 =?us-ascii?Q?BEgp4mERKKHm8siymPyjuQxHezcdF4T7iske8AX1zyZDfjBhvSYIY5GXE4vx?=
 =?us-ascii?Q?+xOh7zphBO2UwMR5nrJuhrh2oJFGAe5ZVtvnRIA2rcbSNpg6pjSq6pxd4L6V?=
 =?us-ascii?Q?RkPkz1GzUiu2d1mqUP4fa9OLBGb1y8c9bFuVSmFZEVDZXLmwb78J+RI1poAn?=
 =?us-ascii?Q?Ia/qISUWJNGtEwve7Y/83OZgJ5rEDjO+yuMfb8bdUv94x4LBoCgf8eovr93R?=
 =?us-ascii?Q?+OGRJGPaCU0rs+l4wk8H8mUKfFMx1tojGE4zT6YbNcJYWhzXUuieDzBaBdZX?=
 =?us-ascii?Q?ZcHCUgKqQnGEpJxk46ZusX84N8kBwW7VZU0Cmk7tBinPuh3kJUmAQF1oqBhg?=
 =?us-ascii?Q?AbISUuCrhz3Qk4LMVU7VrB5upXciTaU8VZO0dOUGEw4K6UgwOI5PlDccV6jI?=
 =?us-ascii?Q?wo0VTGjY7u0nuKhTz7OJepIryo9/RHgF7vbFWXWsU0ldkszN/0Z65SLNqkFN?=
 =?us-ascii?Q?Dewv4Sd6tMS3JMK853NY3ByT5NHtYdK05xRqYa9UT8IzDLlC4T0kE/hwhR4T?=
 =?us-ascii?Q?u1bh5Q8x8Uu2vDWwUptU/RA1KK5BzkFa6cnkAlJy9ngvVKrotKnzhFtvJCkG?=
 =?us-ascii?Q?kaVe9WjlQgwqVGvTMyvJBBITxz+pFDQTuaMlOwISad1h0CNjKvlkZCZk+yl4?=
 =?us-ascii?Q?FPjTBwXWQo6+A0q5BZ4BJ4XvrKBCWrSVoRq5Ux8B+vvT7B+4yIP6+jy4KB+y?=
 =?us-ascii?Q?oy8TNylcTRzXYrlt7NTRzSP1paNhxOB4kgTOt1ktk6+ph9+cwpdeg66sUPML?=
 =?us-ascii?Q?uj/3+iQftCoLvRY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 16:18:13.7426 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e3c5dbe-77c3-4df2-da56-08dd56812b9f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5907
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
 drivers/accel/amdxdna/amdxdna_mailbox.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c b/drivers/accel/amdxdna/amdxdna_mailbox.c
index de7bf0fb4594..8651b1d3c3ab 100644
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
@@ -366,6 +364,9 @@ static void mailbox_rx_worker(struct work_struct *rx_work)
 		return;
 	}
 
+again:
+	mailbox_reg_write(mb_chann, mb_chann->iohub_int_addr, 0);
+
 	while (1) {
 		/*
 		 * If return is 0, keep consuming next message, until there is
@@ -379,10 +380,18 @@ static void mailbox_rx_worker(struct work_struct *rx_work)
 		if (unlikely(ret)) {
 			MB_ERR(mb_chann, "Unexpected ret %d, disable irq", ret);
 			WRITE_ONCE(mb_chann->bad_state, true);
-			disable_irq(mb_chann->msix_irq);
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
+	if (mailbox_reg_read(mb_chann, mb_chann->iohub_int_addr))
+		goto again;
 }
 
 int xdna_mailbox_send_msg(struct mailbox_channel *mb_chann,
-- 
2.34.1

