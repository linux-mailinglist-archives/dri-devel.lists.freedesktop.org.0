Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1618ADE664
	for <lists+dri-devel@lfdr.de>; Wed, 18 Jun 2025 11:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E8B710E7B0;
	Wed, 18 Jun 2025 09:16:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="jOqwmT1l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7AF2710E7B0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Jun 2025 09:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Op
 H9BXnzwdTWSNc6lJhMNwj9RTlEl2OWQCGz1eG4Q9s=; b=jOqwmT1lCsnTmcPi7A
 glt+qpkrHFsj0JgDZ+Dpj3/ENiWDyZhs1cccP9qazEV1D6EuvOnXyO2rzaWmODgt
 HrAl05rq4qwrpuA9AZBeoe5qm4TBoleFXi4Am3u3WLWf0vm1Bg8K1OZKNb6MIwcF
 tnPYizT/BAPLb4XfMMzUyMS6w=
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id
 _____wC3WPaug1JovVLXAA--.9072S2; 
 Wed, 18 Jun 2025 17:15:30 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: neil.armstrong@linaro.org
Cc: quic_jesszhan@quicinc.com, mripard@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, sebastian.reichel@collabora.com,
 Andy Yan <andy.yan@rock-chips.com>
Subject: [PATCH] drm/panel: raydium-rm67200: Move initialization from enable()
 to prepare stage
Date: Wed, 18 Jun 2025 17:15:20 +0800
Message-ID: <20250618091520.691590-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wC3WPaug1JovVLXAA--.9072S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxXw1DZry3Cw4DAr1kCryxuFg_yoW5Xr45pF
 47WaySyrWkXa98uFZ7Aa1kZFy5Xrs7tryfJF1DKasxXr1jyw1UW3W7CrW5uasIqrW8AF45
 Xrn3Jr17JaySkrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UmAp5UUUUU=
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbB0gdwXmhSguEczwAAsx
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

From: Andy Yan <andy.yan@rock-chips.com>

The DSI host has different modes in prepare() and enable() functions,
prepare() is in LP command mode and enable() is in HS video mode.

From our experience, generally the initialization sequence needs to be
sent in the LP command mode.

Move the setup init function from enable() to prepare() to fix a display
shift on rk3568 evb.

Tested on rk3568/rk3576/rk3588 EVB.

Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
---

 drivers/gpu/drm/panel/panel-raydium-rm67200.c | 22 ++++++-------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-raydium-rm67200.c b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
index df6c1727237b5..459381d53847f 100644
--- a/drivers/gpu/drm/panel/panel-raydium-rm67200.c
+++ b/drivers/gpu/drm/panel/panel-raydium-rm67200.c
@@ -320,6 +320,7 @@ static void w552793baa_setup(struct mipi_dsi_multi_context *ctx)
 static int raydium_rm67200_prepare(struct drm_panel *panel)
 {
 	struct raydium_rm67200 *ctx = to_raydium_rm67200(panel);
+	struct mipi_dsi_multi_context mctx = { .dsi = ctx->dsi };
 	int ret;
 
 	ret = regulator_bulk_enable(ctx->num_supplies, ctx->supplies);
@@ -330,6 +331,12 @@ static int raydium_rm67200_prepare(struct drm_panel *panel)
 
 	msleep(60);
 
+	ctx->panel_info->panel_setup(&mctx);
+	mipi_dsi_dcs_exit_sleep_mode_multi(&mctx);
+	mipi_dsi_msleep(&mctx, 120);
+	mipi_dsi_dcs_set_display_on_multi(&mctx);
+	mipi_dsi_msleep(&mctx, 30);
+
 	return 0;
 }
 
@@ -345,20 +352,6 @@ static int raydium_rm67200_unprepare(struct drm_panel *panel)
 	return 0;
 }
 
-static int raydium_rm67200_enable(struct drm_panel *panel)
-{
-	struct raydium_rm67200 *rm67200 = to_raydium_rm67200(panel);
-	struct mipi_dsi_multi_context ctx = { .dsi = rm67200->dsi };
-
-	rm67200->panel_info->panel_setup(&ctx);
-	mipi_dsi_dcs_exit_sleep_mode_multi(&ctx);
-	mipi_dsi_msleep(&ctx, 120);
-	mipi_dsi_dcs_set_display_on_multi(&ctx);
-	mipi_dsi_msleep(&ctx, 30);
-
-	return ctx.accum_err;
-}
-
 static int raydium_rm67200_disable(struct drm_panel *panel)
 {
 	struct raydium_rm67200 *rm67200 = to_raydium_rm67200(panel);
@@ -383,7 +376,6 @@ static const struct drm_panel_funcs raydium_rm67200_funcs = {
 	.prepare = raydium_rm67200_prepare,
 	.unprepare = raydium_rm67200_unprepare,
 	.get_modes = raydium_rm67200_get_modes,
-	.enable = raydium_rm67200_enable,
 	.disable = raydium_rm67200_disable,
 };
 
-- 
2.43.0

base-commit: 082174f76c95dd503de64f182537c89b49771491
branch: rk356x_rk3588_rk3576_dsi

