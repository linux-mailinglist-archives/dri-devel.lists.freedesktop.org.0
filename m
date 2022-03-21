Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6AF14E27CA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:37:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF50F10E41E;
	Mon, 21 Mar 2022 13:37:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D80510E41D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 13:37:21 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t11so20749530wrm.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 06:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=C7ur1ssTUbHNpecbbbCU94tMoZ1fCbXzPQjfgyWqqxg=;
 b=T070mISsGNQa6RHk1dvm7QAfEGtCL8QdJrl2jjSnGDB6cwq2T9wm74b4gFuuuJlMKT
 2nTxKTsyhsMZ0uvuXyO559/Aq3xhzUs99+G0yudWaQ5o0OyMWNSef1QKfPkUrLfTEah5
 3JdeOMHFOhs9VAxy7jhmLl68/uKjUa/lOkQ2H6c373zvP+94m9x61dLxPj3jyWYE67HV
 S3xp7ejlINrtQxXGa6PJS9joqNSBQRIadcOUcKu+CvxWe/QnvrYG1LQ3FDtSmGrQmmS8
 CBmCy6nrfzqAwRDiRRvD9vz0aorR2mINGePL0dEp2hicWhfcotQ4SKy3kBgcaHiubTKM
 kABw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C7ur1ssTUbHNpecbbbCU94tMoZ1fCbXzPQjfgyWqqxg=;
 b=ttsQuF0bHFdFvc6OZ10lnxvULyrkAg2UgRJYRYjkphSaMQyChXYHrZzYM3UxkSflBh
 +Buh/9xKzW9iKNtkrOPWc1DwIXWml8bNgtSz0Olux/gLfV+wshObkywTQRHw5HFFBkaQ
 6T6IQ/9x64G7d715GewN8s9ToyST9tP2wyjm7S6PF4H6kJxjoSH1NM5lE3m3v48ejF2o
 XGueQRwQCtrG31qPwWXFoptFucV2g559wic6W+pRT5IF6m5F7eb/rbQBGhSpoA1kEkVS
 fR72OhKtCAY5aS6cbp+7qzvnD7EIfrfSciL1oyMytdeWtnSS2i92ZS+Btg4MITsVo35Q
 IJ5g==
X-Gm-Message-State: AOAM531kisF4fi9djFz+VR4OMeOqU+G0cKLkCEDxclMeiUJfCEtxpE7k
 tzmnYB4VjlNBxXNaHzgITc0=
X-Google-Smtp-Source: ABdhPJwWZt9Ny/5MMoWri+0K296W3KYZx1PnQurYTeD4TmtqWAgVUE/0FAd2tN/N/WuCLsgov0xN5A==
X-Received: by 2002:a5d:4804:0:b0:203:d59b:e83 with SMTP id
 l4-20020a5d4804000000b00203d59b0e83mr18685188wrq.696.1647869840048; 
 Mon, 21 Mar 2022 06:37:20 -0700 (PDT)
Received: from monk.home ([2a01:cb10:430:ec00:4737:d56e:186b:af1])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a5d5445000000b00203f8c96bcesm7969426wrv.49.2022.03.21.06.37.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:37:19 -0700 (PDT)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v5 3/3] drm/panel : innolux-ej030na and abt-y030xx067a : add
 .enable and .disable
Date: Mon, 21 Mar 2022 14:36:51 +0100
Message-Id: <20220321133651.291592-4-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321133651.291592-1-cbranchereau@gmail.com>
References: <20220321133651.291592-1-cbranchereau@gmail.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following the introduction of bridge_atomic_enable in the ingenic
drm driver, the crtc is enabled between .prepare and .enable, if
it exists.

Add it so the backlight is only enabled after the crtc is, to avoid
graphical issues.

Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
---
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c  | 31 +++++++++++++++++--
 drivers/gpu/drm/panel/panel-innolux-ej030na.c | 31 ++++++++++++++++---
 2 files changed, 55 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
index f043b484055b..ddfacaeac1d4 100644
--- a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
+++ b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
@@ -140,7 +140,7 @@ static const struct reg_sequence y030xx067a_init_sequence[] = {
 	{ 0x03, REG03_VPOSITION(0x0a) },
 	{ 0x04, REG04_HPOSITION1(0xd2) },
 	{ 0x05, REG05_CLIP | REG05_NVM_VREFRESH | REG05_SLBRCHARGE(0x2) },
-	{ 0x06, REG06_XPSAVE | REG06_NT },
+	{ 0x06, REG06_NT },
 	{ 0x07, 0 },
 	{ 0x08, REG08_PANEL(0x1) | REG08_CLOCK_DIV(0x2) },
 	{ 0x09, REG09_SUB_BRIGHT_R(0x20) },
@@ -183,8 +183,6 @@ static int y030xx067a_prepare(struct drm_panel *panel)
 		goto err_disable_regulator;
 	}
 
-	msleep(120);
-
 	return 0;
 
 err_disable_regulator:
@@ -202,6 +200,30 @@ static int y030xx067a_unprepare(struct drm_panel *panel)
 	return 0;
 }
 
+static int y030xx067a_enable(struct drm_panel *panel)
+{
+
+	struct y030xx067a *priv = to_y030xx067a(panel);
+
+	regmap_set_bits(priv->map, 0x06, REG06_XPSAVE);
+
+	if (panel->backlight) {
+		/* Wait for the picture to be ready before enabling backlight */
+		msleep(120);
+	}
+
+	return 0;
+}
+
+static int y030xx067a_disable(struct drm_panel *panel)
+{
+	struct y030xx067a *priv = to_y030xx067a(panel);
+
+	regmap_clear_bits(priv->map, 0x06, REG06_XPSAVE);
+
+	return 0;
+}
+
 static int y030xx067a_get_modes(struct drm_panel *panel,
 				struct drm_connector *connector)
 {
@@ -239,6 +261,8 @@ static int y030xx067a_get_modes(struct drm_panel *panel,
 static const struct drm_panel_funcs y030xx067a_funcs = {
 	.prepare	= y030xx067a_prepare,
 	.unprepare	= y030xx067a_unprepare,
+	.enable		= y030xx067a_enable,
+	.disable	= y030xx067a_disable,
 	.get_modes	= y030xx067a_get_modes,
 };
 
@@ -246,6 +270,7 @@ static const struct regmap_config y030xx067a_regmap_config = {
 	.reg_bits = 8,
 	.val_bits = 8,
 	.max_register = 0x15,
+	.cache_type = REGCACHE_FLAT,
 };
 
 static int y030xx067a_probe(struct spi_device *spi)
diff --git a/drivers/gpu/drm/panel/panel-innolux-ej030na.c b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
index c558de3f99be..6de7370185cd 100644
--- a/drivers/gpu/drm/panel/panel-innolux-ej030na.c
+++ b/drivers/gpu/drm/panel/panel-innolux-ej030na.c
@@ -80,8 +80,6 @@ static const struct reg_sequence ej030na_init_sequence[] = {
 	{ 0x47, 0x08 },
 	{ 0x48, 0x0f },
 	{ 0x49, 0x0f },
-
-	{ 0x2b, 0x01 },
 };
 
 static int ej030na_prepare(struct drm_panel *panel)
@@ -109,8 +107,6 @@ static int ej030na_prepare(struct drm_panel *panel)
 		goto err_disable_regulator;
 	}
 
-	msleep(120);
-
 	return 0;
 
 err_disable_regulator:
@@ -128,6 +124,31 @@ static int ej030na_unprepare(struct drm_panel *panel)
 	return 0;
 }
 
+static int ej030na_enable(struct drm_panel *panel)
+{
+	struct ej030na *priv = to_ej030na(panel);
+
+	/* standby off */
+	regmap_write(priv->map, 0x2b, 0x01);
+
+	if (panel->backlight) {
+		/* Wait for the picture to be ready before enabling backlight */
+		msleep(120);
+	}
+
+	return 0;
+}
+
+static int ej030na_disable(struct drm_panel *panel)
+{
+	struct ej030na *priv = to_ej030na(panel);
+
+	/* standby on */
+	regmap_write(priv->map, 0x2b, 0x00);
+
+	return 0;
+}
+
 static int ej030na_get_modes(struct drm_panel *panel,
 			     struct drm_connector *connector)
 {
@@ -165,6 +186,8 @@ static int ej030na_get_modes(struct drm_panel *panel,
 static const struct drm_panel_funcs ej030na_funcs = {
 	.prepare	= ej030na_prepare,
 	.unprepare	= ej030na_unprepare,
+	.enable		= ej030na_enable,
+	.disable	= ej030na_disable,
 	.get_modes	= ej030na_get_modes,
 };
 
-- 
2.35.1

