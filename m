Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE43337DA0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 20:22:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABE926EBA8;
	Thu, 11 Mar 2021 19:21:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E1E46EBA8;
 Thu, 11 Mar 2021 19:21:53 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id n16so41668862lfb.4;
 Thu, 11 Mar 2021 11:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AJVgMRUFK3IzMuTMQ6MCF0NIQ5mxaF829M4Tu4JWudA=;
 b=RSJIhEIi9KkDFnqXQP7HofnjVfCK98cRETx3rRcdr03cSKYnyfcVjZ5EtXsjxuGnzC
 2mQT1vCNpP3G5h9lJ0zRsVneiynpjtFbkjR9qnvGfWyhVZKTDX5ibmCzOIHoY8ozMlVN
 aLtIHCjXjt3sXdN/fHpTa4EZEI9hlLq8u4YQHBhdjGqblo5RYnl1jZeFEG+4VvkxZQYh
 6MHOd+iPbPSOaAwmFw08d2TrsCoWt1AFCkqNdz8dOaGXY43gdQpDspGvT4G2Afn/WTMK
 oepu/2Sl959dqQlFG3crNTW9CJAlC+9DpJO/Lhv0v9wl98N2U9gaQSFvoXgyfWu2u24R
 /rCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AJVgMRUFK3IzMuTMQ6MCF0NIQ5mxaF829M4Tu4JWudA=;
 b=YIamSby7pSL5ii2BZknrCYN2CFR5FMgNLsxE7H0tK13+kErUjDrPb5nAYtjcZGKqo9
 9Tob2flKRlu1ZATkV3zuMjzYIrT9k4oPCerO+jhT317zXlX8Lpt3aZSdlQVN8V8iUPKD
 HGVpCXQwUNGTY9mFGuAeErLSW2/qkDIK89dmL4OLsbYcE37ihvvmVLlmQGJ2R8FZXml+
 mlGOK20hQQqZf8aFQuxWJmvYGBamy07gkMXEmzv8L8zKEkyOW00yJU/UOy1PDiFYhwsv
 X4U5kfLWQJyLK9ZGvS9FiwZYNgIqbZ5E7gAlsTfudvP+GHzcozrWm1PQQXuNF3jkFq5H
 SFGg==
X-Gm-Message-State: AOAM530TSuYHP9KLpnW4rrB1qsaRiKX+ZleJvABCnP279iNgwJysldGO
 Jxdr6hBe6GZkVmB5HoyR2wQ=
X-Google-Smtp-Source: ABdhPJz1/B25aEhO0U7hCu5XBi0HOfk9HruSzaDgVjYAuZ9+GH7PO6t9RE9gOAUni2yWB4XWCKFKlw==
X-Received: by 2002:a05:6512:22c2:: with SMTP id
 g2mr3242058lfu.634.1615490511532; 
 Thu, 11 Mar 2021 11:21:51 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id u14sm1121153lfl.40.2021.03.11.11.21.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 11:21:51 -0800 (PST)
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
Subject: [PATCH v2 12/14] drm/panfrost: Convert to use resource-managed OPP API
Date: Thu, 11 Mar 2021 22:21:03 +0300
Message-Id: <20210311192105.14998-13-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210311192105.14998-1-digetx@gmail.com>
References: <20210311192105.14998-1-digetx@gmail.com>
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
Reviewed-by: Steven Price <steven.price@arm.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 33 +++++----------------
 drivers/gpu/drm/panfrost/panfrost_devfreq.h |  1 -
 2 files changed, 8 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 56b3f5935703..eeb50c55c472 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -93,25 +93,23 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	struct thermal_cooling_device *cooling;
 	struct panfrost_devfreq *pfdevfreq = &pfdev->pfdevfreq;
 
-	opp_table = dev_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
-					      pfdev->comp->num_supplies);
+	opp_table = devm_pm_opp_set_regulators(dev, pfdev->comp->supply_names,
+					       pfdev->comp->num_supplies);
 	if (IS_ERR(opp_table)) {
 		ret = PTR_ERR(opp_table);
 		/* Continue if the optional regulator is missing */
 		if (ret != -ENODEV) {
 			DRM_DEV_ERROR(dev, "Couldn't set OPP regulators\n");
-			goto err_fini;
+			return ret;
 		}
-	} else {
-		pfdevfreq->regulators_opp_table = opp_table;
 	}
 
-	ret = dev_pm_opp_of_add_table(dev);
+	ret = devm_pm_opp_of_add_table(dev);
 	if (ret) {
 		/* Optional, continue without devfreq */
 		if (ret == -ENODEV)
 			ret = 0;
-		goto err_fini;
+		return ret;
 	}
 	pfdevfreq->opp_of_table_added = true;
 
@@ -122,10 +120,8 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	cur_freq = clk_get_rate(pfdev->clock);
 
 	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
-	if (IS_ERR(opp)) {
-		ret = PTR_ERR(opp);
-		goto err_fini;
-	}
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
 
 	panfrost_devfreq_profile.initial_freq = cur_freq;
 	dev_pm_opp_put(opp);
@@ -134,8 +130,7 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 					  DEVFREQ_GOV_SIMPLE_ONDEMAND, NULL);
 	if (IS_ERR(devfreq)) {
 		DRM_DEV_ERROR(dev, "Couldn't initialize GPU devfreq\n");
-		ret = PTR_ERR(devfreq);
-		goto err_fini;
+		return PTR_ERR(devfreq);
 	}
 	pfdevfreq->devfreq = devfreq;
 
@@ -146,10 +141,6 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 		pfdevfreq->cooling = cooling;
 
 	return 0;
-
-err_fini:
-	panfrost_devfreq_fini(pfdev);
-	return ret;
 }
 
 void panfrost_devfreq_fini(struct panfrost_device *pfdev)
@@ -160,14 +151,6 @@ void panfrost_devfreq_fini(struct panfrost_device *pfdev)
 		devfreq_cooling_unregister(pfdevfreq->cooling);
 		pfdevfreq->cooling = NULL;
 	}
-
-	if (pfdevfreq->opp_of_table_added) {
-		dev_pm_opp_of_remove_table(&pfdev->pdev->dev);
-		pfdevfreq->opp_of_table_added = false;
-	}
-
-	dev_pm_opp_put_regulators(pfdevfreq->regulators_opp_table);
-	pfdevfreq->regulators_opp_table = NULL;
 }
 
 void panfrost_devfreq_resume(struct panfrost_device *pfdev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.h b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
index db6ea48e21f9..a51854cc8c06 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.h
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.h
@@ -15,7 +15,6 @@ struct panfrost_device;
 
 struct panfrost_devfreq {
 	struct devfreq *devfreq;
-	struct opp_table *regulators_opp_table;
 	struct thermal_cooling_device *cooling;
 	bool opp_of_table_added;
 
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
