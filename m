Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61823434F55
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 17:50:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7E86E9ED;
	Wed, 20 Oct 2021 15:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metanate.com (unknown [IPv6:2001:8b0:1628:5005::111])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E847C6E4B7
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 15:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=metanate.com; s=stronger; h=Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Content-Type:Reply-To:
 Content-ID:Content-Description;
 bh=B8trVW6cPaFG3skNIZzv8boeVt5L92SBMXw4m+queSU=; b=gOivhW8nOzjf76TzAFgQwf4eAH
 4mlkN61zm5m9znZ0owWlJNdUUKx49OiCpgOa9/5qSgLFe6sEuK0R1nR9QfLhnuD74EopOIO37qIGQ
 YGHmRk8LWsmXE0Xq3yacJjE6qllWkXerMLwRfhqXAc6jrYafWW4NT6psO8yOHq76K3Ro7AUjuSkHn
 woR+vZqqV5hNKu3vLrCafg6ALnLIdIOAOhlZQ4LEJzwKisKISnyCyZa90GOWWzWpYNZGsbdHipjnL
 3WgXXeyHDLqxHQLBCiVWS4A94d1+t62UzsYAd5c/MRZ+iwLnJubz/i7cXPr4YJ6yzvKVjjmf5JbrC
 AZXLItCQ==;
Received: from [81.174.171.191] (helo=donbot.metanate.com)
 by email.metanate.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.93) (envelope-from <john@metanate.com>)
 id 1mdDc2-00043j-JD; Wed, 20 Oct 2021 16:34:42 +0100
From: John Keeping <john@metanate.com>
To: dri-devel@lists.freedesktop.org
Cc: John Keeping <john@metanate.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] drm/panel: ilitek-ili9881c: Read panel orientation
Date: Wed, 20 Oct 2021 16:34:30 +0100
Message-Id: <20211020153432.383845-4-john@metanate.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211020153432.383845-1-john@metanate.com>
References: <20211020153432.383845-1-john@metanate.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated: YES
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

The panel orientation needs to parsed from a device-tree and assigned to
the panel's connector in order to make orientation property available to
userspace. That's what this patch does for ILI9881C based panels.

Signed-off-by: John Keeping <john@metanate.com>
---
 drivers/gpu/drm/panel/panel-ilitek-ili9881c.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
index d68c52bd53c2..ba30d11547ad 100644
--- a/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
+++ b/drivers/gpu/drm/panel/panel-ilitek-ili9881c.c
@@ -52,6 +52,8 @@ struct ili9881c {
 
 	struct regulator	*power;
 	struct gpio_desc	*reset;
+
+	enum drm_panel_orientation	orientation;
 };
 
 #define ILI9881C_SWITCH_PAGE_INSTR(_page)	\
@@ -851,6 +853,8 @@ static int ili9881c_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = mode->width_mm;
 	connector->display_info.height_mm = mode->height_mm;
 
+	drm_connector_set_panel_orientation(connector, ctx->orientation);
+
 	return 1;
 }
 
@@ -887,6 +891,13 @@ static int ili9881c_dsi_probe(struct mipi_dsi_device *dsi)
 		return dev_err_probe(&dsi->dev, PTR_ERR(ctx->reset),
 				     "Couldn't get our reset GPIO\n");
 
+	ret = of_drm_get_panel_orientation(dsi->dev.of_node, &ctx->orientation);
+	if (ret) {
+		dev_err(&dsi->dev, "%pOF: failed to get orientation: %d\n",
+			dsi->dev.of_node, ret);
+		return ret;
+	}
+
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)
 		return ret;
-- 
2.33.1

