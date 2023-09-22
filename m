Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5269F7AB84D
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D4F10E6E4;
	Fri, 22 Sep 2023 17:52:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2050.outbound.protection.outlook.com [40.107.243.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2C710E6E0;
 Fri, 22 Sep 2023 17:52:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DG37GrYZK0U18zigtfB4cwjBNPKVFhADKSw1QnN0wdvZFD2r8gNSA2G+8mgl0ShZrK14mWlZ5PFZKoC/aUnw3MA9qV7VmT1CYEudathLJjMEtZb2KhKmibrHH/ULcWn4EvVFYzAf3xCOoLsnzDMafoH27AJOMNMhEawP9tPg/FE4+oHZVuIAEDJdVhPpgop8zIowbQ9R9DyQzXyyF4+5Rt3foF1ykPaFIodFRyU1GXQ/U+mkHiiExlcIyH9bHbHPCL5VTB2ajikccvEVqIjNocUaRUPSbwKRv0rEhhdDR3NS+V0NX/XPCUT75Cd9M4c1FDDanl+RekzBw59EhfCgZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MWMU1BMJvqDyeO5obDmNUMw7Jb9+R5M/XfXzTvQ/pGM=;
 b=jXQdhvUVe5Oz3lE1OCS+01k1n1Y6Ec8stpdzt98ZEeysu2dsVgq/zZ73tH4QytlF26HrmtoyjmtCKwCh2Lvt8JAXQQ2wjX/RBfS9/qoFL0P3Ytl1IdF9MZTjt7OYZTM+GdWI8ujD6duozsaJwx1/qH8p+CSzOVhpJyoSwt3HzpJqO1QHiCnExkOEtIrlqEQp6vDL+gT6cLBWwFLo6JFTAsxBsYO854+FJx9FNWZSwSXCfcGD7v8sIstZib+XL8nX5yiAN34WNYzf/3dM6H19ZLjk0edfroL4Pii6fx7lLKdZH52HCNyXQ77h2YrkaasVlmGoMjRP/ZRGfyc2XHbiaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MWMU1BMJvqDyeO5obDmNUMw7Jb9+R5M/XfXzTvQ/pGM=;
 b=URvAZBRs7Qqz37Q3M23KKsHvNwY7XYb40mV36sd4bKf3Skwq6k08Jh1IwBJwqJAldDcznu/BoDHm4bHcxQl5HYtOMULwglcHmduygy2rpzkRMqh59b4WCYAVefdzYZwguvublaXM6DVeM8OYgJ/mXPwHUS3cGk6mvxacl0SL9lI=
Received: from MN2PR11CA0030.namprd11.prod.outlook.com (2603:10b6:208:23b::35)
 by MN2PR12MB4254.namprd12.prod.outlook.com (2603:10b6:208:1d0::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.21; Fri, 22 Sep
 2023 17:52:31 +0000
Received: from BL02EPF0001A102.namprd05.prod.outlook.com
 (2603:10b6:208:23b:cafe::9a) by MN2PR11CA0030.outlook.office365.com
 (2603:10b6:208:23b::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.32 via Frontend
 Transport; Fri, 22 Sep 2023 17:52:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL02EPF0001A102.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Fri, 22 Sep 2023 17:52:31 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Sep
 2023 12:52:26 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <basavaraj.natikar@amd.com>, <jikos@kernel.org>,
 <benjamin.tissoires@redhat.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH 10/15] platform/x86/amd/pmf: Add capability to sideload of
 policy binary
Date: Fri, 22 Sep 2023 23:20:51 +0530
Message-ID: <20230922175056.244940-11-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A102:EE_|MN2PR12MB4254:EE_
X-MS-Office365-Filtering-Correlation-Id: cf184bc4-4176-4a1b-df9a-08dbbb94b1c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hukeWvQAUFJjQ1AM2lRC93qgkp8Jhocir4m92NS9Ia1w5fhlb7rFoAZ4e8DOvIT1RMalWFTt56/u6y1XLr2xg0+dQNoOf6Af8dzFftrqOO5HChHrrclqTzCiiSxRPsToomnVzHNE7TOziyemgddoxNTV2SkEc4ULfR9Nwrp1WIIuurPGQ1LvO4aZbQtr2EVBXEZsdKxMK++G0usuR+va+/jCPPxMKN+xzCHVkHdOguF2IFuEUD5fK8oI1WsDE5qU3i/Ki5KnAQugx2CsU/IAjTq/97fsjIa5gQafsEWNLrJ1v1ESl1s2dytilwZLemIINBP7urRgjKhcceywqMaLjGh7xsw1GDat4GdlQypBvuB145iZj76vSOJVKgdKswCyXqle4haPnSWZi19WnS9+IiIl795ND4z5GpFnij0knfkPyxO4MOuIEJR2IXEUD4VUMZdjtkQE9yYJVgNmNAjiiL46Bv73kHSQURnOEmJg/IX6BjJbCB534rvq1FHNQsEbj4WDy3EPxGhZX52qjoW2o3NnW2iz51hPdgG9+IfkjsWNfcvmzJ5ceg5DT35il0Au0prfEUSan7fuCiPAf0sEeo5E8BagvP00/bbBBt7iwfcVqcQPNEg5rt/B+hJy/8NVZSlpSg1PqhK1Blgq1LzCUzbL7RCpOqc9mgt9sbrZPMTb50zYHupII42o95Zu1HueFR96VNz8gH1HAxxJkHZm3S2NcdQlqopVNfHxqb30XE0K9p9PjOfis5q3vpakD0O9EFtI/nnFSUrLToJ59wmXuzAGHZX48nUplrWyCLsu8EjdsWgLIeZ9TSeweS/Ehkr3cMY2klsXlNMSmFLXJN7nLQ==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199024)(82310400011)(1800799009)(230921699003)(186009)(46966006)(36840700001)(40470700004)(7696005)(40460700003)(83380400001)(6666004)(356005)(921005)(82740400003)(81166007)(86362001)(2616005)(47076005)(36756003)(1076003)(426003)(336012)(36860700001)(7416002)(16526019)(40480700001)(26005)(41300700001)(70586007)(316002)(70206006)(54906003)(5660300002)(110136005)(2906002)(4326008)(8676002)(8936002)(478600001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:52:31.4717 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf184bc4-4176-4a1b-df9a-08dbbb94b1c8
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0001A102.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4254
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
 drivers/platform/x86/amd/pmf/tee-if.c | 60 +++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 61a0f3225b62..780c442239e3 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -215,6 +215,7 @@ struct amd_pmf_dev {
 	bool cnqf_supported;
 	struct notifier_block pwr_src_notifier;
 	/* Smart PC solution builder */
+	struct dentry *esbin;
 	unsigned char *policy_buf;
 	u32 policy_sz;
 	struct tee_context *tee_ctx;
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 4844782d93c7..fa37cfab2dc7 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -8,6 +8,7 @@
  * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
  */
 
+#include <linux/debugfs.h>
 #include <linux/tee_drv.h>
 #include <linux/uuid.h>
 #include "pmf.h"
@@ -21,6 +22,13 @@ module_param(pb_actions_ms, int, 0644);
 MODULE_PARM_DESC(pb_actions_ms, "Policy binary actions sampling frequency (default = 1000ms)");
 #endif
 
+#ifdef CONFIG_AMD_PMF_DEBUG
+/* Sideload policy binaries to debug policy failures */
+static bool pb_side_load;
+module_param(pb_side_load, bool, 0444);
+MODULE_PARM_DESC(pb_side_load, "Sideload policy binaries debug policy failures");
+#endif
+
 static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
 						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
 
@@ -267,6 +275,49 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
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
+int amd_pmf_open_pb(struct amd_pmf_dev *dev, struct dentry *debugfs_root)
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
+#endif
+
 static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
 {
 	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
@@ -279,6 +330,11 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
 
 	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
 
+#ifdef CONFIG_AMD_PMF_DEBUG
+	if (pb_side_load)
+		amd_pmf_open_pb(dev, dev->dbgfs_dir);
+#endif
+
 	return amd_pmf_start_policy_engine(dev);
 }
 
@@ -381,6 +437,10 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 
 void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
 {
+#ifdef CONFIG_AMD_PMF_DEBUG
+	if (pb_side_load)
+		debugfs_remove_recursive(dev->esbin);
+#endif
 	kfree(dev->prev_data);
 	kfree(dev->policy_buf);
 	cancel_delayed_work_sync(&dev->pb_work);
-- 
2.25.1

