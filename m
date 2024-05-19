Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 263EE8C94B9
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2024 15:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A10410E249;
	Sun, 19 May 2024 13:06:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zFOBUKeM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2068.outbound.protection.outlook.com [40.107.102.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A702910E200;
 Sun, 19 May 2024 13:06:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HGY0Zb1d2y4zntPLSEsZhhUmo76AqYQ1vSjv2B2PO50vxZ7hoQklmnyEfP/FD5zReeWzXZCr5AgGWCHLoGO0NMXQq0Udad5o8FonePACj2fj7+iBDjeFSg3NqTZUiF1AHSbLQQOrkns7kckhP8u3RC6rpMAVhdt/oqW7jeoGCtUZF/PByZSnqEMlIVD2QHBswkiL0YzFfTudIegQxKD1TIuawSrK6fNHmbTi4y+j/Tp9plAAWQ/QvN8R8w4HiUTWQc5lEbSrk+JEuqLY9XtZlMyZ/CMJZYt6egFZhaGUGVi7yE6s/UKeBG8RG6QhQeHgXDuddPycPWz251xJ4wMjzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+0e7/5U5mxgtbXPbAdOsaM0T4CC3pVSWN+xSgNVZrI=;
 b=J5A05Wl7UakbIs5LFjQ4zgmTsCnhe4B0TflgwlS7jEhM0o2CtHjMunIS2+jvk8QUrDLEoXp/7RFsT3qMNE4sru6jRBw/LfnqsSIJki+ZxifFRdTYdycZcISH9YSAysGcb54SiKxP1nDm0apkdADHFFMQK19M8WFSlMR5IxD+4UPBcKjZn7H+kw0ZbDRR1UtcQ64AkQoXe9wDBEYuo8NGGxzeuxZxJi6WAI5+qoR61dhgsCyHKqjONf9FO5fexuUYK+6OGCdpBbbqbE07uLq3p5p2AkYKmbdYYTe19X5lRpcKJYHWtsOCcEfVLRctNSi8/3+wizYwo4ZUkqCEfSehBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+0e7/5U5mxgtbXPbAdOsaM0T4CC3pVSWN+xSgNVZrI=;
 b=zFOBUKeMVH5IOMErZBOPnDujs99RTJz4vJH77Sn02S3Ad7HruD8tC+bNG7WmbGA7cDbEjUwrKqIqsEhwi9SnhL+36mgifegu5mWUdxnpnNxGrPLakfcn9c3NIda4PmdbG8RmwpsxpdfUaVfOF7qRiV8DuMezp9b42VJ6yMUihXQ=
Received: from BYAPR03CA0005.namprd03.prod.outlook.com (2603:10b6:a02:a8::18)
 by SJ0PR12MB5612.namprd12.prod.outlook.com (2603:10b6:a03:427::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Sun, 19 May
 2024 13:06:28 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a02:a8:cafe::35) by BYAPR03CA0005.outlook.office365.com
 (2603:10b6:a02:a8::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.34 via Frontend
 Transport; Sun, 19 May 2024 13:06:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Sun, 19 May 2024 13:06:28 +0000
Received: from SITE-L-T34-2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Sun, 19 May
 2024 08:06:27 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>
CC: <Harry.Wentland@amd.com>, <xaver.hugl@gmail.com>,
 <dri-devel@lists.freedesktop.org>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: [PATCH 1/2] drm: Introduce panel_power_saving drm property
Date: Sun, 19 May 2024 08:06:09 -0500
Message-ID: <20240519130610.7773-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240519130610.7773-1-mario.limonciello@amd.com>
References: <20240519130610.7773-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|SJ0PR12MB5612:EE_
X-MS-Office365-Filtering-Correlation-Id: 69464b19-779b-4bc5-1b62-08dc78047f33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|82310400017|36860700004|376005|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pCYM4sRhCkefM/jFWUY9PEX0lz4KKRlV60IMGyB1LezzHl6Y1uayigVVBJuj?=
 =?us-ascii?Q?TN1Rfp+icAPfxPFVjX7kBW737cM8qEd+qpXFDxjBPGmLk1ZVjpb3uYvbx5cy?=
 =?us-ascii?Q?NbtvMf+j148FDOPVs3mLv9FQbwHmjAw7Vgmf1zRRRMMXo57Ibc1cjQ3YLtNF?=
 =?us-ascii?Q?mUmc3R8KZELIUlBo8ZAl9q1E1kyXE5P9bLlbDLnUa212Ed2HE5+qghM5k802?=
 =?us-ascii?Q?nOhwY349bAop8NtUdf0i1sUdoHMd9rMGgDlxYqktjW97NTeRJjg42JkrWPWH?=
 =?us-ascii?Q?MSbz3TL6yiOU8GWQQX4XsdwUmrfsvdF/wIeV5fW/XNKF/0mEJpYnLCeEpMwK?=
 =?us-ascii?Q?dG5iMQeVSGeLHSb8oOE7+vQcRU65ysZgNti8m6CWB70xNZLOKuBv15WGCgaD?=
 =?us-ascii?Q?eI5BEZutwOz3k1nCJpWNLpCAhBluYJqr20DUfM+u3ARi80vcjFRObiZH6rzN?=
 =?us-ascii?Q?w2olR9TV+IZb7kQfesWcqkTWs065HCm1ydO7PP149yMHi+45Wr2XTRpmDfte?=
 =?us-ascii?Q?k19iiRVgneGKk5Yu5Eo6Y1sMjK11da4j8KigJbo9vv7qnT5tsShwacVtzaAb?=
 =?us-ascii?Q?dg1PfnpAVG9fS8UOwzg7OfCh9VkoZk9Smdei6X99QMKKbyaV43ClJlZ+H2ov?=
 =?us-ascii?Q?uysm1xulESjA2Ce0MpI1Iw4T5WBkHYFHhAoxFA0A7/sQ6Ku/RrMyFguisnTd?=
 =?us-ascii?Q?D7xgfC1Yyaha7w5PG9S4XPVA7lRj5R0h49XybxSqtuGKAoUP0KmN5vWpCaCK?=
 =?us-ascii?Q?M9JHNnmCDItHpaanFrB5eZaAosMJqEFEvoE8/X4VlvGI746Yw45TBKj+M9UD?=
 =?us-ascii?Q?31iJjEKhEiBp2To2wCGleFPauXv0BFsQarrCkTEO/6LX6bzs6E5vcjiIQWcU?=
 =?us-ascii?Q?YfkxNVgDk92hcd6lUGihUI20DwNJXjTbUvrQeG2XPRhW9J0WMkBIcEFKxY1n?=
 =?us-ascii?Q?tA8rBcvJTlwjDOlh6mUGzA5T6n0cSp3lEQFvRjVrnXe5+GRUUbsWiJ4I6j8+?=
 =?us-ascii?Q?xpX+7ofi7XvL3U5IK2JYpTUQ2xQB7eGO/GWMWX4UCtaBAermMj5kht7X7OUc?=
 =?us-ascii?Q?i5GLpFsOa/B63JgSjZsgW8oavLActAFC5xF/tPuuwt35V+JJkOuSFEbK2F0u?=
 =?us-ascii?Q?C31jjAteREn1Kb+9XE/SpuPX5TZUw7VuxbNLxQuiObyNloIvrIk5m9NJf95S?=
 =?us-ascii?Q?AAgTvqblqE9MSgKJ6ppS7PBhJXRVva6tAj1H+BnTfQEB3ZtEbntbZh5CxjyL?=
 =?us-ascii?Q?umqgnbO9qFHG+WUxzlUaWwPHX9tM5GZXbrz54iMCflFEamTXNe5qjPuU68nU?=
 =?us-ascii?Q?pJ4g+WTBSFIpcfxf7zUoURrrO3tQ9tW3t9T5OZN1e/uWY4YeZLWN/m1Oj+6x?=
 =?us-ascii?Q?tSZWnXpbIlo6ifoVKeZ45+HtqQxR?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(82310400017)(36860700004)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2024 13:06:28.7619 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 69464b19-779b-4bc5-1b62-08dc78047f33
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5612
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

The `panel_power_saving` DRM property is an optional property that
can be added to a connector by a driver.

This property is for compositors to indicate intent of allowing
policy for the driver to use power saving features that may
compromise color fidelity.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/drm_connector.c | 36 +++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     |  1 +
 include/drm/drm_mode_config.h   |  6 ++++++
 include/uapi/drm/drm_mode.h     |  4 ++++
 4 files changed, 47 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 4d2df7f64dc5..ccf672c55e0c 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -961,6 +961,11 @@ static const struct drm_prop_enum_list drm_scaling_mode_enum_list[] = {
 	{ DRM_MODE_SCALE_ASPECT, "Full aspect" },
 };
 
+static const struct drm_prop_enum_list drm_panel_power_saving_enum_list[] = {
+	{ DRM_MODE_PANEL_POWER_SAVING_ALLOWED, "Allowed" },
+	{ DRM_MODE_PANEL_POWER_SAVING_FORBIDDEN, "Forbidden" },
+};
+
 static const struct drm_prop_enum_list drm_aspect_ratio_enum_list[] = {
 	{ DRM_MODE_PICTURE_ASPECT_NONE, "Automatic" },
 	{ DRM_MODE_PICTURE_ASPECT_4_3, "4:3" },
@@ -1963,6 +1968,37 @@ int drm_mode_create_scaling_mode_property(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_mode_create_scaling_mode_property);
 
+/**
+ * drm_mode_create_panel_power_saving_property - create panel power saving property
+ * @dev: DRM device
+ *
+ * Called by a driver the first time it's needed, must be attached to desired
+ * connectors.
+ *
+ * Atomic drivers should use drm_mode_create_panel_power_saving_property()
+ * instead to correctly assign &drm_connector_state.panel_power_saving
+ * in the atomic state.
+ *
+ * Returns: %0
+ */
+int drm_mode_create_panel_power_saving_property(struct drm_device *dev)
+{
+	struct drm_property *panel_power_saving;
+
+	if (dev->mode_config.panel_power_saving)
+		return 0;
+
+	panel_power_saving =
+		drm_property_create_enum(dev, 0, "panel power saving",
+				drm_panel_power_saving_enum_list,
+				    ARRAY_SIZE(drm_panel_power_saving_enum_list));
+
+	dev->mode_config.panel_power_saving = panel_power_saving;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_mode_create_panel_power_saving_property);
+
 /**
  * DOC: Variable refresh properties
  *
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index fe88d7fc6b8f..4ea3f912c641 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2025,6 +2025,7 @@ int drm_mode_create_dp_colorspace_property(struct drm_connector *connector,
 					   u32 supported_colorspaces);
 int drm_mode_create_content_type_property(struct drm_device *dev);
 int drm_mode_create_suggested_offset_properties(struct drm_device *dev);
+int drm_mode_create_panel_power_saving_property(struct drm_device *dev);
 
 int drm_connector_set_path_property(struct drm_connector *connector,
 				    const char *path);
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 973119a9176b..099ad2d8c5c1 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -954,6 +954,12 @@ struct drm_mode_config {
 	 */
 	struct drm_atomic_state *suspend_state;
 
+	/**
+	 * @panel_power_saving: DRM ENUM property for type of
+	 * Panel Power Saving.
+	 */
+	struct drm_property *panel_power_saving;
+
 	const struct drm_mode_config_helper_funcs *helper_private;
 };
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 7040e7ea80c7..82e565cc76fb 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -152,6 +152,10 @@ extern "C" {
 #define DRM_MODE_SCALE_CENTER		2 /* Centered, no scaling */
 #define DRM_MODE_SCALE_ASPECT		3 /* Full screen, preserve aspect */
 
+/* Panel power saving options */
+#define DRM_MODE_PANEL_POWER_SAVING_ALLOWED	0 /* Panel power savings features allowed */
+#define DRM_MODE_PANEL_POWER_SAVING_FORBIDDEN	1 /* Panel power savings features not allowed */
+
 /* Dithering mode options */
 #define DRM_MODE_DITHERING_OFF	0
 #define DRM_MODE_DITHERING_ON	1
-- 
2.45.0

