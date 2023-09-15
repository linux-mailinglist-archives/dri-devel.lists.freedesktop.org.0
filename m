Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3074C7A2ABA
	for <lists+dri-devel@lfdr.de>; Sat, 16 Sep 2023 00:50:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA22110E6AC;
	Fri, 15 Sep 2023 22:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2081.outbound.protection.outlook.com [40.107.100.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75FA310E6AB;
 Fri, 15 Sep 2023 22:49:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MuD2m/rWFoSNPqXS4QRZ9nMSVCShIykuirJfguWMtEiqRbUGbkJ9+jDNCP8CjrgNrNVmJCNhIljJ4Leha5sWKZ2tUtJequiRTzLtpCWTVJz0wkmz4LMV9qz/6gysxpBvUAb5BbLKn8jYjiR2mVrv4iLqlyYQPaoM7gxmXaea1SuPhOpFi6X3esuaIz1U66j5RgGct+cObVawo2l94iLnFDReSqov9EbztpI+7Fv2mxqGdpSLmugbmW+F5Mmca/NXwC6A3mYCGusggANv9KJePZoDB4iPuuhU+9R2364iWfIMNWD4195XhS+RcYO5FdqjqoNG+R25/tOLycWOOFebPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFGq0WPDMya86KgTg90rbBEq255QJ9sJQAs0A7vVLPM=;
 b=Z5h3es3u3RGMMJPTJ4RrnB+/XUXnkyuFQdWy1Q1VK78a1E1FgaAI42NrDDRG91O4ijFw4Ktxx+24k8bIf/Gl/vo6uHjhvfGBF0VMgcJndibMAMyUfGZvmmLA/dr8O8HecjSfUn6mU7pFfkj0E39hfL7wABRhfhncSTazJvC5dnb4/iIjqM88oWOhdjVjy0Th6OAFju4ZOsw2Og1+qLSttozelcLAgOxyfijX9oHEFTbgI0E9aZHGUy8EBF7D+BR18zpzXYBDiPVJtDus8eKSZYFzTZRgEdYriD3Ey3FBjDdTy4Fz6IsuQGVpsgs3R+ytKzkAm6xjPeGL8t+340D/OA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFGq0WPDMya86KgTg90rbBEq255QJ9sJQAs0A7vVLPM=;
 b=tN2PO4scVeUNmWEAdcKbyeN8jrRX/BVzgeckXmtAa2LpPlGk1JRSGRcyaU/Ke6dkJCu2FUuyvPRRBwkM26mb/UwNLtYNOE4diiiUXy0baL2TGjuBonS9chWXTtru7ZTDXJrbPwD1NxI5hzppd57EuUnEbOOaeDbIYmKp109P0Og=
Received: from DM6PR06CA0005.namprd06.prod.outlook.com (2603:10b6:5:120::18)
 by IA0PR12MB8975.namprd12.prod.outlook.com (2603:10b6:208:48f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.34; Fri, 15 Sep
 2023 22:49:53 +0000
Received: from CY4PEPF0000EE34.namprd05.prod.outlook.com
 (2603:10b6:5:120:cafe::f1) by DM6PR06CA0005.outlook.office365.com
 (2603:10b6:5:120::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.21 via Frontend
 Transport; Fri, 15 Sep 2023 22:49:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE34.mail.protection.outlook.com (10.167.242.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Fri, 15 Sep 2023 22:49:53 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 15 Sep
 2023 17:49:50 -0500
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH][V2] drm/amd/display: Remove unwanted drm edid references
Date: Fri, 15 Sep 2023 16:49:26 -0600
Message-ID: <20230915224926.104072-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE34:EE_|IA0PR12MB8975:EE_
X-MS-Office365-Filtering-Correlation-Id: 38201162-a4e7-40e7-59d0-08dbb63e137c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5Btb0V89gFYfvi1r3IyhrHp/9pwT/8xhCqUSy8D1GyUw7N2zpyLhyq7oJYSYrsjbKlVB1JHrq1ddjFfd/rD55/M0c4JKAjPSKec/mk4annrjWXvz28682FOTbhXAYjG6IlnsKq3rhiUp0THBWYt1w61/pAZcb0JAKWBijGqq+mPWEq+LFSG5zCWHoSWV9yw0MamUZkjjOGWlnON7Caku23MY/glHgdwFScrdugfjMNkwr5wLtZkZtnCm3kYpFMAaKx3WItyycjTwP4T1I+voD1fp51JnF8bGMCJmMb3zz07tDSsZtCgsn26rqsJ7rM9GIxkCAgtpLL4y/FHQ48nIuw+TC8jTPUjt4OvxY2wTbxFVs1xEUdMD5fae81VeQX5GbooTAMG8Z1HreDPCN19gjeUt3QeUd3hD1Cq0a35EFly/lVcUMaP/Mjp8Vp3q6cPd7buPrG0WalNRn1VCLZhoOEU0IVfImBmm1fLG+NaA4a4flBw1SxSmEPLITD3xqymVEY+O8+CCoZvvutXxJWcXOzsBbbu/yrSX+sbQhZKtPtCyFznQsUlQeLLAjizZuU0Or/V3WKXWa6Lc3nV+XkHh+no90n+lT6OEbpe94eNmUMgeq4nQ6OzgF95HrnN7pFi4aa08LwC6HwPcPIjX78l2i3nOBBHzhlxdbLx/LH3GhNJ0jW5WDnMC2Fm9FNh7ANIFyDJQon8DCqY/vkEXQKOA9cxy8flGClFbJFABs9v7IiBrc+jgcCLKo5X+MRauLbl2z5ErAGtGU5ROjJIKPw1OxZ1IkumJ2e5NRQqJsBCG/K4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(82310400011)(451199024)(186009)(1800799009)(40470700004)(46966006)(36840700001)(81166007)(7696005)(6666004)(41300700001)(36860700001)(40460700003)(47076005)(82740400003)(40480700001)(86362001)(336012)(2906002)(1076003)(16526019)(426003)(478600001)(83380400001)(5660300002)(356005)(316002)(54906003)(4326008)(70586007)(8676002)(110136005)(8936002)(26005)(70206006)(44832011)(36756003)(2616005)(26123001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2023 22:49:53.3107 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 38201162-a4e7-40e7-59d0-08dbb63e137c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE34.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8975
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
Cc: stylon.wang@amd.com, haoping.liu@amd.com, srinivasan.shanmugam@amd.com,
 jani.nikula@intel.com, Qingqing.Zhuo@amd.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, Alex Hung <alex.hung@amd.com>, sunpeng.li@amd.com,
 daniel.wheeler@amd.com, aurabindo.pillai@amd.com, hersenxs.wu@amd.com,
 hamza.mahfooz@amd.com, wayne.lin@amd.com, alexander.deucher@amd.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[WHY]
edid_override and drm_edid_override_connector_update, according to drm
documentation, should not be referred outside drm_edid.

[HOW]
Remove and replace them accordingly. This can tested by IGT's
kms_hdmi_inject test.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---

V2 - add comments for drm_get_edid and check edid before use.

 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 44 +++++++++++--------
 1 file changed, 25 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 5efebc06296b..b29ef87c27a9 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6444,15 +6444,24 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
 static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
 {
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
+	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
 	struct dc_link *dc_link = aconnector->dc_link;
 	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
 	struct edid *edid;
 
-	if (!connector->edid_override)
+	/*
+	 * Note: drm_get_edid gets edid in the following order:
+	 * 1) override EDID if set via edid_override debugfs,
+	 * 2) firmware EDID if set via edid_firmware module parameter
+	 * 3) regular DDC read.
+	 */
+	edid = drm_get_edid(connector, &amdgpu_connector->ddc_bus->aux.ddc);
+	if (!edid) {
+		DRM_ERROR("No EDID found on connector: %s, forcing to OFF!\n", connector->name);
+		connector->force = DRM_FORCE_OFF;
 		return;
+	}
 
-	drm_edid_override_connector_update(&aconnector->base);
-	edid = aconnector->base.edid_blob_ptr->data;
 	aconnector->edid = edid;
 
 	/* Update emulated (virtual) sink's EDID */
@@ -6487,30 +6496,27 @@ static int get_modes(struct drm_connector *connector)
 
 static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
 {
+	struct drm_connector *connector = &aconnector->base;
+	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(&aconnector->base);
 	struct dc_sink_init_data init_params = {
 			.link = aconnector->dc_link,
 			.sink_signal = SIGNAL_TYPE_VIRTUAL
 	};
 	struct edid *edid;
 
-	if (!aconnector->base.edid_blob_ptr) {
-		/* if connector->edid_override valid, pass
-		 * it to edid_override to edid_blob_ptr
-		 */
-
-		drm_edid_override_connector_update(&aconnector->base);
-
-		if (!aconnector->base.edid_blob_ptr) {
-			DRM_ERROR("No EDID firmware found on connector: %s ,forcing to OFF!\n",
-					aconnector->base.name);
-
-			aconnector->base.force = DRM_FORCE_OFF;
-			return;
-		}
+	/*
+	 * Note: drm_get_edid gets edid in the following order:
+	 * 1) override EDID if set via edid_override debugfs,
+	 * 2) firmware EDID if set via edid_firmware module parameter
+	 * 3) regular DDC read.
+	 */
+	edid = drm_get_edid(connector, &amdgpu_connector->ddc_bus->aux.ddc);
+	if (!edid) {
+		DRM_ERROR("No EDID found on connector: %s, forcing to OFF!\n", connector->name);
+		connector->force = DRM_FORCE_OFF;
+		return;
 	}
 
-	edid = (struct edid *) aconnector->base.edid_blob_ptr->data;
-
 	aconnector->edid = edid;
 
 	aconnector->dc_em_sink = dc_link_add_remote_sink(
-- 
2.42.0

