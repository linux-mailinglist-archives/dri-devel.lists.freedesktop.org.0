Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91590CF583E
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 21:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A226210E410;
	Mon,  5 Jan 2026 20:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Cd7+QTX5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7D610E40C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 20:25:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 806086013C;
 Mon,  5 Jan 2026 20:25:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 27585C19425;
 Mon,  5 Jan 2026 20:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767644705;
 bh=zfQVRzbGancd/dU4asYi2E0hnd0cNIecEX20zJbsHaI=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=Cd7+QTX5HS2bgbreSDFhCjffph//+3khnw8V2q9r/WA7O6YOiATbIQ+UCMe0BwStR
 MjDLTOWhH79l8fbARyBN+3v7OZfbBGQiZsXdva9/3ogx8EMOJzwlZbo6pgvuhk2PAc
 1Pgb62MD0ZZ0WSP6dsTHusAcjpZh2+x31uyvwYwpOqVSaGEkU0OivDlD8/eYdmnI5c
 c/kafyJftMabKiEVceYkbE0xM/OjXpz+xGuKmbWdzwyZusbC8nTVLJJTNLghlt4CrS
 yxQntUkS4+tKxXStMdzsmsmY1rlVOWpwNA+Pv4lQGf4gAw2pTtPGtdB0ixwp7Q0I7K
 Qmsr6ciRjrZaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 1C018C98331;
 Mon,  5 Jan 2026 20:25:05 +0000 (UTC)
From: Sebastian Krzyszkowiak via B4 Relay
 <devnull+sebastian.krzyszkowiak.puri.sm@kernel.org>
Date: Mon, 05 Jan 2026 21:24:42 +0100
Subject: [PATCH 3/5] drm/panel: mantix: Improve power off sequence
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-mantix-halo-fixes-v1-3-1ebc9b195a34@puri.sm>
References: <20260105-mantix-halo-fixes-v1-0-1ebc9b195a34@puri.sm>
In-Reply-To: <20260105-mantix-halo-fixes-v1-0-1ebc9b195a34@puri.sm>
To: =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1555;
 i=sebastian.krzyszkowiak@puri.sm; h=from:subject:message-id;
 bh=Dh/WLymhJdMwIFAEyjNt9y6Y69wAsTgzXgbPUFyjE2I=;
 b=owEBbQKS/ZANAwAKAejyNc8728P/AcsmYgBpXB4f8uRY1ZjG9N97EnweMqwiHxMBjoTGniYKv
 bWVUu38hIOJAjMEAAEKAB0WIQQi3Z+uAGoRQ1g2YXzo8jXPO9vD/wUCaVweHwAKCRDo8jXPO9vD
 /0PbD/wOg8dkELC2fI87ZLxwvGJT7X3J685RUQ9xUTJWewx1+EgONaLuHKqdy2ccAdSNKGE36Hg
 uSTEkZDkCKhq6eDB2w6pP/w6sMq/CZl1+2HnpKfewgER/LaLIQNvIe0t7bWDocBY8wp/j0xeMcj
 kFubhYNrbzw2fBTLDZ/rxfVIxsKYvoLgLmTUvF0iOWhLE54cXYsUw/773J64ou+/dVb3Udtv+3t
 D0AOUfB5RpoLZQQXNeiYLknTQ/Jw+sIWcJBKIiY8qzi+eOVTEfMfYCv8efVnUNVkmYQ69yeuIU2
 rzoete1Cq9TywCCGV3IZfTFPCN9U3A8ttmg+rmBwNvJVsL6MuqOMT5Rmjm71bneJXq9JjXq6i0+
 WG3k485viogjiLrw3xfVcRQOWumzsGPIhWIG4QcGUNWBx/JsPn13PXprQD25JkqnCu9bX+Hy/0R
 WRlf9kZqCUhE8Nhl4bvTZCQbm0V4/n7BxBqYVGo+o9oXBbReoGUpoYugF0WL3A6MiSFOcfgNNXF
 OZhpoX7qv0zBlHFXmfZXmmwgbqWX6uWzxoMc1GgB8JJN0gP785JCHb7Z7w1U4iaaYVMeCfD8UyR
 hkmhFhky5Eex1mIMCdH7KcUGQiCz7hh2TWWjhTFaVHogaD2SouDfnDFNOLKZ6SJZC33DTZOg5pw
 rljEfVOKgX0DmIw==
X-Developer-Key: i=sebastian.krzyszkowiak@puri.sm; a=openpgp;
 fpr=22DD9FAE006A11435836617CE8F235CF3BDBC3FF
X-Endpoint-Received: by B4 Relay for sebastian.krzyszkowiak@puri.sm/default
 with auth_id=32
X-Original-From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
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
Reply-To: sebastian.krzyszkowiak@puri.sm
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>

According to the sequence from section 7.3.4 of FT8006P datasheet,
TP_RSTN and RESX should be asserted after disabling AVDD and AVEE and
together with VDDI.

Also, AVEE power down needs to happen at least 150ms after entering
sleep mode.

Signed-off-by: Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
---
 drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
index bb5489e4d7a9..0e66ee7a727d 100644
--- a/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
+++ b/drivers/gpu/drm/panel/panel-mantix-mlaf057we51.c
@@ -96,6 +96,9 @@ static int mantix_disable(struct drm_panel *panel)
 	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
 
+	/* T10 */
+	mipi_dsi_msleep(&dsi_ctx, 150);
+
 	return dsi_ctx.accum_err;
 }
 
@@ -103,15 +106,16 @@ static int mantix_unprepare(struct drm_panel *panel)
 {
 	struct mantix *ctx = panel_to_mantix(panel);
 
-	gpiod_set_value_cansleep(ctx->tp_rstn_gpio, 1);
-	usleep_range(5000, 6000);
-	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
-
 	regulator_disable(ctx->avee);
 	regulator_disable(ctx->avdd);
 	/* T11 */
 	usleep_range(5000, 6000);
 	regulator_disable(ctx->vddi);
+
+	gpiod_set_value_cansleep(ctx->tp_rstn_gpio, 1);
+	usleep_range(5000, 6000);
+	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
+
 	/* T14 */
 	msleep(50);
 

-- 
2.52.0


