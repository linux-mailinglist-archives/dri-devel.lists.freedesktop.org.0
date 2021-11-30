Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E88834642A1
	for <lists+dri-devel@lfdr.de>; Wed,  1 Dec 2021 00:24:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D14F56E81D;
	Tue, 30 Nov 2021 23:24:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B94756E828
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 23:24:11 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id l22so57903399lfg.7
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 15:24:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uQ5jO8IglZlUMaRNPcN9PUVJW42EUXyxCQcfBM+SAVk=;
 b=dvSJo7xzm1eJfh0VhPIQ/ualcGjwUWikpagcRiIdb/9jusqbHGcZerkLtz1ZR/PH+I
 8hLAVLcT3AidmYxrQBDRtN7EJc6oTN8OHngaw7f9SOcu69vky6Th3Sw2lkuDoktXtKOA
 lJpRgMAph56ewr+hUE0DsKQ5Ton6qQpe89Fqt71e7gjM3+eLU633Opqf+Jg4t6F3b4h+
 b1hJ+nKbZ0p3rUID87bFVhOwzcsbJn1TFrRyT8d0tRJNKTM0wNrp9183PmTGcokb4CX9
 QVaT6hSE9qArRqYZp2gNMntxcMuARDZ9FmYe+YmvkONRNAtJEfk7A7mI9PB/x45b9cIC
 GSXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uQ5jO8IglZlUMaRNPcN9PUVJW42EUXyxCQcfBM+SAVk=;
 b=7hDr+U06oh4gvziLp0f5l5cTNdRKbt+GpkVHbX6iBZ5YOADy8HyZMeLeZH2zOCYwry
 okpgfYcCmlpi4miBycmZgNM0cFz6MXpfUpLychldh+IH5/8HJORkJsqI38DkSQ80KB8u
 +YB9JIIba5Khe3jmwLD1H9z0lWpfFl2YjI7jaXxSOTrv/nc6UwRwKQtYavnHS1ZjMXkt
 MVwsjHZ61TzPrfyM9qF6GHaVpZcK4oMsnDlGHVQhPtHvODmrycxP2/q+73nQFnPdZv+c
 nbFMiRjFkRmI/QmE7o0coU86T3A1sAB6L/7FbU8qtR9Po3BWx6xDFNz5k77oRPomJ4g0
 fluQ==
X-Gm-Message-State: AOAM5319UsTHztoW/KbJVfkuSwZoRzt/w2hdFR6y/8cscxGIuAevtEPx
 YEnysVOP016F4PP1N63anUU=
X-Google-Smtp-Source: ABdhPJyTRdX5wiYTmVoFjF4P8647/2ZqIvFbX6o0+UgUnk0xxvSu3+zbffENKNhFeInBCsH5zfNFjg==
X-Received: by 2002:a05:6512:234d:: with SMTP id
 p13mr2248990lfu.505.1638314649852; 
 Tue, 30 Nov 2021 15:24:09 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id x199sm1860735lff.284.2021.11.30.15.24.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 15:24:09 -0800 (PST)
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
Subject: [PATCH v16 15/40] drm/tegra: vic: Stop channel on suspend
Date: Wed,  1 Dec 2021 02:23:22 +0300
Message-Id: <20211130232347.950-16-digetx@gmail.com>
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

CDMA must be stopped before hardware is suspended. Add channel stopping
to RPM suspend callback. Add system level suspend-resume callbacks.

Runtime PM initialization is moved to host1x client init phase because
RPM callback now uses host1x channel that is available only when host1x
client is registered.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/vic.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index b58e2b99f81a..9622ca96c539 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -151,9 +151,13 @@ static int vic_init(struct host1x_client *client)
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
@@ -163,7 +167,10 @@ static int vic_init(struct host1x_client *client)
 
 	return 0;
 
-free_syncpt:
+disable_rpm:
+	pm_runtime_dont_use_autosuspend(client->dev);
+	pm_runtime_force_suspend(client->dev);
+
 	host1x_syncpt_put(client->syncpts[0]);
 free_channel:
 	host1x_channel_put(vic->channel);
@@ -188,10 +195,15 @@ static int vic_exit(struct host1x_client *client)
 	if (err < 0)
 		return err;
 
+	pm_runtime_dont_use_autosuspend(client->dev);
+	pm_runtime_force_suspend(client->dev);
+
 	host1x_syncpt_put(client->syncpts[0]);
 	host1x_channel_put(vic->channel);
 	host1x_client_iommu_detach(client);
 
+	vic->channel = NULL;
+
 	if (client->group) {
 		dma_unmap_single(vic->dev, vic->falcon.firmware.phys,
 				 vic->falcon.firmware.size, DMA_TO_DEVICE);
@@ -315,6 +327,8 @@ static int vic_runtime_suspend(struct device *dev)
 	struct vic *vic = dev_get_drvdata(dev);
 	int err;
 
+	host1x_channel_stop(vic->channel);
+
 	err = reset_control_assert(vic->rst);
 	if (err < 0)
 		return err;
@@ -482,19 +496,8 @@ static int vic_probe(struct platform_device *pdev)
 		goto exit_falcon;
 	}
 
-	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev)) {
-		err = vic_runtime_resume(&pdev->dev);
-		if (err < 0)
-			goto unregister_client;
-	}
-	pm_runtime_set_autosuspend_delay(&pdev->dev, 500);
-	pm_runtime_use_autosuspend(&pdev->dev);
-
 	return 0;
 
-unregister_client:
-	host1x_client_unregister(&vic->client.base);
 exit_falcon:
 	falcon_exit(&vic->falcon);
 
@@ -513,11 +516,6 @@ static int vic_remove(struct platform_device *pdev)
 		return err;
 	}
 
-	if (pm_runtime_enabled(&pdev->dev))
-		pm_runtime_disable(&pdev->dev);
-	else
-		vic_runtime_suspend(&pdev->dev);
-
 	falcon_exit(&vic->falcon);
 
 	return 0;
@@ -525,6 +523,8 @@ static int vic_remove(struct platform_device *pdev)
 
 static const struct dev_pm_ops vic_pm_ops = {
 	SET_RUNTIME_PM_OPS(vic_runtime_suspend, vic_runtime_resume, NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 struct platform_driver tegra_vic_driver = {
-- 
2.33.1

