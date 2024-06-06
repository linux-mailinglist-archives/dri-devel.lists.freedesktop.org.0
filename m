Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA048FDC7A
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2024 04:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3274710E821;
	Thu,  6 Jun 2024 02:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="l3HekZtX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2081.outbound.protection.outlook.com [40.107.236.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBF310E821;
 Thu,  6 Jun 2024 02:04:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4H/JnhcSUVfga0NccXX/pgqGqExEyXAKPzoB6W91zDLxVUo8bPDrvFsV6zqJ9C2oLO1AiQ7XzF51w1hXJKw/v8RKG9NdJDeEM9NsoFMJqsscC5hvbXWLQmIzU1RjKV2LnARz1SeGecAh5HD313kRj0ElposcaHCCLlDpvg7Beq03fvz8dfnaldO/8d6BLC5G1tA+q/Njza7GL7UzI6GC0QIId8O4Zw0zb20UXyD5yT0pB3liDnhLWgybaEVNgsycGcXGmmQgbfFNpHZEmlopdOHyS+ussBTx3UgTBldQk1QEyr0FsQPvphtUSL5bkrdK18B/E6Bh8DPIF0pcfGTiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vqVbZds0SYN7rV/3MiTdSMP1NuVBe4NmYonJY7yl1fM=;
 b=bsUMEjCdqCCz/TvSTJUuXiT9O6uJM9QpCsz/UxW27+u1pY0HTxJf6yFxnMYBkDq/laQh9icTdBgk1UXPlgdWcxgOGjGkG2AyxO1Nfr5ofjZKaygarzMd9ynLHGthRKqqjLvihQv+MQhb4MI++A89tIACpBjM9JdIJvFmHWGRVews0jVI7Q9H5I1cb+/F2FqRLAuSlN0xZ+2rK+CX6BDI9+XdszhKZuzhJ25nsaGviOiD3hHO6KcJdGlbZGp92PaNsbdWF73jNYPLDHzd2eDPK6Y9rcKr/Zp3Sjtcc6a3wTeMgOBGGxU8Xp3gv5IyNLayD4Z4/ulWySnF34RcCU3UCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vqVbZds0SYN7rV/3MiTdSMP1NuVBe4NmYonJY7yl1fM=;
 b=l3HekZtXCkds7G+WiXqTum9NJkuKVUYGjZOXXWXnFzHw/qauYBwNLmIVbi6wtR5b+nBJW3xlPSUQNOb0hZciCmf9QE08nW8nNxmtW/8kcBB6Oj7BMfW3pRuIHFCDwTaSW/1Wb2FVed1xivLyaq7xm0pmdwn+JQVx127ts6Z5wyk=
Received: from CH5P221CA0020.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1f2::11)
 by CY5PR12MB9055.namprd12.prod.outlook.com (2603:10b6:930:35::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.17; Thu, 6 Jun
 2024 02:04:30 +0000
Received: from CH1PEPF0000AD7C.namprd04.prod.outlook.com
 (2603:10b6:610:1f2:cafe::cc) by CH5P221CA0020.outlook.office365.com
 (2603:10b6:610:1f2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7656.17 via Frontend
 Transport; Thu, 6 Jun 2024 02:04:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7C.mail.protection.outlook.com (10.167.244.84) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7452.22 via Frontend Transport; Thu, 6 Jun 2024 02:04:30 +0000
Received: from SITE-L-T34-2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Wed, 5 Jun
 2024 21:04:27 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
CC: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, <dri-devel@lists.freedesktop.org>, Leo Li
 <sunpeng.li@amd.com>, Sean Paul <seanpaul@google.com>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: [PATCH v3 1/2] drm: Introduce 'power saving policy' drm property
Date: Wed, 5 Jun 2024 21:04:03 -0500
Message-ID: <20240606020404.210989-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606020404.210989-1-mario.limonciello@amd.com>
References: <20240606020404.210989-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7C:EE_|CY5PR12MB9055:EE_
X-MS-Office365-Filtering-Correlation-Id: b55985f8-607d-436a-8834-08dc85cd0083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|36860700004|82310400017|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DZFgstq3+9VadGOxb+3AG/E3fuKwl/l9GdnY7p53/daXlrsYbpUAtp94o35O?=
 =?us-ascii?Q?dUyowhvUmJ9ROdi59o2VMlC9Ev1qbgBjPsJWxaFpFtT7RSZWVfikKD+7pWpB?=
 =?us-ascii?Q?V1YZ4tOBsaKYgAK9cYBzFf5a1Vwp17Tjlkm04nNUOBgTCdFV9/MKCiKWhdGS?=
 =?us-ascii?Q?T45mT8z2JgBzA5XNWtS/ucQwns2MgBIfZBuhn7t2lEGkd1ymsQI/vwhd+9WW?=
 =?us-ascii?Q?vsH2w1ubCFn7yo3QyVb8Fl9ZqbjPGM5yunYNvh0odkxoJBuocNmJUemteQC8?=
 =?us-ascii?Q?6r+UD99CBxm2zBL9TjQOP7jim0UwA48V7VC56ywhIuB0uX7fdQ2vmQb+N1vK?=
 =?us-ascii?Q?XIXoixnPPbKulhMcnvlB7QV8vyej44FAWuoxMNCs7dwQGUXZsZuXc/8ny/nn?=
 =?us-ascii?Q?Zin/JlV0FOzAV8f7W60sXDnWeMmwrptBvXEbIinAxR17SMzH9xW7ddtcp0jp?=
 =?us-ascii?Q?M3+XaPceubv5yN2adgd5VlfAI3GY3O0UlzEMXegsSSBnDSpOc6SbQtnP+buO?=
 =?us-ascii?Q?YZRizgsvS9FNjyDEMMda/v5JJMDJpL1lwGq73QpcivyioiOzDNjv6C6NjymV?=
 =?us-ascii?Q?GQMUSBNbD3IYCLTO2YdGkLA0pAhpK3+OXRyH7c08Lpf6w2RqX14bf9mFOwV7?=
 =?us-ascii?Q?OtLsdVH/dru+dPT58pJK2wrIxy92W68UV/j9fMpx36aiHDzqRYOTFLmOehNr?=
 =?us-ascii?Q?+rpUOfK9CvPp37J0hPYLR+/E1wFb7xrxPesgJ81CSJyokqWugV3dXxXmadWi?=
 =?us-ascii?Q?e9AB5W21MiH5gTF1Eyokcy3kPDPEfo3D8KzdhwU6+5293fkqyMStGTdovTCH?=
 =?us-ascii?Q?4OPKIk/5uI9Nw5aqNICMYbOH2iKs+YY7D2bSMJSwXYTj3j0btoKixq6y9utI?=
 =?us-ascii?Q?mM2lZA2y6QxBvAPTsebBR/9sOL0M70Q8EALWCpkSC0iX3Xf9R170mA6nImfg?=
 =?us-ascii?Q?CFfcBdKcZscZ4KibG/IOTphBuis16JKZ3RB0g52BxR8XnJDwh8Dli8dtWKoL?=
 =?us-ascii?Q?4CFljlzSTZR7OEAUbkpcm+5K7GePkbO1DO6TYRSvsiDEputu+oFLJ70/iAQN?=
 =?us-ascii?Q?25qKD7WxjREzXLFcL4tVHm+WMtfHLhOoFUmXhwk7WD7K87lgjW1MNKEe8/vf?=
 =?us-ascii?Q?i1jlDarjhREl/mKMqCTU0N9j9n0U/KbU4lnlK6iqka4iLUH0b5jxzfLB+1zO?=
 =?us-ascii?Q?vatkzveHtabWMU5YvkWGCLS0oNJfbFKyxglLdvTBi0O9uvlVxA8VfSqRbZjV?=
 =?us-ascii?Q?3WMLFUhjwlrwgx+iJnB7hRReEc4z/rafMAd9IPhokBeyUCC1WR1ahrSM3eNR?=
 =?us-ascii?Q?VK5pRjwWAmzlu/9hIpoav04ITo17mQuY2ba/6sO0ASQhDaXkQnHT3BDMiwVI?=
 =?us-ascii?Q?ZZDTlZ0ZR/ve2mWhMCEZaowBfbBV?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(82310400017)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2024 02:04:30.2396 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b55985f8-607d-436a-8834-08dc85cd0083
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD7C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB9055
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

Acked-by: Leo Li <sunpeng.li@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v2->v3:
* Add tag
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
index 8de3c9a5f61b..eefcbf6c5377 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -969,6 +969,11 @@ struct drm_mode_config {
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
index 1ca5c7e418fd..558a306a23a7 100644
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

