Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B243458974
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 07:53:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BBA89D8A;
	Mon, 22 Nov 2021 06:53:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77A1189D89
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 06:53:38 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so14408932pjb.5
 for <dri-devel@lists.freedesktop.org>; Sun, 21 Nov 2021 22:53:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wJ/t6jM/jyN5QXpQAEFQjSGSqfZWlxA85S7ihcjleN4=;
 b=bIadhJCzrMKxm03cp/PIBhXn18NNYdZ2YoYDS8LJ/ac/RvjLiQ2Sp7Svd4BZxnoS3g
 dCiCRuOmctLguhmGiwM9i1tchv8uBY0rw6O+FT0rAt5WiRTILdKeXUHxgqZhsdaGr60A
 Wvydha/B6xL9nEYr8dbrsNK2YwmuNWXOYj5RM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wJ/t6jM/jyN5QXpQAEFQjSGSqfZWlxA85S7ihcjleN4=;
 b=N3VaEfgzhz4OAPY35VTjkGVmvRuI0SIToqeyOkXLmNgthajy0A4hJ6DDxQS7EclpK4
 wSQT0mID4VDOV8qGf9TP0JL2DDN/cfk+EcQfvUB7iPw/I7iPWEp1pIfunJJLZc1eKGkT
 oQc7t/zHbJrbCyLpb5BRXVU1DanrQUtr2NlRRrOI9lhK5b+0BbttoeMzGwuMJ5Rl4E1s
 XgR1vcLu4KnAvef10EjikkElqHDF3MH8tdHBy05cFGbaKukxJzzBox285ptmJMMhIhXe
 A+oVAGjYpxSl71enVfYuhwlGnZwGvjLfnouSRUgQurKXr2ZsNnXRPygQ27YNTCJ2Qxjo
 zxeg==
X-Gm-Message-State: AOAM530hcxWAsGzeux00fuKX1SzzvwhSAQhHN1mLHKiZy9PPj7CqK4ko
 rg3qEM9FBJ6sornIuvVCSb6Z+Q==
X-Google-Smtp-Source: ABdhPJz8UMA5qnotn8CuvwokGv9kesn6itqP05ipiuNNTbry3iobK0F9ZSHrkk/BBXvJzlIi9pSklQ==
X-Received: by 2002:a17:90a:e7ca:: with SMTP id
 kb10mr28171937pjb.8.1637564018014; 
 Sun, 21 Nov 2021 22:53:38 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a0a9:eed6:c913:819a:3850])
 by smtp.gmail.com with ESMTPSA id a8sm7935904pfv.176.2021.11.21.22.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 Nov 2021 22:53:37 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v5 4/7] drm: sun4i: dsi: Add mode_set function
Date: Mon, 22 Nov 2021 12:22:20 +0530
Message-Id: <20211122065223.88059-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211122065223.88059-1-jagan@amarulasolutions.com>
References: <20211122065223.88059-1-jagan@amarulasolutions.com>
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
Cc: linux-sunxi@googlegroups.com, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Get the display mode settings via mode_set bridge function
instead of explicitly de-reference.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v5:
- new patch

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 12 +++++++++++-
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h |  1 +
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index a6a272b55f77..731af31e2bde 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -718,7 +718,7 @@ static void sun6i_dsi_bridge_atomic_enable(struct drm_bridge *bridge,
 					   struct drm_bridge_state *old_bridge_state)
 {
 	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
-	struct drm_display_mode *mode = &bridge->encoder->crtc->state->adjusted_mode;
+	struct drm_display_mode *mode = &dsi->mode;
 	struct mipi_dsi_device *device = dsi->device;
 	union phy_configure_opts opts = { };
 	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
@@ -854,6 +854,15 @@ static const struct drm_connector_funcs sun6i_dsi_connector_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_connector_destroy_state,
 };
 
+static void sun6i_dsi_bridge_mode_set(struct drm_bridge *bridge,
+				      const struct drm_display_mode *mode,
+				      const struct drm_display_mode *adjusted_mode)
+{
+	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
+
+	drm_mode_copy(&dsi->mode, adjusted_mode);
+}
+
 static int sun6i_dsi_bridge_attach(struct drm_bridge *bridge,
 				   enum drm_bridge_attach_flags flags)
 {
@@ -872,6 +881,7 @@ static const struct drm_bridge_funcs sun6i_dsi_bridge_funcs = {
 	.atomic_reset		= drm_atomic_helper_bridge_reset,
 	.atomic_enable		= sun6i_dsi_bridge_atomic_enable,
 	.atomic_disable		= sun6i_dsi_bridge_atomic_disable,
+	.mode_set		= sun6i_dsi_bridge_mode_set,
 	.attach			= sun6i_dsi_bridge_attach,
 };
 
diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
index d269304691c9..acdd586a4157 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.h
@@ -20,6 +20,7 @@ struct sun6i_dsi {
 	struct drm_connector	connector;
 	struct drm_encoder	encoder;
 	struct mipi_dsi_host	host;
+	struct drm_display_mode	mode;
 
 	struct clk		*bus_clk;
 	struct clk		*mod_clk;
-- 
2.25.1

