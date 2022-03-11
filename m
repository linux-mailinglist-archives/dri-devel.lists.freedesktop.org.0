Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E264D6128
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 13:05:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725F410E942;
	Fri, 11 Mar 2022 12:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D6A10E934
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 12:05:06 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 f20-20020a05600c155400b00389d73ceb43so789109wmg.4
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 04:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EWRM1iehW2QlFjJ6a/GsqHD5P7ZNjnnWjj5xp2LrO+s=;
 b=DKhrpLPrIgJuGgHIguuoxI8V0dW7v+68PZ91jEdT39lEJHubH1MCLfkdRTD/Dih+JJ
 fvcO+N9PxYWSRQI5DqHQ5mFWRNApbazwMuv081wbziso8oGhT4lGMOXGvJ5/gg5JgugX
 WyN9vTGRaQf+AKYGjxuvlEZK4GfjRkMEZs0DqdrYONFfmv1YTLtiy3Qk/ZzFd46b2IGm
 P0IJz9a0VGW5eOKy+QfqUmNWASMJrMJG0Z3BZWeyhn6171MtbzupIeN0bBUSZcd+1QU0
 gLaVxkWtkzyt/J+G7Q6sBEWLzLScSpcUdfqz6eFG5Wla1HuPAmpGhC6v4Ug6V1KzqZXt
 XwUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EWRM1iehW2QlFjJ6a/GsqHD5P7ZNjnnWjj5xp2LrO+s=;
 b=BYx9owDuMQkiAGviaDcPGQV+GHzYMs+1nvRcJp0nFUcLzQ9QV3rr76ikInED6LEV2i
 Sv61WhgC9S0lA7NQM7DvNc7OFkIlqxpB416ba4aqAsJHV41rL7/wnfpZLYejDVSKT9Bk
 MsQMpTvg13OkuK5iFkCdpe2TvVUg6YtadCckc5Ta0W/KCHAQAi/mxuf122Zc2u0mdNpn
 uWFjjJMJr+tt2fRfCfs9cPSNNHpieuKOjbXrTOpterfkwYPc2DgWN7vuFE+fdDAY2S9C
 Eb25x94WNrzWgS7tjldY31aYrm+7pcjxd9el7wxcw2kh5O8kzp59xncFVBdy8W/tcX+S
 gx+g==
X-Gm-Message-State: AOAM5316kRSbX6CnNU1ArvcevbCdShSn3QGFhhZatiK6or8uyLkCoA3K
 3f3XD0TEOs+LIbK0U2C0Xjo=
X-Google-Smtp-Source: ABdhPJzdfuwRQWx7MxXWL/1fsDajrWtltExaqCwYkO1x/MWogpzSbDMUlvVywl7CxOElZyM0r77yjA==
X-Received: by 2002:a05:600c:4142:b0:389:a592:10ce with SMTP id
 h2-20020a05600c414200b00389a59210cemr7447421wmm.148.1647000305420; 
 Fri, 11 Mar 2022 04:05:05 -0800 (PST)
Received: from monk.home ([2a01:cb10:430:ec00:4737:d56e:186b:af1])
 by smtp.gmail.com with ESMTPSA id
 r20-20020adfa154000000b001f0326a23e1sm6595223wrr.88.2022.03.11.04.05.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Mar 2022 04:05:04 -0800 (PST)
From: Christophe Branchereau <cbranchereau@gmail.com>
To: Paul Cercueil <paul@crapouillou.net>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Thierry Reding <thierry.reding@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 3/4] drm/panel : innolux-ej030na and abt-y030xx067a : add
 .enable and .disable
Date: Fri, 11 Mar 2022 13:04:52 +0100
Message-Id: <20220311120453.163297-4-cbranchereau@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220311120453.163297-1-cbranchereau@gmail.com>
References: <20220311120453.163297-1-cbranchereau@gmail.com>
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
2.35.1

