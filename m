Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CE6A82DA5
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 19:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92E0810E2E0;
	Wed,  9 Apr 2025 17:31:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3fMox3Ub";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2054.outbound.protection.outlook.com [40.107.100.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B725110E2E0
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 17:31:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zv7LvUvEluDQRrJhviGDp2FeFu4bWqwOL3wnvq5iZAn368PefdKlPTh+VieybahYWUZlEJFuFFfPJhEofKdiWJ1tbgSfDmqUu3poT9UwdkOtBuMoWzPjyGYkOsAQG5xBp1m97JiGpF9H4O2X8L+l8PfejhB5/ckYa8XuiD9KUNoYsbFshtfRRY0RZLX0KrbuLPPNXDcRI+TgizNTNW+LaderCp/iLTZaZxYTjeAgkAUwMouq5/GQLLIDQt7hSmDTUt8Q+xIQio5ZH0EviwS6eN4M/s3iE/w+BpyLQPqb4MRxbVOzBsR/S6I2De88ByRDpnwG2jywpQxfeSk/oWweCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6IVYRG+PnyeSbpOiss6G3ikRcLE4nEeWSSk6m15LPjw=;
 b=rr8Q+NEK5XNJLOYFDlLg0S3cqhuBYhL625s0XBEDb+1C0GrytPrTmFiOG1E8eo/+/srC9j1zChpo53QTDoaQBi1H5gfMq/1QaqeCYXVDu2LzDh+bFkcjXXxsgl0uA1e5+h01HVpr0hprtwIxz9DP44bTPWCGJZQctyEL2SH7fpakV62eyCXpt3jCsihWmVtOvlIK4oogk1g+KklZu7K1gNj5n3JaPACzMjBeBhLjCxDSaKwA77phjgiH8CHzu2d/FKB09b3uFWn8Cc/swrsA/kJRvGv+0cedMMk5i4RnmqNKz9ZcIwIcvz+s4SfKVKJbpb0T9b+g0H/MCRhTlaezXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6IVYRG+PnyeSbpOiss6G3ikRcLE4nEeWSSk6m15LPjw=;
 b=3fMox3UbTFs77LbEZ7EUkwNKaHiGTj0j5crpJBrMFJNfbMqRIY4VaAjlUsnrogb+z8KX0UPwfu3ctkhcVAtgxDYTVnN7aRo5o2uQjDSrRG7d7T8Ngd/YpDA1iEb8tfHBpTl6OLiWQ1ih6ea24Y12XhSszEwBgVZ7C5EBCyCINh8=
Received: from PH7P223CA0028.NAMP223.PROD.OUTLOOK.COM (2603:10b6:510:338::29)
 by DS0PR12MB7727.namprd12.prod.outlook.com (2603:10b6:8:135::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.36; Wed, 9 Apr
 2025 17:31:05 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:510:338:cafe::75) by PH7P223CA0028.outlook.office365.com
 (2603:10b6:510:338::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Wed,
 9 Apr 2025 17:31:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8632.13 via Frontend Transport; Wed, 9 Apr 2025 17:31:04 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 9 Apr
 2025 12:31:03 -0500
Received: from xhdipdslab69.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 9 Apr 2025 12:30:58 -0500
From: Nipun Gupta <nipun.gupta@amd.com>
To: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <krzk+dt@kernel.org>,
 <gregkh@linuxfoundation.org>, <robh@kernel.org>, <conor+dt@kernel.org>,
 <ogabbay@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <derek.kiernan@amd.com>, <dragan.cvetic@amd.com>,
 <arnd@arndb.de>
CC: <praveen.jain@amd.com>, <harpreet.anand@amd.com>,
 <nikhil.agarwal@amd.com>, <srivatsa@csail.mit.edu>, <code@tyhicks.com>,
 <ptsm@linux.microsoft.com>, Nipun Gupta <nipun.gupta@amd.com>
Subject: [PATCH v2 3/3] accel/amdpk: add debugfs support
Date: Wed, 9 Apr 2025 23:00:33 +0530
Message-ID: <20250409173033.2261755-3-nipun.gupta@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250409173033.2261755-1-nipun.gupta@amd.com>
References: <20250409173033.2261755-1-nipun.gupta@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: nipun.gupta@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|DS0PR12MB7727:EE_
X-MS-Office365-Filtering-Correlation-Id: f670368b-7797-4c20-fda0-08dd778c4e61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|7416014|376014|36860700013|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?J1YwUwhWjEsLf2bmtvIKqtoploVQiGnnDJeyyMrLz0bCGgfaLEbNPF9/KkUS?=
 =?us-ascii?Q?o3zYvJqn7zypwJ8iUwj7uCNQZXrOj6kqLCaY+YptlV1M0hR0VPCtZI3bcBJJ?=
 =?us-ascii?Q?ds6vwOjjcqY/m3HW8MAAZVar6x+mezlayIfvRjd+d3HMIydLD+/LgLCIvC0Z?=
 =?us-ascii?Q?KKo+B2bMVlLg0vtumDfQJUlZQ9TESmzCwcLgQmvBSaW6kt0W/m2UuurIbSev?=
 =?us-ascii?Q?uWHN+CYlgu/mHW8m3YbW0ofAmQTHkSJfgXE3sT3JLwj5fmDXLZrFeLabyVRz?=
 =?us-ascii?Q?cuxr1AkRVpSmdVSFGbHKV5N3nZeAvRFqM6fgPpULrTM47b9F8fe1wF9/n8kX?=
 =?us-ascii?Q?rl01E0mwQeBaluj+ZZ56PDC/zkGoFX6VwdDuYpyA2mrBAKee0tHopQkCgoL8?=
 =?us-ascii?Q?YdhNIdCbRtUVsC5l0YlatqLzT+VeZgbC+yGYZWHElcYNKsHq3lmPwIZdbedE?=
 =?us-ascii?Q?PdzSimKTiUlD+BSqwiwG6thq7sse+goyDBF6VfN31upWR9i/uUoXSxlJsKjf?=
 =?us-ascii?Q?Zb87WrUMoDeYCu/wJ2wl7KfBCaTkVp4CE8zwmDOC5W1WYNjM6+xOEZ5HGHpE?=
 =?us-ascii?Q?EpV8CvVp81X2dshe9Ba8+CDyQgcrBwPlYkM77sQis74SMifMPuNxtF20mF87?=
 =?us-ascii?Q?pcN/HADKm2f7mEUEnZdQGEwYBG7Copywc+tWsdwum0+n7JKjLoD0zNXNRJnO?=
 =?us-ascii?Q?ibFY2hDcxt3htefWBouUvyGvc8owR3KAuWCDadhLUaAONBZ44amgzHK44Cgy?=
 =?us-ascii?Q?AM0O16ghBw2y2P8Tmti/0/mxWW9McwEb3WuWbqVDJK904/hvh1IGIEGJZAkh?=
 =?us-ascii?Q?J3IRQWm8dZTdQLLJLSBgLjQBWR5A6rTVr9zEnXEd/N23ICoDgxEDdmWeCmGp?=
 =?us-ascii?Q?Bk1RlfqCwFARKLcvbAwmgyZf1apkQaEyMTL51v/TbaLsqpGf80CdgcQ8XhDR?=
 =?us-ascii?Q?sVTUKxaon5a4MMwar+akfaMnQAjbWOa5kvjxxbOIVpIQGIYcrgTiWFroMFys?=
 =?us-ascii?Q?lf9Ox/R34OHTknjPlW6gGNHPY1dtQ4fu02jtdLFf7PoGXYHTk5NuqVkQlQrY?=
 =?us-ascii?Q?AUyEIBtr/K3/lKBXEM0HTueiiYyOK4M4NCgM0wgvXc2v59mQqHtCQSXoHuJo?=
 =?us-ascii?Q?qxas3ejerf/3s7E5GURF+TwD25pQOEFIA41iB0gP4Fv69+J8EyOtw58pmjV1?=
 =?us-ascii?Q?RfLz5umNJREo3DeFhfIvaeEcG7E3imCYND3FguRskz26c7NepDb2jPfbkeCY?=
 =?us-ascii?Q?owlnX4zrlRsZEXhFVA32GN9lSgFR7bUicZpApx28EjLoRFbyp99e7ZqJwSan?=
 =?us-ascii?Q?kDTsLX+KKNr6jeKT8olY64zlHMrAJVtg/oK8O5Ka7/CKDyqzILz+q3fiZrbt?=
 =?us-ascii?Q?oAoQQd/FQuD6nJHFhSJhBllMmRE9mnznW+xlIM2/uDPyGm3bH2/YVRn3KMPo?=
 =?us-ascii?Q?pkhkPgwwbIcqhPEDqfEr+bpplyRcgxaHzI3zUGwID+f72vmL0a9qcZKdHfqy?=
 =?us-ascii?Q?x5CC6yN7YMxMn5k=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(7416014)(376014)(36860700013)(921020);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Apr 2025 17:31:04.9087 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f670368b-7797-4c20-fda0-08dd778c4e61
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7727
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

Add debugfs support for AMD PKI accelerator. The debugfs support prints
the following:

- Hardware info
- Hardware configuration
- Busy and idle cycles count in the PK engines
- pending requests for each queue

Signed-off-by: Nipun Gupta <nipun.gupta@amd.com>
---

Changes RFC->v2:
- this is a new patch which adds debugfs (removed some sysfs which was
  defined in RFC patch) and added more debugfs information

 drivers/accel/amdpk/Makefile        |   3 +-
 drivers/accel/amdpk/amdpk_debugfs.c | 107 ++++++++++++++++++++++++++++
 drivers/accel/amdpk/amdpk_drv.c     |   1 +
 drivers/accel/amdpk/amdpk_drv.h     |   2 +
 4 files changed, 112 insertions(+), 1 deletion(-)
 create mode 100644 drivers/accel/amdpk/amdpk_debugfs.c

diff --git a/drivers/accel/amdpk/Makefile b/drivers/accel/amdpk/Makefile
index 826f43ccebdf..8c0532e45a4f 100644
--- a/drivers/accel/amdpk/Makefile
+++ b/drivers/accel/amdpk/Makefile
@@ -5,4 +5,5 @@

 obj-$(CONFIG_DRM_ACCEL_AMDPK) := amdpk.o

-amdpk-y := amdpk_drv.o
+amdpk-y := amdpk_drv.o \
+	   amdpk_debugfs.o
diff --git a/drivers/accel/amdpk/amdpk_debugfs.c b/drivers/accel/amdpk/amdpk_debugfs.c
new file mode 100644
index 000000000000..341f1817503d
--- /dev/null
+++ b/drivers/accel/amdpk/amdpk_debugfs.c
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/seq_file.h>
+#include <drm/drm_debugfs.h>
+#include "amdpk_drv.h"
+
+static int amdpk_hw_info(struct seq_file *s, void *unused)
+{
+	struct drm_debugfs_entry *entry = s->private;
+	u64 maxtotalreqs, rqmaxpending, mults;
+	struct amdpk_dev *pkdev;
+	u64 v, hwv, cnt;
+
+	pkdev = to_amdpk_dev(entry->dev);
+
+	v = pk_rdreg(pkdev->regs, REG_SEMVER);
+	seq_printf(s, "Hardware interface version: %lld.%lld.%lld\n",
+		   AMDPK_SEMVER_MAJOR(v), AMDPK_SEMVER_MINOR(v), AMDPK_SEMVER_PATCH(v));
+
+	hwv = pk_rdreg(pkdev->regs, REG_HW_VERSION);
+	seq_printf(s, "Hardware implementation version: %lld.%lld.%lld\n",
+		   AMDPK_HWVER_MAJOR(hwv), AMDPK_HWVER_MINOR(hwv), AMDPK_HWVER_SVN(hwv));
+
+	cnt = pk_rdreg(pkdev->regs, REG_CFG_REQ_QUEUES_CNT);
+	seq_printf(s, "Count request queues: %lld\n", cnt);
+
+	maxtotalreqs = pk_rdreg(pkdev->regs, REG_CFG_MAX_PENDING_REQ);
+	seq_printf(s, "Total max pending requests: %lld\n", maxtotalreqs);
+
+	rqmaxpending = pk_rdreg(pkdev->regs, REG_CFG_MAX_REQ_QUEUE_ENTRIES);
+	seq_printf(s, "Total max pending requests: %lld\n", rqmaxpending);
+
+	mults = pk_rdreg(pkdev->regs, REG_CFG_PK_INST);
+	seq_printf(s, "Pkcores 64 multipliers: %lld\n", mults >> 16);
+	seq_printf(s, "Pkcores 256 multipliers: %lld\n", mults & 0xFFFF);
+
+	return 0;
+}
+
+static int amdpk_hw_config(struct seq_file *s, void *unused)
+{
+	struct drm_debugfs_entry *entry = s->private;
+	struct amdpk_dev *pkdev;
+	u64 addr, size, depth;
+	int i, j;
+
+	pkdev = to_amdpk_dev(entry->dev);
+	for (i = 0; i < pkdev->max_queues; i++) {
+		seq_printf(s, "Queue-%d:\n", i);
+		for (j = 0; j < MAX_RQMEM_PER_QUEUE; j++) {
+			addr = pk_rdreg(pkdev->regs, REG_RQ_CFG_PAGE(i, j));
+			seq_printf(s, "    page_addr[%d]: %llx\n", j, addr);
+		}
+		size = pk_rdreg(pkdev->regs, REG_RQ_CFG_PAGE_SIZE(i));
+		seq_printf(s, "    page_size: %lld\n", size);
+		depth = pk_rdreg(pkdev->regs, REG_RQ_CFG_DEPTH(i));
+		seq_printf(s, "    page_depth: %lld\n", depth);
+	}
+
+	return 0;
+}
+
+static int amdpk_cycle_count(struct seq_file *s, void *unused)
+{
+	struct drm_debugfs_entry *entry = s->private;
+	u64 busy_cycles, idle_cycles;
+	struct amdpk_dev *pkdev;
+
+	pkdev = to_amdpk_dev(entry->dev);
+	busy_cycles = pk_rdreg(pkdev->regs, REG_PK_BUSY_CYCLES);
+	seq_printf(s, "PK busy cycles: %lld\n", busy_cycles);
+	idle_cycles = pk_rdreg(pkdev->regs, REG_PK_IDLE_CYCLES);
+	seq_printf(s, "PK idle cycles: %lld\n", idle_cycles);
+
+	return 0;
+}
+
+static int amdpk_pending_reqs(struct seq_file *s, void *unused)
+{
+	struct drm_debugfs_entry *entry = s->private;
+	struct amdpk_dev *pkdev;
+	u64 pending_reqs;
+	int i;
+
+	pkdev = to_amdpk_dev(entry->dev);
+	for (i = 0; i < pkdev->max_queues; i++) {
+		pending_reqs = pk_rdreg(pkdev->regs, REG_CTL_BASE(i) + REG_CTL_PENDING_REQS);
+		seq_printf(s, "Queue-%d pending requests: %lld\n", i, pending_reqs);
+	}
+
+	return 0;
+}
+
+static const struct drm_debugfs_info amdpk_debugfs_list[] = {
+	{"hw_info", amdpk_hw_info, 0},
+	{"hw_config", amdpk_hw_config, 0},
+	{"cycle_count", amdpk_cycle_count, 0},
+	{"pending_reqs", amdpk_pending_reqs, 0},
+};
+
+void amdpk_debugfs_init(struct amdpk_dev *pkdev)
+{
+	drm_debugfs_add_files(&pkdev->ddev, amdpk_debugfs_list, ARRAY_SIZE(amdpk_debugfs_list));
+}
diff --git a/drivers/accel/amdpk/amdpk_drv.c b/drivers/accel/amdpk/amdpk_drv.c
index 17c328d03db8..14cb6e7449ce 100644
--- a/drivers/accel/amdpk/amdpk_drv.c
+++ b/drivers/accel/amdpk/amdpk_drv.c
@@ -678,6 +678,7 @@ static int amdpk_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev, "DRM register failed, ret %d", ret);
 		return ret;
 	}
+	amdpk_debugfs_init(pkdev);

 	return amdpk_create_device(pkdev, dev, irq);
 }
diff --git a/drivers/accel/amdpk/amdpk_drv.h b/drivers/accel/amdpk/amdpk_drv.h
index c14c10db5d97..c260c3fb5626 100644
--- a/drivers/accel/amdpk/amdpk_drv.h
+++ b/drivers/accel/amdpk/amdpk_drv.h
@@ -258,6 +258,8 @@ struct amdpk_user {
 #define to_amdpk_dev(dev) container_of(dev, struct amdpk_dev, ddev)
 #define to_amdpk_work(work) container_of(work, struct amdpk_work, cq_work)

+void amdpk_debugfs_init(struct amdpk_dev *pkdev);
+
 static void __maybe_unused pk_wrreg(char __iomem *regs, int addr, u64 val)
 {
 	iowrite64(val, regs + addr);
--
2.34.1

