Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC91B2E91E0
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 09:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFF5A89D86;
	Mon,  4 Jan 2021 08:39:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC3F89BBE;
 Fri,  1 Jan 2021 16:57:06 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id f9so12650797pfc.11;
 Fri, 01 Jan 2021 08:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=zMk1HHaNQq59oP/bfokRrqrgZOpnz5nC9hUYNlOutOk=;
 b=YsLrUlBBwGvWza9ER6xd3QPsGBaEwGH46MFt/2PDW0bo63zkY630UFvNcsZnz+CZhG
 ixPdJHmXJB/CP8+jHT2HX4Yh5cDsLc/0e4jd23Ar/GsVavcBw/8jSTXeaYGhdlzsD/Va
 mtUPtWe6KFY0VcfsTKQx17a8St63DycAOhDAzAUp+6s+PVAaDQOtUpyMYm6Qy+ns25ku
 sk67s35sxxJzyBf3sikCxud5Mg+/8kgpJxhoLgEkuvHD7EMiAnlQ6zxShnpIaTPEibnt
 R462x5pCRR75WZm7LMrCZ15enOc0LoreXaU11ivuHqLoSxs1OjQ9pTv4qNQiMc0tTzRO
 Ehhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=zMk1HHaNQq59oP/bfokRrqrgZOpnz5nC9hUYNlOutOk=;
 b=sOhg3yw/Yonuk+Gmf2EaTFkMOGtgWAsGDV+1jqmEnsX3T5OVyrkgIiz8Gnhb3YShjw
 It+4+lbwsiTE7NZSdjfChRRCTUUr3ZXaPk69NBizIwaJSh9Yk5OnUd/NabFvs94tpBU3
 hV4305UFY/DZ9oo5qWYr5LruoBIeFvFXTXAd27lu80ZvxSuegVdXWPeORCIyS7AsWLQi
 MFrlFMVBzm8M7FqRde6Xkv0O0kCw2lZoRGpddR2WaQPgdQqvwiVLCICdXC//vbrO5UQu
 ItxFrjOxHJ5y5h9gLLXfcIyooOn6kmPywN9T+ZEj6/mC/VbiIb001azBHGTk7iFrJ55B
 Q6Dg==
X-Gm-Message-State: AOAM5334RwJ1+JRxoTIhN6KT32Ha3hBtvpIUcVw0WY9HBD84OL44dNYQ
 C+FXsl/HCOj632rOEsB59yU=
X-Google-Smtp-Source: ABdhPJwAj3nQP1cTQIYFKYJ1fKxSCAdTcONGX4hirdoKRWcSHLPi7nxrDGdGEO1mWKIregWdGNwtHg==
X-Received: by 2002:a63:3086:: with SMTP id
 w128mr25336753pgw.227.1609520226247; 
 Fri, 01 Jan 2021 08:57:06 -0800 (PST)
Received: from localhost.localdomain ([43.255.31.23])
 by smtp.gmail.com with ESMTPSA id 84sm50002729pfy.9.2021.01.01.08.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jan 2021 08:57:05 -0800 (PST)
From: Yangtao Li <tiny.windzz@gmail.com>
To: myungjoo.ham@samsung.com, kyungmin.park@samsung.com, cw00.choi@samsung.com,
 krzk@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 digetx@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
 yuq825@gmail.com, airlied@linux.ie, daniel@ffwll.ch, robdclark@gmail.com,
 sean@poorly.run, robh@kernel.org, tomeu.vizoso@collabora.com,
 steven.price@arm.com, alyssa.rosenzweig@collabora.com,
 stanimir.varbanov@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org, mchehab@kernel.org, lukasz.luba@arm.com,
 adrian.hunter@intel.com, ulf.hansson@linaro.org, vireshk@kernel.org,
 nm@ti.com, sboyd@kernel.org, broonie@kernel.org,
 gregkh@linuxfoundation.org, jirislaby@kernel.org, rjw@rjwysocki.net,
 jcrouse@codeaurora.org, hoegsberg@google.com, eric@anholt.net,
 tzimmermann@suse.de, marijn.suijten@somainline.org, gustavoars@kernel.org,
 emil.velikov@collabora.com, jonathan@marek.ca, akhilpo@codeaurora.org,
 smasetty@codeaurora.org, airlied@redhat.com, masneyb@onstation.org,
 kalyan_t@codeaurora.org, tanmay@codeaurora.org, tiny.windzz@gmail.com,
 ddavenport@chromium.org, jsanka@codeaurora.org, rnayak@codeaurora.org,
 tongtiangen@huawei.com, miaoqinglang@huawei.com, khsieh@codeaurora.org,
 abhinavk@codeaurora.org, chandanu@codeaurora.org, groeck@chromium.org,
 varar@codeaurora.org, mka@chromium.org, harigovi@codeaurora.org,
 rikard.falkeborn@gmail.com, natechancellor@gmail.com,
 georgi.djakov@linaro.org, akashast@codeaurora.org, parashar@codeaurora.org,
 dianders@chromium.org
Subject: [PATCH 07/31] serial: qcom_geni_serial: convert to use devm_pm_opp_*
 API
Date: Fri,  1 Jan 2021 16:54:43 +0000
Message-Id: <20210101165507.19486-8-tiny.windzz@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210101165507.19486-1-tiny.windzz@gmail.com>
References: <20210101165507.19486-1-tiny.windzz@gmail.com>
X-Mailman-Approved-At: Mon, 04 Jan 2021 08:39:01 +0000
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_pm_opp_* API to simplify code, and we don't need
to make opp_table glabal.

Let's remove opp_table from geni_se later.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
---
 drivers/tty/serial/qcom_geni_serial.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/tty/serial/qcom_geni_serial.c b/drivers/tty/serial/qcom_geni_serial.c
index 5aada7ebae35..36a92df8ec11 100644
--- a/drivers/tty/serial/qcom_geni_serial.c
+++ b/drivers/tty/serial/qcom_geni_serial.c
@@ -1352,6 +1352,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	int irq;
 	bool console = false;
 	struct uart_driver *drv;
+	struct opp_table *opp_table;
 
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,geni-debug-uart"))
 		console = true;
@@ -1433,13 +1434,13 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	if (of_property_read_bool(pdev->dev.of_node, "cts-rts-swap"))
 		port->cts_rts_swap = true;
 
-	port->se.opp_table = dev_pm_opp_set_clkname(&pdev->dev, "se");
-	if (IS_ERR(port->se.opp_table))
-		return PTR_ERR(port->se.opp_table);
+	opp_table = devm_pm_opp_set_clkname(&pdev->dev, "se");
+	if (IS_ERR(opp_table))
+		return PTR_ERR(opp_table);
 	/* OPP table is optional */
-	ret = dev_pm_opp_of_add_table(&pdev->dev);
+	ret = devm_pm_opp_of_add_table(&pdev->dev);
 	if (ret) {
-		dev_pm_opp_put_clkname(port->se.opp_table);
+		devm_pm_opp_put_clkname(&pdev->dev, opp_table);
 		if (ret != -ENODEV) {
 			dev_err(&pdev->dev, "invalid OPP table in device tree\n");
 			return ret;
@@ -1453,7 +1454,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 
 	ret = uart_add_one_port(drv, uport);
 	if (ret)
-		goto err;
+		return ret;
 
 	irq_set_status_flags(uport->irq, IRQ_NOAUTOEN);
 	ret = devm_request_irq(uport->dev, uport->irq, qcom_geni_serial_isr,
@@ -1461,7 +1462,7 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 	if (ret) {
 		dev_err(uport->dev, "Failed to get IRQ ret %d\n", ret);
 		uart_remove_one_port(drv, uport);
-		goto err;
+		return ret;
 	}
 
 	/*
@@ -1478,15 +1479,11 @@ static int qcom_geni_serial_probe(struct platform_device *pdev)
 		if (ret) {
 			device_init_wakeup(&pdev->dev, false);
 			uart_remove_one_port(drv, uport);
-			goto err;
+			return ret;
 		}
 	}
 
 	return 0;
-err:
-	dev_pm_opp_of_remove_table(&pdev->dev);
-	dev_pm_opp_put_clkname(port->se.opp_table);
-	return ret;
 }
 
 static int qcom_geni_serial_remove(struct platform_device *pdev)
@@ -1494,8 +1491,6 @@ static int qcom_geni_serial_remove(struct platform_device *pdev)
 	struct qcom_geni_serial_port *port = platform_get_drvdata(pdev);
 	struct uart_driver *drv = port->private_data.drv;
 
-	dev_pm_opp_of_remove_table(&pdev->dev);
-	dev_pm_opp_put_clkname(port->se.opp_table);
 	dev_pm_clear_wake_irq(&pdev->dev);
 	device_init_wakeup(&pdev->dev, false);
 	uart_remove_one_port(drv, &port->uport);
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
