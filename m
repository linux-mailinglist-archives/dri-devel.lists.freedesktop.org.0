Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58A394BD6D5
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 08:38:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C526610F9E8;
	Mon, 21 Feb 2022 07:38:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D54F10F9E8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 07:38:02 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id p9so25393071wra.12
 for <dri-devel@lists.freedesktop.org>; Sun, 20 Feb 2022 23:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j8kD/ok13BJf5Nrp4mRjz+VFnutGthXKYvZnWK9jovI=;
 b=XWaLHpOFQ0cjx8OYjCzDNiywKezMjHZqpCgeBj1HdMPi+5CrCtpovP6dIuGMJ1GYg9
 +VoM/lz9G0BsPOfIStaKmk2clsPJLuJn/UWBRAyXRdD0uQvlvyHc10RQltqVoItgKZWd
 c+swsX0zNTgCRqHoGNT+eWvsP/zqf6D74HmqdN+Mmm9MYSNQKadKK2TA+/z96nfS8HML
 3DlIvDV5raw/wfnAn01twAw5hf+g20oL6a+sLlmlT3Z7CXVxXlmQwg2MX4om8JPpJBeV
 QGqVZvnrNZ12h4wuRJUP/tPTw6N3N8tjRFemCXSfx6GxjQOpK2FxoyMlbRCIWVd6OWON
 dyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j8kD/ok13BJf5Nrp4mRjz+VFnutGthXKYvZnWK9jovI=;
 b=7cIF6fBODeaLURPNz/drQ58AX1QxYDxjPIeoNMYkyB5R/mncUz5OsMTBjs9jX3qRJ5
 Pf0WugmGsSfJLmLms/IfT/hKu6yhuQiYEALKonsvp2Rebxjb248R0FPsvvk3O2kxNn08
 P80YBIF1X4GAWFM71lXr/I0whECX17PR2qpXZ681BS23Q9zN6pPLX+eootwF8whzVBEj
 Vnw7UHqJLfFuYLObL0+7vT9u90ij9eFrkDUih6C2zrnYvahUqkamaKbICeIMn6p/PsS/
 0zAX3YV1abfzh7TaMzZ69Ghpzvn5gEv+IWRmUQkJefDn5wUtymQoP+0Ks07WosMJPcUj
 XNQg==
X-Gm-Message-State: AOAM530/iwPswkhfZZ5Xe4bYXUOsoHZABH92WoVi1v/G/S4edjMdsMCk
 JJpG1tfXahTGkVaj+DD0xAQ=
X-Google-Smtp-Source: ABdhPJztU7DEG+kmcDH4HyMhAm2Pw6SdZLYZEm0x5h8LxHpPMQ7O8DgaFzs3pcMFf+YNid1/M0K+9w==
X-Received: by 2002:a05:6000:1a89:b0:1e8:db90:54cd with SMTP id
 f9-20020a0560001a8900b001e8db9054cdmr14553344wry.303.1645429081157; 
 Sun, 20 Feb 2022 23:38:01 -0800 (PST)
Received: from localhost.localdomain ([94.73.33.246])
 by smtp.gmail.com with ESMTPSA id z7sm6598773wml.40.2022.02.20.23.37.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Feb 2022 23:38:00 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
To: laurent.pinchart@ideasonboard.com
Subject: [PATCH] drm: rcar-du: switch to devm_drm_of_get_bridge
Date: Mon, 21 Feb 2022 08:37:57 +0100
Message-Id: <20220221073757.12181-1-jose.exposito89@gmail.com>
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
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, maxime@cerno.tech,
 =?UTF-8?q?Jos=C3=A9=20Exp=C3=B3sito?= <jose.exposito89@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function "drm_of_find_panel_or_bridge" has been deprecated in
favor of "devm_drm_of_get_bridge".

Switch to the new function and reduce boilerplate.

Signed-off-by: José Expósito <jose.exposito89@gmail.com>
---
 drivers/gpu/drm/rcar-du/rcar_lvds.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_lvds.c b/drivers/gpu/drm/rcar-du/rcar_lvds.c
index 72a272cfc11e..99b0febc56d1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_lvds.c
+++ b/drivers/gpu/drm/rcar-du/rcar_lvds.c
@@ -712,18 +712,12 @@ static int rcar_lvds_parse_dt(struct rcar_lvds *lvds)
 {
 	int ret;
 
-	ret = drm_of_find_panel_or_bridge(lvds->dev->of_node, 1, 0,
-					  &lvds->panel, &lvds->next_bridge);
-	if (ret)
+	lvds->next_bridge = devm_drm_of_get_bridge(lvds->dev,
+						   lvds->dev->of_node,
+						   1, 0);
+	if (IS_ERR(lvds->next_bridge)) {
+		ret = -EINVAL;
 		goto done;
-
-	if (lvds->panel) {
-		lvds->next_bridge = devm_drm_panel_bridge_add(lvds->dev,
-							      lvds->panel);
-		if (IS_ERR_OR_NULL(lvds->next_bridge)) {
-			ret = -EINVAL;
-			goto done;
-		}
 	}
 
 	if (lvds->info->quirks & RCAR_LVDS_QUIRK_DUAL_LINK)
-- 
2.25.1

