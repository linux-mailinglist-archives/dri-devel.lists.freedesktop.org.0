Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EBD356C167
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 22:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA0710EAB9;
	Fri,  8 Jul 2022 20:54:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5331810EAB9
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Jul 2022 20:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1657313664; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZsmOgxVVFKAi6We+Fa/t9BWj1gjKa2nAi7YQfMy/OG4=;
 b=DgsHAiF2KQTgAd3uK9vqRF2PFq3Meig+1VcimiGTQtsuJ169HT/acSLFmTg+S+W5V6L+3Q
 AFkpFRd9W4gIjkt8BnfSIzJEmp4PfDpLxwpWRsy2/eCGYAUvM2amSTbA0mjKhXveAqZmdm
 LaP7B/KWdfVHHWAf/PspQI04Xzsm/4o=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/6] drm/ingenic: Add support for the JZ4760(B)
Date: Fri,  8 Jul 2022 21:54:03 +0100
Message-Id: <20220708205406.96473-4-paul@crapouillou.net>
In-Reply-To: <20220708205406.96473-1-paul@crapouillou.net>
References: <20220708205406.96473-1-paul@crapouillou.net>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org,
 Paul Cercueil <paul@crapouillou.net>, list@opendingux.net,
 Christophe Branchereau <cbranchereau@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for the JZ4760 and JZ4760B SoCs to the ingenic-drm display
driver.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 28 +++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index e435c19d54d5..78d0b035e2d7 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -1541,6 +1541,32 @@ static const struct jz_soc_info jz4725b_soc_info = {
 	.num_formats_f0 = ARRAY_SIZE(jz4725b_formats_f0),
 };
 
+static const struct jz_soc_info jz4760_soc_info = {
+	.needs_dev_clk = false,
+	.has_osd = true,
+	.map_noncoherent = false,
+	.max_width = 1280,
+	.max_height = 720,
+	.max_burst = JZ_LCD_CTRL_BURST_32,
+	.formats_f1 = jz4770_formats_f1,
+	.num_formats_f1 = ARRAY_SIZE(jz4770_formats_f1),
+	.formats_f0 = jz4770_formats_f0,
+	.num_formats_f0 = ARRAY_SIZE(jz4770_formats_f0),
+};
+
+static const struct jz_soc_info jz4760b_soc_info = {
+	.needs_dev_clk = false,
+	.has_osd = true,
+	.map_noncoherent = false,
+	.max_width = 1280,
+	.max_height = 720,
+	.max_burst = JZ_LCD_CTRL_BURST_64,
+	.formats_f1 = jz4770_formats_f1,
+	.num_formats_f1 = ARRAY_SIZE(jz4770_formats_f1),
+	.formats_f0 = jz4770_formats_f0,
+	.num_formats_f0 = ARRAY_SIZE(jz4770_formats_f0),
+};
+
 static const struct jz_soc_info jz4770_soc_info = {
 	.needs_dev_clk = false,
 	.has_osd = true,
@@ -1572,6 +1598,8 @@ static const struct jz_soc_info jz4780_soc_info = {
 static const struct of_device_id ingenic_drm_of_match[] = {
 	{ .compatible = "ingenic,jz4740-lcd", .data = &jz4740_soc_info },
 	{ .compatible = "ingenic,jz4725b-lcd", .data = &jz4725b_soc_info },
+	{ .compatible = "ingenic,jz4760-lcd", .data = &jz4760_soc_info },
+	{ .compatible = "ingenic,jz4760b-lcd", .data = &jz4760b_soc_info },
 	{ .compatible = "ingenic,jz4770-lcd", .data = &jz4770_soc_info },
 	{ .compatible = "ingenic,jz4780-lcd", .data = &jz4780_soc_info },
 	{ /* sentinel */ },
-- 
2.35.1

