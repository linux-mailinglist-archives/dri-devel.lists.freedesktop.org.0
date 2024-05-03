Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C27688BB602
	for <lists+dri-devel@lfdr.de>; Fri,  3 May 2024 23:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB5110F880;
	Fri,  3 May 2024 21:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="YfBBG958";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com
 [209.85.214.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433A4112A0A
 for <dri-devel@lists.freedesktop.org>; Fri,  3 May 2024 21:37:29 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1ed0abbf706so1070875ad.2
 for <dri-devel@lists.freedesktop.org>; Fri, 03 May 2024 14:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1714772248; x=1715377048;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Vm5pMW+JcxQoAhIpk954JqF6buuPfxcd3q3C5XmFPm8=;
 b=YfBBG958od2GNyv+dJWRRtxtvOKginBwT1m0PRl+OEiA2aMIv4LhaR4p7lAJTUA+9d
 yRfrEWCpJ2D4+6EnZPE93+u0AosPzUKPnD0q0/z4dnKrIFu/tSxqHVh75wIAIQSuzd7L
 GVorhifXBxDyidGILkEXW4+O9CGOa83eKAiNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714772248; x=1715377048;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Vm5pMW+JcxQoAhIpk954JqF6buuPfxcd3q3C5XmFPm8=;
 b=PGyzSsw8vk/ZlTIzzqDrTOiSAgIs6RaZchWMwOFB16r5A3F5KBa+MaEZC2CDc1YqL9
 Nvc2nwMxCbsvtk8CKJBVxky/Gy/R8yS5GaxDdNZzArhzIXTMBagb7eDZczszGfXk9C9R
 gbgMk0Dzs+jnA34BJokS2FRJBI/J9nJaBlJ3Q/bR7MrokWSNPwYRJkB9cAIfYboOEqv/
 mj9DFzI02pPxPkvphNbe5KIL6dXawD3qKWqzAyL4Ds5xiUnOM5hEOAdVLR+DhCSQuXVh
 vr1quqEA4r4JI6EGRyvq4C4VLz+U8m5xGeSW3QNdt8EbL685NwzvH4D02V4KdcFQJ1u+
 YWBA==
X-Gm-Message-State: AOJu0Yzi234Rjc8MCLJzcPhFF+W1l2VZYh8ddz2UqlnpTmoJW6w/PTaE
 hCs9a/ja7jXPidisR8fe9CC4/DCGKL8Qq5AkXauB3gM2DCZQzHlboIInh9nlDDEZz8Yfsmp+I89
 YeA==
X-Google-Smtp-Source: AGHT+IFYxFgWOwV/QXfwpPyO6iPfA33qW7XGRgN/4aov9d0tBWLiBcNJ5IccHks/fAhE+4fNaDTPow==
X-Received: by 2002:a17:902:e54d:b0:1e6:7731:80 with SMTP id
 n13-20020a170902e54d00b001e677310080mr5258220plf.11.1714772248114; 
 Fri, 03 May 2024 14:37:28 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:fb6a:b54b:7580:64f3])
 by smtp.gmail.com with ESMTPSA id
 j12-20020a170903024c00b001eb51a46f5bsm3729134plh.43.2024.05.03.14.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 14:37:27 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: dri-devel@lists.freedesktop.org,
	Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 linux-kernel@vger.kernel.org
Subject: [RFT PATCH v2 27/48] drm/panel: simple: Add a comment about
 unprepare+disable at shutdown/remove
Date: Fri,  3 May 2024 14:33:08 -0700
Message-ID: <20240503143327.RFT.v2.27.I639183ac987e139092491a94e22d46a5d857580c@changeid>
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

It's the responsibility of a correctly written DRM modeset driver to
call drm_atomic_helper_shutdown() at shutdown time and that should be
disabling / unpreparing the panel if needed. Panel drivers shouldn't
be calling these functions themselves.

A recent effort was made to fix as many DRM modeset drivers as
possible [1] [2] [3] and most drivers are fixed now.

Unfortunately, it's very difficult to know exactly which DRM modeset
drivers are using panel-simple due to the sheer number of panels it
handles. For now, we'll leave the calls and just add a comment to keep
people from copying this code.

[1] https://lore.kernel.org/r/20230901234015.566018-1-dianders@chromium.org
[2] https://lore.kernel.org/r/20230901234202.566951-1-dianders@chromium.org
[3] https://lore.kernel.org/r/20230921192749.1542462-1-dianders@chromium.org

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Only handle 1 panel per patch.
- Split removal of prepared/enabled from handling of remove/shutdown.
- panel-edp and panel-simple just get a comment now.

 drivers/gpu/drm/panel/panel-simple.c | 33 +++++++++++++++++++---------
 1 file changed, 23 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 42d902d2bbbe..f39122ffdead 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -716,26 +716,39 @@ static int panel_simple_probe(struct device *dev, const struct panel_desc *desc)
 	return err;
 }
 
-static void panel_simple_remove(struct device *dev)
+static void panel_simple_shutdown(struct device *dev)
 {
 	struct panel_simple *panel = dev_get_drvdata(dev);
 
-	drm_panel_remove(&panel->base);
+	/*
+	 * NOTE: the following two calls don't really belong here. It is the
+	 * responsibility of a correctly written DRM modeset driver to call
+	 * drm_atomic_helper_shutdown() at shutdown time and that should
+	 * cause the panel to be disabled / unprepared if needed. For now,
+	 * however, we'll keep these calls due to the sheer number of
+	 * different DRM modeset drivers used with panel-simple. The fact that
+	 * we're calling these and _also_ the drm_atomic_helper_shutdown()
+	 * will try to disable/unprepare means that we can get a warning about
+	 * trying to disable/unprepare an already disabled/unprepared panel,
+	 * but that's something we'll have to live with until we've confirmed
+	 * that all DRM modeset drivers are properly calling
+	 * drm_atomic_helper_shutdown().
+	 */
 	drm_panel_disable(&panel->base);
 	drm_panel_unprepare(&panel->base);
-
-	pm_runtime_dont_use_autosuspend(dev);
-	pm_runtime_disable(dev);
-	if (panel->ddc)
-		put_device(&panel->ddc->dev);
 }
 
-static void panel_simple_shutdown(struct device *dev)
+static void panel_simple_remove(struct device *dev)
 {
 	struct panel_simple *panel = dev_get_drvdata(dev);
 
-	drm_panel_disable(&panel->base);
-	drm_panel_unprepare(&panel->base);
+	drm_panel_remove(&panel->base);
+	panel_simple_shutdown(dev);
+
+	pm_runtime_dont_use_autosuspend(dev);
+	pm_runtime_disable(dev);
+	if (panel->ddc)
+		put_device(&panel->ddc->dev);
 }
 
 static const struct drm_display_mode ampire_am_1280800n3tzqw_t00h_mode = {
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog

