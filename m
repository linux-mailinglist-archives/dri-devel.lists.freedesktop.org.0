Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 285B5792C40
	for <lists+dri-devel@lfdr.de>; Tue,  5 Sep 2023 19:14:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2C3810E0DC;
	Tue,  5 Sep 2023 17:14:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB5810E0DC;
 Tue,  5 Sep 2023 17:14:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oWKHtMoOKiXOOgBpHOlq5pH+n0k3NrLIeAY2/MJpjuxCnf4ZsEG54MCULGvIMSpAVyzNO9OFBQSeNNaFcHRapqgTuLpuh89xNcFtvnq/fkPrdohmt79vFmPzWJFSphgtZMlvPzYEb/nSKNVquo7BcTBP+CivM2OFLcxECMJY6FvUVTmt7XNngZAYg1Caq9AsoCVZsHKzOkFVeye0QVLWsyBjJ32PdUKSRy2mN9fFDx+t7uDGYP3L/uF7OnEcArvyOEv7o4Y/r2eE8s82jHDCeszqrYO32GHJ5c+tCigvtLEdIDQORt/lgj4q1mF6TD0T+ZVIxCm8oMqFOyUuwJ7brw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g+Tn3PKaV04/rKqO9eDb7b65Bp1TNyISYORvhyAO8Xg=;
 b=K0lwbmjkxvj1kAU8+UBEMV/pfYlgRq4Tu8gW8W3rOviwuW3tesWB9fb/II2vIgrSj8J9lwk/b2wYb0xipIZs7Q9WcDovYfrI5wAFPXSp/pKJ9oqRsvfX5/FPemNpxAHnsVWYLwtVhn8ifuix/TXwswHEHp6ZCFQNacIdFh7W7O88VDAWmzu0UoIBPm59+24AC73e1bDlXca7tsxl/6iH7oKZ82keTKseqnyzXRRLUPjX0b6RK6aG+aKY1aOKLGUcVeCF0bgGJAudCmANLBarzFFAf/Wj1JtezBoDJJB9LBq1ffVAuHUS4X9xuqCriipGGNQzvP5tueqxRLo+05DhEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g+Tn3PKaV04/rKqO9eDb7b65Bp1TNyISYORvhyAO8Xg=;
 b=oHfLiFDQgMVvdhue0xgtwj7wGzvJ/f0aIUDz1T4VLOHcM5jzSS0bI5M65CGypkIOOhTY3mvlXYSw9HTkpy8ihZA8Qa3925T1MlpgahLk43VXN7j5nKrBLzwBFn3LvMcz/trUoZpyK+VpYm2oMbh0O146wlfLqYr4Fd3Cw+sFMYU=
Received: from DS7PR03CA0029.namprd03.prod.outlook.com (2603:10b6:5:3b8::34)
 by IA0PR12MB9045.namprd12.prod.outlook.com (2603:10b6:208:406::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33; Tue, 5 Sep
 2023 17:14:39 +0000
Received: from CY4PEPF0000EE3E.namprd03.prod.outlook.com
 (2603:10b6:5:3b8:cafe::50) by DS7PR03CA0029.outlook.office365.com
 (2603:10b6:5:3b8::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.33 via Frontend
 Transport; Tue, 5 Sep 2023 17:14:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE3E.mail.protection.outlook.com (10.167.242.18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6768.25 via Frontend Transport; Tue, 5 Sep 2023 17:14:38 +0000
Received: from dev.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Tue, 5 Sep
 2023 12:14:35 -0500
From: Alex Hung <alex.hung@amd.com>
To: <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH] drm/amd/display: Remove unwanted drm edid references
Date: Tue, 5 Sep 2023 11:13:54 -0600
Message-ID: <20230905171354.2657889-1-alex.hung@amd.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3E:EE_|IA0PR12MB9045:EE_
X-MS-Office365-Filtering-Correlation-Id: 29bc8608-3470-4e4a-a0b8-08dbae339623
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s4wQ8dchSsfeFw7YVYIXVbcel1vNvh+2syLP3eD2yE7krVXJjtfa1PK+aQpp/dP3Da38k69gG9zDHQFRhGbY1k7Oi9t1BklGmq3E/4wWBCQel9vb52dBm2T1WuTXIr2eMM1a2Xv5D9h/jwpAi4xRLfoP0eIkEfVN+9bqWYAmwbO0dsHDzDWfrlpnx+cOKC+2VbIRim3keHoF8m17iFHJgwqxUiC3SGgWA/f1yYXC6xZO4JQWopiBt952XJO7wu/GSIngUYZojfzeUWn6bG4ov3YzCl9NT/HBgERKvlnvl4zbOmF3Vv0wFQg5lYslAe3futfh2WEHjOMwV0AK7lWRg9UJ15W1VpqkwVzi18NQPeWdf5jW7X806pJ8EWj3QWfPjQu3+8dihKcc6lLj47O6dpYqIVG/TsmGfBgrCqwVNF/t5GJ9AOLP7i/Ca3Aj+NGULi12KcoPNCsQbMaTFOpAYN+KkpNdX8xnALdiYC5q+40qVizOz2+r2OnCEFXJngQT32H/5tyqgfUp3kCGEC0i61EVjh3RaqnvoA7Xo7o2P3Op/h3Oud2XoCuAcIoY/KoyeoTLLhJKLMEe0F8ml3ZMlfiFSkysIkK4WOqWh/Wx9vU3mzC68rFpY5ap1Z/kKlbEHRWk4d/1japLT6xlA4ktYSAgXvW/W4YiG7FNZC021YCA+WDTslWPKMvhm2LZNut96SNmyrPQCBGq8ph/iA42SBUSPcgWMh8GiPlMi7uulsc3Gwp6XRvxhHV3BFhLioZeYuLBZ1jxWvDnQJx1XZxRT2KY4r+z15S6YN7A6JqjxXA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(376002)(136003)(39860400002)(346002)(451199024)(1800799009)(186009)(82310400011)(36840700001)(40470700004)(46966006)(2906002)(316002)(70586007)(110136005)(86362001)(70206006)(36756003)(54906003)(40480700001)(5660300002)(4326008)(44832011)(8676002)(8936002)(41300700001)(40460700003)(47076005)(83380400001)(336012)(26005)(1076003)(426003)(16526019)(2616005)(36860700001)(356005)(81166007)(478600001)(82740400003)(7696005)(6666004)(26123001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Sep 2023 17:14:38.7445 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 29bc8608-3470-4e4a-a0b8-08dbae339623
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE3E.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9045
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
Remove and replace them accordingly.

Signed-off-by: Alex Hung <alex.hung@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 ++-----------------
 1 file changed, 2 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 1bb1a394f55f..f6a255773242 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6372,15 +6372,12 @@ amdgpu_dm_connector_late_register(struct drm_connector *connector)
 static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
 {
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
+	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
 	struct dc_link *dc_link = aconnector->dc_link;
 	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
 	struct edid *edid;
 
-	if (!connector->edid_override)
-		return;
-
-	drm_edid_override_connector_update(&aconnector->base);
-	edid = aconnector->base.edid_blob_ptr->data;
+	edid = drm_get_edid(connector, &amdgpu_connector->ddc_bus->aux.ddc);
 	aconnector->edid = edid;
 
 	/* Update emulated (virtual) sink's EDID */
@@ -6421,22 +6418,6 @@ static void create_eml_sink(struct amdgpu_dm_connector *aconnector)
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
-	}
-
 	edid = (struct edid *) aconnector->base.edid_blob_ptr->data;
 
 	aconnector->edid = edid;
-- 
2.42.0

