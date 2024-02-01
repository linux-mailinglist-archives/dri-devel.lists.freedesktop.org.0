Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BF384633A
	for <lists+dri-devel@lfdr.de>; Thu,  1 Feb 2024 23:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D32F410EB45;
	Thu,  1 Feb 2024 22:11:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mZc2UyKR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2043.outbound.protection.outlook.com [40.107.212.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D65C710E974;
 Thu,  1 Feb 2024 22:11:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZoLBTAVX+79o31DrbNVqo6BEQFjWxrCv1D7gA2uwJetjvAdm5Qob+qrwNkIPqeuFENAV+hqRQMm9ZiKPHRXWFqSRMCveYnDzJdrv2zCd60gNkd3yQHL3c41eHkoo8WDjacYNMeEGBE1E7OQdKeKOVwBIXRI0aTSkOZmHxLqa2DEtmVOqVUWyT035/8iXBgqAsxgIsYNvIIS4mSeYOAznkl3fMgW91YN0+GJ8RLzx+v/XIqLnRtGhl9URn+BtbXQGMdcsVOfaU7W88Vz6TKNir6NGSi+y/q2IUWS71uJdUApQ2fvExa6N+XDyW/axnL4aj4TVGbH9dGnLVIEtx5n+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGjorbt8i1WoJyt0gsOHV4IXlJIyyELkjxtpx80Lwfc=;
 b=GcqFtlSu8gYa15u8gkAElj7uKmXKDtJWXM5iwj71NdCH4TEAa+u1D/JsCMn7mEArzaK5PJ0oxrkqtTY2g4ENroUAlny98J5FBUjcpuGAyZH29lt4wRuX0Z6PlzMonucNo3DtqnWQroZzAnFTmbbH9YTGMoFtEPkculBVp1MrK5GOArZcDDwd1a+v5zziqItvaDqUZqu4u0Nnnj2zPcX4RXfTj5OFSgRsM+9zrciDqW+Rk/Sz6QDkQ9H49r7o1X52BHvYbD9furQP3807pUq6nXPziaXnnX/01vCB/2IL1TQjvBrnrhZvvJ8BJ1EyzsvEoxsCrqhDkxwq68m4Q21ZRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGjorbt8i1WoJyt0gsOHV4IXlJIyyELkjxtpx80Lwfc=;
 b=mZc2UyKRCOxTyvvydtukdDjVeNkrNfAaRESzhBAPQEhw04vE4Aaet60/PAfDjA9Aif+dhr1Th2VJ3fjuVis7JQa+Kyu1IKPHs5t1a49mMpaRwoHRUKHU0aYRoj+YQnWU12wiknpH+Nt1BM18IvqZE+MG1yXYbT49Obk6QZu4y78=
Received: from DM6PR10CA0033.namprd10.prod.outlook.com (2603:10b6:5:60::46) by
 SJ0PR12MB6878.namprd12.prod.outlook.com (2603:10b6:a03:483::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24; Thu, 1 Feb
 2024 22:11:41 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:5:60:cafe::94) by DM6PR10CA0033.outlook.office365.com
 (2603:10b6:5:60::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22 via Frontend
 Transport; Thu, 1 Feb 2024 22:11:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7249.19 via Frontend Transport; Thu, 1 Feb 2024 22:11:41 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Thu, 1 Feb
 2024 16:11:40 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Hans de Goede <hdegoede@redhat.com>
CC: "open list:ACPI" <linux-acpi@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, Melissa Wen <mwen@igalia.com>, "Mark
 Pearson" <mpearson-lenovo@squebb.ca>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: [PATCH v3 4/5] drm/nouveau: Use drm_get_acpi_edid() helper
Date: Thu, 1 Feb 2024 16:11:18 -0600
Message-ID: <20240201221119.42564-5-mario.limonciello@amd.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|SJ0PR12MB6878:EE_
X-MS-Office365-Filtering-Correlation-Id: 167f1b24-9c81-4efd-96bd-08dc2372c4d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3wMVIaS/pKAr4bLqn6pkNbLnG8FJxa4tzOCuSKM/0oQQ3LpAC2C+AxUtCz6yH6xWeLDVAEVywbB6aZCDfJDInYeMvoFksF1YgA9TjE+i72UiYNAte58Koc2OeX3cm0fUQrlNf7PwEpRerWVLNIlLqybYux+kzgguOGMssMt3ajK4H9N/1m90yIQ2nFXnbVmwV7cotP60N4oluOm9NBI1V08Uc+rBZmFWjGTY/leNar1JX3vcwFP3y1Cl4oLFQOCHkhY2OHaZaaNNUCeziZ60r7MFZ0enAIRdKPFkqJCL2W3SNl1g9pfY2VcRbucIakL5ly9ZTJ6r+LLgi3vxctWv5LjRB+YXrs+EMjdVMJWh5Ura6g8pgQ/jJkBYL1AkIX6+yUm4ZZS2FUS2/fXReODuSL+HMj2oOPauB6OrNg8CEDfpaetcZkrc5hSUEHk6SSQDyXXf4+2hUsEecbMmBQ/e7IBhhE3R5wYvA4Q2tWpOw/vM3YT8VytYEE8WY0segUo1BAh5QKHQ+j5Kgu0rhQ8CbCj1qPdomtfiydyaXnpJRELhqb4wS4okDzHDNKpfQSA/wsuzGq4V5HPEx0Nja1dYz7G9GyJWYsoCCy+vF1O/ZVw2ZQqc+gHMDISGTQ0YWowXOTbGKvvaJVMO6PD4x7IrdcfZy4UdZ/YyEO5PZ7QiWH90ee/+g+n0RvFRC3zov3d1SkVRtExn73fd9JMTiQKJEsTbt3AovI82G0pi29tZhCFnXfIob3YDYK03GoUY81NhMCxZFBPDAcb/J1td3L40Vg==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(346002)(376002)(396003)(136003)(39860400002)(230922051799003)(82310400011)(1800799012)(64100799003)(186009)(451199024)(40470700004)(46966006)(36840700001)(47076005)(336012)(426003)(6666004)(70586007)(86362001)(54906003)(110136005)(316002)(70206006)(16526019)(8676002)(36860700001)(44832011)(8936002)(4326008)(81166007)(356005)(478600001)(1076003)(7696005)(26005)(40480700001)(2616005)(5660300002)(82740400003)(40460700003)(83380400001)(36756003)(2906002)(41300700001)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2024 22:11:41.4300 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 167f1b24-9c81-4efd-96bd-08dc2372c4d1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6878
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

