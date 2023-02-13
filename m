Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F95694B60
	for <lists+dri-devel@lfdr.de>; Mon, 13 Feb 2023 16:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1A4E10E57F;
	Mon, 13 Feb 2023 15:38:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 416AB10E061
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 15:38:31 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id lf10so1015345ejc.5
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Feb 2023 07:38:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aD93lPaEpLbO12AG6KFXUrKcEBNMZrAt4589lIUtesY=;
 b=IRZIXuNAUAG+0zE/5LfJMJKmXT1wn/RbaM9uAG50k32gEjAAEhoazoB2Opl2+fnT57
 M+aRXPU6ZW6qfiik9IlFHU27iWoRN4dPCmJVr6pN5IOxUW9XPKFj8Dp3tOWpDd2gILqN
 D9APtDR1f6TvcEgbrU0Q39wfiKvclIf8z2BSG8XF1BAF5yFGavdq5ZLeJNYufchdrcey
 4I60aGAW5wJ4N6/ntyCFSRkLnkpWG2z59lmkAtuYeOf2D2kUBCqPY62lDjmwtL72UU66
 /lyFAoOj8EZ0KKz2d7P3VbcZsIBAsMADZwu72gqC80NE0VsRhCW+kS8fSZFr6dRzk09c
 ochA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aD93lPaEpLbO12AG6KFXUrKcEBNMZrAt4589lIUtesY=;
 b=yTJGTmnWp/ZxlG6saH8ZPmrMiVYch2hCruuiSRdJhxVg98kPZ1Ko2qf6FfLzKKg2ee
 qg5s8t/bxrGBT0uyBXRM1QwuStAz4MXuOXxDPc5GXK5qWVwcWn9q5jwjqGHH+LbF8uD9
 8ZBXz4xImfJJfksT+brTIvRCe8IEhMk29JgX9G3M3igu97ynQHIe+M4KtxMxRUTstO9T
 yyj47XVZUN3R+vM04XbHbM1XpNL9U2XbFkNNmwGuAK0H5LZxLpXRRDEjd7Mlmi3e7HA9
 iCcx+wr6HyfE85qzZ1d/JvmcEamaVjuY7oQvBN4kT58Sf29NJNOX60rYQZTTfV6WXcTg
 42Sg==
X-Gm-Message-State: AO0yUKW9frw0TvqSUKwgiA94zbQwFMsHJxuAB/cPvPE9rVSWTc4cuNVh
 sy3MybDwHafdj9XeuVbFnFQ=
X-Google-Smtp-Source: AK7set8SN3JGKNPB4GtbNHjJ+rOSGFuY4qfwA63W6uys5Z0Dn0pmZkVfBbgeX3yFzqPHGZZrzaMKTA==
X-Received: by 2002:a17:906:7704:b0:872:27cb:9436 with SMTP id
 q4-20020a170906770400b0087227cb9436mr25379952ejm.43.1676302709837; 
 Mon, 13 Feb 2023 07:38:29 -0800 (PST)
Received: from localhost.localdomain (83.24.145.108.ipv4.supernova.orange.pl.
 [83.24.145.108]) by smtp.gmail.com with ESMTPSA id
 gf17-20020a170906e21100b008b12614ee06sm115901ejb.161.2023.02.13.07.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 07:38:29 -0800 (PST)
From: Maya Matuszczyk <maccraft123mc@gmail.com>
To: heiko@sntech.de, Jagan Teki <jagan@amarulasolutions.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 3/4] drm: panel: Add orientation support for st7701
Date: Mon, 13 Feb 2023 16:38:15 +0100
Message-Id: <20230213153816.213526-4-maccraft123mc@gmail.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213153816.213526-1-maccraft123mc@gmail.com>
References: <20230213153816.213526-1-maccraft123mc@gmail.com>
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
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Maya Matuszczyk <maccraft123mc@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Note that this patch is 'heavily inspired' by orientation support in driver
for Elida KD35T133 panel

Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
---
 drivers/gpu/drm/panel/panel-sitronix-st7701.c | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7701.c b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
index 660c3f435008..c9ae5c456f41 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7701.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7701.c
@@ -135,6 +135,7 @@ struct st7701 {
 	struct regulator_bulk_data supplies[2];
 	struct gpio_desc *reset;
 	unsigned int sleep_delay;
+	enum drm_panel_orientation orientation;
 };
 
 static inline struct st7701 *panel_to_st7701(struct drm_panel *panel)
@@ -514,15 +515,29 @@ static int st7701_get_modes(struct drm_panel *panel,
 	connector->display_info.width_mm = desc_mode->width_mm;
 	connector->display_info.height_mm = desc_mode->height_mm;
 
+	/*
+	 * TODO: Remove once all drm drivers call
+	 * drm_connector_set_orientation_from_panel()
+	 */
+	drm_connector_set_panel_orientation(connector, st7701->orientation);
+
 	return 1;
 }
 
+static enum drm_panel_orientation st7701_get_orientation(struct drm_panel *panel)
+{
+	struct st7701 *st7701 = panel_to_st7701(panel);
+
+	return st7701->orientation;
+}
+
 static const struct drm_panel_funcs st7701_funcs = {
 	.disable	= st7701_disable,
 	.unprepare	= st7701_unprepare,
 	.prepare	= st7701_prepare,
 	.enable		= st7701_enable,
 	.get_modes	= st7701_get_modes,
+	.get_orientation = st7701_get_orientation,
 };
 
 static const struct drm_display_mode ts8550b_mode = {
@@ -733,7 +748,7 @@ static const struct drm_display_mode kd50t048a_mode = {
 	.hsync_end      = 480 + 2 + 10,
 	.htotal         = 480 + 2 + 10 + 2,
 
-	.vdisplay       = 854, // was: 854 12 2 60
+	.vdisplay       = 854,
 	.vsync_start    = 854 + 2,
 	.vsync_end      = 854 + 2 + 2,
 	.vtotal         = 854 + 2 + 2 + 17,
@@ -854,6 +869,10 @@ static int st7701_dsi_probe(struct mipi_dsi_device *dsi)
 		return PTR_ERR(st7701->reset);
 	}
 
+	ret = of_drm_get_panel_orientation(dsi->dev.of_node, &st7701->orientation);
+	if (ret < 0)
+		return dev_err_probe(&dsi->dev, ret, "Failed to get orientation\n");
+
 	drm_panel_init(&st7701->panel, &dsi->dev, &st7701_funcs,
 		       DRM_MODE_CONNECTOR_DSI);
 
-- 
2.39.1

