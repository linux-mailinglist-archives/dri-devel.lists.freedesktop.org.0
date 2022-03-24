Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D89C4E6BFD
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 02:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAB710E135;
	Fri, 25 Mar 2022 01:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED9D010E135;
 Fri, 25 Mar 2022 01:29:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gmV3FH4nrPfwEIGVpjGBmd56XfXU7aRHcDENEl5KMbXJ/tX0pYzhMC3q6mkISgyCuLsajn8WvdVVMu5sbQf8FHsnazTC8o0YpM4cLtyuf5dwWX35FiWB+sWzXlnnfquDQEr4LNR+X2MoimYarpzsYKfWoHMZ61FFB/x/UGK5pVodBJuGypqVZpbtMNLwqykW6i2cMb92ZZ7ApB4L4/nMazpNdBedA0zgzRmOeZxrl0wmMk6+NIM+xzyiLCaiiCRZfMwWI65pqdRkbQd2xyTD0OHG95cvQv7jTHWYgvjKcbUoka2B0jgzDUuwIiW/hyJK8E8022obS5XJWa5nyTOp5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyQOGLgepnaC6Wx17sov6ex6cMuY/2hjrz5+CfLEDIk=;
 b=PtkqaouxxMSYQX+L7hVY79JeF3UVDBsGz8N2MBy1HTYSJogjaCToCp2ZHjNNZ8yAsWI0Uw4ISBs5vOczfbLSJpC0j7N1Eky6KLgn1GN19DxAChOuDSF25mcD7S2NyZsJ8Zn16fkVi0cHNpW4b5uK6UJT2xFtj9PIW+WL8kaesl5jGGkmKP/eaCqqRRJW0M+6pgSHZb7xOn45DYyy7K3R5JvjEL7kM7hRwvH1YX0L1gEWTf81rcxciwU9qXPQBmLb1VBqp+SJhSDgK3mHCFnXtjJZsjhCo3ipV6SkTVP0L4NFcEzPhTZ4QVq2vMagmPb5S9xWFqmuNumsZQnflRe8Ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyQOGLgepnaC6Wx17sov6ex6cMuY/2hjrz5+CfLEDIk=;
 b=ySk8RstSkfkYMxCKdG/HOLs60vXGAyf3SukwOXp9J3vO3AujdqdiBRn7HHmSbYu1tqZ1EXl0N1pEhxO+ViuCJkfaiWPwHMqq0b9Vy7etbSav1PrMwGusBzmHOPbPMRkkAF8UNhdNBzgTFpdhT9mItxOtKw+YEi8uNxPtK06cfFs=
Received: from MW2PR2101CA0029.namprd21.prod.outlook.com (2603:10b6:302:1::42)
 by DM6PR12MB2940.namprd12.prod.outlook.com (2603:10b6:5:15f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.18; Fri, 25 Mar
 2022 01:29:01 +0000
Received: from CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
 (2603:10b6:302:1:cafe::cb) by MW2PR2101CA0029.outlook.office365.com
 (2603:10b6:302:1::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.8 via Frontend
 Transport; Fri, 25 Mar 2022 01:29:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT004.mail.protection.outlook.com (10.13.175.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.17 via Frontend Transport; Fri, 25 Mar 2022 01:29:00 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 24 Mar
 2022 20:28:59 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Thu, 24 Mar
 2022 20:28:59 -0500
Received: from Ryan-AMD.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Thu, 24 Mar 2022 20:28:54 -0500
From: Ryan Lin <tsung-hua.lin@amd.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <seanpaul@chromium.org>, <bas@basnieuwenhuizen.nl>,
 <nicholas.kazlauskas@amd.com>, <sashal@kernel.org>, <markyacoub@google.com>,
 <victorchengchi.lu@amd.com>, <ching-shih.li@amd.corp-partner.google.com>,
 <Rodrigo.Siqueira@amd.com>, <ddavenport@chromium.org>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <leon.li@amd.com>
Subject: [PATCH] UPSTREAM: drm/amdgpu: Disable ABM when AC mode
Date: Fri, 25 Mar 2022 07:10:00 +0800
Message-ID: <20220324231000.4072275-1-tsung-hua.lin@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cfdbd6c0-d510-40dd-3dd0-08da0dfed74f
X-MS-TrafficTypeDiagnostic: DM6PR12MB2940:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB294000F0240FA84036373700B21A9@DM6PR12MB2940.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bnwMLlweT9HkuTjeyTu/CKBJFqAoj4zrP4dqHlZWXlRA5vYJo8hNvCA4bimjXTGmLvtigUzhOWUunGhTFaIrK2DNpaoqH2gE4Xy21+PpPjpO07tBEWuJ5yu4De1lkjtlt1tjOGNAIFDf+ya0pRZPFneJhvbYUfE6Q8E2JUnRsvPyLE6wewHCQk+uN357o807z7iI/TbrMNxK33Z/4GgFVv/6c8giisz/Qd6GD/1Fu8t6GOz1TFKkVHLA++BTMyfqVCEbG7YDqy9uCMIjr6ue86GXEEh0JUFreiak7buOoXf5DykyZQFiGMR1BJrsOSmKhfACR/1J68a/YCf8fWJBk/E5zd14hvzj95dr4bpGnwIZMlZx4ZHwEFoEBhhEHthDc8mRVMwUlO8aEmj6+3g2ko0z9SkLkrBF70jcyT5cyZKoieg/51VO1s5MNB2pV4MLIWTI4imPSkfnrBLpTGKaHSiH9uwTybY3FXJFYG/1jztTXetVDfAdrB9n50towc1yLv5vp8O0uslu1hncG4TyEZRmalrkCGjROKCOYckFYdN9EaA+/ZJ/+qMJ2gJLQ4lAP0Fh17xgNlg/wgw8K5BDA1Dj3SAdH8aIVsG90Vzvpvf3CBNt6Y4bH5XLc4QIE6u+2UTvf/6/iY+cn3iVOBA4SpkMqoKJ5iFDqrXm8gDp16knW6LdIDc0I8smbs9+gD3P5n1SdtMmdd+VTZgql/7WdbuepjpDFVWg0BuOecsRYwOgjK5OeWx3fMnBvmjhJ5GUuJhc4BqLjiVgMmw80kfY5Q==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(1076003)(47076005)(426003)(336012)(186003)(86362001)(83380400001)(26005)(40460700003)(36860700001)(82310400004)(81166007)(356005)(921005)(36756003)(110136005)(6636002)(5660300002)(8936002)(8676002)(4326008)(2906002)(316002)(6666004)(7416002)(7696005)(70586007)(70206006)(508600001)(2616005)(83996005)(36900700001)(2101003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 01:29:00.9620 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfdbd6c0-d510-40dd-3dd0-08da0dfed74f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT004.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2940
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
Cc: Ryan Lin <tsung-hua.lin@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Disable ABM feature when the system is running on AC mode to get
the more perfect contrast of the display.

Signed-off-by: Ryan Lin <tsung-hua.lin@amd.com>

---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |  4 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  1 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c | 58 ++++++++++++-------
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h       |  1 +
 4 files changed, 42 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index c560c1ab62ecb..bc8bb9aad2e36 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -822,6 +822,10 @@ static int amdgpu_acpi_event(struct notifier_block *nb,
 	struct amdgpu_device *adev = container_of(nb, struct amdgpu_device, acpi_nb);
 	struct acpi_bus_event *entry = (struct acpi_bus_event *)data;
 
+	if (strcmp(entry->device_class, "battery") == 0) {
+		adev->pm.ac_power = power_supply_is_system_supplied() > 0;
+	}
+
 	if (strcmp(entry->device_class, ACPI_AC_CLASS) == 0) {
 		if (power_supply_is_system_supplied() > 0)
 			DRM_DEBUG_DRIVER("pm: AC\n");
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
index 54a1408c8015c..478a734b66926 100644
--- a/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
+++ b/drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c
@@ -23,6 +23,8 @@
  *
  */
 
+#include <linux/power_supply.h>
+#include "amdgpu.h"
 #include "dmub_abm.h"
 #include "dce_abm.h"
 #include "dc.h"
@@ -51,6 +53,7 @@
 #define DISABLE_ABM_IMMEDIATELY 255
 
 
+extern uint amdgpu_dm_abm_level;
 
 static void dmub_abm_enable_fractional_pwm(struct dc_context *dc)
 {
@@ -117,28 +120,6 @@ static void dmub_abm_init(struct abm *abm, uint32_t backlight)
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
@@ -148,6 +129,9 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
 	int edp_num;
 	uint8_t panel_mask = 0;
 
+	if (power_supply_is_system_supplied() > 0)
+		level = 0;
+
 	get_edp_links(dc->dc, edp_links, &edp_num);
 
 	for (i = 0; i < edp_num; i++) {
@@ -170,6 +154,36 @@ static bool dmub_abm_set_level(struct abm *abm, uint32_t level)
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

