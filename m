Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC32A7E5B5F
	for <lists+dri-devel@lfdr.de>; Wed,  8 Nov 2023 17:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61BE510E7B8;
	Wed,  8 Nov 2023 16:38:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1DD10E7B7;
 Wed,  8 Nov 2023 16:37:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VyTUEXAG4Q28ZwQD4byRzscVycCM8cRRcaPrgjFWShqjQ816XzsQ7x32K4EGDyBD8HGBnOpw2eK81x+1PCXSErWRcbdMzDmLIuBv3f0HSMBNFuUbyMYGAzV3GE3AgIujtvcAkbOJ+cz+0cAR6Mi0Rv8V0fVRoPlmsHTIwQHj2p4/vd9/WnO+6mhMWdyCttSf+0gD1Jp/iPjQ+5hF7gqbxxcAnFQIWLLv2DthDlPvrcR0lHJ7/E0BSGTl9hdEj4lieAMS4k6peBGfgTCF195U7iXB6Wowhz0u7xPjvkgmhdOJ/8y+jEw8x+LYadeQH5RZMSJEGIWeUNfnb/WeeirPMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Non9O33TuGchC8qbokpLNJPnxvE1fq3nvrOnE2xQsCw=;
 b=OD7S8Q6GAn4DvwHlmo0yXxBVbsLL7K76CtTp4K/4kWz7R2Jb3mGotJLM1IhPXJ0kcNXxZo7DWdVXt8oyEnvebvYyzDOmsh4uDAZ5QqQrxUFlMFgaDps6UQU9G6INXbklzru16/9BWi8eADcfHsCcJhd7K1ggERGnyRQxZG4iJY2QYc/OBG36y7dyudd3gllso1UDa+ZGlPitdLANZKHePAOtIIv75+SKISiARk90yeKpk0Zpp88yaCK0Uk6nl07mHuF6PhPB2Fkn/tmeE9obRVt1XgzCd694EHu9BMuN7cQc7kdpMOaUoLHztIWxL6ATRtJmr3TZvLIlYmxbOA3L3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Non9O33TuGchC8qbokpLNJPnxvE1fq3nvrOnE2xQsCw=;
 b=oESR5B2b+TT1IySIbyJl2s51Fg38cT+Z2sIwTO0jmEicloNlcr++4a5Gy43YqMe7MU+rcqHjeFvsaia5StSm5yTt6aoG38f4+87XKy+E5WY0Qw2nPUoV/nCJWfY8STc5XMiGztTgWFGABzMVVQNE2u4vrDqeKs/FzDJxP+b4gOM=
Received: from DM6PR07CA0103.namprd07.prod.outlook.com (2603:10b6:5:330::35)
 by DS0PR12MB8787.namprd12.prod.outlook.com (2603:10b6:8:14e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.28; Wed, 8 Nov
 2023 16:37:55 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:5:330:cafe::bc) by DM6PR07CA0103.outlook.office365.com
 (2603:10b6:5:330::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6977.19 via Frontend
 Transport; Wed, 8 Nov 2023 16:37:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6977.16 via Frontend Transport; Wed, 8 Nov 2023 16:37:54 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:11 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.32; Wed, 8 Nov
 2023 10:37:11 -0600
Received: from localhost.localdomain (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.32 via Frontend
 Transport; Wed, 8 Nov 2023 10:37:10 -0600
From: Harry Wentland <harry.wentland@amd.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [RFC PATCH v3 03/23] drm/vkms: Create separate Kconfig file for VKMS
Date: Wed, 8 Nov 2023 11:36:22 -0500
Message-ID: <20231108163647.106853-4-harry.wentland@amd.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231108163647.106853-1-harry.wentland@amd.com>
References: <20231108163647.106853-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|DS0PR12MB8787:EE_
X-MS-Office365-Filtering-Correlation-Id: d7518e47-2461-4854-e06c-08dbe0790eca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ORrAE+hCpHiFCcdyyOUkjBodo1FbF4DCsHcscaxjIYSx/Ux1RJb27fwDAM8c5P7VGR3aRVQrgUmlwLNfWUMXu7hOLrQpAqsoxonjAK+ECuqZW18e2TXNth1fZxJu/FKFC5alwNiThupR1yN6VNtkw9RbY1YqPIeboWRBVvTjWYhll/UwlZKfMjFjcSV+x7CHiN4Rt8UM4R6lFClEPnBiSMLn/r2ehYET/betuXcsPCCXiCOyfL9wqqpqHHswZEvKN/rFH4yaGIBucWXAGZhWpYKxNLyIOnccBCSuHkXWvlakR1rfEYFqP9huhufyJRJ+3eFVUTTJe8J1Og5XYlyBXBD5MemN95o3oXtf1W8PtFmoIY6c+R5GwZYWDRZ1+WUNRW3fk1gNXVP0Dt0K/+eXPyI7uYGAnInEvcQ1RuVUeG37CkEONek8pTVLboj+IZSmMTZcrwTjjppow5hfVdka65W3cEeyTmJmRNrO6+oww4/m7Qiz0EwrUAK+017WlnjZIVL73J7xgaGAngRn+0lGIa20pH/0eHDDSBdeKUYaqL8r1GDpS/ZuuRHvHHzyLMTJyN7NWuvwHsoUAF3kyfdSlgdjxrsbucf8JeSjZsGGqO6AvA91XKDlyUrxhQ76EylxxgGLx+AZ12LZwsmwTnb10T5P1elqgpGW3uzCinmvMtjpLRKNw5+JuIf2F43fOW9tDjXd8kEeolU7//eYQAsKqKx8H0s7jNGjUAvzwdNp71a7KGM3LUk3qaWt1YeRwbyYTsFWA6nluMzph/sZd4vOhA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(136003)(376002)(346002)(230922051799003)(186009)(451199024)(64100799003)(82310400011)(1800799009)(36840700001)(40470700004)(46966006)(2906002)(41300700001)(44832011)(8676002)(4326008)(8936002)(86362001)(40460700003)(5660300002)(36756003)(40480700001)(36860700001)(478600001)(356005)(81166007)(6666004)(70586007)(70206006)(1076003)(26005)(83380400001)(47076005)(2616005)(82740400003)(426003)(336012)(6916009)(54906003)(316002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 16:37:54.5804 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d7518e47-2461-4854-e06c-08dbe0790eca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8787
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
Cc: wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This aligns with most other DRM drivers and will allow
us to add new VKMS config options without polluting
the DRM Kconfig.

v3:
 - Change SPDX to GPL-2.0-only to match DRM KConfig
   SPDX (Simon)

Signed-off-by: Harry Wentland <harry.wentland@amd.com>
Reviewed-by: Simon Ser <contact@emersion.fr>
---
 drivers/gpu/drm/Kconfig      | 14 +-------------
 drivers/gpu/drm/vkms/Kconfig | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 13 deletions(-)
 create mode 100644 drivers/gpu/drm/vkms/Kconfig

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 48ca28a2e4ff..61ebd682c9b0 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -286,19 +286,7 @@ config DRM_VGEM
 	  as used by Mesa's software renderer for enhanced performance.
 	  If M is selected the module will be called vgem.
 
-config DRM_VKMS
-	tristate "Virtual KMS (EXPERIMENTAL)"
-	depends on DRM && MMU
-	select DRM_KMS_HELPER
-	select DRM_GEM_SHMEM_HELPER
-	select CRC32
-	default n
-	help
-	  Virtual Kernel Mode-Setting (VKMS) is used for testing or for
-	  running GPU in a headless machines. Choose this option to get
-	  a VKMS.
-
-	  If M is selected the module will be called vkms.
+source "drivers/gpu/drm/vkms/Kconfig"
 
 source "drivers/gpu/drm/exynos/Kconfig"
 
diff --git a/drivers/gpu/drm/vkms/Kconfig b/drivers/gpu/drm/vkms/Kconfig
new file mode 100644
index 000000000000..b9ecdebecb0b
--- /dev/null
+++ b/drivers/gpu/drm/vkms/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config DRM_VKMS
+	tristate "Virtual KMS (EXPERIMENTAL)"
+	depends on DRM && MMU
+	select DRM_KMS_HELPER
+	select DRM_GEM_SHMEM_HELPER
+	select CRC32
+	default n
+	help
+	  Virtual Kernel Mode-Setting (VKMS) is used for testing or for
+	  running GPU in a headless machines. Choose this option to get
+	  a VKMS.
+
+	  If M is selected the module will be called vkms.
-- 
2.42.1

