Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C82643A720
	for <lists+dri-devel@lfdr.de>; Tue, 26 Oct 2021 00:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 940AB6E2E3;
	Mon, 25 Oct 2021 22:46:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 829A26E2E1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 22:45:58 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id q16so12204446ljg.3
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 15:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CCCJ0mW2gwsnFPN+OPsgUTOb6pwwmydDjjp/u9hKbfY=;
 b=QxYo2YxRLTZ/QUkVuiRrnKUMCi8iGuqEstVwgsUSEQsoc6hmdMw+zQ8cHA1k7e+jeQ
 qHcynesgFZvCObbzzG8s/OVks7bTtwzpjKUP3t3xwCnPFhBLOBcUtwJ7LJ8QyP733364
 Y7mqrB7OTybWq+UzpoGZQ1frr+KhmDX2njZoTQHC6YN7ypxeHsjJR0lwz1fHkmJ27XTn
 VoOgsLDf4WEx63DqHAznvn5LOOi87i85TNtLZdcdvmvlawvuaBN/U0yB7UnNG50w5VDr
 tek6PpbQmfgzSzr8/KVws4qYlCWEadcasHxJN+GGCsmMiHlgEJ5Bd8aE9VWYZHmDYWOM
 yzAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CCCJ0mW2gwsnFPN+OPsgUTOb6pwwmydDjjp/u9hKbfY=;
 b=d1cHfjoOuIWkK2c+MvPxXmM3zfr0f2yNt8/RXE6OWlJU9QTTjoaQT8Z3qE1LCQv6yj
 QQNcW2v58VRtOLdzH8mndI7Y7n8edUyTbG/amtIOHlw+6FhARtKdJSRiFdEHKtq8r8zE
 BZg1zqdr6CzUuaeNg3XiLOyjBwfPKCiTzr20tlH+C9/nGaxJbwz0V95JceftNAQV6Dcr
 WBXo6Hj9HpJSUInHst2vnvlnXXUULt6UheXMM8+p2wdx4H1RSy6ajMDJL9K5a5kaMC3N
 vWA6MTi0RtI+YDdUyezeUmUDntlJv6aYCsaRSn7taBILxK22O9iRwJEyvj0zsMQIcmru
 fZzg==
X-Gm-Message-State: AOAM531mTmwu46ucUcKIrevIE6H2nUdGrQOObkULS5Rb4Br1K99b7REC
 lRGuSQyllvLD08V1b/4FMzs=
X-Google-Smtp-Source: ABdhPJyvIkPk0JW1nUlhm/sbKY+klJKBKRC4kwdUeSR8nEuSsxoPCzdbWKExoyLredOoboxG47izfA==
X-Received: by 2002:a2e:9b09:: with SMTP id u9mr22560700lji.111.1635201956554; 
 Mon, 25 Oct 2021 15:45:56 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id t20sm2040956lft.240.2021.10.25.15.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 15:45:56 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Nishanth Menon <nm@ti.com>, Adrian Hunter <adrian.hunter@intel.com>,
 Michael Turquette <mturquette@baylibre.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-mmc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org, David Heidelberg <david@ixit.cz>
Subject: [PATCH v14 11/39] drm/tegra: hdmi: Add OPP support
Date: Tue, 26 Oct 2021 01:40:04 +0300
Message-Id: <20211025224032.21012-12-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211025224032.21012-1-digetx@gmail.com>
References: <20211025224032.21012-1-digetx@gmail.com>
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

The HDMI on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now HDMI driver must use
OPP API for driving the controller's clock rate because OPP API takes
care of reconfiguring the domain's performance state based on HDMI clock
rate. Add OPP support to the HDMI driver.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/hdmi.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index e5d2a4026028..9a87d351a828 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -11,10 +11,13 @@
 #include <linux/math64.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
 
+#include <soc/tegra/common.h>
+
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_debugfs.h>
@@ -1195,7 +1198,7 @@ static void tegra_hdmi_encoder_enable(struct drm_encoder *encoder)
 	h_back_porch = mode->htotal - mode->hsync_end;
 	h_front_porch = mode->hsync_start - mode->hdisplay;
 
-	err = clk_set_rate(hdmi->clk, hdmi->pixel_clock);
+	err = dev_pm_opp_set_rate(hdmi->dev, hdmi->pixel_clock);
 	if (err < 0) {
 		dev_err(hdmi->dev, "failed to set HDMI clock frequency: %d\n",
 			err);
@@ -1732,7 +1735,14 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, hdmi);
-	pm_runtime_enable(&pdev->dev);
+
+	err = devm_pm_runtime_enable(&pdev->dev);
+	if (err)
+		return err;
+
+	err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
+	if (err)
+		return err;
 
 	INIT_LIST_HEAD(&hdmi->client.list);
 	hdmi->client.ops = &hdmi_client_ops;
@@ -1753,8 +1763,6 @@ static int tegra_hdmi_remove(struct platform_device *pdev)
 	struct tegra_hdmi *hdmi = platform_get_drvdata(pdev);
 	int err;
 
-	pm_runtime_disable(&pdev->dev);
-
 	err = host1x_client_unregister(&hdmi->client);
 	if (err < 0) {
 		dev_err(&pdev->dev, "failed to unregister host1x client: %d\n",
-- 
2.33.1

