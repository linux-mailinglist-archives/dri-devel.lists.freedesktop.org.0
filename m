Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E1F6EBB47
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 22:50:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B944010E1EB;
	Sat, 22 Apr 2023 20:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3438810E1A0
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 20:50:32 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A35DF61570;
 Sat, 22 Apr 2023 20:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62051C433A0;
 Sat, 22 Apr 2023 20:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682196630;
 bh=1l9FZ20oEDWymbieoAwHPoR8F5js0yQ4cqzFrz8ZJSo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=J3kFpcugwh6SrXrf0AACnC0GZ2ci4nyX29YS0xlBjJS6ybq/SvyXf8BimJnkCbq7R
 S19s7XEx5DSPc8x9xoDFPlvjSQ+zAZ0qPRq+STcYkqJ74xbrxhOPL8Kc3SFpF3V4my
 kjAkFm/kwmHVKEMmhOjwyf3P6WTfssnOQFaFa4Q+Iqq3zm0/ggL/dYkXrWJ056F+BK
 YSO7Y3h3NstiQIJvqEWe6hn45bRb9qkvz3cSPjMAx0VsDHxqxSwZe2JwiDSsr6oJ+N
 8f8x34oND6WJ+sqxQYN78YN6eC5igTfWChsqNHkw1S6zDR6YkWGogNIgQbgnJVhgPB
 k8BjjxiMgPB9w==
Received: by mercury (Postfix, from userid 1000)
 id 2058C1066CCE; Sat, 22 Apr 2023 22:50:25 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v2 11/13] drm/panel: sitronix-st7789v: avoid hardcoding invert
 mode
Date: Sat, 22 Apr 2023 22:50:10 +0200
Message-Id: <20230422205012.2464933-12-sre@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230422205012.2464933-1-sre@kernel.org>
References: <20230422205012.2464933-1-sre@kernel.org>
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
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While the default panel uses invert mode, some panels
require non-invert mode instead.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 6d155c6262f3..158623a8dfb7 100644
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
 
 struct st7789_panel_info default_panel = {
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
2.39.2

