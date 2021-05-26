Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BF53915C5
	for <lists+dri-devel@lfdr.de>; Wed, 26 May 2021 13:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 295E46E063;
	Wed, 26 May 2021 11:15:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0616E063
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 11:15:30 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id b7so459961plg.0
 for <dri-devel@lists.freedesktop.org>; Wed, 26 May 2021 04:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=aiFd6GERxPKvBU+oMxghCoPa2n1wDRulJb/L0ZGwd0Y=;
 b=OaN2wpOgOJK1ZyyiokizNElJY9x+OIIAyM4iZOUdXAkXDcwwvAZSOZVoAR1Pfs/i1g
 X3P/fV9y/P6g+a+XI13SLoEzBt9mlsettGZBROBPr7RsUowDHEhdSQqTuGLO+0jDGEi/
 SzMWv6XUATrS0a8o/iUlwjozavJpSEsYn9OU21Rn6ay+QvetpTGB8YOilQi525lvH+Uw
 1xqOf3pqWm70PKqbzFb2v0tD7AmJMqzdTBs5iZTrO6U9nMsCMdA+bTiEbjzt2z4oqwYQ
 ceRF+A20E9s+zy2sbTD/GkQt3p+vvQuDxaf+aaRvHCVD1nq7vjyp34ccOUNRSvccwPi0
 ESzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=aiFd6GERxPKvBU+oMxghCoPa2n1wDRulJb/L0ZGwd0Y=;
 b=tx82+suJGHUzNDINdy7gGkdXpLp7Sat5r5TL5Up8Li+ALMhlHzuaAaZEfyEMQ4jahR
 UUsoa53gWLLma9YREGXKLrBaaFhhMUPXPNH6YSHO2AWLw+VajCQBo+4kaFspqCZfy6Qy
 VYzvxzdDJOHO3s/KO8HC3h/U2rdwP2iDXjWmZIVCKWFjaiI4+Fe/RkyyxmQARuWO9C/c
 IDxvXW/AyGkkHT5SKQ3R+XQ0MEI4Zc5qDRO0M6Y/l76qxRI+sZi/fN2v62pneeA62SZ/
 wk114ncgDKNVcrnk5Rf8pKtiRFqodHtRCKI1VKf22iu/5B457pAs3BZOVOhZRyxBN71D
 lNXA==
X-Gm-Message-State: AOAM531d1/7gROxG6J1B2j+UzAGQDfjYzlh8PQ6E9VmXYpAMBzBpDktT
 dEumdJHlMgTLF4Wb1Wi89pQ=
X-Google-Smtp-Source: ABdhPJzuxU0THPKqE9K4QCCe9sfBkRmG66p5Jd5/mlqSjuZ1NNLVnSrm4UhKaxUPg5pBA9qKgiCmBg==
X-Received: by 2002:a17:902:7407:b029:ef:a78c:a385 with SMTP id
 g7-20020a1709027407b02900efa78ca385mr35148012pll.16.1622027729832; 
 Wed, 26 May 2021 04:15:29 -0700 (PDT)
Received: from localhost.localdomain ([23.99.96.33])
 by smtp.gmail.com with ESMTPSA id 5sm15188935pfe.32.2021.05.26.04.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 04:15:29 -0700 (PDT)
From: ainux.wang@gmail.com
To: airlied@redhat.com, tzimmermann@suse.de, airlied@linux.ie, daniel@ffwll.ch,
 ainux.wang@gmail.com
Subject: [PATCH v2] drm/ast: Add detect function support
Date: Wed, 26 May 2021 19:15:15 +0800
Message-Id: <20210526111515.40015-1-ainux.wang@gmail.com>
X-Mailer: git-send-email 2.18.1
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
Cc: sterlingteng@gmail.com, chenhuacai@kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ainux <ainux.wang@gmail.com>

The existence of the connector cannot be detected,
so add the detect function to support.

Signed-off-by: Ainux <ainux.wang@gmail.com>
---
 drivers/gpu/drm/ast/ast_mode.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 36d9575aa27b..e5996ae03c49 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1293,6 +1293,18 @@ static enum drm_mode_status ast_mode_valid(struct drm_connector *connector,
 	return flags;
 }
 
+static enum drm_connector_status ast_connector_detect(struct drm_connector
+						   *connector, bool force)
+{
+	int r;
+
+	r = ast_get_modes(connector);
+	if (r < 0)
+		return connector_status_disconnected;
+
+	return connector_status_connected;
+}
+
 static void ast_connector_destroy(struct drm_connector *connector)
 {
 	struct ast_connector *ast_connector = to_ast_connector(connector);
@@ -1307,6 +1319,7 @@ static const struct drm_connector_helper_funcs ast_connector_helper_funcs = {
 
 static const struct drm_connector_funcs ast_connector_funcs = {
 	.reset = drm_atomic_helper_connector_reset,
+	.detect = ast_connector_detect,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.destroy = ast_connector_destroy,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
@@ -1334,7 +1347,8 @@ static int ast_connector_init(struct drm_device *dev)
 	connector->interlace_allowed = 0;
 	connector->doublescan_allowed = 0;
 
-	connector->polled = DRM_CONNECTOR_POLL_CONNECT;
+	connector->polled = DRM_CONNECTOR_POLL_CONNECT |
+						DRM_CONNECTOR_POLL_DISCONNECT;
 
 	drm_connector_attach_encoder(connector, encoder);
 
@@ -1403,6 +1417,8 @@ int ast_mode_config_init(struct ast_private *ast)
 
 	drm_mode_config_reset(dev);
 
+	drm_kms_helper_poll_init(dev);
+
 	return 0;
 }
 
-- 
2.18.1

