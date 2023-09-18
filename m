Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 053FB7A4A7B
	for <lists+dri-devel@lfdr.de>; Mon, 18 Sep 2023 15:05:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DBD110E280;
	Mon, 18 Sep 2023 13:05:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2085.outbound.protection.outlook.com [40.107.223.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBD6B10E280;
 Mon, 18 Sep 2023 13:05:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b8RoBWg5W0OCf85tTZzNAAA9YgxYzzZekMokhALzqXpe8fLS3b3YxfeW7M0h6H0EB1l/dpe9QeY6gv6rHiG0ltnHjqPMSzn4fCpqpD9oEJfW7AA8Ca3+EsrN8XxvuMr3hLDinVCig/SjGbOljwLQ8MxsmJ+DyCwvoUND9jpROskq+A9LiSrkvyO12vrqNLOZm2Y4o7snXdkjHuySjPUfVvrwGMKQ8A6Otqncru4xQIM0FsEk92J4dHps9yXAgUPNipwI4nQJsxbjhxhQwVcFUkCVonAjM+ToAtXkiBA2L/WgOM84mcWj7rKUqFPzLeSAlCQbSRwuEMCKvsHG4FmpoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DEGadhjt+mWSArcKJcG0XQVFgQwziDk2LXAA5pkY2XQ=;
 b=nKMkq36Epk/ruTdfHwxDx38ethdL03lm56wyaXXydx6eqvu+y1Q9IdxX47Mvijw4LPCi0dmRnPGueQlz0XhyxFjFyMII2ZTUID5Ligh2OdDc/JSa27GP/3Ynq/jeG2h1ejGaQA30N8X2vFfHvDTaAG8VFWXY29ddb2KZrde9weigjl7QSxPkdVd22qiG/23+UPhdaEaeoHTJiu3uwmb6kr6GkdXaLAoCY118ZiOKvB7DLU47SVqOAjImEgqJ1Evu1w53LYoJT445Ro7Mt1efv0Ok5BRa97EroNRGSG9yixL29IXgDCzn5FGNL5X7NuRYQSaHx83DfmuzRyymNRdmgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DEGadhjt+mWSArcKJcG0XQVFgQwziDk2LXAA5pkY2XQ=;
 b=1uWf4nqmnLBoZr4GOoKDS5Y3L4rdag/tgjkG1kmi0kwCBohTnPsQllrPxFJBSo+3WJn9IcmkQPzy/p1KDJSglR0Rc0+pK9I6ld2WAQDLkJZsU3bMoBR4cOQerMSsG6NlR4grqYYnXiSvhZxY3IQa6kK1aZJEk51wRmFXcEhBzBQ=
Received: from DM6PR02CA0111.namprd02.prod.outlook.com (2603:10b6:5:1b4::13)
 by IA1PR12MB7614.namprd12.prod.outlook.com (2603:10b6:208:429::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Mon, 18 Sep
 2023 13:05:49 +0000
Received: from CY4PEPF0000EE37.namprd05.prod.outlook.com
 (2603:10b6:5:1b4:cafe::e7) by DM6PR02CA0111.outlook.office365.com
 (2603:10b6:5:1b4::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27 via Frontend
 Transport; Mon, 18 Sep 2023 13:05:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE37.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6792.20 via Frontend Transport; Mon, 18 Sep 2023 13:05:48 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Mon, 18 Sep
 2023 08:05:45 -0500
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH][V3] drm/amd/display: Remove unwanted drm edid references
Date: Mon, 18 Sep 2023 07:04:55 -0600
Message-ID: <20230918130455.2868485-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE37:EE_|IA1PR12MB7614:EE_
X-MS-Office365-Filtering-Correlation-Id: f7c6381c-1241-4a09-d58e-08dbb847fa71
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oU8DYKRFRPzfJ8z9AiUN7++CqT2jawrs5VYtJJ5SluFK2GAN6iNWkWZyBrGLNFgFONFYKEvISUT3p+67Y+GYD5SizlSMUQHAX0MizIhVxjCvwMY5jKGCcvj+NX9NvNgj6E+bL0C2x6WTn6zZn4vuBAWSdz6/oGigFlGii4JpxDIFMD9fcTaaVqM54yy9jZSDheZVK/rAGQuJanhBd5HqUG0aTdD3I1vdVEUMMz40OC1NtHvSTn8jVtNJrmQBygUVbvSsw8cHz0KZDcXemkacLMaTik3hmki6Qz9S2uMbp9NnDUQbQfiu/VTes35woCQZMNKt9GlzyP9uRw08oOz+DrbJZMcp4eubCb2GZ97V5qrXCKX0/QXu6IQ4j9r8ji7ES5WNgIfaqDj8X71BgXz4n/k36KI5Nqx3C5cpx79huU1inExrVYRRmvxKPPMc4YphVhkdYkFQTsy4Z69KPKy30prJZdrV6RIdQYI7/fQFoLkb7EW/NjYOjgXQ7BK1PxATMfarKRb9uHUUih9JPs6rZueHGZPgik0v5JGjypdCZKavkRcNiWsgHGdjcXVcC5Q0p1SX1zm7JlNc5VNOZZMFCBycHOZD7HoQna3qpxqtNDuwUiunQAQuXkxDBkASisLHbbBngWPOz28KKcieAheXgymCRzOAFF+U+adlmRMndhafAvBjVi4I9xlk64qa17DaYiUN7vXM3F1v8G69/AUkQ4P735zP0eP8V6vHV9NF8rCwhcDdHBuXdxF/EcoeQN4OtDgjX5HnG51Ej6Zi0hZfzh5dGTZBvNWBbaJBQige4U4=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(136003)(39860400002)(396003)(376002)(1800799009)(186009)(82310400011)(451199024)(40470700004)(46966006)(36840700001)(356005)(81166007)(26005)(16526019)(82740400003)(2616005)(8936002)(8676002)(4326008)(1076003)(40460700003)(83380400001)(36860700001)(2906002)(36756003)(426003)(47076005)(336012)(40480700001)(5660300002)(44832011)(86362001)(7696005)(478600001)(6666004)(316002)(54906003)(70586007)(70206006)(110136005)(41300700001)(26123001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 13:05:48.5916 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f7c6381c-1241-4a09-d58e-08dbb847fa71
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE37.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7614
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
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 42 ++++++++++---------
 1 file changed, 23 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 5efebc06296b..3968dd9cef7f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6444,15 +6444,23 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
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
+		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
 		return;
+	}
 
-	drm_edid_override_connector_update(&aconnector->base);
-	edid = aconnector->base.edid_blob_ptr->data;
 	aconnector->edid = edid;
 
 	/* Update emulated (virtual) sink's EDID */
@@ -6487,30 +6495,26 @@ static int get_modes(struct drm_connector *connector)
 
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
+		DRM_ERROR("No EDID found on connector: %s.\n", connector->name);
+		return;
 	}
 
-	edid = (struct edid *) aconnector->base.edid_blob_ptr->data;
-
 	aconnector->edid = edid;
 
 	aconnector->dc_em_sink = dc_link_add_remote_sink(
-- 
2.42.0

