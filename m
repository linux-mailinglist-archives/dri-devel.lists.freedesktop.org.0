Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9344BD120
	for <lists+dri-devel@lfdr.de>; Sun, 20 Feb 2022 20:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5590D10E210;
	Sun, 20 Feb 2022 19:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8441410E210
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 19:52:37 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id m27so11782461wrb.4
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 11:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DuiKu9KkdMHJUZCAtqApuGiim+1oc7sc+xPUF6dp40w=;
 b=nwEhZFXE8PZzZaJs2++Ab/aQRMewiG6Q4pO3SHrMnxEtt216bWVJuFnHYnaD/67awY
 Zj6TZAU9zO8jic/r4TooeVejeWAEX2V6XE3O2HyFigcyCfxbQIHc2fS6t51brtW0PnBH
 yHKi9sNEQZpyd835wrPYy1uS6RS5ltJHgyFjwalqd4F3IUx9kav5Kj5B/pGNx67SLnjZ
 DnVnrtVEAryIDdOG/qt96MqOxVZVVjieGcZa83s9fnt3pDewKGZ/KtAM8xj8XyB2pDOi
 5No4CMn2wfjgcOBKHVkItI6IHwtZ+XryDkajS2LcCrNlsz08fVUw+10vf09GXNiK14Z5
 ZNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DuiKu9KkdMHJUZCAtqApuGiim+1oc7sc+xPUF6dp40w=;
 b=JhsgIbZFXrUmkjUkRhPFsZnb0WMuZgATwycaf4aH0kLx6nJtXYOFirK+4b08Sb5Czw
 QIwR3PJU0s3xO4mTkj5JrSUHp9ut9YmH4in/ZacCtP7TbRBhwaf5omylr6bW4eD0UKSQ
 reCNobuJo5F7jycAr87gmnqiDt9KpxkG0YncqxVI55Xm2wMxrokt0SMKTWNKl/kN3buA
 85Yq0rFzTLMh5oqWu0SE9ERW1C08efLX6Ikm1PIo9LFs8TieV9VjZTc3PnPqV2PTGEap
 66v0UhnHgk4c3T0W5w+C9A4XnDvVdW2N1JDex95PLL3gvam/Mmbzr2wSFXk9nsCmqnA0
 M/yw==
X-Gm-Message-State: AOAM532hY3KGFl+6YpMfPqAvlcjAe8Y5D699Q7Ah7AJ7OUHdk7sYYf/Y
 mxSHWjksy8cBqCOSHB/NblX0xIIA7jbfBw==
X-Google-Smtp-Source: ABdhPJwvOSqFh2WzEAHlvgpwocAilkbuH1U5HKEDxlr/CeIdwFUhgmsUtYhA4rMQ9Qeonkth+aGZ+A==
X-Received: by 2002:adf:cf0c:0:b0:1e6:22fe:4580 with SMTP id
 o12-20020adfcf0c000000b001e622fe4580mr13172397wrj.12.1645386755924; 
 Sun, 20 Feb 2022 11:52:35 -0800 (PST)
Received: from localhost.localdomain ([94.73.33.246])
 by smtp.gmail.com with ESMTPSA id e10sm13978772wra.103.2022.02.20.11.52.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 11:52:35 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: tomba@kernel.org
Subject: [PATCH] drm/omap: switch to drm_of_find_panel_or_bridge
Date: Sun, 20 Feb 2022 20:52:12 +0100
Message-Id: <20220220195212.1129437-1-jose.exposito89@gmail.com>
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
Cc: airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, maxime@cerno.tech,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the "drm_of_find_panel_or_bridge" function instead of a custom
version of it to reduce the boilerplate.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/omapdrm/dss/output.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
index 7378e855c278..00af27589296 100644
--- a/drivers/gpu/drm/omapdrm/dss/output.c
+++ b/drivers/gpu/drm/omapdrm/dss/output.c
@@ -20,23 +20,18 @@
 int omapdss_device_init_output(struct omap_dss_device *out,
 			       struct drm_bridge *local_bridge)
 {
-	struct device_node *remote_node;
 	int ret;
 
-	remote_node = of_graph_get_remote_node(out->dev->of_node,
-					       out->of_port, 0);
-	if (!remote_node) {
-		dev_dbg(out->dev, "failed to find video sink\n");
-		return 0;
+	ret = drm_of_find_panel_or_bridge(out->dev->of_node, out->of_port, 0,
+					  &out->panel, &out->bridge);
+	if (ret) {
+		if (ret == -ENODEV) {
+			dev_dbg(out->dev, "failed to find video sink\n");
+			return 0;
+		}
+		goto error;
 	}
 
-	out->bridge = of_drm_find_bridge(remote_node);
-	out->panel = of_drm_find_panel(remote_node);
-	if (IS_ERR(out->panel))
-		out->panel = NULL;
-
-	of_node_put(remote_node);
-
 	if (out->panel) {
 		struct drm_bridge *bridge;
 
-- 
2.25.1

