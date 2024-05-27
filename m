Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 176648CFCC9
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 11:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 495FA10EB3D;
	Mon, 27 May 2024 09:25:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="GRHZOFIy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com
 [46.235.227.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5376610EB3D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 09:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1716801919;
 bh=8GuiXIytBzEOOq1loh/sdanwydxd8B84OUGGGBmQrxs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GRHZOFIy40cxzRCBKR+sKYr7lZcoxq9hRzQ2jzpd8M6DvzTEaVIX6Vk1n7lI7Fmoo
 /X//2fYrJWzFYjgzijs9LgplhhSayI/QI3ZGX6zgqv+kDMADoxaQ4IcJ8o8CyXQQg3
 OUdqIGwhHgFE5VBgqip57mhY7reXuhzqc85uWcMtTneQiA7lfyjbnOQPx4S6+M2vtZ
 sqkxPWIo90IaEUn6gKN70T0Tia8+bjrmtM08QGqOHLAPprDDSitINYaFG96sanzRb8
 3/u04bga92Pbq6Uv39DFL+kPW1BTqmUWwxxZIgh2+GOhI7ZBzhDnaWp5CFtmnDrDFC
 XvUpWaLKBS+Cg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id 631A1378212E;
 Mon, 27 May 2024 09:25:18 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, steven.price@arm.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH 2/2] drm/panfrost: Add support for Mali on the MT8188 SoC
Date: Mon, 27 May 2024 11:25:13 +0200
Message-ID: <20240527092513.91385-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527092513.91385-1-angelogioacchino.delregno@collabora.com>
References: <20240527092513.91385-1-angelogioacchino.delregno@collabora.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MediaTek MT8188 has a Mali-G57 MC3 (Valhall-JM): add a new
compatible and platform data using the same supplies and the
same power domain lists as MT8183 (one regulator, three power
domains).

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index ef9f6c0716d5..4e2d9f671a0d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -777,6 +777,14 @@ static const struct panfrost_compatible mediatek_mt8186_data = {
 	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
 };
 
+static const struct panfrost_compatible mediatek_mt8188_data = {
+	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
+	.supply_names = mediatek_mt8183_b_supplies,
+	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
+	.pm_domain_names = mediatek_mt8183_pm_domains,
+	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
+};
+
 static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
 static const char * const mediatek_mt8192_pm_domains[] = { "core0", "core1", "core2",
 							   "core3", "core4" };
@@ -808,6 +816,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "mediatek,mt8183-mali", .data = &mediatek_mt8183_data },
 	{ .compatible = "mediatek,mt8183b-mali", .data = &mediatek_mt8183_b_data },
 	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
+	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
 	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
 	{}
 };
-- 
2.45.1

