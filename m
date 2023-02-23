Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CECF6A0AB2
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 14:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58CFC10E4BF;
	Thu, 23 Feb 2023 13:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E1410E4E7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Feb 2023 13:35:02 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id C04366602207;
 Thu, 23 Feb 2023 13:35:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677159301;
 bh=XOBRNDDFJGfYsIgxMZ/xxG6T/bqER3TGwYBPNyV4tY8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K2hEs3qWTn6Jo3MfIL2vRN2fscHXem6euUhAtaPSESk/8f+QmDgSKg4RNQkN7ADfG
 yNLagQDw1+8fH4IyI5bf9aUaxNRXWGD3K1LHA/QpY0nPMqJLmwsv+Hz1XHoaCiBdEK
 3lWrNGkg5nsymLLa3V4R64G9yrDPZxlAgLgsomQyGPj1WpI8YXQ1E29Kc9CTlDpV6G
 BbiUu1CpwYfCkqsgdqJP4x255zFuZfC8gQdVd+uN70vEz6Wykcqj3dlu7DHrmQata3
 hSjaG5/xFnUII6Gd3ZUu/r7S9OKfK9KE95yWYbGhkyQ3IgObvy9x7HYXI7mxj6Lf1/
 jJnNG8vAes+wA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH v3 09/11] drm/panfrost: Add mediatek,mt8192-mali compatible
Date: Thu, 23 Feb 2023 14:34:38 +0100
Message-Id: <20230223133440.80941-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
References: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
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

