Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F5E4693CA
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 11:28:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCA37AE4A;
	Mon,  6 Dec 2021 10:21:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AF056EA76
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Dec 2021 09:51:36 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id l16so15751447wrp.11
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Dec 2021 01:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YnDD8hPVfUDOU/KGWuOx07TorIhBDUwRqn7YXojqyVg=;
 b=Kax6b4tv2PQK5P26j8LkzHl/KB0C56siAvcz8GzZtfZequheNActCXD8Zfu/+hihLA
 jWD0X6q+FcwQFAwBRw6ZHj9ubFfozSlYYjOTzZ2K5ZB1WN+6kus/zJwlbLyC/LpeVJFE
 dgTxalJi3c7vDv7h/rxTWvw25aAFUM2U4BzjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YnDD8hPVfUDOU/KGWuOx07TorIhBDUwRqn7YXojqyVg=;
 b=STc76JSLIquWANMx/oQ4KsIRDJQ9Qx7S/tzYLFAQDa9mDpk6X0GXHzZo9oeI4RU6c8
 U6Xy83fVGwwr42+3M0BBB4PtlX1Jf6kMso0c2Kz+eXrBE2jE+k24QoqAJGEYYjIeJggD
 B62Cl0npcubcbiUV7HVLVcrel3KjS9ALc8X5Wufz/VF5dJYSzUxTsxr1cZ0VfwI+TL78
 Gfn46oli0nVgj5K0Ya+yhiPnm3GSKL86/UjXuE1joX9e5bDl72gIX/yeTZ29zSJxUY6p
 y2FHC3Wjbp6fEpuBcwvllCccN6rS+KI/ab/ZHG9BP+CcYvyxBzrSMsfFXLAhK8apHuT4
 GHIQ==
X-Gm-Message-State: AOAM533/DUAL1W+U4waXVSUzT+Zrrth7R5n3ZTmSJR8D6xNUhB/4Advi
 xxXA8FS17q43ef9P5fRgparub/Prf2EPdw==
X-Google-Smtp-Source: ABdhPJyOoNppMxcfwgve61Bh1spDFBSu8mXryPre5Lm3XKO55b456h4OZ5zPOgjw6ixSXIY14o19cQ==
X-Received: by 2002:adf:fcce:: with SMTP id f14mr36517905wrs.595.1638697895241; 
 Sun, 05 Dec 2021 01:51:35 -0800 (PST)
Received: from panicking.amarulasolutions.com ([2.198.172.162])
 by smtp.gmail.com with ESMTPSA id 38sm8482223wrc.1.2021.12.05.01.51.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 01:51:34 -0800 (PST)
From: Michael Trimarchi <michael@amarulasolutions.com>
To: Sam Ravnborg <sam@ravnborg.org>,
	dri-devel@lists.freedesktop.org
Subject: [RFC PATCH] drm/panel: Fix panel removal if mipi_dsi_attach fail
Date: Sun,  5 Dec 2021 10:51:31 +0100
Message-Id: <20211205095131.1166024-1-michael@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: David Airlie <airlied@linux.ie>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If mipi_dsi_attach fail the panel must be removed from panel list
because it get be probed back but later for -EPROBE_DEFER. A lot
of panels are affect on same issue, fix them all

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
 drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c | 6 +++++-
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c         | 6 +++++-
 drivers/gpu/drm/panel/panel-innolux-p079zca.c         | 8 +++++++-
 drivers/gpu/drm/panel/panel-jdi-lt070me05000.c        | 6 +++++-
 drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c    | 6 +++++-
 drivers/gpu/drm/panel/panel-novatek-nt36672a.c        | 6 +++++-
 drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c  | 6 +++++-
 drivers/gpu/drm/panel/panel-ronbo-rb070d30.c          | 6 +++++-
 drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c       | 6 +++++-
 drivers/gpu/drm/panel/panel-sitronix-st7701.c         | 6 +++++-
 drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c          | 6 +++++-
 11 files changed, 57 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
index 581661b506f8..585f61cc42f0 100644
--- a/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
+++ b/drivers/gpu/drm/panel/panel-feiyang-fy07024di26a30d.c
@@ -227,7 +227,11 @@ static int feiyang_dsi_probe(struct mipi_dsi_device *dsi)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->lanes = 4;
 
-	return mipi_dsi_attach(dsi);
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0)
+		drm_panel_remove(&ctx->panel);
+
+	return ret;
 }
 
 static int feiyang_dsi_remove(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index 534dd7414d42..9dc6bafec3f3 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -674,7 +674,11 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->lanes = 4;
 
-	return mipi_dsi_attach(dsi);
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0)
+		drm_panel_remove(&ctx->panel);
+
+	return ret;
 }
 
 static int ili9881c_dsi_remove(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/panel/panel-innolux-p079zca.c b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
index aea316225391..d5abd792f12f 100644
--- a/drivers/gpu/drm/panel/panel-innolux-p079zca.c
+++ b/drivers/gpu/drm/panel/panel-innolux-p079zca.c
@@ -495,7 +495,13 @@ static int innolux_panel_probe(struct mipi_dsi_device *dsi)
 	if (err < 0)
 		return err;
 
-	return mipi_dsi_attach(dsi);
+	err = mipi_dsi_attach(dsi);
+	if (err < 0) {
+		struct innolux_panel *innolux = mipi_dsi_get_drvdata(dsi);
+		innolux_panel_del(innolux);
+	}
+
+	return err;
 }
 
 static int innolux_panel_remove(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
index 733010b5e4f5..e52b0cc8e081 100644
--- a/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
+++ b/drivers/gpu/drm/panel/panel-jdi-lt070me05000.c
@@ -473,7 +473,11 @@ static int jdi_panel_probe(struct mipi_dsi_device *dsi)
 	if (ret < 0)
 		return ret;
 
-	return mipi_dsi_attach(dsi);
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0)
+		jdi_panel_del(jdi);
+
+	return ret;
 }
 
 static int jdi_panel_remove(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
index 86e4213e8bb1..6e3cd6ea8bf9 100644
--- a/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
+++ b/drivers/gpu/drm/panel/panel-kingdisplay-kd097d04.c
@@ -406,7 +406,11 @@ static int kingdisplay_panel_probe(struct mipi_dsi_device *dsi)
 	if (err < 0)
 		return err;
 
-	return mipi_dsi_attach(dsi);
+	err = mipi_dsi_attach(dsi);
+	if (err < 0)
+		drm_panel_remove(kingdisplay);
+
+	return err;
 }
 
 static int kingdisplay_panel_remove(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
index 533cd3934b8b..ac7a003193c3 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt36672a.c
@@ -656,7 +656,11 @@ static int nt36672a_panel_probe(struct mipi_dsi_device *dsi)
 	if (err < 0)
 		return err;
 
-	return mipi_dsi_attach(dsi);
+	err = mipi_dsi_attach(dsi);
+	if (err < 0)
+		drm_panel_remove(&pinfo->base);
+
+	return err;
 }
 
 static int nt36672a_panel_remove(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
index 3c20beeb1781..552fb52e02a3 100644
--- a/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
+++ b/drivers/gpu/drm/panel/panel-panasonic-vvx10f034n00.c
@@ -241,7 +241,11 @@ static int wuxga_nt_panel_probe(struct mipi_dsi_device *dsi)
 	if (ret < 0)
 		return ret;
 
-	return mipi_dsi_attach(dsi);
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0)
+		wuxga_nt_panel_del(wuxga_nt);
+
+	return ret;
 }
 
 static int wuxga_nt_panel_remove(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
index a3782830ae3c..033f90940ec9 100644
--- a/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
+++ b/drivers/gpu/drm/panel/panel-ronbo-rb070d30.c
@@ -199,7 +199,11 @@ static int rb070d30_panel_dsi_probe(struct mipi_dsi_device *dsi)
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->lanes = 4;
 
-	return mipi_dsi_attach(dsi);
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0)
+		drm_panel_remove(&ctx->panel);
+
+	return ret;
 }
 
 static int rb070d30_panel_dsi_remove(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
index b937e24dac8e..790dab2a2f9c 100644
--- a/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
+++ b/drivers/gpu/drm/panel/panel-sharp-ls043t1le01.c
@@ -296,7 +296,11 @@ static int sharp_nt_panel_probe(struct mipi_dsi_device *dsi)
 	if (ret < 0)
 		return ret;
 
-	return mipi_dsi_attach(dsi);
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0)
+		sharp_nt_panel_del(sharp_nt);
+
+	return ret;
 }
 
 static int sharp_nt_panel_remove(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 320a2a8fd459..42164919bcf0 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -384,7 +384,11 @@ static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
 	st7701->dsi = dsi;
 	st7701->desc = desc;
 
-	return mipi_dsi_attach(dsi);
+	ret = mipi_dsi_attach(dsi);
+	if (ret < 0)
+		drm_panel_remove(&st7701->panel);
+
+	return ret;
 }
 
 static int st7701_dsi_remove(struct mipi_dsi_device *dsi)
diff --git a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
index 820731be7147..799de7184c21 100644
--- a/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
+++ b/drivers/gpu/drm/panel/panel-tdo-tl070wsh30.c
@@ -207,7 +207,11 @@ static int tdo_tl070wsh30_panel_probe(struct mipi_dsi_device *dsi)
 	if (err < 0)
 		return err;
 
-	return mipi_dsi_attach(dsi);
+	err = mipi_dsi_attach(dsi);
+	if (err < 0)
+		drm_panel_remove(&tdo_tl070wsh30->base);
+
+	return err;
 }
 
 static int tdo_tl070wsh30_panel_remove(struct mipi_dsi_device *dsi)
-- 
2.25.1

