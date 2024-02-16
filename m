Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2538A8581D2
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 16:53:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD64710E002;
	Fri, 16 Feb 2024 15:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="em1KKh5Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09FF10E002;
 Fri, 16 Feb 2024 15:53:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i83my4uA/BfQW4dpG9FaLEdtdKfBNimhoTVlgi9rmUms1Oqiva3WWp/NBWQa9FdQXgtx2gWOVhG5scTooskdecJ42kUAmmCYo/URp62yhh4MTwRGLx4GHW+ArDaMhLDwjqXwxtt3PVojOUyB3w0Chwb+Y5Y5Df/bqf5a0IZEsxjzinUN41lgx6frdZtKHS96KcRKa67j1tCNdqlH7reJo2GOG91rDSUalNBJLfVQLKyO/afgzvctLl2hrxeq4R4bNJ2J33GzDl7U2QYIltZRxQJAhImOJCRPvDRGFx6ULaLU1IFcC8MkVPwzu5AVwqmXZvsMXPSpWvAgLbiseTy7iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SR9mLnp0LxUYxlzWzoA475FpBzWMA9pJ/GO/mmILfX8=;
 b=gZFGdrWNi1EuHiIhu2nx17cDoKZQdSf+jdV6qi0N2avb40Cel38mRk8/hMtDPVRt6AHph4oXMZwZwDyvZ/lLZlKTRcjnH54qeHjSAcXZJ45ox+LbPJQS6TjgHmPMFhUp2AP+IOihrdLy5XRVYwNeJ44cq4MsMb7XVjw/QDmTavFPEPYH0BBH3oCpjny5T/Ys/Z8MKriT/fQBbcoZTn9zOozjdclLv+a2Xa6nJIvk9QEjZ3+Q355vbEObHNSagEwO3HNIhUz2e2r6ywhReTWCHiDWgUoslGhN2wM6oNnQQLeeJHO+bVeG7fUcyqtVkokS2g/VEWHN9bOYkhotwSjPIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SR9mLnp0LxUYxlzWzoA475FpBzWMA9pJ/GO/mmILfX8=;
 b=em1KKh5Ynul8vsnyTXDQr7aOhxE57MRFuSyneCzSdXeTOZROnFG+aSF7ueIJKBm7KLg4zjcFD8NHC2Q1EvjGFjyYUzXTFpgkCXITNra31ymPQKrZ1ZyoIbv7OUWoJ1kbqfzBDqyHhN2O/w9KbmTlN5IUZOzBUXk2DDQmJcGA1Ik=
Received: from DM5PR08CA0027.namprd08.prod.outlook.com (2603:10b6:4:60::16) by
 DM4PR12MB6589.namprd12.prod.outlook.com (2603:10b6:8:b4::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.12; Fri, 16 Feb 2024 15:53:49 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:4:60:cafe::fc) by DM5PR08CA0027.outlook.office365.com
 (2603:10b6:4:60::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Fri, 16 Feb 2024 15:53:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 15:53:49 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 16 Feb
 2024 09:53:48 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Mario Limonciello
 <mario.limonciello@amd.com>, Harry Wentland <Harry.Wentland@amd.com>, "Hamza
 Mahfooz" <Hamza.Mahfooz@amd.com>, Sun peng Li <Sunpeng.Li@amd.com>
Subject: [PATCH] drm/amd: Drop abm_level property
Date: Fri, 16 Feb 2024 09:33:34 -0600
Message-ID: <20240216153334.83372-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|DM4PR12MB6589:EE_
X-MS-Office365-Filtering-Correlation-Id: cdb2165f-8541-45d7-fbe2-08dc2f077739
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yFv8TyTG7INhkCIkny+KW4UPkavly8UDLPIdy6u/yjSIzZr62/xK6YN8RL5B3fQPovz0M0l2O01rzRQb5N9PNFJVfrfYIp8n/rOWmpfYcsLlsWhbr4EPRReqX2jrdE5SmDZW7t/RlnPa0qhSIksNnB3mOOW0FvJAazbGfvWRymVCn80q4OJFDN0qEjo9duodYKvPWmtuys2PDtOJCHJp2Q4mFZ0JEyhjdnBR6HRmSgmmoADqjoRrOUKsLQHXuhI5jIugXA+L6QYxifF1zjC95ZH7jQljGKzLbTaBp/A+5Cc+9rHzW7ZyHnK4QYH+5JTiPj095rg9ZhvQvzDGWTXhaUUGNb6mtONfRopV5KKFJUAz5THJzjiHWlx6+jyH+Zma15imvtVRxROG1V4hBebqHV8Wsp1bPNgb761BwdFhkK1qCvdKnYTEVM2ye4umrO5SywJQX/oCcVrMqQKfg990VF5lRGPBbIQT/RWUxhvCnh0V4aAqO0Pqmro34HD7N3IOW4Bx5BUqGjbfwQ72jp0PGUQpGoOLLkweXMQt31vS6TlJpJIyzLVsChkGCmKgDdW6nnn+Spo88BBMpf7jMeV63sERUYz7QFM6K3hm1Ix6H5BtsWkfrLqYu3L/kMhpYHmYDmC8S8Ocr4ZwLIkZa/b9fMXqt42NBM2dfXoaIa4deDM=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(39860400002)(136003)(396003)(346002)(230922051799003)(451199024)(186009)(64100799003)(1800799012)(82310400011)(36860700004)(40470700004)(46966006)(81166007)(356005)(83380400001)(86362001)(82740400003)(478600001)(54906003)(16526019)(316002)(336012)(70206006)(450100002)(7696005)(1076003)(70586007)(26005)(6666004)(2616005)(36756003)(6916009)(426003)(8936002)(41300700001)(4326008)(44832011)(5660300002)(2906002)(8676002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 15:53:49.0395 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb2165f-8541-45d7-fbe2-08dc2f077739
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6589
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

This vendor specific property has never been used by userspace
software and conflicts with the panel_power_savings sysfs file.
That is a compositor and user could fight over the same data.

Fixes: f97e4303da16 ("drm/amd/display: add panel_power_savings sysfs entry to eDP connectors")
Suggested-by: Harry Wentland <Harry.Wentland@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
--
Cc: Hamza Mahfooz <Hamza.Mahfooz@amd.com>
Cc: Sun peng (Leo) Li <Sunpeng.Li@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c       |  8 --------
 drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h          |  2 --
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 14 --------------
 3 files changed, 24 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index b8fbe97efe1d..3ecc7ef95172 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1350,14 +1350,6 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
 					 "dither",
 					 amdgpu_dither_enum_list, sz);
 
-	if (adev->dc_enabled) {
-		adev->mode_info.abm_level_property =
-			drm_property_create_range(adev_to_drm(adev), 0,
-						  "abm level", 0, 4);
-		if (!adev->mode_info.abm_level_property)
-			return -ENOMEM;
-	}
-
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
index 2e4911050cc5..1fe21a70ddd0 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_mode.h
@@ -324,8 +324,6 @@ struct amdgpu_mode_info {
 	struct drm_property *audio_property;
 	/* FMT dithering */
 	struct drm_property *dither_property;
-	/* Adaptive Backlight Modulation (power feature) */
-	struct drm_property *abm_level_property;
 	/* hardcoded DFP edid from BIOS */
 	struct edid *bios_hardcoded_edid;
 	int bios_hardcoded_edid_size;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b9ac3d2f8029..e3b32ffba85a 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6388,9 +6388,6 @@ int amdgpu_dm_connector_atomic_set_property(struct drm_connector *connector,
 	} else if (property == adev->mode_info.underscan_property) {
 		dm_new_state->underscan_enable = val;
 		ret = 0;
-	} else if (property == adev->mode_info.abm_level_property) {
-		dm_new_state->abm_level = val ?: ABM_LEVEL_IMMEDIATE_DISABLE;
-		ret = 0;
 	}
 
 	return ret;
@@ -6433,10 +6430,6 @@ int amdgpu_dm_connector_atomic_get_property(struct drm_connector *connector,
 	} else if (property == adev->mode_info.underscan_property) {
 		*val = dm_state->underscan_enable;
 		ret = 0;
-	} else if (property == adev->mode_info.abm_level_property) {
-		*val = (dm_state->abm_level != ABM_LEVEL_IMMEDIATE_DISABLE) ?
-			dm_state->abm_level : 0;
-		ret = 0;
 	}
 
 	return ret;
@@ -7652,13 +7645,6 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 	aconnector->base.state->max_bpc = 16;
 	aconnector->base.state->max_requested_bpc = aconnector->base.state->max_bpc;
 
-	if (connector_type == DRM_MODE_CONNECTOR_eDP &&
-	    (dc_is_dmcu_initialized(adev->dm.dc) ||
-	     adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level < 0) {
-		drm_object_attach_property(&aconnector->base.base,
-				adev->mode_info.abm_level_property, 0);
-	}
-
 	if (connector_type == DRM_MODE_CONNECTOR_HDMIA) {
 		/* Content Type is currently only implemented for HDMI. */
 		drm_connector_attach_content_type_property(&aconnector->base);
-- 
2.34.1

