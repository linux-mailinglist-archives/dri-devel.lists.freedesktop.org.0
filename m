Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8228CAB102B
	for <lists+dri-devel@lfdr.de>; Fri,  9 May 2025 12:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D858610EA00;
	Fri,  9 May 2025 10:14:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="OZXOW0SC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4003F10E9FA
 for <dri-devel@lists.freedesktop.org>; Fri,  9 May 2025 10:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1746785674;
 bh=HGN+lSC329vd4LrTVucVEkhNoI9JDXkgOdKiKkeryhg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=OZXOW0SCCwPq+eNTxGYTg7T1fiR4e+jEpuOmP87zBA2ZjRQR5RvUyrqACOPFasr15
 hVKMd6zRwfwOCYqqft+c7JYInrb3z2fW12cYJGkg+o/vQCXYqGyvwDNRXK0j3mgEaf
 mdhiW/ad54819cu1borBja8JRaJgNluS0gXYA9008sJFjox0PJZ6O4HAkQSnfmajIi
 GCzZ5gp9UaLnF0n1uKz698dLBSi1QWtyn+ilmedfEvQVRmScw5AzZ22vv4wOAEg+LK
 rmsNz1DWB5frP7rEV/BpCgK4QD/81mzU5PJ9anJg5FXDhVezd3v0nBooDngzJiHcax
 tO4KDrOs9J/bA==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr
 [83.113.51.247])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: laeyraud)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id C049317E0202;
 Fri,  9 May 2025 12:14:32 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 09 May 2025 12:12:50 +0200
Subject: [PATCH v6 4/5] drm/panfrost: Add support for Mali on the MT8370
 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-mt8370-enable-gpu-v6-4-2833888cb1d3@collabora.com>
References: <20250509-mt8370-enable-gpu-v6-0-2833888cb1d3@collabora.com>
In-Reply-To: <20250509-mt8370-enable-gpu-v6-0-2833888cb1d3@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Steven Price <steven.price@arm.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746785666; l=2568;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=HGN+lSC329vd4LrTVucVEkhNoI9JDXkgOdKiKkeryhg=;
 b=LpMLtSXuVD5FDdUslB7iS5yt9l3TGnYZSbqRdL706Aoq8i5sjoLP9giqbFM5Q9FOJyhlNbYoK
 9sR7PaooMy9C2RwtjPBqdbwi19X9e60L9wfTIZBC0DwzGRzGCfdppmG
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
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

Add a compatible for the MediaTek MT8370 SoC, with an integrated ARM
Mali G57 MC2 GPU (Valhall-JM, dual core), with new platform data for
its support in the panfrost driver.
It uses the same data as MT8186 for the power management features to
describe power supplies, pm_domains and enablement (one regulator, two
power domains) but also sets the FORCE_AARCH64_PGTABLE flag in the GPU
configuration quirks bitfield to enable AARCH64 4K page table format
mode.
As MT8186 and MT8370 SoC have different GPU architecture (Mali G52 2EE
MC2 for MT8186), making them not compatible, and this mode is only
enabled for Mediatek SoC that are Mali G57 based (compatible with
mediatek,mali-mt8188 or mediatek,mali-8192), having specific platform
data allows to set this flag for MT8370 without modifying MT8186
configuration and behaviour.

Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 21b28bef84015793d9dba6b1e585891dc0dfcb6d..07cd67baa81bfccabf3b1a29f7d78702038bb2cd 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -841,6 +841,15 @@ static const struct panfrost_compatible mediatek_mt8192_data = {
 	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
 };
 
+static const struct panfrost_compatible mediatek_mt8370_data = {
+	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
+	.supply_names = default_supplies,
+	.num_pm_domains = 2,
+	.pm_domain_names = mediatek_pm_domains,
+	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
+	.gpu_quirks = BIT(GPU_QUIRK_FORCE_AARCH64_PGTABLE),
+};
+
 static const struct of_device_id dt_match[] = {
 	/* Set first to probe before the generic compatibles */
 	{ .compatible = "amlogic,meson-gxm-mali",
@@ -863,6 +872,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
 	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
 	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
+	{ .compatible = "mediatek,mt8370-mali", .data = &mediatek_mt8370_data },
 	{ .compatible = "allwinner,sun50i-h616-mali", .data = &allwinner_h616_data },
 	{}
 };

-- 
2.49.0

