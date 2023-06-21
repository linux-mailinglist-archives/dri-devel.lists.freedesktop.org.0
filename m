Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 019FE737D1F
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 10:11:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C343310E409;
	Wed, 21 Jun 2023 08:10:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E95910E3FD;
 Wed, 21 Jun 2023 08:10:55 +0000 (UTC)
Received: from uno.lan (unknown [IPv6:2001:b07:5d2e:52c9:1cf0:b3bc:c785:4625])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id A3E502082;
 Wed, 21 Jun 2023 10:10:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1687335019;
 bh=UZmFwbOhP9tYgRdVpDLV8/qbaogykXpher6ddo7BN50=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TMp+u+tFfHVuEq3zOkTl5uMgROVpzm6BTz0WEfLvBondHTH7pwuHvr+aM9ZnLwG1f
 EQvIDtDdvfu081bc4Ewzaw5zq6C5Vw0roRQXlpR3NdOULPAuRKjEI0BWY79rvWCwP6
 bxl6IFbNxw7lUyOLh2ihmNDqsRdK1nthOz+gMXmQ=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: [RFC 5/9] drm/drm_color_mgmt: add function to attach 3D LUT props
Date: Wed, 21 Jun 2023 10:10:27 +0200
Message-Id: <20230621081031.7876-6-jacopo.mondi@ideasonboard.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230621081031.7876-1-jacopo.mondi@ideasonboard.com>
References: <20230621081031.7876-1-jacopo.mondi@ideasonboard.com>
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
Cc: Victoria Brekenfeld <victoria@system76.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, mdaenzer@redhat.com,
 aleixpol@kde.org, Rodrigo.Siqueira@amd.com, amd-gfx@lists.freedesktop.org,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 =?UTF-8?q?Jonas=20=C3=85dahl?= <jadahl@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, tzimmermann@suse.de, sunpeng.li@amd.com,
 Sebastian Wick <sebastian.wick@redhat.com>, mripard@kernel.org,
 Melissa Wen <mwen@igalia.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, Xinhui.Pan@amd.com,
 xaver.hugl@gmail.com, linux-renesas-soc@vger.kernel.org,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Joshua Ashton <joshua@froggi.es>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Melissa Wen <mwen@igalia.com>

If the driver supports user 3D LUT then it calls a drm function to
attach 3D LUT related properties according to HW caps.

Signed-off-by: Melissa Wen <mwen@igalia.com>
---
 drivers/gpu/drm/drm_color_mgmt.c | 35 ++++++++++++++++++++++++++++++++
 include/drm/drm_color_mgmt.h     |  3 +++
 2 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 6ce48007cdd4..06503f693ecd 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -269,6 +269,41 @@ int drm_crtc_create_lut3d_mode_property(struct drm_crtc *crtc,
 }
 EXPORT_SYMBOL(drm_crtc_create_lut3d_mode_property);
 
+/**
+ * drm_crtc_enable_lut3d - enable 3D LUT properties
+ * @crtc: DRM CRTC
+ * @shaper_lut_size: the size of shaper lut
+ *
+ * This function lets the driver enable the 3D LUT color correction property
+ * on a CRTC. This includes 3D LUT and also a shaper LUT, if set. The shaper
+ * LUT property is only attached if its size is not 0 and 3D LUT is set, being
+ * therefore optional.
+ */
+void drm_crtc_enable_lut3d(struct drm_crtc *crtc,
+			   uint shaper_lut_size)
+{
+	struct drm_device *dev = crtc->dev;
+	struct drm_mode_config *config = &dev->mode_config;
+
+	if (!config->lut3d_mode_property)
+		return;
+
+	drm_object_attach_property(&crtc->base,
+				   config->lut3d_property, 0);
+	drm_object_attach_property(&crtc->base,
+				   config->lut3d_mode_property, 0);
+
+	if (!shaper_lut_size)
+		return;
+
+	drm_object_attach_property(&crtc->base,
+				   config->shaper_lut_property, 0);
+	drm_object_attach_property(&crtc->base,
+				   config->shaper_lut_size_property,
+				   shaper_lut_size);
+}
+EXPORT_SYMBOL(drm_crtc_enable_lut3d);
+
 /**
  * drm_mode_crtc_set_gamma_size - set the gamma table size
  * @crtc: CRTC to set the gamma table size for
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index af9305925572..db2026dc825e 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -63,6 +63,9 @@ int drm_crtc_create_lut3d_mode_property(struct drm_crtc *crtc,
 					const struct drm_mode_lut3d_mode modes[],
 					unsigned int num_modes);
 
+void drm_crtc_enable_lut3d(struct drm_crtc *crtc,
+			   uint shaper_lut_size);
+
 int drm_mode_crtc_set_gamma_size(struct drm_crtc *crtc,
 				 int gamma_size);
 
-- 
2.40.1

