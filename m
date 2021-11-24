Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 375CD45C848
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 16:08:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B4A6E96E;
	Wed, 24 Nov 2021 15:08:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EB06E947
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 15:08:25 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id 1A7D2801D9;
 Wed, 24 Nov 2021 16:08:22 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: robh+dt@kernel.org,
	david@lechnology.com
Subject: [PATCH 5/6] drm/mipi-dbi: Add device property functions
Date: Wed, 24 Nov 2021 16:07:56 +0100
Message-Id: <20211124150757.17929-6-noralf@tronnes.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211124150757.17929-1-noralf@tronnes.org>
References: <20211124150757.17929-1-noralf@tronnes.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=ZLv5Z0zb c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8
 a=JpTcRpyoInzaOi3rJ_4A:9 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dave.stevenson@raspberrypi.com, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>, maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add helper functions for configuring a MIPI DBI controller from device
properties.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/drm_mipi_dbi.c | 139 +++++++++++++++++++++++++++++++++
 include/drm/drm_mipi_dbi.h     |   3 +
 2 files changed, 142 insertions(+)

diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
index 71b646c4131f..41362e1d4231 100644
--- a/drivers/gpu/drm/drm_mipi_dbi.c
+++ b/drivers/gpu/drm/drm_mipi_dbi.c
@@ -137,6 +137,24 @@ int mipi_dbi_command_read(struct mipi_dbi *dbi, u8 cmd, u8 *val)
 }
 EXPORT_SYMBOL(mipi_dbi_command_read);
 
+/**
+ * mipi_dbi_set_writeonly - Set the controller write only state
+ * @dbi: MIPI DBI structure
+ * @writeonly: If true the controller is not readable
+ *
+ * This function sets whether the controller can be read from or not (ie. MISO connected or not).
+ * It also checks the 'write-only' device property which overrides @writeonly.
+ * The controller is assumed to be readable by default.
+ */
+void mipi_dbi_set_writeonly(struct mipi_dbi *dbi, bool writeonly)
+{
+	struct device *dev = &dbi->spi->dev;
+
+	if (writeonly || device_property_present(dev, "write-only"))
+		dbi->read_commands = NULL;
+}
+EXPORT_SYMBOL(mipi_dbi_set_writeonly);
+
 /**
  * mipi_dbi_command_buf - MIPI DCS command with parameter(s) in an array
  * @dbi: MIPI DBI structure
@@ -186,6 +204,40 @@ int mipi_dbi_command_stackbuf(struct mipi_dbi *dbi, u8 cmd, const u8 *data,
 }
 EXPORT_SYMBOL(mipi_dbi_command_stackbuf);
 
+/**
+ * mipi_dbi_command_from_property - MIPI DCS command with parameter(s) from a device property
+ * @dbi: MIPI DBI structure
+ * @cmd: Command
+ * @propname: Name of the device property
+ * @len: Data length
+ *
+ * This function will execute @cmd with parameters from @propname if it exist.
+ *
+ * Returns:
+ * Zero on success, negative error code on failure.
+ */
+int mipi_dbi_command_from_property(struct mipi_dbi *dbi, u8 cmd, const char *propname, size_t len)
+{
+	struct device *dev = &dbi->spi->dev;
+	u8 data[64];
+	int ret;
+
+	if (WARN_ON_ONCE(len > sizeof(data)))
+		return -EINVAL;
+
+	if (!device_property_present(dev, propname))
+		return 0;
+
+	ret = device_property_read_u8_array(dev, propname, data, len);
+	if (ret) {
+		dev_err(dev, "Failed to read property '%s', error=%d\n", propname, ret);
+		return ret;
+	}
+
+	return mipi_dbi_command_stackbuf(dbi, cmd, data, len);
+}
+EXPORT_SYMBOL(mipi_dbi_command_from_property);
+
 /**
  * mipi_dbi_buf_copy - Copy a framebuffer, transforming it if necessary
  * @dst: The destination buffer
@@ -571,6 +623,93 @@ int mipi_dbi_dev_init(struct mipi_dbi_dev *dbidev,
 }
 EXPORT_SYMBOL(mipi_dbi_dev_init);
 
+static int mipi_dbi_property_read_u32(struct device *dev, const char *propname,
+				      unsigned int *retval, bool required)
+{
+	u32 val32;
+	int ret;
+
+	if (!device_property_present(dev, propname)) {
+		if (required) {
+			dev_err(dev, "Missing required property '%s'\n", propname);
+			return -EINVAL;
+		}
+
+		return 0;
+	}
+
+	ret = device_property_read_u32(dev, propname, &val32);
+	if (ret) {
+		dev_err(dev, "Error reading property '%s', error=%d\n", propname, ret);
+		return ret;
+	}
+
+	*retval = val32;
+
+	return 0;
+}
+
+static void mipi_dbi_simple_mode(struct drm_display_mode *mode,
+				 unsigned int width, unsigned int height,
+				 unsigned int width_mm, unsigned int height_mm)
+{
+	struct drm_display_mode simple_mode = { DRM_SIMPLE_MODE(width, height, width_mm, height_mm) };
+
+	*mode = simple_mode;
+}
+
+/**
+ * mipi_dbi_read_device_properties - Read device properties
+ * @dbidev: MIPI DBI device structure
+ * @mode: Returned display mode
+ *
+ * This function reads device properties 'width', 'height', 'width_mm', 'height_mm'
+ * and returns them as a display mode in @mode.
+ * It also reads 'x-offset' and 'y-offset' whose values are set on @dbidev.
+ *
+ * The returned @mode can be passed on to mipi_dbi_dev_init().
+ *
+ * Returns:
+ * Zero on success, negative error code on failure.
+ */
+int mipi_dbi_read_device_properties(struct mipi_dbi_dev *dbidev, struct drm_display_mode *mode)
+{
+	unsigned int width, height, width_mm = 0, height_mm = 0;
+	struct device *dev = dbidev->drm.dev;
+	int ret;
+
+	ret = mipi_dbi_property_read_u32(dev, "width", &width, true);
+	if (ret)
+		return ret;
+
+	ret = mipi_dbi_property_read_u32(dev, "height", &height, true);
+	if (ret)
+		return ret;
+
+	if (device_property_present(dev, "width_mm") || device_property_present(dev, "height_mm")) {
+		ret = mipi_dbi_property_read_u32(dev, "width_mm", &width_mm, true);
+		if (ret)
+			return ret;
+
+		ret = mipi_dbi_property_read_u32(dev, "height_mm", &height_mm, true);
+		if (ret)
+			return ret;
+	}
+
+	mipi_dbi_simple_mode(mode, width, height, width_mm, height_mm);
+
+	ret = mipi_dbi_property_read_u32(dev, "x-offset", &dbidev->left_offset, false);
+	if (ret)
+		return ret;
+
+	ret = mipi_dbi_property_read_u32(dev, "y-offset", &dbidev->top_offset, false);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+EXPORT_SYMBOL(mipi_dbi_read_device_properties);
+
 /**
  * mipi_dbi_hw_reset - Hardware reset of controller
  * @dbi: MIPI DBI structure
diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
index 05e194958265..c75f760d6de5 100644
--- a/include/drm/drm_mipi_dbi.h
+++ b/include/drm/drm_mipi_dbi.h
@@ -147,6 +147,7 @@ int mipi_dbi_dev_init_with_formats(struct mipi_dbi_dev *dbidev,
 int mipi_dbi_dev_init(struct mipi_dbi_dev *dbidev,
 		      const struct drm_simple_display_pipe_funcs *funcs,
 		      const struct drm_display_mode *mode, unsigned int rotation);
+int mipi_dbi_read_device_properties(struct mipi_dbi_dev *dbidev, struct drm_display_mode *mode);
 void mipi_dbi_pipe_update(struct drm_simple_display_pipe *pipe,
 			  struct drm_plane_state *old_state);
 void mipi_dbi_enable_flush(struct mipi_dbi_dev *dbidev,
@@ -163,9 +164,11 @@ int mipi_dbi_spi_transfer(struct spi_device *spi, u32 speed_hz,
 			  u8 bpw, const void *buf, size_t len);
 
 int mipi_dbi_command_read(struct mipi_dbi *dbi, u8 cmd, u8 *val);
+void mipi_dbi_set_writeonly(struct mipi_dbi *dbi, bool writeonly);
 int mipi_dbi_command_buf(struct mipi_dbi *dbi, u8 cmd, u8 *data, size_t len);
 int mipi_dbi_command_stackbuf(struct mipi_dbi *dbi, u8 cmd, const u8 *data,
 			      size_t len);
+int mipi_dbi_command_from_property(struct mipi_dbi *dbi, u8 cmd, const char *propname, size_t len);
 int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
 		      struct drm_rect *clip, bool swap);
 /**
-- 
2.33.0

