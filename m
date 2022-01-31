Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 917834A4DCC
	for <lists+dri-devel@lfdr.de>; Mon, 31 Jan 2022 19:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD3A10E261;
	Mon, 31 Jan 2022 18:12:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9427D10E261
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 18:12:35 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id u6so28559584lfm.10
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Jan 2022 10:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cLMbzDUhFlSgdQoGKuc6SBBSjoGSeYRwJlFPN5QbfOY=;
 b=ANUFXXwX2YcLIAHhlsl8gAwz4wWPRA0Xx6q0Cv81zIz5wxJM4NrZe/HyWIbPQjJzXb
 /Ae30/sQTePYIB1p0u2pi3tKoqYV6Dna792X5FrDgwvqpE9819OyUyh/yWihNn437W6n
 kjCAVMA9nf+RdayheNYrtzvlYt2UMHthAt5A1vrvjYZXo4RGA3C+EvmA1VOPklpCo0kp
 6BJR3VL+I+S31HtHQ1LbV8yWxRw4mChptQnljGTR8prEEnKG/lR430wqhE5bKanqwMLI
 5fSXMiWU4bt9r5g40pgWoI9dxPTJXlcvNVD83cMZ+oIsjCS46iGnU6I6qBbcZiOlQqH2
 7XEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cLMbzDUhFlSgdQoGKuc6SBBSjoGSeYRwJlFPN5QbfOY=;
 b=OfZXg5lSPZO2tet4OBVqPU6ilvDw0o+KzxHuSJwOuIXoz2b0S96bpIoe9EDB5ot962
 xWnirbMr08RGf6DzfG/ASTuBCTyxRobtlLypMTzIzQUUf36lnxUQ+ie4utkLjv5j1dK/
 LKawHjODSwNnoMaZbWKMybFv65t3dhG5zNAm+kWNStSiGZHLNvl7Tqcx7IIbUfOW+qvj
 GHQWRUfZGJ3RZirhAlagqqvqJNtByKGFn1FYlglWEwYwnubUYQCN6zsKmsED5xQy/7pt
 VrrLgJFWHqjHWQa4o52HFnHaNIv74xVDJxMygbxwIiEX+vs5TrCL8rQw+xcn+BhsMI/G
 hgMg==
X-Gm-Message-State: AOAM532OSF0zlCIbOCsmujO+K6F7xsILUJDpk0gBRiLjbUV4gLDVXgss
 cus45Mo/Lzaoe/QeqYAxmQc=
X-Google-Smtp-Source: ABdhPJymMyjm5MduvH4M1VM7ckT6HH+iAiDsfRx9j23P6J5bCMxDdCIzNtS/+4EYF/aS/385tkmtcg==
X-Received: by 2002:a19:5219:: with SMTP id m25mr17005211lfb.502.1643652753919; 
 Mon, 31 Jan 2022 10:12:33 -0800 (PST)
Received: from localhost.localdomain (109-252-138-136.dynamic.spd-mgts.ru.
 [109.252.138.136])
 by smtp.gmail.com with ESMTPSA id r17sm3391297lfg.237.2022.01.31.10.12.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:12:32 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Svyatoslav Ryhel <clamor95@gmail.com>,
 Anton Bambura <jenneron@protonmail.com>
Subject: [PATCH v4 3/3] drm/panel: simple: Add support for HannStar HSD101PWW2
 panel
Date: Mon, 31 Jan 2022 21:12:08 +0300
Message-Id: <20220131181208.27101-4-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220131181208.27101-1-digetx@gmail.com>
References: <20220131181208.27101-1-digetx@gmail.com>
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
index 9e46db5e359c..1bfa2d1b61fd 100644
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
@@ -3802,6 +3827,9 @@ static const struct of_device_id platform_of_match[] = {
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
2.34.1

