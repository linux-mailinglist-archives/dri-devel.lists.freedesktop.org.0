Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0A553BDB4
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 20:01:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DF59113477;
	Thu,  2 Jun 2022 18:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C39A5113476
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 18:01:28 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id b8so7236756edf.11
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 11:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CBkaCoK6wuMtRbb6NmA5F8dDDK95iOEjJpqmo1bo7RU=;
 b=ZpoxLgXU602v2G/Xd3ivQRZ3M5INDPN8DNhTpEgbihmrZIwuUIQqjuMUHGGYehz9i3
 BfZBBrYZOWM6IaNyFU6E+00dNVzVwDW6xwpedw6ki5XAVrDxxGz2ed6hU/XGmtytfyPB
 4zRcXaWVMFaa35F65YMuli1Y3LV03vybRbLGb6zXrnspwuyBUo/70qIA6d6VZEpWVDaw
 l94LfOOUOoIYIOS/OQSX7/VXgosmyXrdT6pwhA+QRqMG2BP3Gv4kVP52VonZiD0z357m
 h79lWxSqNiv4A/PCv3ur4CfXuyDHDvBA0ZB3GOQMI2VmT6CDzqlAIFXnoECb4Q5VjLrW
 BCzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CBkaCoK6wuMtRbb6NmA5F8dDDK95iOEjJpqmo1bo7RU=;
 b=NoGyMLnj1JT2NMb5ea30HL9xJboMf8ev/6vExCbKHuiK6l1okQo+JMfBQEXJuTg/3t
 1pjoShGHG0la/XrGL2YGR/rM4AguZPSNz+KwT6rOnPLtLPAsTebgX+jtD+wjipUKjW+W
 9p9CjM6WC8PHTvyWqgvXFN4dfH6O2bQ4mlu1LC1L8feRua/X3C4ueadxs7RT5dDT5fwl
 ymosRnFAaUlEAbaV5AhQ5HlFv28RXr4Nzc7JmvwuA4PrgoIj+ijvJOb5qVNtGD92MCd7
 Lwo/Dz82mlADmcS8cOgebwomREv49lYLcRyvCunTUAXSqvg8AyuaXI0Jud3lCHJxY/W7
 iffA==
X-Gm-Message-State: AOAM533hqCD0Bwv2Vs8iTxC5Uu+rU35mn2RLS3S8sQ2UmGvkHH7F4fXW
 RSZMk+8zTNMv2CZPNIfzD6I=
X-Google-Smtp-Source: ABdhPJzDb6Kdk0KW4bBqFxqLDw7MsjqgvypVVZTxyU0DlHbSHwe3R6lMclgq9JGCWeJgyKNpDQ/LrA==
X-Received: by 2002:a05:6402:1007:b0:428:beb6:f483 with SMTP id
 c7-20020a056402100700b00428beb6f483mr6742760edu.391.1654192887279; 
 Thu, 02 Jun 2022 11:01:27 -0700 (PDT)
Received: from orangepi3.mydomain.example ([195.234.74.2])
 by smtp.gmail.com with ESMTPSA id
 kx16-20020a170907775000b00706e8ac43b8sm1972348ejc.199.2022.06.02.11.01.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 11:01:24 -0700 (PDT)
From: Roman Stratiienko <r.stratiienko@gmail.com>
To: mripard@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
 airlied@linux.ie, daniel@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, megi@xff.cz
Subject: [PATCH] drm/sun4i: sun8i: Add the ability to keep scaler enabled for
 VI layer
Date: Thu,  2 Jun 2022 18:01:18 +0000
Message-Id: <20220602180118.66170-1-r.stratiienko@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Roman Stratiienko <r.stratiienko@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to DE2.0/DE3.0 manual VI scaler enable register is double
buffered, but de facto it doesn't, or the hardware has the shadow
register latching issues which causes single-frame picture corruption
after changing the state of scaler enable register.

Allow the user to keep the scaler always enabled, preventing the UI
glitches on the transition from scaled to unscaled state.

NOTE:
UI layer scaler has more registers with double-buffering issue and can't
be workarounded in the same manner.

You may find a python test and a demo video for this issue at [1]

[1]: https://github.com/GloDroid/glodroid_tests/issues/4
Signed-off-by: Roman Stratiienko <r.stratiienko@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_mixer.c    | 12 ++++++++++++
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  4 +++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 71ab0a00b4de..15cad0330f66 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -27,6 +27,18 @@
 #include "sun8i_vi_layer.h"
 #include "sunxi_engine.h"
 
+/* According to DE2.0/DE3.0 manual VI scaler enable register is double
+ * buffered, but de facto it doesn't, or the hardware has the shadow
+ * register latching issues which causes single-frame picture corruption
+ * after changing the state of scaler enable register.
+ * Allow the user to keep the scaler always enabled, preventing the UI
+ * glitches on the transition from scaled to unscaled state.
+ */
+int sun8i_vi_keep_scaler_enabled;
+MODULE_PARM_DESC(keep_vi_scaler_enabled,
+		 "Keep VI scaler enabled (1 = enabled, 0 = disabled (default))");
+module_param_named(keep_vi_scaler_enabled, sun8i_vi_keep_scaler_enabled, int, 0644);
+
 struct de2_fmt_info {
 	u32	drm_fmt;
 	u32	de2_fmt;
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 662ba1018cc4..f005ab883503 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -17,6 +17,8 @@
 #include "sun8i_vi_layer.h"
 #include "sun8i_vi_scaler.h"
 
+extern int sun8i_vi_keep_scaler_enabled;
+
 static void sun8i_vi_layer_enable(struct sun8i_mixer *mixer, int channel,
 				  int overlay, bool enable, unsigned int zpos)
 {
@@ -149,7 +151,7 @@ static int sun8i_vi_layer_update_coord(struct sun8i_mixer *mixer, int channel,
 	 */
 	subsampled = format->hsub > 1 || format->vsub > 1;
 
-	if (insize != outsize || subsampled || hphase || vphase) {
+	if (insize != outsize || subsampled || hphase || vphase || sun8i_vi_keep_scaler_enabled) {
 		unsigned int scanline, required;
 		struct drm_display_mode *mode;
 		u32 hscale, vscale, fps;
-- 
2.30.2

