Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EFC3907939
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2024 19:02:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59AAA10EB3F;
	Thu, 13 Jun 2024 17:02:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DZc9zivm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2046.outbound.protection.outlook.com [40.107.244.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21CA010EB44;
 Thu, 13 Jun 2024 17:01:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=czpqpIW6QUPJlQhQAskPV/NWHbGcm6VfL0clxXSu/mQu3JXrA2oGdeDhPeXQVDIKVeJTIR31SBuWbkwVxi3I5lHD/0Pfd1n0R2OZ2DJnjB609IpX1lEmFRmDDUu8g2ld90UNC0X3QXWUElyBsKapwNBWd3dHrYI5jF/QXX/mdSY8WgV+jWtwnFHjh+v9Y6T1rDK+1UXAMXBJ2VyKq/snAnuIj9nNImfWNlWfBCJHVLHXm2j3DKTmPKE/1Ap7WZKZgVZdSMeDwLeke6kN9hAc79vAUlmv2zZrdLvNzaN3XbN0UO8Nkc0gOtSUnZyAd/B3+PBZjxlDTCnjCTQQdoOsCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=17WkeGr7r7HhCghj1PZIUJ0et2wAnD3ZVaHDMHv4z6Q=;
 b=hI+jevuPTU+leMTwWXJVlm1ybGY+761+OW7kimODYRonasncOAYBUvNWBfbm8bwNaFnZyKYOVQVRVs8POjHHExvDGbyf/fxHEihU3+cMTuaV0rrseQC+R07GHUBrkoRIiZKEJblTcywn2dFZ/DRVPA/zcc/YET+d+/yFe1o2L0J2pqqws6FS6ZETk3MZ/bEoY1qmrkWnVQWHCF3kyA2F03iZ385f1NYu5X2tHpEHnREbAMQ47TalUDR1/9CqFny7HD6ABKygQhxuntYY1/WGgxrfyB/luYYkVtjZysntHaK9r1rTJE96LexaFL1JI6ylic2HXIIfxImSa7ebKATFyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=17WkeGr7r7HhCghj1PZIUJ0et2wAnD3ZVaHDMHv4z6Q=;
 b=DZc9zivmERZnYCYprjt+jQvmJEHi82dZ3SrbfliCIl6rrQANSQv0fBsfgyfDBBtqtzWAZ6iPwhVQAzRP1Tkzpur36Y8GSK1xkMOMOI1Ur9Ga0pLWBlojbZoFJoZF9riMkpbJqRMZWIAnX0Webp+6KRnYrb/HahsYZqlqJ8qdTKSCtMWYjaHTDUirB8QjBz8LKh7XYeXF6gjnOytV0JyYs7OJUx6ndwkWJbveT9QVREAhXbVoZOUXSg/zNWAkqnQri29O3TmyNrNcZpPER1SRoham2ElPGTDc24qrGXovSN/vJnWx7Ylw0a2zjDIAAbhHwN4wdnN+wW5p80HoOr7msQ==
Received: from BL1PR13CA0095.namprd13.prod.outlook.com (2603:10b6:208:2b9::10)
 by DS7PR12MB6119.namprd12.prod.outlook.com (2603:10b6:8:99::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.37; Thu, 13 Jun 2024 17:01:45 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:2b9:cafe::c4) by BL1PR13CA0095.outlook.office365.com
 (2603:10b6:208:2b9::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.20 via Frontend
 Transport; Thu, 13 Jun 2024 17:01:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.15 via Frontend Transport; Thu, 13 Jun 2024 17:01:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 10:01:06 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 13 Jun
 2024 10:01:05 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 2/2] drm/nouveau/nvkm: separate out into nvkm.ko
Date: Fri, 14 Jun 2024 03:02:11 +1000
Message-ID: <20240613170211.88779-3-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240613170211.88779-1-bskeggs@nvidia.com>
References: <20240613170211.88779-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|DS7PR12MB6119:EE_
X-MS-Office365-Filtering-Correlation-Id: dd29f3d9-99a6-405f-b783-08dc8bca7ceb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230035|376009|1800799019|82310400021|36860700008; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZuOaVEZDYjPkvOsruQ9UUcNX8dZEN+ULkFubwYd57kvtdM3h8nrkJA6YgD/u?=
 =?us-ascii?Q?3vCW5CQUcpgWNUtsbe/5eiEGQx+oHIteM+4CKxdk7LcUWZAGWcXf6Rzf75/S?=
 =?us-ascii?Q?LY2K5b9d/hVxL4aBUr9vszSiIviFSybgkNY2a2sHg/IeJV909GWjzvfL2aFM?=
 =?us-ascii?Q?AwKNutrmzldF8bf8L6lDttsw2NQ3av9CzsxK6pVsmz2cw4z30HctdyUrXycB?=
 =?us-ascii?Q?B3HOfArgZoi0gOpP6VJbiHw9eJtpKlvP4nnKmfzWZzEE0/ikZgaR68ULbYkQ?=
 =?us-ascii?Q?qAVpA5uG4P1aOibJSxhfGRuBta8Fo9PWJacWNyVUUmEnAsGDEo1af0U36cGQ?=
 =?us-ascii?Q?24WqvvGYFuj9YhuTtVIsGxYDE/WVCoDsNzzMueYy89arUJpVaLJS0SKnZO86?=
 =?us-ascii?Q?vawPxS2seH7adzAju2ZgioA7ORsBrfeIuv9WUplV4PzHa0FUL+GyEV0EAS3q?=
 =?us-ascii?Q?IiIX05psmeayiEQCMVQTCDB+esmseTx8x5vxFiUmS1kGwk+sDWgOyvwODRwZ?=
 =?us-ascii?Q?hbjidXMs5uzthZ6OaDmGGwDHiSYRCG5Zr0zrssCRsgiqfIAifOOYkyLbJwC6?=
 =?us-ascii?Q?H81cEyAy97hvOMJRkmgzEd/J4QbQjNfqKO+6XxfrYtVgJlnzsLM8gbDEbTTQ?=
 =?us-ascii?Q?OLRTovI/SXxj1yGvTULmkh+rFHOO6fBOvPMrNpFTmA4inwITesbvQsPeSprr?=
 =?us-ascii?Q?voLHalvJHSl5WzK5iaZNTeYaWgfyh1cUq3RabEo3lGHjH99Z07ahP0mz+6QA?=
 =?us-ascii?Q?r00mjVWw06OuF6sgEN1nsJ5B2m/RAw+r1onkd3RXsn4rk46v6NrosqkWMrge?=
 =?us-ascii?Q?oqh8HTw0UODloQd5rPhqjXP4YLkCbVcawfORm8/7q/zrPdLwukn4xRF19Czs?=
 =?us-ascii?Q?9mC7Q9v4dh9HUq1e7KwmjB2fZ3cOt10IaG766Yctmum/CLIj+DzTr7V9sK+e?=
 =?us-ascii?Q?cMM6QzdMlePGySh8XniofG8THoFN0Z7jGHzpfHHgVnBvsLaaIyYhan+nyVwc?=
 =?us-ascii?Q?MEGFqHecC/oUIBNbDVtfLGKPj/qou/75KZnK7HJiY97x3PyZr5tWS+XTAnEV?=
 =?us-ascii?Q?YzFCUALjymOtaDQPQ07SkhVAO+UdnlvwYq4jCMKR97uMTsfI+eNt0A2z7K/A?=
 =?us-ascii?Q?uK2UqPFcpU41hrsPkqM66CxAHn6/avDwSo9X6pnrUgdXOzcqXatPwQzzw5V6?=
 =?us-ascii?Q?r11B2+rE5lF1Nvr7WZevPTemaSop49NDvMbK8z/ugHcCE5HEC/y8tI4Z9WaN?=
 =?us-ascii?Q?o3lbm8zqRrqiwWaM9IxmaBkG/PrGOJjbWv30JX/2XDMlSp5fKy9JnCHnA2zL?=
 =?us-ascii?Q?4DtPNa7f5cRwBA1e1ShFJP6xdQ6qus9XJC0zUH+B3slQ/jWJx3I1/HJXUZ27?=
 =?us-ascii?Q?SpkjbEczM7P/F4Vxf66wuPmucclq1SirIfteV2crQT6NFQPaHg=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230035)(376009)(1800799019)(82310400021)(36860700008); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2024 17:01:37.3213 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd29f3d9-99a6-405f-b783-08dc8bca7ceb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6119
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

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/Kbuild                     |  4 ++--
 drivers/gpu/drm/nouveau/include/nvkm/core/module.h |  3 ---
 drivers/gpu/drm/nouveau/nouveau_drm.c              | 10 +---------
 drivers/gpu/drm/nouveau/nvkm/module.c              |  8 ++++++--
 4 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/Kbuild b/drivers/gpu/drm/nouveau/Kbuild
index cc471ab6a7ec..b62c6858fb7b 100644
--- a/drivers/gpu/drm/nouveau/Kbuild
+++ b/drivers/gpu/drm/nouveau/Kbuild
@@ -8,11 +8,11 @@ ccflags-y += -I $(NOUVEAU_PATH)/$(src)
 
 # NVKM - HW resource manager
 include $(src)/nvkm/Kbuild
-nouveau-y := $(nvkm-y)
+obj-$(CONFIG_DRM_NOUVEAU) += nvkm.o
 
 # NVIF - NVKM interface library (NVKM user interface also defined here)
 include $(src)/nvif/Kbuild
-nouveau-y += $(nvif-y)
+nouveau-y := $(nvif-y)
 
 # DRM - general
 ifdef CONFIG_X86
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/module.h b/drivers/gpu/drm/nouveau/include/nvkm/core/module.h
index fc42ace93a1c..d1ad6aae9911 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/module.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/module.h
@@ -3,8 +3,5 @@
 #define __NVKM_MODULE_H__
 #include <linux/module.h>
 
-int __init nvkm_init(void);
-void __exit nvkm_exit(void);
-
 extern int nvkm_runpm;
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 7e77e950eba2..4f55cd73d1b3 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1174,7 +1174,7 @@ static const struct dev_pm_ops nouveau_pm_ops = {
 
 static const struct auxiliary_device_id
 nouveau_drm_id_table[] = {
-	{ .name = "nouveau.device" },
+	{ .name = "nvkm.device" },
 	{}
 };
 
@@ -1190,8 +1190,6 @@ nouveau_auxdrv = {
 static int __init
 nouveau_drm_init(void)
 {
-	int ret;
-
 	nouveau_display_options();
 
 	if (nouveau_modeset == -1) {
@@ -1202,10 +1200,6 @@ nouveau_drm_init(void)
 	if (!nouveau_modeset)
 		return 0;
 
-	ret = nvkm_init();
-	if (ret)
-		return ret;
-
 	nouveau_backlight_ctor();
 
 	return auxiliary_driver_register(&nouveau_auxdrv);
@@ -1223,8 +1217,6 @@ nouveau_drm_exit(void)
 
 	if (IS_ENABLED(CONFIG_DRM_NOUVEAU_SVM))
 		mmu_notifier_synchronize();
-
-	nvkm_exit();
 }
 
 module_init(nouveau_drm_init);
diff --git a/drivers/gpu/drm/nouveau/nvkm/module.c b/drivers/gpu/drm/nouveau/nvkm/module.c
index c14dd7fa15c2..d0ae023cdc74 100644
--- a/drivers/gpu/drm/nouveau/nvkm/module.c
+++ b/drivers/gpu/drm/nouveau/nvkm/module.c
@@ -26,7 +26,7 @@
 
 int nvkm_runpm = -1;
 
-void __exit
+static void __exit
 nvkm_exit(void)
 {
 #ifdef CONFIG_PCI
@@ -39,7 +39,7 @@ nvkm_exit(void)
 #endif
 }
 
-int __init
+static int __init
 nvkm_init(void)
 {
 	int ret;
@@ -60,3 +60,7 @@ nvkm_init(void)
 
 	return 0;
 }
+
+MODULE_LICENSE("GPL and additional rights");
+module_init(nvkm_init);
+module_exit(nvkm_exit);
-- 
2.44.0

