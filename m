Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B25ACAA6FB
	for <lists+dri-devel@lfdr.de>; Sat, 06 Dec 2025 14:34:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AB7910E2AC;
	Sat,  6 Dec 2025 13:34:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="njVdP+5a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8979810E2E3
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Dec 2025 13:34:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 509F944435;
 Sat,  6 Dec 2025 13:34:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29FDFC116D0;
 Sat,  6 Dec 2025 13:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765028084;
 bh=AFb+K5IW8aAcec4JrMbTFoFyUwNA0fqAPFwbodzgHYE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=njVdP+5aciRKqZ11vUlMNE0FXSlpOuZHz1sQz/W5lzSYBnloP67sONsyrpBwVCSlg
 tiveIKYnCWR2O1zywEvIm8A9kmVt9bwYz0TSkuBTkWRu6bFj0JAl1cQEQYYPLqZin3
 maqSRJHSXhZlSyi0/dR1RE3+40A0Pdr+d8h8oVdAC9zRy4OPaHIRIGnTtKBJ2VbKjF
 om6mmPfv1UQjfui+AoAW6VGgaH1jPqu7DMkjec1OmhvBPv7WbnGLbivunciUylfVQh
 WEii23dJBIlc0y9kzuW8YldpITeQiGjNWbb6pn1RzZYtkFbeyavVWGFv05kdPisBkr
 V/D5u73JpC1nA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 1DF2AD3B7D9;
 Sat,  6 Dec 2025 13:34:43 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 06 Dec 2025 14:34:21 +0100
Subject: [PATCH v5 4/8] drm/panel: sw43408: Add enable/disable and reset
 functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251206-pixel-3-v5-4-dc99732e7d35@ixit.cz>
References: <20251206-pixel-3-v5-0-dc99732e7d35@ixit.cz>
In-Reply-To: <20251206-pixel-3-v5-0-dc99732e7d35@ixit.cz>
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
 Dmitry Baryshkov <lumag@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Petr Hodina <phodina@protonmail.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4042; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=qN5N+wyRlTAEEdBXkU0m8ndfuHhWL8oA++gF/EwODJc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpNDDwdwhVXdCgauFD3Y3lSfOCWFYGZq+qhcV87
 0gtuISWVSGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaTQw8AAKCRBgAj/E00kg
 cosjD/9+HhrevxCLlUERK6uJGGw28QCzOPCalI97gKxK0WE5fucRMFG3WFRlC2yNF7829ZUHKGB
 gua6T9XgIhsbmdPPDQZXEcV/HML9GqLcUYwsB3PSYjhV+BGv31lvoU5dFeTZ76tmqxzVQkcWaMO
 /xqhr5pxKMsDvZ4SaDuQ/jAOvYiE1p2YGs8EHQIbW/41LCHGr3XLAEPruORzkkIyDEjSPRvpQu/
 GdfqRoRvNpgvq/KS7vm8Q00s+5vqatjzjsVUGwfLFRIBLhhvAYNULcnqMudE+AxqL/q6j+6z9Ul
 08+JkDvMnKPpTh1E03ZM+zZIRU3r0Q2kwsuLrIkKn2H/BZFmV16jbN87gmuoHDTKCqcoyDzOd4v
 T4MyosVPoCmrlE84gBeHBTB5Fnv9dgM1PRDnzW0SWvq7e9HkhRAABo7leuNJ5K5w1b8ljPUXs0h
 nFN3E2PbzuJYwb97E9BKYAHvV9WBGj+sP02Uhak0bjwyarKPgU9Taf8kQqDIkEv9O9R7GDg1yXF
 2Iccyi8vHHhuCfJ9eZPvdpivHMspglEItQ9fZQNPTZmgQLpJWDFHOJfl1wlV1jiTuQv9BQgq/d8
 tqFrfkRz0+Hmn4nnJnRlCJrntR7QNWgHoOI3hJHZ/+BgZ6wmB7cBylFS6s1ceAr0QNo6bVvrN5i
 8h1M/ei6sYL/zbw==
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
 drivers/gpu/drm/panel/panel-lg-sw43408.c | 47 ++++++++++++++++++++++++--------
 1 file changed, 35 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-lg-sw43408.c b/drivers/gpu/drm/panel/panel-lg-sw43408.c
index dcca7873acf8e..dad6b967b92c2 100644
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
 
@@ -50,18 +49,25 @@ static int sw43408_unprepare(struct drm_panel *panel)
 
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
 
 static int sw43408_program(struct drm_panel *panel)
 {
 	struct sw43408_panel *sw43408 = to_panel_info(panel);
 	struct mipi_dsi_multi_context ctx = { .dsi = sw43408->link };
-	struct drm_dsc_picture_parameter_set pps;
 
 	mipi_dsi_dcs_write_seq_multi(&ctx, MIPI_DCS_SET_GAMMA_CURVE, 0x02);
 
@@ -97,6 +103,15 @@ static int sw43408_program(struct drm_panel *panel)
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0x55, 0x04, 0x61, 0xdb, 0x04, 0x70, 0xdb);
 	mipi_dsi_dcs_write_seq_multi(&ctx, 0xb0, 0xca);
 
+	return ctx.accum_err;
+}
+
+static int sw43408_enable(struct drm_panel *panel)
+{
+	struct sw43408_panel *sw43408 = to_panel_info(panel);
+	struct mipi_dsi_multi_context ctx = { .dsi = sw43408->link };
+	struct drm_dsc_picture_parameter_set pps;
+
 	mipi_dsi_dcs_set_display_on_multi(&ctx);
 
 	mipi_dsi_msleep(&ctx, 50);
@@ -116,18 +131,12 @@ static int sw43408_program(struct drm_panel *panel)
 	 */
 	mipi_dsi_compression_mode_ext_multi(&ctx, true,
 					    MIPI_DSI_COMPRESSION_DSC, 1);
+
 	return ctx.accum_err;
 }
 
-static int sw43408_prepare(struct drm_panel *panel)
+static void sw43408_reset(struct sw43408_panel *ctx)
 {
-	struct sw43408_panel *ctx = to_panel_info(panel);
-	int ret;
-
-	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
-	if (ret < 0)
-		return ret;
-
 	usleep_range(5000, 6000);
 
 	gpiod_set_value(ctx->reset_gpio, 0);
@@ -136,6 +145,18 @@ static int sw43408_prepare(struct drm_panel *panel)
 	usleep_range(1000, 2000);
 	gpiod_set_value(ctx->reset_gpio, 0);
 	usleep_range(9000, 10000);
+}
+
+static int sw43408_prepare(struct drm_panel *panel)
+{
+	struct sw43408_panel *ctx = to_panel_info(panel);
+	int ret;
+
+	ret = regulator_bulk_enable(ARRAY_SIZE(ctx->supplies), ctx->supplies);
+	if (ret < 0)
+		return ret;
+
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


