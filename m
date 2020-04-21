Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D52A1B2822
	for <lists+dri-devel@lfdr.de>; Tue, 21 Apr 2020 15:37:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 794866E965;
	Tue, 21 Apr 2020 13:37:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B64E76E96B;
 Tue, 21 Apr 2020 13:37:55 +0000 (UTC)
Received: by mail-pf1-x443.google.com with SMTP id x3so6594686pfp.7;
 Tue, 21 Apr 2020 06:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=WZJv2zaSebQm22EUezH7vPhs/Qwwg/oJh0qpgLg+YdE=;
 b=HZ1jVCY0o1WVjmlDkYpPfmpgxD/+LTF2HHJOONJbRjOexDI/atDHU9sOlV4qg5BpzN
 jLC3yydD8MgoWmv6/5xMWgVYBDwV99Z77dLhuIcWP1y/I62KQPbNbQKCREJIhTU5ccoT
 ebCdj+QcFTxuLce3ttr+LWGksqnRLTUMC7J1BdQ7GlcQnPNS5AKVZtQgBf/Tqs2gm329
 J9XLBF5iLSXjAH6pCAYfQrBN4ecOPggc+dqO/U5KezTKiNuoIkxrZimnfBnkA64uNgeI
 cLY3ZvAEoKeXQ3CzdatG4z6wYd7aL1upKfRAtwweU4r2sC+O2+tfPeH5Bft7m94m5EG2
 2nFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=WZJv2zaSebQm22EUezH7vPhs/Qwwg/oJh0qpgLg+YdE=;
 b=jnwKDlT9qwlWF8lQTmao6fFzYDSkuEz6fGFvj2N5OLM1me5MoGGNCowhLO37cTwWsH
 Z0vlDzQHRiN17MS0nHr3R5Q7txPr1k1AhLyOUKQReCdFTeKp0FbsFLBa4C4lJdyvce2t
 xBdXb0BVQGFDjWnbQD89vMkDgHuchRbm8bZ8GibNiPhk1Td5/DfD8azJrQH7As004EIv
 uF3XCyfGmhbI4uoxRvb0W9DH4YAKntY4gg1XDtBdFBgoBvSQjp1PThVwTzejB4bv6UQX
 5ug7XOsIHC4cz5Ztb2kIdYOv/yGhplIugrXfKBGm3k3/ZSc2qYUORRmu3Q6nvykQ61k0
 eOGA==
X-Gm-Message-State: AGi0Pubqj+W+LvqubXc1M4VWqFtXDhZPkY8HsBfJiVARiajstxfvmuYK
 cIE7YlBnxgOq4Jmow/3yTxYVLIEhMWU6EQ==
X-Google-Smtp-Source: APiQypKNcYsi6dGYJQM0NM/nilT+JjKdUcqrWSWITT3Qkd61c8/Om0ICooJEWUA/9m2k0DEnlsU/7Q==
X-Received: by 2002:a63:6d87:: with SMTP id i129mr21691152pgc.54.1587476275064; 
 Tue, 21 Apr 2020 06:37:55 -0700 (PDT)
Received: from yuq-Aspire-4738G.lan (li2017-195.members.linode.com.
 [172.105.124.195])
 by smtp.gmail.com with ESMTPSA id r23sm2551327pfr.64.2020.04.21.06.37.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 06:37:54 -0700 (PDT)
From: Qiang Yu <yuq825@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 08/10] drm/lima: seperate clk/regulator enable/disable
 function
Date: Tue, 21 Apr 2020 21:35:49 +0800
Message-Id: <20200421133551.31481-9-yuq825@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200421133551.31481-1-yuq825@gmail.com>
References: <20200421133551.31481-1-yuq825@gmail.com>
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
Cc: lima@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Bhushan Shah <bshah@kde.org>, Vasily Khoruzhick <anarsoul@gmail.com>,
 Andreas Baierl <ichgeh@imkreisrum.de>, Qiang Yu <yuq825@gmail.com>,
 Erico Nunes <nunes.erico@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For being used by both device init/fini and suspend/resume.

Signed-off-by: Qiang Yu <yuq825@gmail.com>
---
 drivers/gpu/drm/lima/lima_device.c | 105 +++++++++++++++++++----------
 1 file changed, 68 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/lima/lima_device.c b/drivers/gpu/drm/lima/lima_device.c
index e5f1f84ba85a..281e05a8cd4b 100644
--- a/drivers/gpu/drm/lima/lima_device.c
+++ b/drivers/gpu/drm/lima/lima_device.c
@@ -81,26 +81,10 @@ const char *lima_ip_name(struct lima_ip *ip)
 	return lima_ip_desc[ip->id].name;
 }
 
-static int lima_clk_init(struct lima_device *dev)
+static int lima_clk_enable(struct lima_device *dev)
 {
 	int err;
 
-	dev->clk_bus = devm_clk_get(dev->dev, "bus");
-	if (IS_ERR(dev->clk_bus)) {
-		err = PTR_ERR(dev->clk_bus);
-		if (err != -EPROBE_DEFER)
-			dev_err(dev->dev, "get bus clk failed %d\n", err);
-		return err;
-	}
-
-	dev->clk_gpu = devm_clk_get(dev->dev, "core");
-	if (IS_ERR(dev->clk_gpu)) {
-		err = PTR_ERR(dev->clk_gpu);
-		if (err != -EPROBE_DEFER)
-			dev_err(dev->dev, "get core clk failed %d\n", err);
-		return err;
-	}
-
 	err = clk_prepare_enable(dev->clk_bus);
 	if (err)
 		return err;
@@ -109,15 +93,7 @@ static int lima_clk_init(struct lima_device *dev)
 	if (err)
 		goto error_out0;
 
-	dev->reset = devm_reset_control_array_get_optional_shared(dev->dev);
-
-	if (IS_ERR(dev->reset)) {
-		err = PTR_ERR(dev->reset);
-		if (err != -EPROBE_DEFER)
-			dev_err(dev->dev, "get reset controller failed %d\n",
-				err);
-		goto error_out1;
-	} else if (dev->reset != NULL) {
+	if (dev->reset) {
 		err = reset_control_deassert(dev->reset);
 		if (err) {
 			dev_err(dev->dev,
@@ -135,14 +111,76 @@ static int lima_clk_init(struct lima_device *dev)
 	return err;
 }
 
-static void lima_clk_fini(struct lima_device *dev)
+static void lima_clk_disable(struct lima_device *dev)
 {
-	if (dev->reset != NULL)
+	if (dev->reset)
 		reset_control_assert(dev->reset);
 	clk_disable_unprepare(dev->clk_gpu);
 	clk_disable_unprepare(dev->clk_bus);
 }
 
+static int lima_clk_init(struct lima_device *dev)
+{
+	int err;
+
+	dev->clk_bus = devm_clk_get(dev->dev, "bus");
+	if (IS_ERR(dev->clk_bus)) {
+		err = PTR_ERR(dev->clk_bus);
+		if (err != -EPROBE_DEFER)
+			dev_err(dev->dev, "get bus clk failed %d\n", err);
+		dev->clk_bus = NULL;
+		return err;
+	}
+
+	dev->clk_gpu = devm_clk_get(dev->dev, "core");
+	if (IS_ERR(dev->clk_gpu)) {
+		err = PTR_ERR(dev->clk_gpu);
+		if (err != -EPROBE_DEFER)
+			dev_err(dev->dev, "get core clk failed %d\n", err);
+		dev->clk_gpu = NULL;
+		return err;
+	}
+
+	dev->reset = devm_reset_control_array_get_optional_shared(dev->dev);
+	if (IS_ERR(dev->reset)) {
+		err = PTR_ERR(dev->reset);
+		if (err != -EPROBE_DEFER)
+			dev_err(dev->dev, "get reset controller failed %d\n",
+				err);
+		dev->reset = NULL;
+		return err;
+	}
+
+	return lima_clk_enable(dev);
+}
+
+static void lima_clk_fini(struct lima_device *dev)
+{
+        lima_clk_disable(dev);
+}
+
+static int lima_regulator_enable(struct lima_device *dev)
+{
+	int ret;
+
+	if (!dev->regulator)
+		return 0;
+
+	ret = regulator_enable(dev->regulator);
+	if (ret < 0) {
+		dev_err(dev->dev, "failed to enable regulator: %d\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static void lima_regulator_disable(struct lima_device *dev)
+{
+	if (dev->regulator)
+		regulator_disable(dev->regulator);
+}
+
 static int lima_regulator_init(struct lima_device *dev)
 {
 	int ret;
@@ -158,19 +196,12 @@ static int lima_regulator_init(struct lima_device *dev)
 		return ret;
 	}
 
-	ret = regulator_enable(dev->regulator);
-	if (ret < 0) {
-		dev_err(dev->dev, "failed to enable regulator: %d\n", ret);
-		return ret;
-	}
-
-	return 0;
+	return lima_regulator_enable(dev);
 }
 
 static void lima_regulator_fini(struct lima_device *dev)
 {
-	if (dev->regulator)
-		regulator_disable(dev->regulator);
+        lima_regulator_disable(dev);
 }
 
 static int lima_init_ip(struct lima_device *dev, int index)
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
