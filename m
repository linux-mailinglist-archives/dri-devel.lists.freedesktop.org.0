Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49CA2510E52
	for <lists+dri-devel@lfdr.de>; Wed, 27 Apr 2022 04:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C90CD10E0FC;
	Wed, 27 Apr 2022 02:00:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D45C210E0FC;
 Wed, 27 Apr 2022 02:00:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n3nGWVS8PNa5DDJ5u+dH9r4KMDvGH4oN1jYX8EFqb/3PVWfC3Q7zPYuAormtUulBo+0PoIphbxB8Yfq9uPMv/VOWroaGU3hrOwvMgpZDgi0l/lHS6RNj/qU28w/ube4jp86+lqQVwNJ6QIY6vRSlHbz6jnNgAwhQy/hIpf8mF7FTI2w2hRc8bpNeSnqZBKTi+fuqBnva23idzgi8HBYlXNu0JsULag+c5HV59uQwtWyU6XFYKJylWEocDVZJ5f1eZL4EzzXHZzdGcHQWebTVelfht1RKIBpYxJ/gR2Nt7M1NTjx9kWTZ4MlmYZHiXlQiZTXbznLjcZioLMzkjlI5qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OIFiiBGpN52HtOdpfrnyo/94HWew5wUk9JbGJv3rDFc=;
 b=fM+7eoyHIqqzj0C97UtCzdgZHdrW/ixCGRw6+m3sild+PDwtUNyxv2znI/m6kOFYbm8nN1AtVO1pnDNbTmA+kAlqkUlGGbWe9Hli0UJmI550T5QY8iF4NkU5jfmHs6nlh6zgXLWUmBpk7usNN1x9hveP/zM35df8o/vrSCOKLKSQ5j93uGAsknYwS1/z1AjEOHzUfyZ9S7RVx89xqOHTIjiJd4GYaP0mGFaHvzQNOweZX0uolBURt0Y2AL87v1TIf6jCS5uOOtDujhsd9Ro8gjYOiPyU2YOJHLLT4I9BcB3O5VJ3MC0RsskfzhkqSgrTy+DosgDLsLcAoWa6ru3fYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OIFiiBGpN52HtOdpfrnyo/94HWew5wUk9JbGJv3rDFc=;
 b=cIgqXRiRDcoIxhSQ8aF9KU21JIRCPY4c3gW0zEi+bD1As9GdPI7vdoR/1lplXt7+/iTohe6Bqn8VZXqYznQF1DJZdoEesw/AIvkDt10d6Kh5l77GiRoYHP5Z4YrG8zEDXm2q4sdDG/bD3ywESi3yyIniblngeSeuCLdZRBd1n/w=
Received: from MW4PR04CA0318.namprd04.prod.outlook.com (2603:10b6:303:82::23)
 by DM5PR1201MB2537.namprd12.prod.outlook.com (2603:10b6:3:eb::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Wed, 27 Apr
 2022 02:00:15 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::76) by MW4PR04CA0318.outlook.office365.com
 (2603:10b6:303:82::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12 via Frontend
 Transport; Wed, 27 Apr 2022 02:00:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com;
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Wed, 27 Apr 2022 02:00:15 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 26 Apr
 2022 21:00:11 -0500
Received: from Ryan-AMD.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Tue, 26 Apr 2022 21:00:04 -0500
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
Subject: [PATCH v3] drm/amdgpu: Disable ABM when AC mode
Date: Wed, 27 Apr 2022 09:50:14 +0800
Message-ID: <20220427015014.1574848-1-tsung-hua.lin@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220324231000.4072275-1-tsung-hua.lin@amd.com>
References: <20220324231000.4072275-1-tsung-hua.lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f6202813-9432-4767-7566-08da27f1ac0c
X-MS-TrafficTypeDiagnostic: DM5PR1201MB2537:EE_
X-Microsoft-Antispam-PRVS: <DM5PR1201MB2537B0A845F498983B6A8F0AB2FA9@DM5PR1201MB2537.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dLLre3jFLjLbtd2l9zL/GFOi9XQfeb2so8VTWl6w//rb84SVB9ohFatdA/Y5luBOH7ce4PwpBmPhm3W2ZPyVZ1Vrwq0l9coSfVYkdz8r30+7zg7uN8BzA0wsxiKg0ZxhtVfpYc+tutEK+OsJooF7ydmnK65C7Ca4OcvMb2dM0gngSpsBr7IZCWTVQ0q+Vf8d5XFtqaqBx+bFvfUflW7TF/TdbfwCQ7rfNZnRNQwxPIPM9P0BhGdwf7/6oeboUSJHtyoVzrxBFgzN7PemeVIZi/radQDFj5y5jSXge68GH9lIlR/khsqE6BqagpoAV0DwAOD8ySf0pmHlvJo0jLKiEic86eS2g0EWipc/aek55baS6KH2+T511mHVPaxL3nHIKE3nTnpc41R22reqk5xw+cyNM40UJuRqzTdzCHytrOa8hkVbNhyuiKMtIFhmo03K+Hv4w42lvUWjVWyG2VsxOMR/Ax/fQOhpi5unI8wPbZrPKT3Fv9qSO5zKq6Z44f9pv0e5FesiPl4NSeF0ufma0O8wRL+851aaP23NR2qJI9gd9DWyP1wPTXPoGT399aGtIStag+vxxY3DZ7emSKjB7Chsm7QvOOKuCj4+qEo1aBHF0XQPpT8+5+rAAzDL43iFx4t0AFqQfCgrlbpHe3EGdZpBQ4YRIkmnqhg34rn5mirD/p0JOjBV/IjnklAHgrURvKMi19nPk0wdzrHPz3cLT/eMnhdTuX1uEdCFrgT1NXiPub68PlOIgZFY5jHl8ZzSwqEhhMHueL1R7nw7fa5Bug==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(70206006)(508600001)(81166007)(2616005)(86362001)(7696005)(921005)(2906002)(356005)(6666004)(83380400001)(5660300002)(336012)(1076003)(426003)(47076005)(8676002)(70586007)(186003)(26005)(82310400005)(40460700003)(8936002)(36860700001)(110136005)(36756003)(316002)(36900700001)(2101003)(83996005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Apr 2022 02:00:15.1570 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f6202813-9432-4767-7566-08da27f1ac0c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB2537
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

Signed-off-by: Ryan Lin <tsung-hua.lin@amd.com>

---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      |  3 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |  1 +
 drivers/gpu/drm/amd/display/dc/dce/dmub_abm.c | 61 +++++++++++--------
 drivers/gpu/drm/amd/include/amd_acpi.h        |  1 +
 4 files changed, 41 insertions(+), 25 deletions(-)

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
-- 
2.25.1

