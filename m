Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B080D79042B
	for <lists+dri-devel@lfdr.de>; Sat,  2 Sep 2023 01:42:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF4310E835;
	Fri,  1 Sep 2023 23:42:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5305A10E829
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Sep 2023 23:42:44 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-57325fcd970so1502926eaf.1
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Sep 2023 16:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1693611763; x=1694216563;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e4TY+mfn1StbQRy79Smag9rvt1YGLeZB0A1g4xD0EoY=;
 b=USQwV9Y9e4Qabw7ce3QkwlRz/7ZZzIzVz/2YALRZ6qY7q/wJhuboxrNu2u/ODFpZE+
 3vhRZLpEyBtIapWv8MWaQsJxfyk5CE0VP3JGpB710QjWImCZyEx7vkZ9odg/NiOeT2wz
 rCIpaOw4wfPSEww73d6Av/OsB4y8sllxElwfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693611763; x=1694216563;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e4TY+mfn1StbQRy79Smag9rvt1YGLeZB0A1g4xD0EoY=;
 b=DHRxvQHhWXahoy1BbLM8OUfrRzBT28wJRDYdG4+GxK2CZAcl7Ne8rEFnT9+byR7r4G
 S1FnQzb5WA4YChzS/RNgarum2LQEAboXDQusTubKEVA7GE9fSHPSMvChmNbBtDE4v88G
 C/vNpOPQLmaPowiDxTuUZScc4pQCOjgTjsd5BIR+vzK0zMqcBJVbo0ogWL16hgDkz5Wn
 4Q2gDWLmJAdE1Ard4MfDDEI/rKgi1ifabKGNo+TL5O3X1ZG7za+p2dP6+DbA3dIV68i+
 l3vA28M5fqqMXN/zn6Dw7f1ZvTBnbd8N4qSQILpwI0ogSdR+fTCksACxJ3HVhkqLsGiJ
 WcMw==
X-Gm-Message-State: AOJu0YzQLa7FT82OG1o4l8dpwJ7uzw92O/HS2Jon8FI9OKJ9O0uHwtQE
 81uemyWLpGMlsKZnkL5YHrEZBrk3NnFB8CTkq7VF3CDS
X-Google-Smtp-Source: AGHT+IF7UPzkkGzgqVZz1o/USebNUQJU5okEoq2BB0eQhVhRuIETriXPYYu2vmslkxHSUlAV+cQf2A==
X-Received: by 2002:a05:6358:6f92:b0:134:e603:116e with SMTP id
 s18-20020a0563586f9200b00134e603116emr4089163rwn.6.1693611762893; 
 Fri, 01 Sep 2023 16:42:42 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:9d:2:8d94:1fc5:803c:41cc])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a639a09000000b0056c3a4a3ca5sm3326390pge.36.2023.09.01.16.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Sep 2023 16:42:42 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFT PATCH 08/15] drm/arcpgu: Call drm_atomic_helper_shutdown() at
 shutdown time
Date: Fri,  1 Sep 2023 16:41:19 -0700
Message-ID: <20230901164111.RFT.8.I8a0a246fea222059881d01a8fff2adcf7ef3d7a4@changeid>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230901234202.566951-1-dianders@chromium.org>
References: <20230901234202.566951-1-dianders@chromium.org>
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
Cc: abrodkin@synopsys.com, Douglas Anderson <dianders@chromium.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Based on grepping through the source code this driver appears to be
missing a call to drm_atomic_helper_shutdown() at system shutdown
time. Among other things, this means that if a panel is in use that it
won't be cleanly powered off at system shutdown time.

The fact that we should call drm_atomic_helper_shutdown() in the case
of OS shutdown/restart comes straight out of the kernel doc "driver
instance overview" in drm_drv.c.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This commit is only compile-time tested.

 drivers/gpu/drm/tiny/arcpgu.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index e5b10e41554a..c1e851c982e4 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -414,6 +414,11 @@ static int arcpgu_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static void arcpgu_shutdown(struct platform_device *pdev)
+{
+	drm_atomic_helper_shutdown(platform_get_drvdata(pdev));
+}
+
 static const struct of_device_id arcpgu_of_table[] = {
 	{.compatible = "snps,arcpgu"},
 	{}
@@ -424,6 +429,7 @@ MODULE_DEVICE_TABLE(of, arcpgu_of_table);
 static struct platform_driver arcpgu_platform_driver = {
 	.probe = arcpgu_probe,
 	.remove = arcpgu_remove,
+	.shutdown = arcpgu_shutdown,
 	.driver = {
 		   .name = "arcpgu",
 		   .of_match_table = arcpgu_of_table,
-- 
2.42.0.283.g2d96d420d3-goog

