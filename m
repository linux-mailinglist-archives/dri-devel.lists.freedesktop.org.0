Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D3AEE15520B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 06:27:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 058786E8D7;
	Fri,  7 Feb 2020 05:27:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A19B66E8D7
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Feb 2020 05:27:12 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id z12so520718pgl.4
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Feb 2020 21:27:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6xiAuePiYUDaMhCwdUVnLN02q98KdUMo0qYM9SWCYvk=;
 b=mP91QrorHLWCX9Rh9X47DtclzQQKLoeO9iO3IvXmxidLSUWEYCmZG3ZEgKr0pSJKnb
 TWUxVRkDGv77ATkUUhec/xYpUXI0QkVwwC+ITTb2N+nslPjJNvFbiuP+FOKJww+18Phh
 gk+CCiFxNbG3t97x3izZOi0kxZeRlTzW3NCIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6xiAuePiYUDaMhCwdUVnLN02q98KdUMo0qYM9SWCYvk=;
 b=QU6afzOmawVdHJ8RwZ1HSdg1jVzb8EnvZnnupuM+WaOYcIm7HiqFMLf3FZZl0vhL41
 zN6aHH26LLXofSacmSV1pkXabkLrMHULrDHuwYnv+Mk1aJAhU6C8gB6Pzg76ZsR09K7r
 ous7W9cdKF1ccne0Es4Xt9H2QXEm4M/VXq+26/WA2yAApg+OpuErO6Jv6+zKC+6HCkVo
 mlySTLroy57UO75Dg52WUYqGcvZZkPkXVCLbvguGaB8PYFuF4nHxJVWtnZwfHA33InD1
 0xtpUfjdCWw8n5YT7hBTIxYFSBekGoYiJL92wsGAyVk0lR5hIud1On+KT8JNoRh10fN6
 cGTQ==
X-Gm-Message-State: APjAAAVE4qdh0rp0O+pDREa7OEJELKi6uVMZTIhL7UVayqF6zqYgCS1h
 Hx95N3xrsYd3A+ZO9Kipq0nzwg==
X-Google-Smtp-Source: APXvYqzDh18JECBJPN5an/ZENhGDbzmt0zN9l3Znxmk+TvBwf8M3GApG6PLEhVwrfyAvj4N2hDOdew==
X-Received: by 2002:a63:2266:: with SMTP id t38mr7950990pgm.145.1581053232225; 
 Thu, 06 Feb 2020 21:27:12 -0800 (PST)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:d8b7:33af:adcb:b648])
 by smtp.gmail.com with ESMTPSA id i66sm1174485pfg.85.2020.02.06.21.27.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Feb 2020 21:27:11 -0800 (PST)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v4 7/7] RFC: drm/panfrost: devfreq: Add support for 2
 regulators
Date: Fri,  7 Feb 2020 13:26:27 +0800
Message-Id: <20200207052627.130118-8-drinkcat@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200207052627.130118-1-drinkcat@chromium.org>
References: <20200207052627.130118-1-drinkcat@chromium.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 ulf.hansson@linaro.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Steven Price <steven.price@arm.com>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>, hsinyi@chromium.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Bifrost GPU on MT8183 uses 2 regulators (core and SRAM) for
devfreq, and provides OPP table with 2 sets of voltages.

TODO: This is incomplete as we'll need add support for setting
a pair of voltages as well.

Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>

---
 drivers/gpu/drm/panfrost/panfrost_devfreq.c | 17 +++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_device.h  |  1 +
 2 files changed, 18 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_devfreq.c b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
index 413987038fbfccb..9c0987a3d71c597 100644
--- a/drivers/gpu/drm/panfrost/panfrost_devfreq.c
+++ b/drivers/gpu/drm/panfrost/panfrost_devfreq.c
@@ -79,6 +79,21 @@ int panfrost_devfreq_init(struct panfrost_device *pfdev)
 	struct devfreq *devfreq;
 	struct thermal_cooling_device *cooling;
 
+	/* If we have 2 regulator, we need an OPP table with 2 voltages. */
+	if (pfdev->comp->num_supplies > 1) {
+		pfdev->devfreq.dev_opp_table =
+			dev_pm_opp_set_regulators(dev,
+					pfdev->comp->supply_names,
+					pfdev->comp->num_supplies);
+		if (IS_ERR(pfdev->devfreq.dev_opp_table)) {
+			ret = PTR_ERR(pfdev->devfreq.dev_opp_table);
+			pfdev->devfreq.dev_opp_table = NULL;
+			dev_err(dev,
+				"Failed to init devfreq opp table: %d\n", ret);
+			return ret;
+		}
+	}
+
 	ret = dev_pm_opp_of_add_table(dev);
 	if (ret == -ENODEV) /* Optional, continue without devfreq */
 		return 0;
@@ -119,6 +134,8 @@ void panfrost_devfreq_fini(struct panfrost_device *pfdev)
 	if (pfdev->devfreq.cooling)
 		devfreq_cooling_unregister(pfdev->devfreq.cooling);
 	dev_pm_opp_of_remove_table(&pfdev->pdev->dev);
+	if (pfdev->devfreq.dev_opp_table)
+		dev_pm_opp_put_regulators(pfdev->devfreq.dev_opp_table);
 }
 
 void panfrost_devfreq_resume(struct panfrost_device *pfdev)
diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
index c30c719a805940a..5009a8b7c853ea1 100644
--- a/drivers/gpu/drm/panfrost/panfrost_device.h
+++ b/drivers/gpu/drm/panfrost/panfrost_device.h
@@ -110,6 +110,7 @@ struct panfrost_device {
 	struct {
 		struct devfreq *devfreq;
 		struct thermal_cooling_device *cooling;
+		struct opp_table *dev_opp_table;
 		ktime_t busy_time;
 		ktime_t idle_time;
 		ktime_t time_last_update;
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
