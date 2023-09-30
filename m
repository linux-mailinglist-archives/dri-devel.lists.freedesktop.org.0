Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 641C97B3F6C
	for <lists+dri-devel@lfdr.de>; Sat, 30 Sep 2023 10:39:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CFD410E1DC;
	Sat, 30 Sep 2023 08:39:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2077.outbound.protection.outlook.com [40.107.92.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BDA910E1D3;
 Sat, 30 Sep 2023 08:39:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SR7sRnOYZbJZ/+l9NndkUrYN4LrkBWEoJgMHjUKcAuxIIKnSqYzYGaYCS8XC6NBsczweaow31KniylSI5ur33vK5jz0pTCI7JXrYZjA9WDAzUa0/MP9/2M6gbqI28it5akw5V2uRZYWOprWKzT5HKRqWCf7g+YZx9vDjtq106J1mUP2WI6UV8oFX9Uh0BQkXa8n+JaEH31HZzidO801YncJI/CO6zHXrSMfIS0JYs1VC8/KaZh9s/M5Ya88eB2UWFCb2Rex1nExYHI9JM59EvaKb5X40Hd/RpjDaZXFgokugPKjt0x1U6+vo/OjAbHtoWP1HLyL2eGT43nLmM9WEKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IooPqTUNIYSRAMfK5KoaGKxDsRf6f54aVVwxJtYzgHQ=;
 b=LF49muYReZ31wuBD1KoC7PSOZIyb8sjNGTwkKQL3OAESKTbIswNjfocMH39zkPFDaOUEn+p5XYc8hpe1JyKnWX61DdGi2Y0TbwPiiJRFYttfua4F5Y2n4qjjWwW/bDQqaZLWFKtWflomeEEDVJpVXufewM6bBbkytJp0N6FDbFW3cdZtIC4O9pqKwmkHz3gTAcvAPi6K3emS0sCX5uBbXkL5+Qdj+v1J1NELZdfcBIUgDNMp/zjG5i4pVlLI98N40iP1aDpouk56Pdbdk28P38+laaCRTJiOv9TqABvIS4qo0rWgWC0/6oxMmS0+llccKFxnF/ZMP0ks564+BzemLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IooPqTUNIYSRAMfK5KoaGKxDsRf6f54aVVwxJtYzgHQ=;
 b=kHHPWlKeUSgT7i/RSPS7je8KcVsVikQD2JKSxtkAHiFjQwwMHMS+lf0xYXM5HQZ3lvVyop5ZTUEnNp8hh9KLOs/KalIwgdJOkdCnrutoXsZz1xpgkZXJa+xZdTCWXEWQPHpyUtG64yconx4dzPjm3J9MavEArmii55LvGtlAuSU=
Received: from BL1PR13CA0027.namprd13.prod.outlook.com (2603:10b6:208:256::32)
 by MW4PR12MB6999.namprd12.prod.outlook.com (2603:10b6:303:20a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.39; Sat, 30 Sep
 2023 08:39:29 +0000
Received: from BL6PEPF0001AB78.namprd02.prod.outlook.com
 (2603:10b6:208:256:cafe::d2) by BL1PR13CA0027.outlook.office365.com
 (2603:10b6:208:256::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.17 via Frontend
 Transport; Sat, 30 Sep 2023 08:39:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB78.mail.protection.outlook.com (10.167.242.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.14 via Frontend Transport; Sat, 30 Sep 2023 08:39:28 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Sat, 30 Sep
 2023 03:39:24 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v2 13/16] platform/x86/amd/pmf: Add PMF-AMDGPU set interface
Date: Sat, 30 Sep 2023 14:07:12 +0530
Message-ID: <20230930083715.2050863-14-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
References: <20230930083715.2050863-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB78:EE_|MW4PR12MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: 9db22f12-19ef-47bb-54a4-08dbc190c2c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ol6WRkWpTZyIe984bcOvyzlmV7oeSX1AW4r7q0I6H2CXwtUmoXOJy0fMAj8Z8ndOmjNQF6Yfqp8uJOsJE4SiIKWrMX+3MPfN4cJIIJFpT/fIxevJtQ6kZzT5OrpY8HfGlSGB8cw1n7HKw+T2RoOxE6SSLJqHWODQkwnHa09w6EDeAkGXFHx2ComqL+xhF0WBA3MbDiBSgOByDRd/1Xtr6nJgZ0uI7EewFPComt6XCQtOE0NsW++tltKv9o39GKx3BJqTLcOzeX1D6eZjzh1tQGPcveTA5hJUE3aHhi5WKSvIwlWlIbFVzFqHfg7VqXXtPqLKOai12gTqz3zmA5jggwiPTbA6lRYba5pPxsw9LtpTfmFiYargpnQtRoT8OSZpm0+FoLwMTrqj6vjL1AP6hTfzveMiEx2IVRkiJ/i5BokKd5qYxQiISwgjdjeWUreHH1dsVoS5ik+iInBFanhrMkmfJkigZIGMBkvhk6t0oMTAL0c37vhDRyx+5k7pTS6XFVFmZwUqkEYmYd1sB2gBCv/ax9FixrtyAvYIJzcS4VaXZPQjm6YLg41g5E9WsVUiC1l+EzDUYAy8r+tWwhnzZgAtT1pnZizNvKljcnuso29D1SndgfFjgpKA2lQTubd/pfiBiAkX0H8VQaC91DOts/KYTN3AmXBr0GMpR8oVXNnjKH9rnxGC0ReD+75tKrVchdzAybbk0Wsz/yr1uCQ/+vT6WZO8YS+l1brsKnuOse0XNHsaV6u9AH3SpL2Qtx4PLuIndtd5FQ/BKge9oO17ZSmAKT9yRhEEoZJm0cHf1/I=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(39860400002)(376002)(396003)(136003)(230922051799003)(82310400011)(1800799009)(64100799003)(451199024)(186009)(36840700001)(40470700004)(46966006)(7696005)(2616005)(83380400001)(478600001)(6666004)(47076005)(8676002)(54906003)(426003)(7416002)(26005)(2906002)(8936002)(316002)(110136005)(5660300002)(70206006)(70586007)(41300700001)(4326008)(40460700003)(36756003)(1076003)(16526019)(336012)(921005)(86362001)(40480700001)(82740400003)(81166007)(36860700001)(356005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2023 08:39:28.9424 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9db22f12-19ef-47bb-54a4-08dbc190c2c0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB78.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6999
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
Cc: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Patil.Reddy@amd.com, linux-input@vger.kernel.org, mario.limonciello@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For the Smart PC Solution to fully work, it has to enact to the actions
coming from TA. Add the initial code path for set interface to AMDGPU.

Change amd_pmf_apply_policies() return type, so that it can return
errors when the call to retrieve information from amdgpu fails.

Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 18 ++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h      |  2 ++
 drivers/platform/x86/amd/pmf/tee-if.c   | 21 +++++++++++++++++++--
 3 files changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
index 45a079c028d3..803e6bb66914 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
@@ -61,6 +61,23 @@ int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf)
 }
 EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
 
+static int amd_pmf_gpu_set_cur_state(struct thermal_cooling_device *cooling_dev,
+				     unsigned long state)
+{
+	struct backlight_device *bd;
+
+	if (!acpi_video_backlight_use_native())
+		return -ENODEV;
+
+	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
+	if (!bd)
+		return -ENODEV;
+
+	backlight_device_set_brightness(bd, state);
+
+	return 0;
+}
+
 static int amd_pmf_gpu_get_cur_state(struct thermal_cooling_device *cooling_dev,
 				     unsigned long *state)
 {
@@ -101,6 +118,7 @@ static int amd_pmf_gpu_get_max_state(struct thermal_cooling_device *cooling_dev,
 static const struct thermal_cooling_device_ops bd_cooling_ops = {
 	.get_max_state = amd_pmf_gpu_get_max_state,
 	.get_cur_state = amd_pmf_gpu_get_cur_state,
+	.set_cur_state = amd_pmf_gpu_set_cur_state,
 };
 
 int amd_pmf_gpu_init(struct amd_gpu_pmf_data *pmf)
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 97cadd080742..59329308ed8e 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -75,6 +75,7 @@
 #define PMF_POLICY_STT_SKINTEMP_APU				7
 #define PMF_POLICY_STT_SKINTEMP_HS2				8
 #define PMF_POLICY_SYSTEM_STATE					9
+#define PMF_POLICY_DISPLAY_BRIGHTNESS				12
 #define PMF_POLICY_P3T						38
 
 /* TA macros */
@@ -482,6 +483,7 @@ enum ta_pmf_error_type {
 };
 
 struct pmf_action_table {
+	unsigned long display_brightness;
 	enum system_state system_state;
 	unsigned long spl; /* in mW */
 	unsigned long sppt; /* in mW */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 9216c2065fd3..d20821c914c7 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -78,9 +78,11 @@ static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
 	return 0;
 }
 
-static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
+static int amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
 {
+	struct thermal_cooling_device *cdev = dev->gfx_data.cooling_dev;
 	unsigned long val, event = 0;
+	unsigned long state;
 	int idx;
 
 	for (idx = 0; idx < out->actions_count; idx++) {
@@ -160,8 +162,21 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 				dev->prev_data->system_state = 0;
 			}
 			break;
+
+		case PMF_POLICY_DISPLAY_BRIGHTNESS:
+			if (!dev->gfx_data.gpu_dev_en)
+				return -ENODEV;
+
+			cdev->ops->get_cur_state(cdev, &state);
+			if (state != val) {
+				cdev->ops->set_cur_state(cdev, val);
+				dev_dbg(dev->dev, "update DISPLAY_BRIGHTNESS : %lu\n", val);
+			}
+			break;
 		}
 	}
+
+	return 0;
 }
 
 static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
@@ -198,7 +213,9 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
 		amd_pmf_dump_ta_inputs(dev, in);
 		dev_dbg(dev->dev, "action count:%u result:%x\n", out->actions_count,
 			ta_sm->pmf_result);
-		amd_pmf_apply_policies(dev, out);
+		ret = amd_pmf_apply_policies(dev, out);
+		if (ret)
+			return ret;
 	}
 
 	return 0;
-- 
2.25.1

