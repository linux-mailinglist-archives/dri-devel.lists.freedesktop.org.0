Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78A237B3F65
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 10:39:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3B8010E1E0;
	Sat, 30 Sep 2023 08:39:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eaa::61c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBF6A10E1D3;
 Sat, 30 Sep 2023 08:39:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UBRUUhjcMDGCjMIpQnAo6wLEvwrG+El3vqUzq28Cbt/ocFcwuQ/18gorWV+wq4TQqgBszeJumsgrQ65uPzvazIqmTcv/KdNvla4Njg6R0uZQDBjcVssmJR1xUV4k4oFngvR1eRhTwPI3TnL/JSx7JXdsjJIy4lvBflWm/xQqzyVtFqKkXy/lV0XxuMthcox8/ZAFsvGsxSnJxSJzPs3JWE9LCKQd27JeT9LynrNR3lC04YXzfRcIwYEmWmug3jd7RqKCnDrjEN4nCMLxom3G7ieWFfZlyXeBNv/AnRg/E6pvXauPShYOtrp9ON3S+7FhVx3RC8bN3huYK4Kwfq+p8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N+1mYP+/igZfYYYmEUJOKYCosvS8yyrS33+ej8kqP84=;
 b=XWKUV1LeC+O3Bms3GKy9FGE4CFs7SYdEw1UO8S9m+BM3+w/a6/o/UXvy5tl2/NvNgaNvV5vyAkd0AOgDX2gUULLHsVwJbOZSoBmcTM45IRJXKc/eJWwOJ2t8303nQVuKt3Yippjt2iZqGo3gCORAiaJGoAi4EnlU0LgfZBqNEDTYkYO/XUJe/3yQgumL+vAkEFvgqw7KFSborEsbDaxC9wqiE6Pi6jZvMlYV+/ObVOxjyTvTdYtnB9jzOsJikYJe2v5nI7n3VmSrsVQ2h1c7ZNE4bbT4iYfaovCiu+/i90Jy7ovbzZZtWqopqscpVhwF6zG1EK+b3BrlydXZEprxQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N+1mYP+/igZfYYYmEUJOKYCosvS8yyrS33+ej8kqP84=;
 b=DiP72jxGEnzTVpGCFfzRP0nibTzF3PgINcp+4CLKvskhQEKt77plLvSvwBPuUs/cYxTL8KqAoeVKFw8Nv8FSmXb94D3uksXQICkPnkREtSf60Sm7/GzBdOn+o6nnefEEs5oKnftpTGSui1RKw+5vRiIloB1nwYFE3IsrJSv1CIE=
Received: from MN2PR07CA0014.namprd07.prod.outlook.com (2603:10b6:208:1a0::24)
 by SA1PR12MB7037.namprd12.prod.outlook.com (2603:10b6:806:24c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.25; Sat, 30 Sep
 2023 08:39:17 +0000
Received: from BL6PEPF0001AB71.namprd02.prod.outlook.com
 (2603:10b6:208:1a0:cafe::74) by MN2PR07CA0014.outlook.office365.com
 (2603:10b6:208:1a0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26 via Frontend
 Transport; Sat, 30 Sep 2023 08:39:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB71.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sat, 30 Sep 2023 08:39:17 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 30 Sep
 2023 03:39:09 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v2 10/16] platform/x86/amd/pmf: Add capability to sideload of
 policy binary
Date: Sat, 30 Sep 2023 14:07:09 +0530
Message-ID: <20230930083715.2050863-11-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB71:EE_|SA1PR12MB7037:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f793c31-2487-425b-b5d6-08dbc190bbec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2dUOPM4kAMfuRkyZEVG5xV7ghslDGPgNV+ts81hY9tgcKiuk3KMXKO0m4V9/+w54Pc5LCqc2Fi8saY/GvzwWRKMNIVzO42vyVIzJU8uBQvXCASqBwCTg2R0i9vsT+dvDTV9irpBLUDjjseVK3iuKhhKkFylhJ8KP5EE9a7yLXZRjuYU3oRfoV+O4j9YmiVviwBzfkKoop89jvTsE+PMaUGvkTu8Xb+NR+xkUAVl6VlYZS8H0K9y0L6L0f+8urroYjUD+hCsUlRZ6taSCSSXrCznQ2mOhq7EiOxWwcatSAM4X4Jlv4fqPHc2HP1QeCfoVl0csOXN8R6m92lAvFib8EbTIPDH1JgMm8S517vAWoDA/nx/uvcclcJBE0OAGseZFviUL9zy/TQnvwOmRNS4u1ik9+mdSrx8MbSKAJIgGQTR6pPfftB09aLm1Y1Qb9vvxCOZqMigvlz5wvqNlM7TNOcvK/rBXMWAnXo/ji+WVBZaPlewAOFrqpwXCpGGem2zO93NGI5OiK8yiTpN17Q8mMwGivveisvbdimVaPTCS1HuJQu33WSqE2BprON2L1IEce4NWe4lOVHMKy2+squAifHbjcJKp/ypUkoe4B3XLfThjfMt82O6W/EoV7Wif/qTAz2hp5fWXxnzTIWCYMpuZ2MPXVRDpXs/DTwQRyGy8SbLIYED3vXn+/l4+/XOSSeFECnNPWI4z0bglSBQa1XwWwl6C05CBD2bXIxA0+FkhUvqR2kNHcvcPywcKy5piltnjb33+wup9CM2a/Fd6Q3pTSg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(1800799009)(451199024)(82310400011)(186009)(64100799003)(40470700004)(36840700001)(46966006)(2616005)(47076005)(16526019)(426003)(336012)(83380400001)(26005)(1076003)(36860700001)(40460700003)(54906003)(36756003)(82740400003)(40480700001)(356005)(86362001)(921005)(70586007)(110136005)(70206006)(81166007)(316002)(8936002)(41300700001)(5660300002)(4326008)(8676002)(2906002)(7416002)(7696005)(966005)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 08:39:17.4892 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f793c31-2487-425b-b5d6-08dbc190bbec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB71.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7037
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
Cc: Shyam
 Sundar S K <Shyam-sundar.S-k@amd.com>, kernel test robot <lkp@intel.com>,
 amd-gfx@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Patil.Reddy@amd.com,
 linux-input@vger.kernel.org, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A policy binary is OS agnostic, and the same policies are expected to work
across the OSes.  At times it becomes difficult to debug when the policies
inside the policy binaries starts to misbehave. Add a way to sideload such
policies independently to debug them via a debugfs entry.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202309251031.awDDkRgS-lkp@intel.com/
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/pmf.h    |  1 +
 drivers/platform/x86/amd/pmf/tee-if.c | 68 +++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 2ad5ece47601..b862cd4f902e 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -218,6 +218,7 @@ struct amd_pmf_dev {
 	bool cnqf_supported;
 	struct notifier_block pwr_src_notifier;
 	/* Smart PC solution builder */
+	struct dentry *esbin;
 	unsigned char *policy_buf;
 	u32 policy_sz;
 	struct tee_context *tee_ctx;
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index b0711b2f8c8f..01f974b55a6a 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -8,6 +8,7 @@
  * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  */
 
+#include <linux/debugfs.h>
 #include <linux/tee_drv.h>
 #include <linux/uuid.h>
 #include "pmf.h"
@@ -16,9 +17,15 @@
 
 /* Policy binary actions sampling frequency (in ms) */
 static int pb_actions_ms = 1000;
+/* Sideload policy binaries to debug policy failures */
+static bool pb_side_load;
+
 #ifdef CONFIG_AMD_PMF_DEBUG
 module_param(pb_actions_ms, int, 0644);
 MODULE_PARM_DESC(pb_actions_ms, "Policy binary actions sampling frequency (default = 1000ms)");
+
+module_param(pb_side_load, bool, 0444);
+MODULE_PARM_DESC(pb_side_load, "Sideload policy binaries debug policy failures");
 #endif
 
 static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
@@ -268,6 +275,61 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
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
@@ -280,6 +342,9 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
 
 	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
 
+	if (pb_side_load)
+		amd_pmf_open_pb(dev, dev->dbgfs_dir);
+
 	return amd_pmf_start_policy_engine(dev);
 }
 
@@ -388,6 +453,9 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 
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

