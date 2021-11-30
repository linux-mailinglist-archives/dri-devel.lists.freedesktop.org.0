Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AAC446421D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD7A16E544;
	Tue, 30 Nov 2021 23:10:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7816E226
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:10:21 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id m12so6077752ljj.6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jcG5eW0FrkUy1abf1a09oWGeCDTmXxu7iElTZZhQRA0=;
 b=NzoFGdoxPTaslzF822nf8oyVEuMKLmIi+AcHqT2Mdh2m5Bz6iwT3XMOZP4H7UZ9xhF
 OonzE15T6vJxXp9Ipe+LX5fSFXqzr1eJENDcenTSz+vki/FV4YGC1Lm+wNqnI4yNuKZn
 COzxRh2PevDRaxLAIv9z7dNJI1rFX9aEsnyXNvxwhcznkhtDXupYbNSy1Ea3J21IGsUq
 bXhONaB0uDWU999cZN5IQ/2XGHGBZ9ZSfbk2VzMnz+H9DpcgqqntLa3IoXjCO+nfKvJt
 xhSbuaaXNXnq1xdF5oFc18y3k9xw/2dPITruLg6CE+OyT1vmRNjmwtu1cMyGhvvOGmb4
 YUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jcG5eW0FrkUy1abf1a09oWGeCDTmXxu7iElTZZhQRA0=;
 b=1LInhxge67h3JaDJN1oORFe7aFf/CpFqcMbc9GBvvtl9KyabOYMtgLebp+WU4yJxB0
 NPd3H5TpehPNRt500+pqFXvGtQUCZaAg4QpGvweZbP1m6BsZbrfz7h1ZrkXnWmLD4O2q
 a6fkrCBhDEXbT3drH5iRLYJoGnz94YIHyZn0IXrg91Rr9xc4Wn+ErISgSDC16gcb4jFW
 nIxjMuLMxQao2S/BrSVTalYda0dRny0C156LbQVc43Pblqo0crsO171ml6oIoPKoiRPI
 Om9yFU02tkFQFtG4/lJwTZW6aA/8R3ilLtShuAgulBERHzRX1Q8uQ48SmQIYBQRXmdwX
 UJLQ==
X-Gm-Message-State: AOAM532hn5epjTtOiwKsD8al+hDtV+WH2gaIyKG+ug39oAFnxc+GI/nv
 phxtvLemXmioA6ErxwNUfEY=
X-Google-Smtp-Source: ABdhPJzIB1kqtQQtgiFwg3vHfHbAzcAzg49NJGrFYgMGqiBoL+OGU+k5JSm9LcGe9snMnLIvuZVjlA==
X-Received: by 2002:a2e:2a46:: with SMTP id q67mr1914801ljq.398.1638313819819; 
 Tue, 30 Nov 2021 15:10:19 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id k14sm2099846lfu.210.2021.11.30.15.10.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:10:19 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lyude Paul <lyude@redhat.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Graichen <thomas.graichen@gmail.com>
Subject: [PATCH v2 4/4] drm/tegra: Use dev_err_probe()
Date: Wed,  1 Dec 2021 02:09:57 +0300
Message-Id: <20211130230957.30213-5-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130230957.30213-1-digetx@gmail.com>
References: <20211130230957.30213-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
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
index 7ea3c045a6f7..f7370d28816f 100644
--- a/drivers/gpu/drm/tegra/dc.c
+++ b/drivers/gpu/drm/tegra/dc.c
@@ -3236,16 +3236,9 @@ static int tegra_dc_probe(struct platform_device *pdev)
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
index 9a87d351a828..3242baddc5e7 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1638,7 +1638,6 @@ static irqreturn_t tegra_hdmi_irq(int irq, void *data)
 
 static int tegra_hdmi_probe(struct platform_device *pdev)
 {
-	const char *level = KERN_ERR;
 	struct tegra_hdmi *hdmi;
 	struct resource *regs;
 	int err;
@@ -1678,36 +1677,21 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 
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
2.33.1

