Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7337D4301F9
	for <lists+dri-devel@lfdr.de>; Sat, 16 Oct 2021 12:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEBE26E433;
	Sat, 16 Oct 2021 10:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE3F06E430
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 10:22:41 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id g10so48458035edj.1
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Oct 2021 03:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UpaN0+D4v6gZi4C1AIXdRvIf3e9k8TCo9M0Z0xiwZZA=;
 b=bVpdXZI2t1pu8Dq2bx9BYsDi8Jaxe8gZVC1bkUVLKjO3ibe87Ybbg1ab+UgLVeXDKb
 m7x45p0HDGuJDf0Dot9aQUuvAnr9q6DMYNrpiiE28WBMTzz7Cmre21wxkaJ8clgPhGeW
 nbd6brzazC4OFiSA9wHzwi0YsAqXfUKfE8qz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UpaN0+D4v6gZi4C1AIXdRvIf3e9k8TCo9M0Z0xiwZZA=;
 b=gKClZrG4VImWojea9+s9swjJrgZ0jHgRTScmJaVh4b5eeK4bTOMZh5vB+3BQXymNJH
 OrVnoN6vOLng70A1pVFbqqhBGA8yVu0KVxdqcKy1s3JxO5hqhx/CkgqFrFuHbIs5m19u
 QMFV7JFA1jjEg+nne5q8DEMfOKyie7V4GIy9Yqhd7f93ahfOnNNHQjU7T8PiP9Uh5ctJ
 k8rB2xIGB/AjXm2iLv9tLeYfi37qG3UwbdeQ22jK5JDv0+EsYeLzRnqjMibE2BsgMSnH
 4pesg6zZpwHdU+YA/YN6IxEAF+MVIZmB72izEMkxb5eThdCVx5lqzljYUpORaPNk1/+S
 BdZw==
X-Gm-Message-State: AOAM530OD+pDRmQoUGdVEB69OX/SXaW9CMzTcRpervWbw/nPhc3ltoZZ
 eL1jKuZbfoMGOT8a5TzH42lnCP5EMiSPpS1Z
X-Google-Smtp-Source: ABdhPJwwaHJDJm9L+CJNdyZDd6ge+ozPrl5Qg+7itKwaQX0evzlEbxXfMHGOf3U9R8mm0BMJs1HoAw==
X-Received: by 2002:a17:906:838c:: with SMTP id
 p12mr13237355ejx.181.1634379760431; 
 Sat, 16 Oct 2021 03:22:40 -0700 (PDT)
Received: from panicking.lan (93-46-124-24.ip107.fastwebnet.it. [93.46.124.24])
 by smtp.gmail.com with ESMTPSA id la1sm6117361ejc.48.2021.10.16.03.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Oct 2021 03:22:39 -0700 (PDT)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] drm/panel: ilitek-ili9881c: Make gpio-reset optional
Date: Sat, 16 Oct 2021 10:22:31 +0000
Message-Id: <20211016102232.202119-5-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211016102232.202119-1-michael@amarulasolutions.com>
References: <20211016102232.202119-1-michael@amarulasolutions.com>
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

Depends in how logic is connected to the board the gpio is
not stricly required.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 .../devicetree/bindings/display/panel/ilitek,ili9881c.yaml      | 1 -
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c                   | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
index 2d4a5643a785..07789d554889 100644
--- a/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
+++ b/Documentation/devicetree/bindings/display/panel/ilitek,ili9881c.yaml
@@ -27,7 +27,6 @@ required:
   - compatible
   - power-supply
   - reg
-  - reset-gpios
 
 additionalProperties: false
 
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index d1f20758ed08..103a16018975 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -883,7 +883,7 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(ctx->power);
 	}
 
-	ctx->reset = devm_gpiod_get(&dsi->dev, "reset", GPIOD_OUT_LOW);
+	ctx->reset = devm_gpiod_get_optional(&dsi->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->reset)) {
 		dev_err(&dsi->dev, "Couldn't get our reset GPIO\n");
 		return PTR_ERR(ctx->reset);
-- 
2.25.1

