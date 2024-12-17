Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E55C9F4FC7
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 16:44:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 319CC10E9FB;
	Tue, 17 Dec 2024 15:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="RYFBc5Tm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6601510E9E6
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 15:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1734450265;
 bh=iGH1BHAuVlT2GOX0NIFqeG5lBc5oKbS/z0v2UOVx3hk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RYFBc5TmfkYp7DU7OT0FV5g72ZcvuzDwjKww1J0sU6b/3KGGN1AXgTMmW+dur9zcv
 5lUv3uSMZA2liaVATgpqy46pTIwQadO4Ckmlj9Cb164pJI9iCCQEfsN2iq6pffkfgK
 bWEbuW8wgjAIM8JvjSButgKzx7D9EL1HBS0+IDV/GcwQU1nsVUOUgnFBygNvAoexc+
 OihWFLqIS9J4srHX7nDwA8005ZJouqSK2218PU6X4RgrfNhl2KwAXENthlkKEI/FIn
 c3dQyx2QFW2GGwQrumgV80mNWNEcB3qMFNcIpM5DaP1XsUM1u53fhr0qXCPIqpzZJ1
 gvmvURFSpD6cg==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id E4D6D17E37B1;
 Tue, 17 Dec 2024 16:44:23 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, jie.qiu@mediatek.com,
 junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, dmitry.baryshkov@linaro.org
Subject: [PATCH v3 24/33] drm/mediatek: mtk_hdmi: Remove ifdef for
 CONFIG_PM_SLEEP
Date: Tue, 17 Dec 2024 16:43:36 +0100
Message-ID: <20241217154345.276919-25-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
References: <20241217154345.276919-1-angelogioacchino.delregno@collabora.com>
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

Since the SIMPLE_DEV_PM_OPS macro and the pm pointer are anyway
defined when CONFIG_PM_SLEEP is not set, remove the ifdef for it
and indicate that the mtk_hdmi_{remove,suspend} functions may be
unused (as they are, in case PM support is not built-in).

While at it, to improve readability, also compress the
SIMPLE_DEV_PM_OPS declaration as it even fits in less
than 80 columns.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 5d46d486c68f..7e4536391cfb 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1694,8 +1694,7 @@ static void mtk_hdmi_remove(struct platform_device *pdev)
 	mtk_hdmi_clk_disable_audio(hdmi);
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int mtk_hdmi_suspend(struct device *dev)
+static __maybe_unused int mtk_hdmi_suspend(struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
 
@@ -1704,7 +1703,7 @@ static int mtk_hdmi_suspend(struct device *dev)
 	return 0;
 }
 
-static int mtk_hdmi_resume(struct device *dev)
+static __maybe_unused int mtk_hdmi_resume(struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
 	int ret = 0;
@@ -1717,9 +1716,8 @@ static int mtk_hdmi_resume(struct device *dev)
 
 	return 0;
 }
-#endif
-static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops,
-			 mtk_hdmi_suspend, mtk_hdmi_resume);
+
+static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops, mtk_hdmi_suspend, mtk_hdmi_resume);
 
 static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
 	.tz_disabled = true,
-- 
2.47.0

