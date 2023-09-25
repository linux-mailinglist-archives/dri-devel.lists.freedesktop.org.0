Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2567ADFDB
	for <lists+dri-devel@lfdr.de>; Mon, 25 Sep 2023 21:50:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C8310E2E1;
	Mon, 25 Sep 2023 19:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A364410E2E0;
 Mon, 25 Sep 2023 19:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8VjYeUxQaLK/2GXikkpD1eTkPl8tKyctoWikWFkd4XA=; b=NkzKvbGidcObeX1LM5Gm37AWdS
 QgkjktB0GLB8I3OKmHoa5tRhD3sLrBy7nutzwIglv7tMbB6v/yYcrK3IFAED6F3uflZXT7TY+JUr7
 T52HLUS2oJMIF4UM2Agbc74D+vpgW69Y08aS/Fvp+0D1fweRLZXLnu+DtX8tnEA2WhHPH+p+fKFTh
 v2rCgiwSZtVpV/s4pK3qxWNNGCmytcLa5vKjjD16LiicEoZm6T48fETSbwvZylhsP0DWOwxiyDau8
 9K1CB6gwkIJyXKrWOmfyobOqBHZONYiZd0YDIfby7X/Iie0xZtHhY+egtSt7F3Fr830lpQXBLXO+p
 69Dusrgg==;
Received: from [102.213.205.115] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1qkraX-008GsG-KU; Mon, 25 Sep 2023 21:49:49 +0200
From: Melissa Wen <mwen@igalia.com>
To: amd-gfx@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, sunpeng.li@amd.com,
 Alex Deucher <alexander.deucher@amd.com>, dri-devel@lists.freedesktop.org,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch
Subject: [PATCH v3 06/32] drm/amd/display: explicitly define EOTF and inverse
 EOTF
Date: Mon, 25 Sep 2023 18:49:06 -0100
Message-Id: <20230925194932.1329483-7-mwen@igalia.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230925194932.1329483-1-mwen@igalia.com>
References: <20230925194932.1329483-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Shashank Sharma <Shashank.Sharma@amd.com>, Alex Hung <alex.hung@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, kernel-dev@igalia.com,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of relying on color block names to get the transfer function
intention regarding encoding pixel's luminance, define supported
Electro-Optical Transfer Functions (EOTFs) and inverse EOTFs, that
includes pure gamma or standardized transfer functions.

v3:
- squash linear and unity TFs to identity (Pekka)
- define the right TFs for BT.709 (Pekka and Harry)
- add comment about AMD TF coefficients

Suggested-by: Harry Wentland <harry.wentland@amd.com>
Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h | 27 +++++---
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 67 ++++++++++++++-----
 2 files changed, 71 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index ab89538d5663..98f7267d5ee7 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -716,16 +716,27 @@ static inline void amdgpu_dm_set_mst_status(uint8_t *status,
 
 extern const struct amdgpu_ip_block_version dm_ip_block;
 
+/* enum amdgpu_transfer_function: pre-defined transfer function supported by AMD.
+ *
+ * It includes standardized transfer functions and pure power functions. The
+ * transfer function coefficients are available at modules/color/color_gamma.c
+ */
 enum amdgpu_transfer_function {
 	AMDGPU_TRANSFER_FUNCTION_DEFAULT,
-	AMDGPU_TRANSFER_FUNCTION_SRGB,
-	AMDGPU_TRANSFER_FUNCTION_BT709,
-	AMDGPU_TRANSFER_FUNCTION_PQ,
-	AMDGPU_TRANSFER_FUNCTION_LINEAR,
-	AMDGPU_TRANSFER_FUNCTION_UNITY,
-	AMDGPU_TRANSFER_FUNCTION_GAMMA22,
-	AMDGPU_TRANSFER_FUNCTION_GAMMA24,
-	AMDGPU_TRANSFER_FUNCTION_GAMMA26,
+	AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF,
+	AMDGPU_TRANSFER_FUNCTION_BT709_INV_OETF,
+	AMDGPU_TRANSFER_FUNCTION_PQ_EOTF,
+	AMDGPU_TRANSFER_FUNCTION_IDENTITY,
+	AMDGPU_TRANSFER_FUNCTION_GAMMA22_EOTF,
+	AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF,
+	AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF,
+	AMDGPU_TRANSFER_FUNCTION_SRGB_INV_EOTF,
+	AMDGPU_TRANSFER_FUNCTION_BT709_OETF,
+	AMDGPU_TRANSFER_FUNCTION_PQ_INV_EOTF,
+	AMDGPU_TRANSFER_FUNCTION_GAMMA22_INV_EOTF,
+	AMDGPU_TRANSFER_FUNCTION_GAMMA24_INV_EOTF,
+	AMDGPU_TRANSFER_FUNCTION_GAMMA26_INV_EOTF,
+        AMDGPU_TRANSFER_FUNCTION_COUNT
 };
 
 struct dm_plane_state {
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 56ce008b9095..d03bdb010e8b 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -85,18 +85,57 @@ void amdgpu_dm_init_color_mod(void)
 }
 
 #ifdef AMD_PRIVATE_COLOR
-static const struct drm_prop_enum_list amdgpu_transfer_function_enum_list[] = {
-	{ AMDGPU_TRANSFER_FUNCTION_DEFAULT, "Default" },
-	{ AMDGPU_TRANSFER_FUNCTION_SRGB, "sRGB" },
-	{ AMDGPU_TRANSFER_FUNCTION_BT709, "BT.709" },
-	{ AMDGPU_TRANSFER_FUNCTION_PQ, "PQ (Perceptual Quantizer)" },
-	{ AMDGPU_TRANSFER_FUNCTION_LINEAR, "Linear" },
-	{ AMDGPU_TRANSFER_FUNCTION_UNITY, "Unity" },
-	{ AMDGPU_TRANSFER_FUNCTION_GAMMA22, "Gamma 2.2" },
-	{ AMDGPU_TRANSFER_FUNCTION_GAMMA24, "Gamma 2.4" },
-	{ AMDGPU_TRANSFER_FUNCTION_GAMMA26, "Gamma 2.6" },
+static const char * const
+amdgpu_transfer_function_names[] = {
+	[AMDGPU_TRANSFER_FUNCTION_DEFAULT]		= "Default",
+	[AMDGPU_TRANSFER_FUNCTION_IDENTITY]		= "Identity",
+	[AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF]		= "sRGB EOTF",
+	[AMDGPU_TRANSFER_FUNCTION_BT709_INV_OETF]	= "BT.709 inv_OETF",
+	[AMDGPU_TRANSFER_FUNCTION_PQ_EOTF]		= "PQ EOTF",
+	[AMDGPU_TRANSFER_FUNCTION_GAMMA22_EOTF]		= "Gamma 2.2 EOTF",
+	[AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF]		= "Gamma 2.4 EOTF",
+	[AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF]		= "Gamma 2.6 EOTF",
+	[AMDGPU_TRANSFER_FUNCTION_SRGB_INV_EOTF]	= "sRGB inv_EOTF",
+	[AMDGPU_TRANSFER_FUNCTION_BT709_OETF]		= "BT.709 OETF",
+	[AMDGPU_TRANSFER_FUNCTION_PQ_INV_EOTF]		= "PQ inv_EOTF",
+	[AMDGPU_TRANSFER_FUNCTION_GAMMA22_INV_EOTF]	= "Gamma 2.2 inv_EOTF",
+	[AMDGPU_TRANSFER_FUNCTION_GAMMA24_INV_EOTF]	= "Gamma 2.4 inv_EOTF",
+	[AMDGPU_TRANSFER_FUNCTION_GAMMA26_INV_EOTF]	= "Gamma 2.6 inv_EOTF",
 };
 
+static const u32 amdgpu_eotf =
+	BIT(AMDGPU_TRANSFER_FUNCTION_SRGB_EOTF) |
+	BIT(AMDGPU_TRANSFER_FUNCTION_BT709_INV_OETF) |
+	BIT(AMDGPU_TRANSFER_FUNCTION_PQ_EOTF) |
+	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA22_EOTF) |
+	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA24_EOTF) |
+	BIT(AMDGPU_TRANSFER_FUNCTION_GAMMA26_EOTF);
+
+static struct drm_property *
+amdgpu_create_tf_property(struct drm_device *dev,
+			  const char *name,
+			  u32 supported_tf)
+{
+	u32 transfer_functions = supported_tf |
+				 BIT(AMDGPU_TRANSFER_FUNCTION_DEFAULT) |
+				 BIT(AMDGPU_TRANSFER_FUNCTION_IDENTITY);
+	struct drm_prop_enum_list enum_list[AMDGPU_TRANSFER_FUNCTION_COUNT];
+	int i, len;
+
+	len = 0;
+	for (i = 0; i < AMDGPU_TRANSFER_FUNCTION_COUNT; i++) {
+		if ((transfer_functions & BIT(i)) == 0)
+			continue;
+
+		enum_list[len].type = i;
+		enum_list[len].name = amdgpu_transfer_function_names[i];
+		len++;
+	}
+
+	return drm_property_create_enum(dev, DRM_MODE_PROP_ENUM,
+					name, enum_list, len);
+}
+
 int
 amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
 {
@@ -116,11 +155,9 @@ amdgpu_dm_create_color_properties(struct amdgpu_device *adev)
 		return -ENOMEM;
 	adev->mode_info.plane_degamma_lut_size_property = prop;
 
-	prop = drm_property_create_enum(adev_to_drm(adev),
-					DRM_MODE_PROP_ENUM,
-					"AMD_PLANE_DEGAMMA_TF",
-					amdgpu_transfer_function_enum_list,
-					ARRAY_SIZE(amdgpu_transfer_function_enum_list));
+	prop = amdgpu_create_tf_property(adev_to_drm(adev),
+					 "AMD_PLANE_DEGAMMA_TF",
+					 amdgpu_eotf);
 	if (!prop)
 		return -ENOMEM;
 	adev->mode_info.plane_degamma_tf_property = prop;
-- 
2.40.1

