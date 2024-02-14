Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F7B85554F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 22:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9995210E79B;
	Wed, 14 Feb 2024 21:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="VniqwpY2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 040E210E4FA;
 Wed, 14 Feb 2024 21:58:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F4jj1T1NGSBOET+RxBySlw0Yr1+lDSYuX+xQAwz6D6FhkulGdeXl6yPMqGTJJx26ack5t65lAbqKU+qE7d1ufu8Gi7SWiz7eIEwvvKHQRUVRgNM6J/YYnl5RMd0ZqCKv+VHcOIhFWra2skjIqHvgdgCulE4TAUIi6y2VYHDkzbZGNfVcN7Bqqhgh0yXzPuRyvR62keWDsSrlp7n7VbdWvd7zgKHHQJNNloUOcpY6Ug83S1diu0cEHsuKOiY9j5p88suF9kR3c5JfCl3qKU7kCYEllVHshBE1j/Uh+K0Vf9No5LTV3y3uEgRv/wR7QiD4tfUgxB/rkZto7KrTBayPdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgAxllXiMqT/uczv6fpo3UTGn+jFDTUzTwbB9UCpHQA=;
 b=CAsWRWXX1BO3HTC/8PwioNR62yUfRSO+C7C2nrJm6PdB6d6uay9/26olZKgdjJRBvgnt+0xtCPiLayOAGDeKQYWzfrcyjvjEaAtrbksxgvvKROf+zl60LVoYIKxjqSG8Ldr0Re9PqQAGetk5o5NT2Y9be+JLLnQHQBGuz35lr1Q3vWFmdDl+O+fjMMJ7+nJEyIDn2G1YWUm2bOGBwk2N999OSv8UQjctmAbdQqOAjOfjdiBBwsjVSRpI+FvRgC63QFcA2BWoe7UW2o/6I6lDf3H3mq9+OfbN9zSQ1VLSVfYOiHxVVcHshr0W7j41tw3j88FiJFcn90yKUB8P3/KmeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgAxllXiMqT/uczv6fpo3UTGn+jFDTUzTwbB9UCpHQA=;
 b=VniqwpY2YtxsvxQRVqzA1jC8Viq/I0op9yMoXg2HPU4KBEsrW03y+8qQf8uzvBliw2l5nnbPM+SNTcNukNH6ZRMthbDQ+OV8IT80LFT0lngOLNXDTwK8JWjZw9h+YZOaQr+4hfIXsfZiadgo4yoORbVw6YTAYaTRjYMc2Ja4Ybw=
Received: from BL1PR13CA0026.namprd13.prod.outlook.com (2603:10b6:208:256::31)
 by SA1PR12MB7037.namprd12.prod.outlook.com (2603:10b6:806:24c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Wed, 14 Feb
 2024 21:58:28 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::73) by BL1PR13CA0026.outlook.office365.com
 (2603:10b6:208:256::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Wed, 14 Feb 2024 21:58:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 14 Feb 2024 21:58:27 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 15:58:26 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Alex Deucher <alexander.deucher@amd.com>,
 "Hans de Goede" <hdegoede@redhat.com>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>
CC: <amd-gfx@lists.freedesktop.org>, "open list:USB SUBSYSTEM"
 <linux-usb@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <linux-renesas-soc@vger.kernel.org>, "open list:ACPI"
 <linux-acpi@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Melissa Wen <mwen@igalia.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v6 1/5] drm: Stop using `select ACPI_VIDEO` in all drivers
Date: Wed, 14 Feb 2024 15:57:52 -0600
Message-ID: <20240214215756.6530-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240214215756.6530-1-mario.limonciello@amd.com>
References: <20240214215756.6530-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|SA1PR12MB7037:EE_
X-MS-Office365-Filtering-Correlation-Id: 38527022-8b05-4be2-91c3-08dc2da8131c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g0dscq0036OIwXCHUQJ3sJtwOKpC3wEbpXW8NzuC8a4HaHF5QyTfMdS7iDVEk4t6gJn1QuMSUuEoG38erPU5W+3M8kLvFE/aGqzzmI6CfrvCCOA+GMXO68uQpdrGq4keTogOTJE6psQfamN1hDGpIhCBXuXNM2rWCQR21YACHvuUfzQ+1SOG8M+SQmvhXfKvnbfyN134dkxAEFqmXThF/XfVv8DxV3lDwHZyTV5WQqqIT9Axk2aSTVJkNYWzhIWzospBJcp0USN1jLPrpJpgXYnOQ0pSLfjt5LjMQ07HDU/jbN4wjMjVV8laFxPR3CtKkF+WKWFWRgj/efbOiuhVW9jFlAOVVaNhveopYnrnVbhfblEiRsqQrSywzcNCzRx2T6DAoCFyrJIqsibw0TaB2N9UNilqXptPxMzmWNRVtkl0mogocsCq+OeY9lJQpS96mJon/wrBB/CKdWsPkFkjKQp63FsyHht6tQEAlIvfOI6DMH9ZYkvI6eyo6xfpPSVvuhGqC7YcZLcMGIuwJ/S2xGmI0tKvhvxHTKiPkmAYv2PwUPQ60PMAnh2qsrqiFbNQ8ysBjBnYBdjoJm7o+wHoWQS6s3V0TyixByPkSsDtkPkN/JZE/XxtxBpVev4UvEW6gFhCc3sZ/lvyqkGoPgRjijKdZ6MV9g5AaGWTUmMz7gg=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(396003)(346002)(136003)(230922051799003)(1800799012)(36860700004)(186009)(451199024)(64100799003)(82310400011)(40470700004)(46966006)(8936002)(70586007)(16526019)(26005)(336012)(2616005)(4326008)(426003)(41300700001)(70206006)(83380400001)(8676002)(110136005)(54906003)(316002)(6666004)(478600001)(82740400003)(81166007)(36756003)(86362001)(356005)(7696005)(1076003)(2906002)(44832011)(5660300002)(7416002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 21:58:27.7694 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38527022-8b05-4be2-91c3-08dc2da8131c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD6.namprd02.prod.outlook.com
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Many DRM drivers (ab)use `select ACPI_VIDEO` and to avoid problems
will then select all the dependencies for ACPI_VIDEO.  This creates
a soft dependency, but makes it very hard to use ACPI_VIDEO in DRM
core.  Switch everything else over to use `depends on ACPI_VIDEO`
instead.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/Kconfig | 9 +--------
 drivers/gpu/drm/gma500/Kconfig     | 7 +------
 drivers/gpu/drm/i915/Kconfig       | 9 +--------
 drivers/gpu/drm/nouveau/Kconfig    | 9 +--------
 drivers/gpu/drm/radeon/Kconfig     | 9 +--------
 drivers/gpu/drm/xe/Kconfig         | 8 +-------
 drivers/platform/loongarch/Kconfig | 2 +-
 drivers/staging/olpc_dcon/Kconfig  | 2 +-
 drivers/video/fbdev/core/Kconfig   | 2 +-
 9 files changed, 9 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 22d88f8ef527..49c3b6eeef76 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -4,6 +4,7 @@ config DRM_AMDGPU
 	tristate "AMD GPU"
 	depends on DRM && PCI && MMU
 	depends on !UML
+	depends on ACPI_VIDEO || !ACPI
 	select FW_LOADER
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HDMI_HELPER
@@ -17,18 +18,10 @@ config DRM_AMDGPU
 	select HWMON
 	select I2C
 	select I2C_ALGOBIT
-	select BACKLIGHT_CLASS_DEVICE
 	select INTERVAL_TREE
 	select DRM_BUDDY
 	select DRM_SUBALLOC_HELPER
 	select DRM_EXEC
-	# amdgpu depends on ACPI_VIDEO when ACPI is enabled, for select to work
-	# ACPI_VIDEO's dependencies must also be selected.
-	select INPUT if ACPI
-	select ACPI_VIDEO if ACPI
-	# On x86 ACPI_VIDEO also needs ACPI_WMI
-	select X86_PLATFORM_DEVICES if ACPI && X86
-	select ACPI_WMI if ACPI && X86
 	help
 	  Choose this option if you have a recent AMD Radeon graphics card.
 
diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
index efb4a2dd2f80..a974cdde4b9c 100644
--- a/drivers/gpu/drm/gma500/Kconfig
+++ b/drivers/gpu/drm/gma500/Kconfig
@@ -2,16 +2,11 @@
 config DRM_GMA500
 	tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
 	depends on DRM && PCI && X86 && MMU
+	depends on ACPI_VIDEO || !ACPI
 	select DRM_KMS_HELPER
 	select FB_IOMEM_HELPERS if DRM_FBDEV_EMULATION
 	select I2C
 	select I2C_ALGOBIT
-	# GMA500 depends on ACPI_VIDEO when ACPI is enabled, just like i915
-	select ACPI_VIDEO if ACPI
-	select BACKLIGHT_CLASS_DEVICE if ACPI
-	select INPUT if ACPI
-	select X86_PLATFORM_DEVICES if ACPI
-	select ACPI_WMI if ACPI
 	help
 	  Say yes for an experimental 2D KMS framebuffer driver for the
 	  Intel GMA500 (Poulsbo), Intel GMA600 (Moorestown/Oak Trail) and
diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index b5d6e3352071..e99405c18c22 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -4,6 +4,7 @@ config DRM_I915
 	depends on DRM
 	depends on X86 && PCI
 	depends on !PREEMPT_RT
+	depends on ACPI_VIDEO || !ACPI
 	select INTEL_GTT if X86
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
@@ -22,14 +23,6 @@ config DRM_I915
 	select I2C
 	select I2C_ALGOBIT
 	select IRQ_WORK
-	# i915 depends on ACPI_VIDEO when ACPI is enabled
-	# but for select to work, need to select ACPI_VIDEO's dependencies, ick
-	select BACKLIGHT_CLASS_DEVICE if ACPI
-	select INPUT if ACPI
-	select X86_PLATFORM_DEVICES if ACPI
-	select ACPI_WMI if ACPI
-	select ACPI_VIDEO if ACPI
-	select ACPI_BUTTON if ACPI
 	select SYNC_FILE
 	select IOSF_MBI if X86
 	select CRC32
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 1e6aaf95ff7c..a3768484cbf5 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -2,6 +2,7 @@
 config DRM_NOUVEAU
 	tristate "Nouveau (NVIDIA) cards"
 	depends on DRM && PCI && MMU
+	depends on ACPI_VIDEO || !ACPI
 	select IOMMU_API
 	select FW_LOADER
 	select DRM_DISPLAY_DP_HELPER
@@ -15,16 +16,8 @@ config DRM_NOUVEAU
 	select DRM_SCHED
 	select I2C
 	select I2C_ALGOBIT
-	select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
-	select X86_PLATFORM_DEVICES if ACPI && X86
-	select ACPI_WMI if ACPI && X86
-	select MXM_WMI if ACPI && X86
 	select POWER_SUPPLY
-	# Similar to i915, we need to select ACPI_VIDEO and it's dependencies
-	select BACKLIGHT_CLASS_DEVICE if ACPI && X86
-	select INPUT if ACPI && X86
 	select THERMAL if ACPI && X86
-	select ACPI_VIDEO if ACPI && X86
 	select SND_HDA_COMPONENT if SND_HDA_CORE
 	help
 	  Choose this option for open-source NVIDIA support.
diff --git a/drivers/gpu/drm/radeon/Kconfig b/drivers/gpu/drm/radeon/Kconfig
index f98356be0af2..05d134bb1cb2 100644
--- a/drivers/gpu/drm/radeon/Kconfig
+++ b/drivers/gpu/drm/radeon/Kconfig
@@ -4,6 +4,7 @@ config DRM_RADEON
 	tristate "ATI Radeon"
 	depends on DRM && PCI && MMU
 	depends on AGP || !AGP
+	depends on ACPI_VIDEO || !ACPI
 	select FW_LOADER
 	select DRM_DISPLAY_DP_HELPER
 	select DRM_DISPLAY_HELPER
@@ -15,17 +16,9 @@ config DRM_RADEON
 	select SND_HDA_COMPONENT if SND_HDA_CORE
 	select POWER_SUPPLY
 	select HWMON
-	select BACKLIGHT_CLASS_DEVICE
 	select INTERVAL_TREE
 	select I2C
 	select I2C_ALGOBIT
-	# radeon depends on ACPI_VIDEO when ACPI is enabled, for select to work
-	# ACPI_VIDEO's dependencies must also be selected.
-	select INPUT if ACPI
-	select ACPI_VIDEO if ACPI
-	# On x86 ACPI_VIDEO also needs ACPI_WMI
-	select X86_PLATFORM_DEVICES if ACPI && X86
-	select ACPI_WMI if ACPI && X86
 	help
 	  Choose this option if you have an ATI Radeon graphics card.  There
 	  are both PCI and AGP versions.  You don't need to choose this to
diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index e36ae1f0d885..8a20f5a4d516 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -2,6 +2,7 @@
 config DRM_XE
 	tristate "Intel Xe Graphics"
 	depends on DRM && PCI && MMU && (m || (y && KUNIT=y)) && 64BIT
+	depends on ACPI_VIDEO || !ACPI
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
 	# the shmem_readpage() which depends upon tmpfs
@@ -19,13 +20,6 @@ config DRM_XE
 	select DRM_MIPI_DSI
 	select RELAY
 	select IRQ_WORK
-	# xe depends on ACPI_VIDEO when ACPI is enabled
-	# but for select to work, need to select ACPI_VIDEO's dependencies, ick
-	select BACKLIGHT_CLASS_DEVICE if ACPI
-	select INPUT if ACPI
-	select ACPI_VIDEO if X86 && ACPI
-	select ACPI_BUTTON if ACPI
-	select ACPI_WMI if X86 && ACPI
 	select SYNC_FILE
 	select IOSF_MBI
 	select CRC32
diff --git a/drivers/platform/loongarch/Kconfig b/drivers/platform/loongarch/Kconfig
index 5633e4d73991..2c55bc98c727 100644
--- a/drivers/platform/loongarch/Kconfig
+++ b/drivers/platform/loongarch/Kconfig
@@ -22,7 +22,7 @@ config LOONGSON_LAPTOP
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on INPUT
 	depends on MACH_LOONGSON64
-	select ACPI_VIDEO
+	depends on ACPI_VIDEO
 	select INPUT_SPARSEKMAP
 	default y
 	help
diff --git a/drivers/staging/olpc_dcon/Kconfig b/drivers/staging/olpc_dcon/Kconfig
index d0ba34cc32f7..e1fe1f2b767a 100644
--- a/drivers/staging/olpc_dcon/Kconfig
+++ b/drivers/staging/olpc_dcon/Kconfig
@@ -4,7 +4,7 @@ config FB_OLPC_DCON
 	depends on OLPC && FB && BROKEN
 	depends on I2C
 	depends on GPIO_CS5535 && ACPI
-	select BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 	help
 	  In order to support very low power operation, the XO laptop uses a
 	  secondary Display CONtroller, or DCON.  This secondary controller
diff --git a/drivers/video/fbdev/core/Kconfig b/drivers/video/fbdev/core/Kconfig
index db09fe87fcd4..d5c9249cdb5d 100644
--- a/drivers/video/fbdev/core/Kconfig
+++ b/drivers/video/fbdev/core/Kconfig
@@ -179,7 +179,7 @@ config FB_SYSMEM_HELPERS_DEFERRED
 config FB_BACKLIGHT
 	tristate
 	depends on FB
-	select BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 
 config FB_MODE_HELPERS
 	bool "Enable Video Mode Handling Helpers"
-- 
2.34.1

