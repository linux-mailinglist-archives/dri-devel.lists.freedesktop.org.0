Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32D856628D2
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 15:44:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4AA10E43C;
	Mon,  9 Jan 2023 14:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406B010E439;
 Mon,  9 Jan 2023 14:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZCptQBuswI/6532/AawbFb3j3pOVVg8UESVSw9Oz040=; b=SDt7HTphwrkTub4quSZqs591ga
 4Jw6+A1lhiJFBpNOyXWDMWLY7/5ryJtWJib04JB3DOmjHR7xgb2fj1HuZXTBNrrLrhaKqlJll18lR
 YmTbvoiQdsQyjrh+yX6jy7WYFU4uR/1wdGNy5nr75+6ZymZMHV1fw7RjDTXJv8P53HAKkUEcA5+SD
 A4wjPQWyC9JceRKtjgwZSDacBQ+OH4jCQEwHhEERAIcUWJPm0odQeGIGqF5eGl2blWyKCdFG/9KBS
 54/5U1QAHEOjru/135okKr08d9XXdOIHrHrXzi1iPzjcXnEgjZe8cTQ+dVp5wUIVgQNo9g5Ez9uAS
 95uVWtaw==;
Received: from [41.74.137.107] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pEtO0-003TyM-EC; Mon, 09 Jan 2023 15:44:28 +0100
From: Melissa Wen <mwen@igalia.com>
To: harry.wentland@amd.com, sunpeng.li@amd.com, Rodrigo.Siqueira@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, Xinhui.Pan@amd.com,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [RFC PATCH v2 15/18] drm/amd/display: enable 3D-LUT DRM properties if
 supported
Date: Mon,  9 Jan 2023 13:38:43 -0100
Message-Id: <20230109143846.1966301-16-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230109143846.1966301-1-mwen@igalia.com>
References: <20230109143846.1966301-1-mwen@igalia.com>
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
Cc: laurent.pinchart+renesas@ideasonboard.com, kernel-dev@igalia.com,
 Shashank Sharma <shashank.sharma@amd.com>, alex.hung@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Melissa Wen <mwen@igalia.com>, seanpaul@chromium.org, tzimmermann@suse.de,
 amd-gfx@lists.freedesktop.org, bhawanpreet.lakha@amd.com,
 nicholas.kazlauskas@amd.com, Joshua Ashton <joshua@froggi.es>,
 sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable DRM crtc properties related to 3D LUT resources (shaper LUT, 3D
LUT and 3D LUT modes) if it's supported by DCN HW, that means DCN
families 3.0+

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |  1 +
 .../amd/display/amdgpu_dm/amdgpu_dm_color.c   | 25 +++++++++++++++++++
 .../amd/display/amdgpu_dm/amdgpu_dm_crtc.c    |  2 ++
 3 files changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
index abbbb3813c1e..6f04719d0c1f 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
@@ -786,6 +786,7 @@ void amdgpu_dm_trigger_timing_sync(struct drm_device *dev);
 
 void amdgpu_dm_init_color_mod(void);
 int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state);
+void amdgpu_dm_enable_lut3d_prop(struct amdgpu_display_manager *dm, struct drm_crtc *crtc);
 int amdgpu_dm_update_crtc_color_mgmt(struct dm_crtc_state *crtc);
 int amdgpu_dm_update_plane_color_mgmt(struct dm_crtc_state *crtc,
 				      struct dc_plane_state *dc_plane_state);
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
index 54d95745f0f0..c547957acd73 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_color.c
@@ -388,6 +388,31 @@ int amdgpu_dm_verify_lut_sizes(const struct drm_crtc_state *crtc_state)
 	return 0;
 }
 
+static bool has_mpc_lut3d_caps(struct amdgpu_display_manager *dm)
+{
+	return dm->dc->caps.color.mpc.num_3dluts ? true : false;
+}
+
+/**
+ * amdgpu_dm_enable_lut3d_prop - enable 3D LUT DRM props if HW supports
+ * @crtc: DRM crtc
+ * @dm: amdgpu display manager
+ */
+void amdgpu_dm_enable_lut3d_prop(struct amdgpu_display_manager *dm, struct drm_crtc *crtc)
+{
+	int res;
+
+	if (!has_mpc_lut3d_caps(dm))
+		return;
+
+	res = drm_crtc_create_lut3d_mode_property(crtc, amdgpu_lut3d_modes,
+						  ARRAY_SIZE(amdgpu_lut3d_modes));
+	if (res)
+		drm_dbg(crtc->dev, "CRTC init: Failed to create LUT 3D mode properties\n");
+
+	drm_crtc_enable_lut3d(crtc, MAX_COLOR_LUT_ENTRIES, true);
+}
+
 /**
  * amdgpu_dm_update_crtc_color_mgmt: Maps DRM color management to DC stream.
  * @crtc: amdgpu_dm crtc state
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
index 22125daf9dcf..96494f72a6f4 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_crtc.c
@@ -461,6 +461,8 @@ int amdgpu_dm_crtc_init(struct amdgpu_display_manager *dm,
 	drm_crtc_enable_color_mgmt(&acrtc->base, is_dcn ? MAX_COLOR_LUT_ENTRIES : 0,
 				   true, MAX_COLOR_LUT_ENTRIES);
 
+	amdgpu_dm_enable_lut3d_prop(dm, &acrtc->base);
+
 	drm_mode_crtc_set_gamma_size(&acrtc->base, MAX_COLOR_LEGACY_LUT_ENTRIES);
 
 	return 0;
-- 
2.35.1

