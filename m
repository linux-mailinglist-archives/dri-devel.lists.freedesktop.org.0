Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 555BF919B01
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 01:07:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0C310E9DC;
	Wed, 26 Jun 2024 23:07:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="B2zNTtnM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2085A10E9DC
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 23:07:18 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-72703dd2b86so30887a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 16:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719443237; x=1720048037; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y7P7+EFgd4EWXaRmpN9LiPnTBQYfRx62u/dAEbs/950=;
 b=B2zNTtnMeL9yOhLoPr7XDmS1MAVFN7OEbsoxvMX7FBWGaSI7FQwtk25MBeX50Q06DF
 PL4Exy0Iqiq7niMN9uelzmBhRxX9S+ISZGMHJf6Fg9roD3Lu6baUUAzM4fFduJbhenmD
 4hOyb+7db90/WrH4+GuKE+ww3kG71XL3gvPrBqZHJM3xICXDdqbxkHw6PkJoNOKyD7Vt
 4Ia+GjKQfiDD3y56IyxkUkwPDa6d16zEy+7o5ZZS/kr6Q21dCkhuBfXavbQMHd5tNeQZ
 lIpNyrmdyT5bcbBxIBRcN3HNPsgofQNCnzY+yYUNdT45ABG9xmtCCWTufqUrRQ1HPxAc
 RWHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719443237; x=1720048037;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y7P7+EFgd4EWXaRmpN9LiPnTBQYfRx62u/dAEbs/950=;
 b=up3elfaRfekNwEhCswtc62LBVoGnBAh6db/38IHKnqCT5KLbw7Wwv+l7foCZ2rKEDE
 5Oqd0Wx7cIcxo32GQ2AQl+9ypZySSFov6nErh8mcPI0ghiorv0hmsNGN/J1O/BZabG74
 T7LxmJ/V8D1KOjG3+yQOJCy9m5cJk917d4p5cgnnSDfc3kbUD1FhnhbjZaZ5L+3z+6fc
 +aH0WrG35oKd85juw8vco0989f6ArcwlgMNIypzIW3CTlT4+vLhu3tFVG2KDmpn3dY4U
 q4BKFeAFGhHOcE9OyYl6a93xoz3jrJ/3PA4L7eYvizGyt0/2res6uJHMxizipEj5vVLm
 6hKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHSNpZhMtfPxZ+ORD9Mi8MhugnWu0ItLBwhsLZwO13ODilyKDWFuzKGiH5H3d05vIES/ptiE46S1q5xRVDYR080Bh/M6iBseulwlrrByyf
X-Gm-Message-State: AOJu0YxcJ7yjtRoDoEUZ2f8KUDZGPKlSXMNFfJEvcB91am/6FsDrpIfs
 RIdfT5gy2bOsJVTHNElkri3mhXuqonhCzqQCTmZBfFZqau2y82xy
X-Google-Smtp-Source: AGHT+IFhksd6Pn4tjmIwl2TeTYd7Tjik6ivRGsi6IzPIMfA8rXPD5QKe5WJeJPieqF4kI6O5F3dASw==
X-Received: by 2002:a17:90a:fb94:b0:2c8:4623:66cd with SMTP id
 98e67ed59e1d1-2c846236d22mr12314663a91.1.1719443237419; 
 Wed, 26 Jun 2024 16:07:17 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:a460:36ee:dca1:f711])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c8fead3100sm61908a91.49.2024.06.26.16.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 16:07:17 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: rfoss@kernel.org
Cc: neil.armstrong@linaro.org, victor.liu@nxp.com,
 dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@denx.de>
Subject: [PATCH 2/6] drm/bridge: imx8qm-ldb: Switch to RUNTIME_PM_OPS()
Date: Wed, 26 Jun 2024 20:07:00 -0300
Message-Id: <20240626230704.708234-2-festevam@gmail.com>
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
 drivers/gpu/drm/bridge/imx/imx8qm-ldb.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
index 21471a9a28b2..c879e37f5811 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qm-ldb.c
@@ -542,12 +542,12 @@ static void imx8qm_ldb_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int __maybe_unused imx8qm_ldb_runtime_suspend(struct device *dev)
+static int imx8qm_ldb_runtime_suspend(struct device *dev)
 {
 	return 0;
 }
 
-static int __maybe_unused imx8qm_ldb_runtime_resume(struct device *dev)
+static int imx8qm_ldb_runtime_resume(struct device *dev)
 {
 	struct imx8qm_ldb *imx8qm_ldb = dev_get_drvdata(dev);
 	struct ldb *ldb = &imx8qm_ldb->base;
@@ -559,8 +559,7 @@ static int __maybe_unused imx8qm_ldb_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops imx8qm_ldb_pm_ops = {
-	SET_RUNTIME_PM_OPS(imx8qm_ldb_runtime_suspend,
-			   imx8qm_ldb_runtime_resume, NULL)
+	RUNTIME_PM_OPS(imx8qm_ldb_runtime_suspend, imx8qm_ldb_runtime_resume, NULL)
 };
 
 static const struct of_device_id imx8qm_ldb_dt_ids[] = {
@@ -573,7 +572,7 @@ static struct platform_driver imx8qm_ldb_driver = {
 	.probe	= imx8qm_ldb_probe,
 	.remove_new = imx8qm_ldb_remove,
 	.driver	= {
-		.pm = &imx8qm_ldb_pm_ops,
+		.pm = pm_ptr(&imx8qm_ldb_pm_ops),
 		.name = DRIVER_NAME,
 		.of_match_table = imx8qm_ldb_dt_ids,
 	},
-- 
2.34.1

