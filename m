Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A19AB752EC5
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 03:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A2A10E094;
	Fri, 14 Jul 2023 01:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4CDB10E0DA
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 01:38:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 260F961B96;
 Fri, 14 Jul 2023 01:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F38C433C9;
 Fri, 14 Jul 2023 01:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689298684;
 bh=naWE2eIjBBKz4B0jzEm35l9sKG56Gwsd4NcCsuZtNmY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ViZ3Xf2bDb4Ex0evOPyohm+RJpRzM1CaULxqTMG9sM4Rf4V0qwdWNz3ro5yQJombh
 s5xcWLyK7rE6Ko+WdBwDxOg5pjbxLIklK31DXLIGVJ+F9JBhJ1HDcmHS90uq1WQaS3
 PgEnCOd/xgUjU/4P4xQXT3B/+dJVtQpOff+6vI6pHPgE2NP/DLXz2ru8ga6OObZc04
 gtDcaNCeQDGHaGAU93qkPLVBvSJ2yHxwXPKtgWcHybBV0VoYCjn26qztzZ9JG4s2Uj
 nZx/SIPQ/rstuL1a3lJja6k5GZxLBVPeFvqOTgH6CTRgpMShVLJKXK8aqIuWifPpd2
 gePG2ekNWgToQ==
Received: by mercury (Postfix, from userid 1000)
 id E509310676F3; Fri, 14 Jul 2023 03:37:58 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v3 11/19] drm/panel: sitronix-st7789v: avoid hardcoding invert
 mode
Date: Fri, 14 Jul 2023 03:37:48 +0200
Message-Id: <20230714013756.1546769-12-sre@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230714013756.1546769-1-sre@kernel.org>
References: <20230714013756.1546769-1-sre@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While the default panel uses invert mode, some panels
require non-invert mode instead.

Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index d05d7a9caefc..ee84d7a9019e 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -112,6 +112,7 @@
 struct st7789_panel_info {
 	const struct drm_display_mode *mode;
 	u32 bus_format;
+	bool invert_mode;
 };
 
 struct st7789v {
@@ -171,6 +172,7 @@ static const struct drm_display_mode default_mode = {
 
 static const struct st7789_panel_info default_panel = {
 	.mode = &default_mode,
+	.invert_mode = true,
 	.bus_format = MEDIA_BUS_FMT_RGB666_1X18,
 };
 
@@ -321,7 +323,13 @@ static int st7789v_prepare(struct drm_panel *panel)
 	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN61(0x1b)));
 	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_NVGAMCTRL_VN62(0x28)));
 
-	ST7789V_TEST(ret, st7789v_write_command(ctx, MIPI_DCS_ENTER_INVERT_MODE));
+	if (ctx->info->invert_mode) {
+		ST7789V_TEST(ret, st7789v_write_command(ctx,
+						MIPI_DCS_ENTER_INVERT_MODE));
+	} else {
+		ST7789V_TEST(ret, st7789v_write_command(ctx,
+						MIPI_DCS_EXIT_INVERT_MODE));
+	}
 
 	ST7789V_TEST(ret, st7789v_write_command(ctx, ST7789V_RAMCTRL_CMD));
 	ST7789V_TEST(ret, st7789v_write_data(ctx, ST7789V_RAMCTRL_DM_RGB |
-- 
2.40.1

