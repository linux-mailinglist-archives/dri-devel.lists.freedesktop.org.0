Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADBD31B244
	for <lists+dri-devel@lfdr.de>; Sun, 14 Feb 2021 20:41:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C38A6E0AC;
	Sun, 14 Feb 2021 19:41:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E2846E0AC
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 19:41:35 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id s15so2535749plr.9
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Feb 2021 11:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SRxs/aOjY1GsbWu/T3aB0+EANdf6JlXR2K+G27uoYio=;
 b=lR/8/4IFFoTMpCeL7fiEaAelu4F/iUPDfjwLukR0qPIqJVMN0UQICGWjJdI/ISNDZ0
 mwO0IcLS/PQ+cfrs3T+K0QEgmQjPMAacO0StWVDksWF7BGvK+kfP5qYZBPNnWn/45Joj
 zSfCKXtsvHFxb7rfHwyUBpOYvVvHxXjqv01dY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SRxs/aOjY1GsbWu/T3aB0+EANdf6JlXR2K+G27uoYio=;
 b=L58xZiva8V/0kexDQuaECPS1urJI5OtZvh/364dscI15pqlsVSheVhxNBUbQXljGfu
 zloldvj5Eyy8bHo/Sa/bAzGciTDBF1+aaYHEC2yAjAOZQcrr8LLnV3UlUvjToDOtDQRI
 z3BjGnG7P5VOkCKOxt4ojLSyDwLIuARQZ08mGxGNKgmb1tYp7l+O/AWQK7mNj7J9uoHv
 /9uWRuwf2HXde5j0FUiI+Mwg13Y51tF5sYuShfVTm7H5Kh/IgceWqnCIZSa5l/0w0b/G
 mUTfQcTNtkBuA0+homf40YCDSQBdZD8f76LBA6z6W7m1iEBC1Nzrs9hqI1byQ2BpOeap
 xzqw==
X-Gm-Message-State: AOAM531QSHYKFyQvdPbwTfKC65QpwEs8lrgjXKnTb28G1qhTZhfXnPxj
 WiCInNdTU9NYi6m2m4DhwH8LMg==
X-Google-Smtp-Source: ABdhPJx7aJtbIv9KAW+oJiidaq/ehl3ZHXkulFd2VYinMmQZVn+HjeAEbrtWl9HLM99JJZ6vYfsw2g==
X-Received: by 2002:a17:902:7c83:b029:e2:b157:e25c with SMTP id
 y3-20020a1709027c83b02900e2b157e25cmr12216978pll.32.1613331695308; 
 Sun, 14 Feb 2021 11:41:35 -0800 (PST)
Received: from ub-XPS-13-9350.domain.name ([45.249.78.214])
 by smtp.gmail.com with ESMTPSA id 125sm15129247pfu.7.2021.02.14.11.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 11:41:34 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v3 4/7] drm: sun4i: dsi: Separate code for bridge pre_enable
Date: Mon, 15 Feb 2021 01:10:59 +0530
Message-Id: <20210214194102.126146-5-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210214194102.126146-1-jagan@amarulasolutions.com>
References: <20210214194102.126146-1-jagan@amarulasolutions.com>
MIME-Version: 1.0
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
Cc: Jagan Teki <jagan@amarulasolutions.com>, linux-amarula@amarulasolutions.com,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The existing driver has an enablement code for initializing
clock, reset, PHY, DSI timings, and finally switching to HS
mode.

Move the clock, reset. PHY and DSI timings code into bridge
pre_enable and keep HS mode switch in enable.

As the driver supports fully enabled bridge functionalities,
this new enablement code separation will help to initialize
the host and slave bridge pre_enable, enable functions properly.

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
Changes for v3:
- new patch

 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
index 6f3c5330a468..3cdc14daf25c 100644
--- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
+++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
@@ -714,7 +714,7 @@ static int sun6i_dsi_start(struct sun6i_dsi *dsi,
 	return 0;
 }
 
-static void sun6i_dsi_bridge_enable(struct drm_bridge *bridge)
+static void sun6i_dsi_bridge_pre_enable(struct drm_bridge *bridge)
 {
 	struct drm_display_mode *mode = &bridge->encoder->crtc->state->adjusted_mode;
 	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
@@ -775,6 +775,11 @@ static void sun6i_dsi_bridge_enable(struct drm_bridge *bridge)
 
 	if (dsi->panel_bridge)
 		dsi->panel_bridge->funcs->pre_enable(dsi->panel_bridge);
+}
+
+static void sun6i_dsi_bridge_enable(struct drm_bridge *bridge)
+{
+	struct sun6i_dsi *dsi = bridge_to_sun6i_dsi(bridge);
 
 	/*
 	 * FIXME: This should be moved after the switch to HS mode.
@@ -883,6 +888,7 @@ static int sun6i_dsi_bridge_attach(struct drm_bridge *bridge,
 }
 
 static const struct drm_bridge_funcs sun6i_dsi_bridge_funcs = {
+	.pre_enable	= sun6i_dsi_bridge_pre_enable,
 	.enable		= sun6i_dsi_bridge_enable,
 	.disable	= sun6i_dsi_bridge_disable,
 	.attach		= sun6i_dsi_bridge_attach,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
