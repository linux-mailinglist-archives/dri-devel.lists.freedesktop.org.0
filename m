Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C844544FAA3
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 20:37:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F42216E8BC;
	Sun, 14 Nov 2021 19:36:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B986E87B
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 19:36:12 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id c32so37575829lfv.4
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 11:36:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z5LZNzGJpLsApxqpURZGyur77JxFewe+cdR7kou+Iuc=;
 b=qmZz34wSh7u9dpKcs7jjNaOLOzbV2HaJkselRvIcb5m4ECncO8n6gjyzaDtheiKqq4
 iKudJUQ48V0w7/2y5vAwZNT+9t05V3D5q3Cswe4mszHsaBJKVbbm1YOkLWAVU6sJ7NNM
 YVJCct5KhZ9RA7+E2b+XIeFmVqyQQMPlHO5xb7RPtb5Kft2cTeAFC0CGoFQbj1O0Lztc
 FV3rZqQutBFNaZaZ7BYrhPnrpHJ+3j+VP91/nSefV1gHXlcYTDhTDKBdyPW3YCW+Ax8y
 uNRIWx1HFgS9GVs6pQJgKCmkUwCD0cmiarkmfvQ+KJoTYXcHOdtxiJ/Wub6Vi/UoeFfs
 yJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z5LZNzGJpLsApxqpURZGyur77JxFewe+cdR7kou+Iuc=;
 b=mnpPddgXfUiNPhbLUlcORd/SWdRIYw4n4VnKukT0iVP5MfaPd8XWvWR8hmkX96lB+r
 O/8ZEzulaXRMWJZiCu6X3XtflxsoCJE+RkUxLryZtb3vqhvbCvmu5M0oQsvept7wbtAC
 XlPVxi08mpgACAY1jVo6SGfUVagJI6TjVux3DJOTZbEfODHmQxFbXSbF4EB35OBj3XvF
 193Ps31EjpHTU9hqLD+b3LHUerzkdK9A835NkVqVuCh6vTuE6V4XjySxoBfZZut+Qey5
 H78SPYC4OYnkJjk4laM8J6kFot0I9a+C4KOEldgtIdNm6uy+P7gu9wYdzF/+/3ck/UR9
 HYfA==
X-Gm-Message-State: AOAM533O1ma9rpsphQXeJzLNpitccXi3v0tn+3nQHhd6dsvVfmcMElEX
 88DVdQT8IDi/uQVdUC52qdY=
X-Google-Smtp-Source: ABdhPJzHcx/oQdmNE+7tf2qpDNOBRjQYKFGCCSffWCINlASE9wLhUWY/zBszI1SZMZN2XEG8jP3Vzw==
X-Received: by 2002:a05:6512:39c4:: with SMTP id
 k4mr28631313lfu.79.1636918571054; 
 Sun, 14 Nov 2021 11:36:11 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id p18sm1191280lfu.127.2021.11.14.11.36.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 11:36:10 -0800 (PST)
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
Subject: [PATCH v15 15/39] drm/tegra: nvdec: Stop channel on suspend
Date: Sun, 14 Nov 2021 22:34:11 +0300
Message-Id: <20211114193435.7705-16-digetx@gmail.com>
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

CDMA must be stopped before hardware is suspended. Add channel stopping
to RPM suspend callback. Add system level suspend-resume callbacks.

Runtime PM initialization is moved to host1x client init phase because
RPM callback now uses host1x channel that is available only when host1x
client is registered.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/nvdec.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index 791bf1acf5f0..15f036e09e5c 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -113,9 +113,13 @@ static int nvdec_init(struct host1x_client *client)
 		goto free_channel;
 	}
 
+	pm_runtime_enable(client->dev);
+	pm_runtime_use_autosuspend(client->dev);
+	pm_runtime_set_autosuspend_delay(client->dev, 500);
+
 	err = tegra_drm_register_client(tegra, drm);
 	if (err < 0)
-		goto free_syncpt;
+		goto disable_rpm;
 
 	/*
 	 * Inherit the DMA parameters (such as maximum segment size) from the
@@ -125,7 +129,10 @@ static int nvdec_init(struct host1x_client *client)
 
 	return 0;
 
-free_syncpt:
+disable_rpm:
+	pm_runtime_dont_use_autosuspend(client->dev);
+	pm_runtime_force_suspend(client->dev);
+
 	host1x_syncpt_put(client->syncpts[0]);
 free_channel:
 	host1x_channel_put(nvdec->channel);
@@ -150,10 +157,15 @@ static int nvdec_exit(struct host1x_client *client)
 	if (err < 0)
 		return err;
 
+	pm_runtime_dont_use_autosuspend(client->dev);
+	pm_runtime_force_suspend(client->dev);
+
 	host1x_syncpt_put(client->syncpts[0]);
 	host1x_channel_put(nvdec->channel);
 	host1x_client_iommu_detach(client);
 
+	nvdec->channel = NULL;
+
 	if (client->group) {
 		dma_unmap_single(nvdec->dev, nvdec->falcon.firmware.phys,
 				 nvdec->falcon.firmware.size, DMA_TO_DEVICE);
@@ -268,6 +280,8 @@ static __maybe_unused int nvdec_runtime_suspend(struct device *dev)
 {
 	struct nvdec *nvdec = dev_get_drvdata(dev);
 
+	host1x_channel_stop(nvdec->channel);
+
 	clk_disable_unprepare(nvdec->clk);
 
 	return 0;
@@ -412,10 +426,6 @@ static int nvdec_probe(struct platform_device *pdev)
 		goto exit_falcon;
 	}
 
-	pm_runtime_enable(&pdev->dev);
-	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
-	pm_runtime_use_autosuspend(&pdev->dev);
-
 	return 0;
 
 exit_falcon:
@@ -436,11 +446,6 @@ static int nvdec_remove(struct platform_device *pdev)
 		return err;
 	}
 
-	if (pm_runtime_enabled(&pdev->dev))
-		pm_runtime_disable(&pdev->dev);
-	else
-		nvdec_runtime_suspend(&pdev->dev);
-
 	falcon_exit(&nvdec->falcon);
 
 	return 0;
@@ -448,6 +453,8 @@ static int nvdec_remove(struct platform_device *pdev)
 
 static const struct dev_pm_ops nvdec_pm_ops = {
 	SET_RUNTIME_PM_OPS(nvdec_runtime_suspend, nvdec_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 struct platform_driver tegra_nvdec_driver = {
-- 
2.33.1

