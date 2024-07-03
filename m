Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77FCD9252E0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jul 2024 07:17:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26EA910E287;
	Wed,  3 Jul 2024 05:17:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zg37K23/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2088.outbound.protection.outlook.com [40.107.236.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECC9D10E1CF;
 Wed,  3 Jul 2024 05:17:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ecInFSzRvd+OZ0XEMK5Zv2UbT1PrzkmGwl8WUj0b96nEWZm+Bx+RFF54eZ8ZQl90jGJ9io44peeNSVCu7G0qT9YE+VaWs+Jxx1088oL0InjjsLI/ObkehNHdou+wox7uADXQ44dWdylC4T5uk2MgbhhIL6hB3VZNQxEhjNfU36+v4CkZzeT2nE5crchptl5H67mPW8BVB5K6jhsGzGw1zOpEj6qro0lfEYX1Vbtpjms+dqhbejLw7k1TCN7PFcPMYGkhkDLN3OHYyxd7guJFowOK3vsMQ8ZpX5qkxgPw1h4OPLAi9zJo24vcWKXEdaOou9Uxpa9BkdJkMGJzKwGXcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kj8Q9EkxAgpAtrMO8OmCm7OOZ5qWVHibBJl2S/iK0r8=;
 b=ca4E4WAyC7aZRzGE32TFykC83I/F0nQ03moh/Lh92kgSPKw0AwFAqgtKEMhAteSSqGLP5ews98OO2tjn2sOZwIpQBy79hZlwnSeqPs1glvCH9KlPKWbrzbJj1WZae+qMS1g/aHcY6B2iYAf56gmq7Uvf2A+z5Ud7lgx5BW1XMBFWDlSwl4fc956C2reqLEMOwXTmdYhEjOqBQ44jKm6MESAjY51UmDT+NZY1ngDCNY2AjuQoRiMHJopqpVUMfuKQ80TEAY8aVvJ7Hkt0FJD4X7k09q6dsWCVhrnDn/ZLGdsmqcchFLaL3QZ7eJAkPK8CIdY3GOJpTmjzt8yaG0sCOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kj8Q9EkxAgpAtrMO8OmCm7OOZ5qWVHibBJl2S/iK0r8=;
 b=zg37K23/EcvQjV2sAOnYOPBtdL8ZLr/L0mKTxG4Zwqs21xjFGaSnu3WbqgHB3D+PYNi6bK/PCwutXVmY2qVkAdQ8u7cRRjFXaT2RFC/wtqgPzCnWUpOimuQAndmjmPWDS/qTVE+Airx1LwYWdVh9G8Q41dtfM/BdoFm8AwOitXQ=
Received: from MW2PR16CA0041.namprd16.prod.outlook.com (2603:10b6:907:1::18)
 by IA1PR12MB6187.namprd12.prod.outlook.com (2603:10b6:208:3e5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.33; Wed, 3 Jul
 2024 05:17:43 +0000
Received: from CO1PEPF000044F9.namprd21.prod.outlook.com
 (2603:10b6:907:1:cafe::6c) by MW2PR16CA0041.outlook.office365.com
 (2603:10b6:907:1::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.37 via Frontend
 Transport; Wed, 3 Jul 2024 05:17:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044F9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7762.1 via Frontend Transport; Wed, 3 Jul 2024 05:17:43 +0000
Received: from AUS-HP-PV-STX4.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 3 Jul
 2024 00:17:41 -0500
From: Mario Limonciello <mario.limonciello@amd.com>
To: <amd-gfx@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>
CC: Harry Wentland <Harry.Wentland@amd.com>, Xaver Hugl
 <xaver.hugl@gmail.com>, <dri-devel@lists.freedesktop.org>, Leo Li
 <sunpeng.li@amd.com>, Sean Paul <seanpaul@google.com>, Mario Limonciello
 <mario.limonciello@amd.com>
Subject: [PATCH v4 1/2] drm: Introduce 'power saving policy' drm property
Date: Wed, 3 Jul 2024 00:17:21 -0500
Message-ID: <20240703051722.328-2-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240703051722.328-1-mario.limonciello@amd.com>
References: <20240703051722.328-1-mario.limonciello@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F9:EE_|IA1PR12MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: 073413c1-9b82-4f8a-8502-08dc9b1f77dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v7dIgtJep42pRVCShPA3+e+Zz3pfJbi9cGt0/4Bc5bhMVWPm3m+ASHyvDlhU?=
 =?us-ascii?Q?at/OSTDUXrcvm2XBz9ZVPlz+vUUNXc74SNoq+T3hfdicIU6ufktBiJ3Ot0cA?=
 =?us-ascii?Q?yj4if5U057nHNHXjUUCzt7nB4eIZlUdkmavd5hzsWw0sFLUFPghtdJH4g+7h?=
 =?us-ascii?Q?nfGQtjT/+4zsEvJuTRPfomIJBJztfIPDL+E06OVKerW5fEHxD2D5q+RtB4tJ?=
 =?us-ascii?Q?+VRVRFCH2BFK6AnapmlaN1qzJBubXWd9C4Xik03A8QJhpi288NBb1iNbEJZz?=
 =?us-ascii?Q?uVnTsodkXi9/rbeFzVCkC+NZNm4ghenMxEtZx6D3daiOyFJgxZm670I0lkLd?=
 =?us-ascii?Q?W7VvSygR3jmfEo/S2ZgD8oqEVQOv8eaVuYlUrjXNtCz909iuqd1C8JK9iSGq?=
 =?us-ascii?Q?13jCEeNbBEoZ42I9QupT/L3+8kLnZeWGh3urbV91sM7NgyhLBePjOJyTMIlJ?=
 =?us-ascii?Q?vZRBxHrUzXMZJbaCzT2InmwgwdNSNp8/6Yep2x+nCdKp7ugt3Ncff8cweiKR?=
 =?us-ascii?Q?8OEH1GReho9rJ8tty4WFrPk2LJqRUdiM9D7H7Gbb2jN49TPVWtAe2EcPgWRQ?=
 =?us-ascii?Q?bhHRGNNIVph39u7u1H/dZA0jVHSFb6oT6oTuG1NNuYr5dcoO5LHX8EUxT/Xb?=
 =?us-ascii?Q?1izKLx5T3+6NnRwbxqtCeSjVRdijrvEjK30Pt34eyo97MNnyTDBUBLxjM6fS?=
 =?us-ascii?Q?Hi2+syAYA/ejSFIF+8VhmNDTdMBVwnfWXXV1W139LFlW+iNJLjBSENsFbQGG?=
 =?us-ascii?Q?J3X35/QxCU7u9pDuZI/qJZHH3B7WVeJ6QdYUvzbmQbwHBTAhGho6HkqIUBdG?=
 =?us-ascii?Q?MUaRSf4W1Caeh6HbsTjDlwbYGgKEN/BZfbg7WjtdpMm+iwXDLHKnsU5j4+vd?=
 =?us-ascii?Q?Aq82jggQPmDOMmzP4RYJimzHb60wS/F3wmiijexBNmQATpVVoKsGDdMRAf6T?=
 =?us-ascii?Q?KDeEfye0pcx63S7EoFhWCmeGE7N2jmMnimzqPqiC3N0ICP9PCTA4X5WJVp11?=
 =?us-ascii?Q?dTKDmoOmDdiFyBTaE0vr7/3ucH62HboOImVGz+reBrXYViATFPhgk5j1jW63?=
 =?us-ascii?Q?DiyGZI06a2Juy0aMtj3m94gYVhWYNmUKwOHRalaOh6JCmzFhGHjQAR36Z0DZ?=
 =?us-ascii?Q?qHFNU8Gjf+ZZ+atcyEZYFKSGJK3VkziE6CAvSj0hKhumvAYPLSJ6Ukip1MIb?=
 =?us-ascii?Q?o9Qz1H9fYZd50ajPBBnRb4g4nM/KCkvT5aSWwXXX/BrQ4HYCoKIEDV7ZfJtR?=
 =?us-ascii?Q?+eF2vyisSYRajT7UR0BmmptVQ1c3euSvJsDEfI+YhzKugDqPRl4mIzoK/dvb?=
 =?us-ascii?Q?IMf+oRJnr4bnOkdpExVvNtosj5ipeIjhLxid1nB+ZguoSUfvozpoI1s0ab/W?=
 =?us-ascii?Q?Kunzgg/bLyPjqKhUGukY6rELVOUTUlKzhrZEIhRcUcdDyQdaDMGWPmnl0GYw?=
 =?us-ascii?Q?L/RMjD3FvSw29QB/gtdJqGtlSGQ24Xs0?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2024 05:17:43.5346 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 073413c1-9b82-4f8a-8502-08dc9b1f77dd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000044F9.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6187
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
v3->v4:
 * Handle -ENOMEM case too
---
 drivers/gpu/drm/drm_connector.c | 48 +++++++++++++++++++++++++++++++++
 include/drm/drm_connector.h     |  2 ++
 include/drm/drm_mode_config.h   |  5 ++++
 include/uapi/drm/drm_mode.h     |  7 +++++
 4 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 4d2df7f64dc5..f8b3e4dfeb0d 100644
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
@@ -1963,6 +1978,39 @@ int drm_mode_create_scaling_mode_property(struct drm_device *dev)
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
+	if (!power_saving)
+		return -ENOMEM;
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

