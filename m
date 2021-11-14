Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7144244FB66
	for <lists+dri-devel@lfdr.de>; Sun, 14 Nov 2021 21:04:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FA1689E06;
	Sun, 14 Nov 2021 20:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7206489DF9
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 20:04:50 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id z8so30770837ljz.9
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Nov 2021 12:04:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TQZiCP3YzsvmkZD6Z7bgEa5sOkxvqLSTLRbNZEye2ZI=;
 b=difuj7H0lMKtMdGpF58hKW0rW15oFUmE9nHNa5fgB5JyPAIwrd/q4KDiFFNYJmgRUV
 ezka4FNHAL0Pt/N/ezShb39s1xCVjJlTj/LwrL/hXvd3LOZdu7pSIHALHzWciZrQGKxp
 XSuxmd2b39Z4fQhAi+cjCQtwDUK/YwGdpx3yo2hlKIcOmfAXgrZvK/hWmoP1nKii75kf
 qJLKfLEswgB+hjxT+fRFRiMWSFEcnD4eiLmk9CqRVtj8x6Gc2m4oA5qlgCGqi8F39vk8
 azDOwp0/9s2sg9HxdPjZ9dQOsIEXahSFJ2LnsiPsTid9TMPFUxMFYzvam8TbHKEmEeVX
 5PoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TQZiCP3YzsvmkZD6Z7bgEa5sOkxvqLSTLRbNZEye2ZI=;
 b=rKXsxt6scKZA+a8P+q8R27M2nJKaxLidfP1uT4h98KAqzL6yRkuZ3lEO7Q+VgmZiJ7
 WGWy/0R6I6iLeiIUE0+vSj7fmEPwJP1aNW0Vj49Vl9+EXIcjETnf1R8JvuWRz27OAsQ6
 FZO05Cb3QuO6TI1ZnY02jkMg7nl73wargj3bMwEH7hfQMHQXjTsBQ+suYmDEcUvfHZIH
 okeWgWCt7/dEn/Dukoa0lpQBbERl2eAOYNluxo+FTNQhmYyUn0xkV4y3oePU3/sHoThT
 nvyqKOPb96aYf/4eca6UMybeegc+Sk1ihJ3C9nihFrUzChYCAurJQgjW/3ZBGLs3bWse
 IkeQ==
X-Gm-Message-State: AOAM530ILFG4gPIXzmeJXdoyau2gv5CEdUwX6gt+yWOeF+me9cH8fFJE
 EzD/o38UXlC9l9S9Fq0ERFM=
X-Google-Smtp-Source: ABdhPJz2wSMbwjLGs/janFR3xlIJsEDFVX/vf7X8IKymWar31yaYnOoG+z12y9naoTLURsf8eNZu7g==
X-Received: by 2002:a2e:890d:: with SMTP id d13mr32746484lji.396.1636920288791; 
 Sun, 14 Nov 2021 12:04:48 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru.
 [46.138.46.211])
 by smtp.gmail.com with ESMTPSA id g4sm1193914lfv.288.2021.11.14.12.04.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 12:04:48 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>
Subject: [PATCH v1 2/2] drm/panel: simple: Add support for HannStar HSD101PWW2
 panel
Date: Sun, 14 Nov 2021 23:04:31 +0300
Message-Id: <20211114200431.28484-3-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211114200431.28484-1-digetx@gmail.com>
References: <20211114200431.28484-1-digetx@gmail.com>
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
---
 drivers/gpu/drm/panel/panel-simple.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index eb475a3a774b..8b7033048f83 100644
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
@@ -3725,6 +3750,9 @@ static const struct of_device_id platform_of_match[] = {
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

