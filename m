Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C8C44FA56
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 20:36:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99D56E885;
	Sun, 14 Nov 2021 19:36:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0DDD6E87B
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 19:36:08 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id p16so37615374lfa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 11:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BUPMWYY4B4RjKlltUXgnFtV9hhuqy47aEg3MTgDplAQ=;
 b=NhLPfCdG4QMaSKOEfWBf6G1C0UfFzZ9QBMXGXcMorq+aDVH2yHb00kfLpKe5QPAkW9
 83g2f3TSSjK30RKxglCK8tVS6U4iyClmMkLT2BXO8wCH5BbTDexVM/Abs9otzv9QplE1
 wQJGuxmyef85gvWx29r+lSr3QPiNUmS0CX7TnEvJTechq4RfJMxgl5GWlRDEeaKvsGGT
 x2DNdhe/beasLasodZ2jvGHQZJilWeL6SwoCGKnJtjK6kVncWG5iuqpmAai0VgCES4b4
 UP0E4qm8VbPRkrv8n/ZWbn7dg+r1Tw/6P6RgY4YKgw8+fSPJrEZ+HXcN/P7GgeIt3aX/
 TyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BUPMWYY4B4RjKlltUXgnFtV9hhuqy47aEg3MTgDplAQ=;
 b=xbTNmK9dfjnTYnm1bLFD6hIuMh6sGevnClYL2zD1uxSnWt5gGeK5uF9kwzMaS3JK+R
 44nTpoWaiqy5MqyTmRFxht73tMrBkB0s34e7M4xWnyBVZytLknbzuZvy+OLW2t4j2R+A
 8dBnpmn5lW9qA4wXa7zNvArcBhlvlcrIV69wEndSZ9Kyy7eU53T9QhLWOtCv2V3xNpxu
 6lsp3aKNEQC26JSp/r9FCcZDqGVYyBJrZkuJVdbPh9n1qxy6WLbskpsK90+HETMgEgHU
 gq5/MK+a+vUPiIprWZweJv2WBeHq6UV5mcA6sGFfnyDGZ/SskCmsIXKKINnuNG/CZ4Oi
 48kA==
X-Gm-Message-State: AOAM533LMTPXuEy3yKFegxcJtVWQuqN8sKGOB2AA8mxuOEfsHPgvQbGu
 ocK6AqAsBJ4Q63H6gxUmhiU=
X-Google-Smtp-Source: ABdhPJwn8S+SB2vQWbhk6bdTFAcdYMi+WSuzyZK1j53f1woydhpNokqMPvQgRJFQHIW3M9viYMzM/Q==
X-Received: by 2002:a05:6512:239d:: with SMTP id
 c29mr30650205lfv.454.1636918567286; 
 Sun, 14 Nov 2021 11:36:07 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id p18sm1191280lfu.127.2021.11.14.11.36.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 11:36:07 -0800 (PST)
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
Subject: [PATCH v15 11/39] drm/tegra: hdmi: Add OPP support
Date: Sun, 14 Nov 2021 22:34:07 +0300
Message-Id: <20211114193435.7705-12-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114193435.7705-1-digetx@gmail.com>
References: <20211114193435.7705-1-digetx@gmail.com>
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
Cc: linux-pwm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Heidelberg <david@ixit.cz>,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HDMI on Tegra belongs to the core power domain and we're going to
enable GENPD support for the core domain. Now HDMI driver must use
OPP API for driving the controller's clock rate because OPP API takes
care of reconfiguring the domain's performance state based on HDMI clock
rate. Add OPP support to the HDMI driver.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
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

