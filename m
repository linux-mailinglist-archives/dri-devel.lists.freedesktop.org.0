Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 077AF4C77E1
	for <lists+dri-devel@lfdr.de>; Mon, 28 Feb 2022 19:33:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C959810E543;
	Mon, 28 Feb 2022 18:33:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 706DC10E543
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 18:33:53 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id n14so16845973wrq.7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Feb 2022 10:33:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bFFWProEoKuAUh9xM72AMLCdQM4KQgmwuniqkq2ipKk=;
 b=XBmbnAm+4+oTMlp6pyVgvt3b285D3eIMtWAG56zgUuVI1MzBh7UwKifz00Z7VcE9DH
 w1tqrlIpUCps+K1nbi1teymUOwr58lKs4skxRtBsI06tHbqUpe9ibzkTOGDzPL/B3YMl
 PajaGab3HWKD+sXTID1IRfPNP/mUHgtKcuicv3VdjpDSJ60VstKD24LRtQFNJo4jDwm5
 XUjd/zTsS3BqUhkbvcVQaw4jDG9q8+1mtSFb+Lkw6VCLZ703YHl5qNuF5VEvkHC2tmuz
 nLU3cP57Cf+jH06iyFt+FdV+xFN1ZLDLwxL0BMvImyPKgIwgENyf7uFRcKNicwz8LgJa
 rhIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bFFWProEoKuAUh9xM72AMLCdQM4KQgmwuniqkq2ipKk=;
 b=u4JJBNqXGzEmVR8WJNhQCgTNEeuSK4mvTfprMrTzlOWJk4UY7Z28vDD+uifLUNlHqn
 Cc+H2sUcgclTWNGE1pd8a/e4G4ZTAPzNg+KQFdp8LfcsnU6fb3vD9D5V57OGNm4ir6QP
 dXoDcEGVBG9/llCNTtfV94loAn3pJg121KSkRx14e2FD4d81j7z6NSr3KSYvyhArM57T
 JtZDauXbfeIiuptv+WPWCsTiyQ7zfbnpv2w7d34mwQQJJgpD5Qq8h4omZtiv/jud8/Za
 YgcV9pqaJUAptCxB06iAjYhfakZTecheyWfabBU6U/7GiBGd6W5ktv4aOvbeiM+NjFJX
 OQzw==
X-Gm-Message-State: AOAM530UlSJ3HlTkd4i3efiv3PLiMGmxtriFFfypnBw4NZGshUEe0egE
 QaRYPJz6KFu/axO9iIvoDYE=
X-Google-Smtp-Source: ABdhPJzykc+prbJ3d8r+oyf5greaX8g2ucPnBZ4/DeX7WDXCoe+sNytkG9GOt/k1yAqmFQxkDn4/cg==
X-Received: by 2002:adf:eac4:0:b0:1ef:87cb:3c7 with SMTP id
 o4-20020adfeac4000000b001ef87cb03c7mr8833096wrn.445.1646073232004; 
 Mon, 28 Feb 2022 10:33:52 -0800 (PST)
Received: from localhost.localdomain ([94.73.33.246])
 by smtp.gmail.com with ESMTPSA id
 x3-20020adfdd83000000b001e58c8de11bsm11412995wrl.39.2022.02.28.10.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 10:33:51 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: andrzej.hajda@intel.com
Subject: [PATCH] drm/bridge: tc358762: switch to devm_drm_of_get_bridge
Date: Mon, 28 Feb 2022 19:33:42 +0100
Message-Id: <20220228183342.24129-1-jose.exposito89@gmail.com>
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
 drivers/gpu/drm/bridge/tc358762.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358762.c b/drivers/gpu/drm/bridge/tc358762.c
index 1bfdfc6affaf..7870aceb0a6d 100644
--- a/drivers/gpu/drm/bridge/tc358762.c
+++ b/drivers/gpu/drm/bridge/tc358762.c
@@ -179,15 +179,8 @@ static int tc358762_parse_dt(struct tc358762 *ctx)
 {
 	struct drm_bridge *panel_bridge;
 	struct device *dev = ctx->dev;
-	struct drm_panel *panel;
-	int ret;
-
-	ret = drm_of_find_panel_or_bridge(dev->of_node, 1, 0, &panel, NULL);
-	if (ret)
-		return ret;
-
-	panel_bridge = devm_drm_panel_bridge_add(dev, panel);
 
+	panel_bridge = devm_drm_of_get_bridge(dev, dev->of_node, 1, 0);
 	if (IS_ERR(panel_bridge))
 		return PTR_ERR(panel_bridge);
 
-- 
2.25.1

