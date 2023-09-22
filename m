Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA3A7AB865
	for <lists+dri-devel@lfdr.de>; Fri, 22 Sep 2023 19:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5CD10E6F1;
	Fri, 22 Sep 2023 17:53:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2070.outbound.protection.outlook.com [40.107.94.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DE910E6F0;
 Fri, 22 Sep 2023 17:53:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=llr9pIBpWj5mMoayltF6z0STF/bVF5m3SBbkzLAfj5yEbJou78/U3eI2+JuF8xUAMqgRrsjU1MY9L5Ak4ZJgS5cho9m3mn1nIDJGHIAwG2eSRd0BlE5OmWwuvt+Xa5DJtNQPUFXLrx85xOT5GeCHTTghZinelgkkCjMYqVsnNU1TnpxCTn2xl8ea1Li350Wo+7mQ62PNEoLxpZfW9kaSmkP0IcS1FPEoDPjaYR9MyiKNasEowG6qgQiKLcmvdXdm4HAcor8hpW22PqPzYlcWjt1+O3xlcBtULG5tdqcsKacpkogIU00VbN7tsYQvEd5bWoxMdLPB6s03G9DLlE+Cjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OXkbVhQ7IKBoM4wQ6XXY6ozTN/ug3ZSnz4TrGE1a/0E=;
 b=bFEJ4swtxUY9aU4fE/Kbq/jk7+dP6BhhTFa38OH8AZqghCZEt0AWNlCMMka0P7psZCchIauLy+oJGrr0p93UbfQJZpKe07LfZoqiinIAxFCCt/34g+bFmi00aaj69N7Kqj7SOK+HV2/kdD2k55trgPGkqsfCwTFDvYvo7s+4o8tisLXz3X51CiVZDubDDREXtm11tewr1Bi0gGGivcM2rNqvP7rA44LdGbHQlTRa/8YQwmtCgfP1Am7j4NWD6zwMIAjAZWPAZsxL50cnww+cq3NIZBQzbvZz4MDHQbN+M4EhcIMIGmsS95bGIBqyAMWdoCJ6oS0Xg4O1/9Eteh1y3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OXkbVhQ7IKBoM4wQ6XXY6ozTN/ug3ZSnz4TrGE1a/0E=;
 b=rf4xfh7Z/KgNlqesUqD4/jNzmAF1Gb9X604kGf/dvGo4e4xhfFBEsTtB3R9fCDLOTL2uUDni1tMbcPhXssxiGRpS2koH3igVKDs+zv6RWV00vuSCf0vmuwPTAVKE6X0SVwIt7eFiXMiiL1x78Ii1cQZDFMhYNlKG0+aFsOzU85E=
Received: from BY3PR04CA0025.namprd04.prod.outlook.com (2603:10b6:a03:217::30)
 by CH2PR12MB4860.namprd12.prod.outlook.com (2603:10b6:610:6c::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.23; Fri, 22 Sep
 2023 17:53:05 +0000
Received: from MWH0EPF000971E4.namprd02.prod.outlook.com
 (2603:10b6:a03:217:cafe::8d) by BY3PR04CA0025.outlook.office365.com
 (2603:10b6:a03:217::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.31 via Frontend
 Transport; Fri, 22 Sep 2023 17:53:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E4.mail.protection.outlook.com (10.167.243.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Fri, 22 Sep 2023 17:53:03 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 22 Sep
 2023 12:52:57 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <basavaraj.natikar@amd.com>, <jikos@kernel.org>,
 <benjamin.tissoires@redhat.com>, <alexander.deucher@amd.com>,
 <christian.koenig@amd.com>, <Xinhui.Pan@amd.com>, <airlied@gmail.com>,
 <daniel@ffwll.ch>
Subject: [PATCH 13/15] platform/x86/amd/pmf: Add PMF-AMDGPU set interface
Date: Fri, 22 Sep 2023 23:20:54 +0530
Message-ID: <20230922175056.244940-14-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
References: <20230922175056.244940-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E4:EE_|CH2PR12MB4860:EE_
X-MS-Office365-Filtering-Correlation-Id: 83b0c5f3-fde7-4aa1-3dec-08dbbb94c53d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rWoou7nIAzBwJ0IcSahTzFgrC+/AWpfg9tUzXP43Mv9oDMQbsbhFhcYOJ9skCjCVomSFb0P3v2N/sUc2GXQcYJ/kHYWXX6jDSP8o2A2EXwgmqHeP45H45bzUtQOsdP13fg3i6trc+MaPzdJ5hQRionLFwmXXlcNqamWEHuTzCp9pI/5EY+4tGoDMBLp4YsFDO08WgqzEGoEOH3Y2eiDrmMirvccuooJvPcDU9fgiv2VI0mNBUfXnQ9SDNB2T+PF7xiybKbAcHzxk/XrnGmPT/5u5LIyDsfV1W3UwyghkAmsijKX012HcpvrbWmw06xVJiAeHBiKIeklIyB+JvP8hEEEzaCrx7DCQJQOVt1QvCAxbTppv+TCGGJNIaQ830nDCXOIeWQ7qmaUfVcNQ4aHsEO/OcNw5D4isB84UeG34KnMr9b1lfB9m9/Uzak76Sa5N40TX2uvHN3+KZq9bkh07SRIKyjYTeiyOPwdeQma83AtTDejB+gkroYZEntwkdQxr4Xi90/lngHRlcgcJuG+kAPvJaJOsRz91VsPcEG6J5qDsRTpkyWQaWNVgViieDyLbltNvr530Df+EaMh4DBD/vQIBoJJQXgxk4I5QrX6OyL7XhEZeYgZF/zQr/uw9octQug4YoaTbgjeGitBdJ6zXPsoF9sWGG6ls4OwO9QZ3RMJ+f5tGXWCdTOzC3PzGOpBqsaAeep4vkq7ttaCZUPV2sCc5EVPIGCY0YTkBciNjf4mKFfxgLLXv8vsMOc8ZqzeuSY2CfLlNDFxVsKIw6ZfjSHgSkK96mp2gYIwLuf7PA77DAD5DoPb2875Uz2D9cfG2pr1rtlEjMCGU4Om13oKdOA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(346002)(39860400002)(376002)(136003)(186009)(230921699003)(1800799009)(451199024)(82310400011)(40470700004)(36840700001)(46966006)(8676002)(8936002)(4326008)(110136005)(5660300002)(7416002)(40460700003)(83380400001)(36860700001)(316002)(16526019)(26005)(7696005)(40480700001)(70206006)(54906003)(70586007)(82740400003)(921005)(356005)(81166007)(6666004)(41300700001)(336012)(86362001)(2616005)(47076005)(426003)(1076003)(478600001)(36756003)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2023 17:53:03.3923 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b0c5f3-fde7-4aa1-3dec-08dbbb94c53d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4860
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

Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c | 21 +++++++++++++++++++++
 drivers/platform/x86/amd/pmf/pmf.h      |  2 ++
 drivers/platform/x86/amd/pmf/tee-if.c   | 19 +++++++++++++++++--
 include/linux/amd-pmf-io.h              |  1 +
 4 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
index 232d11833ddc..5c567bff0548 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
@@ -68,3 +68,24 @@ int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf)
 	return 0;
 }
 EXPORT_SYMBOL_GPL(amd_pmf_get_gfx_data);
+
+int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf)
+{
+	struct drm_device *drm_dev = pci_get_drvdata(pmf->gpu_dev);
+	struct amdgpu_device *adev = drm_to_adev(drm_dev);
+	struct backlight_device *bd;
+
+	if (!(adev->flags & AMD_IS_APU)) {
+		DRM_ERROR("PMF-AMDGPU interface not supported\n");
+		return -ENODEV;
+	}
+
+	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
+	if (!bd)
+		return -ENODEV;
+
+	backlight_device_set_brightness(bd, pmf->brightness);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(amd_pmf_set_gfx_data);
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 9032df4ba48a..ce89cc0daa5a 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -73,6 +73,7 @@
 #define PMF_POLICY_STT_SKINTEMP_APU				7
 #define PMF_POLICY_STT_SKINTEMP_HS2				8
 #define PMF_POLICY_SYSTEM_STATE					9
+#define PMF_POLICY_DISPLAY_BRIGHTNESS				12
 #define PMF_POLICY_P3T						38
 
 /* TA macros */
@@ -480,6 +481,7 @@ enum ta_pmf_error_type {
 };
 
 struct pmf_action_table {
+	unsigned long display_brightness;
 	enum system_state system_state;
 	unsigned long spl; /* in mW */
 	unsigned long sppt; /* in mW */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 1608996654e8..eefffff83a4c 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -79,10 +79,10 @@ static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
 	return 0;
 }
 
-static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
+static int amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
 {
 	u32 val, event = 0;
-	int idx;
+	int idx, ret;
 
 	for (idx = 0; idx < out->actions_count; idx++) {
 		val = out->actions_list[idx].value;
@@ -160,8 +160,23 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 				dev->prev_data->system_state = 0;
 			}
 			break;
+
+		case PMF_POLICY_DISPLAY_BRIGHTNESS:
+			ret = amd_pmf_get_gfx_data(&dev->gfx_data);
+			if (ret)
+				return ret;
+
+			dev->prev_data->display_brightness = dev->gfx_data.brightness;
+			if (dev->prev_data->display_brightness != val) {
+				dev->gfx_data.brightness = val;
+				amd_pmf_set_gfx_data(&dev->gfx_data);
+				dev_dbg(dev->dev, "update DISPLAY_BRIGHTNESS : %d\n", val);
+			}
+			break;
 		}
 	}
+
+	return 0;
 }
 
 static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
diff --git a/include/linux/amd-pmf-io.h b/include/linux/amd-pmf-io.h
index a2d4af231362..ecae387ddaa6 100644
--- a/include/linux/amd-pmf-io.h
+++ b/include/linux/amd-pmf-io.h
@@ -25,4 +25,5 @@ struct amd_gpu_pmf_data {
 };
 
 int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf);
+int amd_pmf_set_gfx_data(struct amd_gpu_pmf_data *pmf);
 #endif
-- 
2.25.1

