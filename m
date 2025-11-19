Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 480A3C6F3A6
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 15:21:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7322110E63B;
	Wed, 19 Nov 2025 14:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fHsiJ8Ar";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEFE610E606
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 14:21:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id A8179445D8;
 Wed, 19 Nov 2025 14:21:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A7EEC4AF0E;
 Wed, 19 Nov 2025 14:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763562102;
 bh=8P+oEugwPDNniFX9jpbpGjr3Q7WMxpS+rZBZ/vMYm2I=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=fHsiJ8ArhC+APU7eHM2VfMs237bdT28BgNO+bW1UCAkhUKRDPGq9oVOUMjsSVn6FF
 0cnnB4NcJeJ/jRTTxXEic2OV5f1EwvTM9rtNEFJzlrorx+08KgTBLv0m+DchLqgIAb
 baonZrliofbwwt7FVK8QCVFB/xeCwLWtfaP/ZWwxTbhuu7waT1LL0VLM4WqJVuifz/
 A8f0F6bzh+WH1/2Ipv1xc+4zfT8A7BikHbEJ2f4BaVrTgIyMU+FScdWS5Q7dYe5qLD
 BBaiyK+x7RguVURjd4zyNoaXbTSlahc0TrSlWq+6j13ulUVANfVmMZpWvdrjvcY0NC
 sIIciNICAStcA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 25061CF34C2;
 Wed, 19 Nov 2025 14:21:41 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 19 Nov 2025 15:21:36 +0100
Subject: [PATCH v3 11/12] drm/panel: sofef00: Mark the LPM mode always-on
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-sofef00-rebuild-v3-11-6cd55471e84e@ixit.cz>
References: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
In-Reply-To: <20251119-sofef00-rebuild-v3-0-6cd55471e84e@ixit.cz>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1446; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=oJUn+PKpj5llEIJZZEJFyisMkk6yg/4H6PZ4hxEEiTc=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHdJyb9N0LOagPPMjYmh9CRKV+Ca80ELfGUFkO
 f8Zr+VLariJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaR3ScgAKCRBgAj/E00kg
 ckmID/4mnB+PJW1yJTLvCBaXnUg0TbiINpx+ISXuKICjRxNDgEpaScZBrH7TfCH65YAu7Mf9si+
 ol7GzI35mHuJvpJbwSldjdUiAPpdHlb579BNxgqldXuCH/JGAaYx/BCIZ5xUV8n4nd9g26njhjE
 QMxOl1XrX//8m6SmXRbfX9+2gLCXkQxjeG9LHvpqKoqUqYnsM8lqyt2/z7J3hpT5SPWH2xif+N2
 bE0vVzmgxS7+SJtD9fLoMzZVmnAlPfouT0R966vPxyY1VcPxilmxomEmgM1e0zW+PrvC+8ELRCn
 ZA7DT3IlIwJiPF5bPIPfnBwiL95FzkEsSaRXWLhINSftY6jHABgqCDarBxzfo438HXlTHksikUR
 plzdTUdipWBMQilZNIgfL94s7fTMkz7x3qi9O5Yk4qqLcFV4GJm0zuU6OKVRpWP/Do4K/0ZJ+75
 aiYgsoEf78KWQESdlp0Bc51misvLmDBixNX+VjAqFyHdOWNN2D6k0OON10h2ClWDv6VZbtpwaX5
 UFlG7PNMC3EJlmivrtwHga7C3WLs8IPO6m915IfSNd+XbKTu0T3zdFa+obAGi8KyIY8q9Sux1Ce
 uxtV+TWUoWYOqGHnebdTdYk1CdE/AnAZfbJrN52dAykqvEr+Zb8QZBYQ3P+tzaJpk5q7p0Y5H5X
 bhVnj4q3HQ+GQYw==
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

The panel operated in low-power mode, with exception of changing the
brightness levels.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 0e857abda5964..db9c181695f1d 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -92,8 +92,6 @@ static int sofef00_panel_off(struct sofef00_panel *ctx)
 	struct mipi_dsi_device *dsi = ctx->dsi;
 	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
 
-	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
-
 	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
 	mipi_dsi_msleep(&dsi_ctx, 40);
 
@@ -180,10 +178,14 @@ static int sofef00_panel_bl_update_status(struct backlight_device *bl)
 	int err;
 	u16 brightness = (u16)backlight_get_brightness(bl);
 
+	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
+
 	err = mipi_dsi_dcs_set_display_brightness_large(dsi, brightness);
 	if (err < 0)
 		return err;
 
+	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
+
 	return 0;
 }
 
@@ -234,6 +236,7 @@ static int sofef00_panel_probe(struct mipi_dsi_device *dsi)
 
 	dsi->lanes = 4;
 	dsi->format = MIPI_DSI_FMT_RGB888;
+	dsi->mode_flags = MIPI_DSI_MODE_LPM;
 
 	ctx->panel.prepare_prev_first = true;
 

-- 
2.51.0


