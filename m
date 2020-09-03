Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4B4825C7B3
	for <lists+dri-devel@lfdr.de>; Thu,  3 Sep 2020 18:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45D1D6EA23;
	Thu,  3 Sep 2020 16:57:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A68F26EA16
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 16:57:29 +0000 (UTC)
Received: from [2a0a:edc0:0:1101:1d::39] (helo=dude03.red.stw.pengutronix.de)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <mtr@pengutronix.de>)
 id 1kDsY9-0003YG-Or; Thu, 03 Sep 2020 18:57:27 +0200
Received: from mtr by dude03.red.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <mtr@dude03.red.stw.pengutronix.de>)
 id 1kDsY3-005L3i-NZ; Thu, 03 Sep 2020 18:57:19 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org
Date: Thu,  3 Sep 2020 18:57:15 +0200
Message-Id: <20200903165717.1272492-15-m.tretter@pengutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200903165717.1272492-1-m.tretter@pengutronix.de>
References: <20200903165717.1272492-1-m.tretter@pengutronix.de>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::39
X-SA-Exim-Mail-From: mtr@pengutronix.de
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
 metis.ext.pengutronix.de
X-Spam-Level: 
X-Spam-Status: No, score=-0.4 required=4.0 tests=AWL,BAYES_00,RDNS_NONE,
 SPF_HELO_NONE,SPF_SOFTFAIL autolearn=no autolearn_force=no
 version=3.4.2
Subject: [PATCH 14/16] drm/exynos: add callback for enabling i80 mode
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on metis.ext.pengutronix.de)
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: Michael Tretter <m.tretter@pengutronix.de>, krzk@kernel.org,
 Laurent.pinchart@ideasonboard.com, kernel@pengutronix.de,
 narmstrong@baylibre.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Display controllers need to know if the MIPI DSI bridge is running in
command or video mode. Allow platform drivers to register a callback for
being notified about the used mode.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 drivers/gpu/drm/exynos/exynos_drm_dsi.c | 24 ++++++++++++++++++++++--
 1 file changed, 22 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
index 993402f1f7c7..a9dac66c834f 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
@@ -255,6 +255,7 @@ struct exynos_dsi_driver_data {
 	unsigned int num_bits_resol;
 	const unsigned int *reg_values;
 	void (*te_handler)(struct drm_encoder *encoder);
+	void (*set_command_node)(struct drm_encoder *encoder, bool enable);
 };
 
 struct exynos_dsi {
@@ -471,6 +472,19 @@ static void exynos_dsi_te_handler(struct drm_encoder *encoder)
 	exynos_drm_crtc_te_handler(encoder->crtc);
 }
 
+static void exynos_dsi_set_command_mode(struct drm_encoder *encoder,
+					bool enable)
+{
+	struct drm_device *drm = encoder->dev;
+	struct exynos_drm_crtc *crtc;
+
+	crtc = exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD);
+	if (IS_ERR(crtc))
+		return;
+
+	crtc->i80_mode = enable;
+}
+
 static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
 	.reg_ofs = EXYNOS_REG_OFS,
 	.plltmr_reg = 0x50,
@@ -482,6 +496,7 @@ static const struct exynos_dsi_driver_data exynos3_dsi_driver_data = {
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
 	.te_handler = exynos_dsi_te_handler,
+	.set_command_node = exynos_dsi_set_command_mode,
 };
 
 static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
@@ -495,6 +510,7 @@ static const struct exynos_dsi_driver_data exynos4_dsi_driver_data = {
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
 	.te_handler = exynos_dsi_te_handler,
+	.set_command_node = exynos_dsi_set_command_mode,
 };
 
 static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
@@ -506,6 +522,7 @@ static const struct exynos_dsi_driver_data exynos5_dsi_driver_data = {
 	.num_bits_resol = 11,
 	.reg_values = reg_values,
 	.te_handler = exynos_dsi_te_handler,
+	.set_command_node = exynos_dsi_set_command_mode,
 };
 
 static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
@@ -518,6 +535,7 @@ static const struct exynos_dsi_driver_data exynos5433_dsi_driver_data = {
 	.num_bits_resol = 12,
 	.reg_values = exynos5433_reg_values,
 	.te_handler = exynos_dsi_te_handler,
+	.set_command_node = exynos_dsi_set_command_mode,
 };
 
 static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
@@ -530,6 +548,7 @@ static const struct exynos_dsi_driver_data exynos5422_dsi_driver_data = {
 	.num_bits_resol = 12,
 	.reg_values = exynos5422_reg_values,
 	.te_handler = exynos_dsi_te_handler,
+	.set_command_node = exynos_dsi_set_command_mode,
 };
 
 static const struct of_device_id exynos_dsi_of_match[] = {
@@ -1651,8 +1670,9 @@ static int exynos_dsi_host_attach(struct mipi_dsi_host *host,
 	dsi->lanes = device->lanes;
 	dsi->format = device->format;
 	dsi->mode_flags = device->mode_flags;
-	exynos_drm_crtc_get_by_type(drm, EXYNOS_DISPLAY_TYPE_LCD)->i80_mode =
-			!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO);
+	if (dsi->driver_data->set_command_node)
+		dsi->driver_data->set_command_node(encoder,
+				!(dsi->mode_flags & MIPI_DSI_MODE_VIDEO));
 
 	mutex_unlock(&drm->mode_config.mutex);
 
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
