Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD3CC6F3A9
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 15:21:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1BA110E63D;
	Wed, 19 Nov 2025 14:21:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UqvW3Nsw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5005810E606
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 14:21:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 19DEC444C2;
 Wed, 19 Nov 2025 14:21:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79824C2BCB7;
 Wed, 19 Nov 2025 14:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763562101;
 bh=38ck5RCR0LO2rWCNSIq2uzpHXbhEGR1CpmwmHrfKicM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=UqvW3NswLhglaOKqLDCEsvEBHRPzWQAkAE7ZykQXdxFAXMztzgHyJvOjkpuCFt7B/
 FkXR5CdJ8cmtFJsjAY10MDktLGUlDYBTBiqUfb696Tyyvtx327m/wGLH5qFUAvI9mG
 Bbdvy1UqkxX+BCQJBhDQjgxlWzjt0QH1Sf3dmG1578u4wzC/Zrv68tWNxPBkJPCxlC
 ufwvhpYhjKgBdHM05OsCvEyYtLkJZlM3iOS9Wrc6MDBXlr9lwzx3klcCen9iEeYgiK
 hR1IT7sduz3+VaNs/4eCFWXOhf6vLAYx4gkYg0BIHiD8M+TI7h5lV9MQIhMBST7MoZ
 Ag7K+omHPpaRQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id BF900CF34BD;
 Wed, 19 Nov 2025 14:21:40 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Wed, 19 Nov 2025 15:21:31 +0100
Subject: [PATCH v3 06/12] drm/panel: sofef00: Introduce page macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-sofef00-rebuild-v3-6-6cd55471e84e@ixit.cz>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2024; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=KFWwy/+TPv3o+Pr2om1zoaTzQ1nmZjY1fcOyZY+O5S8=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHdJyK/hdCZdPZFToA5nTpcR1hiHEfTPn0MaQ3
 ciLexMismGJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaR3ScgAKCRBgAj/E00kg
 ciRdEACTym6WmNnWVr4BPWPPzLj/0/6noYmFZiRlw2pz0OY3RH5blui4w/LPmwPEXLv3L9U1Qhc
 QNnQiycijTlbfMrcdivJxjd5U6Jgfa3LidhpmTa1mUUrAmfiPTNFYN7VBQjRFXYg6cHE5Yjn7ph
 mFWj7p8E0ox2ihq+umAvgO3tDg+Dyj89+IspXinSEoT04F/SjJ8YWZ9Y9WfjrQ064tlJcgGqIbS
 VF6lh1Ogb63u2RGuuhQCmErrq6OTmZBXEqRnsIqVtTkKOx8rLxTgbzRi2QVksusHcsfT3p1by4S
 M6VuLoljtb807fKrb3fHDwuj3KD4mdbnsz3/MV2RP6ScehScNIx0wpsfrfF7DsGa6gO6fJRIv+N
 stCxpl5+LtgwaBI+lajA+lsXRC4NWzhZEZJRlVvBXK854Bx3wLGMaFW6ZorljHyDim2hmj1RsyI
 cJzqcgs5mtFeck3IIAqQycCE86ZlvX7BCukhumZsavsAoAJhgm7i4GHHwQ6e3SJpLsvw/GwZ3V8
 4CkLA+8tN2cFqejajnRPxefq9uo/qFMUCMW5FSZYWfHsWoXMCrwR8PO9leUl/hcRWktiMJ8JDWe
 Z25zr8J1xo/Zdm2B9cIPHculPSDJE/FU+cjoCFHL9gTsmDUCZwgL+byi1i7T6qOxN0YQ1ZNY4Cc
 pMIhJBgrMKV215Q==
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

Introducing the macro make the code a bit clearer.

Looking at other Samsung drivers, I assume it's lvl2, thou due to not
available documentation it's only educated guess.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 drivers/gpu/drm/panel/panel-samsung-sofef00.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-sofef00.c b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
index a3651f0060bde..97122ec8872a1 100644
--- a/drivers/gpu/drm/panel/panel-samsung-sofef00.c
+++ b/drivers/gpu/drm/panel/panel-samsung-sofef00.c
@@ -36,6 +36,11 @@ struct sofef00_panel *to_sofef00_panel(struct drm_panel *panel)
 	return container_of(panel, struct sofef00_panel, panel);
 }
 
+#define sofef00_test_key_on_lvl2(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0x5a, 0x5a)
+#define sofef00_test_key_off_lvl2(ctx) \
+	mipi_dsi_dcs_write_seq_multi(ctx, 0xf0, 0xa5, 0xa5)
+
 static void sofef00_panel_reset(struct sofef00_panel *ctx)
 {
 	gpiod_set_value_cansleep(ctx->reset_gpio, 0);
@@ -56,15 +61,15 @@ static int sofef00_panel_on(struct sofef00_panel *ctx)
 	mipi_dsi_dcs_exit_sleep_mode_multi(&dsi_ctx);
 	mipi_dsi_usleep_range(&dsi_ctx, 10000, 11000);
 
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
-
+	sofef00_test_key_on_lvl2(&dsi_ctx);
 	mipi_dsi_dcs_set_tear_on_multi(&dsi_ctx, MIPI_DSI_DCS_TEAR_MODE_VBLANK);
+	sofef00_test_key_off_lvl2(&dsi_ctx);
 
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0x5a, 0x5a);
+	sofef00_test_key_on_lvl2(&dsi_ctx);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb0, 0x07);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xb6, 0x12);
-	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, 0xf0, 0xa5, 0xa5);
+	sofef00_test_key_off_lvl2(&dsi_ctx);
+
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_CONTROL_DISPLAY, 0x20);
 	mipi_dsi_dcs_write_seq_multi(&dsi_ctx, MIPI_DCS_WRITE_POWER_SAVE, 0x00);
 

-- 
2.51.0


