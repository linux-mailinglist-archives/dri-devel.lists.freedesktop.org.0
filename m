Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B38914C8F22
	for <lists+dri-devel@lfdr.de>; Tue,  1 Mar 2022 16:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D0010E5AB;
	Tue,  1 Mar 2022 15:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C725910E5AB
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Mar 2022 15:31:50 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id d17so21084855wrc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 01 Mar 2022 07:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CDRCVh5+XHKQRRsWU/rtw+qyV3P2V1tvxwx8uNiM2Wo=;
 b=ce1Hox9vXtU7g1le6ez42Cj/ssKLMW6nGrcr/uB0iDTb/MDVJsnJXQoHSC5rHgl+5i
 DAc6sNbZi95M/TVCFOLrnrsJYQV7A3Pgr1e4BoCU43lRxRA9JYBKucunni2jemFJDbAC
 N+jxuloV8BjUpdmIL3Rw4iyb3GhENTSQIh9mIPVouXZR+d7Mx5bQCYXGfWM7ipvt3Tiu
 enSebDhjrn0dUHtO+k+H7rjT4EEUdZVH30Lk1wclkezDPaw/ba2F4K0FoqNY/b/mQ90N
 W1S3xNDRNncPhwNGkOuZWGcfUU931dJsXdUNJXXqlUoBd6QhDx2bOz7yzJFy/2jMDLN8
 6ueg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CDRCVh5+XHKQRRsWU/rtw+qyV3P2V1tvxwx8uNiM2Wo=;
 b=VL+b563Nq60cJmtlWAwVLdmbAmlkmvVDIDvOR1GqIYotuKxgFWkvzB2lBHl5n7DuBW
 EI3T55aN7+Y1LXKxTb4340wX08rsgMWkALi4tcmEZnqvBImzxPMShXjwmVdEyNShTTvn
 vv76Vv3aj/cBnWjz8WOgolX1DOxbO88LbCQIT3DS9uucLuvy4ErzS7NSbyWN8yNK0El1
 PqUAiXKyTmjC18mRAjRlBJeYV/9yJTQyb/IvReC9c/VLImRTkFJQTnDuurlVqUuY7hVy
 nlXDYQobMOZjSJFruUdxl/DiRSaw6pWqodZbhG7MfERZwW1SFT7qk3F3Y0lZSf76rzaT
 UUBg==
X-Gm-Message-State: AOAM532v6S4tRDTzi+Aym1VG/b/UjKdHM+p9gV4oZGxkoiRkGeLtGxZx
 YbtjnpmLu0ZFzU5hu5XKzW0=
X-Google-Smtp-Source: ABdhPJww8ezFvFTZCiOJGaO+xHqi7NqeGALhULxNZ2PyqqENxuTM8qcDz9xkgik4kvuIQVvmpIS17g==
X-Received: by 2002:a05:6000:1c15:b0:1f0:216:1c64 with SMTP id
 ba21-20020a0560001c1500b001f002161c64mr3305267wrb.366.1646148709348; 
 Tue, 01 Mar 2022 07:31:49 -0800 (PST)
Received: from monk.home ([2a01:cb10:430:ec00:4737:d56e:186b:af1])
 by smtp.gmail.com with ESMTPSA id
 b13-20020a05600c4e0d00b003816cb4892csm5797377wmq.0.2022.03.01.07.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 07:31:48 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v1 3/3] drm/panel : innolux-ej030na and abt-y030xx067a : add
 .enable and .disable
Date: Tue,  1 Mar 2022 16:31:22 +0100
Message-Id: <20220301153122.20660-4-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220301153122.20660-1-cbranchereau@gmail.com>
References: <20220301153122.20660-1-cbranchereau@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Following the introduction of bridge_atomic_enable in the ingenic
drm driver, the crtc is enabled between .prepare and .enable, if
it exists.

Add it so the backlight is only enabled after the crtc is, to avoid
graphical issues.

Signed-off-by: Christophe Branchereau <cbranchereau@gmail.com>
---
 drivers/gpu/drm/panel/panel-abt-y030xx067a.c  | 23 ++++++++++++--
 drivers/gpu/drm/panel/panel-innolux-ej030na.c | 31 ++++++++++++++++---
 2 files changed, 48 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
index f043b484055b..b5736344e3ec 100644
--- a/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
+++ b/drivers/gpu/drm/panel/panel-abt-y030xx067a.c
@@ -183,8 +183,6 @@ static int y030xx067a_prepare(struct drm_panel *panel)
 		goto err_disable_regulator;
 	}
 
-	msleep(120);
-
 	return 0;
 
 err_disable_regulator:
@@ -202,6 +200,25 @@ static int y030xx067a_unprepare(struct drm_panel *panel)
 	return 0;
 }
 
+static int y030xx067a_enable(struct drm_panel *panel)
+{
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
@@ -239,6 +256,8 @@ static int y030xx067a_get_modes(struct drm_panel *panel,
 static const struct drm_panel_funcs y030xx067a_funcs = {
 	.prepare	= y030xx067a_prepare,
 	.unprepare	= y030xx067a_unprepare,
+	.enable		= y030xx067a_enable,
+	.disable	= y030xx067a_disable,
 	.get_modes	= y030xx067a_get_modes,
 };
 
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
2.34.1

