Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5C052B114
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 06:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D1AA10F902;
	Wed, 18 May 2022 04:08:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2086.outbound.protection.outlook.com [40.107.244.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9911410E2BA;
 Wed, 18 May 2022 04:08:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RS0HH5Xq2jHmD13R1QlCk9LgaESK+N6Yet27U83uDd9+pCSTqCryMKqVyM2DaMvf8QRHkhcCMzfVKwrpq69KC/DDKbM6H7gkP1o/Lw3PaFktK1XoyaLgMHkeOY2suedKOsFveazVP9rBanG7xUgSvxjM4A9TZ5m9VmfWoNUPClomMRfd1k7PKee6nrV+AFF7+i+iuBFoCgnTyA1DNo/E11NpaLgslM5+HopWmEiPPsgDStrAogXx8n0odP1xuYY64pA3qUDnaHhfTgb9NH1ak7iKP4gom4O+yH47mfgu3hTZEOlARhUGIKP33v9y9HatBjgU7j2IcxKruQ9ceNw2Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l3x5MTjHwGwO0Hs9jDIeW8iNQbLARhrnkzjj7qvQZzk=;
 b=bcVLZHEUoVFWgAZ97qVpPhcomIMPSI+7xH7UempJOT2L/CcD5+4GnZK0U9UrQBscZRK4nxSjJ3vXENfcPD48yZiVHYD2UM4gbss+FCf0DFGGYzYj6G4MTTh8UJQEWlLq24UcrGAcIDJVrJUA0VxIOqFFiiPQWDxp8Bo3NNDtOttMKyLQOL4GeoucqB24i1600vwAkYPSmkPrTb8newgcRbq3gO4kfTEUk4Bd4jmQhpuvZFnfHEipXzu31aBxhI8ua73HkLdLGwDr7ZnFdCxZau/u4PR5CH+0MK+8lJdxOUSk3PRnpy8sqftqEMaBVqWwECX1KXwLGcPvv7s0GxO/eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.ie smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l3x5MTjHwGwO0Hs9jDIeW8iNQbLARhrnkzjj7qvQZzk=;
 b=A5x2rsOLtVeX2mTYrAyKD4HEQNqfNNJMUeL1R0k+Oq2QiHpkmViBRQ7ObeY4IDh01iC6BPPHMn9vWXA3eC+c5++v7yT/jN72y2CXKB9rBRs8tbqUHUY9DAnOqH7W6bUiSB3KgKFXWcbNGGj2VyctQakQH6cJe4EH+jSP/aJgu4g=
Received: from MW3PR05CA0017.namprd05.prod.outlook.com (2603:10b6:303:2b::22)
 by MWHPR12MB1295.namprd12.prod.outlook.com (2603:10b6:300:11::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.15; Wed, 18 May
 2022 04:07:59 +0000
Received: from CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:2b:cafe::8d) by MW3PR05CA0017.outlook.office365.com
 (2603:10b6:303:2b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.5 via Frontend
 Transport; Wed, 18 May 2022 04:07:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CO1NAM11FT052.mail.protection.outlook.com (10.13.174.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Wed, 18 May 2022 04:07:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 17 May
 2022 23:07:58 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 17 May
 2022 23:07:58 -0500
Received: from Ryan-AMD.amd.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.24 via Frontend
 Transport; Tue, 17 May 2022 23:07:48 -0500
From: Ryan Lin <tsung-hua.lin@amd.com>
To: 
Subject: [PATCH v5] drm/amdgpu: Disable ABM when AC mode
Date: Wed, 18 May 2022 08:40:14 +0800
Message-ID: <20220518004018.311332-1-tsung-hua.lin@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220324231000.4072275-1-tsung-hua.lin@amd.com>
References: <20220324231000.4072275-1-tsung-hua.lin@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 29e00be7-4987-4d34-5cf5-08da3883ff1a
X-MS-TrafficTypeDiagnostic: MWHPR12MB1295:EE_
X-Microsoft-Antispam-PRVS: <MWHPR12MB12956D939A0C5B146318FF41B2D19@MWHPR12MB1295.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NvzN3tId/JRx4Ps+oXD0eMcttM9ObYf5vrDv4YBx0bVmUTtO6WyCUzm8pLz34+AAXpaDP8wfc/u96WFkLLSg4d4ueth97RH32dCY6VVVBngbAE+zXYeEGntVp8nVTn5ocOlGLNMjsXbwIaRLceJs31180UHO0GGrEEVX8uwgZO8Qg9kJJMtHy9JcfCuefkI1z14HKPXkSPxcQsdHgSAerbtPUKNlDUSoONllfXxKQI8s6hi1SKKKhuI/t5hs4DWCnGkGrKrAgJ01JeBg9xKRLyxqzmog8APqliCIt01XQbpJv8LXJH9CdbifuhosBqLTAnpD5RvtEh3b+Sm/u2t7mt+F77oyMZCJZXfckwBk30Ury+XpoGnZ0Gh2Du5omUE/Ts2KWoyScmQso3pvIrQmFptVqkKJKm8IpEPXobwmEpshJIkDDBSBQOHwt12/jschVmrX2Scp0ffDmjV7S/2BrUZfULMSHEzcrIoWdKSsdm7aNSZFo+rgXLATXoFbLUy4Lx62Z9RDuEyDg7eGVgisIl3TOxzPQRIlkzLTVdjcgJVnadWl6OxaJbQ3TVSPYQA+AxnEcPOJGfn/seon6dax0bSGQ8a/e9J64qoOoI0Saq+ElWadvJOyBlpZ8PU5eVQI9kwcHROj5cCRbRZ9WIsKpeSniXqJJ8Wx+2Wn5Bngt7OlLSl7m8LfPO8NDKF872g3Niqs8Je6zPjGR3bqlnXt0ZZfNiS3lO8J9lVv8vCVazU=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(7416002)(109986005)(70206006)(1076003)(508600001)(5660300002)(8676002)(4326008)(316002)(36756003)(54906003)(426003)(2616005)(86362001)(82310400005)(81166007)(336012)(47076005)(40460700003)(83380400001)(36860700001)(2906002)(6666004)(26005)(8936002)(356005)(70586007)(7696005)(186003)(266003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2022 04:07:59.6260 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29e00be7-4987-4d34-5cf5-08da3883ff1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT052.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1295
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
Cc: Jake Wang <haonan.wang2@amd.com>, David Airlie <airlied@linux.ie>,
 leon.li@amd.com, Lijo Lazar <lijo.lazar@amd.com>,
 Shirish S <shirish.s@amd.corp-partner.google.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Huang Rui <ray.huang@amd.com>, Eric Huang <jinhuieric.huang@amd.com>,
 Likun Gao <Likun.Gao@amd.com>, Jun Lei <Jun.Lei@amd.com>,
 Jimmy Kizito <Jimmy.Kizito@amd.com>, Rodrigo
 Siqueira <Rodrigo.Siqueira@amd.com>, amd-gfx@lists.freedesktop.org,
 Rouven Czerwinski <rouven@czerwinskis.de>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 Robin Singh <robin.singh@amd.com>, Stylon Wang <stylon.wang@amd.com>,
 Yifan Zhang <yifan1.zhang@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Wenjing Liu <wenjing.liu@amd.com>, Nikola Cornij <nikola.cornij@amd.com>,
 Sean Paul <seanpaul@chromium.org>, Chris Park <Chris.Park@amd.com>,
 Mikita Lipski <mikita.lipski@amd.com>, Ching-shih.Li@amd.com,
 Pratik Vishwakarma <Pratik.Vishwakarma@amd.com>,
 Sathishkumar S <sathishkumar.sundararaju@amd.com>, Roy Chan <roy.chan@amd.com>,
 Linux Patches Robot
 <linux-patches-robot@chromeos-missing-patches.google.com.iam.gserviceaccount.com>,
 Chengming Gui <Jack.Gui@amd.com>, Jiri Kosina <jkosina@suse.cz>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Roman Li <Roman.Li@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jude Shih <shenshih@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Ryan Lin <tsung-hua.lin@amd.com>, Hawking Zhang <Hawking.Zhang@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Disable ABM feature when the system is running on AC mode to get the more
perfect contrast of the display.

v2: remove "UPSTREAM" from the subject.

v3: adv->pm.ac_power updating by amd gpu_acpi_event_handler.

v4: Add the file I lost to fix the build error.

v5: Move that function of the setting abm disabled from DC to amdgpu_dm.

Signed-off-by: Ryan Lin <tsung-hua.lin@amd.com>

---
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c        |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c      |  1 +
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c   | 17 +++++++++++++++++
 drivers/gpu/drm/amd/display/dc/core/dc_link.c   | 10 ++++++++++
 drivers/gpu/drm/amd/display/dc/dc_link.h        |  2 ++
 drivers/gpu/drm/amd/include/amd_acpi.h          |  1 +
 drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h         |  1 +
 7 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index 4811b0faafd9..6ac331ee4255 100644
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
index abfcc1304ba0..b959d256ce46 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
@@ -3454,6 +3454,7 @@ int amdgpu_device_init(struct amdgpu_device *adev,
 
 	adev->gfx.gfx_off_req_count = 1;
 	adev->pm.ac_power = power_supply_is_system_supplied() > 0;
+	adev->pm.old_ac_power = false;
 
 	atomic_set(&adev->throttling_logging_enabled, 1);
 	/*
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 87283e2da8c1..1ed1f2d00350 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -3652,6 +3652,11 @@ amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
 }
 #endif
 
+static void amdgpu_dm_abm_set_level(struct amdgpu_display_manager *dm, int level)
+{
+	dc_link_set_abm_level(dm->backlight_link[0], level);
+}
+
 static int initialize_plane(struct amdgpu_display_manager *dm,
 			    struct amdgpu_mode_info *mode_info, int plane_id,
 			    enum drm_plane_type plane_type,
@@ -9072,6 +9077,9 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 		hdr_changed =
 			!drm_connector_atomic_hdr_metadata_equal(old_con_state, new_con_state);
 
+		if (adev->pm.ac_power)
+			dm_new_crtc_state->abm_level = 0;
+
 		if (!scaling_changed && !abm_changed && !hdr_changed)
 			continue;
 
@@ -9220,6 +9228,15 @@ static void amdgpu_dm_atomic_commit_tail(struct drm_atomic_state *state)
 			amdgpu_dm_backlight_set_level(dm, i, dm->brightness[i]);
 	}
 #endif
+
+	if (adev->pm.ac_power != adev->pm.old_ac_power) {
+		if (adev->pm.ac_power)
+			amdgpu_dm_abm_set_level(dm, 0);
+		else
+			amdgpu_dm_abm_set_level(dm, amdgpu_dm_abm_level);
+		adev->pm.old_ac_power = adev->pm.ac_power;
+	}
+
 	/*
 	 * send vblank event on all events not handled in flip and
 	 * mark consumed event for drm_atomic_helper_commit_hw_done
diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
index fb012ecd23a1..5edcf2a9dc4e 100644
--- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
+++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
@@ -2616,6 +2616,16 @@ int dc_link_get_backlight_level(const struct dc_link *link)
 		return DC_ERROR_UNEXPECTED;
 }
 
+int dc_link_set_abm_level(const struct dc_link *link, int level)
+{
+	struct abm *abm = get_abm_from_stream_res(link);
+
+	if (abm != NULL && abm->funcs->set_abm_level != NULL)
+		return (int) abm->funcs->set_abm_level(abm, level);
+	else
+		return DC_ERROR_UNEXPECTED;
+}
+
 int dc_link_get_target_backlight_pwm(const struct dc_link *link)
 {
 	struct abm *abm = get_abm_from_stream_res(link);
diff --git a/drivers/gpu/drm/amd/display/dc/dc_link.h b/drivers/gpu/drm/amd/display/dc/dc_link.h
index 83845d006c54..b69a114ce154 100644
--- a/drivers/gpu/drm/amd/display/dc/dc_link.h
+++ b/drivers/gpu/drm/amd/display/dc/dc_link.h
@@ -258,6 +258,8 @@ bool dc_link_set_default_brightness_aux(struct dc_link *link);
 
 int dc_link_get_backlight_level(const struct dc_link *dc_link);
 
+int dc_link_set_abm_level(const struct dc_link *link, int level);
+
 int dc_link_get_target_backlight_pwm(const struct dc_link *link);
 
 bool dc_link_set_psr_allow_active(struct dc_link *dc_link, bool enable,
diff --git a/drivers/gpu/drm/amd/include/amd_acpi.h b/drivers/gpu/drm/amd/include/amd_acpi.h
index 2d089d30518f..2d9aad582985 100644
--- a/drivers/gpu/drm/amd/include/amd_acpi.h
+++ b/drivers/gpu/drm/amd/include/amd_acpi.h
@@ -25,6 +25,7 @@
 #define AMD_ACPI_H
 
 #define ACPI_AC_CLASS           "ac_adapter"
+#define ACPI_BATTERY_CLASS	 "battery"
 
 struct atif_verify_interface {
 	u16 size;		/* structure size in bytes (includes size field) */
diff --git a/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h b/drivers/gpu/drm/amd/pm/inc/amdgpu_dpm.h
index f6e0e7d8a007..de459411a0e8 100644
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

