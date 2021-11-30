Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0D1B4642E8
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:25:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CBF6E836;
	Tue, 30 Nov 2021 23:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54E7A6E7EC
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:24:15 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id f18so57925132lfv.6
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:24:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=igwS03O+cCyV7lRXH4y+t79qa1UqfsZF14OJ7wQIlV8=;
 b=htuo8UOqiXHZlqyQTAZNbFZxHc4DPwrOYg6kUq/zlypszWi7KCVURaAu09L75ikV8j
 gVZ/MXsd8daanDhAAvffpz8JA90c2NKV1b1yBt4F404Jz7bXGc8zAKYWlknJJhVR9M/4
 fs7utTmi7ldMCPwErRTse9Ljnb6rYUMJIT4I/8iLPrN3T+92bjCYutMyZzuBzR5iFevd
 45T37bKZrb+qWEphjJlEvMOmA6LpbzYFgYdw244AgYZdhDN1isP3bfNuIt/yDQ4iWau6
 7Xfbnf/6L6JnrRKpX9r5OCh8WD2aA0G79+krOwW2yWPtLQvugvrhaM9ZC/EeIKbfp9ZC
 6nWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=igwS03O+cCyV7lRXH4y+t79qa1UqfsZF14OJ7wQIlV8=;
 b=xAvaEyf6PA+BpnLzSWiOLUT26wuc7W1gH2Yk1cltDJH6CDqh6ib0w6Dpkd3PVnQnkB
 mEN+zZZNd1K0yBuAycEHjWvVDtDgHZGavspJKp55ZWlHIzwzIOayB19Xd1z6SH8zcfiZ
 AtwJHmYkhCxfWZYEZ2xtmaho5XzSHYcOOIcbfBfqIrJgEJ3JQ55foBy4O6+zr5Hl4VlA
 SgpdfTsekvlgl3Kk++GM/N0gWvfWx9OvribRdqRhdC+hf/PiMsj+q44jDnDeqwXFWZOA
 HJmIq3maI3aDunyWM6sMUVye2D99A45b92h47bsAScPm8w0xD/3An3b4eL2cb4qwAozf
 iUtw==
X-Gm-Message-State: AOAM533WXuAp+TrPqyMfuQvVWMvDcfTePJbL9CCZ88ZofSM+xSoGi0Zq
 WZH36Uk8jgnz6MEdYhh0a+4=
X-Google-Smtp-Source: ABdhPJyvAwEqnk4ASB6VGm4zma8b5Ucl5xOldQYlENWaRXDDvFw62swx4bEvNWzafupfXX2E+Eg8TA==
X-Received: by 2002:ac2:446a:: with SMTP id y10mr2115003lfl.585.1638314653734; 
 Tue, 30 Nov 2021 15:24:13 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:24:13 -0800 (PST)
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
Subject: [PATCH v16 19/40] usb: chipidea: tegra: Add runtime PM and OPP support
Date: Wed,  1 Dec 2021 02:23:26 +0300
Message-Id: <20211130232347.950-20-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211130232347.950-1-digetx@gmail.com>
References: <20211130232347.950-1-digetx@gmail.com>
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

The Tegra USB controller belongs to the core power domain and we're going
to enable GENPD support for the core domain. Now USB controller must be
resumed using runtime PM API in order to initialize the USB power state.
We already support runtime PM for the CI device, but CI's PM is separated
from the RPM managed by tegra-usb driver. Add runtime PM and OPP support
to the driver.

Acked-by: Peter Chen <peter.chen@kernel.org>
Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_tegra.c | 53 ++++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/chipidea/ci_hdrc_tegra.c b/drivers/usb/chipidea/ci_hdrc_tegra.c
index 60361141ac04..a72a9474afea 100644
--- a/drivers/usb/chipidea/ci_hdrc_tegra.c
+++ b/drivers/usb/chipidea/ci_hdrc_tegra.c
@@ -7,6 +7,7 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/reset.h>
 
 #include <linux/usb.h>
@@ -15,6 +16,8 @@
 #include <linux/usb/of.h>
 #include <linux/usb/phy.h>
 
+#include <soc/tegra/common.h>
+
 #include "../host/ehci.h"
 
 #include "ci.h"
@@ -278,6 +281,8 @@ static int tegra_usb_probe(struct platform_device *pdev)
 	if (!usb)
 		return -ENOMEM;
 
+	platform_set_drvdata(pdev, usb);
+
 	soc = of_device_get_match_data(&pdev->dev);
 	if (!soc) {
 		dev_err(&pdev->dev, "failed to match OF data\n");
@@ -296,11 +301,14 @@ static int tegra_usb_probe(struct platform_device *pdev)
 		return err;
 	}
 
-	err = clk_prepare_enable(usb->clk);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to enable clock: %d\n", err);
+	err = devm_tegra_core_dev_init_opp_table_common(&pdev->dev);
+	if (err)
+		return err;
+
+	pm_runtime_enable(&pdev->dev);
+	err = pm_runtime_resume_and_get(&pdev->dev);
+	if (err)
 		return err;
-	}
 
 	if (device_property_present(&pdev->dev, "nvidia,needs-double-reset"))
 		usb->needs_double_reset = true;
@@ -320,8 +328,6 @@ static int tegra_usb_probe(struct platform_device *pdev)
 	if (err)
 		goto fail_power_off;
 
-	platform_set_drvdata(pdev, usb);
-
 	/* setup and register ChipIdea HDRC device */
 	usb->soc = soc;
 	usb->data.name = "tegra-usb";
@@ -350,7 +356,9 @@ static int tegra_usb_probe(struct platform_device *pdev)
 phy_shutdown:
 	usb_phy_shutdown(usb->phy);
 fail_power_off:
-	clk_disable_unprepare(usb->clk);
+	pm_runtime_put_sync_suspend(&pdev->dev);
+	pm_runtime_force_suspend(&pdev->dev);
+
 	return err;
 }
 
@@ -360,15 +368,46 @@ static int tegra_usb_remove(struct platform_device *pdev)
 
 	ci_hdrc_remove_device(usb->dev);
 	usb_phy_shutdown(usb->phy);
+
+	pm_runtime_put_sync_suspend(&pdev->dev);
+	pm_runtime_force_suspend(&pdev->dev);
+
+	return 0;
+}
+
+static int __maybe_unused tegra_usb_runtime_resume(struct device *dev)
+{
+	struct tegra_usb *usb = dev_get_drvdata(dev);
+	int err;
+
+	err = clk_prepare_enable(usb->clk);
+	if (err < 0) {
+		dev_err(dev, "failed to enable clock: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int __maybe_unused tegra_usb_runtime_suspend(struct device *dev)
+{
+	struct tegra_usb *usb = dev_get_drvdata(dev);
+
 	clk_disable_unprepare(usb->clk);
 
 	return 0;
 }
 
+static const struct dev_pm_ops tegra_usb_pm = {
+	SET_RUNTIME_PM_OPS(tegra_usb_runtime_suspend, tegra_usb_runtime_resume,
+			   NULL)
+};
+
 static struct platform_driver tegra_usb_driver = {
 	.driver = {
 		.name = "tegra-usb",
 		.of_match_table = tegra_usb_of_match,
+		.pm = &tegra_usb_pm,
 	},
 	.probe = tegra_usb_probe,
 	.remove = tegra_usb_remove,
-- 
2.33.1

