Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E339E842CAF
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 20:27:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 233331134CE;
	Tue, 30 Jan 2024 19:27:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2054.outbound.protection.outlook.com [40.107.101.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF6B112846;
 Tue, 30 Jan 2024 19:27:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHVKsblFPLsIlEYp5zWqWTXZ4UxmCvYrdlfI3QnwCPSxqiGJurVLjkBhjAFVd/qkiDw4BptpRh6oRI/W6mkLg3AU3gmc4Gv2QMpNSUIcjg75lrDolQq6C4P1TpOS4XOxKzqZsjlw+ctZjOnewtGi67hk1A3MtjYb5NZpy+0IEOoSQQMzTcOXL2Ccv04siJLA8XPoS7SM+6UredtqWpFEBPpq4E2FcQvJ+RotdP8A1DVznEhI+Sye1fx8DJRVInocya6KdMmusLeL/GJpldcqj2X98X7b3lS8N15EM7hvGI83BF59p86ofKuacrd+RTcvv8rxB0AoSmWLUzAeFO6zzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGjorbt8i1WoJyt0gsOHV4IXlJIyyELkjxtpx80Lwfc=;
 b=PKDplR2nEseUNrGbDI3dIhDWwxT79554Tila8Cev+8k6wEI6+/Qnk+ms1vmHqDmzPdk5lnXMarfG+LTVeNtlsAkSRYub332c9WDuxUhnIfSQjOsWVvCbsJshaBPjfYfdJ4H93/wMJSK9GLoKmgTodj6k0Pn3GJVEgMEp+J9md4Qv4w5MZSWzVv6WW/QADjmTDZPTuXpFx4UC0IDGXrEOOzvzmWq2LjXn+FrnNe12iEYH2L4+4+54Ii1MHN5DWFmjb8ARMhiOzHkLWY/KlM4hhwsYyAI/NWoZi6EPnuR16TwoBBPf+oSAZt07GxqEOIOK2XZQqjkSzhMylKRvw4b1jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGjorbt8i1WoJyt0gsOHV4IXlJIyyELkjxtpx80Lwfc=;
 b=Dmkmo4akEabyCHd3c2nmJlbMntaLNQ6w6RDLiiZdRcGLUASWklMj+ZzbQrx0F3uyb6nTecRVHf3MQ9sForRnIKwmTR88n5n6V17/JfvnEYsFiJ6FfDKKZC/B5396tY1TD8oKV/jF32dakkJ7OpGtdJnN3iHYFPeYUsYZX8Ask58=
Received: from MW3PR05CA0022.namprd05.prod.outlook.com (2603:10b6:303:2b::27)
 by SJ2PR12MB7823.namprd12.prod.outlook.com (2603:10b6:a03:4c9::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.33; Tue, 30 Jan
 2024 19:26:41 +0000
Received: from MWH0EPF000971E7.namprd02.prod.outlook.com
 (2603:10b6:303:2b:cafe::60) by MW3PR05CA0022.outlook.office365.com
 (2603:10b6:303:2b::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Tue, 30 Jan 2024 19:26:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E7.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Tue, 30 Jan 2024 19:26:41 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 30 Jan
 2024 13:26:37 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH v2 4/4] drm/nouveau: Use drm_get_acpi_edid() helper
Date: Tue, 30 Jan 2024 13:26:08 -0600
Message-ID: <20240130192608.11666-5-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240130192608.11666-1-mario.limonciello@amd.com>
References: <20240130192608.11666-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E7:EE_|SJ2PR12MB7823:EE_
X-MS-Office365-Filtering-Correlation-Id: 8cb3eb7d-1312-4a82-b5d1-08dc21c96311
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MjEVcpnR/btjaHx/kdfzcGqwrJ8cXlkGTysLIiebtQ5aT4ccZkN35fdnbmp1XZ5ItikvuBfPwOfM9XRBOEzjfum1ZOBkrSQ7+FHrBVPq2EsZUTC9s0HJcomO3vkGtqP6u2qAS5CSxuI8xRW2qs8nXpr+vXy8QnxgX1bwiBUnVNNf3566uoqkyWSagqLiSe6XWa9qNHnVEeZ12mq6XW5LysgTrfwzU3gmWl5bVs7SBa3KEsfDdo8hpOr0Fflrbf3k/apsXy4ykNZDuWVraeMxjizT4qqRcP4UQOewXH3n9DYfLQ1LbWUjHrHy/HVjwEJbY9H+aeAYNbXggE6Mfuo6p8NJ/9RPW7FIb+LiOt9quCLZ9pPCJN5q6NBLXyaq1nda6L3EpOxkXKD6H3k64yJ/a1TmUuX3U47NLNpe9+FeQFt1AJZjCpZKPyFnTeMKWwvK/wXbR/hEYJANP6VL9l1mnTO9O3XIDz/roBWreX3afb6jpS9P1DgwZaOGScFAB9bH9jK7L0MnQ+kJFz2goYs/PKjHSgXDGccNeqoQ8FbyguN9TtCWVepVfGAPnRyboPRRXCXOEgpjuEP8QI2d8OsvM7oPWJovX9XyZ5vTkYH8GeVzW9sB2+Hj4LT8K6ekuTHW8TxPDml+ATFzGwr+QkrZ2Z+STh851x8dwI1VVDxV6hfXPdZMFC6oTK+nTjNLMHownamkeUQPYkhwd8mgVF2vbFe4qHLASM9xZwSK7ZOypI+CumwB1+7G50THgiQqOjXQjSd3uH0GDyeTyzFFUYzNXA==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(39860400002)(396003)(376002)(136003)(346002)(230922051799003)(451199024)(82310400011)(186009)(1800799012)(64100799003)(46966006)(40470700004)(36840700001)(426003)(16526019)(1076003)(41300700001)(2616005)(336012)(26005)(40460700003)(40480700001)(316002)(6666004)(54906003)(36756003)(110136005)(7696005)(36860700001)(83380400001)(478600001)(47076005)(356005)(82740400003)(81166007)(70586007)(8936002)(86362001)(2906002)(44832011)(4326008)(70206006)(5660300002)(8676002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2024 19:26:41.1672 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8cb3eb7d-1312-4a82-b5d1-08dc21c96311
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E7.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7823
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
Cc: open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Melissa Wen <mwen@igalia.com>, "open list:ACPI" <linux-acpi@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Mark
 Pearson <mpearson-lenovo@squebb.ca>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rather than inventing a wrapper to acpi_video_get_edid() use the
one provided by drm. This fixes two problems:
1. A memory leak that the memory provided by the ACPI call was
   never freed.
2. Validation of the BIOS provided blob.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v1->v2:
 * New patch
---
 drivers/gpu/drm/nouveau/nouveau_acpi.c      | 27 ---------------------
 drivers/gpu/drm/nouveau/nouveau_acpi.h      |  2 --
 drivers/gpu/drm/nouveau/nouveau_connector.c |  2 +-
 3 files changed, 1 insertion(+), 30 deletions(-)

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
index 856b3ef5edb8..746571d4cac0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -713,7 +713,7 @@ nouveau_connector_detect_lvds(struct drm_connector *connector, bool force)
 	 * valid - it's not (rh#613284)
 	 */
 	if (nv_encoder->dcb->lvdsconf.use_acpi_for_edid) {
-		edid = nouveau_acpi_edid(dev, connector);
+		edid = drm_get_acpi_edid(connector);
 		if (edid) {
 			status = connector_status_connected;
 			goto out;
-- 
2.34.1

