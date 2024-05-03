Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 644AB8BB5E4
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EA6F112A00;
	Fri,  3 May 2024 21:36:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="MOgP2lZk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD1C112A00
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:36:35 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-1e5c7d087e1so1043385ad.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772194; x=1715376994;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oJSS1xLEfY3Y1Nc4TX+Fmok5eKTdIJMR9yqmN0qgIiI=;
 b=MOgP2lZkWRhrXT1H5f1JWr7hNDTueBQrZTDZuzaYTqFt9SRdy+JXLPW4OXB0n6I42k
 kC9VDiphjjp7ZT4YnJ5kK4WDGPx1jFYeJ31LRsfPJ4jPnZUmVlUB8quEcVjVfkGXy3h8
 VnlwlF2MSA6ul9oqbo/3t8rb2PcZ7sNEfd3oI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772194; x=1715376994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oJSS1xLEfY3Y1Nc4TX+Fmok5eKTdIJMR9yqmN0qgIiI=;
 b=kn1snX02QoVfEF+uqL/myEdfm9XixaE//2LDDx258J7oWIpsUM9xaXpFGsVlOqZ12X
 xAfVxHTSvsqneAq9miCh+pzlQ+76jXTO/qRlRqeNsx9pfWJxhFyhzqRM2wUO2u0sLaGf
 cmmPmJRu5YzljprPLzh9qImYTzHMv9kGqef67Ebm7t2HL9vsLv4MPp9eQ4TaUNp94P8l
 MPrOlOoo9ZcV5WOA24fDZM2xBSmH+UqvjR28/5ex8Vimuuj0BM54Nw/yYHkyrzd8e+R1
 B6COzM6XYAJRscnQ4irJmoxVO68b2p2QS9gDNgMg1n6x/65/egoLEgEjnU02SRdw9T96
 +fEw==
X-Gm-Message-State: AOJu0Yye1IhsxCoKphI6emHE7JDCgscBQRUlEDYo6f0TgDwdVarbGxRt
 /BPYVHQCHuggjJ63/x0FoK/cQGK6hSldyaAb+hEZqjfhv3RdV6vtkou1m2u8W25VBLjIiyjZJdZ
 e6A==
X-Google-Smtp-Source: AGHT+IF/xaXv/X0Wte4aZNJO+64pdFolxJxdcSTQcUQ0uEZBKmCrVQEqCkWitBuj2PfiwIvx+UWLZQ==
X-Received: by 2002:a17:903:41d1:b0:1ec:22ca:b290 with SMTP id
 u17-20020a17090341d100b001ec22cab290mr5154916ple.21.1714772194313; 
 Fri, 03 May 2024 14:36:34 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.36.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:36:32 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [RFT PATCH v2 04/48] drm/panel: boe-tv101wum-nl6: Stop tracking
 prepared
Date: Fri,  3 May 2024 14:32:45 -0700
Message-ID: <20240503143327.RFT.v2.4.Ib501f2eceb62016e09cfb17bca29bde0f605a567@changeid>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
In-Reply-To: <20240503213441.177109-1-dianders@chromium.org>
References: <20240503213441.177109-1-dianders@chromium.org>
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

As talked about in commit d2aacaf07395 ("drm/panel: Check for already
prepared/enabled in drm_panel"), we want to remove needless code from
panel drivers that was storing and double-checking the
prepared/enabled state. Even if someone was relying on the
double-check before, that double-check is now in the core and not
needed in individual drivers.

Cc: Jitao Shi <jitao.shi@mediatek.com>
Cc: Cong Yang <yangcong5@huaqin.corp-partner.google.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.

 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
index 0ffe8f8c01de..667e1bb4a58b 100644
--- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
+++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
@@ -50,8 +50,6 @@ struct boe_panel {
 	struct regulator *avee;
 	struct regulator *avdd;
 	struct gpio_desc *enable_gpio;
-
-	bool prepared;
 };
 
 enum dsi_cmd_type {
@@ -1450,9 +1448,6 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 {
 	struct boe_panel *boe = to_boe_panel(panel);
 
-	if (!boe->prepared)
-		return 0;
-
 	if (boe->desc->discharge_on_disable) {
 		regulator_disable(boe->avee);
 		regulator_disable(boe->avdd);
@@ -1471,8 +1466,6 @@ static int boe_panel_unprepare(struct drm_panel *panel)
 		regulator_disable(boe->pp3300);
 	}
 
-	boe->prepared = false;
-
 	return 0;
 }
 
@@ -1481,9 +1474,6 @@ static int boe_panel_prepare(struct drm_panel *panel)
 	struct boe_panel *boe = to_boe_panel(panel);
 	int ret;
 
-	if (boe->prepared)
-		return 0;
-
 	gpiod_set_value(boe->enable_gpio, 0);
 	usleep_range(1000, 1500);
 
@@ -1523,8 +1513,6 @@ static int boe_panel_prepare(struct drm_panel *panel)
 		goto poweroff;
 	}
 
-	boe->prepared = true;
-
 	return 0;
 
 poweroff:
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

