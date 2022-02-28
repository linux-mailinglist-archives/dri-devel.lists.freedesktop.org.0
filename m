Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3EB4C778A
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 19:22:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD01210E274;
	Mon, 28 Feb 2022 18:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA3EB10E274
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 18:22:44 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id r10so6202694wma.2
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 10:22:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cs4oiNLGrG4rkfQh2GpvzYgFuRxicCeUCStQpjor4rs=;
 b=lGdS45PKQZbJe4/0iQ/CgeECjEa+Rees/Fgu//qqVMmZ9UlBUANNOv4rroTC/YKdDO
 O7+SDuokIis9xQEoxZao9e0nuFtEhyNqpeUDaSqnbXPndFS3l8rYe2h3F1pu17+gYk13
 +LivbegQAAqRZNU99ZbQULZU2Zyh0Hk2pt9ZWF9Jq5g3ku1h9I7rpKCfrzBpYpV7Xi/d
 1VNJzDQN9n8O6POIAA8I8oPL5KX3Lecl2iNfqqf6jCjToSkBwDFUqxSQldEJLZBCUu/k
 KG/QuBg7TuiW10aM/rgorVPrwX55PoFfWpM3mnEwtSHHMO9aLE9PKKbqa1ERM73JEtwr
 wlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cs4oiNLGrG4rkfQh2GpvzYgFuRxicCeUCStQpjor4rs=;
 b=qKAkCmhFzaX23akcej7cK2Gr0DdpOPCqwE6FE07Et0mbOMB7xFr+OhaN4Q7qgJrNg/
 nqPVu+wAIAxNhmBoUjTIJ6LiEazxtZeS68jf2La49uyoCHgji5GkfqvzvOMIACfhixcv
 qNg1Ey693sy1xya64DBBD+kzwywDUTYAi9DNjv5DwHSJAnaNkwPlqHJQ27udlDUqPd5r
 l6wWTA40xmR4WKIv+otMjHp12/yTnjbsO8hzsJCJXwEYxx2IeWzDLeD/M8KJ6RcZo0kO
 FheLfgBTlrCqfVeQ4OYmkyS1l6ZxGtj1sqHKrXBGhxLIXKWv/XnbY0IgVNkf5HrAz0sO
 e+iw==
X-Gm-Message-State: AOAM533LBiKJg4cubDjnbrA7s9r6Qw+sboFfB62HxmdNeojmDAJSx2kx
 VN27IE5SLCoYyyJMyyDMLDl7T6G4cSGsTg==
X-Google-Smtp-Source: ABdhPJxKLUxQmWwGxkQvXxCXzjNKHTeoMCKmG+aNO7A5ky9iq2fX9OSCC1SCxPOgCtYF1yvE9OhT9Q==
X-Received: by 2002:a7b:c30d:0:b0:381:4bb9:eede with SMTP id
 k13-20020a7bc30d000000b003814bb9eedemr9277539wmj.74.1646072563266; 
 Mon, 28 Feb 2022 10:22:43 -0800 (PST)
Received: from localhost.localdomain ([94.73.33.246])
 by smtp.gmail.com with ESMTPSA id
 i12-20020adfe48c000000b001ef6eab4c81sm10654057wrm.96.2022.02.28.10.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:22:42 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: andrzej.hajda@intel.com
Subject: [PATCH] drm/bridge: nwl-dsi: switch to devm_drm_of_get_bridge
Date: Mon, 28 Feb 2022 19:22:26 +0100
Message-Id: <20220228182226.21888-1-jose.exposito89@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: jonas@kwiboo.se, airlied@linux.ie, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, jernej.skrabec@gmail.com,
 Laurent.pinchart@ideasonboard.com,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function "drm_of_find_panel_or_bridge" has been deprecated in
favor of "devm_drm_of_get_bridge".

Switch to the new function and reduce boilerplate.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/bridge/nwl-dsi.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nwl-dsi.c
index af07eeb47ca0..df3be9dd24fb 100644
--- a/drivers/gpu/drm/bridge/nwl-dsi.c
+++ b/drivers/gpu/drm/bridge/nwl-dsi.c
@@ -909,19 +909,12 @@ static int nwl_dsi_bridge_attach(struct drm_bridge *bridge,
 {
 	struct nwl_dsi *dsi = bridge_to_dsi(bridge);
 	struct drm_bridge *panel_bridge;
-	struct drm_panel *panel;
-	int ret;
 
-	ret = drm_of_find_panel_or_bridge(dsi->dev->of_node, 1, 0, &panel,
-					  &panel_bridge);
-	if (ret)
-		return ret;
+	panel_bridge = devm_drm_of_get_bridge(dsi->dev, dsi->dev->of_node,
+					      1, 0);
+	if (IS_ERR(panel_bridge))
+		return PTR_ERR(panel_bridge);
 
-	if (panel) {
-		panel_bridge = drm_panel_bridge_add(panel);
-		if (IS_ERR(panel_bridge))
-			return PTR_ERR(panel_bridge);
-	}
 	dsi->panel_bridge = panel_bridge;
 
 	if (!dsi->panel_bridge)
-- 
2.25.1

