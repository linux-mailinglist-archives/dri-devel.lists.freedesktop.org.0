Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B0C4ACB55
	for <lists+dri-devel@lfdr.de>; Mon,  7 Feb 2022 22:30:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB7410E517;
	Mon,  7 Feb 2022 21:30:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46ADA10E517
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Feb 2022 21:30:18 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id u6so8462196lfc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Feb 2022 13:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ta04whGTCnFU1H5shz/mko09ftNjeI/vAJqNZLbgbaE=;
 b=Pxypyx8Nucm9a3KD8J2kuxpg5JyU7vFtrbKVwX4Ia4VHk/Y+ebMkLUCQpyzXFLKf/R
 izApD1EhHF6qMoMIrnLTqFtXeqAHanvuTvxEMdqg87dApAgSdm9hHnD8FE3rN63t/onI
 51Vn6m4nVKpRkEW9u7qUSz7hItZgaLnqyGmWYpuPhCLqBdxJyF7t1JlsD3eXzdvkIyGJ
 zKUtfrvmsBarKyWAb782tuNA2pW/v38nXuf/TXNim+1Uu/d6mm+eLqiE0qcpAVfT7pkP
 +knNncueWv4iN70jK4/LU7cjgrNHufCkaecugiGC2Kgo4c7qHe64Qojix/b8lUG0hb+o
 LjHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ta04whGTCnFU1H5shz/mko09ftNjeI/vAJqNZLbgbaE=;
 b=pIm0tkGd/JP68vuCfGOnHvcNXEg1uJ7+3jWHxB7s9IvUSIh4fhfilosngK8wG1N0az
 lRXkSk1dYr9qUjfKhxHub2E4gbKqkdNbL/bZeP2khhp/zVimsO3vq56l1lDKftD0S0P8
 GobuGwnE5/z9CelaoN20jLxiLfDgSlQjKGXAO8G7D1NhdMRw/WdDNwAM4TmOQDpMl9jJ
 UhPDnid4BoFoVb4u0fSzBrBnWuaBZNIZNV1QBR1xZmsSZkFa8E460nVeKOjG0X4nVV1m
 8FKfzhFqWsQWKsOhfA9+G0na6SuAQeMGERbDJUEOBEuEN2WBm7csEZPAwMcojzaId0mO
 EoPA==
X-Gm-Message-State: AOAM5317TXY8sOfPXrsiTfUWjFmj5pX3/7YLAZwVRVMyr8TAm6BuMOVJ
 /AW8tKK5abKvGCGGqqX3jYw=
X-Google-Smtp-Source: ABdhPJw8TSqr9ot64AAqq4OKoJZEeGlULYp2r2hWK9l3l8dZV4lqQfJf4KG5KtmQrzHwu1iBRhQP9A==
X-Received: by 2002:ac2:46d3:: with SMTP id p19mr979333lfo.164.1644269416616; 
 Mon, 07 Feb 2022 13:30:16 -0800 (PST)
Received: from localhost.localdomain (109-252-138-165.dynamic.spd-mgts.ru.
 [109.252.138.165])
 by smtp.gmail.com with ESMTPSA id y19sm1651246lfb.191.2022.02.07.13.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 13:30:16 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <cyndis@kapsi.fi>
Subject: [PATCH v1] drm/tegra: Use dev_err_probe()
Date: Tue,  8 Feb 2022 00:29:23 +0300
Message-Id: <20220207212923.10386-1-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace dev_printk() with a generic dev_err_probe() helper which silences
noisy error messages about deferred probe and makes easy to debug failing
deferred probe by printing notification about the failure to KMSG in the
end of kernel booting process and by adding failing device and the reason
of deferred probe to devices_deferred of debugfs. This was proven to be
useful in the case of eDP driver regression by immediately showing why
display driver was failing when user asked for help, otherwise it would've
been much more difficult to debug such problems on a third party device
that doesn't have developer setup.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/dc.c   | 13 +++----------
 drivers/gpu/drm/tegra/hdmi.c | 34 +++++++++-------------------------
 2 files changed, 12 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
index eb70eee8992a..9435c867c865 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -3211,16 +3211,9 @@ static int tegra_dc_probe(struct platform_device *pdev)
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
index 8845af5d325f..bf240767dad9 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1775,7 +1775,6 @@ static irqreturn_t tegra_hdmi_irq(int irq, void *data)
 
 static int tegra_hdmi_probe(struct platform_device *pdev)
 {
-	const char *level = KERN_ERR;
 	struct tegra_hdmi *hdmi;
 	struct resource *regs;
 	int err;
@@ -1817,36 +1816,21 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 
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
2.34.1

