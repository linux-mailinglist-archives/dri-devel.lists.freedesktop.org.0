Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D1233A60A
	for <lists+dri-devel@lfdr.de>; Sun, 14 Mar 2021 17:34:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C102089FED;
	Sun, 14 Mar 2021 16:34:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1559B89FED;
 Sun, 14 Mar 2021 16:34:50 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id v11so4490645wro.7;
 Sun, 14 Mar 2021 09:34:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gbw+Rc1RCI0Y3s+TLqxAUCfojdebzXyiUkV92Pla9uQ=;
 b=CHUhQMOY8SZwVo+F0SA+pV7IE73Qkpv8I/oDmA+M+JXPvxhX0I2Lqqalwp5dK5Lt9n
 gaZfSV1O+Y4fpf85zBne8oRYD6GkwYLbrJ45NWodBwl4AFVr2LMpO+x8yVGyIyuVCNtF
 +A1v5n4HpGv5RRk7BdZ8RBMYBFXByzBufZgdi1jxHkklbuSg88u0ARfbehoXBd6pcmfB
 Ush5FdcBnb5tOT92D9Oqq7xLdP9B3iqWHgwTSsKf/FMPHzKAKQ4JVJcjkOmcb/pJeMMO
 vFujXneJiegHG7hgBx1vGaEWvCOvope9ET/4XbVs0Jn1BZ1j8y94BDwZ16FL3LVFhLGX
 8sVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gbw+Rc1RCI0Y3s+TLqxAUCfojdebzXyiUkV92Pla9uQ=;
 b=o3ilsYgA0mRKE2zOGqPhPLRO4ttGRm957mRqbuhjefgSxYwshqvxICK1KOtjzLSwSm
 enbO4E4S1YxxAhnzwGhHNjIf+qA1s/22Bw93limkFWGSBa+Jr8h0g/f+lyo4yzeZbchR
 RPmfBZow6QJ5zKPC2Z8A3MZunNxAtHC4lw7jp3R27nsUL05f+p7he3wsoKDJ+AsqOlGY
 mWyNbA61xgBNrvIVmUEqZ5S0i080nv/zn5xz7OdknV/ns//Dzh8NXgh5hnQpQFT6nAkv
 xJyN7xXKlbkYCapLSW6Ai/8vHWhKuqayGFGjS4ds5G3u6DDmPmnlyJXhTDVATXywZlQE
 85aA==
X-Gm-Message-State: AOAM533FDrDiYuclT5NztIksVTQxI6oknx/MBqstc8xfezoOmcpk0C61
 aqPtEy74KzJrs0jyr6IaXbE=
X-Google-Smtp-Source: ABdhPJwittQM+2OpIIzVYUjKc3KCiZLlqN1EcIvKXJnc7fVVXF8K+vQIz9r147YJ8DNuoBWWHq/6Bw==
X-Received: by 2002:a5d:43c5:: with SMTP id v5mr18951856wrr.265.1615739688805; 
 Sun, 14 Mar 2021 09:34:48 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id o7sm15723239wrs.16.2021.03.14.09.34.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 09:34:48 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Qiang Yu <yuq825@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Rob Herring <robh@kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Stanimir Varbanov <stanimir.varbanov@linaro.org>,
 Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Lukasz Luba <lukasz.luba@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH v3 09/15] spi: spi-qcom-qspi: Convert to use resource-managed
 OPP API
Date: Sun, 14 Mar 2021 19:34:02 +0300
Message-Id: <20210314163408.22292-10-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210314163408.22292-1-digetx@gmail.com>
References: <20210314163408.22292-1-digetx@gmail.com>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-serial@vger.kernel.org,
 lima@lists.freedesktop.org, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-spi@vger.kernel.org, linux-tegra@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yangtao Li <tiny.windzz@gmail.com>

Use resource-managed OPP API to simplify code.

Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>
Acked-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/spi/spi-qcom-qspi.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
index 1dbcc410cd35..c334dfec4117 100644
--- a/drivers/spi/spi-qcom-qspi.c
+++ b/drivers/spi/spi-qcom-qspi.c
@@ -142,7 +142,6 @@ struct qcom_qspi {
 	struct clk_bulk_data *clks;
 	struct qspi_xfer xfer;
 	struct icc_path *icc_path_cpu_to_qspi;
-	struct opp_table *opp_table;
 	unsigned long last_speed;
 	/* Lock to protect data accessed by IRQs */
 	spinlock_t lock;
@@ -530,14 +529,14 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 	master->handle_err = qcom_qspi_handle_err;
 	master->auto_runtime_pm = true;
 
-	ctrl->opp_table = dev_pm_opp_set_clkname(&pdev->dev, "core");
-	if (IS_ERR(ctrl->opp_table))
-		return PTR_ERR(ctrl->opp_table);
+	ret = devm_pm_opp_set_clkname(&pdev->dev, "core");
+	if (ret)
+		return ret;
 	/* OPP table is optional */
-	ret = dev_pm_opp_of_add_table(&pdev->dev);
+	ret = devm_pm_opp_of_add_table(&pdev->dev);
 	if (ret && ret != -ENODEV) {
 		dev_err(&pdev->dev, "invalid OPP table in device tree\n");
-		goto exit_probe_put_clkname;
+		return ret;
 	}
 
 	pm_runtime_use_autosuspend(dev);
@@ -549,10 +548,6 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 		return 0;
 
 	pm_runtime_disable(dev);
-	dev_pm_opp_of_remove_table(&pdev->dev);
-
-exit_probe_put_clkname:
-	dev_pm_opp_put_clkname(ctrl->opp_table);
 
 	return ret;
 }
@@ -560,14 +555,11 @@ static int qcom_qspi_probe(struct platform_device *pdev)
 static int qcom_qspi_remove(struct platform_device *pdev)
 {
 	struct spi_master *master = platform_get_drvdata(pdev);
-	struct qcom_qspi *ctrl = spi_master_get_devdata(master);
 
 	/* Unregister _before_ disabling pm_runtime() so we stop transfers */
 	spi_unregister_master(master);
 
 	pm_runtime_disable(&pdev->dev);
-	dev_pm_opp_of_remove_table(&pdev->dev);
-	dev_pm_opp_put_clkname(ctrl->opp_table);
 
 	return 0;
 }
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
