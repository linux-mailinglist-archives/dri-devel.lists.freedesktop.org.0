Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB459337D9D
	for <lists+dri-devel@lfdr.de>; Thu, 11 Mar 2021 20:22:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09B1B6EB7B;
	Thu, 11 Mar 2021 19:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1DDF6EB97;
 Thu, 11 Mar 2021 19:21:51 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id 16so3611146ljc.11;
 Thu, 11 Mar 2021 11:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uc9ZALbRUJDMgYtD3gAPlsGo1E9Iwuohij5k/aUeCLE=;
 b=syQeyblUfTJg4JpWTbFs8HLjaJ3BGg7i2g2f4FcM8ZzmdlyVndH9X7IfLw2xu+Y0bo
 utO22qgs972TtNQl4kbRxJP3WVaE7O9VMxx2o5RIWsbABE2oyD1Wd65tpDs/5wBNNUZW
 Nv5ghPpqbeZuwWwM+ShXcSV8xUVkAlRkPfyFRbnOIv2rdNH1Qlmqz3wYhKnIKWX0zNsO
 jL7/JGV5h9/E1szuBeGX0f2FfYg8+FTkO75aAIESztji/VzaDGwvsssBFaxE1qBrTaVX
 iWktzP1mKnKbY+wHgVF1LdeNhn8TqoUzX3t8eejjrIJkxInwFeNnFGvsprW5BwzsG48k
 Q/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uc9ZALbRUJDMgYtD3gAPlsGo1E9Iwuohij5k/aUeCLE=;
 b=a1+yAoQilgpWUXePTSmjZrTKsaQKr2DB4XyudBXifetTYI+UkdNekrKWgbEzfYfKH7
 XUPMC/D2/rzCJEZPN/bY/ATzBgepF6mLDR89aO5Sho5v5aaR18+/sxNSCxdSTErVBeqb
 vv3JJu5KNltqd20qTRi05w56STNDZSQcLO081ghnqB8bBEAAA4adazeUOh4LC7Iibdz6
 AOBlds83nnrmVOqCoAUWcTk5FskSsNSDMbpKX1GIi1qGzHC7B4quQmhb2DgXmRHLddeX
 m/1xm6SrG74C2Um88NvRAN0Myfe3g3EsEypFDBvgN152R3c1l7vek3nN6DhBD1qGiXJ5
 zDJA==
X-Gm-Message-State: AOAM531B7Q4MuNbnLf4WOAVuoxIAjP7RXC1aAD+T/rSmC5D7GHG5ypFF
 R9Zsq9g1wvjKXhhsB+ntIEI=
X-Google-Smtp-Source: ABdhPJwl3cbaBkrbMQqiy6UhEUt/4qPCholtPNloxB9pCiVO6vExsJJS2v+XJQMsEJeUu2CDyzSOhg==
X-Received: by 2002:a2e:6e1a:: with SMTP id j26mr220588ljc.171.1615490510286; 
 Thu, 11 Mar 2021 11:21:50 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id u14sm1121153lfl.40.2021.03.11.11.21.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Mar 2021 11:21:50 -0800 (PST)
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
Subject: [PATCH v2 11/14] drm/lima: Convert to use resource-managed OPP API
Date: Thu, 11 Mar 2021 22:21:02 +0300
Message-Id: <20210311192105.14998-12-digetx@gmail.com>
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
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/lima/lima_devfreq.c | 43 ++++++++---------------------
 drivers/gpu/drm/lima/lima_devfreq.h |  2 --
 2 files changed, 11 insertions(+), 34 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
index 5686ad4aaf7c..e3ccaf269892 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.c
+++ b/drivers/gpu/drm/lima/lima_devfreq.c
@@ -99,13 +99,6 @@ void lima_devfreq_fini(struct lima_device *ldev)
 		devm_devfreq_remove_device(ldev->dev, devfreq->devfreq);
 		devfreq->devfreq = NULL;
 	}
-
-	dev_pm_opp_of_remove_table(ldev->dev);
-
-	dev_pm_opp_put_regulators(devfreq->regulators_opp_table);
-	dev_pm_opp_put_clkname(devfreq->clkname_opp_table);
-	devfreq->regulators_opp_table = NULL;
-	devfreq->clkname_opp_table = NULL;
 }
 
 int lima_devfreq_init(struct lima_device *ldev)
@@ -125,40 +118,31 @@ int lima_devfreq_init(struct lima_device *ldev)
 
 	spin_lock_init(&ldevfreq->lock);
 
-	opp_table = dev_pm_opp_set_clkname(dev, "core");
-	if (IS_ERR(opp_table)) {
-		ret = PTR_ERR(opp_table);
-		goto err_fini;
-	}
-
-	ldevfreq->clkname_opp_table = opp_table;
+	opp_table = devm_pm_opp_set_clkname(dev, "core");
+	if (IS_ERR(opp_table))
+		return PTR_ERR(opp_table);
 
-	opp_table = dev_pm_opp_set_regulators(dev,
-					      (const char *[]){ "mali" },
-					      1);
+	opp_table = devm_pm_opp_set_regulators(dev, (const char *[]){ "mali" },
+					       1);
 	if (IS_ERR(opp_table)) {
 		ret = PTR_ERR(opp_table);
 
 		/* Continue if the optional regulator is missing */
 		if (ret != -ENODEV)
-			goto err_fini;
-	} else {
-		ldevfreq->regulators_opp_table = opp_table;
+			return ret;
 	}
 
-	ret = dev_pm_opp_of_add_table(dev);
+	ret = devm_pm_opp_of_add_table(dev);
 	if (ret)
-		goto err_fini;
+		return ret;
 
 	lima_devfreq_reset(ldevfreq);
 
 	cur_freq = clk_get_rate(ldev->clk_gpu);
 
 	opp = devfreq_recommended_opp(dev, &cur_freq, 0);
-	if (IS_ERR(opp)) {
-		ret = PTR_ERR(opp);
-		goto err_fini;
-	}
+	if (IS_ERR(opp))
+		return PTR_ERR(opp);
 
 	lima_devfreq_profile.initial_freq = cur_freq;
 	dev_pm_opp_put(opp);
@@ -167,8 +151,7 @@ int lima_devfreq_init(struct lima_device *ldev)
 					  DEVFREQ_GOV_SIMPLE_ONDEMAND, NULL);
 	if (IS_ERR(devfreq)) {
 		dev_err(dev, "Couldn't initialize GPU devfreq\n");
-		ret = PTR_ERR(devfreq);
-		goto err_fini;
+		return PTR_ERR(devfreq);
 	}
 
 	ldevfreq->devfreq = devfreq;
@@ -180,10 +163,6 @@ int lima_devfreq_init(struct lima_device *ldev)
 		ldevfreq->cooling = cooling;
 
 	return 0;
-
-err_fini:
-	lima_devfreq_fini(ldev);
-	return ret;
 }
 
 void lima_devfreq_record_busy(struct lima_devfreq *devfreq)
diff --git a/drivers/gpu/drm/lima/lima_devfreq.h b/drivers/gpu/drm/lima/lima_devfreq.h
index 2d9b3008ce77..c3bcae76ca07 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.h
+++ b/drivers/gpu/drm/lima/lima_devfreq.h
@@ -15,8 +15,6 @@ struct lima_device;
 
 struct lima_devfreq {
 	struct devfreq *devfreq;
-	struct opp_table *clkname_opp_table;
-	struct opp_table *regulators_opp_table;
 	struct thermal_cooling_device *cooling;
 
 	ktime_t busy_time;
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
