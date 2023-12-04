Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CA3BC803DBE
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 19:57:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBF8F10E3D7;
	Mon,  4 Dec 2023 18:57:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7F9910E3CB
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Dec 2023 18:57:26 +0000 (UTC)
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-58d18c224c7so2922105eaf.2
 for <dri-devel@lists.freedesktop.org>; Mon, 04 Dec 2023 10:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701716246; x=1702321046; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6rgTeL5s3ofedwZl2YbFthmW9shcLKv1EiL+fVf829g=;
 b=Dyx1MdjiUOyUcQFi1XkXezWT7i6cCcZ+VfsJ1lIVVzmOVh9wFSFZ0qe2ADGlsMOJWM
 GovlTAFx825PAYsBNZ/CApuQLaR00QRt7moz6GazQ3FiMaFRU9LuSWUtVu98ErPuHvhO
 6ncCRzTMH2/8fweyLSoP23SQSgrjbmHSfjfwew/djzcZ0/ObdX5zSy9T2je5qxupc2Cc
 q/fBN7JBmTqCgk9JOHbvzdo+NlHVe9WfxXnGzWMwLxIzWQLLEVSJQUe3M7dz6r+PGTB0
 S/CVAHaw7m1p8Lfa92PQ23XlzBe3fVqRjxHrd/0ZkMXDUX5yLQbj514rLN3d3m8TZwAR
 fEAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701716246; x=1702321046;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6rgTeL5s3ofedwZl2YbFthmW9shcLKv1EiL+fVf829g=;
 b=JZhoPsCsYdZHqSkGn0YwvGBH0eIUNrz1edl2arH6Nc7V1worRqbUDoI4OG7K5ahlqJ
 5lDSsyV9ixbXSh+0ijQ+ZJLXSjWPCHz7kumt8f1EiPgkX622FPaGD1qzuG2zLd8/j4xs
 fdG9jsM6LHzkZwKSQeup8WSCkj3cf8o0DDdvdAzmhGrdnvnS8Bbl/uzDHw5IuV3q++DI
 RBPAaxFFG9FS0EZdNksX+SRqbb4YyI5I1X+JFYZFJZbzhQ3+XqJGuOGO8SZWw5fpPfTN
 FcHPHShFZf3c5RAkxzOcEGBCz74i+/M/7U2X4qt+/KzKe0m116H6IOJkFZEMkSAS7TRV
 yw8w==
X-Gm-Message-State: AOJu0YzDXCP9YZdRUwBBGp4U4CX8Z1Hsdj3rs8jN/UI67QCmrlSVjEcD
 KZNA5/ANuTeaHpXE6elEH/I=
X-Google-Smtp-Source: AGHT+IHtinyT3UvNVVgfaiVR9PDPfm0VQnP/g1hm2ope27H09s6RXeCMhC4TJSpO0tvX0PHiAXIDwA==
X-Received: by 2002:a4a:2452:0:b0:590:2df8:1bf7 with SMTP id
 v18-20020a4a2452000000b005902df81bf7mr724118oov.4.1701716245953; 
 Mon, 04 Dec 2023 10:57:25 -0800 (PST)
Received: from localhost.localdomain ([75.28.21.198])
 by smtp.gmail.com with ESMTPSA id
 y25-20020a4a2d19000000b00581fc1af0a7sm2073303ooy.28.2023.12.04.10.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 10:57:25 -0800 (PST)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-rockchip@lists.infradead.org
Subject: [PATCH V2 01/10] drm/panel: himax-hx8394: Drop prepare/unprepare
 tracking
Date: Mon,  4 Dec 2023 12:57:10 -0600
Message-Id: <20231204185719.569021-2-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231204185719.569021-1-macroalpha82@gmail.com>
References: <20231204185719.569021-1-macroalpha82@gmail.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 Chris Morgan <macromorgan@hotmail.com>, krzysztof.kozlowski+dt@linaro.org,
 neil.armstrong@linaro.org, sboyd@kernel.org, sam@ravnborg.org,
 mturquette@baylibre.com, javierm@redhat.com, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, mripard@kernel.org, tzimmermann@suse.de,
 quic_jesszhan@quicinc.com, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chris Morgan <macromorgan@hotmail.com>

Drop the panel specific prepare/unprepare logic. This is now tracked
by the DRM stack [1].

[1] commit d2aacaf07395 ("drm/panel: Check for already prepared/enabled in
drm_panel")

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 drivers/gpu/drm/panel/panel-himax-hx8394.c | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-himax-hx8394.c b/drivers/gpu/drm/panel/panel-himax-hx8394.c
index c73243d85de7..3823ff388b96 100644
--- a/drivers/gpu/drm/panel/panel-himax-hx8394.c
+++ b/drivers/gpu/drm/panel/panel-himax-hx8394.c
@@ -68,7 +68,6 @@ struct hx8394 {
 	struct gpio_desc *reset_gpio;
 	struct regulator *vcc;
 	struct regulator *iovcc;
-	bool prepared;
 
 	const struct hx8394_panel_desc *desc;
 };
@@ -262,16 +261,11 @@ static int hx8394_unprepare(struct drm_panel *panel)
 {
 	struct hx8394 *ctx = panel_to_hx8394(panel);
 
-	if (!ctx->prepared)
-		return 0;
-
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 
 	regulator_disable(ctx->iovcc);
 	regulator_disable(ctx->vcc);
 
-	ctx->prepared = false;
-
 	return 0;
 }
 
@@ -280,9 +274,6 @@ static int hx8394_prepare(struct drm_panel *panel)
 	struct hx8394 *ctx = panel_to_hx8394(panel);
 	int ret;
 
-	if (ctx->prepared)
-		return 0;
-
 	gpiod_set_value_cansleep(ctx->reset_gpio, 1);
 
 	ret = regulator_enable(ctx->vcc);
@@ -301,8 +292,6 @@ static int hx8394_prepare(struct drm_panel *panel)
 
 	msleep(180);
 
-	ctx->prepared = true;
-
 	return 0;
 
 disable_vcc:
-- 
2.34.1

