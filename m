Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 161EB7DF4ED
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 15:27:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC44B10E8CC;
	Thu,  2 Nov 2023 14:26:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 867AB10E8CC
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Nov 2023 14:26:56 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com
 [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 9BAF466071C9;
 Thu,  2 Nov 2023 14:26:54 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698935215;
 bh=nx8LZ5aZaZWmWIuhLZAit8ghPn7x7/L0ncMUkbIZjgQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PMgQ9tnHFhp1yKgV6pn/NrC94LTt4p5qBqRZP5sEUPj6lAi/ozfcY+qg53ZszDXDA
 /3rSKevUzVz+wrE+dZ5NmofgBKgUhXwnrsaSUFZ3rHZ71MbbBHws778kvKrJ/Fn5Ai
 F2Y/DgS/BZcojQLvZnLhFBcc8fmtbTQdonpdcL9/n6tYlpGC6OiJh3QUsDX+DL/KuP
 51IoH4sa70l81OP0zElQRaIj5TRsXg+RpqYns+w8F56iuowRSjMbVdbKS32kzYPB6P
 EBigNWc/hQdsTIyz2smZ2f/sBfb1Eqgcb7y4Xk9jME7NfYoT0pk7UvsPVUbQKtecqC
 QjzmENZSB0mvg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: boris.brezillon@collabora.com
Subject: [PATCH v2 4/6] drm/panfrost: Set clocks on/off during system sleep on
 MediaTek SoCs
Date: Thu,  2 Nov 2023 15:26:41 +0100
Message-ID: <20231102142643.75288-5-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231102142643.75288-1-angelogioacchino.delregno@collabora.com>
References: <20231102142643.75288-1-angelogioacchino.delregno@collabora.com>
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
(so, without turning on/off GPU clocks), and an "after" executing both
the system sleep .resume() handler and .runtime_resume() (so the time
refers to T_Resume + T_Runtime_Resume):

Average Panfrost-only system sleep resume time, before: ~28000ns
Average Panfrost-only system sleep resume time, after:  ~33500ns

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

