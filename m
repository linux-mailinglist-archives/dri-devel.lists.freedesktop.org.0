Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA306457139
	for <lists+dri-devel@lfdr.de>; Fri, 19 Nov 2021 15:53:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27E156EA01;
	Fri, 19 Nov 2021 14:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D4D6EA01
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 14:53:48 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id k4so8282141plx.8
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Nov 2021 06:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j/oZXyY9k7/oPbpEjBRReXLAUJ5HyfByCIhWv+1np54=;
 b=PN1UcUsYDSUMiWMZJy749NipLpGPavbi0UtRSetimymsjzd6bHaTH3yZpzEflYYVfR
 9D/x4nX2QsXNmcg62ZGHofB+b3bWcfFDjwR1I0K8OR7vnGfeUuU/qHO+ZM/77zHxr0MD
 8uWMaAHN43We2QwzGkBYlW1QT2wcAgcs2cBCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j/oZXyY9k7/oPbpEjBRReXLAUJ5HyfByCIhWv+1np54=;
 b=pnLCP8BXN4/3b15iNMvvjKlQvpM1BIJBnPVxq1XvwvJSk1NZKX9psJwnNnca+9J9/p
 20C4962dRwDyaUJMGJKJw2gh3+qndgZ6tkMr/0iYxLGoaUIJ/AjNstpN6zYXI/PBidk+
 odomQLNPbkKFbwKYbV5aSSFtwP5Q6gKzF9Tej4MOv/iDJd3m+GbarMdhHB7V2/3DJLOx
 JGGo4KwG5kYz/hrl+RAXkkplA80gUmR6NmMeqkHkUgcydEbKu6M+tdvH2/3zyrROggVB
 joIVAUJuDFzp8e9c6Twtd4VsI4HHKpiL6xeAU7Dzfy7bnAgQfm6tg9vjQPVgF5pxb61w
 P2aQ==
X-Gm-Message-State: AOAM533H4n5buERi6XOxjFZf5Eup5qu6sXu714FDWNptuLjSV+LIX0ux
 IFiQK6miG1EtWMqiOgbiusRuTDwTHW3Sqg==
X-Google-Smtp-Source: ABdhPJyGyqCKuY59De5cinq/qP6UBN9mriUC2PfnDuygeBMHWev+cPlFlKYo44eQYFhOZU5oZWlTWw==
X-Received: by 2002:a17:902:d488:b0:141:f3a3:d2f4 with SMTP id
 c8-20020a170902d48800b00141f3a3d2f4mr77884968plg.86.1637333628125; 
 Fri, 19 Nov 2021 06:53:48 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:35da:1c92:84b8:d096])
 by smtp.gmail.com with ESMTPSA id q11sm3368033pfk.192.2021.11.19.06.53.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 06:53:47 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH 2/2] drm/bridge: chipone-icn6211: Add mode_set API
Date: Fri, 19 Nov 2021 20:23:25 +0530
Message-Id: <20211119145325.1775046-2-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211119145325.1775046-1-jagan@amarulasolutions.com>
References: <20211119145325.1775046-1-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, Jagan Teki <jagan@amarulasolutions.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Get the display mode settings via mode_set bridge
function instead of explicitly de-reference.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 77b3e2c29461..e8f36dca56b3 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -31,6 +31,7 @@
 struct chipone {
 	struct device *dev;
 	struct drm_bridge bridge;
+	struct drm_display_mode mode;
 	struct drm_bridge *panel_bridge;
 	struct gpio_desc *enable_gpio;
 	struct regulator *vdd1;
@@ -43,11 +44,6 @@ static inline struct chipone *bridge_to_chipone(struct drm_bridge *bridge)
 	return container_of(bridge, struct chipone, bridge);
 }
 
-static struct drm_display_mode *bridge_to_mode(struct drm_bridge *bridge)
-{
-	return &bridge->encoder->crtc->state->adjusted_mode;
-}
-
 static inline int chipone_dsi_write(struct chipone *icn,  const void *seq,
 				    size_t len)
 {
@@ -66,7 +62,7 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 				  struct drm_bridge_state *old_bridge_state)
 {
 	struct chipone *icn = bridge_to_chipone(bridge);
-	struct drm_display_mode *mode = bridge_to_mode(bridge);
+	struct drm_display_mode *mode = &icn->mode;
 
 	ICN6211_DSI(icn, 0x7a, 0xc1);
 
@@ -165,6 +161,15 @@ static void chipone_atomic_post_disable(struct drm_bridge *bridge,
 	gpiod_set_value(icn->enable_gpio, 0);
 }
 
+static void chipone_mode_set(struct drm_bridge *bridge,
+			     const struct drm_display_mode *mode,
+			     const struct drm_display_mode *adjusted_mode)
+{
+	struct chipone *icn = bridge_to_chipone(bridge);
+
+	drm_mode_copy(&icn->mode, adjusted_mode);
+}
+
 static int chipone_attach(struct drm_bridge *bridge, enum drm_bridge_attach_flags flags)
 {
 	struct chipone *icn = bridge_to_chipone(bridge);
@@ -179,6 +184,7 @@ static const struct drm_bridge_funcs chipone_bridge_funcs = {
 	.atomic_pre_enable	= chipone_atomic_pre_enable,
 	.atomic_enable		= chipone_atomic_enable,
 	.atomic_post_disable	= chipone_atomic_post_disable,
+	.mode_set		= chipone_mode_set,
 	.attach			= chipone_attach,
 };
 
-- 
2.25.1

