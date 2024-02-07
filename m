Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C571F84D5F5
	for <lists+dri-devel@lfdr.de>; Wed,  7 Feb 2024 23:44:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1DF810EC81;
	Wed,  7 Feb 2024 22:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OEsfHfnP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97FBA10EB0F;
 Wed,  7 Feb 2024 22:44:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KNl74K56QvnToMly1R7Y2PaYFjHe3dSC29FUA3/TMVLJ1mIfGGxA4R3nHeHwekXrwsSXR62o3K2U1qPp1a33pPO9eO6KeqDrzWG9dwaXt9IHQMaSgNJHXf/C963CiWVGHoOilakOeYBeIMWxu45CN+L8VpUgwA8XV2dCm4KUJWdQZ8s77jRq6T5Dp7ShpMI3Ohtj8pZ2E3lhdmGCuS0qGIDYnt3mYLVu6TarwKBGMZHBSS2/5U5vo489zdTKIRDsBAmh3uDN1AEA640O85WE66BB6peiCGFBkksKozEpdFJlMwzZU7/McLRnmn33EMKN5K63N+F8eOx37thWaK3rlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0U758bXDmlr5xoCHYpCSP5/Wjo9dBGJnEuGvD8N0Nc=;
 b=fpRLTLcWy6dYev2KTbEY/Tf7xEX1o9DRPFgdUopc7smyJ5hhhcc4H5FObQ4mB8Rn4PvsgT2E4hzKpLClpt0LPwZYKIJr5gV/KUiXdDXWh13C5jgSOegEPvuLFe7buGTTt2HieYMP7C3Zb2O5c7atZ5ruFMq6XiAJWCDNj5y8wUqFLf1lnC5qDtARxE2xGTZvlLyCPYONsabNTVuJW23ym/ST6A8DvSC9Wswuovq0SC+h7tGWHOjS+1Jrv/rihl7elcIQk7nFbq2RC1Jkatoq76O/6yIG/yucHkzUUhk0hhNuVKbP2fs6nFT4xHc7UF5iSgr5HsRNvxFXmWjEd7bIOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0U758bXDmlr5xoCHYpCSP5/Wjo9dBGJnEuGvD8N0Nc=;
 b=OEsfHfnPsoV3xdf6lKkSS+37UwtB2w1oDlxGbE8+5ya+kO2NHQ4m1ZFRF3qM9Dsw5d3fiC8LTtAhJEGD/2MenQAUQ0AZ3CMy0nCO550/1YjSBHl/DKnLg3oF663I3fiqgzXN/dX1iPR4AJHvKHTFthhwer3T9jKrNnVlchoAWRs=
Received: from CY5PR17CA0050.namprd17.prod.outlook.com (2603:10b6:930:12::15)
 by BY5PR12MB4259.namprd12.prod.outlook.com (2603:10b6:a03:202::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.15; Wed, 7 Feb
 2024 22:44:43 +0000
Received: from CY4PEPF0000EE32.namprd05.prod.outlook.com
 (2603:10b6:930:12:cafe::4f) by CY5PR17CA0050.outlook.office365.com
 (2603:10b6:930:12::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.37 via Frontend
 Transport; Wed, 7 Feb 2024 22:44:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE32.mail.protection.outlook.com (10.167.242.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Wed, 7 Feb 2024 22:44:42 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Wed, 7 Feb
 2024 16:44:41 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>
CC: "open list:ACPI" <linux-acpi@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, Melissa Wen <mwen@igalia.com>, "Mario
 Limonciello" <mario.limonciello@amd.com>
Subject: [PATCH v4 2/3] drm/nouveau: Use drm_get_acpi_edid() helper
Date: Wed, 7 Feb 2024 16:44:28 -0600
Message-ID: <20240207224429.104625-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240207224429.104625-1-mario.limonciello@amd.com>
References: <20240207224429.104625-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE32:EE_|BY5PR12MB4259:EE_
X-MS-Office365-Filtering-Correlation-Id: ad78dee2-2960-4990-29f2-08dc282e605c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JqGfOO11rv357/+ATJeflevmC+69qHH1rZ397RtUom8SwnQQJCBp+5FtXYYMwS5/xAACecZfs6/NSY7q+uWXIqvGE85xuE/YzCN2sKe5Hhpa396CdofTl/jETsRlVTE3yZKwuk4Qw7xJCvP7IpOY8bK1Fp+jIS/Cz5eWMoyXuoF46T8EAhStiz0+SiEHnGAvimrWalrS77AHxIrEgqYYkHdlbN0G9YA6hvpM5P6gLb8f/sH/yDD2ng+bdhyNeHY6NMx4Ky0iviNT+J4WxO143IltGbhV3Hxonsl8iybOrz7dWUbfFFN60DlKmiFsxh7J9awMQpG4AtuMs2rnWtOT+pSKFHoyt8iSNKd43t056AiJEt055B9nffvjoSTx6ZfuRNhqHeNrH9HcilOaLnPQU7VQPBbq+U6aE+z/YAc4K/o14mFzAuXYBWID5pPwY2OkitwykwvZ7zum1eD+Y9EJWyTQ8eDGUpQutgpYaD9MEGMBRs2IGlxU043G+EpbXooUKaQMONo0dCrhk/fVIwQOtqmQeltgbeG7IDnArXRjpwL9zIv5nYOxdw6s5M3Gzipf0vVEajClroINEF+NdSbnpnYgClYdAg9AxGTjMvGNyLA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(396003)(346002)(136003)(376002)(39860400002)(230922051799003)(64100799003)(82310400011)(186009)(1800799012)(451199024)(46966006)(36840700001)(40470700004)(36756003)(41300700001)(2616005)(81166007)(83380400001)(426003)(336012)(1076003)(82740400003)(16526019)(356005)(110136005)(4326008)(6666004)(316002)(70586007)(478600001)(70206006)(5660300002)(54906003)(7696005)(26005)(44832011)(86362001)(8936002)(2906002)(8676002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Feb 2024 22:44:42.8933 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ad78dee2-2960-4990-29f2-08dc282e605c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EE32.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4259
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
 drivers/gpu/drm/nouveau/nouveau_acpi.c      | 27 ---------------------
 drivers/gpu/drm/nouveau/nouveau_acpi.h      |  2 --
 drivers/gpu/drm/nouveau/nouveau_connector.c | 20 +++++++--------
 3 files changed, 9 insertions(+), 40 deletions(-)

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
index 856b3ef5edb8..4c47d231c65e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -687,7 +687,7 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nouveau_connector *nv_connector = nouveau_connector(connector);
 	struct nouveau_encoder *nv_encoder = NULL;
-	struct edid *edid = NULL;
+	const struct drm_edid *drm_edid = NULL;
 	enum drm_connector_status status = connector_status_disconnected;
 
 	nv_encoder = find_encoder(connector, DCB_OUTPUT_LVDS);
@@ -698,7 +698,7 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
 	if (!drm->vbios.fp_no_ddc) {
 		status = nouveau_connector_detect(connector, force);
 		if (status == connector_status_connected) {
-			edid = nv_connector->edid;
+			drm_edid = drm_edid_alloc(nv_connector->edid, EDID_LENGTH);
 			goto out;
 		}
 	}
@@ -713,8 +713,8 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
 	 * valid - it's not (rh#613284)
 	 */
 	if (nv_encoder->dcb->lvdsconf.use_acpi_for_edid) {
-		edid = nouveau_acpi_edid(dev, connector);
-		if (edid) {
+		drm_edid = drm_get_acpi_edid(connector);
+		if (drm_edid) {
 			status = connector_status_connected;
 			goto out;
 		}
@@ -734,12 +734,9 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
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
@@ -750,7 +747,8 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
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

