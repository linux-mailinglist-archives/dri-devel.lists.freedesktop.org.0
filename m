Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A0F4C33253
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 23:16:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC8BE10E679;
	Tue,  4 Nov 2025 22:16:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a0aFKOZv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85CED10E678
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1820E44885;
 Tue,  4 Nov 2025 22:16:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C47E0C2BCB2;
 Tue,  4 Nov 2025 22:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762294574;
 bh=h8mvhLF2NQpOEhwrwGAXO5y7raG5Pj5KKGwO1xu0Ls4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=a0aFKOZvkvhEDlTa5cMFRL9rusxny15Xlhj1RPtrxNGgST3jYqYo0AMKpNFaIBhFN
 Yr5pAzvC0wvBoMbbzLVfjqdIt8aQAFdcD8XYLQms8LJsDIEGw3+f77UrtJbatHfNPc
 a5TCKh/pOiVB1r6fQU6poGoNNCn7Ggw0VtIbE/ef8KKFLvb82PTLCIQxkNgj9bHQVs
 JGPXS5iODIpGbNMW1TXAzruk8dQ4QGMwOUh19x8do8nF8/NYlu40gNWLPtx5a8IKX1
 LXkVQ5WUKyJk7gRDvaBEOFXG6LzNgr6nNfdFuXzonekOvyg+T5EOPw+MKmzDnwP5fE
 DaR4EJFZUYHhA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id BC52BCCF9E3;
 Tue,  4 Nov 2025 22:16:14 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 04 Nov 2025 23:16:13 +0100
Subject: [PATCH 05/12] drm/panel: sofef00: Split sending commands to the
 enable/disable functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251104-sofef00-rebuild-v1-5-dfcfa17eb176@ixit.cz>
References: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
In-Reply-To: <20251104-sofef00-rebuild-v1-0-dfcfa17eb176@ixit.cz>
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
 Casey Connolly <casey.connolly@linaro.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2045; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=xfG4W9ai59WdRLt2V9HKjqKsc6sEspLbINOP0a9yxjE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpCnssyU0Ni6Uz+R6/hYInvMj5WikMvIXDn67Vb
 yQm+YBjgL2JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaQp7LAAKCRBgAj/E00kg
 coB1D/0cpWD2B+LMcgXVvUPQMqkVqVc06siMY4PtpSKd6OWRRvzz/OLtwJpn7+UlibB87rpFPJi
 EzT9BnqVPLOETuAJsqSRqP5Q/CF6vJ5kBE2OVFOHwQ2++nZcSF+Xl2+sBI/+83n9C500R0KY6Em
 0aGGrzsbnssImazgCb+3Y7kjfkqQwexffvqzwNDb4al7Mc63zqu+lSv8/S/kuF0KC2v2g34LIwG
 LDlVDPCo83YCHnVgi8mLquAJePnyLUXFv2sQhYTh7ppjamCcns8/rgkOY1jX1zOQG2cNM4DAOVv
 hcJCwC5aoALX3kYdibRjbmaDNAlJrae2rxfHlEkScwlFuA7aNy1Z2O/nPYiBJLjFo6/Zv44A3oW
 MlD1gq5of1+NLTOPn5539JPeVWGG9OoJyUXWaVrMlyrYnpUtMTDFrnm9MrBfrfHztkFUx5rpaUl
 hIOZb9iDtaYCnvfWJaqouyfG5o9yYTQzZ8EMKCfQiih7hkN1869wCtky/rn7a8HSEWuQpXTRHtW
 40lOWVHCrCJyHFtPzweLLJlZeqgHwiubY59h7UXNlgJZX5s6RUpxw8dhMU5EOQY/37AL2vSgdty
 tnTBuTYwvVozyPknK/snmdXxnQC08bgyjH1RTClMdJRBpoDl1CpSahYiuVA03SbM6NVZGU1vPEq
 zvWllsL4Y9wlKvQ==
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

It's not possible to send DSI panel commands in the .unprepare. Move it
to .disable and do similar for prepare, where we move the display on to
the .enable.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index 3097040e6bfa0..a3651f0060bde 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -68,6 +68,14 @@ static int sofef00_panel_on(struct sofef00_panel *ctx)
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
 
+	return dsi_ctx.accum_err;
+}
+
+static int sofef00_enable(struct drm_panel *panel)
+{
+	struct sofef00_panel *ctx = to_sofef00_panel(panel);
+	struct mipi_dsi_multi_context dsi_ctx = { .dsi = ctx->dsi };
+
 	mipi_dsi_dcs_set_display_on_multi(&dsi_ctx);
 
 	return dsi_ctx.accum_err;
@@ -110,11 +118,19 @@ static int sofef00_panel_prepare(struct drm_panel *panel)
 	return 0;
 }
 
-static int sofef00_panel_unprepare(struct drm_panel *panel)
+static int sofef00_disable(struct drm_panel *panel)
 {
 	struct sofef00_panel *ctx = to_sofef00_panel(panel);
 
 	sofef00_panel_off(ctx);
+
+	return 0;
+}
+
+static int sofef00_panel_unprepare(struct drm_panel *panel)
+{
+	struct sofef00_panel *ctx = to_sofef00_panel(panel);
+
 	regulator_bulk_disable(ARRAY_SIZE(sofef00_supplies), ctx->supplies);
 
 	return 0;
@@ -154,6 +170,8 @@ static int sofef00_panel_get_modes(struct drm_panel *panel, struct drm_connector
 
 static const struct drm_panel_funcs sofef00_panel_panel_funcs = {
 	.prepare = sofef00_panel_prepare,
+	.enable = sofef00_enable,
+	.disable = sofef00_disable,
 	.unprepare = sofef00_panel_unprepare,
 	.get_modes = sofef00_panel_get_modes,
 };

-- 
2.51.0


