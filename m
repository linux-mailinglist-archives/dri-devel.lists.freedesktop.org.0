Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 976547CD521
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 09:05:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 868FF10E3A7;
	Wed, 18 Oct 2023 07:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2061d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eab::61d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE6CC10E3A8;
 Wed, 18 Oct 2023 07:05:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWzu3sIBQ5pgvfGKeURUftuiU1RSlzNISuCojYe+sK2QiYVq0hbGGfQu+KJ0sWmSCKCjWMUKJh8NfA0Hg07F34BgwsTpuF5R3uv4bpfvLSElJXNy7z3KEvn8pNs6+d8kIyHgxBDOuXy2GNFwNSlMnUAPfwtZBDBK76DtH/ShYjzWeH50RlyVdVt6/rBcIq8DjD5RoUkVSEDze16DrNPlysPylpgW8BI+uParTdtF/X/0xgqdgiRNvrsO0jtf71FgraGpQqsrxQwlT3Vfxsvh6tkKPkSsu8lG6LEHSeqJFxC5daTvSOsGriL2R7bXYQxnxT2iHlk/voK2Hc6r8KmYQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ovycl2j8PmF13Yq6U5nRt9Sf3Tz/3ozmIpNbPmiOBDA=;
 b=PcCgzMk0GoaoLWuQo0tq2YZ+w9NRE1mBRh0froCDNdCDfcCQK6H0E7MrwM0O/WLBF/oZjTiWN4y2cLHthYZTsWQ3HlziujkVei5Dy6h+zbs2xQHAXDg5vpGpR41mXjrLwuQzu7iZR1uyoL18unGdJfFLv40/EIkpQqy57+Z0l1cKEkN7kUg5+GVvk4Z2dBcqqccd1btac8MehvoSMJzEsouchDO9QxB3BRsKPKJ4vhvj+jL93vx+YMiQ6ewvzzkmpImDoeOlylsqJaNfycZGi50VxW9ajGTV5e/LFrvVTOcXlirCTZUxTpPdVHL7DXWOhUQNHzQw3fjsmTqdnBMXXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ovycl2j8PmF13Yq6U5nRt9Sf3Tz/3ozmIpNbPmiOBDA=;
 b=FdZHASeWUmsg6H/ZEjL1DtXkHL658OrSnFT5ov6X76cLMcvpaDWe5MC7bcudxGAE2mpxzhXuE723ASL2qXyC/YuX6u/N2GR3L5DcIeXEvDfKVIFLxzSlAnOObA00c8+iG4grBlT7o2g9wFgF08a06dhy6h4F6gl7OuWPHalqmBk=
Received: from SN7P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::18)
 by CY8PR12MB8266.namprd12.prod.outlook.com (2603:10b6:930:79::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.21; Wed, 18 Oct
 2023 07:05:50 +0000
Received: from SN1PEPF0002BA4D.namprd03.prod.outlook.com
 (2603:10b6:806:124:cafe::d8) by SN7P222CA0004.outlook.office365.com
 (2603:10b6:806:124::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36 via Frontend
 Transport; Wed, 18 Oct 2023 07:05:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4D.mail.protection.outlook.com (10.167.242.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6907.20 via Frontend Transport; Wed, 18 Oct 2023 07:05:50 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 18 Oct
 2023 02:05:45 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v4 14/17] platform/x86/amd/pmf: Add PMF-AMDGPU set interface
Date: Wed, 18 Oct 2023 12:32:38 +0530
Message-ID: <20231018070241.2041529-15-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4D:EE_|CY8PR12MB8266:EE_
X-MS-Office365-Filtering-Correlation-Id: 55a01764-1fb2-47e1-757a-08dbcfa8a950
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cWFxZoIPIEiPvurqdE0cziTJg9QMOkjj0F88PTLUPpXlChYChLS18sr1ww+KieWfsIC/BpZKCqrg5prDiKQG9n0j7/kJDD/fAHWkXOxOCU/hFn5I9LmQIryKjEa5j6XAlAmyoEQ2B8TrICaEMqEwhqwl90HTYhUcT3LRyclCcYaOaIduMjPTZhVwMy6NK0oqCn1aEuoMRibOXRZw2pIxYT481OC0pdY+VEzVnxW5Xd6+yFN9emT4k4EUzCSbrH6AfX4ZNdt2LCVrUdiM0Gb6P6JejvPW2T5G9z3v5nIY+spkpYQXPBNoZj+3UX3BPOUWmShgMh7p4y7lkMC4+piUSkCpIGLG3rSTyWr2JvFGke/BmMG4ArhbB18UQnL4eTk5Xd5SgzfOxxUbgwpNkgf77tX3HPMtvOtiToqLdicQf3ozPpWTUOoyLdPp2Z2wKkwQhMilqSIxnNvp83Z6dtKVWX6C7xS02ac7IUvLkA/Z+Yh30X4RVyGOkO82/NDREwwUryr8XqinK1bZKjN4Bw1nvfqQF3m06bv0sRfP9tjbRtkFYzjs2c8C9quRlS1qtSI02mr6m58/y9n3+qBQwBkALy9NFy/G0qeNpdfDCMhQWX3YoLwrL9PAz17ZKoJQ6uKl5KXrBZqBdo1BccCBJPAI+5AMqXWQUE30ajAXFTMda2UNSSROArGyqfnH1NX5ByYcgW7L6kDqdj+gp39OiXgcxBkla6r7YCjHTtDk2AgHSpxm1OnCKHurOt7CTzafPO6QDT9upuYHMeN+q++o9J1a9Rz9VyGDiZWTc6ULtASNzJA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(136003)(346002)(376002)(230922051799003)(64100799003)(186009)(451199024)(1800799009)(82310400011)(36840700001)(40470700004)(46966006)(16526019)(336012)(426003)(36756003)(7696005)(47076005)(6666004)(478600001)(36860700001)(110136005)(70206006)(70586007)(316002)(2616005)(83380400001)(1076003)(54906003)(26005)(41300700001)(5660300002)(921005)(7416002)(82740400003)(356005)(81166007)(4326008)(8936002)(8676002)(40460700003)(2906002)(40480700001)(86362001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2023 07:05:50.4197 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55a01764-1fb2-47e1-757a-08dbcfa8a950
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002BA4D.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8266
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
index ac981848df50..57acfc32219a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_pmf.c
@@ -63,6 +63,23 @@ int amd_pmf_get_gfx_data(struct amd_gpu_pmf_data *pmf)
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
@@ -103,6 +120,7 @@ static int amd_pmf_gpu_get_max_state(struct thermal_cooling_device *cooling_dev,
 static const struct thermal_cooling_device_ops bd_cooling_ops = {
 	.get_max_state = amd_pmf_gpu_get_max_state,
 	.get_cur_state = amd_pmf_gpu_get_cur_state,
+	.set_cur_state = amd_pmf_gpu_set_cur_state,
 };
 
 int amd_pmf_gpu_init(struct amd_gpu_pmf_data *pmf)
diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
index 615cd3a31986..641af94ba378 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -75,6 +75,7 @@
 #define PMF_POLICY_STT_SKINTEMP_APU				7
 #define PMF_POLICY_STT_SKINTEMP_HS2				8
 #define PMF_POLICY_SYSTEM_STATE					9
+#define PMF_POLICY_DISPLAY_BRIGHTNESS				12
 #define PMF_POLICY_P3T						38
 
 /* TA macros */
@@ -488,6 +489,7 @@ enum ta_pmf_error_type {
 };
 
 struct pmf_action_table {
+	unsigned long display_brightness;
 	enum system_state system_state;
 	u32 spl;		/* in mW */
 	u32 sppt;		/* in mW */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index 956e66b78605..b39f30a4f92d 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -77,8 +77,10 @@ static int amd_pmf_update_uevents(struct amd_pmf_dev *dev, u16 event)
 	return 0;
 }
 
-static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
+static int amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_result *out)
 {
+	struct thermal_cooling_device *cdev = dev->gfx_data.cooling_dev;
+	unsigned long state;
 	u32 val;
 	int idx;
 
@@ -154,8 +156,21 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 			dev_dbg(dev->dev, "update SYSTEM_STATE : %s\n",
 				amd_pmf_uevent_as_str(val));
 			break;
+
+		case PMF_POLICY_DISPLAY_BRIGHTNESS:
+			if (!dev->gfx_data.gpu_dev_en)
+				return -ENODEV;
+
+			cdev->ops->get_cur_state(cdev, &state);
+			if (state != val) {
+				cdev->ops->set_cur_state(cdev, val);
+				dev_dbg(dev->dev, "update DISPLAY_BRIGHTNESS : %u\n", val);
+			}
+			break;
 		}
 	}
+
+	return 0;
 }
 
 static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
@@ -192,7 +207,9 @@ static int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
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

