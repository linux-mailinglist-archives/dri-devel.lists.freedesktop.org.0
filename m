Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF894846331
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 23:11:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7225A10E801;
	Thu,  1 Feb 2024 22:11:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="a1pzKN0h";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2078.outbound.protection.outlook.com [40.107.101.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C25F010E7F7;
 Thu,  1 Feb 2024 22:11:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SR2U+SlqngYJhvFUhE8ocN5U8m6Z/bD52kgVuj8S4rABReA2/2vf/Pe9WaxdUKDnEFEQTbTEAtXvgYs6kV7BTZTwnVZj9Ris8vaoVpP12fod6Ed6j6VSDmXu6TuletKblBg9yEddr9V9XnLalR0ZtbxLko/7KwV6mfoERcyZlLISAaa4lfH7pdw+oeTZGwb+VO5BLVxMJ1evy86hY4Sd7/ySJ1jzSSc3mb9QhIoMy8xVlDHB16+XmaPfjYKL0lUJ9zTSiM3vHJZ4t0M3h9lCH4CDLyUyvMTKUjzUWgEXPZ64A1+Acxcq6PGLHY8Dh+U37OM1fcT3jv6ySz+/kwyydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WvdY9+EfGzsWnuaI1pRPOqi6JEPcNDV0fXiaLf5JpnE=;
 b=Ba1t3mA24Icg0sOwjwP9gsQ6LvPiqCifETDu77qZ4XJNcBGwSFHKnwn8wNtJo8Y4XJbBUbhxXqbtquAZHpRHimM5OAXcCg64zS+Z7h2QkQaQ9EkCjG75o7dpSosOPli05t5ULBbzE15U0v3oV7q0C0rRqoeqHQvDqdFLb9OHunRD3zISNyvwow1XZkBWNGjnMh3nEgRpZ6vAlF80xXQEgc58N+6fTribaMOV1q6LnhiPjbpgZuDr2DPITX5Na+nCpnr+hdofMHrAovANlrpBfv4260SU9f7T96L+PTkO/BuY2RVYTiPmwI7VBTaKWAY01DjoL7KfeWoYw4TpAg1/eA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvdY9+EfGzsWnuaI1pRPOqi6JEPcNDV0fXiaLf5JpnE=;
 b=a1pzKN0hN3ADyiE0P+PtOWIFfqeJGGN3SvoSqfE2KmLK8cxQZBz7MIW1MhQGPzWAjDe/VqpmuxXlIAuKgEyC/uHPwmW5rgHYxCYEz9EJPYZH5Yh6Q6fc5FFqEtlNQSObwprQoMa5GmFGwjDkD4Er1ozUGYEGSP7erTznOInbJks=
Received: from DM6PR10CA0017.namprd10.prod.outlook.com (2603:10b6:5:60::30) by
 MW4PR12MB6730.namprd12.prod.outlook.com (2603:10b6:303:1ec::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7228.35; Thu, 1 Feb 2024 22:11:40 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:5:60:cafe::70) by DM6PR10CA0017.outlook.office365.com
 (2603:10b6:5:60::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.26 via Frontend
 Transport; Thu, 1 Feb 2024 22:11:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Thu, 1 Feb 2024 22:11:40 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 1 Feb
 2024 16:11:39 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Hans de Goede <hdegoede@redhat.com>
CC: "open list:ACPI" <linux-acpi@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, Melissa Wen <mwen@igalia.com>, "Mark
 Pearson" <mpearson-lenovo@squebb.ca>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: [PATCH v3 3/5] drm/amd: Fetch the EDID from _DDC if available for eDP
Date: Thu, 1 Feb 2024 16:11:17 -0600
Message-ID: <20240201221119.42564-4-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240201221119.42564-1-mario.limonciello@amd.com>
References: <20240201221119.42564-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|MW4PR12MB6730:EE_
X-MS-Office365-Filtering-Correlation-Id: ad53d5b0-3ca4-4e39-32d9-08dc2372c446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xI6haQt20SyuH3+ZOm0QK7MwYMIzyCHu3ZZcNzAjkGxjpEgqYOn9XyZ8YoFoZi94bvBJbbClVhSCmdfLACNornibjnrOqbTPAUpYUT6x5H/DLz1vJSC61D7MayfKZlvnQtLn0GlAepzlvc3BkEZVluxsUAD8uvDCKXFV6KyxbdK0bE2pYsbWGtv8HoSKnieAhMtPh2qdbB4L3NDW2e0TPIa1SRqbbi0g2h1m7tWvdiw2jIifBVEwJvBEBI45P69SbYwpGMT5R1vRfPQnuynkS5b0hm03rYp5IFezFnmocfifzJL59QyOiIQ9Evw3McWFUj0Zt/iG+g3SXGFjWHPFC+o3EHOSJ+a9OqlBodkFeyE7LJFudrhj/xlLa71bnLNLPtwVPYzDK8rH38KDBWbw885qSgF1ArQ2M7kNl52LwtSnGFLJrp0OF91hKWV0+p++e54mIQxhtvjKxmoKRbuVx6/xv7a5Pz6tOojBROmVt5WPnix9DziI4Dto00MIittxWu1HeFqsiAwmnIBbMoNdLheVEmhnefpPIAhvH+DauDVIJTYOZhj5KSnl9qv1KOR3y+8Z/t8lVBDBddEYdP2ZuK1PP5tN57tTggn262Or4Pz488XWmDB/jGkQ2kleUalidss4/rgZ9dAb6ktdHd3e0YEmKGhsVGVMqPXpGqa1KbtcwNOxcPq7P4Xcpplt77NCOAcvgK6xaNAtWqgOasw7WuHCJjEUIa6kh8Evkr3iq970jfE6HMEZMC7w420udeYGSpD2YL5i9nC0n5nxj5yTTg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(376002)(346002)(136003)(396003)(230922051799003)(186009)(82310400011)(64100799003)(451199024)(1800799012)(46966006)(40470700004)(36840700001)(110136005)(70586007)(40460700003)(40480700001)(47076005)(5660300002)(2906002)(44832011)(82740400003)(8936002)(316002)(70206006)(54906003)(4326008)(8676002)(478600001)(36756003)(16526019)(81166007)(86362001)(2616005)(41300700001)(356005)(6666004)(426003)(26005)(7696005)(1076003)(83380400001)(336012)(36860700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 22:11:40.5009 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad53d5b0-3ca4-4e39-32d9-08dc2372c446
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6730
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

Some manufacturers have intentionally put an EDID that differs from
the EDID on the internal panel on laptops.

Attempt to fetch this EDID if it exists and prefer it over the EDID
that is provided by the panel.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v2:
 * Use drm helper which will run more validation
 * Move eDP check to DRM helper
 * Add module parameter
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h                    |  1 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c         |  4 ++++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c                |  8 ++++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c      | 10 ++++++++--
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c  |  9 ++++++---
 5 files changed, 27 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index 3d8a48f46b01..5d5be3e20687 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -217,6 +217,7 @@ extern int amdgpu_smartshift_bias;
 extern int amdgpu_use_xgmi_p2p;
 extern int amdgpu_mtype_local;
 extern bool enforce_isolation;
+extern bool acpi_edid;
 #ifdef CONFIG_HSA_AMD
 extern int sched_policy;
 extern bool debug_evictions;
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index 9caba10315a8..6aa8cc431abe 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -278,6 +278,10 @@ static void amdgpu_connector_get_edid(struct drm_connector *connector)
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
 
+	/* if the BIOS specifies the EDID via _DDC, prefer this */
+	if (acpi_edid && !amdgpu_connector->edid)
+		amdgpu_connector->edid = drm_get_acpi_edid(connector);
+
 	if (amdgpu_connector->edid)
 		return;
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index cc69005f5b46..be7a4da85a8b 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -166,6 +166,7 @@ uint amdgpu_sdma_phase_quantum = 32;
 char *amdgpu_disable_cu;
 char *amdgpu_virtual_display;
 bool enforce_isolation;
+bool acpi_edid = true;
 /*
  * OverDrive(bit 14) disabled by default
  * GFX DCS(bit 19) disabled by default
@@ -990,6 +991,13 @@ MODULE_PARM_DESC(wbrf,
 	"Enable Wifi RFI interference mitigation (0 = disabled, 1 = enabled, -1 = auto(default)");
 module_param_named(wbrf, amdgpu_wbrf, int, 0444);
 
+/**
+ * DOC: acpi_edid (bool)
+ * Try to fetch EDID for eDP display from BIOS using ACPI _DDC method.
+ */
+module_param(acpi_edid, bool, 0444);
+MODULE_PARM_DESC(acpi_edid, "Fetch EDID for eDP display from BIOS");
+
 /* These devices are not supported by amdgpu.
  * They are supported by the mach64, r128, radeon drivers
  */
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 202c6ad443a3..688d615c6687 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6589,7 +6589,11 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
 	struct dc_link *dc_link = aconnector->dc_link;
 	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
-	struct edid *edid;
+	struct edid *edid = NULL;
+
+	/* prefer ACPI over panel for eDP */
+	if (acpi_edid)
+		edid = drm_get_acpi_edid(connector);
 
 	/*
 	 * Note: drm_get_edid gets edid in the following order:
@@ -6597,7 +6601,9 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
 	 * 2) firmware EDID if set via edid_firmware module parameter
 	 * 3) regular DDC read.
 	 */
-	edid = drm_get_edid(connector, &amdgpu_connector->ddc_bus->aux.ddc);
+	if (!edid)
+		edid = drm_get_edid(connector, &amdgpu_connector->ddc_bus->aux.ddc);
+
 	if (!edid) {
 		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
 		return;
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
index 85b7f58a7f35..cc39b1c14aa8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -899,7 +899,7 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	struct i2c_adapter *ddc;
 	int retry = 3;
 	enum dc_edid_status edid_status;
-	struct edid *edid;
+	struct edid *edid = NULL;
 
 	if (link->aux_mode)
 		ddc = &aconnector->dm_dp_aux.aux.ddc;
@@ -910,8 +910,11 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	 * do check sum and retry to make sure read correct edid.
 	 */
 	do {
-
-		edid = drm_get_edid(&aconnector->base, ddc);
+		/* prefer ACPI over panel for eDP */
+		if (acpi_edid)
+			edid = drm_get_acpi_edid(connector);
+		if (!edid)
+			edid = drm_get_edid(&aconnector->base, ddc);
 
 		/* DP Compliance Test 4.2.2.6 */
 		if (link->aux_mode && connector->edid_corrupt)
-- 
2.34.1

