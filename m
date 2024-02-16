Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C02B6857EB4
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 15:07:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0B110EC01;
	Fri, 16 Feb 2024 14:07:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="iY1ZND81";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2076.outbound.protection.outlook.com [40.107.100.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0984F10EBFF;
 Fri, 16 Feb 2024 14:07:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yv88L6y2xvsjtsnfSu/HKAoLHfHKgZCvhe/FTGh3aDdA8vRmTMeir8hTs3IGqn+r3Y5uX3pGccDB/r97rjEvZAuAcfaTaLKLJQkdUFOaLhECEkRi3pPac/fsM1JzMvTgxVwgcCSV7XBdZLtayZfVCmOyNLYWIqajJcZK5Mebyl48XD0RJuxksSJh/V1G/Kl1j9U2/5CM1TYTlYWV+G6BqDCxKwbv8GaLfvky7e+9xx2WlQuNBlp0IQJ9ljv5gRH9pHMQWMO6SzSskVVfMw8DSA6t6HPfEuT1/6nr2V4ChEmN/zTTjapwyXKMiIXvQOahAIPupGvCMxv+CXz7EkAfNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WnhtwgelPNC20t2AgssG2A3ux6zixx3ElZF5nDi4qCA=;
 b=YM7N6m2hXdoU+dEdPKfMs/thbfACaEy3qRwMCajKU8v6hlq4R/qUdxTyu87YV+JoEdi9JGOoQt4GFnvoOjQAdIXeE/2gV+heIjUrUtmGEajrT0dlGLtEk2ePGFHHJv5rZhutZ8zWtfvafpPhSc5x4SDB3heehYmc4canvLyGCMw98lAICRQOrXjNrW28V5hj+wabn+qdJgCvE1XoFhoh/c8FJeLnBztPeaw1KgpTc0er+c9WtszyTIsMDzII7WckejK3Djj15W+mvoF5hT4i5XyJwn/NmUzlTZS9vVMUyfou1XWLam582LlhwOHGAaF+cgo1jC/QZcmMsK8PAc4Yzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WnhtwgelPNC20t2AgssG2A3ux6zixx3ElZF5nDi4qCA=;
 b=iY1ZND81Kd0EFejqZUltJpxLKP1YLef9PIYi1hdPB+oQ21uNVViu4/0DjLO33rn+X+PalDZjKxLrac6vr7r7Rp9s65hubK5W1qThzkQzv9mYXbfRTRlbHeQRhZ1xli7C9pya8/DI6U8hyWPCSO607dVsTchRAaZILh43AByKMzU=
Received: from SA1P222CA0066.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2c1::21)
 by BL1PR12MB5142.namprd12.prod.outlook.com (2603:10b6:208:312::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.14; Fri, 16 Feb
 2024 14:07:21 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:806:2c1:cafe::89) by SA1P222CA0066.outlook.office365.com
 (2603:10b6:806:2c1::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.40 via Frontend
 Transport; Fri, 16 Feb 2024 14:07:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 14:07:21 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 16 Feb
 2024 08:07:20 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <dri-devel@lists.freedesktop.org>, Mario Limonciello
 <mario.limonciello@amd.com>, Hamza Mahfooz <Hamza.Mahfooz@amd.com>, "Harry
 Wentland" <Harry.Wentland@amd.com>, Sun peng Li <Sunpeng.Li@amd.com>
Subject: [PATCH] drm/amd: Only allow one entity to control ABM
Date: Fri, 16 Feb 2024 08:07:09 -0600
Message-ID: <20240216140709.73708-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|BL1PR12MB5142:EE_
X-MS-Office365-Filtering-Correlation-Id: dd41c1c5-f844-49f8-e2b5-08dc2ef897e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: klHCpiSAPT8GpZ3xB15+D3buvH4fAhVJxemdYxjub+5B4xuV4Lsck99fjv5sSnsiC65OaXATP+gXRqHkVvORKHleg+GQhoxuSRFRuIq0b9IdX1j7dj87LIeV8ZZZTn6lny+75Bu30g3+nF2Y1xIq+kBeaD+2e2S671hPkl4xu8vOPv9+MV3bxh/sWqL5e5Dlc/Xo8xhPE0hbIEq9LtU9jHZi1X8C+Y1a9QI1Gd/LIlXEzIwfvyO4sbc35+8mly1WIQPCdTlIcDn2yWlj2GyCi7zOzPdh2/ik2EZIvJgH71A2M31bI+iW51wF9LuqSNPTHRgNdXnk3kO6BK03KTgBegZxTQq/VyRxPrsZSwH9/fC8NArmoVJmS8c9Z6AnpDl1w0uLOwdZO6477PzIXexKi88w1ABK7dTw4xD4sDTecIrn1sdKsLkF7EunyTVtVBIh90y/b8LxiReoHgiJxnIEY1HYxrFYd1p01scuWeN5iCh0epVcPHMz+juPRDPNYwr+etPWU6/PQNtV/5cI10p7jaC12M5yxmT/l8bvSQuGk+VS52R6ABb3PKeLuRRUyyJl7E/FEg8W79T+rpl56bA6c5zfZ0PzJCY2O2do4DXPUh1KwsJ+UrNzR8BrF3epd7wUMoZiL3UDvYrktmqpbCL/Y87YfdDOkv74Am2XazqibOc=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(230273577357003)(1800799012)(64100799003)(451199024)(36860700004)(186009)(82310400011)(40470700004)(46966006)(450100002)(336012)(83380400001)(41300700001)(426003)(8676002)(1076003)(4326008)(16526019)(2616005)(6916009)(6666004)(8936002)(478600001)(70586007)(70206006)(316002)(54906003)(7696005)(356005)(36756003)(82740400003)(81166007)(86362001)(26005)(44832011)(5660300002)(2906002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 14:07:21.4491 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd41c1c5-f844-49f8-e2b5-08dc2ef897e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5142
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

By exporting ABM to sysfs it's possible that DRM master and software
controlling the sysfs file fight over the value programmed for ABM.

Adjust the module parameter behavior to control who control ABM:
-2: DRM
-1: sysfs (IE via software like power-profiles-daemon)
0-4: User via command line

Also introduce a Kconfig option that allows distributions to choose
the default policy that is appropriate for them.

Fixes: f97e4303da16 ("drm/amd/display: add panel_power_savings sysfs entry to eDP connectors")
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
Cc: Hamza Mahfooz <Hamza.Mahfooz@amd.com>
Cc: Harry Wentland <Harry.Wentland@amd.com>
Cc: Sun peng (Leo) Li <Sunpeng.Li@amd.com>
 drivers/gpu/drm/amd/amdgpu/Kconfig            | 72 +++++++++++++++++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       | 23 +++---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  6 +-
 3 files changed, 90 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/Kconfig b/drivers/gpu/drm/amd/amdgpu/Kconfig
index 22d88f8ef527..2ab57ccf6f21 100644
--- a/drivers/gpu/drm/amd/amdgpu/Kconfig
+++ b/drivers/gpu/drm/amd/amdgpu/Kconfig
@@ -80,6 +80,78 @@ config DRM_AMDGPU_WERROR
 	  Add -Werror to the build flags for amdgpu.ko.
 	  Only enable this if you are warning code for amdgpu.ko.
 
+choice
+	prompt "Amdgpu panel power Savings"
+	default AMDGPU_SYSFS_ABM
+	help
+		Control the default behavior for adaptive panel power savings.
+
+		Panel power savings features will sacrifice color accuracy
+		in exchange for power savings.
+
+		This can be configured for:
+		- dynamic control by the DRM master
+		- dynamic control by sysfs nodes
+		- statically by the user at kernel compile time
+
+		This value can also be overridden by the amdgpu.abmlevel
+		module parameter.
+
+config AMDGPU_DRM_ABM
+	bool "DRM Master control"
+	help
+		Export a property called 'abm_level' that can be
+		manipulated by the DRM master for supported hardware.
+
+config AMDGPU_SYSFS_ABM
+	bool "sysfs control"
+	help
+		Export a sysfs file 'panel_power_savings' that can be
+		manipulated by userspace for supported hardware.
+
+config AMDGPU_HARDCODE_ABM0
+	bool "No Panel power savings"
+	help
+		Disable panel power savings.
+		It can only overridden by the kernel command line.
+
+config AMDGPU_HARDCODE_ABM1
+	bool "25% Panel power savings"
+	help
+		Set the ABM panel power savings algorithm to 25%.
+		It can only overridden by the kernel command line.
+
+config AMDGPU_HARDCODE_ABM2
+	bool "50% Panel power savings"
+	help
+		Set the ABM panel power savings algorithm to 50%.
+		It can only overridden by the kernel command line.
+
+config AMDGPU_HARDCODE_ABM3
+	bool "75% Panel power savings"
+	help
+		Set the ABM panel power savings algorithm to 75%.
+		It can only overridden by the kernel command line.
+
+config AMDGPU_HARDCODE_ABM4
+	bool "100% Panel power savings"
+	help
+		Set the ABM panel power savings algorithm to 100%.
+		It can only overridden by the kernel command line.
+endchoice
+
+config AMDGPU_ABM_POLICY
+	int
+	default -2 if AMDGPU_DRM_ABM
+	default -1 if AMDGPU_SYSFS_ABM
+	default 0 if AMDGPU_HARDCODE_ABM0
+	default 1 if AMDGPU_HARDCODE_ABM1
+	default 2 if AMDGPU_HARDCODE_ABM2
+	default 3 if AMDGPU_HARDCODE_ABM3
+	default 4 if AMDGPU_HARDCODE_ABM4
+	default -1
+
+
 source "drivers/gpu/drm/amd/acp/Kconfig"
 source "drivers/gpu/drm/amd/display/Kconfig"
 source "drivers/gpu/drm/amd/amdkfd/Kconfig"
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index af7fae7907d7..00d6c8b58716 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -844,17 +844,24 @@ module_param_named(visualconfirm, amdgpu_dc_visual_confirm, uint, 0444);
  * DOC: abmlevel (uint)
  * Override the default ABM (Adaptive Backlight Management) level used for DC
  * enabled hardware. Requires DMCU to be supported and loaded.
- * Valid levels are 0-4. A value of 0 indicates that ABM should be disabled by
- * default. Values 1-4 control the maximum allowable brightness reduction via
- * the ABM algorithm, with 1 being the least reduction and 4 being the most
- * reduction.
+ * Valid levels are -2 through 4.
  *
- * Defaults to -1, or disabled. Userspace can only override this level after
- * boot if it's set to auto.
+ *  -2: indicates that ABM should be controlled by DRM property 'abm_level.
+ *  -1: indicates that ABM should be controlled by the sysfs file
+ *      'panel_power_savings'.
+ *   0: indicates that ABM should be disabled.
+ * 1-4: control the maximum allowable brightness reduction via
+ *      the ABM algorithm, with 1 being the least reduction and 4 being the most
+ *      reduction.
+ *
+ * Both the DRM property 'abm_level' and the sysfs file 'panel_power_savings'
+ * will only be available on supported hardware configurations.
+ *
+ * The default value is configured by kernel configuration option AMDGPU_ABM_POLICY
  */
-int amdgpu_dm_abm_level = -1;
+int amdgpu_dm_abm_level = CONFIG_AMDGPU_ABM_POLICY;
 MODULE_PARM_DESC(abmlevel,
-		 "ABM level (0 = off, 1-4 = backlight reduction level, -1 auto (default))");
+		 "ABM level (0 = off, 1-4 = backlight reduction level, -1 = sysfs control, -2 = drm control");
 module_param_named(abmlevel, amdgpu_dm_abm_level, int, 0444);
 
 int amdgpu_backlight = -1;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index b9ac3d2f8029..147fe744f82e 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6515,7 +6515,7 @@ static void amdgpu_dm_connector_unregister(struct drm_connector *connector)
 	struct amdgpu_dm_connector *amdgpu_dm_connector = to_amdgpu_dm_connector(connector);
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
-	    amdgpu_dm_abm_level < 0)
+	    amdgpu_dm_abm_level == -1)
 		sysfs_remove_group(&connector->kdev->kobj, &amdgpu_group);
 
 	drm_dp_aux_unregister(&amdgpu_dm_connector->dm_dp_aux.aux);
@@ -6623,7 +6623,7 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
 	int r;
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_eDP &&
-	    amdgpu_dm_abm_level < 0) {
+	    amdgpu_dm_abm_level == -1) {
 		r = sysfs_create_group(&connector->kdev->kobj,
 				       &amdgpu_group);
 		if (r)
@@ -7654,7 +7654,7 @@ void amdgpu_dm_connector_init_helper(struct amdgpu_display_manager *dm,
 
 	if (connector_type == DRM_MODE_CONNECTOR_eDP &&
 	    (dc_is_dmcu_initialized(adev->dm.dc) ||
-	     adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level < 0) {
+	     adev->dm.dc->ctx->dmub_srv) && amdgpu_dm_abm_level == -2) {
 		drm_object_attach_property(&aconnector->base.base,
 				adev->mode_info.abm_level_property, 0);
 	}
-- 
2.34.1

