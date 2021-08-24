Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 820233F6AC2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Aug 2021 23:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11216E0DD;
	Tue, 24 Aug 2021 21:01:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2081.outbound.protection.outlook.com [40.107.237.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F8546E0D5;
 Tue, 24 Aug 2021 21:01:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGTGMZlzt5sSbNTpGbxS/OcJW4P7ewBwnow38J7YbG2akU/A1NCJV1dxWRpjo/+kwnqjj8cepH2ncgv5Yn917xL4relBBb+74D1C5vAP4MrL6YnfpRNRLJz3jZSPSh4WGRFqVv3MfBgOtayloWe7KLd6rImv9TAsvnDCfs82XlSk24V3DulMCKX6jAp98OphD80Xc4TQS9LoxabJJmYJODuVTG6E50IF8gjMeyYsjGdn3Boi3pQlTiPkoFiuPDXeNwRcT/AyQYS+SBg0dUID/4vz7WjRNV0FcPn3vxkgO9ZmRN7lvWt7H77p7zQOCnAzet3fAxXKR9lRqFSRLj0gmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVjj2p1/2cub+2D3463dfzFPKnfwfhsAgOXarlqz1oY=;
 b=bGZiN1AotV/wIGhfOOW8s61fKkRVGD6pHK0VMrZul/rgazLez/KUkw+MDwqo94cSMZ5coCIBzDBk43FxnlDsrHJpMyeUwOXfdUnNMIdhqm6IByzzStYlePGw012g8ETw72LdkOg7yrT1cnpuuqCgf4N6Qf799aouDUhqvR2HNWmJJY/QvkGJ1muUIcAyVz7fQYZ96sT0Svrk/eMFYhEB5EfE0MEPc8e3egDSfKo/K985NFfM1/JQZTrac1fY6ESITB0uzLWNXeuzcbLt/WAlz7TY5uaGE4DR6qDzpwmpfI9Z0WB0bi6Rtxbi8B78/MEGCpecqzKueTHrHuC1qic4nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jVjj2p1/2cub+2D3463dfzFPKnfwfhsAgOXarlqz1oY=;
 b=2gFiCwpp0Uho+yOuLOsZl8dndMr8EIOF7VwT9FrujUuPS9Zk1uGfcs0BsL6HTLvur3P1mdRP6raxbez9zHckihOxJF8RGHEH8B0bkpIfBaPUH27UiY8OMyL1/2IPdIj2ED7VChUbhz0o+Y10BCvgCGXZ3DQDAKEQpF5ZvmRDWZM=
Received: from BN9PR03CA0179.namprd03.prod.outlook.com (2603:10b6:408:f4::34)
 by SN6PR12MB4751.namprd12.prod.outlook.com (2603:10b6:805:df::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Tue, 24 Aug
 2021 21:01:43 +0000
Received: from BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:f4:cafe::9b) by BN9PR03CA0179.outlook.office365.com
 (2603:10b6:408:f4::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Tue, 24 Aug 2021 21:01:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT021.mail.protection.outlook.com (10.13.177.114) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4457.17 via Frontend Transport; Tue, 24 Aug 2021 21:01:43 +0000
Received: from agrodzovsky-All-Series.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 24 Aug 2021 16:01:42 -0500
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
CC: <ckoenig.leichtzumerken@gmail.com>, Andrey Grodzovsky
 <andrey.grodzovsky@amd.com>
Subject: [PATCH 4/4] drm/amdgpu: Add a UAPI flag for hot plug/unplug
Date: Tue, 24 Aug 2021 17:01:20 -0400
Message-ID: <20210824210120.49812-5-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824210120.49812-1-andrey.grodzovsky@amd.com>
References: <20210824210120.49812-1-andrey.grodzovsky@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1a013591-6a51-4514-f040-08d967426095
X-MS-TrafficTypeDiagnostic: SN6PR12MB4751:
X-Microsoft-Antispam-PRVS: <SN6PR12MB47515482D9881AFEE8CB9127EAC59@SN6PR12MB4751.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:296;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NHwINAEOVGGBq2fFEr3qrR7uEEofu5l0HPQdq45e8l9z2WQrPR7zRXF5kdxEGG8yfovKqhPWtx9WVhyl0/qhot+ZOm3vTzKD7GVziFYFeBGQ5uh3ctT+x3zg2YxSng+hI30hJ1L0aLPEHxA7znYe9zqR972RJqTFNe6w+RE1U8XrRG8iLTfArEuLXRynKhwjVNqMYPki9pbXGRNG0H8HdIRPQb8bkcfKzJhOc59UM+10+cD5vdAhZwp7Hk00RrQG9Yy16iC4qzbXBClLdxMvmDQxRDaZqEfpVayUB9QiEmFNIBihCb5DPtgS9lrb7gXKv3nS1eTgEUnWby+3AgVeA+3N28AP3mZkh0Ucdx1ZQ4nN7R3oB3RHwTGpNxnjvfBcMLoAKxsYTmShmIGrutrqWebxnHmnb7wf/f7zbeqhLl6Udn0JObdPwY1bll3jEUapKmKCTmayWQV3EG1E8U2m0pw4oChSPOC1IMhVns0owqo1DuzXHx138RH15+uKWqIh6zOpvwCs8mojaz0tR6IdnFMqHBNCQEjdCsmH95hv77tgrT2iAv3II83vT+DiM+eWvBXv2mQOdAHbqh2M3IlWgBXwqSskp0TAl8CguT1btS2DW9xJTgjrdvvcBJAb4JHNpKvjiJZ4ggvypMVtS15mxyAXSEuj0UlDsqPhKZhSp0qxVb2M7kudayB6KF7/p+5tECL+6xvLXy70a6hp/vWG2oEExC+TE6i3moJeEIkStJE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(136003)(396003)(46966006)(36840700001)(36756003)(82310400003)(54906003)(44832011)(478600001)(4326008)(83380400001)(336012)(2616005)(47076005)(1076003)(86362001)(82740400003)(7696005)(426003)(6666004)(356005)(36860700001)(4744005)(8936002)(8676002)(186003)(81166007)(110136005)(16526019)(2906002)(5660300002)(70586007)(26005)(70206006)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 21:01:43.5147 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a013591-6a51-4514-f040-08d967426095
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB4751
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

To support libdrm tests.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 6400259a7c4b..c2fdf67ff551 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -96,9 +96,10 @@
  * - 3.40.0 - Add AMDGPU_IDS_FLAGS_TMZ
  * - 3.41.0 - Add video codec query
  * - 3.42.0 - Add 16bpc fixed point display support
+ * - 3.43.0 - Add device hot plug/unplug support
  */
 #define KMS_DRIVER_MAJOR	3
-#define KMS_DRIVER_MINOR	42
+#define KMS_DRIVER_MINOR	43
 #define KMS_DRIVER_PATCHLEVEL	0
 
 int amdgpu_vram_limit;
-- 
2.25.1

