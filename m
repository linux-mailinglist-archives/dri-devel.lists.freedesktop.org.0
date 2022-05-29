Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F26537455
	for <lists+dri-devel@lfdr.de>; Mon, 30 May 2022 08:15:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3CE10EE5C;
	Mon, 30 May 2022 06:15:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 008F410EB52
 for <dri-devel@lists.freedesktop.org>; Sun, 29 May 2022 18:06:13 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 v4-20020a1cac04000000b00397001398c0so7246558wme.5
 for <dri-devel@lists.freedesktop.org>; Sun, 29 May 2022 11:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sLHIukUkBNLikfr8LE6F72H0XZdEF3+8TPuvOmboOcI=;
 b=q6YRGtUng7jTkgFIREYfFdNMXaXc3P/uwUc9qSBoZKxuyCw7l9jTzi5W2AAcOvD6nn
 /T6j5Bq7P/HYp6ji4bNfI5vzhNnbfHvau154Xm+d2uxrYH9FTex5S/wAoLIcJUz18mW8
 nWjIxJpWln62W+4JDsScVJKb4oR/jvGGZnLQA5Yk6Cam0YNn/EwPcA/A04rjuvwTcwaB
 tpoSyjwvbi3hFwYbRI1HAL/AjrFFBcLfI85nltNYcPWYEHUggzfswV2ZxJF9JIO2yzx4
 UH0x5VayizSceebBExn13LXAXZWEqrzzXdfO55E5kmD+ncZeNz8LXJOJ4gqtm6yIWaBb
 1icw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sLHIukUkBNLikfr8LE6F72H0XZdEF3+8TPuvOmboOcI=;
 b=rYit9JSRSG5hqbQkF7Msfvx4xjjPon2Q2bRNJyYSRop/NPIQCzczvS54uyZN6Jer6g
 vERKMzO3da7MGrfHlZnLDsaf58flj0C7Snvha5INR0U5b26J0/S7PH9+TRiZVwblF+2x
 r+uK70KaXXcnTZbEAGUl0VkizL2qMZPBhY9PtcGjl9oMAgYArLcT9Sx0IzXJIsGb/Ajv
 PMI5Sd+Ghb0sv+G7T+kr1Z1N8jgerhVr1Z2V+c3tYN1l4IdSSO2AyrDgSFxjryF8HwKV
 oaCWRvEVg29VyIT6Zagkz7M80uV8S18wcfAJW6nSvUYWzTahdCrPBQ4HpzHXfu51q3LM
 LmLw==
X-Gm-Message-State: AOAM5300lgVh4BNVg1iqWiloeKzzLr47QSWXFh16lBp6uZsVp4GxFUH9
 QpStSA1ntHwrz77KF7NgyG8=
X-Google-Smtp-Source: ABdhPJyb8iSO3fSTkbzE+IIpm38NksmGKQfy6w3HWePmJnmCZHhAX1WitMykwPHY4y48ln0tkpZdKw==
X-Received: by 2002:a05:600c:4f09:b0:397:788b:33af with SMTP id
 l9-20020a05600c4f0900b00397788b33afmr15812702wmq.94.1653847572455; 
 Sun, 29 May 2022 11:06:12 -0700 (PDT)
Received: from localhost.localdomain ([188.163.112.60])
 by smtp.gmail.com with ESMTPSA id
 q7-20020a056000136700b002100f2e6a7dsm7008516wrz.93.2022.05.29.11.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 May 2022 11:06:12 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Svyatoslav Ruhel <clamor95@gmail.com>, Dmitry Osipenko <digetx@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v5 3/3] drm/panel: simple: Add support for HannStar HSD101PWW2
 panel
Date: Sun, 29 May 2022 21:05:48 +0300
Message-Id: <20220529180548.9942-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220529180548.9942-1-clamor95@gmail.com>
References: <20220529180548.9942-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 30 May 2022 06:15:25 +0000
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add definition of the HannStar HSD101PWW2 Rev0-A00/A01 LCD
SuperIPS+ HD panel.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index a34f4198a534..915b7cecf451 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1928,6 +1928,31 @@ static const struct panel_desc hannstar_hsd100pxn1 = {
 	.connector_type = DRM_MODE_CONNECTOR_LVDS,
 };
 
+static const struct display_timing hannstar_hsd101pww2_timing = {
+	.pixelclock = { 64300000, 71100000, 82000000 },
+	.hactive = { 1280, 1280, 1280 },
+	.hfront_porch = { 1, 1, 10 },
+	.hback_porch = { 1, 1, 10 },
+	.hsync_len = { 58, 158, 661 },
+	.vactive = { 800, 800, 800 },
+	.vfront_porch = { 1, 1, 10 },
+	.vback_porch = { 1, 1, 10 },
+	.vsync_len = { 1, 21, 203 },
+	.flags = DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc hannstar_hsd101pww2 = {
+	.timings = &hannstar_hsd101pww2_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 217,
+		.height = 136,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
 static const struct drm_display_mode hitachi_tx23d38vm0caa_mode = {
 	.clock = 33333,
 	.hdisplay = 800,
@@ -3834,6 +3859,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "hannstar,hsd100pxn1",
 		.data = &hannstar_hsd100pxn1,
+	}, {
+		.compatible = "hannstar,hsd101pww2",
+		.data = &hannstar_hsd101pww2,
 	}, {
 		.compatible = "hit,tx23d38vm0caa",
 		.data = &hitachi_tx23d38vm0caa
-- 
2.25.1

