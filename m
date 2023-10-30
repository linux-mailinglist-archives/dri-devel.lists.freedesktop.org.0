Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 881B77DBA97
	for <lists+dri-devel@lfdr.de>; Mon, 30 Oct 2023 14:23:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FF9210E2B8;
	Mon, 30 Oct 2023 13:23:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D84CE10E0D7
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Oct 2023 13:23:07 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 015CB6607385;
 Mon, 30 Oct 2023 13:23:05 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698672186;
 bh=yXt8niUpqio+gdmTqqnUMTPMyUgKwAIOi8EGaWco710=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IVDlq/FH4jjavt2ZWDKJiwXMVrsY7GhFgmBhj8euDGbAEmhbJ4VOMYgv+1wgCuvY8
 cyfrR/+fLcJF2I093OA/i31G2bzz1MZmUJ8FuVU1jjPXiN0/wMQIY4mWc5E0w1BVIT
 wOTNjiKI3GZSP7YXpyo6x0g24p+vVLRFjaXh4P7lQR6KgqhyyfRyFfTjRfPndcDCpb
 qXMJCE0mg/sWIF38T8uO8hQH7mJEZKFF0YEZSI/40KFCuaoZc+yQ43U1zc573Mkai0
 m7tg0HW/F6daZi2V83r096hgAGFr4o7P5FxZdHxJs9ELtvOb3nicEeG7aaEMj03Sis
 RVdzs/h8cumbQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Subject: [PATCH 2/4] drm/panfrost: Set clocks on/off during system sleep on
 MediaTek SoCs
Date: Mon, 30 Oct 2023 14:22:55 +0100
Message-ID: <20231030132257.85379-3-angelogioacchino.delregno@collabora.com>
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

All of the MediaTek SoCs supported by Panfrost can switch the clocks
off and on during system sleep to save some power without any user
experience penalty.

Measurements taken on multiple MediaTek SoCs show that adding this
will not prolong the time that is required to resume the system in
any meaningful way.

As an example, for MT8195 - a "before" with only runtime PM operations
(so, without turning on/off GPU clocks), and an "after" executing full
system sleep .resume() handler (.resume() -> .runtime_resume() -> done):

Average Panfrost-only system sleep resume time, before: 110372ns
Average Panfrost-only system sleep resume time, after:  114186ns

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 7cabf4e3d1f2..82f3c5fe9c58 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -734,6 +734,7 @@ static const struct panfrost_compatible mediatek_mt8183_b_data = {
 	.supply_names = mediatek_mt8183_b_supplies,
 	.num_pm_domains = ARRAY_SIZE(mediatek_mt8183_pm_domains),
 	.pm_domain_names = mediatek_mt8183_pm_domains,
+	.pm_features = BIT(GPU_PM_CLK_DIS),
 };
 
 static const char * const mediatek_mt8186_pm_domains[] = { "core0", "core1" };
@@ -742,6 +743,7 @@ static const struct panfrost_compatible mediatek_mt8186_data = {
 	.supply_names = mediatek_mt8183_b_supplies,
 	.num_pm_domains = ARRAY_SIZE(mediatek_mt8186_pm_domains),
 	.pm_domain_names = mediatek_mt8186_pm_domains,
+	.pm_features = BIT(GPU_PM_CLK_DIS),
 };
 
 static const char * const mediatek_mt8192_supplies[] = { "mali", NULL };
@@ -752,6 +754,7 @@ static const struct panfrost_compatible mediatek_mt8192_data = {
 	.supply_names = mediatek_mt8192_supplies,
 	.num_pm_domains = ARRAY_SIZE(mediatek_mt8192_pm_domains),
 	.pm_domain_names = mediatek_mt8192_pm_domains,
+	.pm_features = BIT(GPU_PM_CLK_DIS),
 };
 
 static const struct of_device_id dt_match[] = {
-- 
2.42.0

