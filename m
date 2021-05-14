Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C9D3812A3
	for <lists+dri-devel@lfdr.de>; Fri, 14 May 2021 23:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D61846F46F;
	Fri, 14 May 2021 21:07:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2073.outbound.protection.outlook.com [40.107.236.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B915E6E442;
 Fri, 14 May 2021 21:07:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A6XRxjmho5yIa8ZY/Ay0b2hW8i3x8HkkaKBZ+wccb1vm9+17eJIx9UYHNu8fnbB1Y2d+Ow/3YLoYbyihwnXNcdoRDxseWLznJJ2j5Kt5duwh7VXFUZUOna5e3z72ecMl8sCvd2O7VzEixVwQXmC94tvx8YsxOnBk9Oqn41fv0B+JlXvoeetnrgFflTF+bzs/7f7W0C9M1CUNsF2uJ290muVmuw3t1JWii6C+shdG3PMJZaTjw2z88AeQIW7I12ccfo96R1X4Lc9KakEXqRLYCyvI0kQiWa+rxwC/CV46Vd9TB4bFg0H1j58kuxS28pJ0V52CWnSIpyDkXJ4YBd0X5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcN1nr6bxeaZOT9brYfPr4njuEj+y41kncr8RWF7JIA=;
 b=JIdlZSRACi4wRdBkb1Uj8bbHoaEy73azxOcaAXXjmBhN1zffnKQN9bu8Lsi2d72HeMVXHbOyF9c2kWoHKyJN6eB0GiUl1FU1eh0g78NGyCDGTVKP/WvYJ+ySV/Lod7xWNa0IfjcvpyExDw8az7aPPmaRnfPui8BHFLV9tAmCsPq3rCuVTvlu5+yIZq9K0rqvyQAu7JvtV72U21Zh5I6SxTYX58MU6UbwhVDMNxY8o6lhoBRbWl4ak+h6HJJ6AKcCVoqqq10wxiZUjWdDzD4L32Uy3pJ0b0wtwtbc0HuymS9EcygCxUpH5M2TJc4UVXqdyG99dJZCcLG+QWzk7gr14Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=amd.com; 
 dmarc=pass (p=none sp=none pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XcN1nr6bxeaZOT9brYfPr4njuEj+y41kncr8RWF7JIA=;
 b=Ka5T0Oj0wR6wDbr9tLHBYxM442hPrwdhTUHU4TFlj6RsksFQYxrw4Ov98HWs5OAEUJmZsUopW/eorzGkgWq0P6BlfpdHsEjV/ICVs1hmucVosqjd/4eJtxDr2dUHormuAhnHHnEBj2ZJt6h1YGYwajHIFnym+g/nO4llOKhfKhU=
Received: from BN9PR03CA0396.namprd03.prod.outlook.com (2603:10b6:408:111::11)
 by DM6PR12MB4139.namprd12.prod.outlook.com (2603:10b6:5:214::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Fri, 14 May
 2021 21:07:36 +0000
Received: from BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::95) by BN9PR03CA0396.outlook.office365.com
 (2603:10b6:408:111::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Fri, 14 May 2021 21:07:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; lists.freedesktop.org; dkim=none (message not signed)
 header.d=none;lists.freedesktop.org; dmarc=pass action=none
 header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com;
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT036.mail.protection.outlook.com (10.13.177.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.25 via Frontend Transport; Fri, 14 May 2021 21:07:36 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Fri, 14 May
 2021 16:07:36 -0500
Received: from hwentlanryzen.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2242.4 via Frontend
 Transport; Fri, 14 May 2021 16:07:35 -0500
From: Harry Wentland <harry.wentland@amd.com>
To: <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <ppaalanen@gmail.com>, <sebastian@sebastianwick.net>, <mcasas@google.com>
Subject: [RFC PATCH v2 5/6] drm/color: Add color space plane property
Date: Fri, 14 May 2021 17:07:19 -0400
Message-ID: <20210514210720.157892-6-harry.wentland@amd.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210514210720.157892-1-harry.wentland@amd.com>
References: <20210514210720.157892-1-harry.wentland@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cab8c552-e11b-4db2-973b-08d9171c4cfc
X-MS-TrafficTypeDiagnostic: DM6PR12MB4139:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4139025B95F9D982397B587A8C509@DM6PR12MB4139.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XWOlgGqxONhyHFxVvlbEs6TE1f0oYjiavUhEpnjx+jm/aE3wQdOh5p8fR8M2zlKL3jpdTbtSp2mmV0xfKIMW4e5Tp52KaeDi7t3HvQY1IrhbCWn9x//ckO93Ttt6P712TmkNt2erqMtf5SBwytZgulg6PLmppoKKSPIaX7npF4WKxSY/ohAw10fjyCHzuF8AbrkolRQqjhv5qHYKAOmibV6HxxWMR9Ds/ajZcwbrBMD9Shdf/6UBmbOxEoLHGHYsns6XZfI+I5CyDNlB7r1FD8aDivv6CuJWeLnggJQJeZr9S5dA7V2zbQB747ttMNNjxyWjFejCGeBa+A2uhsuM1iZswLeEZ91Ms/p14B+WZpNkDvPZWX3K/8K7Ach03Ml/6n+kDXizAKudZcBegE4FRqVCmRdhfOy2Wrn7Zr6Yehvc0B4IwcpOfo0sjw7rn463QjwJDeuRpVnoAvEJu3ppvlDroKLQ1bmA/bYSucSmgRDZ0KCuNPtJFsfTln+0oYNnWuykax5/9kQSj0F7mJhnYGRQGjYLlC9p1Lo4xy/Ko0Yc+ZoQgNlsJxwLm7yaZObKnOZfQ32pEKl7yTdnZpDBgfs7p9lT9rMVuBrbdsaZwB80ssM0MD6t65t+fG6d+cN7aPRYi+Mo/p84HuLjkHWXE/YpQ9Cup21QHikO8dWd0qBa630iGGLUE+7d0MUh1d9+
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966006)(36840700001)(47076005)(83380400001)(356005)(82740400003)(86362001)(6666004)(82310400003)(8936002)(36756003)(81166007)(7696005)(8676002)(36860700001)(26005)(2906002)(30864003)(426003)(336012)(186003)(1076003)(4326008)(478600001)(70206006)(44832011)(316002)(70586007)(2616005)(110136005)(54906003)(5660300002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 May 2021 21:07:36.7341 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cab8c552-e11b-4db2-973b-08d9171c4cfc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT036.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4139
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
Cc: Deepak.Sharma@amd.com, Krunoslav.Kovac@amd.com, Shashank.Sharma@amd.com,
 Shirish.S@amd.com, hersenxs.wu@amd.com, Vitaly.Prosyak@amd.com,
 laurentiu.palcu@oss.nxp.com, Bhawanpreet.Lakha@amd.com,
 Nicholas.Kazlauskas@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>

Add color space definitions for BT601, BT709, BT2020, and DCI-P3.

Default to BT709, the sRGB color space.

Signed-off-by: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Signed-off-by: Harry Wentland <harry.wentland@amd.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +
 .../gpu/drm/arm/display/komeda/komeda_plane.c |  2 +
 drivers/gpu/drm/arm/malidp_planes.c           |  4 +-
 drivers/gpu/drm/armada/armada_overlay.c       |  2 +
 drivers/gpu/drm/drm_color_mgmt.c              | 58 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_sprite.c   |  2 +
 .../drm/i915/display/skl_universal_plane.c    |  2 +
 drivers/gpu/drm/nouveau/dispnv04/overlay.c    |  2 +
 drivers/gpu/drm/omapdrm/omap_plane.c          |  2 +
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  6 +-
 drivers/gpu/drm/tidss/tidss_plane.c           |  4 ++
 include/drm/drm_color_mgmt.h                  | 16 +++++
 include/drm/drm_plane.h                       | 16 +++++
 13 files changed, 113 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 59d277c31864..14e5260a298f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -7072,8 +7072,10 @@ static int amdgpu_dm_plane_init(struct amdgpu_display_manager *dm,
 			BIT(DRM_COLOR_YCBCR_BT2020),
 			BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 			BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+			BIT(DRM_COLOR_SPACE_BT709),
 			BIT(DRM_TF_SRGB),
 			DRM_COLOR_YCBCR_BT709, DRM_COLOR_YCBCR_LIMITED_RANGE,
+			DRM_COLOR_SPACE_BT709,
 			DRM_TF_SRGB);
 	}
 
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
index 811f79ab6d32..4fb3ad4c691e 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_plane.c
@@ -302,9 +302,11 @@ static int komeda_plane_add(struct komeda_kms_dev *kms,
 			BIT(DRM_COLOR_YCBCR_BT2020),
 			BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 			BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+			BIT(DRM_COLOR_SPACE_BT709),
 			BIT(DRM_TF_UNDEFINED),
 			DRM_COLOR_YCBCR_BT601,
 			DRM_COLOR_YCBCR_LIMITED_RANGE,
+			DRM_COLOR_SPACE_BT709,
 			DRM_TF_UNDEFINED);
 	if (err)
 		goto cleanup;
diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 8be0d40db2e5..6478b5b1bcf6 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -1018,6 +1018,7 @@ int malidp_de_planes_init(struct drm_device *drm)
 			/* default encoding for YUV->RGB is BT601 NARROW */
 			enum drm_color_encoding enc = DRM_COLOR_YCBCR_BT601;
 			enum drm_color_range range = DRM_COLOR_YCBCR_LIMITED_RANGE;
+			enum drm_color_space space = DRM_COLOR_SPACE_BT709;
 
 			ret = drm_plane_create_color_properties(&plane->base,
 					BIT(DRM_COLOR_YCBCR_BT601) | \
@@ -1025,8 +1026,9 @@ int malidp_de_planes_init(struct drm_device *drm)
 					BIT(DRM_COLOR_YCBCR_BT2020),
 					BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) | \
 					BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+					BIT(DRM_COLOR_SPACE_BT709),
 					BIT(DRM_TF_UNDEFINED),
-					enc, range,
+					enc, range, space,
 					DRM_TF_UNDEFINED);
 			if (!ret)
 				/* program the HW registers */
diff --git a/drivers/gpu/drm/armada/armada_overlay.c b/drivers/gpu/drm/armada/armada_overlay.c
index f7792444cb73..e66f2fa72830 100644
--- a/drivers/gpu/drm/armada/armada_overlay.c
+++ b/drivers/gpu/drm/armada/armada_overlay.c
@@ -596,9 +596,11 @@ int armada_overlay_plane_create(struct drm_device *dev, unsigned long crtcs)
 						BIT(DRM_COLOR_YCBCR_BT601) |
 						BIT(DRM_COLOR_YCBCR_BT709),
 						BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
+						BIT(DRM_COLOR_SPACE_BT709),
 						BIT(DRM_TF_UNDEFINED),
 						DEFAULT_ENCODING,
 						DRM_COLOR_YCBCR_LIMITED_RANGE,
+						DRM_COLOR_SPACE_BT709,
 						DRM_TF_UNDEFINED);
 
 	return ret;
diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 44842ba0454d..75e6dbbd0081 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -526,6 +526,13 @@ static const char * const color_range_name[] = {
 	[DRM_COLOR_YCBCR_LIMITED_RANGE] = "YCbCr limited range",
 };
 
+static const char * const color_space_name[] = {
+	[DRM_COLOR_SPACE_BT601] = "ITU-R BT.601 RGB",
+	[DRM_COLOR_SPACE_BT709] = "ITU-R BT.709 RGB",
+	[DRM_COLOR_SPACE_BT2020] = "ITU-R BT.2020 RGB",
+	[DRM_COLOR_SPACE_P3] = "DCI-P3",
+};
+
 /**
  * drm_get_color_encoding_name - return a string for color encoding
  * @encoding: color encoding to compute name of
@@ -556,6 +563,21 @@ const char *drm_get_color_range_name(enum drm_color_range range)
 	return color_range_name[range];
 }
 
+/**
+ * drm_get_color_space_name - return a string for color space
+ * @space: color space to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_color_space_name(enum drm_color_space space)
+{
+	if (WARN_ON(space >= ARRAY_SIZE(color_space_name)))
+		return "unknown";
+
+	return color_space_name[space];
+}
+
 int drm_plane_create_sdr_white_level_property(struct drm_plane *plane){
 
 	struct drm_property *prop;
@@ -592,23 +614,28 @@ const char *drm_get_transfer_function_name(enum drm_transfer_function tf)
  * @plane: plane object
  * @supported_encodings: bitfield indicating supported color encodings
  * @supported_ranges: bitfileld indicating supported color ranges
+ * @supported_spaces: bitfield indicating supported color spaces
  * @supported_tfs: bitfield indicating supported transfer functions
  * @default_encoding: default color encoding
  * @default_range: default color range
+ * @default_space: default color space
  * @default_tf: default color transfer function
  *
- * Create and attach plane specific COLOR_ENCODING, COLOR_RANGE and TRANSFER_FUNCTION
- * properties to @plane. The supported encodings, ranges  and tfs should
- * be provided in supported_encodings, supported_ranges and supported_tfs bitmasks.
+ * Create and attach plane specific COLOR_ENCODING, COLOR_RANGE, COLOR_SPACE,
+ * and TRANSFER_FUNCTION properties to @plane. The supported encodings, ranges,
+ * spaces, and tfs should be provided in supported_encodings, supported_ranges,
+ * supported_spaces, and supported_tfs bitmasks.
  * Each bit set in the bitmask indicates that its number as enum
  * value is supported.
  */
 int drm_plane_create_color_properties(struct drm_plane *plane,
 				      u32 supported_encodings,
 				      u32 supported_ranges,
+				      u32 supported_spaces,
 				      u32 supported_tfs,
 				      enum drm_color_encoding default_encoding,
 				      enum drm_color_range default_range,
+				      enum drm_color_space default_space,
 				      enum drm_transfer_function default_tf)
 {
 	struct drm_device *dev = plane->dev;
@@ -628,6 +655,11 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
 		    (supported_ranges & BIT(default_range)) == 0))
 		return -EINVAL;
 
+	if (WARN_ON(supported_spaces == 0 ||
+		    (supported_spaces & -BIT(DRM_COLOR_SPACE_MAX)) != 0 ||
+		    (supported_spaces & BIT(default_space)) == 0))
+		return -EINVAL;
+
 	if (WARN_ON(supported_tfs == 0 ||
 		    (supported_tfs & -BIT(DRM_TF_MAX)) != 0 ||
 		    (supported_tfs & BIT(default_tf)) == 0))
@@ -672,6 +704,26 @@ int drm_plane_create_color_properties(struct drm_plane *plane,
 		plane->state->color_range = default_range;
 
 
+	len = 0;
+	for (i = 0; i < DRM_COLOR_SPACE_MAX; i++) {
+		if ((supported_spaces & BIT(i)) == 0)
+			continue;
+
+		enum_list[len].type = i;
+		enum_list[len].name = color_space_name[i];
+		len++;
+	}
+
+	prop = drm_property_create_enum(dev, 0,	"COLOR_SPACE",
+					enum_list, len);
+	if (!prop)
+		return -ENOMEM;
+	plane->color_space_property = prop;
+	drm_object_attach_property(&plane->base, prop, default_space);
+	if (plane->state)
+		plane->state->color_space = default_space;
+
+
 	len = 0;
 	for (i = 0; i < DRM_TF_MAX; i++) {
 		if ((supported_tfs & BIT(i)) == 0)
diff --git a/drivers/gpu/drm/i915/display/intel_sprite.c b/drivers/gpu/drm/i915/display/intel_sprite.c
index 85b7efc43a8b..2878d5918c89 100644
--- a/drivers/gpu/drm/i915/display/intel_sprite.c
+++ b/drivers/gpu/drm/i915/display/intel_sprite.c
@@ -1849,9 +1849,11 @@ intel_sprite_plane_create(struct drm_i915_private *dev_priv,
 					  BIT(DRM_COLOR_YCBCR_BT709),
 					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+					  BIT(DRM_COLOR_SPACE_BT709),
 					  BIT(DRM_TF_UNDEFINED),
 					  DRM_COLOR_YCBCR_BT709,
 					  DRM_COLOR_YCBCR_LIMITED_RANGE,
+					  DRM_COLOR_SPACE_BT709,
 					  DRM_TF_UNDEFINED);
 
 	zpos = sprite + 1;
diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index f1abf74cef48..eeb30198bb4f 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -2044,9 +2044,11 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 					  supported_csc,
 					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 					  BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+					  BIT(DRM_COLOR_SPACE_BT709),
 					  BIT(DRM_TF_UNDEFINED),
 					  DRM_COLOR_YCBCR_BT709,
 					  DRM_COLOR_YCBCR_LIMITED_RANGE,
+					  DRM_COLOR_SPACE_BT709,
 					  DRM_TF_UNDEFINED);
 
 	drm_plane_create_alpha_property(&plane->base);
diff --git a/drivers/gpu/drm/nouveau/dispnv04/overlay.c b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
index 64e1793212b4..dc350245c98b 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/overlay.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/overlay.c
@@ -345,9 +345,11 @@ nv10_overlay_init(struct drm_device *device)
 					  BIT(DRM_COLOR_YCBCR_BT601) |
 					  BIT(DRM_COLOR_YCBCR_BT709),
 					  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
+					  BIT(DRM_COLOR_SPACE_BT709),
 					  BIT(DRM_TF_UNDEFINED),
 					  DRM_COLOR_YCBCR_BT601,
 					  DRM_COLOR_YCBCR_LIMITED_RANGE,
+					  DRM_COLOR_SPACE_BT709,
 					  DRM_TF_UNDEFINED);
 
 	plane->set_params = nv10_set_params;
diff --git a/drivers/gpu/drm/omapdrm/omap_plane.c b/drivers/gpu/drm/omapdrm/omap_plane.c
index ca7559824dcd..3eb52e78e08d 100644
--- a/drivers/gpu/drm/omapdrm/omap_plane.c
+++ b/drivers/gpu/drm/omapdrm/omap_plane.c
@@ -325,9 +325,11 @@ struct drm_plane *omap_plane_init(struct drm_device *dev,
 						  BIT(DRM_COLOR_YCBCR_BT709),
 						  BIT(DRM_COLOR_YCBCR_FULL_RANGE) |
 						  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
+						  BIT(DRM_COLOR_SPACE_BT709),
 						  BIT(DRM_TF_UNDEFINED),
 						  DRM_COLOR_YCBCR_BT601,
 						  DRM_COLOR_YCBCR_FULL_RANGE,
+						  DRM_COLOR_SPACE_BT709,
 						  DRM_TF_UNDEFINED);
 
 	return plane;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index e0dd7132b920..3da68e4e880f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -538,7 +538,7 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 					       struct sun8i_mixer *mixer,
 					       int index)
 {
-	u32 supported_encodings, supported_ranges;
+	u32 supported_encodings, supported_ranges, supported_spaces;
 	unsigned int plane_cnt, format_count;
 	struct sun8i_vi_layer *layer;
 	const u32 *formats;
@@ -591,12 +591,16 @@ struct sun8i_vi_layer *sun8i_vi_layer_init_one(struct drm_device *drm,
 	supported_ranges = BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
 			   BIT(DRM_COLOR_YCBCR_FULL_RANGE);
 
+	supported_spaces = BIT(DRM_COLOR_SPACE_BT709);
+
 	ret = drm_plane_create_color_properties(&layer->plane,
 						supported_encodings,
 						supported_ranges,
+						supported_spaces,
 						BIT(DRM_TF_UNDEFINED),
 						DRM_COLOR_YCBCR_BT709,
 						DRM_COLOR_YCBCR_LIMITED_RANGE,
+						DRM_COLOR_SPACE_BT709,
 						DRM_TF_UNDEFINED);
 	if (ret) {
 		dev_err(drm->dev, "Couldn't add encoding and range properties!\n");
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index a1336ecd5fd5..367a14616756 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -186,9 +186,11 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
 			       BIT(DRM_COLOR_YCBCR_BT709));
 	u32 color_ranges = (BIT(DRM_COLOR_YCBCR_FULL_RANGE) |
 			    BIT(DRM_COLOR_YCBCR_LIMITED_RANGE));
+	u32 color_spaces = BIT(DRM_COLOR_SPACE_BY709);
 	u32 transfer_functions = BIT(DRM_TF_UNDEFINED;
 	u32 default_encoding = DRM_COLOR_YCBCR_BT601;
 	u32 default_range = DRM_COLOR_YCBCR_FULL_RANGE;
+	u32 default_space = DRM_COLOR_SPACE_BT709;
 	u32 default_tf = DRM_TF_UNDEFINED;;
 	u32 blend_modes = (BIT(DRM_MODE_BLEND_PREMULTI) |
 			   BIT(DRM_MODE_BLEND_COVERAGE));
@@ -219,9 +221,11 @@ struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,
 	ret = drm_plane_create_color_properties(&tplane->plane,
 						color_encodings,
 						color_ranges,
+						color_spaces,
 						transfer_functions,
 						default_encoding,
 						default_range,
+						default_space,
 						default_tf);
 	if (ret)
 		goto err;
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 2a356a9601df..575427650542 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -99,6 +99,9 @@ static inline int drm_color_lut_size(const struct drm_property_blob *blob)
 	return blob->length / sizeof(struct drm_color_lut);
 }
 
+/**
+ * drm_color_encoding - describes the coefficient for YCbCr-RGB conversion
+ */
 enum drm_color_encoding {
 	DRM_COLOR_YCBCR_BT601,
 	DRM_COLOR_YCBCR_BT709,
@@ -112,12 +115,25 @@ enum drm_color_range {
 	DRM_COLOR_RANGE_MAX,
 };
 
+/**
+ * drm_color_space - describes the color space (primaries & white point)
+ */
+enum drm_color_space {
+	DRM_COLOR_SPACE_BT601,
+	DRM_COLOR_SPACE_BT709,
+	DRM_COLOR_SPACE_BT2020,
+	DRM_COLOR_SPACE_P3,
+	DRM_COLOR_SPACE_MAX,
+};
+
 int drm_plane_create_color_properties(struct drm_plane *plane,
 				      u32 supported_encodings,
 				      u32 supported_ranges,
+				      u32 supported_spaces,
 				      u32 supported_tf,
 				      enum drm_color_encoding default_encoding,
 				      enum drm_color_range default_range,
+				      enum drm_color_space default_space,
 				      enum drm_transfer_function default_tf);
 
 /**
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 93ee308a46af..8c9fe6350ead 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -179,6 +179,13 @@ struct drm_plane_state {
 	 */
 	enum drm_color_range color_range;
 
+	/**
+	 * @color_space
+	 *
+	 * Color space (primaries & white point) of the plane
+	 */
+	enum drm_color_space color_space;
+
 	/**
 	 * @transfer_function:
 	 *
@@ -754,6 +761,15 @@ struct drm_plane {
 	 * See drm_plane_create_color_properties().
 	 */
 	struct drm_property *color_range_property;
+	/**
+	 * @color_space_property:
+	 *
+	 * Optional "COLOR_SPACE" enum property for specifying
+	 * the color space (i.e. primaries and white point) of
+	 * the plane.
+	 * See drm_plane_create_color_properties().
+	 */
+	struct drm_property *color_space_property;
 	/**
 	 * @transfer_function_property:
 	 *
-- 
2.31.1

