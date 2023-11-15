Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AB67EC721
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 16:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61F0510E061;
	Wed, 15 Nov 2023 15:27:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E5BF10E05A
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 15:26:55 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-6ce2fc858feso3745021a34.3
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 07:26:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700062014; x=1700666814; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sdzIi85lCxQo8zOJTi1gIMrIE4uzV/IjMdOXWzWwuNQ=;
 b=D+2OcIminTlAcQBrPNp+dbuYWwC2ISdUa6DsaDJx5xY9+eb0OocAx8RRNZ6C7J2I0G
 RltB5IfWASmci+aKEGFp0Hjy4Rs7Z82ahn2Y5ZuLdFNQEW0WtG7MdS2QfnSmqN0PsNXz
 YoqMcSMr25mefXEq8WH21Abx5DeCtJQtIFehOkj2ijyAnMeIV9QDseh6KEqPr9TgtibK
 S/STTUwaiZnw4JG0IamM9sSvi6UVZQclM0jtezu3tAz3aJnv9namh/RE5V/VeMvg1ulc
 028SR647KvlUYGNeS87JLnZxjdBSUR7UB30lJIE/tUM1I5ZvFsr0P0q35QQGZj2aroz6
 IPAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700062014; x=1700666814;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sdzIi85lCxQo8zOJTi1gIMrIE4uzV/IjMdOXWzWwuNQ=;
 b=lW5KkI+0pCMpRxQ0PPpzFlePlRNC/1r1R4X90JTrPA7xsihG9nVgKs9yxfKK9c60Ce
 PkbDXjxWw94iv1x1AlBAUICb5As9U9Ur1JY6Ek5iJ/idqPmJAhXxEkxtyDXZzEwIqh1t
 aHmai/tvzgvis7Zz0lATdShUZ1/tIiUB51YAqqavLXqZrdecypaO9lWSBoN9om3Jb1z2
 SrbhMMK8VONXjlhfMfSnLRZCPiCRcb8ZOctUbfYLtK5K5E7OKk1k5lhBEuHOCCNdOqVW
 n4Noor1C2aK6Xx5Q9fjvGCc+YKSygVnZAeXYFlNg2I/8fD9nGi500WHo0xsbwTcWsjuO
 hFVQ==
X-Gm-Message-State: AOJu0Yw0vDZlt6UVWDRPBfyoHrcVSL8Y/3LxomfJNZ0/h+8CiHzia1EA
 WAzs1NXd5ONaLdFbh+neXQKVwu8q54M=
X-Google-Smtp-Source: AGHT+IG6PJK8yUBG7tZHa9H4CJQYGMNGTPJjmHQ7ZdLr0Xh7U5DT9OvCe314f8L9dXM0ZygzxDOVVQ==
X-Received: by 2002:a05:6830:1303:b0:6b8:7d12:423d with SMTP id
 p3-20020a056830130300b006b87d12423dmr5887402otq.18.1700062014508; 
 Wed, 15 Nov 2023 07:26:54 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a056830101200b006cdf9935af2sm398012otp.53.2023.11.15.07.26.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 07:26:54 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/panel-elida-kd35t133: Drop prepare/unprepare logic
Date: Wed, 15 Nov 2023 09:26:47 -0600
Message-Id: <20231115152647.2303283-5-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115152647.2303283-1-macroalpha82@gmail.com>
References: <20231115152647.2303283-1-macroalpha82@gmail.com>
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
Cc: quic_jesszhan@quicinc.com, sam@ravnborg.org,
 Chris Morgan <macromorgan@hotmail.com>, neil.armstrong@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Drop the prepare/unprepare logic, as this is now tracked elsewhere.
Additionally, the driver shutdown is also duplicate as it calls
drm_unprepare and drm_disable which are called anyway when
associated drivers are shutdown/removed.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-elida-kd35t133.c | 28 --------------------
 1 file changed, 28 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-elida-kd35t133.c b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
index 29b4ee63d83b..00791ea81e90 100644
--- a/drivers/gpu/drm/panel/panel-elida-kd35t133.c
+++ b/drivers/gpu/drm/panel/panel-elida-kd35t133.c
@@ -43,7 +43,6 @@ struct kd35t133 {
 	struct regulator *vdd;
 	struct regulator *iovcc;
 	enum drm_panel_orientation orientation;
-	bool prepared;
 };
 
 static inline struct kd35t133 *panel_to_kd35t133(struct drm_panel *panel)
@@ -91,9 +90,6 @@ static int kd35t133_unprepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;
 
-	if (!ctx->prepared)
-		return 0;
-
 	ret = mipi_dsi_dcs_set_display_off(dsi);
 	if (ret < 0)
 		dev_err(ctx->dev, "failed to set display off: %d\n", ret);
@@ -109,8 +105,6 @@ static int kd35t133_unprepare(struct drm_panel *panel)
 	regulator_disable(ctx->iovcc);
 	regulator_disable(ctx->vdd);
 
-	ctx->prepared = false;
-
 	return 0;
 }
 
@@ -120,9 +114,6 @@ static int kd35t133_prepare(struct drm_panel *panel)
 	struct mipi_dsi_device *dsi = to_mipi_dsi_device(ctx->dev);
 	int ret;
 
-	if (ctx->prepared)
-		return 0;
-
 	dev_dbg(ctx->dev, "Resetting the panel\n");
 	ret = regulator_enable(ctx->vdd);
 	if (ret < 0) {
@@ -166,8 +157,6 @@ static int kd35t133_prepare(struct drm_panel *panel)
 
 	msleep(50);
 
-	ctx->prepared = true;
-
 	return 0;
 
 disable_iovcc:
@@ -296,27 +285,11 @@ static int kd35t133_probe(struct mipi_dsi_device *dsi)
 	return 0;
 }
 
-static void kd35t133_shutdown(struct mipi_dsi_device *dsi)
-{
-	struct kd35t133 *ctx = mipi_dsi_get_drvdata(dsi);
-	int ret;
-
-	ret = drm_panel_unprepare(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to unprepare panel: %d\n", ret);
-
-	ret = drm_panel_disable(&ctx->panel);
-	if (ret < 0)
-		dev_err(&dsi->dev, "Failed to disable panel: %d\n", ret);
-}
-
 static void kd35t133_remove(struct mipi_dsi_device *dsi)
 {
 	struct kd35t133 *ctx = mipi_dsi_get_drvdata(dsi);
 	int ret;
 
-	kd35t133_shutdown(dsi);
-
 	ret = mipi_dsi_detach(dsi);
 	if (ret < 0)
 		dev_err(&dsi->dev, "Failed to detach from DSI host: %d\n", ret);
@@ -337,7 +310,6 @@ static struct mipi_dsi_driver kd35t133_driver = {
 	},
 	.probe	= kd35t133_probe,
 	.remove = kd35t133_remove,
-	.shutdown = kd35t133_shutdown,
 };
 module_mipi_dsi_driver(kd35t133_driver);
 
-- 
2.34.1

