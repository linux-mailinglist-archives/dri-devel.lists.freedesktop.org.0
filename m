Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59512919B05
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 01:07:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5E8B10E9E1;
	Wed, 26 Jun 2024 23:07:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yn4JAK8W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C51C10E9DE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 23:07:27 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-2c87a7df96eso663309a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 16:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719443247; x=1720048047; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0ysPEDdjx+oXzAukwH6lm+msRgYkmqB/xy16SUQDFEQ=;
 b=Yn4JAK8WqUQ+fvae0MHPm4vj9gCeOK1oEEPa+/PVklYfFyL1srzw5l+dgvOoJfSlY0
 9/cy0CSWOdmzSJp0iwY2CrSsiOT6Ly6xLY/z6h6a1pOUX5CQGIh7cyUFEX4cITTACNxw
 USzEgszcmLd4j9x4GnhPZVdr2njnDyC6JgHoYLva24F78nQjpRfkIn2kZbALmuXHnHMX
 ifGJlkia0MeHhHtvmgLjhbp63+5dGFT7aTWn7go8Bw7cEnXW74NTTlEUSh4ZWz+7hBI1
 u3tPgoPcFtaw7QyUJucGTMyXV4OGshbQZFG5F2vId44iuUt7gKehD+EUDElzTqZ6ZtBx
 7Seg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719443247; x=1720048047;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0ysPEDdjx+oXzAukwH6lm+msRgYkmqB/xy16SUQDFEQ=;
 b=WFPp0vjdnlyIjqcIjKLqLQPA1ZGR9QcQv+Q3DkCDVmOqKwwGytMaTUliHEia75v3fd
 d7kf4QO9cejzpYGQvEYQqT6MujiM1aQiaORF15LO1RSYBwdOOwvQn47N8wUA18CSgC2T
 /pAxmavJ/uGSkwdS+Y12xq8uarHswEjbqAiGAAtPpd778x9Du95cO4MdWCEmrr/2m3Xl
 DS5+KGg0In9d6ZlocrwIFiLNZLgcTSEpnSX9MhiTkv8FE2u3Ipi+c1wpYwuWTLnJjIqe
 a13quKBJwv1141Wtcm+4x+Uw4M17dA6mTihoFiLLaXFk5b54ta75rFQtjUahjVBjv1I7
 EhRA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUigWbK1oC2FPCrThBP9r9oUXZ4TMOSC+31XWkC9JxgA7qosMZSBJ/fqbW+pZC6nVEJsVxK3SsSIluXTBNLh3QBgmWsNEYN/l/IvUkY4Mue
X-Gm-Message-State: AOJu0YySySY0JAsv6Ddj8Q2MqCBxu6w7hBo032Mzs+/mhKhsMGMmJ86v
 EGzmWbS8rkdE7spDDip6zOZa7TcGsEd8HyLtk2vtSetmFV/hmUy8
X-Google-Smtp-Source: AGHT+IGgQSleDrOT//ReNzqK7pbrNgiuFaPxAInrhtSm8tZXQPLXH67r42IikpGzGgOZjoLmoautog==
X-Received: by 2002:a17:90a:bf16:b0:2c4:cd15:3e4b with SMTP id
 98e67ed59e1d1-2c845f72020mr12168717a91.4.1719443246809; 
 Wed, 26 Jun 2024 16:07:26 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:a460:36ee:dca1:f711])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c8fead3100sm61908a91.49.2024.06.26.16.07.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 16:07:26 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: rfoss@kernel.org
Cc: neil.armstrong@linaro.org, victor.liu@nxp.com,
 dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@denx.de>
Subject: [PATCH 6/6] drm/bridge: imx8qxp-ldb: Switch to RUNTIME_PM_OPS()
Date: Wed, 26 Jun 2024 20:07:04 -0300
Message-Id: <20240626230704.708234-6-festevam@gmail.com>
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
 drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
index 7984da9c0a35..b33011f397f0 100644
--- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
+++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
@@ -678,12 +678,12 @@ static void imx8qxp_ldb_remove(struct platform_device *pdev)
 	pm_runtime_disable(&pdev->dev);
 }
 
-static int __maybe_unused imx8qxp_ldb_runtime_suspend(struct device *dev)
+static int imx8qxp_ldb_runtime_suspend(struct device *dev)
 {
 	return 0;
 }
 
-static int __maybe_unused imx8qxp_ldb_runtime_resume(struct device *dev)
+static int imx8qxp_ldb_runtime_resume(struct device *dev)
 {
 	struct imx8qxp_ldb *imx8qxp_ldb = dev_get_drvdata(dev);
 	struct ldb *ldb = &imx8qxp_ldb->base;
@@ -695,8 +695,7 @@ static int __maybe_unused imx8qxp_ldb_runtime_resume(struct device *dev)
 }
 
 static const struct dev_pm_ops imx8qxp_ldb_pm_ops = {
-	SET_RUNTIME_PM_OPS(imx8qxp_ldb_runtime_suspend,
-			   imx8qxp_ldb_runtime_resume, NULL)
+	RUNTIME_PM_OPS(imx8qxp_ldb_runtime_suspend, imx8qxp_ldb_runtime_resume, NULL)
 };
 
 static const struct of_device_id imx8qxp_ldb_dt_ids[] = {
@@ -709,7 +708,7 @@ static struct platform_driver imx8qxp_ldb_driver = {
 	.probe	= imx8qxp_ldb_probe,
 	.remove_new = imx8qxp_ldb_remove,
 	.driver	= {
-		.pm = &imx8qxp_ldb_pm_ops,
+		.pm = pm_ptr(&imx8qxp_ldb_pm_ops),
 		.name = DRIVER_NAME,
 		.of_match_table = imx8qxp_ldb_dt_ids,
 	},
-- 
2.34.1

