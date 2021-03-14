Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63BD633A809
	for <lists+dri-devel@lfdr.de>; Sun, 14 Mar 2021 21:43:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0016D89D73;
	Sun, 14 Mar 2021 20:43:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 208A489D73
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Mar 2021 20:43:36 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id u4so53764493lfs.0
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Mar 2021 13:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Ctqx999c7Wo5eqbQNlgMEem8uToy6UzHW11+ccWT80=;
 b=VvC6GNfOBC9bnBMl2B3lSvLlOiuSbJpYGZg6/fBddK7wARVtmWmWe1SJCILyfnXZws
 o9qcthjGNl0CmThCBHAx2dPNij6+DZ9vH2CaoL/UJQKhOKSSYYTuSZ1sOxtVOrKNzMkh
 SXPccpZGUwvZdnO1ylv1+j8MIQOTks3U1ToGLHRUZ+WcHBVccv/m3fdqatc8Ev3ZD0+j
 mXDut2QCdVo/7fqVAWh0Pmd7unMkMV39NODEjFPyc0Wq7M7flexh+Zan5MBF8zBHGFqy
 6Tox/J94LbEeyG0vd8DujbVHfTyEL33Y3ydQ41UIOmS7jDV3DFvMFL7e33IkXGdOnY9H
 0IJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8Ctqx999c7Wo5eqbQNlgMEem8uToy6UzHW11+ccWT80=;
 b=YpIbDvfc1oT3Nviy9dkfE5ykvwg7AtLU2UAM8owKlqZrTY2YhyFMzGyLFiv33mF8mW
 XjiyKxU/Ze/rFhjGTTi97lN3uC+dG/uBU+Owd5lIJODES/VnZI9nZt9fw5nJvRkH3tOg
 /W17gHWmoVLman/T928q/GpNKmDaNm2WiVFZbrcmNuWzBwoEIQo0V5bYEkDgw6+6KfnO
 /rosZP8yrXlV8i4I4+GRTCZtk8TIgGjN4Ro8iw2LA2dxGIY7hIGKAfJqbtR/JAnzVdLt
 er1T9+7HpK7/S9DDguJKNJXo/N126swKQ7i6UNdTwLXsIFCDRSXY7ioDZy+yaMQ3PDQh
 j94g==
X-Gm-Message-State: AOAM531PmPfZ744/NgWOSQAQJE0wGxUcVEKz8pQS4Ow/W5lsh3T/XxEe
 gH8wo14nRvCC2Kobf8MVgWg=
X-Google-Smtp-Source: ABdhPJwG3bsT9cAuukhN80RhHx5Cixj+uv/rapZtn+2AynFR5Xx6aA17GDDgyTzWSKprQ0E5DyEchg==
X-Received: by 2002:a19:f001:: with SMTP id p1mr6229440lfc.447.1615754614533; 
 Sun, 14 Mar 2021 13:43:34 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id c19sm2622319ljk.60.2021.03.14.13.43.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 13:43:34 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v1] drm/tegra: Use dev_err_probe()
Date: Sun, 14 Mar 2021 23:43:11 +0300
Message-Id: <20210314204311.10572-1-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use generic dev_err_probe() helper which silences noisy error messages
about deferred probe of the Tegra DRM drivers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c   | 13 +++----------
 drivers/gpu/drm/tegra/hdmi.c | 34 +++++++++-------------------------
 2 files changed, 12 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index 0ae3a025efe9..ff7968200d4e 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -2589,16 +2589,9 @@ static int tegra_dc_probe(struct platform_device *pdev)
 		return -ENXIO;
 
 	err = tegra_dc_rgb_probe(dc);
-	if (err < 0 && err != -ENODEV) {
-		const char *level = KERN_ERR;
-
-		if (err == -EPROBE_DEFER)
-			level = KERN_DEBUG;
-
-		dev_printk(level, dc->dev, "failed to probe RGB output: %d\n",
-			   err);
-		return err;
-	}
+	if (err < 0 && err != -ENODEV)
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to probe RGB output\n");
 
 	platform_set_drvdata(pdev, dc);
 	pm_runtime_enable(&pdev->dev);
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index e5d2a4026028..f5abb73d20ad 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1635,7 +1635,6 @@ static irqreturn_t tegra_hdmi_irq(int irq, void *data)
 
 static int tegra_hdmi_probe(struct platform_device *pdev)
 {
-	const char *level = KERN_ERR;
 	struct tegra_hdmi *hdmi;
 	struct resource *regs;
 	int err;
@@ -1675,36 +1674,21 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 
 	hdmi->hdmi = devm_regulator_get(&pdev->dev, "hdmi");
 	err = PTR_ERR_OR_ZERO(hdmi->hdmi);
-	if (err) {
-		if (err == -EPROBE_DEFER)
-			level = KERN_DEBUG;
-
-		dev_printk(level, &pdev->dev,
-			   "failed to get HDMI regulator: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to get HDMI regulator\n");
 
 	hdmi->pll = devm_regulator_get(&pdev->dev, "pll");
 	err = PTR_ERR_OR_ZERO(hdmi->pll);
-	if (err) {
-		if (err == -EPROBE_DEFER)
-			level = KERN_DEBUG;
-
-		dev_printk(level, &pdev->dev,
-			   "failed to get PLL regulator: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to get PLL regulator\n");
 
 	hdmi->vdd = devm_regulator_get(&pdev->dev, "vdd");
 	err = PTR_ERR_OR_ZERO(hdmi->vdd);
-	if (err) {
-		if (err == -EPROBE_DEFER)
-			level = KERN_DEBUG;
-
-		dev_printk(level, &pdev->dev,
-			   "failed to get VDD regulator: %d\n", err);
-		return err;
-	}
+	if (err)
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to get VDD regulator\n");
 
 	hdmi->output.dev = &pdev->dev;
 
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
