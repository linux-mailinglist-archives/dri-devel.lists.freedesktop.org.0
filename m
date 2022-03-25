Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC8A4E6E2C
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 07:27:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982F310ED3C;
	Fri, 25 Mar 2022 06:27:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208E210ED3B;
 Fri, 25 Mar 2022 06:27:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P0V3mHpxr8x85hygBpBWf9aXcEDUxaPfAeYA+f1FO3RJRV5RrQ+4ywKzvTFWaMKm+Fsef60pzxRiyFb6s4bWIvMlOcjzo82FgUeCBrbJoM9fZ4JyzPr7adWJSN0GEBkI0jMdoV/ZNufSsK6oZumsGV5fQ00R1gi33SLLg3MpVlWNQr6E9CmXoyPyXFxBNrwX0CIX9OyLkO7QFpL7a3r8SBAHIhIYm/uf8cBl4vVDyYUJZBV7FakoLHPJqQEjqNRbKWrgtkTkDvr8dwr8C9JSTZN0Imgt1pZuR5T2NjlbhwtOBqvRNs7+sJHiX165IH7Q5QLes3JDzqSk+Zebwt46dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eyQOGLgepnaC6Wx17sov6ex6cMuY/2hjrz5+CfLEDIk=;
 b=PWjq2KApf1vVg9yAlRhRjnY+uXoTEcOkCUs6QWfk70KR+bbB82mHp2WaB1dsuV5ufFAkZwkFn9pd4WPTkNnkxfU9A8kyfyRSFg1hRVEswRV1lGuJhYhWgijhPebMVbLEsto7lOF1eYNlHTgXzeLdzXgmrW8F/PjLhx853FtiC4JRD75bIwk7N/XxF5bbgcZDQ3UgGHs7UwSovPAGC8zIUTAINurr3Yug/LzWOht6qTYpEAah3OsIORAjGQchBxV+bYsmIMYEKtNPG1eeuwNT3jub+8KYxaK5THFqpMgJtEG31hKXHewDf/1h9qvE30xCySnz6/sRZxftLMVOeEZvFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eyQOGLgepnaC6Wx17sov6ex6cMuY/2hjrz5+CfLEDIk=;
 b=WgyaK8LnncJthiWOnfcr23q3O6Zodw1+NKTndbTHn2ySShTXWwMVsxsZZ+RV68lEEDIBrTRq8hE6BPj6708bOcb30bKkS/TLkYBXTnhtXgeSKYdkqV9cMteGc6L3yWqJyokGuuMQgYTEJm/fRa9yGyBwBbIG5DrkpcFWe0MbCbY=
Received: from MW4PR04CA0309.namprd04.prod.outlook.com (2603:10b6:303:82::14)
 by CH2PR12MB4087.namprd12.prod.outlook.com (2603:10b6:610:7f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 06:27:31 +0000
Received: from CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::cd) by MW4PR04CA0309.outlook.office365.com
 (2603:10b6:303:82::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18 via Frontend
 Transport; Fri, 25 Mar 2022 06:27:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT005.mail.protection.outlook.com (10.13.174.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.18 via Frontend Transport; Fri, 25 Mar 2022 06:27:30 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 25 Mar
 2022 01:27:29 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 25 Mar
 2022 01:27:28 -0500
Received: from Ryan-AMD.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Fri, 25 Mar 2022 01:27:23 -0500
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
Subject: [PATCH v2 3/25] drm/amdgpu: Disable ABM when AC mode
Date: Fri, 25 Mar 2022 12:05:16 +0800
Message-ID: <20220325040515.4073706-1-tsung-hua.lin@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b077b04d-6a1d-4903-b34a-08da0e288a0c
X-MS-TrafficTypeDiagnostic: CH2PR12MB4087:EE_
X-Microsoft-Antispam-PRVS: <CH2PR12MB4087F67C9E53D6225E77921CB21A9@CH2PR12MB4087.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PUiKtScg4J+LY78NuAqka3AmZ0LAPjArddhdMnk8mBTJkyQk7pGX3f8WH3GHTgWDXKjQVilR92zC46GF3q5T7lfYgzt4yUx5Dt38YNxNoT53ZsPP+HzFmoqPZh2ij7f0aW22i4gSgxpdrFEfzHdDUk5af+p3I8OP8rKOMCrvuKTYs4qDMuEUt+1+LS8gq30EVkzH9AnU2+O2AnJero2kS0geux9rsX1ztswnFiq6uS2nRIpBoIRVKBeFQG9+cE3S528vWzXaqdhWztn9Tn7vfBVCfOY8SbZaXOsGzIlihOiBh6rxjF5sywFFoAApJ5XNmWAuRWMR0pvXB1v71UgVldOQTVuXU4yq+55No4tTBG2qamYo7MLpkYmFNNeSlobHeDuex/MPIJNV/6cI9vu7BhosH2QPBaEhbNG2ziXEgzMvtI4jcOBJ7ORI/Hfe33jmoVqGr1ayDeV0US9hWVpmKLwFl3X0Wb0aKukKoh404nOszyQPml5ONKc+jFHX7aJVaC3L5v1Ggtmc20vZciTJUeBFbaO0SAEYf3PUHjSF/4rMAs3Zvw/DsSr0dVHhkz7HWmlhgQlmt+JpdXzRX71V2ABlV/sWboKCMhANE/6Ae7IdPR4DX6rHLyUiN4HTu4l0sWPzZLE/70+MVDyBOP+IZeaPoIqsDuD6x1450JrynwNYBKYHrMeoMPDxgOiURht19pcOya1YcI6A0pEFKma42z1vopRkJeQi1a/8dSc3P/HEdbSwO0MU+NNuL79mScvwBbdj6s+FrJLQ4soPsmfDoA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(316002)(1076003)(921005)(82310400004)(7416002)(2616005)(356005)(81166007)(5660300002)(40460700003)(508600001)(86362001)(7696005)(110136005)(6666004)(6636002)(2906002)(26005)(36860700001)(8676002)(186003)(426003)(8936002)(36756003)(336012)(70586007)(83380400001)(70206006)(4326008)(47076005)(2101003)(83996005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 06:27:30.2040 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b077b04d-6a1d-4903-b34a-08da0e288a0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT005.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4087
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

