Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F13F551136C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 10:20:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1029410E3E7;
	Wed, 27 Apr 2022 08:20:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2052.outbound.protection.outlook.com [40.107.236.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC59D10E0CB;
 Wed, 27 Apr 2022 08:20:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/pall3QzQ0ncTmOw1jZiwazutMlPAjR9OQNmwtE2ORsF96LVHv25ieTuJ0o8ZkERJT8XZt476R/uN9xhs/ta9EbRjlxnNz8GtyQKCoGgjSS7mKaiBRsX4Voi/HTeHuKvxotgJYxhavKYnIvQ05hI91ieukn+vT9IvwgjJsfXL4FPP/rcfgjnyOXtQuy3I3ovPrdMXlg3cdJAqcmsJEv2XOuJn+WNz/wD1fKpa4SJ5lL9DZ1Mf9L2LYnev6PfX0/F7W39/QevPiLdn3J1aFZUrauATkgdThbmDYuYEuRewN7G/fruixtC8qPzlEfAPA2hHIrXgxNu0MpIQ+bQ4fQkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n6wo9KnMkeLuf2YTYPgUv+S58hMEsGrvVgYzYM96KHI=;
 b=ZHYfGexMa2dzCx49d02arwCSFA64Hie5V5y2tU1Yqwng+iuTORgXvMNRr3I1RQmtZGeRqUPsZH47QbI8q90RLLYY1R0RfQhK6dxB0+dig7yedItdBIsbZwFOzn3rPMBKAEbRaaU6uzIkgXVMFXSXH3K7LS7W2xqgx0rilH39mByQzGVBRmwV7RmAzGevslSHEZ3tmh4CUPMC9iaGpm8fb852LZsWRNA3YgbWC+tQ2aea6mPyyOonp/vyeqotReWSihNwJnxP/2Ehp8fQR7WDEtIWiE8fDp2LLDUZ5HRZdV6ZV+UyAtVgP5ShQ0gZzcP1W/c5fLHJcN9+KRfuBXkBew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n6wo9KnMkeLuf2YTYPgUv+S58hMEsGrvVgYzYM96KHI=;
 b=4L9NNPHquXULzOtFGrmuR6n/x8evzhvU/Z9TdLl2PKKxyxX4q4zj05EvPZwmoIQBfOW/qRTRZJKHbz8TtzbrLVUpE4Mjil3g9yaplqJ9ukDixTRsWaJGPDgzA6xzqc8rXMqSTH+egNizLbAHPRjrMjGWKu9DmcBvDZkC8Gbi+Z8=
Received: from BN9PR03CA0851.namprd03.prod.outlook.com (2603:10b6:408:13d::16)
 by MN2PR12MB4813.namprd12.prod.outlook.com (2603:10b6:208:1bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 08:20:40 +0000
Received: from BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:13d:cafe::a7) by BN9PR03CA0851.outlook.office365.com
 (2603:10b6:408:13d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15 via Frontend
 Transport; Wed, 27 Apr 2022 08:20:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT019.mail.protection.outlook.com (10.13.176.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 08:20:40 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 03:20:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 27 Apr
 2022 01:20:39 -0700
Received: from Ryan-AMD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Wed, 27 Apr 2022 03:20:33 -0500
From: Ryan Lin <tsung-hua.lin@amd.com>
To: <leon.li@amd.com>, <ching-shih.li@amd.com>, <tsung-hua.lin@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <harry.wentland@amd.com>, <sunpeng.li@amd.com>, <seanpaul@chromium.org>,
 <Pratik.Vishwakarma@amd.com>, <lijo.lazar@amd.com>,
 <sathishkumar.sundararaju@amd.com>, <rdunlap@infradead.org>,
 <linux-patches-robot@chromeos-missing-patches.google.com.iam.gserviceaccount.com>,
 <Hawking.Zhang@amd.com>, <andrey.grodzovsky@amd.com>, <shaoyun.liu@amd.com>,
 <Jack.Zhang1@amd.com>, <horace.chen@amd.com>, <haonan.wang2@amd.com>,
 <Anthony.Koo@amd.com>, <qingqing.zhuo@amd.com>, <wyatt.wood@amd.com>,
 <robin.chen@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4] drm/amdgpu: Disable ABM when AC mode
Date: Wed, 27 Apr 2022 16:08:02 +0800
Message-ID: <20220427080802.1687117-1-tsung-hua.lin@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220324231000.4072275-1-tsung-hua.lin@amd.com>
References: <20220324231000.4072275-1-tsung-hua.lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b223436-ba5f-4e2c-6cb9-08da2826d0e7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4813:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB4813A5C2D3C4871E822AE9B6B2FA9@MN2PR12MB4813.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: r3W6OgLBuwyxBBfFAV/mF32312QsOksaiMyU8RYZcLM+r5tQ/Y8PxZiwyMqg1GbC1ZGUQQDHSJ9A6Av2LN9Uz1usMV3SD0mmpKJmnMIOD8euz8AvAZdXPje5Eo3sGVwe+D2jB8yd1sMBRHcNRUhBIodNZ+ueT1owbvsMU0wYUIu49H8O1xsMdPGcryTk6eX8TM/6ANsjb82ol8lvtqz8BHrViBhK9TlKXu20uDBYDUf3iUMCABIQdpD+gZXvzv8FYOdeHmALROmiBiwxWgdebOlTdBbi++AKpItjJABrxRlmMujgXlLL2NSLvzhLnp7QnkOsT0Fh5K4AfwSvA4u7tuZ9sTsUXBh2VLxiNYUnUcaPBNLNkU3CCw6OgQLLEGkTSjJO4SoMbHBjSYvctR2LtdGwIgWM4VeX7IJKCLSLebZbyOeSL21wnsAT7tUFNMmeuSg3aSTZjJq7VGwfjx/bT3sENAPBEwN0aNEEez3dIP3VcyCoD+JE/LQudjbjs+/potoQUZeMGNOJpeyBzl4zFcvEJ4JHlgrYfvCLnLCQGj9aj/NZh6/xCkmaE794lmWfV7SSzonmbwzoU/B2AuIHViWzvndAgJ73rs/TRAPi2kBJpjfVpP0hVdT24f7tEWDhJMxJ3J1HUhMexdzdwAUhYkVyZBssTJ0URqWf4yIEpsUVnoBf6Xci/6ewXWjOClEr8yd0ZoaJyBXW1IBUYMPMLs4S5iePvE0w1pGGexDTPH5SzEcf3TIPumj6PQ1VeuBmt5hRi1SsNIbbfK7/Kc/WKA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(86362001)(47076005)(921005)(2616005)(1076003)(81166007)(36860700001)(83380400001)(426003)(186003)(336012)(40460700003)(8676002)(70206006)(36756003)(356005)(508600001)(2906002)(70586007)(7696005)(6666004)(110136005)(5660300002)(82310400005)(26005)(316002)(8936002)(36900700001)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 08:20:40.4261 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b223436-ba5f-4e2c-6cb9-08da2826d0e7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT019.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4813
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

Disable ABM feature when the system is running on AC mode to get the more
perfect contrast of the display.

v2: remove "UPSTREAM" from the subject.

v3: adv->pm.ac_power updating by amd gpu_acpi_event_handler.

V4: Add the file I lost to fix the build error.

Signed-off-by: Ryan Lin <tsung-hua.lin@amd.com>

---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  1 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c | 61 +++++++++++--------
 drivers/gpu/drm/amd/include/amd_acpi.h        |  1 +
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h       |  1 +
 5 files changed, 42 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 4811b0faafd9a..6ac331ee4255d 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -822,7 +822,8 @@ static int amdgpu_acpi_event(struct notifier_block *nb,
 	struct amdgpu_device *adev = container_of(nb, struct amdgpu_device, acpi_nb);
 	struct acpi_bus_event *entry = (struct acpi_bus_event *)data;
 
-	if (strcmp(entry->device_class, ACPI_AC_CLASS) == 0) {
+	if (strcmp(entry->device_class, ACPI_AC_CLASS) == 0 ||
+	    strcmp(entry->device_class, ACPI_BATTERY_CLASS) == 0) {
 		if (power_supply_is_system_supplied() > 0)
 			DRM_DEBUG_DRIVER("pm: AC\n");
 		else
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
index abfcc1304ba0c..3a0afe7602727 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3454,6 +3454,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 
 	adev->gfx.gfx_off_req_count = 1;
 	adev->pm.ac_power = power_supply_is_system_supplied() > 0;
+	adev->pm.old_ac_power = true;
 
 	atomic_set(&adev->throttling_logging_enabled, 1);
 	/*
diff --git a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
index 54a1408c8015c..090bd23410b45 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
@@ -22,7 +22,8 @@
  * Authors: AMD
  *
  */
-
+#include <linux/power_supply.h>
+#include "amdgpu.h"
 #include "dmub_abm.h"
 #include "dce_abm.h"
 #include "dc.h"
@@ -50,7 +51,7 @@
 
 #define DISABLE_ABM_IMMEDIATELY 255
 
-
+extern uint amdgpu_dm_abm_level;
 
 static void dmub_abm_enable_fractional_pwm(struct dc_context *dc)
 {
@@ -117,28 +118,6 @@ static void dmub_abm_init(struct abm *abm, uint32_t backlight)
 	dmub_abm_enable_fractional_pwm(abm->ctx);
 }
 
-static unsigned int dmub_abm_get_current_backlight(struct abm *abm)
-{
-	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
-	unsigned int backlight = REG_READ(BL1_PWM_CURRENT_ABM_LEVEL);
-
-	/* return backlight in hardware format which is unsigned 17 bits, with
-	 * 1 bit integer and 16 bit fractional
-	 */
-	return backlight;
-}
-
-static unsigned int dmub_abm_get_target_backlight(struct abm *abm)
-{
-	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
-	unsigned int backlight = REG_READ(BL1_PWM_TARGET_ABM_LEVEL);
-
-	/* return backlight in hardware format which is unsigned 17 bits, with
-	 * 1 bit integer and 16 bit fractional
-	 */
-	return backlight;
-}
-
 static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
 {
 	union dmub_rb_cmd cmd;
@@ -147,6 +126,10 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
 	int i;
 	int edp_num;
 	uint8_t panel_mask = 0;
+	struct amdgpu_device *dev = dc->driver_context;
+
+	if (dev->pm.ac_power)
+		level = 0;
 
 	get_edp_links(dc->dc, edp_links, &edp_num);
 
@@ -170,6 +153,36 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
 	return true;
 }
 
+static unsigned int dmub_abm_get_current_backlight(struct abm *abm)
+{
+	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
+	unsigned int backlight = REG_READ(BL1_PWM_CURRENT_ABM_LEVEL);
+	struct dc_context *dc = abm->ctx;
+	struct amdgpu_device *adev = dc->driver_context;
+
+	if (adev->pm.ac_power != adev->pm.old_ac_power) {
+		dmub_abm_set_level(abm, amdgpu_dm_abm_level);
+		adev->pm.ac_power = power_supply_is_system_supplied() > 0;
+		adev->pm.old_ac_power = adev->pm.ac_power;
+	}
+
+	/* return backlight in hardware format which is unsigned 17 bits, with
+	 * 1 bit integer and 16 bit fractional
+	 */
+	return backlight;
+}
+
+static unsigned int dmub_abm_get_target_backlight(struct abm *abm)
+{
+	struct dce_abm *dce_abm = TO_DMUB_ABM(abm);
+	unsigned int backlight = REG_READ(BL1_PWM_TARGET_ABM_LEVEL);
+
+	/* return backlight in hardware format which is unsigned 17 bits, with
+	 * 1 bit integer and 16 bit fractional
+	 */
+	return backlight;
+}
+
 static bool dmub_abm_init_config(struct abm *abm,
 	const char *src,
 	unsigned int bytes,
diff --git a/drivers/gpu/drm/amd/include/amd_acpi.h b/drivers/gpu/drm/amd/include/amd_acpi.h
index 2d089d30518f3..5a62e580668e4 100644
--- a/drivers/gpu/drm/amd/include/amd_acpi.h
+++ b/drivers/gpu/drm/amd/include/amd_acpi.h
@@ -25,6 +25,7 @@
 #define AMD_ACPI_H
 
 #define ACPI_AC_CLASS           "ac_adapter"
+#define ACPI_BATTERY_CLASS  "battery"
 
 struct atif_verify_interface {
 	u16 size;		/* structure size in bytes (includes size field) */
diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
index f6e0e7d8a0077..de459411a0e83 100644
--- a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
+++ b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
@@ -445,6 +445,7 @@ struct amdgpu_pm {
 	uint32_t                smu_prv_buffer_size;
 	struct amdgpu_bo        *smu_prv_buffer;
 	bool ac_power;
+	bool old_ac_power;
 	/* powerplay feature */
 	uint32_t pp_feature;
 
-- 
2.25.1

