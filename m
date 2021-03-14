Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D70B533A60C
	for <lists+dri-devel@lfdr.de>; Sun, 14 Mar 2021 17:34:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86DD6E08C;
	Sun, 14 Mar 2021 16:34:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F9FC6E098;
 Sun, 14 Mar 2021 16:34:56 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id a18so7450275wrc.13;
 Sun, 14 Mar 2021 09:34:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PhE/K8bjASn8uLSTMIHNbfNHkAkLrKT1OIOAoWkyNMs=;
 b=JlbqBDD6VH/xWHNATviIFRij7A1yTX/41RQ/gP5liwDY6o/bg43TnBdFfp1r4AfeHn
 vqpZOQsiUZt5zb4LqGLSF+hHfse5JOEUSoFUbG7/b7O9b2S+Ck7qKiZThLyHnx8NPDDb
 lmsMv+BsRqy+gizrUv7fElmmg53XiF9Zf4EJpvL3lmXaz8YxEU5vNgYAZyWhOTbaJ45i
 L/AOuhvBNZPymMXp0fxCOQ2wT1OTpbGhWb1RHD0H8i3LEfb7FjXK51U34hepv7B1yL2G
 zalBwYmPXFohPra/kB5NUb8QCHLK3jovNlYwiiYGAUzWz1i8iikcKrbriuWTtrHGvUue
 7mAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PhE/K8bjASn8uLSTMIHNbfNHkAkLrKT1OIOAoWkyNMs=;
 b=pSqUeft6hCLMFLVemgw5RRJITJWBM2fiuMykh2JEpzjmK/JDmZi4xOH6jRHNTAw+6y
 NceV7QfskpDxc3LkSJBnwlII0C/db6vjUm4YzRYI1wljMkiJ+MIcwTcwqpQA5v0RZ5dW
 fasiy7Luf1sDNVn1NZgaUfG6OHGUWitdMm9XbyDIl/AUHV4864MlNQYcLDS8ycfw9xic
 LEZCuuw9e3vSey++QdGFMrkVLy0oUDm2FyzURSQH9mZHlbIwkWscH/Jhd55Ktt55rdPK
 tAn7VNT5Zt5soQIRHMDwVbcJ7f7Hph0ebOZt2WiUARVsnQk2Ddq7f1XEuQbdfLdHMy5M
 u+Bw==
X-Gm-Message-State: AOAM533tkDWfoOOm5FvTOIUk2/HA5TdB/NQUDzCcFDyIUS+tjf8gTBcM
 HSLNCOvT2UTqswaTS/nv8ag=
X-Google-Smtp-Source: ABdhPJykydbD1QSNBzjvynpExNSxqOmcvB2KV3huIvD7l9+VLK0Psklcp/ruNZ1u/a5qgp+/3m9sfw==
X-Received: by 2002:a05:6000:192:: with SMTP id
 p18mr23372896wrx.403.1615739695119; 
 Sun, 14 Mar 2021 09:34:55 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru.
 [109.252.193.52])
 by smtp.gmail.com with ESMTPSA id o7sm15723239wrs.16.2021.03.14.09.34.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 09:34:54 -0700 (PDT)
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
Subject: [PATCH v3 12/15] drm/lima: Convert to use resource-managed OPP API
Date: Sun, 14 Mar 2021 19:34:05 +0300
Message-Id: <20210314163408.22292-13-digetx@gmail.com>
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
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/lima/lima_devfreq.c | 47 +++++++----------------------
 drivers/gpu/drm/lima/lima_devfreq.h |  3 --
 2 files changed, 11 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_devfreq.c b/drivers/gpu/drm/lima/lima_devfreq.c
index 5686ad4aaf7c..dbc1d1eb9543 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.c
+++ b/drivers/gpu/drm/lima/lima_devfreq.c
@@ -99,20 +99,12 @@ void lima_devfreq_fini(struct lima_device *ldev)
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
 {
 	struct thermal_cooling_device *cooling;
 	struct device *dev = ldev->dev;
-	struct opp_table *opp_table;
 	struct devfreq *devfreq;
 	struct lima_devfreq *ldevfreq = &ldev->devfreq;
 	struct dev_pm_opp *opp;
@@ -125,40 +117,28 @@ int lima_devfreq_init(struct lima_device *ldev)
 
 	spin_lock_init(&ldevfreq->lock);
 
-	opp_table = dev_pm_opp_set_clkname(dev, "core");
-	if (IS_ERR(opp_table)) {
-		ret = PTR_ERR(opp_table);
-		goto err_fini;
-	}
-
-	ldevfreq->clkname_opp_table = opp_table;
-
-	opp_table = dev_pm_opp_set_regulators(dev,
-					      (const char *[]){ "mali" },
-					      1);
-	if (IS_ERR(opp_table)) {
-		ret = PTR_ERR(opp_table);
+	ret = devm_pm_opp_set_clkname(dev, "core");
+	if (ret)
+		return ret;
 
+	ret = devm_pm_opp_set_regulators(dev, (const char *[]){ "mali" }, 1);
+	if (ret) {
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
@@ -167,8 +147,7 @@ int lima_devfreq_init(struct lima_device *ldev)
 					  DEVFREQ_GOV_SIMPLE_ONDEMAND, NULL);
 	if (IS_ERR(devfreq)) {
 		dev_err(dev, "Couldn't initialize GPU devfreq\n");
-		ret = PTR_ERR(devfreq);
-		goto err_fini;
+		return PTR_ERR(devfreq);
 	}
 
 	ldevfreq->devfreq = devfreq;
@@ -180,10 +159,6 @@ int lima_devfreq_init(struct lima_device *ldev)
 		ldevfreq->cooling = cooling;
 
 	return 0;
-
-err_fini:
-	lima_devfreq_fini(ldev);
-	return ret;
 }
 
 void lima_devfreq_record_busy(struct lima_devfreq *devfreq)
diff --git a/drivers/gpu/drm/lima/lima_devfreq.h b/drivers/gpu/drm/lima/lima_devfreq.h
index 2d9b3008ce77..688ee71e263a 100644
--- a/drivers/gpu/drm/lima/lima_devfreq.h
+++ b/drivers/gpu/drm/lima/lima_devfreq.h
@@ -8,15 +8,12 @@
 #include <linux/ktime.h>
 
 struct devfreq;
-struct opp_table;
 struct thermal_cooling_device;
 
 struct lima_device;
 
 struct lima_devfreq {
 	struct devfreq *devfreq;
-	struct opp_table *clkname_opp_table;
-	struct opp_table *regulators_opp_table;
 	struct thermal_cooling_device *cooling;
 
 	ktime_t busy_time;
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
