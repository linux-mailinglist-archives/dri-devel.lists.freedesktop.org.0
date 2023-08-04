Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AADF770A78
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 23:07:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4008710E762;
	Fri,  4 Aug 2023 21:07:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A98E910E14C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 21:07:33 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-68783b2e40bso1882630b3a.3
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Aug 2023 14:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1691183252; x=1691788052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0DN4Kph2d52NwkUkezdGerL8g/M4NBzXeSqtlHdxPYg=;
 b=c0rxX+Yrg+dyfOnew5Ieiiys+dsK64kVflUDWPMqOLSqOa7AXCAkL9ZLuvhpCcYEwo
 ZC3P/M+gRT+PFUqg5xmhZkOoF7Q5HHhcUenQv7V7LMrtsIzl1fBv8mufuFYamOLuNo9I
 syWN8E49ZMFpB+DcE3YOsvZKlz413yPXfJaGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691183252; x=1691788052;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0DN4Kph2d52NwkUkezdGerL8g/M4NBzXeSqtlHdxPYg=;
 b=SE1cXhlSYod9M9/YZBzKfNL0fMrFAMCWJ0YclBr4EbUysd9wNmIDzTPvEx4qV/mZ/U
 ycev8v57QS4YtxWH8NBvyKBqsZtbyvNtt4zXL5/g6XFpzELx6tkOOvXheGDz9HWn/fn7
 f8ijchRNPrNXK1hH6Roq9YGYPXJEdxJojFoNCyjS05WfZic9vSyWk0X9V+B2SM7ZHhnx
 oY1wNfLVEla48YOe+0CjcVmionFXHIWtMzV7ZcXaYqMMLToybQuZlEBVD7UwI2A10t5y
 xt3ErBD4GC+MIkY08S1YyQ/33oaGzCE3TVNUH5Nk91Qleq0bsRfl9ve0eqr4lhcNRhbJ
 v9TQ==
X-Gm-Message-State: AOJu0Yw4bz1M5Q5cW92fjR/0FvZZC0DqOTXMfgFKVtgbCMVwmwdDxTmN
 OlE0qbNmRMeBH7k3rhE3TWKDMVRMPPdIShkc0kR0dAuR
X-Google-Smtp-Source: AGHT+IFj/Pm4r4SGNE9coQEi+WSMYBsfkipwkLIG42HxYlnCboyKqNLbhsyPIpW6j5objN61Kcq27Q==
X-Received: by 2002:a05:6a21:7795:b0:13f:2187:c51a with SMTP id
 bd21-20020a056a21779500b0013f2187c51amr2605066pzc.34.1691183252742; 
 Fri, 04 Aug 2023 14:07:32 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:e186:e5d2:e60:bad3])
 by smtp.gmail.com with ESMTPSA id
 n22-20020aa78a56000000b0068664ace38asm2037584pfa.19.2023.08.04.14.07.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 14:07:32 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Subject: [RFC PATCH 09/10] drm/panel: sony-acx565akm: Don't double-check
 enabled state in disable
Date: Fri,  4 Aug 2023 14:06:12 -0700
Message-ID: <20230804140605.RFC.9.I6a51b36831a5c7b2b82bccf8c550cf0d076aa541@changeid>
X-Mailer: git-send-email 2.41.0.585.gd2178a4bd4-goog
In-Reply-To: <20230804210644.1862287-1-dianders@chromium.org>
References: <20230804210644.1862287-1-dianders@chromium.org>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As talked about in commit d2aacaf07395 ("drm/panel: Check for already
prepared/enabled in drm_panel"), we want to remove needless code from
panel drivers that was storing and double-checking the
prepared/enabled state. Even if someone was relying on the
double-check before, that double-check is now in the core and not
needed in individual drivers.

The acx565akm seems to do some unique stuff with the "enabled"
state. Specifically:
1. It seems to detect the enabled state based on how the bootloader
   left the panel.
2. It uses the enabled state to prevent certain sysfs files from
   accessing a disabled panel.

We'll leave the "enabled" state tracking for this. However, we can at
least get rid of the double-check when trying to disable. In order to
do this we use the new drm_panel_helper_shutdown() from remove() which
double-checks for us.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 drivers/gpu/drm/panel/panel-sony-acx565akm.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sony-acx565akm.c b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
index 3d6a286056a0..8a8326a94d72 100644
--- a/drivers/gpu/drm/panel/panel-sony-acx565akm.c
+++ b/drivers/gpu/drm/panel/panel-sony-acx565akm.c
@@ -30,6 +30,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_panel.h>
+#include <drm/drm_panel_helper.h>
 
 #define CTRL_DISP_BRIGHTNESS_CTRL_ON		BIT(5)
 #define CTRL_DISP_AMBIENT_LIGHT_CTRL_ON		BIT(4)
@@ -454,9 +455,6 @@ static int acx565akm_power_on(struct acx565akm_panel *lcd)
 
 static void acx565akm_power_off(struct acx565akm_panel *lcd)
 {
-	if (!lcd->enabled)
-		return;
-
 	acx565akm_set_display_state(lcd, 0);
 	acx565akm_set_sleep_mode(lcd, 1);
 	lcd->enabled = false;
@@ -656,8 +654,7 @@ static void acx565akm_remove(struct spi_device *spi)
 	if (lcd->has_bc)
 		acx565akm_backlight_cleanup(lcd);
 
-	drm_panel_disable(&lcd->panel);
-	drm_panel_unprepare(&lcd->panel);
+	drm_panel_helper_shutdown(&lcd->panel);
 }
 
 static const struct of_device_id acx565akm_of_match[] = {
-- 
2.41.0.585.gd2178a4bd4-goog

