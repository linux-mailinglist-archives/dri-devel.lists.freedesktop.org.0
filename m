Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F4F59EAFD3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 12:26:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C9DC10E8A4;
	Tue, 10 Dec 2024 11:26:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NOVcNzKS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEDE10E2B5
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Dec 2024 17:26:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tU7UY2MlY7AkPblyqf1+Zfo6nnmEuRpzP9KoDB8+JjadHPsnxip9zwNhrZhSUvuBtyOejwUsbhUto4gY96OaJmWim2b8pNQea0OV+PL12uw1trDQK0C9vPLJAtXEZ6tLx5PQd/mOCBNXAFrX1Sh2ukL5QEFRRbAfbpAW+dkU/yniuAJG+AEl8n9L3CpH70iqp07NWYFm1zjMW+0UlOMcRC/1vihQy+qNLTx3WUMHSqWbL5HA2GWzaVjLHYNoMPY/SRmK0hq9HRhZ2OewHHzG7nFNbebA6tY7uYoVmyD58rHjE3rB6s0WD8KC/n5BEG5+ETCpiVtTN1jj15Pb2nu+EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DA3IURfqoPw+kKMkOVLKzZ+M/itQKop7D5aI4Jmw38w=;
 b=iwUfCPuynjI6x8Jb9o8bqV6EMVsQK+nFM+d/A+hcNv2OKQrLFBruyHdk+ugsVXgANACXP1DDwXH2dbo+ltPCNjY54EosZX6tMiD0KMrR+YJu6OEBZv/+jpbode3LwsIqvJV+k+L0RoxLzDVpnAN/S732KBDgvEfNV6drb+1VcCQJzKzPNrmkakfDHm4ckzHTh75ZWK7LPkm7l8xgCBvJT2anNeCiXOJzXfgzsxNdYXap5o36eKnmJHYl13KrozEJ79qNJ49HxNWZQI7ZgEK68M7QGWmFCChtn8SUmo8vqBhPmKEVJqrNzblcULcgr4kMDdbDGJboghG81Ft98L+EKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DA3IURfqoPw+kKMkOVLKzZ+M/itQKop7D5aI4Jmw38w=;
 b=NOVcNzKSB5z6WTVFXR0Owzaj9P7BeO+Waj2STUoZOmsG/psyfwrR7NaPnUcqxfHStj7TPQtccoMebHj2PWvlhbtUIod335WdKiH9ImbOVM/7PlHn3nnuV9D+KSZogK1oxnUjpwPpjkjAAeLZFdDrnrlsGD9Y5sTzGMF2ZC5jow5+19yo1jLUugpGvqKgSlqvsUvWgKxcKbhjA9CUl4EPuxdk5iGaZpK36N17ntSSAsGnOmllfAPkCxigHVO44Y+12TSfGDTxuU6u5YkzbnSm7kEhxaeLMl2Z7vLRYCCBkmvQvvbNPIyN7k+SLbXZGrN8AsaspIzS0HLkdhN29iXQ2Q==
Received: from PH8PR02CA0017.namprd02.prod.outlook.com (2603:10b6:510:2d0::20)
 by SN7PR12MB7275.namprd12.prod.outlook.com (2603:10b6:806:2ae::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.25; Mon, 9 Dec
 2024 17:26:22 +0000
Received: from CY4PEPF0000EE3B.namprd03.prod.outlook.com
 (2603:10b6:510:2d0:cafe::7b) by PH8PR02CA0017.outlook.office365.com
 (2603:10b6:510:2d0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8182.21 via Frontend Transport; Mon,
 9 Dec 2024 17:26:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE3B.mail.protection.outlook.com (10.167.242.14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8230.7 via Frontend Transport; Mon, 9 Dec 2024 17:26:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Dec 2024
 09:26:03 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 9 Dec 2024
 09:26:03 -0800
Received: from thinkpad-t480.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Mon, 9 Dec 2024 09:26:02 -0800
From: Johnny Liu <johnliu@nvidia.com>
To: <thierry.reding@gmail.com>, <mperttunen@nvidia.com>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-tegra@vger.kernel.org>
CC: <jonathanh@nvidia.com>, <rkasirajan@nvidia.com>, <bbasu@nvidia.com>,
 <johnliu@nvidia.com>
Subject: [PATCH 3/5] gpu: host1x: Support device monitoring with actmon
Date: Mon, 9 Dec 2024 09:25:47 -0800
Message-ID: <20241209172549.5624-4-johnliu@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241209172549.5624-1-johnliu@nvidia.com>
References: <20241209172549.5624-1-johnliu@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3B:EE_|SN7PR12MB7275:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b079ac2-bcdd-4ed8-c1ce-08dd187699c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?V70AnHuqEq/uBnu+J6FJGUme+7ibplCjU4k5/gqs0fMwxpZu21byWFlHo8OG?=
 =?us-ascii?Q?ppVKISB+BBZv+y2FD3wy3UNVO02KktF4oZrNKikAypCacC8IvUbxmyG/fVIH?=
 =?us-ascii?Q?BJcQY6/j0paUHkCtKx9hw98OkTpKFEpwlMBVTQnJN1edPPrLeeLpSQycGWVI?=
 =?us-ascii?Q?PUqUU+UnXg1wjf5t57Toqd5kI6RTxzJIxsil0SWmEp+5rRWlTmYlL/N2WBgx?=
 =?us-ascii?Q?GrD40e3zw8ZRwCQ0ONe0oT3Ae8wHyNh3iRp7v6/U2/GX7+dVX9h4cTYusnPF?=
 =?us-ascii?Q?B5LVlib0a6xqy9rXR8olRQamX+ikhFQWLztxxfLPymzUWBPqcOUcSoU5RjJy?=
 =?us-ascii?Q?0KZETdPfLX7ZiryjhRP7aM0rcWBGfjV0BLWsNfRZ0Jve9o+Q/18szqvG11rZ?=
 =?us-ascii?Q?ihlOvYmVHDQdhCosL7Ejr1kQqgaEFxyUlFsg+Hhsz9Cr/k1gAUTqQxTcXbq4?=
 =?us-ascii?Q?Nk9pMxFTJ5XwpaI4bPr5Ce2DbwhnPdw5KCGKqMx8seCbCXsUQy+z224o5OiI?=
 =?us-ascii?Q?B4TdpvpYuF2l939ic5Ln2xRJWM839aITmZXrxjWGilbkGSyUGTTTLxZ9Fx7F?=
 =?us-ascii?Q?0sRjHAG0x/cFsdNJxN+FbfoEK49zAYwiXtAf7ehwNHe70KtDOtE5q721v3vq?=
 =?us-ascii?Q?jr7tqPSGg5FKlWU7Qt3P42rVaoAIKNdwazyY6CWSa8QUgJvzH9FxbhOZJsA+?=
 =?us-ascii?Q?gIVy0IjlZA5jRYj25Ic/TcW9X88Kqwg3CwWI0xe3gG5qkb5T0tWTycXSaFQM?=
 =?us-ascii?Q?2yZjtuqxb3N/ZE0qiuJkuzVFpMjbVISqVD7WjJYstny/Gqwp4AFC3e++qHaN?=
 =?us-ascii?Q?LuICJ9QYLoUIv6N/VMWsT90KFni/uc9IBt8+IwgcqpyuoDwPY3Zr3dXgHUai?=
 =?us-ascii?Q?p8hVXZX9QCnbJoywK0cSka4yQsczQU6Z680fS6KC8u/LYe0FNINGeOqzdC3D?=
 =?us-ascii?Q?VgQnoBXtsZddMSNTRQOplwYVqZBnS/9wMKSBgDr3+hi8BlkoWb+j6I0/KrdT?=
 =?us-ascii?Q?0JQtv7RagWIEXkYhn9zvOdYSE4HFWLbZuLHFPDwYeLRczF/J6UnFD5dHSvt8?=
 =?us-ascii?Q?2iKxS97qkoS/sVdISlmocTBj4uupz+BiaqZjpqtf99QTJWOLg+BbGw9ejulI?=
 =?us-ascii?Q?ki+ocemZms//KxZQiAz6ndxk6bw2QSt3YJyt/WyH2omnMkH/IyX4IgTlRZCZ?=
 =?us-ascii?Q?HrYmxPLsiJrq9nbI9FLbDJ1zyNS0OTLaYcntQnZOnHFXGj7QD8W1f2/PvrGh?=
 =?us-ascii?Q?+mugbb6pPKWkG13CeAB0BHe0S80+tYveDxs+rybIgDW0dpIcfuukI+M1OkEG?=
 =?us-ascii?Q?e0RaVzRUIthiec8lLUinMlGojipIFk0D/u4xVp/xQOdzrYr0vZQzzHyUNGtA?=
 =?us-ascii?Q?ehKDqwZal53Fl7tQrGq0QLywzm283+D11Ce7YR3D9YeK9NS3pnJh/HsTksHT?=
 =?us-ascii?Q?uXfhBqtSPOtj0BUZxWyfm2BDDWMEcqMC?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2024 17:26:22.0753 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b079ac2-bcdd-4ed8-c1ce-08dd187699c7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3B.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7275
X-Mailman-Approved-At: Tue, 10 Dec 2024 11:26:10 +0000
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

An activity monitor (actmon) is used to measure the device runtime
utilization to help drive software power management policies, such as
device dynamic frequency scaling.

For every host1x client, an actmon is employed to monitor its runtime
utilization. Upon detecting an actmon watermark breach against the
sampled runtime utilization value, it will trigger an interrupt to
the host1x subsystem to trigger device dynamic frequency scaling if
supported by the client.

Upon registration with actmon within the host1x subsystem, a host1x
client gains the ability to activate/deactivate its own actmon
during the device resume/suspend cycle. This ensures that a host1x
client runs at the power-optimal frequency when active, while also
preventing unnecessary actmon interrupts during periods of inactivity.

Signed-off-by: Johnny Liu <johnliu@nvidia.com>
---
 drivers/gpu/host1x/Makefile                |   1 +
 drivers/gpu/host1x/actmon.c                | 558 +++++++++++++++++++++
 drivers/gpu/host1x/actmon.h                |  46 ++
 drivers/gpu/host1x/dev.c                   |  71 ++-
 drivers/gpu/host1x/dev.h                   |  57 ++-
 drivers/gpu/host1x/hw/actmon.h             |  49 ++
 drivers/gpu/host1x/hw/host1x08.c           |   6 +-
 drivers/gpu/host1x/hw/hw_host1x08_common.h |  16 +-
 drivers/gpu/host1x/hw/intr_general_hw.c    |  83 +++
 include/linux/host1x.h                     |  30 +-
 10 files changed, 902 insertions(+), 15 deletions(-)
 create mode 100644 drivers/gpu/host1x/actmon.c
 create mode 100644 drivers/gpu/host1x/actmon.h
 create mode 100644 drivers/gpu/host1x/hw/actmon.h
 create mode 100644 drivers/gpu/host1x/hw/intr_general_hw.c

diff --git a/drivers/gpu/host1x/Makefile b/drivers/gpu/host1x/Makefile
index ee5286ffe08d5..230afea0f2aa5 100644
--- a/drivers/gpu/host1x/Makefile
+++ b/drivers/gpu/host1x/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 host1x-y = \
+	actmon.o \
 	bus.o \
 	syncpt.o \
 	dev.o \
diff --git a/drivers/gpu/host1x/actmon.c b/drivers/gpu/host1x/actmon.c
new file mode 100644
index 0000000000000..7a1d98fd099a8
--- /dev/null
+++ b/drivers/gpu/host1x/actmon.c
@@ -0,0 +1,558 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Tegra host1x actmon driver
+ */
+
+#include <linux/clk.h>
+#include <linux/debugfs.h>
+#include <linux/errno.h>
+#include <linux/fs.h>
+#include <linux/host1x.h>
+#include <linux/units.h>
+
+#include "dev.h"
+#include "actmon.h"
+#include "hw/actmon.h"
+
+static void actmon_writel(struct host1x_actmon *actmon, u32 val, u32 offset)
+{
+	writel(val, actmon->regs + offset);
+}
+
+static u32 actmon_readl(struct host1x_actmon *actmon, u32 offset)
+{
+	return readl(actmon->regs + offset);
+}
+
+static void actmon_module_writel(struct host1x_actmon_module *module, u32 val, u32 offset)
+{
+	writel(val, module->regs + offset);
+}
+
+static u32 actmon_module_readl(struct host1x_actmon_module *module, u32 offset)
+{
+	return readl(module->regs + offset);
+}
+
+static void host1x_actmon_update_sample_period(struct host1x_actmon *actmon)
+{
+	unsigned long actmon_mhz;
+	u32 actmon_clks_per_sample, sample_period, val = 0;
+
+	actmon_mhz = actmon->rate / HZ_PER_MHZ;
+	actmon_clks_per_sample = actmon_mhz * actmon->usecs_per_sample;
+
+	val |= HOST1X_ACTMON_CTRL_SOURCE(2);
+
+	if (actmon_clks_per_sample > 65536) {
+		val |= HOST1X_ACTMON_CTRL_SAMPLE_TICK(1);
+		sample_period = actmon_clks_per_sample / 65536;
+	} else {
+		val &= ~HOST1X_ACTMON_CTRL_SAMPLE_TICK(1);
+		sample_period = actmon_clks_per_sample / 256;
+	}
+
+	val &= ~HOST1X_ACTMON_CTRL_SAMPLE_PERIOD_MASK;
+	val |= HOST1X_ACTMON_CTRL_SAMPLE_PERIOD(sample_period);
+	actmon_writel(actmon, val, HOST1X_ACTMON_CTRL_REG);
+}
+
+static int host1x_actmon_sample_period_get(void *data, u64 *val)
+{
+	struct host1x_actmon *actmon = (struct host1x_actmon *)data;
+
+	*val = (u64)actmon->usecs_per_sample;
+
+	return 0;
+}
+
+static int host1x_actmon_sample_period_set(void *data, u64 val)
+{
+	struct host1x_actmon *actmon = (struct host1x_actmon *)data;
+
+	actmon->usecs_per_sample = (u32)val;
+	host1x_actmon_update_sample_period(actmon);
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(host1x_actmon_sample_period_fops,
+			host1x_actmon_sample_period_get,
+		host1x_actmon_sample_period_set,
+		"%lld\n");
+
+/**
+ * host1x_actmon_debug_init - Initialize actmon debugfs
+ * @actmon: the actmon instance being configured
+ * @name: an unique name of the actmon
+ *
+ * There are multiple modules available inside the actmon, and they perform the
+ * signal sampling at the same rate. The debugfs of an actmon will expose this
+ * shared configuration, sample_period, via a debugfs node:
+ * - sample_period:
+ *   Sampling period in micro-second of modules inside the actmon
+ */
+static void host1x_actmon_debug_init(struct host1x_actmon *actmon, const char *name)
+{
+	struct host1x *host = dev_get_drvdata(actmon->client->host->parent);
+
+	if (!host->debugfs) {
+		dev_warn(host->dev, "debugfs is unavailable\n");
+		return;
+	}
+
+	if (!host->actmon_debugfs)
+		host->actmon_debugfs = debugfs_create_dir("actmon", host->debugfs);
+
+	actmon->debugfs = debugfs_create_dir(name, host->actmon_debugfs);
+
+	/* R/W files */
+	debugfs_create_file("sample_period", 0644, actmon->debugfs, actmon,
+			    &host1x_actmon_sample_period_fops);
+}
+
+static int host1x_actmon_module_k_get(void *data, u64 *val)
+{
+	struct host1x_actmon_module *module = (struct host1x_actmon_module *)data;
+
+	*val = (u64)module->k;
+
+	return 0;
+}
+
+static int host1x_actmon_module_k_set(void *data, u64 val)
+{
+	struct host1x_actmon_module *module = (struct host1x_actmon_module *)data;
+	u32 val32;
+
+	module->k = (u32)val;
+
+	val32 = actmon_module_readl(module, HOST1X_ACTMON_MODULE_CTRL_REG);
+	val32 &= ~HOST1X_ACTMON_MODULE_CTRL_K_VAL_MASK;
+	val32 |= HOST1X_ACTMON_MODULE_CTRL_K_VAL(module->k);
+	actmon_module_writel(module, val32, HOST1X_ACTMON_MODULE_CTRL_REG);
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(host1x_actmon_module_k_fops,
+			host1x_actmon_module_k_get,
+		host1x_actmon_module_k_set,
+		"%lld\n");
+
+static int host1x_actmon_module_consec_upper_num_get(void *data, u64 *val)
+{
+	struct host1x_actmon_module *module = (struct host1x_actmon_module *)data;
+
+	*val = (u64)module->consec_upper_num;
+
+	return 0;
+}
+
+static int host1x_actmon_module_consec_upper_num_set(void *data, u64 val)
+{
+	struct host1x_actmon_module *module = (struct host1x_actmon_module *)data;
+	u32 val32;
+
+	module->consec_upper_num = (u32)val;
+
+	val32 = actmon_module_readl(module, HOST1X_ACTMON_MODULE_CTRL_REG);
+	val32 &= ~HOST1X_ACTMON_MODULE_CTRL_CONSEC_UPPER_NUM_MASK;
+	val32 |= HOST1X_ACTMON_MODULE_CTRL_CONSEC_UPPER_NUM(module->consec_upper_num);
+	actmon_module_writel(module, val32, HOST1X_ACTMON_MODULE_CTRL_REG);
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(host1x_actmon_module_consec_upper_num_fops,
+			host1x_actmon_module_consec_upper_num_get,
+		host1x_actmon_module_consec_upper_num_set,
+		"%lld\n");
+
+static int host1x_actmon_module_consec_lower_num_get(void *data, u64 *val)
+{
+	struct host1x_actmon_module *module = (struct host1x_actmon_module *)data;
+
+	*val = (u64)module->consec_lower_num;
+
+	return 0;
+}
+
+static int host1x_actmon_module_consec_lower_num_set(void *data, u64 val)
+{
+	struct host1x_actmon_module *module = (struct host1x_actmon_module *)data;
+	u32 val32;
+
+	module->consec_lower_num = (u32)val;
+
+	val32 = actmon_module_readl(module, HOST1X_ACTMON_MODULE_CTRL_REG);
+	val32 &= ~HOST1X_ACTMON_MODULE_CTRL_CONSEC_LOWER_NUM_MASK;
+	val32 |= HOST1X_ACTMON_MODULE_CTRL_CONSEC_LOWER_NUM(module->consec_lower_num);
+	actmon_module_writel(module, val32, HOST1X_ACTMON_MODULE_CTRL_REG);
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(host1x_actmon_module_consec_lower_num_fops,
+			host1x_actmon_module_consec_lower_num_get,
+		host1x_actmon_module_consec_lower_num_set,
+		"%lld\n");
+
+static int host1x_actmon_module_avg_norm_get(void *data, u64 *val)
+{
+	struct host1x_actmon_module *module = (struct host1x_actmon_module *)data;
+	struct host1x_actmon *actmon = module->actmon;
+	struct host1x_client *client = actmon->client;
+	unsigned long client_freq;
+	u32 active_clks, client_clks;
+
+	if (!client->ops || !client->ops->get_rate)
+		return -EOPNOTSUPP;
+
+	active_clks = actmon_module_readl(module, HOST1X_ACTMON_MODULE_AVG_COUNT_REG);
+
+	client_freq = client->ops->get_rate(client);
+	client_clks = ((client_freq / 1000) * actmon->usecs_per_sample) / 1000;
+
+	*val = (u64)(active_clks * 1000) / client_clks;
+
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(host1x_actmon_module_avg_norm_fops,
+			host1x_actmon_module_avg_norm_get, NULL,
+		"%lld\n");
+
+/**
+ * host1x_actmon_module_debug_init - Initialize debugfs for module inside actmon
+ * @module: the actmon module being configured
+ *
+ * Each module inside the actmon is used for monitoring the utilization of the
+ * underlying host1x client. The debugfs of an actmon module will expose the
+ * following debugfs nodes:
+ * - k:
+ *   It is a programmable factor affecting the exponential-moving-average filter
+ *   inside the actmon module for calculating the utilization of the engine over
+ *   the time. The formula of the filter is as following:
+ *
+ *	K = 1 / 2^(k+1)
+ *	A_t = (K * C_t) + ((1-K) * A_{t-1})
+ *
+ *   where A_t is the average utilization at time t. C_t is the sampled actmon
+ *   counter value at time t.
+ *
+ * - consec_upper_num:
+ *   "`consec_upper_num` + 1" of consecutive upper watermark breaches that need
+ *   to occur before actmon module asserts the interrupt to CPU.
+ *
+ * - consec_lower_num:
+ *   "`consec_lower_num` + 1" of consecutive lower watermark breaches that need
+ *   to occur before actmon module asserts the interrupt to CPU.
+ *
+ * - usage:
+ *   A normalized value representing the utilization of the engine ranges from
+ *   0 to 1000.
+ */
+static void host1x_actmon_module_debug_init(struct host1x_actmon_module *module)
+{
+	struct host1x *host = dev_get_drvdata(module->actmon->client->host->parent);
+	struct device *dev = module->actmon->client->dev;
+	struct dentry *debugfs = module->actmon->debugfs;
+	char dirname[8];
+
+	if (!debugfs) {
+		dev_warn(host->dev,
+			 "actmon debugfs entry for %s was not found\n",
+			 dev_name(dev));
+		return;
+	}
+
+	snprintf(dirname, sizeof(dirname), "module%d", module->type);
+	module->debugfs = debugfs_create_dir(dirname, debugfs);
+
+	/* R/W files */
+	debugfs_create_file("k", 0644, module->debugfs, module,
+			    &host1x_actmon_module_k_fops);
+	debugfs_create_file("consec_upper_num", 0644, module->debugfs, module,
+			    &host1x_actmon_module_consec_upper_num_fops);
+	debugfs_create_file("consec_lower_num", 0644, module->debugfs, module,
+			    &host1x_actmon_module_consec_lower_num_fops);
+
+	/* R files */
+	debugfs_create_file("usage", 0444, module->debugfs, module,
+			    &host1x_actmon_module_avg_norm_fops);
+}
+
+static void host1x_actmon_init(struct host1x_actmon *actmon)
+{
+	u32 val;
+
+	/* Global control register */
+	host1x_actmon_update_sample_period(actmon);
+
+	/* Global interrupt enable register */
+	val = (1 << actmon->num_modules) - 1;
+	actmon_writel(actmon, val, HOST1X_ACTMON_INTR_ENB_REG);
+}
+
+static void host1x_actmon_deinit(struct host1x_actmon *actmon)
+{
+	actmon_writel(actmon, 0, HOST1X_ACTMON_CTRL_REG);
+	actmon_writel(actmon, 0, HOST1X_ACTMON_INTR_ENB_REG);
+}
+
+static void host1x_actmon_module_init(struct host1x_actmon_module *module)
+{
+	/* Local control register */
+	actmon_module_writel(module,
+			     HOST1X_ACTMON_MODULE_CTRL_ACTMON_ENB(0) |
+			     HOST1X_ACTMON_MODULE_CTRL_ENB_PERIODIC(1) |
+			     HOST1X_ACTMON_MODULE_CTRL_K_VAL(module->k) |
+			     HOST1X_ACTMON_MODULE_CTRL_CONSEC_UPPER_NUM(module->consec_upper_num) |
+			     HOST1X_ACTMON_MODULE_CTRL_CONSEC_LOWER_NUM(module->consec_lower_num),
+			     HOST1X_ACTMON_MODULE_CTRL_REG);
+
+	/* Interrupt enable register (disable interrupts by default) */
+	actmon_module_writel(module, 0, HOST1X_ACTMON_MODULE_INTR_ENB_REG);
+
+	/* Interrupt status register */
+	actmon_module_writel(module, ~0, HOST1X_ACTMON_MODULE_INTR_STATUS_REG);
+
+	/* Consecutive watermark registers */
+	actmon_module_writel(module, ~0, HOST1X_ACTMON_MODULE_UPPER_WMARK_REG);
+	actmon_module_writel(module, 0, HOST1X_ACTMON_MODULE_LOWER_WMARK_REG);
+
+	/* Moving-average watermark registers */
+	actmon_module_writel(module, ~0, HOST1X_ACTMON_MODULE_AVG_UPPER_WMARK_REG);
+	actmon_module_writel(module, 0, HOST1X_ACTMON_MODULE_AVG_LOWER_WMARK_REG);
+
+	/* Init average value register */
+	actmon_module_writel(module, 0, HOST1X_ACTMON_MODULE_INIT_AVG_REG);
+}
+
+static void host1x_actmon_module_deinit(struct host1x_actmon_module *module)
+{
+	actmon_module_writel(module, 0, HOST1X_ACTMON_MODULE_CTRL_REG);
+	actmon_module_writel(module, 0, HOST1X_ACTMON_MODULE_INTR_ENB_REG);
+	actmon_module_writel(module, ~0, HOST1X_ACTMON_MODULE_INTR_STATUS_REG);
+	actmon_module_writel(module, 0, HOST1X_ACTMON_MODULE_UPPER_WMARK_REG);
+	actmon_module_writel(module, 0, HOST1X_ACTMON_MODULE_LOWER_WMARK_REG);
+	actmon_module_writel(module, 0, HOST1X_ACTMON_MODULE_AVG_UPPER_WMARK_REG);
+	actmon_module_writel(module, 0, HOST1X_ACTMON_MODULE_AVG_LOWER_WMARK_REG);
+	actmon_module_writel(module, 0, HOST1X_ACTMON_MODULE_INIT_AVG_REG);
+	actmon_module_writel(module, 0, HOST1X_ACTMON_MODULE_COUNT_WEIGHT_REG);
+}
+
+void host1x_actmon_handle_interrupt(struct host1x *host, int classid)
+{
+	unsigned long actmon_status, module_status;
+	struct host1x_actmon_module *module;
+	struct host1x_actmon *actmon, *tmp_actmon;
+	struct host1x_client *client;
+
+	list_for_each_entry_safe(actmon, tmp_actmon, &host->actmons, list) {
+		if (actmon->client->class == classid)
+			break;
+	}
+
+	client = actmon->client;
+	module = &actmon->modules[HOST1X_ACTMON_MODULE_ACTIVE];
+
+	actmon_status = actmon_readl(actmon, HOST1X_ACTMON_INTR_STATUS_REG);
+	module_status = actmon_module_readl(module, HOST1X_ACTMON_MODULE_INTR_STATUS_REG);
+
+	/* Trigger DFS if client supports it */
+	if (client->ops && client->ops->actmon_event) {
+		if (module_status & HOST1X_ACTMON_MODULE_INTR_CONSEC_WMARK_ABOVE)
+			client->ops->actmon_event(client, HOST1X_ACTMON_CONSEC_WMARK_ABOVE);
+
+		if (module_status & HOST1X_ACTMON_MODULE_INTR_CONSEC_WMARK_BELOW)
+			client->ops->actmon_event(client, HOST1X_ACTMON_CONSEC_WMARK_BELOW);
+
+		if (module_status & HOST1X_ACTMON_MODULE_INTR_AVG_WMARK_ABOVE)
+			client->ops->actmon_event(client, HOST1X_ACTMON_AVG_WMARK_ABOVE);
+
+		if (module_status & HOST1X_ACTMON_MODULE_INTR_AVG_WMARK_BELOW)
+			client->ops->actmon_event(client, HOST1X_ACTMON_AVG_WMARK_BELOW);
+	}
+
+	actmon_module_writel(module, module_status, HOST1X_ACTMON_MODULE_INTR_STATUS_REG);
+	actmon_writel(actmon, actmon_status, HOST1X_ACTMON_INTR_STATUS_REG);
+}
+
+int host1x_actmon_register(struct host1x_client *client)
+{
+	struct host1x *host = dev_get_drvdata(client->host->parent);
+	const struct host1x_info *info = host->info;
+	const struct host1x_actmon_entry *entry = NULL;
+	struct host1x_actmon_module *module;
+	struct host1x_actmon *actmon;
+	int i;
+
+	if (!info->has_actmon) {
+		dev_dbg(host->dev, "actmon is not supported\n");
+		return 0;
+	}
+
+	if (!host->actmon_regs) {
+		dev_warn(host->dev,
+			 "skip registration since actmon resource is not defined\n");
+		return 0;
+	}
+
+	if (!host->actmon_clk) {
+		dev_warn(host->dev,
+			 "skip registration since actmon clock is unavailable\n");
+		return 0;
+	}
+
+	if (client->actmon) {
+		dev_warn(host->dev,
+			 "%s has already registered actmon\n",
+			 dev_name(client->dev));
+		return 0;
+	}
+
+	for (i = 0; i < info->num_actmon_entries; i++) {
+		if (info->actmon_table[i].classid == client->class)
+			entry = &info->actmon_table[i];
+	}
+	if (!entry)
+		return -ENODEV;
+
+	actmon = devm_kzalloc(client->dev, sizeof(*actmon), GFP_KERNEL);
+	if (!actmon)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(&actmon->list);
+	mutex_lock(&host->actmons_lock);
+	list_add_tail(&actmon->list, &host->actmons);
+	mutex_unlock(&host->actmons_lock);
+
+	actmon->client = client;
+	actmon->rate = clk_get_rate(host->actmon_clk);
+	actmon->regs = host->actmon_regs + entry->offset;
+	actmon->irq = entry->irq;
+	actmon->num_modules = entry->num_modules;
+	actmon->usecs_per_sample = 1500;
+
+	/* Configure actmon registers */
+	host1x_actmon_init(actmon);
+
+	/* Create debugfs for the actmon */
+	host1x_actmon_debug_init(actmon, entry->name);
+
+	/* Configure actmon module registers */
+	for (i = 0; i < actmon->num_modules; i++) {
+		module = &actmon->modules[i];
+		module->actmon = actmon;
+		module->type = i;
+		module->regs = actmon->regs + (i * HOST1X_ACTMON_MODULE_OFFSET);
+
+		module->k = 2;
+		module->consec_upper_num = 7;
+		module->consec_lower_num = 7;
+		host1x_actmon_module_init(module);
+
+		/* Create debugfs for the actmon module */
+		host1x_actmon_module_debug_init(module);
+	}
+
+	client->actmon = actmon;
+
+	return 0;
+}
+EXPORT_SYMBOL(host1x_actmon_register);
+
+void host1x_actmon_unregister(struct host1x_client *client)
+{
+	struct host1x_actmon_module *module;
+	struct host1x *host = dev_get_drvdata(client->host->parent);
+	struct host1x_actmon *actmon = client->actmon;
+	int i;
+
+	if (!actmon)
+		return;
+
+	for (i = 0; i < actmon->num_modules; i++) {
+		module = &actmon->modules[i];
+		host1x_actmon_module_deinit(module);
+		debugfs_remove_recursive(module->debugfs);
+	}
+
+	debugfs_remove_recursive(actmon->debugfs);
+
+	host1x_actmon_deinit(actmon);
+
+	mutex_lock(&host->actmons_lock);
+	list_del(&actmon->list);
+	mutex_unlock(&host->actmons_lock);
+
+	client->actmon = NULL;
+}
+EXPORT_SYMBOL(host1x_actmon_unregister);
+
+void host1x_actmon_enable(struct host1x_client *client)
+{
+	struct host1x_actmon *actmon = client->actmon;
+	struct host1x_actmon_module *module;
+	int i;
+
+	if (!actmon)
+		return;
+
+	for (i = 0; i < actmon->num_modules; i++) {
+		module = &actmon->modules[i];
+		actmon_module_writel(module,
+				     actmon_module_readl(module, HOST1X_ACTMON_MODULE_CTRL_REG) |
+				     HOST1X_ACTMON_MODULE_CTRL_ACTMON_ENB(1),
+				     HOST1X_ACTMON_MODULE_CTRL_REG);
+	}
+}
+EXPORT_SYMBOL(host1x_actmon_enable);
+
+void host1x_actmon_disable(struct host1x_client *client)
+{
+	struct host1x_actmon *actmon = client->actmon;
+	struct host1x_actmon_module *module;
+	int i;
+
+	if (!actmon)
+		return;
+
+	for (i = 0; i < actmon->num_modules; i++) {
+		module = &actmon->modules[i];
+		actmon_module_writel(module,
+				     actmon_module_readl(module, HOST1X_ACTMON_MODULE_CTRL_REG) &
+				     ~HOST1X_ACTMON_MODULE_CTRL_ACTMON_ENB(1),
+				     HOST1X_ACTMON_MODULE_CTRL_REG);
+	}
+}
+EXPORT_SYMBOL(host1x_actmon_disable);
+
+void host1x_actmon_update_client_rate(struct host1x_client *client,
+				      unsigned long rate,
+				      u32 *weight)
+{
+	struct host1x_actmon *actmon = client->actmon;
+	struct host1x_actmon_module *module;
+	u32 val;
+	int i;
+
+	if (!actmon) {
+		*weight = 0;
+		return;
+	}
+
+	val = (rate / actmon->rate) << 2;
+
+	for (i = 0; i < actmon->num_modules; i++) {
+		module = &actmon->modules[i];
+		actmon_module_writel(module, val, HOST1X_ACTMON_MODULE_COUNT_WEIGHT_REG);
+	}
+
+	*weight = val;
+}
+EXPORT_SYMBOL(host1x_actmon_update_client_rate);
diff --git a/drivers/gpu/host1x/actmon.h b/drivers/gpu/host1x/actmon.h
new file mode 100644
index 0000000000000..8d6f314b8a3ea
--- /dev/null
+++ b/drivers/gpu/host1x/actmon.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ * SPDX-FileCopyrightText: Copyright (c) 2009-2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ */
+
+#ifndef HOST1X_ACTMON_H
+#define HOST1X_ACTMON_H
+
+#include <linux/device.h>
+#include <linux/types.h>
+
+enum host1x_actmon_module_type {
+	HOST1X_ACTMON_MODULE_ACTIVE,
+	HOST1X_ACTMON_MODULE_STALL,
+};
+
+struct host1x_actmon;
+
+struct host1x_actmon_module {
+	enum host1x_actmon_module_type type;
+	u32 k;
+	u32 consec_upper_num;
+	u32 consec_lower_num;
+	void __iomem *regs;
+	struct host1x_actmon *actmon;
+	struct dentry *debugfs;
+};
+
+struct host1x_client;
+
+struct host1x_actmon {
+	unsigned int irq;
+	unsigned int num_modules;
+	unsigned long rate;
+	u32 usecs_per_sample;
+	void __iomem *regs;
+	struct host1x_client *client;
+	struct host1x_actmon_module modules[8];
+	struct dentry *debugfs;
+	struct list_head list;
+};
+
+struct host1x;
+
+void host1x_actmon_handle_interrupt(struct host1x *host, int classid);
+
+#endif
diff --git a/drivers/gpu/host1x/dev.c b/drivers/gpu/host1x/dev.c
index 3a0aaa68ac8d9..3ea62a1b165fe 100644
--- a/drivers/gpu/host1x/dev.c
+++ b/drivers/gpu/host1x/dev.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Tegra host1x driver
+ * SPDX-FileCopyrightText: Copyright (c) 2010-2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  *
- * Copyright (c) 2010-2013, NVIDIA Corporation.
+ * Tegra host1x driver
  */
 
 #include <linux/clk.h>
@@ -47,6 +47,11 @@ void host1x_common_writel(struct host1x *host1x, u32 v, u32 r)
 	writel(v, host1x->common_regs + r);
 }
 
+u32 host1x_common_readl(struct host1x *host1x, u32 r)
+{
+	return readl(host1x->common_regs + r);
+}
+
 void host1x_hypervisor_writel(struct host1x *host1x, u32 v, u32 r)
 {
 	writel(v, host1x->hv_regs + r);
@@ -265,6 +270,23 @@ static const struct host1x_sid_entry tegra234_sid_table[] = {
 	},
 };
 
+static const struct host1x_actmon_entry tegra234_actmon_table[] = {
+	{
+		.classid = HOST1X_CLASS_VIC,
+		.name = "vic",
+		.irq = 3,
+		.offset = 0x10000,
+		.num_modules = 1,
+	},
+	{
+		.classid = HOST1X_CLASS_NVDEC,
+		.name = "nvdec",
+		.irq = 4,
+		.offset = 0x20000,
+		.num_modules = 1,
+	},
+};
+
 static const struct host1x_info host1x08_info = {
 	.nb_channels = 63,
 	.nb_pts = 1024,
@@ -276,8 +298,11 @@ static const struct host1x_info host1x08_info = {
 	.has_wide_gather = true,
 	.has_hypervisor = true,
 	.has_common = true,
+	.has_actmon = true,
 	.num_sid_entries = ARRAY_SIZE(tegra234_sid_table),
 	.sid_table = tegra234_sid_table,
+	.num_actmon_entries = ARRAY_SIZE(tegra234_actmon_table),
+	.actmon_table = tegra234_actmon_table,
 	.streamid_vm_table = { 0x1004, 128 },
 	.classid_vm_table = { 0x1404, 25 },
 	.mmio_vm_table = { 0x1504, 25 },
@@ -535,6 +560,14 @@ static int host1x_probe(struct platform_device *pdev)
 			if (IS_ERR(host->common_regs))
 				return PTR_ERR(host->common_regs);
 		}
+
+		if (host->info->has_actmon) {
+			host->actmon_regs = devm_platform_ioremap_resource_byname(pdev, "actmon");
+			if (IS_ERR(host->actmon_regs)) {
+				dev_warn(&pdev->dev, "failed to get actmon resource\n");
+				host->actmon_regs = NULL;
+			}
+		}
 	} else {
 		host->regs = devm_platform_ioremap_resource(pdev, 0);
 		if (IS_ERR(host->regs))
@@ -566,8 +599,12 @@ static int host1x_probe(struct platform_device *pdev)
 		host->num_syncpt_irqs = 1;
 	}
 
+	host->general_irq = platform_get_irq_byname_optional(pdev, "host1x");
+
 	mutex_init(&host->devices_lock);
 	INIT_LIST_HEAD(&host->devices);
+	mutex_init(&host->actmons_lock);
+	INIT_LIST_HEAD(&host->actmons);
 	INIT_LIST_HEAD(&host->list);
 	host->dev = &pdev->dev;
 
@@ -583,6 +620,12 @@ static int host1x_probe(struct platform_device *pdev)
 			return err;
 	}
 
+	err = host1x_hw_intr_init_host_general(host);
+	if (err) {
+		dev_err(&pdev->dev, "failed to init general interrupt handler: %d\n", err);
+		return err;
+	}
+
 	host->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(host->clk)) {
 		err = PTR_ERR(host->clk);
@@ -593,6 +636,14 @@ static int host1x_probe(struct platform_device *pdev)
 		return err;
 	}
 
+	if (host->info->has_actmon) {
+		host->actmon_clk = devm_clk_get(&pdev->dev, "actmon");
+		if (IS_ERR(host->actmon_clk)) {
+			dev_warn(&pdev->dev, "failed to get actmon clock\n");
+			host->actmon_clk = NULL;
+		}
+	}
+
 	err = host1x_get_resets(host);
 	if (err)
 		return err;
@@ -701,6 +752,7 @@ static int __maybe_unused host1x_runtime_suspend(struct device *dev)
 	struct host1x *host = dev_get_drvdata(dev);
 	int err;
 
+	host1x_hw_intr_disable_general_intrs(host);
 	host1x_channel_stop_all(host);
 	host1x_intr_stop(host);
 	host1x_syncpt_save(host);
@@ -716,6 +768,7 @@ static int __maybe_unused host1x_runtime_suspend(struct device *dev)
 	}
 
 	clk_disable_unprepare(host->clk);
+	clk_disable_unprepare(host->actmon_clk);
 	reset_control_bulk_release(host->nresets, host->resets);
 
 	return 0;
@@ -724,6 +777,7 @@ static int __maybe_unused host1x_runtime_suspend(struct device *dev)
 	host1x_setup_virtualization_tables(host);
 	host1x_syncpt_restore(host);
 	host1x_intr_start(host);
+	host1x_hw_intr_enable_general_intrs(host);
 
 	return err;
 }
@@ -733,6 +787,12 @@ static int __maybe_unused host1x_runtime_resume(struct device *dev)
 	struct host1x *host = dev_get_drvdata(dev);
 	int err;
 
+	err = clk_prepare_enable(host->actmon_clk);
+	if (err) {
+		dev_err(dev, "failed to enable actmon clock: %d\n", err);
+		goto disable_host1x_clk;
+	}
+
 	err = reset_control_bulk_acquire(host->nresets, host->resets);
 	if (err) {
 		dev_err(dev, "failed to acquire reset: %d\n", err);
@@ -748,16 +808,19 @@ static int __maybe_unused host1x_runtime_resume(struct device *dev)
 	err = reset_control_bulk_deassert(host->nresets, host->resets);
 	if (err < 0) {
 		dev_err(dev, "failed to deassert reset: %d\n", err);
-		goto disable_clk;
+		goto disable_actmon_clk;
 	}
 
 	host1x_setup_virtualization_tables(host);
 	host1x_syncpt_restore(host);
 	host1x_intr_start(host);
+	host1x_hw_intr_enable_general_intrs(host);
 
 	return 0;
 
-disable_clk:
+disable_actmon_clk:
+	clk_disable_unprepare(host->actmon_clk);
+disable_host1x_clk:
 	clk_disable_unprepare(host->clk);
 release_reset:
 	reset_control_bulk_release(host->nresets, host->resets);
diff --git a/drivers/gpu/host1x/dev.h b/drivers/gpu/host1x/dev.h
index 925a118db23f5..ec2de1dd185a0 100644
--- a/drivers/gpu/host1x/dev.h
+++ b/drivers/gpu/host1x/dev.h
@@ -1,12 +1,12 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2012-2015, NVIDIA Corporation.
+/* SPDX-License-Identifier: GPL-2.0-only
+ * SPDX-FileCopyrightText: Copyright (c) 20012-2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  */
 
 #ifndef HOST1X_DEV_H
 #define HOST1X_DEV_H
 
 #include <linux/device.h>
+#include <linux/errno.h>
 #include <linux/iommu.h>
 #include <linux/iova.h>
 #include <linux/platform_device.h>
@@ -73,6 +73,12 @@ struct host1x_syncpt_ops {
 	void (*enable_protection)(struct host1x *host);
 };
 
+struct host1x_intr_general_ops {
+	int (*init_host_general)(struct host1x *host);
+	void (*enable_general_intrs)(struct host1x *host);
+	void (*disable_general_intrs)(struct host1x *host);
+};
+
 struct host1x_intr_ops {
 	int (*init_host_sync)(struct host1x *host, u32 cpm);
 	void (*set_syncpt_threshold)(
@@ -83,6 +89,14 @@ struct host1x_intr_ops {
 	int (*free_syncpt_irq)(struct host1x *host);
 };
 
+struct host1x_actmon_entry {
+	int classid;
+	const char *name;
+	unsigned int irq;
+	unsigned int offset;
+	unsigned int num_modules;
+};
+
 struct host1x_sid_entry {
 	unsigned int base;
 	unsigned int offset;
@@ -105,8 +119,11 @@ struct host1x_info {
 	bool has_wide_gather; /* supports GATHER_W opcode */
 	bool has_hypervisor; /* has hypervisor registers */
 	bool has_common; /* has common registers separate from hypervisor */
+	bool has_actmon; /* has actmon registers separate from hypervisor */
 	unsigned int num_sid_entries;
+	unsigned int num_actmon_entries;
 	const struct host1x_sid_entry *sid_table;
+	const struct host1x_actmon_entry *actmon_table;
 	struct host1x_table_desc streamid_vm_table;
 	struct host1x_table_desc classid_vm_table;
 	struct host1x_table_desc mmio_vm_table;
@@ -130,12 +147,15 @@ struct host1x {
 	void __iomem *regs;
 	void __iomem *hv_regs; /* hypervisor region */
 	void __iomem *common_regs;
+	void __iomem *actmon_regs;
 	int syncpt_irqs[8];
 	int num_syncpt_irqs;
+	int general_irq;
 	struct host1x_syncpt *syncpt;
 	struct host1x_syncpt_base *bases;
 	struct device *dev;
 	struct clk *clk;
+	struct clk *actmon_clk;
 	struct reset_control_bulk_data resets[2];
 	unsigned int nresets;
 
@@ -147,6 +167,7 @@ struct host1x {
 	struct mutex intr_mutex;
 
 	const struct host1x_syncpt_ops *syncpt_op;
+	const struct host1x_intr_general_ops *intr_general_op;
 	const struct host1x_intr_ops *intr_op;
 	const struct host1x_channel_ops *channel_op;
 	const struct host1x_cdma_ops *cdma_op;
@@ -161,10 +182,15 @@ struct host1x {
 	struct host1x_memory_context_list context_list;
 
 	struct dentry *debugfs;
+	struct dentry *actmon_debugfs;
 
 	struct mutex devices_lock;
 	struct list_head devices;
 
+	/* Ensure atomic update against the list of registered actmons */
+	struct mutex actmons_lock;
+	struct list_head actmons;
+
 	struct list_head list;
 
 	struct device_dma_parameters dma_parms;
@@ -173,6 +199,7 @@ struct host1x {
 };
 
 void host1x_common_writel(struct host1x *host1x, u32 v, u32 r);
+u32 host1x_common_readl(struct host1x *host1x, u32 r);
 void host1x_hypervisor_writel(struct host1x *host1x, u32 r, u32 v);
 u32 host1x_hypervisor_readl(struct host1x *host1x, u32 r);
 void host1x_sync_writel(struct host1x *host1x, u32 r, u32 v);
@@ -222,6 +249,30 @@ static inline void host1x_hw_syncpt_enable_protection(struct host1x *host)
 	return host->syncpt_op->enable_protection(host);
 }
 
+static inline int host1x_hw_intr_init_host_general(struct host1x *host)
+{
+	if (!host->intr_general_op)
+		return 0;
+
+	return host->intr_general_op->init_host_general(host);
+}
+
+static inline void host1x_hw_intr_enable_general_intrs(struct host1x *host)
+{
+	if (!host->intr_general_op)
+		return;
+
+	host->intr_general_op->enable_general_intrs(host);
+}
+
+static inline void host1x_hw_intr_disable_general_intrs(struct host1x *host)
+{
+	if (!host->intr_general_op)
+		return;
+
+	host->intr_general_op->disable_general_intrs(host);
+}
+
 static inline int host1x_hw_intr_init_host_sync(struct host1x *host, u32 cpm)
 {
 	return host->intr_op->init_host_sync(host, cpm);
diff --git a/drivers/gpu/host1x/hw/actmon.h b/drivers/gpu/host1x/hw/actmon.h
new file mode 100644
index 0000000000000..01659829d51ac
--- /dev/null
+++ b/drivers/gpu/host1x/hw/actmon.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-only
+ * SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Tegra host1x Actmon Register Offsets
+ */
+
+#ifndef __HOST1X_ACTMON_HARDWARE_H
+#define __HOST1X_ACTMON_HARDWARE_H
+
+#define HOST1X_ACTMON_MODULE_OFFSET				0x80
+
+#define HOST1X_ACTMON_CTRL_REG					0x0
+#define HOST1X_ACTMON_INTR_ENB_REG				0x4
+#define HOST1X_ACTMON_INTR_STATUS_REG				0x8
+#define HOST1X_ACTMON_MODULE_INIT_AVG_REG			0x14
+#define HOST1X_ACTMON_MODULE_CTRL_REG				0x80
+#define HOST1X_ACTMON_MODULE_INTR_ENB_REG			0x84
+#define HOST1X_ACTMON_MODULE_INTR_STATUS_REG			0x88
+#define HOST1X_ACTMON_MODULE_UPPER_WMARK_REG			0x8c
+#define HOST1X_ACTMON_MODULE_LOWER_WMARK_REG			0x90
+#define HOST1X_ACTMON_MODULE_AVG_UPPER_WMARK_REG		0x94
+#define HOST1X_ACTMON_MODULE_AVG_LOWER_WMARK_REG		0x98
+#define HOST1X_ACTMON_MODULE_AVG_COUNT_REG			0xa4
+#define HOST1X_ACTMON_MODULE_COUNT_WEIGHT_REG			0xa8
+
+#define HOST1X_ACTMON_CTRL_SOURCE(v)				(((v) & 0x3) << 8)
+#define HOST1X_ACTMON_CTRL_SAMPLE_TICK(v)			(((v) & 0x1) << 10)
+#define HOST1X_ACTMON_CTRL_SAMPLE_PERIOD(v)			(((v) & 0xff) << 0)
+#define HOST1X_ACTMON_MODULE_CTRL_ACTMON_ENB(v)			(((v) & 0x1) << 31)
+#define HOST1X_ACTMON_MODULE_CTRL_CONSEC_UPPER_NUM(v)		(((v) & 0x7) << 26)
+#define HOST1X_ACTMON_MODULE_CTRL_CONSEC_LOWER_NUM(v)		(((v) & 0x7) << 21)
+#define HOST1X_ACTMON_MODULE_CTRL_ENB_PERIODIC(v)		(((v) & 0x1) << 13)
+#define HOST1X_ACTMON_MODULE_CTRL_K_VAL(v)			(((v) & 0x7) << 10)
+#define HOST1X_ACTMON_MODULE_INTR_CONSEC_WMARK_ABOVE_ENB(v)	(((v) & 0x1) << 31)
+#define HOST1X_ACTMON_MODULE_INTR_CONSEC_WMARK_BELOW_ENB(v)	(((v) & 0x1) << 30)
+#define HOST1X_ACTMON_MODULE_INTR_AVG_WMARK_ABOVE_ENB(v)	(((v) & 0x1) << 29)
+#define HOST1X_ACTMON_MODULE_INTR_AVG_WMARK_BELOW_ENB(v)	(((v) & 0x1) << 28)
+
+#define HOST1X_ACTMON_CTRL_SAMPLE_PERIOD_MASK			0xff
+#define HOST1X_ACTMON_MODULE_CTRL_CONSEC_UPPER_NUM_MASK		(0x7 << 26)
+#define HOST1X_ACTMON_MODULE_CTRL_CONSEC_LOWER_NUM_MASK		(0x7 << 21)
+#define HOST1X_ACTMON_MODULE_CTRL_K_VAL_MASK			(0x7 << 10)
+
+#define HOST1X_ACTMON_MODULE_INTR_CONSEC_WMARK_ABOVE		BIT(31)
+#define HOST1X_ACTMON_MODULE_INTR_CONSEC_WMARK_BELOW		BIT(30)
+#define HOST1X_ACTMON_MODULE_INTR_AVG_WMARK_ABOVE		BIT(29)
+#define HOST1X_ACTMON_MODULE_INTR_AVG_WMARK_BELOW		BIT(28)
+
+#endif
diff --git a/drivers/gpu/host1x/hw/host1x08.c b/drivers/gpu/host1x/hw/host1x08.c
index 754890c34c740..a32b263bcbc75 100644
--- a/drivers/gpu/host1x/hw/host1x08.c
+++ b/drivers/gpu/host1x/hw/host1x08.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Host1x init for Tegra234 SoCs
+ * SPDX-FileCopyrightText: Copyright (c) 2022-2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  *
- * Copyright (c) 2022 NVIDIA Corporation.
+ * Host1x init for Tegra234 SoCs
  */
 
 /* include hw specification */
@@ -15,6 +15,7 @@
 #include "cdma_hw.c"
 #include "channel_hw.c"
 #include "debug_hw.c"
+#include "intr_general_hw.c"
 #include "intr_hw.c"
 #include "syncpt_hw.c"
 
@@ -26,6 +27,7 @@ int host1x08_init(struct host1x *host)
 	host->cdma_op = &host1x_cdma_ops;
 	host->cdma_pb_op = &host1x_pushbuffer_ops;
 	host->syncpt_op = &host1x_syncpt_ops;
+	host->intr_general_op = &host1x_intr_general_ops;
 	host->intr_op = &host1x_intr_ops;
 	host->debug_op = &host1x_debug_ops;
 
diff --git a/drivers/gpu/host1x/hw/hw_host1x08_common.h b/drivers/gpu/host1x/hw/hw_host1x08_common.h
index 8e0c99150ec2c..b6c210f357428 100644
--- a/drivers/gpu/host1x/hw/hw_host1x08_common.h
+++ b/drivers/gpu/host1x/hw/hw_host1x08_common.h
@@ -1,6 +1,5 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2022 NVIDIA Corporation.
+/* SPDX-License-Identifier: GPL-2.0-only
+ * SPDX-FileCopyrightText: Copyright (c) 2022-2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  */
 
 #define HOST1X_COMMON_OFA_MLOCK			0x4050
@@ -9,3 +8,14 @@
 #define HOST1X_COMMON_NVENC_MLOCK		0x407c
 #define HOST1X_COMMON_NVDEC_MLOCK		0x4080
 #define HOST1X_COMMON_NVJPG_MLOCK		0x4084
+
+#define HOST1X_COMMON_INTR_CPU0_MASK		0x4
+#define HOST1X_COMMON_THOST_INTRSTATUS		0x1c
+#define HOST1X_COMMON_THOST_INTRMASK		0x30
+#define HOST1X_COMMON_THOST_GLOBAL_INTRMASK	0x44
+
+#define HOST1X_COMMON_THOST_INTRMASK_VIC_ACTMON(v)		((v) << 3)
+#define HOST1X_COMMON_THOST_INTRMASK_NVDEC_ACTMON(v)		((v) << 4)
+
+#define HOST1X_COMMON_THOST_INTRSTATUS_VIC_ACTMON_INTR		BIT(3)
+#define HOST1X_COMMON_THOST_INTRSTATUS_NVDEC_ACTMON_INTR	BIT(4)
diff --git a/drivers/gpu/host1x/hw/intr_general_hw.c b/drivers/gpu/host1x/hw/intr_general_hw.c
new file mode 100644
index 0000000000000..ef5064384f77f
--- /dev/null
+++ b/drivers/gpu/host1x/hw/intr_general_hw.c
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SPDX-FileCopyrightText: Copyright (c) 2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+ *
+ * Tegra host1x General Interrupt Management
+ */
+
+#include <linux/interrupt.h>
+
+#include "../actmon.h"
+#include "../dev.h"
+
+static irqreturn_t host1x_general_isr(int irq, void *dev_id)
+{
+	struct host1x *host = dev_id;
+	unsigned long status;
+
+	status = host1x_common_readl(host, HOST1X_COMMON_THOST_INTRSTATUS);
+
+	if (status & HOST1X_COMMON_THOST_INTRSTATUS_VIC_ACTMON_INTR)
+		host1x_actmon_handle_interrupt(host, HOST1X_CLASS_VIC);
+
+	if (status & HOST1X_COMMON_THOST_INTRSTATUS_NVDEC_ACTMON_INTR)
+		host1x_actmon_handle_interrupt(host, HOST1X_CLASS_NVDEC);
+
+	host1x_common_writel(host, status, HOST1X_COMMON_THOST_INTRSTATUS);
+
+	return IRQ_HANDLED;
+}
+
+static int host1x_intr_init_host_general(struct host1x *host)
+{
+	int err;
+
+	if (host->general_irq <= 0 && !host->common_regs)
+		return 0;
+
+	host1x_hw_intr_disable_general_intrs(host);
+
+	err = devm_request_threaded_irq(host->dev,
+					host->general_irq,
+					NULL, host1x_general_isr,
+					IRQF_ONESHOT, "host1x_general",
+					host);
+	if (err < 0) {
+		devm_free_irq(host->dev, host->general_irq, host);
+		return err;
+	}
+
+	return 0;
+}
+
+static void host1x_intr_enable_general_intrs(struct host1x *host)
+{
+	if (host->general_irq <= 0 || !host->common_regs)
+		return;
+
+	/* Assign CCPLEX for host1x general interrupts */
+	host1x_common_writel(host, 0x1, HOST1X_COMMON_INTR_CPU0_MASK);
+
+	/* Allow host1x general interrupts go to CCPLEX only */
+	host1x_common_writel(host, 0x1, HOST1X_COMMON_THOST_GLOBAL_INTRMASK);
+
+	/* Enable host1x general interrupts */
+	host1x_common_writel(host,
+			     HOST1X_COMMON_THOST_INTRMASK_VIC_ACTMON(1) |
+			     HOST1X_COMMON_THOST_INTRMASK_NVDEC_ACTMON(1),
+			     HOST1X_COMMON_THOST_INTRMASK);
+}
+
+static void host1x_intr_disable_general_intrs(struct host1x *host)
+{
+	if (host->general_irq <= 0 || !host->common_regs)
+		return;
+
+	host1x_common_writel(host, 0x0, HOST1X_COMMON_THOST_INTRMASK);
+}
+
+static const struct host1x_intr_general_ops host1x_intr_general_ops = {
+	.init_host_general = host1x_intr_init_host_general,
+	.enable_general_intrs = host1x_intr_enable_general_intrs,
+	.disable_general_intrs = host1x_intr_disable_general_intrs,
+};
diff --git a/include/linux/host1x.h b/include/linux/host1x.h
index 9c8119ed13a4b..903f1a41b218f 100644
--- a/include/linux/host1x.h
+++ b/include/linux/host1x.h
@@ -1,6 +1,5 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Copyright (c) 2009-2013, NVIDIA Corporation. All rights reserved.
+/* SPDX-License-Identifier: GPL-2.0-only
+ * SPDX-FileCopyrightText: Copyright (c) 2009-2024 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
  */
 
 #ifndef __LINUX_HOST1X_H
@@ -22,6 +21,13 @@ enum host1x_class {
 	HOST1X_CLASS_NVDEC1 = 0xF5,
 };
 
+enum host1x_actmon_wmark_event {
+	HOST1X_ACTMON_AVG_WMARK_BELOW,
+	HOST1X_ACTMON_AVG_WMARK_ABOVE,
+	HOST1X_ACTMON_CONSEC_WMARK_BELOW,
+	HOST1X_ACTMON_CONSEC_WMARK_ABOVE,
+};
+
 struct host1x;
 struct host1x_client;
 struct iommu_group;
@@ -63,6 +69,8 @@ static inline void host1x_bo_cache_destroy(struct host1x_bo_cache *cache)
  * @late_exit: host1x client late tear down code
  * @suspend: host1x client suspend code
  * @resume: host1x client resume code
+ * @get_rate: host1x client get clock rate code
+ * @actmon_event: host1x client actmon event handling code in threaded interrupt context
  */
 struct host1x_client_ops {
 	int (*early_init)(struct host1x_client *client);
@@ -71,8 +79,13 @@ struct host1x_client_ops {
 	int (*late_exit)(struct host1x_client *client);
 	int (*suspend)(struct host1x_client *client);
 	int (*resume)(struct host1x_client *client);
+	unsigned long (*get_rate)(struct host1x_client *client);
+	void (*actmon_event)(struct host1x_client *client,
+			     enum host1x_actmon_wmark_event event);
 };
 
+struct host1x_actmon;
+
 /**
  * struct host1x_client - host1x client structure
  * @list: list node for the host1x client
@@ -88,6 +101,7 @@ struct host1x_client_ops {
  * @usecount: reference count for this structure
  * @lock: mutex for mutually exclusive concurrency
  * @cache: host1x buffer object cache
+ * @actmon: unit actmon for this host1x client
  */
 struct host1x_client {
 	struct list_head list;
@@ -108,6 +122,8 @@ struct host1x_client {
 	struct mutex lock;
 
 	struct host1x_bo_cache cache;
+
+	struct host1x_actmon *actmon;
 };
 
 /*
@@ -494,4 +510,12 @@ static inline void host1x_memory_context_put(struct host1x_memory_context *cd)
 }
 #endif
 
+int host1x_actmon_register(struct host1x_client *client);
+void host1x_actmon_unregister(struct host1x_client *client);
+void host1x_actmon_enable(struct host1x_client *client);
+void host1x_actmon_disable(struct host1x_client *client);
+void host1x_actmon_update_client_rate(struct host1x_client *client,
+				      unsigned long rate,
+				      u32 *weight);
+
 #endif
-- 
2.34.1

