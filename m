Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3D66628C3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 15:44:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2067610E20F;
	Mon,  9 Jan 2023 14:44:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E65310E20D
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Jan 2023 14:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OWwQ8u7sFMDvTmb5fE9F6XuAX0AS2r8sgD2pqpPqgV4=; b=kAFclU16RCUbRS43TnofiwMD4I
 88haYRtghBErhgU7N0Vs3/2oMPK0osGqyXOle7pnwfTdPC8zxA7afgyaxB847zmvzZZS5YR9QJxBt
 SYeGP6aRLiGt3gcVIG27e6YTKlj6fvtgBT57xGhAth6lUdKlbUIgRycghvWcnECWiWPT522+cAICU
 sjm/VokbHlvGZuBpICqX0vG79oWW06ljrIZfkvQutAr6IwuHZU81nfyFC7Wsi814RIYhBvuynavZ8
 MfZ8/y0ypnhMKZCYbV/aRhb7WHLaXhQA3Dz/QpgNM3vgt4RFrrDvZMZD8jNJr8B6C5XNfU4FkPMVX
 tcpMWhsA==;
Received: from [41.74.137.107] (helo=killbill.home)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1pEtNV-003TyM-Oo; Mon, 09 Jan 2023 15:43:57 +0100
From: Melissa Wen <mwen@igalia.com>
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [RFC PATCH v2 04/18] drm/drm_color_mgmt: add function to create 3D
 LUT modes supported
Date: Mon,  9 Jan 2023 13:38:32 -0100
Message-Id: <20230109143846.1966301-5-mwen@igalia.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230109143846.1966301-1-mwen@igalia.com>
References: <20230109143846.1966301-1-mwen@igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: laurent.pinchart+renesas@ideasonboard.com,
 Shashank Sharma <shashank.sharma@amd.com>, alex.hung@amd.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>, seanpaul@chromium.org, kernel-dev@igalia.com,
 bhawanpreet.lakha@amd.com, nicholas.kazlauskas@amd.com,
 Joshua Ashton <joshua@froggi.es>, sungjoon.kim@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DRM color function to create modes for lut3d mode property from an array
of drm_color_lut3d_mode modes supported by the HW and advertise to
userspace. Userspace can get the description of a specific mode in the
enum list from its blob data.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_color_mgmt.c | 43 +++++++++++++++++++++++++++++++-
 include/drm/drm_color_mgmt.h     |  4 +++
 2 files changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index f92633b3b67e..6ce48007cdd4 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -104,7 +104,7 @@
  *	LUT3D property. A mode specifies size, stride, bit depth and color
  *	format and depends on the underlying hardware). If drivers support
  *	multiple 3D LUT modes, they should be declared in a array of
- *	drm_color_lut3d_mode and they will be advertised as an enum.
+ *	drm_mode_lut3d_mode and they will be advertised as an enum.
  *
  * “GAMMA_LUT”:
  *	Blob property to set the gamma lookup table (LUT) mapping pixel data
@@ -228,6 +228,47 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_crtc_enable_color_mgmt);
 
+int drm_crtc_create_lut3d_mode_property(struct drm_crtc *crtc,
+					const struct drm_mode_lut3d_mode modes[],
+					unsigned int num_modes)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_property_blob *blob;
+	struct drm_property *prop;
+	char *name;
+	int ret;
+
+	if (dev->mode_config.lut3d_mode_property)
+		return 0;
+
+	prop = drm_property_create(dev, DRM_MODE_PROP_ENUM, "LUT3D_MODE", num_modes);
+	if (!prop)
+		return -EINVAL;
+
+	for (int i = 0; i < num_modes; i++) {
+		blob = drm_property_create_blob(dev, sizeof(modes[i]), &modes[i]);
+		if (IS_ERR(blob))
+			return PTR_ERR(blob);
+
+		name = kasprintf(GFP_KERNEL, "lut3d_%d_%dbit",
+				 modes[i].lut_size, modes[i].bit_depth);
+		if (!name)
+			return -ENOMEM;
+
+		ret = drm_property_add_enum(prop, blob->base.id, name);
+		if (ret) {
+			drm_property_blob_put(blob);
+			kfree(name);
+			return ret;
+		}
+		kfree(name);
+	}
+	dev->mode_config.lut3d_mode_property = prop;
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_crtc_create_lut3d_mode_property);
+
 /**
  * drm_mode_crtc_set_gamma_size - set the gamma table size
  * @crtc: CRTC to set the gamma table size for
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 81c298488b0c..af9305925572 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -59,6 +59,10 @@ void drm_crtc_enable_color_mgmt(struct drm_crtc *crtc,
 				bool has_ctm,
 				uint gamma_lut_size);
 
+int drm_crtc_create_lut3d_mode_property(struct drm_crtc *crtc,
+					const struct drm_mode_lut3d_mode modes[],
+					unsigned int num_modes);
+
 int drm_mode_crtc_set_gamma_size(struct drm_crtc *crtc,
 				 int gamma_size);
 
-- 
2.35.1

