Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0D55609F0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 21:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F5B10EB41;
	Wed, 29 Jun 2022 19:06:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DA510EB41
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 19:06:11 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id n12so16029321pfq.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 12:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4iLjVUVD01Ec5lhezzfL4b6+r3st8AOk4JH6YYFpua4=;
 b=LjxdwGocB300LRlrR3clI8v8Q6E/VOBSmVpRm49ABnVrx64ZPtRJw6AYgvjQrC+zFP
 fnXrQCrsYOVOEJ/GV5LF/hPis5i67QMn6Qq6P7Qkc8gaMByE2H0BaG8PUJq2fAsw5Cqh
 io1ISaJDdagUxdEYmHYGp26m3cHHacY3Aa2M4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=4iLjVUVD01Ec5lhezzfL4b6+r3st8AOk4JH6YYFpua4=;
 b=k32ucrYvOXz/90qkaecd/YclUgHRaFQzossqHC49AIHapP/PDi0xZc/WHnfvTeuKOA
 aE0517H31eaub99pEzOAPaKiwWbtFLaS6lxk1Q4K+bTto+PcFzkpruvmld6w3GD+2f4n
 3K35cWY+zzrBhBD58qyZhhL82ICM4BodNx1TlkNRTx9hz38QR4SsvZKH3dE5gC0++2K9
 egr0Ty0dNd1a6bwaxBRfS8NmLD3tW9h+dIzH+xg99TdhgWDVMBYDsD2FkFl7P5ynOYGZ
 OgCe5UIRrImOIUZWlbKYuw+qUeNb959s7zdjVcSypIPfoMoW0JbYaNzfxNDVRQqlAEuL
 pE8g==
X-Gm-Message-State: AJIora+xKgtItsUItS7E/O4dVyfjh+D2MywCjGUUIvfTA8JAMPJPN0/6
 ui1jTemRKG9MRq9dlf5czxXLeA==
X-Google-Smtp-Source: AGRyM1tdAZEaXsMXy4WDHw5pEvorBzaveQ/9uCKpadAq4lprCZEMl9Q/ZZY7m+ks6j6sgcZ+ER9EZw==
X-Received: by 2002:a62:82cb:0:b0:525:79d9:ddc4 with SMTP id
 w194-20020a6282cb000000b0052579d9ddc4mr10478560pfd.48.1656529570846; 
 Wed, 29 Jun 2022 12:06:10 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:9841:721:7d8b:4502])
 by smtp.gmail.com with ESMTPSA id
 y11-20020a63de4b000000b0040c644e82efsm11572917pgi.43.2022.06.29.12.06.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 12:06:10 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: [PATCH] drm/mediatek: ensure bridge disable happends before suspend
Date: Thu, 30 Jun 2022 03:05:46 +0800
Message-Id: <20220629190545.478113-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Make sure bridge_disable will be called before suspend by calling
drm_mode_config_helper_suspend() in .prepare callback.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
The issue is found if suspend is called via VT2 in several MTK SoC (eg.
MT8173, MT8183, MT8186) chromebook boards with eDP bridge:
bridge disable is called through mtk-drm's suspend, and it needs to be
called before bridge pm runtime suspend.
So we move the hook to .prepare() and .complete().
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 13a1bbe7ead7f..a42812e490007 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -828,8 +828,7 @@ static int mtk_drm_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int mtk_drm_sys_suspend(struct device *dev)
+static int mtk_drm_sys_prepare(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
 	struct drm_device *drm = private->drm;
@@ -840,20 +839,21 @@ static int mtk_drm_sys_suspend(struct device *dev)
 	return ret;
 }
 
-static int mtk_drm_sys_resume(struct device *dev)
+static void mtk_drm_sys_complete(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
 	struct drm_device *drm = private->drm;
 	int ret;
 
 	ret = drm_mode_config_helper_resume(drm);
-
-	return ret;
+	if (ret)
+		dev_err(dev, "Failed to resume\n");
 }
-#endif
 
-static SIMPLE_DEV_PM_OPS(mtk_drm_pm_ops, mtk_drm_sys_suspend,
-			 mtk_drm_sys_resume);
+static const struct dev_pm_ops mtk_drm_pm_ops = {
+	.prepare = mtk_drm_sys_prepare,
+	.complete = mtk_drm_sys_complete,
+};
 
 static struct platform_driver mtk_drm_platform_driver = {
 	.probe	= mtk_drm_probe,
-- 
2.37.0.rc0.161.g10f37bed90-goog

