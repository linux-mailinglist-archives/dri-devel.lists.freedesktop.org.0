Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBCB3919B04
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 01:07:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB2710E9E3;
	Wed, 26 Jun 2024 23:07:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AdAxBnkY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D3210E9DE
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 23:07:25 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-2c8b5a236daso393391a91.1
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jun 2024 16:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719443244; x=1720048044; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fCmh9hAz3AWuYhqTaQEMph1iwcr0FSY/ErS9D4TCWpo=;
 b=AdAxBnkYedut1I8uuAkbcZSVXxGdXmQvYhcxa3gCWEYvOi2td1B3ocdzcTznuN6MQO
 CnkOyVbI7pk5JVImycJ3CSPvdtiWt1gn5amxKqNv1GgNS/xw1VJqs8+qXDuTtdRpMRZ/
 UkfdeMwHUKiIGGOFm/pz7Ji6Z8f+k1b96UEFhbw7ATaXWH11CNSHA8JWv1yyLy4FdsV6
 qeGQKzjSnxT2f72mzD0+6yUJOud/OlPC5L7TcLz09G0IMhi0OxGPCA92DEhbHD6UcqrI
 u5FkLLx+T2rcefXkOFL10HFdwP2z47N8HzwSMuGGUM7F3toNmbC6ESuhzkRV90o4sH6t
 G2Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719443244; x=1720048044;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fCmh9hAz3AWuYhqTaQEMph1iwcr0FSY/ErS9D4TCWpo=;
 b=rUhS7DzKMgdLczdRC6YMcLqBNsFmSjONAZV26aIfK4XBjXMASzEHC8mppZhgQX1960
 p1cFQDy9qeidTwl5A8S4ahFoTyA8a3DqC55DEnKXhfVx9tPcEavaa7ZKJoZQjAbbQqDr
 gcFWsC3v03hgDi2fHKmbXSy101iAqTKE7u+qfAisKx9FXE8PJFoDNVLzhvwRTElVTzSZ
 GK9jffa9dke3Xfl5bx5CmQPe98GMWJLWGWhofDPgWw809FMs/MUAia/Awh1VMAEdViiP
 4PfeVd9CjZ7Cho+g7m3CYK5zSD5dmkOPlDgzzw5BMLfoh65BlOaICVpOxcquyMVP3vSD
 gw3A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXloiLkJRyAtZHNos4jUWGSLN30AMN+RJ7MUtx3TMjzhdEFgh/yo0+a3unqQWDrUixfNiNQvV5tFYBgFaSlny19qg3lwUc1DLr09qelaWjS
X-Gm-Message-State: AOJu0YyZg9PonPgkE5WilvtYm2Pptt5b96x38ggFN9UduBPHDMA2JOhZ
 V6JRj34otRFirsCzH0apViEjCXKNP4bGS69C4wJujuJ3y4cL8UOFADAa1A==
X-Google-Smtp-Source: AGHT+IHb1vWs5mV5OJXelPcBZpetUl/5Gjbv1RPyeokMKxRYlDPFTDsnvepK9ntTDtAdJY6gUxNC7g==
X-Received: by 2002:a17:90a:db94:b0:2c2:d11b:14dd with SMTP id
 98e67ed59e1d1-2c8452e0fdbmr12343871a91.0.1719443244460; 
 Wed, 26 Jun 2024 16:07:24 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:a460:36ee:dca1:f711])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2c8fead3100sm61908a91.49.2024.06.26.16.07.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jun 2024 16:07:24 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: rfoss@kernel.org
Cc: neil.armstrong@linaro.org, victor.liu@nxp.com,
 dri-devel@lists.freedesktop.org, Fabio Estevam <festevam@denx.de>
Subject: [PATCH 5/6] drm/bridge: dw-hdmi-cec: Switch to SYSTEM_SLEEP_PM_OPS()
Date: Wed, 26 Jun 2024 20:07:03 -0300
Message-Id: <20240626230704.708234-5-festevam@gmail.com>
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

Replace SET_SYSTEM_SLEEP_PM_OPS with its modern SYSTEM_SLEEP_PM_OPS()
alternative.

The combined usage of pm_ptr() and SYSTEM_SLEEP_PM_OPS()
allows the compiler to evaluate if the runtime suspend/resume() functions
are used at build time or are simply dead code.

This allows removing the __maybe_unused notation from the runtime
suspend/resume() functions.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
index 673661160e54..d4614de1ae1e 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
@@ -312,7 +312,7 @@ static void dw_hdmi_cec_remove(struct platform_device *pdev)
 	cec_unregister_adapter(cec->adap);
 }
 
-static int __maybe_unused dw_hdmi_cec_resume(struct device *dev)
+static int dw_hdmi_cec_resume(struct device *dev)
 {
 	struct dw_hdmi_cec *cec = dev_get_drvdata(dev);
 
@@ -328,7 +328,7 @@ static int __maybe_unused dw_hdmi_cec_resume(struct device *dev)
 	return 0;
 }
 
-static int __maybe_unused dw_hdmi_cec_suspend(struct device *dev)
+static int dw_hdmi_cec_suspend(struct device *dev)
 {
 	struct dw_hdmi_cec *cec = dev_get_drvdata(dev);
 
@@ -341,7 +341,7 @@ static int __maybe_unused dw_hdmi_cec_suspend(struct device *dev)
 }
 
 static const struct dev_pm_ops dw_hdmi_cec_pm = {
-	SET_SYSTEM_SLEEP_PM_OPS(dw_hdmi_cec_suspend, dw_hdmi_cec_resume)
+	SYSTEM_SLEEP_PM_OPS(dw_hdmi_cec_suspend, dw_hdmi_cec_resume)
 };
 
 static struct platform_driver dw_hdmi_cec_driver = {
@@ -349,7 +349,7 @@ static struct platform_driver dw_hdmi_cec_driver = {
 	.remove_new = dw_hdmi_cec_remove,
 	.driver = {
 		.name = "dw-hdmi-cec",
-		.pm = &dw_hdmi_cec_pm,
+		.pm = pm_ptr(&dw_hdmi_cec_pm),
 	},
 };
 module_platform_driver(dw_hdmi_cec_driver);
-- 
2.34.1

