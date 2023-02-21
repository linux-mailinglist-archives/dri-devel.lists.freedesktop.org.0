Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC65969E3AA
	for <lists+dri-devel@lfdr.de>; Tue, 21 Feb 2023 16:38:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA2210E853;
	Tue, 21 Feb 2023 15:38:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D73DA10E848
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Feb 2023 15:37:53 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 104D666021CD;
 Tue, 21 Feb 2023 15:37:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1676993872;
 bh=XOBRNDDFJGfYsIgxMZ/xxG6T/bqER3TGwYBPNyV4tY8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TrsF2ZypFqBW/bFW+D9vITUwBlUQmc7X2dV7H+9+GCQRSLcrcgaqvgJKiXy6AY22m
 sLpSh/oNr3lXRepkMyKbiIhoWxkQvRPTYxrONI7RCCeEDo3XmMNflF3uAyrJHBJnc0
 EJSCfPgDiThzY9s6UyUE2bI7E3nY433Mza3tMzLh66+eUeWJeK4jYG5pSKttwil/yI
 4AtFcfZ3CuyH3O8cuC4Sb5kKJPZXwM7F72wZAQA6SMXxMvBLaDUSkskyajmC07z2b0
 Rl39zya/RTIQUWR9z8qN/a0gihB4NnU1YSn7MiJ6yogg5GevScbfKrG+DLqx8W6SDC
 FSoHCoGOhTqXQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH v2 09/10] drm/panfrost: Add mediatek,mt8192-mali compatible
Date: Tue, 21 Feb 2023 16:37:39 +0100
Message-Id: <20230221153740.1620529-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
References: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, wenst@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>

Required for Mali-G57 on the Mediatek MT8192 and MT8195, which
uses even more power domains than the MT8183 before it.

Signed-off-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
[Angelo: Removed unneeded "sram" supply, added mt8195 to commit description]
Co-developed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index abb0dadd8f63..5d25e77e1037 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -663,6 +663,16 @@ static const struct panfrost_compatible mediatek_mt8183_data = {
 	.pm_domain_names = mediatek_mt8183_pm_domains,
 };
 
+static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
+static const char * const mediatek_mt8192_pm_domains[] = { "core0", "core1", "core2",
+							   "core3", "core4" };
+static const struct panfrost_compatible mediatek_mt8192_data = {
+	.num_supplies = ARRAY_SIZE(mediatek_mt8192_supplies) - 1,
+	.supply_names = mediatek_mt8192_supplies,
+	.num_pm_domains = ARRAY_SIZE(mediatek_mt8192_pm_domains),
+	.pm_domain_names = mediatek_mt8192_pm_domains,
+};
+
 static const struct of_device_id dt_match[] = {
 	/* Set first to probe before the generic compatibles */
 	{ .compatible = "amlogic,meson-gxm-mali",
@@ -681,6 +691,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-bifrost", .data = &default_data, },
 	{ .compatible = "arm,mali-valhall-jm", .data = &default_data, },
 	{ .compatible = "mediatek,mt8183-mali", .data = &mediatek_mt8183_data },
+	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
-- 
2.39.2

