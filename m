Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1132F7BFC18
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204AE10E34B;
	Tue, 10 Oct 2023 13:00:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2087.outbound.protection.outlook.com [40.107.92.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BF810E348;
 Tue, 10 Oct 2023 13:00:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bww6tkBCq8hPiOH+DIu12jBiM6dNBIQwgR8tcei4UjXVSsIB9i1YvOdBnrOTqvHRiBUX4sssKfFM1WbN6Qlmqpj3qanZPjvdCvCJ+P2y54QfKcpVZI1FAiqtFI8Y3pIFY4JfwqI1TQaCg90Oivyi+92KCfyz1zSNyK9YSfyDPydhtOZu3Gqazh+KY1TE7Zl/UglEZ6iK0Amq+oaMzQMuaKSS1EiW0FQLbdaqdwxM31bAis6XXVosF3NO+EvpRQm8wHu5P70x+F02BdjmxiKlXMNaXPVYW2Rc+73dR93qQF8lW91wgjZzQKy8pX5dbQitAvTf/u8Uajr5Im6FVuLZEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ol7rk90XZEGfH8JAFeaKZlGZcVp7pAnPb+nkNmgXBUE=;
 b=EwgyyYn/nbCPe2zWct6VDUY/bDbupWE8/Z9NROLd1wlwnr155YOvasPcO39UWmd52gv7N2PxNrbVIItXGXsuGa+O4HMKPoTNQDXfMw4VIum3iuI73su2jg2Lfpwy5gH6ctpTfbI3AKuh9pDCDvgjM2k87nxHIqrHaQ0aOhBTEZmx9VWxotL+HlBx816mlINNwloghlW3LbD2ispj8xYNFikbZRRg5jO25B8FaeRWAvtBTCTQ8xJBpq5gbl1O+lIjwZQM+uqsMkqdjrcE5EhTRBKIA/Xc0EcmAP3Trngl2jBY4YCqIcM//8k3Ht9VuabsFddaLBf/xG7gWaj3rqKBzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ol7rk90XZEGfH8JAFeaKZlGZcVp7pAnPb+nkNmgXBUE=;
 b=JqNCcKTq52EN6TWGlIqYVk4EDRXno0/Kmuo82GRX1znsagSwObboqaZLWqXq5pvssPTtCxJZsz4C76IxOkDalxleTBQ/OP6UegAlLDOubLCMBmyX9UVFDuZURHhgVYcMv0YiQOouB5gmZjCdICEp1b8iC+/bc2cj2+LtiSknpw0=
Received: from CH2PR07CA0022.namprd07.prod.outlook.com (2603:10b6:610:20::35)
 by SA3PR12MB9180.namprd12.prod.outlook.com (2603:10b6:806:39b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Tue, 10 Oct
 2023 12:59:59 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:610:20:cafe::ca) by CH2PR07CA0022.outlook.office365.com
 (2603:10b6:610:20::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38 via Frontend
 Transport; Tue, 10 Oct 2023 12:59:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 12:59:57 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 07:59:51 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v3 03/16] platform/x86/amd/pmf: Change return type of
 amd_pmf_set_dram_addr()
Date: Tue, 10 Oct 2023 18:29:04 +0530
Message-ID: <20231010125917.138225-4-Shyam-sundar.S-k@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|SA3PR12MB9180:EE_
X-MS-Office365-Filtering-Correlation-Id: 1663db46-39e7-4c7d-e7bc-08dbc990ce57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VLTMv9aJ0mt4NI/JDaOAjfu3gEmmfw3fgrHggHZGIgBRncq3bbp7742eH3tOu5y9vnnJV3rDoHrPoImwquF5GIZb+E9jJ3YGI1OMQ6tk2wdPeXSITLn2ACbByqWsRbzCoMvyTWj3kuWevGh1QpyB2TCSX9L5+fzKH/6ha0h/AagyNZ55LMzeUAAykV2Qz/CraJYnJ3axSgCiYjn8SdASTCMPyrBxc0WgE6+WyLYHpJx5Az1tSrJh9wHDZqDwO57WTKbBBMBr3E7aBAzncq+zsgGYCC5lcL8MdzWMx1PV5B9KZgjKS7fBsc1zNaPzYFrOvQiNun2xumdJBR7V5hHNQceHzXyGgyTieAxVQlz7r0/sGkdF2qeunDXRP0F1Fl+b+OI0JZ907+3eYMFqEJwFIx1MNtpdkVms8hOA2W2pbk/uM6BsQExLzOjYf30aCgLX88HwrW6sSUysvP1gXHZEFnAL9d0aWHwfYPlFUYzT6xtog54arSO+FrweK7hMbvewoh2T9oyLsu1RP6F17WzzGZUttTAWvt4PVfr/Qni/0ATv0GXfGzJGgsi+lH4JPFTJbqU3M1pTKSQxufOMB6elINZrmCIZq5v0ngdj3Hg13iCiodoF4WQ7G+Xx/5nFGLUvmEtf+dUW75uegLUEiJxIkKUQeVfDC/C4Jlgf3bkJKlo9DBBPnPnNU9EbA/mTHYjdbjDpfJ7MrzLs/8JMe7toj4eHvmjt8G5QjMMlM5+IQHlc1SB5kq3kqFuhWO/jq6MeIPM1Tm1Con6dlkut1HXBI6kHTYHZMANObyK6EW4dV2s=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(82310400011)(186009)(1800799009)(451199024)(64100799003)(46966006)(36840700001)(40470700004)(40460700003)(2616005)(7696005)(478600001)(6666004)(336012)(7416002)(83380400001)(70586007)(2906002)(316002)(4326008)(47076005)(26005)(41300700001)(54906003)(5660300002)(110136005)(16526019)(426003)(8936002)(70206006)(8676002)(82740400003)(356005)(86362001)(36860700001)(40480700001)(921005)(36756003)(81166007)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 12:59:57.6617 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1663db46-39e7-4c7d-e7bc-08dbc990ce57
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9180
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

In the current code, the metrics table information was required only
for auto-mode or CnQF at a given time. Hence keeping the return type
of amd_pmf_set_dram_addr() as static made sense.

But with the addition of Smart PC builder feature, the metrics table
information has to be shared by the Smart PC also and this feature
resides outside of core.c.

To make amd_pmf_set_dram_addr() visible outside of core.c make it
as a non-static function and move the allocation of memory for
metrics table from amd_pmf_init_metrics_table() to amd_pmf_set_dram_addr()
as amd_pmf_set_dram_addr() is the common function to set the DRAM
address.

Add a suspend handler that can free up the allocated memory for getting
the metrics table information.

Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/platform/x86/amd/pmf/core.c | 42 ++++++++++++++++++++++-------
 drivers/platform/x86/amd/pmf/pmf.h  |  1 +
 2 files changed, 34 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index d57ed038f0c9..ffb78e9709d9 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -251,29 +251,35 @@ static const struct pci_device_id pmf_pci_ids[] = {
 	{ }
 };
 
-static void amd_pmf_set_dram_addr(struct amd_pmf_dev *dev)
+int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev)
 {
 	u64 phys_addr;
 	u32 hi, low;
 
+	/* Get Metrics Table Address */
+	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
+	if (!dev->buf)
+		return -ENOMEM;
+
 	phys_addr = virt_to_phys(dev->buf);
 	hi = phys_addr >> 32;
 	low = phys_addr & GENMASK(31, 0);
 
 	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, 0, hi, NULL);
 	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, 0, low, NULL);
+
+	return 0;
 }
 
 int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
 {
-	/* Get Metrics Table Address */
-	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
-	if (!dev->buf)
-		return -ENOMEM;
+	int ret;
 
 	INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
 
-	amd_pmf_set_dram_addr(dev);
+	ret = amd_pmf_set_dram_addr(dev);
+	if (ret)
+		return ret;
 
 	/*
 	 * Start collecting the metrics data after a small delay
@@ -284,17 +290,35 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
 	return 0;
 }
 
+static int amd_pmf_suspend_handler(struct device *dev)
+{
+	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
+
+	/*
+	 * Free the buffer allocated for storing the metrics table
+	 * information, as will have to allocate it freshly after
+	 * resume.
+	 */
+	kfree(pdev->buf);
+
+	return 0;
+}
+
 static int amd_pmf_resume_handler(struct device *dev)
 {
 	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
+	int ret;
 
-	if (pdev->buf)
-		amd_pmf_set_dram_addr(pdev);
+	if (pdev->buf) {
+		ret = amd_pmf_set_dram_addr(pdev);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
 
-static DEFINE_SIMPLE_DEV_PM_OPS(amd_pmf_pm, NULL, amd_pmf_resume_handler);
+static DEFINE_SIMPLE_DEV_PM_OPS(amd_pmf_pm, amd_pmf_suspend_handler, amd_pmf_resume_handler);
 
 static void amd_pmf_init_features(struct amd_pmf_dev *dev)
 {
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 4da5c4eb053c..a91c22d9b532 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -421,6 +421,7 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev);
 int amd_pmf_get_power_source(void);
 int apmf_install_handler(struct amd_pmf_dev *pmf_dev);
 int apmf_os_power_slider_update(struct amd_pmf_dev *dev, u8 flag);
+int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev);
 
 /* SPS Layer */
 int amd_pmf_get_pprof_modes(struct amd_pmf_dev *pmf);
-- 
2.25.1

