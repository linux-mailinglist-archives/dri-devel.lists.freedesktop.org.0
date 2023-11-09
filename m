Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C60C27E67EB
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 11:26:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DFFA610E89D;
	Thu,  9 Nov 2023 10:26:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ADBC10E8A3
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Nov 2023 10:26:21 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 8EB7C66074E4;
 Thu,  9 Nov 2023 10:25:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1699525555;
 bh=d3zTQouwLyyEFIHsf9/xe8EYttNAC0DeHeu3XBTyvRc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aUivKZHLULvsoef0DZLygMttrY4nsxgo8J7XjuMylkjtqxw5YnXSUE8Xng6rKVIUb
 cxRZIQLXgK67Q/k3POFNVzA76JKqpGRHW7AOFY260xkWlD545MtobUcYlVv5It6hQf
 n0Rs0Pyf7QoBuN0V5REeHNcornoT4Cu9Om3lKS83PnMDfDqWUPH+iLwh1d6fIZnK+9
 W44vmN3jKNUjm5tW2ZNgi59J8bAhG8OCLEG8zX0KqCnlJk+qBawVYuGZnsB8pp8HuV
 nDLOFSni7YSGhM/hGBNSvl4IJ7JklNSfKCG45npSRZLI5wB6nQ5NDpsC7eYJkUoWa6
 qCkq3nHqvrAwA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Subject: [PATCH v3 6/6] drm/panfrost: Set regulators on/off during system
 sleep on MediaTek SoCs
Date: Thu,  9 Nov 2023 11:25:43 +0100
Message-ID: <20231109102543.42971-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231109102543.42971-1-angelogioacchino.delregno@collabora.com>
References: <20231109102543.42971-1-angelogioacchino.delregno@collabora.com>
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
MediaTek SoCs (MT8183/86/92/95).

As an example, for MT8195 - a "before" with only runtime PM operations
(so, without turning on/off regulators), and an "after" executing both
the system sleep .resume() handler and .runtime_resume() (so the time
refers to T_Resume + T_Runtime_Resume):

Average Panfrost-only system sleep resume time, before: ~33500ns
Average Panfrost-only system sleep resume time, after:  ~336200ns

Keep in mind that this additional ~308200 nanoseconds delay happens only
in resume from a full system suspend, and not in runtime PM operations,
hence it is acceptable.

Measurements were also taken on MT8186, showing a delay of ~312000 ns.

Testing of this happened on all of the aforementioned MediaTek SoCs, but:
MT8183 got tested only by KernelCI with <=10 suspend/resume cycles
MT8186, MT8192, MT8195 were tested manually with over 100 suspend/resume
cycles with GNOME DE (Mutter + Wayland).

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

