Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B35E868ED21
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 11:37:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F00C10E746;
	Wed,  8 Feb 2023 10:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0D510E73A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Feb 2023 10:37:34 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9F71A660209D;
 Wed,  8 Feb 2023 10:37:32 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1675852653;
 bh=q67l6huNz6BOkkKA1cnX0CAnLFXPlSrwL9Q000QH1Ig=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=m0kZfEfI5WeuqtCvZPkgFg1ubv2kuTxppzd0P2D36SxeI3CRiPZSowKiJbtTwkzhs
 OaRLAHrFj7CHofTz6oWdZGwduxkSxC/c9Z6Kk0H2HwptSmHAlhQ6qYymiYHWt+YUO4
 oWteS3if3HIc3/sa4SJkvHRakxqd01DCTkigL7ld9ft5rQ7gSNvQLHnHFOQRZRLwfr
 1CTJgMT+7AzMPhOzzMZsQhDTbIHSxzjSWmtWraG2GYD6Nn8uBNrVui6TLns51QchEm
 xBgdPs0cMEQno20sygWAfXFn8lmtt4iL6Y7TzkStQ3HOICS6u7UNDhsC0JKvdQs9dy
 qovg2VcCIIm5A==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH 9/9] drm/panfrost: Add new compatible for Mali on the MT8183
 SoC
Date: Wed,  8 Feb 2023 11:37:09 +0100
Message-Id: <20230208103709.116896-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
References: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
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
Cc: tomeu.vizoso@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 steven.price@arm.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org,
 alyssa.rosenzweig@collabora.com, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
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
2.39.1

