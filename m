Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F608C870AC
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 21:29:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71F610E467;
	Tue, 25 Nov 2025 20:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c05brCQy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C036C10E0A3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 20:29:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id A6B9D601AF;
 Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5D8C2C2BCB5;
 Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764102580;
 bh=FvkesFKKe1PzWtmHl2GGOg0cRSIBJCYjHVmpS+N9lyI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=c05brCQyAXaYoDVve5H2cyU5lOZQuOW1VoD4yEgASgBIT/Qjgf1GwoG1Nd1/+90IL
 jjm/RyMUPqCu16BmISX3EhjgjenycjGW/GDYHcT5QgZNp1NsM9EdrgXr0g/A83GYfU
 RRiw/Zd9pcMFUHzqw1FANB40mwwx1Idy0z3nj92yOwLuk00Z7LVWbOhwsNThxIWcC/
 nBhjOIMuzDcyrWLoR9kpBxEYPQ/SxQ/UF90lW2bDwyo7X3DIIK8mAa322J8yG0jeOi
 u5XSwDc8xTGX4+0Uog4gh6nUT0JQtXAJmQKqtCXGjNWzGCfZqfE+8X5fNfsdXbxKRl
 qRlnNuyOL/Ywg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 52021D0EE1C;
 Tue, 25 Nov 2025 20:29:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 25 Nov 2025 21:29:39 +0100
Subject: [PATCH v4 4/8] drm/panel: sw43408: Add enable/disable and reset
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251125-pixel-3-v4-4-3b706f8dcc96@ixit.cz>
References: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
In-Reply-To: <20251125-pixel-3-v4-0-3b706f8dcc96@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc: phodina@protonmail.com, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4880; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=YlQ6X/JDXJqBsYiKSkEnQvOJfhJFKMivKfC8vTnULQ4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpJhGy7DpqdrMysErdAcvvgd0lkis1gq+UapPrI
 BaqwQAfYAGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaSYRsgAKCRBgAj/E00kg
 ctBbD/9yRQdZ8Nz7y3zldNwFNDBW7OC7sNFuYXYFHHOxT5XquF865DZ/8PDYBKwypgmTew8rAA3
 ZPjHLPQ6TDkyqhFBnAJQ1EJzoDQbdtRJSkAdWNHOJ9uudICo1KNxIx/zyuseAZ5xQz4p9Hm8Z5R
 4Qrx63j/MBaWcxQpyTrVtOZLzPbRc+2uN+Wmxzw5YgZxCLMXrP72amq0oVx31sEjnkfqnc/juZD
 HAMLT1Lnn22euetdFoRmDKBKcPjNyAgxqX7UDWFRbsSK7+m5Qgr07RtPmvku8De0hAEZeqib7wr
 xNonwZt1lhkR7Ma3tiwt/pa4ymedcT/DqJEtn0yJ0aTMM9+Vvczwinnwle5oeEyxyJfUf9R6uBX
 yRhGCOibyeNFo2C1x9ZSWULy9yE+sNZ+Axep68GfJS5J+sG1jn/5yVNoNTidVJ6NJsyYsdzOwsH
 pvkrNtowrELO8DO6a28+JXlyk0JWy7Swu+j6yHH1S3JR+8SUxxPinZxUR5A1DAEFVZbJ+qle8Wr
 S10lSRQ2811t2kpitYLhkIJN2m0QGlYDabgTHXsm9weENFLzJCfFSBdouZDrbgKiwTamL3UymFW
 JZLC5C0kts+aT7paA3YFm8zUL7tUkdv2qdY0la109s6wyEwOUfVaMliuT6l3MZSDmTw8B+OQU1U
 irvUVE0qKjARYbg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: David Heidelberg <david@ixit.cz>

Introduce enable(), disable() and reset() functions.

The enable() and disable() callbacks keep the symmetry in the commands
sent to the panel and also make a clearer distinction between panel
initialization and configuration.

Splitting reset() from prepare() follows clean coding practices and lets
us potentially make reset optional in the future for flicker-less
takeover from a bootloader or framebuffer driver where the panel is
already configured.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 83 ++++++++++++++++++++------------
 1 file changed, 53 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index dcca7873acf8e..20217877e107f 100644
--- a/drivers/gpu/drm/panel/panel-lg-sw43408.c
+++ b/drivers/gpu/drm/panel/panel-lg-sw43408.c
@@ -38,11 +38,10 @@ static inline struct sw43408_panel *to_panel_info(struct drm_panel *panel)
 	return container_of(panel, struct sw43408_panel, base);
 }
 
-static int sw43408_unprepare(struct drm_panel *panel)
+static int sw43408_disable(struct drm_panel *panel)
 {
 	struct sw43408_panel *sw43408 = to_panel_info(panel);
 	struct mipi_dsi_multi_context ctx = { .dsi = sw43408->link };
-	int ret;
 
 	mipi_dsi_dcs_set_display_off_multi(&ctx);
 
@@ -50,19 +49,55 @@ static int sw43408_unprepare(struct drm_panel *panel)
 
 	mipi_dsi_msleep(&ctx, 100);
 
+	return ctx.accum_err;
+}
+
+static int sw43408_unprepare(struct drm_panel *panel)
+{
+	struct sw43408_panel *sw43408 = to_panel_info(panel);
+	int ret;
+
 	gpiod_set_value(sw43408->reset_gpio, 1);
 
 	ret = regulator_bulk_disable(ARRAY_SIZE(sw43408->supplies), sw43408->supplies);
 
-	return ret ? : ctx.accum_err;
+	return ret;
 }
 
-static int sw43408_program(struct drm_panel *panel)
+static int sw43408_enable(struct drm_panel *panel)
 {
 	struct sw43408_panel *sw43408 = to_panel_info(panel);
 	struct mipi_dsi_multi_context ctx = { .dsi = sw43408->link };
 	struct drm_dsc_picture_parameter_set pps;
 
+	mipi_dsi_dcs_set_display_on_multi(&ctx);
+
+	mipi_dsi_msleep(&ctx, 50);
+
+	sw43408->link->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
+	drm_dsc_pps_payload_pack(&pps, sw43408->link->dsc);
+
+	mipi_dsi_picture_parameter_set_multi(&ctx, &pps);
+
+	sw43408->link->mode_flags |= MIPI_DSI_MODE_LPM;
+
+	/*
+	 * This panel uses PPS selectors with offset:
+	 * PPS 1 if pps_identifier is 0
+	 * PPS 2 if pps_identifier is 1
+	 */
+	mipi_dsi_compression_mode_ext_multi(&ctx, true,
+					    MIPI_DSI_COMPRESSION_DSC, 1);
+
+	return ctx.accum_err;
+}
+
+static int sw43408_program(struct drm_panel *panel)
+{
+	struct sw43408_panel *sw43408 = to_panel_info(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = sw43408->link };
+
 	mipi_dsi_dcs_write_seq_multi(&ctx, MIPI_DCS_SET_GAMMA_CURVE, 0x02);
 
 	mipi_dsi_dcs_set_tear_on_multi(&ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
@@ -97,26 +132,19 @@ static int sw43408_program(struct drm_panel *panel)
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x04, 0x61, 0xdb, 0x04, 0x70, 0xdb);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0xca);
 
-	mipi_dsi_dcs_set_display_on_multi(&ctx);
-
-	mipi_dsi_msleep(&ctx, 50);
-
-	sw43408->link->mode_flags &= ~MIPI_DSI_MODE_LPM;
-
-	drm_dsc_pps_payload_pack(&pps, sw43408->link->dsc);
-
-	mipi_dsi_picture_parameter_set_multi(&ctx, &pps);
+	return ctx.accum_err;
+}
 
-	sw43408->link->mode_flags |= MIPI_DSI_MODE_LPM;
+static void sw43408_reset(struct sw43408_panel *ctx)
+{
+	usleep_range(5000, 6000);
 
-	/*
-	 * This panel uses PPS selectors with offset:
-	 * PPS 1 if pps_identifier is 0
-	 * PPS 2 if pps_identifier is 1
-	 */
-	mipi_dsi_compression_mode_ext_multi(&ctx, true,
-					    MIPI_DSI_COMPRESSION_DSC, 1);
-	return ctx.accum_err;
+	gpiod_set_value(ctx->reset_gpio, 0);
+	usleep_range(9000, 10000);
+	gpiod_set_value(ctx->reset_gpio, 1);
+	usleep_range(1000, 2000);
+	gpiod_set_value(ctx->reset_gpio, 0);
+	usleep_range(9000, 10000);
 }
 
 static int sw43408_prepare(struct drm_panel *panel)
@@ -128,14 +156,7 @@ static int sw43408_prepare(struct drm_panel *panel)
 	if (ret < 0)
 		return ret;
 
-	usleep_range(5000, 6000);
-
-	gpiod_set_value(ctx->reset_gpio, 0);
-	usleep_range(9000, 10000);
-	gpiod_set_value(ctx->reset_gpio, 1);
-	usleep_range(1000, 2000);
-	gpiod_set_value(ctx->reset_gpio, 0);
-	usleep_range(9000, 10000);
+	sw43408_reset(ctx);
 
 	ret = sw43408_program(panel);
 	if (ret)
@@ -208,6 +229,8 @@ static int sw43408_backlight_init(struct sw43408_panel *ctx)
 }
 
 static const struct drm_panel_funcs sw43408_funcs = {
+	.disable = sw43408_disable,
+	.enable = sw43408_enable,
 	.unprepare = sw43408_unprepare,
 	.prepare = sw43408_prepare,
 	.get_modes = sw43408_get_modes,

-- 
2.51.0


