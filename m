Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E9F70E73F
	for <lists+dri-devel@lfdr.de>; Tue, 23 May 2023 23:21:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5BE510E4E2;
	Tue, 23 May 2023 21:20:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [IPv6:2a00:1450:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED3C10E4EC
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 21:20:57 +0000 (UTC)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-96aae59bbd6so13001266b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 May 2023 14:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684876855; x=1687468855;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=77vshvp41bukXkaBQCstB9hsqVQeWFOjbLVsOOf4RiY=;
 b=hFvGXinPKssThZK/pAXYPEm+Ow3eMYAZmIQER5Ts6cdvS9WIhb6MsfLRBAszf/WYFo
 rO1/L4178BJcYM8ITpbhPf7xU+uHaEYYsc4apo1Du/d2diSsZX6CbxbWlb6x3uYGXsRo
 sf2IsWiW/eUkB3rrMjNiEzMtUy0wUZ+r9za6w9Mez7NmN33RZvRQp4EPdqwjgWGOtB7g
 w3T+RmdYvpKAJEk6XjB7+SC7aa3Ip6IFTu3ksQhWo+slA8Mg2F12O2TvPQrhxfr/ywWf
 nla6JITgJOrIe/Ma+mlSsnLjgaWYdJWmHk3edjRWVqRWHBL7vfLEMi+VstrodS5zClzy
 KuJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684876855; x=1687468855;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=77vshvp41bukXkaBQCstB9hsqVQeWFOjbLVsOOf4RiY=;
 b=ZBHMZz7alHygPEMSAbjiNIdPXhxqogIRjw63DdX1m/9rrgieEXJoCWKfNn/D8mewcV
 nrEhPEY44RAEhL9OyDAoE0SjlB6dGBuDoUszUIIJ2twCKBPGuN79qkdExYG0YnU9GofS
 /6y0pDZouWg0NhtJ05+2SWsV0Zhs1O9qP0swy495d+nkEnmimnTl2QMjR0xbHSisIFjm
 CbOwWEeXs4sCgC9hqhUsARkMIXahloIVnzM81G2FU2/tiOTxi5A4exL8jlB2oRAKElq0
 C9/QgWBCJ/1fwO7MS1cPFWsHr97d+TeWSqJolm+N/AsAVrl+uOG9LGjFKdgug+j2kAmh
 zZHA==
X-Gm-Message-State: AC+VfDymhLzIJbUUiuI81YyvUf96ZmE5rliXenB5THbfUj+xBRCjH8Bb
 Fac9LHdlFjhAYiKTChx0nMA=
X-Google-Smtp-Source: ACHHUZ7w6Xn++2uHIoRKaXVLEbyMFKPna0sHTuomnld3Bm1/QCiT6F1yZT/MA3bMW2bH/J7nd+adpg==
X-Received: by 2002:a17:907:26ca:b0:969:bac4:8e22 with SMTP id
 bp10-20020a17090726ca00b00969bac48e22mr13848584ejc.26.1684876855458; 
 Tue, 23 May 2023 14:20:55 -0700 (PDT)
Received: from localhost.my.domain (83.11.222.198.ipv4.supernova.orange.pl.
 [83.11.222.198]) by smtp.gmail.com with ESMTPSA id
 kl3-20020a170907994300b00966392de4easm4856953ejc.14.2023.05.23.14.20.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 14:20:55 -0700 (PDT)
From: Artur Weber <aweber.kernel@gmail.com>
To: Nathan Chancellor <nathan@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH] drm/panel: samsung-s6d7aa0: use pointer for drm_mode in panel
 desc struct
Date: Tue, 23 May 2023 23:20:50 +0200
Message-Id: <20230523212050.9970-1-aweber.kernel@gmail.com>
X-Mailer: git-send-email 2.40.1
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
Cc: Artur Weber <aweber.kernel@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tom Rix <trix@redhat.com>, thierry.reding@gmail.com,
 Nikita Travkin <nikita@trvn.ru>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fixes compilation errors on older GCC versions (before 8.x) and Clang
after changes introduced in commit 6810bb390282 ("drm/panel: Add
Samsung S6D7AA0 panel controller driver"). Tested with GCC 13.1.1,
GCC 6.4.0 and Clang 16.0.3.

Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
---
 drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
index f532aa018428..102e1fc7ee38 100644
--- a/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
+++ b/drivers/gpu/drm/panel/panel-samsung-s6d7aa0.c
@@ -37,7 +37,7 @@ struct s6d7aa0_panel_desc {
 	unsigned int panel_type;
 	int (*init_func)(struct s6d7aa0 *ctx);
 	int (*off_func)(struct s6d7aa0 *ctx);
-	const struct drm_display_mode drm_mode;
+	const struct drm_display_mode *drm_mode;
 	unsigned long mode_flags;
 	u32 bus_flags;
 	bool has_backlight;
@@ -309,7 +309,7 @@ static const struct s6d7aa0_panel_desc s6d7aa0_lsl080al02_desc = {
 	.panel_type = S6D7AA0_PANEL_LSL080AL02,
 	.init_func = s6d7aa0_lsl080al02_init,
 	.off_func = s6d7aa0_lsl080al02_off,
-	.drm_mode = s6d7aa0_lsl080al02_mode,
+	.drm_mode = &s6d7aa0_lsl080al02_mode,
 	.mode_flags = MIPI_DSI_MODE_VSYNC_FLUSH | MIPI_DSI_MODE_VIDEO_NO_HFP,
 	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
 
@@ -412,7 +412,7 @@ static const struct s6d7aa0_panel_desc s6d7aa0_lsl080al03_desc = {
 	.panel_type = S6D7AA0_PANEL_LSL080AL03,
 	.init_func = s6d7aa0_lsl080al03_init,
 	.off_func = s6d7aa0_lsl080al03_off,
-	.drm_mode = s6d7aa0_lsl080al03_mode,
+	.drm_mode = &s6d7aa0_lsl080al03_mode,
 	.mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET,
 	.bus_flags = 0,
 
@@ -440,7 +440,7 @@ static const struct s6d7aa0_panel_desc s6d7aa0_ltl101at01_desc = {
 	.panel_type = S6D7AA0_PANEL_LTL101AT01,
 	.init_func = s6d7aa0_lsl080al03_init, /* Similar init to LSL080AL03 */
 	.off_func = s6d7aa0_lsl080al03_off,
-	.drm_mode = s6d7aa0_ltl101at01_mode,
+	.drm_mode = &s6d7aa0_ltl101at01_mode,
 	.mode_flags = MIPI_DSI_MODE_NO_EOT_PACKET,
 	.bus_flags = 0,
 
@@ -458,7 +458,7 @@ static int s6d7aa0_get_modes(struct drm_panel *panel,
 	if (!ctx)
 		return -EINVAL;
 
-	mode = drm_mode_duplicate(connector->dev, &ctx->desc->drm_mode);
+	mode = drm_mode_duplicate(connector->dev, ctx->desc->drm_mode);
 	if (!mode)
 		return -ENOMEM;
 

base-commit: 37cee4876a45a5c3da79a83d34ed4f3c68548aef
-- 
2.40.1

