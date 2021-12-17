Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AB07479715
	for <lists+dri-devel@lfdr.de>; Fri, 17 Dec 2021 23:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EAAC10E476;
	Fri, 17 Dec 2021 22:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2071.outbound.protection.outlook.com [40.107.236.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A846210E5C3;
 Fri, 17 Dec 2021 22:28:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHS8GGi4ObC/62N9dzJhuiSi1Pxcf55dzzqNDkv4KEnWtZr9/RsRCQuvPDFgmsoRlw4V/yqeqnR1UoJgruTWuy/OeiqbwrjjviVLwgNoeNJMpIYiptbCDMf1SYmhOhOkAQNmG+vqTrnKoy5JmUs842dvoemWjYtyt7L+ERl/Inpqne7eGUvDo0yOUkJC95g3O9PwO79fGBeE2P2clEVz+u6W88ExPkC/Fnk/thYLWxkhOEfmjyVMCN1C2RKxWdq32dENMGvWLKd7QAE+1DvwtXwcsiUtTk/MFExNB9FMdTgMzOSDE+Ch9exgAWgQqiG5Wno/ctiMx9PhEGWBOdRyzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hu1UsnP5dzlqhRd1usnZSk8Ohz+/2ADy9Nznttuu9bY=;
 b=n1+rAJl0Ws5QXZBj2ebZ71lWu5KkFyPhAZi6ghmPiwtBohNaIqNJuRw2uWlzB6ybUaQEp8R+2jy8owsZlci1erMXcoY4HeaxtFfkXlTXgP8b2Vcs64OM7pOVoQRPhpwFku6kfcQY3OMosscuMooTRpXs7t17pIw0p/dG1zCXtgYWz20f4ilc8a7WagrZfmv20J0N/E0KpK6oAiXx+gnLtAGKEwVjk5DVDFKKjj6UfnQ/YlrYvho+suAHiTnMVUEpmrcKUDdv+ZwFejn0Rxmc+0biN0AZ0zAZs2cvUtJCPb0ROh9I5dzEwhUiyIEj58cW6OTSSjBIPas8U30FJNqmDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hu1UsnP5dzlqhRd1usnZSk8Ohz+/2ADy9Nznttuu9bY=;
 b=4SgjM12AWpesA0kPC30d3wdbmIebBOpQUnrwq+JkQVQtWCWhqlIb4qvuUH7rsYMySQVmgQS9Z+F7ukwiFNWipPwmyr5KDfHG9IB7id/4VOUmtEmRXhBHw+XNBiGzUSAuHQo3U5QzfZqbakVGmOaT7yS905452nRDmSXodubz4hI=
Received: from BN6PR12CA0035.namprd12.prod.outlook.com (2603:10b6:405:70::21)
 by DM5PR12MB1129.namprd12.prod.outlook.com (2603:10b6:3:7a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4778.17; Fri, 17 Dec 2021 22:28:11 +0000
Received: from BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
 (2603:10b6:405:70:cafe::b4) by BN6PR12CA0035.outlook.office365.com
 (2603:10b6:405:70::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Fri, 17 Dec 2021 22:28:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT003.mail.protection.outlook.com (10.13.177.90) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Fri, 17 Dec 2021 22:28:10 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Dec 2021 16:28:09 -0600
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [RFC 1/6] drm/amdgpu: Init GPU reset single threaded wq
Date: Fri, 17 Dec 2021 17:27:40 -0500
Message-ID: <20211217222745.881637-2-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
References: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB03.amd.com
 (10.181.40.144)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fcb1cb81-d0bb-4c00-b0b1-08d9c1ac81f2
X-MS-TrafficTypeDiagnostic: DM5PR12MB1129:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1129E0A8981A5B27A6F8022AEA789@DM5PR12MB1129.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3513;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M3AXGPFuXMR3jUgAxzTsEI2LfM/RqvDxLmsZO+yYU2JUv3DGgky4JZnegptxUmPB0MKhg0l2weeNnjfSlnswjJ51BWfB6xo/GBY6on5x9D+Vv659rgqvUKFoSbtcxnW2xVVTI5jlvgEVE0wsjHI7DFgQCszjlOHFFnpXafqvIYwci/QUThg5ALyGbFkhDMG5biH/InvMtpmEh5p5zxiZHBWAcioblEArbfq8hZeMOJqqFHKtTJ+e0b8EztTYCZPi6hncwqn1RzOKUMgo6zMbzgefWVUK0jqQkDvtSoXeTi1e53hi8f6P+so6AzuXzc1enOskKp6dWpTv41a9y2xmrdoBAhAnNRD2EqG5T0B1737YDuO+vGpCiVom1W/eFV7g0thIOKVhzYziP7eIeV5AKdfJIgaPtTz5XHm3VUJuzgiCBjs/ZBc79OHOQ32wD0c2Y9XCMgepSlyvNaLikEEFNXd1vW29mKu/RcoFFGlvSlD8LzX2DOiZqHP7O3r0sVenEbjyTGEpUh/C6m/npG9+5Gubb83HzfZE3wu/D6+F+sNRQzoRJGSgEUopRgwtsOvNKPZN6YX/ldnmOXUmcy3x/7bnsBBiNAHSAb5d1tnWzZT2mif3XS5JVpmQWukODJwx0kWPGrvLOBdbB3RCTjspIDYSrrYNGYLY8paPV9DT8VuhpKuIdSqupHc4L46T8Pv8HL31bqcA621jDMmo8mg0H45Yji4Yoyv2mybuYDqbhNEvp8exEviz7cSQ3YciNSI9vcb3e1pNDwhFMc+MqHhykZTHI9Gqggi2fTWFoccWKOQ=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(40470700001)(336012)(6666004)(83380400001)(47076005)(2906002)(356005)(81166007)(1076003)(2616005)(426003)(70586007)(44832011)(36756003)(70206006)(82310400004)(36860700001)(508600001)(40460700001)(5660300002)(4326008)(8676002)(86362001)(8936002)(316002)(186003)(54906003)(16526019)(7696005)(26005)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2021 22:28:10.7843 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fcb1cb81-d0bb-4c00-b0b1-08d9c1ac81f2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT003.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1129
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
Cc: Monk.Liu@amd.com, horace.chen@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Do it for both single device and XGMI hive cases.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h        |  7 +++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 20 +++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c   |  9 +++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h   |  2 ++
 4 files changed, 37 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 9f017663ac50..b5ff76aae7e0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -812,6 +812,11 @@ struct amd_powerplay {
 
 #define AMDGPU_RESET_MAGIC_NUM 64
 #define AMDGPU_MAX_DF_PERFMONS 4
+
+struct amdgpu_reset_domain {
+	struct workqueue_struct *wq;
+};
+
 struct amdgpu_device {
 	struct device			*dev;
 	struct pci_dev			*pdev;
@@ -1096,6 +1101,8 @@ struct amdgpu_device {
 
 	struct amdgpu_reset_control     *reset_cntl;
 	uint32_t                        ip_versions[HW_ID_MAX][HWIP_MAX_INSTANCE];
+
+	struct amdgpu_reset_domain	reset_domain;
 };
 
 static inline struct amdgpu_device *drm_to_adev(struct drm_device *ddev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index 5625f7736e37..5f13195d23d1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -2391,9 +2391,27 @@ static int amdgpu_device_ip_init(struct amdgpu_device *adev)
 	if (r)
 		goto init_failed;
 
-	if (adev->gmc.xgmi.num_physical_nodes > 1)
+	if (adev->gmc.xgmi.num_physical_nodes > 1) {
+		struct amdgpu_hive_info *hive;
+
 		amdgpu_xgmi_add_device(adev);
 
+		hive = amdgpu_get_xgmi_hive(adev);
+		if (!hive || !hive->reset_domain.wq) {
+			DRM_ERROR("Failed to obtain reset domain info for XGMI hive:%llx", hive->hive_id);
+			r = -EINVAL;
+			goto init_failed;
+		}
+
+		adev->reset_domain.wq = hive->reset_domain.wq;
+	} else {
+		adev->reset_domain.wq = alloc_ordered_workqueue("amdgpu-reset-dev", 0);
+		if (!adev->reset_domain.wq) {
+			r = -ENOMEM;
+			goto init_failed;
+		}
+	}
+
 	/* Don't init kfd if whole hive need to be reset during init */
 	if (!adev->gmc.xgmi.pending_reset)
 		amdgpu_amdkfd_device_init(adev);
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
index 0fad2bf854ae..8b116f398101 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.c
@@ -391,6 +391,14 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
 		goto pro_end;
 	}
 
+	hive->reset_domain.wq = alloc_ordered_workqueue("amdgpu-reset-hive", 0);
+	if (!hive->reset_domain.wq) {
+		dev_err(adev->dev, "XGMI: failed allocating wq for reset domain!\n");
+		kfree(hive);
+		hive = NULL;
+		goto pro_end;
+	}
+
 	hive->hive_id = adev->gmc.xgmi.hive_id;
 	INIT_LIST_HEAD(&hive->device_list);
 	INIT_LIST_HEAD(&hive->node);
@@ -400,6 +408,7 @@ struct amdgpu_hive_info *amdgpu_get_xgmi_hive(struct amdgpu_device *adev)
 	task_barrier_init(&hive->tb);
 	hive->pstate = AMDGPU_XGMI_PSTATE_UNKNOWN;
 	hive->hi_req_gpu = NULL;
+
 	/*
 	 * hive pstate on boot is high in vega20 so we have to go to low
 	 * pstate on after boot.
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
index d2189bf7d428..6121aaa292cb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_xgmi.h
@@ -42,6 +42,8 @@ struct amdgpu_hive_info {
 		AMDGPU_XGMI_PSTATE_MAX_VEGA20,
 		AMDGPU_XGMI_PSTATE_UNKNOWN
 	} pstate;
+
+	struct amdgpu_reset_domain reset_domain;
 };
 
 struct amdgpu_pcs_ras_field {
-- 
2.25.1

