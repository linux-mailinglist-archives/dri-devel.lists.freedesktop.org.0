Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFC17DBA99
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 14:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7775010E2BA;
	Mon, 30 Oct 2023 13:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8894610E2B7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 13:23:09 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id A6ED16607389;
 Mon, 30 Oct 2023 13:23:07 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698672188;
 bh=Rs2Tz2duxz0x7ijP2hn/7R66LzyseqbsHizTc5CA0MU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dANsBif0cystNlFAFmjXOVWt1FQRW4An0MoKDZ1S/uaiNZ4O5spk4rfppG/x8r8ZC
 w4tfGGx2x5WQi4a+9dOnwBqJ1b2Vz3nC6QLcAytkxYiFN6nxgxMZlqByhd1TAeHVs0
 TrXbu20VSWk/KaHTMNAYBuysmkNRFUpkPj6a2IswsVzE9sWSgYsF/CIwMPaFHT7XiO
 PHYI50bSQtQEaOdnDSjjMsZiLxMYF2sbwCtOuax1v1kTNMZiaPjuomZuID/Sj9NCbH
 SOoEfMCgmQpGtcAoSHiU8NBzpozL3UJfLmsjFNM5o3m39LeCnYmWJ15/Hh21ERC1BX
 7iKtkLTr0vk+g==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Subject: [PATCH 4/4] drm/panfrost: Set regulators on/off during system sleep
 on MediaTek SoCs
Date: Mon, 30 Oct 2023 14:22:57 +0100
Message-ID: <20231030132257.85379-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231030132257.85379-1-angelogioacchino.delregno@collabora.com>
References: <20231030132257.85379-1-angelogioacchino.delregno@collabora.com>
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
Cc: linux-kernel@vger.kernel.org, mripard@kernel.org, steven.price@arm.com,
 dri-devel@lists.freedesktop.org, tzimmermann@suse.de, wenst@chromium.org,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

All of the MediaTek SoCs supported by Panfrost can completely cut power
to the GPU during full system sleep without any user-noticeable delay
in the resume operation, as shown by measurements taken on multiple
MediaTek SoCs.

As an example, for MT8195 - a "before" with only runtime PM operations
(so, without turning on/off regulators), and an "after" executing full
system sleep .resume() handler (.resume() -> .runtime_resume() -> done):

Average Panfrost-only system sleep resume time, before: 114186ns
Average Panfrost-only system sleep resume time, after:  189684ns

Keep in mind that this additional ~0,075ms delay happens only in resume
from a full system suspend, and not in runtime PM operations, hence it
is acceptable.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 82f3c5fe9c58..f63382d9ab04 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -734,7 +734,7 @@ static const struct panfrost_compatible mediatek_mt8183_b_data = {
 	.supply_names = mediatek_mt8183_b_supplies,
 	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
 	.pm_domain_names = mediatek_mt8183_pm_domains,
-	.pm_features = BIT(GPU_PM_CLK_DIS),
+	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
 };
 
 static const char * const mediatek_mt8186_pm_domains[] = { "core0", "core1" };
@@ -743,7 +743,7 @@ static const struct panfrost_compatible mediatek_mt8186_data = {
 	.supply_names = mediatek_mt8183_b_supplies,
 	.num_pm_domains = ARRAY_SIZE(mediatek_mt8186_pm_domains),
 	.pm_domain_names = mediatek_mt8186_pm_domains,
-	.pm_features = BIT(GPU_PM_CLK_DIS),
+	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
 };
 
 static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
@@ -754,7 +754,7 @@ static const struct panfrost_compatible mediatek_mt8192_data = {
 	.supply_names = mediatek_mt8192_supplies,
 	.num_pm_domains = ARRAY_SIZE(mediatek_mt8192_pm_domains),
 	.pm_domain_names = mediatek_mt8192_pm_domains,
-	.pm_features = BIT(GPU_PM_CLK_DIS),
+	.pm_features = BIT(GPU_PM_CLK_DIS) | BIT(GPU_PM_VREG_OFF),
 };
 
 static const struct of_device_id dt_match[] = {
-- 
2.42.0

