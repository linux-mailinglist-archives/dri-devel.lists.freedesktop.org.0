Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3C07CD517
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 09:05:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 828E210E3A2;
	Wed, 18 Oct 2023 07:05:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2067.outbound.protection.outlook.com [40.107.92.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D86AC10E3A1;
 Wed, 18 Oct 2023 07:05:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=loOOipVPsaP6LgBcQKNMcZFb3DTalmFjk8iYwSt6jKjCAvcKTslsKidCsCFJzEiuiS4j+wNLSQCKbpVWyxhMQfQMNIKnjjGF3+rV9avjtDHH7KE2d+DEM8/Cpku07hE8MLtbCWhEUIQwttEbMNwQgo5BpbaWQzU8Z2XGZhpIEJr7DdUkTONSS0ESRRVrMWC0IKS835aY12SP2I8JOxYiFAbz8k/mHvtx76Z22ceuAHXSTQRQqCXIKJVePFwBms6k8fyROhEVWagncrFJDkCcysTe5y9s4K8Y/rbM4ZKQ4mPfNaAimc0j80ZbAJ5189VOu1495Nd6J20AYw9CCdXhYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jleF8nXN/hSBwVBoyUl3lll/FoVl4X+JIAuvh/Peo0c=;
 b=IJkpi5mITP7Cl2VUA9c32K4wy9M9owtnR51FAA0zN33U2XghgCB0g6C+XCXh5xLzZtos1MaleHVVFB1xEfWihNrrwvfoZAfDanXKdmpYkOKYAB4egoBQx4Spv8S+rXX1rBNie9NYLmUH+Llfan1N+syBA9DzEcTsH1/EEEdNOcPCaWs4UrqzegWd8zt99vx3tmXSIPZMzMX+xulnkaOhIqyHIS7z6K3Ritrq40poqExguyS3qLTGBYj7XvPReEGiQ3RLkXxP7oNfX/AR6mOTSBtGhQoagJ+Dy+R6eAvylB0Z7ekcvITL3evADsvnKtYqQzkZbN7Y8o3nrVODeuB+uQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jleF8nXN/hSBwVBoyUl3lll/FoVl4X+JIAuvh/Peo0c=;
 b=Vx4rdsWMMAaFO1RH8P6ylRGh3rQd+fymXvqYj5LGdnOaAoaXo1bXR9KE110RHfNh017uORUcpaFoMTBdUCVdWMwmq2y7wloIc7PAYRc+vOaGN82MMYrS+0ag8EBpsjqaRTlk0LM+H8yUO0tzAHmTZ/rLPMiyr1z2U/MjDtO9uaY=
Received: from DS7PR03CA0285.namprd03.prod.outlook.com (2603:10b6:5:3ad::20)
 by SJ0PR12MB5488.namprd12.prod.outlook.com (2603:10b6:a03:3ad::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.46; Wed, 18 Oct
 2023 07:05:24 +0000
Received: from DS3PEPF000099D4.namprd04.prod.outlook.com
 (2603:10b6:5:3ad:cafe::62) by DS7PR03CA0285.outlook.office365.com
 (2603:10b6:5:3ad::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Wed, 18 Oct 2023 07:05:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS3PEPF000099D4.mail.protection.outlook.com (10.167.17.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Wed, 18 Oct 2023 07:05:24 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 02:05:18 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v4 11/17] platform/x86/amd/pmf: Add capability to sideload of
 policy binary
Date: Wed, 18 Oct 2023 12:32:35 +0530
Message-ID: <20231018070241.2041529-12-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D4:EE_|SJ0PR12MB5488:EE_
X-MS-Office365-Filtering-Correlation-Id: ba069f74-2885-4fc5-9134-08dbcfa899a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0BJMaUvPGkLhFezmwGaY/apCBi2iaOMHWEYMGstvmxjTRu9J2EwyooZbCIXxORFVEP8rk2GhgJwxBbVbsCSklzbYJ1eIWViU+mm/d4Xiyc7sZG6I9z/4Lj5Qd7n1o4XhKAj6Xw7kULrFTekRbiD1a/FG1xJDUSuTeAdjjeXzWdYBhYFWT0ufPvWjOWMlX1phcfT+LsrV0Rd/QQjC6GpzSlrrstdLvwZzMekhON71uPJrcmBRyMxVp+kfa+clGM0N0gupXcZUyfBIalM7RgKB9xee260eQU+41if41P4JotvPE+oTXFza69SS/6ib7LpfawJjVdrk7tFrPujcVXo4dYNT/YFxWiX4xLZ9fqw/RCI0PWkrt+AVGfPvSzUt85S+uM/zt8dqQLiXMelWs42u8WupQic+CfN/PztugVvQ9m0eXWFmB8C20nVPdI1jk2Gc7Z+K+73lP0qW+20TtC+LLdlsSjODu75H3iZyaPhy4PfGRTGP3FHu4ksG9T/95IOxGm7HQj1OtmV/BKZ6TmA1qqdqFRlZ0CRx7Qa+qxVEk2Scyj7JjwqKlAkkPTPmsXJhhD1mCSVFmu6umOChAIpnbZ5r7OThv7TgdLp1T+BfgYK3SlG6t452FrJHprqlw+aujA3U2+c5JkZ/49pnj+z6aPatC39eonA1faMf8xStr20UVocfUn+CA9iNw+2eXodQMKY8Qr5eXjFt2QWN1UPei0oNz+ycbdQ19j5INjsqP4lglRG9dlBOZ3xb4tcr1cjVXxanbbI2YnE4WyyJZP0z9GnIwYuiDOHxx+Yy0kRNfAo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(346002)(376002)(136003)(230922051799003)(451199024)(64100799003)(186009)(1800799009)(82310400011)(36840700001)(46966006)(40470700004)(6666004)(336012)(426003)(40480700001)(1076003)(40460700003)(478600001)(36860700001)(81166007)(36756003)(47076005)(921005)(83380400001)(16526019)(82740400003)(2906002)(70586007)(54906003)(41300700001)(2616005)(70206006)(316002)(356005)(110136005)(8936002)(86362001)(7696005)(7416002)(4326008)(5660300002)(8676002)(26005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 07:05:24.1012 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ba069f74-2885-4fc5-9134-08dbcfa899a0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5488
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
index 593930519039..8712299ad52b 100644
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
index 0eba258f4040..6c4ce22ba518 100644
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
@@ -269,6 +275,61 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
 	return 0;
 }
 
+#ifdef CONFIG_AMD_PMF_DEBUG
+static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
+				   size_t length, loff_t *pos)
+{
+	struct amd_pmf_dev *dev = filp->private_data;
+	int ret;
+
+	/* Policy binary size cannot exceed POLICY_BUF_MAX_SZ */
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
@@ -281,6 +342,9 @@ static int amd_pmf_get_bios_buffer(struct amd_pmf_dev *dev)
 
 	memcpy(dev->policy_buf, dev->policy_base, dev->policy_sz);
 
+	if (pb_side_load)
+		amd_pmf_open_pb(dev, dev->dbgfs_dir);
+
 	return amd_pmf_start_policy_engine(dev);
 }
 
@@ -382,6 +446,9 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 
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

