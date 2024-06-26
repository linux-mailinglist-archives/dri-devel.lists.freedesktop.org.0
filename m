Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FC3919B03
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 01:07:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E39910E9E0;
	Wed, 26 Jun 2024 23:07:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f1hcvkAv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB69010E9DE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 23:07:22 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id
 41be03b00d2f7-724bb90a5e4so198146a12.3
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 16:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719443242; x=1720048042; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sl5kCWNLD2J3z2sV7dIOG5KI4FQWkxG2rAMfPhdKgXw=;
 b=f1hcvkAvGe/z1uEQu/hW9VcDhSaXB2O6mFymPhIxr+ubin4nHqbPdXMKv/OTL18o5E
 nxoxNFQuarORQaUaRJsnW77BRw5p1oq2ln0vd1zaB7XEvQPlZo5UKT/tvVphDal5XWfU
 01Dr+GziLOgnAZYeQeASPUSReFIbC8K5rr5kz6ql5/zEe+ETDZOb7X9M79m1DWw36Pfz
 DT5sraOg+rLUjMaapjvbcYXRuTWuB7CfE7xaTSEbBHWMHG03f/KHhYu5CXFXEwIv7LCY
 MHGDaVQT/fhH8TpZSGgbRz5xNRNAHdObf1nMfB+RIrclA0qNJL7L1A3ykF5DGuOxVuFY
 zBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719443242; x=1720048042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sl5kCWNLD2J3z2sV7dIOG5KI4FQWkxG2rAMfPhdKgXw=;
 b=PUGRfcXvYygs5O4YKTB6n224OCbFynkV1WPVoC8/nQ6QlvdwlC1wwiMgcfhkpFuVLp
 I+XAzdX/TKOnkopzdB1VMe3Wa5KptB07C7pKt9YQupZcQusg794IjbiGes4+W6SiPplf
 Fs8ZfZ5clsMy4q67UfJHSEJgb1aDd+VgCF72aDSyLIcYbKzbsztjz3RKntOSb9Y/Qqsf
 51mbkhP7g3P/5US4R2WwA7FWOYT0k4IzB9CJtJNpEnjlCKmwzHmOJ58IPdW+GxuLb0iw
 7Qo4aoj0MYpPlcBLpCaFMvTZpt8j6+/WhHGkqXNDRbQCC+nCy9QYsCAhjjbV/0HzgAxC
 mMTQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXT2tJotBaG4eaXyMWKMI3N0+jYQ/fvSZUnOYaGLQMIFXcrjnEsMAUzETIb+FM1IXmugi51H4m3qM8E9g8t2Uz+YDen8mouvGEjOsqCF6Ji
X-Gm-Message-State: AOJu0YxCqk4TBSGQDIZCRm/JWXePsKkQTEmpA9/debP1F164svQmJTye
 pfwgPn/LpRLixtS7Lh8ANfI2sNiiiAdTV1iMOlP+5y1DGKE7xT8TeSOhkA==
X-Google-Smtp-Source: AGHT+IERVTfLfI6YIka4CraTPVwB35HluQbN8Ckuj2KzoIDZdNmDGM6f/7HSfTEFXh+iXtg5fiK4CQ==
X-Received: by 2002:a17:90b:82:b0:2c8:412:8746 with SMTP id
 98e67ed59e1d1-2c845e5a542mr12352312a91.4.1719443242154; 
 Wed, 26 Jun 2024 16:07:22 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:a460:36ee:dca1:f711])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c8fead3100sm61908a91.49.2024.06.26.16.07.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 16:07:21 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: rfoss@kernel.org
Cc: neil.armstrong@linaro.org, victor.liu@nxp.com,
 dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@denx.de>
Subject: [PATCH 4/6] drm/bridge: samsung-dsim: Switch to RUNTIME_PM_OPS()
Date: Wed, 26 Jun 2024 20:07:02 -0300
Message-Id: <20240626230704.708234-4-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240626230704.708234-1-festevam@gmail.com>
References: <20240626230704.708234-1-festevam@gmail.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Fabio Estevam <festevam@denx.de>

Replace SET_RUNTIME_PM_OPS with its modern RUNTIME_PM_OPS() alternative.

The combined usage of pm_ptr() and RUNTIME_PM_OPS()
allows the compiler to evaluate if the runtime suspend/resume() functions
are used at build time or are simply dead code.

This allows removing the __maybe_unused notation from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index e7e53a9e42af..73ccf21ae446 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -2043,7 +2043,7 @@ void samsung_dsim_remove(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(samsung_dsim_remove);
 
-static int __maybe_unused samsung_dsim_suspend(struct device *dev)
+static int samsung_dsim_suspend(struct device *dev)
 {
 	struct samsung_dsim *dsi = dev_get_drvdata(dev);
 	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
@@ -2073,7 +2073,7 @@ static int __maybe_unused samsung_dsim_suspend(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused samsung_dsim_resume(struct device *dev)
+static int samsung_dsim_resume(struct device *dev)
 {
 	struct samsung_dsim *dsi = dev_get_drvdata(dev);
 	const struct samsung_dsim_driver_data *driver_data = dsi->driver_data;
@@ -2108,7 +2108,7 @@ static int __maybe_unused samsung_dsim_resume(struct device *dev)
 }
 
 const struct dev_pm_ops samsung_dsim_pm_ops = {
-	SET_RUNTIME_PM_OPS(samsung_dsim_suspend, samsung_dsim_resume, NULL)
+	RUNTIME_PM_OPS(samsung_dsim_suspend, samsung_dsim_resume, NULL)
 	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
 				pm_runtime_force_resume)
 };
@@ -2142,7 +2142,7 @@ static struct platform_driver samsung_dsim_driver = {
 	.remove_new = samsung_dsim_remove,
 	.driver = {
 		   .name = "samsung-dsim",
-		   .pm = &samsung_dsim_pm_ops,
+		   .pm = pm_ptr(&samsung_dsim_pm_ops),
 		   .of_match_table = samsung_dsim_of_match,
 	},
 };
-- 
2.34.1

