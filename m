Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8738CC8C1
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 00:06:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AB910EF93;
	Wed, 22 May 2024 22:06:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OALqkieN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BFB910E3B8;
 Wed, 22 May 2024 22:05:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bso1TAE3uAaVX6Btjs92MJCe08QU14iklWaa7q+Sm0QeSPkqgUegMivZetzrUKNCWlrO6vCdHeWxcVm1D8EhOsoM+dAatKxMujEPxAHeXe2DIhhXH/4Tli1D8fmwhAtmt15XFa+HEuTqBwkgrTJimj2iVsvSMPhOvzlenZp8wVajlSgalmcweBZv9p15B/NUcs1DPyr9Gep1o6n0tB0pu1IEcqqgxPuS5ivAB7lnfhBfwGo/G4+z3bPfVflrNeQfJbDZkIatzEiZUG+7eI3ntvxCyDCVqEG6lnPgPf0CE6iPViJZ1kvJD3U7E2d2Hv80dvOdF3RgjgtzYqhgtbkh7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Nf9tSBk3Y0t2tBanFLxTyexGIIoDStIS53kzjq38UA=;
 b=OY1tF+J/DUx2q4NT6Bv85kGk8Z0dHY/3VIAhYgueG5kIKGLawH5QmdTEMW1iP2H7PiBU9ZCaBODnzxgTdKwg1xNkJWcNCLvCsb7OeFcCNKu3A8NCkEW8RYJhIAPXrGRNz8eVRAoboCai+LdSEEz/A16eNfHOm43R0sBSc2kuVyTQMIhNK6jgT3L7s2nMrb/oj22d9sbxqbwV58pGGYIkDR71wKqZIKL8WtxHJU52Vj45jpb9L8yZa6jydzPa1P1jqZ4lyC7nKNMyc/bDQSptoZmrjBhvjg98Syo4egFvDgxFEAhNRN9LeyRKKLN3dIjKnWgdV4U7s1EQIz5XKj7viw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Nf9tSBk3Y0t2tBanFLxTyexGIIoDStIS53kzjq38UA=;
 b=OALqkieNL/4A1pe/1e0IXjdvsp/BuGqvePXf2c2TqSyAZQbyMASLBCRw+j0krxiWONMP7D3fWHORE2sXgKcKw5wfTsdOTU0HOxVyfzpofytoRI7zBjcfW5y86VxfxYr++XBcvxXJW9fDM+AAdqDXedQRBofQhmZn8L5Y8fS6470=
Received: from PH7P220CA0047.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:32b::6)
 by CH2PR12MB4200.namprd12.prod.outlook.com (2603:10b6:610:ac::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 22:05:54 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:510:32b:cafe::36) by PH7P220CA0047.outlook.office365.com
 (2603:10b6:510:32b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.20 via Frontend
 Transport; Wed, 22 May 2024 22:05:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7611.14 via Frontend Transport; Wed, 22 May 2024 22:05:53 +0000
Received: from AUS-P9-MLIMONCI.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 22 May
 2024 17:05:51 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
CC: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, <dri-devel@lists.freedesktop.org>, Leo Li
 <sunpeng.li@amd.com>, Sean Paul <seanpaul@google.com>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: [PATCH v2 1/2] drm: Introduce 'power saving policy' drm property
Date: Wed, 22 May 2024 17:05:30 -0500
Message-ID: <20240522220531.32728-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240522220531.32728-1-mario.limonciello@amd.com>
References: <20240522220531.32728-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|CH2PR12MB4200:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d11c14b-424c-4cf5-c208-08dc7aab5975
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|376005|82310400017|36860700004; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?omi0JkuEGgcV1REVFZMSJoyBUvQrMc+e4y2IRLlxtaOd1cJAmFlkbaTQn/bh?=
 =?us-ascii?Q?Ehz5RLK6s55/8aZwsoXvC7qVYPRBaiVoKh7PgDRQv5fMTKfFTReyEgP9givN?=
 =?us-ascii?Q?E/vCiZ/kyJGmspRXExyNMgPkD5JkpAmAZ7QSSMMIV7l60tRaus6XUmOjGnZ8?=
 =?us-ascii?Q?KbNU06Gymj34CnL3Ehls+1NX6RTrgoMZ6uRijxrgrGNTm88cKs0ZsCT0A4+2?=
 =?us-ascii?Q?qIQeMq1zkg+HrrT1rZ/yqEMrcVYxoH9NgobpLHNVEth6KTDdaXcIl938qI2i?=
 =?us-ascii?Q?Ycj34s0WjCopFCLmfMUxMZuYnB88zDtrpoh2Gn6QhsNSKa+S6ISqVES0FScQ?=
 =?us-ascii?Q?Ej3kP/vWRDX/qnwbVhm6Y3L9Xqhhmbuw+PsiV5qoR4tjPmqSv7K1Da/CWPYL?=
 =?us-ascii?Q?B2hYgPuPzi7oPepw9D/NvxGmeSVfjV37L2ooU1IMfoscHowCsvaq9eOSzpbF?=
 =?us-ascii?Q?4ZJ80eMu14Wi5hAflfG7tuKhrkaXLlEcivKEKR6OpBovDj47ZejC/Py1roz0?=
 =?us-ascii?Q?66+w+wU9w4pI0PgwdEM0tkH9p9GaU6BF42u21XP9IS+U+FhVtc1Lz0SdZbBV?=
 =?us-ascii?Q?rdg53tvadLU6k40MjSF/FR9+8zo71DAqrMaJTA1ywbJnzeMpdL8Q7iuCXqq9?=
 =?us-ascii?Q?nVktI8CK3PTPtsLFHqfIfZ5yI7ld7WQidFisQRLteAnxhZenbKWWcWox3w2J?=
 =?us-ascii?Q?ulrJFkM5RTBiNbn0XvngbfbuVHc6HmVJq/zzFv3MfMHoh54Nu6wW3/0JbVt8?=
 =?us-ascii?Q?uDMfI0RTnfiFZdTL1D5EjR/GHB3tu4/KWI+68EZT89f8TztzrWXC7ciJzs4I?=
 =?us-ascii?Q?fySIlGI5cTQ9lAgttfL8osNQnSGFVIjqcDC3r7NIokywAFVOrUnsHGEBUBA1?=
 =?us-ascii?Q?wCPAZuQaOzwQ85v6zYViVDuUpTFVTGQqLFlFJb1VNpvaHWBl0m0aVZ2lxOsD?=
 =?us-ascii?Q?jOfVYEQ0xpA7WXAY/PmPmqJzM7yQCyQ3vJEzk40n2C/fKpu3FK9K3jgqSPvO?=
 =?us-ascii?Q?7Iz6QQ9ZpixO3cMbVkow0ElpqepKQAxi6FLTwqG6+9wfvTpqEWj+zRDyx62F?=
 =?us-ascii?Q?vQLhQn1lN0ZBvCeSSa43syzFAdvT/egvbFHC6OCXMXYlrh2Ich0B36O/6R+m?=
 =?us-ascii?Q?ZMEYoSyb2aZ8mgeapKLw1Wby8QX+EOY61U6fatXuIJ3hyyYfu79OavhuKz2q?=
 =?us-ascii?Q?SjNfy4/Tbn5hdPJF4nDQxQrXVuDbjWtqNYWPkvF1f1asPPkCLJKPMIaxiySn?=
 =?us-ascii?Q?MFTTkqiC3F1WboEK5g2oFOoKaeW4341ApAKWL4iMaozFzHh1zwuPDV52a9df?=
 =?us-ascii?Q?6oaGktOYGsNfoL5h1wwiMmJUeeaevzkyopwizH4y8kCjGQfnybuIj/Q5ie3r?=
 =?us-ascii?Q?lJK6NE25vP9j/8ASy2g7kAh8HVer?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400017)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 22:05:53.7091 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d11c14b-424c-4cf5-c208-08dc7aab5975
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4200
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

The `power saving policy` DRM property is an optional property that
can be added to a connector by a driver.

This property is for compositors to indicate intent of policy of
whether a driver can use power saving features that may compromise
the experience intended by the compositor.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/drm_connector.c | 46 +++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     |  2 ++
 include/drm/drm_mode_config.h   |  5 ++++
 include/uapi/drm/drm_mode.h     |  7 +++++
 4 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 4d2df7f64dc5..088a5874c7a4 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -961,6 +961,11 @@ static const struct drm_prop_enum_list drm_scaling_mode_enum_list[] = {
 	{ DRM_MODE_SCALE_ASPECT, "Full aspect" },
 };
 
+static const struct drm_prop_enum_list drm_power_saving_policy_enum_list[] = {
+	{ __builtin_ffs(DRM_MODE_REQUIRE_COLOR_ACCURACY) - 1, "Require color accuracy" },
+	{ __builtin_ffs(DRM_MODE_REQUIRE_LOW_LATENCY) - 1, "Require low latency" },
+};
+
 static const struct drm_prop_enum_list drm_aspect_ratio_enum_list[] = {
 	{ DRM_MODE_PICTURE_ASPECT_NONE, "Automatic" },
 	{ DRM_MODE_PICTURE_ASPECT_4_3, "4:3" },
@@ -1499,6 +1504,16 @@ static const u32 dp_colorspaces =
  *
  *	Drivers can set up these properties by calling
  *	drm_mode_create_tv_margin_properties().
+ * power saving policy:
+ *	This property is used to set the power saving policy for the connector.
+ *	This property is populated with a bitmask of optional requirements set
+ *	by the drm master for the drm driver to respect:
+ *	- "Require color accuracy": Disable power saving features that will
+ *	  affect color fidelity.
+ *	  For example: Hardware assisted backlight modulation.
+ *	- "Require low latency": Disable power saving features that will
+ *	  affect latency.
+ *	  For example: Panel self refresh (PSR)
  */
 
 int drm_connector_create_standard_properties(struct drm_device *dev)
@@ -1963,6 +1978,37 @@ int drm_mode_create_scaling_mode_property(struct drm_device *dev)
 }
 EXPORT_SYMBOL(drm_mode_create_scaling_mode_property);
 
+/**
+ * drm_mode_create_power_saving_policy_property - create power saving policy property
+ * @dev: DRM device
+ * @supported_policies: bitmask of supported power saving policies
+ *
+ * Called by a driver the first time it's needed, must be attached to desired
+ * connectors.
+ *
+ * Returns: %0
+ */
+int drm_mode_create_power_saving_policy_property(struct drm_device *dev,
+						 uint64_t supported_policies)
+{
+	struct drm_property *power_saving;
+
+	if (dev->mode_config.power_saving_policy)
+		return 0;
+	WARN_ON((supported_policies & DRM_MODE_POWER_SAVING_POLICY_ALL) == 0);
+
+	power_saving =
+		drm_property_create_bitmask(dev, 0, "power saving policy",
+					    drm_power_saving_policy_enum_list,
+					    ARRAY_SIZE(drm_power_saving_policy_enum_list),
+					    supported_policies);
+
+	dev->mode_config.power_saving_policy = power_saving;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_mode_create_power_saving_policy_property);
+
 /**
  * DOC: Variable refresh properties
  *
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index fe88d7fc6b8f..b0ec2ec48de7 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2025,6 +2025,8 @@ int drm_mode_create_dp_colorspace_property(struct drm_connector *connector,
 					   u32 supported_colorspaces);
 int drm_mode_create_content_type_property(struct drm_device *dev);
 int drm_mode_create_suggested_offset_properties(struct drm_device *dev);
+int drm_mode_create_power_saving_policy_property(struct drm_device *dev,
+						 uint64_t supported_policies);
 
 int drm_connector_set_path_property(struct drm_connector *connector,
 				    const char *path);
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 973119a9176b..32077e701e2f 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -954,6 +954,11 @@ struct drm_mode_config {
 	 */
 	struct drm_atomic_state *suspend_state;
 
+	/**
+	 * @power_saving_policy: bitmask for power saving policy requests.
+	 */
+	struct drm_property *power_saving_policy;
+
 	const struct drm_mode_config_helper_funcs *helper_private;
 };
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 7040e7ea80c7..c2c86623552c 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -152,6 +152,13 @@ extern "C" {
 #define DRM_MODE_SCALE_CENTER		2 /* Centered, no scaling */
 #define DRM_MODE_SCALE_ASPECT		3 /* Full screen, preserve aspect */
 
+/* power saving policy options */
+#define DRM_MODE_REQUIRE_COLOR_ACCURACY	BIT(0)	/* Compositor requires color accuracy */
+#define DRM_MODE_REQUIRE_LOW_LATENCY	BIT(1)	/* Compositor requires low latency */
+
+#define DRM_MODE_POWER_SAVING_POLICY_ALL	(DRM_MODE_REQUIRE_COLOR_ACCURACY |\
+						 DRM_MODE_REQUIRE_LOW_LATENCY)
+
 /* Dithering mode options */
 #define DRM_MODE_DITHERING_OFF	0
 #define DRM_MODE_DITHERING_ON	1
-- 
2.43.0

