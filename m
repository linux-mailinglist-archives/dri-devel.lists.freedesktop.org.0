Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 839B044FAC7
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 20:37:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED07D6E8D5;
	Sun, 14 Nov 2021 19:37:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5B966E880
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 19:36:11 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id br15so33784665lfb.9
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 11:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uQ5jO8IglZlUMaRNPcN9PUVJW42EUXyxCQcfBM+SAVk=;
 b=HH1RPa0Gx8ttTuULi3uwpJUqF9h/uB4JHpv5JgBPCfnVpZvPMKoPBckyFEf1krXipF
 eha08KcXjqxlHmpLDVtSdfD430SoFDgLsXjq2Al/8lahbNEtcITpNf5ISuyqjsQXc/Rk
 5w1Qexa/fZXOm8ybzJ5UcfjilOyy94PxYerQSUbWvD6jNL2RRnVTdFmOxTzB1s4l/Tof
 ZMUPb25mI8V5sThxakAZyDDzf4ySPS6IavkFiW8rgopZT9GNW6+otdDHMm/2QP/mAN4H
 ZAPNdtViWuhCgKbXXtA6cRtVfVaw/JekPsCKszjmO8GMIESvMZxyDo6M55ocNCwtF3x2
 ln0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uQ5jO8IglZlUMaRNPcN9PUVJW42EUXyxCQcfBM+SAVk=;
 b=ZpO4JuXaKB7JcBX/yv9c9/nVO0iCKuI4g4hxAuPcxxWaY4fTRsBEvpA+fMV4Vym+Z0
 OMkquWu5AO5Ob5Nft/hsOqS0ryW3HftWYeOltlz43aPUKoK51m+6D+9HA152XX0efmTs
 8ArsEjRpXnTzMNlaF8r/TW6z1lPlpEEIZaNQQuoLtDt4MgwD+5FrHITyhBRaudNhxXoO
 N3u3Vkub240sbcoTNrR641Vm6Cmu6kwUl8BjukZU1fl5is/Nixqn/vOAwHqtIU10g6Kz
 U9CBBtV1y6Z90qqk1UfgJVI8QhlQDPmkdAC/LUdezMrQeuTkMbtBfjeIJFQDIB+Olrxo
 RawQ==
X-Gm-Message-State: AOAM533nDaM4erILHDKn8DfTUf/xDoN4ct4JHMM98R3+0CJq+q7IYLf/
 Fp6yNrkVSUeXc8Gvjd+6G9I=
X-Google-Smtp-Source: ABdhPJzTggLeGwbc4HWovoTHcyQAarTear4RSiOZf0yQ2Te2ZKVI/+NbR1wN2D/SJ42lo+6C9egvFQ==
X-Received: by 2002:a05:6512:2350:: with SMTP id
 p16mr25012501lfu.482.1636918570074; 
 Sun, 14 Nov 2021 11:36:10 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id p18sm1191280lfu.127.2021.11.14.11.36.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 11:36:09 -0800 (PST)
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
Subject: [PATCH v15 14/39] drm/tegra: vic: Stop channel on suspend
Date: Sun, 14 Nov 2021 22:34:10 +0300
Message-Id: <20211114193435.7705-15-digetx@gmail.com>
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

