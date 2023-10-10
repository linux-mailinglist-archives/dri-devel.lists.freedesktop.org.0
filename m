Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F31807BFC55
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 15:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A43D010E35F;
	Tue, 10 Oct 2023 13:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2057.outbound.protection.outlook.com [40.107.220.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C53F10E35F;
 Tue, 10 Oct 2023 13:01:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGn6pM5oGcIqMGLBeil2ZLWgoR88tgnurV3Bz5c+N5ODSctG/BM8lXVpySo3+CZYYdbbabvQI9RgjO4AxBACDAdoaZ0SdC0F/z9d3HlbM6fRx4j55fOqY53thvqDNDFimtVhR+ggf16jfr9nXhjCTEmUmJFvocAItxLN+futFjS6tSCmN3k9mGlhILel7h3PXLqnKmQytcpzs9omjuyUoDyZAP/YXmVD62NcvpTh8TKNjWeJoGuaV8qMXEvaLV2jL1iSgOXdqxwHO2gd3DO9B8n+lKovHsZB3GLVxOQkiUMLiDPeBuWZMG6ZmkqO5LbBfkVJJ2ZNu0yTl1W+mDscFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gFnoqbtsBPKceoMu3pnz2QYLrS4W3VwafEb4Ti0Liro=;
 b=BOR/3kgCOL0SnkE8yvD/U8/GJAxXNbG74vP1NQ4aW/KQcwwzSLJnZXMXS5HYvdscZWyMY8NxIaT5lvMd1EqqN9nKDR4LsLdJBTAK8nofoVHjLoSNiUBLXBW6sZyfsyWTDAxHCcZvKRb4aMnWd6E9Oc02Lh8zRcGdKrbinA5E/+m0SDC0SfAJGbUrdZ/s0YWsQjYStuFE902x4HgYHK9kPV/TA2qpkFPC8gwT1kZnuhKGysjic1lvHaGOvMSivWCBHg0ThXC89AUDlHZ87kzeRmA1Z7ifWFMHTY+d8XT09J9cfvJ8KqaJGZN4QSvm7zLn+0uILoy6RAR9GjEnopO97g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=redhat.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gFnoqbtsBPKceoMu3pnz2QYLrS4W3VwafEb4Ti0Liro=;
 b=By52taVIuRVb+fyaSOBvgEeEOiFeXAy+rB1Z7LWukTXqWHq9ToneIifwBp8dgIReNXkunrKUtGnILBDDwBNhYWL1EIko1qp/Ngg1PSrp63BEYsSqR3R32T1g5qdnHF4riRAX579RTsPSHrsqUCyLZxasL2L/cjtJS6MBDVOsPVU=
Received: from DM6PR04CA0013.namprd04.prod.outlook.com (2603:10b6:5:334::18)
 by CY8PR12MB8300.namprd12.prod.outlook.com (2603:10b6:930:7d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Tue, 10 Oct
 2023 13:00:58 +0000
Received: from DS2PEPF0000343A.namprd02.prod.outlook.com
 (2603:10b6:5:334:cafe::30) by DM6PR04CA0013.outlook.office365.com
 (2603:10b6:5:334::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.30 via Frontend
 Transport; Tue, 10 Oct 2023 13:00:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS2PEPF0000343A.mail.protection.outlook.com (10.167.18.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6838.22 via Frontend Transport; Tue, 10 Oct 2023 13:00:58 +0000
Received: from jatayu.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 10 Oct
 2023 08:00:52 -0500
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
To: <hdegoede@redhat.com>, <markgross@kernel.org>,
 <ilpo.jarvinen@linux.intel.com>, <basavaraj.natikar@amd.com>,
 <jikos@kernel.org>, <benjamin.tissoires@redhat.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <Xinhui.Pan@amd.com>, <airlied@gmail.com>, <daniel@ffwll.ch>
Subject: [PATCH v3 13/16] platform/x86/amd/pmf: Add PMF-AMDGPU set interface
Date: Tue, 10 Oct 2023 18:29:14 +0530
Message-ID: <20231010125917.138225-14-Shyam-sundar.S-k@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
References: <20231010125917.138225-1-Shyam-sundar.S-k@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343A:EE_|CY8PR12MB8300:EE_
X-MS-Office365-Filtering-Correlation-Id: 1df85326-be49-4ded-7fa6-08dbc990f270
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Kxx/Qy4AGCbp82wHeoPoJXFIIAxealR5gbNFtbU0pGhJYAOtKLCtONXk2dmmR9Ke7dexrdXm7nkhIWu3gTn2g9fcVBgL2n2cv6Zi9uNG0FyECp8kTJKJN+MCkMGSJwcu0lKqHZJLZAXLciSvNw8SNwVcbku4q3ECvzZ4NQzvAAiXOkq/JHBPpNswgx+olHeMhuyCXY4qzLESzirOXOdfvsP6Drmdau16cJo/Up6Oy1r9wPvxW5ujHaot0W5CSR5Hn0vJZaF7ZeMt8kNCN4uVfzHnNhSe7YCoc8HPRbOsRGM11vA1OCIAZGPMm7jjHbQX5hMXVLmoBYYaefBqjJhQPVTQLDkAzVwV6/pZDqYA16g3MKAt6pf2nk+9C09Dpa6bb22IEfXNk7Bc8Jhzlfi79/ofP9yMvWhOSGymL+KnGiRRKkfOFLwEqJqjes4s5aNw+omACljQ2pIyVCZMN3d3teIWrrTOtqHNm933dvB2ocbQx9QiLnInTaVKVLem6YVNW5ne2tpp1mjswd4GWXbbBC5Es20N1RSl0OBCT0KqlX5bXkdr7/YFeQ6VZ7KQzK6lavDv5CL8bPo8M8c8o56PNdD7UZBQ2FCxWVPJWwN7a1kWd94c2BEHaWkfKxfC76Ax97DcDjhcSJQt7i5g2dJX8d4Y2m6jt9/PhZzMb1+KWRgdieZVEYcTWewN+N8vPz3PBhq1ggTrAlAl4OhpcHb57+muFuysXXep2Lz/cmgPqB0Jf3qqW/fkvDMA9UHkbbDQX+yrucf5SVLkU5oBMZ6X5Llw8lE1YBbLga9yyakUUBA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(376002)(396003)(39860400002)(346002)(230922051799003)(186009)(1800799009)(64100799003)(82310400011)(451199024)(46966006)(40470700004)(36840700001)(110136005)(316002)(70206006)(54906003)(41300700001)(5660300002)(7416002)(8936002)(8676002)(4326008)(70586007)(40460700003)(2906002)(47076005)(83380400001)(82740400003)(356005)(81166007)(921005)(40480700001)(16526019)(336012)(426003)(1076003)(2616005)(26005)(86362001)(36860700001)(36756003)(478600001)(6666004)(7696005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2023 13:00:58.2208 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df85326-be49-4ded-7fa6-08dbc990f270
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8300
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
index 0f1c0e0bc86a..d61cebc44d2b 100644
--- a/drivers/platform/x86/amd/pmf/pmf.h
+++ b/drivers/platform/x86/amd/pmf/pmf.h
@@ -75,6 +75,7 @@
 #define PMF_POLICY_STT_SKINTEMP_APU				7
 #define PMF_POLICY_STT_SKINTEMP_HS2				8
 #define PMF_POLICY_SYSTEM_STATE					9
+#define PMF_POLICY_DISPLAY_BRIGHTNESS				12
 #define PMF_POLICY_P3T						38
 
 /* TA macros */
@@ -483,6 +484,7 @@ enum ta_pmf_error_type {
 };
 
 struct pmf_action_table {
+	unsigned long display_brightness;
 	enum system_state system_state;
 	u32 spl;		/* in mW */
 	u32 sppt;		/* in mW */
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index e9a257a91325..4f5de7f816d3 100644
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
 	u32 val, event = 0;
 	int idx;
 
@@ -154,8 +156,21 @@ static void amd_pmf_apply_policies(struct amd_pmf_dev *dev, struct ta_pmf_enact_
 			dev_dbg(dev->dev, "update SYSTEM_STATE : %s\n",
 				amd_pmf_uevent_as_str(event));
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

