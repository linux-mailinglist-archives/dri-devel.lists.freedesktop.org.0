Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B056B91F7
	for <lists+dri-devel@lfdr.de>; Tue, 14 Mar 2023 12:45:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E68510E162;
	Tue, 14 Mar 2023 11:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77C0A10E162
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 11:45:49 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id u5so16274974plq.7
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Mar 2023 04:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678794349;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qV3+UTpq0pSz8mRuhUKGGTuipB28dMrQVCgnigpzu1A=;
 b=O2B7CVGfEgWoI6RYFDWPugPGwgPAETohlAGWwrHjyPunHR5yEIt1R3oBNw2xqNBzuR
 cfG0Wiwm+Q/piOb2kw5qZwnKh5t56N3vVWwGB76aEYE1yLs0/fCfssteSt2Fjhx5gmit
 zv280aTKo/+pGmWKfqm6A3T9jEFmlr0FqWjl+hHIpMIRYb7gEq4+3nlBY71Kyc0Xjxl4
 j/kfPqgBjBFltqN4iatQWK7dO9RO2eLIDMLIHctDuPPNat5Kg7G4Xju+AvxV3hc+EB/N
 aS4ziw4svSiL3+hRQCpzlZMKiJpwhJm52J2ZkxnxbhkeE0UXiUBDNJH+Lx3j64JtpMeF
 MeVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678794349;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qV3+UTpq0pSz8mRuhUKGGTuipB28dMrQVCgnigpzu1A=;
 b=Ei/vo19dCzY9g/QcpYBM6cXkkinIDf+jq1xBQYWINDWWTxGzaCKyIkPZ6fPVw1jEZ9
 eE2mfSvisgU1zUa7w23Lk4MemS1Yn6A3Nep7kyXIXSiXCb01EK0K1BBW+un3lwYKfVet
 083T9Ef2V9t7v4v1+GAN/O6O2tRlpKUxs7QcIo3oZ1M7CUW2V8tYQQ0bZps8Txb9hMQ4
 KwxJk2r948F7etYvwOIh2aBpz2P1tLtK4TcDtR9VX3NmSL7rdjv8TQlfTRQ0y61LKWnv
 IMV3PV7TvX4Ih7lILqx6btjpYCRjECZRWq20BEfcYUEG1J8d38U4swY6IsncvXwf/NQH
 uKAw==
X-Gm-Message-State: AO0yUKV91X2JCFL8gEmYDP598Fr7L5rr/1PIJNnKSNv8ir8LvWbnKNB9
 7+/MZjw1alNsXhiUat8vaPw=
X-Google-Smtp-Source: AK7set9PKfihUYTXB8p+orPWZbQgLOddt/tlxE2NkCMzZJS9SJRZO8ZIWfXsulm4WK7zjuOS8xRniw==
X-Received: by 2002:a17:90b:2241:b0:237:29b1:1893 with SMTP id
 hk1-20020a17090b224100b0023729b11893mr37600112pjb.46.1678794349047; 
 Tue, 14 Mar 2023 04:45:49 -0700 (PDT)
Received: from localhost.localdomain (n220246252084.netvigator.com.
 [220.246.252.84]) by smtp.gmail.com with ESMTPSA id
 t3-20020a170902a5c300b0019a6e8ceb49sm1540101plq.259.2023.03.14.04.45.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 04:45:48 -0700 (PDT)
From: Jianhua Lu <lujianhua000@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Douglas Anderson <dianders@chromium.org>
Subject: [PATCH] drm/panel: Fix panel mode type setting logic
Date: Tue, 14 Mar 2023 19:44:51 +0800
Message-Id: <20230314114451.8872-1-lujianhua000@gmail.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Jianhua Lu <lujianhua000@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some panels set mode type to DRM_MODE_TYPE_PREFERRED by the number
of modes. It isn't reasonable, so set the first mode type to
DRM_MODE_TYPE_PREFERRED. This should be more reasonable.

Signed-off-by: Jianhua Lu <lujianhua000@gmail.com>
---
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c     | 2 +-
 drivers/gpu/drm/panel/panel-auo-a030jtn01.c      | 2 +-
 drivers/gpu/drm/panel/panel-edp.c                | 4 ++--
 drivers/gpu/drm/panel/panel-innolux-ej030na.c    | 2 +-
 drivers/gpu/drm/panel/panel-newvision-nv3051d.c  | 2 +-
 drivers/gpu/drm/panel/panel-newvision-nv3052c.c  | 2 +-
 drivers/gpu/drm/panel/panel-novatek-nt35950.c    | 2 +-
 drivers/gpu/drm/panel/panel-novatek-nt39016.c    | 2 +-
 drivers/gpu/drm/panel/panel-orisetech-ota5601a.c | 2 +-
 drivers/gpu/drm/panel/panel-seiko-43wvf1g.c      | 4 ++--
 drivers/gpu/drm/panel/panel-simple.c             | 4 ++--
 11 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
index 1cc0f1d09684..9ce62513e3a5 100644
--- a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
+++ b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
@@ -240,7 +240,7 @@ static int y030xx067a_get_modes(struct drm_panel *panel,
 		drm_mode_set_name(mode);
 
 		mode->type = DRM_MODE_TYPE_DRIVER;
-		if (panel_info->num_modes == 1)
+		if (i == 0)
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		drm_mode_probed_add(connector, mode);
diff --git a/drivers/gpu/drm/panel/panel-auo-a030jtn01.c b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
index 3c976a98de6a..3850dc5a1eb1 100644
--- a/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
+++ b/drivers/gpu/drm/panel/panel-auo-a030jtn01.c
@@ -151,7 +151,7 @@ static int a030jtn01_get_modes(struct drm_panel *panel,
 		drm_mode_set_name(mode);
 
 		mode->type = DRM_MODE_TYPE_DRIVER;
-		if (panel_info->num_modes == 1)
+		if (i == 0)
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		drm_mode_probed_add(connector, mode);
diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
index 01bfe0783304..df7e59485793 100644
--- a/drivers/gpu/drm/panel/panel-edp.c
+++ b/drivers/gpu/drm/panel/panel-edp.c
@@ -260,7 +260,7 @@ static unsigned int panel_edp_get_timings_modes(struct panel_edp *panel,
 
 		mode->type |= DRM_MODE_TYPE_DRIVER;
 
-		if (panel->desc->num_timings == 1)
+		if (i == 0)
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		drm_mode_probed_add(connector, mode);
@@ -289,7 +289,7 @@ static unsigned int panel_edp_get_display_modes(struct panel_edp *panel,
 
 		mode->type |= DRM_MODE_TYPE_DRIVER;
 
-		if (panel->desc->num_modes == 1)
+		if (i == 0)
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		drm_mode_set_name(mode);
diff --git a/drivers/gpu/drm/panel/panel-innolux-ej030na.c b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
index b2b0ebc9e943..6c49c93eaa23 100644
--- a/drivers/gpu/drm/panel/panel-innolux-ej030na.c
+++ b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
@@ -166,7 +166,7 @@ static int ej030na_get_modes(struct drm_panel *panel,
 		drm_mode_set_name(mode);
 
 		mode->type = DRM_MODE_TYPE_DRIVER;
-		if (panel_info->num_modes == 1)
+		if (i == 0)
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		drm_mode_probed_add(connector, mode);
diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
index a07958038ffd..65ff9a3df62a 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3051d.c
@@ -331,7 +331,7 @@ static int panel_nv3051d_get_modes(struct drm_panel *panel,
 		drm_mode_set_name(mode);
 
 		mode->type = DRM_MODE_TYPE_DRIVER;
-		if (panel_info->num_modes == 1)
+		if (i == 0)
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		drm_mode_probed_add(connector, mode);
diff --git a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
index cf078f0d3cd3..70a7b36c2956 100644
--- a/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
+++ b/drivers/gpu/drm/panel/panel-newvision-nv3052c.c
@@ -347,7 +347,7 @@ static int nv3052c_get_modes(struct drm_panel *panel,
 		drm_mode_set_name(mode);
 
 		mode->type = DRM_MODE_TYPE_DRIVER;
-		if (panel_info->num_modes == 1)
+		if (i == 0)
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		drm_mode_probed_add(connector, mode);
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt35950.c b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
index abf752b36a52..62f7895af072 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt35950.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt35950.c
@@ -508,7 +508,7 @@ static int nt35950_get_modes(struct drm_panel *panel,
 		drm_mode_set_name(mode);
 
 		mode->type |= DRM_MODE_TYPE_DRIVER;
-		if (nt->desc->num_modes == 1)
+		if (i == 0)
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		drm_mode_probed_add(connector, mode);
diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
index f58cfb10b58a..7938dd68f4f4 100644
--- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
+++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
@@ -216,7 +216,7 @@ static int nt39016_get_modes(struct drm_panel *drm_panel,
 		drm_mode_set_name(mode);
 
 		mode->type = DRM_MODE_TYPE_DRIVER;
-		if (panel_info->num_modes == 1)
+		if (i == 0)
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		drm_mode_probed_add(connector, mode);
diff --git a/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c b/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
index e46be5014d42..d232c02eba20 100644
--- a/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
+++ b/drivers/gpu/drm/panel/panel-orisetech-ota5601a.c
@@ -206,7 +206,7 @@ static int ota5601a_get_modes(struct drm_panel *drm_panel,
 		drm_mode_set_name(mode);
 
 		mode->type = DRM_MODE_TYPE_DRIVER;
-		if (panel_info->num_modes == 1)
+		if (i == 0)
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		drm_mode_probed_add(connector, mode);
diff --git a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
index 76160e5d43bd..dad103615c7f 100644
--- a/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
+++ b/drivers/gpu/drm/panel/panel-seiko-43wvf1g.c
@@ -80,7 +80,7 @@ static int seiko_panel_get_fixed_modes(struct seiko_panel *panel,
 
 		mode->type |= DRM_MODE_TYPE_DRIVER;
 
-		if (panel->desc->num_timings == 1)
+		if (i == 0)
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		drm_mode_probed_add(connector, mode);
@@ -100,7 +100,7 @@ static int seiko_panel_get_fixed_modes(struct seiko_panel *panel,
 
 		mode->type |= DRM_MODE_TYPE_DRIVER;
 
-		if (panel->desc->num_modes == 1)
+		if (i == 0)
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		drm_mode_set_name(mode);
diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 065f378bba9d..fc617969c2be 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -185,7 +185,7 @@ static unsigned int panel_simple_get_timings_modes(struct panel_simple *panel,
 
 		mode->type |= DRM_MODE_TYPE_DRIVER;
 
-		if (panel->desc->num_timings == 1)
+		if (i == 0)
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		drm_mode_probed_add(connector, mode);
@@ -214,7 +214,7 @@ static unsigned int panel_simple_get_display_modes(struct panel_simple *panel,
 
 		mode->type |= DRM_MODE_TYPE_DRIVER;
 
-		if (panel->desc->num_modes == 1)
+		if (i == 0)
 			mode->type |= DRM_MODE_TYPE_PREFERRED;
 
 		drm_mode_set_name(mode);
-- 
2.39.2

