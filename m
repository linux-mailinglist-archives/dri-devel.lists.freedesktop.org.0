Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A72B6184213
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 09:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B435F6EB7F;
	Fri, 13 Mar 2020 08:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 330186E2E9
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 15:05:29 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id s13so6843374ljm.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Mar 2020 08:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y9t7hcDPw5hcSVIoyJhq2EKW/iy01JerI1gf2khe8HM=;
 b=M4vg7cXkAY37IPDxcGPrfjw0qoKxVGmLTS9ch9eZW4IYuSeZCR4s9JqsvNM0yuoh36
 2GNl5bJq7lwQATdBbtol1XmWMoJbGHywRDEnluw4rFhjuwHp9c/1/Ncl8g76KNb5hpPF
 mgvqY0bb+wAnctOHEgKcQQONNVbmVVuRctRhxvfxJn5TbXpfu2A+37IF2UtcUDQ/NIBU
 gWXDnm/GoBeuzrZQf163HnWccjgaz0oiw7YADJk4342rmtOeMrL17JBsA86VsHZ+8X3o
 xlGXuccsnKmRC7kiPm4nCuAEfk6lFSrpOyGdBqW3dWlJzXHVYFfciVfrS3XLGjs0PBlx
 yKow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y9t7hcDPw5hcSVIoyJhq2EKW/iy01JerI1gf2khe8HM=;
 b=F4Ahce05Lua2ilI80/9NQl+NtnN2UkL3uSrqXAOi8QPrWJioY+EFcNWA8rVTNpWorT
 A+YGobAE3NQ1uWWRTkA7fu8eZZW/QpZqGeNdwmoKKTUhukGAD1Z8D0ZUJqOgSdkmFtdU
 j2ip2lcqnA97MrciT4b588IZwy92UUbHUI0gR1TAbMTFTQjDxO4frYHBbHl/+PQXYuEz
 lX77DocxCglkqB7oZmHV5lCIR4EZYfTAsGJ6AbHpZf5b9Dt+vBzfWHcVQKO30qdbaFhA
 U21Ci48Rb/7TsOd2x7YIfLJHmT873wD3ESLsLD0dTOmDN6/MmX67T4p2IfRIisJIEoj0
 vr9Q==
X-Gm-Message-State: ANhLgQ13bbexPGz3iGBF27M/TMV0OmqBTlwobTpmgFsxPrr3+R4+amZh
 aLJGNmJ4SbEeKnBwYunOZy8=
X-Google-Smtp-Source: ADFU+vskKUWYeST7SOaPbykK9vVxlbZAXBzB74j1CaREbC5+3kkfuakH8JsysgexSrGwbLMUm99ipg==
X-Received: by 2002:a05:651c:2006:: with SMTP id
 s6mr5405124ljo.251.1584025527545; 
 Thu, 12 Mar 2020 08:05:27 -0700 (PDT)
Received: from localhost.localdomain (94-29-39-224.dynamic.spd-mgts.ru.
 [94.29.39.224])
 by smtp.gmail.com with ESMTPSA id r12sm9538041ljd.6.2020.03.12.08.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 08:05:26 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v1] drm/tegra: hdmi: Silence deferred-probe error
Date: Thu, 12 Mar 2020 18:04:32 +0300
Message-Id: <20200312150432.2745-1-digetx@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 13 Mar 2020 08:00:36 +0000
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

Driver fails to probe with -EPROBE_DEFER, which produces a bit noisy error
message in KMSG during kernel's boot up. This happens because voltage
regulators tend to be probed later than the DRM driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/hdmi.c | 34 +++++++++++++++++++++++++---------
 1 file changed, 25 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 6f117628f257..e8ee8058c587 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -1648,6 +1648,7 @@ static irqreturn_t tegra_hdmi_irq(int irq, void *data)
 
 static int tegra_hdmi_probe(struct platform_device *pdev)
 {
+	const char *err_level = KERN_ERR;
 	struct tegra_hdmi *hdmi;
 	struct resource *regs;
 	int err;
@@ -1686,21 +1687,36 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 	}
 
 	hdmi->hdmi = devm_regulator_get(&pdev->dev, "hdmi");
-	if (IS_ERR(hdmi->hdmi)) {
-		dev_err(&pdev->dev, "failed to get HDMI regulator\n");
-		return PTR_ERR(hdmi->hdmi);
+	err = PTR_ERR_OR_ZERO(hdmi->hdmi);
+	if (err) {
+		if (err == -EPROBE_DEFER)
+			err_level = KERN_DEBUG;
+
+		dev_printk(err_level, &pdev->dev,
+			   "failed to get HDMI regulator: %d\n", err);
+		return err;
 	}
 
 	hdmi->pll = devm_regulator_get(&pdev->dev, "pll");
-	if (IS_ERR(hdmi->pll)) {
-		dev_err(&pdev->dev, "failed to get PLL regulator\n");
-		return PTR_ERR(hdmi->pll);
+	err = PTR_ERR_OR_ZERO(hdmi->pll);
+	if (err) {
+		if (err == -EPROBE_DEFER)
+			err_level = KERN_DEBUG;
+
+		dev_printk(err_level, &pdev->dev,
+			   "failed to get PLL regulator: %d\n", err);
+		return err;
 	}
 
 	hdmi->vdd = devm_regulator_get(&pdev->dev, "vdd");
-	if (IS_ERR(hdmi->vdd)) {
-		dev_err(&pdev->dev, "failed to get VDD regulator\n");
-		return PTR_ERR(hdmi->vdd);
+	err = PTR_ERR_OR_ZERO(hdmi->vdd);
+	if (err) {
+		if (err == -EPROBE_DEFER)
+			err_level = KERN_DEBUG;
+
+		dev_printk(err_level, &pdev->dev,
+			   "failed to get VDD regulator: %d\n", err);
+		return err;
 	}
 
 	hdmi->output.dev = &pdev->dev;
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
