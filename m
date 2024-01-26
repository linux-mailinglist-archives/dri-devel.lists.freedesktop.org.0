Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B2383E1FE
	for <lists+dri-devel@lfdr.de>; Fri, 26 Jan 2024 19:55:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF99510FD78;
	Fri, 26 Jan 2024 18:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2066.outbound.protection.outlook.com [40.107.237.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC9F910FD5E;
 Fri, 26 Jan 2024 18:55:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gt+0+2AfmNBHuvzaS/lsgqIUa2Ozuwkiz0HeEN0YPyJ19ggW5p5Ids6aFlyJc7Gv9nt2alxRIYk/0EHiZmL+A6ukHq+cx0hFLF+9vawc0KGHJ6GPZAXqigCKpx0jJVOoP47hX9nGuv522B1u6WeyzPmFIymG56XfoDiBpVw7CpkOz4Lun0B6gMiz+ALCgrgpR1caXw2kCVxyV3hcZIGs9UD75IFXer9JbnAIRHYDMq15pw8HOimUS/sj0qrNoTIBsaMTF9iKplcMCwPjDNdtSqm+wIbstICoLdXQGPBFaoCdqnTUezVbkYMbwNjOafATiR3I4sNl6JRKC4AW8CL7Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66Vx4GHD7Q38xoFwa1pZit4wSgj+IvKLEQn562SH+5g=;
 b=gUSMhu6Xdfs5L3PbHUHITNOQfFuDfYIJeu3DaMuJpo51KZEg4MqgGJhczs/UDXRNNhpVjEzH52C5DfzOmfyfhlL9qyXWm9fcF35siAa95ZMWkOJlYUNDSoPGk9HemweIgmDK6GyINxLrgJNLywtfylCrTxqYsUvgr386F4rBU44/51BhEi4jI8/ec/XtK8M14hpZM17InEr+dGd9b5xbvAg/o0/dZSDYE5CR486l078h2YIxUoQsFueMRBehPptmeswIeGvdgb73Kb965LD9WKTyh3nYoWW34FLkAE0SrPcIzSqEvawzTC9tSQVd0DkTTgzdPgl9JqXP13d6WAgdyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66Vx4GHD7Q38xoFwa1pZit4wSgj+IvKLEQn562SH+5g=;
 b=GZPP7lFvK2WqPniINP1gt0I43PeIy4EowItLM5K/7fkPJfftF8ojGIRiPRBFX02ssH4LXtDJmkOEUUKJ0AgRAi8cljjREybmd7kIQ9k7r8aofACtBHoZurUf4sX2ORVakKe6SQNLhLCaHhmhWFkjGdmNuQN1mAJCj90rdjPTo2g=
Received: from BN9PR03CA0573.namprd03.prod.outlook.com (2603:10b6:408:10d::8)
 by DS0PR12MB7993.namprd12.prod.outlook.com (2603:10b6:8:14b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 26 Jan
 2024 18:55:15 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:10d:cafe::77) by BN9PR03CA0573.outlook.office365.com
 (2603:10b6:408:10d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7228.27 via Frontend
 Transport; Fri, 26 Jan 2024 18:55:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7228.16 via Frontend Transport; Fri, 26 Jan 2024 18:55:15 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Fri, 26 Jan
 2024 12:55:12 -0600
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexander.deucher@amd.com>, 
 Harry Wentland <harry.wentland@amd.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Hans de Goede <hdegoede@redhat.com>
Subject: [PATCH 2/2] drm/amd: Fetch the EDID from _DDC if available for eDP
Date: Fri, 26 Jan 2024 12:46:39 -0600
Message-ID: <20240126184639.8187-3-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240126184639.8187-1-mario.limonciello@amd.com>
References: <20240126184639.8187-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|DS0PR12MB7993:EE_
X-MS-Office365-Filtering-Correlation-Id: 35326c83-62f1-4d08-ee3e-08dc1ea05534
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fxm+QCg9zNsDOdotC7Y5GMTySPho2jP5qKbIfiXVdlcAU2iChPy/ZpO/2IEtivhWKvkGuj/U9cUD4qpt/pn13Dvc3/2ZceOnYltjVzM8aVg2Oz61NimOA+c6T713wVQ3Dmb073VzV/HdSQoMtq4w/GYzZ2Uj8/R/5MKLsnY0MgM7e1cEtKZ1PNEYWSrMu2SMDvGm5Wl3fsKXcnbCJ3wnTM29cpEYqsY/a34x8Ru2DGM1r3sh+R8cKDgP9ozRwVv8aIf0xNF1L+uvZB7JGTVO7A8bTNSgnEvT2GAgw49QVJExH4AlEgMq25MesowYVPFa8+DHi6kGR7KGHL/6vXkJnlh6ahMfkNkKIYG2L57iCb/+czaAH5oY2MzDCo6gSTEPC0MYLdp3uX19aC8SjnOlFgC/54jT5YE4PSTdbrX6+9Z/Q+Lm+2lRuHdxi3IGi5bCfRfGi2Y/YlOC0P1mbwAKf5bLwUttHS9fcTiLZXIGLB8qV+2QqZZzZNrEpflXC7+OtyLrwkrM21ZIg0SaVPqcHzXEG0LYpIYfJ/OjdqQVDLe/rXpIQmfbscTSXGZ76CUPDwIQ//soRo4bYxLGPQRuHVxLww3EEV9r0VFCBV6K9H8E2M3fCyBMtCFLNdkin96qn1JjN+4xWjvehMGlbcu4iQ+ToIRPuTMj5alV6olRPd8SYP4s9NLjPPJL+ETbvOMLsEHLc+0z+VfcFFraJaZ4UP2sBuxYA7snEVEY7xqymUAWS2bEF6KF9m0AooXLPq1VPXAHLPNNB45vuzplXlei5w==
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(4636009)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(451199024)(1800799012)(82310400011)(64100799003)(186009)(36840700001)(40470700004)(46966006)(36860700001)(8676002)(4326008)(8936002)(47076005)(44832011)(7696005)(316002)(2616005)(1076003)(478600001)(41300700001)(336012)(426003)(40480700001)(2906002)(26005)(81166007)(16526019)(36756003)(86362001)(110136005)(356005)(6666004)(40460700003)(70206006)(83380400001)(82740400003)(54906003)(70586007)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2024 18:55:15.2431 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 35326c83-62f1-4d08-ee3e-08dc1ea05534
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7993
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

Some manufacturers have intentionally put an EDID that differs from
the EDID on the internal panel on laptops.

Attempt to fetch this EDID if it exists and prefer it over the EDID
that is provided by the panel.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu.h           |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c      | 30 +++++++++++++++++++
 .../gpu/drm/amd/amdgpu/amdgpu_connectors.c    |  5 ++++
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  8 ++++-
 .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c |  7 +++--
 5 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu.h b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
index c5f3859fd682..99abe12567a4 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu.h
@@ -1520,6 +1520,7 @@ int amdgpu_acpi_get_mem_info(struct amdgpu_device *adev, int xcc_id,
 
 void amdgpu_acpi_get_backlight_caps(struct amdgpu_dm_backlight_caps *caps);
 bool amdgpu_acpi_should_gpu_reset(struct amdgpu_device *adev);
+void *amdgpu_acpi_edid(struct amdgpu_device *adev, struct drm_connector *connector);
 void amdgpu_acpi_detect(void);
 void amdgpu_acpi_release(void);
 #else
@@ -1537,6 +1538,7 @@ static inline int amdgpu_acpi_get_mem_info(struct amdgpu_device *adev,
 }
 static inline void amdgpu_acpi_fini(struct amdgpu_device *adev) { }
 static inline bool amdgpu_acpi_should_gpu_reset(struct amdgpu_device *adev) { return false; }
+static inline void *amdgpu_acpi_edid(struct amdgpu_device *adev, struct drm_connector *connector) { return NULL; }
 static inline void amdgpu_acpi_detect(void) { }
 static inline void amdgpu_acpi_release(void) { }
 static inline bool amdgpu_acpi_is_power_shift_control_supported(void) { return false; }
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
index e550067e5c5d..c106335f1f22 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
@@ -1380,6 +1380,36 @@ bool amdgpu_acpi_should_gpu_reset(struct amdgpu_device *adev)
 #endif
 }
 
+/**
+ * amdgpu_acpi_edid
+ * @adev: amdgpu_device pointer
+ * @connector: drm_connector pointer
+ *
+ * Returns the EDID used for the internal panel if present, NULL otherwise.
+ */
+void *
+amdgpu_acpi_edid(struct amdgpu_device *adev, struct drm_connector *connector)
+{
+	struct drm_device *ddev = adev_to_drm(adev);
+	struct acpi_device *acpidev = ACPI_COMPANION(ddev->dev);
+	void *edid;
+	int r;
+
+	if (!acpidev)
+		return NULL;
+
+	if (connector->connector_type != DRM_MODE_CONNECTOR_eDP)
+		return NULL;
+
+	r = acpi_video_get_edid(acpidev, ACPI_VIDEO_DISPLAY_LCD, -1, &edid);
+	if (r < 0) {
+		DRM_DEBUG_DRIVER("Failed to get EDID from ACPI: %d\n", r);
+		return NULL;
+	}
+
+	return kmemdup(edid, r, GFP_KERNEL);
+}
+
 /*
  * amdgpu_acpi_detect - detect ACPI ATIF/ATCS methods
  *
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
index 9caba10315a8..c7e1563a46d3 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c
@@ -278,6 +278,11 @@ static void amdgpu_connector_get_edid(struct drm_connector *connector)
 	struct amdgpu_device *adev = drm_to_adev(dev);
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
 
+	if (amdgpu_connector->edid)
+		return;
+
+	/* if the BIOS specifies the EDID via _DDC, prefer this */
+	amdgpu_connector->edid = amdgpu_acpi_edid(adev, connector);
 	if (amdgpu_connector->edid)
 		return;
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index cd98b3565178..1faa21f542bd 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6562,17 +6562,23 @@ static void amdgpu_dm_connector_funcs_force(struct drm_connector *connector)
 {
 	struct amdgpu_dm_connector *aconnector = to_amdgpu_dm_connector(connector);
 	struct amdgpu_connector *amdgpu_connector = to_amdgpu_connector(connector);
+	struct amdgpu_device *adev = drm_to_adev(connector->dev);
 	struct dc_link *dc_link = aconnector->dc_link;
 	struct dc_sink *dc_em_sink = aconnector->dc_em_sink;
 	struct edid *edid;
 
+	/* prefer ACPI over panel for eDP */
+	edid = amdgpu_acpi_edid(adev, connector);
+
 	/*
 	 * Note: drm_get_edid gets edid in the following order:
 	 * 1) override EDID if set via edid_override debugfs,
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
index e3915c4f8566..6bf2a8867e76 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
@@ -895,6 +895,7 @@ enum dc_edid_status dm_helpers_read_local_edid(
 {
 	struct amdgpu_dm_connector *aconnector = link->priv;
 	struct drm_connector *connector = &aconnector->base;
+	struct amdgpu_device *adev = drm_to_adev(connector->dev);
 	struct i2c_adapter *ddc;
 	int retry = 3;
 	enum dc_edid_status edid_status;
@@ -909,8 +910,10 @@ enum dc_edid_status dm_helpers_read_local_edid(
 	 * do check sum and retry to make sure read correct edid.
 	 */
 	do {
-
-		edid = drm_get_edid(&aconnector->base, ddc);
+		/* prefer ACPI over panel for eDP */
+		edid = amdgpu_acpi_edid(adev, connector);
+		if (!edid)
+			edid = drm_get_edid(&aconnector->base, ddc);
 
 		/* DP Compliance Test 4.2.2.6 */
 		if (link->aux_mode && connector->edid_corrupt)
-- 
2.34.1

