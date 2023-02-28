Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7286A56BB
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 11:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 768E110E67E;
	Tue, 28 Feb 2023 10:27:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FAE10E67A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 10:27:20 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 1ED596602FDD;
 Tue, 28 Feb 2023 10:27:18 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677580038;
 bh=d98v4XkYuSdlaBMRVhy8ckf3WPpqfT9gFqNu9PlgtLo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Qpy69orntrXDViupi8/DK29prpf9GYT8qb8Ln6gnx4JzEs/k1BRLwAvGJ6LXpp+2g
 /NvsuUea1bUD0csMXDqBkmm33isexWvMquveQqUidIrHovwyW18uj6dzVf1GkvBOcz
 RQ503puGDYPDuszsHcytrysZoNnwm44fPgNzuY61k/x3xuziscvAB3Te/dOfD1YyW+
 YeQWOvIy8w+3CxbtJXSez8BWjG/O8zalaFEEaQqcXJENRlolxLx6ptROUAtT2f6DGO
 dtGdu3POoMF52pYdQYCwqUtINTTj5etgVLE9b0GEJnCdyG2T0rawleI1FAv89ZxlmA
 /5ohiGzZ0Oejg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH v4 11/12] drm/panfrost: Add new compatible for Mali on the
 MT8183 SoC
Date: Tue, 28 Feb 2023 11:27:03 +0100
Message-Id: <20230228102704.708150-11-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
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

The "mediatek,mt8183-mali" compatible uses platform data that calls for
getting (and managing) two regulators ("mali" and "sram") but devfreq
does not support this usecase, resulting in DVFS not working.

Since a lot of MediaTek SoCs need to set the voltages for the GPU SRAM
regulator in a specific relation to the GPU VCORE regulator, a MediaTek
SoC specific driver was introduced to automatically satisfy, through
coupling, these constraints: this means that there is at all no need to
manage both regulators in panfrost but to otherwise just manage the main
"mali" (-> gpu vcore) regulator instead.

Keeping in mind that we cannot break the ABI, the most sensible route
(avoiding hacks and uselessly overcomplicated code) to get a MT8183
node with one power supply was to add a new "mediatek,mt8183b-mali"
compatible, which effectively deprecates the former.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 5d25e77e1037..14cdeaeeb5c4 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -654,6 +654,14 @@ static const struct panfrost_compatible amlogic_data = {
 	.vendor_quirk = panfrost_gpu_amlogic_quirk,
 };
 
+/*
+ * The old data with two power supplies for MT8183 is here only to
+ * keep retro-compatibility with older devicetrees, as DVFS will
+ * not work with this one.
+ *
+ * On new devicetrees please use the _b variant with a single and
+ * coupled regulators instead.
+ */
 static const char * const mediatek_mt8183_supplies[] = { "mali", "sram", NULL };
 static const char * const mediatek_mt8183_pm_domains[] = { "core0", "core1", "core2" };
 static const struct panfrost_compatible mediatek_mt8183_data = {
@@ -663,6 +671,14 @@ static const struct panfrost_compatible mediatek_mt8183_data = {
 	.pm_domain_names = mediatek_mt8183_pm_domains,
 };
 
+static const char * const mediatek_mt8183_b_supplies[] = { "mali", NULL };
+static const struct panfrost_compatible mediatek_mt8183_b_data = {
+	.num_supplies = ARRAY_SIZE(mediatek_mt8183_b_supplies) - 1,
+	.supply_names = mediatek_mt8183_b_supplies,
+	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
+	.pm_domain_names = mediatek_mt8183_pm_domains,
+};
+
 static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
 static const char * const mediatek_mt8192_pm_domains[] = { "core0", "core1", "core2",
 							   "core3", "core4" };
@@ -691,6 +707,7 @@ static const struct of_device_id dt_match[] = {
 	{ .compatible = "arm,mali-bifrost", .data = &default_data, },
 	{ .compatible = "arm,mali-valhall-jm", .data = &default_data, },
 	{ .compatible = "mediatek,mt8183-mali", .data = &mediatek_mt8183_data },
+	{ .compatible = "mediatek,mt8183b-mali", .data = &mediatek_mt8183_b_data },
 	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
 	{}
 };
-- 
2.39.2

