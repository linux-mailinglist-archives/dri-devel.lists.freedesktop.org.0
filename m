Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6FC23C29A6
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 21:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40C576EA6A;
	Fri,  9 Jul 2021 19:29:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D4B6EA6A
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 19:29:32 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 a5-20020a7bc1c50000b02901e3bbe0939bso6978965wmj.0
 for <dri-devel@lists.freedesktop.org>; Fri, 09 Jul 2021 12:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fqNBjbH3rPHiYRwYwGOI/SzSmc1V4SyfxtAqmW62gNs=;
 b=gt8znewZZK6XKs/w5uBhJkXn5qEczq7wmCaJqFvE//zZfq7/PpR2j7JBETWRtGshtv
 zzXKZGutLrTgCDwiTYcMyimNt4UF1bg/yVMLb8g5nLC+B5OGek3TqCCKjagugR9dZny3
 RP/0G6Ns3ExkBDWMamvWkg8cFjASRM/U7J7H20A0lXXH6Ms2fwgpqNzOO7Q2ribongXx
 exs3BwZwJcH0c9YQ9+E3WQri3INd+P6ruLDeHn8AI5+9U/Mzchh89VB5G0AYfVEw+0QB
 ZIp9uIpWfx/8xr6ZDI1LwR5BrnsgDNQxU2OSK4DaJQnnIi2hk7FKrPLVre65OQyJrWuV
 ayXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fqNBjbH3rPHiYRwYwGOI/SzSmc1V4SyfxtAqmW62gNs=;
 b=Rm8ePij/sV5jB2YAOKbL/P7Ft29qyt9DqDwsYUKHSmwU3rD5poDArOKsE9BIiuj94n
 DheBeEl56LWY5XKSWWqG09DiRRoLubbLGbTj7uce+M9MUjyVHUf0jYfrcU/9OXbTlzho
 tAg+AX46Fm+15PLFUXTLUMUIsvVka//X6WHr8RGeFgLJu19Eo2dqx90MHO2eRZPqSPt0
 Vaewm+MMLZRbApTOJAjwfwQq9ukFNdGJYpW+AqrGsNCgckl55mNwy+wbtPVXGwbS04vs
 kxD2EnUWWEALOuLc819qioiUoNA2TGRlz0g9eplmOyXxopVUW3BI9z4ffa3OYh+UjCg6
 9HMw==
X-Gm-Message-State: AOAM533oZC16uuH1aH1Y7qfXhjaq82wRCFCMAhokH8gfRz4+Xu10OGuD
 ZPkOwPPX4kHrqsh+17F3FXs=
X-Google-Smtp-Source: ABdhPJyyto22V4g+Vao8QFiXSt0LgkQ5bjzQPG4kbHF8Dw0WdX6zsdVNkGxmNxqReH81ilWmbfA1Tw==
X-Received: by 2002:a7b:c30f:: with SMTP id k15mr548591wmj.128.1625858971280; 
 Fri, 09 Jul 2021 12:29:31 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id f9sm6079953wrm.48.2021.07.09.12.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Jul 2021 12:29:30 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH v8 07/14] drm/tegra: Boot VIC during runtime PM resume
Date: Fri,  9 Jul 2021 21:31:39 +0200
Message-Id: <20210709193146.2859516-8-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210709193146.2859516-1-thierry.reding@gmail.com>
References: <20210709193146.2859516-1-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Dmitry Osipenko <digetx@gmail.com>,
 dri-devel@lists.freedesktop.org, Mikko Perttunen <mperttunen@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Mikko Perttunen <mperttunen@nvidia.com>

With the new UAPI implementation, engines are powered on and off
when there are active jobs, and the core code handles channel
allocation. To accommodate that, boot the engine as part of
runtime PM instead of using the open_channel callback, which is
not used by the new submit path.

Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/vic.c | 112 ++++++++++++++++--------------------
 1 file changed, 51 insertions(+), 61 deletions(-)

diff --git a/drivers/gpu/drm/tegra/vic.c b/drivers/gpu/drm/tegra/vic.c
index c9d55a9a3180..c02010ff2b7f 100644
--- a/drivers/gpu/drm/tegra/vic.c
+++ b/drivers/gpu/drm/tegra/vic.c
@@ -29,7 +29,6 @@ struct vic_config {
 
 struct vic {
 	struct falcon falcon;
-	bool booted;
 
 	void __iomem *regs;
 	struct tegra_drm_client client;
@@ -52,48 +51,6 @@ static void vic_writel(struct vic *vic, u32 value, unsigned int offset)
 	writel(value, vic->regs + offset);
 }
 
-static int vic_runtime_resume(struct device *dev)
-{
-	struct vic *vic = dev_get_drvdata(dev);
-	int err;
-
-	err = clk_prepare_enable(vic->clk);
-	if (err < 0)
-		return err;
-
-	usleep_range(10, 20);
-
-	err = reset_control_deassert(vic->rst);
-	if (err < 0)
-		goto disable;
-
-	usleep_range(10, 20);
-
-	return 0;
-
-disable:
-	clk_disable_unprepare(vic->clk);
-	return err;
-}
-
-static int vic_runtime_suspend(struct device *dev)
-{
-	struct vic *vic = dev_get_drvdata(dev);
-	int err;
-
-	err = reset_control_assert(vic->rst);
-	if (err < 0)
-		return err;
-
-	usleep_range(2000, 4000);
-
-	clk_disable_unprepare(vic->clk);
-
-	vic->booted = false;
-
-	return 0;
-}
-
 static int vic_boot(struct vic *vic)
 {
 #ifdef CONFIG_IOMMU_API
@@ -103,9 +60,6 @@ static int vic_boot(struct vic *vic)
 	void *hdr;
 	int err = 0;
 
-	if (vic->booted)
-		return 0;
-
 #ifdef CONFIG_IOMMU_API
 	if (vic->config->supports_sid && spec) {
 		u32 value;
@@ -168,8 +122,6 @@ static int vic_boot(struct vic *vic)
 		return err;
 	}
 
-	vic->booted = true;
-
 	return 0;
 }
 
@@ -323,35 +275,74 @@ static int vic_load_firmware(struct vic *vic)
 	return err;
 }
 
-static int vic_open_channel(struct tegra_drm_client *client,
-			    struct tegra_drm_context *context)
+
+static int vic_runtime_resume(struct device *dev)
 {
-	struct vic *vic = to_vic(client);
+	struct vic *vic = dev_get_drvdata(dev);
 	int err;
 
-	err = pm_runtime_resume_and_get(vic->dev);
+	err = clk_prepare_enable(vic->clk);
 	if (err < 0)
 		return err;
 
+	usleep_range(10, 20);
+
+	err = reset_control_deassert(vic->rst);
+	if (err < 0)
+		goto disable;
+
+	usleep_range(10, 20);
+
 	err = vic_load_firmware(vic);
 	if (err < 0)
-		goto rpm_put;
+		goto assert;
 
 	err = vic_boot(vic);
 	if (err < 0)
-		goto rpm_put;
+		goto assert;
+
+	return 0;
+
+assert:
+	reset_control_assert(vic->rst);
+disable:
+	clk_disable_unprepare(vic->clk);
+	return err;
+}
+
+static int vic_runtime_suspend(struct device *dev)
+{
+	struct vic *vic = dev_get_drvdata(dev);
+	int err;
+
+	err = reset_control_assert(vic->rst);
+	if (err < 0)
+		return err;
+
+	usleep_range(2000, 4000);
+
+	clk_disable_unprepare(vic->clk);
+
+	return 0;
+}
+
+static int vic_open_channel(struct tegra_drm_client *client,
+			    struct tegra_drm_context *context)
+{
+	struct vic *vic = to_vic(client);
+	int err;
+
+	err = pm_runtime_resume_and_get(vic->dev);
+	if (err < 0)
+		return err;
 
 	context->channel = host1x_channel_get(vic->channel);
 	if (!context->channel) {
-		err = -ENOMEM;
-		goto rpm_put;
+		pm_runtime_put(vic->dev);
+		return -ENOMEM;
 	}
 
 	return 0;
-
-rpm_put:
-	pm_runtime_put(vic->dev);
-	return err;
 }
 
 static void vic_close_channel(struct tegra_drm_context *context)
@@ -359,7 +350,6 @@ static void vic_close_channel(struct tegra_drm_context *context)
 	struct vic *vic = to_vic(context->client);
 
 	host1x_channel_put(context->channel);
-
 	pm_runtime_put(vic->dev);
 }
 
-- 
2.32.0

