Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED423C54B66
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 23:27:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37AD710E08C;
	Wed, 12 Nov 2025 22:27:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="l4pQ9z+w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013056.outbound.protection.outlook.com
 [40.107.201.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D9810E08C;
 Wed, 12 Nov 2025 22:27:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PUc8IhiVlhPf6fzAZ5ZhU1X8oA3IbD1q0GY/a1pqoiy8owg84p4DT6nyYJ13SauD2fsxWdx8SJfNHvp1/mXD6Nz9SMVuzVNBPmROYd0DfVK1tKgDWdZwsugA2iwDRXKmaWiEL8Qtor9zWBgP47alN8lmrQgnT2a0RDy371aIuQybTXQHpTtBy5wCvZ9XQd2ORRBsGBpNc5svMoN+NldWm9XZBWtOHk/DUxJDbo61xLu3BSXI38/C7xWJ5VoMNziZhQIoofnAjlZxdPS8Ip1uWn5PX8isy+f8OOHRySw7aYYk7q1cJ9uSbZuErRs1t4EhqelIDbLb3zMDhfAPnkhZyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W9awpognap/YT6iIJNxCWqkU+X3OWts3FBoskuj8cxY=;
 b=XgGgHoYpYTz2pQTpY4rb4j5Jucq3TPsBFu9f3Nnlac7aYb4uTDJLdT6k7sShV7N9ueFP58d5fh3+Fer28QfY2Uy5PGU7QSsbZMvFjDECAb3sB6+AIoMz8oSD5ePTIl9qCON4C2NW5Ux9PxJbHiKYzCbViE8XiAgH0MMmMfxKNkLD0g8DY+X/OgxyetxAlec1l3DaySJvViITlb9JGfZ8z1Ac7uSDyKouZ23IKJkDtcrn53oZeyUX6XIEaKe0F2WhF9ydR2BOtBuAs4sja4EObIB9BvZHi8qJj4Cim+LouYE/n98hsjbAcUyfFz3hI/qMuuZUw6jvoe+uYNNyAcJRdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=ffwll.ch smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W9awpognap/YT6iIJNxCWqkU+X3OWts3FBoskuj8cxY=;
 b=l4pQ9z+wS2pAoPOHXohRXqdN9cxPmrT7IxO86wSXWHJpZ+p67mGkuiifBd0g99F9Jwbi3BNINUjSlEsqWlssxgUNggVwrG7BDv1iQ0eL8k40RJezASWoRJtnZ4W2tYIVqtIVJCqMQ18wpcDtCHIPen3oAIWqqj6X/r7qfb5t4qM=
Received: from SJ0PR13CA0036.namprd13.prod.outlook.com (2603:10b6:a03:2c2::11)
 by SA1PR12MB7318.namprd12.prod.outlook.com (2603:10b6:806:2b3::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Wed, 12 Nov
 2025 22:27:12 +0000
Received: from MWH0EPF000971E8.namprd02.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::e1) by SJ0PR13CA0036.outlook.office365.com
 (2603:10b6:a03:2c2::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9343.5 via Frontend Transport; Wed,
 12 Nov 2025 22:27:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 MWH0EPF000971E8.mail.protection.outlook.com (10.167.243.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 22:27:11 +0000
Received: from dogwood-dvt-marlim.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 12 Nov 2025 14:27:07 -0800
From: Mario Limonciello <mario.limonciello@amd.com>
To: Simona Vetter <simona@ffwll.ch>
CC: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>, David Airlie
 <airlied@gmail.com>, "open list:RADEON and AMDGPU DRM DRIVERS"
 <amd-gfx@lists.freedesktop.org>, "open list:DRM DRIVERS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>, Simona Vetter
 <simona.vetter@ffwll.ch>, Harry Wentland <Harry.Wentland@amd.com>
Subject: [PATCH] drm/amd: Move adaptive backlight modulation property to drm
 core
Date: Wed, 12 Nov 2025 16:26:46 -0600
Message-ID: <20251112222646.495189-1-mario.limonciello@amd.com>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E8:EE_|SA1PR12MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: e375af5b-5060-40de-d7fd-08de223a9feb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+v7Xmr3f4QW+gLEFCUjTbw1P1AohS9s0b2M3yAIxcF095s36ZpspvuJT/2/v?=
 =?us-ascii?Q?Bx/Je01WIVMwf5VnlyQEq5YwT9RhRgSUoDCA6wKAaTA6d7Oe2hPc4erpq8WL?=
 =?us-ascii?Q?wO34bNcd2n2u6R1jDOJzrd4LpnkO/fl39SGWEDqJskN1DyOaUzeZRLuEBJWw?=
 =?us-ascii?Q?/N3CkrDJ/Wt3QUnBfpW1ElW5ZGBu1IKTIX0cGO+6VtUtujywVret3+d1CMro?=
 =?us-ascii?Q?QMm0xTD72IU8a156ubYZ94cC67U5B+dGh4VsPnR/2dwiiGDhkm43jOM/XyVi?=
 =?us-ascii?Q?O3UUXNby8y65R+Sx6nwKh/gssxIHAFx7p+lAO3ilguIe+45fILidefygXEm8?=
 =?us-ascii?Q?HzjcOipKqbZrKZ+Vf7nxwjwyeOlg0ylwuVJo/s+50q7NwquxKEiLjV1usPLK?=
 =?us-ascii?Q?0NqJdk/vKh/FfBpBu6I2DfZFoIptcqyEcFx1MdfpZHtydBoljVwVskd1q2VT?=
 =?us-ascii?Q?7F7DFaRL9Z0KMBg3RXlK2bTFTXkYHjLqkg1So+Y+Fv5tm43khhD/H1TzCZ5V?=
 =?us-ascii?Q?CiWtho5TkA1hcrq5QlVwBfKJwqgOr5Dj8Mp5j5VAutXkDVfdWdfl6nhgv+dR?=
 =?us-ascii?Q?iyRGYIhP2fDaGvPJ8Vz8hwuXPRHdGIc6lfzIJKqMUPUjI8RHQvGjetIgxYy7?=
 =?us-ascii?Q?LPKuSCza2Jm20xPDqwcnkmXNdI1t0Ex+5yXrlpsCG4Di0iS7mm41bkIEUcqG?=
 =?us-ascii?Q?NToo+xRVPHRsCIlgRwgIJgcOdVh/EtTHeFUxEe7Uy1d5qDWi23mmxjFEihAA?=
 =?us-ascii?Q?fjXRpvoFSMAXSSgrWWMHWzMGsXHdIEpX/LdDmPUeQbXDcLD4D1jOtTGGLcfu?=
 =?us-ascii?Q?OIBC7SAj5c/QpJ44BAFLGHdM3In4Eq8exyG4gXYiVYo05YbdBNlzT6tJSqKg?=
 =?us-ascii?Q?pMCgZ/C/u2yZZ8GlzuSDnDmMGjzkhyk5bGRzkrxhAmH7mRDmuti5ieyt/MEo?=
 =?us-ascii?Q?66P93nUoV/OZ57ADDmjPU+lGYyoVRxwWVrgZNn1YAtNyCGkuWhtuN5gMhUC1?=
 =?us-ascii?Q?RuCHaiGcFA+RpU21zvwRxy5T5sxl55OkFEqjVZ3YzLfFaNuh5UA5FU9XeCPr?=
 =?us-ascii?Q?KSzBdPvvC9vviFAsmlnyAO1MYRytpIrdrngC8WiiK9Qb9oUBxr9229OLuRuM?=
 =?us-ascii?Q?Vm/585ArYjltlpKidu1IP3ZpwfPlade6ekFpEaS7AjzJQqI7J3P9D5sQP8XN?=
 =?us-ascii?Q?CxgtVptx6y38Z/BaXdcdztCkvmETh1DaXLRdoyR2NJnfWKStw6lwppn4yeNy?=
 =?us-ascii?Q?in1Z3W3a5jqo3pVbBvQFbNa0dWZ4JD2dJhP5sUaCqY3yR1g/0vnv1EvxSsz3?=
 =?us-ascii?Q?8u8JAkL+fa8L6chtIb7UrQ5CGe+8mDOu6xWeuiwWFOB79W8GoARd3Etg9bZA?=
 =?us-ascii?Q?tjBDIxuifaE433Va3bSOsn25cnejOoRojT0eF3EIxBcqelLy0IChdYMqZ+Ns?=
 =?us-ascii?Q?wm6T87qQovEEvN19n06eBO6PL/ikaczhyJOxlKcBUkkpnvVwFlXTw8PTY3VS?=
 =?us-ascii?Q?Mf+6ijDEUxauEr5DMXxd8rakytCSIZjhzT25fOyoQZmzHjTbTy2Bp3GPpmFw?=
 =?us-ascii?Q?Ry69y+X0PbuyJVuMYz8=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 22:27:11.8330 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e375af5b-5060-40de-d7fd-08de223a9feb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000971E8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7318
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

The adaptive backlight modulation property is supported on AMD hardware but
compositors should be aware of it in standard DRM property documentation.

Move the helper to create the property and documentation into DRM.

Suggested-by: Simona Vetter <simona.vetter@ffwll.ch>
Reviewed-by: Harry Wentland <Harry.Wentland@amd.com>
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.c | 69 +++------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_display.h |  7 ---
 drivers/gpu/drm/drm_connector.c             | 63 +++++++++++++++++++
 include/drm/drm_connector.h                 |  8 +++
 4 files changed, 80 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
index f8b35c487b6c..3d840bef77bf 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.c
@@ -1363,67 +1363,9 @@ static const struct drm_prop_enum_list amdgpu_dither_enum_list[] = {
 	{ AMDGPU_FMT_DITHER_ENABLE, "on" },
 };
 
-/**
- * DOC: property for adaptive backlight modulation
- *
- * The 'adaptive backlight modulation' property is used for the compositor to
- * directly control the adaptive backlight modulation power savings feature
- * that is part of DCN hardware.
- *
- * The property will be attached specifically to eDP panels that support it.
- *
- * The property is by default set to 'sysfs' to allow the sysfs file 'panel_power_savings'
- * to be able to control it.
- * If set to 'off' the compositor will ensure it stays off.
- * The other values 'min', 'bias min', 'bias max', and 'max' will control the
- * intensity of the power savings.
- *
- * Modifying this value can have implications on color accuracy, so tread
- * carefully.
- */
-static int amdgpu_display_setup_abm_prop(struct amdgpu_device *adev)
-{
-	const struct drm_prop_enum_list props[] = {
-		{ ABM_SYSFS_CONTROL, "sysfs" },
-		{ ABM_LEVEL_OFF, "off" },
-		{ ABM_LEVEL_MIN, "min" },
-		{ ABM_LEVEL_BIAS_MIN, "bias min" },
-		{ ABM_LEVEL_BIAS_MAX, "bias max" },
-		{ ABM_LEVEL_MAX, "max" },
-	};
-	struct drm_property *prop;
-	int i;
-
-	if (!adev->dc_enabled)
-		return 0;
-
-	prop = drm_property_create(adev_to_drm(adev), DRM_MODE_PROP_ENUM,
-				"adaptive backlight modulation",
-				6);
-	if (!prop)
-		return -ENOMEM;
-
-	for (i = 0; i < ARRAY_SIZE(props); i++) {
-		int ret;
-
-		ret = drm_property_add_enum(prop, props[i].type,
-						props[i].name);
-
-		if (ret) {
-			drm_property_destroy(adev_to_drm(adev), prop);
-
-			return ret;
-		}
-	}
-
-	adev->mode_info.abm_level_property = prop;
-
-	return 0;
-}
-
 int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
 {
-	int sz;
+	int ret, sz;
 
 	adev->mode_info.coherent_mode_property =
 		drm_property_create_range(adev_to_drm(adev), 0, "coherent", 0, 1);
@@ -1467,7 +1409,14 @@ int amdgpu_display_modeset_create_props(struct amdgpu_device *adev)
 					 "dither",
 					 amdgpu_dither_enum_list, sz);
 
-	return amdgpu_display_setup_abm_prop(adev);
+	adev->mode_info.abm_level_property = drm_create_abm_property(adev_to_drm(adev));
+	if (IS_ERR(adev->mode_info.abm_level_property)) {
+		ret = PTR_ERR(adev->mode_info.abm_level_property);
+		adev->mode_info.abm_level_property = NULL;
+		return ret;
+	}
+
+	return 0;
 }
 
 void amdgpu_display_update_priority(struct amdgpu_device *adev)
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
index 2b1536a16752..dfa0d642ac16 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_display.h
@@ -54,11 +54,4 @@ int amdgpu_display_resume_helper(struct amdgpu_device *adev);
 int amdgpu_display_get_scanout_buffer(struct drm_plane *plane,
 				      struct drm_scanout_buffer *sb);
 
-#define ABM_SYSFS_CONTROL	-1
-#define ABM_LEVEL_OFF		0
-#define ABM_LEVEL_MIN		1
-#define ABM_LEVEL_BIAS_MIN	2
-#define ABM_LEVEL_BIAS_MAX	3
-#define ABM_LEVEL_MAX		4
-
 #endif
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 272d6254ea47..376169dac247 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2603,6 +2603,69 @@ static int drm_mode_create_colorspace_property(struct drm_connector *connector,
 	return 0;
 }
 
+/**
+ * DOC: integrated panel properties
+ *
+ * adaptive backlight modulation:
+ *	Adaptive backlight modulation (ABM) is a power savings feature that
+ *	dynamically adjusts the backlight brightness based on the content
+ *	displayed on the screen. By reducing the backlight brightness for
+ *	darker images and increasing it for brighter images, ABM helps to
+ *	conserve energy and extend battery life on devices with integrated
+ *	displays.  This feature is part of AMD DCN hardware.
+ *
+ *	sysfs
+ *		The ABM property is exposed to userspace via sysfs interface
+ *		located at 'amdgpu/panel_power_savings' under the DRM device.
+ *	off
+ *		Adaptive backlight modulation is disabled.
+ *	min
+ *		Adaptive backlight modulation is enabled at minimum intensity.
+ *	bias min
+ *		Adaptive backlight modulation is enabled at a more intense
+ *		level than 'min'.
+ *	bias max
+ *		Adaptive backlight modulation is enabled at a more intense
+ *		level than 'bias min'.
+ *	max
+ *		Adaptive backlight modulation is enabled at maximum intensity.
+ */
+struct drm_property *drm_create_abm_property(struct drm_device *dev)
+{
+	const struct drm_prop_enum_list props[] = {
+		{ ABM_SYSFS_CONTROL, "sysfs" },
+		{ ABM_LEVEL_OFF, "off" },
+		{ ABM_LEVEL_MIN, "min" },
+		{ ABM_LEVEL_BIAS_MIN, "bias min" },
+		{ ABM_LEVEL_BIAS_MAX, "bias max" },
+		{ ABM_LEVEL_MAX, "max" },
+	};
+	struct drm_property *prop;
+	int i;
+
+	prop = drm_property_create(dev, DRM_MODE_PROP_ENUM,
+				"adaptive backlight modulation",
+				6);
+	if (!prop)
+		return ERR_PTR(-ENOMEM);
+
+	for (i = 0; i < ARRAY_SIZE(props); i++) {
+		int ret;
+
+		ret = drm_property_add_enum(prop, props[i].type,
+						props[i].name);
+
+		if (ret) {
+			drm_property_destroy(dev, prop);
+
+			return ERR_PTR(ret);
+		}
+	}
+
+	return prop;
+}
+EXPORT_SYMBOL(drm_create_abm_property);
+
 /**
  * drm_mode_create_hdmi_colorspace_property - create hdmi colorspace property
  * @connector: connector to create the Colorspace property on.
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 8f34f4b8183d..644c0d49500f 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2454,6 +2454,7 @@ int drm_connector_attach_hdr_output_metadata_property(struct drm_connector *conn
 bool drm_connector_atomic_hdr_metadata_equal(struct drm_connector_state *old_state,
 					     struct drm_connector_state *new_state);
 int drm_mode_create_aspect_ratio_property(struct drm_device *dev);
+struct drm_property *drm_create_abm_property(struct drm_device *dev);
 int drm_mode_create_hdmi_colorspace_property(struct drm_connector *connector,
 					     u32 supported_colorspaces);
 int drm_mode_create_dp_colorspace_property(struct drm_connector *connector,
@@ -2563,4 +2564,11 @@ const char *drm_get_colorspace_name(enum drm_colorspace colorspace);
 	drm_for_each_encoder_mask(encoder, (connector)->dev, \
 				  (connector)->possible_encoders)
 
+#define ABM_SYSFS_CONTROL	-1
+#define ABM_LEVEL_OFF		0
+#define ABM_LEVEL_MIN		1
+#define ABM_LEVEL_BIAS_MIN	2
+#define ABM_LEVEL_BIAS_MAX	3
+#define ABM_LEVEL_MAX		4
+
 #endif
-- 
2.51.2

