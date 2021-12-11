Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B15C4716CB
	for <lists+dri-devel@lfdr.de>; Sat, 11 Dec 2021 22:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DDC510E7EE;
	Sat, 11 Dec 2021 21:38:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9B1910E7EE
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Dec 2021 21:38:08 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id k23so18573042lje.1
 for <dri-devel@lists.freedesktop.org>; Sat, 11 Dec 2021 13:38:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y5cqVCk6ynWp5U/3Ep3k4Mo6eL6tir3HlEgYMajRnK4=;
 b=OtOehzc58gi64fYKYGJoUhU9yfbyw5erXeRGj9xZ//qaRQtR/innknOTIwss8QsRxX
 uGrRsJb1d2E1wcxH24VILEMMrLn1C7j8APXpVN46pIqXdDi2mV9JNYr8kvFW5gclVsnp
 gB7fo6UO6vmMJLx+RSgX2mlXCjUtYTsC6052zSOKM6SoQLtgE2TKjEI2+f57zJbU5DB2
 nGPFYks1dvbnGj2fOGSBnIVTrY9ReXqb1ibf4JQuUBIsFJ83exRIGGkAclUCfctQlk2C
 bazsgZ0gsuj3/VWLwhZFT/JlQJKDdfjmO1KjsoZTOZMNuvxsYDUhfvoQSVBJPmJsFCKW
 6G5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y5cqVCk6ynWp5U/3Ep3k4Mo6eL6tir3HlEgYMajRnK4=;
 b=IPPg7OqPtkroEr5A16+2r4xD6MKXb6UquiQMtdLh3k+tlo8PAegb7h9Whd9jlu4f5a
 Y3y0N27veW5kOGlwVsd92yxXdRrSWLLr81waf7R0i1AiPC+Rs9mTRjP2yJFKEPTbHqzp
 iITNBbT5t33j3lde3In9fA3seMUlYIMfXsuvisfzDWywXltXV8rb/hY9UwfShYOlFtVZ
 6bK/L9KCiRI2spFVtO990OR9YmhRL/JG5J7qP5kg/Q5Ji1ziFPjp2PIBhRbXNqRnyh0v
 cp1qAQxXbKHMO9TTHmgj1zK5/tI1dzzIHBGwDjvX58YbYVWtfCmwMtURG3QjnHsemY9T
 1uPg==
X-Gm-Message-State: AOAM531Zo2O0efA+CzFsSu7LxN4dX8NF7aarFAcB5K/+Rv5V6qgJPLvT
 8bZpN0/se49EJq7m5nq0CxY=
X-Google-Smtp-Source: ABdhPJxK+AF0es5MIQf67gn1WgcvNfNMLLw8QZninH5UxBgKlGqTHB3Q6eB1OovkgWAQD7IxOF9O5w==
X-Received: by 2002:a2e:2242:: with SMTP id i63mr20232363lji.448.1639258687039; 
 Sat, 11 Dec 2021 13:38:07 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id w14sm786844ljj.7.2021.12.11.13.38.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 13:38:06 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v2 3/3] drm/panel: simple: Add support for HannStar HSD101PWW2
 panel
Date: Sun, 12 Dec 2021 00:36:53 +0300
Message-Id: <20211211213653.17700-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211211213653.17700-1-digetx@gmail.com>
References: <20211211213653.17700-1-digetx@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Svyatoslav Ryhel <clamor95@gmail.com>

Add definition of the HannStar HSD101PWW2 Rev0-A00/A01 LCD
SuperIPS+ HD panel.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index dde033066f3d..f86378ff32a5 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -1927,6 +1927,31 @@ static const struct panel_desc hannstar_hsd100pxn1 = {
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
@@ -3775,6 +3800,9 @@ static const struct of_device_id platform_of_match[] = {
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
2.33.1

