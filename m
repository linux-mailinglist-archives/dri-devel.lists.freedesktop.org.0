Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D355AC6F3AC
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 15:21:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 117EB10E640;
	Wed, 19 Nov 2025 14:21:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Rk8r7nfn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3E9110E636
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 14:21:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CA531445B0;
 Wed, 19 Nov 2025 14:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A3F3C4AF12;
 Wed, 19 Nov 2025 14:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763562102;
 bh=h8mvhLF2NQpOEhwrwGAXO5y7raG5Pj5KKGwO1xu0Ls4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=Rk8r7nfnExBOLXlHcSwwW1GzD01CFs01Izo9ju/Fs4ZNjpFX0IR60CJVQloLHPSKc
 q5B5cwoeZwVloaZbQfM0p5bPXjJJ0dDtlN/WEDWQQCd8EbckzPmfVj49LCULpcm6GQ
 ZKgfLfmXS/nCYYStW6pm/1ExBe7f1ba2RyS3I07hFkkz8Hq5dg+U858UPe6GL+rtaY
 sU+lS+S5WX9W0mgyF/G7GTI8rG/f3k0xCvG4gGyJg2gUDCTvRPvUfdBI3zkLj4TovE
 H5F0zAOa3ydUTKKrCIG8/oKMSGM+SgthmePgvHlj5b88o2xaAxBJAirSXTjdcSCdHG
 ihu+D+Onj1Jvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id B15A7CF34B7;
 Wed, 19 Nov 2025 14:21:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 19 Nov 2025 15:21:30 +0100
Subject: [PATCH v3 05/12] drm/panel: sofef00: Split sending commands to the
 enable/disable functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-sofef00-rebuild-v3-5-6cd55471e84e@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2045; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=xfG4W9ai59WdRLt2V9HKjqKsc6sEspLbINOP0a9yxjE=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHdJySBNowOWWHwzh/85WA2arsosXKiFd8KulS
 VtAKVAfMgCJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaR3ScgAKCRBgAj/E00kg
 cqp7D/9Rk0id/wx8xVwQZpjz1cpc0Esto+GMDs9DNsKLPzrV9jrQ9EygsxglDlkICE9PcVtwxin
 4DveLXfymwQPd9sQ7kykNkZEfly2vPUy5/WprZ8YWbFsIEKdmXIkCOZTDV0R2qTNFk2KUMJ2h14
 fbZkgpr3LNdHZkviqf4UC22D+Sgbqurbv0ogY9nwnxrMVW30LFpYF3XKA7GpMZr/pIQpNrnAa3H
 I9OP6mkzevkxvMT1cIMtMObrUxl+SwGp2lo7nQPIyl2mPVNrFTpb35uiKC8y5X3QtZ2VRjxMGDe
 xCgHIlY9cLTloOIbdVoV7jogP11hk49FM93c51O9i9HGCzOPBtK7Gd9vL5gEgxeN9DZgPyGVoLH
 MCABSvftIMB/6bhkbNOp1EGmx76f5k1HH6qMebfEASEZKua5+ke2Lac/ysGTe+eNFunn9Oh7hSK
 cgWs/hHeDbw82akmcM/5c1yzzfoH+Qy6lulkXCR9R87Gh2P+9Uy+ep+ASwzj3ftH5XFG1JMgePu
 /t1tJ9gFrVE0hcA3O3ukwL6WkAgoGceo+8tMyegAmra+xsGdczs6GEpKWH79Uu2oLzW/pesWy43
 sfS+wCR5wocOjMXOicX4IhLflaVLvisE+EX1s+IS+QMWGGvFCozyV24NAxwL+hLZnEU9yuHotRF
 tVa16LfkZLb4Z3A==
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


