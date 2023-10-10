Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8F97BFC49
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:00:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEAEC10E358;
	Tue, 10 Oct 2023 13:00:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2071.outbound.protection.outlook.com [40.107.237.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6980610E358;
 Tue, 10 Oct 2023 13:00:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eSKIkKawqJt/zoLeYpR/OdedkHRT/QtS7zJaObJkVorq9IMXX1lqYiKEEX6PmikvkF+juwmij2xsVeevwHd68U6cSXCbAPzMT3Ku4ZEZOJN2cQCeybgyVbYkcp37evb0JjjpWOvjxMetie4Mp+lFsGqCIdMJZnArLqklpcXs+qE4XzzP4hNL4FrZpE4EIEy23AepPz+K40cqCSqV4dbe35/k37rURVwNJpNUA51LGZ2eaDDj8qxDsce+fdN7dE3+Zi2u/IE65Y2QTEQU0cJkeO+gxB7eYq47IQGpSFF8I0lt4L72zdLzJplu8SK48f0nG0nl+sh5Pgx5K4srvO4VEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wUSN3kXlBOcBub8x0NfhUEozjoD0nofEA5vWH8Mvis=;
 b=SZhvae5lIWJaRp2d9+REMkezvf0n20gsOTtSHg12I+DGiW4p2/NuUsq2KA50G6KfxU+xChSxdLsTwgFD1svIV6ObiihlrCQRsht/j1/e50DUUEvAECFJYU4dT7jgqRUy4eFXFZfZEJAPFUlYG3iBmRrbb+YyhOK/5ZObdHK93bwqF5g6xl9UC8IIbbknk6xsxEGtEyji99G96BzjZCdLvvDr0Xgs3vnTn86+RY22+ocuiJhn5ML1Uv9uQp2zLnHnnfgjjiUblga83xi/LG+iZcNro2a/MMnmV98/CmtorjJlS3nPPhHGU43OutZ8+r5+fQjHeB8Oda79v5KCpKHnGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wUSN3kXlBOcBub8x0NfhUEozjoD0nofEA5vWH8Mvis=;
 b=tUyHqsXnnDy2U8CKAqv8Su/nTKgQbS9a+IS/LkF1ZaIb253N7e2RzZYRj1KaKhpzFVLLxAQMY6E4c322rX6JZUMSVkUmoVt6BNrvFmHT730ZW1hcVRL8fJ9ZneAWK7WUz1wtPxD0zCf1dtrhnUiMAoXbooz4Zn7OG5CD9G8U94Q=
Received: from DM6PR04CA0013.namprd04.prod.outlook.com (2603:10b6:5:334::18)
 by CY8PR12MB7340.namprd12.prod.outlook.com (2603:10b6:930:50::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.36; Tue, 10 Oct
 2023 13:00:42 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::c) by DM6PR04CA0013.outlook.office365.com
 (2603:10b6:5:334::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30 via Frontend
 Transport; Tue, 10 Oct 2023 13:00:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 13:00:42 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 08:00:37 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v3 10/16] platform/x86/amd/pmf: Add capability to sideload of
 policy binary
Date: Tue, 10 Oct 2023 18:29:11 +0530
Message-ID: <20231010125917.138225-11-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
References: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|CY8PR12MB7340:EE_
X-MS-Office365-Filtering-Correlation-Id: 68c47e7d-2d8f-4644-4fbf-08dbc990e920
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g1W4fwMWLkMErIsGp8OoK0eRcitikXd6lGr3HyZscOfWVyARLl1xRqZ0ZGkZgmbU7LDeCzpqdo1MbDQlx2skvOvAPr88MNsFI67Lt4U5rnd6Ar/Mj4PgmFDBrCwgsvCHbJDM70LsTNaRlkkGK+6fd+JeInWyuQjob6m6b12dN+QI9p6/asdwlS7k/Satbxq1nZfq5obuQ3NETaPfxptC0ZcOP6fCLIb+c9y/nZJS+WJoEnvuO9BxdeA3foZQv4VvU55zMsEEYFZ8EwZugqAyL2wwWRqkTUHbMtU9NuCsGQRKf+lTw/G6pUjZAmG/eNbEtwQdWDdR0tUZd2WSkyY3xBdHLyYL2D2B/GcXFrIC5c1PrNxaO5kqjoE7oNkyPWXwgczZp8YnnscGzHMDoe3R0Iv6tZXMy6t2yIoiUhLB47Ae+UNISIOLFuw5V2TjxIHe2szDuKkeJpKf/Wh8PNAk5o3gT01h3k5NwlVUp0n73HSM6qfN9uqshX+0PLIvea1HoXBzH/nJhLICBacwh3m/8y0iJcqcOTU7WgBcmX1Se2MoyH+ovioOSKzx0pfejBeFoQ4k1K7xYQUtj+LXouRgIwhuYmE7ATPyp2k7brlAwx+jxPh+gjFs3R9cF3Cr9JRdDXIl+PTO496SYnGOv4MohrahXo5Ia2+GoOYV8Hr5Es0sBm2m/zoMWN6m0pLZ1ig08x/3ratlzNV1en7CQxElqkAqgZDXsL9fQZdkr027lKWSQRG3gk/Wb/7Xqz/n5LAx+FAKhu48GzwsXD1g7c3gKp5bIatiMshoIafLKo0FQTM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(396003)(136003)(376002)(39860400002)(230922051799003)(82310400011)(186009)(64100799003)(1800799009)(451199024)(36840700001)(46966006)(40470700004)(1076003)(26005)(426003)(336012)(2616005)(16526019)(6666004)(8676002)(47076005)(7696005)(36860700001)(7416002)(2906002)(478600001)(4326008)(54906003)(70206006)(70586007)(8936002)(5660300002)(110136005)(316002)(41300700001)(81166007)(40460700003)(921005)(356005)(86362001)(36756003)(40480700001)(82740400003)(83380400001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:00:42.5802 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 68c47e7d-2d8f-4644-4fbf-08dbc990e920
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7340
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
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Patil.Reddy@amd.com, linux-input@vger.kernel.org, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A policy binary is OS agnostic, and the same policies are expected to work
across the OSes.  At times it becomes difficult to debug when the policies
inside the policy binaries starts to misbehave. Add a way to sideload such
policies independently to debug them via a debugfs entry.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    |  1 +
 drivers/platform/x86/amd/pmf/tee-if.c | 67 +++++++++++++++++++++++++++
 2 files changed, 68 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 3d98d9bea96b..9b84121344f4 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -219,6 +219,7 @@ struct amd_pmf_dev {
 	bool cnqf_supported;
 	struct notifier_block pwr_src_notifier;
 	/* Smart PC solution builder */
+	struct dentry *esbin;
 	unsigned char *policy_buf;
 	u32 policy_sz;
 	struct tee_context *tee_ctx;
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 80252309575b..994daf945795 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -8,6 +8,7 @@
  * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  */
 
+#include <linux/debugfs.h>
 #include <linux/tee_drv.h>
 #include <linux/uuid.h>
 #include "pmf.h"
@@ -16,9 +17,14 @@
 
 /* Policy binary actions sampling frequency (in ms) */
 static int pb_actions_ms = MSEC_PER_SEC;
+/* Sideload policy binaries to debug policy failures */
+static bool pb_side_load;
+
 #ifdef CONFIG_AMD_PMF_DEBUG
 module_param(pb_actions_ms, int, 0644);
 MODULE_PARM_DESC(pb_actions_ms, "Policy binary actions sampling frequency (default = 1000ms)");
+module_param(pb_side_load, bool, 0444);
+MODULE_PARM_DESC(pb_side_load, "Sideload policy binaries debug policy failures");
 #endif
 
 static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
@@ -268,6 +274,61 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
 	return 0;
 }
 
+#ifdef CONFIG_AMD_PMF_DEBUG
+static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
+				   size_t length, loff_t *pos)
+{
+	struct amd_pmf_dev *dev = filp->private_data;
+	int ret;
+
+	/* policy binary size cannot exceed POLICY_BUF_MAX_SZ */
+	if (length > POLICY_BUF_MAX_SZ || length == 0)
+		return -EINVAL;
+
+	dev->policy_sz = length;
+	if (copy_from_user(dev->policy_buf, buf, dev->policy_sz))
+		return -EFAULT;
+
+	ret = amd_pmf_start_policy_engine(dev);
+	if (ret)
+		return -EINVAL;
+
+	return length;
+}
+
+static const struct file_operations pb_fops = {
+	.write = amd_pmf_get_pb_data,
+	.open = simple_open,
+};
+
+static int amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root)
+{
+	struct dentry *file = NULL;
+
+	dev->esbin = debugfs_create_dir("pb", debugfs_root);
+	if (IS_ERR(dev->esbin))
+		return -EINVAL;
+
+	file = debugfs_create_file("update_policy", 0644, dev->esbin, dev, &pb_fops);
+	if (!file)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void amd_pmf_remove_pb(struct amd_pmf_dev *dev)
+{
+	debugfs_remove_recursive(dev->esbin);
+}
+#else
+static int amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root)
+{
+	return 0;
+}
+
+static void amd_pmf_remove_pb(struct amd_pmf_dev *dev) {}
+#endif
+
 static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
 {
 	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
@@ -280,6 +341,9 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
 
 	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
 
+	if (pb_side_load)
+		amd_pmf_open_pb(dev, dev->dbgfs_dir);
+
 	return amd_pmf_start_policy_engine(dev);
 }
 
@@ -381,6 +445,9 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 
 void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
 {
+	if (pb_side_load)
+		amd_pmf_remove_pb(dev);
+
 	kfree(dev->prev_data);
 	kfree(dev->policy_buf);
 	cancel_delayed_work_sync(&dev->pb_work);
-- 
2.25.1

