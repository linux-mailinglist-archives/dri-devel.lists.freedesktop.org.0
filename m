Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDF863C80A
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 20:19:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 786FA10E31F;
	Tue, 29 Nov 2022 19:19:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1FFD10E247
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 19:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1669749488; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=otLZTlXQs3lS98jbgn2cwZ6QYH6xDeRXlcMO9hILBzA=;
 b=UYNvi9KM8FyzLtek/9nDkBtAr9MMSAPiPJ1G+o482i7+TTza69bcPSFZLMjP++lYk+JwDu
 yLzrzjF5kkozlyWmjVhB4zMXtnFD/m6gevw8w6T6ekRFxc7STBxg31VM+/81Tgg3k2rcEP
 MI/skGMaJeHgQrCNYgIhU5fwHn9xrx0=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 14/26] drm: mediatek: Remove #ifdef guards for PM related
 functions
Date: Tue, 29 Nov 2022 19:17:21 +0000
Message-Id: <20221129191733.137897-15-paul@crapouillou.net>
In-Reply-To: <20221129191733.137897-1-paul@crapouillou.net>
References: <20221129191733.137897-1-paul@crapouillou.net>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Paul Cercueil <paul@crapouillou.net>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the DEFINE_SIMPLE_DEV_PM_OPS() and pm_sleep_ptr() macros to handle
the .suspend/.resume callbacks.

These macros allow the suspend and resume functions to be automatically
dropped by the compiler when CONFIG_SUSPEND is disabled, without having
to use #ifdef guards.

This has the advantage of always compiling these functions in,
independently of any Kconfig option. Thanks to that, bugs and other
regressions are subsequently easier to catch.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/mediatek/mtk_dp.c   | 6 ++----
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 9 ++++-----
 2 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 9d085c05c49c..00861a914855 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2590,7 +2590,6 @@ static int mtk_dp_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int mtk_dp_suspend(struct device *dev)
 {
 	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
@@ -2613,9 +2612,8 @@ static int mtk_dp_resume(struct device *dev)
 
 	return 0;
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops, mtk_dp_suspend, mtk_dp_resume);
 
 static const struct mtk_dp_data mt8195_edp_data = {
 	.bridge_type = DRM_MODE_CONNECTOR_eDP,
@@ -2650,7 +2648,7 @@ static struct platform_driver mtk_dp_driver = {
 	.driver = {
 		.name = "mediatek-drm-dp",
 		.of_match_table = mtk_dp_of_match,
-		.pm = &mtk_dp_pm_ops,
+		.pm = pm_sleep_ptr(&mtk_dp_pm_ops),
 	},
 };
 
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 0a8e0a13f516..52f77a6af10f 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1755,7 +1755,6 @@ static int mtk_drm_hdmi_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int mtk_hdmi_suspend(struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
@@ -1778,9 +1777,9 @@ static int mtk_hdmi_resume(struct device *dev)
 
 	return 0;
 }
-#endif
-static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops,
-			 mtk_hdmi_suspend, mtk_hdmi_resume);
+
+static DEFINE_SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops,
+				mtk_hdmi_suspend, mtk_hdmi_resume);
 
 static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
 	.tz_disabled = true,
@@ -1810,7 +1809,7 @@ static struct platform_driver mtk_hdmi_driver = {
 	.driver = {
 		.name = "mediatek-drm-hdmi",
 		.of_match_table = mtk_drm_hdmi_of_ids,
-		.pm = &mtk_hdmi_pm_ops,
+		.pm = pm_sleep_ptr(&mtk_hdmi_pm_ops),
 	},
 };
 
-- 
2.35.1

