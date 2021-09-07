Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 014E540224A
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 04:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE8F89C5E;
	Tue,  7 Sep 2021 02:40:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 985C189C63
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 02:40:45 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 094BC82BD6;
 Tue,  7 Sep 2021 04:40:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1630982444;
 bh=jU8M8VZQu5M1/mkY5Y3gaQ0pEK8R/Gs+794vQh6PcH4=;
 h=From:To:Cc:Subject:Date:From;
 b=n2r935I5HYphumOGSw2DnREqg9df0/R5HF7nUenaNhbk9V5/7LG3z7RE1D5Ud9QR2
 XR/RiWIJQqhBHQ8/aOMaJVNcOVyyGuBf0ZSt8HodQLkF7ScaEhsVp7pGm3qK6O6ayQ
 0nl/kI0KLLlHh7kdY5f6Hg63tEyizk8dEDNeNjO5yfKYlSAulBY5lgj1dHOCl62Cbr
 oQ+vnlFMbK+0OH2iq3h8HQMzKOlX+wtV8BhIEYR73SsLl5BLDKb8hjN0zy1FPDxDU8
 yJKyL5s/DNhLEHC4H6ptsJ5NhQ7UmTCgHk1mI8bjM+iK0YV/tsXh9bpufjtB1WsmxQ
 ZCXnXRsIkYQCw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm/bridge: ti-sn65dsi83: Implement .detach callback
Date: Tue,  7 Sep 2021 04:40:38 +0200
Message-Id: <20210907024038.871299-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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

Move detach implementation from sn65dsi83_remove() to dedicated
.detach callback. There is no functional change to the code, but
that detach is now in the correct location.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 4ea71d7f0bfbc..13ee313daba96 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -288,6 +288,19 @@ static int sn65dsi83_attach(struct drm_bridge *bridge,
 	return ret;
 }
 
+static void sn65dsi83_detach(struct drm_bridge *bridge)
+{
+	struct sn65dsi83 *ctx = bridge_to_sn65dsi83(bridge);
+
+	if (!ctx->dsi)
+		return;
+
+	mipi_dsi_detach(ctx->dsi);
+	mipi_dsi_device_unregister(ctx->dsi);
+	drm_bridge_remove(&ctx->bridge);
+	ctx->dsi = NULL;
+}
+
 static void sn65dsi83_atomic_pre_enable(struct drm_bridge *bridge,
 					struct drm_bridge_state *old_bridge_state)
 {
@@ -588,6 +601,7 @@ sn65dsi83_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 
 static const struct drm_bridge_funcs sn65dsi83_funcs = {
 	.attach			= sn65dsi83_attach,
+	.detach			= sn65dsi83_detach,
 	.atomic_pre_enable	= sn65dsi83_atomic_pre_enable,
 	.atomic_enable		= sn65dsi83_atomic_enable,
 	.atomic_disable		= sn65dsi83_atomic_disable,
@@ -702,9 +716,6 @@ static int sn65dsi83_remove(struct i2c_client *client)
 {
 	struct sn65dsi83 *ctx = i2c_get_clientdata(client);
 
-	mipi_dsi_detach(ctx->dsi);
-	mipi_dsi_device_unregister(ctx->dsi);
-	drm_bridge_remove(&ctx->bridge);
 	of_node_put(ctx->host_node);
 
 	return 0;
-- 
2.33.0

