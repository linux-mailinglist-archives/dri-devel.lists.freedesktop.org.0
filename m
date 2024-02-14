Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E60E855553
	for <lists+dri-devel@lfdr.de>; Wed, 14 Feb 2024 22:58:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878AD10E7E6;
	Wed, 14 Feb 2024 21:58:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="wJYsqY42";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92BB710E482;
 Wed, 14 Feb 2024 21:58:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wk3+d/A8Wpzme7kQAJIO+XoLG7Xu3be19ezWQr6xK9a7gg/5AZ84w3wSCEpGxG1VKf1sJLrFZzruS1oB7A0Cccd8YdT1R5JcpkJO/HqfgQo2RntgBwGEPkBpKVzecHhj66dxo80WkJm3w9/5MC4hsWGRnrjJfIMIsRH/PYlZMnU1/JRRZdx9a8z5SqB07IZY8hYgJ5kEfRZQrwHFejHOXyycjmGrEriHhVhDbLDWJQK1moMSRv33bHcRIIlnXVq0tXEMIPzTK4gyB2LW/0CDLewxnh6YSrYHqAnFgWLZqWgkBVOl//TLYJYwj38YuLS/eXdE/aYWL+OIp7Lzdq23Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mp0M3qgQ+UH8u3Fzym1meKBbPuuWeEsx8opzMEJNl3A=;
 b=h6NR39qTZrSjQdTvQ8tn/KxEY0340XSggVn4vJXB+BHm2DXZ7Tir1h0IEcY0eQJv0U3CBVH3+lzzEH/zwTwwJp/du1U4dDkEdbw0O9+xF9PY7BrY2w4joHmOxvX55rEmUOyJJHxolJ3QgOaQnAKXyc/bFPvnQ5IsEQerUljs+O0r0VSz+abLQyFnx9bS6OrW9v2j2AJuLJIORMUyLVLTKxBBAayGxsUdsADlh1fBjvo6iRo4Mni1e6oSGNFLDTZtqy0dNMIBN/wgHxbM+czABdker/9tZiAewi+bsCxopWXesjfl90875TbhGU1P37PQlSYZQbvuSqtsqsLLp3QQCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mp0M3qgQ+UH8u3Fzym1meKBbPuuWeEsx8opzMEJNl3A=;
 b=wJYsqY42uITuR/fGmS0zCq8F6a1uzcLZiZ6vDBtRpfupBrtAlo3LNtqHE6COaQmS4GpfV4JldplrhTHTekqjerj22TANaMqLliedo7JKmSqtgjLZbzjDOPA0SWCEV53yFntUHZwoXftBex4ZrRGj0KIAuXISq4r9lYWT1ftzBR0=
Received: from BL0PR1501CA0017.namprd15.prod.outlook.com
 (2603:10b6:207:17::30) by DS0PR12MB7511.namprd12.prod.outlook.com
 (2603:10b6:8:139::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Wed, 14 Feb
 2024 21:58:30 +0000
Received: from MN1PEPF0000ECD9.namprd02.prod.outlook.com
 (2603:10b6:207:17:cafe::b3) by BL0PR1501CA0017.outlook.office365.com
 (2603:10b6:207:17::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26 via Frontend
 Transport; Wed, 14 Feb 2024 21:58:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD9.mail.protection.outlook.com (10.167.242.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Wed, 14 Feb 2024 21:58:30 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 14 Feb
 2024 15:58:29 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: Daniel Vetter <daniel@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Alex Deucher <alexander.deucher@amd.com>,
 "Hans de Goede" <hdegoede@redhat.com>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>
CC: <amd-gfx@lists.freedesktop.org>, "open list:USB SUBSYSTEM"
 <linux-usb@vger.kernel.org>, <linux-fbdev@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <platform-driver-x86@vger.kernel.org>, <intel-xe@lists.freedesktop.org>,
 <linux-renesas-soc@vger.kernel.org>, "open list:ACPI"
 <linux-acpi@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Melissa Wen <mwen@igalia.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v6 5/5] drm/nouveau: Use drm_edid_read_acpi() helper
Date: Wed, 14 Feb 2024 15:57:56 -0600
Message-ID: <20240214215756.6530-6-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240214215756.6530-1-mario.limonciello@amd.com>
References: <20240214215756.6530-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD9:EE_|DS0PR12MB7511:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f03c3d6-49f2-45bd-1b22-08dc2da814ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aU4Dnc+/pdRyBBJP93PgXymR5ZU2ZAhQZDmRLaklig1bH1Z1TyOiaTXREm6SVLi7VeBcUeoyzQU49oQ0Y/E/2avYtqGA1gwq7bJwaWHkehrAj38yY+5dfEi+br+GjqQzZweNcY5is6iEJz0WEy/WXo1Bvoz/cD37H+6a/px+ROWwcBCG2DdbHvAahGtobeocZnJiDjwm6g5zSCSW+3QfaM73/5S2gjRbSpV2xYCBaqUf63ORUDgYrQwnJKKDZUVm037yMtGBdbzDKuH+cqMr8gpPeDrElAM6A8e8mL0HEuKw1koomSab+EtzYAFnhxT6lGk4HTw3tmM0x5F6xN8R8alwi75rTZkWgGLPUbmVQuv1YyoEKlLhw2B3UN0AXgTJJe7WHVPTkiACOrm7jYH5fdPyy/2LN7sLP2xxYQOjs5gi/8EZJP8doJZrh3F1OvkoL6id9xiNYM8JoR+kex1VnWr1Bvotmx1kGB0nxU/S73ooCa1vMBt0AwuduI9czFFBnOb+e9vjM6pkmeL55LwWphJyZXouqjJLJqSv+Zzw5RRzadtPvITv8p/YMjBQtv1JEmxIF5F01yDmJ/bHPZ+0rGhHXc3x85IhBYTFpUv0OwrlIUllbd252eB/6sF63H8J11SJ6MxjP3cXuGzKZFQpAFmoYarx1iU3o9kwuxRfC5Q=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(82310400011)(36860700004)(451199024)(1800799012)(64100799003)(186009)(40470700004)(46966006)(8936002)(8676002)(81166007)(5660300002)(83380400001)(82740400003)(2906002)(4326008)(356005)(44832011)(70206006)(70586007)(7416002)(41300700001)(1076003)(426003)(336012)(16526019)(26005)(2616005)(6666004)(54906003)(478600001)(7696005)(316002)(110136005)(86362001)(36756003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2024 21:58:30.8269 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f03c3d6-49f2-45bd-1b22-08dc2da814ef
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7511
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

Rather than inventing a wrapper to acpi_video_get_edid() use the
one provided by drm. This fixes two problems:
1. A memory leak that the memory provided by the ACPI call was
   never freed.
2. Validation of the BIOS provided blob.

Convert the usage in nouveau_connector_detect_lvds() to use
struct drm_edid at the same time.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_acpi.c      | 27 ----------------
 drivers/gpu/drm/nouveau/nouveau_acpi.h      |  2 --
 drivers/gpu/drm/nouveau/nouveau_connector.c | 35 +++++++++------------
 3 files changed, 14 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
index 8f0c69aad248..de9daafb3fbb 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -360,33 +360,6 @@ void nouveau_unregister_dsm_handler(void) {}
 void nouveau_switcheroo_optimus_dsm(void) {}
 #endif
 
-void *
-nouveau_acpi_edid(struct drm_device *dev, struct drm_connector *connector)
-{
-	struct acpi_device *acpidev;
-	int type, ret;
-	void *edid;
-
-	switch (connector->connector_type) {
-	case DRM_MODE_CONNECTOR_LVDS:
-	case DRM_MODE_CONNECTOR_eDP:
-		type = ACPI_VIDEO_DISPLAY_LCD;
-		break;
-	default:
-		return NULL;
-	}
-
-	acpidev = ACPI_COMPANION(dev->dev);
-	if (!acpidev)
-		return NULL;
-
-	ret = acpi_video_get_edid(acpidev, type, -1, &edid);
-	if (ret < 0)
-		return NULL;
-
-	return kmemdup(edid, EDID_LENGTH, GFP_KERNEL);
-}
-
 bool nouveau_acpi_video_backlight_use_native(void)
 {
 	return acpi_video_backlight_use_native();
diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.h b/drivers/gpu/drm/nouveau/nouveau_acpi.h
index e39dd8b94b8b..6a3def8e6cca 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.h
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.h
@@ -10,7 +10,6 @@ bool nouveau_is_v1_dsm(void);
 void nouveau_register_dsm_handler(void);
 void nouveau_unregister_dsm_handler(void);
 void nouveau_switcheroo_optimus_dsm(void);
-void *nouveau_acpi_edid(struct drm_device *, struct drm_connector *);
 bool nouveau_acpi_video_backlight_use_native(void);
 void nouveau_acpi_video_register_backlight(void);
 #else
@@ -19,7 +18,6 @@ static inline bool nouveau_is_v1_dsm(void) { return false; };
 static inline void nouveau_register_dsm_handler(void) {}
 static inline void nouveau_unregister_dsm_handler(void) {}
 static inline void nouveau_switcheroo_optimus_dsm(void) {}
-static inline void *nouveau_acpi_edid(struct drm_device *dev, struct drm_connector *connector) { return NULL; }
 static inline bool nouveau_acpi_video_backlight_use_native(void) { return true; }
 static inline void nouveau_acpi_video_register_backlight(void) {}
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 856b3ef5edb8..492035dc8453 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -687,22 +687,13 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder = NULL;
-	struct edid *edid = NULL;
+	const struct drm_edid *drm_edid = NULL;
 	enum drm_connector_status status = connector_status_disconnected;
 
 	nv_encoder = find_encoder(connector, DCB_OUTPUT_LVDS);
 	if (!nv_encoder)
 		goto out;
 
-	/* Try retrieving EDID via DDC */
-	if (!drm->vbios.fp_no_ddc) {
-		status = nouveau_connector_detect(connector, force);
-		if (status == connector_status_connected) {
-			edid = nv_connector->edid;
-			goto out;
-		}
-	}
-
 	/* On some laptops (Sony, i'm looking at you) there appears to
 	 * be no direct way of accessing the panel's EDID.  The only
 	 * option available to us appears to be to ask ACPI for help..
@@ -712,10 +703,14 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
 	 * the nouveau decides an entry in the VBIOS FP mode table is
 	 * valid - it's not (rh#613284)
 	 */
-	if (nv_encoder->dcb->lvdsconf.use_acpi_for_edid) {
-		edid = nouveau_acpi_edid(dev, connector);
-		if (edid) {
-			status = connector_status_connected;
+	if (nv_encoder->dcb->lvdsconf.use_acpi_for_edid)
+		connector->acpi_edid_allowed = true;
+
+	/* Try retrieving EDID via BIOS or DDC */
+	if (!drm->vbios.fp_no_ddc || nv_encoder->dcb->lvdsconf.use_acpi_for_edid) {
+		status = nouveau_connector_detect(connector, force);
+		if (status == connector_status_connected) {
+			drm_edid = drm_edid_alloc(nv_connector->edid, EDID_LENGTH);
 			goto out;
 		}
 	}
@@ -734,12 +729,9 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
 	 * stored for the panel stored in them.
 	 */
 	if (!drm->vbios.fp_no_ddc) {
-		edid = (struct edid *)nouveau_bios_embedded_edid(dev);
-		if (edid) {
-			edid = kmemdup(edid, EDID_LENGTH, GFP_KERNEL);
-			if (edid)
-				status = connector_status_connected;
-		}
+		drm_edid = drm_edid_alloc(nouveau_bios_embedded_edid(dev), EDID_LENGTH);
+		if (drm_edid)
+			status = connector_status_connected;
 	}
 
 out:
@@ -750,7 +742,8 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
 		status = connector_status_unknown;
 #endif
 
-	nouveau_connector_set_edid(nv_connector, edid);
+	drm_edid_connector_update(connector, drm_edid);
+	drm_edid_free(drm_edid);
 	if (nv_encoder)
 		nouveau_connector_set_encoder(connector, nv_encoder);
 	return status;
-- 
2.34.1

