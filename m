Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 143E4B25117
	for <lists+dri-devel@lfdr.de>; Wed, 13 Aug 2025 19:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E50310E7B1;
	Wed, 13 Aug 2025 17:06:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=robert.mader@collabora.com header.b="UZxmViLK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B9010E7AF
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Aug 2025 17:06:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1755104796; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=OURMtK0/WG8xdhxrXepToB8o4UWL5hyB8ZyR50L9hz+nBGy11b5QgeUjx572lEP1S3/PCSnMJzfV1TdKGKxTDV93V1qJsDFVDZYV4+r6tHfyuWlGKILHgS8JnBxosLtZ9airPZ6MvIjzobibxWV2vMqWBmG5zMv9v6pynVKglGE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1755104796;
 h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Hso3YK8Az1BWcpFwmFHNoirRM0CRl7we4pe5byeeCsM=; 
 b=GgeVULEPpCHUfajYd4h4uiRpy9diKAHZlAun506scmGvRKqtlvoivb5hVvRPPJI+zftWW3/00Cv2De4UQ3RfNVocQsafnmA5f10VCHTOrxmT3NOchiWpasLIse5ZyAitYOk+F/4Cga5ICrX/Bas9lQgRkKW9Z2XGZDOPk2j7Jfc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=robert.mader@collabora.com;
 dmarc=pass header.from=<robert.mader@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755104796; 
 s=zohomail; d=collabora.com; i=robert.mader@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Hso3YK8Az1BWcpFwmFHNoirRM0CRl7we4pe5byeeCsM=;
 b=UZxmViLKzQJmaElEwwmAI6LN7aSVCJHk14AaxY6HqvTcl8C7PLQ8aHqCpLJq2SFY
 sygct1Ym/eVt7b8xSdBuKUOT3iHHdvgyfFT+3ylTSsBZyhmJtO4FIygkrK9h/Ud0Kdw
 6VPA5/y1HAUKFbibCXsEH/9quxG7MVhhSk6iKn+g=
Received: by mx.zohomail.com with SMTPS id 1755104794668415.1418774383435;
 Wed, 13 Aug 2025 10:06:34 -0700 (PDT)
From: Robert Mader <robert.mader@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Louis Chauvet <louis.chauvet@bootlin.com>,
 Daniel Stone <daniels@collabora.com>, Melissa Wen <melissa.srw@gmail.com>,
 Maira Canal <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rodrigo Siqueira <siqueira@igalia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Robert Mader <robert.mader@collabora.com>
Subject: [PATCH v1 3/5] drm/vkms: Add WRITEBACK_COLOR_ENCODING and
 WRITEBACK_COLOR_RANGE properties
Date: Wed, 13 Aug 2025 19:05:40 +0200
Message-ID: <20250813170542.331206-4-robert.mader@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813170542.331206-1-robert.mader@collabora.com>
References: <20250813170542.331206-1-robert.mader@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Advertise the supported values and add the conversion matrix of the
currently selected values to writeback jobs.

This does not have any effect yet as no YUV/YCbCr formats are advertised.

Signed-off-by: Robert Mader <robert.mader@collabora.com>
---
 drivers/gpu/drm/vkms/vkms_drv.h       | 33 ++++++++---------
 drivers/gpu/drm/vkms/vkms_writeback.c | 51 +++++++++++++++++++++++++--
 2 files changed, 66 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.h b/drivers/gpu/drm/vkms/vkms_drv.h
index 8013c31efe3b..7fa58e17c286 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.h
+++ b/drivers/gpu/drm/vkms/vkms_drv.h
@@ -81,10 +81,27 @@ struct line_buffer {
  */
 typedef void (*pixel_write_t)(u8 *out_pixel, const struct pixel_argb_u16 *in_pixel);
 
+/**
+ * struct conversion_matrix - Matrix to use for a specific encoding and range
+ *
+ * @matrix: Conversion matrix from yuv to rgb. The matrix is stored in a row-major manner and is
+ * used to compute rgb values from yuv values:
+ *     [[r],[g],[b]] = @matrix * [[y],[u],[v]]
+ *   OR for yvu formats:
+ *     [[r],[g],[b]] = @matrix * [[y],[v],[u]]
+ *  The values of the matrix are signed fixed-point values with 32 bits fractional part.
+ * @y_offset: Offset to apply on the y value.
+ */
+struct conversion_matrix {
+	s64 matrix[3][3];
+	int y_offset;
+};
+
 struct vkms_writeback_job {
 	struct iosys_map data[DRM_FORMAT_MAX_PLANES];
 	struct vkms_frame_info wb_frame_info;
 	pixel_write_t pixel_write;
+	struct conversion_matrix conversion_matrix;
 };
 
 /**
@@ -119,22 +136,6 @@ typedef void (*pixel_read_line_t)(const struct vkms_plane_state *plane, int x_st
 				  int y_start, enum pixel_read_direction direction, int count,
 				  struct pixel_argb_u16 out_pixel[]);
 
-/**
- * struct conversion_matrix - Matrix to use for a specific encoding and range
- *
- * @matrix: Conversion matrix from yuv to rgb. The matrix is stored in a row-major manner and is
- * used to compute rgb values from yuv values:
- *     [[r],[g],[b]] = @matrix * [[y],[u],[v]]
- *   OR for yvu formats:
- *     [[r],[g],[b]] = @matrix * [[y],[v],[u]]
- *  The values of the matrix are signed fixed-point values with 32 bits fractional part.
- * @y_offset: Offset to apply on the y value.
- */
-struct conversion_matrix {
-	s64 matrix[3][3];
-	int y_offset;
-};
-
 /**
  * struct vkms_plane_state - Driver specific plane state
  * @base: base plane state
diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vkms/vkms_writeback.c
index 45d69a3b85f6..59e7a980533c 100644
--- a/drivers/gpu/drm/vkms/vkms_writeback.c
+++ b/drivers/gpu/drm/vkms/vkms_writeback.c
@@ -14,6 +14,9 @@
 #include "vkms_drv.h"
 #include "vkms_formats.h"
 
+#define DEFAULT_COLOR_ENCODING DRM_COLOR_YCBCR_BT601
+#define DEFAULT_COLOR_RANGE DRM_COLOR_YCBCR_LIMITED_RANGE
+
 static const u32 vkms_wb_formats[] = {
 	DRM_FORMAT_ARGB8888,
 	DRM_FORMAT_XRGB8888,
@@ -23,9 +26,17 @@ static const u32 vkms_wb_formats[] = {
 	DRM_FORMAT_RGB565
 };
 
+static void vkms_wb_connector_reset(struct drm_connector *connector)
+{
+	drm_atomic_helper_connector_reset(connector);
+
+	connector->state->writeback_color_encoding = DEFAULT_COLOR_ENCODING;
+	connector->state->writeback_color_range = DEFAULT_COLOR_RANGE;
+}
+
 static const struct drm_connector_funcs vkms_wb_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
-	.reset = drm_atomic_helper_connector_reset,
+	.reset = vkms_wb_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
@@ -60,6 +71,21 @@ static int vkms_wb_atomic_check(struct drm_connector *connector,
 	if (ret < 0)
 		return ret;
 
+	if (conn_state->writeback_color_encoding != DRM_COLOR_YCBCR_BT601 &&
+	    conn_state->writeback_color_encoding != DRM_COLOR_YCBCR_BT709 &&
+	    conn_state->writeback_color_encoding != DRM_COLOR_YCBCR_BT2020) {
+		DRM_DEBUG_KMS("Invalid color encoding %u\n",
+			      conn_state->writeback_color_encoding);
+		return -EINVAL;
+	}
+
+	if (conn_state->writeback_color_range != DRM_COLOR_YCBCR_LIMITED_RANGE &&
+	    conn_state->writeback_color_range != DRM_COLOR_YCBCR_FULL_RANGE) {
+		DRM_DEBUG_KMS("Invalid color range %u\n",
+			      conn_state->writeback_color_range);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -151,6 +177,10 @@ static void vkms_wb_atomic_commit(struct drm_connector *conn,
 	spin_unlock_irq(&output->composer_lock);
 	drm_writeback_queue_job(wb_conn, connector_state);
 	active_wb->pixel_write = get_pixel_write_function(wb_format);
+	get_conversion_matrix_from_argb_u16(wb_format,
+					    conn_state->writeback_color_encoding,
+					    conn_state->writeback_color_range,
+					    &active_wb->conversion_matrix);
 	drm_rect_init(&wb_frame_info->src, 0, 0, crtc_width, crtc_height);
 	drm_rect_init(&wb_frame_info->dst, 0, 0, crtc_width, crtc_height);
 }
@@ -179,9 +209,26 @@ int vkms_enable_writeback_connector(struct vkms_device *vkmsdev,
 
 	drm_connector_helper_add(&wb->base, &vkms_wb_conn_helper_funcs);
 
-	return drmm_writeback_connector_init(&vkmsdev->drm, wb,
+	ret = drmm_writeback_connector_init(&vkmsdev->drm, wb,
 					     &vkms_wb_connector_funcs,
 					     &vkms_output->wb_encoder,
 					     vkms_wb_formats,
 					     ARRAY_SIZE(vkms_wb_formats));
+	if (ret)
+		return ret;
+
+	ret = drm_writeback_create_color_properties(wb,
+						    BIT(DRM_COLOR_YCBCR_BT601) |
+						    BIT(DRM_COLOR_YCBCR_BT709) |
+						    BIT(DRM_COLOR_YCBCR_BT2020),
+						    BIT(DRM_COLOR_YCBCR_LIMITED_RANGE) |
+						    BIT(DRM_COLOR_YCBCR_FULL_RANGE),
+						    DEFAULT_COLOR_ENCODING,
+						    DEFAULT_COLOR_RANGE);
+	if (ret) {
+		DRM_ERROR("adding color properties failed: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
 }
-- 
2.50.1

