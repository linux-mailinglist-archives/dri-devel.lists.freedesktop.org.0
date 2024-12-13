Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B89E79F0633
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2024 09:18:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFB110EF37;
	Fri, 13 Dec 2024 08:18:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="m80VBn8Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 119F310E0EE
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 08:15:58 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-728eccf836bso1326902b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2024 00:15:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734077758;
 x=1734682558; darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g8c1A5roFmu8uYlk0Vp3b25A6jP1woR9PFe4I7F0E1Y=;
 b=m80VBn8YCnb3KWkSE5dL8OW6xzu/gc56IHBMtAAuwLaxD2VtaxqaNfOeEf8vqru5cn
 iAGWuwH3Aa9bYsdm8s97ZemvgWmcJIdH6/kA3bIWFnPLMnhyj8E7wgDrUzo29WrUnl5w
 BrBFveZZuNKbOk2fZKgre5eoPuFUuq/Cm5kV9cc3UW/KGbah2BIUx41NI9lQUv+3T1Mz
 vX0oE3kPxlvhWvlvb9CKj+XcjBnfad9yRNU01RvxTGSvgN2isbYwPWLzR5/4Qs1lGT5a
 wL/aKh35YJ/Thp5teCt+7Kc/9ruA9+dNv32b7/PM85/LdgXWedIi03FWHcgdK1GZEwYT
 lr3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734077758; x=1734682558;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=g8c1A5roFmu8uYlk0Vp3b25A6jP1woR9PFe4I7F0E1Y=;
 b=vBH1Lvt5TjgCEAsFy5hI+Vn2z7mIkoH+8HgWNcwu5JApGyY83FJUfAteUnRPB35aDm
 z4qT2e/vba51GSi5TQPTjs1Lp7AlcpaufadSSqZDGq17V9apjm9itdnqUD4qfS6sN9Hd
 Z/0uQy3QvIijM9qS2ULggkzdf/pdN6jB3SWz3kUytAQo7us0NcFHdo2usAK/03KFQJUl
 4DOMbX6uh5qyvaQYlFRwvj3hCIe8stJhzGlxRA2jeLdF1WzyE+4AEmveF5C7YiqouHpW
 0O4K0kdZ8etgX3mbFErqjckgSBEqLcQ7REvMOVkw0WoUZcMo2mjcPOQ4TPn3LyC5TNwn
 etRA==
X-Gm-Message-State: AOJu0Yybyb9Vffi2cWP33oFRjEHxWM3SvzTuSr6rSWNVzGRHGDpA8hPc
 vUtTqSOdH9fQUz5HCgfes2gH1CcovCWl6sIqzWQtORfryEfD1Lc0xTcqHlcHmd8=
X-Gm-Gg: ASbGncunuyV+oPgIsJi/qouWSsqEe4Py7hVTT7YKUUaDTa2YaFmvvihO+D4Pw3ijMQF
 ejRqaFnFGrhnxo6rHCv2AHCQsOyKoubNLI5ZNvvRlcaVDiIfOuHxCtfxaeSC/1ajF+VIPpHn4OI
 zatloQwpXvZuFvLPgZxEYIIBfETyC5lYo1HUr7M2S8b1LJT2UOkDz0rsdsF3qkGC9gP5O6VVNgi
 CYZCKXxO7Qbr48aHFVn/5YR0r0zy/R7YgY4/aDGCaejh0qjWaHxRKJ8mjUcdRGfSHKzitweBsHT
 f0eYMTsdiMLQN25WIgn5urMz6Rka8REopCFnFfPCJzE=
X-Google-Smtp-Source: AGHT+IGLiE9tkbIoi5353b7CiFubQkP8E5XSxEa4roy/nnHVYLmOaqDGTg0Xsqjk2TuQ6lghz0NfuA==
X-Received: by 2002:a05:6a00:300d:b0:71e:2a0:b0b8 with SMTP id
 d2e1a72fcca58-7290c0dfc98mr2381364b3a.1.1734077758481; 
 Fri, 13 Dec 2024 00:15:58 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp.
 [133.32.227.190]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-725eed5233esm8321789b3a.4.2024.12.13.00.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 00:15:57 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] drm/bridge: display-connector: implement the error path of
 .probe()
Date: Fri, 13 Dec 2024 17:15:50 +0900
Message-Id: <20241213081550.3388074-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 13 Dec 2024 08:18:23 +0000
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

Current implementation of .probe() leaks a reference of i2c_adapter.
Implement an error path and call put_device() on the obtained
i2c_adapter in it to fix this refcount bug.

This bug was found by an experimental static analysis tool that I am
developing.

Fixes: 0c275c30176b ("drm/bridge: Add bridge driver for display connectors")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/gpu/drm/bridge/display-connector.c | 25 ++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/display-connector.c b/drivers/gpu/drm/bridge/display-connector.c
index 72bc508d4e6e..84f1c3798d32 100644
--- a/drivers/gpu/drm/bridge/display-connector.c
+++ b/drivers/gpu/drm/bridge/display-connector.c
@@ -332,8 +332,11 @@ static int display_connector_probe(struct platform_device *pdev)
 		int ret;
 
 		ret = display_connector_get_supply(pdev, conn, "dp-pwr");
-		if (ret < 0)
-			return dev_err_probe(&pdev->dev, ret, "failed to get DP PWR regulator\n");
+		if (ret < 0) {
+			ret = dev_err_probe(&pdev->dev, ret,
+					    "failed to get DP PWR regulator\n");
+			goto err_put;
+		}
 	}
 
 	/* enable DDC */
@@ -345,19 +348,24 @@ static int display_connector_probe(struct platform_device *pdev)
 
 		if (IS_ERR(conn->ddc_en)) {
 			dev_err(&pdev->dev, "Couldn't get ddc-en gpio\n");
-			return PTR_ERR(conn->ddc_en);
+			ret = PTR_ERR(conn->ddc_en);
+			goto err_put;
 		}
 
 		ret = display_connector_get_supply(pdev, conn, "hdmi-pwr");
-		if (ret < 0)
-			return dev_err_probe(&pdev->dev, ret, "failed to get HDMI +5V Power regulator\n");
+		if (ret < 0) {
+			ret = dev_err_probe(
+				&pdev->dev, ret,
+				"failed to get HDMI +5V Power regulator\n");
+			goto err_put;
+		}
 	}
 
 	if (conn->supply) {
 		ret = regulator_enable(conn->supply);
 		if (ret) {
 			dev_err(&pdev->dev, "failed to enable PWR regulator: %d\n", ret);
-			return ret;
+			goto err_put;
 		}
 	}
 
@@ -383,6 +391,11 @@ static int display_connector_probe(struct platform_device *pdev)
 	drm_bridge_add(&conn->bridge);
 
 	return 0;
+
+err_put:
+	if (conn->bridge.ddc)
+		i2c_put_adapter(conn->bridge.ddc);
+	return ret;
 }
 
 static void display_connector_remove(struct platform_device *pdev)
-- 
2.34.1

