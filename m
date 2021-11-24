Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC8B45C84A
	for <lists+dri-devel@lfdr.de>; Wed, 24 Nov 2021 16:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D97D96E979;
	Wed, 24 Nov 2021 15:08:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2761F6E94A
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 15:08:25 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id 729158016E;
 Wed, 24 Nov 2021 16:08:22 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: robh+dt@kernel.org,
	david@lechnology.com
Subject: [PATCH 6/6] drm: tiny: st7735r: Support DT initialization of
 controller
Date: Wed, 24 Nov 2021 16:07:57 +0100
Message-Id: <20211124150757.17929-7-noralf@tronnes.org>
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
 a=Rv4-UE-PrmLv3P_qtPAA:9 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
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

Add support for initializing the controller from device properties when
the compatible is "sitronix,st7735r".

The rotation property does not apply in this case since a matching
ADDRESS_MODE/madctl value is necessary.

Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/gpu/drm/tiny/st7735r.c | 87 +++++++++++++++++++++++++++++-----
 1 file changed, 75 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/tiny/st7735r.c b/drivers/gpu/drm/tiny/st7735r.c
index fc40dd10efa8..7f4d880b8702 100644
--- a/drivers/gpu/drm/tiny/st7735r.c
+++ b/drivers/gpu/drm/tiny/st7735r.c
@@ -58,6 +58,52 @@ struct st7735r_priv {
 static void st7735r_pipe_enable(struct drm_simple_display_pipe *pipe,
 				struct drm_crtc_state *crtc_state,
 				struct drm_plane_state *plane_state)
+{
+	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
+	struct mipi_dbi *dbi = &dbidev->dbi;
+	int ret, idx;
+
+	if (!drm_dev_enter(pipe->crtc.dev, &idx))
+		return;
+
+	DRM_DEBUG_KMS("\n");
+
+	ret = mipi_dbi_poweron_conditional_reset(dbidev);
+	if (ret < 0)
+		goto out_exit;
+	if (ret == 1)
+		goto out_enable;
+
+	mipi_dbi_command(dbi, MIPI_DCS_EXIT_SLEEP_MODE);
+	msleep(120);
+
+	mipi_dbi_command_from_property(dbi, ST7735R_FRMCTR1, "frmctr1", 3);
+	mipi_dbi_command_from_property(dbi, ST7735R_INVCTR,  "invctr", 1);
+	mipi_dbi_command_from_property(dbi, ST7735R_PWCTR1,  "pwctr1", 3);
+	mipi_dbi_command_from_property(dbi, ST7735R_PWCTR2,  "pwctr2", 1);
+	mipi_dbi_command_from_property(dbi, ST7735R_PWCTR3,  "pwctr3", 2);
+	mipi_dbi_command_from_property(dbi, ST7735R_VMCTR1,  "vmctr1", 1);
+	mipi_dbi_command_from_property(dbi, MIPI_DCS_SET_ADDRESS_MODE, "madctl", 1);
+	mipi_dbi_command(dbi, MIPI_DCS_SET_PIXEL_FORMAT, MIPI_DCS_PIXEL_FMT_16BIT);
+	mipi_dbi_command_from_property(dbi, ST7735R_GAMCTRP1, "gamctrp1", 16);
+	mipi_dbi_command_from_property(dbi, ST7735R_GAMCTRN1, "gamctrn1", 16);
+
+	mipi_dbi_command(dbi, MIPI_DCS_SET_DISPLAY_ON);
+out_enable:
+	mipi_dbi_enable_flush(dbidev, crtc_state, plane_state);
+out_exit:
+	drm_dev_exit(idx);
+}
+
+static const struct drm_simple_display_pipe_funcs st7735r_pipe_funcs = {
+	.enable		= st7735r_pipe_enable,
+	.disable	= mipi_dbi_pipe_disable,
+	.update		= mipi_dbi_pipe_update,
+};
+
+static void jd_t18003_t01_pipe_enable(struct drm_simple_display_pipe *pipe,
+				      struct drm_crtc_state *crtc_state,
+				      struct drm_plane_state *plane_state)
 {
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(pipe->crtc.dev);
 	struct st7735r_priv *priv = container_of(dbidev, struct st7735r_priv,
@@ -132,8 +178,8 @@ static void st7735r_pipe_enable(struct drm_simple_display_pipe *pipe,
 	drm_dev_exit(idx);
 }
 
-static const struct drm_simple_display_pipe_funcs st7735r_pipe_funcs = {
-	.enable		= st7735r_pipe_enable,
+static const struct drm_simple_display_pipe_funcs jd_t18003_t01_pipe_funcs = {
+	.enable		= jd_t18003_t01_pipe_enable,
 	.disable	= mipi_dbi_pipe_disable,
 	.update		= mipi_dbi_pipe_update,
 };
@@ -168,6 +214,7 @@ static const struct drm_driver st7735r_driver = {
 static const struct of_device_id st7735r_of_match[] = {
 	{ .compatible = "jianda,jd-t18003-t01", .data = &jd_t18003_t01_cfg },
 	{ .compatible = "okaya,rh128128t", .data = &rh128128t_cfg },
+	{ .compatible = "sitronix,st7735r" },
 	{ },
 };
 MODULE_DEVICE_TABLE(of, st7735r_of_match);
@@ -180,6 +227,9 @@ MODULE_DEVICE_TABLE(spi, st7735r_id);
 
 static int st7735r_probe(struct spi_device *spi)
 {
+	const struct drm_simple_display_pipe_funcs *funcs;
+	const struct drm_display_mode *mode;
+	struct drm_display_mode dt_mode;
 	struct device *dev = &spi->dev;
 	const struct st7735r_cfg *cfg;
 	struct mipi_dbi_dev *dbidev;
@@ -191,8 +241,12 @@ static int st7735r_probe(struct spi_device *spi)
 	int ret;
 
 	cfg = device_get_match_data(&spi->dev);
-	if (!cfg)
-		cfg = (void *)spi_get_device_id(spi)->driver_data;
+	if (!cfg) {
+		const struct spi_device_id *spi_id = spi_get_device_id(spi);
+
+		if (spi_id)
+			cfg = (struct st7735r_cfg *)spi_id->driver_data;
+	}
 
 	priv = devm_drm_dev_alloc(dev, &st7735r_driver,
 				  struct st7735r_priv, dbidev.drm);
@@ -217,20 +271,29 @@ static int st7735r_probe(struct spi_device *spi)
 	if (IS_ERR(dbidev->backlight))
 		return PTR_ERR(dbidev->backlight);
 
-	device_property_read_u32(dev, "rotation", &rotation);
-
 	ret = mipi_dbi_spi_init(spi, dbi, dc);
 	if (ret)
 		return ret;
 
-	if (cfg->write_only)
-		dbi->read_commands = NULL;
+	if (cfg) {
+		device_property_read_u32(dev, "rotation", &rotation);
 
-	dbidev->left_offset = cfg->left_offset;
-	dbidev->top_offset = cfg->top_offset;
+		mode = &cfg->mode;
+		funcs = &jd_t18003_t01_pipe_funcs;
+		dbidev->left_offset = cfg->left_offset;
+		dbidev->top_offset = cfg->top_offset;
+	} else {
+		ret = mipi_dbi_read_device_properties(dbidev, &dt_mode);
+		if (ret)
+			return ret;
 
-	ret = mipi_dbi_dev_init(dbidev, &st7735r_pipe_funcs, &cfg->mode,
-				rotation);
+		mode = &dt_mode;
+		funcs = &st7735r_pipe_funcs;
+	}
+
+	mipi_dbi_set_writeonly(dbi, cfg ? cfg->write_only : false);
+
+	ret = mipi_dbi_dev_init(dbidev, funcs, mode, rotation);
 	if (ret)
 		return ret;
 
-- 
2.33.0

