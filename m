Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D2124EA9E6
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 10:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2D1910E7DE;
	Tue, 29 Mar 2022 08:56:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2078.outbound.protection.outlook.com [40.107.93.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C9A10E7DE;
 Tue, 29 Mar 2022 08:56:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZStBgwS/Vu2XTfWH4dMdCRM3h8HvCvqnacTTPSaHqH01JMuxt34jlJQvqnuBXpEUroa1KwFixYMmGR6Uc/EC7PejdVTP2MVKu3B//oYy2S/62VpPO6Zo36q7/T+M9RYo3pMBTFSKu3cpygFfCw1hhJK9KYxFzAxzfPafVLWdvpTJKrCauTnftw+cfthjCAC0Zewa1H5XUJK2Ku8BqthLj9OLDPaKJkYHfNloILjT2y0zmDTYIZCqVtvM4CLNYVLSM0W3jhG15tVCxwEZ5rVyQHpSBoUepxS6xP3/iwOFYgt5XsnDg2ek9+79nNBvUECOeGqi+nwppjrR8WWMLRHw9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7cdNvjGmPncYB3FtWQMxF6n1KdxlTvjHr62o9ewKktw=;
 b=e4g/QG0uTfhSX0vSnHI0P5SM0qniqMSWMRcjYOHY786LqyuzGN3QS6m2kH8FpZ5on3eF3y935ZJse4TGmkHmSKKq6q+gek6TFOaIK2ArTlm54V2eUhyjULtwdfPx0RIohOGu8hD7Yn7+ENmXH1FhYUGQ7XXOz6xvQvw+QL5bBDaC7U+vmysqiFRwL5oANkKkRAxfyt1K42uCh6YlgisOnQ+LK1B/3K+f8Y4CwVIn/4oCpwsndg+/EsAAqvhqkH6oahCCsaxr7VZE4ypTGD/CNyETMIzn1JNCEAP8B4zK7r2HK9ii0GiI78RvgtKC6ILR8sqM4hFvLM6whvD0sMfVXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7cdNvjGmPncYB3FtWQMxF6n1KdxlTvjHr62o9ewKktw=;
 b=b0aGD5rpgq9hfeetH4jg9XlswttuVwDm+zSEKWoV14mXOz5cejhdlwKJo1e3l03W7xvBS57J7L5y/jGfyhIrmCbmVVxBA2UIrA5tmUOwiGUru2a+FKpk6MHYIzgZo6t84xhm0/GFJVZ2NlqrRlcmrP6LKBgpOs9UjTQuzlCzEt8=
Received: from BN0PR04CA0033.namprd04.prod.outlook.com (2603:10b6:408:e8::8)
 by BYAPR12MB3031.namprd12.prod.outlook.com (2603:10b6:a03:d8::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.22; Tue, 29 Mar
 2022 08:56:47 +0000
Received: from BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e8:cafe::25) by BN0PR04CA0033.outlook.office365.com
 (2603:10b6:408:e8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18 via Frontend
 Transport; Tue, 29 Mar 2022 08:56:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT062.mail.protection.outlook.com (10.13.177.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.17 via Frontend Transport; Tue, 29 Mar 2022 08:56:46 +0000
Received: from SATLEXMB07.amd.com (10.181.41.45) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 29 Mar
 2022 03:56:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB07.amd.com
 (10.181.41.45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 29 Mar
 2022 01:56:45 -0700
Received: from Ryan-AMD.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Tue, 29 Mar 2022 03:56:37 -0500
From: Ryan Lin <tsung-hua.lin@amd.com>
To: 
Subject: drm/amdgpu: Disable ABM when AC mode
Date: Tue, 29 Mar 2022 16:52:36 +0800
Message-ID: <20220329085239.157527-1-tsung-hua.lin@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220324231000.4072275-1-tsung-hua.lin@amd.com>
References: <20220324231000.4072275-1-tsung-hua.lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f051ddf4-076b-4cdd-5499-08da11620dde
X-MS-TrafficTypeDiagnostic: BYAPR12MB3031:EE_
X-Microsoft-Antispam-PRVS: <BYAPR12MB3031209DDB5DB70C1EE8236AB21E9@BYAPR12MB3031.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5TlyZP6XBQ5DmR/Liy+4fccNsp1JHe2UwiHlXVUazIPjS7vyQCtbWRHxe3Pf19hAs93P9o6bmmQ+stJq7laggI2597uGP3P7JynmE2JOsD9lsVyNaHfGkspJtylSYus44odL9pNKP9zO9lBFhJg3Fga3+HK5I2MAsBIyKU52t7cTdsck+jbCyDc8sqJMwqqk5+2et6c8m2ij0v048Fm7nrZbgJVV3xLLZRagLgl52STbdd+no/B7ze6xOwmMzpSloKx/jdKYCKYHO4SnBhMqCv2wF4E6mQgfA3FVjzK3zOMXQrpDxI08K0WejvyejzUYJFYHxj1Sy1YCxFO0IaQRL/Ri9oIGCpTJ4w8zgILhD16XMeL3039G7HixTvNPJspblE4b3RGoZdp8BVnScp78qzRuiCBzalQjAYPKhhjNP8SU1+xoR7rmjaWVLEJCO9LPnIJJyvSpnMgTyavQX/jpr3UJ95Y99atFQZAJTLEVysL23grpAYQry44UKeVCfYS4vPmsZRDDd4WBKRrkokj6mHoGZkOTKAlSviFTkdxUt4py0LZsEQta3Ckftc4Ea70xDBvXy7I3EYjeCu2raav9w58oWX7nUzCrb85n79isAEr43opAL2x5H5xFxu+vGNsxrRp12IvhPv+l0W1ypOpbFBGePX2EL7wnmq6u1FIHH6QCxYOe0LjBagBmNPQpBVCB7o0RXhKasi0SqEkRRpTMut044CShEcT9cOIOFsbCv2k=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(83380400001)(356005)(8936002)(5660300002)(70206006)(4326008)(2906002)(36756003)(81166007)(47076005)(426003)(336012)(36860700001)(70586007)(82310400004)(1076003)(109986005)(508600001)(26005)(86362001)(186003)(2616005)(8676002)(54906003)(7696005)(40460700003)(316002)(266003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Mar 2022 08:56:46.2706 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f051ddf4-076b-4cdd-5499-08da11620dde
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT062.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3031
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Jake Wang <haonan.wang2@amd.com>,
 David Airlie <airlied@linux.ie>, Leon.Li@amd.com,
 Lijo Lazar <lijo.lazar@amd.com>, dri-devel@lists.freedesktop.org,
 Wyatt Wood <wyatt.wood@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 Jack Zhang <Jack.Zhang1@amd.com>, amd-gfx@lists.freedesktop.org,
 Leo Li <sunpeng.li@amd.com>, Sean Paul <seanpaul@chromium.org>,
 =?UTF-8?q?St=C3=A9phane=20Marchesin?= <marcheu@chromium.org>,
 Evan Quan <evan.quan@amd.com>, shaoyunl <shaoyun.liu@amd.com>,
 Pratik Vishwakarma <Pratik.Vishwakarma@amd.com>,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Ryan Lin <tsung-hua.lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, Po-Ting Chen <robin.chen@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Disable ABM feature when the system is running on AC mode to get
the more perfect contrast of the display.

v2: remove "UPSTREAM" from the subject.

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

